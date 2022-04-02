<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\Api\CurrentUserController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

//Route::post('/register', [AuthController::class, 'register']);
//Route::post('/login', [AuthController::class, 'login']);
Route::get('/front', [\App\Http\Controllers\FrontController::class, 'index']);

Route::group(["middleware" => "auth:sanctum"], function () {
    Route::get("/admin", [AdminController::class, "index"]);
//    Route::get("/csv", [\App\Http\Controllers\Api\PortfolioController::class, "importCsv"]);
    Route::resource('user', "App\Http\Controllers\Api\UserController");
    Route::apiResources([
        'media' => 'App\Http\Controllers\Api\MediaController',
        'category' => 'App\Http\Controllers\Api\CategoryController',
        'post' => 'App\Http\Controllers\Api\PostController',
        'type' => 'App\Http\Controllers\Api\TypeController',
        'portfolio' => 'App\Http\Controllers\Api\PortfolioController',
    ]);
//    Route::get('media-count', 'App\Http\Controllers\Api\MediaController@count');
});
