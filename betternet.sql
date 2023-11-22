-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `amount` int(10) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_category_id_foreign` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `ticket_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_ticket_id_foreign` (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2019_05_03_000001_create_customer_columns',	1),
(4,	'2019_05_03_000002_create_subscriptions_table',	1),
(5,	'2019_05_03_000003_create_subscription_items_table',	1),
(6,	'2019_08_19_000000_create_failed_jobs_table',	1),
(7,	'2021_06_01_192445_create_permission_tables',	1),
(8,	'2021_06_02_020454_create_settings_table',	1),
(9,	'2021_06_03_233524_create_packages_table',	1),
(10,	'2021_06_07_224337_create_categories_table',	1),
(11,	'2021_06_07_224356_create_accounts_table',	1),
(12,	'2021_06_08_181741_create_tickets_table',	1),
(13,	'2021_06_08_181801_create_comments_table',	1),
(14,	'2021_07_27_195539_create_mikrotik_services_table',	1),
(15,	'2021_08_05_111521_create_payments_table',	1),
(16,	'2021_08_06_202928_create_payment_methods_table',	1),
(17,	'2021_08_12_204726_create_service_zones_table',	1),
(18,	'2021_08_15_212419_create_transactions_table',	1),
(19,	'2021_09_06_225723_create_email_templates_table',	1);

DROP TABLE IF EXISTS `mikrotik_services`;
CREATE TABLE `mikrotik_services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `mikrotik_services` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1,	'any',	NULL,	NULL),
(2,	'async',	NULL,	NULL),
(3,	'isdn',	NULL,	NULL),
(4,	'l2tp',	NULL,	NULL),
(5,	'pppoe',	NULL,	NULL),
(6,	'pptp',	NULL,	NULL),
(7,	'ovpn',	NULL,	NULL),
(8,	'sstp',	NULL,	NULL);

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1,	'App\\Models\\User',	1);

DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bandwidth` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `user_price` int(10) unsigned DEFAULT NULL,
  `reseller_price` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packages_name_unique` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `package_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_price` int(10) unsigned DEFAULT NULL,
  `reseller_price` int(10) unsigned DEFAULT NULL,
  `note` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_start` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_end` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approve` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `payment_method_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`),
  KEY `payments_created_by_foreign` (`created_by`),
  KEY `payments_payment_method_id_foreign` (`payment_method_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `payment_methods` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1,	'Visa',	NULL,	NULL),
(2,	'Mastercard',	NULL,	NULL),
(3,	'PayPal',	NULL,	NULL),
(4,	'Stripe',	NULL,	NULL),
(5,	'Cash',	NULL,	NULL),
(6,	'Discovery',	NULL,	NULL),
(7,	'Other',	NULL,	NULL),
(8,	'Direct deposit',	NULL,	NULL),
(9,	'Google pay',	NULL,	NULL),
(10,	'Credit card',	NULL,	NULL),
(11,	'Debit card',	NULL,	NULL),
(12,	'Mobile payment',	NULL,	NULL),
(13,	'Bank transfer',	NULL,	NULL),
(14,	'Payoneer',	NULL,	NULL),
(15,	'Amazon pay',	NULL,	NULL),
(16,	'WePay',	NULL,	NULL),
(17,	'Apple card',	NULL,	NULL),
(18,	'American Express',	NULL,	NULL),
(19,	'Square',	NULL,	NULL),
(20,	'Visa checkout',	NULL,	NULL),
(21,	'bKash',	NULL,	NULL);

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1,	'view-package',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(2,	'create-package',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(3,	'edit-package',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(4,	'deactivate-package',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(5,	'view-user-package-price',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(6,	'view-reseller-package-price',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(7,	'view-package-status',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(8,	'view-user',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(9,	'create-user',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(10,	'edit-user',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(11,	'view-reseller',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(12,	'create-reseller',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(13,	'edit-reseller',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(14,	'view-accounting',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(15,	'create-accounting',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(16,	'view-payment',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(17,	'create-payment',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(18,	'view-subscription',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(19,	'view-report',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(20,	'view-mikrotik',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(21,	'view-ticket',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(22,	'edit-ticket',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(23,	'create-comment',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(24,	'view-service-zone',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(25,	'create-service-zone',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(26,	'edit-service-zone',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13');

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(2,	'reseller',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13'),
(3,	'user',	'web',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13');

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1,	1),
(1,	2),
(1,	3),
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(6,	2),
(7,	1),
(8,	1),
(8,	2),
(9,	1),
(9,	2),
(10,	1),
(10,	2),
(11,	1),
(12,	1),
(13,	1),
(14,	1),
(15,	1),
(16,	1),
(16,	2),
(16,	3),
(17,	1),
(17,	2),
(17,	3),
(18,	1),
(18,	2),
(18,	3),
(19,	1),
(20,	1),
(21,	1),
(21,	2),
(21,	3),
(22,	1),
(22,	2),
(22,	3),
(23,	1),
(23,	2),
(23,	3),
(24,	1),
(25,	1),
(26,	1);

DROP TABLE IF EXISTS `service_zones`;
CREATE TABLE `service_zones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `using_reseller` tinyint(1) NOT NULL DEFAULT 0,
  `using_staff` tinyint(1) NOT NULL DEFAULT 0,
  `using_mikrotik` tinyint(1) NOT NULL DEFAULT 0,
  `using_customer_manager` tinyint(1) NOT NULL DEFAULT 0,
  `using_service_zone` tinyint(1) NOT NULL DEFAULT 0,
  `using_stripe` tinyint(1) NOT NULL DEFAULT 0,
  `mikrotik_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mikrotik_login_username` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mikrotik_login_password` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_expires_in` int(10) unsigned NOT NULL DEFAULT 30,
  `last_pay_day` int(10) unsigned NOT NULL DEFAULT 7,
  `invoice_before_expire` int(10) unsigned NOT NULL DEFAULT 3,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` (`id`, `using_reseller`, `using_staff`, `using_mikrotik`, `using_customer_manager`, `using_service_zone`, `using_stripe`, `mikrotik_ip`, `mikrotik_login_username`, `mikrotik_login_password`, `package_expires_in`, `last_pay_day`, `invoice_before_expire`, `created_at`, `updated_at`) VALUES
(1,	0,	0,	0,	0,	0,	0,	'192.168.3.174',	'admin',	NULL,	30,	7,	3,	'2021-09-09 23:34:13',	'2021-09-09 23:34:13');

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `package_name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_price` int(10) unsigned DEFAULT NULL,
  `reseller_price` int(10) unsigned DEFAULT NULL,
  `subscription_expires` datetime NOT NULL,
  `payment_last_day` datetime NOT NULL,
  `billing_day` datetime NOT NULL,
  `user_status` int(10) unsigned NOT NULL DEFAULT 1,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL,
  `package_id` bigint(20) unsigned NOT NULL,
  `invoice` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_status` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_plan` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_package_id_foreign` (`package_id`),
  KEY `subscriptions_created_by_foreign` (`created_by`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `subscription_items`;
CREATE TABLE `subscription_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) unsigned NOT NULL,
  `stripe_id` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  KEY `subscription_items_stripe_id_index` (`stripe_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ticketId` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_ticketid_unique` (`ticketId`),
  KEY `tickets_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  KEY `transactions_created_by_foreign` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reseller_id` bigint(20) unsigned DEFAULT NULL,
  `manager_id` bigint(20) unsigned DEFAULT NULL,
  `service_zone_id` bigint(20) unsigned DEFAULT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT 1,
  `company` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `mikrotik_user` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mikrotik_connection_type` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(125) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_stripe_id_index` (`stripe_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `customer_id`, `reseller_id`, `manager_id`, `service_zone_id`, `status`, `company`, `phone`, `address`, `city`, `postcode`, `emergency`, `national_id`, `birth`, `mikrotik_user`, `mikrotik_connection_type`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1,	'Admin',	'admin@betternet.com',	'2021-09-09 23:34:13',	'$2y$10$IPKi9rt.v7/UqiLHsW9GC.kGCrcmGWh8yO0hE01XCZXeHPG9j11Ou',	NULL,	NULL,	NULL,	NULL,	1,	'Breitenberg, Prohaska and Kemmer',	'+1-603-369-3379',	'4797 Edna Cliff',	'Savanahside',	'52805-8022',	'+1 (970) 219-3981',	NULL,	'1981-01-03',	NULL,	NULL,	'CqBNML2mM5',	'2021-09-09 23:34:13',	'2021-09-09 23:34:13',	NULL,	NULL,	NULL,	NULL);

-- 2021-09-10 09:37:14
