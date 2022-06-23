<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProcessEndPoint extends BaseController
{
    //

    /**
     *
    * retrieve all users in the system
    *
    *
    */

    public function fetchAllUser(){
        return $this->sendResponse(
            User::all(),
            'Available users'
        );
    }

    /**
     * return a single user detail, wallet owned and transaction history
     *
    */

    public function fetchUser(){

        $user = Auth::user();
        $wallets = DB::table('wallets')->where('holder_id',$user->getKey())->get();
        $transactions = DB::table('transactions')->where('payable_id',$user->getKey())->get();

        $detail = [
            'user'=>$user,
            'wallets' => $wallets,
            'transactions' => $transactions
        ];

        return $this->sendResponse($detail,'user details!');

    }


    /**
     * retrieve all wallet in system
    *
    */

    public function fetchWallets(){

        $wallets = DB::table('wallets')->get();

        $data = [
            'wallets' => $wallets
        ];

        return $this->sendResponse($data,'Available wallets');

    }

    /**
     * retrieve a wallet,owner and transaction history
     */

    public function getWallet(Request $request){

        $credential = $request->validate([
            'wallet_id' => ['required','numeric']
        ]);

        $wallet = DB::table('wallets')->where('id',$credential['wallet_id'])->first();
        $user = User::findOrFail($wallet->holder_id);
        $walletTransactions = DB::table('transactions')->where('wallet_id',$credential['wallet_id'])->get();

        $details = [
            'wallet' => $wallet,
            'user' => $user,
            'wallet transactions' => $walletTransactions
        ];

        return $this->sendResponse($details,'successful');

    }

    /**
     * get count of users,count of wallets, total wallet balance, total volume of transactions
     *
     */

    public function getSummary(){

    $data = [
        'users'               => User::count(),
        'wallets'             => DB::table('wallets')->count(),
        'wallets Total Balance' => DB::table('wallets')->sum('balance'),
        'Total Transactions'   => DB::table('transactions')->sum('amount')
    ];

    return $this->sendResponse($data,'successful');
    }


    /**
     * transfer money between wallets. for demo purpose the USD and EUR wallet are used.
    * The demo wallets are created if the user has none.
    *
    */

    public function doTransfer(){

    $user = Auth::user();

    $usd = $user->hasWallet("USD-wallet-$user->name")? $user->getWallet("USD-wallet-$user->name"): $user->createWallet([
        'name' => 'USD',
        'slug' => 'USD-wallet-'.$user->name
    ]);

    $eur = $user->hasWallet("EUR-wallet-$user->name")? $user->getWallet("EUR-wallet-$user->name"): $user->createWallet([
        'name' => 'EUR',
        'slug' => 'EUR-wallet-'.$user->name
    ]);




    //get balance of both wallet before transfer

    $usd_balance = $usd->balance;
    $eur_balance = $eur->balance;

    //add 100 cent to usd wallet
    $usd->deposit(100);

    //transfer
    $usd->transfer($eur,15);

    $transactions = DB::table('transactions')->where('payable_id',$user->getKey())->get();

    $data = [
        'user'                        => $user->name,
        'description'                 => 'deposit of 100 in USD wallet before transfer of 15 to EUR wallet',
        'USD balance before transfer' => $usd_balance,
        'EUR balance before transfer' => $eur_balance,
        'USD balance after transfer'  => $usd->balance,
        'EUR balance after transfer'  => $eur->balance,
        'default wallet'              => $user->balance,
        'transactions'                => $transactions
    ];

    return $this->sendResponse($data,'successful');

    }

}
