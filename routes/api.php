<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\ProcessEndPoint;
use App\Models\User;

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


Route::controller(RegisterController::class)->group(function(){
    Route::post('register', 'register');
    Route::post('login', 'login');
});

Route::middleware('auth:sanctum')->group( function () {

    Route::post('/get-all-users',[ProcessEndPoint::class,'fetchAllUser']);

    Route::post('/get-user-transaction',[ProcessEndPoint::class,'fetchUser']);

    Route::post('/get-all-wallets',[ProcessEndPoint::class,'fetchWallets']);

    Route::post('/get-wallet-detail',[ProcessEndPoint::class,'getWallet']);

    Route::post('/get-transactions-summary',[ProcessEndPoint::class,'getSummary']);

    Route::post('/do-transfer',[ProcessEndPoint::class,'doTransfer']);
});
