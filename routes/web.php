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
Route::resource('/job-field', 'JobFieldController');
Route::resource('/job-source', 'JobSourceController');
Route::resource('/personality', 'MBTIPersonalityController');
Route::resource('/question', 'QuestionController');
Route::resource('/answer', 'AnswerController');
