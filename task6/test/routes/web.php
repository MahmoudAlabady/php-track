<?php
use App\Http\Controllers\Auth\register;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\loginController;
use App\Http\Controllers\allController;
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
Route::group(['prefix'=>'user','as'=>'user.'], function ()
{
Route::get('/login',[loginController::class,'login'])->name('login');
Route::get('/register',[register::class,'register'])->name('register');
Route::get('/all',[allController::class,'index'])->name('all');
});
