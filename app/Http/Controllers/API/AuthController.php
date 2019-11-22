<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\User;
use JWTAuth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;

class AuthController extends Controller
{
    public function login(Request $request) {
        $credentials = $request->only('email', 'password');
        try {
            if (!$token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid credentials'], 400);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'could not create token'], 500);
        }
        return response()->json(compact('token'));
    }

    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);

        if($validator->fails()) {
            return response()->json($validator->errors()->toJson());
        }

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
                return response()->json(['user not found'], 404);
            }
        } catch (TokenExpiredException $e) {
            return response()->json(['token expired'], $e->getStatusCode());
        } catch (TokenInvalidException $e) {
            return response()->json(['token invalid'], $e->getStatusCode());
        } catch (JWTException $e) {
            return response()->json(['token absent'], $e->getStatusCode());
        }

        return response()->json(compact('user'));
    }
}
