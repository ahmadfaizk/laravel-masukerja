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
Route::resource('/user', 'UserController');
Route::resource('/article', 'ArticleController');
Route::resource('/article-category', 'ArticleCategoryController');
Route::resource('/job', 'JobController');
Route::get('/job-field/json', 'JobFieldController@json')->name('job-field.json');
Route::resource('/job-field', 'JobFieldController');
Route::get('/job-source/json', 'JobSourceController@json')->name('job-source.json');
Route::resource('/job-source', 'JobSourceController');
Route::get('/job-location/json', 'JobLocationController@json')->name('job-location.json');
Route::resource('/job-location', 'JobLocationController');
Route::resource('/personality', 'MBTIPersonalityController');
Route::resource('/test', 'TestController');
Route::get('/question-code', 'TestController@codeQuestion');
Route::get('/answer-code', 'TestController@codeAnswer');
