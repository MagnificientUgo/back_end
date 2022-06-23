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


## sample output

localhost:8000/api/get-all-users  //fetch all user

{
    "success": true,
    "data": [
        {
            "id": 1,
            "name": "magnificent",
            "email": "ugochukw@gmail.com",
            "email_verified_at": null,
            "created_at": "2022-06-20T19:29:14.000000Z",
            "updated_at": "2022-06-20T19:29:14.000000Z"
        },
        {
            "id": 2,
            "name": "tony michael",
            "email": "michael@mail.com",
            "email_verified_at": null,
            "created_at": "2022-06-21T14:57:05.000000Z",
            "updated_at": "2022-06-21T14:57:05.000000Z"
        },
        {
            "id": 3,
            "name": "james elliot",
            "email": "elliot@mm.co.uk",
            "email_verified_at": null,
            "created_at": "2022-06-21T14:58:13.000000Z",
            "updated_at": "2022-06-21T14:58:13.000000Z"
        },
        {
            "id": 4,
            "name": "rita modam",
            "email": "rita@hotmail.com",
            "email_verified_at": null,
            "created_at": "2022-06-21T14:59:25.000000Z",
            "updated_at": "2022-06-21T14:59:25.000000Z"
        }
    ],
    "message": "Available users"
}


### get summary of transactions

localhost:8000/api/get-transactions-summary

{
    "success": true,
    "data": {
        "users": 4,
        "wallets": 7,
        "wallets Total Balance": "2600",
        "Total Transactions": "2600"
    },
    "message": "successful"
}


### user transactions

localhost:8000/api/get-user-transaction

{
    "success": true,
    "data": {
        "user": {
            "id": 4,
            "name": "rita modam",
            "email": "rita@hotmail.com",
            "email_verified_at": null,
            "created_at": "2022-06-21T14:59:25.000000Z",
            "updated_at": "2022-06-21T14:59:25.000000Z"
        },
        "wallets": [
            {
                "id": 4,
                "holder_type": "App\\Models\\User",
                "holder_id": 4,
                "name": "Default Wallet",
                "slug": "default",
                "uuid": "d5d041ee-0ccf-4bb8-bab2-645f323296da",
                "description": null,
                "meta": "[]",
                "balance": "700",
                "decimal_places": 2,
                "created_at": "2022-06-21 21:55:54",
                "updated_at": "2022-06-21 21:55:54"
            },
            {
                "id": 5,
                "holder_type": "App\\Models\\User",
                "holder_id": 4,
                "name": "savings account",
                "slug": "savings-account",
                "uuid": "6f7ab972-c403-44f3-a2d6-a58659547406",
                "description": null,
                "meta": null,
                "balance": "0",
                "decimal_places": 2,
                "created_at": "2022-06-21 22:02:59",
                "updated_at": "2022-06-21 22:02:59"
            },
            {
                "id": 6,
                "holder_type": "App\\Models\\User",
                "holder_id": 4,
                "name": "USD",
                "slug": "USD-wallet-rita modam",
                "uuid": "3c7147e6-4922-417a-894c-e0e00aa7f9f6",
                "description": null,
                "meta": null,
                "balance": "425",
                "decimal_places": 2,
                "created_at": "2022-06-22 10:35:01",
                "updated_at": "2022-06-23 17:11:50"
            },
            {
                "id": 7,
                "holder_type": "App\\Models\\User",
                "holder_id": 4,
                "name": "EUR",
                "slug": "EUR-wallet-rita modam",
                "uuid": "10851bde-a2ce-4e4f-bc4f-007fffb19087",
                "description": null,
                "meta": null,
                "balance": "75",
                "decimal_places": 2,
                "created_at": "2022-06-22 10:35:01",
                "updated_at": "2022-06-23 17:11:50"
            }
        ],
        "transactions": [
            {
                "id": 3,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 4,
                "type": "deposit",
                "amount": "700",
                "confirmed": 1,
                "meta": null,
                "uuid": "72f55548-4fa9-42c0-a7cc-c51d62780430",
                "created_at": "2022-06-21 21:55:54",
                "updated_at": "2022-06-21 21:55:54"
            },
            {
                "id": 4,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "deposit",
                "amount": "100",
                "confirmed": 1,
                "meta": null,
                "uuid": "e76ba861-c002-4b21-b44d-42ea15a732fd",
                "created_at": "2022-06-22 10:35:01",
                "updated_at": "2022-06-22 10:35:01"
            },
            {
                "id": 5,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "withdraw",
                "amount": "-15",
                "confirmed": 1,
                "meta": null,
                "uuid": "ceb76d42-1197-41a6-8b34-8b8f9289ccf2",
                "created_at": "2022-06-22 10:35:01",
                "updated_at": "2022-06-22 10:35:01"
            },
            {
                "id": 6,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 7,
                "type": "deposit",
                "amount": "15",
                "confirmed": 1,
                "meta": null,
                "uuid": "67586602-35bb-41b4-a25b-871d2c0c0509",
                "created_at": "2022-06-22 10:35:01",
                "updated_at": "2022-06-22 10:35:01"
            },
            {
                "id": 7,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "deposit",
                "amount": "100",
                "confirmed": 1,
                "meta": null,
                "uuid": "22bff3c5-8ee2-4e4d-a77d-098550d8ec12",
                "created_at": "2022-06-22 10:57:47",
                "updated_at": "2022-06-22 10:57:47"
            },
            {
                "id": 8,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "withdraw",
                "amount": "-15",
                "confirmed": 1,
                "meta": null,
                "uuid": "f3069bfe-d032-4664-82b5-1984820c466d",
                "created_at": "2022-06-22 10:57:47",
                "updated_at": "2022-06-22 10:57:47"
            },
            {
                "id": 9,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 7,
                "type": "deposit",
                "amount": "15",
                "confirmed": 1,
                "meta": null,
                "uuid": "a14ea187-643b-4bd9-9cbd-81a40f54028c",
                "created_at": "2022-06-22 10:57:47",
                "updated_at": "2022-06-22 10:57:47"
            },
            {
                "id": 10,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "deposit",
                "amount": "100",
                "confirmed": 1,
                "meta": null,
                "uuid": "4c402cae-6dc1-491b-97ff-6fb3f53aefc8",
                "created_at": "2022-06-22 11:01:53",
                "updated_at": "2022-06-22 11:01:53"
            },
            {
                "id": 11,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "withdraw",
                "amount": "-15",
                "confirmed": 1,
                "meta": null,
                "uuid": "6839eb44-d31a-446f-8e71-30677fc54ee6",
                "created_at": "2022-06-22 11:01:53",
                "updated_at": "2022-06-22 11:01:53"
            },
            {
                "id": 12,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 7,
                "type": "deposit",
                "amount": "15",
                "confirmed": 1,
                "meta": null,
                "uuid": "497cf8af-c23b-45a8-beab-1deef961fad7",
                "created_at": "2022-06-22 11:01:53",
                "updated_at": "2022-06-22 11:01:53"
            },
            {
                "id": 13,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "deposit",
                "amount": "100",
                "confirmed": 1,
                "meta": null,
                "uuid": "2ea25f74-612a-4fde-96eb-194373b51256",
                "created_at": "2022-06-22 11:02:38",
                "updated_at": "2022-06-22 11:02:38"
            },
            {
                "id": 14,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "withdraw",
                "amount": "-15",
                "confirmed": 1,
                "meta": null,
                "uuid": "8df9e87b-912a-4a6e-9a33-9f17528f2d2c",
                "created_at": "2022-06-22 11:02:38",
                "updated_at": "2022-06-22 11:02:38"
            },
            {
                "id": 15,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 7,
                "type": "deposit",
                "amount": "15",
                "confirmed": 1,
                "meta": null,
                "uuid": "512501b2-1574-451b-9f54-c56f862dde81",
                "created_at": "2022-06-22 11:02:38",
                "updated_at": "2022-06-22 11:02:38"
            },
            {
                "id": 16,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "deposit",
                "amount": "100",
                "confirmed": 1,
                "meta": null,
                "uuid": "07772bc3-f285-47dc-8a42-097b04597832",
                "created_at": "2022-06-23 17:11:50",
                "updated_at": "2022-06-23 17:11:50"
            },
            {
                "id": 17,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "withdraw",
                "amount": "-15",
                "confirmed": 1,
                "meta": null,
                "uuid": "80a10b2b-8cad-4021-840a-bf866e0f2b03",
                "created_at": "2022-06-23 17:11:50",
                "updated_at": "2022-06-23 17:11:50"
            },
            {
                "id": 18,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 7,
                "type": "deposit",
                "amount": "15",
                "confirmed": 1,
                "meta": null,
                "uuid": "a64c713d-48c0-4d38-8190-d1fe74ef5ed2",
                "created_at": "2022-06-23 17:11:50",
                "updated_at": "2022-06-23 17:11:50"
            }
        ]
    },
    "message": "user details!"
}

### fetch all wallet

localhost:8000/api/get-all-wallets

{
    "success": true,
    "data": {
        "wallets": [
            {
                "id": 1,
                "holder_type": "App\\Models\\User",
                "holder_id": 1,
                "name": "USD account",
                "slug": "USD-account",
                "uuid": "7f8060e8-afbf-4edf-8603-d660a999d817",
                "description": null,
                "meta": null,
                "balance": "0",
                "decimal_places": 2,
                "created_at": "2022-06-21 17:30:32",
                "updated_at": "2022-06-21 17:30:32"
            },
            {
                "id": 2,
                "holder_type": "App\\Models\\User",
                "holder_id": 1,
                "name": "EU account",
                "slug": "EU-account",
                "uuid": "3d6953ec-0979-49a1-aa22-f18959d10801",
                "description": null,
                "meta": null,
                "balance": "0",
                "decimal_places": 2,
                "created_at": "2022-06-21 18:25:02",
                "updated_at": "2022-06-21 18:25:02"
            },
            {
                "id": 3,
                "holder_type": "App\\Models\\User",
                "holder_id": 1,
                "name": "Default Wallet",
                "slug": "default",
                "uuid": "a2b191ad-fe12-403e-b6b7-dcc3c9dc8294",
                "description": null,
                "meta": "[]",
                "balance": "1400",
                "decimal_places": 2,
                "created_at": "2022-06-21 21:43:49",
                "updated_at": "2022-06-21 21:46:09"
            },
            {
                "id": 4,
                "holder_type": "App\\Models\\User",
                "holder_id": 4,
                "name": "Default Wallet",
                "slug": "default",
                "uuid": "d5d041ee-0ccf-4bb8-bab2-645f323296da",
                "description": null,
                "meta": "[]",
                "balance": "700",
                "decimal_places": 2,
                "created_at": "2022-06-21 21:55:54",
                "updated_at": "2022-06-21 21:55:54"
            },
            {
                "id": 5,
                "holder_type": "App\\Models\\User",
                "holder_id": 4,
                "name": "savings account",
                "slug": "savings-account",
                "uuid": "6f7ab972-c403-44f3-a2d6-a58659547406",
                "description": null,
                "meta": null,
                "balance": "0",
                "decimal_places": 2,
                "created_at": "2022-06-21 22:02:59",
                "updated_at": "2022-06-21 22:02:59"
            },
            {
                "id": 6,
                "holder_type": "App\\Models\\User",
                "holder_id": 4,
                "name": "USD",
                "slug": "USD-wallet-rita modam",
                "uuid": "3c7147e6-4922-417a-894c-e0e00aa7f9f6",
                "description": null,
                "meta": null,
                "balance": "425",
                "decimal_places": 2,
                "created_at": "2022-06-22 10:35:01",
                "updated_at": "2022-06-23 17:11:50"
            },
            {
                "id": 7,
                "holder_type": "App\\Models\\User",
                "holder_id": 4,
                "name": "EUR",
                "slug": "EUR-wallet-rita modam",
                "uuid": "10851bde-a2ce-4e4f-bc4f-007fffb19087",
                "description": null,
                "meta": null,
                "balance": "75",
                "decimal_places": 2,
                "created_at": "2022-06-22 10:35:01",
                "updated_at": "2022-06-23 17:11:50"
            }
        ]
    },
    "message": "Available wallets"
}


### do transfer between wallets

localhost:8000/api/do-transfer //wallet transfer

{
    "success": true,
    "data": {
        "user": "rita modam",
        "description": "deposit of 100 in USD wallet before transfer of 15 to EUR wallet",
        "USD balance before transfer": "340",
        "EUR balance before transfer": "60",
        "USD balance after transfer": "425",
        "EUR balance after transfer": "75",
        "default wallet": "700",
        "transactions": [
            {
                "id": 3,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 4,
                "type": "deposit",
                "amount": "700",
                "confirmed": 1,
                "meta": null,
                "uuid": "72f55548-4fa9-42c0-a7cc-c51d62780430",
                "created_at": "2022-06-21 21:55:54",
                "updated_at": "2022-06-21 21:55:54"
            },
            {
                "id": 4,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "deposit",
                "amount": "100",
                "confirmed": 1,
                "meta": null,
                "uuid": "e76ba861-c002-4b21-b44d-42ea15a732fd",
                "created_at": "2022-06-22 10:35:01",
                "updated_at": "2022-06-22 10:35:01"
            },
            {
                "id": 5,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "withdraw",
                "amount": "-15",
                "confirmed": 1,
                "meta": null,
                "uuid": "ceb76d42-1197-41a6-8b34-8b8f9289ccf2",
                "created_at": "2022-06-22 10:35:01",
                "updated_at": "2022-06-22 10:35:01"
            },
            {
                "id": 6,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 7,
                "type": "deposit",
                "amount": "15",
                "confirmed": 1,
                "meta": null,
                "uuid": "67586602-35bb-41b4-a25b-871d2c0c0509",
                "created_at": "2022-06-22 10:35:01",
                "updated_at": "2022-06-22 10:35:01"
            },
            {
                "id": 7,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "deposit",
                "amount": "100",
                "confirmed": 1,
                "meta": null,
                "uuid": "22bff3c5-8ee2-4e4d-a77d-098550d8ec12",
                "created_at": "2022-06-22 10:57:47",
                "updated_at": "2022-06-22 10:57:47"
            },
            {
                "id": 8,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "withdraw",
                "amount": "-15",
                "confirmed": 1,
                "meta": null,
                "uuid": "f3069bfe-d032-4664-82b5-1984820c466d",
                "created_at": "2022-06-22 10:57:47",
                "updated_at": "2022-06-22 10:57:47"
            },
            {
                "id": 9,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 7,
                "type": "deposit",
                "amount": "15",
                "confirmed": 1,
                "meta": null,
                "uuid": "a14ea187-643b-4bd9-9cbd-81a40f54028c",
                "created_at": "2022-06-22 10:57:47",
                "updated_at": "2022-06-22 10:57:47"
            },
            {
                "id": 10,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "deposit",
                "amount": "100",
                "confirmed": 1,
                "meta": null,
                "uuid": "4c402cae-6dc1-491b-97ff-6fb3f53aefc8",
                "created_at": "2022-06-22 11:01:53",
                "updated_at": "2022-06-22 11:01:53"
            },
            {
                "id": 11,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "withdraw",
                "amount": "-15",
                "confirmed": 1,
                "meta": null,
                "uuid": "6839eb44-d31a-446f-8e71-30677fc54ee6",
                "created_at": "2022-06-22 11:01:53",
                "updated_at": "2022-06-22 11:01:53"
            },
            {
                "id": 12,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 7,
                "type": "deposit",
                "amount": "15",
                "confirmed": 1,
                "meta": null,
                "uuid": "497cf8af-c23b-45a8-beab-1deef961fad7",
                "created_at": "2022-06-22 11:01:53",
                "updated_at": "2022-06-22 11:01:53"
            },
            {
                "id": 13,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "deposit",
                "amount": "100",
                "confirmed": 1,
                "meta": null,
                "uuid": "2ea25f74-612a-4fde-96eb-194373b51256",
                "created_at": "2022-06-22 11:02:38",
                "updated_at": "2022-06-22 11:02:38"
            },
            {
                "id": 14,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "withdraw",
                "amount": "-15",
                "confirmed": 1,
                "meta": null,
                "uuid": "8df9e87b-912a-4a6e-9a33-9f17528f2d2c",
                "created_at": "2022-06-22 11:02:38",
                "updated_at": "2022-06-22 11:02:38"
            },
            {
                "id": 15,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 7,
                "type": "deposit",
                "amount": "15",
                "confirmed": 1,
                "meta": null,
                "uuid": "512501b2-1574-451b-9f54-c56f862dde81",
                "created_at": "2022-06-22 11:02:38",
                "updated_at": "2022-06-22 11:02:38"
            },
            {
                "id": 16,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "deposit",
                "amount": "100",
                "confirmed": 1,
                "meta": null,
                "uuid": "07772bc3-f285-47dc-8a42-097b04597832",
                "created_at": "2022-06-23 17:11:50",
                "updated_at": "2022-06-23 17:11:50"
            },
            {
                "id": 17,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 6,
                "type": "withdraw",
                "amount": "-15",
                "confirmed": 1,
                "meta": null,
                "uuid": "80a10b2b-8cad-4021-840a-bf866e0f2b03",
                "created_at": "2022-06-23 17:11:50",
                "updated_at": "2022-06-23 17:11:50"
            },
            {
                "id": 18,
                "payable_type": "App\\Models\\User",
                "payable_id": 4,
                "wallet_id": 7,
                "type": "deposit",
                "amount": "15",
                "confirmed": 1,
                "meta": null,
                "uuid": "a64c713d-48c0-4d38-8190-d1fe74ef5ed2",
                "created_at": "2022-06-23 17:11:50",
                "updated_at": "2022-06-23 17:11:50"
            }
        ]
    },
    "message": "successful"
}

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
