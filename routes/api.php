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
    Route::group(['prefix' => 'job'], function () {
        Route::get('/', 'API\JobController@index');
        Route::post('search', 'API\JobController@search');
        ROute::get('data', 'API\JobController@searchData');
        Route::post('favorite', 'API\JobController@setFavorite');
        Route::get('favorite', 'API\JobController@getFavorite');
        Route::get('{id}', 'API\JobController@show');
        Route::group(['prefix' => 'statistic'], function () {
            Route::get('field', 'API\JobController@fieldCount');
            Route::get('location', 'API\JobController@locationCount');
            Route::get('source', 'API\JobController@sourceCount');
        });
    });
    Route::group(['prefix' => 'test'], function () {
        Route::get('/', 'API\TestController@index');
        Route::post('store', 'API\TestController@store');
        Route::get('show', 'API\TestController@show');
    });
    Route::get('article', 'API\ArticleController@index');
    Route::post('crawl', 'API\CrawlController@job');
});
