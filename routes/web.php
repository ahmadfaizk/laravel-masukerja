<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/job-field/json', 'JobFieldController@json')->name('job-field.json');
Route::get('/job-source/json', 'JobSourceController@json')->name('job-source.json');
Route::get('/job-location/json', 'JobLocationController@json')->name('job-location.json');
Route::get('/question-code', 'TestController@codeQuestion');
Route::get('/answer-code', 'TestController@codeAnswer');
Route::delete('/job-delete', 'JobController@deleteExpired');
Route::get('/send-otp', 'API\OTPController@index');
Route::resources([
    'user' => 'UserController',
    'article' => 'ArticleController',
    'article-category' => 'ArticleCategoryController',
    'job' => 'JobController',
    'job-field' => 'JobFieldController',
    'job-source' => 'JobSourceController',
    'job-location' => 'JobLocationController',
    'personality' => 'PersonalityController',
    'test' => 'TestController'
]);
