-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 23, 2022 at 10:27 AM
-- Server version: 5.7.33
-- PHP Version: 8.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api9`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2018_11_06_222923_create_transactions_table', 2),
(6, '2018_11_07_192923_create_transfers_table', 2),
(7, '2018_11_15_124230_create_wallets_table', 2),
(8, '2021_11_02_202021_update_wallets_uuid_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', 'cb251f2bd2390a55e4bd1a3c790040aa0cdc63f50433ca90e7ae66f93e5de17b', '[\"*\"]', NULL, '2022-06-20 18:29:14', '2022-06-20 18:29:14'),
(2, 'App\\Models\\User', 1, 'MyApp', '4f6c235516d08a265abf1836b7693352555d8ac5ba9f946f8ee0e426b4e2aea2', '[\"*\"]', '2022-06-21 20:50:17', '2022-06-21 13:01:43', '2022-06-21 20:50:17'),
(3, 'App\\Models\\User', 2, 'MyApp', '095d60d240c309e9c606ded01916b87822536e3120d7ef36735f42cde0ed053c', '[\"*\"]', NULL, '2022-06-21 13:57:05', '2022-06-21 13:57:05'),
(4, 'App\\Models\\User', 3, 'MyApp', '295b167369f384a12410a9275c715edf7034cffabd41ec79fcd5a7c586f04ad1', '[\"*\"]', NULL, '2022-06-21 13:58:13', '2022-06-21 13:58:13'),
(5, 'App\\Models\\User', 4, 'MyApp', '54c54959de4e92909bb8b6b2448b3249b8cbce5975dd5fe95a4d63bde0fc77f8', '[\"*\"]', NULL, '2022-06-21 13:59:25', '2022-06-21 13:59:25'),
(6, 'App\\Models\\User', 4, 'MyApp', '4ecbcb03add5b179d5061216e75cc7b8bdb25185b12d7b50c8153ad9d4b38805', '[\"*\"]', '2022-06-22 10:02:38', '2022-06-21 20:54:57', '2022-06-22 10:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(64,0) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `meta` json DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `payable_type`, `payable_id`, `wallet_id`, `type`, `amount`, `confirmed`, `meta`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 3, 'deposit', '700', 1, NULL, '3f3144c1-1133-439c-8a1f-01b14a81c218', '2022-06-21 20:43:49', '2022-06-21 20:43:49'),
(2, 'App\\Models\\User', 1, 3, 'deposit', '700', 1, NULL, '126f0c17-015d-4921-bd0b-7e7b4841355d', '2022-06-21 20:46:09', '2022-06-21 20:46:09'),
(3, 'App\\Models\\User', 4, 4, 'deposit', '700', 1, NULL, '72f55548-4fa9-42c0-a7cc-c51d62780430', '2022-06-21 20:55:54', '2022-06-21 20:55:54'),
(4, 'App\\Models\\User', 4, 6, 'deposit', '100', 1, NULL, 'e76ba861-c002-4b21-b44d-42ea15a732fd', '2022-06-22 09:35:01', '2022-06-22 09:35:01'),
(5, 'App\\Models\\User', 4, 6, 'withdraw', '-15', 1, NULL, 'ceb76d42-1197-41a6-8b34-8b8f9289ccf2', '2022-06-22 09:35:01', '2022-06-22 09:35:01'),
(6, 'App\\Models\\User', 4, 7, 'deposit', '15', 1, NULL, '67586602-35bb-41b4-a25b-871d2c0c0509', '2022-06-22 09:35:01', '2022-06-22 09:35:01'),
(7, 'App\\Models\\User', 4, 6, 'deposit', '100', 1, NULL, '22bff3c5-8ee2-4e4d-a77d-098550d8ec12', '2022-06-22 09:57:47', '2022-06-22 09:57:47'),
(8, 'App\\Models\\User', 4, 6, 'withdraw', '-15', 1, NULL, 'f3069bfe-d032-4664-82b5-1984820c466d', '2022-06-22 09:57:47', '2022-06-22 09:57:47'),
(9, 'App\\Models\\User', 4, 7, 'deposit', '15', 1, NULL, 'a14ea187-643b-4bd9-9cbd-81a40f54028c', '2022-06-22 09:57:47', '2022-06-22 09:57:47'),
(10, 'App\\Models\\User', 4, 6, 'deposit', '100', 1, NULL, '4c402cae-6dc1-491b-97ff-6fb3f53aefc8', '2022-06-22 10:01:53', '2022-06-22 10:01:53'),
(11, 'App\\Models\\User', 4, 6, 'withdraw', '-15', 1, NULL, '6839eb44-d31a-446f-8e71-30677fc54ee6', '2022-06-22 10:01:53', '2022-06-22 10:01:53'),
(12, 'App\\Models\\User', 4, 7, 'deposit', '15', 1, NULL, '497cf8af-c23b-45a8-beab-1deef961fad7', '2022-06-22 10:01:53', '2022-06-22 10:01:53'),
(13, 'App\\Models\\User', 4, 6, 'deposit', '100', 1, NULL, '2ea25f74-612a-4fde-96eb-194373b51256', '2022-06-22 10:02:38', '2022-06-22 10:02:38'),
(14, 'App\\Models\\User', 4, 6, 'withdraw', '-15', 1, NULL, '8df9e87b-912a-4a6e-9a33-9f17528f2d2c', '2022-06-22 10:02:38', '2022-06-22 10:02:38'),
(15, 'App\\Models\\User', 4, 7, 'deposit', '15', 1, NULL, '512501b2-1574-451b-9f54-c56f862dde81', '2022-06-22 10:02:38', '2022-06-22 10:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) UNSIGNED NOT NULL,
  `to_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'transfer',
  `status_last` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_id` bigint(20) UNSIGNED NOT NULL,
  `withdraw_id` bigint(20) UNSIGNED NOT NULL,
  `discount` decimal(64,0) NOT NULL DEFAULT '0',
  `fee` decimal(64,0) NOT NULL DEFAULT '0',
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `from_type`, `from_id`, `to_type`, `to_id`, `status`, `status_last`, `deposit_id`, `withdraw_id`, `discount`, `fee`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'Bavix\\Wallet\\Models\\Wallet', 6, 'Bavix\\Wallet\\Models\\Wallet', 7, 'transfer', NULL, 6, 5, '0', '0', '508ba9f5-0968-4dc2-8a72-a461aacc1e70', '2022-06-22 09:35:01', '2022-06-22 09:35:01'),
(2, 'Bavix\\Wallet\\Models\\Wallet', 6, 'Bavix\\Wallet\\Models\\Wallet', 7, 'transfer', NULL, 9, 8, '0', '0', '934b22b7-8c94-428f-b450-9b2842cb5414', '2022-06-22 09:57:47', '2022-06-22 09:57:47'),
(3, 'Bavix\\Wallet\\Models\\Wallet', 6, 'Bavix\\Wallet\\Models\\Wallet', 7, 'transfer', NULL, 12, 11, '0', '0', '46966c13-46a3-4fa0-b950-956222801d7f', '2022-06-22 10:01:53', '2022-06-22 10:01:53'),
(4, 'Bavix\\Wallet\\Models\\Wallet', 6, 'Bavix\\Wallet\\Models\\Wallet', 7, 'transfer', NULL, 15, 14, '0', '0', 'd97ed31e-3560-4c99-9e52-5759c68d4aa6', '2022-06-22 10:02:38', '2022-06-22 10:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'magnificent', 'ugochukw@gmail.com', NULL, '$2y$10$gbJ1XIUYhb02Mu0O/cttAuaN4D0.CBQppBDeIUuiqMFxbYqgHyTLa', NULL, '2022-06-20 18:29:14', '2022-06-20 18:29:14'),
(2, 'tony michael', 'michael@mail.com', NULL, '$2y$10$d/juAstue9eJka71n1FcKODjTFDeD9VXUccfT90tg3xs/15DPZAOq', NULL, '2022-06-21 13:57:05', '2022-06-21 13:57:05'),
(3, 'james elliot', 'elliot@mm.co.uk', NULL, '$2y$10$V0aWcwMw3t9Y/ELImjsqf.oTLM4mJrT4jlkMmHylXWuLqEb1frWVm', NULL, '2022-06-21 13:58:13', '2022-06-21 13:58:13'),
(4, 'rita modam', 'rita@hotmail.com', NULL, '$2y$10$Cy5Ch71AfhZoQu0yCDqN/Oq2BjkecUy2j5.RQjHqA/47eB3bBbsMS', NULL, '2022-06-21 13:59:25', '2022-06-21 13:59:25');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `holder_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holder_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` json DEFAULT NULL,
  `balance` decimal(64,0) NOT NULL DEFAULT '0',
  `decimal_places` smallint(5) UNSIGNED NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `holder_type`, `holder_id`, `name`, `slug`, `uuid`, `description`, `meta`, `balance`, `decimal_places`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'USD account', 'USD-account', '7f8060e8-afbf-4edf-8603-d660a999d817', NULL, NULL, '0', 2, '2022-06-21 16:30:32', '2022-06-21 16:30:32'),
(2, 'App\\Models\\User', 1, 'EU account', 'EU-account', '3d6953ec-0979-49a1-aa22-f18959d10801', NULL, NULL, '0', 2, '2022-06-21 17:25:02', '2022-06-21 17:25:02'),
(3, 'App\\Models\\User', 1, 'Default Wallet', 'default', 'a2b191ad-fe12-403e-b6b7-dcc3c9dc8294', NULL, '[]', '1400', 2, '2022-06-21 20:43:49', '2022-06-21 20:46:09'),
(4, 'App\\Models\\User', 4, 'Default Wallet', 'default', 'd5d041ee-0ccf-4bb8-bab2-645f323296da', NULL, '[]', '700', 2, '2022-06-21 20:55:54', '2022-06-21 20:55:54'),
(5, 'App\\Models\\User', 4, 'savings account', 'savings-account', '6f7ab972-c403-44f3-a2d6-a58659547406', NULL, NULL, '0', 2, '2022-06-21 21:02:59', '2022-06-21 21:02:59'),
(6, 'App\\Models\\User', 4, 'USD', 'USD-wallet-rita modam', '3c7147e6-4922-417a-894c-e0e00aa7f9f6', NULL, NULL, '340', 2, '2022-06-22 09:35:01', '2022-06-22 10:02:38'),
(7, 'App\\Models\\User', 4, 'EUR', 'EUR-wallet-rita modam', '10851bde-a2ce-4e4f-bc4f-007fffb19087', NULL, NULL, '60', 2, '2022-06-22 09:35:01', '2022-06-22 10:02:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transactions_uuid_unique` (`uuid`),
  ADD KEY `transactions_payable_type_payable_id_index` (`payable_type`,`payable_id`),
  ADD KEY `payable_type_payable_id_ind` (`payable_type`,`payable_id`),
  ADD KEY `payable_type_ind` (`payable_type`,`payable_id`,`type`),
  ADD KEY `payable_confirmed_ind` (`payable_type`,`payable_id`,`confirmed`),
  ADD KEY `payable_type_confirmed_ind` (`payable_type`,`payable_id`,`type`,`confirmed`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_wallet_id_foreign` (`wallet_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transfers_uuid_unique` (`uuid`),
  ADD KEY `transfers_from_type_from_id_index` (`from_type`,`from_id`),
  ADD KEY `transfers_to_type_to_id_index` (`to_type`,`to_id`),
  ADD KEY `transfers_deposit_id_foreign` (`deposit_id`),
  ADD KEY `transfers_withdraw_id_foreign` (`withdraw_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallets_holder_type_holder_id_slug_unique` (`holder_type`,`holder_id`,`slug`),
  ADD UNIQUE KEY `wallets_uuid_unique` (`uuid`),
  ADD KEY `wallets_holder_type_holder_id_index` (`holder_type`,`holder_id`),
  ADD KEY `wallets_slug_index` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_withdraw_id_foreign` FOREIGN KEY (`withdraw_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
