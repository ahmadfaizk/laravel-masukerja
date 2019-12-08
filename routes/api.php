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

Route::group(['prefix' => 'v1'], function () {
    Route::group(['prefix' => 'auth'], function () {
        Route::post('login', 'API\AuthController@login');
        Route::post('register', 'API\AuthController@register');
        Route::get('user', 'API\AuthController@getAuthenticatedUser')->middleware('jwt.verify');
        Route::post('forgot-password', 'API\AuthController@forgotPassword');
        Route::post('verify-otp', 'API\AuthController@verifyOtp');
        Route::post('change-password', 'API\AuthController@changePassword');
    });
    Route::get('job', 'API\JobController@index');
    Route::post('crawl', 'API\CrawlController@job');
});
