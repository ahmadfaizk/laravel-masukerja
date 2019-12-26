<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\User;
use App\OTP;
use App\Mail\OTPEmail;
use Illuminate\Support\Facades\Mail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function login(Request $request) {
        $credentials = $request->only('email', 'password');
        try {
            if (!$token = JWTAuth::attempt($credentials)) {
                return response()->json([
                    'message' => 'Invalid Credentials',
                    'code' => 400
                ]);
            }
        } catch (JWTException $e) {
            return response()->json([
                'message' => 'Could Not Create Token',
                'code' => 500
            ]);
        }
        return response()->json([
            'message' => 'Login Succesfull',
            'code' => 200,
            'token' => $token
        ]);
    }

    public function register(Request $request) {
        $this->validate($request, [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
        ]);

        $user = User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => Hash::make($request->get('password')),
        ]);

        $token = JWTAuth::fromUser($user);

        return response()->json(compact('user', 'token'));
    }

    public function getAuthenticatedUser() {
        try {
            if (!$user = JWTAuth::parseToken()->authenticate()) {
                return response()->json([
                    'message' => 'User Not Found',
                    'code' => 404,
                ]);
            }
        } catch (TokenExpiredException $e) {
            return response()->json([
                'message' => 'Token Expired',
                'code' => $e->getStatusCode()
            ]);
        } catch (TokenInvalidException $e) {
            return response()->json([
                'message' => 'Token Invalid',
                'code' => $e->getStatusCode()
            ]);
        } catch (JWTException $e) {
            return response()->json([
                'message' => 'Token Absent',
                'code' => $e->getStatusCode()
            ]);
        }

        return response()->json(compact('user'));
    }

    public function forgotPassword(Request $request) {
        $this->validate($request, [
            'email' => 'required|string|email',
        ]);

        $email = $request->get('email');
        $user = User::where('email', $email)->first();

        if ($user) {
            $otp = rand(1000, 9999);
            OTP::updateOrCreate(
                ['user_id' => $user->id],
                ['code' => $otp],
            );
            Mail::to($user->email)->send(new OTPEmail($user, $otp));
            $message = "OTP Code Has Been Sent to Your Email : ";
            $code = 200;
        } else {
            $message = "Email Not Found";
            $code = 404;
        }

        return response()->json([
            'message' => $message,
            'code' => $code
        ]);
    }

    public function verifyOtp(Request $request) {
        $this->validate($request, [
            'email' => 'required|string|email',
            'otp' => 'required|int'
        ]);

        $email = $request->get('email');
        $otp = (int)$request->get('otp');

        $user = User::where('email', $email)->first();

        if($user->otp->code == $otp) {
            $message = 'OTP is True';
            $code = 200;
        } else {
            $message = 'OTP is False';
            $code = 400;
        }

        return response()->json([
            'message' => $message,
            'code' => $code,
        ]);
    }

    public function changePassword(Request $request) {
        $this->validate($request, [
            'email' => 'required|string|email',
            'password' => 'required|string|min:6',
            'otp' => 'required|int'
        ]);

        $email = $request->get('email');
        $password = $request->get('password');
        $otp = (int)$request->get('otp');

        $user = User::where('email', $email)->first();

        if ($user->otp->code == $otp) {
            $user->password = Hash::make($password);
            $user->save();
            $message = "Password Has Been Changed";
            $code = 200;
        } else {
            $message = "OTP Code Invalid";
            $code = 400;
        }

        return response()->json([
            'message' => $message,
            'code' => $code
        ]);
    }
}
