<?php

namespace App\Http\Controllers;

use App\Article;
use App\Job;
use App\Question;
use App\User;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home', [
            'user' => User::all()->count(),
            'job' => Job::all()->count(),
            'article' => Article::all()->count(),
            'test' => Question::all()->count(),
        ]);
    }
}
