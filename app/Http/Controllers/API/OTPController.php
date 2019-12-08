<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Mail\OTPEmail;
use Illuminate\Support\Facades\Mail;

class OTPController extends Controller
{
    public function index() {
        Mail::to('ach.faiz.k@gmail.com')->send(new OTPEmail());
    }
}
