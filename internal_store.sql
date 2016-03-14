-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 14, 2016 at 07:25 AM
-- Server version: 5.5.48-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `internal_store`
--
CREATE DATABASE IF NOT EXISTS `internal_store` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `internal_store`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` tinyint(4) NOT NULL,
  `auth_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `role`, `auth_key`, `access_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'adminstore', 'store@internal.com', '$2y$10$ZfhaCfbj0SLjHx24qMfhluX6uPR.jQlN0oJV18AiRQuzTIiUc7fZG', 1, NULL, NULL, 'sqGmMCxs4PgbtIz0wOgyNczW8gXDZ37xuRSmRRnPZTUlN6StgdPSYVlpJNJg', '2015-11-13 00:54:55', '2016-03-07 10:01:35'),
(2, 'adminfinance', 'finance@internal.com', 'segitiga', 2, NULL, NULL, 'pBeNKwRBLN721JbaujUZu4WPAQyG0BCWMxnBlgMTQztt8cub16YcI58AyIG9', '2015-11-13 00:54:55', '2016-01-20 10:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE IF NOT EXISTS `bank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'empty.png',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `name`, `account_number`, `account_name`, `branch`, `image`, `created_at`, `updated_at`) VALUES
(1, 'BCA', '4533169999', 'PT. INTERNAL TEKSTILL GRUP', 'BANDUNG', '1453691017.png', '2016-01-24 20:02:15', '2016-01-25 06:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'empty.png',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Internal', '<p>Produk Internal</p>', '1455096146.png', '2016-02-10 08:46:55', '2016-02-10 09:22:26'),
(2, 'Lady Rose Disperse', '<p>sprei ladyrose disperse</p>', 'lady_rose_disperse.png', '2016-02-10 16:28:49', '2016-02-10 16:28:49'),
(3, 'Vallery', '<p>vallery sprei</p>', 'vallery.png', '2016-02-10 16:30:59', '2016-02-10 16:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `brand_product`
--

CREATE TABLE IF NOT EXISTS `brand_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_size_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `discount` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=216 ;

--
-- Dumping data for table `brand_product`
--

INSERT INTO `brand_product` (`id`, `brand_size_id`, `name`, `stock`, `price`, `weight`, `discount`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'MU (180x200)', 10, 124000, 1250, 0, '<p>Sprei internal Ukurang King</p>\r\n<p>180 x 200 B2</p>\r\n<p>Motif: Manchester United</p>', '2016-02-10 08:48:26', '2016-02-12 03:02:04'),
(2, 1, 'BARCA (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Barcelona</p>', '2016-02-10 08:50:22', '2016-02-12 02:59:15'),
(3, 1, 'USA FLAG (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : USA FLAG</p>', '2016-02-10 08:52:14', '2016-02-12 03:10:41'),
(27, 1, 'BARCODE (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Barcode</p>', '2016-02-12 03:15:37', '2016-02-12 03:16:24'),
(28, 1, 'CARISA (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Carisa</p>', '2016-02-12 03:17:28', '2016-02-12 03:17:28'),
(29, 1, 'BLUE LAGOON (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Blue Lagoon</p>', '2016-02-12 03:19:21', '2016-02-12 03:19:21'),
(30, 1, 'BLUE MOUNT (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Blue Mount</p>', '2016-02-12 03:21:55', '2016-02-12 03:21:55'),
(31, 1, 'CLAUDIA (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Claudia</p>', '2016-02-12 03:27:55', '2016-02-12 03:27:55'),
(32, 1, 'ENGLAND (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : England</p>', '2016-02-12 03:29:52', '2016-02-12 03:29:52'),
(33, 1, 'ESCADA (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Escada</p>', '2016-02-12 03:31:21', '2016-02-12 03:31:21'),
(34, 1, 'EVELYN (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Evelyn</p>', '2016-02-12 03:32:53', '2016-02-12 03:32:53'),
(35, 1, 'FIRE WORK (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Fire Work</p>', '2016-02-12 03:34:09', '2016-02-12 03:34:09'),
(36, 1, 'FOSFOR (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Fosfor</p>', '2016-02-12 03:34:48', '2016-02-12 03:34:48'),
(37, 1, 'GODIVA (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Godiva</p>', '2016-02-12 03:37:07', '2016-02-12 03:37:07'),
(38, 1, 'GREENHILL (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Greenhill</p>', '2016-02-12 03:38:44', '2016-02-12 03:38:44'),
(39, 1, 'HAWAI (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Hawai</p>', '2016-02-12 03:39:37', '2016-02-12 03:39:37'),
(40, 1, 'HOLIDAY (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Holiday</p>', '2016-02-12 03:41:44', '2016-02-12 03:41:44'),
(41, 1, 'ITALY (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Italy</p>', '2016-02-12 03:45:18', '2016-02-12 03:45:18'),
(42, 1, 'KENZO (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Kenzo</p>', '2016-02-12 03:49:14', '2016-02-12 03:49:14'),
(43, 1, 'LEAF (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Leaf</p>', '2016-02-12 03:51:38', '2016-02-12 03:51:38'),
(44, 1, 'OLIVIA (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Olivia</p>', '2016-02-12 03:53:35', '2016-02-12 03:53:35'),
(45, 1, 'PADMA (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Padma</p>', '2016-02-12 03:55:29', '2016-02-12 03:55:29'),
(46, 1, 'PRADA (180x200)', 10, 124000, 1250, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Prada</p>', '2016-02-12 03:57:01', '2016-02-12 03:57:01'),
(47, 3, 'BARCA ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Barcelona</p>', '2016-02-12 04:23:39', '2016-02-12 04:23:39'),
(48, 3, 'BARCODE ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Barcode</p>', '2016-02-12 04:24:47', '2016-02-12 04:24:47'),
(49, 3, 'BLUE LAGOON ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Blue Lagoon</p>', '2016-02-12 04:25:54', '2016-02-12 04:25:54'),
(50, 3, 'BLUE MOUNT ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Blue Mount</p>', '2016-02-12 04:27:16', '2016-02-12 04:27:16'),
(51, 3, 'CARISA ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Carisa</p>', '2016-02-12 07:46:27', '2016-02-12 07:46:27'),
(52, 3, 'CLAUDIA ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Claudia</p>', '2016-02-12 07:47:56', '2016-02-12 07:47:56'),
(53, 3, 'ENGLAND ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : England</p>', '2016-02-12 07:48:52', '2016-02-12 07:48:52'),
(54, 3, 'EVELYN ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Evelyn</p>', '2016-02-12 07:49:48', '2016-02-12 07:49:48'),
(55, 3, 'ESCADA ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Escada</p>', '2016-02-12 07:50:57', '2016-02-12 07:50:57'),
(56, 3, 'FIRE WORK ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Fire Work</p>', '2016-02-12 07:52:03', '2016-02-12 07:52:03'),
(57, 3, 'FOSFOR ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Fosfor</p>', '2016-02-12 07:54:04', '2016-02-12 07:54:04'),
(58, 3, 'GODIVA ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Godiva</p>', '2016-02-12 07:55:23', '2016-02-12 07:55:23'),
(59, 3, 'GREENHILL ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Greenhill</p>', '2016-02-12 07:56:24', '2016-02-12 07:56:24'),
(60, 3, 'HAWAI ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Hawai</p>', '2016-02-12 07:58:37', '2016-02-12 07:58:37'),
(61, 3, 'HOLIDAY ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Holiday</p>', '2016-02-12 08:52:32', '2016-02-12 08:52:32'),
(62, 3, 'ITALY ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Italy</p>', '2016-02-12 09:02:05', '2016-02-12 09:02:05'),
(63, 3, 'KENZO ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Kenzo</p>', '2016-02-12 09:03:42', '2016-02-12 09:03:42'),
(64, 3, 'LEAF ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Leaf</p>', '2016-02-12 09:06:14', '2016-02-12 09:06:14'),
(65, 3, 'MU ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Manchester United</p>', '2016-02-12 09:07:25', '2016-02-12 09:07:25'),
(66, 3, 'OLIVIA ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Olivia</p>', '2016-02-12 09:08:24', '2016-02-12 09:08:24'),
(67, 3, 'PADMA ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Sleeping Cat</p>', '2016-02-12 09:09:27', '2016-02-12 09:09:27'),
(68, 3, 'PRADA ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Prada</p>', '2016-02-12 09:10:28', '2016-02-12 09:10:28'),
(69, 3, 'USA FLAG ( 180x200 )', 10, 139000, 1300, 0, '<p>Sprei Internal Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Usa Flag</p>', '2016-02-12 09:11:21', '2016-02-12 09:11:21'),
(70, 4, 'BARCA ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Barcelona</p>', '2016-02-12 09:16:56', '2016-02-12 09:16:56'),
(71, 4, 'BARCODE ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Barcode</p>', '2016-02-12 09:18:59', '2016-02-12 09:18:59'),
(72, 4, 'BLUE LAGOON ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Blue Lagoon</p>', '2016-02-12 09:20:34', '2016-02-12 09:20:34'),
(73, 4, 'BLUE MOUNT ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Blue Mount</p>', '2016-02-12 09:21:29', '2016-02-12 09:21:29'),
(74, 4, 'CARISA ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Carisa</p>', '2016-02-13 01:26:20', '2016-02-13 01:26:53'),
(75, 4, 'ENGLAND ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : England</p>', '2016-02-13 01:28:00', '2016-02-13 01:28:00'),
(76, 4, 'ESCADA ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Escada</p>', '2016-02-13 01:28:54', '2016-02-13 01:28:54'),
(77, 4, 'CLAUDIA ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Claudia</p>', '2016-02-13 01:29:49', '2016-02-13 01:29:49'),
(78, 4, 'EVELYN ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Evelyn</p>', '2016-02-13 01:30:41', '2016-02-13 01:30:41'),
(79, 4, 'FIRE WORK ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Fire Work</p>', '2016-02-13 01:31:47', '2016-02-13 01:31:47'),
(80, 4, 'FOSFOR ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Fosfor</p>', '2016-02-13 01:33:32', '2016-02-13 01:33:32'),
(81, 4, 'GODIVA ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Godiva</p>', '2016-02-13 01:36:05', '2016-02-13 01:36:05'),
(82, 4, 'GREENHILL ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Greenhill</p>', '2016-02-13 01:37:15', '2016-02-13 01:37:15'),
(83, 4, 'HAWAI ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Hawai</p>', '2016-02-13 01:42:34', '2016-02-13 01:42:34'),
(84, 4, 'HOLIDAY ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Holiday</p>', '2016-02-13 06:34:13', '2016-02-13 06:45:18'),
(85, 4, 'ITALY ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Italy</p>', '2016-02-13 06:41:26', '2016-02-15 02:41:13'),
(86, 4, 'KENZO ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Kenzo</p>', '2016-02-15 02:40:26', '2016-02-15 02:41:33'),
(87, 4, 'LEAF ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Leaf</p>', '2016-02-15 02:42:32', '2016-02-15 02:42:32'),
(88, 4, 'MU ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : MU</p>', '2016-02-15 02:43:37', '2016-02-15 02:43:37'),
(89, 4, 'OLIVIA ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Olivia</p>', '2016-02-15 02:44:30', '2016-02-15 02:44:30'),
(90, 4, 'PADMA ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Padma</p>', '2016-02-15 02:45:17', '2016-02-15 02:45:17'),
(91, 4, 'PRADA ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Prada</p>', '2016-02-15 02:46:00', '2016-02-15 02:46:00'),
(92, 4, 'USA FLAG ( 160x200 )', 10, 122000, 1200, 0, '<p>Sprei Internal Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Usa Flag</p>', '2016-02-15 02:46:43', '2016-02-15 02:46:43'),
(93, 6, 'DORAEMON', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Doraemon</p>', '2016-02-15 03:11:38', '2016-02-15 03:11:38'),
(94, 6, 'BARBIE', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Barbie</p>', '2016-02-15 03:12:30', '2016-02-15 03:12:30'),
(95, 6, 'BARCA FCB', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Barca FCB</p>', '2016-02-15 03:13:29', '2016-02-15 03:13:29'),
(96, 6, 'BATMAN', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Batman</p>', '2016-02-15 03:14:38', '2016-02-15 03:14:38'),
(97, 6, 'HELLOKITTY CARMO', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Hellokitty Carmo</p>', '2016-02-15 03:15:24', '2016-02-15 03:15:24'),
(98, 6, 'CHELSEA FC', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Chelsea</p>', '2016-02-15 03:16:18', '2016-02-15 03:16:18'),
(99, 6, 'DC SUPER FRIENDS BLUE', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Dc Super Friends Blue</p>', '2016-02-15 03:17:21', '2016-02-15 03:17:21'),
(100, 6, 'DC SUPER FRIENDS YELLOW', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Dc Super Friends Yellow</p>', '2016-02-15 03:18:05', '2016-02-15 03:18:05'),
(101, 6, 'ENGLANDS', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Englands</p>', '2016-02-15 03:20:04', '2016-02-15 03:20:04'),
(102, 6, 'FLOWER', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Flower</p>', '2016-02-15 03:21:07', '2016-02-15 03:21:07'),
(103, 6, 'I LOVE NEW YORK', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : I love New York</p>', '2016-02-15 03:22:03', '2016-02-15 03:22:03'),
(104, 6, 'KEROPI', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Keropi</p>', '2016-02-15 03:22:57', '2016-02-15 03:22:57'),
(105, 6, 'LONDON CALLING', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : London Calling</p>', '2016-02-15 03:23:56', '2016-02-15 03:23:56'),
(106, 6, 'MU RED', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : MU Red</p>', '2016-02-15 03:24:52', '2016-02-15 03:24:52'),
(107, 6, 'PARIS', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Paris</p>', '2016-02-15 03:27:40', '2016-02-15 03:27:40'),
(108, 6, 'SPONGEBOB', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Spongebob</p>', '2016-02-15 03:29:02', '2016-02-15 03:29:02'),
(109, 6, 'TWEETY', 10, 125000, 1200, 0, '<p>Selimut Blanket Internal</p>\r\n<p>160x200</p>\r\n<p>Motif : Tweety</p>', '2016-02-15 03:30:00', '2016-02-15 03:30:00'),
(110, 5, 'BADTZ MARU ( 120x200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Badtz Maru</p>', '2016-02-15 03:46:31', '2016-02-15 03:53:17'),
(111, 5, 'BARCA ( 120x200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Barca</p>', '2016-02-15 03:49:43', '2016-02-15 03:52:59'),
(112, 5, 'BARCODE ( 120x200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Barcode</p>', '2016-02-15 03:52:46', '2016-02-15 03:52:46'),
(113, 5, 'HELLO KITTY MISSHUG ( 120x200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Hello Kitty Misshug</p>', '2016-02-15 03:55:20', '2016-02-15 03:55:20'),
(114, 5, 'LORENA ( 120x200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Lorena</p>', '2016-02-15 03:56:31', '2016-02-15 03:56:31'),
(115, 5, 'LOVELY ( 120x200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Lovely</p>', '2016-02-15 03:57:25', '2016-02-15 03:57:25'),
(116, 5, 'MONKEY ( 120x200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Monkey</p>', '2016-02-15 03:58:24', '2016-02-15 03:58:24'),
(117, 5, 'MU ( 120x200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Manchester United</p>', '2016-02-15 03:59:29', '2016-02-15 03:59:50'),
(118, 5, 'NICE ( 120x200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Nice</p>', '2016-02-15 04:00:38', '2016-02-15 04:00:38'),
(119, 5, 'USA ( 120X200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Usa</p>', '2016-02-15 04:02:13', '2016-02-15 04:02:13'),
(120, 5, 'VALERRY ( 120x200 )', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Valerry</p>', '2016-02-15 04:03:27', '2016-02-15 04:03:27'),
(121, 7, 'COFFEE ( 180x200 )', 10, 150000, 1350, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Coffee</p>', '2016-02-15 04:10:47', '2016-02-15 04:10:47'),
(122, 7, 'DARK RED ( 180x200 )', 10, 150000, 1350, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Dark Red</p>', '2016-02-15 04:12:13', '2016-02-15 04:12:13'),
(123, 7, 'DARK PURPLE ( 180x200 )', 10, 150000, 1350, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Dark Purple</p>', '2016-02-15 04:13:04', '2016-02-15 04:13:04'),
(124, 7, 'GOLDEN ( 180x200 )', 10, 150000, 1350, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Golden</p>', '2016-02-15 04:13:52', '2016-02-15 04:13:52'),
(125, 7, 'GREEN ( 180x200 )', 10, 150000, 1350, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Green</p>', '2016-02-15 04:14:39', '2016-02-15 04:14:39'),
(126, 7, 'LIGHT GREY ( 180x200 )', 10, 150000, 1350, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Light Grey</p>', '2016-02-15 04:15:58', '2016-02-15 04:15:58'),
(127, 7, 'RED ( 180x200 )', 10, 150000, 1350, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Red</p>', '2016-02-15 04:16:38', '2016-02-15 04:16:38'),
(128, 8, 'COFFEE (180x200)', 10, 162000, 1400, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Coffee</p>', '2016-02-15 05:50:06', '2016-02-15 05:50:06'),
(129, 8, 'DARK PURPLE (180x200)', 10, 162000, 1400, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Dark Purple</p>', '2016-02-15 05:53:26', '2016-02-15 05:53:26'),
(130, 8, 'DARK RED (180x200)', 10, 162000, 1400, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Dark Red</p>', '2016-02-15 05:55:17', '2016-02-15 05:55:17'),
(131, 8, 'GOLDEN (180x200)', 10, 162000, 1400, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Golden</p>', '2016-02-15 05:56:36', '2016-02-15 05:56:36'),
(132, 8, 'GREEN (180x200)', 10, 162000, 1400, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Green</p>', '2016-02-15 05:57:58', '2016-02-15 05:57:58'),
(133, 8, 'LIGHT GREY (180x200)', 10, 162000, 1400, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Light Grey</p>', '2016-02-15 06:03:58', '2016-02-15 06:03:58'),
(134, 8, 'RED (180x200)', 10, 162000, 1400, 0, '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Red</p>', '2016-02-15 06:05:09', '2016-02-15 06:05:09'),
(135, 9, 'COFFEE ( 160x200 )', 10, 148000, 1300, 0, '<p>Sprei Vallery Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Coffee</p>', '2016-02-15 06:11:30', '2016-02-15 06:11:30'),
(136, 9, 'DARK PURPLE ( 160x200 )', 10, 148000, 1300, 0, '<p>Sprei Vallery Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Dark Purple</p>', '2016-02-15 09:06:07', '2016-02-15 09:06:34'),
(137, 9, 'DARK RED ( 160x200 )', 10, 148000, 1300, 0, '<p>Sprei Vallery Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Dark Red</p>\r\n<p>&nbsp;</p>', '2016-02-16 03:43:42', '2016-02-16 03:45:51'),
(138, 9, 'GOLDEN ( 160x200 )', 10, 148000, 1300, 0, '<p>Sprei Vallery Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Golden</p>', '2016-02-16 03:47:40', '2016-02-16 03:47:40'),
(139, 9, 'GREEN ( 160x200 )', 10, 148000, 1300, 0, '<p>Sprei Vallery Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Green</p>', '2016-02-16 03:48:27', '2016-02-16 03:48:27'),
(140, 9, 'LIGHT GREY ( 160x200 )', 10, 148000, 1300, 0, '<p>Sprei Vallery Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Light Grey</p>', '2016-02-16 03:49:42', '2016-02-16 03:49:42'),
(141, 9, 'RED ( 160x200 )', 10, 148000, 1300, 0, '<p>Sprei Vallery Ukuran Queen</p>\r\n<p>160x200 B2</p>\r\n<p>Motif : Red</p>', '2016-02-16 03:50:37', '2016-02-16 03:50:37'),
(142, 10, 'COFFEE ( 120x200 )', 10, 105000, 900, 0, '<p>Sprei Vallery Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Coffee</p>', '2016-02-16 04:06:00', '2016-02-16 04:06:00'),
(143, 10, 'DARK PURPLE ( 120x200 )', 10, 105000, 900, 0, '<p>Sprei Vallery Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Dark purple</p>\r\n<p>&nbsp;</p>', '2016-02-16 08:44:53', '2016-02-16 08:45:24'),
(144, 10, 'DARK RED ( 120x200 )', 10, 105000, 900, 0, '<p>Sprei Vallery Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Dark Red</p>', '2016-02-16 08:46:40', '2016-02-16 08:46:40'),
(145, 10, 'GOLDEN ( 120x200 )', 10, 105000, 900, 0, '<p>Sprei Vallery Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Golden</p>', '2016-02-16 08:48:08', '2016-02-16 08:48:08'),
(146, 10, 'GREEN ( 120x200 )', 10, 105000, 900, 0, '<p>Sprei Vallery Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Green</p>', '2016-02-16 08:48:58', '2016-02-16 08:48:58'),
(147, 10, 'LIGHT GREY ( 120x200 )', 10, 105000, 900, 0, '<p>Sprei Vallery Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Light Grey</p>', '2016-02-16 08:50:51', '2016-02-16 08:50:51'),
(148, 10, 'RED ( 120x200 )', 10, 105000, 900, 0, '<p>Sprei Vallery Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Red</p>', '2016-02-16 08:51:32', '2016-02-16 08:51:32'),
(149, 11, 'ALILA ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Alila</p>', '2016-02-17 01:22:20', '2016-02-17 01:23:47'),
(150, 11, 'BARCELONA ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Barcelona</p>', '2016-02-17 01:25:18', '2016-02-17 01:25:18'),
(151, 11, 'BELLEZA ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Belleza</p>', '2016-02-17 01:26:13', '2016-02-17 01:26:13'),
(152, 11, 'DOLPHIN ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Dolphin</p>', '2016-02-17 01:27:50', '2016-02-17 01:27:50'),
(153, 11, 'EIFFEL TOWER ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Eiffel Tower</p>', '2016-02-17 02:02:52', '2016-02-17 02:03:46'),
(154, 11, 'HELLOKITTY PINK ( 180x200 )', 5, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Hellokitty Pink</p>', '2016-02-17 02:05:49', '2016-02-17 02:06:28'),
(155, 11, 'HELLOKITTY RED ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Hellokitty Red</p>', '2016-02-17 02:07:03', '2016-02-17 02:07:22'),
(156, 11, 'INDIGO ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Indigo</p>\r\n<p>&nbsp;</p>', '2016-02-17 02:08:40', '2016-02-17 02:08:40'),
(157, 11, 'JUVENTUS ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Juventus</p>', '2016-02-17 02:09:35', '2016-02-17 02:09:51'),
(158, 11, 'LAGUNA ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Laguna</p>', '2016-02-17 02:10:43', '2016-02-17 02:10:43'),
(159, 11, 'LAVANDE ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Lavande</p>', '2016-02-17 02:11:35', '2016-02-17 02:11:35'),
(160, 11, 'M.U ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : M.U</p>', '2016-02-17 02:12:50', '2016-02-17 02:12:50'),
(161, 11, 'MARBELA ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Marbela</p>', '2016-02-17 02:14:14', '2016-02-17 02:14:14'),
(162, 11, 'MONOLOG ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Monolog</p>', '2016-02-17 03:54:13', '2016-02-17 03:54:13'),
(163, 11, 'ORCHID ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Orchid</p>', '2016-02-17 03:55:17', '2016-02-17 03:55:17'),
(164, 11, 'PANDA ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Panda</p>', '2016-02-17 03:57:33', '2016-02-17 03:57:33'),
(165, 11, 'PEACOCK ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Peacock</p>', '2016-02-17 04:07:52', '2016-02-17 04:07:52'),
(166, 11, 'PEGASUS ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Pegasus</p>', '2016-02-17 04:08:51', '2016-02-17 04:08:51'),
(167, 11, 'PURPLE ROSE ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Purple Rose</p>', '2016-02-17 04:09:54', '2016-02-17 04:09:54'),
(168, 11, 'RED SAPHIRE ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Red Saphire</p>', '2016-02-17 04:10:48', '2016-02-17 04:11:02'),
(169, 11, 'ROMANTIC ROSE ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Romantic Rose</p>', '2016-02-17 04:12:30', '2016-02-17 04:12:30'),
(170, 11, 'SLEEPING CAT ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Sleeping Cat</p>', '2016-02-17 04:13:52', '2016-02-17 04:13:52'),
(171, 11, 'SWAN ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Swan</p>', '2016-02-17 04:14:40', '2016-02-17 04:14:40'),
(172, 11, 'TIFFANY ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Tiffany</p>', '2016-02-17 04:15:52', '2016-02-17 04:15:52'),
(173, 11, 'TIGER ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Tiger</p>', '2016-02-17 04:16:38', '2016-02-17 04:16:38'),
(174, 11, 'TROPIC ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Tropic</p>', '2016-02-17 04:17:23', '2016-02-17 04:17:23'),
(175, 11, 'VIVIAN ( 180x200 )', 10, 82000, 1250, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>\r\n<p>Motif : Vivian</p>', '2016-02-17 04:18:07', '2016-02-17 04:18:07'),
(176, 12, 'ALILA (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Alila</p>', '2016-02-17 04:20:40', '2016-02-17 04:20:40'),
(177, 12, 'BARCELONA (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Barcelona</p>', '2016-02-17 09:13:41', '2016-02-17 09:13:41'),
(178, 12, 'BELLEZA (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Belleza</p>', '2016-02-17 09:14:27', '2016-02-17 09:14:27'),
(179, 12, 'DOLPHIN (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Dolphin</p>', '2016-02-17 09:15:09', '2016-02-17 09:15:09'),
(180, 12, 'EIFFEL TOWER (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Eiffel Tower</p>', '2016-02-17 09:16:05', '2016-02-17 09:16:05'),
(181, 12, 'HELLOKITTY PINK (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Hellokitty Pink</p>', '2016-02-17 09:17:01', '2016-02-17 09:17:01'),
(182, 12, 'HELLOKITTY RED (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Hellokitty Red</p>', '2016-02-17 09:17:53', '2016-02-17 09:17:53'),
(183, 12, 'INDIGO (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Indigo</p>', '2016-02-17 09:18:42', '2016-02-17 09:18:42'),
(184, 12, 'JUVENTUS (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Juventus</p>', '2016-02-17 09:19:35', '2016-02-17 09:19:35'),
(185, 12, 'LAGUNA (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Laguna</p>', '2016-02-17 09:21:28', '2016-02-17 09:21:28'),
(186, 12, 'LAVANDE (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Lavande</p>', '2016-02-17 09:22:03', '2016-02-17 09:22:03'),
(187, 12, 'M.U (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Manchester United</p>', '2016-02-17 09:23:03', '2016-02-17 09:23:03'),
(188, 12, 'MARBELA (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Marbela</p>', '2016-02-17 09:23:51', '2016-02-17 09:23:51'),
(189, 12, 'MONOLOG (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Monolog</p>', '2016-02-17 09:24:41', '2016-02-17 09:24:41'),
(190, 12, 'ORCHID (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Orchid</p>', '2016-02-17 09:25:33', '2016-02-17 09:25:33'),
(191, 12, 'PANDA (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Panda</p>', '2016-02-18 03:52:22', '2016-02-18 03:52:22'),
(192, 12, 'PEACOCK (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Peacock</p>', '2016-02-18 06:05:58', '2016-02-18 06:05:58'),
(193, 12, 'PEGASUS (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Pegasus</p>', '2016-02-18 06:06:48', '2016-02-18 06:06:48'),
(194, 12, 'PURPLE ROSE (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Purple Rose</p>', '2016-02-18 06:08:29', '2016-02-18 06:08:29'),
(195, 12, 'RED SAPHIRE (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Red Saphire</p>', '2016-02-18 07:05:21', '2016-02-18 07:05:21'),
(196, 12, 'ROMANTIC ROSE (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Romantic Rose</p>', '2016-02-18 07:06:14', '2016-02-18 07:06:14'),
(197, 12, 'SLEEPING CAT (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Sleeping Cat</p>', '2016-02-18 07:07:04', '2016-02-18 07:07:04'),
(198, 12, 'SWAN (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Swan</p>', '2016-02-18 07:08:19', '2016-02-18 07:08:19'),
(199, 12, 'TIFFANY (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Tiffany</p>', '2016-02-18 07:08:59', '2016-02-18 07:08:59'),
(200, 12, 'TIGER (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Tiger</p>', '2016-02-18 07:09:39', '2016-02-18 07:09:39'),
(201, 12, 'TROPIC (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Tropic</p>', '2016-02-18 07:10:43', '2016-02-18 07:10:43'),
(202, 12, 'VIVIAN (180x200)', 10, 91000, 1300, 0, '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>\r\n<p>Motif : Vivian</p>', '2016-02-18 07:11:20', '2016-02-18 07:11:20'),
(203, 14, 'BADTZMARU ( 120x200 )', 0, 59500, 800, 0, '<p>Sprei Ladyrose Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Badtz Maru</p>', '2016-02-18 07:14:37', '2016-02-19 02:58:41'),
(204, 14, 'AVENGERS ( 120x200 )', 10, 59500, 800, 0, '<p>Sprei Ladyrose UKuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Avengers</p>', '2016-02-19 02:50:39', '2016-02-19 02:50:39'),
(205, 14, 'BATMAN ( 120x200 )', 0, 59500, 800, 0, '<p>Sprei Ladyrose UKuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Batman</p>', '2016-02-19 02:51:57', '2016-02-19 02:58:57'),
(206, 14, 'CARS ( 120x200 )', 10, 59500, 800, 0, '<p>Sprei Ladyrose UKuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Cars</p>', '2016-02-19 02:55:11', '2016-02-19 02:55:11'),
(207, 14, 'FROZEN ( 120x200 )', 0, 59500, 800, 0, '<p>Sprei Ladyrose UKuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Frozen</p>', '2016-02-19 02:59:25', '2016-02-19 02:59:49'),
(208, 14, 'NEMO ( 120x200 )', 0, 59500, 800, 0, '<p>Sprei Ladyrose UKuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Nemo</p>', '2016-02-19 03:00:40', '2016-02-19 03:00:40'),
(209, 14, 'WINNI THE POOH ( 120x200 )', 10, 59500, 800, 0, '', '2016-02-19 03:06:01', '2016-02-19 03:12:51'),
(210, 14, 'PRINCESS ( 120x200 )', 0, 59500, 800, 0, '<p>Sprei Ladyrose UKuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Princess</p>', '2016-02-19 03:12:12', '2016-02-19 03:12:12'),
(211, 14, 'STITCH ( 120x200 )', 10, 59500, 800, 0, '<p>Sprei Ladyrose Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Stitch</p>', '2016-02-19 08:30:27', '2016-02-19 08:30:27'),
(212, 14, 'SPIDERMAN ( 120x200 )', 10, 59500, 800, 0, '<p>Sprei Ladyrose Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Spiderman</p>', '2016-02-19 08:32:20', '2016-02-19 08:32:20'),
(213, 14, 'SUPERMAN ( 120x200 )', 0, 59500, 800, 0, '<p>Sprei Ladyrose Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Superman</p>', '2016-02-19 08:35:37', '2016-02-19 08:35:37'),
(214, 5, 'AVENGERS (120x200)', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Avengers</p>', '2016-02-20 02:30:53', '2016-02-20 02:30:53'),
(215, 5, 'BATMAN (120x200)', 10, 74000, 800, 0, '<p>Sprei Internal Ukuran Single</p>\r\n<p>120x200</p>\r\n<p>Motif : Batman</p>', '2016-02-20 02:33:22', '2016-02-20 02:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `brand_product_image`
--

CREATE TABLE IF NOT EXISTS `brand_product_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_product_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=218 ;

--
-- Dumping data for table `brand_product_image`
--

INSERT INTO `brand_product_image` (`id`, `brand_product_id`, `title`, `content`, `image`, `created_at`, `updated_at`) VALUES
(25, 2, NULL, NULL, '1455246077.jpg', '2016-02-12 03:01:17', '2016-02-12 03:01:17'),
(26, 1, NULL, NULL, '1455246215.jpg', '2016-02-12 03:03:36', '2016-02-12 03:03:36'),
(27, 3, NULL, NULL, '1455246691.jpg', '2016-02-12 03:11:31', '2016-02-12 03:11:31'),
(28, 28, NULL, NULL, '1455247112.jpg', '2016-02-12 03:18:32', '2016-02-12 03:18:32'),
(29, 29, NULL, NULL, '1455247203.jpg', '2016-02-12 03:20:03', '2016-02-12 03:20:03'),
(30, 30, NULL, NULL, '1455247378.jpg', '2016-02-12 03:22:58', '2016-02-12 03:22:58'),
(31, 27, NULL, NULL, '1455247420.jpg', '2016-02-12 03:23:40', '2016-02-12 03:23:40'),
(32, 31, NULL, NULL, '1455247723.jpg', '2016-02-12 03:28:43', '2016-02-12 03:28:43'),
(33, 32, NULL, NULL, '1455247836.jpg', '2016-02-12 03:30:36', '2016-02-12 03:30:36'),
(34, 33, NULL, NULL, '1455247933.jpg', '2016-02-12 03:32:13', '2016-02-12 03:32:13'),
(35, 34, NULL, NULL, '1455248000.jpg', '2016-02-12 03:33:20', '2016-02-12 03:33:20'),
(36, 35, NULL, NULL, '1455248139.jpg', '2016-02-12 03:35:40', '2016-02-12 03:35:40'),
(37, 36, NULL, NULL, '1455248178.jpg', '2016-02-12 03:36:18', '2016-02-12 03:36:18'),
(38, 37, NULL, NULL, '1455248270.jpg', '2016-02-12 03:37:50', '2016-02-12 03:37:50'),
(39, 38, NULL, NULL, '1455248424.jpg', '2016-02-12 03:40:24', '2016-02-12 03:40:24'),
(40, 39, NULL, NULL, '1455248459.jpg', '2016-02-12 03:40:59', '2016-02-12 03:40:59'),
(41, 40, NULL, NULL, '1455248543.jpg', '2016-02-12 03:42:24', '2016-02-12 03:42:24'),
(42, 41, NULL, NULL, '1455248752.jpg', '2016-02-12 03:45:53', '2016-02-12 03:45:53'),
(43, 42, NULL, NULL, '1455248997.jpg', '2016-02-12 03:49:57', '2016-02-12 03:49:57'),
(44, 43, NULL, NULL, '1455249147.jpg', '2016-02-12 03:52:28', '2016-02-12 03:52:28'),
(45, 44, NULL, NULL, '1455249269.jpg', '2016-02-12 03:54:29', '2016-02-12 03:54:29'),
(46, 45, NULL, NULL, '1455249376.jpg', '2016-02-12 03:56:16', '2016-02-12 03:56:16'),
(47, 46, NULL, NULL, '1455249451.jpg', '2016-02-12 03:57:31', '2016-02-12 03:57:31'),
(48, 47, NULL, NULL, '1455251043.jpg', '2016-02-12 04:24:04', '2016-02-12 04:24:04'),
(49, 49, NULL, NULL, '1455251172.jpg', '2016-02-12 04:26:12', '2016-02-12 04:26:12'),
(50, 48, NULL, NULL, '1455251190.jpg', '2016-02-12 04:26:30', '2016-02-12 04:26:30'),
(51, 50, NULL, NULL, '1455251265.jpg', '2016-02-12 04:27:45', '2016-02-12 04:27:45'),
(52, 51, NULL, NULL, '1455263225.jpg', '2016-02-12 07:47:05', '2016-02-12 07:47:05'),
(53, 52, NULL, NULL, '1455263296.jpg', '2016-02-12 07:48:16', '2016-02-12 07:48:16'),
(54, 53, NULL, NULL, '1455263353.jpg', '2016-02-12 07:49:13', '2016-02-12 07:49:13'),
(55, 54, NULL, NULL, '1455263406.jpg', '2016-02-12 07:50:06', '2016-02-12 07:50:06'),
(56, 55, NULL, NULL, '1455263482.jpg', '2016-02-12 07:51:22', '2016-02-12 07:51:22'),
(57, 56, NULL, NULL, '1455263540.jpg', '2016-02-12 07:52:20', '2016-02-12 07:52:20'),
(58, 57, NULL, NULL, '1455263678.jpg', '2016-02-12 07:54:38', '2016-02-12 07:54:38'),
(59, 58, NULL, NULL, '1455263748.jpg', '2016-02-12 07:55:48', '2016-02-12 07:55:48'),
(60, 59, NULL, NULL, '1455263806.jpg', '2016-02-12 07:56:46', '2016-02-12 07:56:46'),
(61, 60, NULL, NULL, '1455264078.jpg', '2016-02-12 08:01:18', '2016-02-12 08:01:18'),
(62, 61, NULL, NULL, '1455267187.jpg', '2016-02-12 08:53:07', '2016-02-12 08:53:07'),
(63, 62, NULL, NULL, '1455267790.jpg', '2016-02-12 09:03:10', '2016-02-12 09:03:10'),
(64, 63, NULL, NULL, '1455267853.jpg', '2016-02-12 09:04:13', '2016-02-12 09:04:13'),
(65, 64, NULL, NULL, '1455268003.jpg', '2016-02-12 09:06:43', '2016-02-12 09:06:43'),
(66, 65, NULL, NULL, '1455268070.jpg', '2016-02-12 09:07:50', '2016-02-12 09:07:50'),
(67, 66, NULL, NULL, '1455268130.jpg', '2016-02-12 09:08:50', '2016-02-12 09:08:50'),
(68, 67, NULL, NULL, '1455268192.jpg', '2016-02-12 09:09:52', '2016-02-12 09:09:52'),
(69, 68, NULL, NULL, '1455268247.jpg', '2016-02-12 09:10:47', '2016-02-12 09:10:47'),
(70, 69, NULL, NULL, '1455268301.jpg', '2016-02-12 09:11:41', '2016-02-12 09:11:41'),
(71, 70, NULL, NULL, '1455268635.jpg', '2016-02-12 09:17:15', '2016-02-12 09:17:15'),
(72, 71, NULL, NULL, '1455268769.jpg', '2016-02-12 09:19:29', '2016-02-12 09:19:29'),
(73, 72, NULL, NULL, '1455268854.jpg', '2016-02-12 09:20:54', '2016-02-12 09:20:54'),
(74, 73, NULL, NULL, '1455268908.jpg', '2016-02-12 09:21:48', '2016-02-12 09:21:48'),
(75, 74, NULL, NULL, '1455326841.jpg', '2016-02-13 01:27:22', '2016-02-13 01:27:22'),
(76, 75, NULL, NULL, '1455326902.jpg', '2016-02-13 01:28:22', '2016-02-13 01:28:22'),
(77, 76, NULL, NULL, '1455326957.jpg', '2016-02-13 01:29:17', '2016-02-13 01:29:17'),
(78, 77, NULL, NULL, '1455327008.jpg', '2016-02-13 01:30:08', '2016-02-13 01:30:08'),
(79, 78, NULL, NULL, '1455327062.jpg', '2016-02-13 01:31:02', '2016-02-13 01:31:02'),
(80, 79, NULL, NULL, '1455327138.jpg', '2016-02-13 01:32:18', '2016-02-13 01:32:18'),
(81, 80, NULL, NULL, '1455327319.jpg', '2016-02-13 01:35:19', '2016-02-13 01:35:19'),
(82, 81, NULL, NULL, '1455327388.jpg', '2016-02-13 01:36:28', '2016-02-13 01:36:28'),
(83, 82, NULL, NULL, '1455327471.jpg', '2016-02-13 01:37:51', '2016-02-13 01:37:51'),
(84, 83, NULL, NULL, '1455327868.jpg', '2016-02-13 01:44:29', '2016-02-13 01:44:29'),
(85, 84, NULL, NULL, '1455345656.jpg', '2016-02-13 06:40:56', '2016-02-13 06:40:56'),
(86, 85, NULL, NULL, '1455503991.jpg', '2016-02-15 02:39:51', '2016-02-15 02:39:51'),
(87, 86, NULL, NULL, '1455504120.jpg', '2016-02-15 02:42:00', '2016-02-15 02:42:00'),
(88, 87, NULL, NULL, '1455504188.jpg', '2016-02-15 02:43:08', '2016-02-15 02:43:08'),
(89, 88, NULL, NULL, '1455504238.jpg', '2016-02-15 02:43:58', '2016-02-15 02:43:58'),
(90, 89, NULL, NULL, '1455504290.jpg', '2016-02-15 02:44:50', '2016-02-15 02:44:50'),
(91, 90, NULL, NULL, '1455504336.jpg', '2016-02-15 02:45:36', '2016-02-15 02:45:36'),
(92, 91, NULL, NULL, '1455504379.jpg', '2016-02-15 02:46:19', '2016-02-15 02:46:19'),
(93, 92, NULL, NULL, '1455504438.jpg', '2016-02-15 02:47:18', '2016-02-15 02:47:18'),
(94, 93, NULL, NULL, '1455505916.jpg', '2016-02-15 03:11:56', '2016-02-15 03:11:56'),
(95, 94, NULL, NULL, '1455505969.jpg', '2016-02-15 03:12:49', '2016-02-15 03:12:49'),
(96, 95, NULL, NULL, '1455506030.jpg', '2016-02-15 03:13:50', '2016-02-15 03:13:50'),
(97, 96, NULL, NULL, '1455506097.jpg', '2016-02-15 03:14:57', '2016-02-15 03:14:57'),
(98, 97, NULL, NULL, '1455506141.jpg', '2016-02-15 03:15:41', '2016-02-15 03:15:41'),
(99, 98, NULL, NULL, '1455506202.jpg', '2016-02-15 03:16:42', '2016-02-15 03:16:42'),
(100, 99, NULL, NULL, '1455506258.jpg', '2016-02-15 03:17:38', '2016-02-15 03:17:38'),
(101, 100, NULL, NULL, '1455506369.jpg', '2016-02-15 03:19:29', '2016-02-15 03:19:29'),
(102, 101, NULL, NULL, '1455506432.jpg', '2016-02-15 03:20:33', '2016-02-15 03:20:33'),
(103, 102, NULL, NULL, '1455506488.jpg', '2016-02-15 03:21:28', '2016-02-15 03:21:28'),
(104, 103, NULL, NULL, '1455506548.jpg', '2016-02-15 03:22:28', '2016-02-15 03:22:28'),
(105, 104, NULL, NULL, '1455506603.jpg', '2016-02-15 03:23:24', '2016-02-15 03:23:24'),
(106, 105, NULL, NULL, '1455506660.jpg', '2016-02-15 03:24:21', '2016-02-15 03:24:21'),
(107, 106, NULL, NULL, '1455506713.jpg', '2016-02-15 03:25:13', '2016-02-15 03:25:13'),
(108, 107, NULL, NULL, '1455506892.jpg', '2016-02-15 03:28:12', '2016-02-15 03:28:12'),
(109, 108, NULL, NULL, '1455506970.jpg', '2016-02-15 03:29:30', '2016-02-15 03:29:30'),
(110, 109, NULL, NULL, '1455507017.jpg', '2016-02-15 03:30:17', '2016-02-15 03:30:17'),
(111, 110, NULL, NULL, '1455508018.jpg', '2016-02-15 03:46:58', '2016-02-15 03:46:58'),
(112, 111, NULL, NULL, '1455508205.jpg', '2016-02-15 03:50:05', '2016-02-15 03:50:05'),
(113, 112, NULL, NULL, '1455508422.jpg', '2016-02-15 03:53:42', '2016-02-15 03:53:42'),
(114, 113, NULL, NULL, '1455508545.jpg', '2016-02-15 03:55:45', '2016-02-15 03:55:45'),
(115, 114, NULL, NULL, '1455508608.jpg', '2016-02-15 03:56:48', '2016-02-15 03:56:48'),
(116, 115, NULL, NULL, '1455508664.jpg', '2016-02-15 03:57:44', '2016-02-15 03:57:44'),
(117, 116, NULL, NULL, '1455508722.jpg', '2016-02-15 03:58:42', '2016-02-15 03:58:42'),
(118, 117, NULL, NULL, '1455508810.jpg', '2016-02-15 04:00:10', '2016-02-15 04:00:10'),
(119, 118, NULL, NULL, '1455508875.jpg', '2016-02-15 04:01:15', '2016-02-15 04:01:15'),
(120, 119, NULL, NULL, '1455508953.jpg', '2016-02-15 04:02:33', '2016-02-15 04:02:33'),
(121, 120, NULL, NULL, '1455509064.jpg', '2016-02-15 04:04:24', '2016-02-15 04:04:24'),
(122, 121, NULL, NULL, '1455509477.jpg', '2016-02-15 04:11:18', '2016-02-15 04:11:18'),
(123, 122, NULL, NULL, '1455509547.jpg', '2016-02-15 04:12:27', '2016-02-15 04:12:27'),
(124, 123, NULL, NULL, '1455509602.jpg', '2016-02-15 04:13:23', '2016-02-15 04:13:23'),
(125, 124, NULL, NULL, '1455509646.jpg', '2016-02-15 04:14:06', '2016-02-15 04:14:06'),
(126, 125, NULL, NULL, '1455509713.jpg', '2016-02-15 04:15:13', '2016-02-15 04:15:13'),
(127, 126, NULL, NULL, '1455509769.jpg', '2016-02-15 04:16:10', '2016-02-15 04:16:10'),
(129, 127, NULL, NULL, '1455510136.jpg', '2016-02-15 04:22:16', '2016-02-15 04:22:16'),
(130, 128, NULL, NULL, '1455515495.jpg', '2016-02-15 05:51:35', '2016-02-15 05:51:35'),
(131, 129, NULL, NULL, '1455515651.jpg', '2016-02-15 05:54:11', '2016-02-15 05:54:11'),
(132, 130, NULL, NULL, '1455515762.jpg', '2016-02-15 05:56:02', '2016-02-15 05:56:02'),
(133, 131, NULL, NULL, '1455515817.jpg', '2016-02-15 05:56:57', '2016-02-15 05:56:57'),
(134, 132, NULL, NULL, '1455516168.jpg', '2016-02-15 06:02:48', '2016-02-15 06:02:48'),
(135, 133, NULL, NULL, '1455516257.jpg', '2016-02-15 06:04:17', '2016-02-15 06:04:17'),
(136, 135, NULL, NULL, '1455526625.jpg', '2016-02-15 08:57:05', '2016-02-15 08:57:05'),
(137, 136, NULL, NULL, '1455527220.jpg', '2016-02-15 09:07:00', '2016-02-15 09:07:00'),
(138, 137, NULL, NULL, '1455594415.jpg', '2016-02-16 03:46:55', '2016-02-16 03:46:55'),
(139, 138, NULL, NULL, '1455594476.jpg', '2016-02-16 03:47:56', '2016-02-16 03:47:56'),
(140, 139, NULL, NULL, '1455594538.jpg', '2016-02-16 03:48:58', '2016-02-16 03:48:58'),
(141, 140, NULL, NULL, '1455594605.jpg', '2016-02-16 03:50:05', '2016-02-16 03:50:05'),
(142, 141, NULL, NULL, '1455594658.jpg', '2016-02-16 03:50:58', '2016-02-16 03:50:58'),
(143, 142, NULL, NULL, '1455612233.jpg', '2016-02-16 08:43:53', '2016-02-16 08:43:53'),
(144, 143, NULL, NULL, '1455612355.jpg', '2016-02-16 08:45:55', '2016-02-16 08:45:55'),
(145, 144, NULL, NULL, '1455612416.jpg', '2016-02-16 08:46:57', '2016-02-16 08:46:57'),
(146, 145, NULL, NULL, '1455612504.jpg', '2016-02-16 08:48:24', '2016-02-16 08:48:24'),
(147, 146, NULL, NULL, '1455612561.jpg', '2016-02-16 08:49:21', '2016-02-16 08:49:21'),
(148, 147, NULL, NULL, '1455612665.jpg', '2016-02-16 08:51:05', '2016-02-16 08:51:05'),
(149, 148, NULL, NULL, '1455612705.jpg', '2016-02-16 08:51:45', '2016-02-16 08:51:45'),
(150, 149, NULL, NULL, '1455672274.jpg', '2016-02-17 01:24:34', '2016-02-17 01:24:34'),
(151, 150, NULL, NULL, '1455672336.jpg', '2016-02-17 01:25:36', '2016-02-17 01:25:36'),
(152, 151, NULL, NULL, '1455672432.jpg', '2016-02-17 01:27:12', '2016-02-17 01:27:12'),
(153, 152, NULL, NULL, '1455672487.jpg', '2016-02-17 01:28:07', '2016-02-17 01:28:07'),
(154, 153, NULL, NULL, '1455674683.jpg', '2016-02-17 02:04:43', '2016-02-17 02:04:43'),
(155, 154, NULL, NULL, '1455674769.jpg', '2016-02-17 02:06:09', '2016-02-17 02:06:09'),
(156, 155, NULL, NULL, '1455674890.jpg', '2016-02-17 02:08:10', '2016-02-17 02:08:10'),
(157, 156, NULL, NULL, '1455674942.jpg', '2016-02-17 02:09:02', '2016-02-17 02:09:02'),
(158, 157, NULL, NULL, '1455675015.jpg', '2016-02-17 02:10:15', '2016-02-17 02:10:15'),
(159, 158, NULL, NULL, '1455675067.jpg', '2016-02-17 02:11:07', '2016-02-17 02:11:07'),
(160, 159, NULL, NULL, '1455675122.jpg', '2016-02-17 02:12:02', '2016-02-17 02:12:02'),
(161, 160, NULL, NULL, '1455675204.jpg', '2016-02-17 02:13:24', '2016-02-17 02:13:24'),
(162, 161, NULL, NULL, '1455675273.jpg', '2016-02-17 02:14:33', '2016-02-17 02:14:33'),
(163, 162, NULL, NULL, '1455681277.jpg', '2016-02-17 03:54:37', '2016-02-17 03:54:37'),
(164, 163, NULL, NULL, '1455681341.jpg', '2016-02-17 03:55:41', '2016-02-17 03:55:41'),
(165, 164, NULL, NULL, '1455682026.jpg', '2016-02-17 04:07:06', '2016-02-17 04:07:06'),
(166, 165, NULL, NULL, '1455682091.jpg', '2016-02-17 04:08:11', '2016-02-17 04:08:11'),
(167, 166, NULL, NULL, '1455682154.jpg', '2016-02-17 04:09:14', '2016-02-17 04:09:14'),
(168, 167, NULL, NULL, '1455682218.jpg', '2016-02-17 04:10:18', '2016-02-17 04:10:18'),
(169, 168, NULL, NULL, '1455682301.jpg', '2016-02-17 04:11:41', '2016-02-17 04:11:41'),
(170, 169, NULL, NULL, '1455682371.jpg', '2016-02-17 04:12:51', '2016-02-17 04:12:51'),
(171, 170, NULL, NULL, '1455682451.jpg', '2016-02-17 04:14:11', '2016-02-17 04:14:11'),
(172, 171, NULL, NULL, '1455682500.jpg', '2016-02-17 04:15:00', '2016-02-17 04:15:00'),
(173, 172, NULL, NULL, '1455682568.jpg', '2016-02-17 04:16:09', '2016-02-17 04:16:09'),
(174, 173, NULL, NULL, '1455682616.jpg', '2016-02-17 04:16:56', '2016-02-17 04:16:56'),
(175, 174, NULL, NULL, '1455682659.jpg', '2016-02-17 04:17:39', '2016-02-17 04:17:39'),
(176, 175, NULL, NULL, '1455682707.jpg', '2016-02-17 04:18:27', '2016-02-17 04:18:27'),
(177, 176, NULL, NULL, '1455682857.jpg', '2016-02-17 04:20:57', '2016-02-17 04:20:57'),
(178, 177, NULL, NULL, '1455700433.jpg', '2016-02-17 09:13:53', '2016-02-17 09:13:53'),
(179, 178, NULL, NULL, '1455700481.jpg', '2016-02-17 09:14:42', '2016-02-17 09:14:42'),
(180, 179, NULL, NULL, '1455700522.jpg', '2016-02-17 09:15:22', '2016-02-17 09:15:22'),
(181, 180, NULL, NULL, '1455700580.jpg', '2016-02-17 09:16:20', '2016-02-17 09:16:20'),
(182, 181, NULL, NULL, '1455700635.jpg', '2016-02-17 09:17:15', '2016-02-17 09:17:15'),
(183, 182, NULL, NULL, '1455700694.jpg', '2016-02-17 09:18:14', '2016-02-17 09:18:14'),
(184, 183, NULL, NULL, '1455700735.jpg', '2016-02-17 09:18:55', '2016-02-17 09:18:55'),
(185, 184, NULL, NULL, '1455700791.jpg', '2016-02-17 09:19:52', '2016-02-17 09:19:52'),
(186, 185, NULL, NULL, '1455700901.jpg', '2016-02-17 09:21:41', '2016-02-17 09:21:41'),
(187, 186, NULL, NULL, '1455700938.jpg', '2016-02-17 09:22:18', '2016-02-17 09:22:18'),
(188, 187, NULL, NULL, '1455700997.jpg', '2016-02-17 09:23:17', '2016-02-17 09:23:17'),
(189, 188, NULL, NULL, '1455701048.jpg', '2016-02-17 09:24:08', '2016-02-17 09:24:08'),
(190, 189, NULL, NULL, '1455701097.jpg', '2016-02-17 09:24:57', '2016-02-17 09:24:57'),
(191, 190, NULL, NULL, '1455701148.jpg', '2016-02-17 09:25:48', '2016-02-17 09:25:48'),
(192, 191, NULL, NULL, '1455775475.jpg', '2016-02-18 06:04:40', '2016-02-18 06:04:40'),
(193, 192, NULL, NULL, '1455775576.jpg', '2016-02-18 06:06:16', '2016-02-18 06:06:16'),
(194, 193, NULL, NULL, '1455775628.jpg', '2016-02-18 06:07:09', '2016-02-18 06:07:09'),
(195, 194, NULL, NULL, '1455779078.jpg', '2016-02-18 07:04:39', '2016-02-18 07:04:39'),
(196, 195, NULL, NULL, '1455779137.jpg', '2016-02-18 07:05:37', '2016-02-18 07:05:37'),
(197, 196, NULL, NULL, '1455779193.jpg', '2016-02-18 07:06:33', '2016-02-18 07:06:33'),
(198, 197, NULL, NULL, '1455779242.jpg', '2016-02-18 07:07:22', '2016-02-18 07:07:22'),
(199, 198, NULL, NULL, '1455779311.jpg', '2016-02-18 07:08:32', '2016-02-18 07:08:32'),
(200, 199, NULL, NULL, '1455779352.jpg', '2016-02-18 07:09:12', '2016-02-18 07:09:12'),
(201, 200, NULL, NULL, '1455779394.jpg', '2016-02-18 07:09:54', '2016-02-18 07:09:54'),
(202, 201, NULL, NULL, '1455779457.jpg', '2016-02-18 07:10:57', '2016-02-18 07:10:57'),
(203, 203, NULL, NULL, '1455779709.jpg', '2016-02-18 07:15:09', '2016-02-18 07:15:09'),
(205, 204, NULL, NULL, '1455850265.jpg', '2016-02-19 02:51:06', '2016-02-19 02:51:06'),
(206, 205, NULL, NULL, '1455850330.jpg', '2016-02-19 02:52:10', '2016-02-19 02:52:10'),
(207, 206, NULL, NULL, '1455850533.jpg', '2016-02-19 02:55:33', '2016-02-19 02:55:33'),
(208, 207, NULL, NULL, '1455850812.jpg', '2016-02-19 03:00:12', '2016-02-19 03:00:12'),
(209, 208, NULL, NULL, '1455850858.jpg', '2016-02-19 03:00:58', '2016-02-19 03:00:58'),
(210, 209, NULL, NULL, '1455851492.jpg', '2016-02-19 03:11:32', '2016-02-19 03:11:32'),
(211, 210, NULL, NULL, '1455851553.jpg', '2016-02-19 03:12:33', '2016-02-19 03:12:33'),
(212, 202, NULL, NULL, '1455853911.jpg', '2016-02-19 03:51:51', '2016-02-19 03:51:51'),
(213, 211, NULL, NULL, '1455870652.jpg', '2016-02-19 08:30:52', '2016-02-19 08:30:52'),
(214, 212, NULL, NULL, '1455870765.jpg', '2016-02-19 08:32:45', '2016-02-19 08:32:45'),
(215, 213, NULL, NULL, '1455870955.jpg', '2016-02-19 08:35:55', '2016-02-19 08:35:55'),
(216, 214, NULL, NULL, '1455935482.jpg', '2016-02-20 02:31:22', '2016-02-20 02:31:22'),
(217, 215, NULL, NULL, '1455935688.jpg', '2016-02-20 02:34:48', '2016-02-20 02:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `brand_size`
--

CREATE TABLE IF NOT EXISTS `brand_size` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `brand_size`
--

INSERT INTO `brand_size` (`id`, `brand_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'KING B2', 'Internal King Uk 180x200 B2', '2016-02-10 08:47:32', '2016-02-11 04:13:16'),
(3, 1, 'KING B4', '<p>Internal King Uk 180x200 B4</p>', '2016-02-11 04:14:33', '2016-02-11 04:14:33'),
(4, 1, 'QUEEN B2', '<p>Internal Queen Uk 160x200 B2</p>', '2016-02-11 04:15:59', '2016-02-11 04:15:59'),
(5, 1, 'SINGLE', '<p>Internal Single Uk 120x200 </p>', '2016-02-11 04:16:42', '2016-02-11 04:16:42'),
(6, 1, 'SELIMUT BLANKET', '<p>Internal Selimut Blanket Uk 160x200</p>', '2016-02-11 04:17:12', '2016-02-11 04:17:12'),
(7, 3, 'KING B2', '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B2</p>', '2016-02-15 04:06:10', '2016-02-15 04:06:10'),
(8, 3, 'KING B4', '<p>Sprei Vallery Ukuran King</p>\r\n<p>180x200 B4</p>', '2016-02-15 04:07:04', '2016-02-15 04:07:04'),
(9, 3, 'QUEEN B2', '<p>Sprei Vallery Ukuran Queen</p>\r\n<p>160x200 B2</p>', '2016-02-15 04:07:48', '2016-02-15 04:07:48'),
(10, 3, 'SINGLE', '<p>Sprei Vallery Ukuran Single</p>\r\n<p>120x200</p>', '2016-02-15 04:08:10', '2016-02-15 04:08:10'),
(11, 2, 'KING B2', '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B2</p>', '2016-02-16 08:55:57', '2016-02-16 08:55:57'),
(12, 2, 'KING B4', '<p>Sprei Ladyrose Ukuran King</p>\r\n<p>180x200 B4</p>', '2016-02-16 08:56:32', '2016-02-16 08:56:32'),
(13, 2, 'QUEEN B2', '<p>Sprei Ladyrose Ukuran Queen</p>\r\n<p>160x200 B2</p>', '2016-02-16 08:57:32', '2016-02-16 08:57:32'),
(14, 2, 'SINGLE', '<p>Sprei Ladyrose Ukuran Single</p>\r\n<p>120x200</p>', '2016-02-16 08:58:03', '2016-02-16 08:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `brand_size_image`
--

CREATE TABLE IF NOT EXISTS `brand_size_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_size_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE IF NOT EXISTS `buyer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `point` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=53 ;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`id`, `name`, `address`, `phone_number`, `email`, `message`, `point`, `password`, `email_code`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Abraham Lincoln', 'Bandung', '022123456789', 'abraham.lincoln@usa.com', 'To do list: Nothing.', 19, '$2y$10$R0wG4ayg7yQCuis8pBv1UORP6ODNJjnoLQUhKBHgKn5a3bEkMDQSu', '', 1, 'JEVsmtGq3wCjJJykjCVSPwODGJ4otMncZB8khSVlWAeNYupbdAMwYLIlSjLl', '2015-11-13 00:55:18', '2016-03-12 03:55:32'),
(10, 'fazrin', 'Bandung', '089654211116', 'fazriin@gmail.com', NULL, 0, '$2y$10$L/Xq3bXe2RWvcqtIBrtua.05N37XOCxeISZdNb/xqc/2UV6PwTIbW', 'EC1217120461', 0, NULL, '2016-01-20 07:31:18', '2016-01-20 07:31:18'),
(16, 'Hani', 'Kp rawa bacang jln bakti 2 no 56 rt 006 rw 012 jatirahayu pondok melati bekasi', '081318314756', 'hani@mcf.co.id', NULL, 0, '$2y$10$NmcglKQC.hhuTapYrlO4d.l19ep3IY.MW9RW8L4tzMBF6kTTFje5K', 'EC4510182579', 1, NULL, '2016-02-16 06:58:04', '2016-02-16 06:58:04'),
(17, 'Lia', 'Jl. Kalimasada X/26, Malang', '081334480449', 'nkhamelya@yahoo.com', NULL, 0, '$2y$10$iZmOYSWmmGgTYeFg/SZHduCBqQS92nlPpjwvyWmXfRYDLfLLG1pnu', 'EC5214513442', 1, NULL, '2016-02-16 09:11:32', '2016-02-16 09:11:32'),
(18, 'Iis', 'Cimareme', '081221257882', 'iis04@hayoo.co.id', NULL, 0, '$2y$10$CkpDR3h6Lf0w5FOsJylwvuvFwM.yaelGg9OX1P6bcbYYB3/6PM/l.', 'EC7647940844', 1, NULL, '2016-02-17 03:46:34', '2016-02-17 03:46:34'),
(19, 'erwin', 'jalan astana anyar 169A (sebelah agen gas elpiji 3kg)', '08562223914', 'erwin_limawan@yahoo.com', NULL, 0, '$2y$10$107vFc0QnZ5CdhAjG4DItu8mDMhEcBo1BLgz.aLTSNFakgzI80fY6', 'EC1051333406', 1, 'EzM5mOSlijkgtaDRC9fYnT39985F5ZuJ5qEpzA4kDOW6U7NbUDrHxCnovUJb', '2016-02-17 04:19:26', '2016-02-18 07:04:46'),
(20, 'septya', 'Kamp. Rawadas Rt. 001 Rw. 03 No. 136/21 Kel. Pondok Kopi, Kec. Duren Sawit Jakarta timur 13460', '081908099092', 'septyar92@gmail.com', NULL, 0, '$2y$10$SYRwQKljX.rhUVj3Mzzxoe5.89XgpDHramx3cZQ5.qqzKUc.1zczS', 'EC2508836133', 1, NULL, '2016-02-17 17:24:53', '2016-02-17 17:24:53'),
(21, 'Baby mutakharah', 'Jl.kampung tipar blok CF1/6 rt.03 rw.07 kompleks billymoon kalimalang duren sawit jkt-timur', '081243382669', 'Miss.beiiby@gmail.com', NULL, 0, '$2y$10$1ihnbRNmsGhpT5mkRjufEeD1g7ZzFDNmlnhUzaNbrKEUAPjvxdIPy', 'EC7661822764', 1, NULL, '2016-02-18 05:08:24', '2016-02-18 05:08:24'),
(25, 'Icha', 'Tonjong timur depan koramil 09 brebes 52271', '085700052788', 'Dararaisha@gmail.com', NULL, 0, '$2y$10$DhgYWQ6ScqZVc3oo0ADwIu7AS.JqRusE4AIpX0j93Qjxcg4JxiiRm', 'EC5514936526', 1, NULL, '2016-02-18 23:16:45', '2016-02-18 23:16:45'),
(27, 'editha', 'Jl.Letjen Suprapto 504C (Medilab) Jakarta 10530', '085959267774', 'editnathalia@yahoo.com', NULL, 0, '$2y$10$FtnVwsQzdvJMuvbYEyXg4uR84Fo1DXihjIXBdq1Gwoi/X3I3a0Uwq', 'EC4376815000', 1, NULL, '2016-02-20 02:52:22', '2016-02-20 02:52:22'),
(28, 'Christ Abraham', 'Kopo Permai IV 22B/5', '085722807777', 'christabraham@gmail.com', NULL, 0, '$2y$10$FoTQsYIvBjaferDebJrlZuKTjRTCB3loBnFwnH5.l02g6e9160.Cu', 'EC3763984530', 1, 'TDPa5gLhVed3ddB7oJ1gtXwb950JTN5jDkW1TgsCPmCBAeVjaA39uuMXOTCD', '2016-02-20 15:21:22', '2016-03-07 09:01:55'),
(29, 'Dyan Sapti Permata Sari', 'Perum. Griya Asri Blok O No.75 Rt/Rw 018/007, Pulokerto, Gandus, Palembang 30149', '081367348767', 'dyanblue_derumput@yahoo.co.id', NULL, 0, '$2y$10$8BHKxwhp8w260/uCQWnRauusNC9LybWrj3MHsKTj4Q5f1Gue19aBe', 'EC3136374656', 1, NULL, '2016-02-21 12:00:24', '2016-02-21 12:00:24'),
(30, 'nurhayati', 'jl Cijagra 1 ', '081910294498', 'enurhayati462@gmail.com', NULL, 0, '$2y$10$2X6hmztl5I1tsMmXm3HN4Oze3ap4ku/N2R5HODdiWele0O79qtcYa', 'EC2505058351', 1, 'WmJwOOSWKM6Q3O3mk6JQ00fH9CDjik0Eo2NTsiuGWAbdcenoY4tC9u19U8ec', '2016-02-22 05:49:54', '2016-02-22 06:35:55'),
(31, 'IRVAN', 'jl Radio Dalam', '081910294498', 'irvan.itg@gmail.com', NULL, 0, '$2y$10$aCXeClBVyquxfR88rIkKx.LA1WsBoQXIi2/v9cPSbBxPCiFmnqvia', 'EC1357389410', 1, 'rNFayp6riLQW6t6F7uPMC4yRLp2NwA4kUboAkVTKLx0PqB4L7aL6wwjGOrJO', '2016-02-22 06:38:51', '2016-02-24 01:55:46'),
(33, 'Syarifah', 'Ds.Sumber bhakti ketapang barat kecamatan ketapang kab sampang madura jawa timur 69261', '085230837411', 'syarifah.ifa25@gmail.com', NULL, 0, '$2y$10$44VmasqXht3ScENvqF1K/.FxgziS5wqCUsRsOQOkC7iNBPseU6z92', 'EC9154605701', 1, NULL, '2016-02-22 13:04:27', '2016-02-22 13:04:27'),
(34, 'Ghea Chandra Pramitha', 'Jl. a. yani no. 496 rt. 22 ', '081258506233', 'gheapramitha92@gmail.com', NULL, 0, '$2y$10$TtwXNW4DQeBm/m5U9P9OA.wjgXKM2LvhM.La5QTJBFi3NVtWC4cfC', 'EC4329823662', 1, NULL, '2016-02-23 09:24:35', '2016-02-23 09:24:35'),
(35, 'Sariyana', 'Jl. Martadinata 19 (Rumah bukit) Kota Mamuju, Sulawesi Barat', '081356035557', 'sariyana.rahmat@gmail.com', NULL, 0, '$2y$10$vWWT2N5zdL9QgxtHiVvD9Oy0E8I2OzRXOulCDfo4NgUi7wOme8BAS', 'EC7264944938', 1, NULL, '2016-02-24 09:13:11', '2016-02-24 09:13:11'),
(36, 'junkiati', 'cendana residence blok G6/26 Rt/Rw. 03/23 pondok benda-pamulang Tangsel Banten 15416', '089636963622', 'ursula_junkiati@yahoo.com', NULL, 0, '$2y$10$BZY4efiLxHMhK/f3C2IOFulcpwC3UyfY.cKwYRv/7oMi/xWRd88CW', 'EC3173083239', 1, NULL, '2016-02-24 11:10:34', '2016-02-24 11:10:34'),
(37, 'Rika Rosalina', 'Kav. Nusa indah no. 64, rancamanyar, ters. Cibaduyut, bandung', '811233459', 'ntta.rosalina@gmail.com', NULL, 0, '$2y$10$WF47pV/bF1IZEqvV7OVFn.9hz6.AqhoKMzzMq8k8szCxrGFwsp4/O', 'EC7069093401', 1, NULL, '2016-02-25 08:41:50', '2016-02-25 08:41:50'),
(38, 'Lyana Orwal', 'Woloklaus kelurahan lewoleba utara, kec.nubatukan kab.lembata nusa tenggara timur', '082237506699', 'lyanaorwal@yahoo.co.id', NULL, 0, '$2y$10$eHX6pnuLcU.PnIfVkd/iGO87A5IxnLfTab0C6i79DbdLeDqNrx6NG', 'EC6488912484', 0, NULL, '2016-02-25 15:42:58', '2016-02-25 15:42:58'),
(39, 'fazrin', 'Bekasi', '089654211116', 'fazrin@bisnis.com', NULL, 0, '$2y$10$XGxNHDbMFCRryVebh.vFsefZ2eJgOWx/epCc5zB.iIyW8Ao36Rch6', 'EC3004648790', 1, 'abp34zEhZ2icoAh0uGjRIRVqQyWa3EVp2KAoUxm9RGwAhvsKmwpvGEeg6NvB', '2016-02-26 09:42:29', '2016-02-26 09:55:54'),
(40, 'yayuk', 'jl condet raya no.77 D East Residence Kav.39 B Jakarta Timur', '087878113100', 'yayuksardjono@yahoo.com', NULL, 0, '$2y$10$dJ4JzcnN88vd0es6tU3uCuon5C/w2hFaZjkhcrqdBCW.ny/wR3X0y', 'EC7447819805', 1, NULL, '2016-02-26 09:59:57', '2016-02-26 10:00:58'),
(41, 'rachel', 'manado', '081343830441', 'racheluguy19@gmail.com', NULL, 0, '$2y$10$RCxCoKJGD2hv8avIno5x3u4Ezr8aJEVReQ2MehCozssBTnrOta2te', 'EC3166997302', 0, NULL, '2016-02-27 12:16:18', '2016-02-27 12:16:18'),
(42, 'Helen Susilawati', 'Komplek Paspampres, Jl. Pipit 2, Blok L no. 3 Rt 006 / Rw 006 Kel. Kampung Tengah, Kec. Kramat Jati - Jakarta Timur 13540', '085777953600', 'helen.zeenaga@gmail.com', NULL, 0, '$2y$10$dH66EXwOMTo9QvFSbGCG2ehuuRi8NCQSiXl8wum8NkjZbjen3RjdC', 'EC8975015001', 1, NULL, '2016-02-28 10:06:15', '2016-02-28 10:10:14'),
(43, 'Nisrina', 'jln. gatot subroto IV no. 21 kel. Ujung Pandang Baru. Kec.  Tallo. makassar', '085341143310', 'reynabakri05@gmail.com', NULL, 0, '$2y$10$.lZmYkP/tz.vq.XIezqWY.B6JD6LS4uQpvO3L8UphMu6L4URXdSDu', 'EC1962216630', 0, NULL, '2016-03-07 05:20:18', '2016-03-07 05:20:18'),
(44, 'erly yunita', 'jl.pulau natuna kompleks TPI, Kel.Gebangrejo, Kec.Poso Kota', '082347364789', 'chaya_chen@yahoo.com', NULL, 0, '$2y$10$JTQVNtc9ILqA2vDsBmjH8.Bo55RFHycLijdAP5aYBvbN5ojwzNJj2', 'EC7578775181', 1, NULL, '2016-03-07 12:19:44', '2016-03-07 12:20:47'),
(45, 'ety', 'Jl. Bhayangkara No.20 Surakarta', '081280681097', 'etychoi90@gmail.com', NULL, 0, '$2y$10$Mc9HkeoyxnDN/gvYnFVUH.Uqk3hC3DF.nLNlVwnCHBJYmdbkWt7nW', 'EC2826570182', 0, NULL, '2016-03-11 06:21:27', '2016-03-11 06:21:27'),
(46, 'Hakkam', 'Depok', '081586902223', 'exertmediatech@gmail.com', NULL, 0, '$2y$10$w1tx1Nmz2CtNZePBkF0q4OMbKUuD6x0ZASNetzOyScSPC/yeVEfXi', 'EC3611414907', 0, NULL, '2016-03-11 10:50:02', '2016-03-11 10:50:02'),
(47, 'yogi', 'jln mekar agung 8 bandung', '08111661188', 'yogi9des@gmail.com', NULL, 0, '$2y$10$xrRsCupiumMrGa2CF.K0KOO1uHBbae9P5gqSfpT5DBkj34QTNopsy', 'EC6572166726', 0, NULL, '2016-03-11 11:54:55', '2016-03-11 11:54:55'),
(50, 'Wade', 'Jakarta', '021123456789', 'nuril@idekreatif.id', NULL, 0, '$2y$10$h5VPWFpvXnhIuR1E8CuqYORYHPF/o6dzl.YZiFXLrgHf4vOc2a9a6', 'EC7625252943', 1, 'Ne9YYQX6WXfXaHS2VKns8lLFWQnyYUAp4dXydPZMVjwC66EGazXq9d8aF9zx', '2016-03-12 04:06:46', '2016-03-12 04:10:42'),
(51, 'Christ Abraham', 'Kopo Permai IV 22B/5', '085722807777', 'jesus_cover_me@yahoo.com', NULL, 0, '$2y$10$24cZzkOTDY0G7XUM.toG4eoT1JG/5tVOsQGlaXNh6iBMDlu/Roy1y', 'EC5494179128', 0, NULL, '2016-03-13 06:17:17', '2016-03-13 06:17:17'),
(52, 'Bima Akbariadi', 'Duren Sawit, Jakarta Timur', '081399103332', 'bima.cantona@gmail.com', NULL, 0, '$2y$10$zARrMTHsVL5XI.cP2XUO/u1phQ7nv55g/wqURvcEhVZTSgTi8p0gu', 'EC1879818033', 1, NULL, '2016-03-14 04:44:43', '2016-03-14 04:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `buyer_custom`
--

CREATE TABLE IF NOT EXISTS `buyer_custom` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `buyer_custom`
--

INSERT INTO `buyer_custom` (`code`, `name`, `address`, `phone_number`, `email`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Rika Rosalina', 'Kav. Nusa indah no. 64, rancamanyar, ters. Cibaduyut, bandung', '0811233459', 'ntta.rosalina@gmail.com', '', '2016-02-29 05:37:45', '2016-02-29 05:37:45');

-- --------------------------------------------------------

--
-- Table structure for table `buyer_voucher`
--

CREATE TABLE IF NOT EXISTS `buyer_voucher` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `buyer_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `buyer_voucher_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `home_image`
--

CREATE TABLE IF NOT EXISTS `home_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'empty.png',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `home_image`
--

INSERT INTO `home_image` (`id`, `title`, `name`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 'One', '', '<p>one</p>', '1453280181.jpg', '2016-01-18 22:01:01', '2016-01-20 08:56:21'),
(2, 'Two', '', '<p>TWO</p>', '1453280103.jpg', '2016-01-18 22:01:59', '2016-01-20 08:55:03'),
(3, 'Three', '', '<p>TRE</p>', '1453280255.jpg', '2016-01-18 22:02:18', '2016-01-20 08:57:35'),
(4, 'Four', '', '<p>EMPAT</p>', '1453280314.jpg', '2016-01-18 22:02:36', '2016-01-20 08:58:34'),
(5, 'Five', '', '<p>LIMA</p>', '1453280372.jpg', '2016-01-18 22:08:10', '2016-01-20 08:59:33'),
(6, 'SIX', '', '<p>SIX</p>', '1453280436.jpg', '2016-01-20 09:00:36', '2016-01-20 09:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_10_15_013614_create_table_admin', 1),
('2015_10_15_013714_create_table_brand', 1),
('2015_10_15_013759_create_table_brand-size', 1),
('2015_10_15_013859_create_table_brand-product', 1),
('2015_10_15_014145_create_table_buyer', 1),
('2015_10_15_014435_create_table_order-main', 1),
('2015_10_15_014502_create_table_order-list', 1),
('2015_10_15_014601_create_table_order-confirm', 1),
('2015_10_15_022657_create_table_order-shipping', 1),
('2015_10_15_022904_create_table_buyer_voucher', 1),
('2015_10_24_063737_add_column_remember-token_buyer', 1),
('2015_10_26_035035_add_column_password_buyer', 1),
('2015_10_27_031207_add_column_buyer-custom-id_order-main', 1),
('2015_10_27_031256_create_table_buyer-custom', 1),
('2015_10_27_070454_add_column_weight_brand-product', 1),
('2015_10_28_084912_change_column_buyer-custom-id_order-main', 1),
('2015_10_28_084959_change_column_id_buyer-custom', 1),
('2015_10_29_034500_change_column_order-shipping-id_order-main', 1),
('2015_10_29_035333_add_column_order-shipping-id_order-main', 1),
('2015_10_29_040055_drop_column_id_order-shipping', 1),
('2015_10_29_040107_add_column_code_order-shipping', 1),
('2015_10_30_085942_drop_column_image_brand_product', 1),
('2015_10_30_090035_create_table_brand-product-image', 1),
('2015_11_02_060913_add_column_email-code_buyer', 1),
('2015_11_02_060946_add_column_status_buyer', 1),
('2015_11_04_031823_create_table_brand-size-image', 1),
('2015_11_10_035911_add_column_waybill-number_order-shipping', 1),
('2015_11_18_022656_drop_column_order-shipping-code_order-main', 2),
('2015_12_08_050546_create_table_point', 3),
('2016_01_19_040647_create_table_home-image', 4),
('2016_01_25_025349_create_table_bank', 5),
('2016_01_25_025422_create_table_shipping-service', 5),
('2016_02_02_064501_add_column_authKey_admin', 6),
('2016_02_02_064533_add_column_accessToken_admin', 6);

-- --------------------------------------------------------

--
-- Table structure for table `order_confirm`
--

CREATE TABLE IF NOT EXISTS `order_confirm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_main_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `via` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `bank` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_confirm_order_main_code_unique` (`order_main_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

--
-- Dumping data for table `order_confirm`
--

INSERT INTO `order_confirm` (`id`, `order_main_code`, `via`, `amount`, `bank`, `account_number`, `created_at`, `updated_at`) VALUES
(1, 'INT25012016041920675', 'bank', 978000, 'BCA', '123123123', '2016-01-24 21:30:39', '2016-01-24 21:30:39'),
(2, 'INT22022016064345893', 'bank', 68500, 'BCA', '2826777777', '2016-02-22 06:48:46', '2016-02-22 06:48:46'),
(3, 'INT28022016060524967', 'bank', 69500, 'BCA', '2826777777', '2016-02-28 18:08:32', '2016-02-28 18:08:32'),
(4, 'INT05032016051557919', 'bank', 64500, 'BCA', '2826777777', '2016-03-05 17:19:14', '2016-03-05 17:19:14'),
(5, 'INT07032016090237194', 'bank', 64500, 'BCA', '2826777777', '2016-03-07 09:04:48', '2016-03-07 09:04:48'),
(11, 'INT07032016093420843', 'bank', 170500, 'BRI', '123123123', '2016-03-07 09:47:33', '2016-03-07 09:47:33'),
(13, 'INT07032016115857608', 'bank', 93000, 'BCA', '2826777777', '2016-03-07 11:59:26', '2016-03-07 11:59:26'),
(14, 'INT11032016091303815', 'bank', 141000, 'BCA', '2826777777', '2016-03-11 09:17:53', '2016-03-11 09:17:53'),
(15, 'INT11032016124741847', 'bank', 139000, 'BCA', '2826777777', '2016-03-11 12:48:54', '2016-03-11 12:48:54'),
(29, 'INT12032016035113100', 'bank', 60500, 'BCA', '123123123', '2016-03-12 03:51:59', '2016-03-12 03:51:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE IF NOT EXISTS `order_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_main_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand_product_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal_price` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_main_code`, `brand_product_id`, `quantity`, `subtotal_price`, `created_at`, `updated_at`) VALUES
(13, 'INT07032016093420843', 207, 2, 119000, '2016-03-07 09:34:20', '2016-03-07 09:34:20'),
(14, 'INT07032016093420843', 205, 1, 59500, '2016-03-07 09:34:20', '2016-03-07 09:34:20'),
(19, 'INT11032016124741847', 212, 1, 59500, '2016-03-11 12:47:41', '2016-03-11 12:47:41'),
(20, 'INT11032016124741847', 211, 1, 59500, '2016-03-11 12:47:41', '2016-03-11 12:47:41'),
(21, 'INT12032016035113100', 204, 1, 59500, '2016-03-12 03:51:13', '2016-03-12 03:51:13'),
(22, 'INT12032016042631369', 105, 1, 125000, '2016-03-12 16:26:31', '2016-03-12 16:26:31');

-- --------------------------------------------------------

--
-- Table structure for table `order_main`
--

CREATE TABLE IF NOT EXISTS `order_main` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `buyer_id` int(10) unsigned NOT NULL,
  `buyer_custom_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buyer_voucher_id` int(10) unsigned DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_main_code_unique` (`code`),
  UNIQUE KEY `order_main_buyer_voucher_id_unique` (`buyer_voucher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `order_main`
--

INSERT INTO `order_main` (`id`, `code`, `buyer_id`, `buyer_custom_code`, `buyer_voucher_id`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(11, 'INT07032016093420843', 1, NULL, NULL, 170500, 2, '2016-03-07 09:34:20', '2016-03-07 09:59:40'),
(15, 'INT11032016124741847', 28, NULL, NULL, 139000, 0, '2016-03-11 12:47:42', '2016-03-11 12:47:42'),
(16, 'INT12032016035113100', 1, NULL, NULL, 60500, 1, '2016-03-12 03:51:13', '2016-03-12 03:52:04'),
(17, 'INT12032016042631369', 17, NULL, NULL, 147000, 0, '2016-03-12 16:26:31', '2016-03-12 16:26:31');

-- --------------------------------------------------------

--
-- Table structure for table `order_shipping`
--

CREATE TABLE IF NOT EXISTS `order_shipping` (
  `code` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_main_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service_package` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `estimation` int(11) NOT NULL,
  `waybill_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`code`),
  UNIQUE KEY `order_shipping_order_main_code_unique` (`order_main_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=44 ;

--
-- Dumping data for table `order_shipping`
--

INSERT INTO `order_shipping` (`code`, `order_main_code`, `origin`, `destination`, `service`, `service_package`, `weight`, `cost`, `estimation`, `waybill_number`, `created_at`, `updated_at`) VALUES
(1, 'INT17022016042538701', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTC)', 2800, 21000, 1, NULL, '2016-02-17 04:25:38', '2016-02-17 04:25:38'),
(2, 'INT180120160845194969665364', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCYES)', 800, 9000, 1, NULL, '2016-01-18 08:45:19', '2016-01-18 08:45:19'),
(3, 'INT18022016083843251', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCYES)', 1300, 9000, 1, NULL, '2016-02-18 08:38:43', '2016-02-18 08:38:43'),
(4, 'INT19022016091720807', 'Bandung (Kota)', 'Jakarta Selatan (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Yakin Esok Sampai (YES)', 1300, 15000, 1, NULL, '2016-02-19 09:17:20', '2016-02-19 09:17:20'),
(5, 'INT20022016024608926', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCYES)', 800, 9000, 1, NULL, '2016-02-20 14:46:08', '2016-02-20 14:46:08'),
(6, 'INT20022016025901775', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCYES)', 800, 9000, 1, NULL, '2016-02-20 14:59:01', '2016-02-20 14:59:01'),
(7, 'INT20022016025907247', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCYES)', 800, 9000, 1, NULL, '2016-02-20 14:59:07', '2016-02-20 14:59:07'),
(8, 'INT20022016025930967', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCYES)', 800, 9000, 1, NULL, '2016-02-20 14:59:30', '2016-02-20 14:59:30'),
(9, 'INT20022016025938936', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCYES)', 800, 9000, 1, NULL, '2016-02-20 14:59:38', '2016-02-20 14:59:38'),
(10, 'INT20022016030058648', 'Bandung (Kota)', 'Jakarta Pusat (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 800, 10000, 1, NULL, '2016-02-20 15:00:58', '2016-02-20 15:00:58'),
(11, 'INT20022016031104849', 'Bandung (Kota)', 'Jakarta Barat (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 800, 10000, 1, NULL, '2016-02-20 15:11:04', '2016-02-20 15:11:04'),
(12, 'INT20022016031123890', 'Bandung (Kota)', 'Jakarta Barat (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 800, 10000, 1, NULL, '2016-02-20 15:11:23', '2016-02-20 15:11:23'),
(13, 'INT20022016031643631', 'Bandung (Kota)', 'Jakarta Barat (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 800, 10000, 1, NULL, '2016-02-20 15:16:43', '2016-02-20 15:16:43'),
(14, 'INT20022016032212458', 'Bandung (Kota)', 'Jakarta Barat (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 800, 10000, 1, NULL, '2016-02-20 15:22:12', '2016-02-20 15:22:12'),
(15, 'INT22022016055429946', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCOKE)', 900, 6000, 2, NULL, '2016-02-22 05:54:29', '2016-02-22 05:54:29'),
(16, 'INT22022016064022241', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCYES)', 800, 9000, 1, NULL, '2016-02-22 06:40:22', '2016-02-22 06:40:22'),
(17, 'INT22022016064345893', 'Bandung (Kota)', 'Jakarta Barat (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Ongkos Kirim Ekonomis (OKE)', 800, 9000, 2, '1213124241123412423', '2016-02-22 06:43:45', '2016-02-22 06:54:11'),
(18, 'INT25012016040525969', 'Bandung (Kota)', 'Surabaya (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Super Speed (SPS)', 3600, 603000, 0, NULL, '2016-01-24 21:05:25', '2016-01-24 21:05:25'),
(19, 'INT25012016040959466', 'Bandung (Kota)', 'Surabaya (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Super Speed (SPS)', 3600, 603000, 0, NULL, '2016-01-24 21:09:59', '2016-01-24 21:09:59'),
(20, 'INT25012016041013994', 'Bandung (Kota)', 'Surabaya (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Super Speed (SPS)', 3600, 603000, 0, NULL, '2016-01-24 21:10:13', '2016-01-24 21:10:13'),
(21, 'INT25012016041123181', 'Bandung (Kota)', 'Surabaya (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Super Speed (SPS)', 3600, 603000, 0, NULL, '2016-01-24 21:11:23', '2016-01-24 21:11:23'),
(22, 'INT25012016041154929', 'Bandung (Kota)', 'Surabaya (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Super Speed (SPS)', 3600, 603000, 0, NULL, '2016-01-24 21:11:54', '2016-01-24 21:11:54'),
(23, 'INT25012016041251631', 'Bandung (Kota)', 'Surabaya (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Super Speed (SPS)', 3600, 603000, 0, NULL, '2016-01-24 21:12:51', '2016-01-24 21:12:51'),
(24, 'INT25012016041330355', 'Bandung (Kota)', 'Surabaya (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Super Speed (SPS)', 3600, 603000, 0, NULL, '2016-01-24 21:13:30', '2016-01-24 21:13:30'),
(25, 'INT25012016041503683', 'Bandung (Kota)', 'Surabaya (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Super Speed (SPS)', 3600, 603000, 0, NULL, '2016-01-24 21:15:03', '2016-01-24 21:15:03'),
(26, 'INT25012016041920675', 'Bandung (Kota)', 'Surabaya (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Super Speed (SPS)', 3600, 603000, 0, NULL, '2016-01-24 21:19:20', '2016-01-24 21:19:20'),
(27, 'INT251120150442542779059903', 'Bandung (Kota)', 'Demak', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 2000, 44000, 2, NULL, '2015-11-25 04:42:54', '2015-11-25 04:42:54'),
(28, 'IOMC131120150904571020012389', 'Bandung (Kota)', 'Cirebon (Kota)', 'Citra Van Titipan Kilat (TIKI)', ' Over Night Service (ONS)', 3800, 60000, 0, NULL, '2015-11-13 02:04:57', '2015-11-13 02:04:57'),
(29, 'IOMC171120150738461128357782', 'Bandung (Kota)', 'Madiun', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 1800, 44000, 1, NULL, '2015-11-17 00:38:46', '2015-11-17 00:38:46'),
(30, 'INT26022016094854726', 'Bandung (Kota)', 'Bekasi', 'Jalur Nugraha Ekakurir (JNE)', ' Ongkos Kirim Ekonomis (OKE)', 1600, 20000, 2, NULL, '2016-02-26 09:48:54', '2016-02-26 09:48:54'),
(31, 'INT26022016100402449', 'Bandung (Kota)', 'Jakarta Timur (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Ongkos Kirim Ekonomis (OKE)', 1300, 9000, 2, NULL, '2016-02-26 10:04:02', '2016-02-26 10:04:02'),
(32, 'INT28022016060524967', 'Bandung (Kota)', 'Jakarta Barat (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 800, 10000, 1, NULL, '2016-02-28 18:05:24', '2016-02-28 18:05:24'),
(33, 'INT29022016012315789', 'Bandung (Kota)', 'Jakarta Timur (Kota)', 'POS Indonesia (POS)', ' Paketpos Biasa (Paketpos Biasa)', 3750, 16160, 7, NULL, '2016-02-29 01:23:15', '2016-02-29 01:23:15'),
(34, 'INT29022016053745857', 'Bandung (Kota)', 'Bandung', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCOKE)', 800, 6000, 2, NULL, '2016-02-29 05:37:45', '2016-02-29 05:37:45'),
(35, 'INT05032016051557919', 'Bandung (Kota)', 'Jakarta Pusat (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 800, 10000, 1, NULL, '2016-03-05 17:15:57', '2016-03-05 17:15:57'),
(36, 'INT07032016090237194', 'Bandung (Kota)', 'Jakarta Barat (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 800, 10000, 1, NULL, '2016-03-07 09:02:37', '2016-03-07 09:02:37'),
(37, 'INT07032016093420843', 'Bandung (Kota)', 'Jakarta Selatan (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Ongkos Kirim Ekonomis (OKE)', 2400, 27000, 2, NULL, '2016-03-07 09:34:20', '2016-03-07 09:34:20'),
(38, 'INT07032016094908773', 'Bandung (Kota)', 'Jakarta Timur (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Ongkos Kirim Ekonomis (OKE)', 800, 9000, 2, NULL, '2016-03-07 09:49:08', '2016-03-07 09:49:08'),
(39, 'INT07032016115857608', 'Bandung (Kota)', 'Balikpapan (Kota)', 'POS Indonesia (POS)', ' Surat Kilat Khusus (Surat Kilat Khusus)', 800, 33500, 2, NULL, '2016-03-07 11:58:57', '2016-03-07 11:58:57'),
(40, 'INT11032016091303815', 'Bandung (Kota)', 'Jakarta Barat (Kota)', 'POS Indonesia (POS)', ' Surat Kilat Khusus (Surat Kilat Khusus)', 1600, 22000, 2, NULL, '2016-03-11 09:13:03', '2016-03-11 09:13:03'),
(41, 'INT11032016124741847', 'Bandung (Kota)', 'Jakarta Barat (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 1600, 20000, 1, NULL, '2016-03-11 12:47:41', '2016-03-11 12:47:41'),
(42, 'INT12032016035113100', 'Bandung (Kota)', 'Bandung (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' JNE City Courier (CTCOKE)', 800, 6000, 2, NULL, '2016-03-12 03:51:13', '2016-03-12 03:51:13'),
(43, 'INT12032016042631369', 'Bandung (Kota)', 'Malang (Kota)', 'Jalur Nugraha Ekakurir (JNE)', ' Layanan Reguler (REG)', 1200, 22000, 1, NULL, '2016-03-12 16:26:31', '2016-03-12 16:26:31');

-- --------------------------------------------------------

--
-- Table structure for table `point`
--

CREATE TABLE IF NOT EXISTS `point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `price_back` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `point`
--

INSERT INTO `point` (`id`, `price`, `price_back`, `created_at`, `updated_at`) VALUES
(1, 50000, 5000, '2015-12-15 21:32:48', '2015-12-15 21:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_service`
--

CREATE TABLE IF NOT EXISTS `shipping_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'empty.png',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `shipping_service`
--

INSERT INTO `shipping_service` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'JNE', '1453691049.png', '2016-01-24 20:04:09', '2016-01-24 20:04:09'),
(2, 'POS', '1453691068.png', '2016-01-24 20:04:29', '2016-01-24 20:04:29'),
(3, 'TIKI', '1453691086.png', '2016-01-24 20:04:46', '2016-01-24 20:04:46');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
