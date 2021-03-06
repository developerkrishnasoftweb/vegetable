-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 16, 2021 at 06:38 AM
-- Server version: 5.7.23-23
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saptkri1_grocery`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `image` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `ins` varchar(1) NOT NULL DEFAULT 'y',
  `del` varchar(1) NOT NULL DEFAULT 'y',
  `modi` varchar(1) NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `type`, `email`, `mobile`, `image`, `password`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`, `status`, `ins`, `del`, `modi`) VALUES
(5, 'admin', 'admin', 'admin@gmail.com', '1234567890', 'assets/images/admin/20201102131246.jpeg', 'admin', '2020-09-28 09:34:07', 4, '2020-11-02 13:12:46', 5, 'y', 'y', 'y', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `admin_rights`
--

CREATE TABLE `admin_rights` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL,
  `ins` varchar(1) NOT NULL DEFAULT 'n',
  `del` varchar(1) NOT NULL DEFAULT 'n',
  `modi` varchar(1) NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `charge` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `city_id`, `state_id`, `country_id`, `title`, `pincode`, `charge`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(1, 1, 3, 6, 'Aliganj', '812005', 0, 'y', '2020-11-02 11:21:52', 5, '2020-12-12 15:06:35', 5),
(3, 1, 3, 6, 'Sabour', '813210', 30, 'y', '2020-12-19 11:47:37', 5, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `position` int(11) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `category_id`, `title`, `image`, `position`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(1, 1, 'Pending Payouts', 'assets/images/banner/20201102133348.jpeg', NULL, 'y', '2020-11-02 13:31:28', 5, '2020-11-02 13:33:48', 5),
(2, 2, 'Banner 1', 'assets/images/banner/20201209095658.png', 1, 'y', '2020-11-06 10:43:52', 5, '2021-01-08 12:46:01', 5),
(4, 6, 'Banner 2', 'assets/images/banner/20201209124101.jpg', 2, 'y', '2020-11-19 16:46:18', 5, '2021-01-08 12:46:07', 5),
(6, 3, 'Banner 3', 'assets/images/banner/20201209124140.jpg', NULL, 'y', '2020-12-09 10:36:48', 5, '2020-12-09 12:41:40', 5),
(7, 9, 'Banner 4', 'assets/images/banner/20201209105417.jpg', NULL, 'y', '2020-12-09 10:54:17', 5, '2020-12-09 11:50:35', 5),
(9, 12, 'Banner 4', 'assets/images/banner/20201209124632.jpg', NULL, 'y', '2020-12-09 12:46:32', 5, '0000-00-00 00:00:00', 0),
(12, 17, 'Banner 3', 'assets/images/banner/20210102165250.jpg', 3, 'y', '2021-01-02 13:58:21', 5, '2021-01-08 12:46:16', 5);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_id`, `product_id`, `quantity`, `date`) VALUES
(33, 14, 1, 12, '2020-11-10 09:15:21'),
(48, 23, 1, 4, '2020-11-11 04:25:13'),
(49, 23, 2, 3, '2020-11-11 04:24:47'),
(50, 23, 3, 3, '2020-11-11 04:25:04'),
(51, 27, 1, 1, '2020-11-11 04:43:36'),
(52, 27, 2, 1, '2020-11-11 04:46:36'),
(63, 7, 1, 1, '2020-11-12 03:44:45'),
(71, 7, 3, 1, '2020-11-12 05:09:15'),
(81, 30, 1, 5, '2020-11-13 01:07:21'),
(82, 30, 2, 5, '2020-11-13 01:07:01'),
(83, 30, 3, 1, '2020-11-13 01:08:12'),
(89, 32, 2, 10, '2020-11-18 05:51:34'),
(128, 36, 4, 1, '2020-11-19 17:36:56'),
(129, 37, 2, 1, '2020-11-19 17:48:55'),
(205, 47, 2, 1, '2020-11-27 03:53:53'),
(223, 51, 4, 1, '2020-11-28 07:40:51'),
(230, 56, 1, 2, '2020-12-03 07:42:03'),
(236, 0, 1, 1, '2020-12-03 15:51:37'),
(245, 35, 2, 1, '2020-12-07 07:04:48'),
(247, 3, 9, 22, '2020-12-07 13:07:38'),
(248, 3, 19, 1, '2020-12-07 13:07:47'),
(249, 3, 3, 4, '2020-12-07 13:08:00'),
(250, 3, 8, 11, '2020-12-19 10:37:00'),
(254, 3, 39, 90, '2020-12-08 00:37:54'),
(255, 3, 33, 17, '2020-12-08 00:40:05'),
(269, 35, 48, 2, '2020-12-12 11:46:05'),
(270, 35, 68, 1, '2020-12-12 11:45:48'),
(274, 29, 32, 4, '2020-12-12 16:08:22'),
(275, 29, 48, 2, '2020-12-12 17:08:33'),
(289, 62, 81, 1, '2020-12-17 01:44:29'),
(335, 0, 30, 2, '2020-12-18 06:34:04'),
(336, 100, 40, 1, '2020-12-18 06:39:55'),
(344, 110, 40, 1, '2020-12-18 08:25:00'),
(345, 113, 2, 1, '2020-12-18 08:40:32'),
(351, 46, 107, 1, '2020-12-18 12:40:00'),
(353, 119, 112, 1, '2020-12-19 02:57:09'),
(369, 108, 2, 1, '2020-12-19 07:58:04'),
(371, 126, 107, 1, '2020-12-19 08:44:54'),
(375, 99, 2, 1, '2020-12-19 10:28:23'),
(376, 3, 42, 1, '2020-12-19 10:38:01'),
(404, 87, 35, 1, '2020-12-20 06:53:02'),
(425, 150, 40, 1, '2020-12-20 13:34:43'),
(427, 79, 40, 1, '2020-12-20 16:23:02'),
(428, 79, 22, 1, '2020-12-20 16:24:23'),
(436, 157, 16, 1, '2020-12-21 07:05:52'),
(437, 157, 2, 2, '2020-12-21 07:07:23'),
(440, 122, 106, 2, '2020-12-21 15:45:46'),
(451, 88, 22, 1, '2020-12-22 06:11:56'),
(452, 88, 3, 1, '2020-12-22 06:12:44'),
(454, 96, 24, 1, '2020-12-22 09:11:26'),
(456, 162, 2, 3, '2020-12-22 13:05:59'),
(457, 162, 108, 1, '2020-12-22 13:03:46'),
(460, 163, 3, 1, '2020-12-22 13:23:05'),
(461, 163, 19, 1, '2020-12-22 13:24:11'),
(462, 163, 11, 1, '2020-12-22 13:24:36'),
(466, 128, 108, 1, '2020-12-22 15:36:25'),
(485, 174, 48, 3, '2020-12-23 08:48:19'),
(489, 182, 2, 1, '2020-12-23 12:30:42'),
(491, 181, 82, 1, '2020-12-23 13:45:01'),
(513, 191, 88, 1, '2020-12-24 08:25:35'),
(514, 191, 2, 2, '2020-12-24 08:29:41'),
(515, 191, 3, 1, '2020-12-24 08:26:08'),
(516, 191, 19, 1, '2020-12-24 08:26:21'),
(517, 191, 9, 1, '2020-12-24 08:26:38'),
(519, 191, 21, 1, '2020-12-24 08:27:29'),
(520, 191, 24, 1, '2020-12-24 08:27:46'),
(521, 191, 28, 1, '2020-12-24 08:28:03'),
(523, 191, 11, 1, '2020-12-24 08:28:39'),
(524, 187, 2, 5, '2020-12-24 08:40:05'),
(525, 187, 88, 3, '2020-12-24 08:41:44'),
(527, 183, 16, 2, '2020-12-24 10:39:48'),
(528, 183, 23, 1, '2020-12-24 10:38:32'),
(547, 137, 118, 2, '2020-12-24 12:53:48'),
(556, 166, 2, 1, '2020-12-24 18:10:38'),
(590, 125, 2, 1, '2020-12-25 07:06:11'),
(591, 125, 15, 1, '2020-12-25 06:58:09'),
(594, 201, 2, 1, '2020-12-25 07:54:32'),
(599, 200, 88, 1, '2020-12-25 08:10:45'),
(600, 200, 119, 1, '2020-12-25 08:13:40'),
(659, 126, 3, 1, '2020-12-26 11:11:45'),
(667, 210, 2, 1, '2020-12-26 11:38:07'),
(673, 74, 126, 1, '2020-12-27 05:03:15'),
(674, 74, 122, 1, '2020-12-27 05:03:34'),
(695, 200, 111, 1, '2020-12-27 11:36:59'),
(696, 207, 49, 1, '2020-12-28 00:14:59'),
(697, 207, 111, 1, '2020-12-28 00:15:50'),
(712, 127, 22, 1, '2020-12-29 02:55:18'),
(713, 127, 3, 1, '2020-12-29 02:55:31'),
(714, 127, 24, 1, '2020-12-29 02:55:53'),
(715, 127, 2, 2, '2020-12-29 02:56:23'),
(716, 127, 8, 1, '2020-12-29 02:56:40'),
(717, 127, 9, 1, '2020-12-29 02:57:28'),
(718, 127, 17, 1, '2020-12-29 02:58:04'),
(719, 127, 18, 1, '2020-12-29 02:58:26'),
(729, 227, 88, 3, '2020-12-29 07:27:36'),
(732, 63, 130, 1, '2020-12-29 08:23:45'),
(734, 233, 113, 1, '2020-12-29 08:53:38'),
(759, 233, 35, 1, '2020-12-30 06:20:19'),
(765, 156, 33, 1, '2020-12-30 08:41:46'),
(766, 156, 121, 1, '2020-12-30 08:42:34'),
(767, 239, 2, 2, '2020-12-30 12:28:45'),
(779, 212, 3, 1, '2020-12-30 16:13:13'),
(780, 212, 88, 1, '2020-12-30 16:13:31'),
(781, 212, 11, 1, '2020-12-30 16:14:10'),
(786, 126, 19, 1, '2020-12-31 09:26:40'),
(788, 171, 119, 1, '2020-12-31 12:20:15'),
(790, 98, 19, 1, '2021-01-01 03:30:12'),
(791, 118, 117, 1, '2021-01-01 04:04:49'),
(792, 258, 2, 2, '2021-01-01 06:52:24'),
(793, 258, 3, 1, '2021-01-01 06:52:42'),
(808, 261, 40, 2, '2021-01-02 03:46:19'),
(813, 262, 88, 1, '2021-01-02 06:28:11'),
(815, 269, 2, 1, '2021-01-02 07:55:02'),
(819, 273, 113, 1, '2021-01-02 13:14:51'),
(824, 0, 125, 2, '2021-01-13 06:10:46'),
(856, 90, 88, 3, '2021-01-04 15:43:56'),
(857, 266, 43, 1, '2021-01-04 17:11:35'),
(899, 0, 22, 2, '2021-01-13 06:10:49'),
(904, 284, 88, 1, '2021-01-06 13:30:35'),
(917, 0, 44, 1, '2021-01-08 09:20:22'),
(918, 0, 2, 2, '2021-01-12 01:29:07'),
(919, 0, 19, 2, '2021-01-09 14:12:47'),
(920, 0, 15, 1, '2021-01-09 04:07:33'),
(921, 0, 110, 1, '2021-01-10 00:57:33'),
(922, 0, 3, 1, '2021-01-12 04:01:34'),
(926, 0, 123, 1, '2021-01-12 16:01:05'),
(927, 219, 2, 4, '2021-01-12 16:10:19'),
(930, 219, 88, 8, '2021-01-12 16:07:45'),
(934, 294, 43, 5, '2021-01-13 06:06:42'),
(935, 0, 43, 5, '2021-01-13 06:19:17'),
(937, 294, 40, 1, '2021-01-13 06:18:10'),
(939, 44, 40, 3, '2021-01-13 07:01:46'),
(940, 44, 110, 1, '2021-01-13 07:02:16'),
(941, 298, 119, 1, '2021-01-13 07:44:19'),
(942, 298, 45, 1, '2021-01-13 07:45:05'),
(943, 298, 115, 1, '2021-01-13 07:45:07'),
(944, 298, 50, 1, '2021-01-13 07:45:18'),
(945, 0, 88, 3, '2021-01-13 15:37:06'),
(946, 0, 104, 1, '2021-01-13 15:37:23'),
(953, 128, 28, 3, '2021-01-13 16:42:05'),
(974, 128, 3, 1, '2021-01-13 16:31:46'),
(976, 128, 9, 1, '2021-01-13 16:43:17'),
(982, 274, 2, 1, '2021-01-14 12:16:14'),
(995, 300, 111, 6, '2021-01-16 05:10:31'),
(996, 300, 41, 2, '2021-01-16 05:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `position` int(11) DEFAULT NULL,
  `home_screen` varchar(1) NOT NULL DEFAULT 'n',
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `image`, `position`, `home_screen`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`, `department_id`) VALUES
(2, 'Fruits', 'assets/images/category/20201109122147.png', 2, 'y', 'y', '2020-11-06 10:38:17', 5, '2021-01-08 16:00:04', 5, 1),
(6, 'Vegetable', 'assets/images/category/20201109122230.png', 1, 'y', 'y', '2020-11-06 10:41:13', 5, '2021-01-08 16:00:13', 5, 1),
(14, 'Black forest  Cake', 'assets/images/category/20201225124611.png', 3, 'y', 'y', '2020-12-15 12:41:20', 5, '2020-12-27 15:46:17', 5, 6),
(15, 'Loyal for India', 'assets/images/category/20201229133539.png', 4, 'y', 'y', '2020-12-29 13:35:39', 5, '0000-00-00 00:00:00', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `state_id`, `country_id`, `title`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(1, 3, 6, 'Bhagalpur', 'y', '2020-11-02 11:06:04', 5, '2020-12-12 15:05:28', 5),
(2, 0, 0, '', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `logo` text,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `copyright` varchar(300) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `favicon` text,
  `currency` varchar(200) DEFAULT NULL,
  `timezone` varchar(200) DEFAULT NULL,
  `min_order` varchar(200) DEFAULT NULL,
  `tax` varchar(200) DEFAULT NULL,
  `discount` float NOT NULL,
  `meta_description` text,
  `meta_keywords` text,
  `analytic_key` varchar(100) DEFAULT NULL,
  `pg_charge` int(11) DEFAULT NULL,
  `about` text,
  `about_title` varchar(200) DEFAULT NULL,
  `about_meta_description` text,
  `about_meta_keywords` text,
  `privacy` text,
  `privacy_title` varchar(200) DEFAULT NULL,
  `privacy_meta_description` text,
  `privacy_meta_keywords` text,
  `terms` text,
  `terms_title` varchar(200) DEFAULT NULL,
  `terms_meta_description` text,
  `terms_meta_keywords` text,
  `refund` text,
  `refund_title` varchar(200) DEFAULT NULL,
  `refund_meta_description` text,
  `refund_meta_keywords` text,
  `registration_description` text,
  `registration_title` text,
  `razorpay_key` varchar(200) DEFAULT NULL,
  `razorpay_secret_key` varchar(200) DEFAULT NULL,
  `checkout_title` varchar(200) DEFAULT NULL,
  `checkout_meta_description` text,
  `checkout_meta_keywords` varchar(200) DEFAULT NULL,
  `is_offline` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `title`, `logo`, `contact`, `email`, `copyright`, `address`, `favicon`, `currency`, `timezone`, `min_order`, `tax`, `discount`, `meta_description`, `meta_keywords`, `analytic_key`, `pg_charge`, `about`, `about_title`, `about_meta_description`, `about_meta_keywords`, `privacy`, `privacy_title`, `privacy_meta_description`, `privacy_meta_keywords`, `terms`, `terms_title`, `terms_meta_description`, `terms_meta_keywords`, `refund`, `refund_title`, `refund_meta_description`, `refund_meta_keywords`, `registration_description`, `registration_title`, `razorpay_key`, `razorpay_secret_key`, `checkout_title`, `checkout_meta_description`, `checkout_meta_keywords`, `is_offline`) VALUES
(1, 'Saptkrishi', 'assets/images/20201215122613.png', '+91 7970696383', 'saptkrishibgp@gmail.com', '', 'In front of Blind school, Bhikanpur, Bhagalpur\r\nPin- 812005, Bihar.', 'assets/images/20201215122613favicon.png', '$', 'Asia/Kolkata', '100', '0', 0, NULL, NULL, NULL, NULL, '<p>SaptKrishi is a young Agri-Tech start-up incubated at IIT Kanpur, with youth in decisive roles who are determined to work towards agricultural innovation and the transformation of rural South-East Asia.. The extremely short shelf-life of horticultural and floricultural produce results in a big chunk of the produce not making it to the market and ends up getting wasted. 70% of fruit and vegetable output is wasted, accounting for 40% of the total cost. As a social enterprise, the focus sector for its first phase is the development of low-cost storage and transportation solution for farmers and traders engaged with horticulture and floriculture.</p>\r\n', NULL, NULL, NULL, '<p>Introduction</p>\r\n\r\n<p>We value the trust you place in us. That&#39;s why we insist upon the highest standards for secure transactions and customer information privacy. Please read the following statement to learn about our information gathering and dissemination practices.</p>\r\n\r\n<p>Note: Our privacy policy is subject to change at any time without notice. To make sure you are aware of any changes, please review this policy periodically.</p>\r\n\r\n<p>By visiting this Website or mobile application you agree to be bound by the terms and conditions of this Privacy Policy. If you do not agree please do not use or access our Website.</p>\r\n\r\n<p>By mere use of the Website, you expressly consent to our use and disclosure of your personal information in accordance with this Privacy Policy. This Privacy Policy is incorporated into and subject to the Terms of Use.</p>\r\n\r\n<p>Collection of Personally Identifiable Information and other Information</p>\r\n\r\n<p>When you use our Website, we collect and store your personal information which is provided by you from time to time. Our primary goal in doing so is to provide you a safe, efficient, smooth and customized experience. This allows us to provide services and features that most likely meet your needs, and to customize our Website to make your experience safer and easier. More importantly, while doing so we collect personal information from you that we consider necessary for achieving this purpose.</p>\r\n\r\n<p>In general, you can browse the Website without telling us who you are or revealing any personal information about yourself. Once you give us your personal information, you are not anonymous to us. Where possible, we indicate which fields are required and which fields are optional. You always have the option to not provide information by choosing not to use a particular service or feature on the Website. We may automatically track certain information about you based upon your behaviour on our Website. We use this information to do internal research on our users&#39; demographics, interests, and behaviour to better understand, protect and serve our users. This information is compiled and analysed on an aggregated basis. This information may include the URL that you just came from (whether this URL is on our Website or not), which URL you next go to (whether this URL is on our Website or not), your computer browser information, and your IP address.We use data collection devices such as &quot;cookies&quot; on certain pages of the Website to help analyse our web page flow, measure promotional effectiveness, and promote trust and safety. &quot;Cookies&quot; are small files placed on your hard drive that assist us in providing our services. We offer certain features that are only available through the use of a &quot;cookie&quot;. We also use cookies to allow you to enter your password less frequently during a session. Cookies can also help us provide information that is targeted to your interests. Most cookies are &quot;session cookies,&quot; meaning that they are automatically deleted at the end of a session. You are always free to decline our cookies if your browser permits, although in that case you may not be able to use certain features on the Website and you may be required to re-enter your password more frequently during a session.</p>\r\n\r\n<p>Additionally, you may encounter &quot;cookies&quot; or other similar devices on certain pages of the Website that are placed by third parties. We do not control the use of cookies by third parties.</p>\r\n\r\n<p>If you choose to buy on the Website, we collect information about your buying behaviour.</p>\r\n\r\n<p>If you transact with us, we collect some additional information, such as a billing address, a credit / debit card number and a credit / debit card expiration date and/ or other payment instrument details and tracking information from cheques or money orders.</p>\r\n\r\n<p>If you choose to post messages on our message boards, chat rooms or other message areas or leave feedback, we will collect that information you provide to us. We retain this information as necessary to resolve disputes, provide customer support and troubleshoot problems as permitted by law.</p>\r\n\r\n<p>If you send us personal correspondence, such as emails or letters, or if other users or third parties send us correspondence about your activities or postings on the Website, we may collect such information into a file specific to you.</p>\r\n\r\n<p>We collect personally identifiable information (email address, name, phone number, credit card / debit card / other payment instrument details, etc.) from you when you set up a free account with us. While you can browse some sections of our Website without being a registered member, certain activities (such as placing an order) do require registration. We do use your contact information to send you offers based on your previous orders and your interests.</p>\r\n\r\n<p>Use of Demographic / Profile Data / Your Information</p>\r\n\r\n<p>We use personal information to provide the services you request. To the extent we use your personal information to market to you, we will provide you the ability to opt-out of such uses. We use your personal information to resolve disputes; troubleshoot problems; help promote a safe service; collect money; measure consumer interest in our products and services, inform you about online and offline offers, products, services, and updates; customize your experience; detect and protect us against error, fraud and other criminal activity; enforce our terms and conditions; and as otherwise described to you at the time of collection.</p>\r\n\r\n<p>With your consent, we will have access to your SMS, contacts in your directory, location and device information. We may share this data with our affiliates. In the event that consent to this such use of data is withdrawn in the future, we will stop collection of such data but continue to store the data and use it for internal purposes to further improve our services.</p>\r\n\r\n<p>In our efforts to continually improve our product and service offerings, we collect and analyse demographic and profile data about our users&#39; activity on our Website.</p>\r\n\r\n<p>We identify and use your IP address to help diagnose problems with our server, and to administer our Website. Your IP address is also used to help identify you and to gather broad demographic information.</p>\r\n\r\n<p>We will occasionally ask you to complete optional online surveys. These surveys may ask you for contact information and demographic information (like pin code, age, or income level). We use this data to tailor your experience at our Website, providing you with content that we think you might be interested in and to display content according to your preferences.</p>\r\n\r\n<p>Sharing of personal information</p>\r\n\r\n<p>We may share personal information with our other corporate entities and affiliates. These entities and affiliates may market to you as a result of such sharing unless you explicitly opt-out.</p>\r\n\r\n<p>We may disclose personal information to third parties. This disclosure may be required for us to provide you access to our Services, to comply with our legal obligations, to enforce our User Agreement, to facilitate our marketing and advertising activities, or to prevent, detect, mitigate, and investigate fraudulent or illegal activities related to our Services. We do not disclose your personal information to third parties for their marketing and advertising purposes without your explicit consent.</p>\r\n\r\n<p>We may disclose personal information if required to do so by law or in the good faith belief that such disclosure is reasonably necessary to respond to subpoenas, court orders, or other legal process. We may disclose personal information to law enforcement offices, third party rights owners, or others in the good faith belief that such disclosure is reasonably necessary to: enforce our Terms or Privacy Policy; respond to claims that an advertisement, posting or other content violates the rights of a third party; or protect the rights, property or personal safety of our users or the general public.</p>\r\n\r\n<p>We and our affiliates will share / sell some or all of your personal information with another business entity should we (or our assets) plan to merge with, or be acquired by that business entity, or re-organization, amalgamation, restructuring of business. Should such a transaction occur that other business entity (or the new combined entity) will be required to follow this privacy policy with respect to your personal information.</p>\r\n\r\n<p>Links to Other Sites</p>\r\n\r\n<p>Our Website links to other websites that may collect personally identifiable information about you. Myntra is not responsible for the privacy practices or the content of those linked websites.</p>\r\n\r\n<p>Security Precautions</p>\r\n\r\n<p>Our Website has stringent security measures in place to protect the loss, misuse, and alteration of the information under our control. Whenever you change or access your account information, we offer the use of a secure server. Once your information is in our possession we adhere to strict security guidelines, protecting it against unauthorized access.</p>\r\n\r\n<p>Choice/Opt-Out</p>\r\n\r\n<p>We provide all users with the opportunity to opt-out of receiving non-essential (promotional, marketing-related) communications from us on behalf of our partners, and from us in general, after setting up an account.</p>\r\n\r\n<p>If you want to remove your contact information from all www.myntra.com lists and newsletters, please visit unsubscribe.</p>\r\n\r\n<p>Advertisements on www.myntra.com</p>\r\n\r\n<p>We use third-party advertising companies to serve ads when you visit our Website. These companies may use information (not including your name, address, email address, or telephone number) about your visits to this and other websites in order to provide advertisements about goods and services of interest to you.</p>\r\n\r\n<p>Your Consent</p>\r\n\r\n<p>By using the Website and/ or by providing your information, you consent to the collection and use of the information you disclose on the Website in accordance with this Privacy Policy, including but not limited to Your consent for sharing your information as per this privacy policy.</p>\r\n\r\n<p>If we decide to change our privacy policy, we will post those changes on this page so that you are always aware of what information we collect, how we use it, and under what circumstances we disclose it.</p>\r\n\r\n<p>Grievance Officer</p>\r\n\r\n<p>In accordance with Information Technology Act 2000 and rules made there under, the name and contact details of the Grievance Officer are provided below:</p>\r\n\r\n<p>Mr. Arun Kumar S</p>\r\n\r\n<p>Designation: Senior Manager - CC - Operations</p>\r\n\r\n<p>Myntra Designs Pvt Ltd ,</p>\r\n\r\n<p>Alyssa, Begonia and Clover situated in Embassy Tech Village,</p>\r\n\r\n<p>Outer Ring Road, Devarabeesanahalli Village, Varthur Hobli, Bengaluru, Karnataka: 560103, India</p>\r\n\r\n<p>Contact us: ccmanager@myntra.com</p>\r\n\r\n<p>Phone: +91-80-61561999</p>\r\n\r\n<p>Time: Mon - Sat (9:00 - 18:00).</p>\r\n', NULL, NULL, NULL, '<p>Welcome to Myntra. This document is an electronic record in terms of Information Technology Act, 2000 and published in accordance with the provisions of Rule 3 ) of the Information Technology (Intermediaries guidelines) Rules, 2011 that require publishing the rules and regulations, privacy policy and Terms of Use for access or usage of Myntra marketplace platform - www.myntra.com (hereinafter referred to as &quot;Platform&quot;)</p>\r\n\r\n<p>The Platform is owned by Myntra Designs Private Limited, having its registered office at Buildings Alyssa, Begonia and Clover situated in Embassy Tech Village, Outer Ring Road, Devarabeesanahalli Village, Varthur Hobli, Bengaluru &ndash; 560103, India and its branch office at Plot 82 A - 2nd and 3rd Floor, Sector 18 Gurugram Haryana, India.</p>\r\n\r\n<p>Your use of the Myntra and services and tools are governed by the following terms and conditions (&quot;<strong>Terms of Use</strong>&quot;) as applicable to the Myntra including the applicable policies which are incorporated herein by way of reference. By mere use of the Myntra, You shall be contracting with Myntra Designs Private Limited, the owner of the Platform. These terms and conditions including the policies constitute Your binding obligations, with Myntra.</p>\r\n\r\n<p>For the purpose of these Terms of Use, wherever the context so requires &quot;<strong>You</strong>&quot; or &quot;<strong>User</strong>&quot; shall mean any natural or legal person who has agreed to become a buyer on Platform by providing data while registering on the Platform as Registered User. The term &quot;<strong>Myntra</strong>&quot;,&quot;<strong>We</strong>&quot;,&quot;<strong>Us</strong>&quot;,&quot;<strong>Our</strong>&quot; shall mean Myntra Designs Private Limited and its affiliates.</p>\r\n\r\n<p>When You use any of the services provided by Us through the Platform, including but not limited to, (e.g. Product Reviews, Seller Reviews), You will be subject to the rules, guidelines, policies, terms, and conditions applicable to such service, and they shall be deemed to be incorporated into this Terms of Use and shall be considered as part and parcel of this Terms of Use. We reserve the right, at Our sole discretion, to change, modify, add or remove portions of these Terms of Use, at any time without any prior written notice to You. You shall ensure to review these Terms of Use periodically for updates/changes. Your continued use of the Platform following the posting of changes will mean that You accept and agree to the revisions. As long as You comply with these Terms of Use, We grant You a personal, non-exclusive, non-transferable, limited privilege to enter and use the Platform. By impliedly or expressly accepting these Terms of Use, You also accept and agree to be bound by Myntra Policies including but not limited to Privacy Policy as amended from time to time.</p>\r\n\r\n<p>1. User Account, Password, and Security:</p>\r\n\r\n<p>If You use the Platform, You shall be responsible for maintaining the confidentiality of your Display Name and Password and You shall be responsible for all activities that occur under your Display Name and Password. You agree that if You provide any information that is untrue, inaccurate, not current or incomplete, We shall have the right to indefinitely suspend or terminate or block access of your membership on the Platform.</p>\r\n\r\n<p>You agree to</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>immediately notify Myntra of any unauthorized use / breach of your password or account and</p>\r\n	</li>\r\n	<li>\r\n	<p>ensure that you exit from your account at the end of each session.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>2. Services Offered:</p>\r\n\r\n<p>Myntra provides a number of Internet-based services through the Platform. One such Service enables Users to purchase original merchandise such as clothing, footwear and accessories from various fashion and lifestyle brands (collectively, &quot;Products&quot;). The Products can be purchased through the Platform through various methods of payments offered. The sale/purchase of Products shall be additionally governed by specific policies of sale, like cancellation policy, exchange policy, return policy, etc. (which are found on the FAQ tab on the Platform and all of which are incorporated here by reference). It is clarified that at the time of creating a return request, users are required to confirm (via a check box click) that the product being returned is unused and has the original tags intact. If the product returned by the user is used, damaged or if the original tags are missing, the user&rsquo;s return request shall be declined, and the said product shall be re-shipped back to the customer. In the event that the return request is declined, the user shall not be eligible for a refund, and Myntra assumes no liability in this regard. Further, in the event that the user fails to accept the receipt of the said re-shipped product, the user shall continue to be not eligible for a refund, and Myntra assumes no liability with respect to the return or refund for the said re-shipped product. In addition, these Terms of Use may be further supplemented by Product specific conditions, which may be displayed with that Product.</p>\r\n\r\n<p>Myntra does not warrant that Product description or other content on the Platform is accurate, complete, reliable, current, or error-free and assumes no liability in this regard.</p>\r\n\r\n<p>3. Platform for Transaction and Communication:</p>\r\n\r\n<p>The Users utilize to meet and interact with one another for their transactions on the Platform. Myntra is not and cannot be a party to or control in any manner any transaction between the Myntra&#39;s Users. Henceforward:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>All commercial/contractual terms are offered by and agreed to between Buyers and Sellers alone. The commercial/contractual terms include without limitation price, shipping costs, payment methods, payment terms, date, period and mode of delivery, warranties related to products and services and after sales services related to products and services. Myntra does not have any control or does not determine or advise or in any way involve itself in the offering or acceptance of such commercial/contractual terms between the Buyers and Sellers.</p>\r\n	</li>\r\n	<li>\r\n	<p>Myntra does not make any representation or Warranty as to specifics (such as quality, value, salability, etc) of the products or services proposed to be sold or offered to be sold or purchased on the Platform.</p>\r\n	</li>\r\n	<li>\r\n	<p>Myntra is not responsible for any non-performance or breach of any contract entered into between Buyers and Sellers. Myntra cannot and does not guarantee that the concerned Buyers and/or Sellers will perform any transaction concluded on the Platform.</p>\r\n	</li>\r\n	<li>\r\n	<p>At no time shall Myntra hold any right, title or interest over the products nor shall Myntra have any obligations or liabilities in respect of such contract entered into between Buyers and Sellers.</p>\r\n	</li>\r\n	<li>\r\n	<p>The Myntra is only a platform that can be utilized by Users to reach a larger base to buy and sell products or services. Myntra is only providing a platform for communication and it is agreed that the contract for sale of any of the products or services shall be a strictly bipartite contract between the Seller and the Buyer. At no time shall Myntra hold any any right, title or interest over the products nor shall Myntra have any obligations or liabilities in respect of such contract. Myntra is not responsible for unsatisfactory or delayed performance of services or damages or delays as a result of products which are out of stock, unavailable or back ordered.</p>\r\n	</li>\r\n	<li>\r\n	<p>Pricing on any product(s) as is reflected on the Platform may due to some technical issue, typographical error or product information published by seller may be incorrectly reflected and in such an event seller may cancel such your order(s).</p>\r\n	</li>\r\n	<li>\r\n	<p>You release and indemnify Myntra and/or any of its officers and representatives from any cost, damage, liability or other consequence of any of the actions of the Users of the Myntra and specifically waive any claims that you may have in this behalf under any applicable law. Notwithstanding its reasonable efforts in that behalf, Myntra cannot take responsibility or control the information provided by other Users which is made available on the Platform.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>4. User Conduct and Rules on the Platform:</p>\r\n\r\n<p>You agree, undertake and confirm that Your use of the Platform shall be strictly governed by the following binding principles:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>You shall not host, display, upload, modify, publish, transmit, update or share any information which:</p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>belongs to another person and to which You do not have any right to</p>\r\n		</li>\r\n		<li>\r\n		<p>is grossly harmful, harassing, blasphemous, defamatory, obscene, pornographic, paedophilic, libellous, invasive of another&#39;s privacy, hateful, or racially, ethnically objectionable, disparaging, relating or encouraging money laundering or gambling, or otherwise unlawful in any manner whatever</p>\r\n		</li>\r\n		<li>\r\n		<p>is misleading in any way</p>\r\n		</li>\r\n		<li>\r\n		<p>involves the transmission of &quot;junk mail&quot;, &quot;chain letters&quot;, or unsolicited mass mailing or &quot;spamming&quot;</p>\r\n		</li>\r\n		<li>\r\n		<p>promotes illegal activities or conduct that is abusive, threatening, obscene, defamatory or libellous</p>\r\n		</li>\r\n		<li>\r\n		<p>infringes upon or violates any third party&#39;s rights including, but not limited to, intellectual property rights, rights of privacy (including without limitation unauthorized disclosure of a person&#39;s name, email address, physical address or phone number) or rights of publicity</p>\r\n		</li>\r\n		<li>\r\n		<p>contains restricted or password-only access pages, or hidden pages or images (those not linked to or from another accessible page)</p>\r\n		</li>\r\n		<li>\r\n		<p>provides instructional information about illegal activities such as making or buying illegal weapons, violating someone&#39;s privacy, or providing or creating computer viruses</p>\r\n		</li>\r\n		<li>\r\n		<p>contains video, photographs, or images of another person (with a minor or an adult).</p>\r\n		</li>\r\n		<li>\r\n		<p>tries to gain unauthorized access or exceeds the scope of authorized access to the Platform or to profiles, blogs, communities, account information, bulletins, friend request, or other areas of the Platform or solicits passwords or personal identifying information for commercial or unlawful purposes from other users</p>\r\n		</li>\r\n		<li>\r\n		<p>interferes with another USER&#39;s use and enjoyment of the Platform or any other individual&#39;s User and enjoyment of similar services</p>\r\n		</li>\r\n		<li>\r\n		<p>infringes any patent, trademark, copyright or other proprietary rights or third party&#39;s trade secrets or rights of publicity or privacy or shall not be fraudulent or involve the sale of counterfeit or stolen products</p>\r\n		</li>\r\n		<li>\r\n		<p>violates any law for the time being in force</p>\r\n		</li>\r\n		<li>\r\n		<p>threatens the unity, integrity, defence, security or sovereignty of India, friendly relations with foreign states, or public order or causes incitement to thecommission of any cognizable offence or prevents investigation of any offence or is insulting any other nation</p>\r\n		</li>\r\n		<li>\r\n		<p>shall not be false, inaccurate or misleading</p>\r\n		</li>\r\n		<li>\r\n		<p>shall not create liability for Us or cause Us to lose (in whole or in part) the services of Our internet service provider (&quot;ISPs&quot;) or other suppliers</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>A User may be considered fraudulent or loss to business due to fraudulent activity if any of the following scenarios are met:</p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Users doesn&#39;t reply to the payment verification mail sent by Myntra</p>\r\n		</li>\r\n		<li>\r\n		<p>Users fails to produce adequate documents during the payment details verification</p>\r\n		</li>\r\n		<li>\r\n		<p>Misuse of another Users&#39;s phone/email</p>\r\n		</li>\r\n		<li>\r\n		<p>Users uses invalid address, email and phone no.</p>\r\n		</li>\r\n		<li>\r\n		<p>Overuse of a voucher code</p>\r\n		</li>\r\n		<li>\r\n		<p>Use of a special voucher not tagged to the email ID used.</p>\r\n		</li>\r\n		<li>\r\n		<p>Users returns the wrong product</p>\r\n		</li>\r\n		<li>\r\n		<p>Users refuses to pay for an order</p>\r\n		</li>\r\n		<li>\r\n		<p>Users involved in the snatch and run of any order</p>\r\n		</li>\r\n		<li>\r\n		<p>Miscellaneous activities conducted with the sole intention to cause loss to business/revenue to Myntra</p>\r\n		</li>\r\n		<li>\r\n		<p>User with a very high return rate</p>\r\n		</li>\r\n		<li>\r\n		<p>Repeated request for monetary compensation for fake/used order</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Myntra may cancel any order that classify as &#39;Bulk Orders&#39;/&#39;Fraud orders&#39; under certain criteria at any stage of the product delivery. An order can be classified as &#39;Bulk Order&#39;/&#39;Fraud Order&#39; if it meets with the below mentioned criteria, and any additional criteria as defined by Myntra:</p>\r\n\r\n	<ul>\r\n		<li>\r\n		<p>Products ordered are not for self-consumption but for commercial resale</p>\r\n		</li>\r\n		<li>\r\n		<p>Multiple orders placed for same product at the same address, depending on the product category.</p>\r\n		</li>\r\n		<li>\r\n		<p>Bulk quantity of the same product ordered</p>\r\n		</li>\r\n		<li>\r\n		<p>Invalid address given in order details</p>\r\n		</li>\r\n		<li>\r\n		<p>Any malpractice used to place the order</p>\r\n		</li>\r\n		<li>\r\n		<p>Any promotional voucher used for placing the &#39;Bulk Order&#39; may not be refunded</p>\r\n		</li>\r\n		<li>\r\n		<p>Any order paced using a technological glitch/loophole.</p>\r\n		</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>You shall not use the Platform for any unlawful and fraudulent purposes, which may cause annoyance and inconvenience and abuses any policy and rules of the company and interrupt or causes to interrupt, damages the use by other Users of Myntra.</p>\r\n	</li>\r\n	<li>\r\n	<p>You shall not use any false e-mail address, impersonates any person or entity, or otherwise misleads Myntra by sharing multiple address and phone numbers or transacting with malafide intentions.</p>\r\n	</li>\r\n	<li>\r\n	<p>We on certain landing page even allow our Users to experience free exchange of ideas and observations regarding interest in the field of fashion, including &lsquo;viewing user generated content&rsquo; and/or &lsquo;videos&rsquo; and &lsquo;posting comments&rsquo;. By accessing, viewing and/or posting any user generated content to any specific dedicated page on the Platform, you accept and consent to the practices described in these &lsquo;Terms of Service&rsquo; and &lsquo;Privacy Policies&rsquo;, as well as any other terms of prescribed by the Myntra on the Platform. You agree and undertake that when accessing, viewing and/or posting any user generated content on these pages You will not imitate, abuse, harass, any Customer/User or violate and exploit, any of these &lsquo;Terms of Service&rsquo; of the Platform.</p>\r\n	</li>\r\n	<li>\r\n	<p>You shall not use any &quot;deep-link&quot;, &quot;page-scrape&quot;, &quot;robot&quot;, &quot;spider&quot; or other automatic device, program, algorithm or methodology, or any similar or equivalent manual process, to access, acquire, copy or monitor any portion of the Platform or any Content, or in any way reproduce or circumvent the navigational structure or presentation of the Platform or any Content, to obtain or attempt to obtain any materials, documents or information through any means not purposely made available through the Platform. We reserve Our right to bar any such activity.</p>\r\n	</li>\r\n	<li>\r\n	<p>You shall not attempt to gain unauthorized access to any portion or feature of the Platform, or any other systems or networks connected to the Platform or to any server, computer, network, or to any of the services offered on or through the Platform, by hacking, password &quot;mining&quot; or any other illegitimate means.</p>\r\n	</li>\r\n	<li>\r\n	<p>You may not pretend that You are, or that You represent, someone else, or impersonate any other individual or entity</p>\r\n	</li>\r\n	<li>\r\n	<p>You shall at all times ensure full compliance with the applicable provisions of the Information Technology Act, 2000 and rules thereunder as applicable and as amended from time to time and also all applicable Domestic laws, rules and regulations (including the provisions of any applicable Exchange Control Laws or Regulations in Force) and International Laws, Foreign Exchange Laws, Statutes, Ordinances and Regulations (including, but not limited to Sales Tax/VAT, Income Tax, Octroi, Service Tax, Central Excise, Custom Duty, Local Levies) regarding Your use of Our service and Your listing, purchase, solicitation of offers to purchase, and sale of products or services. You shall not engage in any transaction in an item or service, which is prohibited by the provisions of any applicable law including exchange control laws or regulations for the time being in force.</p>\r\n	</li>\r\n	<li>\r\n	<p>From time to time, You shall be responsible for providing information relating to the products or services proposed to be sold by You. In this connection, You undertake that all such information shall be accurate in all respects. You shall not exaggerate or over emphasize the attributes of such products or services so as to mislead other Users in any manner.</p>\r\n	</li>\r\n	<li>\r\n	<p>You shall not engage in advertising to, or solicitation of, other Users of the Platform to buy or sell any products or services, including, but not limited to, products or services related to that being displayed on the Platform or related to us.</p>\r\n	</li>\r\n	<li>\r\n	<p>The Content posted does not necessarily reflect Myntra views. In no event shall Myntra assume or have any responsibility or liability for any Content posted or for any claims, damages or losses resulting from use of Content and/or appearance of Content on the Platform. You hereby represent and warrant that You have all necessary rights in and to all Content which You provide and all information it contains and that such Content shall not infringe any proprietary or other rights of third parties or contain any libellous, tortious, or otherwise unlawful information.</p>\r\n	</li>\r\n	<li>\r\n	<p>Myntra hereby disclaims any guarantees of exactness as to the finish, appearance, size, color etc., of the final Product as ordered by the User. Myntra Return &amp; Exchange Policy offers you the option to return or exchange items purchased on Myntra within the return/exchange period (Please read the Product Detail Page to see the number of days upto which a product can be returned/exchanged, post-delivery). In case of return of the purchased item, please refer to the &quot;Return Policy&quot; on our Myntra.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>5. Contents Posted on Platform:</p>\r\n\r\n<p>All text, graphics, user interfaces, visual interfaces, photographs, trademarks, logos, sounds, music and artwork (collectively, &quot;Content&quot;), is a third party user generated content and Myntra has no control over such third party user generated content as Myntra is merely an intermediary for the purposes of this Terms of Use. Such Content will become Our property and You grant Us the worldwide, perpetual and transferable rights in such Content. We shall be entitled to, consistent with Our Privacy Policy as adopted in accordance with applicable law, use the Content or any of its elements for any type of use forever, including but not limited to promotional and advertising purposes and in any media whether now known or hereafter devised, including the creation of derivative works that may include the Content You provide.</p>\r\n\r\n<p>You may use information on the products and services purposely made available on the Platform for downloading, provided that You</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>do not remove any proprietary notice language in all copies of such documents,</p>\r\n	</li>\r\n	<li>\r\n	<p>use such information only for your personal, non-commercial informational purpose and do not copy or post such information on any networked computer or broadcast it in any media,</p>\r\n	</li>\r\n	<li>\r\n	<p>make no modifications to any such information, and</p>\r\n	</li>\r\n	<li>\r\n	<p>do not make any additional representations or warranties relating to such documents.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>6. Disclaimer of Warranties and Liability:</p>\r\n\r\n<p>All the materials and products (including but not limited to software) and services, included on or otherwise made available to You through Platform are provided on &quot;as is&quot; and &quot;as available&quot; basis without any representation or warranties, express or implied except otherwise specified in writing. Without prejudice to the forgoing paragraph, Myntra does not warrant that: Platform will be constantly available, or available at all or The information on Platform is complete, true, accurate or non-misleading.</p>\r\n\r\n<p>All the Products sold on Platform are governed by different state laws and if Seller is unable to deliver such Products due to implications of different state laws, Seller will return or will give credit for the amount (if any) received in advance by Seller from the sale of such Product that could not be delivered to You. You will be required to enter a valid phone number while placing an order on the Platform. By registering Your phone number with us, You consent to be contacted by Us via phone calls and/or SMS notifications, in case of any order or shipment or delivery related updates. We will not use your personal information to initiate any promotional phone calls or SMS.</p>\r\n\r\n<p>7. Selling:</p>\r\n\r\n<p>As a registered seller, you are allowed to list item(s) for sale on the Platform in accordance with the Policies which are incorporated by way of reference in this Terms of Use. You must be legally able to sell the item(s) you list for sale on the Platform. You must ensure that the listed items do not infringe upon the intellectual property, trade secret or other proprietary rights or rights of publicity or privacy rights of third parties. Listings may only include text descriptions, graphics and pictures that describe your item for sale. All listed items must be listed in an appropriate category on the Platform. All listed items must be kept in stock for successful fulfilment of sales. The listing description of the item must not be misleading and must describe actual condition of the product. If the item description does not match the actual condition of the item, you agree to refund any amounts that you may have received from the Buyer. You agree not to list a single product in multiple quantities across various categories on the Platform. Myntra reserves the right to delete such multiple listings of the same product listed by you in various categories.</p>\r\n\r\n<p>We may provide you alternation services (limited to alteration of length, alteration of the waist size) for the garments purchased by You from Us. This service shall be free of cost and no amount would be collected from You for such alteration. However, a nominal fee as mentioned by Myntra at the time of creating the alteration request (inclusive of service tax) would be applicable as convenience charge towards pick up and drop of the garments or towards tailor visit (wherever applicable).</p>\r\n\r\n<p>8. E-Platform for Communication:</p>\r\n\r\n<p>You agree, understand and acknowledge that Myntra is an online platform that enables you to purchase products listed on the Platform at the price indicated therein at any time. You further agree and acknowledge that Myntra is only a facilitator and is not and cannot be a party to or control in any manner any transactions on Myntra.</p>\r\n\r\n<p>9. Indemnity:</p>\r\n\r\n<p>You shall indemnify and hold harmless Myntra, its owner, licensee, affiliates, subsidiaries, group companies (as applicable) and their respective officers, directors, agents, and employees, from any claim or demand, or actions including reasonable attorneys&#39; fees, made by any third party or penalty imposed due to or arising out of Your breach of this Terms of Use, privacy Policy and other Policies, or Your violation of any law, rules or regulations or the rights (including infringement of intellectual property rights) of a third party.</p>\r\n\r\n<p>10. Trademark, Copyright and Restriction:</p>\r\n\r\n<p>Platform is controlled and operated by Myntra and products are sold by respective Sellers. All material on Platform, including images, illustrations, audio clips, and video clips, are protected by copyrights, trademarks, and other intellectual property rights. Material on Myntra is solely for Your personal, non-commercial use. You must not copy, reproduce, republish, upload, post, transmit or distribute such material in any way, including by email or other electronic means and whether directly or indirectly and You must not assist any other person to do so. Without the prior written consent of the owner, modification of the materials, use of the materials on any other Myntra or networked computer environment or use of the materials for any purpose other than personal, non-commercial use is a violation of the copyrights, trademarks and other proprietary rights, and is prohibited. Any use for which You receive any remuneration, whether in money or otherwise, is a commercial use for the purposes of this clause. It is expressly clarified that You will retain ownership and shall solely be responsible for any content that You provide or upload when using any Service, including any text, data, information, images, photographs, music, sound, video or any other material which you may upload, transmit or store when making use of Our various Service. However, We reserve the right to use/reproduce any content uploaded by You and You agree to grant royalty free, irrevocably, unconditionally, perpetually and worldwide right to Us to use the content for reasonable business purpose.</p>\r\n\r\n<p>11. Limitation of Liability:</p>\r\n\r\n<p>In no event shall Myntra be liable for any indirect, punitive, incidental, special, consequential damages or any other damages resulting from:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>the use or the inability to use the Services or Products</p>\r\n	</li>\r\n	<li>\r\n	<p>unauthorized access to or alteration of the user&#39;s transmissions or data</p>\r\n	</li>\r\n	<li>\r\n	<p>breach of condition, representations or warranties by the manufacturer of the Products</p>\r\n	</li>\r\n	<li>\r\n	<p>any other matter relating to the services including, without limitation, damages for loss of use, data or profits, arising out of or in any way connected with the use or performance of the Platform or Service. Myntra shall not be held responsible for non-availability of the Myntra during periodic maintenance operations or any unplanned suspension of access to the Myntra. The User understands and agrees that any material and/or data downloaded at Myntra is done entirely at Users own discretion and risk and they will be solely responsible for any damage to their mobile or loss of data that results from the download of such material and/or data. To the maximum extend that is permissible under law, Myntra&rsquo;s liability shall be limited to an amount equal to the Products purchased value bought by You. Myntra shall not be liable for any dispute or disagreement between Users</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>12. Termination:</p>\r\n\r\n<p>Myntra may suspend or terminate your use of the Myntra or any Service if it believes, in its sole and absolute discretion that you have infringed, breached, violated, abused, or unethically manipulated or exploited any term of these Terms of Service or anyway otherwise acted unethically. Notwithstanding anything in this clause, these Terms of Service will survive indefinitely unless and until Myntra chooses to terminate them.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>If You or Myntra terminates your use of the Platform or any Service, Myntra may delete any content or other materials relating to your use of the Service and Myntra will have no liability to you or any third party for doing so. However, your transactions details may be preserved by Myntra for purposes of tax or regulatory compliance.</p>\r\n	</li>\r\n	<li>\r\n	<p>Myntra may unilaterally terminate Your account on any event as mentioned in the Terms Of Use. Any credits earned through loyalty or referral program, Myntra credit and pending refunds if any will be forfeited in such case. Returns/Refund for such Users shall be at the sole discretion of Myntra.</p>\r\n	</li>\r\n	<li>\r\n	<p>If You use any false e-mail address or use the portal for any unlawful and fraudulent purposes, which may cause annoyance and inconvenience and abuses any policy and rules of the company or mislead Myntra by sharing multiple address and phone numbers or transacting with malafide intentions then Myntra reserves the right to refuse access to the portal, terminate accounts including any linked accounts without notice to you.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>13. Jurisdictional Issues/Sale in India Only:</p>\r\n\r\n<p>Unless otherwise specified, the material on the Platform is presented solely for the purpose of sale in India. Myntra make no representation that materials in the Platform are appropriate or available for use in other locations/Countries other than India. Those who choose to access Platform from other locations/Countries other than India do so on their own initiative and Myntra is not responsible for supply of products/refund for the products ordered from other locations/Countries other than India, compliance with local laws, if and to the extent local laws are applicable.</p>\r\n\r\n<p>14. Governing Law:</p>\r\n\r\n<p>These terms shall be governed by and constructed in accordance with the laws of India without reference to conflict of laws principles and disputes arising in relation hereto shall be subject to the exclusive jurisdiction of courts, tribunals, fora, applicable authorities at Bangalore. The place of jurisdiction shall be exclusively in Bangalore.</p>\r\n\r\n<p>15. Contacting the Seller:</p>\r\n\r\n<p>At Myntra, we are committed towards ensuring that disputes between Sellers and Buyers are settled amicably by way of the above dispute resolution mechanisms and procedures. However, in the event that You wish to contact Myntra about the seller, You may proceed to do so by clicking on the seller name on the product listing pages. Alternatively, You may also reach out to customer support at +91-80-61561999 or access help center at https://www.myntra.com/contactus</p>\r\n\r\n<p>16. Disclaimer:</p>\r\n\r\n<p>You acknowledge and undertake that you are accessing the services on the Platform and transacting at your own risk and are using your best and prudent judgment before entering into any transactions through Myntra. We shall neither be liable nor responsible for any actions or inactions of sellers nor any breach of conditions, representations or warranties by the sellers or manufacturers of the products and hereby expressly disclaim and any all responsibility and liability in that regard. We shall not mediate or resolve any dispute or disagreement between You and the sellers or manufacturers of the products. We further expressly disclaim any warranties or representations (express or implied) in respect of quality, suitability, accuracy, reliability, completeness, timeliness, performance, safety, merchantability, fitness for a particular purpose, or legality of the products listed or displayed or transacted or the content (including product or pricing information and/or specifications) on Platform. While we have taken precautions to avoid inaccuracies in content, this website, all content, information (including the price of products), software, products, services and related graphics are provided as is, without warranty of any kind. At no time shall any right, title or interest in the products sold through or displayed on Platform vest with Myntra nor shall Myntra have any obligations or liabilities in respect of any transactions on Platform.</p>\r\n\r\n<p>Delivery Related - User agrees and acknowledges that any claims regarding order delivery (including non-receipt/ non- delivery of order or signature verification) shall be notified to Myntra within 5 days from the alleged date of delivery of product reflecting on the Myntra portal. Non notification by You of non-receipt or non-delivery within the time period specified shall be construed as a deemed delivery in respect of that transaction. Myntra disclaims any liability or responsibility for claims regarding non-delivery, non-receipt of order (including signature verification in Proof of delivery) after 5 days from the alleged date of delivery of product reflecting on the Myntra portal.</p>\r\n\r\n<p>17. Myntra Shopping Groups (MSG) for Flipkart Big Billion Days Sale:</p>\r\n\r\n<p>Myntra Shopping Groups will be activated at 23:59 hours from 15th Sept till 23:59 24th Sept. This construct is a part of an initiative that was started during End Of Reason Sale. MSG will be accessible on all platforms (M-Web, desktop, and App). However creation of the groups will only be possible on the Myntra App during the valid time period.</p>\r\n\r\n<p>You can start creating your MSG or add new members to your group from 15th Sept. Your group will remain active till 24th Sept 2017, 23:59 PM. Groups need to be active to be eligible for MSG rewards. MSG group is only activated when it has a minimum of 3 members. It can have a maximum of 20 members.</p>\r\n\r\n<p>One person can only be a part of 1 MSG. In-case he wishes to join another group, he will have to exit the current group he is a part of.</p>\r\n\r\n<p>Once you agree to participate in MSG, Myntra has the right to retain the groups for promotional purposes in future. Myntra reserves the right to change/modify/add/delete any of the terms and conditions of MSG.</p>\r\n\r\n<p>18. Coupon for check-in From 15th Sept to 19th Sept 2017:</p>\r\n\r\n<p>Upon the MSG being active, each member of the group will be awarded a special BBD coupon for taping on the &#39;Check-in button&#39; placed inside the group&rsquo;s page, between 15th Sept to 19th Sept, 6PM. Coupon amount will increase by Rs. 50 with each member who taps on the &#39;Check-in button&#39;. The coupon amount under this Offer shall expire at 23:59 on 24th September, 2017. The final amount will be notified to the users on 20th Sept, 3 AM.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>1. The online Offer is open and valid for all the registered MSG&rsquo;s, permanently residing in India, and above the age of 18 years as on the start date of the sale.</p>\r\n	</li>\r\n	<li>\r\n	<p>2. The Offer is subject to changes, at the absolute discretion of the participating seller/s.</p>\r\n	</li>\r\n	<li>\r\n	<p>3. The Offer will only applicable to the selected styles in the linked catalogue.</p>\r\n	</li>\r\n	<li>\r\n	<p>4. Any coupons issued by Myntra and/or on behalf of the participating seller/s or obtained otherwise will be disabled during this Offer.</p>\r\n	</li>\r\n	<li>\r\n	<p>5. You shall ensure that the mobile number(s), e-mail address and/or other details provided by You to Myntra are true, accurate and in use, at the time of the online retail transaction. Any liability, consequence or claim arising on account of any incorrect or outdated information provided by the end customer to, same shall solely be borne by the affected end customer. Myntra shall not be liable to verify the accuracy and/or correctness of the information so provided by such customer.</p>\r\n	</li>\r\n	<li>\r\n	<p>6. Customers are advised to check the serviceability with the area pin code before placing any order on the Platform.</p>\r\n	</li>\r\n	<li>\r\n	<p>7. Extra VAT may apply in addition to the unit sale price on certain products, but the final inclusive price will not exceed the &#39;M.R.P.&#39;</p>\r\n	</li>\r\n	<li>\r\n	<p>8. The images of the products shown are for visual representation only and may vary from the actual product.</p>\r\n	</li>\r\n	<li>\r\n	<p>9. Customers are responsible for maintaining the confidentiality of their mobile phones, e-mail accounts and passwords.</p>\r\n	</li>\r\n	<li>\r\n	<p>10. The prices of the product may vary during and after the Offer is over. Thereby Myntra shall not be held liable for such difference in the price of the product as they are offered by the participating seller/s.</p>\r\n	</li>\r\n	<li>\r\n	<p>11. Product warranty shall be regulated by the terms and conditions mentioned on the warranty card of respective products and Myntra shall not be liable or responsible to the customer in for any indirect or consequential loss or damage.</p>\r\n	</li>\r\n	<li>\r\n	<p>12. This Offer cannot be combined with any other online offer on Myntra sponsored and/or offered by the participating seller/s.</p>\r\n	</li>\r\n	<li>\r\n	<p>13. The balance amount, after the discount has been availed, will have to be paid by the customer at the time of purchase.</p>\r\n	</li>\r\n	<li>\r\n	<p>14. This Offer is applicable on Cash on delivery or Card on Delivery feature is not valid. This Offer shall not be settled with cash in lieu by Myntra or the seller.</p>\r\n	</li>\r\n	<li>\r\n	<p>15. Myntra Return &amp; Exchange Policy offers you the option to return or exchange items purchased on Myntra Mobile App within the specified return/exchange period (Please read the Product Detail Page to see the number of days upto which a product can be returned/exchanged, post-delivery). In case of return of the purchased item, please refer to the &#39;Return Policy&#39; on our website or write to&nbsp;<a href=\"https://www.myntra.com/www.myntra.com/conatctus\">Contact Us</a>.</p>\r\n	</li>\r\n	<li>\r\n	<p>16. Orders may be split into separate shipments depending upon the products ordered for, despite the customer having made one single consolidated payment against one order ID. Separate shipments, after being split, shall have separate expected delivery period.</p>\r\n	</li>\r\n	<li>\r\n	<p>17. By participating in this Offer, all eligible customer agree to be bound by these &#39;Terms and Conditions&#39;, the &#39;Terms of Use&#39;, &#39;Privacy Policy&#39; and other relevant documentation that are available on Myntra including any modifications, alterations or updates that may be made either by Myntra or the participating seller/s. Myntra shall not be liable or responsible to the customer in for any indirect or consequential loss or damage.</p>\r\n	</li>\r\n	<li>\r\n	<p>18. Participating seller/s and/or Myntra reserves the right to amend, modify, cancel, update or withdraw this Offer at any time without notice. Upon such premature suspension, inconvenience, cessation, withdrawal, termination or closure of the Offer, no person shall be entitled to claim loss of any kind whatsoever.</p>\r\n	</li>\r\n	<li>\r\n	<p>19. Myntra reserves the right, in its sole discretion, to disqualify any customer that tampers or attempts to tamper with the deals/ offers or violates these &#39;Terms and Conditions&#39; or acts in a disruptive manner.</p>\r\n	</li>\r\n	<li>\r\n	<p>20. If Myntra has suspicion or knowledge, that any customer has been involved in any fraudulent or illegal activity directly or indirectly and/or is using the platform to order products not for his/her direct usage during or after the Offer, then Myntra reserves the right to disqualify that customer and any related customer.</p>\r\n	</li>\r\n	<li>\r\n	<p>21. Myntra shall not be responsible if some purchase is not registered or is lost due to any network problems such as breakdown of machinery, unclear/ disruption in the network or non-receipt of payment from banks/payment gateways and/or the cost(s) charged by the network operator(s). Any dispute in connection to the same shall be settled between the end customer and the network operator without involving Myntra.</p>\r\n	</li>\r\n	<li>\r\n	<p>22. Myntra shall not be liable for any loss or damage due to Act of God, Governmental actions, force majeure circumstances, or any other reason beyond its control, and shall not be liable to pay any monetary compensation or otherwise for the same.</p>\r\n	</li>\r\n	<li>\r\n	<p>23. You hereby agree to indemnify and keep Myntra harmless against all damages, liabilities, costs, expenses, claims, suits and proceedings (including reasonable attorney&rsquo;s fee) that may be suffered by Myntra as a consequence of (i) violation of terms of this Policy by You (ii) violation of applicable laws (iii) any action or inaction resulting in willful misconduct or negligence on Your part.</p>\r\n	</li>\r\n	<li>\r\n	<p>24. Myntra does not hereby warrant that the Myntra call center will run concurrently and error free during and/or after the &#39;Offer and Myntra shall not be directly liable for issues related to technical and/or human error whatsoever. However, Myntra shall work towards the best interest of the customer.</p>\r\n	</li>\r\n	<li>\r\n	<p>25. This Offer is subject to the laws of India and all disputes arising hereunder shall be subject to the jurisdiction of courts, tribunals or any other applicable forum at Bengaluru.</p>\r\n	</li>\r\n	<li>\r\n	<p>26. The minimum shopping value shall be calculated on the net amount received by Myntra after deducting, returns, cancellation, refunds and other deductions.[ML7]</p>\r\n	</li>\r\n	<li>\r\n	<p>27. These coupons are for the sole purpose of the participants&rsquo; use from his registered Email ID and not for the purpose of further re-sale, promotion or distribution. Myntra reserves the right to revoke the discount benefits at its discretion if such fraudulent activities are suspected</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>19. Alteration Services</p>\r\n\r\n<p>The free alteration services are being extended to You by Myntra Designs Private Limited (&ldquo;Myntra&rdquo;) on select items and categories solely (&ldquo;<strong>Alteration Services</strong>&rdquo;) for the purchases made by you on the Myntra Platform, i.e.&nbsp;<a href=\"https://www.myntra.com/www.myntra.com\">www.myntra.com</a>, its m-site and /or mobile application available on android and IOS (hereinafter referred to as &ldquo;<strong>Myntra Platform</strong>&rdquo;), subject to the below terms and conditions:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>The Alteration Services shall be offered on select products and categories only, in limited jurisdictions as specified by Myntra. The availability of the Alteration Services shall be clearly specified on the relevant product page on the Myntra Platform.</p>\r\n	</li>\r\n	<li>\r\n	<p>The said Alteration Services are &ldquo;<strong>Free of Cost</strong>&rdquo; as of now and You shall not be charged any fee for the same. In the event our partner requests any payment, whether in cash or kind, please raise the issue to us immediately by writing an email to the customer care team.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>PLEASE NOTE THAT ANY PRODUCT GIVEN BY YOU FOR ALTERATION SHALL BE NON-RETURNABLE AND NON-REFUNDABLE. PLEASE DO NOT AVAIL THE ALTERATION SERVICES IF YOU WISH TO RETURN THE PRODUCT. ALTERATION SERVICES ARE BEING EXTENDED ON AN &ldquo;AS IS&rdquo; BASIS AND MAY BE AVAILED BY YOU AT YOUR SOLE RISK AND EXPENSE.</strong>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>The Alteration Services are limited to the products purchased by You on the Myntra Platform only</strong>. Please do not ask our partner to alter any product purchased from a third party.</p>\r\n	</li>\r\n	<li>\r\n	<p>There are two possible modes / options available to You for providing your measurements for the Alteration Services:</p>\r\n	</li>\r\n	<li>\r\n	<p>Doorstep Measurements: In this mode, our alteration partner comes to your doorstep and takes your physical measurements. The products are altered as per the measurements taken by the said alteration partner.</p>\r\n	</li>\r\n	<li>\r\n	<p>Sample: In this mode, you provide a suitable sample to our alteration partner at your doorstep, at your risk. The products are altered as per the measurements of the sample provided by You, and the sample is returned to You along with the altered product.</p>\r\n\r\n	<p>Myntra may, in its sole discretion, offer one or both modes to You.</p>\r\n	</li>\r\n	<li>\r\n	<p>The mode(s) / options (s) available to You for providing the measurements shall be displayed to You on the Myntra Platform at the time of placing the alteration request. In the event both the modes are available to You, You shall be required to choose the appropriate mode at the time of placing the request.</p>\r\n	</li>\r\n	<li>\r\n	<p>Myntra does not make any warranty with respect to accuracy and correctness of the doorstep measurements or the Alteration Services or the conduct of the alteration partner nor does Myntra make any warranty or representation with respect to quality, wear-ability or correctness of the products altered using the Alteration Services.</p>\r\n	</li>\r\n	<li>\r\n	<p>The Alteration Services including any &lsquo;doorstep measurements&rsquo; taken by our alteration partners and collection of &ldquo;samples&rdquo; are being extended to You on an as is and as available basis and being availed by You at Your sole risk and expense, including the sample provided by You.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>9.In the event You are not comfortable with our alteration partners for any reason whatsoever, You may (i) cancel the alteration request on Myntra Platform instantly; or (ii) ask the alteration partner to leave your premises immediately and reach out to our customer care team.</p>\r\n\r\n<p>10.In the event of any visible damage and/or loss of the sample product by our alteration partners, the liability of Myntra shall be limited to refunding the following amounts to You: Maximum Liability of Myntra</p>\r\n\r\n<p>*For Jeans: In case of Visible Damage &ndash; Rs. 500/-. In case lost by the alteration partner &ndash; Rs. 1000/-</p>\r\n\r\n<p>*For Trousers: In case of Visible Damage &ndash; Rs. 500/-. In case lost by the alteration partner &ndash; Rs. 1000/-</p>\r\n\r\n<p>*For Kurta / Kurti: In case of Visible Damage &ndash; Rs. 300/-. In case lost by the alteration partner &ndash; Rs. 600/-</p>\r\n\r\n<p>You understand and agree that the samples are being provided to us at your sole risk; and irrespective of the purchase price / maximum retail price of the sample provided by You, the amounts specified above represent the entire and maximum liability of Myntra and Your sole remedy, in case of any visible damage or loss of the sample provided by You. You further understand and agree that the decision of Myntra shall be final and binding in this regard. The amount shall be refunded by Myntra into the bank account provided by You, upon due verification by Myntra, within a period of 3 (three) to 5 (five) business days from the date You provide your bank account details.</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>In case You are dissatisfied with the Alteration Services or require any clarity on the Alteration Services, please write to our customer care team.</p>\r\n	</li>\r\n	<li>\r\n	<p>Your use of the Alteration Services is subject to the Terms of Use and Privacy Policy of Myntra Platform.</p>\r\n	</li>\r\n	<li>\r\n	<p>Myntra reserves the right to modify the terms of provisioning of the Alteration Services in its sole discretion and without notice.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>20. Cart Notification</p>\r\n\r\n<p>You understand that, in the event selected products in your cart is out of the inventory, Myntra provides You an option in your cart to select the product of another seller, You understand that price of the product by another seller may differ.</p>\r\n\r\n<p>21. Multiple Sellers</p>\r\n\r\n<p>You understand that products of a particular style may be sold on the Platform by multiple sellers and the product price on the listing page of the Platform, may not always reflect the lowest price for that particular style. This is because the seller whose price is displayed on the list page is selected based on the application of a number of parameters and price is only one such parameter. However, once you land on the product display page on the Platform for a specific style, You will have access to the price offered by all sellers on the Platform for the relevant style.</p>\r\n\r\n<p>22. Platform Fee</p>\r\n\r\n<p>Myntra may levy a platform fee for providing access to the Platform, and on account of Your usage of the Platform, hereinafter referred to as &ldquo;Platform Handling Fee&rdquo; or &ldquo;Platform Fee&rdquo;, subject to the Terms of Use and the below terms and conditions:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>The Platform Fee shall be specified on the check out page on the Myntra Platform.</p>\r\n	</li>\r\n	<li>\r\n	<p>The Platform Fee shall be charged on the overall cart value.</p>\r\n	</li>\r\n	<li>\r\n	<p>Myntra reserves the right to modify/waive off the Platform Fee from time to time.</p>\r\n	</li>\r\n	<li>\r\n	<p>The Platform Fee fees shall be quoted in Indian Rupees. You shall be solely responsible for compliance of all applicable laws for making payments to Myntra Designs Private Limited.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>23. Grievance Officer</p>\r\n\r\n<p>In accordance with Information Technology Act 2000 and rules made there under and the Consumer Protection (E-Commerce) Rules, 2020, the name and contact details of the Grievance Officer are provided below:</p>\r\n\r\n<p>Mr. Arun Kumar S</p>\r\n\r\n<p>Designation: Senior Manager - CC - Operations</p>\r\n\r\n<p>Myntra Designs Pvt Ltd ,</p>\r\n\r\n<p>Alyssa, Begonia and Clover situated in Embassy Tech Village,</p>\r\n\r\n<p>Outer Ring Road, Devarabeesanahalli Village, Varthur Hobli, Bengaluru, Karnataka : 560103, India</p>\r\n\r\n<p>Contact us: ccmanager@myntra.com</p>\r\n\r\n<p>Phone: +91-80-61561999</p>\r\n\r\n<p>Time: Mon - Sat (9:00 - 18:00).</p>\r\n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `dial_code` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `title`, `code`, `dial_code`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(6, 'India', 'IN', '+91', 'y', '2020-11-02 10:07:32', 5, '2020-12-14 15:35:09', 5);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` varchar(8) NOT NULL,
  `link_to` varchar(10) NOT NULL,
  `course_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `value` float NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `status` varchar(1) NOT NULL,
  `inserted` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `redeem_type` varchar(1) NOT NULL,
  `minimum` float NOT NULL,
  `maximum` float NOT NULL,
  `first_time` varchar(1) NOT NULL,
  `student_type` varchar(1) NOT NULL,
  `students` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `type`, `link_to`, `course_id`, `category_id`, `limit`, `value`, `start`, `end`, `status`, `inserted`, `inserted_by`, `modified`, `modified_by`, `redeem_type`, `minimum`, `maximum`, `first_time`, `student_type`, `students`) VALUES
(1, 'Testing Coupon', 'AT1001', 'flat', '', 0, 0, 1, 290, '2020-11-26', '2020-12-31', 'y', '2020-11-26 13:36:45', 5, '2020-12-15 11:44:23', 5, '', 90, 200, 'n', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `image` text,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`, `gender`, `image`, `status`, `reg_date`, `token`) VALUES
(44, 'Deepak', 'Prajapati', 'deepakprn78@gmail.com', '7878868606', 'Deepak', NULL, NULL, 'y', '2020-11-26 06:27:00', 'd5miSsTmTm2BegIi7ay8_T:APA91bHktSybXEmImLpwEsCZvPXXAXKhdgKA1fnO7zDmrlxCr1ckvY0qRh6QUeIHxjVEw7GjmvEylnADGZ5AakeFA_ZENhTle2ROIVbLPPZSPElNyI5hN6tbPt-tMVKJ177dP-gEUQ0p'),
(45, 'Pankaj', 'Kumar', 'rajaryan99507@gmail.com', '8235324198', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-11-26 08:42:50', 'eEcYRpZBRfeaxcUmE65Wxk:APA91bHwgbHmKCCIfcyuNlNHb0DLBdemBnmMzYKlDW3b8Elea5-hwjMFRUA5MpTunWM49MoC1XomraCyVK_Ys9YABpmn4OIDiTtGqUkVwpGnRO0CZ2Fm_kaHL_79SsDnHZHBKI7mRCJo'),
(46, 'Nikky', 'Jha', 'saptkrishi@gmail.com', '8826217394', 'Sapt123@', NULL, 'assets/images/noimage.png', 'y', '2020-11-27 02:05:37', 'eao2KFrURIi5UbGQkr4Ny9:APA91bEfRwzWZMFSVmRJ51gOOlYOi1zFacYkouxlGfLQjrbd903YDX3h-cMYSI3zMnC3tOqlx31wdUGFuHu2ylpLORHyqkHvGCk8m1rFM69BYMDhWb9Wb5L97z_2dfIH-lgLJsXhsmpo'),
(47, 'rajbhar', 'rohit', 'Rrajbhar9237@gmail.com', '9662816298', 'rajbhar1234', NULL, 'assets/images/noimage.png', 'y', '2020-11-27 03:53:03', ''),
(51, 'Gabbar ', 'Singh', 'singhsatyam@gmail.com', '7698256790', 'Satyam123', NULL, 'assets/images/noimage.png', 'y', '2020-11-28 07:28:05', ''),
(54, 'Gaurav', 'Kumar', 'gauravpandey9852@gmail.com', '9523775883', 'momdad123', NULL, 'assets/images/noimage.png', 'y', '2020-12-03 07:37:42', 'cR5FRUTRTUWzge36qx2iDl:APA91bEb0mNDOc3DEuVGEkYbm0QUaZjgVbXbkTT3fpGLiWKOg2-XZ0Df1d5Zm7AJH9F8aB8Diw83klzINwTNSZIspqtWCv4Mf5MOnHW0XG_OZJ7e7A-mfjtHUt6Xk9f69RpWtpWj-jHW'),
(57, 'Abhishek', 'Singh', 'abhishekjamsi07@gmail.com', '8102859795', 'Abhi@224466', NULL, 'assets/images/noimage.png', 'y', '2020-12-03 07:44:43', 'fttbq02ARiijC2dnSwlXLd:APA91bHFszHDU2YFXf3q-78oY9vEoLPc0LVugpospfc9__KkV56tKbFwCBO3m3PLQAyUpyyBkZrft1wwA3A93IBo3UhAMqbwetYy9-rOh6AEjiDNeSHEttqS4s_aSMmjfEtDya4asDOs'),
(59, 'Akash', 'Gupta', 'Akashlike.v@gamil.com', '8866609678', 'akash5411', NULL, 'assets/images/noimage.png', 'y', '2020-12-03 07:56:09', ''),
(61, 'Rashmi ', 'Jha', 'rashmijha848@gmail.com', '7672914196', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-03 14:42:00', ''),
(62, 'Sunil', 'Jha', 'sunilphyjha@gmail.com', '9472507518', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-03 14:47:54', ''),
(63, 'Kumar', 'Gaurav', 'maavaishnodg@gmail.com', '9431819060', '123456789', NULL, 'assets/images/noimage.png', 'y', '2020-12-04 07:46:01', 'cUBXYZy5R9ajvbRoNvKis6:APA91bGIU3O9ynnYkPrWqttHS1v7ewumvvWHbfodT2lYWDJ-z_gXieoa9CciqifMUzYTTRgdqSTkhzI4XNIVqDmXqbogR_i7XxFd1dhcrD_G-2-Q5zrsN2ie5UOXU467BbHxjPGmMsuh'),
(64, 'deepak', 'prajapati', 'dnsdeepak78@gmail.com', '7990566041', 'deepak', 'male', 'assets/images/noimage.png', 'y', '2020-12-05 12:22:57', 'ABCADFASDFASDFASDFASDF'),
(65, 'Ankit ', 'Jha', 'ankitnasaphy@gmail.cim', '7254930047', 'Ankitnature123', NULL, 'assets/images/noimage.png', 'y', '2020-12-09 15:32:44', ''),
(66, 'Anku', 'Mishra', 'ankuumishra2612@gmail.com', '6205258824', 'anku2612', NULL, 'assets/images/noimage.png', 'y', '2020-12-10 07:29:06', ''),
(67, 'Suraj', 'Kumar', 'roysurajkumar919@gmail.com', '6207959165', '9801048686', NULL, 'assets/images/noimage.png', 'y', '2020-12-10 11:28:37', ''),
(68, 'Kailash', 'Sah', 'Kailashpdsah4@gmail.com', '8862974920', 'Jahnvi2019', NULL, 'assets/images/noimage.png', 'y', '2020-12-10 15:24:21', 'diooOGEOTs2BzJYq2CAE-r:APA91bH1-zKScKfi9dnX_q00cBMqlHM-OKSTdMWxu_M5jC85KWx8FtyeYNxHjHf8b0yGniTFaOph1VMNWPXBrp6LrKWNeTfcd2Tp2ONRTH2uxf3xKuHL_S2kj2aSYt0VIG_yEwplYphF'),
(69, 'ANKUR', 'Singh', 'ankursingh.as377@gmail.com', '7549964446', 'ankursingh', NULL, 'assets/images/noimage.png', 'y', '2020-12-11 16:00:40', ''),
(70, 'Jyoti', 'Kumari', 'bgp.ninni@gmail.com', '9431248496', 'pihu1234', NULL, 'assets/images/noimage.png', 'y', '2020-12-11 16:17:27', ''),
(72, 'Abhishek', 'Ranjan', 'Abhishekr.ar50@gmail.com', '7209708013', 'RANJAN@20', NULL, 'assets/images/noimage.png', 'y', '2020-12-15 04:27:23', 'cK25W1iIRiyo4_Bpq1oTDf:APA91bGI_Jz-9_PbTASIEOH_V-ofmc87C4SC3_eTPYFTtFNkgh9iX4eyK30_owg9hDd0b4YaS9WklMstX9GJ7MfO3mC5Pm0HcC_QIPENXIfVKd2yYAPAL5E1_q8yALgpp1AJtiHBEzmd'),
(73, 'Sourab', 'Kumar', 'Sr.tech03@gmai.com', '6205195091', 'soubha03', NULL, 'assets/images/noimage.png', 'y', '2020-12-15 04:30:24', 'ckIiXeZoS3OuMItG5cOlT4:APA91bGAn6mgp9_dnIJU-IJNigiG0vZDXjX99fj5cRdpVGfpl12h_hEx8-50h7qk6l_Zz1lfAlWSPJFCSkBF54eSPdL1vuKDcxfQ3PqPkILyKsk4CtHGkV2S2DLKLHdZwS4EVHM7sRcx'),
(74, 'ankit', 'rana', 'ankitmeet14@gmail.com', '8271230391', 'sabjiwala14', NULL, 'assets/images/noimage.png', 'y', '2020-12-15 09:42:33', 'cUhtlmSBQu-VZXFCRnyYeR:APA91bHwZXR0At3m8glbOh_uvC0GeVsadFLl85uX4ySSUOENK5OzK2BeonZAirRQAvkr2keMWEx2qdz7cG5lr0CEcckiD8VxNOG680lJQk6JB-8FTax0FMabP-9Lw-f8_5j53AmpEvw4'),
(75, 'Krishna', 'Singh', 'abhishek.123jamsi@gmail.com', '9631820476', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 01:50:07', 'dSV7giNeRjS1dJ4ojXNQGa:APA91bGsKjjbMhj3f-eQJ_adZ79j_0ItqGeaJEdhc4xRTSXrGdZHNB3DsW7_LOLay__2HJwrgOmQ-bnyq64Iz3bisWgmdg4AyVm1Ji1VnBoQUYxX27o1w0lTU44vCo7N2oxTl7pznI0J'),
(76, 'Riya', 'Singh', 'riya73singh111@gmail.com', '9304352485', '111Babli.', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 04:53:34', 'cO8EisyHQEKQS1fTwH3Pj1:APA91bGC5ai-9U-I62aMn1wmtDRc8u208va6hVwcldiVe6cBYt0gqIZAYAWwq_jl8qQlmUbPbgCRVTwBQeIQZUPO28rPayGWmWn81R-99aCgh8PtQetJKEGgaSpXqPp2z9KVQ1BDaSYL'),
(77, 'Rakesh kumar ', 'Pandey', 'rkp82710@gmail.com', '8709282804', 'rakesh123', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 05:21:24', 'cHP1ULciTGGULHSz3WAbTv:APA91bEaYVt5vSd_sTdZAgFjf8TR1jCdBG1UYgIzavunNMop90CErNsxol1_ws65ql5pkQfotU2TJGRKRAqIrS7TXAdlEONbL968E57YjDuZOW5B7AlVPq1TbC-tNuKIZx1qvNCaq93R'),
(78, 'Banti', 'Roy ', 'sumjaan14@hotmail.com', '9334972593', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 05:23:41', 'fK0EIKf8TlCIkid6FeaE-2:APA91bGnYX2o8vPO3-W8c7XOjqzJBZO6gJANb63_SyMsinTYiGE7v-OLMCOnBqWa323sCGawlYDerXxIW4VYaJIC5YmhYkFsgEjIQZfp0ECLvOUPlEw56OZeGkItjpkwUUJ6cV5xd5bs'),
(79, 'Rohit', 'Kumar', 'rohitkumarbkp2000@gmail.com', '6299737140', '123456789', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 06:16:29', 'fAiJZ3n1R2aSEkqKXhQJ9h:APA91bGOT0Y3NhQxghwwGwU7XfR1ui2RTb7h-4zhJZOT82ZE2mHuI4odUebvunK_3B-_uhKbz9Pz4HgEEPtsDKCRVLI0AAmOWVNsAZj6_nUgoqJAkEKyN8e1T3WQ9BY4PvMrB3SDwY1F'),
(80, 'Abhishek', 'Jha', 'jabhishek135@gmail.com', '8002028268', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 06:43:39', 'dyNm8PhHSUKF4kMJS9sHe2:APA91bEWdjRl35SO_z4hC0F5WMUIQOFzyGMBbTZkwbRK0dtEXU-fXLsQAtqExr3S6LbpCSRwdyI7PIZjaCT8ETke-rUWaQjcGJXrg4lPtHbKnuUAGclc-rMffNQmnawGr1nY5YlZv6mW'),
(81, 'Nanak', 'Kumar', 'nanakkumaraingh998@gmail.com', '9546469439', 'nanak998', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 06:58:59', 'cHaA0oD1T7exuwGk32R3sj:APA91bGAZfqiuw25Swi8i7IWDWSoSoNHiZMB9iQKBh0V5O51IarLFbOPai6yuWPmmcY6GoA1tRjqZ44CdcXia9ylp7BgmmuOUZ3tkyPZ9aKbyJi_e72KeZwUD8wjj-nwsvU90hhb0Zgk'),
(82, 'Raja', 'Mishra', 'rajak839341@gmail.com', '8809122739', 'Mishra', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 07:21:12', 'dmJLHS0eRDaZUoO4BKh8WE:APA91bHuCyjh4XP9XkV20kgsFQ6zVzJg_GXc6wLbDKa3ySboPGRuI_93iCEbrzfJn3wp37wi03QPC-p50yg6YVYmswG97hOMiDRyo_T8gArtVVo6vl086ajRSVl3CohDlbMZphGjgsnZ'),
(83, 'Pawan kumar', 'Upadhayay', 'Pawanupadhyay091@gmail.com ', '8294354927', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 07:38:02', 'cIosVUT_QsKNZmciL3kh7y:APA91bHMJR8-gOtgLbibGgUEkEIA1p99aBNclG6E7dTuC-sGc4flwP1AG5omps_JJ9kT_z6Wyi9ifa4jWFsDcL2Pk9ZtBoxd6Z9GqVOiQrYnY8PnLRqTC39Vw0Mv_JoIGjb1tfqYrdTa'),
(84, 'Niraj', 'Kumar', 'Nirajkumar95340@gmail', '8709868017', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 07:40:35', 'd9bUWD-_QImG9YreoMcu7-:APA91bHj2MeKCkEPl6xKJKRnX1VUIGPBrJps99rXbwQwllG-6PLKfAnQrBRaZwfhrHJVAx9txkxQ5mEhvFAp-NJsdufuIhelvE1OhQHu4mlYCC0_IWCmvHTxuxroTFzPV3jZ_IogCzic'),
(85, 'Gajadhar', 'Sharma', 'gajadharharidaspur789@gmail.com', '7260877420', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 09:58:58', 'dRv-B69fTjSmSXcho-4frK:APA91bHHFiVLif21tyZM-v8pDpCnVyFBt7Qqrw3XJgWS5soX2uj7IrqJWfkcCe-ZkySMOAEFz9E2bxSVtJ0wr017lN848fTnUIqlDluTEw2WKqeuzITKm5A1VQkoFYv2SxHiUSxb7bAK'),
(86, 'Abhinav ', 'Singh', 'gameravinayan@gmail.com', '9113784802', 'abhinav123', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 10:38:52', 'eJ8qinGWSPOxD3F2SIORe6:APA91bEy6RnnTbk_8sjejQ5M7M0JWjCSIksGUXQ7sT4MnR45U6TWBDG7gkAmRNrY11B-QUHQuyo69Q0TwL21AiAUtmgn61Ok-iVU-rWT1YFwimEUf22TjgAd7D6p63K2Jj7_uLF3etrP'),
(87, 'Abhishek', 'Kumar', 'abhishe.raj54@gmail.com', '7564997304', '7564997304', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 12:01:44', 'efmj64CDQyyBq8Zvw9CtEO:APA91bHbTkt-Pd0jHgau_sFQR3MyzDGKMs5m7CtmCSHx3UPXEG2aptGSaVky79sBWmRPMnbWIfLn00WhjcFAM2ZnreQ9-lS-M1TwHH6GIwXne_paUiB-fQkCRbyXsv-Lo9fXN9oacXd0'),
(88, 'Shailesh', 'Sinha', 'shaileshsinha414@gmail.com', '8709169387', 'shailesh', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 12:32:51', 'cVlOgvG8SP6if1FMEl7rLk:APA91bF7RLPypGvicUVSLuGKxVlNcwCP5BG_bWsZGv9ebJMkRvcMHMyKHG6KDqyI3UFkArkuvF-MdtOlFo7igT6B_kpH5EV0ASzEv_qgOCZZ6vKe4zWB1DklAe3QDL2fAdEbRRts0ky6'),
(89, 'Lucky', 'Kumari', 'Luckypravin648@gmail.com ', '6206529108', '6206529', NULL, 'assets/images/noimage.png', 'y', '2020-12-17 12:40:43', 'ce1KuzpERNun_31ugiSuoO:APA91bGwnwu9nkTqBU48fPKgG7eRLDdT_zQIQI2IzbrHl6dEoDvxlIVlaNEhva0gwZ1o6zVHxrNFTd1pmca_xyK7IptFiRCbEyS0Q1bg9EW1TNWGXkOf0GyqdNM9G4Z1jNsW1zAjLiv8'),
(90, 'Rohit', 'Kumar', 'rohit776688@Gmail.com', '9931213820', 'Swati@143', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 04:50:11', 'c5zpzJ-fTOqeU4riuTVkiu:APA91bEkVnDsvKsDirJ_lPS2feRxPtBDEQhSyijyIetU-QBC3fkjLi9BR-PnIWx8LhjTr0uCSOIXERSwZ3JU-Q6ij3XDIGg9uWAX2m5IiVXZHg7nbIARUbBXGbr6qAl_ShHIvLZXMRJQ'),
(91, 'Nitish kumar', 'Singh', 'nitish.tit.singh786@gmail.com', '7693882812', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 05:13:30', 'dsa2HYjhSrOUdMRhFEy7Nh:APA91bElozROlGhEo9HbgtME27ElwuwD-WhQo5YXYwNs5qOC7AYflAxNH8QkEqmDfj2wBZ7DWet_K9BlEiz7ACKY24m6YezakwppHuiDV8wDm3hi46bObCB7dwQBG6HSjS36_a9XQrR_'),
(92, 'Vinayak', 'Singh', 'vinayaksingh23@gmail.com', '9060548239', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 05:16:41', 'e9kcZEEER5SxU_MZvwJWkc:APA91bHB44dJEAANSO30bwAkDbI-93PTYyKBfEq5RxxXVzJ4TjRsb7zuEh-fc9AjJqgFWg2fWHTdGFP8lI6YhHiJ_a3E1QNnBr20_gsWJuWnCoYIbz6ZjwGTHWdZV2pYE06xclOyxhPk'),
(93, 'Swati ', 'Garg', 'Garg4215@gamil.com', '6299995037', 'Swati@143', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 05:47:49', 'fMBsUJwgSX60Oytn4WYp6k:APA91bFHgtcFU4hDUci9t_i1g0ygxYUmI-qIGmcxoanp57VqBAVEe9kcuy-d_R1OAK-GWCSpCZZJcUs34isHJl87nxFDR53MUm08hmCo1X7XoXGWeia5dd_ZxbBn9ljVopNy6BXpW5eq'),
(94, 'Subhashiah', 'Kumar', 'subhashish4229@gmail.com', '9939097724', '4239', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 06:12:09', 'c5rhh6peRXiPkXtXSzrKYG:APA91bGyy8gtZxYxK4MpmiWm7016CZ6YLx4Ro4waob44FRo0qyo_P-xad8puXJ60ggwW9Up_NEjfFX7bU5g-QsiVwRq1NvWTnCoWcuIpuE_rqTS19b0c9pfFUPQk-5sY3tAcuQSjwRn-'),
(95, 'Himanshu ', 'Raja', 'himanshuraja2@gmail.com', '9504769370', 'raja9504', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 06:16:02', 'eSiElwO6SQKDtuloJ_fJFr:APA91bHOi0uBjXLuGtYKu6BoK914ZELMAthbLPEdjEDzOq2ht4ve0My_3Q6fvhWURPK4EJSxiwfQDhohYk_LtZ1tyv04Whd1wIXKat5YFIiZfxnVrRxX-NKq7CpRcVSnPDjYmCd3o36s'),
(96, 'Nily', 'Pandey', 'akankshachaturvedi581@gmail.com', '7858842282', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 06:19:41', 'finBciKwT1CFJCqEqG0c2G:APA91bGcZeFg1CQyaW-zuGYHK5HD3VgeJKL4o7FzZSaW9dVc8teac8KFYJhsMthfA3f8dnD04mWTd8eZHiDbyCbQM8G7l_TobQ3-rEj7A0b0kSe6_ETQpgSzNcDCQ6PxBfZhyKKIDr_2'),
(97, 'ANJANI KUMAR', 'MISHRA', 'anjanikmishra59@gmail.com', '9470070487', 'golu#123', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 06:24:15', 'cx4jJrLpSg-FSt8twZQitZ:APA91bFYhVqms8LEVmNML124hNuLLS3ndomZ2ZcdeTFDlusWT4igc2ZZT0blc76JqczXkg8qXwQvbEzYYGjtOTU_-jTbykzuHGA2hknmRGv8brOxIamrHtR_ya2NIv7GXLNSdB03qmdR'),
(98, 'Anil', 'Kumar', 'anilkumar50152@gmail.com', '9507069365', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 06:30:50', 'cO7dXffLR1Wz0uv_t1Gn9q:APA91bGP8aXe-uP0My4WXROhfJXQU_Z1qtMbyJ08LyiOHB2EufkpKc3InKiYXymOMN-9E7aOLdgbIi1hK4zv0yYMAkT19Xb91jantrVUsOwHbNYjLg108VAWRtZa4vVQ1Z4_id3H7YTy'),
(99, 'Kumar', 'Sangam', 'kumarsangam4341@gmail.com', '7011532743', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 06:33:44', 'dkWpggnWTVeQ_GhysrLvpc:APA91bEI2WiXCkIeZ19oZIa_Iv2nrhO29AMQ_nI1WA5E0-3khXB1NceE7kUZr08abR4p_maWKeC4NMjE_B6x7seNjPAjzatbWhdkQeh2HmGCFTBxinrujDdsz6hZvk6Q36EyjfFInNyC'),
(100, 'PUNAM ', 'SINGH', 'as2891789@gmail.com', '9199813489', 'anurag3240', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 06:37:37', 'eqvYztbdSliIkgXbOp1NkR:APA91bFc83nvEW-ysH2xoEy94UFif-enUDuLlJ8mzwrR4rD-IuUwTYKSAoZDPXY4ptQpytuLGLuRHpzkr6-eTlvEOHQuSNJfDCCy5DSed91gxd8CzqSRN83dbk8JqNQCtBJW9SbVkRQp'),
(101, 'Abhishek', 'Kumar', ' 1abhishekkum@gmail.com', '8541881708', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 07:32:45', 'fKV8UMImRWCUYrUV42SCkH:APA91bHzNBkuRL-cz3qI_HgWYMdzEFSaJIH4R8Cq6W5Z1uzmxeXFHgXuQlzO20vCGkXoZQyCP8yH8cQuxjQJvEJiu3QTCk8LsY_2l5TNXaNJygWvEElTucp6pdmZEwjVZc4hTmX8mOee'),
(102, 'Pushpa', 'Goenka', 'raunakgoenka18@gmail.com', '9934051820', 'hey@12345*', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 07:53:03', 'coytY2OxQ-yq_DpPPEBtT_:APA91bFl8hZEkfQfOw7nDkukXIcxUfNhRznihACRsnjBKQdRnZVaXUm_GC7IzsJxBJQOZ3tno2Wzi8dYP5AV4ZunfumDn1FbhWS5pCePtZt13_v3EzSpI8KFDK61q7NkxRUZCtCkDPyo'),
(103, 'Keshav', 'Anand', 'roxxkv@gmail.com', '8340424464', 'keshav@mgr', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:06:31', 'dNGrsFWCRjq4PZwHOMnrJi:APA91bHsYJtA94JZ-OBDTv26k5XNRKuuUFBq3A6rYEnrAwVmetT0LZ8pAIQnzBcnWGifHs43St9ti6_2qUNrGaPg70iRh-HkhOvLufcL_PPkEu8P--LvrtjexNaBKNimD_iQ7lb23WTQ'),
(104, 'Deepak', 'Raj', 'draj95803@gmail.com', '8709161812', 'Deepak@1997', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:10:51', 'ffMhyib_QCCP5k2KC3o4zo:APA91bGEZvRh9y84d4XkoVZOR8IZB66m1zA80smVTttW2t7gspVaM3vLdfQcMNo7u7RT8lZ3cp1VlV8B86tbuwlVUlKebfSp311ty2k49cgxhsronUwC0uB7sXsXAWDM4-ITzTpFUbcy'),
(105, 'Manish', 'Kumar', 'Manishrazz123@gmail.com', '9776758915', 'noorpur@123', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:10:53', 'cHzHeNguQPayi9Usbz2SZO:APA91bFjhSEC0WdU6WAwQ-b1NpaBAmNZUSDojs9In4b7_JfrLI8Md46fCJWu3JCUB_hwZisp8P5cp9TEyXZcVM_GBImWf_y4n2bsfvKbvuFxkCjGlKCbdJlHPYX8nghfGBtIv0OnC6EK'),
(106, 'Tushar', 'Singh', 'tusharsingh211@gmail.com', '8877905544', '8877905544', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:11:31', 'cd-SvSdASE2A7AJBG0VBvK:APA91bFD7jbNn98e40ZugmLuTxG0rT2wJl38nuTxfbolobjnJ92MfILdmqhdzHISYI4AqpIhsXieqoBOze6i_qkC-e7CaVMLM1PEJ8LCW5qQBgpzSw2gNj4IBlo8Z5gQTPt5eteSJYqr'),
(107, 'Rajeev Ranjan', 'Singh', 'rajeevranjan19500@gmail.com', '8804849119', '8804849119', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:13:11', 'eppRytdcTUqOeHVUxnbGa8:APA91bFxYjbi0OwhBy6BJWRyG93ebf367iT-PhF4V-HwUPP7hirTrzL2HXgZJf78KZp2_O8WJ_CT7luyPRIEhZ5hCbKox5zIljI-v66Jd_V2nsdE5Hf21DPOKzKOEKZEPW2z9sPmCd85'),
(108, 'Amit', 'Jha', 'akjha15996@gmail.com', '6207665679', 'Jhaamit', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:14:38', 'f1g0a3NaRdSFAP5oL7TPI1:APA91bElX9Nns7JK2DVKxB9ZDn5DSe5aZFRvD_iZgRKPjRrXqEZWMqBqO0Ef4v8Lkl6pdhEuP5y3g78kP-PfYs2hHulo-XKVwNETwqbgEc_GezG__JZ_7Vb-DaWaJ3Be0HtdSFy-P9rj'),
(109, 'Md Naquie', 'Alam', 'mdnaquialam58@gmail.com', '9934603788', '1234', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:20:15', 'eQmMgyoyQd24cst8bCOtvU:APA91bEVnsc0eeADkEAWNWcedAymTv8hVI-QVwiRIrQVnc7pOCXMF4bBTGVQZ04lwsTgVYGWuatJVphsJpZ5VEMcWWF364MsPk0ybqawc5aAel1lojzj-0sdCXRw0ZAzfAq9BJlgf5jo'),
(110, 'Amarjeet', 'Kumar', 'ak680997@gmail.com', '8825193129', 'amarjeet121297', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:23:21', 'flOHsPfYTGOXcjTXZmT9-O:APA91bFMl75b-Ce8zvqbXhH6UvPmqxPaQbqPYmD0ldN4W8NGfLkdipTpbMSl2VdyxQu8YdxpYfTcTqhOpuom6WR4nXe-piqs5p6XQ5Gf3iFcwu-m-5vOWGDzha4El5irWAPvxG6hWoJR'),
(111, 'panaj ', 'kumar', 'pk575@gmail.com', '6205343011', '123456', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:25:14', 'dbMMl49JQXKtRPBSAy84RU:APA91bEAtbz_tzpIsF4u2iq7z5N9-bPnxl2JPzkgp5uX2mqPGS8ebTsvnGbNiWJ61V9wuLip3cTacyZPH7XK5L_iwEX6ZVspmf5gY32WLChscQfoGAIrl5b_7m8wABMwsDh6aCkIQhCP'),
(112, 'Shubham', 'Sagar', 'shubhamsagar42@gmail.com', '9934664949', 'Golu853202', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:25:17', 'dZXogXL7RBuUnk67x3Hgpm:APA91bHQxCgHvHXeDhlEBDzWiNBGsbZYupJRP3RnNjml94S4nwScb63RFjk444JJZLsLEm4BmFBHfvnqGf_rOVH4G6iQpQviCntJOLN_-QzHBEjE869Z2BFiTpc-HVPp2s3A88be1OXS'),
(113, 'Manisha ', 'Kumari', 'kumarimanisha9898@gmail.com', '7633874837', '123456', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:39:41', 'eH-Ocf54SHmdN53d1uw0nw:APA91bHu8vnhlOPYRaMt3936DM0NYXLCZpE8Fy6sSvMs0gopDJyKJDc-ZEYwTrmzcQ-og7ylM2bBXoI5u0cZmtWQmG5UO2LXOV_IPOY3LW4AzMcqPdHbz9bze2E0PDJy5qjeo0M_xQr7'),
(114, 'Neha', 'Kumari', 'Neha choudhary 33445566', '8092853201', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:42:18', 'dFMUwzkCR4uadWmMMuFpCu:APA91bE_QuDNIlPqp-iddWU8RSNBcxV44tvgSlff_3bODA_AugtVha3CGIhl1EFuE-m4uWg9omcTqNtJF0LfTh53MGR8HUL5c0JdtN3SUD3623qDNRRVEcnDRDbF0pS3i0ARekkTspay'),
(115, 'Rajesh', 'Kumar', 'rajeshkumar39767@gmail.com', '9939554677', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:45:15', 'c2YeJQRxR8ynPF0H8pq0k0:APA91bGZh5krrMTQx-pTbU4M5SYwVvHnswLtWuOiG4J1aIvp2qzRUNhnNDTNGAzxIZs_a6hc8_CG1c28owAsrV9gxiRUPqfhnz08gLPE_LymjYGhlZMCPaiubuQ02WkC1K8s6QqUfoTx'),
(116, 'Abhishek', 'Kumar', 'abhishekbgp125@gmail.com', '7543995847', 'akumar12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:46:04', 'fPcPGjZuSQSks2BLAm1TGb:APA91bFD6XpQ7dwjUSRnp3ODfiZTV2JibFICYLl_L6Jbot0z_40jz_V0NFAupypEGmj5DwZnpCYB7xEEXenVtH0Ytf1M7fKy40uJXyIh09BdV0t_rtlZxwdDGh7Bi2AuMJ1G8cKb_xu2'),
(117, 'Dharmendra', 'Kumar', 'Dharmendrabgp0641@gmail.com', '8804557716', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 08:49:10', 'fc55ijEfS-ixyeWIv-3DCC:APA91bHMpiaYAKfSWId1ILHnCvBgzYFK0Bs2CahUY3KQ5vvJDJyd8Sx252qh9GGDaRkrfQmKToFdpnWCV_4nIIN529b6GfrsHHpnvwocMvBpAFISugQjnyZh1qc_o7NKxW-EDNoa3ozs'),
(118, 'Nisha', 'Kumari', 'pranavinisha@gmail.com', '8789237804', 'aforapple', NULL, 'assets/images/noimage.png', 'y', '2020-12-18 14:43:53', 'ceOWkKJORfCPO0XW3nm5p4:APA91bFsiDKr0qfYvRrlMM_ylL_Z33_QDh4wIObOWMvnbpKLfdpAFOlPEpxvPfN8gaEyTiYlFVeFKUcI1M6WeYm0yifPZZxCOxRoFYcy8hytSL6q-C8ZH4EoqCUd6hsXcJPgGKoAI-ZU'),
(119, 'Rahul', 'Srivastava', 'rahulsrivastava4444@gmail.com', '9122300094', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 02:55:49', 'dAT2_z92SN2vCygUE7JMdz:APA91bGP7SoY1ENUS-OVww1ajb5n24GC69JNjnwzuuTYf2DKt4ksA5t6P3NETYiQYBIeexymT-TgZE2mVJHpMpgYZyQAM6kWl47DM6QtUpLu0Cd5RDed0h_TzvHLTIOam5WkBW9ChyOp'),
(120, 'Bittu', 'Choudhary', 'bittu1827@gmail.com', '7260899302', 'bittu@1827', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 04:35:16', 'dfaE3UXJRyCwS1pMYoSc3b:APA91bG1zGy4MYgDoOok-Prc9KpNDm3ouo7rliqFkYpCakSE3nsIA0emgIdFGBgSSlYi4CwcNp25EBeusLlioS-PdIbDzJyFUX6LUVIHpf_VO2ZRJ2KH_-ap-EaVEjKrpaPpxwC7HcOR'),
(121, 'Rajesh Narayan', 'Agrawal', 'narayanrajeshagrawal@gmail.com', '8789658806', 'Sabziwala@bgp', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 05:44:49', 'cAASBJOHTayLjv_gu72dS3:APA91bE-25EWGB_P1WotMSc53cNrIPzts3KSZmm9yWEzKS8wfDd6zCWEoCypKkSegHf2qZJU7oY-pcfMXdCTWeKG-hIUFNSNavYVcnOfPp8D30S2DNelSp5yHRbeP3zOC09WHnTaR33y'),
(122, 'Bittu', 'Jha', 'kumarnandan0099@gmail.com', '8409224268', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 06:04:36', 'dOlG18Y0R120AHDsAWRfdN:APA91bHVtiQSbMZwPdLUJKpJjzdC6HWBHntc4mSbOj3Bje2HNPSld9kjhY0oYj4swG6mSgHUzmCUNkKwzxZJiFRuUX8IUKy2JM2wmZdf-nVRH223wNyOFjloNcDoU1ASEu0ly_v7w8k9'),
(123, 'Rudra', 'Raj', '123rupeshrudraraj@gmail.com', '6205062540', 'alisha@805168', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 06:29:00', 'cnrr2Z0eQHmqhaZpK26lQX:APA91bHDFOWuqwA4BI6qllyYNYcr2uyQpNn_9a566SUouhacwZubEJFc7thFRDfibFvMgeHOsaCsryO46ULM4xndqXNlgZ4M3au1RRl2pc2h2BWjE4zvJqHuwp_6i-lxmBo6nhymA3uQ'),
(124, 'Sonu', 'Kumar', 'sonukumarsanam444@gmail.com', '6207932052', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 06:53:39', 'clyc8qGSSM2zJYtAmjJaTm:APA91bGrMwJzNG0c9Ea3HRP6jXIBW-M5IT6zwBQjdadJVDSo3EqgLngi71OyCPVPUKvSrKQFsJXy6y6N-mfo5UNsd-wE_S79B4B8S0d5kqrVpYtvRyoXp6NHlhmCqlcvUKn4DgSO319y'),
(125, 'Nikhil', 'Kumar', 'nikhil6203@gmail.com', '6203669455', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 07:11:57', 'cmmD3K6yQjmjXnU_k3269U:APA91bHmXzoLDVRLkiWJx8st15BUZEV8Ni5oCbQ6TtYAZnu18NWRqKIZH9abPlgGIRRT28WmtdgbWwGJtW_5SGlez99-Ws1etU-wMRmVgY69fMYbCw9mJl5MKVSwC71deQ3FJYjDsMgk'),
(126, 'Rachna', 'Kumari ', 'rachna.tinku@gmail.com ', '9304101725', 'Urvivats', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 08:39:19', 'eJAFeljgQ0mVLAsFVA69XA:APA91bFZfwewL2LtRjm28K9BeAh8Gl8v0mdEjuYWB6iSrZcpjuUNxcdDeva-fCatMiRlgkGlE60M4vQjlUvhpDLpCSPDJV1e822fePSomc1GG91sW_WG0yc17vjog3Hb3ouf91xENX3r'),
(127, 'Sanjay', 'Rana', 'sanjayrana@gmail.c', '8825119774', '201081', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 11:02:14', 'fy6SHI5JSKeOC0vYWp2gXi:APA91bG7CtQlODtDL7JVIYIPhKbQL8FeN5oLLYCVdTSISBXNMLzOz6wkcaBhp3CFm4h7h84UWhETt8RFx1ycmiQYWFGsl9Ri2XA2MGysX6bg3HtTA6BUJQM6xmD5Di2cC84_S5-cGv8I'),
(128, 'Hariom', 'Kumar', 'kumar.hariom1@gmail.com', '8092271061', 'hariom1808', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 12:01:55', 'dve-Dcs6SSy0udAl6LHq0x:APA91bG7r7IOLXi1Dh7oc0viBmraI4Sy4CIbJ6RwGmB3l1kAi-15H6u8wFuRKMZAwxNJx5zwr3GsyP1YG7t0s1SeI1GP50MQ0kWpIIoalOcG5ZenI4aN0xsl_8147V8vyEQVF5lZtBap'),
(129, 'Pragalv', 'Harsh', 'pragalvharsh@gmail.com', '8594558011', 'Pragalv@1987', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 12:48:11', 'ff0TlyPuRxiXZTBhrsazdl:APA91bHT3mAqRQoYSovaBb2kXZvfmYhGIQ-NfzXELSs0AtwhPgpv_TzPoYzOJcO8w9ZbtjAFsi1ByYygA9I02g_R8k-uzzmblniwlUzX6ZL5wcDUO2N3bMUBByy67LDlOTEJRz6f_v3k'),
(130, 'Prita ', 'Jha', 'pritajha271187@gmail.com', '8158881300', 'chotijha123', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 13:20:22', 'f8eE7QpfR9SAyiWcvsOt0D:APA91bFkni8-K5TfHuRVOi4Nhg6e0l8lOQJqc-XsQE2Q9NlcgHBxPr9lNnn2Rpj8skWoedQ16FglydSZyELsNKbCuTzrITaEAQ_XFT1S_9VS6NoFdw3Jp7ngeHTjav-Ptk24ecifIqgF'),
(131, 'Vijaya', 'Agrawal', 'vijaya.agrawal84@gmail.com', '7717741029', 'sukeshi134', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 13:32:32', 'dFcItb9UQKarI8DSttKup4:APA91bHO9Jt5fMqYeGOVR9aYVFFyL9ncjzU473mo2xMQlTLqhyq2h4OTGw3IHIoCIcuhCdnym9MukPISpbuKTg2lujZKe--dZhU0RTcNbrLep_iV3F_k43ig0UV-ZoHJd1mF3FlD1nxp'),
(132, 'Balraj ', 'Jha', 'balrajjhabatu@gmail.com ', '9933438951', '123456789', NULL, 'assets/images/noimage.png', 'y', '2020-12-19 14:59:22', 'dbrJ8RodSwOjDPUUtZCuIx:APA91bHqbSnsELUGM_vYptAAKtxNW4Icbfx98kKwErnmVTmebdN5a-BJYF5YbWsER4eVy74KHU39CmzCRPRF2noyNpYA5MlUoirCsbUgfwMPG4DfneIDufW0nZJVX56Bg9jeWz4qZw82'),
(133, 'Reena', 'Jha', 'ajha62507@gmail.com', '9334584190', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 01:24:45', 'e99LEYHNRkiO1XsrvAUPbA:APA91bFhhf173K3Ttq-9EfgCghT4crIyyuVPPb_TiYTRsEbtzsOzme80CQUtDc3GHyhqd-mizoVIoXkX8XYDTt3jkWQ2creyASWdeTB29meu04if-hxE3QixknCEiLp2FQwQhNaNKlvb'),
(134, 'Golu', 'Yadav', 'golugulsan0@gmail.com', '7050132019', '9162580121', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 01:37:21', 'dYdsWct4R6i-oZOd2OWU6S:APA91bH3_OFqpW-ZVB1DGY61p-1M2r4jQ-kH3LO3NUNWVxfcHO6TcIMOW8j0UwagIrZxY5HkzBVVVQjlLoTJDHCDsC-K0p6l4iwlncKlUl66WZucS-EunUE7AvEVWp53Gv1ykSePqh4_'),
(135, 'Ravi', 'Kumar', 'rajravi034@gmail.com', '7982067030', 'rrrrrrrr', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 03:25:12', 'entasfRFQ3aIb-ioOmpHPx:APA91bFcuC0WmHLW-Q4WOsyoxynOKmcJCvDnweprYHyZBc1o7SNnO4DZiGyM6NIK1mLF49TatC1hSTVAaypsxCFtgCjGPXvLlk5AJ2pOJBmGlAmoUv--3hNrltJ-mNjgi3qXycY-6XZe'),
(136, 'Niranjan', 'Kumar', 'niranjankumarbgp49@gmail.com', '8340124303', 'guddu1234', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 06:03:27', 'fkH-x8mVQqaSqU4FHX-Vu2:APA91bGK8MpltuMsvM0p_55o747LSR4qYFq3Q0E6Rgo4kD9aW-RhMypvYFsaaNFnVI0txC0rdjxOKf77iii1v90rLyRgaNGs-S4NyAVtSQKinIrAL_i0xrlxAV-2QMw3dMBU2NghoAjS'),
(137, 'Deepak', 'Kumar', '1deepak.kumar521984@gmail.com', '9771622800', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 06:42:54', 'cROOAEHcS3uALNs8QpCZpb:APA91bHaQg2T_JTEqjxZSLJvL9CIiE84X3LU3e-Hu9jLhcwvk3K3-Gva9fcyMgQM2a17ZKZM7q30LM3hgu86ZfoRdqHgxlnBmI04YhETWuDIoCnowa2FPedD0VzxjaiTt8t9Dygivd69'),
(138, 'city', 'hospital', 'loversonuraj@gmail.com', '8271442162', 'city12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 07:11:42', 'flGBMogTS7C-IRgu_0hHuE:APA91bFHGK7oHlEn_MShX86yM2tUPV6CXCLFDLryo9FUm4kw8Tkdbqoeo1i27HlDkT9C9kDhW3bc7eeXLjMueKzi-bbI7bjKzVd46ZmMi91So5oyk0Beqoyp7P08HNuLaclRoz-tAaaI'),
(139, 'Nitil', 'City hospital', 'snitil62@gmail.com', '8051433444', '29562', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 07:24:38', 'csYYj1alQIWKD2f8e92_fg:APA91bEf6XpLAuNGmBTAkMy9F9MOhMKAm3R-DkmQvA5iJtif3qlU638Ho3oo0c0H3lorvhBCanm_dJFzx1ScwTSPol-YZ8a9AACPfTkEdYiC9jc_Q7s5f_TDb_NdpHEmXvvuhW3Fff2I'),
(140, 'Gautam', 'Kumar', 'gautamambulance@gmail.com', '8969837650', '12345678', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 07:26:45', 'eXa8prEBSYWwr9qoay-NTf:APA91bEEtlkzlh-0u0JBIUfczbYIH_BlAJ4AlnHXFsCQ_KOdPPZ_ULSSrkB7RcdZ62h3BYo8prAEyMn8Sai9qugFu56NSXGYDVz1h7urrrlMChaF2l6TaINUHDYWFySixh-PsaQDXE7F'),
(141, 'Manash', 'Kumar', 'Manashkumarbgp@gmail.com ', '6200592137', 'Anita@123', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 08:06:54', 'fSCIpB_tQAeK16Z8rORGAV:APA91bGlkA4KAP27U6rMa80Ye8e_OY073xEp9lVfoKAk4eGSFRB_q4DIkr9YWMIlcseHhg0Ed8omvRK2-KBAAOtwUuy3bxsg0e63cCnBWkbu351VQKdBUp0DsWRp-yRhPzXKA9zFl9t7'),
(142, 'Abhilesh kumar ', 'Singh', 'Abhilesh.singh1980@gmail.com', '7004493776', '1234', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 08:19:20', 'enG32vHaSBOwqJNMvyVEP4:APA91bHBlMOFUd3ZXRKg1V6jjanMhoV1GOJQu3h-blFqsA2mfOtwzrnT5Hl3cHaBEVazEJ__iEf3qUIhjioY5w4eAaA0pUFhrZ9KB2_YsJB4ASn2uS6j2YZqogH14klGtPK7GPPkLjvf'),
(143, 'Rahul', 'Pandey', 'r9470025791@gmail.com', '7011303977', 'Rahul@123', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 09:13:30', 'cqa8Hv10QcyClOcJK1MiwM:APA91bHn0noYwJKabPiEih_TThRQQj7oRwI1uidKKPZzbJMJuHhssx2ucbSNs2sK7aYdj0kB67mTYX0RW61f_AI-m4_WrpsOEIobWQ8v42lp2_rS5CakVNbFLJkUbQ_047pq6R4rWLyf'),
(144, 'Binod', 'Ji', 'Vinod902@gmail.com', '7258815444', '1234', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 09:20:26', 'd9RQlJvhSr-iL28Khsmzwk:APA91bGxPT9RpSW50ZlwJ1a3aNRvYF8qPXTk6Gf0XhyW-4qWv11MBiIyxDlRK1m0_jTm7T18SOd3wR7dK8NGZwmfWEc9olsOpzZiIj8lG2XTBvtYam6ViVKcRxCd9nXp7OB_2UB0p_k9'),
(145, 'Ayush', 'Jha', 'aj8696799@gmail.com', '6299610659', 'amrit135', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 12:14:52', 'fjYJrIm2SASIbMJDOQsJUx:APA91bEw8Gz4VN5_kOBGo7RegP3zmi7ql6uJ96TiTaaUXKoe9p7aIcDg6cSO6apOj8o0V6eiWTfANIjlNaC2Q3kjSC_1K6-hjEG8vgPFYVtJJ7Wgyo42h2UXjV5O6JKFV1mXDxbNvfmO'),
(146, 'Keshav ', 'Jha', 'kjha3179@gmail.com', '6299529643', '6299529643', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 12:17:39', 'eqKGzr54QBe3QGReXySxmZ:APA91bFQK2xnxAiNDAsU3VfyCfiWuQr-CPTpiTMbT77ZaDtqIij7HWZrC8IL4ULEnFhHYqq_4SPUPJYM0CLmdaNTykBFaHPXHqNHxwQmxdlISIwylkDs9o_JmBZxgV8c1iWti40v8qs_'),
(147, 'Ayush', 'Jha', 'keshavjhak4509@gmail.com', '9572348752', 'ayushamrit', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 12:22:05', 'fjYJrIm2SASIbMJDOQsJUx:APA91bEw8Gz4VN5_kOBGo7RegP3zmi7ql6uJ96TiTaaUXKoe9p7aIcDg6cSO6apOj8o0V6eiWTfANIjlNaC2Q3kjSC_1K6-hjEG8vgPFYVtJJ7Wgyo42h2UXjV5O6JKFV1mXDxbNvfmO'),
(148, 'Sashi', 'Shekhar Singh', 'shashishekharsinghjamsi@gmail.com', '9431462799', '12344', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 13:26:51', 'dXyAuOoKRPuqEyQXLDGZZq:APA91bHTwCvjMzHz5LIYa_sFWxS5_mX-aWHw_33nNQp0mUlFEEHz5b7uYOj4gahZ438Hst8gimCvMxA_5ud_bKiRlNjMw-18Bp3t__YUsoWdWCjSZT6n0V233FtgdZ8H47AP_qkVDkE_'),
(149, 'Shashi', 'Shekhar Singh', 'pinkupunam13@gmail.com', '7903034953', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 13:30:05', 'dXyAuOoKRPuqEyQXLDGZZq:APA91bHTwCvjMzHz5LIYa_sFWxS5_mX-aWHw_33nNQp0mUlFEEHz5b7uYOj4gahZ438Hst8gimCvMxA_5ud_bKiRlNjMw-18Bp3t__YUsoWdWCjSZT6n0V233FtgdZ8H47AP_qkVDkE_'),
(150, 'hitesh', 'prajapati', 'hiteshg2297@gmail.com', '8487953552', '111111', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 13:33:21', 'ftUzq1G1RKuokOFyrNO2dU:APA91bESAWOJJ90pW0HCUbA-MDBrAnNAyA7FwRX0ul-fzfn30g7-RyrrSsQFKhTVb5ZQBIDD9Xy1wHckKOwQxx7NZMpBOj-nJ6IJ7VN1pcMSgwBjlP_FuZOaveR-6nriZu7k7J8Kgpgj'),
(151, 'Sarita', 'Pandey', 'a9470025791@gmail.com', '6299223428', '1234', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 14:15:53', 'eP2d-uCFRJeIMzX-ESr8oK:APA91bHFcghHhJXOPjeull9vag-9h8_33KjOP8DrO5Fe9sQSHHzmA9jxCrdWr0eJN8_aKkjAT3ESnj0vprposgT9SxOtHGjthcQQoJs3-DOgtS5nJR-eq_of45kCxk1-8sPKJ9pRmtgw'),
(152, 'Rajiv ', 'Kumar', 'rk141263@gmail.com', '7970466740', '22446688', NULL, 'assets/images/noimage.png', 'y', '2020-12-20 15:37:18', 'fsyVKoXrTpKT4HBCqnVZNu:APA91bGka3qbPcKV9Cpb1wheLVgK-qehNf_dcEcnAFpYH0Xbr847oJc5vAjfzz1-qM1zS9lsIS97hUzK0v__i6U7TTprT-ulf4DA5vDETBWqPiUZ6FWTzUvJrXFxa-Ts4Dmw7pzK9C4G'),
(153, 'Suman', 'Kumar', 'suman776500@gmail.com', '7765003684', 'suman', NULL, 'assets/images/noimage.png', 'y', '2020-12-21 02:21:30', 'fWzQJgeMR7uc3UWKLdQVN6:APA91bGHRMCnhS2PGnH4-BOvrru3m9JqQsPcSQDYetZ_hPnTXsmDSONmVylVULosy_V-0Tg3e-22DodELIOHzzs5zsOXIL8FBs9nD_RbGlVeYywa5V131-khcS5Qw_2OL_79jsaFlclB'),
(154, 'Amrendra', 'Kumar', 'raisristy67@gmail.com', '9470864502', 'shail123', NULL, 'assets/images/noimage.png', 'y', '2020-12-21 02:38:12', 'cfy_bs84QgGXJbR7nJce4Q:APA91bFrQKfBlrrapqRS46l_pkloqzz34Yz2zoCPUOBgSkUcb7vZAlSjIQu8YraJOWvPF2wwp5udlbDaE1SKrB_8-sEzq7DlJF_ljk2dbCOpZCm0ijN2gzUCNQBG0LM0LmofdPsg6oUM'),
(155, 'Abhinav', 'Singh shiva', 'abhinavraj7050181044@gmail.com', '7050181044', 'abhinavraj123', NULL, 'assets/images/noimage.png', 'y', '2020-12-21 05:29:18', 'dzpoDo-URhaZeHWmePB4xC:APA91bG_4rxBrzFfHwTRdfuFunPaWJCjfTqxcECSppdEh6EUyfs3ZFDROh281vmJxZkXPXM8kNn45HmCKRDSlhvZqlETJGmy4R4IzLRBCUTh4xwYJEc6E-Ixyiib-eUjwl7D_vWZRvmX'),
(156, 'Arman', 'Singh', 'armansinghthb1234@gmail.com', '8789956279', 'ankita babu', NULL, 'assets/images/noimage.png', 'y', '2020-12-21 05:32:27', 'dWn53zDLQ6WL8MxKQwuX57:APA91bEqUOg23605XOhgNWrpUDjEKqLTwhYUmJ_NwyiDKqVBkkmiWt7twEXmDmTFsMpzipNQqC5rKom4PPA90ghu4JYA_4j1IqRynEruyC00bGZcYyAib0Qf0EiITmRe94tE0TyjV1YR'),
(157, 'Gautam', 'Kumar', 'gk124.1993@gmail.com', '9534888460', '6200650421', NULL, 'assets/images/noimage.png', 'y', '2020-12-21 07:04:31', 'cVD7R1GUQ-WtIC0_crw_pF:APA91bFMgLJp4GJupsHhbQBAkpXWziDmyj01mR97v9Oaqz9VpAtrG3IfsP4VWItTnQfXaUxfM5oTWTCBcD2LfCAg_YluGSU788Vht9fNeaxhBWMFXMjSU7O99maIrJk3KFqY4_4vRHLh'),
(158, 'Shivam', 'Kumar', 'ss5340988@gmail.com', '8292713109', 'Ss5340988', NULL, 'assets/images/noimage.png', 'y', '2020-12-21 09:02:55', 'fzrkZfiVQQ2NXGzsLw7mlo:APA91bHfsIi9nKf8j-FcG0Fv3x-0ju30fGJb5OsUNLe7_zBvPdYSbBTZZsBkslbvlPbOmzIX8-gYKXEYBR7KRAkDg6E4DdlnRe5bEISx-3eG4ChsNl63CenXEDk-TT1fCiF5FqdeJEnb'),
(159, 'Kumar ', 'Aditya ', 'ka8510013@gmail.com ', '7209708205', 'aditya123', NULL, 'assets/images/noimage.png', 'y', '2020-12-21 12:44:48', 'dx4zKBfASV68mZzY8CIxdP:APA91bFNSmr4VRKlDyfw88a0iVVqRsuD9_6URTEBiTZL8GWS2FRYxGXv7UY4i8nyfp8mOQeGk5Zp-JrMTgZkqY5TFt0K2-ItRFKgYg5IqTciZQgdyXQEf6Iqxhur3eFPTg5Mr-0WhY8I'),
(160, 'Ayush', 'Kumar', 'kumar.ayush28@gmail.com', '9971871234', 'ayush10011993', NULL, 'assets/images/noimage.png', 'y', '2020-12-22 07:45:37', 'eOsasRiHSyqVwycRBSPeiO:APA91bF-U3JVFtzNZ2p7Cd8teKYFm3cfMripeCBRK36O8gRmbAD5FdZvhwhurJm0Q1SWHKjqzHfA-5fEQH-pw4gpeohOJuOCcTm5hAwkRUTbYB9g9KU4tOTKxGuwxAZYc_5undjFC-Pu'),
(161, 'Niraj', 'Kumar', 'niraj5041@gmail.com', '7972653404', 'niraj@1992', NULL, 'assets/images/noimage.png', 'y', '2020-12-22 08:16:09', 'eISafUbvRzuazC07_PW5cy:APA91bEIi3fviGumCmR9KZ2lAAX4hOO8UqZYjDOAASlFm9tfXFgrM9czM8ikx-eQGZU9gm2dgGCw5rOjb1nlLLoxAz2w2WBK7g3rL9hoVDJBNpb5pvRBJXpL8rz48AkZlLSJTM6IuJ2A'),
(162, 'Pranav ', 'Bhardwaj', 'pranavkumar8455@gmail.com', '6205598451', '1234567890pranav', NULL, 'assets/images/noimage.png', 'y', '2020-12-22 13:00:16', 'cz6FNzdnQDuMdFRoqKAZEL:APA91bHrw4mBgXP2MCbeWKZLwpKkzVbf05DVPMtHHFXS4Wpv_LQ4H5bqhzXJGteJxsVKLPayZwNpSgkLkXWc6TQH6Pv0rSK64qP6vH9bfh1v3WnCnQzH3CapKL7fpNBSK1GWfwfPKvzl'),
(163, 'Abhishek', 'Kaushik', 'abhishek2002kaushik@gmail.com', '6203872645', 'abhishek2002', NULL, 'assets/images/noimage.png', 'y', '2020-12-22 13:20:30', 'fbpeoWxiQResBFlbllNCdH:APA91bHcKrjPcmtzIDRB_0dckl0-QhxoHGlIx-sZbCz3PbmfChXg4aHmofDwtsiWSuLsFlu5Ccjf0w69K4M89fHxvvTbxwZ-CJaXplE9kGedKcNc-IuK9GLz8JIa5uVRhDLQUgL48gEi'),
(164, 'Kunal', 'Kumar', 'kmakhann@gmail.com', '8540898639', 'kunal', NULL, 'assets/images/noimage.png', 'y', '2020-12-22 14:48:08', 'c2stmaL6QEKyIdS74uTkja:APA91bEmxdT31fjDXqOjn3PCjiSyYXpTJIHeXKKHiVNbN2AmJdqDfzMD9MmJQtHY18CKs9IL36rSpLvtCQe4CkD387akY9LuhVBZRNCOKJZU-mdaMbWKaJkYspkAoG1VmoChzw4_sVsQ'),
(165, 'Ajay kumar', 'Mishra', 'ajaykrmishra2011@gmail.com', '9431151428', 'ak2203030', NULL, 'assets/images/noimage.png', 'y', '2020-12-22 15:35:07', 'db_NG_wPS22QQkJZ3V2-xZ:APA91bE_d7AnrYLVdyFDw956darDwFCX56_pf70KSqDt0hY_L5Xq9Q6z-zzH159VeiYOidF9av5dn5_508kPw0Z4nlruVgWfm95kdEs5CVT8ilj7VzisDBYyYH8xhy8A81xqBM_ytrwp'),
(166, 'Bunty', 'Walia', 'Rajeev3bunty@gmail.com', '7979980368', 'bunty#007', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 04:19:40', 'd8rXXy18SKO9u79sV7Mio6:APA91bGyphguGavjn_884_HLqF1-3mkfgdo2ND_ttY3PC5EwzAcm3o1gpwd23wFO0pq2xOAwrOLldDA6xS1OcyLBIFbCmGVO5oYPvWNv0rwxAuRqQdeRol09brciJGUd-NET6QGW0pzr'),
(167, 'Manju', 'Bala', 'manju.bala1320@gmail.com', '7005664623', 'manjubala04', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 04:54:05', 'fzpLVaF6Qu6EpegBt91CMY:APA91bGwxvOfFG5l2IttBYXmtsl-ODLP0Hi3jHyXvesWn09vtpVnfZH4_gA2_o4dady5Vc1Wdo-kxdJwtJFM51q4ClMhXidido1-ouv-IHi64Po-9OGFaFcL5HfVEQgiuWvQ4uodAWYf'),
(168, 'Anupama', 'Tirkey', 'Tikeyanupama0@gamil.com', '7050731004', 'Deepak', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 06:14:30', 'cyNlBrWKRLmKdTqThvyPek:APA91bG3fUymmRbYJePPYOOYRIsKAfwHS6knkGKwHY0_LhkbPthMBFfEfjWq9IFgcPlTzRAxWby9NQWT4W8X65mZFhDRSq46CodtfrCXcIK70PdNFyIhSPfv_cVJkR1_SRDCdPduMojR'),
(169, 'Arya', 'Singh', 'arya34singh@gmail.com', '7549049550', 'jugnu', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 06:30:53', 'c6mu4HSZQ4CiJ6Ff2Wrvwr:APA91bGeQDNkDTcrg7VI54X8ERS-YdtpJbWusYHqAvYNwLyW9CLy4i9iGZLH0SRe-_CSzG5DMVi85x_-DjlMR0E9c8_kQ5cxiFsjjlkSoVc8DOH6ufT6nRlQIrFO3uUk64vzw-OREXNW'),
(170, 'Srishti', 'Singh', 'srishtikum2468@gmail.com', '6206453087', 'Pannu', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 07:07:51', 'eybe2q30TeioUTx16_ZrXK:APA91bFr7qagxu7QYdgLQSMfgo4z4kr-qZbkqhv8IWK9Z_kEyv5cSGbO8W4lAG2XTWgytrsxHKovMtgWCeGBbmXnGw9opDOUxDQNKuifGlByf3dwtsJ-oyKTJ55xLWsciHaM9FvNG4sj'),
(171, 'Sakshi', 'Singh', 'sakshisinghbgp2016@gmail.com', '8709777537', 'sakshisingh', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 07:09:41', 'fWX2qFozTSuilcxFvUw4cY:APA91bFzT153PI5U_9CMCzEj6RHDZA2J1OvVc-JKq-dttal9rlSfyxgz7ISIxbx_WdQu4aeNIO8LRY118D3wJUJdWgH90w0TKjmqXFn-DgM8LEZKnQa_gQGI5HXPjKJj_Li46V1QB7wt'),
(172, 'Monika ', 'Raj', 'monikaku246@gmail.com', '8051611851', 'Monikaraj', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 07:10:27', 'cnaio545RoyDeuaFRglQnR:APA91bGE2MvuZTARlrkWtu6btwC2AywciB4e-ROQ_8FRQ683qKxemVz22-yUH9quctho07HmAkqFbwgw0T-3P2GCMydKkRH4JdIVADPVr_8-kmhVR_WHhCJXg7fCLK9PapErrigqkw34'),
(173, 'Ritu', 'Soren', 'rsoren432@gmail.com', '7643955406', 'ritu', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 07:21:21', 'eH9LXOKNR9yciTK2M69wlY:APA91bEEbjigyGKBy9gbi9m79Oc9FosHtNBAcUiX8NwB1YzTCWdN_XcBIXrP6BspV9umGMZDz5MLeWokexj1XEQMzKpdvtvIgpIQm4lp9SL3t1OJdz--mvShcgq4Z8CYqkMx90oL9kLe'),
(174, 'Ritu', 'Raj', 'rituraj879587@gmail.com ', '6203912025', '123456789', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 07:27:47', 'cR8t5T4hRm-2-2slfeATla:APA91bHbefDCSwktApsmHeG6ya3jpHXtOL1bfsmOIcln3yznKYCtssXYou0cx3nIhD3rwxOhwk0IciCYM-EB2x9BVLPIhncRT0ApfYRchZp_Vto0FFQxN3h5qtjh7vXraYXdtFNxronG'),
(175, 'Rajiv Kumar', 'Jha', 'rajivjhajk.88@gmail.com', '7667274473', '9934873768', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 08:01:27', 'dfXKH3n6QeKgnFYVHgQUf4:APA91bHmhRTGGEAU7Hdcdv7PWgN14anU1id776n1EXtq0udMeM_lbb3Qwa1oabj_e6AFMvzjgRISYE_3uA2TQLQPFBLGEEe41zt4OnPhCj41zsZ5poQp-E-0OOFnjegAvik6Ey8I0sCw'),
(176, 'Rupesh kumar', 'Jha', 'supritsagar@gmail.com', '7903960735', 'CLEAN SIMPI', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 08:31:06', 'drbu1pYpQWC0CSXK4B2X9p:APA91bGNKx5cjv3mqQ8OPchU3p6ljkLRy-0GkI_ISNHMS5ME_sBwNU25Y6I36y8Kb83AQx12OUv27P4Pk09gKoxa2owEfhx2HSdy_916kYYFLRmc979VHPdUOlhERJ5d8SBNresPlS1g'),
(177, 'Arvind ', 'Choudhary', 'anshuchoudhary413@gmail.com', '9155246401', '12345678', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 09:24:26', 'cfcEqSJDR4en8LxHOiixYZ:APA91bEQRQpqaecmobd2MjLqj3fkHMwSug_1ungsHEu7K3uJfbTxf_zHXNhu0Els_MXNpHdAwZcbuDTCheaaMRvIkTF4VnCe1j6eCMEP0b89n0kVwdKKGMxwdRYlisuYomH6_9EuDkgz'),
(178, 'ANIKET ', 'KUMAR', 'ak122486@gmail.com', '8877782922', 'bittu', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 09:39:41', 'fk6LKJEtRQqAfY8GH5WoDB:APA91bF2O_7NmbmK0xeshoj5ACgPWv4Ww6N8gfJodL9e39xIVU7Z_5J30wI5vJZgp1pIIrqeqUyd99rByD-jI8I07T-VjVI_gCme06F-XgJWZOKlHI1JdTUrcBQAQEL72CbPveEbKtcA'),
(179, 'Harsh', 'Singh', 'harshbijaysingh123@gmail.com ', '9429586604', 'HSrah1945@', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 10:17:24', 'fQJpQgIkTmycRR_3vK8LsP:APA91bGfZq4DV_MiBhAmTLCS4HMyZr8YauhjufFKlo5kpQvfr47RvWF21GEZ7mR_Jd8Eq2KQxbZfx4NkJfnqtD82K4GUSnVAN4LJyy-G3Ugx_P8hcJ_w5-t9eDWAVL-7Q2fcUap5zQAf'),
(180, 'Gautam', 'Giri', 'gautam@gmail.com', '9122979595', '1', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 11:50:58', 'dqtxUXVWS0-ZSpG1k5qLZB:APA91bEf0YytKWwczR98ld1MBd7zJqU5CTLL-izRfyaP6hhThMbDwihh123DCtEqU6oVCZiz9OgChMWxtqsLTTDYqGAls4fAvGS0SB_2hSuVahK6ALxhl6Ld0jRIiWeUd7RkuuMADhlc'),
(181, 'Rakesh', 'Sah', 'cakenice786@gmail.com', '9708007309', '9708007309', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 12:07:05', 'f71PiYHbTnejCOefTHRmkw:APA91bEN6qT-4-EtDoYZk7LxYCX8wU-z4d9AdiaFqf-yXoQSNXJDox5TcC6_aOmPcZw1yp_NLsRv5HK54Ap6OmYgVbA71RyaJHRXXwNHMjxWwdYgthYFpBC2n4feoA6brMtMpQ1GDzqy'),
(182, 'Shweta', 'Mishra', 'mchhavi53@gmail.com', '8936011800', '1234', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 12:24:22', 'e2u01DgpTVe7rA1KZ3bsrD:APA91bEJJQ1hjOPowhVjEJQcl2_xlizX_XkwPIdkddyUYzvChYDwOYbB3zO-OZT4L4l4PkFWI8TpxyWWfwXIxpgbtKgzMDNxARCOPgqLfVvm4wxfACm0JGpLhkM6Gv2EmlUgLH-BRImu'),
(183, 'MAYANK ', 'SHARMA', 'mayanksharma8509@gmail.com', '9523693155', 'Saptkrishi8509', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 14:03:28', 'cUhibCLBQFa3VF6N9x5RKh:APA91bGJ7L8HVpAcIkJION5LeIwn0qclgweydSChOJhQZhf-y__hOes6cG1i0ykKT9v_dGD8QmbNcUaFFExNwvdaVVzfzJEsRQz2AXr0a-OevmvQjd4cZ4r0yxdfScvv5i78Z3S_eFhA'),
(184, 'Aditya', 'Ranjan', 'aditya.ranjan2003@outlook.com', '8102981027', '#aditya', NULL, 'assets/images/noimage.png', 'y', '2020-12-23 16:15:08', 'dedOWoG6RTiFp0plEes4RS:APA91bFkKkMJlJw99rsOa-hMLIg6BcFgs4zTV9AK0Wu9iSvA4Qt0tFYJXSvgwOCUuu-03t06eO_Hc9_8DLdMiVOLSDUmRlq-HRhsALIteZNEQ_A2zM139PW-Pu4WfIGOWu3ZOaoVxI9R'),
(185, 'Sujal', 'Kumar', 'expertsujal0808@gmail.com', '7484832713', 'sraj0815', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 05:39:25', 'f-ARsGAFR2axVyNtkQELgR:APA91bF3pQ08brGC5CCY8JHfXN_raIcgVcp-Q4jUwJ6PESekDzr8InDTwqH1Y2TpUA-BW3ZSu3GhKDSC0Q9_w60z-tgKwJdFpzZsPYWBkTLT68cf0pvI4X4Bu4GX8nzYmSSeUij2LxLk'),
(186, 'MD SHAHID Alam', 'Khan', 'md2828092@gmail.com', '9142862351', '12345678', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 06:05:32', 'dDw69qGdSl2IExVgY6zdir:APA91bEyaEKlSU3BPdlUyOdszcrXqYgEawjAUqjDSNTdzUl5c_Gu0GIPqFyjXRuKI1jd3sbCmKBdZBdotXc1GW52LDlKqYR6vGnMukBv7mcRehC14XsS_qR1g7ywVJRpjGy9VZjO0so7'),
(187, 'Shanu', 'Vats', 'Shanuvats999@gmail.com ', '6299458087', 'Shanuvatss', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 07:06:58', 'eeV3KoErSNau2RMaQAAZG3:APA91bHBjTQISydT6IHnW42XzQLEOxapJVLJNdEgBh7LBdHBI30htqVxRNT4r95kFDn_zS5CEBAJypmAwgv2j7ple-wyvoxo75SADKoVrsOx_zmwlyjqXVYENp9_KR1PDYDQwNHPAqO3'),
(188, 'Devil', 'Shivu', 'shivamkumar201896@gmail.com', '7033389624', 'DevilShivu01', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 07:19:37', 'dNcS9w0yTGi2dBiic_r6bD:APA91bGMg4iKYlerfwgaDbNXSdBY9J6nzBOpMM-zRJlzv88v0E2uAJgvAJNS3btPI8dztEKDMdmdZ4pGbjM2tx4MTPs_Z20WvC2-U2PWo6N1J5PWG4PHgrPeo5SwWFfEPmpOitHvL3Pk'),
(189, 'Rakesh', 'Kumar', 'rakeshk28100@gmail.com', '6204821468', 'rakesh', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 07:35:43', 'fDX199ThSACw_fZxlgQIcF:APA91bEiDX0GoPxwA0Uy_5We2n5OMWHrMLdQFzT1WhiYzYVvNLAW6smS3ZXMz8Rud_6HHFyXmp4SoresKCGVlnrjl9tmk7vTK7gbdrJ1LqMNGtD3fa92-qXkpkVTZ1s0dIdd_JnL8PCr'),
(190, 'Anshu Kumar', 'Choudhary', 'awesomechoudhary84@gmail.com', '9934382206', '99343822', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 07:49:41', 'cfcEqSJDR4en8LxHOiixYZ:APA91bEQRQpqaecmobd2MjLqj3fkHMwSug_1ungsHEu7K3uJfbTxf_zHXNhu0Els_MXNpHdAwZcbuDTCheaaMRvIkTF4VnCe1j6eCMEP0b89n0kVwdKKGMxwdRYlisuYomH6_9EuDkgz'),
(191, 'Pranav Kumar ', 'Das', 'pranavdas.k@gmail.com', '9264174602', 'somuda10', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 08:22:40', 'fhGniVWeReelG5VHldrU1-:APA91bEIbXq2SnVZ5ltJJRPcZ1QpPt4XCVLp9mRXxU7vOkzTIncyhY3RSdWil143Tv4rMaCdfXvWIRtRbkGeH2RtBBbJGnvrs21Z8N6U1DEJoGDeGjFJU6Ie411C9jQu64ZK_GDnDk7c'),
(192, 'Vinod', 'Kumar Dubey', 'vinodkumar03989@gmail.com', '6204128015', '802313', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 10:20:52', 'dKbJHG8uTSOwRjGXxbXadT:APA91bH9xHnId15rOBmdM1PGAVv7he1EtXAlDgNOl_JEnNfay0XAGvg-_gGro0660d3eB2Q1ueFEI5v_Nvhgxcy4ZDFvgZevKTgoqIn2QmGt906EpyBsuwLFC1jV9BrQJab7ed-iOJ_-'),
(193, 'CHITRANSHU', 'DEEP', 'deep.chitranshu@gmail.com', '6200403085', 'Anshu@2610', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 11:12:53', 'fQooHBWRShyF9fPFTQb6xB:APA91bFXCaNfLMK5ZoSIvHZQ7zZXsEW4uV5JNoumI1G5y2l9ZvvcyiSBS7sUUtDRlhZz7bu33JsofZVOwSzhWkasmomWG1E57HfbP3Ur6FOMoMKQrEmdNxXJ4_K3ErE_MwylnWWEy_jy'),
(194, 'Ronit', 'Kumar ', 'Ronit2621@gmail.com ', '9123427690', 'Ronit 9123427690', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 11:24:43', 'eBFokfOySmKfYQTwTD8uzd:APA91bGN1dpe-1X4IdDVjDFmdb3dxgZ2m8tcvZBjkU3eSDS2Pran-RAX7UoXnspsizWsPm0X88aD4Y56xOcvTf7gC6aFGRUDdEh6iNXho14esVHkaRyxOCJr9Ia3jx-FTSyVA8BH45QX'),
(195, 'Sanjay Kumar ', 'Singh', 'sksinghbabloo@gmail.com', '9470071840', '1966', NULL, 'assets/images/noimage.png', 'y', '2020-12-24 12:06:23', 'eiWvogSHTNGySHox2i5GB9:APA91bFFMaEQz5_PQt2Vn8dq1E-fKZ1bezm4kqVb02l8qx39exmcMRItbwKK5hnuBWRa5FzqyzPBfyM8GesrlyM1wg8EMx-69L5CgidCFlmvKuhVeKB5ge0NkU7kLvjkctOmjK6kc6mg'),
(196, 'Mantu', 'Mandal', 'Mantumandal33112@gmail.com', '8434526621', '9371', NULL, 'assets/images/noimage.png', 'y', '2020-12-25 03:27:02', 'c810dgjnRd65lqM_07x6xv:APA91bGshrNOZqSj6h1TWtaeC1kN7qAydHgKIkWE608KFQc27be9y51AAvjwr2-XngJMLvMBbgpq3rLjLJz9IlMMq-ATk7JsMUeZvXA8Ir36zl-qnLE5Y9N3FzfHZBx15dM_6w_KFWmC'),
(197, 'Aman', 'Raj', 'amanraj948@gmail.com', '7004681929', 'amanraj', NULL, 'assets/images/noimage.png', 'y', '2020-12-25 06:19:11', 'eHjVhffKSB6hM5ybJh_YMC:APA91bHTDunn7j_0My60zp6Oi24_cPaMmugCHDu8st9OYBM6f0rvJVqgk8See_ARw5QztKm0lSC3yNSnJMQKqrtiiYzEJO6rfjipWNSfuVqkPXfslGl-72OIbKmvkmZMW_9DzIqq5Sez'),
(198, 'Baban', 'Yadav', 'babanyadav777@gmail.com', '8873814849', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-25 06:58:10', 'cfOYgAicRVifXfmW7KBkR0:APA91bHUVWqAb6pmLv8s1-cVXNQ6bkJthzAJ9mVs7c-CD-EOrXoCFhsMEBp_vc2F8gzC-BeCzr6Jx66o43KfcaJ_SeUbUhgUVK47UoKlsrddqFBr9nDsNI-NeNwcR-wIIwKTFIdWDipF'),
(199, 'Shubham', 'Soni', 'princesni21@gmail.com', '7277789714', 'loveumaa1', NULL, 'assets/images/noimage.png', 'y', '2020-12-25 07:49:46', 'cuX96TBWSy2kjkdX302_SM:APA91bENA5ZC5Ar3ktAtEsT7kQu82rwrHuRkQZS19tvCBYicxhJtX-eYUHFQy5CRNGn20xt3TO_a-KbzqlMtZPzm1w6saPZ3I0mqgO64SJ3mChRSVQw-sGYYKk1RQj77_c_hYdEY0Uoo'),
(200, 'Anulesh Kumar ', 'Singh', 'anuleshkumars@gmail.com', '7903974918', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-25 07:51:18', 'eXj5_BkmQnadciBQMrGA9e:APA91bGFxfi-lX2OQbY2xgM49fDC2--Oi7kcob6KGE8cJ8jlg7mV_WqT0r0rJsX-nPC1ngG0Nnk1U04gC2gzGPBKOAre1FLX8jbXuB6_-HKJJilcG6fS-VR6irh9ZS9CjKyOrFVf7YMx'),
(202, 'SWATI', 'Kumari', 'spswatipathak@gmail.com', '7260815400', '123456789', NULL, 'assets/images/noimage.png', 'y', '2020-12-25 10:43:00', 'cNRNp0BNT1O82rj_UUnm9R:APA91bEb6IiutVoz5hHRRubeLiMXt3vTM1PfhmLZe3qXk2gCguLRSH-sf32LFEQHunHKSFoby9l_EKgOzfxLiv95tTjr8cH3xGEj6Y9p1Fi8xpLc4U-rUli6h7ZjAD-w_SbOIj38w52f'),
(203, 'Bittu', 'Choudhry', 'bittuchoudhary76339@gmail.com', '9973879374', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-25 10:59:22', 'cdklX4tpSSS8azOTzr87ec:APA91bEcIattAKCVX1SmEWti5hMUGGwXMAjhzfmjcUULtozjSXu3vjA9v7wJIkEI-2UGTrLggfGMU1fOyFOsUtyQUSCKpkns_jnanT1CRg2JkNgdI_v6av4F2lJHpFtRFYDZqzGwjFyG'),
(204, 'Sarvesh', 'Pd Singh', 'sarveshsingh46990@gmail.com', '9608424379', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-25 12:49:05', 'd8W6uyHMQlGpLZRbul79N6:APA91bE-mlpQxPDtEJiqeTMfo7UXrAcWObT1ZtqZO_HubudfynhUy0VBCy0UaoCCOT6-iGefE-rwtwOxFtW0vjt5LGoJHe3cqIVdpTDCdbf4FbB4LWOALIvMv0tJecKN50wns-syQuOY'),
(205, 'Rahul', 'Verma', 'rahuladi175@gmail.com', '9006280909', 'aliyaraj', NULL, 'assets/images/noimage.png', 'y', '2020-12-25 16:02:33', 'f2yI26mRQbWGBm5H1jTA-D:APA91bGOsYnTFwDUryRA55X0LA1IQnbCxneAGEHBpklAHGziVWHtS7_dYxOVp6nVVrnLiCOz6cFhdXhtyQPNcGF_xcocaZRs-6RFNTS8pi4pIWQtIMaylMOzE6_54dNpRY55u8b3tVJt'),
(206, 'Ram lakhan ', 'Singh', 'mrrlsingh@gmail.com', '7739530303', '03051990', NULL, 'assets/images/noimage.png', 'y', '2020-12-26 02:00:12', 'd6RmF1Q0QxO82mQhNMm3d1:APA91bEcp6QR89OV4fe9YqvY0wRkmjPPXabMgkLS4rs6o0aImgTtWyaou6gRjnv4ssxde9JXi3SBIt1tdQzVQyle_pP_tIdKw0aIXbp4oNuucdliRf8oMBaguRzvavkN8vbSkEyIRIy7'),
(207, 'Raj ', 'Kashyap', 'raj.kashyap.1428@gmail.com', '7991173953', 'Raj@12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-26 02:51:29', 'ciBHxkJGTTWU59MUxggtO8:APA91bECn-vOHa9J7n-l3Wrz1tJp84HDprSPa7uRzo7lohdI-0LahXiyWBibV1LBi1OeelcY42qihnA6Db8Uwb5d7wDpQdCXuRAXykCC2Th8aKhuvMuH_r_ObZysUjDbk5mCWfFlKcmQ'),
(208, 'Gautam', 'Dubey', 'gautamdubey9@gmail.com', '8521329110', '1234', NULL, 'assets/images/noimage.png', 'y', '2020-12-26 03:19:36', 'd99g21viTp-9X11AgAht8v:APA91bF2PDEGvsYgJ6zwSukJe9WATeYFWh4LDJEnePSgvCIizsnNbmrjsJwc6wmc4-AhkwK4GxHwvuSZFSn9aty_68yNUTNqgxrZ-bDasX2QTuCWCaBxJbu647DZbErx8KwRUOgokQBp'),
(209, 'Avinash', 'Kumar', 'Sonu.avi88@gmail.com', '7564011843', '123456', NULL, 'assets/images/noimage.png', 'y', '2020-12-26 06:34:30', 'cyBlIN8PT2eSPIxhmplmJv:APA91bEvidgokUs4OvLLV36vImVyydNlsjD1bqM-lEPp_Gdj6jZe2ufwlYezQEbOIQayQtkHTlJ85Ylajfd_OXOENiOp0xZcrc3M7ATe7vyElW2cP8lmK-ZRF1yeZpyF_5zmJNSGQ0bY'),
(210, 'Ravi', 'Prakash', 'rpbhagat822@gmail.com', '8226896710', 'ravi822689', NULL, 'assets/images/noimage.png', 'y', '2020-12-26 11:36:46', 'eu4nb4YISduPvMJ4CVoYda:APA91bGPp_muUtkyJOqVjz0brpm2VUDJwNBPjjYjqS6qJ15H0oUBUZcerjcVkc2dvapt_rgcm9lzWg6EA6goDDEnWrzeTjEzEJS0ilNTDy1K75Nep9C4JDP6GI_wezXJv0MKCzG7ZeU1'),
(211, 'Gaurav', 'Sultan', 'gaurav2212000@gmail.com', '7050681184', 'gagan@2212000', NULL, 'assets/images/noimage.png', 'y', '2020-12-26 13:11:48', 'fbUbQwSNRqiCTmUz22iml9:APA91bEP_LpCy6gwEKwK7tXOduuNeHy2IH6v06cKLHks78rhHz0t6s_6GEs8JSj9-SuHFh-wm_-9vQDJOfRlhrcr5YsjS41QOgSKT-UpxmrsaRf9lsDPeDkm2psZMq4XP_uDNxg2JHp2'),
(212, 'Dr.ashutosh', 'Jaiswal', 'Ashutosha48@gmail.com', '8294211321', 'ashkom99', NULL, 'assets/images/noimage.png', 'y', '2020-12-27 09:48:17', 'cAfMt3nHSEC1y_hYDtPdku:APA91bH6XMWd3HZ6Eu3H48vOAg7vvk71hOV-Ryn4y8BCCfL4vRz8uE1CBIAQhVILumoUbPY-24hMOwXN3q6rBWIWjmVHLFObjxhNEkrghyXyDbcGZuS7lYs3DlA3s7_FV0x6wGK41Jir'),
(213, 'Suraj', 'Jha', 'Sksksurajkrjha22@gmail.com', '7903390037', 'surajkumar1', NULL, 'assets/images/noimage.png', 'y', '2020-12-27 12:10:47', 'd4MVwB98Tzy4OcN0aywotI:APA91bGr7B54b6m4cB-bTdEK8tv5hPEdw0THUnq8P5cAgLzqCN-972KMMq2OzHFAYYfHJWoqfSZwL0fX36g7EXf5CG1OaSAdYPtVdkMfmU1r8hFSvBdLDCkJB3EeJ-jgMSOsvsviyCq-'),
(214, 'Samiksha ', 'Choudhury', 'samiksha812001@gmail.com', '8002751209', 'papa ji', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 03:56:02', 'cvlofWD5TgSGMQDV_XxL0f:APA91bGyQIHqlFUWq2W0jXqhnTJlrUwMZ9iYVSesQxr6q_O1cwTyeyqEUJZvLzo2NiKveoXx6LRotSzktp4D9U2bD-5BxWbiBvoK-qtgrNhg5audtTDAjbxkoeLCMfxfo1oVlDryeWdK'),
(215, 'Suhani', 'Singh', 'Suhanikumari574@gmail.com', '7323953434', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 04:23:54', 'exNnP2m0TLK78ctbw59J8g:APA91bHsEUd9-nvU5xVlvHeLXrANxceIn5bVGnmJdEbNmZgwVmmBFvi6FHnpPVyQzINNJvmxQfrqL8N6yd8SyqZXV99VNicCu4diFW1GZG0daHGvAY7xrXwgSzaXDMo5zBjfiL0jMA0G'),
(216, 'Hritik', 'Choudhary', 'choudharyhrittik68@gmail.com', '7739179326', '1234567890', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 04:35:12', 'ceMuXU4uTNSgtvhVXGfjy4:APA91bFVN7Y2V7jS2NvVSEg4JzT-Di7jU2CrFGMcSvm_0uBktBtmgsbgmbz8jdT6Bmb2zrBNghtXL3Etc8gcKhl8V0ZjiU6129PFGUQPXX5AgL35a33gQ7IFagCUrb_hmioYPFHyPAVA'),
(217, 'Shanu', 'Singh', 'sanu.saurav420@gmail.com ', '7209829177', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 05:16:31', 'dH8f1Y3sTqKHD2zhtHIhEi:APA91bE07PQy-_DU94tSkKInkIbFGv77M0Tq_3SF4XXknhEtrcoODZdlrqRNElAQavEx6CiDSUIZ4VmFWo4jAEtznmZqTlXr9vx65rRTXUF8fQJWTbV5ZUgdNwZIiDelDLP2jGsT7y5I'),
(218, 'Ustav', 'Kumar', 'Utsav Kumar4as@gmail.com', '9631198899', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 05:35:49', 'eLMQv_KwS9GXv2K1MrPeQU:APA91bGpsIK-IH3Ox3JuL93VtIbEkYii6dE0WBVE_d_D4W55wyYnn9JVLJzxuQzuTizdgkcyrTjTA3yvOXehkeZj556WezmK5wXKd9SCTdLgCDtMwOWE8avJ62MEwnGFRbU5mya6jX3_'),
(219, 'Vivek', 'Gupta', 'Vivekgupta7901@gmail.com', '7979715305', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 06:21:27', 'ctlTgr6pQriKBgyAzmeIyh:APA91bFmQ5fMsAUFxMp-pzf2y_LnUBzPLAhAiSF-wBp21okDU0UvtiUQdZAe8fx1tEG2dhOaDiL4nxd_bsbusEF4BkK1RMKk-LHHV9bdaicNuiGVNRl-YOJUQfSgq1qLiOk0ys6x8kcD'),
(220, 'Yash', 'Roy', 'yroy08086@gmail.com', '9006162778', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 06:26:55', 'dclFtVihRX2vPmdnRdQBBl:APA91bE0gTTMlFCZI12NKBk4y1JLKg3nJ4FPhA55hlWK1GpPtCyiuk8G2rYPVHT9Zvyi0UE-EHSCzIaRSzK0DnlVSu_LUggXE-5KI4gbDySE0PRr6Wq3NrNXAXw9NX_091Qpsv8b1vds'),
(221, 'Kishan', 'Kunal', 'kishankunal2@gmail.com', '9570328220', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 06:51:06', 'cFvzVAe9T6euOyohUtm5bR:APA91bHoyK_mnfXnltpR0cJYOOyXWJjuSiM4X4n69nhlq3UwULZMUSiaFKpfIAwBdiecoVoZAV6fMleL6cQvAQSB4kp3jXmGsRWP4iTAGjHcwYLX5IQhbJoHQ9KLpD7k4VZnC05Pl5TZ');
INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`, `gender`, `image`, `status`, `reg_date`, `token`) VALUES
(222, 'Satyajeet', 'Verma', 'satyajeetverma32@gmail.com', '9572995089', 'satya@12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 06:58:01', 'dShPOWj9TQCgxY4CRti8Xw:APA91bHiAgcMtFcJNXeWbjb4mcDvfprw-119XQndkKrYQ3YwxmRfblGsuapjIzmz6N3OIV-eFbTZ4AZiql4DyJDN3N3jsFydsfAf9ephANzBdKp-YSSjeg0FnlZ7V1fvTvMJhcROkdgG'),
(223, 'Devnandini', 'Rakshit ', 'rakshitdevnandini@gmail.com', '7479816551', '1234', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 07:01:09', 'eL5i-xQXSDee898SQewa5V:APA91bHpL23Q2FPklh9pmoIY4cmsYgmWfXgj1uzZ0PgQgcDBrjcYFVI9tt0AiC8Pe8_K66bQwT8KBhI5IOhZ3mmijlLEmu8LTRcO4ZG4Wi4pdIon7Ihk79adVi-sXm9qKhupW9uC81GT'),
(224, 'Silky', 'Yadav', 'silkiyadav3@gmail.com', '9931395153', 'silkyyadav', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 07:01:26', 'eq_c3_xbStaeKUoPFtFRxV:APA91bF1wG_Y7cZBniUiTxpynVISpiZEnzJQLio4R5Nxy6SYjD_SF6xGS1fYYX9QlW1jOohcHVKX4wmbrvjIIWRSmtgSgx-jwe3EvE5WruS8tDaGopJ9F2OAlHLvI9sBw_wTyESDFUJG'),
(225, 'Chandan kumar', 'Singh', 'as8302836@gmail.com', '6204689879', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 07:08:34', 'd-zuLrQcTTeRq9xLEcRGct:APA91bFtFVtei9nz5gZCqhUROWJ_JqNFC5ur6hdouky9t30iFNKjFgsOpWFP0uiVx2fzpF_5WQaJF3bsWV4oxDvDd7hwxvMfe0QcgIQXz9gZcWGsj0N1FkgGqs-bnnui6mUhxpd1ubav'),
(226, 'Anshu', 'Singh', 'dilkhushkumar979849@gmail.com', '8252303442', '12345678', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 07:24:14', 'ckoJK2MZT22-0EtwRE2cB8:APA91bG7IImKYqWzev-F2KudIHZPAaDd8YXrlA9b691ZntFduzHZrRzRt4bHlwt6XKyohWN3IMZq70OQWEJZJsY4uTBWtPmZxnpV-_Fj-8em6IPU-VF3xemqR8OzezPfUWKQQCQDCjsa'),
(227, 'Satyam', 'Yadav', 'satyamk053@gmail.com', '6202778072', 'stym12', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 07:26:32', 'fhlyXng5RYuk_F1ECaizdS:APA91bHTK3IyKWAgZrc-yJ4wtoYGouaYcPNwIuOTkykXqEcDkBeRFIrVYtT9nsu5ftRB8SFXLO3MsWqCHmEiT9LlfpqQEQdku4xCKseGavf89MknZv2lAdb_TdHrw7UZGErBjgsRh8_F'),
(228, 'Neha ', 'Gaurav', 'nehakumai7463868552@gmail.com', '8092417239', '1234567', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 07:37:04', 'cdms0j_6RI6juzAemD3Y_x:APA91bHEffGIafkwdEQZed-EdeDMGntA-vAat6Fm5BrIS9iG0X5logugu9iz1eqhvsy64v6iERd7IVfdAYYxRkXwEVeVQJZMa77VXPh5hvStlc1-lgA03mUnTqwv5ICBZiu7fa5Ov2L0'),
(229, 'Bikesh', 'Singh', 'bikeshranipur2002@gmail.com', '6207257849', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 07:37:10', 'd8GMaLXjQFOSAQtKsNjL-s:APA91bHAcFLRD6MdEB3ob08ygNOk4bT713Eehw_P4DPjJiizx416-Z1arJEWHi_uHmUAbJoS_3HGXTrMCtOmEzNKNnSRVJCoRiz3DAcl_CH2cJWQ2BMgHE503c1aL-8EYxZfDnBDptFr'),
(230, 'Amresh ', 'Kumar ', 'amreshkumar7463@gmail.com', '7463868552', '7320866987', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 07:38:49', 'dy5cn29sQ2m_K0BYsdMIPP:APA91bF0Mw-vhCWTdrJF_wzMdn93ivy65JcuKuWWr92KNquCmg39MYLqsgp_U2WQv_1eRpChHP7U0_paAAeUEXqxogALInU7WmfGa7v6At5cmE0gK5S7H2plQuJX3n7Ve9lTT71NF6gM'),
(231, 'Deepak', 'Kumar', 'golugulsa0@gmail.com', '7992245816', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 08:22:32', 'cNch-GkHST2HLtxu8V9skr:APA91bEEuRS3Yoree8LATU8jZN0J3DgXrl-LNc5QqH5vF_qP-C152KlATzUBKBX2oSOv-FgWBv53RtLhlzicM8jZkO9bUvdWXWCUAMsrHn9f5EFs7mZXMBpUmproid-lHt7tsuUcznzo'),
(232, 'Bina', 'Bharti', 'Bb12@gmail.com', '8271016034', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 08:33:44', 'e7aRMkpFSpud0gVHyLQ2dX:APA91bGmGYd2MpTRv2ZPBxkeNCz7C7cebbJ1iMkOAv4CjygGLDjCj35djUwivMD2nTtQ6y1XGbVm3e4OjGpvQenEZmyDSdtcwARrAHMSrER-JO-M5DwXHUv4rDTcpte3ANuZTQtYTMYd'),
(233, 'Dilip', 'Kumar', 'dileep812004@gmail.com', '8271836847', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 08:49:34', 'cWdXABc5RICfp0Uh7LO31x:APA91bH37njAxkduh-MlW8LXwgirKc6p-IZrVgMCmuJGngx4YSuNmTDEWRqoTYGFpxcMzq7VM0IHu4Atxd47GTghqHuvnORF1itK10pluu3omN1vvx6VmwZpNyLJZ5iX3rWvqiygtmId'),
(234, 'Pankaj', 'Kumar', 'pankajkumarbhagalpur80@gmail.com', '8789676624', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 09:33:01', 'e7uTdJqKTlGwGTtSwnM-RW:APA91bGLI9PyEmwsrRMo4ppU7_QXJGv5I-8BTa0BfQJ9FbouE6fAdJVfUcmFB7Ig-hMLecK7eIB8lNhQapRVlRbiVYuLZrqfcnibCS_hadqPoPYafCCK3ucJ-DmkwfxHH_VQ1uLGZTGz'),
(235, 'Jagish', 'Kumar', 'Jagdish231@gmail.com', '7631758073', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 09:43:00', 'dyb9s4TKSeCSDXOA_IY7em:APA91bGbZdaT9mBdVBEF5IPATCDeQLXapiBxzxJwoX5W3S5WIAyIP-H9UmnFm2brYBMV3AMfTum6U4V57dFkslwpLNyGFIpGZj2QrfLNjRBCdOE6TnLFK3CJ9xhat-qMwxT5kLGtIBqf'),
(236, 'Abhishek', 'Kumar', 'abhishekjaswal461@gmail.com', '9199355861', 'Abhishjaish', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 12:19:01', 'fvFyLvaCSxOt4umvxvmnAx:APA91bE10iPVe1cCHh8owjR_1xElTwJSOpQfC-aA8iqBLFcufeDaXrXTon6BLhn2syJE-grP3DBaKcvfLBvN2z8fbB8TWR4SFhLLk9D9XWMFOS0TLiLMpN56hmhm-3d3lecrDQxI_ElP'),
(237, 'Ashwini', 'Thakur', 'Ashwinithakur223@gmail.com', '9304156286', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 12:48:31', 'dEeuTo_jT2CM-mr-HQGAhz:APA91bGJl5rwhS3AUDgx_fn2kp0sEDDXVv_NvNKAFqbgsQD9vftuYsU7ZU0vTv64GYNln5ag8XjaeYDaMK7FlmfyBhkJHz6NfJzWjpngKxwN491-3YXnSEzWq8mNXs887FvQ7ZUKXN-F'),
(238, 'Govind', 'Kumar', 'priyanshugovind25@gmail.com', '8709889668', 'govind12', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 14:11:02', 'fLO-KzMWSVKy6l98IgCARV:APA91bFSreaGviABEBgbHP3nWzqls66hRfCAvdjxXXY4m0nUGNngS_tlfLFPJaKYK3lVj3uxO25gBpISjPsB3y9Eb6jRy9ftWVt82wdmvaxCM3nMR7Aa765FPPQuKtVjH9l6GVtichWy'),
(239, 'Aditya ', 'Verma ', 'adityaslp86@gmail.com ', '8789498687', '2345678', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 17:17:02', 'd30Xkd-fReu_tW6iRIL38w:APA91bGhVal6iyFoJiDHrSUb_vCEqBSK0kgWHh78AAWXKDC4wqZ2IfLTKRCPQ_FG9_EupBjWp-7jjGXTd6lMyHy3w3Pz7J2_cRXYBZkY27ilqMhl6uMxFWMPU7gnEhTIhljF87arvJ_a'),
(240, 'Annapurna', 'Kumari', 'swtannu946@gmail.com', '7050773249', 'Annapurna@08', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 19:37:25', 'fsdbG8DISPWPSnzaqKbazP:APA91bFYKqWfnn2jO1o1XyBnM2bAjbg6hDF8KXQFYCV1sTJU-jToCD9zYausz9ukckXlQjW2Rmn5TmpZ2lbZBLQOJQrAmvBQTcHbYudEa_r60s0bRqZMeE9H2cRfHdTao4Yg54lIml3I'),
(241, 'Prem ', 'Kumar', 'premibsbgp@gmail.com', '9570567686', 'Premkumar', NULL, 'assets/images/noimage.png', 'y', '2020-12-29 23:49:52', 'e5_9EwEaRha4pQEzPkkbdp:APA91bHXIvIoHb-oMn8RnWIV4HRPaC_HQkHnwN6DhbsAzNLHjjjMXLgPXh8UucfpX9amq88pQJQTBOQEL1_Zq8XRs2rEegbtyU0QOyONgqVJUrVtBShZjQ0sQGDigzJLejytHE_Pjg_B'),
(242, 'Bihari', 'Lal', 'Biharilal01@gmail.com', '6207252614', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 02:42:08', 'cVWVfXyoRvCewT0WKgdjpw:APA91bH_QlALk9yLPeSNJy6kml3zWJbSgTZOTeQ804PuQO2pph_iNK02__2ms-i-YOs7WtpLfb_FaQb0kdQAwCmoUuwhWp_K6XbaK1AEqVRDzhTsp7wx9N76LmTo3HVmNGjFyORDz35Y'),
(243, 'Abhisekh', 'Anand', 'Abhisekhanand6@gmail.com', '8809404372', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 06:27:21', 'ekrbSj5sSfKhGGxRosmtp9:APA91bFP-pT-MvXkR3l6BCqeI1796G43WAW0nR_blgEvaO7Li5F8gT2X8hnOt5B5gazYk0OXW_ngUxHnqAkEb9iik63ZdDiIB--HSNWSgIkHErEctWnQQ2Zq3APRwrVtnaa1Weq5zHWn'),
(244, 'Manish', 'Kumar', 'manishkumar220899@gmail.com', '9504695485', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 06:51:35', 'fySPCIJbTQi2056Ikzn-w8:APA91bF5JzLxdlx4BJjWjrkFrVLVPjCJyiMGA6aiTWNsJJO8UrCbPd-fpOjSrZqkNSjxaqyQHahJVo4nAQOdv1OHO5O6E-UyhZKP5PgShg7KB5CJa6BdKRxdjPwn0ruGKuRX1FI-BdM4'),
(245, 'Manish', 'Kumar', 'Manish12@gmail.com', '8581979558', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 07:04:32', 'flNQqZdtRpa_9PMy3iSLGC:APA91bFF8Z_ROSDw6Jj_CZpyJ-jWCARSs6Vj0-EgL1qeR-YNaoilM706ZK6VFU6n1qZcI5rP_yTGW8FikAK5ZAT8bv4XFEmeEoYehN9lIZoKVYeOwAfAfwNkweq-WL8AU4rCVHyNRHVY'),
(246, 'Sunny', 'Kumar', 'Sunnymandal951@gmail.com ', '9934016900', 'Sunnyamrita', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 07:06:43', 'd8Aw_YorSj2_VH1Ew3o-Ge:APA91bESpr2QsIRDlT1GCU4wsw8qxejALWr-Af2N7Yk38onhobz65YSPYpmdN2fOGNSCvJznovgHNCQrz6MBSg89Ro1C4LhCyliHhONjTlHUpBvCzXlP3Nijs0xHNaFbHAzvozdpiKhO'),
(247, 'Samir', 'Alam', 'samir112alam@gamil.com', '8521720400', 'Samir@123', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 07:17:15', 'eciw6N5KS-SbYL0qGRn3fp:APA91bGlIc12xnu4i_8QlT3ky6cc_ptp3S3FjfJOLePWmH6jcwDOZxOCRBzjj_W7OmDQHK8r88J2dcdLgo9BH1uXEFg5X9_F3j3JSOTzfnB3lOzlyUhvQ5qyZicWSI6ZWAteIlN0SF9Z'),
(248, 'GŪLSHÁÑ', 'YĀDÄV', 'yadavgulshan205@gmail.com', '8102015420', 'gulshan', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 07:27:00', 'dl3GBR3vSL6Xq7fM_jsuoy:APA91bEteOLvTJf8dJ4_FsEPzs4pY_mJ-T7fJ2ONjyyFRsekRU_8UKfkAloAu2MwToNSpzgY9PSByaaEHBottn6trA7ngHu8cES75urq0YpIcieFgSAtKGk9ueo_9LWa_3_dgSG1e8_L'),
(249, 'Harsh', 'Raj', 'Harsh@@gmai.com', '9504978812', 'harsh2002', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 07:45:21', 'fxjEWy-9QF-mUY5s473500:APA91bFwUdnBbMX4NA3ZZbAbub0m7vEyTB7uREeqk7oJxYGbTcoM14pZor4d9wE9P4nzGYsY2qi0gfAU96esJ2R4twaukvVQSXlvlSukSWBNhRvA4ZsFXFMJqOXseMgDC5KZTxzoe8LC'),
(250, 'Harsh', 'Raj', 'Harshbgp97@gmail.com', '8804535260', 'harsh@2020', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 07:49:12', 'fxjEWy-9QF-mUY5s473500:APA91bFwUdnBbMX4NA3ZZbAbub0m7vEyTB7uREeqk7oJxYGbTcoM14pZor4d9wE9P4nzGYsY2qi0gfAU96esJ2R4twaukvVQSXlvlSukSWBNhRvA4ZsFXFMJqOXseMgDC5KZTxzoe8LC'),
(251, 'Prince', 'Kumar', 'pprince4546@gmail.com', '9534323677', '@Purwa4546', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 08:29:43', 'd8ZcwGEnR26PphPh9M6lkh:APA91bFNZotHXIFKVk4uPnldLot7Vw3ZpzpGkEN1wbuUi2sSyM9wNu0Sn0M4Al6oj5s1f_nS13q9tG_lLeSHphtTn_1ifqYB3PMoYNoMf7TS-lf5z0sW-AXiA20FCFiBeZy-CyqPrHuS'),
(252, 'Sadhna ', 'Degi', 'Sadhna devi123@gmail.com', '7389473225', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 08:37:54', 'dWn53zDLQ6WL8MxKQwuX57:APA91bEqUOg23605XOhgNWrpUDjEKqLTwhYUmJ_NwyiDKqVBkkmiWt7twEXmDmTFsMpzipNQqC5rKom4PPA90ghu4JYA_4j1IqRynEruyC00bGZcYyAib0Qf0EiITmRe94tE0TyjV1YR'),
(253, 'Sourabh', 'Kumar', 'shivamkriti5340988@gmail.com', '6202882055', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 09:09:22', 'fzrkZfiVQQ2NXGzsLw7mlo:APA91bHfsIi9nKf8j-FcG0Fv3x-0ju30fGJb5OsUNLe7_zBvPdYSbBTZZsBkslbvlPbOmzIX8-gYKXEYBR7KRAkDg6E4DdlnRe5bEISx-3eG4ChsNl63CenXEDk-TT1fCiF5FqdeJEnb'),
(254, 'Pinku', 'Singh', 'shashishekharjamsi@gmail.com', '8676889581', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 09:12:22', 'dXyAuOoKRPuqEyQXLDGZZq:APA91bHTwCvjMzHz5LIYa_sFWxS5_mX-aWHw_33nNQp0mUlFEEHz5b7uYOj4gahZ438Hst8gimCvMxA_5ud_bKiRlNjMw-18Bp3t__YUsoWdWCjSZT6n0V233FtgdZ8H47AP_qkVDkE_'),
(255, 'RACHIT ', 'Singhania', 'rachitsinghania52@gmail.com', '8902412383', '1234567890', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 13:16:04', 'ft8tAKyMT2-8284ajhDyOi:APA91bEkOJz-ndSI_KGRZKuGADz3NioH7nwWIxSSvPSaaq9YQrMYZeqq4NEpwBuZpwNqOMcYtBDmdSV1FxMHeo38DoosGxYax0TpEvw9JXiL2kmUuyeR5MseIG9ywWFLehh--69JZxgg'),
(256, 'Chandan', 'Kumar', 'chandancae@gmail.com', '7004268783', 'Admin123$', NULL, 'assets/images/noimage.png', 'y', '2020-12-30 13:43:19', 'e-sfOrssStCywgYHTtN1u0:APA91bGcR5kPY6Q6jI3AaLmkbBzbwBWtgnbCFBzJQV_YYOs_lhbBKUuzU66TgKxUOSYzirVWWLno9wZI9HXSSOVlh5Mah97L-SCeXihtykX_TQOB26osXI7DCbZYtddCSacCPsFTb_iy'),
(257, 'Shivani', 'Singh', 'Shivanisingh810285@gmail.com', '8092827773', '12345', NULL, 'assets/images/noimage.png', 'y', '2020-12-31 07:54:37', 'dSV7giNeRjS1dJ4ojXNQGa:APA91bGsKjjbMhj3f-eQJ_adZ79j_0ItqGeaJEdhc4xRTSXrGdZHNB3DsW7_LOLay__2HJwrgOmQ-bnyq64Iz3bisWgmdg4AyVm1Ji1VnBoQUYxX27o1w0lTU44vCo7N2oxTl7pznI0J'),
(258, 'Syed ', 'Sabah', 'sabkuch.sabah87@gmail.com', '7781950619', 'sabby8990', NULL, 'assets/images/noimage.png', 'y', '2021-01-01 06:50:11', 'f5TvVJVARVGqMiPIYvY6nK:APA91bEZYcTLBDp4vvBwBvf6TjQ7vWho6GAuC2vpuAWkpyrF0f7lKqMICnBOmGA4dy2ou2bKp7e4HQ4AjoyQbVxv4-6e7n9tgkwpWJc5DKXk7Fqa7iE46N4_iDVtW9lL4serh-tzG3Vw'),
(259, 'MANISH', 'RANJAN', 'manishranjan413@gmail.com', '8789552297', 'monu1987', NULL, 'assets/images/noimage.png', 'y', '2021-01-01 12:40:23', 'dX--xHo6TGi7He9gsTDUHQ:APA91bHp0zpXtGbmt_KwW2fywPCQMmqol4KyJlxlNrUWCeb4igNVQnmd1oMsU7SE4kcX2JP2tjJ2C0zjKxpznHhwcVzGrSyUBpEoC7GCYIaHHRVz_1JVIe9utwJsPmLcx2T8fA137z49'),
(260, 'amalendu', 'aman', 'amalenduaman@gmail.com', '7321058791', 'AbFc@#234Gh', NULL, 'assets/images/noimage.png', 'y', '2021-01-01 15:03:52', 'dsCEk5HWSr21tcnwqNZ6OR:APA91bGv_l5bsaAHQVWgqJGN9kEiaRbKRWbAaormDCECuzL6Wm5o_h-k-u86uAY17pK1qIncGpwvgbzi8jLXIKcMN3sHfZm6MFIytnVowIb3y7yrpKuveUV-jM_xO5qwdNEsx-AWTYS-'),
(261, 'Nibhash', 'Jha', 'Nibhash.k99@gmail.com', '9939036069', '9939036069', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 03:42:53', 'eFT7y94iRrW7yB42wAAbj7:APA91bECTk1r8_QL5ioY4GWMYAzmdaOAObOirjXi1exA6zW2foklct3Zds5zUjY5zHEJXEHs3YdfzoqmruKBdx9jqBSy-Lvc0RWwoYJuY0-YvNWQFpxcUc8Bo7naneWxO6eGjH6XIFzr'),
(262, 'Kunal', 'Sha', 'Sahkunal@gmail.com', '9570089504', '12345', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 06:23:42', 'f04O6dQwQS-bPepk6mIxgD:APA91bE7KtybapStCKnnXOYFHQwOV9lUCksqf53hApW0Gkc5P9dSUKhviVGd2m2YjyZ8aJHz09WG08E3Xb4ucBTTDoy055uww5WI5TgNGQs5JExsJPDpXhj55mP2iodTshyTyRUY5hgk'),
(263, 'Rajeev ', 'Jha', 'Rajeevjha@gmail.com', '8434128012', '123', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 06:42:16', 'dA5XAST-SiqpCX-A-YvPBg:APA91bF_MCXD_sz6XOnr-K5tsB0pT7wrOklnqFjEHLMqkSB0fT5DkIV9VS8-YrlM3tyZbBKIbz6SvmCqO8JrtK7qAQxb0DYg-w2UbRSOAQWoXRKbZhwlhg2HQnNbP9lBhyD2w7RtaxgC'),
(264, 'Ravi', 'Sharma', 'ravikumarsharma8541@gmail.com', '8797062187', '123', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 06:49:06', 'eeyi4u39R9SHBCd4ChnkUG:APA91bHbREafNeaxsmrl0RGkGNjNUq8H67LeWeymMByBu3JEwft6mveml6JbfAC0oJS6tryd97yX-t9xoQLZy7zI8o2rB_Oo6C4skCpQPgJPlxjenQScNo9KHDh1vGMy4YpbJnJECHxm'),
(265, 'Niraj', 'Kumar', '8709076az@gmail.com', '7549498032', '123', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 07:05:25', 'dw8_tJavSriXTEuvOirnZ6:APA91bFvW1NxdPfH6878ihpLlkZ8_kecVxRNrNgbkeBrfFtGnW8ox0jHKtGi0bxm6xurv9dATrmp4JhLkQBS6Y23fczGpsPusL2akAAnInnfd95weZ8ou42DF46qZnR17jt5-jS2SYm8'),
(266, 'Prem', 'Kumar', 'premkumaranand05bgp@gmail.com', '9939877256', '123', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 07:14:00', 'dqt-uLyaQe6SjFHIIvNgGC:APA91bEe_NLaXa5AAL5NUnndNzA4ctRUFHaIexRrhnOdps8PlOBJrgXKdPWBY-ba7Xy1ECJ6SbRWvsl8y-TqrBGF3ZjjUNkfKHkvmrVxATlUyhESRJcTR992qzN8c6SBUHTutNT1uSTh'),
(267, 'Md.', 'Aman', 'Mda10957 @gmail.Com', '8409847446', '123', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 07:34:03', 'f3uFpGwkReGZ9SmX6jITon:APA91bF0ZSx87ONXTq5rF053p1LMMn5WuewkZ9usynF8Ph_Afx-FAJzs14mLXdWh2Cx2pYrdo_3dB-54JGiuqBEWI8vNZvXL6UEmUGPlVe4E0xyc-3UD1oYzr512AP7pYuqeSVW7XXDw'),
(268, 'Md', 'Furkan', 'mdfurkan99345@gmail.com', '6299779461', '123', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 07:41:45', 'c1B0FcwOTxGrTyqL9t44eq:APA91bGk0soX0gXkrUZySh8Xzl16osSLZKmodpaXTc7gfS4fxkhMC15c-dh4mUA1CPFd_7HgcF4_c1YhwBOoUzTUO_az635WLFmqGCuqph18a9FcRHWqbwrxnOCBtsQBd1vA41Zinyu8'),
(269, 'Binod ', 'Thakur ', 'binodkumarsvpsl98@gmail.com', '7479580024', '8888', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 07:53:36', 'fi6Z07jlQrycF7aRrRvBFi:APA91bFAahKnkls3nUTeKVAg6Sz2-4_ONaXgzbY8qATx8EWcZjSEfy-YPRBWXKZKHxXlG6Ir3KRk8ui5-p_iGXZDg3fKNGMtXY4ZseWzIHkqkm2MWVJHYLf05IRJJ0b7OQIK7ab2ibls'),
(270, 'Amber', 'Alam', 'amberaam@gmail.com', '9113383646', '123', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 09:37:20', 'cBOoMsziRRukfbscQDFdoK:APA91bEaG9tOOkB09V_mwVonSa4qb_EEO_JXNTfhFTt-fv21Y1UusRWZ8R5_LiFDhXA16XlKIq5uKpQGAfP9w0yAJMyShhtnJ_v_fNDDOWh8hmDoSU_JSML5PxHwCHMWlZEAGnTdxHy-'),
(271, 'Binit', 'Kumar', 'Binit123@gmail.com', '9661266598', '123', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 10:02:14', 'eir0LHBTQle-0HtvxAipYV:APA91bGlAicZFgAb0U7WYhjpMSNpnYJ7TBfx3IBYORSIV27QQDALiFESblOChM7nTGUt53q2vnyUdbwVh_e_NA9Bcp9STr_dWguMWYoEJQuimzS4VwIhCQkAbCT1oJqQAEebLqAgG7k5'),
(272, 'Rajesh', 'Sahu', 'monasahu2316@gmail.com', '9431204656', 'shloksanath', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 10:05:33', 'dIdfzkpvSu63i1vmit0HqN:APA91bEO93Pnf-kIDRkm9VhZnT5UZfa0WpkilO1jSAiRtmQD_X3xQYwq7PTTVJ7qUmeKjG0eH0pp3Mid_B135nOq_faMrFL8lSb7SeuPy9CdqA16bmj_U9SV9MJUHjRTGtT56bklvTBQ'),
(273, 'Shubham', 'Kumar', 'likkhashubham2002@gmail.com', '9162815168', 'sk@9162815168', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 12:01:54', 'eoeR5iXVSDeZjTyDcyMMLu:APA91bH9bKRCzZd2n96goZBnLv5hjFkTvIwr4Ew5foyGHPmqHerhagJNV_OASyRB2UihHtuMEoLJbAPclAEQR_4KqfTfIIjrxecZJpYIzKsLBdmzgXZzwC20H_5HJgTxQayhSdO4ySka'),
(274, 'Rohan', 'Yadav', 'Rohankapri67@gmail.com ', '8002193731', '7890', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 12:53:34', 'da_o-ItISzmFaSmn_pw36p:APA91bHE0mSYD2QnGoHiMuEkhDzixqnzc8VCqCJCwmAk1XkYxTU2YGGqF24AQfpg0UZwCDd3ICoz5nQfInORMHcLWGQIZNeg-y75EHY2-KOjTDX_Kg0ghxvUOwoe1CcwuRmJPxR7Fw3O'),
(275, 'Santosh', 'Singh', 'santoshkumar.sntsingh@gmail.com', '9534268822', 'icici@125', NULL, 'assets/images/noimage.png', 'y', '2021-01-02 14:23:44', 'eZu8xDBjRbKzk1_ZOrKK7a:APA91bE7x-81z0mzw-coOmEyd4C8qctx1wv91r5Tx_BKCVczi0S-OUsBlKs8xpqlXQPIIdCXxXHUR3633fsQsIvRTy1PvMVHBX-WUkSkOsGfczjQDfY4TVwKzLyHL5OBVzrsQ-5_P2vZ'),
(276, 'Raju', 'Kumar', 'rajukumar110195@gmail.com', '7488596045', '123', NULL, 'assets/images/noimage.png', 'y', '2021-01-03 07:34:56', 'fZlzZb_yS6uZqNVd5D54as:APA91bFK_W9P7X6S2V42mMoGd19FvWUmIZeKfsIh_k3xTVswUe8VSFj_9BMG0DGfKEzHq-L7XE15_APNg4b6aV3F5LoY1vS1SRrDk8sXvhl7cgZIMoS0O23XvpS_sdyH9l70QzvOzPHP'),
(277, 'Shubhalakshmi ', 'Mahata ', 'Shubhamahata.bts@gmail.com ', '7004733838', 'pass4sm@krishi', NULL, 'assets/images/noimage.png', 'y', '2021-01-03 09:15:07', 'csoRK65bQH21Zts4VrXOC-:APA91bEZJyLbQw4WgU2UZSe4maHIAR-SWeJK9zy8rPKsntQCH44H07bgFOpQYASpzA7tLDZsO-fYOMecqbzI9wlseZwo1rZ-sBljej6xErzlET3Q0dacbQweJ652NWfy4YfbMHw5lQPM'),
(280, 'Ankit', 'Raj', 'ankitraj729600@gmail.com', '7296002041', '887762', NULL, 'assets/images/noimage.png', 'y', '2021-01-03 15:23:25', 'ev7TGP_uT2q6VYNfLwOuJV:APA91bFticdL2jzeOqcR7Iv43QgUWIAdero9Dn4bQQMQohj5ZzfH1eA3klSsz1ZcI7ufnuaO2nOUYkCE_KjJzddnLz06nH7QdaKEj8yetW8SorDi4R2IBoj8aUG2DaApLeIL_iMUcC08'),
(281, 'Shubham', 'Sagar', 'richsagarrr@gmail.com', '8709713719', 'kyahua', NULL, 'assets/images/noimage.png', 'y', '2021-01-05 05:36:14', 'eYAPoTlaQK-DiZwSnXtmqn:APA91bGqzChYPu__60gZHx8KHmKKrmG34ePLc1m1fmH6YukIFstSZXbAw9vBBrbpHUT3tk2xIEdSGhI9jThTqQTxb_4MsC01z-ZNK2UDGgWdiSlqDuMxGr0FmZOMuRWUcgJY2uvBITZb'),
(284, 'Brajkishor', 'Kumar', 'brajkishorjun2001@gmail.com', '7061626728', '7061626728', NULL, 'assets/images/noimage.png', 'y', '2021-01-06 09:38:18', 'chrAJHjIQoCvLFxthp5FZJ:APA91bHFkw-h_wcCgZRMGRgj64N5jv5j3shm6RRnTltjMx77hBsATtlDnxwV5bmyfRPRuaAFPGTWuhbR86pRO6wxgsjo8HFlM25tAbuXd1GTBFwKhN04F4_-ildYWV6wInrQ6p1Km0Hl'),
(285, 'Saurabh ', 'Suman', 'sumansaurav721@gmail.com ', '7903004585', 'Ss812002', NULL, 'assets/images/noimage.png', 'y', '2021-01-06 13:15:27', 'eglgB44KT9Ss8QQoVj1nNs:APA91bGatYPf3awBACZbbi-UdOMJ5gxCeOchAViR63b_avqZRisUMWf61DWhCE83V5Ii5LTyQRaPAXofKyFheKrc8cupaQUFoFdoKfygLbwT9Y56MJLSK5iz2smt3kdNHZ-c5wLRxJbI'),
(286, 'Neeta', 'Singh', 'neetasinghbgp88@gmail.com', '9931854388', 'neetasunil1968', NULL, 'assets/images/noimage.png', 'y', '2021-01-06 13:33:00', 'cGPJF6O5SpSmgJ8HCSD1Tw:APA91bFOptxjChA3quLv8rmRctF3mbhWsMnHajQ9woXV74LDuvFkOzcE8yTLORYWj9s6MIPWUgxoyikIvFnbTSgceLOdzFToWsiUjOe_49MbKB4izMMm-Gs8G90mDiSF8w0WB5J6FdiX'),
(287, 'Ambuj ', 'Kumar', 'Ambuj24dec@gmail.com', '8936047624', 'Rohankashyap', NULL, 'assets/images/noimage.png', 'y', '2021-01-08 09:19:59', 'cRKYPrnbRDKR4NNVirnyN1:APA91bHQi0xw2p1dp9yb9BcMONiHMw5GHpjY2BPnZ1Sv6YjC9a-2BIz-4O_kQ8ujbRxAyHe4U3DilZzl48x2oqnHaaw0GVIjnSvacEQ8nIjYnvE6FeCblhU_A_v4I9dMctj-S6p1MO4R'),
(288, 'Divyam', 'Pathak', 'divyampathak00@gmail.com', '7461936653', 'divyam', NULL, 'assets/images/noimage.png', 'y', '2021-01-08 11:56:15', 'eVddWiOdQ1aX7C1tvkY49w:APA91bHl7dfQaSbPbpSQEoPKzSa-TkxeGib-7vzPON5eW96PjpYYlPAsqTu71HArJdaQcf_MsdAZA_y59-12gUe1DHOMQWzQaN4sLn2dzIdbNvIKVkA2iTzN17dYOAhbF_NqLMgwQT1u'),
(289, 'Kunal ', 'Kumar ', 'Kunalkunukunal133@gmail.com ', '8651824752', 'kunu7464', NULL, 'assets/images/noimage.png', 'y', '2021-01-09 04:07:07', 'c8pRIlalQjCrijSUgoN3Wr:APA91bEh8PZW2OlHBnuNbEImgU9nEsB1q4x81CI9IyiOmGLp0yP7Hji52E208IFzCLpKNLbdC3j_Iwv2K9eaBDrD5rH41iYxk8opJIAi7emJ0GgWdgaxEwAXMHMHUR5oSSl4whwbFE9d'),
(290, 'Rana', 'Singh', 'singhranarajput1996@gmail.com', '9135961733', 'rana123456', NULL, 'assets/images/noimage.png', 'y', '2021-01-09 04:57:03', 'cwsKdN1yS-WmiL4n9OQ55C:APA91bFzhA9zc-43eUDpFs45HdzHGbBLRQpz-U7ZOb7uocm0R6APwSG8NSwImJlqu_W4PIZJYQ2JSyzkdd5yIZJvXhnrB_MbsE08Uz0EjzghiW9-iyCpZyuNeRkecqyQ4HAU7LJbMXOw'),
(291, 'Shweta', 'Mishra', '2015honeymishra@gmail.com', '9123200243', 'Shweta', NULL, 'assets/images/noimage.png', 'y', '2021-01-09 14:12:39', 'fJkp-8e6T_KuechP1x-rt2:APA91bFlsTzLlLgolvcPHY_q4MiAfGcK_7GncsmtgnATmzrV6M8SghGpCGW34LnKzO4KY71VVlHIFHkB83xkMGqyg-yv0QnSbH3yquq-UJXFBMof2Ck-zLFfsDZgSiUwsPwQ75gKxNOE'),
(292, 'Medha', 'Kumari', 'medhakumari98@gmail.com', '8431125866', 'medha11_', NULL, 'assets/images/noimage.png', 'y', '2021-01-10 00:57:13', 'dkFbG5-hR-eaHl5azYp5m1:APA91bEaJrKBW_nH4jDxCZeUx7yIkyeIysippi_KcSh2kmm4Dlv1UIVbH2Rgpfa_an1JN-qw5cmxqjNaFsZk3LMWuvfHJti1XTIV79_Y2HO_bN7NQA_1_55r0hxxi47AfJyQmeKh29UJ'),
(293, 'Test', 'Test', 'Abc@gmail.com', '1245484848', '123456', NULL, 'assets/images/noimage.png', 'y', '2021-01-10 05:08:12', 'cOPJLwZnQuqHyskcl2_vuB:APA91bGfs5E-53RKmwNK_430Ww5FqGWS6XM5Sspg28GQDP1vR6ciSSt17AamDinMOH4nSY4jhlek9lvFX2OSZWmNDL9YBDOO9TCWqvcDStXV2UtGjW5nNzZ6lp0q0jOKalc9TX68s1ZX'),
(294, 'Testing', 'Testing', 'Testing@gmail.com ', '2134848484', '123456', NULL, 'assets/images/noimage.png', 'y', '2021-01-10 05:09:31', 'cOPJLwZnQuqHyskcl2_vuB:APA91bGfs5E-53RKmwNK_430Ww5FqGWS6XM5Sspg28GQDP1vR6ciSSt17AamDinMOH4nSY4jhlek9lvFX2OSZWmNDL9YBDOO9TCWqvcDStXV2UtGjW5nNzZ6lp0q0jOKalc9TX68s1ZX'),
(295, 'Ganesh Kumar', 'Choudhary', 'raj185799@gmail.com', '6206941511', 'get12344', NULL, 'assets/images/noimage.png', 'y', '2021-01-10 09:47:20', 'e_pkozSUSJCUWAoT27y4Qz:APA91bFD0RS6U2hOkF7cfyX8N25TTRytzoKTTuNkDYN9HwpcNYbX9J8batN0q5NAUcSVoMDioHNL-e8W73wZgZpjZKOV1MfMOdZFaIJ0PKzKiFxPVyagPXTatLBEUJzLTX7bxVaiwkjk'),
(296, 'Hdp', 'Hdp', 'hdp@gmail.com', '8888888888', '111111', NULL, 'assets/images/noimage.png', 'y', '2021-01-12 06:59:43', 'eMT2BgaTSvyDQy0FNzomoz:APA91bGHlrpqr6xszbve8448mLLmRvaXbRjlVrYeb2Lytzd1dDgfdzladyYWsS4eRo5ZGzXRHQXdKcjD6tWBgV-Q6bBuUy8OC5dXNBpDh3n4Psp27CIxC6a1SIUjdOquM6en16JFFiB3'),
(297, 'nitesh ', 'singh', 'linksysdeepak@gmail.com', '9898989898', 'deepak', NULL, 'assets/images/noimage.png', 'y', '2021-01-13 07:04:20', 'd5miSsTmTm2BegIi7ay8_T:APA91bHktSybXEmImLpwEsCZvPXXAXKhdgKA1fnO7zDmrlxCr1ckvY0qRh6QUeIHxjVEw7GjmvEylnADGZ5AakeFA_ZENhTle2ROIVbLPPZSPElNyI5hN6tbPt-tMVKJ177dP-gEUQ0p'),
(298, 'Abhishek', 'Patel', 'patelabhishek102001@gmail.com', '7600175674', 'Abhi@8480', NULL, 'assets/images/noimage.png', 'y', '2021-01-13 07:39:22', 'elDoxcrfR7SwR8-TDnOCLD:APA91bHnsNTEFZSaF3qA2DeZoGgGHIkI8qi5Z9uEN1nHnEEDguXxhor9KPatWHLvpzSUNE18Kx51luxFJrueMT_Ke6BEboZL577XALLmWH7ra2nSwwG5DEcS2SfjJENLzLwvTBVkZlct'),
(299, 'Mritunjay ', 'Kumar', 'mritunjaya.kumar@yahoo.com', '7004615852', 'Jdfc@2019', NULL, 'assets/images/noimage.png', 'y', '2021-01-13 15:36:17', 'fLPdtdrvRpaV1dZvnpd7B_:APA91bEQSIVZPQqXfPaL7MNdme0JzYKrtDFcSDCpWAejlFccyoAPYtt88VZr1G_EGub2fUJPImXcs0XwjJS0zJTdAkHPNWPdaOoJunpL_1xYJl1NxdSaDnVXL0XBMT7yMD91JHBJNdjF'),
(300, 'Nitesh ', 'Singh ', 'A@g.com', '6352256974', 'Abc007', NULL, 'assets/images/noimage.png', 'y', '2021-01-16 05:01:55', 'e-WXbxQ6RSO6LuRvBahsXq:APA91bEn1fPdfjegz743prqlgZznXpTWwyLBbEyGWLcGJcoB_ZQZQLNRm3sM1yv83gNjW-fBSa2P7KEnBqdXKw55tjCKb-naIntVGo5TkmvvP1VHKlCLJkb441WfFKrBdCGx3uhccWqw');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`id`, `customer_id`, `name`, `email`, `mobile`, `address1`, `address2`, `landmark`, `area`, `pincode`, `state`, `city`, `type`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(1, '7', 'test', 'abc@gmail.com', '8888888888', 'asdadad', 'sdadasd', 'dfdfsfs', 'adasd', '645666', 'gujarat', 'surat', 'home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(2, '7', 'test', 'abc@gmail.com', '123456789', 'abc', 'xyz', 'uvz', 'home', '123', 'state', 'surat', 'home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(3, '3', 'Admin', 'admin@gmail.com', '9635801470', 'B - 30, Apeksha nagar', 'B - 30, Apeksha nagar', 'Kailash chokadi', 'Pandesara', '394221', 'Gujarat', 'Surat', 'home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(18, '34', 'Sourab Tiwary', NULL, '7970696383', 'Mirjanhat', '', 'Tower chowck', 'Warsaliganj', '812005', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(24, '29', 'Pankaj Patel', NULL, '8487953552', 'hjgjhg kjhjhgjhs khjhkhk', 'address kjhsdkfjh khkjhkjhkj', 'near tank khskhkjshsf', 'juhu', '234424', 'gujarat', 'surat', 'home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(25, '35', 'Testing Testing', NULL, '1234567888', 'Aaaa', 'Aaaa', 'Aaaa', 'Aaaa', '252151', 'Aaaa', 'Aaaa', 'Aaaa', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(26, '35', 'Testing Testing', NULL, '1234567888', 'Aaaa', 'Aaaa', 'Aaaa', 'Aaaa', '252151', 'Aaaa', 'Aaaa', 'Aaaa', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(27, '36', 'jony patel', NULL, '9675675756', '123', 'rty', '432', 'tyh', '432567', 'gujarat', 'rtf', 'home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(28, '37', 'mans sing', NULL, '6757777557', 'tt', 'tt', 'tt', 'tt', '444444', 'yy', 'yy', 'tt', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(29, '37', 'mans sing', NULL, '6757777557', 'tt', 'tt', 'tt', 'tt', '444444', 'yy', 'yy', 'tt', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(30, '35', 'Testing Testing', NULL, '1234567888', 'Aaaa', 'Aaaa', 'Aaaa', 'Aaaa', '252151', 'Aaaa', 'Aaaa', 'Aaaaaa', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(31, '34', 'Sourab Tiwary', NULL, '7970696383', 'Mirjanhat', 'Kamalnagar', 'Tower chowck', 'Warsaliganj', '812005', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(32, '3', 'Gaurav Maurya', 'gaurav@gmail.com', '8758431417', '208, Siddhivinayak Platinum', '208, Siddhivinayak Platinum', 'Pandesara', 'Pandesara', '394221', 'Gujarat', 'Surat', 'office', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(33, '39', 'Testing  Testing ', NULL, '1234567899', 'Testing', 'Testing 2', 'Jdjs', 'Hshsj', '646494', 'Hshajaka', 'Hsjsjs', 'Hshsj', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(34, '39', 'Testing  Testing ', NULL, '1234567899', 'Testing', 'Testing 2', 'Jdjs', 'Hshsj', '646494', 'Hshajaka', 'Hsjsjs', 'Hshsj', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(35, '39', 'Testing  Testing ', NULL, '1234567899', 'Testing', 'Testing 2', 'Jdjs', 'Hshsj', '646494', 'Hshajaka', 'Hsjsjs', 'Hshsj', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(36, '45', 'Pankaj Kumar', NULL, '8235324198', 'Modinagar', 'Hashangang', 'Saimandari', 'Mirjanhat', '812005', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(37, '45', 'Pankaj Kumar', NULL, '8235324198', 'Modinagar', 'Hashangang', 'Saimandari', 'Mirjanhat', '812005', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(38, '29', 'Pankaj Patel', NULL, '8487953552', '503, amresh colony', 'jua pura', 'near mandir', 'paldi', '353333', 'Gujarat', 'Surat', 'home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(39, '29', 'Pankaj Patel', NULL, '8487953552', '604,john canedy apt', 'palmous', 'monginis', 'near temple', '987979', 'Maharatra', 'pune', 'Office', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(40, '48', 'Test Test', NULL, '1234567823', 'Test', 'Test', 'Test', 'Test', '394210', 'Hahaa', 'Ahahau', 'Hone', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(41, '51', 'Gabbar  Singh', NULL, '7698256790', 'Bhdns', 'Hdhjsj', 'Hdhh', 'Bfbd', '516497', 'Gshs', 'Demi', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(42, '51', 'Gabbar  Singh', NULL, '7698256790', 'Ushsb', 'Hshhsb', 'Dhbsbs', 'Bsbsb', '979484', 'Gzzgh', 'Hshba', 'H', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(44, '57', 'Abhishek Singh', NULL, '8102859795', 'Jamsi', 'Lodipur', 'Abhishek fuel centre', 'Macchipur', '813210', 'Bihar', 'Bhagalpur', 'Jamsi', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(45, '31', 'Deepak Prajapati', NULL, '7878868606', '283', 'pandesara', 'temple', 'pandesara', '394221', 'Gujarat', 'Surat', 'home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(46, '72', 'Pranat Mishra', NULL, '9019607875', 'Manikpur', 'Mirjanhat', 'Shivalaya', 'Mirjanhat', '812005', 'Bihar', 'Bhagalpur ', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(47, '73', 'Sourab Kumar', NULL, '6205195091', 'Bikhanpir', 'Oppt blind school', 'Blind school', 'Bikhanpur', '812001', 'Bihar', 'Bhagalpur', 'Office', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(48, '74', 'ankit rana', NULL, '8271230391', 'gita bhawan', 'janki pd. lane,mundichak', 'big wall with tree', 'mundichak', '812002', 'bihar', 'bhagalpur', 'home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(49, '46', 'Nikky Jha', NULL, '8826217394', 'Naya Tola Dudhella', 'Nathnagar Bhagalpur', 'Opposite Little Flower National Public School', 'Nathnagar', '812004', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(50, '77', 'Rakesh kumar  Pandey', NULL, '8709282804', 'Adarsh nagar colony', 'Laluchak bhatta ,bhikhanpur', 'Sahid ratan kumar thakur street', 'Bhagalpur', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(51, '79', 'Rohit Kumar', NULL, '6299737140', 'Admam pur Baghalpur rani chandrawati hata ', 'Adam pur Baghalpur rani chandrawati hata', 'Adampur ', 'Adampur', '812001', 'Bihar', 'Baghalpur', 'Adampur', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(52, '84', 'Niraj Kumar', NULL, '8709868017', 'Adampurghat', 'SS Banerjee road', 'Kaligatilane', 'Adamput', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(53, '85', 'Gajadhar Sharma', NULL, '7260877420', 'kamhkya nagar colony', 'Astha lifestyle coty', 'near glocal hospital', 'bypass road', '812001', 'Bihar', 'Bhagalpur', 'home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(54, '86', 'Abhinav  Singh', NULL, '9113784802', 'Naya bazar', 'Bhagalpur', 'Dulari bhawan,', 'Bhagalpur', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(55, '76', 'Riya Singh', NULL, '9304352485', 'Shardha girls hostel', '', 'sm college road', 'Chhoti khanjarpur', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(56, '88', 'Shailesh Sinha', NULL, '8709169387', 'Jogsar Gwaltoli', 'J p pandey lane', 'Near Gita printing press', 'Jogsar Gwaltoli', '812001', 'Bihar', 'Bgagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(57, '54', 'Gaurav Kumar', NULL, '9523775883', 'Tilkamanjhi', 'Adampur', 'Dr Nk yadav hospital', 'Tilkamanjhi', '812001', 'Bihar', 'Bhagalpur', 'Nk jadav tilkamanjhi', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(58, '90', 'Rohit Kumar', NULL, '9931213820', 'आदमपुर', 'कोयला घाट', 'फरिश लेन', 'Hanumaan मंदिर', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(59, '93', 'Swati  Garg', NULL, '6299995037', 'S.M. College Road', 'Opi loj ', 'Oxford गैलरी , सक्सेस सेंटर गली', 'Opi log', '812001', 'Bihar', 'Bhagalpur', 'गर्ल्स हॉस्टल', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(60, '97', 'ANJANI KUMAR MISHRA', NULL, '9470070487', 'HOUSE NO -- BC/40/99', 'GIRJA MUKTESHWAR COLONY', 'MAYAGANJ HOSPITAL ROAD', 'BHAGALPUR', '812001', 'BIHAR', 'BHAGALPUR', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(61, '109', 'Md Naquie Alam', NULL, '9934603788', 'Vill- khiribandh ', '', 'Mukheriya road near Vodafone tower', 'Near saint Teresa school Bhagalpur', '812005', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(62, '117', 'Dharmendra Kumar', NULL, '8804557716', 'Parbatti nopani school ', 'Hindustan press parbatti', 'Nopani school', 'Parbatti', '812002', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(63, '105', 'Manish Kumar', NULL, '9776758915', 'Noorpur', '', 'Chaiti durga sthan', 'Nathnagar', '812006', 'Bihar', 'Bhagalpur', 'Nathnagar', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(64, '121', 'Rajesh Narayan Agrawal', NULL, '8789658806', 'R.N.Agrawal,Rameshwer Niwas.', '', 'Behind Daffodils School.', 'Chunihari Tola', '812002', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(65, '123', 'Rudra Raj', NULL, '6205062540', 'Lalkhan', 'Near dvc grid sabour', 'Dvc grid sabour', 'Mansarpur ke bagal me', '813210', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(66, '124', 'Sonu Kumar', NULL, '6207932052', 'Gangadarshan Apartment', 'Chankyavihar colony', 'Zeromile', 'Barari', '812003', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(67, '125', 'Nikhil Kumar', NULL, '6203669455', 'Jagdamba tower', 'Chankyavihar', 'Zeromile', 'Gali no. 6', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(68, '128', 'Hariom Kumar', NULL, '8092271061', 'Patal Babu Road', 'Ajanta cinema', 'ICICI Bank', 'Bhagalpur', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(69, '129', 'Pragalv Harsh', NULL, '8594558011', 'Dr. Amrendra Kumar', 'Anandi Lal Mishra Lane', 'Mishra tola', 'Mishra Tola', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(70, '132', 'Balraj  Jha', NULL, '9933438951', 'Naya tola dudhaila ', 'Nathnagar ', 'Opposite to little flower school ', 'Nathnagar ', '812004', 'Bihar ', 'Bhagalpur ', 'Home ', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(71, '127', 'Sanjay Rana', NULL, '8825119774', '2F ann tower bhikhanpur bhagalpur', '', 'Chavla restaurant', 'Bhikhanpur', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(72, '135', 'Ravi Kumar', NULL, '7982067030', 'Chapanagar ', 'Bisarhi asthan ', 'Hanuman mandir ', 'Kumartoli lane', '812004', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(73, '120', 'Bittu Choudhary', NULL, '7260899302', 'Mundichak ', '', 'Relex gali', 'Na', '812001', 'Bihar', 'Bhagalpur', 'Na', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(74, '136', 'Niranjan Kumar', NULL, '8340124303', 'Shayan sundar school,near Head Post office,Mg road, Gaytri complex, Bhagalpur', '', 'Shayan sundar school', 'Mg road', '812002', 'Bihar', 'Bhagalpur', 'Gaytri complex', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(75, '137', 'Deepak Kumar', NULL, '9771622800', ' RC 22 sector 3 Housing board colony', 'Behind barari high school', 'Barari high school', 'Sector 3', '812003', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(76, '138', 'city hospital', NULL, '8271442162', 'city hospital', 'city hospital', 'aadampur', 'adampur', '812001', 'bihar', 'bhagalpur', 'office', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(77, '139', 'Nitil City hospital', NULL, '8051433444', 'City hospital ', '', 'City hospital', 'Main post office', '812001', 'Bihar', 'Bhagalpur', 'Office ', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(78, '140', 'Gautam Kumar', NULL, '8969837650', 'City Hospital ', '', 'Near metro mirchi hotel', 'Adampur ', '812001', 'Bihar ', 'Bhagalpur ', 'Office ', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(79, '142', 'Abhilesh kumar  Singh', NULL, '7004493776', 'Shiv bhawan colony', 'Anand bhawan', 'Anand bhawan', 'Kachahri chouck', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(80, '143', 'Rahul Pandey', NULL, '7011303977', 'Indu mohan smriti', 'Adbhut hanuman mandir', 'Ishakchak, petrol pump', 'RBSSS Sahay road', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(81, '144', 'Binod Ji', NULL, '7258815444', 'S k appartment, flt no 407', 'Opposite post office', 'Main postoffice', 'Bikhanpur', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(82, '152', 'Rajiv  Kumar', NULL, '7970466740', '401A, 3rd floor, Sheela Regency, Shaheed Bhagat Singh Lane,', 'Tilkamanjhi', 'Near Sheela Regency', 'Tilkamanjhi', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(83, '68', 'Kailash Sah', NULL, '8862974920', 'At gurhatta chowk', '', 'East gurhatta road', 'Post- Mirjanhat', '812005', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(84, '159', 'Kumar  Aditya ', NULL, '7209708205', 'Assray house ', 'Building no Bc-013-0355 ', 'Near ts gurukul ', 'Gc Banerjee road ', '812001', 'Bihar ', 'Bhagalpur ', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(85, '122', 'Bittu Jha', NULL, '8409224268', 'Bhagalpur', 'Bihar ', ' kamla mandir ', 'Bhuranath', '812001', 'Bihar', 'Bhagalpur ', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(86, '164', 'Kunal Kumar', NULL, '8540898639', 'Flat 605', 'Aashiyana Veena Complex', 'Chanakya Vihar Colony', 'Zeromile ', '812003', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(87, '139', 'Nitil City hospital', NULL, '8051433444', 'NITIL SINGH', 'C/O GAURAV SINGH', 'NEAR SURYA DIAG', 'MASAKCHAK', '812001', 'BIHAR', 'BHAGALPUR', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(88, '166', 'Bunty Walia', NULL, '7979980368', 'suchit chandra singh', 'Khankitta', 'Sabour near block chowk', 'Sabour', '813210', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(89, '167', 'Manju Bala', NULL, '7005664623', 'Flat no.- 204, Braj Tara Apt., SK TARAFDAR RD., LICHI BAGAN, Near UCO BANK, Bhagalpur', '', 'LICHI BAGAN ', 'SK TARAFDAR Road', '812001', 'Bhagalpur', 'Bihar', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(90, '170', 'Srishti Singh', NULL, '6206453087', 'RM hostel,chhoti khanjarpur', 'Tukul babu campus, chhoti khanjarpur bhagalpur', 'Dr. Dipti singha clinic, SM college road ', 'Manali chowk', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(91, '175', 'Rajiv Jha', NULL, '7667274473', 'Aashiyana veena complex,flat no.206,chanakya vihar colony ,barari ,bhagalpur', '', 'Near mangalam hospital', 'Chanakya vihar colony', '812003', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(92, '180', 'Gautam Giri', NULL, '9122979595', 'Anandnagar', 'Sabour', 'Near EG LIFE office', 'Sabour', '813210', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(93, '183', 'MAYANK  SHARMA', NULL, '9523693155', 'Behind road of womens iti bhagalpur', '', 'Behind womens iti', 'Backside Dav road from jyoti vihar', '812003', 'Bihar', 'Bhagalapur ', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(94, '154', 'Amrendra Kumar', NULL, '9470864502', 'Dr. Amrendra kumar yadav, badi khanjarpur ,', 'Mishra tola lane , bhagalpur', 'Durga sthan mandir , mishra tola', 'Bari Khanjarpur', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(95, '185', 'Sujal Kumar', NULL, '7484832713', 'Golaghat', '', 'Nayabazar Bhagalpur', 'Golaghat', '812002', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(96, '191', 'Pranav Kumar  Das', NULL, '9264174602', 'Hno 180', 'Hanumanpath', 'Near Gyatri Mandir ', 'Tilkamanjhi', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(97, '193', 'CHITRANSHU DEEP', NULL, '6200403085', 'INFRONT OF JAGADAMBA APARTMENT', 'CHANKAYA VIHAR COLONY BARARI', 'NEAR GANGA TOLL TAX', 'BARARI', '812003', 'BIHAR', 'BHAGALPUR', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(98, '194', 'Ronit Kumar ', NULL, '9123427690', 'Nawab Bagh colony police ', 'Nawab Bagh colony police line tilkamanjhi ', 'Nawab Bagh colony police line ', 'Nawab Bagh colony ', '812001', 'Bihar', 'Bhagalpur ', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(99, '184', 'Aditya Ranjan', NULL, '8102981027', 'Red cross road,akashwani chowk,adampur', '', 'Near Ranjan xray', 'Akashwani chowk', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(100, '195', 'Sanjay Kumar  Singh', NULL, '9470071840', 'Jayshree Kunj', 'Hanuman Path', 'Near Dr Sandip Lall res', 'Tilkamanjhi ', '812001', 'Bihar', 'Bhagalpur ', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(101, '156', 'Arman Singh', NULL, '8789956279', 'Ghat road', 'Adampur', 'Near ', 'Divya dham apartment', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(102, '151', 'Sarita Pandey', NULL, '6299223428', 'Indu Mohan Smriti', 'R b s s s road ', 'Dixon more', 'Bhikhanpur ', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(103, '171', 'Sakshi Singh', NULL, '8709777537', 'RM hostel chhoti khanjarpur', 'Chhoti khanjarpur, Tukul babu campus', 'Dr. Dipti Sinha clinic, sm college road ', 'SM college road , chhoti khanjarpur', '812001', 'Bihar', 'Bhagalpur', 'Home ', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(104, '45', 'Pankaj Kumar', NULL, '8235324198', 'In front of blind school', 'Saptkrishi syntefic Pvt ltd', 'Bhikanpur', 'Bhikanpur', '812002', 'Bihar', 'Bhagalpur', 'Office', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(105, '200', 'Anulesh Kumar  Singh', NULL, '7903974918', 'Anulesh kr Singh', 'Baba bridheshwar Apartment budanath chowk', 'Budanath', 'Flat no. 403', '812005', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(106, '103', 'Keshav Anand', NULL, '8340424464', 'Pg3', 'Men hostel', 'University campus', 'Sahebganj', '812007', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(107, '202', 'SWATI Kumari', NULL, '7260815400', 'flat no.403,ashiana veena complex', 'chanakya vihar colony', 'beside mangalam hospital', 'chanakya vihar colony', '812003', 'bihar', 'bhagalpur', 'home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(108, '196', 'Mantu Mandal', NULL, '8434526621', 'Choti hasangang', 'Choti hasangang', 'Kali mandir', 'Mirjanhat', '812005', 'Bihar', 'Bhagalpur', 'Bs-037.0078', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(109, '208', 'Gautam Dubey', NULL, '8521329110', 'Near kali mandir', 'Nathnagar', 'Nathnagar', 'Nathnagar', '812005', 'Bihar', 'Bhagalpur ', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(110, '172', 'Monika  Raj', NULL, '8051611851', 'Monika raj, R. M hostel tukul babu campus chhoti khanjarpur', 'Chhoti khanjarpur .tukul  babu campus', 'Dr. Dipti singha clinic', 'SM college road ', '812001', 'Bihar ', 'Bhagalpur', 'Home ', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(111, '190', 'Anshu Kumar Choudhary', NULL, '9934382206', 'Rajendra Nagar colony zero mile bhagalpur MRF tyre showroom opposite ', 'Rajendra Nagar colony zero mile bhagalpur MRF tyre showroom opposite', 'Hotel gopal in', 'Zero mile', '813210', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(112, '133', 'Reena Jha', NULL, '9334584190', 'Naya tola dudhelia, block road, nathnagar ', '', 'Infront of little flower school', 'Nourpur', '812004', 'Bihar', 'Bhagalpur', '...', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(113, '126', 'Rachna Kumari ', NULL, '9304101725', 'Chankya vihar colony', 'Jadmba tower', 'Manglam hospital ', 'Barari', '812003', 'Bihar', 'Bhagalpur ', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(114, '211', 'Gaurav Sultan', NULL, '7050681184', 'R. N. JHA Lane', 'Nasratkhani', 'Sanjay Lodge', 'Nathnagar', '812004', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(115, '212', 'Dr.ashutosh Jaiswal', NULL, '8294211321', '', 'Flat no 401 ,Aahiyana veena complex', 'Chankya vihar colony', 'Zeromile', '812003', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(116, '219', 'Vivek Gupta', NULL, '7979715305', 'JM 405,DIVYADHAM APARTMENT', 'ADAMPUR GHAT ROAD', 'OPPOSITE KALI MANDIR', 'ADAMPUR', '812001', 'BIHAR', 'BHAGALPUR', 'HOME', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(117, '231', 'Deepak Kumar', NULL, '7992245816', 'Kishanpur', 'Nathnagar', 'Hanuman mandir ', 'Near bypass ', '812005', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(118, '233', 'Dilip Kumar', NULL, '8271836847', 'Mahanpur narga', '', 'Sarswati shishu mandir', 'Nathnagar', '812004', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(119, '240', 'Annapurna Kumari', NULL, '7050773249', ' Gumti number 2', 'Bhatta Road', 'East of visheri sthan', 'Bhikhanpur', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(120, '54', 'Gaurav Kumar', NULL, '9523775883', 'Adampur Ghat ', '', 'Deepdham appartment', 'Adampur ghat', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(121, '255', 'RACHIT  Singhania', NULL, '8902412383', 'RACHIT SINGHANIA, C/0, SHREE MEDICAL HALL,', 'STATION ROAD,  IN FRONT OF BHAGALPUR RAILWAY STATION', 'NEAR MAKHANBHOG SWEETS', 'STATION ROAD', '812002', 'Bihar', 'Bhagalpur', 'Office', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(122, '118', 'Nisha Kumari', NULL, '8789237804', 'Tilkamanjhi', 'Jawaripur', 'Near shila vivah bhawan', 'Bank colony', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(123, '259', 'MANISH RANJAN', NULL, '8789552297', 'Flat no.503,4th Floor,Sheela Regency Appartment', 'Tilkamanjhi, Bhagalpur', 'Near Sheela Vivah Bhawan', 'Tilkamanjhi Bhagalpur', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(124, '260', 'amalendu aman', NULL, '7321058791', 'sarai,bhagalpur', 'Bhagalpur', 'near amrit jalpan', 'sarai', '812001', 'bihar', 'bhagalpur', 'near amrit jalpan', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(125, '275', 'Santosh Singh', NULL, '9534268822', 'Santosh kumar singh', 'C/o Prof Ashok kumar thakur', 'Near Vikramsila setu', 'Chankya vihar colony,Barari', '812003', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(126, '277', 'Shubhalakshmi  Mahata ', NULL, '7004733838', 'House #BC-037-0263, Satish Sarkar Lane, Sarat Chandra Path ', '', 'Near K K Nursing Home', 'Mashakchak', '812001', 'BIHAR', 'BHAGALPUR', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(127, '274', 'Rohan Yadav', NULL, '8002193731', 'Shail niwas', 'Shailbagh colony,Bounsi road', 'Behind shaileshwer nath mandir', 'Aliganj , shailbagh,bounsi road', '812005', 'Bihar', 'Bhagalpur ', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(128, '285', 'Saurabh  Suman', NULL, '7903004585', 'Manik sarkar chowk behind ', 'K.k.nursing home Gaganchumbi Bhawan', 'Manik sarkar chowk ', 'Manik sarkar chowk ', '812001', 'Bihar', 'Bhagalpur ', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(129, '217', 'Shanu Singh', NULL, '7209829177', 'New colony,choti khanjarpur ', '', 'Mothers kitchen ', 'Choti khanjarpur, manali', '812001', 'Bihar', 'Bhagalpur', 'Home', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(130, '296', 'Hdp Hdp', NULL, '8888888888', 'asdlkj', 'dasdasd', 'asdasd', 'asdasd', '345345', 'gujarat', 'surat', 'asdasd', 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

CREATE TABLE `delivery_boy` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `image` text NOT NULL,
  `available` varchar(1) NOT NULL DEFAULT 'n',
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `reg_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery_boy`
--

INSERT INTO `delivery_boy` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`, `gender`, `image`, `available`, `status`, `reg_date`) VALUES
(6, 'Pankaj', 'Kumar', 'rajaryan99507@gmail.com', '8235324198', 'SSPL112', 'male', 'assets/images/admin/20201217143912.jpeg', 'n', 'y', NULL),
(7, 'Uday', 'Kumar', 'Kuday4817@gmail.com', '9122402646', 'SSPL113', 'male', 'assets/images/admin/20201217150009.jpeg', 'n', 'y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` varchar(1) NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `title`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(1, 'Fruits & Vegetables', 'y', '2020-12-09 17:36:46', 5, '2020-12-14 09:51:04', 5),
(5, 'Combo Offers', 'y', '2020-12-15 12:40:28', 5, '2020-12-15 12:43:56', 5),
(6, 'CAKE', 'y', '2020-12-25 06:41:32', 5, '0000-00-00 00:00:00', 0),
(7, 'Loyal for India', 'y', '2020-12-29 12:18:10', 5, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `feedback` varchar(200) NOT NULL,
  `rating` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `mobile`, `feedback`, `rating`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(5, 'Pankaj', 'hdp@gmail.com', '8487953552', 'good app', 3, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(6, 'Pankaj', 'hdp@gmail.com', '8487953552', 'Hello', 4, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(7, 'Pankaj', 'hdp@gmail.com', '8487953552', 'Bfgh', 5, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(8, 'Pankaj', 'hdp@gmail.com', '8487953552', 'Gaurav', 4, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(13, 'Admin', 'admin@gmail.com', '8758431417', 'bjjjj', 1, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(14, 'Admin', 'admin@gmail.com', '8758431417', 'hj', 1, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(15, 'Admin', 'admin@gmail.com', '8758431417', 'hii', 1, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(16, 'Admin', 'admin@gmail.com', '8758431417', 'jcjcjvkv', 5, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(17, 'Testing ', 'Testing1@gmail.com ', '1234567899', 'Ydhdhf', 5, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(18, 'Testing', 'Testing@gmail.com ', '1234567888', '', 4, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(19, 'Johnny', 'hdp@gmail.com', '8487953552', 'Feedback', 4, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(20, 'Anku', 'ankuumishra2612@gmail.com', '6205258824', 'It\'s simple to use and great deals are here. Finally an app for working people in bgp who\'s got no time for groceries. Must try. ', 5, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(21, 'Suraj', 'roysurajkumar919@gmail.com', '6207959165', '', 3, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(22, 'Rahul', 'r9470025791@gmail.com', '7011303977', 'Sirf kg me hai sir  1/2 kg  and 1/4  gm me v rahta to bhaut accha rahta ????????????????????????????????', 3, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(23, 'Rahul', 'r9470025791@gmail.com', '7011303977', 'Sirf kg me hai sir  1/2 kg  and 1/4  gm me v rahta to bhaut accha rahta ????????????????????????????????', 3, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(24, 'amalendu', 'amalenduaman@gmail.com', '7321058791', 'good app , need little improvement.Like if i click on fruits and veg, do select any fruit(suppose banana) , when i go back from here it takes me 2 step back i.e. on main menu ', 3, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(25, 'Vivek', 'Vivekgupta7901@gmail.com', '7979715305', 'App keeps on searching even ', 3, 'y', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hit_count`
--

CREATE TABLE `hit_count` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `time` time NOT NULL,
  `short_country` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `important_links`
--

CREATE TABLE `important_links` (
  `id` int(11) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `link` varchar(200) NOT NULL,
  `text` varchar(15) NOT NULL,
  `status` varchar(1) NOT NULL,
  `new_tab` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `important_links`
--

INSERT INTO `important_links` (`id`, `icon`, `link`, `text`, `status`, `new_tab`) VALUES
(1, 'fa fa-building', 'https://facebook.com', 'abc', 'y', '');

-- --------------------------------------------------------

--
-- Table structure for table `master`
--

CREATE TABLE `master` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL,
  `link` text NOT NULL,
  `icon` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL,
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master`
--

INSERT INTO `master` (`id`, `title`, `text`, `link`, `icon`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`, `position`, `parent_id`) VALUES
(1, 'Category', '', 'category', 'fa fa-building', 'y', '2020-10-31 11:09:11', 5, '2020-12-17 13:37:43', 5, 2, 3),
(2, 'Admin', '', 'admin', 'fa fa-user', 'y', '2020-10-31 11:11:08', 5, '0000-00-00 00:00:00', 0, 7, 0),
(3, 'Category Management', '', '#', 'fa fa-building', 'y', '2020-10-31 11:12:14', 5, '0000-00-00 00:00:00', 0, 1, 0),
(4, 'Sub Category', '', 'sub_category', 'fa fa-building', 'y', '2020-10-31 11:13:39', 5, '0000-00-00 00:00:00', 0, 2, 3),
(5, 'City Management', '', '#', 'fa fa-building', 'y', '2020-11-02 09:48:59', 5, '0000-00-00 00:00:00', 0, 2, 0),
(6, 'Country', '', 'country', 'fa fa-building', 'y', '2020-11-02 09:49:33', 5, '0000-00-00 00:00:00', 0, 1, 5),
(7, 'State', '', 'state', 'fa fa-building', 'y', '2020-11-02 09:49:49', 5, '0000-00-00 00:00:00', 0, 2, 5),
(8, 'City', '', 'city', 'fa fa-building', 'y', '2020-11-02 09:50:16', 5, '0000-00-00 00:00:00', 0, 3, 5),
(9, 'Area', '', 'area', 'fa fa-building', 'y', '2020-11-02 09:50:38', 5, '0000-00-00 00:00:00', 0, 4, 5),
(10, 'Customer', '', 'customer', 'fa fa-users', 'y', '2020-11-02 12:56:14', 5, '0000-00-00 00:00:00', 0, 3, 0),
(11, 'Banner', '', 'banner', 'fa fa-ticket-alt', 'y', '2020-11-02 13:34:07', 5, '0000-00-00 00:00:00', 0, 3, 0),
(12, 'Delivery Boy', '', 'delivery_boy', 'fa fa-users', 'y', '2020-11-02 15:33:52', 5, '0000-00-00 00:00:00', 0, 4, 0),
(13, 'Feedback', '', 'feedback', 'fa fa-building', 'y', '2020-11-02 15:41:27', 5, '0000-00-00 00:00:00', 0, 4, 0),
(14, 'Template', '', 'template', 'fa fa-globe', 'y', '2020-11-02 15:55:46', 5, '0000-00-00 00:00:00', 0, 5, 0),
(15, 'Configuration', '', '#', 'fa fa-cog', 'y', '2020-11-02 15:57:41', 5, '0000-00-00 00:00:00', 0, 5, 0),
(16, 'Site Configuration', '', 'configuration', 'fa fa-cog', 'y', '2020-11-02 15:58:18', 5, '0000-00-00 00:00:00', 0, 1, 15),
(17, 'About Us', '', 'configuration/about', 'fa fa-cog', 'y', '2020-11-02 15:59:09', 5, '0000-00-00 00:00:00', 0, 2, 15),
(18, 'Privacy Policy', '', 'configuration/privacy', 'fa fa-cog', 'y', '2020-11-02 15:59:34', 5, '0000-00-00 00:00:00', 0, 3, 15),
(19, 'Terms & Condition', '', 'configuration/terms', 'fa fa-cog', 'y', '2020-11-02 16:00:16', 5, '0000-00-00 00:00:00', 0, 4, 15),
(20, 'Orders', '', '#', 'fa fa-globe', 'y', '2020-11-03 10:39:09', 5, '2021-01-13 14:58:07', 5, 4, 0),
(22, 'Product', '', 'product', 'fa fa-building', 'y', '2020-11-03 13:03:09', 5, '0000-00-00 00:00:00', 0, 5, 0),
(23, 'Reports', '', '#', 'fa fa-building', 'y', '2020-11-14 16:54:32', 5, '0000-00-00 00:00:00', 0, 5, 0),
(24, 'Date wise report', '', 'report/date_wise', 'fa fa-building', 'y', '2020-11-14 16:55:03', 5, '0000-00-00 00:00:00', 0, 1, 23),
(25, 'City wise report', '', 'report/city_wise', 'fa fa-building', 'y', '2020-11-14 16:55:28', 5, '0000-00-00 00:00:00', 0, 2, 23),
(26, 'Customer wise report', '', 'report/customer_wise', 'fa fa-building', 'y', '2020-11-14 16:55:53', 5, '0000-00-00 00:00:00', 0, 3, 23),
(27, 'Coupons', '', 'coupons', '', 'y', '2020-11-26 13:36:01', 5, '0000-00-00 00:00:00', 0, 3, 3),
(28, 'Department', '', 'department', '', 'y', '2020-12-09 17:35:58', 5, '0000-00-00 00:00:00', 0, 1, 3),
(29, 'Order', '', 'order', 'fa fa-globe', 'y', '2021-01-13 14:58:25', 5, '0000-00-00 00:00:00', 0, 1, 20),
(30, 'Time Slots', '', 'timeslot', 'fa fa-globe', 'y', '2021-01-13 14:58:43', 5, '0000-00-00 00:00:00', 0, 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `message` text,
  `type` varchar(50) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `delivery_boy_id`, `order_id`, `message`, `type`, `datetime`) VALUES
(1, 3, 22, 'Testing Notification', 'notification', '2020-11-24 07:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `order_no` varchar(200) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `total_price` float NOT NULL,
  `converted_amount` float NOT NULL,
  `currency` varchar(10) NOT NULL,
  `order_type` varchar(20) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `transaction_type` varchar(50) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_time` time NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `coupon_used` varchar(50) NOT NULL,
  `coupon_discount` float NOT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `order_no`, `customer_id`, `delivery_boy_id`, `name`, `email`, `mobile`, `address1`, `address2`, `landmark`, `area`, `pincode`, `state`, `city`, `type`, `order_date`, `order_time`, `total_price`, `converted_amount`, `currency`, `order_type`, `payment_mode`, `payment_status`, `transaction_type`, `reference_no`, `transaction_date`, `transaction_time`, `order_status`, `datetime`, `coupon_used`, `coupon_discount`, `comment`) VALUES
(1, '202011201', 3, NULL, 'Gaurav', 'gaurav@gmail.com', '8907654567', '208, Siddhivinayak', '208, Siddhivinayak', 'Kailash chokadi', 'Pandesara', '394221', 'Gujarat', 'Surat', 'Office', '2020-11-20', '01:31:51', 10000, 10000, 'INR', 'Cash on delivery', 'cash', 'y', 'cash', 'JHHKADFDFSDF', '2020-11-19', '11:20:44', 'pending', '2020-11-20 08:01:51', '', 0, NULL),
(23, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '00:00:00', 0, 0, '', '', '', '', '', '', '0000-00-00', '00:00:00', 'delivered', '2020-11-24 11:07:31', '', 0, NULL),
(49, '2020121249', 31, NULL, 'Deepak Prajapati', 'deepakprn78@gmail.com', '7878868606', '283', 'pandesara', 'temple', 'pandesara', '394221', 'Gujarat', 'Surat', 'home', '2020-12-12', '05:08:11', 121.9, 121.9, 'INR', 'home', '', '', 'cod', '', '2020-12-12', '17:08:11', 'pending', '2020-12-12 11:38:11', '', 0, NULL),
(50, '2020121250', 31, NULL, 'Deepak Prajapati', 'deepakprn78@gmail.com', '7878868606', '283', 'pandesara', 'temple', 'pandesara', '394221', 'Gujarat', 'Surat', 'home', '2020-12-12', '05:13:20', 175.8, 175.8, 'INR', 'home', '', '', 'cod', '', '2020-12-12', '17:13:20', 'pending', '2020-12-12 11:43:20', '', 0, NULL),
(51, '2020121251', 31, NULL, 'Deepak Prajapati', 'deepakprn78@gmail.com', '7878868606', '283', 'pandesara', 'temple', 'pandesara', '394221', 'Gujarat', 'Surat', 'home', '2020-12-12', '05:21:15', 132.2, 132.2, 'INR', 'home', '', '', 'cod', '', '2020-12-12', '17:21:15', 'pending', '2020-12-12 11:51:15', '', 0, NULL),
(52, '2020121252', 29, NULL, 'Johnny Patel', 'hdp@gmail.com', '8487953552', 'hjgjhg kjhjhgjhs khjhkhk', 'address kjhsdkfjh khkjhkjhkj', 'near tank khskhkjshsf', 'juhu', '234424', 'gujarat', 'surat', 'home', '2020-12-12', '08:01:30', 135, 135, 'INR', 'home', '', '', 'cod', '', '2020-12-12', '20:01:28', 'pending', '2020-12-12 14:31:30', '', 0, NULL),
(53, '2020121253', 29, NULL, 'Johnny Patel', 'hdp@gmail.com', '8487953552', 'hjgjhg kjhjhgjhs khjhkhk', 'address kjhsdkfjh khkjhkjhkj', 'near tank khskhkjshsf', 'juhu', '234424', 'gujarat', 'surat', 'home', '2020-12-12', '08:04:43', 53.5, 53.5, 'INR', 'home', '', '', 'cod', '', '2020-12-12', '20:04:41', 'pending', '2020-12-12 14:34:43', '', 0, NULL),
(54, '2020121454', 34, NULL, 'Sourab Tiwary', 'Sourabt769@gmail.com', '7970696383', 'Mirjanhat', '', 'Tower chowck', 'Warsaliganj', '812005', 'Bihar', 'Bhagalpur', 'Home', '2020-12-14', '03:27:42', 198.5, 198.5, 'INR', 'home', '', '', 'cod', '', '2020-12-14', '15:27:40', 'pending', '2020-12-14 09:57:42', '', 0, NULL),
(61, '2020121761', 77, NULL, 'Rakesh kumar  Pandey', 'rkp82710@gmail.com', '8709282804', 'Adarsh nagar colony', 'Laluchak bhatta ,bhikhanpur', 'Sahid ratan kumar thakur street', 'Bhagalpur', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-17', '10:59:44', 20, 20, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '10:59:43', 'delivered', '2020-12-17 05:29:44', '', 0, NULL),
(62, '2020121762', 79, NULL, 'Rohit Kumar', 'rohitkumarbkp2000@gmail.com', '6299737140', 'Admam pur Baghalpur rani chandrawati hata ', 'Adam pur Baghalpur rani chandrawati hata', 'Adampur ', 'Adampur', '812001', 'Bihar', 'Baghalpur', 'Adampur', '2020-12-17', '11:58:33', 40, 40, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '11:58:32', 'delivered', '2020-12-17 06:28:33', '', 0, NULL),
(63, '2020121763', 79, NULL, 'Rohit Kumar', 'rohitkumarbkp2000@gmail.com', '6299737140', 'Admam pur Baghalpur rani chandrawati hata ', 'Adam pur Baghalpur rani chandrawati hata', 'Adampur ', 'Adampur', '812001', 'Bihar', 'Baghalpur', 'Adampur', '2020-12-17', '12:01:08', 10, 10, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '12:01:06', 'delivered', '2020-12-17 06:31:08', '', 0, NULL),
(64, '2020121764', 84, 7, 'Niraj Kumar', 'Nirajkumar95340@gmail', '8709868017', 'Adampurghat', 'SS Banerjee road', 'Kaligatilane', 'Adamput', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-17', '01:15:00', 700, 700, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '13:14:59', 'delivered', '2020-12-17 07:45:00', '', 0, NULL),
(68, '2020121768', 77, 6, 'Rakesh kumar  Pandey', 'rkp82710@gmail.com', '8709282804', 'Adarsh nagar colony', 'Laluchak bhatta ,bhikhanpur', 'Sahid ratan kumar thakur street', 'Bhagalpur', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-17', '03:05:19', 15, 15, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '15:05:18', 'delivered', '2020-12-17 09:35:19', '', 0, NULL),
(69, '2020121769', 85, 7, 'Gajadhar Sharma', 'gajadharharidaspur789@gmail.com', '7260877420', 'kamhkya nagar colony', 'Astha lifestyle coty', 'near glocal hospital', 'bypass road', '812001', 'Bihar', 'Bhagalpur', 'home', '2020-12-17', '03:37:32', 90, 90, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '15:37:30', 'delivered', '2020-12-17 10:07:32', '', 0, NULL),
(70, '2020121770', 77, 6, 'Rakesh kumar  Pandey', 'rkp82710@gmail.com', '8709282804', 'Adarsh nagar colony', 'Laluchak bhatta ,bhikhanpur', 'Sahid ratan kumar thakur street', 'Bhagalpur', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-17', '04:05:12', 503, 503, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '16:05:11', 'delivered', '2020-12-17 10:35:12', '', 0, NULL),
(71, '2020121771', 86, NULL, 'Abhinav  Singh', 'gameravinayan@gmail.com', '9113784802', 'Naya bazar', 'Bhagalpur', 'Dulari bhawan,', 'Bhagalpur', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-17', '04:12:02', 10, 10, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '16:12:00', 'out_of_delivery', '2020-12-17 10:42:02', '', 0, NULL),
(72, '2020121772', 76, 7, 'Riya Singh', 'riya73singh111@gmail.com', '9304352485', 'Shardha girls hostel', '', 'sm college road', 'Chhoti khanjarpur', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-17', '04:52:34', 55, 55, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '16:52:32', 'delivered', '2020-12-17 11:22:34', '', 0, NULL),
(73, '2020121773', 76, 7, 'Riya Singh', 'riya73singh111@gmail.com', '9304352485', 'Shardha girls hostel', '', 'sm college road', 'Chhoti khanjarpur', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-17', '04:59:10', 50, 50, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '16:59:08', 'delivered', '2020-12-17 11:29:10', '', 0, NULL),
(74, '2020121774', 88, 6, 'Shailesh Sinha', 'shaileshsinha414@gmail.com', '8709169387', 'Jogsar Gwaltoli', 'J p pandey lane', 'Near Gita printing press', 'Jogsar Gwaltoli', '812001', 'Bihar', 'Bgagalpur', 'Home', '2020-12-17', '06:16:21', 115, 115, 'INR', 'home', '', '', 'cod', '', '2020-12-17', '18:16:19', 'delivered', '2020-12-17 12:46:21', '', 0, NULL),
(75, '2020121875', 54, 6, 'Gaurav Kumar', 'gauravpandey9852@gmail.com', '9523775883', 'Tilkamanjhi', 'Adampur', 'Dr Nk yadav hospital', 'Tilkamanjhi', '812001', 'Bihar', 'Bhagalpur', 'Nk jadav tilkamanjhi', '2020-12-18', '09:15:12', 240, 240, 'INR', 'home', '', '', 'cod', '', '2020-12-18', '09:15:11', 'delivered', '2020-12-18 03:45:12', '', 0, NULL),
(76, '2020121876', 90, 6, 'Rohit Kumar', 'rohit776688@Gmail.com', '9931213820', 'आदमपुर', 'कोयला घाट', 'फरिश लेन', 'Hanumaan मंदिर', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-18', '10:25:15', 65, 65, 'INR', 'home', '', '', 'cod', '', '2020-12-18', '10:25:14', 'delivered', '2020-12-18 04:55:15', '', 0, NULL),
(77, '2020121877', 54, 6, 'Gaurav Kumar', 'gauravpandey9852@gmail.com', '9523775883', 'Tilkamanjhi', 'Adampur', 'Dr Nk yadav hospital', 'Tilkamanjhi', '812001', 'Bihar', 'Bhagalpur', 'Nk jadav tilkamanjhi', '2020-12-18', '10:29:15', 300, 300, 'INR', 'home', '', '', 'cod', '', '2020-12-18', '10:29:14', 'delivered', '2020-12-18 04:59:15', '', 0, NULL),
(78, '2020121878', 97, 6, 'ANJANI KUMAR MISHRA', 'anjanikmishra59@gmail.com', '9470070487', 'HOUSE NO -- BC/40/99', 'GIRJA MUKTESHWAR COLONY', 'MAYAGANJ HOSPITAL ROAD', 'BHAGALPUR', '812001', 'BIHAR', 'BHAGALPUR', 'Home', '2020-12-18', '12:12:45', 131, 131, 'INR', 'home', '', '', 'cod', '', '2020-12-18', '12:12:43', 'delivered', '2020-12-18 06:42:45', '', 0, NULL),
(79, '2020121879', 109, 7, 'Md Naquie Alam', 'mdnaquialam58@gmail.com', '9934603788', 'Vill- khiribandh ', '', 'Mukheriya road near Vodafone tower', 'Near saint Teresa school Bhagalpur', '812005', 'Bihar', 'Bhagalpur', 'Home', '2020-12-18', '02:00:24', 140, 140, 'INR', 'home', '', '', 'cod', '', '2020-12-18', '14:00:20', 'delivered', '2020-12-18 08:30:24', '', 0, NULL),
(80, '2020121880', 117, 7, 'Dharmendra Kumar', 'Dharmendrabgp0641@gmail.com', '8804557716', 'Parbatti nopani school ', 'Hindustan press parbatti', 'Nopani school', 'Parbatti', '812002', 'Bihar', 'Bhagalpur', 'Home', '2020-12-18', '02:26:08', 140, 140, 'INR', 'home', '', '', 'cod', '', '2020-12-18', '14:26:06', 'delivered', '2020-12-18 08:56:08', '', 0, NULL),
(81, '2020121881', 105, 7, 'Manish Kumar', 'Manishrazz123@gmail.com', '9776758915', 'Noorpur', '', 'Chaiti durga sthan', 'Nathnagar', '812006', 'Bihar', 'Bhagalpur', 'Nathnagar', '2020-12-18', '07:34:45', 30, 30, 'INR', 'home', '', '', 'cod', '', '2020-12-18', '19:34:43', 'delivered', '2020-12-18 14:04:45', '', 0, NULL),
(82, '2020121982', 121, 7, 'Rajesh Narayan Agrawal', 'narayanrajeshagrawal@gmail.com', '8789658806', 'R.N.Agrawal,Rameshwer Niwas.', '', 'Behind Daffodils School.', 'Chunihari Tola', '812002', 'Bihar', 'Bhagalpur', 'Home', '2020-12-19', '11:33:10', 250, 250, 'INR', 'home', '', '', 'cod', '', '2020-12-19', '11:33:07', 'delivered', '2020-12-19 06:03:10', '', 0, NULL),
(84, '2020121984', 123, 7, 'Rudra Raj', '123rupeshrudraraj@gmail.com', '6205062540', 'Lalkhan', 'Near dvc grid sabour', 'Dvc grid sabour', 'Mansarpur ke bagal me', '813210', 'Bihar', 'Bhagalpur', 'Home', '2020-12-19', '12:05:56', 170, 170, 'INR', 'home', '', '', 'cod', '', '2020-12-19', '12:05:54', 'delivered', '2020-12-19 06:35:56', '', 0, NULL),
(85, '2020121985', 93, 7, 'Swati  Garg', 'Garg4215@gamil.com', '6299995037', 'S.M. College Road', 'Opi loj ', 'Oxford गैलरी , सक्सेस सेंटर गली', 'Opi log', '812001', 'Bihar', 'Bhagalpur', 'गर्ल्स हॉस्टल', '2020-12-19', '04:17:39', 58, 58, 'INR', 'home', '', '', 'cod', '', '2020-12-19', '16:17:37', 'delivered', '2020-12-19 10:47:39', '', 0, NULL),
(86, '2020121986', 93, 7, 'Swati  Garg', 'Garg4215@gamil.com', '6299995037', 'S.M. College Road', 'Opi loj ', 'Oxford गैलरी , सक्सेस सेंटर गली', 'Opi log', '812001', 'Bihar', 'Bhagalpur', 'गर्ल्स हॉस्टल', '2020-12-19', '04:19:50', 35, 35, 'INR', 'home', '', '', 'cod', '', '2020-12-19', '16:19:19', 'delivered', '2020-12-19 10:49:50', '', 0, NULL),
(87, '2020121987', 132, 7, 'Balraj  Jha', 'balrajjhabatu@gmail.com ', '9933438951', 'Naya tola dudhaila ', 'Nathnagar ', 'Opposite to little flower school ', 'Nathnagar ', '812004', 'Bihar ', 'Bhagalpur ', 'Home ', '2020-12-19', '08:36:01', 80, 80, 'INR', 'home', '', '', 'cod', '', '2020-12-19', '20:35:59', 'delivered', '2020-12-19 15:06:01', '', 0, NULL),
(88, '2020121988', 132, 7, 'Balraj  Jha', 'balrajjhabatu@gmail.com ', '9933438951', 'Naya tola dudhaila ', 'Nathnagar ', 'Opposite to little flower school ', 'Nathnagar ', '812004', 'Bihar ', 'Bhagalpur ', 'Home ', '2020-12-19', '08:37:32', 60, 60, 'INR', 'home', '', '', 'cod', '', '2020-12-19', '20:37:30', 'delivered', '2020-12-19 15:07:32', '', 0, NULL),
(89, '2020121989', 127, 6, 'Sanjay Rana', 'sanjayrana@gmail.c', '8825119774', '2F ann tower bhikhanpur bhagalpur', '', 'Chavla restaurant', 'Bhikhanpur', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-19', '11:59:01', 350, 350, 'INR', 'home', '', '', 'cod', '', '2020-12-19', '23:58:59', 'delivered', '2020-12-19 18:29:01', '', 0, NULL),
(90, '2020122090', 135, NULL, 'Ravi Kumar', 'rajravi034@gmail.com', '7982067030', 'Chapanagar ', 'Bisarhi asthan ', 'Hanuman mandir ', 'Kumartoli lane', '812004', 'Bihar', 'Bhagalpur', 'Home', '2020-12-20', '09:00:22', 40, 40, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '09:00:20', 'out_of_delivery', '2020-12-20 03:30:22', '', 0, NULL),
(91, '2020122091', 74, 6, 'ankit rana', 'ankitmeet14@gmail.com', '8271230391', 'gita bhawan', 'janki pd. lane,mundichak', 'big wall with tree', 'mundichak', '812002', 'bihar', 'bhagalpur', 'home', '2020-12-20', '10:27:13', 60, 60, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '10:27:12', 'delivered', '2020-12-20 04:57:13', '', 0, NULL),
(92, '2020122092', 120, 7, 'Bittu Choudhary', 'bittu1827@gmail.com', '7260899302', 'Mundichak ', '', 'Relex gali', 'Na', '812001', 'Bihar', 'Bhagalpur', 'Na', '2020-12-20', '11:22:36', 100, 100, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '11:22:34', 'delivered', '2020-12-20 05:52:36', '', 0, NULL),
(93, '2020122093', 137, 7, 'Deepak Kumar', '1deepak.kumar521984@gmail.com', '9771622800', ' RC 22 sector 3 Housing board colony', 'Behind barari high school', 'Barari high school', 'Sector 3', '812003', 'Bihar', 'Bhagalpur', 'Home', '2020-12-20', '12:24:00', 200, 200, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '12:23:59', 'delivered', '2020-12-20 06:54:00', '', 0, NULL),
(94, '2020122094', 138, 6, 'city hospital', 'loversonuraj@gmail.com', '8271442162', 'city hospital', 'city hospital', 'aadampur', 'adampur', '812001', 'bihar', 'bhagalpur', 'office', '2020-12-20', '12:51:34', 100, 100, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '12:51:32', 'delivered', '2020-12-20 07:21:34', '', 0, NULL),
(95, '2020122095', 139, 6, 'Nitil City hospital', 'snitil62@gmail.com', '8051433444', 'City hospital ', 'City hospital ', 'City hospital', 'Main post office', '812001', 'Bihar', 'Bhagalpur', 'Office ', '2020-12-20', '01:00:19', 100, 100, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '13:00:16', 'delivered', '2020-12-20 07:30:19', '', 0, NULL),
(96, '2020122096', 140, 6, 'Gautam Kumar', 'gautamambulance@gmail.com', '8969837650', 'City Hospital ', '', 'Near metro mirchi hotel', 'Adampur ', '812001', 'Bihar ', 'Bhagalpur ', 'Office ', '2020-12-20', '01:01:22', 40, 40, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '13:01:21', 'delivered', '2020-12-20 07:31:22', '', 0, NULL),
(97, '2020122097', 143, 6, 'Rahul Pandey', 'r9470025791@gmail.com', '7011303977', 'Indu mohan smriti', 'Adbhut hanuman mandir', 'Ishakchak, petrol pump', 'RBSSS Sahay road', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-20', '03:18:49', 10, 10, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '15:18:47', 'delivered', '2020-12-20 09:48:49', '', 0, NULL),
(98, '2020122098', 143, 6, 'Rahul Pandey', 'r9470025791@gmail.com', '7011303977', 'Indu mohan smriti', 'Adbhut hanuman mandir', 'Ishakchak, petrol pump', 'RBSSS Sahay road', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-20', '03:42:03', 60, 60, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '15:42:02', 'delivered', '2020-12-20 10:12:03', '', 0, NULL),
(99, '2020122099', 143, 6, 'Rahul Pandey', 'r9470025791@gmail.com', '7011303977', 'Indu mohan smriti', 'Adbhut hanuman mandir', 'Ishakchak, petrol pump', 'RBSSS Sahay road', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-20', '05:04:56', 80, 80, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '17:04:55', 'delivered', '2020-12-20 11:34:56', '', 0, NULL),
(100, '20201220100', 139, 6, 'Nitil City hospital', 'snitil62@gmail.com', '8051433444', 'City hospital ', 'City hospital ', 'City hospital', 'Main post office', '812001', 'Bihar', 'Bhagalpur', 'Office ', '2020-12-20', '06:59:05', 110, 110, 'INR', 'home', '', '', 'cod', '', '2020-12-20', '18:59:03', 'delivered', '2020-12-20 13:29:05', '', 0, NULL),
(101, '20201221101', 68, 7, 'Kailash Sah', 'Kailashpdsah4@gmail.com', '8862974920', 'At gurhatta chowk', '', 'East gurhatta road', 'Post- Mirjanhat', '812005', 'Bihar', 'Bhagalpur', 'Home', '2020-12-21', '10:52:45', 280, 280, 'INR', 'home', '', '', 'cod', '', '2020-12-21', '10:52:42', 'delivered', '2020-12-21 05:22:45', '', 0, NULL),
(106, '20201223106', 139, 6, 'Nitil City hospital', 'snitil62@gmail.com', '8051433444', 'NITIL SINGH', 'C/O GAURAV SINGH', 'NEAR SURYA DIAG', 'MASAKCHAK', '812001', 'BIHAR', 'BHAGALPUR', 'Home', '2020-12-23', '09:52:53', 527, 527, 'INR', 'home', '', '', 'cod', '', '2020-12-23', '09:52:51', 'delivered', '2020-12-23 04:22:53', '', 0, NULL),
(107, '20201223107', 166, 6, 'Bunty Walia', 'Rajeev3bunty@gmail.com', '7979980368', 'suchit chandra singh', 'Khankitta', 'Sabour near block chowk', 'Sabour', '813210', 'Bihar', 'Bhagalpur', 'Home', '2020-12-23', '10:00:03', 170, 170, 'INR', 'home', '', '', 'cod', '', '2020-12-23', '10:00:00', 'delivered', '2020-12-23 04:30:03', '', 0, NULL),
(108, '20201223108', 170, 7, 'Srishti Singh', 'srishtikum2468@gmail.com', '6206453087', 'BE. 033.0148', 'Dr. Prem Sinha', 'SM college road', 'Manali chowk', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-23', '12:45:39', 170, 170, 'INR', 'home', '', '', 'cod', '', '2020-12-23', '12:45:38', 'delivered', '2020-12-23 07:15:39', '', 0, NULL),
(109, '20201223109', 180, NULL, 'Gautam Giri', 'gautam@gmail.com', '9122979595', 'Anandnagar', 'Sabour', 'Near EG LIFE office', 'Sabour', '813210', 'Bihar', 'Bhagalpur', 'Home', '2020-12-23', '05:26:00', 105, 105, 'INR', 'home', '', '', 'cod', '', '2020-12-23', '17:25:58', 'out_of_delivery', '2020-12-23 11:56:00', '', 0, NULL),
(110, '20201224110', 154, 7, 'Amrendra Kumar', 'raisristy67@gmail.com', '9470864502', 'Dr. Amrendra kumar yadav, badi khanjarpur ,', 'Mishra tola lane , bhagalpur', 'Durga sthan mandir , mishra tola', 'Bari Khanjarpur', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-24', '08:27:32', 290, 290, 'INR', 'home', '', '', 'razorpay', 'pay_G0MkhRawP3laOb', '2020-12-24', '08:27:29', 'delivered', '2020-12-24 02:57:32', '', 0, NULL),
(112, '20201224112', 194, 7, 'Ronit Kumar ', 'Ronit2621@gmail.com ', '9123427690', 'Nawab Bagh colony police ', 'Nawab Bagh colony police line tilkamanjhi ', 'Nawab Bagh colony police line ', 'Nawab Bagh colony ', '812001', 'Bihar', 'Bhagalpur ', 'Home', '2020-12-24', '05:21:18', 120, 120, 'INR', 'home', '', '', 'cod', '', '2020-12-24', '17:19:57', 'delivered', '2020-12-24 11:51:18', '', 0, NULL),
(113, '20201224113', 184, 7, 'Aditya Ranjan', 'aditya.ranjan2003@outlook.com', '8102981027', 'Red cross road,akashwani chowk,adampur', '', 'Near Ranjan xray', 'Akashwani chowk', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-24', '05:39:52', 195, 195, 'INR', 'home', '', '', 'cod', '', '2020-12-24', '17:39:51', 'delivered', '2020-12-24 12:09:52', '', 0, NULL),
(114, '20201224114', 195, 6, 'Sanjay Kumar  Singh', 'sksinghbabloo@gmail.com', '9470071840', 'Jayshree Kunj', 'Hanuman Path', 'Near Dr Sandip Lall res', 'Tilkamanjhi ', '812001', 'Bihar', 'Bhagalpur ', 'Home', '2020-12-24', '05:52:39', 322, 322, 'INR', 'home', '', '', 'razorpay', 'pay_G0MkhRawP3laOb', '2020-12-24', '17:52:36', 'delivered', '2020-12-24 12:22:39', '', 0, NULL),
(115, '20201224115', 195, 6, 'Sanjay Kumar  Singh', 'sksinghbabloo@gmail.com', '9470071840', 'Jayshree Kunj', 'Hanuman Path', 'Near Dr Sandip Lall res', 'Tilkamanjhi ', '812001', 'Bihar', 'Bhagalpur ', 'Home', '2020-12-24', '06:05:39', 140, 140, 'INR', 'home', '', '', 'cod', '', '2020-12-24', '18:05:35', 'delivered', '2020-12-24 12:35:39', '', 0, NULL),
(116, '20201224116', 193, 6, 'CHITRANSHU DEEP', 'deep.chitranshu@gmail.com', '6200403085', 'INFRONT OF JAGADAMBA APARTMENT', 'CHANKAYA VIHAR COLONY BARARI', 'NEAR GANGA TOLL TAX', 'BARARI', '812003', 'BIHAR', 'BHAGALPUR', 'Home', '2020-12-24', '07:58:32', 161, 161, 'INR', 'home', '', '', 'cod', '', '2020-12-24', '19:58:30', 'delivered', '2020-12-24 14:28:32', '', 0, NULL),
(117, '20201225117', 156, 6, 'Arman Singh', 'armansinghthb1234@gmail.com', '8789956279', 'Ghat road', 'Adampur', 'Near ', 'Divya dham apartment', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-25', '06:59:31', 170, 170, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '06:59:30', 'delivered', '2020-12-25 01:29:31', '', 0, NULL),
(118, '20201225118', 151, 6, 'Sarita Pandey', 'a9470025791@gmail.com', '6299223428', 'Indu Mohan Smriti', 'R b s s s road ', 'Dixon more', 'Bhikhanpur ', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-25', '08:40:51', 305, 305, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '08:40:48', 'delivered', '2020-12-25 03:10:51', '', 0, NULL),
(119, '20201225119', 170, 7, 'Srishti Singh', 'srishtikum2468@gmail.com', '6206453087', 'RM hostel,chhoti khanjarpur', 'Tukul babu campus, chhoti khanjarpur bhagalpur', 'Dr. Dipti singha clinic, SM college road ', 'Manali chowk', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-25', '10:34:21', 268, 268, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '10:34:19', 'delivered', '2020-12-25 05:04:21', '', 0, NULL),
(120, '20201225120', 171, 7, 'Sakshi Singh', 'sakshisinghbgp2016@gmail.com', '8709777537', 'RM hostel chhoti khanjarpur', 'Chhoti khanjarpur, Tukul babu campus', 'Dr. Dipti Sinha clinic, sm college road ', 'SM college road , chhoti khanjarpur', '812001', 'Bihar', 'Bhagalpur', 'Home ', '2020-12-25', '10:42:44', 191, 191, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '10:42:47', 'delivered', '2020-12-25 05:12:44', '', 0, NULL),
(121, '20201225121', 45, 7, 'Pankaj Kumar', 'rajaryan99507@gmail.com', '8235324198', 'In front of blind school', 'Saptkrishi syntefic Pvt ltd', 'Bhikanpur', 'Bhikanpur', '812002', 'Bihar', 'Bhagalpur', 'Office', '2020-12-25', '12:52:29', 380, 380, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '12:52:27', 'delivered', '2020-12-25 07:22:29', '', 0, NULL),
(122, '20201225122', 200, 7, 'Anulesh Kumar  Singh', 'anuleshkumars@gmail.com', '7903974918', 'Anulesh kr Singh', 'Baba bridheshwar Apartment budanath chowk', 'Budanath', 'Flat no. 403', '812005', 'Bihar', 'Bhagalpur', 'Home', '2020-12-25', '01:29:22', 152, 152, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '13:29:20', 'delivered', '2020-12-25 07:59:22', '', 0, NULL),
(123, '20201225123', 54, NULL, 'Gaurav Kumar', 'gauravpandey9852@gmail.com', '9523775883', 'Tilkamanjhi', 'Adampur', 'Dr Nk yadav hospital', 'Tilkamanjhi', '812001', 'Bihar', 'Bhagalpur', 'Nk jadav tilkamanjhi', '2020-12-25', '03:27:55', 380, 380, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '15:27:53', 'pending', '2020-12-25 09:57:55', '', 0, NULL),
(124, '20201225124', 139, 6, 'Nitil City hospital', 'snitil62@gmail.com', '8051433444', 'NITIL SINGH', 'C/O GAURAV SINGH', 'NEAR SURYA DIAG', 'MASAKCHAK', '812001', 'BIHAR', 'BHAGALPUR', 'Home', '2020-12-25', '03:31:07', 305, 305, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '15:31:05', 'delivered', '2020-12-25 10:01:07', '', 0, NULL),
(125, '20201225125', 103, 7, 'Keshav Anand', 'roxxkv@gmail.com', '8340424464', 'Pg3', 'Men hostel', 'University campus', 'Sahebganj', '812007', 'Bihar', 'Bhagalpur', 'Home', '2020-12-25', '04:09:03', 61, 61, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '16:09:02', 'delivered', '2020-12-25 10:39:03', '', 0, NULL),
(126, '20201225126', 103, 7, 'Keshav Anand', 'roxxkv@gmail.com', '8340424464', 'Pg3', 'Men hostel', 'University campus', 'Sahebganj', '812007', 'Bihar', 'Bhagalpur', 'Home', '2020-12-25', '04:13:49', 40, 40, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '16:13:48', 'delivered', '2020-12-25 10:43:49', '', 0, NULL),
(127, '20201225127', 202, 6, 'SWATI Kumari', 'spswatipathak@gmail.com', '7260815400', 'flat no.403,ashiana veena complex', 'chanakya vihar colony', 'beside mangalam hospital', 'chanakya vihar colony', '812003', 'bihar', 'bhagalpur', 'home', '2020-12-25', '04:34:33', 453, 453, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '16:34:31', 'delivered', '2020-12-25 11:04:33', '', 0, NULL),
(128, '20201225128', 139, 7, 'Nitil City hospital', 'snitil62@gmail.com', '8051433444', 'NITIL SINGH', 'C/O GAURAV SINGH', 'NEAR SURYA DIAG', 'MASAKCHAK', '812001', 'BIHAR', 'BHAGALPUR', 'Home', '2020-12-25', '06:02:16', 141, 141, 'INR', 'home', '', '', 'cod', '', '2020-12-25', '18:02:14', 'delivered', '2020-12-25 12:32:16', '', 0, NULL),
(129, '20201226129', 196, 6, 'Mantu Mandal', 'Mantumandal33112@gmail.com', '8434526621', 'Choti hasangang', 'Choti hasangang', 'Kali mandir', 'Mirjanhat', '812005', 'Bihar', 'Bhagalpur', 'Bs-037.0078', '2020-12-26', '08:17:14', 122, 122, 'INR', 'home', '', '', 'cod', '', '2020-12-26', '08:17:11', 'delivered', '2020-12-26 02:47:14', '', 0, NULL),
(130, '20201226130', 172, 7, 'Monika  Raj', 'monikaku246@gmail.com', '8051611851', 'Monika raj, R. M hostel tukul babu campus chhoti khanjarpur', 'Chhoti khanjarpur .tukul  babu campus', 'Dr. Dipti singha clinic', 'SM college road ', '812001', 'Bihar ', 'Bhagalpur', 'Home ', '2020-12-26', '09:27:27', 161, 161, 'INR', 'home', '', '', 'cod', '', '2020-12-26', '09:27:26', 'delivered', '2020-12-26 03:57:27', '', 0, NULL),
(131, '20201226131', 190, 7, 'Anshu Kumar Choudhary', 'awesomechoudhary84@gmail.com', '9934382206', 'Rajendra Nagar colony zero mile bhagalpur MRF tyre showroom opposite ', 'Rajendra Nagar colony zero mile bhagalpur MRF tyre showroom opposite', 'Hotel gopal in', 'Zero mile', '813210', 'Bihar', 'Bhagalpur', 'Home', '2020-12-26', '09:51:50', 101, 101, 'INR', 'home', '', '', 'cod', '', '2020-12-26', '09:51:49', 'delivered', '2020-12-26 04:21:50', '', 0, NULL),
(132, '20201226132', 133, 7, 'Reena Jha', 'ajha62507@gmail.com', '9334584190', 'Naya tola dudhelia, block road, nathnagar ', '', 'Infront of little flower school', 'Nourpur', '812004', 'Bihar', 'Bhagalpur', '...', '2020-12-26', '10:22:40', 132, 132, 'INR', 'home', '', '', 'cod', '', '2020-12-26', '10:22:39', 'delivered', '2020-12-26 04:52:40', '', 0, NULL),
(133, '20201226133', 211, 7, 'Gaurav Sultan', 'gaurav2212000@gmail.com', '7050681184', 'R. N. JHA Lane', 'Nasratkhani', 'Sanjay Lodge', 'Nathnagar', '812004', 'Bihar', 'Bhagalpur', 'Home', '2020-12-26', '06:49:21', 120, 120, 'INR', 'home', '', '', 'cod', '', '2020-12-26', '18:49:19', 'delivered', '2020-12-26 13:19:21', '', 0, NULL),
(134, '20201227134', 196, 6, 'Mantu Mandal', 'Mantumandal33112@gmail.com', '8434526621', 'Choti hasangang', 'Choti hasangang', 'Kali mandir', 'Mirjanhat', '812005', 'Bihar', 'Bhagalpur', 'Bs-037.0078', '2020-12-27', '08:12:36', 101, 101, 'INR', 'home', '', '', 'cod', '', '2020-12-27', '08:12:33', 'delivered', '2020-12-27 02:42:36', '', 0, NULL),
(136, '20201227136', 121, 6, 'Rajesh Narayan Agrawal', 'narayanrajeshagrawal@gmail.com', '8789658806', 'R.N.Agrawal,Rameshwer Niwas.', '', 'Behind Daffodils School.', 'Chunihari Tola', '812002', 'Bihar', 'Bhagalpur', 'Home', '2020-12-27', '01:39:44', 341, 341, 'INR', 'home', '', '', 'cod', '', '2020-12-27', '13:39:43', 'delivered', '2020-12-27 08:09:44', '', 0, NULL),
(137, '20201227137', 212, 7, 'Dr.ashutosh Jaiswal', 'Ashutosha48@gmail.com', '8294211321', '', 'Flat no 401 ,Aahiyana veena complex', 'Chankya vihar colony', 'Zeromile', '812003', 'Bihar', 'Bhagalpur', 'Home', '2020-12-27', '03:30:29', 301, 301, 'INR', 'home', '', '', 'cod', '', '2020-12-27', '15:30:28', 'delivered', '2020-12-27 10:00:29', '', 0, NULL),
(138, '20201228138', 171, 6, 'Sakshi Singh', 'sakshisinghbgp2016@gmail.com', '8709777537', 'RM hostel chhoti khanjarpur', 'Chhoti khanjarpur, Tukul babu campus', 'Dr. Dipti Sinha clinic, sm college road ', 'SM college road , chhoti khanjarpur', '812001', 'Bihar', 'Bhagalpur', 'Home ', '2020-12-28', '07:40:34', 322, 322, 'INR', 'home', '', '', 'cod', '', '2020-12-28', '07:40:34', 'delivered', '2020-12-28 02:10:34', '', 0, NULL),
(139, '20201228139', 172, 6, 'Monika  Raj', 'monikaku246@gmail.com', '8051611851', 'Monika raj, R. M hostel tukul babu campus chhoti khanjarpur', 'Chhoti khanjarpur .tukul  babu campus', 'Dr. Dipti singha clinic', 'SM college road ', '812001', 'Bihar ', 'Bhagalpur', 'Home ', '2020-12-28', '10:53:41', 181, 181, 'INR', 'home', '', '', 'cod', '', '2020-12-28', '10:53:39', 'delivered', '2020-12-28 05:23:41', '', 0, NULL),
(140, '20201228140', 194, 7, 'Ronit Kumar ', 'Ronit2621@gmail.com ', '9123427690', 'Nawab Bagh colony police ', 'Nawab Bagh colony police line tilkamanjhi ', 'Nawab Bagh colony police line ', 'Nawab Bagh colony ', '812001', 'Bihar', 'Bhagalpur ', 'Home', '2020-12-28', '01:53:00', 120, 120, 'INR', 'home', '', '', 'cod', '', '2020-12-28', '13:51:38', 'delivered', '2020-12-28 08:23:00', '', 0, NULL),
(141, '20201229141', 231, 7, 'Deepak Kumar', 'golugulsa0@gmail.com', '7992245816', 'Kishanpur', 'Nathnagar', 'Hanuman mandir ', 'Near bypass ', '812005', 'Bihar', 'Bhagalpur', 'Home', '2020-12-29', '02:01:09', 120, 120, 'INR', 'home', '', '', 'cod', '', '2020-12-29', '14:01:06', 'delivered', '2020-12-29 08:31:09', '', 0, NULL),
(142, '20201229142', 194, 6, 'Ronit Kumar ', 'Ronit2621@gmail.com ', '9123427690', 'Nawab Bagh colony police ', 'Nawab Bagh colony police line tilkamanjhi ', 'Nawab Bagh colony police line ', 'Nawab Bagh colony ', '812001', 'Bihar', 'Bhagalpur ', 'Home', '2020-12-29', '07:51:37', 125, 125, 'INR', 'home', '', '', 'cod', '', '2020-12-29', '19:50:16', 'delivered', '2020-12-29 14:21:37', '', 0, NULL),
(143, '20201229143', 219, 6, 'Vivek Gupta', 'Vivekgupta7901@gmail.com', '7979715305', 'JM 405,DIVYADHAM APARTMENT', 'ADAMPUR GHAT ROAD', 'OPPOSITE KALI MANDIR', 'ADAMPUR', '812001', 'BIHAR', 'BHAGALPUR', 'HOME', '2020-12-29', '10:32:56', 447, 447, 'INR', 'home', '', '', 'razorpay', 'pay_G0MkhRawP3laOb', '2020-12-29', '22:32:54', 'delivered', '2020-12-29 17:02:56', '', 0, NULL),
(144, '20201230144', 151, 6, 'Sarita Pandey', 'a9470025791@gmail.com', '6299223428', 'Indu Mohan Smriti', 'R b s s s road ', 'Dixon more', 'Bhikhanpur ', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-30', '07:42:43', 251, 251, 'INR', 'home', '', '', 'cod', '', '2020-12-30', '07:42:41', 'delivered', '2020-12-30 02:12:43', '', 0, NULL),
(146, '20201230146', 54, 7, 'Gaurav Kumar', 'gauravpandey9852@gmail.com', '9523775883', 'Adampur Ghat ', '', 'Deepdham appartment', 'Adampur ghat', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-30', '02:01:21', 140, 140, 'INR', 'home', '', '', 'cod', '', '2020-12-30', '14:01:19', 'delivered', '2020-12-30 08:31:21', '', 0, NULL),
(147, '20201230147', 255, 6, 'RACHIT  Singhania', 'rachitsinghania52@gmail.com', '8902412383', 'RACHIT SINGHANIA, C/0, SHREE MEDICAL HALL,', 'STATION ROAD,  IN FRONT OF BHAGALPUR RAILWAY STATION', 'NEAR MAKHANBHOG SWEETS', 'STATION ROAD', '812002', 'Bihar', 'Bhagalpur', 'Office', '2020-12-30', '06:58:52', 177, 177, 'INR', 'home', '', '', 'cod', '', '2020-12-30', '18:58:53', 'delivered', '2020-12-30 13:28:52', '', 0, NULL),
(148, '20201230148', 120, 6, 'Bittu Choudhary', 'bittu1827@gmail.com', '7260899302', 'Mundichak ', '', 'Relex gali', 'Na', '812001', 'Bihar', 'Bhagalpur', 'Na', '2020-12-30', '08:57:57', 200, 200, 'INR', 'home', '', '', 'cod', '', '2020-12-30', '20:57:55', 'delivered', '2020-12-30 15:27:57', '', 0, NULL),
(149, '20201231149', 151, 6, 'Sarita Pandey', 'a9470025791@gmail.com', '6299223428', 'Indu Mohan Smriti', 'R b s s s road ', 'Dixon more', 'Bhikhanpur ', '812001', 'Bihar', 'Bhagalpur', 'Home', '2020-12-31', '05:43:23', 120, 120, 'INR', 'home', '', '', 'cod', '', '2020-12-31', '05:43:23', 'delivered', '2020-12-31 00:13:23', '', 0, NULL),
(150, '20201231150', 139, 7, 'Nitil City hospital', 'snitil62@gmail.com', '8051433444', 'NITIL SINGH', 'C/O GAURAV SINGH', 'NEAR SURYA DIAG', 'MASAKCHAK', '812001', 'BIHAR', 'BHAGALPUR', 'Home', '2020-12-31', '02:00:39', 270, 270, 'INR', 'home', '', '', 'cod', '', '2020-12-31', '14:00:38', 'delivered', '2020-12-31 08:30:39', '', 0, NULL),
(151, '20210101151', 144, 6, 'Binod Ji', 'Vinod902@gmail.com', '7258815444', 'S k appartment, flt no 407', 'Opposite post office', 'Main postoffice', 'Bikhanpur', '812001', 'Bihar', 'Bhagalpur', 'Home', '2021-01-01', '03:17:49', 510, 510, 'INR', 'home', '', '', 'cod', '', '2021-01-01', '15:17:48', 'confirmed', '2021-01-01 09:47:49', '', 0, NULL),
(152, '20210101152', 260, NULL, 'amalendu aman', 'amalenduaman@gmail.com', '7321058791', 'sarai,bhagalpur', 'Bhagalpur', 'near amrit jalpan', 'sarai', '812001', 'bihar', 'bhagalpur', 'near amrit jalpan', '2021-01-01', '08:52:32', 121, 121, 'INR', 'home', '', '', 'cod', '', '2021-01-01', '20:52:31', 'out_of_delivery', '2021-01-01 15:22:32', '', 0, NULL),
(153, '20210102153', 255, 7, 'RACHIT  Singhania', 'rachitsinghania52@gmail.com', '8902412383', 'RACHIT SINGHANIA, C/0, SHREE MEDICAL HALL,', 'STATION ROAD,  IN FRONT OF BHAGALPUR RAILWAY STATION', 'NEAR MAKHANBHOG SWEETS', 'STATION ROAD', '812002', 'Bihar', 'Bhagalpur', 'Office', '2021-01-02', '09:59:32', 215, 215, 'INR', 'home', '', '', 'cod', '', '2021-01-02', '09:59:33', 'delivered', '2021-01-02 04:29:32', '', 0, NULL),
(154, '20210103154', 275, 7, 'Santosh Singh', 'santoshkumar.sntsingh@gmail.com', '9534268822', 'Santosh kumar singh', 'C/o Prof Ashok kumar thakur', 'Near Vikramsila setu', 'Chankya vihar colony,Barari', '812003', 'Bihar', 'Bhagalpur', 'Home', '2021-01-03', '07:54:03', 253, 253, 'INR', 'home', '', '', 'cod', '', '2021-01-03', '07:54:02', 'delivered', '2021-01-03 02:24:03', '', 0, NULL),
(155, '20210103155', 143, 7, 'Rahul Pandey', 'r9470025791@gmail.com', '7011303977', 'Indu mohan smriti', 'Adbhut hanuman mandir', 'Ishakchak, petrol pump', 'RBSSS Sahay road', '812001', 'Bihar', 'Bhagalpur', 'Home', '2021-01-03', '09:31:20', 250, 250, 'INR', 'home', '', '', 'cod', '', '2021-01-03', '09:31:18', 'delivered', '2021-01-03 04:01:20', '', 0, NULL),
(157, '20210103157', 277, 7, 'Shubhalakshmi  Mahata ', 'Shubhamahata.bts@gmail.com ', '7004733838', 'House #BC-037-0263, Satish Sarkar Lane, Sarat Chandra Path ', '', 'Near K K Nursing Home', 'Mashakchak', '812001', 'BIHAR', 'BHAGALPUR', 'Home', '2021-01-03', '03:37:36', 136, 136, 'INR', 'home', '', '', 'razorpay', 'pay_G0MkhRawP3laOb', '2021-01-03', '15:37:31', 'delivered', '2021-01-03 10:07:36', '', 0, NULL),
(159, '20210103159', 274, NULL, 'Rohan Yadav', 'Rohankapri67@gmail.com ', '8002193731', 'Shail niwas', 'Shailbagh colony,Bounsi road', 'Behind shaileshwer nath mandir', 'Aliganj , shailbagh,bounsi road', '812005', 'Bihar', 'Bhagalpur ', 'Home', '2021-01-03', '06:10:18', 190, 190, 'INR', 'home', '', '', 'cod', '', '2021-01-03', '18:10:16', 'pending', '2021-01-03 12:40:18', '', 0, NULL),
(160, '20210104160', 54, NULL, 'Gaurav Kumar', 'gauravpandey9852@gmail.com', '9523775883', 'Adampur Ghat ', '', 'Deepdham appartment', 'Adampur ghat', '812001', 'Bihar', 'Bhagalpur', 'Home', '2021-01-04', '02:17:49', 760, 760, 'INR', 'home', '', '', 'cod', '', '2021-01-04', '14:17:48', 'pending', '2021-01-04 08:47:49', '', 0, NULL),
(161, '20210104161', 255, 6, 'RACHIT  Singhania', 'rachitsinghania52@gmail.com', '8902412383', 'RACHIT SINGHANIA, C/0, SHREE MEDICAL HALL,', 'STATION ROAD,  IN FRONT OF BHAGALPUR RAILWAY STATION', 'NEAR MAKHANBHOG SWEETS', 'STATION ROAD', '812002', 'Bihar', 'Bhagalpur', 'Office', '2021-01-04', '02:29:25', 382, 382, 'INR', 'home', '', '', 'cod', '', '2021-01-04', '14:29:26', 'delivered', '2021-01-04 08:59:25', '', 0, NULL),
(162, '20210105162', 133, NULL, 'Reena Jha', 'ajha62507@gmail.com', '9334584190', 'Naya tola dudhelia, block road, nathnagar ', '', 'Infront of little flower school', 'Nourpur', '812004', 'Bihar', 'Bhagalpur', '...', '2021-01-05', '01:26:25', 120, 120, 'INR', 'home', '', '', 'cod', '', '2021-01-05', '13:26:23', 'delivered', '2021-01-05 07:56:25', '', 0, NULL),
(163, '20210105163', 121, NULL, 'Rajesh Narayan Agrawal', 'narayanrajeshagrawal@gmail.com', '8789658806', 'R.N.Agrawal,Rameshwer Niwas.', '', 'Behind Daffodils School.', 'Chunihari Tola', '812002', 'Bihar', 'Bhagalpur', 'Home', '2021-01-05', '03:58:28', 320, 320, 'INR', 'home', '', '', 'cod', '', '2021-01-05', '15:58:28', 'delivered', '2021-01-05 10:28:28', '', 0, NULL),
(164, '20210106164', 255, 6, 'RACHIT  Singhania', 'rachitsinghania52@gmail.com', '8902412383', 'RACHIT SINGHANIA, C/0, SHREE MEDICAL HALL,', 'STATION ROAD,  IN FRONT OF BHAGALPUR RAILWAY STATION', 'NEAR MAKHANBHOG SWEETS', 'STATION ROAD', '812002', 'Bihar', 'Bhagalpur', 'Office', '2021-01-06', '05:09:42', 508, 508, 'INR', 'home', '', '', 'cod', '', '2021-01-06', '17:09:44', 'delivered', '2021-01-06 11:39:42', '', 0, NULL),
(165, '20210106165', 274, 7, 'Rohan Yadav', 'Rohankapri67@gmail.com ', '8002193731', 'Shail niwas', 'Shailbagh colony,Bounsi road', 'Behind shaileshwer nath mandir', 'Aliganj , shailbagh,bounsi road', '812005', 'Bihar', 'Bhagalpur ', 'Home', '2021-01-06', '05:11:52', 177, 177, 'INR', 'home', '', '', 'razorpay', 'pay_G0MkhRawP3laOb', '2021-01-06', '17:11:50', 'delivered', '2021-01-06 11:41:52', '', 0, NULL),
(166, '20210106166', 255, 6, 'RACHIT  Singhania', 'rachitsinghania52@gmail.com', '8902412383', 'RACHIT SINGHANIA, C/0, SHREE MEDICAL HALL,', 'STATION ROAD,  IN FRONT OF BHAGALPUR RAILWAY STATION', 'NEAR MAKHANBHOG SWEETS', 'STATION ROAD', '812002', 'Bihar', 'Bhagalpur', 'Office', '2021-01-06', '05:36:30', 101, 101, 'INR', 'home', '', '', 'cod', '', '2021-01-06', '17:36:32', 'delivered', '2021-01-06 12:06:30', '', 0, NULL),
(167, '20210106167', 285, 6, 'Saurabh  Suman', 'sumansaurav721@gmail.com ', '7903004585', 'Manik sarkar chowk behind ', 'K.k.nursing home Gaganchumbi Bhawan', 'Manik sarkar chowk ', 'Manik sarkar chowk ', '812001', 'Bihar', 'Bhagalpur ', 'Home', '2021-01-06', '06:53:01', 110, 110, 'INR', 'home', '', '', 'cod', '', '2021-01-06', '18:53:03', 'delivered', '2021-01-06 13:23:01', '', 0, NULL),
(168, '20210106168', 217, 6, 'Shanu Singh', 'sanu.saurav420@gmail.com ', '7209829177', 'New colony,choti khanjarpur ', '', 'Mothers kitchen ', 'Choti khanjarpur, manali', '812001', 'Bihar', 'Bhagalpur', 'Home', '2021-01-06', '07:20:36', 170, 170, 'INR', 'home', '', '', 'cod', '', '2021-01-06', '19:20:34', 'delivered', '2021-01-06 13:50:36', '', 0, NULL),
(169, '20210107169', 285, 6, 'Saurabh  Suman', 'sumansaurav721@gmail.com ', '7903004585', 'Manik sarkar chowk behind ', 'K.k.nursing home Gaganchumbi Bhawan', 'Manik sarkar chowk ', 'Manik sarkar chowk ', '812001', 'Bihar', 'Bhagalpur ', 'Home', '2021-01-07', '08:18:34', 106, 106, 'INR', 'home', '', '', 'cod', '', '2021-01-07', '08:18:35', 'delivered', '2021-01-07 02:48:34', '', 0, NULL),
(170, '20210107170', 255, 7, 'RACHIT  Singhania', 'rachitsinghania52@gmail.com', '8902412383', 'RACHIT SINGHANIA, C/0, SHREE MEDICAL HALL,', 'STATION ROAD,  IN FRONT OF BHAGALPUR RAILWAY STATION', 'NEAR MAKHANBHOG SWEETS', 'STATION ROAD', '812002', 'Bihar', 'Bhagalpur', 'Office', '2021-01-07', '10:34:14', 240, 240, 'INR', 'home', '', '', 'cod', '', '2021-01-07', '10:34:16', 'confirmed', '2021-01-07 05:04:14', '', 0, NULL),
(173, '20210113173', 255, NULL, 'RACHIT  Singhania', 'rachitsinghania52@gmail.com', '8902412383', 'RACHIT SINGHANIA, C/0, SHREE MEDICAL HALL,', 'STATION ROAD,  IN FRONT OF BHAGALPUR RAILWAY STATION', 'NEAR MAKHANBHOG SWEETS', 'STATION ROAD', '812002', 'Bihar', 'Bhagalpur', 'Office', '2021-01-13', '09:37:47', 411, 411, 'INR', 'home', '', '', 'cod', '', '2021-01-13', '21:37:44', 'pending', '2021-01-13 16:07:47', '', 0, NULL),
(174, '20210113174', 275, NULL, 'Santosh Singh', 'santoshkumar.sntsingh@gmail.com', '9534268822', 'Santosh kumar singh', 'C/o Prof Ashok kumar thakur', 'Near Vikramsila setu', 'Chankya vihar colony,Barari', '812003', 'Bihar', 'Bhagalpur', 'Home', '2021-01-13', '10:02:08', 296, 296, 'INR', 'home', '', '', 'cod', '', '2021-01-13', '22:02:05', 'pending', '2021-01-13 16:32:08', '', 0, NULL),
(175, '20210113175', 73, NULL, 'Sourab Kumar', 'Sr.tech03@gmai.com', '6205195091', 'Bikhanpir', 'Oppt blind school', 'Blind school', 'Bikhanpur', '812001', 'Bihar', 'Bhagalpur', 'Office', '2021-01-13', '10:44:08', 120, 120, 'INR', 'home', '', '', 'cod', '', '2021-01-13', '22:44:06', 'pending', '2021-01-13 17:14:08', '', 0, NULL),
(176, '20210114176', 143, NULL, 'Rahul Pandey', 'r9470025791@gmail.com', '7011303977', 'Indu mohan smriti', 'Adbhut hanuman mandir', 'Ishakchak, petrol pump', 'RBSSS Sahay road', '812001', 'Bihar', 'Bhagalpur', 'Home', '2021-01-14', '08:09:20', 160, 160, 'INR', 'home', '', '', 'cod', '', '2021-01-14', '08:09:18', 'pending', '2021-01-14 02:39:20', '', 0, NULL),
(177, '20210114177', 120, NULL, 'Bittu Choudhary', 'bittu1827@gmail.com', '7260899302', 'Mundichak ', '', 'Relex gali', 'Na', '812001', 'Bihar', 'Bhagalpur', 'Na', '2021-01-14', '07:57:55', 120, 120, 'INR', 'home', '', '', 'cod', '', '2021-01-14', '19:57:53', 'pending', '2021-01-14 14:27:55', '', 0, NULL),
(178, '20210115178', 202, NULL, 'SWATI Kumari', 'spswatipathak@gmail.com', '7260815400', 'flat no.403,ashiana veena complex', 'chanakya vihar colony', 'beside mangalam hospital', 'chanakya vihar colony', '812003', 'bihar', 'bhagalpur', 'home', '2021-01-15', '08:10:49', 155, 155, 'INR', 'home', '', '', 'cod', '', '2021-01-15', '08:10:47', 'pending', '2021-01-15 02:40:49', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_title` varchar(50) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total` float NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `product_title`, `quantity`, `total`, `price`) VALUES
(1, 1, 1, 'Cauliflower', 10, 1000, 100),
(2, 1, 2, 'Potato', 11, 1650, 150),
(3, 1, 3, ' टमाटर', 2, 400, 200),
(4, 2, 2, 'Potato', 2, 240, 120),
(5, 2, 4, 'Lady\'s Finger', 1, 25, 25),
(6, 3, 4, 'Lady\'s Finger', 1, 25, 25),
(7, 4, 2, 'Potato', 2, 240, 120),
(8, 4, 3, ' टमाटर', 1, 50, 50),
(9, 4, 4, 'Lady\'s Finger', 1, 25, 25),
(10, 5, 159, NULL, 3, 360, 120),
(11, 5, 158, NULL, 6, 360, 60),
(12, 6, 2, 'Potato', 3, 360, 120),
(13, 6, 5, 'Apples', 6, 360, 60),
(14, 7, 2, 'Potato', 3, 360, 120),
(15, 7, 5, 'Apples', 6, 360, 60),
(16, 8, 1, 'Cauliflower', 1, 20, 20),
(17, 8, 2, 'Potato', 1, 120, 120),
(18, 9, 3, ' टमाटर', 1, 50, 50),
(19, 9, 4, 'Lady\'s Finger', 1, 25, 25),
(20, 9, 5, 'Apples', 1, 60, 60),
(21, 9, 6, 'Bananas', 1, 20, 20),
(22, 10, 4, 'Lady\'s Finger', 1, 25, 25),
(23, 11, 1, 'Cauliflower', 1, 20, 20),
(24, 11, 2, 'Potato', 1, 120, 120),
(25, 11, 3, ' टमाटर', 1, 50, 50),
(26, 11, 4, 'Lady\'s Finger', 1, 25, 25),
(27, 12, 2, 'Potato', 1, 120, 120),
(28, 13, 2, 'Potato', 1, 120, 120),
(29, 14, 2, 'Potato', 1, 120, 120),
(30, 15, 1, 'Cauliflower', 1, 20, 20),
(31, 15, 2, 'Potato', 1, 120, 120),
(32, 16, 5, 'Apples', 3, 180, 60),
(33, 17, 1, 'Cauliflower', 10, 1000, 100),
(34, 17, 2, 'Potato', 11, 1650, 150),
(35, 17, 3, ' टमाटर', 2, 400, 200),
(36, 18, 4, 'Lady\'s Finger', 1, 25, 25),
(37, 19, 2, 'Potato', 1, 120, 120),
(38, 20, 4, 'Lady\'s Finger', 1, 25, 25),
(39, 21, 2, 'Potato', 1, 120, 120),
(40, 22, 2, 'Potato', 1, 120, 120),
(41, 22, 4, 'Lady\'s Finger', 1, 25, 25),
(42, 24, 1, 'Cauliflower', 4, 80, 20),
(43, 24, 2, 'Potato', 2, 240, 120),
(44, 24, 4, 'Lady\'s Finger', 1, 25, 25),
(45, 25, 2, 'Potato', 1, 120, 120),
(46, 26, 2, 'Potato', 2, 240, 120),
(47, 26, 4, 'Lady\'s Finger', 2, 50, 25),
(48, 27, 2, 'Potato', 1, 120, 120),
(49, 28, 1, 'Cauliflower', 2, 40, 20),
(50, 29, 2, 'Potato', 1, 120, 120),
(51, 30, 2, 'Potato', 2, 240, 120),
(52, 31, 2, 'Potato', 1, 120, 120),
(53, 32, 1, 'Cauliflower', 1, 20, 20),
(54, 33, 2, 'Potato', 1, 120, 120),
(55, 34, 2, 'Potato', 1, 120, 120),
(56, 35, 4, 'Lady\'s Finger', 1, 25, 25),
(57, 36, 4, 'Lady\'s Finger', 1, 25, 25),
(58, 37, 2, 'Potato', 3, 360, 120),
(59, 38, 2, 'Potato', 3, 360, 120),
(60, 39, 2, 'Potato', 1, 120, 120),
(61, 40, 2, 'Potato', 1, 120, 120),
(62, 40, 3, ' टमाटर', 1, 50, 50),
(63, 40, 4, 'Lady\'s Finger', 1, 25, 25),
(64, 41, 6, 'Bananas', 2, 40, 20),
(65, 42, 1, 'Cauliflower', 1, 20, 20),
(66, 42, 3, ' टमाटर', 1, 50, 50),
(67, 42, 4, 'Lady\'s Finger', 1, 25, 25),
(68, 42, 5, 'Apples', 1, 60, 60),
(69, 43, 2, 'Potato', 1, 120, 120),
(70, 44, 1, 'Cauliflower', 1, 20, 20),
(71, 44, 2, 'Potato', 1, 120, 120),
(72, 44, 3, ' टमाटर', 1, 50, 50),
(73, 45, 1, 'Cauliflower', 2, 40, 20),
(74, 45, 4, 'Lady\'s Finger', 2, 50, 25),
(75, 46, 4, 'Lady\'s Finger', 2, 50, 25),
(76, 47, 2, 'Potato', 1, 40, 40),
(77, 48, 2, 'Potato', 2, 80, 40),
(78, 49, 2, 'Potato', 2, 80, 40),
(79, 49, 40, 'Banana', 1, 10, 10),
(80, 50, 40, 'Banana', 2, 20, 10),
(81, 50, 42, 'Apple', 1, 120, 120),
(82, 51, 81, 'Cheeku', 1, 100, 100),
(83, 52, 32, 'Drumstick / Sahjan Phali / Sajana Chuin', 1, 100, 100),
(84, 53, 48, 'Coconut Tender / Hara Nariyal / Paida', 1, 30, 30),
(85, 54, 4, 'Lady\'s Finger (Bhindi)', 1, 40, 40),
(86, 54, 41, 'Ripe Papaya / Papita', 2, 80, 40),
(87, 54, 2, 'Potato', 1, 40, 40),
(88, 55, 42, 'Apple', 2, 240, 120),
(89, 56, 32, 'Drumstick / Sahjan Phali / Sajana Chuin', 1, 50, 50),
(90, 57, 48, 'Coconut Tender / Hara Nariyal / Paida', 1, 30, 30),
(91, 58, 25, 'Ginger / Adarak / Ada', 1, 6, 6),
(92, 58, 38, 'Broccoli', 1, 40, 40),
(93, 59, 52, 'Button Mushroom', 1, 60, 60),
(94, 60, 11, 'Spinch (Palak Sag)', 2, 40, 20),
(95, 61, 11, 'Spinch (Palak Sag)', 1, 20, 20),
(96, 62, 2, 'Potato', 1, 40, 40),
(97, 63, 9, 'Dhaniya patta', 1, 10, 10),
(98, 64, 43, 'Pomegranate / Anaar / Dalimba', 5, 700, 140),
(99, 65, 48, 'Coconut Tender / Hara Nariyal / Paida', 1, 30, 30),
(100, 66, 91, 'Pointed gourd (Parval)', 5, 300, 60),
(101, 67, 40, 'Banana', 1, 10, 10),
(102, 68, 25, 'Ginger / Adarak / Ada', 1, 15, 15),
(103, 69, 2, 'Potato', 1, 40, 40),
(104, 69, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 20, 20),
(105, 69, 26, 'Garlic / Lahasun / Rasuna', 1, 30, 30),
(106, 70, 42, 'Apple', 1, 120, 120),
(107, 70, 3, ' Tomato (Tamatar)', 1, 35, 35),
(108, 70, 17, 'Radish (Mooli)', 1, 10, 10),
(109, 70, 19, 'Pea (Matar)', 1, 50, 50),
(110, 70, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 20, 20),
(111, 70, 88, 'Onion (Pyaj)', 1, 50, 50),
(112, 70, 2, 'Potato', 3, 120, 40),
(113, 70, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 18, 18),
(114, 70, 35, 'Tentuli ( Tamarind with Seed) / Imli / Tentuli', 1, 10, 10),
(115, 70, 4, 'Lady\'s Finger (Bhindi)', 1, 40, 40),
(116, 70, 8, 'Brinjal/Baingan', 1, 30, 30),
(117, 71, 40, 'Banana', 1, 10, 10),
(118, 72, 9, 'Dhaniya patta', 1, 10, 10),
(119, 72, 17, 'Radish (Mooli)', 1, 10, 10),
(120, 72, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 20, 20),
(121, 72, 24, 'Green Chili / Haree Mirch / Kancha Lanka', 1, 15, 15),
(122, 73, 19, 'Pea (Matar)', 1, 50, 50),
(123, 74, 8, 'Brinjal/Baingan', 1, 30, 30),
(124, 74, 3, ' Tomato (Tamatar)', 1, 35, 35),
(125, 74, 19, 'Pea (Matar)', 1, 50, 50),
(126, 75, 85, 'Guava (Amrud)', 3, 240, 80),
(127, 76, 3, ' Tomato (Tamatar)', 1, 35, 35),
(128, 76, 18, 'Runner beans (Sem)', 1, 30, 30),
(129, 77, 85, 'Guava (Amrud)', 3, 300, 100),
(130, 78, 3, ' Tomato (Tamatar)', 1, 35, 35),
(131, 78, 12, ' Bitter gourd (karela)', 1, 40, 40),
(132, 78, 9, 'Dhaniya patta', 1, 10, 10),
(133, 78, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 18, 18),
(134, 78, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 20, 20),
(135, 78, 30, 'Methi / Fenugreek leaves', 2, 8, 4),
(136, 79, 42, 'Apple', 1, 140, 140),
(137, 80, 42, 'Apple', 1, 140, 140),
(138, 81, 8, 'Brinjal/Baingan', 1, 30, 30),
(139, 82, 109, 'Pea (Matar) (Ranchi)', 1, 60, 60),
(140, 82, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 20, 20),
(141, 82, 28, 'Lemon / Neebu / Lembu', 1, 10, 10),
(142, 82, 106, 'Potato (Gulabbag)', 1, 25, 25),
(143, 82, 16, 'Carrot (Gagar)', 1, 35, 35),
(144, 82, 113, 'Apple', 1, 100, 100),
(145, 83, 48, 'Coconut Tender / Hara Nariyal / Paida', 1, 40, 40),
(146, 84, 110, 'Banana / Kela (Yellow)', 1, 50, 50),
(147, 84, 41, 'Ripe Papaya / Papita (Hybrid)', 1, 40, 40),
(148, 84, 112, 'Apple', 1, 80, 80),
(149, 85, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 18, 18),
(150, 85, 3, 'Tomato (Hasdia)', 1, 40, 40),
(151, 86, 16, 'Carrot (Gagar)', 1, 35, 35),
(152, 87, 2, 'Potato (Hasdia)', 2, 80, 40),
(153, 88, 4, 'Lady\'s Finger (Bhindi)', 1, 60, 60),
(154, 89, 2, 'Potato (Hasdia)', 2, 80, 40),
(155, 89, 108, 'Onion (Hansdiha)', 2, 80, 40),
(156, 89, 26, 'Garlic / Lahasun / Rasuna', 1, 30, 30),
(157, 89, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 20, 20),
(158, 89, 3, 'Tomato (Hasdia)', 1, 40, 40),
(159, 89, 99, 'Pumpkin (Kaddu)', 1, 40, 40),
(160, 89, 16, 'Carrot (Gagar)', 1, 35, 35),
(161, 89, 15, 'Shimla Mirch (Capsicum)', 1, 25, 25),
(162, 90, 3, 'Tomato (Hasdia)', 1, 40, 40),
(163, 91, 11, 'Spinch (Palak Sag)', 1, 20, 20),
(164, 91, 48, 'Coconut Tender / Hara Nariyal / Paida', 1, 40, 40),
(165, 92, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 30, 30),
(166, 92, 2, 'Potato (Hasdia)', 1, 40, 40),
(167, 92, 8, 'Brinjal/Baingan', 1, 30, 30),
(168, 93, 43, 'Pomegranate / Anaar / Dalimba (Big Size)', 1, 200, 200),
(169, 94, 3, 'Tomato (Hasdia)', 1, 40, 40),
(170, 94, 9, 'Dhaniya patta', 1, 10, 10),
(171, 94, 19, 'Pea (Matar) (local)', 1, 50, 50),
(172, 95, 3, 'Tomato (Hasdia)', 1, 40, 40),
(173, 95, 9, 'Dhaniya patta', 1, 10, 10),
(174, 95, 19, 'Pea (Matar) (local)', 1, 50, 50),
(175, 96, 48, 'Coconut Tender / Hara Nariyal / Paida', 1, 40, 40),
(176, 97, 35, 'Tentuli ( Tamarind with Seed) / Imli / Tentuli', 1, 10, 10),
(177, 98, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 20, 20),
(178, 98, 16, 'Carrot (Gagar)', 1, 40, 40),
(179, 99, 15, 'Shimla Mirch (Capsicum)', 1, 30, 30),
(180, 99, 7, 'Beans', 1, 50, 50),
(181, 100, 91, 'Pointed gourd (Parval)', 1, 60, 60),
(182, 100, 29, 'Green Banana / Kachcha Kela / Kancha Kadali', 1, 50, 50),
(183, 101, 113, 'Apple', 1, 120, 120),
(184, 101, 114, 'Pomegranate / Anaar / Dalimba (SmallSize)', 1, 160, 160),
(185, 102, 7, 'Beans', 1, 50, 50),
(186, 102, 2, 'Potato (Hasdia)', 1, 40, 40),
(187, 103, 101, 'Oal / Elephant Foot (Local)', 4, 400, 100),
(188, 104, 33, 'Oal / Elephant Foot (Madrashi)', 2, 120, 60),
(189, 105, 2, 'Potato (Hasdia)', 1, 21, 21),
(190, 105, 108, 'Onion (Hansdiha)', 1, 40, 40),
(191, 105, 25, 'Ginger / Adarak / Ada', 1, 15, 15),
(192, 105, 26, 'Garlic / Lahasun / Rasuna', 1, 30, 30),
(193, 105, 28, 'Lemon / Neebu / Lembu', 1, 10, 10),
(194, 105, 90, 'Kathal (Jackfruit)', 1, 150, 150),
(195, 105, 41, 'Ripe Papaya / Papita (Hybrid)', 1, 40, 40),
(196, 105, 113, 'Apple', 1, 120, 120),
(197, 105, 115, 'Mosambi', 1, 80, 80),
(198, 106, 2, 'Potato (Hasdia)', 2, 42, 21),
(199, 106, 108, 'Onion (Hansdiha)', 1, 40, 40),
(200, 106, 25, 'Ginger / Adarak / Ada', 1, 15, 15),
(201, 106, 26, 'Garlic / Lahasun / Rasuna', 1, 30, 30),
(202, 106, 28, 'Lemon / Neebu / Lembu', 1, 10, 10),
(203, 106, 90, 'Kathal (Jackfruit)', 1, 150, 150),
(204, 106, 41, 'Ripe Papaya / Papita (Hybrid)', 1, 40, 40),
(205, 106, 113, 'Apple', 1, 120, 120),
(206, 106, 115, 'Mosambi', 1, 80, 80),
(207, 107, 110, 'Banana / Kela (Yellow)', 1, 50, 50),
(208, 107, 113, 'Apple', 1, 120, 120),
(209, 108, 113, 'Apple', 1, 120, 120),
(210, 108, 15, 'Shimla Mirch (Capsicum)', 2, 50, 25),
(211, 109, 2, 'Potato (Hasdia)', 5, 105, 21),
(212, 110, 9, 'Dhaniya patta', 1, 10, 10),
(213, 110, 19, 'Pea (Matar) (local)', 1, 40, 40),
(214, 110, 15, 'Shimla Mirch (Capsicum)', 1, 25, 25),
(215, 110, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 30, 30),
(216, 110, 23, 'Beetroot / Chukandar', 1, 30, 30),
(217, 110, 85, 'Guava (Amrud)Local', 1, 60, 60),
(218, 110, 24, 'Green Chili / Haree Mirch / Kancha Lanka', 1, 15, 15),
(219, 110, 16, 'Carrot (Gagar)', 1, 40, 40),
(220, 110, 17, 'Radish (Mooli)', 1, 10, 10),
(221, 110, 18, 'Runner beans (Sem)', 1, 30, 30),
(222, 111, 18, 'Runner beans (Sem)', 1, 30, 30),
(223, 111, 2, 'Potato (Hasdia)', 4, 84, 21),
(224, 112, 48, 'Coconut Tender / Hara Nariyal / Paida', 1, 40, 40),
(225, 112, 110, 'Banana / Kela (Yellow)', 1, 50, 50),
(226, 112, 18, 'Runner beans (Sem)', 1, 30, 30),
(227, 113, 3, 'Tomato', 1, 35, 35),
(228, 113, 19, 'Pea (Matar) (local)', 1, 40, 40),
(229, 113, 26, 'Garlic / Lahasun / Rasuna', 4, 120, 30),
(230, 114, 2, 'Potato (Hasdia)', 2, 42, 21),
(231, 114, 88, 'Onion (Ranchi)', 1, 40, 40),
(232, 114, 108, 'Onion (Hansdiha)', 1, 40, 40),
(233, 114, 41, 'Ripe Papaya / Papita (Hybrid)', 1, 40, 40),
(234, 114, 113, 'Apple', 1, 120, 120),
(235, 114, 48, 'Coconut Tender / Hara Nariyal / Paida', 1, 40, 40),
(236, 115, 19, 'Pea (Matar) (local)', 1, 40, 40),
(237, 115, 13, 'Pumpkin (Kaddu)', 1, 40, 40),
(238, 115, 91, 'Pointed gourd (Parval)', 1, 60, 60),
(239, 116, 2, 'Potato (Hasdia)', 1, 21, 21),
(240, 116, 9, 'Dhaniya patta', 1, 10, 10),
(241, 116, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 30, 30),
(242, 116, 3, 'Tomato', 1, 35, 35),
(243, 116, 108, 'Onion (Hansdiha)', 1, 40, 40),
(244, 116, 15, 'Shimla Mirch (Capsicum)', 1, 25, 25),
(245, 117, 88, 'Onion (Ranchi)', 1, 40, 40),
(246, 117, 19, 'Pea (Matar) (local)', 1, 40, 40),
(247, 117, 11, 'Spinch (Palak Sag)', 2, 60, 30),
(248, 117, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 30, 30),
(249, 118, 3, 'Tomato', 1, 35, 35),
(250, 118, 19, 'Pea (Matar) (local)', 1, 40, 40),
(251, 118, 8, 'Brinjal/Baingan', 1, 22, 22),
(252, 118, 9, 'Dhaniya patta', 1, 10, 10),
(253, 118, 13, 'Pumpkin (Kaddu)', 1, 40, 40),
(254, 118, 11, 'Spinch (Palak Sag)', 1, 30, 30),
(255, 118, 16, 'Carrot (Gagar)', 1, 40, 40),
(256, 118, 17, 'Radish (Mooli)', 1, 10, 10),
(257, 118, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 30, 30),
(258, 118, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 18, 18),
(259, 118, 18, 'Runner beans (Sem)', 1, 30, 30),
(260, 119, 2, 'Potato (Hasdia)', 3, 63, 21),
(261, 119, 19, 'Pea (Matar) (local)', 1, 40, 40),
(262, 119, 3, 'Tomato', 1, 35, 35),
(263, 119, 9, 'Dhaniya patta', 1, 10, 10),
(264, 119, 18, 'Runner beans (Sem)', 1, 30, 30),
(265, 119, 91, 'Pointed gourd (Parval)', 1, 60, 60),
(266, 119, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 30, 30),
(267, 120, 88, 'Onion (Ranchi)', 1, 40, 40),
(268, 120, 3, 'Tomato', 1, 35, 35),
(269, 120, 19, 'Pea (Matar) (local)', 1, 40, 40),
(270, 120, 15, 'Shimla Mirch (Capsicum)', 1, 25, 25),
(271, 120, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 30, 30),
(272, 120, 2, 'Potato (Hasdia)', 1, 21, 21),
(273, 121, 119, 'Cake', 1, 380, 380),
(274, 122, 2, 'Potato (Hasdia)', 2, 42, 21),
(275, 122, 4, 'Lady\'s Finger (Bhindi)', 1, 70, 70),
(276, 122, 19, 'Pea (Matar) (local)', 1, 40, 40),
(277, 123, 119, 'Cake', 1, 380, 380),
(278, 124, 3, 'Tomato', 1, 35, 35),
(279, 124, 18, 'Runner beans (Sem)', 1, 30, 30),
(280, 124, 28, 'Lemon / Neebu / Lembu', 1, 10, 10),
(281, 124, 25, 'Ginger / Adarak / Ada', 1, 15, 15),
(282, 124, 24, 'Green Chili / Haree Mirch / Kancha Lanka', 1, 15, 15),
(283, 124, 29, 'Green Banana / Kachcha Kela / Kancha Kadali', 1, 60, 60),
(284, 124, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 20, 20),
(285, 124, 113, 'Apple', 1, 120, 120),
(286, 125, 88, 'Onion', 1, 40, 40),
(287, 125, 2, 'Potato (Hasdia)', 1, 21, 21),
(288, 126, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 40, 40),
(289, 127, 2, 'Potato (Hasdia)', 3, 63, 21),
(290, 127, 3, 'Tomato', 1, 35, 35),
(291, 127, 88, 'Onion', 2, 80, 40),
(292, 127, 19, 'Pea (Matar) (local)', 1, 40, 40),
(293, 127, 16, 'Carrot (Gagar)', 1, 40, 40),
(294, 127, 17, 'Radish (Mooli)', 2, 20, 10),
(295, 127, 18, 'Runner beans (Sem)', 1, 30, 30),
(296, 127, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 40, 40),
(297, 127, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 20, 20),
(298, 127, 25, 'Ginger / Adarak / Ada', 1, 15, 15),
(299, 127, 26, 'Garlic / Lahasun / Rasuna', 2, 60, 30),
(300, 127, 28, 'Lemon / Neebu / Lembu', 1, 10, 10),
(301, 128, 122, 'Carrot (Gagar)', 1, 21, 21),
(302, 128, 29, 'Green Banana / Kachcha Kela / Kancha Kadali', 1, 60, 60),
(303, 128, 45, 'Orange', 1, 60, 60),
(304, 129, 2, 'Potato (Hasdia)', 1, 21, 21),
(305, 129, 88, 'Onion', 1, 40, 40),
(306, 129, 124, 'Pea (Matar) (Ranchi)', 1, 31, 31),
(307, 129, 15, 'Shimla Mirch (Capsicum)', 1, 30, 30),
(308, 130, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 20, 20),
(309, 130, 2, 'Potato (Hasdia)', 1, 21, 21),
(310, 130, 113, 'Apple', 1, 120, 120),
(311, 131, 19, 'Pea (Matar) (local)', 1, 40, 40),
(312, 131, 9, 'Dhaniya patta', 1, 10, 10),
(313, 131, 8, 'Brinjal/Baingan', 1, 30, 30),
(314, 131, 122, 'Carrot (Gagar)', 1, 21, 21),
(315, 132, 15, 'Shimla Mirch (Capsicum)', 1, 30, 30),
(316, 132, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 20, 20),
(317, 132, 2, 'Potato (Hasdia)', 2, 42, 21),
(318, 132, 19, 'Pea (Matar) (local)', 1, 40, 40),
(319, 133, 113, 'Apple', 1, 120, 120),
(320, 134, 3, 'Tomato', 2, 70, 35),
(321, 134, 124, 'Pea (Matar) (Ranchi)', 1, 31, 31),
(322, 135, 119, 'Cake', 1, 380, 380),
(323, 136, 113, 'Apple', 1, 120, 120),
(324, 136, 45, 'Orange', 1, 60, 60),
(325, 136, 2, 'Potato (Hasdia)', 1, 21, 21),
(326, 136, 19, 'Pea (Matar) (local)', 1, 40, 40),
(327, 136, 16, 'Carrot (Gagar)', 1, 40, 40),
(328, 136, 47, 'Watermelon Long / Tarbooj / Tarbhooja', 1, 60, 60),
(329, 137, 11, 'Spinch (Palak Sag)', 1, 30, 30),
(330, 137, 19, 'Pea (Matar) (local)', 1, 40, 40),
(331, 137, 2, 'Potato (Hasdia)', 1, 21, 21),
(332, 137, 16, 'Carrot (Gagar)', 2, 80, 40),
(333, 137, 28, 'Lemon / Neebu / Lembu', 2, 20, 10),
(334, 137, 9, 'Dhaniya patta', 2, 20, 10),
(335, 137, 17, 'Radish (Mooli)', 2, 20, 10),
(336, 137, 8, 'Brinjal/Baingan', 1, 30, 30),
(337, 137, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 40, 40),
(338, 138, 120, 'Lady\'s Finger (Bhindi)', 1, 35, 35),
(339, 138, 2, 'Potato (Hasdia)', 2, 50, 25),
(340, 138, 124, 'Pea (Matar) (Ranchi)', 1, 31, 31),
(341, 138, 15, 'Shimla Mirch (Capsicum)', 1, 41, 41),
(342, 138, 29, 'Green Banana / Kachcha Kela / Kancha Kadali', 1, 60, 60),
(343, 138, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 40, 40),
(344, 138, 3, 'Tomato', 1, 35, 35),
(345, 138, 18, 'Runner beans (Sem)', 1, 30, 30),
(346, 139, 2, 'Potato (Hasdia)', 2, 50, 25),
(347, 139, 88, 'Onion', 1, 40, 40),
(348, 139, 123, 'Pea (Matar) (local)', 1, 21, 21),
(349, 139, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 40, 40),
(350, 139, 26, 'Garlic / Lahasun / Rasuna', 1, 30, 30),
(351, 140, 118, 'Strawberry', 1, 120, 120),
(352, 141, 113, 'Apple', 1, 120, 120),
(353, 142, 2, 'Potato (Hasdia)', 5, 125, 25),
(354, 143, 88, 'Onion', 2, 80, 40),
(355, 143, 2, 'Potato (Hasdia)', 2, 50, 25),
(356, 143, 19, 'Pea (Matar) (local)', 1, 40, 40),
(357, 143, 120, 'Lady\'s Finger (Bhindi)', 1, 40, 40),
(358, 143, 125, 'Brinjal/Baingan', 1, 16, 16),
(359, 143, 15, 'Shimla Mirch (Capsicum)', 1, 41, 41),
(360, 143, 28, 'Lemon / Neebu / Lembu', 1, 10, 10),
(361, 143, 9, 'Dhaniya patta', 1, 20, 20),
(362, 143, 26, 'Garlic / Lahasun / Rasuna', 1, 30, 30),
(363, 143, 113, 'Apple', 1, 120, 120),
(364, 144, 2, 'Potato (Hasdia)', 1, 25, 25),
(365, 144, 125, 'Brinjal/Baingan', 1, 16, 16),
(366, 144, 18, 'Runner beans (Sem)', 2, 60, 30),
(367, 144, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 20, 20),
(368, 144, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 50, 50),
(369, 144, 24, 'Green Chili / Haree Mirch / Kancha Lanka', 1, 20, 20),
(370, 144, 3, 'Tomato', 1, 40, 40),
(371, 144, 9, 'Dhaniya patta', 1, 20, 20),
(372, 145, 119, 'Cake', 1, 380, 380),
(373, 146, 2, 'Potato (Hasdia)', 4, 100, 25),
(374, 146, 88, 'Onion', 1, 40, 40),
(375, 147, 126, 'Beetroot / Chukandar', 1, 21, 21),
(376, 147, 88, 'Onion', 1, 40, 40),
(377, 147, 9, 'Dhaniya patta', 1, 20, 20),
(378, 147, 2, 'Potato (Hasdia)', 1, 25, 25),
(379, 147, 3, 'Tomato', 1, 40, 40),
(380, 147, 124, 'Pea (Matar) (Ranchi)', 1, 31, 31),
(381, 148, 2, 'Potato (Hasdia)', 2, 50, 25),
(382, 148, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 50, 50),
(383, 148, 24, 'Green Chili / Haree Mirch / Kancha Lanka', 1, 20, 20),
(384, 148, 88, 'Onion', 1, 40, 40),
(385, 148, 3, 'Tomato', 1, 40, 40),
(386, 149, 113, 'Apple', 1, 120, 120),
(387, 150, 90, 'Kathal (Jackfruit)', 1, 150, 150),
(388, 150, 113, 'Apple', 1, 120, 120),
(389, 151, 103, 'Dragon Fruit', 1, 120, 120),
(390, 151, 113, 'Apple', 1, 120, 120),
(391, 151, 29, 'Green Banana / Kachcha Kela / Kancha Kadali', 1, 60, 60),
(392, 151, 35, 'Tentuli ( Tamarind with Seed) / Imli / Tentuli', 1, 10, 10),
(393, 151, 45, 'Orange', 2, 120, 60),
(394, 151, 4, 'Lady\'s Finger (Bhindi)', 1, 80, 80),
(395, 152, 85, 'Guava (Amrud)Local', 1, 60, 60),
(396, 152, 16, 'Carrot (Gagar)', 1, 40, 40),
(397, 152, 126, 'Beetroot / Chukandar', 1, 21, 21),
(398, 153, 19, 'Pea (Matar) (local)', 3, 120, 40),
(399, 153, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 50, 50),
(400, 153, 24, 'Green Chili / Haree Mirch / Kancha Lanka', 1, 20, 20),
(401, 153, 2, 'Potato (Hasdia)', 1, 25, 25),
(402, 154, 2, 'Potato (Hasdia)', 2, 50, 25),
(403, 154, 88, 'Onion', 1, 40, 40),
(404, 154, 16, 'Carrot (Gagar)', 1, 40, 40),
(405, 154, 123, 'Pea (Matar) (local)', 1, 21, 21),
(406, 154, 125, 'Brinjal/Baingan', 1, 16, 16),
(407, 154, 121, 'Beans', 1, 30, 30),
(408, 154, 17, 'Radish (Mooli)', 1, 15, 15),
(409, 154, 15, 'Shimla Mirch (Capsicum)', 1, 41, 41),
(410, 155, 113, 'Apple', 1, 120, 120),
(411, 155, 2, 'Potato (Hasdia)', 2, 50, 25),
(412, 155, 3, 'Tomato', 1, 40, 40),
(413, 155, 19, 'Pea (Matar) (local)', 1, 40, 40),
(414, 156, 119, 'Cake', 1, 380, 380),
(415, 157, 2, 'Potato (Hasdia)', 1, 25, 25),
(416, 157, 88, 'Onion', 1, 40, 40),
(417, 157, 11, 'Spinch (Palak Sag)', 1, 30, 30),
(418, 157, 15, 'Shimla Mirch (Capsicum)', 1, 41, 41),
(419, 158, 119, 'Cake', 1, 380, 380),
(420, 159, 88, 'Onion', 1, 40, 40),
(421, 159, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 50, 50),
(422, 159, 28, 'Lemon / Neebu / Lembu', 1, 10, 10),
(423, 159, 19, 'Pea (Matar) (local)', 1, 40, 40),
(424, 159, 2, 'Potato (Hasdia)', 2, 50, 25),
(425, 160, 119, 'Cake', 2, 760, 380),
(426, 161, 2, 'Potato (Hasdia)', 1, 25, 25),
(427, 161, 3, 'Tomato', 1, 40, 40),
(428, 161, 88, 'Onion', 2, 80, 40),
(429, 161, 19, 'Pea (Matar) (local)', 2, 80, 40),
(430, 161, 16, 'Carrot (Gagar)', 1, 40, 40),
(431, 161, 9, 'Dhaniya patta', 1, 20, 20),
(432, 161, 15, 'Shimla Mirch (Capsicum)', 1, 41, 41),
(433, 161, 17, 'Radish (Mooli)', 1, 15, 15),
(434, 161, 126, 'Beetroot / Chukandar', 1, 21, 21),
(435, 161, 28, 'Lemon / Neebu / Lembu', 2, 20, 10),
(436, 162, 8, 'Brinjal/Baingan', 1, 30, 30),
(437, 162, 88, 'Onion', 1, 40, 40),
(438, 162, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 50, 50),
(439, 163, 45, 'Orange', 1, 60, 60),
(440, 163, 41, 'Ripe Papaya / Papita (Hybrid)', 1, 40, 40),
(441, 163, 113, 'Apple', 1, 120, 120),
(442, 163, 88, 'Onion', 1, 40, 40),
(443, 163, 2, 'Potato (Hasdia)', 2, 50, 25),
(444, 163, 28, 'Lemon / Neebu / Lembu', 1, 10, 10),
(445, 164, 139, 'SPRING ONION', 1, 21, 21),
(446, 164, 118, 'Strawberry', 1, 130, 130),
(447, 164, 140, 'Kiwi', 2, 70, 35),
(448, 164, 11, 'Spinch (Palak Sag)', 1, 30, 30),
(449, 164, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 50, 50),
(450, 164, 19, 'Pea (Matar) (local)', 1, 40, 40),
(451, 164, 125, 'Brinjal/Baingan', 1, 16, 16),
(452, 164, 126, 'Beetroot / Chukandar', 1, 21, 21),
(453, 164, 9, 'Dhaniya patta', 1, 20, 20),
(454, 164, 88, 'Onion', 1, 40, 40),
(455, 164, 2, 'Potato (Hasdia)', 2, 50, 25),
(456, 164, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 20, 20),
(457, 165, 3, 'Tomato', 1, 40, 40),
(458, 165, 11, 'Spinch (Palak Sag)', 1, 30, 30),
(459, 165, 122, 'Carrot (Gagar)', 1, 21, 21),
(460, 165, 18, 'Runner beans (Sem)', 1, 30, 30),
(461, 165, 24, 'Green Chili / Haree Mirch / Kancha Lanka', 1, 20, 20),
(462, 165, 125, 'Brinjal/Baingan', 1, 16, 16),
(463, 165, 9, 'Dhaniya patta', 1, 20, 20),
(464, 166, 15, 'Shimla Mirch (Capsicum)', 1, 41, 41),
(465, 166, 53, 'Sweet Potato / Shakarkand / Kandamool', 1, 60, 60),
(466, 167, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 20, 20),
(467, 167, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 50, 50),
(468, 167, 3, 'Tomato', 1, 40, 40),
(469, 168, 113, 'Apple', 1, 120, 120),
(470, 168, 111, 'Ripe Papaya / Papita (Local)', 1, 50, 50),
(471, 169, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 50, 50),
(472, 169, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 2, 40, 20),
(473, 169, 125, 'Brinjal/Baingan', 1, 16, 16),
(474, 170, 3, 'Tomato', 2, 80, 40),
(475, 170, 16, 'Carrot (Gagar)', 1, 40, 40),
(476, 170, 118, 'Strawberry', 1, 120, 120),
(477, 171, 3, 'Tomato', 2, 80, 40),
(478, 171, 24, 'Green Chili / Haree Mirch / Kancha Lanka', 1, 20, 20),
(479, 171, 125, 'Brinjal/Baingan', 1, 16, 16),
(480, 172, 35, 'Tentuli ( Tamarind with Seed) / Imli / Tentuli', 1, 15, 15),
(481, 172, 4, 'Lady\'s Finger (Bhindi)', 1, 80, 80),
(482, 172, 3, 'Tomato', 1, 40, 40),
(483, 173, 28, 'Lemon / Neebu / Lembu', 4, 40, 10),
(484, 173, 19, 'Pea (Matar) (local)', 1, 40, 40),
(485, 173, 2, 'Potato (Hasdia)', 1, 25, 25),
(486, 173, 125, 'Brinjal/Baingan', 1, 16, 16),
(487, 173, 11, 'Spinch (Palak Sag)', 1, 30, 30),
(488, 173, 88, 'Onion', 1, 40, 40),
(489, 173, 118, 'Strawberry', 1, 120, 120),
(490, 173, 81, 'Cheeku', 1, 100, 100),
(491, 174, 118, 'Strawberry', 1, 120, 120),
(492, 174, 19, 'Pea (Matar) (local)', 1, 40, 40),
(493, 174, 125, 'Brinjal/Baingan', 1, 16, 16),
(494, 174, 16, 'Carrot (Gagar)', 1, 40, 40),
(495, 174, 17, 'Radish (Mooli)', 1, 15, 15),
(496, 174, 2, 'Potato (Hasdia)', 1, 25, 25),
(497, 174, 88, 'Onion', 1, 40, 40),
(498, 175, 40, 'Banana', 1, 30, 30),
(499, 175, 44, 'Desi Ripe Banana / Desi Kela / Desi Pachila Kadli', 1, 30, 30),
(500, 175, 110, 'Banana / Kela (Yellow)', 1, 60, 60),
(501, 176, 113, 'Apple', 1, 120, 120),
(502, 176, 41, 'Ripe Papaya / Papita (Hybrid)', 1, 40, 40),
(503, 177, 22, 'Cauliflower / Phool gobhi / Phula kobi', 1, 50, 50),
(504, 177, 8, 'Brinjal/Baingan', 1, 30, 30),
(505, 177, 24, 'Green Chili / Haree Mirch / Kancha Lanka', 1, 20, 20),
(506, 177, 9, 'Dhaniya patta', 1, 20, 20),
(507, 178, 18, 'Runner beans (Sem)', 1, 30, 30),
(508, 178, 21, 'Cabbage / Bandha Gobhi / Bandha kobi', 1, 20, 20),
(509, 178, 8, 'Brinjal/Baingan', 1, 30, 30),
(510, 178, 17, 'Radish (Mooli)', 1, 15, 15),
(511, 178, 25, 'Ginger / Adarak / Ada', 1, 20, 20),
(512, 178, 28, 'Lemon / Neebu / Lembu', 4, 40, 10),
(513, 179, 134, 'MIZZLE (SK-10CL-EG)', 1, 7498, 7498);

-- --------------------------------------------------------

--
-- Table structure for table `order_progress`
--

CREATE TABLE `order_progress` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `notify` varchar(1) NOT NULL DEFAULT 'n',
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_progress`
--

INSERT INTO `order_progress` (`id`, `order_id`, `order_status`, `comment`, `notify`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(1, 2, 'pending', NULL, 'n', 'y', '2020-11-20 13:37:49', 0, '0000-00-00 00:00:00', 0),
(2, 3, 'pending', NULL, 'n', 'y', '2020-11-20 15:29:55', 0, '0000-00-00 00:00:00', 0),
(3, 4, 'pending', NULL, 'n', 'y', '2020-11-20 16:01:15', 0, '0000-00-00 00:00:00', 0),
(4, 5, 'pending', NULL, 'n', 'y', '2020-11-20 16:26:58', 0, '0000-00-00 00:00:00', 0),
(5, 6, 'pending', NULL, 'n', 'y', '2020-11-20 16:31:19', 0, '0000-00-00 00:00:00', 0),
(6, 7, 'pending', NULL, 'n', 'y', '2020-11-20 16:36:21', 0, '0000-00-00 00:00:00', 0),
(7, 8, 'pending', NULL, 'n', 'y', '2020-11-20 16:39:42', 0, '0000-00-00 00:00:00', 0),
(8, 9, 'pending', NULL, 'n', 'y', '2020-11-20 17:07:25', 0, '0000-00-00 00:00:00', 0),
(9, 10, 'pending', NULL, 'n', 'y', '2020-11-20 17:54:08', 0, '0000-00-00 00:00:00', 0),
(10, 11, 'pending', NULL, 'n', 'y', '2020-11-20 18:37:28', 0, '0000-00-00 00:00:00', 0),
(11, 12, 'pending', NULL, 'n', 'y', '2020-11-21 09:21:49', 0, '0000-00-00 00:00:00', 0),
(12, 13, 'pending', NULL, 'n', 'y', '2020-11-21 10:38:35', 0, '0000-00-00 00:00:00', 0),
(13, 14, 'pending', NULL, 'n', 'y', '2020-11-21 10:42:00', 0, '0000-00-00 00:00:00', 0),
(14, 15, 'pending', NULL, 'n', 'y', '2020-11-21 10:51:20', 0, '0000-00-00 00:00:00', 0),
(15, 16, 'pending', NULL, 'n', 'y', '2020-11-21 12:45:11', 0, '0000-00-00 00:00:00', 0),
(16, 17, 'pending', NULL, 'n', 'y', '2020-11-21 12:47:03', 0, '0000-00-00 00:00:00', 0),
(17, 18, 'pending', NULL, 'n', 'y', '2020-11-21 13:18:50', 0, '0000-00-00 00:00:00', 0),
(18, 19, 'pending', NULL, 'n', 'y', '2020-11-21 15:16:05', 0, '0000-00-00 00:00:00', 0),
(19, 20, 'pending', NULL, 'n', 'y', '2020-11-21 21:44:05', 0, '0000-00-00 00:00:00', 0),
(20, 21, 'pending', NULL, 'n', 'y', '2020-11-21 21:44:29', 0, '0000-00-00 00:00:00', 0),
(21, 22, 'pending', NULL, 'n', 'y', '2020-11-21 21:45:07', 0, '0000-00-00 00:00:00', 0),
(22, 21, 'delivered', NULL, 'n', 'y', '2020-11-24 16:32:00', 0, '0000-00-00 00:00:00', 0),
(23, 21, 'delivered', NULL, 'n', 'y', '2020-11-24 16:37:31', 0, '0000-00-00 00:00:00', 0),
(24, 21, 'delivered', NULL, 'n', 'y', '2020-11-24 16:41:01', 0, '0000-00-00 00:00:00', 0),
(25, 22, 'delivered', NULL, 'n', 'y', '2020-11-24 17:25:23', 0, '0000-00-00 00:00:00', 0),
(26, 20, 'delivered', NULL, 'n', 'y', '2020-11-24 18:22:41', 0, '0000-00-00 00:00:00', 0),
(27, 24, 'pending', NULL, 'n', 'y', '2020-11-25 17:30:09', 0, '0000-00-00 00:00:00', 0),
(28, 25, 'pending', NULL, 'n', 'y', '2020-11-25 17:30:27', 0, '0000-00-00 00:00:00', 0),
(29, 26, 'pending', NULL, 'n', 'y', '2020-11-25 17:38:01', 0, '0000-00-00 00:00:00', 0),
(30, 27, 'pending', NULL, 'n', 'y', '2020-11-25 17:40:16', 0, '0000-00-00 00:00:00', 0),
(31, 28, 'pending', NULL, 'n', 'y', '2020-11-25 20:22:35', 0, '0000-00-00 00:00:00', 0),
(32, 27, 'delivered', NULL, 'n', 'y', '2020-11-25 20:25:37', 0, '0000-00-00 00:00:00', 0),
(33, 29, 'pending', NULL, 'n', 'y', '2020-11-26 11:08:27', 0, '0000-00-00 00:00:00', 0),
(34, 30, 'pending', NULL, 'n', 'y', '2020-11-26 11:10:00', 0, '0000-00-00 00:00:00', 0),
(35, 31, 'pending', NULL, 'n', 'y', '2020-11-26 11:12:01', 0, '0000-00-00 00:00:00', 0),
(36, 32, 'pending', NULL, 'n', 'y', '2020-11-26 14:20:41', 0, '0000-00-00 00:00:00', 0),
(37, 33, 'pending', NULL, 'n', 'y', '2020-11-27 21:53:07', 0, '0000-00-00 00:00:00', 0),
(38, 34, 'pending', NULL, 'n', 'y', '2020-11-27 22:20:57', 0, '0000-00-00 00:00:00', 0),
(39, 35, 'pending', NULL, 'n', 'y', '2020-11-27 22:22:56', 0, '0000-00-00 00:00:00', 0),
(40, 36, 'pending', NULL, 'n', 'y', '2020-11-27 22:54:59', 0, '0000-00-00 00:00:00', 0),
(41, 37, 'pending', NULL, 'n', 'y', '2020-11-27 23:02:24', 0, '0000-00-00 00:00:00', 0),
(42, 38, 'pending', NULL, 'n', 'y', '2020-11-28 11:00:44', 0, '0000-00-00 00:00:00', 0),
(43, 39, 'pending', NULL, 'n', 'y', '2020-11-28 12:27:21', 0, '0000-00-00 00:00:00', 0),
(44, 40, 'pending', NULL, 'n', 'y', '2020-11-28 12:45:59', 0, '0000-00-00 00:00:00', 0),
(45, 41, 'pending', NULL, 'n', 'y', '2020-11-28 13:05:53', 0, '0000-00-00 00:00:00', 0),
(46, 42, 'pending', NULL, 'n', 'y', '2020-11-30 18:07:04', 0, '0000-00-00 00:00:00', 0),
(47, 43, 'pending', NULL, 'n', 'y', '2020-11-30 18:55:48', 0, '0000-00-00 00:00:00', 0),
(48, 26, 'delivered', NULL, 'n', 'y', '2020-12-02 11:01:01', 0, '0000-00-00 00:00:00', 0),
(49, 44, 'pending', NULL, 'n', 'y', '2020-12-05 16:32:28', 0, '0000-00-00 00:00:00', 0),
(50, 45, 'pending', NULL, 'n', 'y', '2020-12-07 10:15:38', 0, '0000-00-00 00:00:00', 0),
(51, 46, 'pending', NULL, 'n', 'y', '2020-12-08 15:06:39', 0, '0000-00-00 00:00:00', 0),
(52, 47, 'pending', NULL, 'n', 'y', '2020-12-10 16:54:39', 0, '0000-00-00 00:00:00', 0),
(53, 48, 'pending', NULL, 'n', 'y', '2020-12-10 23:35:51', 0, '0000-00-00 00:00:00', 0),
(67, 62, 'confirmed', 'complete', 'y', 'y', '2020-12-17 11:58:33', 0, '2020-12-17 12:33:55', 5),
(68, 63, 'confirmed', 'complete', 'y', 'y', '2020-12-17 12:01:08', 0, '2020-12-17 12:34:44', 5),
(72, 65, 'pending', NULL, 'n', 'y', '2020-12-17 13:37:05', 0, '0000-00-00 00:00:00', 0),
(73, 65, 'confirmed', 'Ongirmed\n', 'y', 'y', '2020-12-17 13:37:36', 5, '0000-00-00 00:00:00', 0),
(74, 65, 'delivered', NULL, 'n', 'y', '2020-12-17 13:38:05', 0, '0000-00-00 00:00:00', 0),
(75, 66, 'pending', NULL, 'n', 'y', '2020-12-17 13:40:22', 0, '0000-00-00 00:00:00', 0),
(76, 61, 'delivered', 'Delivered', 'y', 'y', '2020-12-17 13:45:07', 5, '0000-00-00 00:00:00', 0),
(78, 64, 'delivered', 'Delivered', 'y', 'y', '2020-12-17 13:45:26', 5, '0000-00-00 00:00:00', 0),
(79, 66, 'delivered', 'Delivered', 'y', 'y', '2020-12-17 13:45:33', 5, '0000-00-00 00:00:00', 0),
(80, 63, 'delivered', 'Delivered', 'y', 'y', '2020-12-17 13:49:56', 5, '0000-00-00 00:00:00', 0),
(81, 67, 'pending', NULL, 'n', 'y', '2020-12-17 14:41:27', 0, '0000-00-00 00:00:00', 0),
(82, 67, 'delivered', NULL, 'n', 'y', '2020-12-17 14:43:45', 0, '0000-00-00 00:00:00', 0),
(83, 64, 'pending', 'asff', 'n', 'y', '2020-12-17 15:01:50', 5, '0000-00-00 00:00:00', 0),
(84, 64, 'delivered', NULL, 'n', 'y', '2020-12-17 15:03:53', 0, '0000-00-00 00:00:00', 0),
(85, 68, 'pending', NULL, 'n', 'y', '2020-12-17 15:05:19', 0, '0000-00-00 00:00:00', 0),
(86, 69, 'pending', NULL, 'n', 'y', '2020-12-17 15:37:32', 0, '0000-00-00 00:00:00', 0),
(87, 70, 'pending', NULL, 'n', 'y', '2020-12-17 16:05:12', 0, '0000-00-00 00:00:00', 0),
(88, 71, 'pending', NULL, 'n', 'y', '2020-12-17 16:12:02', 0, '0000-00-00 00:00:00', 0),
(89, 71, 'out_of_delivery', 'Out of Delivery', 'y', 'y', '2020-12-17 16:29:14', 5, '0000-00-00 00:00:00', 0),
(90, 69, 'delivered', NULL, 'n', 'y', '2020-12-17 16:34:41', 0, '0000-00-00 00:00:00', 0),
(91, 72, 'pending', NULL, 'n', 'y', '2020-12-17 16:52:34', 0, '0000-00-00 00:00:00', 0),
(92, 73, 'pending', NULL, 'n', 'y', '2020-12-17 16:59:10', 0, '0000-00-00 00:00:00', 0),
(93, 70, 'delivered', NULL, 'n', 'y', '2020-12-17 17:04:55', 0, '0000-00-00 00:00:00', 0),
(94, 68, 'delivered', NULL, 'n', 'y', '2020-12-17 17:05:02', 0, '0000-00-00 00:00:00', 0),
(95, 72, 'delivered', NULL, 'n', 'y', '2020-12-17 17:30:48', 0, '0000-00-00 00:00:00', 0),
(96, 73, 'delivered', NULL, 'n', 'y', '2020-12-17 17:30:57', 0, '0000-00-00 00:00:00', 0),
(97, 74, 'pending', NULL, 'n', 'y', '2020-12-17 18:16:21', 0, '0000-00-00 00:00:00', 0),
(98, 75, 'pending', NULL, 'n', 'y', '2020-12-18 09:15:12', 0, '0000-00-00 00:00:00', 0),
(99, 75, 'delivered', 'Delivered', 'y', 'y', '2020-12-18 10:09:35', 5, '0000-00-00 00:00:00', 0),
(100, 76, 'pending', NULL, 'n', 'y', '2020-12-18 10:25:15', 0, '0000-00-00 00:00:00', 0),
(101, 77, 'pending', NULL, 'n', 'y', '2020-12-18 10:29:15', 0, '0000-00-00 00:00:00', 0),
(102, 74, 'delivered', NULL, 'n', 'y', '2020-12-18 10:46:17', 0, '0000-00-00 00:00:00', 0),
(103, 76, 'delivered', NULL, 'n', 'y', '2020-12-18 11:03:40', 0, '0000-00-00 00:00:00', 0),
(104, 77, 'delivered', NULL, 'n', 'y', '2020-12-18 11:47:12', 0, '0000-00-00 00:00:00', 0),
(105, 78, 'pending', NULL, 'n', 'y', '2020-12-18 12:12:45', 0, '0000-00-00 00:00:00', 0),
(106, 78, 'delivered', NULL, 'n', 'y', '2020-12-18 13:32:27', 0, '0000-00-00 00:00:00', 0),
(107, 79, 'pending', NULL, 'n', 'y', '2020-12-18 14:00:24', 0, '0000-00-00 00:00:00', 0),
(108, 80, 'pending', NULL, 'n', 'y', '2020-12-18 14:26:08', 0, '0000-00-00 00:00:00', 0),
(109, 79, 'out_of_delivery', 'out of delivery\n', 'y', 'y', '2020-12-18 14:49:42', 5, '0000-00-00 00:00:00', 0),
(110, 79, 'delivered', NULL, 'n', 'y', '2020-12-18 14:58:44', 0, '0000-00-00 00:00:00', 0),
(111, 80, 'delivered', NULL, 'n', 'y', '2020-12-18 15:23:59', 0, '0000-00-00 00:00:00', 0),
(112, 79, 'out_of_delivery', 'Mna', 'n', 'y', '2020-12-18 16:46:37', 5, '0000-00-00 00:00:00', 0),
(113, 81, 'pending', NULL, 'n', 'y', '2020-12-18 19:34:45', 0, '0000-00-00 00:00:00', 0),
(114, 81, 'out_of_delivery', 'due to minimum order value', 'n', 'y', '2020-12-19 09:31:06', 5, '0000-00-00 00:00:00', 0),
(115, 79, 'delivered', NULL, 'n', 'y', '2020-12-19 11:06:40', 0, '0000-00-00 00:00:00', 0),
(116, 81, 'delivered', NULL, 'n', 'y', '2020-12-19 11:08:01', 0, '0000-00-00 00:00:00', 0),
(117, 81, 'out_of_delivery', 'minimum order value at your location is 200rs', 'y', 'y', '2020-12-19 11:27:35', 5, '0000-00-00 00:00:00', 0),
(118, 82, 'pending', NULL, 'n', 'y', '2020-12-19 11:33:10', 0, '0000-00-00 00:00:00', 0),
(119, 83, 'pending', NULL, 'n', 'y', '2020-12-19 11:50:09', 0, '0000-00-00 00:00:00', 0),
(120, 84, 'pending', NULL, 'n', 'y', '2020-12-19 12:05:56', 0, '0000-00-00 00:00:00', 0),
(121, 64, 'out_of_delivery', 'na', 'n', 'y', '2020-12-19 12:35:06', 5, '0000-00-00 00:00:00', 0),
(122, 82, 'delivered', NULL, 'n', 'y', '2020-12-19 12:55:50', 0, '0000-00-00 00:00:00', 0),
(123, 84, 'delivered', NULL, 'n', 'y', '2020-12-19 14:33:10', 0, '0000-00-00 00:00:00', 0),
(124, 85, 'pending', NULL, 'n', 'y', '2020-12-19 16:17:39', 0, '0000-00-00 00:00:00', 0),
(125, 86, 'pending', NULL, 'n', 'y', '2020-12-19 16:19:50', 0, '0000-00-00 00:00:00', 0),
(126, 86, 'delivered', NULL, 'n', 'y', '2020-12-19 17:11:35', 0, '0000-00-00 00:00:00', 0),
(127, 85, 'delivered', NULL, 'n', 'y', '2020-12-19 17:11:51', 0, '0000-00-00 00:00:00', 0),
(128, 64, 'delivered', NULL, 'n', 'y', '2020-12-19 17:45:10', 0, '0000-00-00 00:00:00', 0),
(129, 81, 'delivered', NULL, 'n', 'y', '2020-12-19 17:45:20', 0, '0000-00-00 00:00:00', 0),
(130, 87, 'pending', NULL, 'n', 'y', '2020-12-19 20:36:01', 0, '0000-00-00 00:00:00', 0),
(131, 88, 'pending', NULL, 'n', 'y', '2020-12-19 20:37:32', 0, '0000-00-00 00:00:00', 0),
(132, 89, 'pending', NULL, 'n', 'y', '2020-12-19 23:59:01', 0, '0000-00-00 00:00:00', 0),
(133, 90, 'pending', NULL, 'n', 'y', '2020-12-20 09:00:22', 0, '0000-00-00 00:00:00', 0),
(134, 90, 'out_of_delivery', 'delivery out of range', 'y', 'y', '2020-12-20 09:51:54', 5, '0000-00-00 00:00:00', 0),
(135, 89, 'delivered', NULL, 'n', 'y', '2020-12-20 10:13:30', 0, '0000-00-00 00:00:00', 0),
(136, 88, 'delivered', NULL, 'n', 'y', '2020-12-20 10:21:58', 0, '0000-00-00 00:00:00', 0),
(137, 87, 'delivered', NULL, 'n', 'y', '2020-12-20 10:22:08', 0, '0000-00-00 00:00:00', 0),
(138, 91, 'pending', NULL, 'n', 'y', '2020-12-20 10:27:13', 0, '0000-00-00 00:00:00', 0),
(139, 91, 'delivered', NULL, 'n', 'y', '2020-12-20 11:00:59', 0, '0000-00-00 00:00:00', 0),
(140, 92, 'pending', NULL, 'n', 'y', '2020-12-20 11:22:36', 0, '0000-00-00 00:00:00', 0),
(141, 93, 'pending', NULL, 'n', 'y', '2020-12-20 12:24:00', 0, '0000-00-00 00:00:00', 0),
(142, 94, 'pending', NULL, 'n', 'y', '2020-12-20 12:51:34', 0, '0000-00-00 00:00:00', 0),
(143, 92, 'delivered', NULL, 'n', 'y', '2020-12-20 12:56:57', 0, '0000-00-00 00:00:00', 0),
(144, 95, 'pending', NULL, 'n', 'y', '2020-12-20 13:00:19', 0, '0000-00-00 00:00:00', 0),
(145, 96, 'pending', NULL, 'n', 'y', '2020-12-20 13:01:22', 0, '0000-00-00 00:00:00', 0),
(146, 92, 'delivered', NULL, 'n', 'y', '2020-12-20 13:17:46', 0, '0000-00-00 00:00:00', 0),
(147, 93, 'delivered', NULL, 'n', 'y', '2020-12-20 13:32:39', 0, '0000-00-00 00:00:00', 0),
(148, 96, 'delivered', NULL, 'n', 'y', '2020-12-20 14:44:35', 0, '0000-00-00 00:00:00', 0),
(149, 95, 'delivered', NULL, 'n', 'y', '2020-12-20 14:46:32', 0, '0000-00-00 00:00:00', 0),
(150, 94, 'delivered', NULL, 'n', 'y', '2020-12-20 14:46:43', 0, '0000-00-00 00:00:00', 0),
(151, 97, 'pending', NULL, 'n', 'y', '2020-12-20 15:18:49', 0, '0000-00-00 00:00:00', 0),
(152, 98, 'pending', NULL, 'n', 'y', '2020-12-20 15:42:03', 0, '0000-00-00 00:00:00', 0),
(153, 98, 'delivered', NULL, 'n', 'y', '2020-12-20 16:35:28', 0, '0000-00-00 00:00:00', 0),
(154, 97, 'delivered', NULL, 'n', 'y', '2020-12-20 16:35:44', 0, '0000-00-00 00:00:00', 0),
(155, 99, 'pending', NULL, 'n', 'y', '2020-12-20 17:04:56', 0, '0000-00-00 00:00:00', 0),
(156, 100, 'pending', NULL, 'n', 'y', '2020-12-20 18:59:05', 0, '0000-00-00 00:00:00', 0),
(157, 99, 'delivered', NULL, 'n', 'y', '2020-12-21 09:53:42', 0, '0000-00-00 00:00:00', 0),
(158, 101, 'pending', NULL, 'n', 'y', '2020-12-21 10:52:45', 0, '0000-00-00 00:00:00', 0),
(160, 101, 'delivered', NULL, 'n', 'y', '2020-12-21 11:54:45', 0, '0000-00-00 00:00:00', 0),
(161, 100, 'delivered', NULL, 'n', 'y', '2020-12-21 13:06:39', 0, '0000-00-00 00:00:00', 0),
(162, 103, 'pending', NULL, 'n', 'y', '2020-12-22 12:06:56', 0, '0000-00-00 00:00:00', 0),
(163, 104, 'pending', NULL, 'n', 'y', '2020-12-22 14:43:15', 0, '0000-00-00 00:00:00', 0),
(164, 104, 'delivered', 'deliver', 'n', 'y', '2020-12-22 14:44:24', 5, '0000-00-00 00:00:00', 0),
(165, 105, 'pending', NULL, 'n', 'y', '2020-12-23 09:33:44', 0, '0000-00-00 00:00:00', 0),
(166, 106, 'pending', NULL, 'n', 'y', '2020-12-23 09:52:53', 0, '0000-00-00 00:00:00', 0),
(167, 107, 'pending', NULL, 'n', 'y', '2020-12-23 10:00:03', 0, '0000-00-00 00:00:00', 0),
(168, 106, 'delivered', NULL, 'n', 'y', '2020-12-23 11:52:05', 0, '0000-00-00 00:00:00', 0),
(169, 107, 'delivered', NULL, 'n', 'y', '2020-12-23 11:52:17', 0, '0000-00-00 00:00:00', 0),
(170, 108, 'pending', NULL, 'n', 'y', '2020-12-23 12:45:39', 0, '0000-00-00 00:00:00', 0),
(171, 108, 'delivered', NULL, 'n', 'y', '2020-12-23 14:44:20', 0, '0000-00-00 00:00:00', 0),
(172, 108, 'delivered', 'Your order has been successfully delivered!', 'y', 'y', '2020-12-23 14:44:35', 5, '0000-00-00 00:00:00', 0),
(173, 109, 'pending', NULL, 'n', 'y', '2020-12-23 17:26:00', 0, '0000-00-00 00:00:00', 0),
(174, 109, 'out_of_delivery', 'Out of delivery', 'y', 'y', '2020-12-23 17:58:06', 5, '0000-00-00 00:00:00', 0),
(175, 110, 'pending', NULL, 'n', 'y', '2020-12-24 08:27:32', 0, '0000-00-00 00:00:00', 0),
(176, 111, 'pending', NULL, 'n', 'y', '2020-12-24 10:07:48', 0, '0000-00-00 00:00:00', 0),
(177, 110, 'delivered', NULL, 'n', 'y', '2020-12-24 11:32:38', 0, '0000-00-00 00:00:00', 0),
(178, 112, 'pending', NULL, 'n', 'y', '2020-12-24 17:21:18', 0, '0000-00-00 00:00:00', 0),
(179, 112, 'confirmed', 'Order Accepted', 'y', 'y', '2020-12-24 17:27:35', 5, '0000-00-00 00:00:00', 0),
(180, 113, 'pending', NULL, 'n', 'y', '2020-12-24 17:39:52', 0, '0000-00-00 00:00:00', 0),
(181, 113, 'confirmed', 'Order Accepted', 'y', 'y', '2020-12-24 17:41:30', 5, '0000-00-00 00:00:00', 0),
(182, 114, 'pending', NULL, 'n', 'y', '2020-12-24 17:52:39', 0, '0000-00-00 00:00:00', 0),
(183, 115, 'pending', NULL, 'n', 'y', '2020-12-24 18:05:39', 0, '0000-00-00 00:00:00', 0),
(184, 112, 'delivered', NULL, 'n', 'y', '2020-12-24 18:31:02', 0, '0000-00-00 00:00:00', 0),
(185, 113, 'delivered', NULL, 'n', 'y', '2020-12-24 18:46:20', 0, '0000-00-00 00:00:00', 0),
(186, 116, 'pending', NULL, 'n', 'y', '2020-12-24 19:58:32', 0, '0000-00-00 00:00:00', 0),
(187, 117, 'pending', NULL, 'n', 'y', '2020-12-25 06:59:31', 0, '0000-00-00 00:00:00', 0),
(188, 118, 'pending', NULL, 'n', 'y', '2020-12-25 08:40:51', 0, '0000-00-00 00:00:00', 0),
(189, 117, 'delivered', NULL, 'n', 'y', '2020-12-25 09:56:26', 0, '0000-00-00 00:00:00', 0),
(190, 116, 'delivered', NULL, 'n', 'y', '2020-12-25 10:11:26', 0, '0000-00-00 00:00:00', 0),
(191, 119, 'pending', NULL, 'n', 'y', '2020-12-25 10:34:21', 0, '0000-00-00 00:00:00', 0),
(192, 120, 'pending', NULL, 'n', 'y', '2020-12-25 10:42:44', 0, '0000-00-00 00:00:00', 0),
(193, 118, 'delivered', NULL, 'n', 'y', '2020-12-25 10:46:18', 0, '0000-00-00 00:00:00', 0),
(194, 120, 'confirmed', 'Order Accepted', 'y', 'y', '2020-12-25 11:01:51', 5, '0000-00-00 00:00:00', 0),
(195, 119, 'confirmed', 'Order Accepted', 'y', 'y', '2020-12-25 11:02:43', 5, '0000-00-00 00:00:00', 0),
(196, 115, 'delivered', 'Delivered', 'y', 'y', '2020-12-25 11:33:23', 5, '0000-00-00 00:00:00', 0),
(197, 114, 'delivered', 'Delivered', 'y', 'y', '2020-12-25 11:33:34', 5, '0000-00-00 00:00:00', 0),
(198, 120, 'delivered', NULL, 'n', 'y', '2020-12-25 12:34:44', 0, '0000-00-00 00:00:00', 0),
(199, 119, 'delivered', NULL, 'n', 'y', '2020-12-25 12:34:50', 0, '0000-00-00 00:00:00', 0),
(200, 120, 'delivered', 'successfully delivered', 'y', 'y', '2020-12-25 12:36:39', 5, '0000-00-00 00:00:00', 0),
(201, 119, 'delivered', 'successfully delivered', 'y', 'y', '2020-12-25 12:36:43', 5, '0000-00-00 00:00:00', 0),
(202, 121, 'pending', NULL, 'n', 'y', '2020-12-25 12:52:29', 0, '0000-00-00 00:00:00', 0),
(203, 121, 'confirmed', 'Ordered Confirmed', 'y', 'y', '2020-12-25 12:53:23', 5, '0000-00-00 00:00:00', 0),
(204, 122, 'pending', NULL, 'n', 'y', '2020-12-25 13:29:22', 0, '0000-00-00 00:00:00', 0),
(205, 122, 'delivered', 'order successfully delivered', 'y', 'y', '2020-12-25 15:15:27', 5, '0000-00-00 00:00:00', 0),
(206, 123, 'pending', NULL, 'n', 'y', '2020-12-25 15:27:55', 0, '0000-00-00 00:00:00', 0),
(207, 124, 'pending', NULL, 'n', 'y', '2020-12-25 15:31:07', 0, '0000-00-00 00:00:00', 0),
(208, 124, 'confirmed', 'Ordered accepted', 'y', 'y', '2020-12-25 15:39:11', 5, '0000-00-00 00:00:00', 0),
(209, 125, 'pending', NULL, 'n', 'y', '2020-12-25 16:09:03', 0, '0000-00-00 00:00:00', 0),
(210, 126, 'pending', NULL, 'n', 'y', '2020-12-25 16:13:49', 0, '0000-00-00 00:00:00', 0),
(211, 125, 'out_of_delivery', 'Minimum Cart Value @ INR 100 ₹', 'y', 'y', '2020-12-25 16:13:58', 5, '0000-00-00 00:00:00', 0),
(212, 125, 'confirmed', 'Ordered confirmed', 'y', 'y', '2020-12-25 16:15:55', 5, '0000-00-00 00:00:00', 0),
(213, 126, 'confirmed', 'Ordered confirmed', 'y', 'y', '2020-12-25 16:16:01', 5, '0000-00-00 00:00:00', 0),
(214, 127, 'pending', NULL, 'n', 'y', '2020-12-25 16:34:34', 0, '0000-00-00 00:00:00', 0),
(215, 127, 'confirmed', 'Ordered Confirmed', 'y', 'y', '2020-12-25 16:37:01', 5, '0000-00-00 00:00:00', 0),
(216, 121, 'delivered', NULL, 'n', 'y', '2020-12-25 17:22:59', 0, '0000-00-00 00:00:00', 0),
(217, 125, 'delivered', NULL, 'n', 'y', '2020-12-25 17:23:08', 0, '0000-00-00 00:00:00', 0),
(218, 126, 'delivered', NULL, 'n', 'y', '2020-12-25 17:23:14', 0, '0000-00-00 00:00:00', 0),
(219, 128, 'pending', NULL, 'n', 'y', '2020-12-25 18:02:16', 0, '0000-00-00 00:00:00', 0),
(220, 124, 'delivered', NULL, 'n', 'y', '2020-12-25 21:16:52', 0, '0000-00-00 00:00:00', 0),
(221, 127, 'delivered', NULL, 'n', 'y', '2020-12-26 08:12:06', 0, '0000-00-00 00:00:00', 0),
(222, 129, 'pending', NULL, 'n', 'y', '2020-12-26 08:17:14', 0, '0000-00-00 00:00:00', 0),
(223, 130, 'pending', NULL, 'n', 'y', '2020-12-26 09:27:27', 0, '0000-00-00 00:00:00', 0),
(224, 129, 'delivered', NULL, 'n', 'y', '2020-12-26 09:49:13', 0, '0000-00-00 00:00:00', 0),
(225, 131, 'pending', NULL, 'n', 'y', '2020-12-26 09:51:50', 0, '0000-00-00 00:00:00', 0),
(226, 131, 'confirmed', 'Ordered Accepted', 'y', 'y', '2020-12-26 10:11:49', 5, '0000-00-00 00:00:00', 0),
(227, 130, 'confirmed', 'Ordered Accepted', 'y', 'y', '2020-12-26 10:11:56', 5, '0000-00-00 00:00:00', 0),
(228, 132, 'pending', NULL, 'n', 'y', '2020-12-26 10:22:40', 0, '0000-00-00 00:00:00', 0),
(229, 132, 'confirmed', 'ORDER ACCEPTED', 'y', 'y', '2020-12-26 10:41:55', 5, '0000-00-00 00:00:00', 0),
(230, 130, 'delivered', NULL, 'n', 'y', '2020-12-26 11:57:28', 0, '0000-00-00 00:00:00', 0),
(231, 131, 'delivered', NULL, 'n', 'y', '2020-12-26 11:57:35', 0, '0000-00-00 00:00:00', 0),
(232, 128, 'delivered', NULL, 'n', 'y', '2020-12-26 11:58:01', 0, '0000-00-00 00:00:00', 0),
(233, 130, 'delivered', NULL, 'n', 'y', '2020-12-26 12:13:47', 0, '0000-00-00 00:00:00', 0),
(234, 132, 'delivered', NULL, 'n', 'y', '2020-12-26 12:14:02', 0, '0000-00-00 00:00:00', 0),
(235, 133, 'pending', NULL, 'n', 'y', '2020-12-26 18:49:21', 0, '0000-00-00 00:00:00', 0),
(236, 134, 'pending', NULL, 'n', 'y', '2020-12-27 08:12:36', 0, '0000-00-00 00:00:00', 0),
(237, 133, 'confirmed', 'Ordered confirm.', 'y', 'y', '2020-12-27 08:22:16', 5, '0000-00-00 00:00:00', 0),
(238, 134, 'confirmed', 'Ordered accepted.', 'y', 'y', '2020-12-27 08:23:43', 5, '0000-00-00 00:00:00', 0),
(239, 135, 'pending', NULL, 'n', 'y', '2020-12-27 10:05:46', 0, '0000-00-00 00:00:00', 0),
(240, 135, 'confirmed', 'Ordered Accepted', 'y', 'y', '2020-12-27 10:06:13', 5, '0000-00-00 00:00:00', 0),
(241, 134, 'delivered', NULL, 'n', 'y', '2020-12-27 10:12:17', 0, '0000-00-00 00:00:00', 0),
(242, 133, 'delivered', NULL, 'n', 'y', '2020-12-27 12:11:17', 0, '0000-00-00 00:00:00', 0),
(243, 133, 'delivered', NULL, 'n', 'y', '2020-12-27 12:13:20', 0, '0000-00-00 00:00:00', 0),
(244, 136, 'pending', NULL, 'n', 'y', '2020-12-27 13:39:44', 0, '0000-00-00 00:00:00', 0),
(245, 136, 'confirmed', 'Ordered accepted', 'y', 'y', '2020-12-27 13:47:20', 5, '0000-00-00 00:00:00', 0),
(246, 137, 'pending', NULL, 'n', 'y', '2020-12-27 15:30:29', 0, '0000-00-00 00:00:00', 0),
(247, 137, 'confirmed', 'Ordered Accepted', 'y', 'y', '2020-12-27 15:38:10', 5, '0000-00-00 00:00:00', 0),
(248, 137, 'delivered', NULL, 'n', 'y', '2020-12-27 17:04:04', 0, '0000-00-00 00:00:00', 0),
(249, 136, 'delivered', 'delivered', 'n', 'y', '2020-12-27 17:45:23', 5, '0000-00-00 00:00:00', 0),
(250, 136, 'delivered', NULL, 'n', 'y', '2020-12-27 18:42:24', 0, '0000-00-00 00:00:00', 0),
(251, 138, 'pending', NULL, 'n', 'y', '2020-12-28 07:40:34', 0, '0000-00-00 00:00:00', 0),
(252, 139, 'pending', NULL, 'n', 'y', '2020-12-28 10:53:41', 0, '0000-00-00 00:00:00', 0),
(253, 140, 'pending', NULL, 'n', 'y', '2020-12-28 13:53:00', 0, '0000-00-00 00:00:00', 0),
(254, 138, 'delivered', NULL, 'n', 'y', '2020-12-29 09:28:15', 0, '0000-00-00 00:00:00', 0),
(255, 139, 'delivered', NULL, 'n', 'y', '2020-12-29 09:28:22', 0, '0000-00-00 00:00:00', 0),
(256, 140, 'out_of_delivery', 'holiday', 'n', 'y', '2020-12-29 10:41:34', 5, '0000-00-00 00:00:00', 0),
(257, 141, 'pending', NULL, 'n', 'y', '2020-12-29 14:01:09', 0, '0000-00-00 00:00:00', 0),
(258, 141, 'out_of_delivery', 'Minimum amount', 'y', 'y', '2020-12-29 14:48:06', 5, '0000-00-00 00:00:00', 0),
(259, 141, 'delivered', NULL, 'n', 'y', '2020-12-29 14:48:52', 0, '0000-00-00 00:00:00', 0),
(260, 140, 'confirmed', 'Ordered Accepted', 'y', 'y', '2020-12-29 15:05:18', 5, '0000-00-00 00:00:00', 0),
(261, 140, 'delivered', NULL, 'n', 'y', '2020-12-29 16:17:04', 0, '0000-00-00 00:00:00', 0),
(262, 142, 'pending', NULL, 'n', 'y', '2020-12-29 19:51:37', 0, '0000-00-00 00:00:00', 0),
(263, 143, 'pending', NULL, 'n', 'y', '2020-12-29 22:32:56', 0, '0000-00-00 00:00:00', 0),
(264, 144, 'pending', NULL, 'n', 'y', '2020-12-30 07:42:43', 0, '0000-00-00 00:00:00', 0),
(265, 144, 'delivered', NULL, 'n', 'y', '2020-12-30 09:53:49', 0, '0000-00-00 00:00:00', 0),
(266, 143, 'delivered', NULL, 'n', 'y', '2020-12-30 09:59:10', 0, '0000-00-00 00:00:00', 0),
(267, 142, 'delivered', NULL, 'n', 'y', '2020-12-30 10:27:40', 0, '0000-00-00 00:00:00', 0),
(268, 145, 'pending', NULL, 'n', 'y', '2020-12-30 10:51:08', 0, '0000-00-00 00:00:00', 0),
(269, 146, 'pending', NULL, 'n', 'y', '2020-12-30 14:01:21', 0, '0000-00-00 00:00:00', 0),
(270, 146, 'confirmed', 'Ordered Accepted', 'y', 'y', '2020-12-30 14:02:58', 5, '0000-00-00 00:00:00', 0),
(271, 147, 'pending', NULL, 'n', 'y', '2020-12-30 18:58:52', 0, '0000-00-00 00:00:00', 0),
(272, 147, 'confirmed', 'Confirmed, your order will deliver tomorrow morning till 9 am. Thanku for connecting with us', 'y', 'y', '2020-12-30 19:15:14', 5, '0000-00-00 00:00:00', 0),
(273, 148, 'pending', NULL, 'n', 'y', '2020-12-30 20:57:57', 0, '0000-00-00 00:00:00', 0),
(274, 149, 'pending', NULL, 'n', 'y', '2020-12-31 05:43:23', 0, '0000-00-00 00:00:00', 0),
(275, 149, 'delivered', NULL, 'n', 'y', '2020-12-31 09:20:09', 0, '0000-00-00 00:00:00', 0),
(276, 148, 'delivered', NULL, 'n', 'y', '2020-12-31 09:20:20', 0, '0000-00-00 00:00:00', 0),
(277, 147, 'delivered', NULL, 'n', 'y', '2020-12-31 10:11:25', 0, '0000-00-00 00:00:00', 0),
(278, 146, 'delivered', NULL, 'n', 'y', '2020-12-31 10:31:26', 0, '0000-00-00 00:00:00', 0),
(279, 150, 'pending', NULL, 'n', 'y', '2020-12-31 14:00:39', 0, '0000-00-00 00:00:00', 0),
(280, 150, 'confirmed', 'ordered accepted', 'y', 'y', '2020-12-31 14:51:42', 5, '0000-00-00 00:00:00', 0),
(281, 150, 'delivered', NULL, 'n', 'y', '2020-12-31 16:49:31', 0, '0000-00-00 00:00:00', 0),
(282, 151, 'pending', NULL, 'n', 'y', '2021-01-01 15:17:50', 0, '0000-00-00 00:00:00', 0),
(283, 151, 'confirmed', 'Order confirm, your order will deliver by tomorrow morning, thanku for connecting with us.', 'y', 'y', '2021-01-01 15:19:08', 5, '0000-00-00 00:00:00', 0),
(284, 152, 'pending', NULL, 'n', 'y', '2021-01-01 20:52:32', 0, '0000-00-00 00:00:00', 0),
(285, 153, 'pending', NULL, 'n', 'y', '2021-01-02 09:59:32', 0, '0000-00-00 00:00:00', 0),
(286, 153, 'confirmed', 'Confirmed, Your order will deliver within 45 minute. Thank you for connecting with us.  ', 'y', 'y', '2021-01-02 10:07:06', 5, '0000-00-00 00:00:00', 0),
(287, 152, 'out_of_delivery', 'Item Not Available', 'y', 'y', '2021-01-02 10:51:37', 5, '0000-00-00 00:00:00', 0),
(288, 153, 'delivered', 'Ordered Delivered', 'y', 'y', '2021-01-02 11:43:25', 5, '0000-00-00 00:00:00', 0),
(289, 154, 'pending', NULL, 'n', 'y', '2021-01-03 07:54:03', 0, '0000-00-00 00:00:00', 0),
(290, 155, 'pending', NULL, 'n', 'y', '2021-01-03 09:31:20', 0, '0000-00-00 00:00:00', 0),
(291, 155, 'confirmed', 'Your order is confirmed and will deliver within 45 minute. Thanku for connecting with us.', 'y', 'y', '2021-01-03 10:05:12', 5, '0000-00-00 00:00:00', 0),
(292, 154, 'confirmed', 'Your order is confirmed and will deliver within 45 minute. Thanku for connecting with us.', 'y', 'y', '2021-01-03 10:22:18', 5, '0000-00-00 00:00:00', 0),
(293, 155, 'confirmed', 'Your order is confirmed and will deliver within 45 minute. Thanks for connecting with us.', 'y', 'y', '2021-01-03 10:22:34', 5, '0000-00-00 00:00:00', 0),
(294, 155, 'delivered', 'Ordered Delivered\n', 'y', 'y', '2021-01-03 13:13:23', 5, '0000-00-00 00:00:00', 0),
(295, 154, 'delivered', 'Ordered Delivered\n', 'y', 'y', '2021-01-03 13:13:38', 5, '0000-00-00 00:00:00', 0),
(296, 156, 'pending', NULL, 'n', 'y', '2021-01-03 14:25:55', 0, '0000-00-00 00:00:00', 0),
(297, 156, 'confirmed', 'order Accepted, your order will deliver within 45 minute. Thank you for connecting with us.', 'y', 'y', '2021-01-03 14:27:27', 5, '0000-00-00 00:00:00', 0),
(298, 156, 'delivered', 'Order Delivered. Hope you satisfied with the service. For suggestion and feedback please contact 797', 'y', 'y', '2021-01-03 14:30:22', 5, '0000-00-00 00:00:00', 0),
(299, 157, 'pending', NULL, 'n', 'y', '2021-01-03 15:37:36', 0, '0000-00-00 00:00:00', 0),
(300, 157, 'confirmed', 'Ordered Confirmed', 'y', 'y', '2021-01-03 16:21:25', 5, '0000-00-00 00:00:00', 0),
(301, 157, 'delivered', 'ordered successfully delivered.', 'y', 'y', '2021-01-03 17:11:10', 5, '0000-00-00 00:00:00', 0),
(302, 158, 'pending', NULL, 'n', 'y', '2021-01-03 17:31:30', 0, '0000-00-00 00:00:00', 0),
(303, 159, 'pending', NULL, 'n', 'y', '2021-01-03 18:10:18', 0, '0000-00-00 00:00:00', 0),
(304, 160, 'pending', NULL, 'n', 'y', '2021-01-04 14:17:49', 0, '0000-00-00 00:00:00', 0),
(305, 161, 'pending', NULL, 'n', 'y', '2021-01-04 14:29:25', 0, '0000-00-00 00:00:00', 0),
(306, 162, 'pending', NULL, 'n', 'y', '2021-01-05 13:26:25', 0, '0000-00-00 00:00:00', 0),
(307, 161, 'delivered', 'ordered Successfully Delivered', 'y', 'y', '2021-01-05 13:50:02', 5, '0000-00-00 00:00:00', 0),
(308, 162, 'confirmed', 'Ordered Accepted', 'y', 'y', '2021-01-05 13:50:29', 5, '0000-00-00 00:00:00', 0),
(309, 163, 'pending', NULL, 'n', 'y', '2021-01-05 15:58:28', 0, '0000-00-00 00:00:00', 0),
(310, 163, 'confirmed', 'Ordered Accepted ', 'y', 'y', '2021-01-05 16:14:03', 5, '0000-00-00 00:00:00', 0),
(311, 163, 'delivered', 'Ordered Successfully delivered', 'y', 'y', '2021-01-06 10:10:31', 5, '0000-00-00 00:00:00', 0),
(312, 162, 'delivered', 'Ordered Successfully delivered', 'y', 'y', '2021-01-06 10:10:41', 5, '0000-00-00 00:00:00', 0),
(313, 164, 'pending', NULL, 'n', 'y', '2021-01-06 17:09:42', 0, '0000-00-00 00:00:00', 0),
(314, 165, 'pending', NULL, 'n', 'y', '2021-01-06 17:11:52', 0, '0000-00-00 00:00:00', 0),
(315, 165, 'confirmed', 'Ordered Accepted', 'y', 'y', '2021-01-06 17:26:12', 5, '0000-00-00 00:00:00', 0),
(316, 166, 'pending', NULL, 'n', 'y', '2021-01-06 17:36:30', 0, '0000-00-00 00:00:00', 0),
(317, 167, 'pending', NULL, 'n', 'y', '2021-01-06 18:53:01', 0, '0000-00-00 00:00:00', 0),
(318, 168, 'pending', NULL, 'n', 'y', '2021-01-06 19:20:36', 0, '0000-00-00 00:00:00', 0),
(319, 169, 'pending', NULL, 'n', 'y', '2021-01-07 08:18:34', 0, '0000-00-00 00:00:00', 0),
(320, 170, 'pending', NULL, 'n', 'y', '2021-01-07 10:34:14', 0, '0000-00-00 00:00:00', 0),
(321, 168, 'delivered', 'Ordered Successfully Delivered', 'y', 'y', '2021-01-07 10:55:11', 5, '0000-00-00 00:00:00', 0),
(322, 167, 'delivered', 'Ordered Successfully Delivered', 'y', 'y', '2021-01-07 10:55:19', 5, '0000-00-00 00:00:00', 0),
(323, 164, 'delivered', 'Ordered Successfully Delivered', 'y', 'y', '2021-01-07 10:55:28', 5, '0000-00-00 00:00:00', 0),
(324, 165, 'delivered', 'Ordered Successfully Delivered', 'y', 'y', '2021-01-07 10:55:34', 5, '0000-00-00 00:00:00', 0),
(325, 166, 'delivered', 'Ordered Successfully Delivered', 'y', 'y', '2021-01-07 10:55:42', 5, '0000-00-00 00:00:00', 0),
(326, 169, 'delivered', 'Ordered Successfully Delivered', 'y', 'y', '2021-01-07 10:56:02', 5, '0000-00-00 00:00:00', 0),
(327, 170, 'confirmed', 'Ordered Accepted', 'y', 'y', '2021-01-07 10:56:32', 5, '0000-00-00 00:00:00', 0),
(328, 171, 'pending', NULL, 'n', 'y', '2021-01-08 09:20:09', 0, '0000-00-00 00:00:00', 0),
(329, 172, 'pending', NULL, 'n', 'y', '2021-01-13 10:59:14', 0, '0000-00-00 00:00:00', 0),
(330, 172, 'delivered', 'sxz', 'y', 'y', '2021-01-13 10:59:51', 5, '0000-00-00 00:00:00', 0),
(331, 173, 'pending', NULL, 'n', 'y', '2021-01-13 21:37:47', 0, '0000-00-00 00:00:00', 0),
(332, 174, 'pending', NULL, 'n', 'y', '2021-01-13 22:02:08', 0, '0000-00-00 00:00:00', 0),
(333, 175, 'pending', NULL, 'n', 'y', '2021-01-13 22:44:08', 0, '0000-00-00 00:00:00', 0),
(334, 176, 'pending', NULL, 'n', 'y', '2021-01-14 08:09:20', 0, '0000-00-00 00:00:00', 0),
(335, 177, 'pending', NULL, 'n', 'y', '2021-01-14 19:57:55', 0, '0000-00-00 00:00:00', 0),
(336, 178, 'pending', NULL, 'n', 'y', '2021-01-15 08:10:49', 0, '0000-00-00 00:00:00', 0),
(337, 179, 'pending', NULL, 'n', 'y', '2021-01-15 12:03:08', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `short_info` text,
  `long_info` text,
  `image` text NOT NULL,
  `price` float NOT NULL,
  `display_price` float NOT NULL,
  `unit` varchar(20) NOT NULL,
  `unit_value` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `package_count` int(11) NOT NULL,
  `featured` varchar(20) NOT NULL,
  `oos` varchar(20) NOT NULL,
  `popular` varchar(20) NOT NULL,
  `home_product` varchar(1) NOT NULL DEFAULT 'n',
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `sub_category_id`, `title`, `short_info`, `long_info`, `image`, `price`, `display_price`, `unit`, `unit_value`, `quantity`, `package_count`, `featured`, `oos`, `popular`, `home_product`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(2, 6, 46, 'Potato (Hasdia)', 'Potato (Hasdia)', 'Potatoes are filling, reasonable in calories, non-fattening, and are nutrient dense, which means you obtain many nutrients for the amount of calories they have. It has a rich and smooth texture. It is a good supply of carbohydrates, dietary fiber and some minerals like potassium, copper, magnesium and iron. It is also rich in phytochemical antioxidants like flavonoids, other B vitamins as well as folate. ', 'assets/images/product/20201109122124.png', 25, 30, 'kg', 1, 1, 100, 'y', 'n', 'n', 'y', 'y', '2020-11-03 17:27:39', 5, '2021-01-13 11:46:20', 5),
(3, 6, 47, 'Tomato', 'Tomato (Hasdia)', 'Tomato, (Solanum lycopersicum), flowering plant of the nightshade family (Solanaceae), cultivated extensively for its edible fruits. ... Labelled as a vegetable for nutritional purposes, tomatoes are a good source of vitamin C and the phytochemical lycopene.', 'assets/images/product/20201109170953.png', 40, 45, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-11-09 17:09:53', 5, '2021-01-08 16:13:32', 5),
(4, 6, 51, 'Lady\'s Finger (Bhindi)', 'Fresh Lady\'s Finger', 'Ladies finger is a green vegetable with a tip at the end and a lighter green head, which is inedibe and to be thrown away. It tastes mild and slightly grassy. \r\n', 'assets/images/product/20201119164132.png', 100, 110, 'kg', 1, 1, 1, 'n', 'n', 'n', 'y', 'y', '2020-11-19 16:41:32', 5, '2021-01-13 11:01:45', 5),
(7, 6, 52, 'Beans', 'Beans', 'Thin and cylindrical in shape, French Ring beans come with plump notches that enclose the peas inside. Peas are lime green in colour and semi starchy with sweet and grassy flavours.\r\n', 'assets/images/product/20201207134727.png', 60, 65, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-06 19:06:59', 5, '2021-01-08 16:12:19', 5),
(8, 6, 53, 'Brinjal/Baingan', 'Brinjal/Baingan', 'Brinjal Purple Bharta has glossy skin and comes in wide range of shapes and sizes. The flesh is creamy and spongy with numerous tiny, smooth edible seeds. \r\n', 'assets/images/product/20201207134756.jpg', 30, 35, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-06 19:16:11', 5, '2021-01-08 16:11:43', 5),
(9, 6, 54, 'Dhaniya patta', 'Dhaniya patta (Coriander Leaves)', 'Coriander Coriandrum sativum) is an annual herb in the family Apiaceae. It is also known as Chinese parsley, and in the United States the stems and leaves are usually called cilantro', 'assets/images/product/20201207134913.jpg', 20, 25, 'gram', 250, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 10:04:05', 5, '2021-01-08 16:14:02', 5),
(11, 6, 55, 'Spinch (Palak Sag)', 'Spinch (Palak Sag)', 'Spinach (Spinacia oleracea) is a leafy green vegetable that originated in Persia. It belongs to the amaranth family and is related to beets and quinoa. What\'s more, it\'s considered very healthy, as it\'s loaded with nutrients and antioxidants', 'assets/images/product/20201207135303.jpg', 30, 35, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 13:53:03', 5, '2021-01-08 16:14:15', 5),
(12, 6, 56, ' Bitter gourd (karela)', ' Bitter gourd (karela)', 'Bitter melon, also known as bitter gourd or karela (in India), is a unique vegetable-fruit that can be used as food or medicine. It is the edible part of the plant Momordica Charantia, which is a vine of the Cucurbitaceae family and is considered the most bitter among all fruits and vegetables.', 'assets/images/product/20201207135458.jpg', 60, 65, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 13:54:58', 5, '2021-01-13 10:58:08', 5),
(15, 6, 58, 'Shimla Mirch (Capsicum)', 'Shimla Mirch (Capsicum)', 'Capsicum, the pepper, is a genus of flowering plants in the nightshade family Solanaceae. Its species are native to America, where they have been cultivated for thousands of years. Peppers are cultivated worldwide and used in many cuisines.', 'assets/images/product/20201207145334.jpg', 41, 45, 'gram', 500, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 14:16:32', 5, '2021-01-08 12:31:44', 5),
(16, 6, 59, 'Carrot (Gagar)', 'Carrot (Gagar)', 'The carrot is a root vegetable, usually orange in colour, though purple, black, red, white, and yellow cultivars exist. They are a domesticated form of the wild carrot, Daucus carota, native to Europe and Southwestern Asia. The plant probably originated in Persia and was originally cultivated for its leaves and seeds.', 'assets/images/product/20201207141850.jpg', 40, 45, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 14:18:50', 5, '2021-01-13 10:59:05', 5),
(17, 6, 60, 'Radish (Mooli)', 'Radish (Mooli)', 'The radish is an edible root vegetable of the family Brassicaceae that was domesticated in Asia prior to Roman times. Radishes are grown and consumed throughout the world, being mostly eaten raw as a crunchy salad vegetable with bite', 'assets/images/product/20201207145616.png', 15, 20, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 14:22:42', 5, '2021-01-13 11:00:55', 5),
(18, 6, 61, 'Runner beans (Sem)', 'Runner beans (Sem)', 'The cowpea (Vigna unguiculata) is an annual herbaceous legume from the genus Vigna. Due to its tolerance for sandy soil and low rainfall, it is an important crop in the semiarid regions across Africa and Asia. It requires very few inputs, as the plant\'s root nodules are able to fix atmospheric nitrogen, making it a valuable crop for resource-poor farmers and well-suited to intercropping with other crops. The whole plant is used as forage for animals, with its use as cattle feed likely responsible for its name.', 'assets/images/product/20201207142505.jpg', 30, 40, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 14:25:05', 5, '2021-01-13 11:04:21', 5),
(19, 6, 49, 'Pea (Matar) (local)', 'Pea (Matar) (local)', 'The pea is most commonly the small spherical seed or the seed-pod of the pod fruit Pisum sativum. Each pod contains several peas, which can be green or yellow. Botanically, pea pods are fruit,[2] since they contain seeds and develop from the ovary of a (pea) flower.', 'assets/images/product/20201207142628.jpg', 40, 50, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 14:26:28', 5, '2021-01-13 11:04:46', 5),
(21, 6, 62, 'Cabbage / Bandha Gobhi / Bandha kobi', 'Cabbage / Bandha Gobhi / Bandha kobi\r\n', 'Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the \"cole crops\" or brassicas, meaning it is closely related to broccoli and cauliflower.', 'assets/images/product/20201207151109.jpg', 20, 30, 'piece', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 15:07:48', 5, '2021-01-08 12:33:20', 5),
(22, 6, 63, 'Cauliflower / Phool gobhi / Phula kobi', 'Cauliflower / Phool gobhi / Phula kobi\r\n', 'Cauliflower is one of several vegetables in the species Brassica oleracea in the genus Brassica, which is in the family Brassicaceae. It is an annual plant that reproduces by seed. Typically, only the head is eaten – the edible white flesh sometimes called \"curd\".', 'assets/images/product/20201207150910.jpg', 50, 55, 'piece', 2, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 15:09:10', 5, '2021-01-08 12:33:33', 5),
(23, 6, 64, 'Beetroot / Chukandar', 'Beetroot / Chukandar\r\n', 'The beetroot is the taproot portion of a beet plant, usually known in Canada and the USA as beets while the vegetable is referred to as beetroot in British English, and also known as the table beet, garden beet, red beet, dinner beet or golden beet.', 'assets/images/product/20201207151038.png', 40, 45, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 15:10:38', 5, '2021-01-13 11:04:02', 5),
(24, 6, 65, 'Green Chili / Haree Mirch / Kancha Lanka', 'Green Chili / Haree Mirch / Kancha Lanka\r\n', 'The chili pepper, from Nahuatl chīlli, is the fruit of plants from the genus Capsicum which are members of the nightshade family, Solanaceae. Chili peppers are widely used in many cuisines as a spice to add heat to dishes', 'assets/images/product/20201207152003.jpg', 20, 25, 'gram', 250, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 15:12:47', 5, '2021-01-08 12:33:52', 5),
(25, 6, 66, 'Ginger / Adarak / Ada', 'Ginger / Adarak / Ada\r\n', 'Ginger has a very long history of use in various forms of traditional/alternative medicine. It has been used to help digestion, reduce nausea and help fight the flu and common cold, to name a few.\r\n\r\nGinger can be used fresh, dried, powdered, or as an oil or juice, and is sometimes added to processed foods and cosmetics. It is a very common ingredient in recipes', 'assets/images/product/20201207151405.jpg', 20, 25, 'gram', 250, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 15:14:05', 5, '2021-01-08 12:34:20', 5),
(26, 6, 67, 'Garlic / Lahasun / Rasuna', 'Garlic / Lahasun / Rasuna\r\n', 'Garlic is an herb that is grown around the world. It is related to onion, leeks, and chives. It is thought that garlic is native to Siberia, but spread to other parts of the world over 5000 years ago. Garlic is most commonly used for conditions related to the heart and blood system', 'assets/images/product/20201207152025.jpg', 30, 32, 'gram', 250, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 15:15:41', 5, '2021-01-08 12:34:32', 5),
(28, 6, 68, 'Lemon / Neebu / Lembu', 'Lemon / Neebu / Lembu\r\n', 'The juice of the lemon is about 5% to 6% citric acid, with a pH of around 2.2, giving it a sour taste. The distinctive sour taste of lemon juice makes it a key ingredient in drinks and foods such as lemonade and lemon meringue pie', 'assets/images/product/20201207152046.jpg', 10, 15, 'piece', 3, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 15:19:36', 5, '2021-01-15 11:58:16', 5),
(29, 6, 69, 'Green Banana / Kachcha Kela / Kancha Kadali', 'Green Banana / Kachcha Kela / Kancha Kadali\r\n', 'Green bananas may provide some additional nutrients and benefits that yellow bananas do not. They\'re rich in resistant starch and pectin, which are filling, improve digestive health and help lower blood sugar levels. However, some people find that green bananas have a bitter taste and bad texture.', 'assets/images/product/20201207152228.jpg', 60, 65, 'piece', 12, 1, 12, 'n', 'n', 'n', 'n', 'y', '2020-12-07 15:22:07', 5, '2021-01-13 11:05:14', 5),
(33, 6, 50, 'Oal / Elephant Foot (Madrashi)', 'Oal / Elephant Foot (Madrashi)', 'Ooal,known as Elephant Foot Yam,this vegetable looks as elephant\'s foot. Elephant foot yam belongs to kingdom Plantae and \'Araceae\' family. Its binomial name is “Amorphophallus paeoniifolius”', 'assets/images/product/20201207155230.jpg', 60, 75, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 15:52:30', 5, '2020-12-19 09:46:08', 5),
(35, 6, 70, 'Tentuli ( Tamarind with Seed) / Imli / Tentuli', 'Tentuli ( Tamarind with Seed) / Imli / Tentuli', 'Tamarind is a leguminous tree bearing edible fruit that is indigenous to tropical Africa. The genus Tamarindus is monotypic, meaning that it contains only this species. The tamarind tree produces pod-like fruit that contains a brown, edible pulp used in cuisines around the world. ', 'assets/images/product/20201207155655.jpg', 15, 17, 'gram', 100, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 15:56:55', 5, '2021-01-08 12:35:45', 5),
(37, 6, 71, 'Kadima / Kakharu', 'Pumpkin / Kadima / Kakharu', 'A pumpkin is a cultivar of winter squash that is round with smooth, slightly ribbed skin, and most often deep yellow to orange in coloration. The thick shell contains the seeds and pulp.', 'assets/images/product/20201207160139.jpg', 60, 65, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-07 16:01:39', 5, '2020-12-18 17:45:54', 5),
(40, 2, 75, 'Banana', 'Banana / Kela (Green)', 'A ripe banana is yellow with brown spots and is soft. There is an increased flavor, especially sweetness. It contains 8 percent starch and 91 percent sugar. The high glycemic index makes ripe bananas easy to digest.', 'assets/images/product/20201218175625.png', 30, 35, 'piece', 12, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-08 09:40:53', 5, '2021-01-08 12:36:02', 5),
(41, 2, 76, 'Ripe Papaya / Papita (Hybrid)', 'Ripe Papaya / Papita (Hybrid)', 'Papayas are shaped similar to pears and can be up to 20 inches (51 cm) long. The skin is green when unripe and orange when ripe, while the flesh is yellow, orange or red.', 'assets/images/product/20201208094211.jpg', 40, 45, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-08 09:42:11', 5, '2020-12-19 09:49:22', 5),
(42, 2, 77, 'Apple', 'Imported Apple / Sebphal / Seo\r\n', 'Red Delicious Apple\r\n', 'assets/images/product/20201208094329.jpg', 160, 165, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-08 09:43:29', 5, '2020-12-19 13:57:34', 5),
(43, 2, 78, 'Pomegranate / Anaar / Dalimba (Big Size)', 'Pomegranate / Anaar / Dalimba (Big Size)\r\n', 'The pomegranate is a fruit-bearing deciduous shrub in the family Lythraceae, subfamily Punicoideae, that grows between 5 and 10 m tall. The pomegranate originated in the region extending from Iran to northern India, and has been cultivated since ancient times throughout the Mediterranean region', 'assets/images/product/20210106181117.jpg', 180, 210, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-08 09:44:41', 5, '2021-01-06 18:11:17', 5),
(44, 2, 75, 'Desi Ripe Banana / Desi Kela / Desi Pachila Kadli', 'Desi Ripe Banana / Desi Kela / Desi Pachila Kadli\r\n', 'Banana is the second most important fruit crop in India next to mango.\r\n', 'assets/images/product/20201208094556.jpg', 30, 35, 'piece', 6, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-08 09:45:56', 5, '2021-01-08 12:36:16', 5),
(45, 2, 79, 'Orange', 'Narangi / Orange', 'The orange is the fruit of various citrus species in the family Rutaceae; it primarily refers to Citrus × sinensis, which is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange.', 'assets/images/product/20201218182032.jpg', 60, 65, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-08 09:47:14', 5, '2020-12-18 18:20:32', 5),
(48, 2, 84, 'Coconut Tender / Hara Nariyal / Paida', 'Coconut Tender / Hara Nariyal / Paida\r\n', 'After drinking the water from the coconut, scrape the tender meat using a spoon to get a big piece of the coconut mea', 'assets/images/product/20201208095646.jpg', 50, 55, 'piece', 1, 50, 1, 'y', 'n', 'n', 'n', 'y', '2020-12-08 09:56:25', 5, '2021-01-08 12:36:45', 5),
(49, 2, 85, 'Pineapple / Anaanaas / Sapuri', 'Pineapple / Anaanaas / Sapuri\r\n', 'The pineapple is a tropical plant with an edible fruit, also called a pineapple, and the most economically significant plant in the family Bromeliaceae. The pineapple is indigenous to South America, where it has been cultivated for many centuries', 'assets/images/product/20201208095814.jpg', 65, 70, 'piece', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-08 09:58:14', 5, '2021-01-08 12:37:03', 5),
(50, 2, 80, 'Grapes Black / Kala Angoor', 'Grapes Black / Kala Angoor\r\n', 'Dark-skinned grapes contain lots of resveratrol, a phytochemical and antioxidant that is good for the heart.', 'assets/images/product/20201208100056.jpg', 220, 250, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-08 10:00:56', 5, '2020-12-18 18:28:38', 5),
(51, 2, 31, 'Mosambi', 'Mosambi', 'Citrus limetta, alternatively considered to be a cultivar of Citrus limon, C. limon \'Limetta\', is a species of citrus, commonly known as mousambi, musambi, sweet lime, sweet lemon, and sweet limetta,', 'assets/images/product/20201208100304.png', 50, 60, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-08 10:03:04', 5, '2020-12-16 10:34:22', 5),
(53, 2, 86, 'Sweet Potato / Shakarkand / Kandamool', 'Sweet Potato / Shakarkand / Kandamool\r\n', 'The sweet potato or sweetpotato is a dicotyledonous plant that belongs to the bindweed or morning glory family, Convolvulaceae. Its large, starchy, sweet-tasting, tuberous roots are a root vegetable. The young leaves and shoots are sometimes eaten as greens.', 'assets/images/product/20201208101405.jpg', 60, 65, 'kg', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-08 10:12:37', 5, '2021-01-08 12:36:32', 5),
(81, 2, 87, 'Cheeku', 'Chikoo Fruit\r\n', 'Chickoois another popular delicious tropical fruit in line with mango, banana, and jackfruit. Its calorie-rich soft, easily digestible pulp composes of simple sugars like fructose and sucrose that when eaten replenishes energy and revitalizes the body instantly.', 'assets/images/product/20201209154330.jpg', 100, 120, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-09 15:43:30', 5, '2020-12-19 09:57:33', 5),
(83, 2, 88, 'Kiwi', 'Kiwi Imported ', 'Kiwifruit is native to Northern China. Cultivation of the fuzzy kiwifruit spread from China in the early 20th century, when seeds were introduced to New Zealand by Mary Isabel Fraser . They can be grown in most temperate climates with adequate summer heat.', 'assets/images/product/20201209155510.png', 300, 330, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-09 15:55:10', 5, '2020-12-19 10:18:49', 5),
(84, 2, 89, 'Musk Melon/Kharbuja', 'Musk Melon/Kharbuja', 'Having a netlike/ reticulated skin covering, its a round melon with firm, orange, moderately sweet flesh and a thin, reticulated, light-grey rind. \r\n', 'assets/images/product/20201209160031.png', 100, 115, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-09 16:00:31', 5, '2020-12-19 10:24:19', 5),
(86, 2, 90, 'Nashpati', 'Fresh Pear Indian Nashpati Fruit', 'Sweet, delicious and rich flavored pears offer crunchiness of apples yet juicy as peach and nectarine\r\nThey are widely popular, particularly in the whole of the northern hemisphere, for their unique nutrient qualities', 'assets/images/product/20201209160741.jpg', 250, 270, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-09 16:07:41', 5, '2020-12-19 10:25:39', 5),
(87, 2, 91, 'Amla', 'Amla', 'Powerhouse of Vitamin C and antioxidants, amla is a superfruit\r\n', 'assets/images/product/20201209160943.png', 120, 150, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-09 16:09:43', 5, '2020-12-19 10:25:52', 5),
(88, 6, 48, 'Onion', 'Onion\r\n', 'Onion can fill your kitchen with a thick spicy aroma. It is a common base vegetable in most Indian dishes, thanks to the wonderful flavor that it adds to any dish. \r\n', 'assets/images/product/20201210105011.jpg', 40, 50, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-10 10:50:11', 5, '2020-12-25 13:03:23', 5),
(92, 6, 74, 'Turnip (shalgam)', 'Fresh Turnip\r\n', 'Turnips are made of edible roots, stem and leaves. They are starchy and succulent with a sweet and peppery flavour', 'assets/images/product/20201210113157.png', 30, 40, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-10 11:31:57', 5, '2020-12-18 17:49:22', 5),
(101, 6, 50, 'Oal / Elephant Foot (Local)', 'Oal / Elephant Foot (Local)', 'Ooal,known as Elephant Foot Yam,this vegetable looks as elephant\'s foot. Elephant foot yam belongs to kingdom Plantae and \'Araceae\' family. Its binomial name is “Amorphophallus paeoniifolius”', 'assets/images/product/20201214124325.png', 100, 110, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-14 12:43:25', 5, '2020-12-19 09:46:28', 5),
(104, 6, 48, 'SPRING ONION', 'Spring Onion / Hara Pyaj / Sagga Pyaj', 'Scallions are vegetables derived from various species in the genus Allium. Scallions have a milder taste than most onions. Their close relatives include garlic, shallot, leek, chive, and Chinese onions.', 'assets/images/product/20201217155246.jpg', 40, 45, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-17 15:52:46', 5, '2020-12-20 10:19:42', 5),
(110, 2, 75, 'Banana / Kela (Yellow)', 'Banana / Kela (Yellow)', 'A ripe banana is yellow with brown spots and is soft. There is an increased flavor, especially sweetness. It contains 8 percent starch and 91 percent sugar. The high glycemic index makes ripe bananas easy to digest.', 'assets/images/product/20201219094847.png', 60, 70, 'piece', 1, 1, 12, 'n', 'n', 'n', 'n', 'y', '2020-12-18 17:58:30', 5, '2021-01-08 12:37:23', 5),
(111, 2, 76, 'Ripe Papaya / Papita (Local)', 'Ripe Papaya / Papita (Local)', 'Papayas are shaped similar to pears and can be up to 20 inches (51 cm) long. The skin is green when unripe and orange when ripe, while the flesh is yellow, orange or red.', 'assets/images/product/20201218180044.jpg', 50, 55, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-18 18:00:44', 5, '2020-12-19 09:49:33', 5),
(112, 2, 77, 'Apple', 'Imported Apple / Sebphal / Seo\r\n', 'Red Delicious Apple\r\n', 'assets/images/product/20201219103334.png', 100, 110, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-18 18:09:24', 5, '2020-12-19 13:52:10', 5),
(113, 2, 77, 'Apple', 'Imported Apple / Sebphal / Seo\r\n', 'Red Delicious Apple\r\n', 'assets/images/product/20201219104657.jpg', 120, 125, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-18 18:10:22', 5, '2020-12-19 13:52:25', 5),
(114, 2, 78, 'Pomegranate / Anaar / Dalimba (SmallSize)', 'Pomegranate / Anaar / Dalimba (SmallSize)\r\n', 'The pomegranate is a fruit-bearing deciduous shrub in the family Lythraceae, subfamily Punicoideae, that grows between 5 and 10 m tall. The pomegranate originated in the region extending from Iran to northern India, and has been cultivated since ancient times throughout the Mediterranean region', 'assets/images/product/20201218181303.jpg', 140, 170, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-18 18:13:03', 5, '2021-01-06 18:10:41', 5),
(115, 2, 79, 'Mosambi', 'mosambi ', 'Help in weight loss\r\nTreats jaundice\r\nFights against cancer\r\n', 'assets/images/product/20201218182250.png', 80, 85, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-18 18:22:50', 5, '0000-00-00 00:00:00', 0),
(116, 2, 79, 'Malta ', 'Malta ', 'Malta is often referred to as miraculous fruit for those who suffer from recurrent fevers. It helps in eliminating symptoms fever and elimination of toxic elements from kidneys. Regular intake of fruit helps in\r\n\r\n', 'assets/images/product/20201218182648.png', 50, 55, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-18 18:26:48', 5, '0000-00-00 00:00:00', 0),
(117, 2, 81, 'Guava (Hybrid)', 'Guava (Hybrid)', 'Besides its unique taste and smell, guava is appreciated as one of the super fruits!!\r\n', 'assets/images/product/20201218183755.jpg', 100, 110, 'kg', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-18 18:37:55', 5, '2020-12-19 09:51:14', 5),
(118, 2, 82, 'Strawberry', 'Fresh Strawberry', 'Fresh, hygienic and natural\r\nGraded, sorted and premium quality fruits and vegetables', 'assets/images/product/20201218184035.png', 120, 135, 'piece', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-18 18:40:35', 5, '2021-01-08 12:37:55', 5),
(119, 14, 93, 'Cake', 'Delicious celebration cake', 'A Black Forest Cake would not be the same without the sour Morello cherries. These tart flavored cherries perfectly complement the rich chocolate flavor of the cake and the sweet whipped cream. I like to use the bottled dark mahogany red colored Morello Cherries that are packed in a light syrup.', 'assets/images/product/20201225070030.jpeg', 380, 450, 'piece', 1, 0, 1, 'y', 'n', 'n', 'y', 'y', '2020-12-25 07:00:30', 5, '2021-01-08 12:38:12', 5),
(121, 6, 52, 'Beans', 'Beans', 'Thin and cylindrical in shape, French Ring beans come with plump notches that enclose the peas inside. Peas are lime green in colour and semi starchy with sweet and grassy flavours.\r\n', 'assets/images/product/20201225152939.png', 30, 35, 'gram', 500, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-25 15:29:39', 5, '0000-00-00 00:00:00', 0),
(122, 6, 59, 'Carrot (Gagar)', 'Carrot (Gagar)', 'The carrot is a root vegetable, usually orange in colour, though purple, black, red, white, and yellow cultivars exist. They are a domesticated form of the wild carrot, Daucus carota, native to Europe and Southwestern Asia. The plant probably originated in Persia and was originally cultivated for its leaves and seeds.', 'assets/images/product/20201225153218.jpg', 21, 25, 'gram', 500, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-25 15:32:18', 5, '0000-00-00 00:00:00', 0),
(123, 6, 49, 'Pea (Matar) (local)', 'Pea (Matar) (local)', 'The pea is most commonly the small spherical seed or the seed-pod of the pod fruit Pisum sativum. Each pod contains several peas, which can be green or yellow. Botanically, pea pods are fruit,[2] since they contain seeds and develop from the ovary of a (pea) flower.', 'assets/images/product/20201225154231.jpg', 21, 25, 'gram', 500, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-25 15:42:31', 5, '0000-00-00 00:00:00', 0),
(125, 6, 53, 'Brinjal/Baingan', 'Brinjal/Baingan', 'Brinjal Purple Bharta has glossy skin and comes in wide range of shapes and sizes. The flesh is creamy and spongy with numerous tiny, smooth edible seeds. \r\n', 'assets/images/product/20201225154550.jpg', 16, 20, 'gram', 500, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-25 15:45:50', 5, '0000-00-00 00:00:00', 0),
(126, 6, 64, 'Beetroot / Chukandar', 'Beetroot / Chukandar\r\n', 'The beetroot is the taproot portion of a beet plant, usually known in Canada and the USA as beets while the vegetable is referred to as beetroot in British English, and also known as the table beet, garden beet, red beet, dinner beet or golden beet.', 'assets/images/product/20201225155214.png', 21, 25, 'gram', 500, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-25 15:52:14', 5, '2020-12-29 10:35:43', 5),
(127, 6, 50, 'Oal / Elephant Foot (Madrashi)', 'Oal / Elephant Foot (Madrashi)', 'Ooal,known as Elephant Foot Yam,this vegetable looks as elephant\'s foot. Elephant foot yam belongs to kingdom Plantae and \'Araceae\' family. Its binomial name is “Amorphophallus paeoniifolius”', 'assets/images/product/20201225155356.jpg', 31, 35, 'gram', 500, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-25 15:53:56', 5, '0000-00-00 00:00:00', 0),
(128, 6, 50, 'Oal / Elephant Foot (Local)', 'Oal / Elephant Foot (Local)', 'Ooal,known as Elephant Foot Yam,this vegetable looks as elephant\'s foot. Elephant foot yam belongs to kingdom Plantae and \'Araceae\' family. Its binomial name is “Amorphophallus paeoniifolius”', 'assets/images/product/20201225155524.png', 51, 55, 'gram', 500, 1, 1, 'n', 'N', 'n', 'n', 'y', '2020-12-25 15:55:24', 5, '0000-00-00 00:00:00', 0),
(129, 6, 71, 'Kadima / Kakharu', 'Pumpkin / Kadima / Kakharu', 'A pumpkin is a cultivar of winter squash that is round with smooth, slightly ribbed skin, and most often deep yellow to orange in coloration. The thick shell contains the seeds and pulp.', 'assets/images/product/20201225155719.jpg', 31, 35, 'gram', 500, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-25 15:57:19', 5, '0000-00-00 00:00:00', 0),
(130, 15, 94, 'Servokon Superior Room Heater', 'Servokon Superior Room Heater', 'Room heaters are used to heat a small space and are normally portable or fitted to a wall. Most room heaters use gas or electricity. Room heaters are convenient appliances that provide focused and localised heat which is particularly suitable in a room for people that are elderly, ill or with limited mobility.', 'assets/images/product/20201229134822.jpeg', 1060, 1845, 'piece', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-29 13:48:22', 5, '2020-12-29 15:23:22', 5),
(132, 15, 94, 'Servokon Blaze Room Heater', 'Servokon Blaze Room Heater', 'Room heaters are used to heat a small space and are normally portable or fitted to a wall. Most room heaters use gas or electricity. Room heaters are convenient appliances that provide focused and localised heat which is particularly suitable in a room for people that are elderly, ill or with limited mobility.', 'assets/images/product/20201229151840.jpeg', 1070, 1845, 'piece', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-29 15:18:40', 5, '2020-12-29 15:24:00', 5),
(133, 15, 94, 'Servokon Royal Room Heater', 'Servokon Royal Room Heater', 'Room heaters are used to heat a small space and are normally portable or fitted to a wall. Most room heaters use gas or electricity. Room heaters are convenient appliances that provide focused and localised heat which is particularly suitable in a room for people that are elderly, ill or with limited mobility.', 'assets/images/product/20201229152621.jpeg', 1070, 1845, 'piece', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-29 15:26:21', 5, '0000-00-00 00:00:00', 0),
(134, 15, 96, 'MIZZLE (SK-10CL-EG)', 'MIZZLE (SK-10CL-EG)\r\n', 'Water heating is a heat transfer process that uses an energy source to heat water above its initial temperature. ... Appliances that provide a continual supply of hot water are called water heaters, hot water heaters, hot water tanks, boilers, heat exchangers, geysers, or calorifiers.\r\n\r\n\r\nOuter Body: ABS Off White Body, Power & Heating\r\nLight Indicator\r\nInner Tank: Quadro-Layer Enameled SPCC with\r\nSingle Butt Welding\r\nElement Material: Enameled Incoloy 800', 'assets/images/product/20201229154521.png', 7498, 13499, 'piece', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-29 15:45:21', 5, '2020-12-29 15:48:18', 5),
(135, 15, 96, 'FLURRY G (SK-15CR-EG)', 'FLURRY G (SK-15CR-EG)\r\n', 'FLURRY G (SK-15CR-EG)\r\nOuter Body: ABS Off White Body, Power & Heating\r\nLight Indicator\r\nInner Tank: Quadro-Layer Enameled SPCC with\r\nSingle Butt Welding\r\nElement Material: Enameled Incoloy 800\r\nBEE Rating: 5 Star Rating', 'assets/images/product/20201229154946.png', 9221, 16599, 'piece', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-29 15:49:46', 5, '0000-00-00 00:00:00', 0),
(136, 15, 96, 'FLURRY S (SK-25CR-EG)', 'FLURRY S (SK-25CR-EG)\r\n', 'FLURRY S (SK-25CR-EG)\r\nOuter Body: ABS Off White Body, Power & Heating\r\nLight Indicator\r\nInner Tank: Quadro-Layer Enameled SPCC with\r\nSingle Butt Welding\r\nElement Material: Enameled Incoloy 800\r\nBEE Rating: 5 Star Rating', 'assets/images/product/20201229155152.png', 11055, 19899, 'piece', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-29 15:51:52', 5, '0000-00-00 00:00:00', 0),
(138, 15, 96, 'SERVOKON 15 L Storage Water Geyser (Electric Geyser Wonder 15 Ltr., White)', 'SERVOKON 15 L Storage Water Geyser (Electric Geyser Wonder 15 Ltr., White)', 'WONDER\r\nOuter Body: Stainless Steel Body, Power &\r\nHeating Pilot Lamp Indicators 15L 5388 8082\r\nInner Tank: SS Tank\r\nElement Material: Copper CKD Cutout ', 'assets/images/product/20201229160157.jpeg', 5388, 8082, 'piece', NULL, 1, 1, 'n', 'n', 'n', 'n', 'y', '2020-12-29 16:01:57', 5, '0000-00-00 00:00:00', 0),
(139, 6, 48, 'SPRING ONION', 'Spring Onion / Hara Pyaj / Sagga Pyaj', 'Scallions are vegetables derived from various species in the genus Allium. Scallions have a milder taste than most onions. Their close relatives include garlic, shallot, leek, chive, and Chinese onions.', 'assets/images/product/20210106152736.jpg', 21, 25, 'gram', 500, 1, 1, 'n', 'n', 'n', 'n', 'y', '2021-01-06 15:27:36', 5, '0000-00-00 00:00:00', 0),
(140, 2, 88, 'Kiwi', 'Kiwi Imported ', 'Kiwifruit is native to Northern China. Cultivation of the fuzzy kiwifruit spread from China in the early 20th century, when seeds were introduced to New Zealand by Mary Isabel Fraser . They can be grown in most temperate climates with adequate summer heat.', 'assets/images/product/20210106153558.png', 35, 40, 'piece', 1, 1, 1, 'n', 'n', 'n', 'n', 'y', '2021-01-06 15:29:19', 5, '2021-01-08 12:38:56', 5),
(141, 6, 48, 'Onion', 'Onion', 'Onion can fill your kitchen with a thick spicy aroma. It is a common base vegetable in most Indian dishes, thanks to the wonderful flavor that it adds to any dish. \r\n', 'assets/images/product/20210107111229.jpg', 21, 25, 'gram', 500, 1, 1, 'n', 'n', 'n', 'n', 'y', '2021-01-07 11:12:29', 5, '2021-01-08 12:39:09', 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_group`
--

CREATE TABLE `product_group` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text,
  `product_ids` text,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` text,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `product_id`, `image`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(5, 1, 'assets/images/product/gallery/202011031648591.jpeg', 'y', '2020-11-03 16:48:59', 5, '0000-00-00 00:00:00', 0),
(6, 1, 'assets/images/product/gallery/202011031648592.jpg', 'y', '2020-11-03 16:48:59', 5, '0000-00-00 00:00:00', 0),
(9, 1, 'assets/images/product/gallery/202011061724021.png', 'y', '2020-11-06 17:24:02', 5, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `comment` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(11) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `link` varchar(200) NOT NULL,
  `text` varchar(15) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `icon`, `link`, `text`, `status`) VALUES
(1, 'fab fa-facebook-f', 'https://facebook.com', '', 'y'),
(2, 'fab fa-instagram', 'https://instagram.com', '', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `title`, `country_id`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(2, 'Katmandu', 7, 'y', '2020-11-02 11:00:48', 5, '0000-00-00 00:00:00', 0),
(3, 'Bihar', 6, 'y', '2020-12-12 15:05:02', 5, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `position` int(11) DEFAULT NULL,
  `home_screen` varchar(1) NOT NULL DEFAULT 'n',
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `category_id`, `title`, `image`, `position`, `home_screen`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(1, 1, 'Our Team', 'assets/images/sub_category/20201102131310.jpg', 1, 'y', 'y', '2020-10-31 17:20:41', 5, '2020-11-02 13:13:10', 5),
(33, 3, 'Daily Breakfast', 'assets/images/sub_category/20201208114320.png', 1, 'y', 'y', '2020-12-08 11:42:21', 5, '2020-12-08 11:43:20', 5),
(34, 3, 'Beverages', 'assets/images/sub_category/20201208120018.png', 3, 'y', 'y', '2020-12-08 12:00:18', 5, '2020-12-09 12:21:31', 5),
(37, 3, 'Cake', 'assets/images/sub_category/20201208125158.png', 2, 'y', 'y', '2020-12-08 12:51:58', 5, '2020-12-09 11:08:39', 5),
(38, 9, 'Daily Grocery', 'assets/images/sub_category/20201209105254.png', 1, 'y', 'y', '2020-12-09 10:52:54', 5, '0000-00-00 00:00:00', 0),
(39, 11, 'Dry Fruit\'s', 'assets/images/sub_category/20201209112258.png', 1, 'n', 'y', '2020-12-09 11:22:58', 5, '0000-00-00 00:00:00', 0),
(40, 9, 'Personal Care', 'assets/images/sub_category/20201209120538.jpg', 2, 'y', 'y', '2020-12-09 12:05:38', 5, '0000-00-00 00:00:00', 0),
(41, 9, 'Cleaners', 'assets/images/sub_category/20201209121027.jpg', 2, 'y', 'y', '2020-12-09 12:10:27', 5, '0000-00-00 00:00:00', 0),
(42, 12, 'Beverage & Snacks', 'assets/images/sub_category/20201209144102.jpg', 1, 'y', 'y', '2020-12-09 14:28:13', 5, '2020-12-09 14:41:02', 5),
(43, 12, 'Cake', 'assets/images/sub_category/20201209142857.png', 2, 'y', 'y', '2020-12-09 14:28:57', 5, '0000-00-00 00:00:00', 0),
(44, 12, 'Breakfast', 'assets/images/sub_category/20201209142951.png', 1, 'y', 'y', '2020-12-09 14:29:51', 5, '0000-00-00 00:00:00', 0),
(45, 13, 'Spice (Masala)', 'assets/images/sub_category/20201211112514.png', 1, 'y', 'y', '2020-12-11 11:25:14', 5, '0000-00-00 00:00:00', 0),
(46, 6, 'Potato', 'assets/images/sub_category/20201218165255.png', 1, 'y', 'y', '2020-12-18 16:50:49', 5, '2020-12-18 16:52:55', 5),
(47, 6, 'Tomato', 'assets/images/sub_category/20201218165525.jpg', 1, 'y', 'y', '2020-12-18 16:55:25', 5, '0000-00-00 00:00:00', 0),
(48, 6, 'Onion (Pyaj)', 'assets/images/sub_category/20201218165838.jpg', 3, 'y', 'y', '2020-12-18 16:58:38', 5, '0000-00-00 00:00:00', 0),
(49, 6, 'Pea (Matar)', 'assets/images/sub_category/20201218170239.jpg', 1, 'y', 'y', '2020-12-18 17:02:39', 5, '0000-00-00 00:00:00', 0),
(50, 6, 'Ooal / Elephant Foot	', 'assets/images/sub_category/20201218170813.jpg', 1, 'y', 'y', '2020-12-18 17:08:13', 5, '0000-00-00 00:00:00', 0),
(51, 6, 'Lady\'s Finger (Bhindi)', 'assets/images/sub_category/20201218171514.png', 1, 'y', 'y', '2020-12-18 17:15:14', 5, '0000-00-00 00:00:00', 0),
(52, 6, 'Beans', 'assets/images/sub_category/20201218171755.png', 1, 'y', 'y', '2020-12-18 17:17:55', 5, '0000-00-00 00:00:00', 0),
(53, 6, 'Brinjal/Baingan', 'assets/images/sub_category/20201218171900.jpg', 1, 'y', 'y', '2020-12-18 17:19:00', 5, '0000-00-00 00:00:00', 0),
(54, 6, 'Dhaniya patta	', 'assets/images/sub_category/20201218172030.jpg', 1, 'y', 'y', '2020-12-18 17:20:30', 5, '0000-00-00 00:00:00', 0),
(55, 6, 'Spinch (Palak Sag)	', 'assets/images/sub_category/20201218172417.jpg', 1, 'y', 'y', '2020-12-18 17:24:17', 5, '0000-00-00 00:00:00', 0),
(56, 6, 'Bitter gourd (karela)	', 'assets/images/sub_category/20201218172543.jpg', 1, 'y', 'y', '2020-12-18 17:25:43', 5, '0000-00-00 00:00:00', 0),
(57, 6, 'Pumpkin (Kaddu)	', 'assets/images/sub_category/20201218173043.jpg', 1, 'y', 'y', '2020-12-18 17:30:43', 5, '0000-00-00 00:00:00', 0),
(58, 6, 'Shimla Mirch (Capsicum)	', 'assets/images/sub_category/20201218173237.jpg', 1, 'y', 'y', '2020-12-18 17:32:37', 5, '0000-00-00 00:00:00', 0),
(59, 6, 'Carrot (Gagar)	', 'assets/images/sub_category/20201218173320.jpg', 1, 'y', 'y', '2020-12-18 17:33:20', 5, '0000-00-00 00:00:00', 0),
(60, 6, 'Radish (Mooli)	', 'assets/images/sub_category/20201218173358.png', 1, 'y', 'y', '2020-12-18 17:33:58', 5, '0000-00-00 00:00:00', 0),
(61, 6, 'Runner beans (Sem)	', 'assets/images/sub_category/20201218173526.jpg', 1, 'y', 'y', '2020-12-18 17:35:26', 5, '0000-00-00 00:00:00', 0),
(62, 6, 'Cabbage / Bandha Gobhi / Bandha kobi	', 'assets/images/sub_category/20201218173614.jpg', 1, 'y', 'y', '2020-12-18 17:36:14', 5, '0000-00-00 00:00:00', 0),
(63, 6, 'Cauliflower / Phool gobhi / Phula kobi	', 'assets/images/sub_category/20201218173654.jpg', 1, 'y', 'y', '2020-12-18 17:36:54', 5, '0000-00-00 00:00:00', 0),
(64, 6, 'Beetroot / Chukandar	', 'assets/images/sub_category/20201218173738.png', 1, 'y', 'y', '2020-12-18 17:37:38', 5, '0000-00-00 00:00:00', 0),
(65, 6, 'Green Chili / Haree Mirch / Kancha Lanka	', 'assets/images/sub_category/20201218173808.jpg', 1, 'y', 'y', '2020-12-18 17:38:08', 5, '0000-00-00 00:00:00', 0),
(66, 6, 'Ginger / Adarak / Ada	', 'assets/images/sub_category/20201218173827.jpg', 1, 'y', 'y', '2020-12-18 17:38:27', 5, '0000-00-00 00:00:00', 0),
(67, 6, 'Garlic / Lahasun / Rasuna	', 'assets/images/sub_category/20201218174016.jpg', 1, 'y', 'y', '2020-12-18 17:40:16', 5, '0000-00-00 00:00:00', 0),
(68, 6, 'Lemon / Neebu / Lembu	', 'assets/images/sub_category/20201218174100.jpg', 1, 'y', 'y', '2020-12-18 17:41:00', 5, '0000-00-00 00:00:00', 0),
(69, 6, 'Green Banana / Kachcha Kela / Kancha Kadali	', 'assets/images/sub_category/20201218174144.jpg', 1, 'y', 'y', '2020-12-18 17:41:44', 5, '0000-00-00 00:00:00', 0),
(70, 6, 'Tentuli ( Tamarind with Seed) / Imli / Tentuli	', 'assets/images/sub_category/20201218174236.jpg', 1, 'y', 'y', '2020-12-18 17:42:36', 5, '0000-00-00 00:00:00', 0),
(71, 6, 'Kadima / Kakharu', 'assets/images/sub_category/20201218174317.jpg', 1, 'y', 'y', '2020-12-18 17:43:17', 5, '0000-00-00 00:00:00', 0),
(72, 6, 'Kathal (Jackfruit)	', 'assets/images/sub_category/20201218174726.jpg', 1, 'y', 'y', '2020-12-18 17:47:26', 5, '0000-00-00 00:00:00', 0),
(73, 6, 'Pointed gourd (Parval)	', 'assets/images/sub_category/20201218174815.jpg', 1, 'y', 'y', '2020-12-18 17:48:15', 5, '0000-00-00 00:00:00', 0),
(74, 6, 'Turnip (shalgam)	', 'assets/images/sub_category/20201218174905.jpg', 1, 'y', 'y', '2020-12-18 17:49:05', 5, '0000-00-00 00:00:00', 0),
(75, 2, 'Banana', 'assets/images/sub_category/20201218175120.png', 1, 'y', 'y', '2020-12-18 17:51:20', 5, '2020-12-18 17:54:36', 5),
(76, 2, 'Ripe Papaya / Papita	', 'assets/images/sub_category/20201218175837.jpg', 1, 'y', 'y', '2020-12-18 17:58:37', 5, '0000-00-00 00:00:00', 0),
(77, 2, 'Apple', 'assets/images/sub_category/20201218180042.jpg', 1, 'y', 'y', '2020-12-18 18:00:42', 5, '0000-00-00 00:00:00', 0),
(78, 2, 'Pomegranate / Anaar / Dalimba	', 'assets/images/sub_category/20201218181105.jpg', 1, 'y', 'y', '2020-12-18 18:11:05', 5, '0000-00-00 00:00:00', 0),
(79, 2, 'Local Orange / Santara / Kamala	', 'assets/images/sub_category/20201218181453.png', 1, 'y', 'y', '2020-12-18 18:14:53', 5, '0000-00-00 00:00:00', 0),
(80, 2, 'Grapes', 'assets/images/sub_category/20201218182607.jpg', 1, 'y', 'y', '2020-12-18 18:26:07', 5, '0000-00-00 00:00:00', 0),
(81, 2, 'Guava (Amrud)	', 'assets/images/sub_category/20201218182911.jpg', 1, 'y', 'y', '2020-12-18 18:29:11', 5, '0000-00-00 00:00:00', 0),
(82, 2, 'Strawberry', 'assets/images/sub_category/20201218183930.png', 1, 'y', 'y', '2020-12-18 18:39:30', 5, '0000-00-00 00:00:00', 0),
(83, 2, 'Watermelon Long / Tarbooj / Tarbhooja	', 'assets/images/sub_category/20201219095226.jpg', 1, 'y', 'y', '2020-12-19 09:52:26', 5, '0000-00-00 00:00:00', 0),
(84, 2, 'Coconut Tender / Hara Nariyal / Paida	', 'assets/images/sub_category/20201219095326.jpg', 1, 'y', 'y', '2020-12-19 09:53:26', 5, '0000-00-00 00:00:00', 0),
(85, 2, 'Pineapple / Anaanaas / Sapuri	', 'assets/images/sub_category/20201219095405.jpg', 1, 'y', 'y', '2020-12-19 09:54:05', 5, '0000-00-00 00:00:00', 0),
(86, 2, 'Sweet Potato / Shakarkand / Kandamool	', 'assets/images/sub_category/20201219095612.jpg', 1, 'y', 'y', '2020-12-19 09:56:12', 5, '0000-00-00 00:00:00', 0),
(87, 2, 'Cheeku', 'assets/images/sub_category/20201219095707.jpg', 1, 'y', 'y', '2020-12-19 09:57:07', 5, '0000-00-00 00:00:00', 0),
(88, 2, 'Kiwi', 'assets/images/sub_category/20201219101358.png', 1, 'y', 'y', '2020-12-19 10:13:58', 5, '0000-00-00 00:00:00', 0),
(89, 2, 'Musk Melon/Kharbuja	', 'assets/images/sub_category/20201219102401.png', 1, 'y', 'y', '2020-12-19 10:24:01', 5, '0000-00-00 00:00:00', 0),
(90, 2, 'Nashpati', 'assets/images/sub_category/20201219102501.jpg', 1, 'y', 'y', '2020-12-19 10:25:01', 5, '0000-00-00 00:00:00', 0),
(91, 2, 'Amla', 'assets/images/sub_category/20201219102529.png', 1, 'y', 'y', '2020-12-19 10:25:29', 5, '0000-00-00 00:00:00', 0),
(92, 2, 'Dragon Fruit	', 'assets/images/sub_category/20201219102657.jpg', 1, 'y', 'y', '2020-12-19 10:26:57', 5, '0000-00-00 00:00:00', 0),
(93, 14, 'Black forest  Cake', 'assets/images/sub_category/20201225065723.jpeg', 1, 'y', 'y', '2020-12-25 06:57:23', 5, '0000-00-00 00:00:00', 0),
(94, 15, 'Servokon Room Heater', 'assets/images/sub_category/20201229134604.jpeg', 3, 'y', 'y', '2020-12-29 13:46:04', 5, '2020-12-29 15:22:26', 5),
(95, 16, 'Servokon Water Heater', 'assets/images/sub_category/20201229153440.png', 6, 'y', 'y', '2020-12-29 15:34:40', 5, '0000-00-00 00:00:00', 0),
(96, 15, 'Servokon Water Heater', 'assets/images/sub_category/20201229154003.png', 2, 'y', 'y', '2020-12-29 15:40:03', 5, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `id` int(11) NOT NULL,
  `template` varchar(200) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `template`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(3, 'tests', 'y', '2020-11-02 15:55:07', 5, '2020-12-12 15:03:02', 5);

-- --------------------------------------------------------

--
-- Table structure for table `time_slot`
--

CREATE TABLE `time_slot` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'y',
  `inserted_at` datetime NOT NULL,
  `inserted_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `time_slot`
--

INSERT INTO `time_slot` (`id`, `title`, `start_time`, `end_time`, `status`, `inserted_at`, `inserted_by`, `modified_at`, `modified_by`) VALUES
(2, '09:00 AM - 12:00 AM', '09:00:00', '12:00:00', 'y', '2021-01-13 16:07:43', 5, '2021-01-16 10:52:21', 5),
(3, '08:00 AM - 10:10 AM', '08:00:00', '10:10:00', 'y', '2021-01-13 16:10:26', 5, '2021-01-16 10:52:26', 5),
(4, '03:00 PM - 08:00 PM', '15:00:00', '20:00:00', 'y', '2021-01-13 16:10:50', 5, '2021-01-16 10:52:31', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_rights`
--
ALTER TABLE `admin_rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `important_links`
--
ALTER TABLE `important_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master`
--
ALTER TABLE `master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_progress`
--
ALTER TABLE `order_progress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_group`
--
ALTER TABLE `product_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slot`
--
ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_rights`
--
ALTER TABLE `admin_rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=997;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `important_links`
--
ALTER TABLE `important_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master`
--
ALTER TABLE `master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=514;

--
-- AUTO_INCREMENT for table `order_progress`
--
ALTER TABLE `order_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `product_group`
--
ALTER TABLE `product_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `time_slot`
--
ALTER TABLE `time_slot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
