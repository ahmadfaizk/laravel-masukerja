<?php

use App\Job;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('register', 'API\AuthController@register');
Route::post('login', 'API\AuthController@login');
Route::get('job', 'API\JobController@index');
Route::get('user', 'API\AuthController@getAuthenticatedUser')->middleware('jwt.verify');

Route::post('crawl', 'API\CrawlController@job');
