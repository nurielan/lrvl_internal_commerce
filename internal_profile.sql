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
-- Database: `internal_profile`
--
CREATE DATABASE IF NOT EXISTS `internal_profile` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `internal_profile`;

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE IF NOT EXISTS `about` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `title`, `name`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Company', NULL, '<p>Sprei Internal Kualitas kain katun CVC pilihan yang dikombinasikan dengan berbagai motif yang cantik dan elegan seperti USA Flag, Barcode, Channel, Naval, Hologram, Carnival dan Prada membuat internal berhasil menguasai pangsa pasar yang cukup besar di tanah air.<br />Bahan yang lembut tidak mudah luntur pasti bikin kamu ketagihan</p>', 'company.gif', '2015-10-02 07:19:29', '2016-01-15 08:25:31');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@internal.co.id', '$2y$10$TqCtkMkeYnU55KWTKPLe1es2Q12C.C8uzlwaTi/NF2DXL5oMUQ2da', 'srlUHo2tJgIsLNbqZcx7IeStzEPQGf6cTpcYoQ2gOhk1S5qFKyNx9kGy9PWv', '2015-09-23 11:33:49', '2016-01-25 09:11:51');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `name`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Malang Here we come', NULL, '<p>Hi, sobat internal buat kamu yang ada di Malang dan sekitarnya kita bakal datangin kota kamu bla bla bla</p>', 'malang_here_we_come.jpg', '2015-09-28 03:05:49', '2015-11-30 07:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `catalogue`
--

CREATE TABLE IF NOT EXISTS `catalogue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `catalogue`
--

INSERT INTO `catalogue` (`id`, `title`, `name`, `content`, `image`, `file`, `created_at`, `updated_at`) VALUES
(1, 'INTERNAL', NULL, '<p>Sprei Internal Kualitas kain katun CVC pilihan yang dikombinasikan dengan berbagai motif yang cantik dan elegan seperti USA Flag, Barcode, Channel, Naval, Hologram, Carnival dan Prada membuat internal berhasil menguasai pangsa pasar yang cukup besar di tanah air.<br />Bahan yang lembut tidak mudah luntur pasti bikin kamu ketagihan<br />Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Internal120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200 <br />BedCover Ladyrose Single 120x200</p>', NULL, 'internal.gif', '2015-09-25 04:25:39', '2015-12-29 06:38:34'),
(2, 'LADYROSE', NULL, '<p>Sprei Ladyrose adalah Salahsatu Produk Sprei dari Internal Group<br />Sprei Ladyrose adalah Produk dengan desain terbaik , trend yang mengikuti perkembangan jaman dan merupakan TOP MOST WANTED bagi para artis dan masyarakat . <br />Sprei Ladyrose dan BedCover Ladyrose yang mempunyai bahan lembut dan tidak panas dipakai sehingga tidur semakin nyenyak dan nyaman .<br />Motif yang bervariasi dari Ladyrose dengan desain Eksklusif mempengaruhi Suasana tidur Semakin nyaman lagi .<br />Terbukti Sprei yang benar-benar Berkualitas , Sprei Ladyrose dan BedCover Ladyrose mempunyai bahan yang sangat nyaman dipakai untuk tidur , jadi pastikan tidur anda selalu menggunakan Sprei Ladyrose dan BedCover Ladyrose . <br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200 <br />BedCover Ladyrose Single 120x200 </p>', NULL, 'ladyrose.gif', '2015-12-02 05:50:23', '2015-12-29 03:54:21'),
(3, 'VALLERY', NULL, '<p>Sprei Vallery adalah Salahsatu Produk Sprei Dari Internal Group .<br />Sprei Vallery dengan desain Eksklusif untuk ruang tidur anda , yang membuat tidur anda semakn nyaman .<br />Sprei Vallery dengan Tinggi 30cm Sprei Jacquard dengan Bahan Serat AloeVera .<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King B2 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 1pcs Pillow Case &amp; 1pcs Bolster Case )<br />BedCover Vallery King 180x200</p>', NULL, 'vallery.gif', '2015-12-02 05:51:53', '2015-12-29 03:55:15');

-- --------------------------------------------------------

--
-- Table structure for table `catalogue_sub`
--

CREATE TABLE IF NOT EXISTS `catalogue_sub` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalogue_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `catalogue_sub`
--

INSERT INTO `catalogue_sub` (`id`, `catalogue_id`, `title`, `name`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Internal 2 in 1', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 IDR 139.000 / Pcs ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 IDR 124.000 / Pcs ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 IDR 137.000 / Pcs ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 IDR 122.000 / Pcs ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 IDR 130.000 / Pcs ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Internal 120x200 IDR 74.000 / Pcs ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200 IDR 410.000 / Pcs<br />BedCover Internal Queen 160X200 IDR 400.000 / Pcs<br />BedCover Internal Single 120x200 IDR 240.000 / Pcs</p>', NULL, '2015-09-28 06:36:24', '2015-12-26 06:00:06'),
(2, 1, 'Internal Single Uk 120x200', NULL, '<p>Sprei Single Internal Banyak Karakter untuk anak=anak , Remaja dan untuk yg suka Club Bola</p>', NULL, '2015-12-01 03:45:32', '2015-12-12 06:07:14'),
(3, 2, 'Ladyrose 2 in 1', NULL, '<p>Sprei Ladyrose :<br />Queen B2 Uk 160x200 IDR 77.000 / Pcs ( 2pcs Pillow Case 2pcs Bolster Case )<br />Queen B4 Uk 160x200 IDR 87.000 / Pcs ( 4pcs Pillow Case 2pcs Bolster Case )</p>', NULL, '2015-12-08 06:23:32', '2015-12-28 03:39:09'),
(4, 3, 'Vallery King Queen Single', NULL, '<p>Sprei Vallery :<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Vallery King 180x200<br />BedCover Vallery Queen 160x200</p>', NULL, '2015-12-08 06:23:57', '2015-12-28 04:03:15'),
(5, 2, 'Ladyrose Single Uk 120x200', NULL, '<p>Ladyrose Single Uk 120x200 IDR 58.000 / Pcs</p>', NULL, '2015-12-16 08:24:33', '2015-12-16 08:24:33'),
(6, 1, 'Blanket Selimut Internal', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Uk 160x200 IDR 128.000 / Pcs</p>', NULL, '2015-12-26 01:31:37', '2015-12-26 01:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'editha', 'editnathalia@yahoo.com', 'tanya harga', 'Apakah harga yang tertera sudah dg ongkir?Lalu kalo ada barang cacat apakah ada penggantian?terimakasih ', '2016-02-20 02:55:25', '2016-02-20 02:55:25'),
(2, 'Internal', 'christabraham@gmail.com', 'ya', 'tes', '2016-02-20 15:04:38', '2016-02-20 15:04:38'),
(3, 'Dyan Sapti Permata Sari', 'dyanblue_derumput@yahoo.co.id', 'tanya stock', 'Mbk/mas mau tnya msh ad gak stocknya bedcover ladyrose motif gisela uk 180x200 ?\r\nBls cpt ya.. mksh', '2016-02-23 03:49:10', '2016-02-23 03:49:10'),
(4, 'Usep Sulaeman', 'g.vhenk@yahoo.com', 'member', 'dear internal group, \r\nperkenalkan nama sy usep sulaeman,\r\nsaat ini sy bergerak dlm bidang olshop. \r\ndan sy trtarik dngn produk internal group. \r\npertanyaan sy bisa kah sy brgabung dlm pemasaran produk internalgroup? \r\nklo bisa sebagai ap? \r\nsstem member kh?  at dropshipper? \r\napa syarat nya sist at gan? \r\ndan yg pling penting,  bagaimana dgn masalah harga.. ', '2016-03-11 14:30:01', '2016-03-11 14:30:01'),
(5, 'Usep Sulaeman', 'admin@internal.co.id', 'member', 'dear internal group, \r\nperkenalkan nama sy usep sulaeman,\r\nsaat ini sy bergerak dlm bidang olshop. \r\ndan sy trtarik dngn produk internal group. \r\npertanyaan sy bisa kah sy brgabung dlm pemasaran produk internalgroup? \r\nklo bisa sebagai ap? \r\nsstem member kh?  at dropshipper? \r\napa syarat nya sist at gan? \r\ndan yg pling penting,  bagaimana dgn masalah harga.. ', '2016-03-11 14:33:39', '2016-03-11 14:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `home_image`
--

CREATE TABLE IF NOT EXISTS `home_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `home_image`
--

INSERT INTO `home_image` (`id`, `title`, `name`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 'EN', NULL, '<p>E</p>', 'en.gif', '2016-01-19 07:26:21', '2016-01-19 07:26:21'),
(2, 'dua', NULL, '<p>DUA</p>', 'dua.gif', '2016-01-19 07:30:29', '2016-01-19 07:30:29'),
(3, 'satu', NULL, '<p>S</p>', 'satu.gif', '2016-01-19 07:32:52', '2016-01-19 07:32:52'),
(4, 'tiga', NULL, '<p>T</p>', 'tiga.gif', '2016-01-19 07:34:30', '2016-01-19 07:34:30'),
(5, 'lima', NULL, '<p>L</p>', 'lima.gif', '2016-01-19 07:35:35', '2016-01-19 07:35:35'),
(6, 'enam', NULL, '<p>E</p>', 'enam.gif', '2016-01-19 07:36:36', '2016-01-19 07:36:36'),
(7, 'tujuh', NULL, '<p>T</p>', 'tujuh.gif', '2016-01-19 07:37:32', '2016-01-19 07:37:32'),
(8, 'HA', NULL, '<p>H</p>', 'ha.gif', '2016-01-19 07:39:27', '2016-01-19 07:39:27');

-- --------------------------------------------------------

--
-- Table structure for table `link_social`
--

CREATE TABLE IF NOT EXISTS `link_social` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `link_social`
--

INSERT INTO `link_social` (`id`, `title`, `name`, `link`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', NULL, 'InternalGroup ID', 0, '2015-09-25 09:13:14', '2015-12-21 02:53:53'),
(2, 'Twitter', NULL, 'InternalGroupID', 0, '2015-09-26 12:50:07', '2016-01-14 06:54:17'),
(3, 'Instagram', NULL, 'ABCRadioDalam', 0, '2015-09-26 12:50:07', '2016-01-14 06:54:20'),
(4, 'Youtube', NULL, 'Te3k1CqxSbg', 0, '2015-09-26 12:50:59', '2015-09-27 20:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalogue_sub_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=124 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `catalogue_sub_id`, `title`, `name`, `content`, `image`, `amount`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'INTERNAL KENZO', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200<br />BedCover Internal Single 120x200</p>', 'internal_kenzo.gif', 1, 124, '2015-12-05 05:51:20', '2015-12-26 06:13:17'),
(2, 1, 'INTERNAL BARCA', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200<br />BedCover Internal Single 120x200</p>', 'internal_barca.gif', 1, 124, '2015-12-05 06:11:30', '2015-12-26 06:14:56'),
(3, 1, 'INTERNAL PRADA', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_prada.gif', 1, 124, '2015-12-05 06:36:07', '2015-12-26 06:16:16'),
(4, 1, 'INTERNAL M U', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_m_u.gif', 1, 124, '2015-12-05 06:58:42', '2016-01-15 08:38:55'),
(5, 1, 'INTERNAL CARISA', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_carisa.gif', 1, 124, '2015-12-05 06:59:50', '2015-12-26 06:18:45'),
(6, 1, 'INTERNAL CLAUDIA', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_claudia.gif', 1, 124, '2015-12-07 01:54:18', '2015-12-26 06:19:07'),
(7, 1, 'INTERNAL ITALY', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_italy.gif', 1, 124, '2015-12-07 02:05:16', '2015-12-26 06:19:24'),
(8, 1, 'INTERNAL ESCADA', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_escada.gif', 1, 124, '2015-12-07 02:12:42', '2015-12-26 06:19:47'),
(9, 1, 'INTERNAL GREEN HILL', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_green_hill.gif', 1, 124, '2015-12-07 02:19:13', '2015-12-28 03:12:14'),
(10, 1, 'INTERNAL MILENIA', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_milenia.gif', 1, 124, '2015-12-07 02:30:06', '2015-12-28 03:12:31'),
(11, 1, 'INTERNAL USA FLAG', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_usa_flag.gif', 1, 124, '2015-12-07 03:20:22', '2015-12-28 03:12:47'),
(12, 1, 'INTERNAL HAWAI', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_hawai.gif', 1, 124, '2015-12-07 03:35:25', '2015-12-28 03:13:03'),
(13, 1, 'INTERNAL FIRE WORK', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_fire_work.gif', 1, 124, '2015-12-07 04:20:03', '2015-12-28 03:13:23'),
(14, 1, 'INTERNAL E V E L Y N', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_e_v_e_l_y_n.gif', 1, 124, '2015-12-07 04:21:50', '2015-12-28 03:13:42'),
(15, 1, 'INTERNAL L E A F', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_l_e_a_f.gif', 1, 124, '2015-12-07 07:42:17', '2015-12-28 03:13:59'),
(16, 1, 'INTERNAL O L I V I A', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_o_l_i_v_i_a.gif', 1, 124, '2015-12-07 07:54:27', '2015-12-28 03:14:11'),
(17, 1, 'INTERNAL E N G L A N D', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_e_n_g_l_a_n_d.gif', 1, 124, '2015-12-07 08:06:17', '2015-12-28 03:14:25'),
(18, 1, 'INTERNAL P A D M A', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_p_a_d_m_a.gif', 1, 124, '2015-12-07 08:24:43', '2015-12-28 03:14:50'),
(19, 1, 'INTERNAL B A R C O D E', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_b_a_r_c_o_d_e.gif', 1, 124, '2015-12-07 09:11:59', '2015-12-28 03:15:06'),
(20, 1, 'INTERNAL BLUELAGOON', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_bluelagoon.gif', 1, 124, '2015-12-07 09:19:39', '2015-12-28 03:15:21'),
(21, 1, 'INTERNAL BLUEMOUNT', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_bluemount.gif', 1, 124, '2015-12-07 09:30:06', '2015-12-28 03:15:36'),
(22, 1, 'INTERNAL G O D I V A', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_g_o_d_i_v_a.gif', 1, 124, '2015-12-08 02:28:49', '2015-12-28 03:15:49'),
(23, 1, 'INTERNAL H O L I D A Y', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_h_o_l_i_d_a_y.gif', 1, 124, '2015-12-08 02:52:31', '2015-12-28 03:16:04'),
(24, 1, 'INTERNAL F O S F O R', NULL, '<p>Sprei Internal :<br />Sprei Internal King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Internal Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal King 180x200<br />BedCover Internal Queen 160X200</p>', 'internal_f_o_s_f_o_r.gif', 1, 124, '2015-12-08 02:59:23', '2015-12-28 03:16:16'),
(25, 3, 'LADYROSE HELLO KITTY RED', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_hello_kitty_red.gif', 1, 79, '2015-12-10 03:24:25', '2015-12-28 03:41:54'),
(26, 3, 'LADYROSE HELLO KITTY PINK', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_hello_kitty_pink.gif', 1, 79, '2015-12-10 06:12:47', '2015-12-28 03:42:10'),
(27, 3, 'LADYROSE BARCELONA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_barcelona.gif', 1, 79, '2015-12-10 07:02:15', '2015-12-28 04:14:06'),
(28, 3, 'LADYROSE ALILA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_alila.gif', 1, 79, '2015-12-10 07:30:16', '2015-12-28 04:16:01'),
(29, 3, 'LADYROSE MONOLOG', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_monolog.gif', 1, 79, '2015-12-10 07:40:40', '2015-12-28 06:03:02'),
(30, 3, 'LADYROSE TIFFANY', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_tiffany.gif', 1, 79, '2015-12-10 08:23:19', '2015-12-28 06:03:39'),
(31, 3, 'LADYROSE VIVIAN', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_vivian.gif', 1, 79, '2015-12-10 08:48:41', '2015-12-28 06:04:09'),
(32, 3, 'LADYROSE VERTU', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_vertu.gif', 1, 79, '2015-12-10 09:33:11', '2015-12-28 06:05:10'),
(33, 3, 'LADYROSE GROFY', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_grofy.gif', 1, 79, '2015-12-11 01:44:53', '2015-12-28 06:07:29'),
(34, 3, 'LADYROSE ORCHID', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_orchid.gif', 1, 79, '2015-12-11 01:51:30', '2015-12-28 06:08:06'),
(35, 3, 'LADYROSE SABRINA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_sabrina.gif', 1, 79, '2015-12-11 02:04:40', '2015-12-28 06:08:35'),
(36, 3, 'LADYROSE SHARMA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_sharma.gif', 1, 79, '2015-12-11 02:17:44', '2015-12-28 06:09:03'),
(37, 3, 'LADYROSE GREEN BORNEO', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_green_borneo.gif', 1, 79, '2015-12-11 02:27:54', '2015-12-28 06:09:44'),
(38, 3, 'LADYROSE ONIX', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_onix.gif', 1, 79, '2015-12-11 02:42:26', '2015-12-28 06:10:39'),
(39, 3, 'LADYROSE STRAWBERRY', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_strawberry.gif', 1, 79, '2015-12-11 02:52:13', '2015-12-28 06:11:15'),
(40, 3, 'LADYROSE RUBY', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_ruby.gif', 1, 79, '2015-12-11 03:01:27', '2015-12-28 06:11:54'),
(41, 3, 'LADYROSE JAVA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_java.gif', 1, 79, '2015-12-11 03:17:55', '2015-12-28 06:12:26'),
(42, 3, 'LADYROSE DELIMA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_delima.gif', 1, 79, '2015-12-11 03:24:32', '2015-12-28 06:13:19'),
(43, 3, 'LADYROSE EMERALD', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_emerald.gif', 1, 79, '2015-12-11 03:34:23', '2015-12-28 06:14:20'),
(44, 3, 'LADYROSE ALLEGRA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_allegra.gif', 1, 79, '2015-12-11 03:48:01', '2015-12-28 06:15:32'),
(45, 3, 'LADYROSE DEALOVA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_dealova.gif', 1, 79, '2015-12-11 04:25:00', '2015-12-28 06:16:27'),
(46, 3, 'LADYROSE VIVIANTE', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_viviante.gif', 1, 79, '2015-12-11 06:10:35', '2015-12-28 06:17:31'),
(47, 3, 'LADYROSE ELVIRA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_elvira.gif', 1, 79, '2015-12-11 06:40:41', '2015-12-28 06:18:44'),
(48, 3, 'LADYROSE ORLANDO', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_orlando.gif', 1, 79, '2015-12-11 06:46:29', '2015-12-28 06:19:52'),
(49, 3, 'LADYROSE GISELA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_gisela.gif', 1, 79, '2015-12-11 06:51:20', '2015-12-28 06:20:37'),
(50, 3, 'LADYROSE BELLEZA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_belleza.gif', 1, 79, '2015-12-11 07:02:50', '2015-12-28 06:22:04'),
(51, 3, 'LADYROSE INDIGO', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_indigo.gif', 1, 79, '2015-12-11 07:09:12', '2015-12-28 06:23:19'),
(52, 3, 'LADYROSE JUVENTUS', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_juventus.gif', 1, 79, '2015-12-11 07:16:03', '2015-12-28 07:49:45'),
(53, 3, 'LADYROSE LAGUNA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_laguna.gif', 1, 79, '2015-12-11 07:26:12', '2015-12-28 07:52:25'),
(54, 3, 'LADYROSE LAVANDE', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_lavande.gif', 1, 79, '2015-12-11 07:32:14', '2015-12-28 07:53:27'),
(55, 3, 'LADYROSE RED SAPHIRE', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_red_saphire.gif', 1, 79, '2015-12-11 07:39:53', '2015-12-28 07:55:44'),
(56, 3, 'LADYROSE TROPIC', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_tropic.gif', 1, 79, '2015-12-11 07:49:15', '2015-12-28 07:58:32'),
(57, 3, 'LADYROSE MARBELA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_marbela.gif', 1, 79, '2015-12-11 08:01:16', '2015-12-28 07:59:23'),
(58, 3, 'LADYROSE DOLPHIN', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_dolphin.gif', 1, 79, '2015-12-11 08:09:47', '2015-12-28 08:00:52'),
(59, 3, 'LADYROSE EIFFEL TOWER', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_eiffel_tower.gif', 1, 79, '2015-12-11 08:58:04', '2015-12-28 08:03:33'),
(60, 3, 'LADYROSE PEACOCK', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_peacock.gif', 1, 79, '2015-12-11 09:11:49', '2015-12-28 08:05:47'),
(61, 3, 'LADYROSE PEGASUS', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_pegasus.gif', 1, 79, '2015-12-11 09:21:55', '2015-12-28 08:07:18'),
(62, 3, 'LADYROSE PURPLE ROSE', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_purple_rose.gif', 1, 79, '2015-12-11 09:27:23', '2015-12-28 08:07:52'),
(63, 3, 'LADYROSE ROMANTIC ROSE', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_romantic_rose.gif', 1, 79, '2015-12-12 01:49:27', '2015-12-28 08:08:53'),
(64, 3, 'LADYROSE SLEEPING CAT', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_sleeping_cat.gif', 1, 79, '2015-12-12 02:03:56', '2015-12-28 08:09:54'),
(65, 3, 'LADYROSE SWAN', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_swan.gif', 1, 79, '2015-12-12 02:09:36', '2015-12-28 08:10:32'),
(66, 3, 'LADYROSE TIGER', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_tiger.gif', 1, 79, '2015-12-12 02:26:17', '2015-12-28 08:11:11'),
(67, 3, 'LADYROSE REVALINA', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_revalina.gif', 1, 79, '2015-12-12 02:39:56', '2015-12-28 08:11:45'),
(68, 3, 'LADYROSE HERITAGE', NULL, '<p>Sprei Ladyrose :<br />Sprei Ladyrose King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B4 160x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Ladyrose Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose King 180x200<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_heritage.gif', 1, 79, '2015-12-12 02:44:44', '2015-12-28 08:12:20'),
(69, 2, 'INTERNAL BADTZ MARU', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_badtz_maru.gif', 1, 74, '2015-12-12 06:27:00', '2015-12-28 08:16:49'),
(70, 2, 'INTERNAL VACATION', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_vacation.gif', 1, 74, '2015-12-12 06:36:15', '2015-12-28 08:17:13'),
(71, 2, 'INTERNAL MU', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_mu.gif', 1, 74, '2015-12-12 06:59:04', '2015-12-28 08:17:46'),
(72, 2, 'INTERNAL USA', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_usa.gif', 1, 74, '2015-12-14 08:15:09', '2015-12-28 08:18:15'),
(73, 2, 'INTERNAL BARCELONA', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_barcelona.gif', 1, 74, '2015-12-14 09:04:02', '2015-12-28 08:18:45'),
(74, 2, 'INTERNAL CHELSEA', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_chelsea.gif', 1, 74, '2015-12-14 09:20:48', '2015-12-28 08:19:20'),
(75, 2, 'INTERNAL CINNAMOROLL', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_cinnamoroll.gif', 1, 74, '2015-12-14 09:26:50', '2015-12-28 08:20:07'),
(76, 2, 'INTERNAL FROG', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_frog.gif', 1, 74, '2015-12-15 03:54:08', '2015-12-28 08:21:32'),
(77, 2, 'INTERNAL LOVELY', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_lovely.gif', 1, 74, '2015-12-15 06:03:45', '2015-12-28 08:21:59'),
(78, 2, 'INTERNAL HELLO KITTY MISSHUG', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_hello_kitty_misshug.gif', 1, 74, '2015-12-15 06:20:31', '2015-12-28 08:22:28'),
(79, 2, 'INTERNAL MONKEY', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_monkey.gif', 1, 74, '2015-12-15 08:18:13', '2015-12-28 08:22:52'),
(80, 2, 'INTERNAL VALERRY', NULL, '<p>Sprei Internal :<br />Sprei Single Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Internal 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Internal Single 120x200</p>', 'internal_valerry.gif', 1, 74, '2015-12-15 08:35:29', '2015-12-28 08:23:19'),
(81, 5, 'LADYROSE AC MILAN', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_ac_milan.gif', 1, 58, '2015-12-16 08:32:01', '2015-12-28 08:27:42'),
(82, 5, 'LADYROSE BADTZ MARU', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_badtz_maru.gif', 1, 58, '2015-12-16 08:38:44', '2015-12-28 08:28:08'),
(83, 5, 'LADYROSE BUTTERFLY', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_butterfly.gif', 1, 58, '2015-12-16 08:46:19', '2015-12-28 08:28:55'),
(84, 5, 'LADYROSE CHELSEA', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_chelsea.gif', 1, 58, '2015-12-17 06:04:28', '2015-12-28 08:29:34'),
(85, 5, 'LADYROSE CINNAMOROLL', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_cinnamoroll.gif', 1, 58, '2015-12-17 06:15:16', '2015-12-28 08:30:14'),
(86, 5, 'LADYROSE ENGLAND', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_england.gif', 1, 58, '2015-12-17 06:20:50', '2015-12-28 08:30:48'),
(87, 5, 'LADYROSE GEISHA', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_geisha.gif', 1, 58, '2015-12-17 06:34:24', '2015-12-28 08:34:27'),
(88, 5, 'LADYROSE ICE CREAM', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_ice_cream.gif', 1, 58, '2015-12-17 07:51:39', '2015-12-28 08:34:59'),
(89, 5, 'LADYROSE INTERMILAN', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_intermilan.gif', 1, 58, '2015-12-17 07:58:02', '2015-12-28 08:35:30'),
(90, 5, 'LADYROSE KEROPPI', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_keroppi.gif', 1, 58, '2015-12-17 08:05:18', '2015-12-28 08:36:33');
INSERT INTO `product` (`id`, `catalogue_sub_id`, `title`, `name`, `content`, `image`, `amount`, `price`, `created_at`, `updated_at`) VALUES
(91, 5, 'LADYROSE LITTLE MISS SUNSHINE', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_little_miss_sunshine.gif', 1, 58, '2015-12-17 08:14:14', '2015-12-28 08:40:12'),
(92, 5, 'LADYROSE LITTLE TWIN STARS', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_little_twin_stars.gif', 1, 58, '2015-12-17 08:22:06', '2015-12-28 08:40:48'),
(93, 5, 'LADYROSE HELLO KITTY MISSHUG', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_hello_kitty_misshug.gif', 1, 58, '2015-12-17 08:32:55', '2015-12-28 08:41:26'),
(94, 5, 'LADYROSE MY MELODY', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_my_melody.gif', 1, 58, '2015-12-17 08:42:21', '2015-12-28 08:41:59'),
(95, 5, 'LADYROSE PINGUIN', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_pinguin.gif', 1, 58, '2015-12-17 09:15:40', '2015-12-28 08:42:43'),
(96, 5, 'LADYROSE TENORIKUMA', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_tenorikuma.gif', 1, 58, '2015-12-18 09:19:21', '2015-12-28 08:43:44'),
(97, 5, 'LADYROSE TOWN', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_town.gif', 1, 58, '2015-12-18 09:24:27', '2015-12-28 08:44:33'),
(98, 5, 'LADYROSE HELLO KITTY UNICORN', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_hello_kitty_unicorn.gif', 1, 58, '2015-12-18 09:31:33', '2015-12-28 08:45:08'),
(99, 5, 'LADYROSE ZOO', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_zoo.gif', 1, 58, '2015-12-19 03:36:02', '2015-12-28 08:45:45'),
(100, 5, 'LADYROSE REAL MADRID', NULL, '<p>Sprei Ladyrose :<br />Sprei Single Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei 2 in 1 Ladyrose 120x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />BedCover Ladyrose Single 120x200</p>', 'ladyrose_real_madrid.gif', 1, 58, '2015-12-19 03:47:19', '2015-12-28 08:46:27'),
(101, 4, 'VALLERY BEIGE', NULL, '<p>Sprei Vallery :<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 1pcs Pillow Case &amp; 1pcs Bolster Case )<br />BedCover Vallery King 180x200<br />BedCover Vallery Queen 160X200</p>', 'vallery_beige.gif', 1, 14, '2015-12-19 06:13:46', '2015-12-28 08:53:40'),
(102, 4, 'VALLERY COFFEE', NULL, '<p>Sprei Vallery :<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 1pcs Pillow Case &amp; 1pcs Bolster Case )<br />BedCover Vallery King 180x200<br />BedCover Vallery Queen 160X200</p>', 'vallery_coffee.gif', 1, 14, '2015-12-19 06:14:27', '2015-12-28 08:54:21'),
(103, 4, 'VALLERY DARK PURPLE', NULL, '<p>Sprei Vallery :<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 1pcs Pillow Case &amp; 1pcs Bolster Case )<br />BedCover Vallery King 180x200<br />BedCover Vallery Queen 160X200</p>', 'vallery_dark_purple.gif', 1, 14, '2015-12-19 06:15:01', '2015-12-28 08:55:17'),
(104, 4, 'VALLERY DARK RED', NULL, '<p>Sprei Vallery :<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 1pcs Pillow Case &amp; 1pcs Bolster Case )<br />BedCover Vallery King 180x200<br />BedCover Vallery Queen 160X200</p>', 'vallery_dark_red.gif', 1, 14, '2015-12-19 06:16:14', '2015-12-28 08:55:46'),
(105, 4, 'VALLERY GOLDEN', NULL, '<p>Sprei Vallery :<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 1pcs Pillow Case &amp; 1pcs Bolster Case )<br />BedCover Vallery King 180x200<br />BedCover Vallery Queen 160X200</p>', 'vallery_golden.gif', 1, 14, '2015-12-21 02:38:05', '2015-12-28 08:56:16'),
(106, 4, 'VALLERY GREEN', NULL, '<p>Sprei Vallery :<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 1pcs Pillow Case &amp; 1pcs Bolster Case )<br />BedCover Vallery King 180x200<br />BedCover Vallery Queen 160X200</p>', 'vallery_green.gif', 1, 14, '2015-12-21 02:38:50', '2015-12-28 08:56:51'),
(107, 4, 'VALLERY LIGHT GREY', NULL, '<p>Sprei Vallery :<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 1pcs Pillow Case &amp; 1pcs Bolster Case )<br />BedCover Vallery King 180x200<br />BedCover Vallery Queen 160X200</p>', 'vallery_light_grey.gif', 1, 14, '2015-12-21 02:39:26', '2015-12-28 08:57:29'),
(108, 4, 'VALLERY RED', NULL, '<p>Sprei Vallery :<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 1pcs Pillow Case &amp; 1pcs Bolster Case )<br />BedCover Vallery King 180x200<br />BedCover Vallery Queen 160X200</p>', 'vallery_red.gif', 1, 14, '2015-12-21 02:40:01', '2015-12-28 08:57:56'),
(109, 4, 'VALLERY YELLOW', NULL, '<p>Sprei Vallery :<br />Sprei Vallery King B4 180x200 ( 4pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery King B2 180x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Queen B2 160x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Vallery Extra King 200x200 ( 2pcs Pillow Case &amp; 2pcs Bolster Case )<br />Sprei Single Vallery 120x200 ( 1pcs Pillow Case &amp; 1pcs Bolster Case )<br />BedCover Vallery King 180x200<br />BedCover Vallery Queen 160X200</p>', 'vallery_yellow.gif', 1, 14, '2015-12-21 02:45:34', '2015-12-28 08:58:24'),
(110, 6, 'BLANKET DORAEMON', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Doraemon Uk 160x200</p>', 'blanket_doraemon.gif', 1, 11, '2015-12-26 01:42:43', '2015-12-28 09:00:05'),
(111, 6, 'BLANKET M U', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal M.U Uk 160x200</p>', 'blanket_m_u.gif', 1, 11, '2015-12-26 01:49:35', '2015-12-28 09:00:48'),
(112, 6, 'BLANKET CHELSEA', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Chelsea Uk 160x200</p>', 'blanket_chelsea.gif', 1, 11, '2015-12-26 01:54:24', '2015-12-28 09:01:26'),
(113, 6, 'BLANKET BARCA', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Barca Uk 160x200</p>', 'blanket_barca.gif', 1, 11, '2015-12-26 02:00:59', '2015-12-28 09:02:02'),
(114, 6, 'BLANKET KEROPPI', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Keroppi Uk 160x200</p>', 'blanket_keroppi.gif', 1, 11, '2015-12-26 02:07:45', '2015-12-28 09:03:47'),
(115, 6, 'BLANKET CARS', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Cars Uk 160x200</p>', 'blanket_cars.gif', 1, 11, '2015-12-26 02:11:46', '2015-12-28 09:04:18'),
(116, 6, 'BLANKET ENGLAND', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal England Uk 160x200</p>', 'blanket_england.gif', 1, 11, '2015-12-26 02:16:55', '2015-12-28 09:04:44'),
(117, 6, 'BLANKET CINNAMOROLL', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Cinnamoroll Uk 160x200</p>', 'blanket_cinnamoroll.gif', 1, 11, '2015-12-26 02:27:18', '2015-12-28 09:05:09'),
(118, 6, 'BLANKET HELLOKITTY TOKIDOKI PINK', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Hellokitty Tokidoki Pink Uk 160x200</p>', 'blanket_hellokitty_tokidoki_pink.gif', 1, 11, '2015-12-26 02:35:15', '2015-12-28 09:05:40'),
(119, 6, 'BLANKET HELLOKITTY MISSHUG', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Hellokitty Misshug Uk 160x200</p>', 'blanket_hellokitty_misshug.gif', 1, 11, '2015-12-26 02:38:18', '2015-12-28 09:06:03'),
(120, 6, 'BLANKET LITTLE TWIN STARS', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Little Twin Stars Uk 160x200</p>', 'blanket_little_twin_stars.gif', 1, 11, '2015-12-26 02:42:02', '2015-12-28 09:06:24'),
(121, 6, 'BLANKET PRINCES', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Princes Uk 160x200</p>', 'blanket_princes.gif', 1, 11, '2015-12-26 03:00:14', '2015-12-28 09:06:57'),
(122, 6, 'BLANKET TENORIKUMA', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Tenorikuma Uk 160x200</p>', 'blanket_tenorikuma.gif', 1, 11, '2015-12-26 03:04:23', '2015-12-28 09:07:17'),
(123, 6, 'BLANKET HELLOKITTY TOKIDOKI YELLOW', NULL, '<p>Internal Blanket adalah Selimut cantik dengan desain terbaru dan tokoh kartun yang menarik&nbsp;<br />dibuat dengan bahan POLYESTER yang berkualitas terbaik ,<br />Blanket dengan bulu yang tebal dan halus nyaman untuk dipakai tidur ....<br />Selimut Internal Hellokitty Tokidoki Yellow Uk 160x200</p>', 'blanket_hellokitty_tokidoki_yellow.gif', 1, 11, '2015-12-26 03:13:38', '2015-12-28 09:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `title`, `name`, `content`, `image`, `email`, `phone_number`, `fax_number`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Internal', 'Internal Group', '<p>Sprei Internal Kualitas kain katun CVC pilihan yang dikombinasikan dengan berbagai motif yang cantik dan elegan seperti USA Flag, Barcode, Channel, Naval, Hologram, Carnival dan Prada membuat internal berhasil menguasai pangsa pasar yang cukup besar di tanah air. Bahan yang lembut tidak mudah luntur pasti bikin kamu ketagihan Sprei Internal King B4 180x200 IDR 139.000 / Pcs ( 4pcs Pillow Case &amp; 2pcs Bolster Case ) Sprei Internal King B2 180x200 IDR 124.000 / Pcs ( 2pcs Pillow Case &amp; 2pcs Bolster Case ) Sprei Internal Queen B4 160x200 IDR 137.000 / Pcs ( 4pcs Pillow Case &amp; 2pcs Bolster Case ) Sprei Internal Queen B2 160x200 IDR 122.000 / Pcs ( 2pcs Pillow Case &amp; 2pcs Bolster Case )</p>', 'internal.gif', 'admin@internal.co.id', '022123456789', '022987654321', 'Jl. Radio Palasari No. 149-150 Bandung', '2015-09-25 15:13:48', '2015-12-18 03:59:20');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `title`, `name`, `content`, `image`, `file`, `created_at`, `updated_at`) VALUES
(1, 'raffi gigi', NULL, NULL, NULL, 'raffi_gigi.mp4', '2015-11-22 12:37:58', '2016-01-25 08:21:20'),
(2, 'Dewi Sandra', NULL, NULL, NULL, 'dewi_sandra.mp4', '2016-01-25 08:20:54', '2016-01-25 08:20:54');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
