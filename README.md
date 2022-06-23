<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About this work.

This is an attempt to the Backend assessment test below:

1. Design the database for an application in which users can have multiple wallets with each
wallet type having its own name, minimum balance and monthly interest rate. Wallets
should be able to send and receive money from other wallets.
Create endpoints that perform the following actions
a. Gets all users in the system.
b. Gets a user’s detail including the wallets they own and the transaction history of that
user.
c. Gets all wallets in the system.
d. Gets a wallet’s detail including its owner, type and the transaction history of that wallet.
e. Gets the count of users, count of wallets, total wallet balance, total volume of
transactions.
f. Sends money from one wallet to another.

## Framework

laravel framework was used for the assessment work


## USAGE.

1. download the zip file
2. extract the content to local web server
3. change to the root directory of the app
4. type: php artisan serve

**note: this app requires php version ^8.0 and laravel 9
## postman collections

- **POST localhost:8000/api/register**
- **POST localhost:8000/api/login login**
- **POST localhost:8000/api/user**
- **POST localhost:8000/api/users fetch_all_users**
- **POST localhost:8000/api/all-wallets get-all-wallets**
- **POST localhost:8000/api/get-wallet get-wallet**
- **POST localhost:8000/api/get-summary get-summary**
- **POST localhost:8000/api/do-transfer**

### routes/api

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

## Endpoints controller

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

## Database 

- **The included Sql file (api9.sql) contains contains the sql statements and queries to reconstruct the database used for this work.**
- **The database name for the app id "api9"**
- **The database should be created before importing the Sql file**
- **The ENV file contains configuration information for the database connections and credentials used**
- **if the env missing the rename the env.example file to env**

## Code files location

- **for the routes or url definations, check the file routes/api.php**
- **for the endpoints controller code definitions check App/Http/Controllers/ProcessEndPoint.php**
- **for user code definition file check App/User.php**



## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
