<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Job;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class JobController extends Controller
{
    public function __construct()
    {
        $this->middleware('jwt.verify');
    }

    public function index() {
        $data = Job::all();
        return response()->json($data);
    }
}
