-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 16, 2023 at 11:42 AM
-- Server version: 8.0.34-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fwpassociation`
--
CREATE DATABASE IF NOT EXISTS `fwpassociation` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fwpassociation`;

-- --------------------------------------------------------

--
-- Table structure for table `biodatas`
--

CREATE TABLE `biodatas` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `occupation` varchar(200) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nin` varchar(100) DEFAULT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `marital` varchar(100) DEFAULT NULL,
  `spouse` varchar(100) DEFAULT NULL,
  `children` varchar(255) DEFAULT NULL,
  `father` varchar(200) DEFAULT NULL,
  `mother` varchar(200) DEFAULT NULL,
  `nextofkin` varchar(60) DEFAULT NULL,
  `nextofkinaddress` varchar(45) DEFAULT NULL,
  `nxtnin` varchar(56) DEFAULT NULL,
  `nxtcont` int DEFAULT NULL,
  `nxtemail` varchar(100) DEFAULT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `biodatas`
--

INSERT INTO `biodatas` (`id`, `user_id`, `address`, `occupation`, `nationality`, `dob`, `nin`, `passport`, `marital`, `spouse`, `children`, `father`, `mother`, `nextofkin`, `nextofkinaddress`, `nxtnin`, `nxtcont`, `nxtemail`, `relationship`, `status`, `created_at`, `updated_at`) VALUES
(1, 33, 'KIREKA', 'ENGINEER', 'UGANDAN', '1992-10-10', 'CM921011011D4J', 'A00949348', 'Married', 'AGATHA AKAMPWERA', 'HARRI RAULIN KAMUGISHA , ALLYSSA GRACE KAMUGISHA', NULL, 'CHARITY KYOMUGASHO', 'AGATHA AKAMPWERA', 'KIREKA', 'CF94055103UK1J', 756225964, 'agathaakampwera@gmail.com', 'WIFE', 1, '2023-06-06 16:44:46', '2023-06-06 17:04:01');

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `id` int NOT NULL,
  `user` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`id`, `user`, `amount`, `reason`, `date`, `created_at`, `updated_at`) VALUES
(4, 11, 3450, 'Bank Charges Agent', '2021-10-08', '2021-10-13 15:17:52', '2021-10-13 15:17:52'),
(3, 15, 600000, 'Rental fees for Land for Year 2021', '2021-07-01', '2021-10-13 14:27:36', '2021-10-13 14:27:36'),
(5, 16, 1150, 'Bank Charges Agent', '2021-10-05', '2021-10-13 15:19:14', '2021-10-13 15:19:14'),
(6, 11, 3450, 'RTGS Charges', '2021-12-09', '2021-12-11 12:28:25', '2021-12-11 12:28:25'),
(7, 11, 3450, 'RTGS Charges', '2021-12-10', '2021-12-11 12:29:06', '2021-12-11 12:29:06'),
(8, 11, 3450, 'RTGS Charges', '2021-11-08', '2021-12-11 12:42:31', '2021-12-11 12:42:31'),
(9, 10, 3450, 'EFT charges', '2021-12-13', '2021-12-24 17:19:59', '2021-12-24 17:19:59'),
(10, 15, 600000, 'Lease of Land at Kiwenda', '2022-01-07', '2022-01-07 16:09:06', '2022-01-07 16:09:06'),
(11, 9, 100000, 'Absent for meeting', '2022-01-18', '2022-01-18 19:19:00', '2022-01-18 19:19:00'),
(20, 11, 3450, 'Bank charges', '2022-06-02', '2022-06-02 08:28:55', '2022-06-02 08:28:55'),
(19, 11, 3450, 'RTGS', '2022-05-10', '2022-05-10 11:15:28', '2022-05-10 11:15:28'),
(17, 11, 3450, 'RTGS', '2022-03-10', '2022-03-10 14:36:03', '2022-03-10 14:36:03'),
(16, 11, 3450, 'EFT Charges', '2022-02-08', '2022-02-10 07:59:16', '2022-02-10 07:59:16'),
(21, 11, 3450, 'RTGS', '2022-07-11', '2022-07-11 20:07:06', '2022-07-11 20:07:06'),
(22, 16, 3450, 'EFT Charges', '2022-07-26', '2022-08-08 17:26:35', '2022-08-08 17:26:35'),
(23, 11, 3450, 'RTGS', '2022-08-10', '2022-08-10 10:37:44', '2022-08-10 10:37:44'),
(24, 11, 3450, 'RTGS Charges', '2022-09-02', '2022-09-03 07:54:33', '2022-09-03 07:54:33'),
(25, 16, 3450, 'EFT charges', '2022-08-24', '2022-09-03 07:55:18', '2022-09-03 07:55:18'),
(26, 18, 1150, 'Cash deposit charges', '2022-09-10', '2022-09-10 10:38:32', '2022-09-10 10:38:32'),
(27, 19, 1150, 'Cash deposit charges', '2022-09-10', '2022-09-10 10:39:06', '2022-09-10 10:39:06'),
(28, 11, 3450, 'RTGS charges', '2022-10-10', '2022-10-10 13:45:59', '2022-10-10 13:45:59'),
(29, 16, 3450, 'Bank eft charges', '2022-12-05', '2022-12-05 20:49:13', '2022-12-05 20:49:13'),
(30, 11, 3450, 'RTGS CHARGES', '2023-01-03', '2023-01-03 13:11:14', '2023-01-03 13:11:14'),
(31, 16, 3450, 'EFT charges', '2023-01-27', '2023-02-04 08:33:37', '2023-02-04 08:33:37'),
(32, 11, 3450, 'EFT charges', '2023-02-10', '2023-02-10 15:57:02', '2023-02-10 15:57:02'),
(33, 11, 3450, 'RTGS Charges', '2023-05-10', '2023-05-10 11:59:53', '2023-05-10 11:59:53'),
(34, 16, 6900, 'EFT Charges,', '2023-05-22', '2023-05-23 17:14:57', '2023-05-23 17:14:57'),
(35, 33, 12206560, 'Investment fee FY 2022/23', '2023-05-23', '2023-06-06 17:47:36', '2023-06-06 17:47:36'),
(36, 11, 3450, 'RTGS Charges', '2023-10-11', '2023-10-11 14:57:48', '2023-10-11 14:57:48');

-- --------------------------------------------------------

--
-- Table structure for table `departures`
--

CREATE TABLE `departures` (
  `id` int NOT NULL,
  `person` int DEFAULT NULL,
  `payout_amount` bigint DEFAULT NULL,
  `paid` int DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `cheque` varchar(255) DEFAULT NULL,
  `cheque_no` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departures`
--

INSERT INTO `departures` (`id`, `person`, `payout_amount`, `paid`, `reason`, `cheque`, `cheque_no`, `date`, `status`, `created_at`, `updated_at`) VALUES
(1, 25, 121500, 500000, 'UNABLE TO MEET THE MONTHLY SAVINGS', '1634196400Josephat.pdf', '00000', '2018-08-10', 3, '2021-10-14 07:08:55', '2021-10-14 07:26:41'),
(2, 28, -103230, NULL, 'FAILED TO RAISE THE MONTHLY SAVINGS', NULL, NULL, NULL, 4, '2021-10-14 07:31:20', '2021-10-14 07:33:22'),
(3, 26, 729270, NULL, 'UNDISCLOSED PERSONAL REASONS', NULL, NULL, NULL, 4, '2021-10-14 07:42:00', '2021-10-14 07:44:09'),
(4, 21, 1224000, 1331150, 'UNABLE TO MEET OBLIGATIONS MONTHLY', '1634277863Karya.jpeg', '00006', '2018-10-10', 3, '2021-10-15 05:58:56', '2021-10-15 06:04:23'),
(5, 26, 729270, NULL, 'UNABLE TO SAVE MONTHLY', NULL, NULL, NULL, 4, '2021-10-15 06:06:13', '2021-10-15 07:03:39'),
(6, 26, 729270, NULL, 'UNABLE TO MEET MONTHLY SAVINGS', NULL, NULL, NULL, 4, '2021-10-15 07:10:12', '2021-10-15 07:15:15'),
(7, 26, 729270, 876920, 'UNABLE TO MEET MONTHLY SAVINGS', '1634282842inno.jpeg', '00007', '2018-10-10', 3, '2021-10-15 07:23:44', '2021-10-15 07:27:22'),
(8, 27, 0, 0, 'HE DID NOT START. HE ONLY PAID MEMBERSHIP FEES', '1634284301NO payment.jpeg', '000000', '2018-06-10', 3, '2021-10-15 07:30:38', '2021-10-15 07:51:41'),
(9, 20, 2605770, 2605770, 'UNABLE TO MEET OBLIGATIONS', '1634284678Chris.jpeg', '0000014', '2019-04-11', 3, '2021-10-15 07:54:21', '2021-10-15 07:57:58'),
(10, 14, 10970909, 11169901, 'PERSONAL REASONS', '1634285911VK Payout.jpeg', '0000046', '2021-01-08', 3, '2021-10-15 07:59:37', '2021-10-15 08:18:31'),
(11, 24, 958770, NULL, 'HAVE BEEN UNABLE TO SAVE', NULL, NULL, NULL, 2, '2021-10-15 08:20:11', '2021-10-15 08:55:39'),
(12, 28, -103230, 0, 'UNABLE TO MAKE MONTHLY SAVINGS', '1634288214NO payment.jpeg', '00000', '2018-10-10', 3, '2021-10-15 08:39:01', '2021-10-15 08:56:54'),
(13, 23, 1264770, 1371920, 'UNABLE TO MEET MONTHLY OBLIGATIONS', '1634288650Anoch.jpeg', '000005', '2021-10-15', 3, '2021-10-15 08:59:06', '2021-10-15 09:04:10'),
(14, 9, -557973, 1571808, 'FINANCIAL CHALLENGES. HOPE TO ORGANISE MYSELF AND REJOIN IN 6 MONTHS THE REASON WE SHALL NOT BALANCE OFF LOSSES AND PROFITS', '1643399314ANGARUKAMU PAY OUT.jpeg', '000100', '2022-01-27', 3, '2022-01-07 07:26:04', '2022-01-28 19:48:34'),
(15, 15, -15573261, NULL, 'Unable to make payments on time as required by the inhouse rules. To request to join again when I fix the challenge at hand.', NULL, NULL, NULL, 2, '2022-10-07 19:23:56', '2022-10-08 16:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `departure_declines`
--

CREATE TABLE `departure_declines` (
  `id` int NOT NULL,
  `rId` int DEFAULT NULL,
  `requester` int DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `seen` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `declined_by` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departure_declines`
--

INSERT INTO `departure_declines` (`id`, `rId`, `requester`, `reason`, `seen`, `created_at`, `updated_at`, `declined_by`) VALUES
(6, 2, 28, 'He is Negatives. Can you clear his outstanding', 0, '2021-10-14 07:33:22', '2021-10-14 07:33:22', 'treasurer'),
(7, 3, 26, 'The reason not clear. Ask him to state a clear reason for our own improvement', 0, '2021-10-14 07:44:09', '2021-10-14 07:44:09', 'chairman'),
(8, 5, 26, 'Give clear reasons', 0, '2021-10-15 07:03:39', '2021-10-15 07:03:39', 'treasurer'),
(9, 6, 26, 'Postpone the request', 0, '2021-10-15 07:15:15', '2021-10-15 07:15:15', 'chairman');

-- --------------------------------------------------------

--
-- Table structure for table `disburses`
--

CREATE TABLE `disburses` (
  `id` int NOT NULL,
  `loans_id` int NOT NULL,
  `cheque_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cheque_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disburses`
--

INSERT INTO `disburses` (`id`, `loans_id`, `cheque_no`, `cheque_image`, `created_at`, `updated_at`) VALUES
(1, 1, '30', NULL, '2021-10-08 13:17:59', '2021-10-08 13:17:59'),
(2, 2, '000037 and 000038', NULL, '2021-10-09 07:53:41', '2021-10-09 07:53:41'),
(3, 3, '000060', NULL, '2021-10-09 08:16:59', '2021-10-09 08:16:59'),
(4, 4, '0000', NULL, '2021-10-09 08:23:28', '2021-10-09 08:23:28'),
(5, 5, '000051', NULL, '2021-10-09 13:34:43', '2021-10-09 13:34:43'),
(6, 6, '000043', NULL, '2021-10-09 13:39:06', '2021-10-09 13:39:06'),
(7, 7, '000064', NULL, '2021-10-09 13:41:13', '2021-10-09 13:41:13'),
(8, 8, '0000', NULL, '2021-10-09 13:56:27', '2021-10-09 13:56:27'),
(9, 9, '0000', NULL, '2021-10-09 13:58:19', '2021-10-09 13:58:19'),
(10, 10, '0000', NULL, '2021-10-09 14:01:23', '2021-10-09 14:01:23'),
(11, 11, '00000', NULL, '2021-10-09 14:14:29', '2021-10-09 14:14:29'),
(12, 12, '00000', NULL, '2021-10-09 14:21:37', '2021-10-09 14:21:37'),
(13, 13, '000033', NULL, '2021-10-09 14:52:14', '2021-10-09 14:52:14'),
(14, 14, '000040', NULL, '2021-10-09 14:54:54', '2021-10-09 14:54:54'),
(15, 15, '00000', NULL, '2021-10-09 15:32:13', '2021-10-09 15:32:13'),
(16, 16, '000048', NULL, '2021-10-09 15:34:09', '2021-10-09 15:34:09'),
(17, 17, '000068', NULL, '2021-10-09 15:35:34', '2021-10-09 15:35:34'),
(18, 18, '000059', NULL, '2021-10-09 15:43:47', '2021-10-09 15:43:47'),
(19, 19, '00000', NULL, '2021-10-09 15:46:23', '2021-10-09 15:46:23'),
(20, 20, '000056', NULL, '2021-10-09 15:52:25', '2021-10-09 15:52:25'),
(21, 21, '000058', NULL, '2021-10-09 15:53:32', '2021-10-09 15:53:32'),
(22, 22, '0000', NULL, '2021-10-09 16:11:27', '2021-10-09 16:11:27'),
(23, 23, '00000', NULL, '2021-10-09 16:14:29', '2021-10-09 16:14:29'),
(24, 24, '00000', NULL, '2021-10-09 16:15:59', '2021-10-09 16:15:59'),
(25, 25, '00000', NULL, '2021-10-11 06:35:57', '2021-10-11 06:35:57'),
(26, 26, '000053', NULL, '2021-10-11 06:44:38', '2021-10-11 06:44:38'),
(27, 27, '000057', NULL, '2021-10-11 06:47:44', '2021-10-11 06:47:44'),
(28, 28, '000067', NULL, '2021-10-11 06:51:14', '2021-10-11 06:51:14'),
(29, 29, '00000', NULL, '2021-10-11 06:55:15', '2021-10-11 06:55:15'),
(30, 30, '000078', NULL, '2021-10-11 07:42:10', '2021-10-11 07:42:10'),
(31, 31, '000081', NULL, '2021-10-11 15:17:12', '2021-10-11 15:17:12'),
(32, 32, '00000', NULL, '2021-10-11 18:01:19', '2021-10-11 18:01:19'),
(33, 33, '00000', NULL, '2021-10-11 19:12:55', '2021-10-11 19:12:55'),
(34, 34, '00000', NULL, '2021-10-11 19:20:24', '2021-10-11 19:20:24'),
(35, 41, '0000', NULL, '2021-11-04 15:39:44', '2021-11-04 15:39:44'),
(36, 43, '00079', NULL, '2021-11-11 14:17:49', '2021-11-11 14:17:49'),
(37, 45, '000093', 'Ken Cheque_1637826005.jpeg', '2021-11-25 07:40:05', '2021-11-25 07:40:05'),
(38, 46, '000094', 'Jessica Cheque_1638460616.jpeg', '2021-12-02 15:56:56', '2021-12-02 15:56:56'),
(39, 47, '88, 95, 96', NULL, '2022-01-07 16:10:26', '2022-01-07 16:10:26'),
(40, 48, '99', 'TWEBAZE RICHARD JAN 2022_1641638539.jpeg', '2022-01-08 10:42:19', '2022-01-08 10:42:19'),
(41, 49, '101, 102', 'LOAN KATUNGI_1644857038.jpeg', '2022-02-14 16:43:58', '2022-02-14 16:43:58'),
(42, 50, '104', 'Twesigye Keneth_1645731897.jpeg', '2022-02-24 19:44:57', '2022-02-24 19:44:57'),
(43, 51, '108 & 109', 'MUKUNDANE JAVAN_1647362157.jpeg', '2022-03-15 16:35:57', '2022-03-15 16:35:57'),
(44, 52, 'NA', 'IMG-20220331-WA0031_1649010906.jpg', '2022-04-03 18:35:06', '2022-04-03 18:35:06'),
(45, 54, '000112', 'TWEBAZE RICHARD MAY 2022_1652153273.jpeg', '2022-05-10 03:27:53', '2022-05-10 03:27:53'),
(46, 55, '113', 'TWETERANE ISAAC MAY 2022_1652200382.jpeg', '2022-05-10 16:33:02', '2022-05-10 16:33:02'),
(47, 57, '000115', 'EDWIN 2022-05-25 at 5.44.59 PM_1653491932.jpeg', '2022-05-25 15:18:52', '2022-05-25 15:18:52'),
(48, 58, '000116', 'JAVAN 2022-06-02 at 3.56.28 PM_1654249868.jpeg', '2022-06-03 09:51:08', '2022-06-03 09:51:08'),
(49, 59, '000117', 'ALOYSIUS  6 JUNE 2022_1654602529.JPG', '2022-06-07 11:48:49', '2022-06-07 11:48:49'),
(50, 60, '000118', 'TWESIGYE KENETH JUNE 2022_1655757923.jpeg', '2022-06-20 20:45:23', '2022-06-20 20:45:23'),
(51, 61, '000125', 'Godwin cheque_1660024587.jpeg', '2022-08-09 05:56:27', '2022-08-09 05:56:27'),
(52, 62, '0001119', 'Twebaze-Cheque_1660239180.jpg', '2022-08-11 17:33:00', '2022-08-11 17:33:00'),
(53, 63, '000126', 'Edwin-Loan cheque_1660728740.jpg', '2022-08-17 09:32:20', '2022-08-17 09:32:20'),
(54, 64, '000127', 'Jesca-loan_1662191816.jpg', '2022-09-03 07:56:56', '2022-09-03 07:56:56'),
(55, 65, '000127', 'Javan-Loan_1662195322.jpg', '2022-09-03 08:55:22', '2022-09-03 08:55:22'),
(56, 66, '000128', 'Twesigye Keneth-Loan cheque_1665225988.jpg', '2022-10-08 10:46:28', '2022-10-08 10:46:28'),
(57, 67, '000133', 'Katungye-Loan_1665479122.jpg', '2022-10-11 09:05:22', '2022-10-11 09:05:22'),
(58, 69, '000131', 'Loan cheque-Twebaze_1668249120.jpg', '2022-11-12 10:32:00', '2022-11-12 10:32:00'),
(59, 70, '000130', 'Loan Cheque-Tweterane_1668249179.jpg', '2022-11-12 10:32:59', '2022-11-12 10:32:59'),
(60, 71, '000132', 'Loan cheque-Edwin_1670873256.jpg', '2022-12-12 19:27:36', '2022-12-12 19:27:36'),
(61, 72, '000136', 'Leonard-Loan cheque_1671434642.jpg', '2022-12-19 07:24:02', '2022-12-19 07:24:02'),
(62, 73, '000138', NULL, '2023-01-04 10:28:52', '2023-01-04 10:28:52'),
(63, 75, '000135', 'Kenneth- Loan cheque 20M_1673013357.jpg', '2023-01-06 13:55:57', '2023-01-06 13:55:57'),
(64, 76, '000141', 'Twebaze Richard-cheque_1676458843.jpg', '2023-02-15 11:00:43', '2023-02-15 11:00:43'),
(65, 79, '000142', NULL, '2023-03-13 11:13:39', '2023-03-13 11:13:39'),
(66, 81, 'S59809228', 'Loan Disbursement- Edwin Tuhairwe_1680949907.pdf', '2023-04-08 10:31:47', '2023-04-08 10:31:47'),
(67, 82, '08.04.2023', 'Loan Acknowledgement-Twesigye Keneth_1680956762.pdf', '2023-04-08 12:26:02', '2023-04-08 12:26:02'),
(68, 82, '08.04.2023', 'Loan Acknowledgement-Twesigye Keneth_1680956765.pdf', '2023-04-08 12:26:05', '2023-04-08 12:26:05'),
(69, 80, 'S59818767', 'Loan Disbursement-Jessica_1680957522.pdf', '2023-04-08 12:38:42', '2023-04-08 12:38:42'),
(70, 83, '08.04.2023', 'Loan Acknowledgement for Katungye Leonard_1680960371.pdf', '2023-04-08 13:26:11', '2023-04-08 13:26:11'),
(71, 84, 'S74007588', 'Loan Transaction_Twebaze Richard_1683878394.pdf', '2023-05-12 07:59:54', '2023-05-12 07:59:54'),
(72, 85, 'S75473072', 'Loan Transaction_Tweterane Isaac_1683967093.pdf', '2023-05-13 08:38:13', '2023-05-13 08:38:13'),
(73, 86, '20230524', 'LoanKR_1686074363.jpeg', '2023-06-06 17:59:23', '2023-06-06 17:59:23'),
(74, 87, 'S1078215', NULL, '2023-07-13 21:46:07', '2023-07-13 21:46:07'),
(75, 88, 'S5259460', NULL, '2023-07-21 15:36:57', '2023-07-21 15:36:57'),
(76, 89, 'S14411474', 'Twebaze Richard-Loan Disbursement_1691757364.pdf', '2023-08-11 12:36:04', '2023-08-11 12:36:04'),
(77, 90, 'RTGS STANCAT', NULL, '2023-08-29 08:26:47', '2023-08-29 08:26:47'),
(78, 91, 'S22398842', NULL, '2023-08-30 20:17:11', '2023-08-30 20:17:11'),
(79, 92, 'Godwin loan', NULL, '2023-08-31 13:28:16', '2023-08-31 13:28:16'),
(80, 93, 'S27845317', NULL, '2023-09-11 13:20:57', '2023-09-11 13:20:57'),
(81, 94, 'S40476051', NULL, '2023-10-12 08:44:04', '2023-10-12 08:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `budget` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `user_id`, `desc`, `budget`, `status`, `reason`, `date`, `created_at`, `updated_at`) VALUES
(6, 30, 'Medical bills for Bliss', '1000000', 'approved', 'not cancelled', NULL, '2020-10-20 06:44:09', '2020-10-20 07:10:37'),
(7, 17, '1. Accountablity Systems & Online presence - UGX. 1,500,000=\r\n2. Renewal of Box Number - UGX. 90,000=\r\n3. Facilitation of Quarterly meeting on 18/10/2020 - UGX. 260,000=\r\n4. Administrative Expenses (Boda(4) and Stationery) - UGX. 120,000=', '1970000', 'approved', 'not cancelled', NULL, '2020-11-05 11:16:19', '2020-11-05 11:58:53'),
(12, 17, 'Legal fees for surrender deed of Kazimiri Victor from Amis Determines 300K, Annual Company returns for Amis for 2019 & 2020 inclusive of government charges 300K, Boda facilitation 7 rounds 140K and Stationery for 2 months 20K', '760000', 'approved', 'not cancelled', NULL, '2021-01-12 01:46:52', '2021-01-13 13:33:07'),
(21, 17, 'Meeting Facilitation (meals) 17/01/21: 258K, Fuel Refund for representatives on a burial of Mzee Bungyengyera: 400K, Gift for Godwin’s new born: 73,700 . Boda Boda Routes 8 Routes: 160K, Stationery: 20K, Meeting Facilitation (meals) 0n 18/04/21: 267K', '1178700', 'approved', 'not cancelled', NULL, '2021-04-19 08:44:37', '2021-10-14 03:09:17'),
(34, 12, 'Audited books of accounts 2020-2021 FY', '600000', 'approved', 'not cancelled', NULL, '2021-07-26 10:27:06', '2021-07-26 11:06:36'),
(35, 17, 'Boda Boda Routes 15, Stationery and Fuel refund to Kiwenda', '430000', 'approved', 'not cancelled', NULL, '2021-07-30 07:07:14', '2021-07-30 07:15:30'),
(37, 29, 'Hotel (Venue, Meals, Cocktail and Chair organising facilitation) 1,459,000 and SG office 400K', '1859000', 'approved', 'not cancelled', NULL, '2021-08-14 05:00:51', '2021-08-14 12:14:06'),
(39, 17, 'Renewal of domain, hosting for mail server and Systems', '550000', 'approved', 'not cancelled', NULL, '2021-08-17 10:56:26', '2021-10-14 03:09:30'),
(41, 29, 'HIRE OF PROJECTOR FOR AGM', '150000', 'approved', 'not cancelled', NULL, '2021-09-07 03:38:07', '2021-10-14 03:09:03'),
(42, 17, '12 Routes of Boda Boda and 20K for Stationery', '260000', 'approved', 'not cancelled', NULL, '2021-09-07 03:43:53', '2021-10-14 03:08:59'),
(43, 30, 'Aloysius Wedding Contribution 6M, Registration of Second Constitutional Amendment 250K, Allowance for minute taker for AGM 100K, Transport refund for Aloy and Richard 400K', '6750000', 'approved', 'not cancelled', NULL, '2021-09-07 04:05:11', '2021-10-14 03:08:56'),
(55, 30, 'Legal fees for approved Dispute and Resolution Manual', '1200000', 'approved', NULL, NULL, '2022-01-17 15:16:18', '2022-01-19 09:39:48'),
(56, 30, 'Drawing and registration of a resolution of new signatory', '200000', 'approved', NULL, NULL, '2022-01-17 15:17:11', '2022-01-19 09:39:56'),
(57, 30, 'Gift Baby of Twebaze', '157500', 'approved', NULL, NULL, '2022-01-17 15:17:46', '2022-01-19 09:40:02'),
(58, 30, '2nd Quarter meeting of 4th year facilitation', '321000', 'approved', NULL, NULL, '2022-01-17 15:18:32', '2022-01-19 09:40:09'),
(59, 30, 'Minute taker facilitation', '50000', 'approved', NULL, NULL, '2022-01-17 15:19:11', '2022-01-19 09:40:15'),
(60, 30, 'stationery for meeting', '20000', 'approved', NULL, NULL, '2022-01-17 15:19:40', '2022-01-19 09:40:21'),
(61, 30, 'FWP family Day facilitation', '4000000', 'approved', NULL, NULL, '2022-01-17 15:20:02', '2022-01-19 09:40:28'),
(62, 17, 'Legal fees for surrender deed of Angarukamu Ronad from Amis Determines', '300000', 'approved', NULL, NULL, '2022-01-17 15:23:03', '2022-01-19 09:40:33'),
(63, 17, 'Annual Company returns for Amis for 2021 inclusive of government charges', '200000', 'approved', NULL, NULL, '2022-01-17 15:23:32', '2022-01-19 09:40:38'),
(64, 17, 'Renewal Box Number', '90000', 'approved', NULL, NULL, '2022-01-17 15:23:58', '2022-01-19 09:40:45'),
(65, 17, 'URA TIN facilitation', '100000', 'approved', NULL, NULL, '2022-01-17 15:24:25', '2022-01-19 09:40:51'),
(66, 17, 'Boda Boda trips 2nd quarter of the 4th year', '160000', 'approved', NULL, NULL, '2022-01-17 15:25:26', '2022-01-19 09:41:01'),
(67, 17, 'Balance on Land Title (Amis Determines Ltd) Processing, evaluation and Transfer', '2250000', 'approved', NULL, NULL, '2022-01-21 17:39:12', '2022-01-29 09:40:40'),
(68, 12, 'ANGARUKAMU\'S PAY OUT', '1571808', 'approved', NULL, NULL, '2022-02-04 07:17:30', '2022-02-04 16:37:19'),
(69, 17, 'Commitment fee (1st instalment) for FWP Strategic Plan 5 years.', '1500000', 'approved', NULL, NULL, '2022-02-08 06:27:00', '2022-02-10 07:39:40'),
(70, 17, 'Commitment fee (2nd instalment) for FWP Strategic Plan 5 years.', '1500000', 'approved', NULL, NULL, '2022-02-21 13:07:10', '2022-02-22 14:50:43'),
(71, 17, 'GODWIN LAND TRANSACTION\r\nLand part Payment 8,286,200\r\nLand Agreement 250K\r\nExpress Search Report 100K', '8636200', 'approved', NULL, NULL, '2022-02-24 10:35:41', '2022-02-25 05:47:46'),
(72, 30, 'Member\'s contribution to Godwin Ainomujuni Wedding ceremonies. Members to reimburse corresponding contribution within 3 months from 10th April, 22. Last payment date will be 10th July, 22.', '13200000', 'approved', NULL, NULL, '2022-03-30 08:02:00', '2022-03-31 11:38:34'),
(73, 17, 'Professional fees for transfer of Title at Senge from Godwin Ainomujuni to Amis Determines Ltd inclusive of release of Encumberance.\r\nThe total bill is 1.5M so the balance will be 1M.', '500000', 'approved', NULL, NULL, '2022-03-30 08:08:14', '2022-03-31 11:38:42'),
(74, 30, 'Hire of Venue 200K, Hire of Projector 150K, Stationery 20K, Birth Gift 155K, Refreshments and Bites 597K, Minute Taker 50K & Godwins wedding gift 500K', '1672000', 'approved', NULL, NULL, '2022-04-25 09:35:09', '2022-05-10 06:52:01'),
(75, 17, 'Final payment FAPET 1.5M, Transport Refund 240K, Stationery 10K', '1750000', 'approved', NULL, NULL, '2022-04-25 09:39:51', '2022-05-10 06:52:21'),
(76, 17, 'Edmart Receipt 848 EX. VAT\r\nFWP System development', '9300000', 'approved', NULL, NULL, '2022-06-09 18:16:31', '2022-06-11 14:47:15'),
(77, 17, 'Edmart Invoice 667\r\nAnnual Renewal of domain SMS Engine hosting of systems and mail per annum.', '1534000', 'approved', NULL, NULL, '2022-06-09 18:18:34', '2022-06-11 14:47:21'),
(78, 13, 'Rent for AMIS DETERMINES FOR THREE MONTHS (AUGUST, SEPTEMBER, OCTOBER 2022)', '1200000', 'approved', NULL, NULL, '2022-08-10 14:57:06', '2022-08-10 14:59:41'),
(79, 13, 'FWP AGM Expenses at Hotel Africana', '1772100', 'approved', NULL, NULL, '2022-08-10 19:17:31', '2022-08-11 15:50:45'),
(80, 13, 'Facilitation for Enabling Finance Ltd at FWP AGM at Hotel Africana', '200000', 'approved', NULL, NULL, '2022-08-10 19:18:55', '2022-08-11 15:51:26'),
(81, 13, 'FWP Audited Books of Accounts for the Financial Year 2021-2022', '850000', 'approved', NULL, NULL, '2022-08-10 19:26:28', '2022-08-11 15:50:30'),
(82, 13, 'Boda Boda expenses and stationery costs', '230000', 'approved', NULL, NULL, '2022-08-10 19:28:17', '2022-08-11 15:50:03'),
(83, 13, 'Executive committee meeting facilitation at Stonehaven Restaurant 306,000, Quarterly meeting facilitation 340,000, Minute taker for the quarterly meeting 50,000, Boda-boda 8 routes @ 20K = 160,000, Stationery 20,000, UMRA Facilitation 100,000', '976000', 'approved', NULL, NULL, '2022-11-08 15:09:55', '2022-11-08 15:15:09'),
(84, 13, '1. URA final Returns for Jan 2022 to June 2022   200,000\r\n2. URA provisional Returns for FY 2022/23  100,000\r\n3. Assessed provisional TAX FY 2022/23  150,000\r\n4. Professional fees CS for registration of resolutions & surrender deed for Aloysius 700,000', '1150000', 'approved', NULL, NULL, '2023-01-04 14:53:51', '2023-01-04 15:25:06'),
(85, 13, 'AMIS DETERMINES EXPENSES\r\n1. KCCA License  690,000\r\n2. Rent for months Nov, Dec, Jan, Feb, March 2,000,000\r\n3. Account opening balance 200,000', '2890000', 'approved', NULL, NULL, '2023-01-04 14:57:04', '2023-01-04 15:24:58'),
(86, 13, '1. FWP Family day expenses 5,000,000\r\n2. Condolences for Javan towards loss of child 2,000,000\r\n3. Facilitation of the Executive meeting on 9/1/2023 205,000', '7205000', 'approved', NULL, NULL, '2023-01-13 07:22:05', '2023-01-13 07:32:53'),
(87, 13, '1. Two Laptops for AMIS DETERMINES 3,000,000; 2. Payment for Luke 800,000; 3. Welcome party for Jessica 583,000; 4. Gifts for babies of Godwin and Javan 208,000', '4591000', 'approved', NULL, NULL, '2023-03-06 15:33:10', '2023-03-07 12:20:54'),
(88, 13, 'Expenses: Rent for AMIS for April & May (800,000), Expenses for Executive meeting (290,000), Expenses for FWP quarterly Meeting (420,000)', '1510000', 'approved', NULL, NULL, '2023-04-28 14:03:26', '2023-04-29 06:57:59'),
(89, 13, 'AMIS Determines June rent 400K, AMIS staff appraisal meeting 310K, Inspection of FWP Land properties in Wakiso & Kiwenda 100K', '810000', 'approved', NULL, NULL, '2023-06-15 11:54:04', '2023-06-16 18:52:34'),
(90, 30, 'Payment for FIFTH AGM ifo Meilin International Hotel', '1848000', 'approved', NULL, NULL, '2023-07-14 06:16:19', '2023-07-14 07:33:45'),
(91, 13, 'Expenses for FWP Executive meeting on 16/June 2023 (283,000) at KatiKati and 9/July 2023 (302,000) at Africana', '585000', 'approved', NULL, NULL, '2023-07-14 07:33:50', '2023-07-14 08:36:20'),
(92, 13, 'Additional AGM Expenses 394,000\r\nFWP Domain renewal, Web & Mail hosting, hosting of system accountability 670,000', '1064000', 'approved', NULL, NULL, '2023-08-08 15:06:52', '2023-08-08 15:15:57'),
(93, 13, 'Executive meeting expenses at Hotel Africana on 8.9.2023', '137000', 'approved', NULL, NULL, '2023-09-09 12:09:08', '2023-09-09 13:01:32'),
(94, 17, 'Land Evaluation at Kiwenda and Senge Wakiso', '1110000', 'approved', NULL, NULL, '2023-09-09 13:03:07', '2023-09-09 13:24:12'),
(95, 13, 'Payment balance to the Auditor for the Books of Accounts FY 2022/23', '700000', 'approved', NULL, NULL, '2023-10-02 10:39:59', '2023-10-02 10:50:25'),
(96, 17, 'Executive Meeting facilitation Stonehaven, Executive meeting with proposed Auditor and A gift to a newborn son of Katungye Leonard', '619500', 'approved', NULL, NULL, '2023-10-02 10:40:59', '2023-10-02 10:50:17'),
(97, 13, '1. Gift for Edwin\'s New born son 181,900\r\n2. Expenses during search for the new Auditor 382,000', '563900', 'approved', NULL, NULL, '2023-10-02 10:46:51', '2023-10-02 10:50:11'),
(98, 30, 'Cost on First SGA (Venue 300K, projector 100K, Stionery and Admin 100K meals Africana 548000)', '1048000', 'approved', NULL, NULL, '2023-10-16 07:49:17', '2023-10-16 08:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guarantertemps`
--

CREATE TABLE `guarantertemps` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `guarantor` bigint NOT NULL,
  `g_amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guarantors`
--

CREATE TABLE `guarantors` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `loans_id` bigint NOT NULL,
  `g_accept` bigint DEFAULT '0',
  `g_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guarantors`
--

INSERT INTO `guarantors` (`id`, `user_id`, `loans_id`, `g_accept`, `g_amount`, `status`, `created_at`, `updated_at`) VALUES
(2, 11, 43, 0, '8200000', 'approved', '2021-11-11 12:02:03', '2021-11-11 12:03:31'),
(3, 19, 43, 0, '7962500', 'approved', '2021-11-11 12:02:03', '2021-11-11 12:02:56'),
(4, 11, 45, 0, '6000000', 'approved', '2021-11-25 07:32:38', '2021-11-25 07:34:42'),
(5, 10, 45, 0, '4062275', 'approved', '2021-11-25 07:32:38', '2021-11-25 07:34:19'),
(6, 15, 47, 0, '8500000', 'approved', '2021-12-08 08:29:24', '2021-12-08 11:16:33'),
(7, 19, 47, 0, '8425050', 'approved', '2021-12-08 08:29:24', '2021-12-08 13:47:12'),
(8, 19, 48, 0, '9749059', 'approved', '2022-01-07 10:45:19', '2022-01-07 10:49:21'),
(9, 17, 49, 0, '4520233', 'approved', '2022-02-11 06:45:05', '2022-02-11 06:58:18'),
(10, 18, 50, 0, '10000000', 'approved', '2022-02-23 11:29:22', '2022-02-23 11:29:58'),
(11, 17, 50, 0, '2387275', 'approved', '2022-02-23 11:29:22', '2022-02-23 11:30:41'),
(12, 17, 51, 0, '9296106', 'approved', '2022-03-11 06:40:39', '2022-03-11 06:46:10'),
(13, 19, 54, 0, '4374256', 'approved', '2022-05-09 10:30:02', '2022-05-09 10:31:46'),
(14, 19, 56, 0, '10000000', 'approved', '2022-05-10 14:49:23', '2022-05-10 14:50:30'),
(15, 18, 56, 0, '8800050', 'approved', '2022-05-10 14:49:23', '2022-05-10 14:51:32'),
(16, 18, 57, 0, '11000000', 'approved', '2022-05-25 15:03:49', '2022-05-25 15:04:17'),
(17, 12, 57, 0, '6300050', 'approved', '2022-05-25 15:03:49', '2022-05-25 15:11:41'),
(18, 17, 58, 0, '10747479', 'approved', '2022-06-02 12:03:24', '2022-06-02 12:07:59'),
(19, 17, 59, 0, '7000000', 'approved', '2022-06-07 10:22:04', '2022-06-07 10:24:25'),
(20, 19, 59, 0, '6219720', 'approved', '2022-06-07 10:22:04', '2022-06-07 10:52:53'),
(21, 18, 60, 0, '10000000', 'approved', '2022-06-20 05:47:31', '2022-06-20 05:48:37'),
(22, 17, 60, 0, '8587275', 'approved', '2022-06-20 05:47:31', '2022-06-20 05:49:23'),
(23, 17, 61, 0, '5675000', 'approved', '2022-08-08 18:00:18', '2022-08-08 18:01:44'),
(26, 10, 62, 0, '6250000', 'approved', '2022-08-10 11:43:46', '2022-08-10 11:46:37'),
(27, 19, 62, 0, '11925000', 'approved', '2022-08-10 11:43:46', '2022-08-10 11:44:21'),
(28, 13, 63, 0, '10000000', 'approved', '2022-08-17 06:48:56', '2022-08-17 08:17:00'),
(29, 12, 63, 0, '9931107', 'approved', '2022-08-17 06:48:56', '2022-08-17 07:46:21'),
(30, 17, 65, 0, '8916513', 'approved', '2022-09-03 08:46:34', '2022-09-03 08:48:14'),
(31, 18, 66, 0, '12000000', 'approved', '2022-10-08 10:03:06', '2022-10-08 10:04:45'),
(32, 17, 66, 0, '8625000', 'approved', '2022-10-08 10:03:06', '2022-10-08 10:23:56'),
(33, 19, 69, 0, '12399680', 'approved', '2022-11-11 06:18:52', '2022-11-11 06:23:21'),
(34, 17, 70, 0, '12000000', 'approved', '2022-11-11 06:33:24', '2022-11-11 06:35:29'),
(35, 19, 70, 0, '1497170', 'approved', '2022-11-11 06:33:24', '2022-11-11 06:40:11'),
(36, 13, 71, 0, '12000000', 'approved', '2022-12-08 09:20:05', '2022-12-08 11:41:01'),
(37, 18, 71, 0, '9431107', 'approved', '2022-12-08 09:20:05', '2022-12-08 09:30:19'),
(38, 10, 72, 0, '6270337', 'approved', '2022-12-13 07:47:47', '2022-12-16 07:30:34'),
(39, 17, 73, 0, '7052988', 'approved', '2023-01-03 13:22:30', '2023-01-03 13:25:28'),
(40, 17, 74, 0, '10508954', 'approved', '2023-01-06 06:08:42', '2023-01-06 06:09:39'),
(41, 18, 75, 0, '7050000', 'approved', '2023-01-06 11:09:00', '2023-01-06 11:34:38'),
(42, 17, 76, 0, '10000000', 'approved', '2023-02-15 07:43:10', '2023-02-15 07:49:38'),
(43, 19, 76, 0, '10825000', 'approved', '2023-02-15 07:43:10', '2023-02-15 07:50:04'),
(44, 17, 77, 0, '13000000', 'approved', '2023-03-07 18:40:38', '2023-03-07 18:42:09'),
(45, 19, 77, 0, '8507797', 'approved', '2023-03-07 18:40:38', '2023-03-07 18:41:07'),
(46, 19, 79, 0, '13500000', 'approved', '2023-03-13 10:48:44', '2023-03-13 10:49:26'),
(47, 13, 81, 0, '13000000', 'approved', '2023-04-08 10:07:22', '2023-04-08 10:08:42'),
(48, 19, 81, 0, '9936010', 'approved', '2023-04-08 10:07:22', '2023-04-08 10:07:58'),
(49, 17, 82, 0, '10000000', 'approved', '2023-04-08 12:13:03', '2023-04-08 12:13:48'),
(50, 13, 82, 0, '6374448', 'approved', '2023-04-08 12:13:03', '2023-04-08 12:15:35'),
(51, 17, 83, 0, '10000000', 'approved', '2023-04-08 12:47:48', '2023-04-08 12:48:21'),
(52, 19, 83, 0, '6374565', 'approved', '2023-04-08 12:47:48', '2023-04-08 12:49:04'),
(53, 19, 84, 0, '13000000', 'approved', '2023-05-10 21:53:39', '2023-05-10 21:55:44'),
(54, 10, 84, 0, '10150000', 'approved', '2023-05-10 21:53:39', '2023-05-10 21:56:14'),
(55, 18, 86, 0, '13500000', 'approved', '2023-06-06 17:52:06', '2023-06-06 17:52:52'),
(56, 17, 86, 0, '7424970', 'approved', '2023-06-06 17:52:06', '2023-06-06 17:53:29'),
(57, 19, 87, 0, '14000000', 'approved', '2023-07-12 16:24:38', '2023-07-12 16:25:30'),
(58, 13, 87, 0, '9987139', 'approved', '2023-07-12 16:24:38', '2023-07-12 18:43:31'),
(59, 11, 88, 0, '14000000', 'approved', '2023-07-21 11:11:08', '2023-07-21 14:43:05'),
(60, 19, 88, 0, '1699885', 'approved', '2023-07-21 11:11:08', '2023-07-21 11:50:09'),
(61, 19, 89, 0, '12000000', 'approved', '2023-08-11 11:42:52', '2023-08-11 11:44:34'),
(62, 10, 89, 0, '3475000', 'approved', '2023-08-11 11:42:52', '2023-08-11 11:45:04'),
(63, 17, 90, 0, '14630000', 'approved', '2023-08-28 08:34:30', '2023-08-28 08:37:56'),
(64, 13, 90, 0, '9341373', 'approved', '2023-08-28 08:34:30', '2023-08-28 11:21:18'),
(65, 17, 92, 0, '12475000', 'approved', '2023-08-30 19:48:06', '2023-08-30 20:00:03'),
(66, 18, 93, 0, '13000000', 'approved', '2023-09-09 13:41:00', '2023-09-11 08:45:07'),
(67, 17, 93, 0, '10249970', 'approved', '2023-09-09 13:41:00', '2023-09-09 13:47:49'),
(68, 13, 94, 0, '15000000', 'approved', '2023-10-11 17:11:23', '2023-10-11 18:32:28'),
(69, 19, 94, 0, '10012139', 'approved', '2023-10-11 17:11:23', '2023-10-11 17:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `loanamount` bigint NOT NULL,
  `processingfee` bigint NOT NULL,
  `monthstaken` int NOT NULL,
  `arrears` bigint NOT NULL,
  `return` bigint NOT NULL,
  `reducing_balance` bigint NOT NULL,
  `disbursed` bigint NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_payment` date DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `months_elapsed` int NOT NULL,
  `payment_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NO',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `user_id`, `loanamount`, `processingfee`, `monthstaken`, `arrears`, `return`, `reducing_balance`, `disbursed`, `desc`, `reason`, `last_payment`, `request_date`, `months_elapsed`, `payment_mode`, `status`, `seize`, `created_at`, `updated_at`) VALUES
(1, 9, 7500000, 100000, 3, 447500, 8528438, 0, 6952500, 'PERSONAL DEVELOPMENT', 'not cancelled', '2020-08-29', '2020-05-26', 3, 'instalments', 'cleared', 'NO', '2021-10-08 05:36:08', '2021-10-09 12:05:32'),
(3, 9, 7400000, 20000, 3, 700000, 8566425, 0, 6680000, 'BUSINESS GROWTH LOAN', 'not cancelled', '2021-05-18', '2021-02-17', 3, 'instalments', 'cleared', 'NO', '2021-10-08 13:48:43', '2021-10-09 14:55:43'),
(4, 9, 11000000, 100000, 3, 9981325, 12733875, 0, 9980000, 'SELF DEVELOPMENT', 'not cancelled', '2021-09-15', '2021-06-07', 3, 'instalments', 'cleared', 'NO', '2021-10-08 13:53:34', '2021-10-09 11:53:36'),
(5, 16, 2550000, 20000, 3, 514700, 2951944, 0, 2015300, 'PERSONAL DEVELOPMENT', 'not cancelled', '2020-11-07', '2020-08-05', 3, 'instalments', 'cleared', 'NO', '2021-10-09 12:53:00', '2021-10-09 15:00:41'),
(6, 16, 3000000, 20000, 3, 0, 3472875, 0, 2980000, 'PERSONAL LOAN', 'not cancelled', '2021-03-23', '2020-11-26', 3, 'instalments', 'cleared', 'NO', '2021-10-09 12:53:50', '2021-10-09 15:03:52'),
(7, 16, 5000000, 20000, 3, 0, 5788125, 0, 4980000, 'PERSONAL DEVELOPMENT', 'not cancelled', '2021-07-30', '2021-04-29', 3, 'lump', 'cleared', 'NO', '2021-10-09 12:54:45', '2021-10-09 15:07:18'),
(8, 17, 5000000, 20000, 2, 0, 5250000, 0, 5000000, 'BUSINESS LOAN', 'not cancelled', '2020-09-09', '2020-06-09', 3, 'lump', 'cleared', 'NO', '2021-10-09 13:44:59', '2021-10-11 18:45:20'),
(9, 17, 13600000, 100000, 3, 0, 15743700, 0, 13500000, 'BUSINESS LOAN', 'not cancelled', '2020-11-09', '2020-08-05', 3, 'lump', 'cleared', 'NO', '2021-10-09 13:46:09', '2021-10-11 18:47:12'),
(10, 17, 13000000, 100000, 1, 0, 13650000, 0, 12900000, 'BUSINESS LOAN', 'not cancelled', '2021-04-14', '2021-01-10', 1, 'lump', 'cleared', 'NO', '2021-10-09 13:48:24', '2021-10-11 18:57:20'),
(11, 17, 13400000, 100000, 2, 0, 14773500, 0, 13300000, 'BUSINESS LOAN', 'not cancelled', '2021-05-26', '2021-02-25', 3, 'lump', 'cleared', 'NO', '2021-10-09 13:49:52', '2021-10-11 18:50:22'),
(12, 17, 22800000, 100000, 3, 0, 26393850, 0, 22700000, 'BUSINESS LOAN', 'not cancelled', '2021-08-19', '2021-05-11', 3, 'lump', 'cleared', 'NO', '2021-10-09 13:53:06', '2021-10-11 18:40:51'),
(13, 14, 18380000, 100000, 3, 0, 21277148, 0, 18280000, 'BUSINESS LOAN', 'not cancelled', '2020-10-09', '2020-07-07', 3, 'lump', 'cleared', 'NO', '2021-10-09 14:48:10', '2021-10-11 18:39:17'),
(14, 14, 24980000, 100000, 3, 0, 28917473, 0, 24880000, 'BUSINESS LOAN', 'not cancelled', '2021-01-14', '2020-10-13', 3, 'lump', 'cleared', 'NO', '2021-10-09 14:49:30', '2021-10-11 18:37:40'),
(15, 18, 5500000, 20000, 3, 365000, 6366938, 0, 5115000, 'PERSONAL LOAN', 'not cancelled', '2020-09-04', '2020-05-29', 3, 'lump', 'cleared', 'NO', '2021-10-09 15:05:10', '2021-10-11 18:35:43'),
(16, 18, 17375000, 100000, 3, 0, 20113734, 0, 17275000, 'BUSINESS LOAN', 'not cancelled', '2021-04-21', '2021-01-19', 3, 'lump', 'cleared', 'NO', '2021-10-09 15:08:37', '2021-10-11 18:34:00'),
(17, 18, 18000000, 100000, 3, 0, 20837250, 0, 17900000, 'BUSINESS LOAN', 'not cancelled', '2021-08-19', '2021-05-13', 3, 'lump', 'cleared', 'NO', '2021-10-09 15:22:08', '2021-10-11 18:32:06'),
(18, 19, 10000000, 100000, 3, 0, 11576250, 0, 9900000, 'PERSONAL LOAN', 'not cancelled', '2021-05-18', '2021-02-17', 3, 'lump', 'cleared', 'NO', '2021-10-09 15:39:51', '2021-10-11 18:29:50'),
(19, 19, 22800000, 100000, 1, 0, 23940000, 0, 22700000, 'BUSINESS LOAN', 'not cancelled', '2021-06-22', '2021-05-21', 1, 'lump', 'cleared', 'NO', '2021-10-09 15:41:56', '2021-10-11 18:28:23'),
(20, 13, 12000000, 100000, 3, 0, 13891500, 0, 11900000, 'BUSINESS LOAN', 'not cancelled', '2021-02-18', '2020-11-16', 3, 'lump', 'cleared', 'NO', '2021-10-09 15:49:52', '2021-10-11 18:25:36'),
(21, 13, 15000000, 100000, 3, 0, 17364375, 0, 14900000, 'BUSINESS LOAN', 'not cancelled', '2021-05-16', '2021-02-15', 3, 'lump', 'cleared', 'NO', '2021-10-09 15:50:56', '2021-10-11 18:24:01'),
(22, 10, 4000000, 20000, 3, 0, 4630500, 0, 3980000, 'PERSONAL DEVELOPMENT', 'not cancelled', '2020-12-29', '2020-09-25', 3, 'lump', 'cleared', 'NO', '2021-10-09 16:00:09', '2021-10-11 18:21:41'),
(23, 10, 8290000, 20000, 1, 345000, 8704500, 0, 7925000, 'PERSONAL LOAN', 'not cancelled', '2021-07-01', '2021-05-28', 1, 'lump', 'cleared', 'NO', '2021-10-09 16:06:24', '2021-10-11 18:19:53'),
(24, 10, 20100000, 100000, 1, 0, 21105000, 0, 20000000, 'BUSINESS LOAN', 'not cancelled', '2021-08-02', '2021-07-02', 1, 'lump', 'cleared', 'NO', '2021-10-09 16:08:25', '2021-10-11 18:17:45'),
(25, 15, 7900000, 100000, 2, 2737500, 8709750, 0, 5062500, 'PERSONAL LOAN', 'not cancelled', '2020-08-03', '2020-05-28', 2, 'lump', 'cleared', 'NO', '2021-10-11 06:22:32', '2021-10-11 18:14:30'),
(26, 15, 10000000, 100000, 3, 51212, 11576250, 0, 9848788, 'BUSINESS LOAN', 'not cancelled', '2020-12-17', '2020-08-18', 3, 'lump', 'cleared', 'NO', '2021-10-11 06:25:35', '2021-10-11 18:11:25'),
(27, 15, 20000000, 100000, 3, 0, 23152500, 0, 19900000, 'BUSINESS LOAN', 'not cancelled', '2021-05-11', '2021-02-03', 3, 'lump', 'cleared', 'NO', '2021-10-11 06:28:45', '2021-10-11 18:09:16'),
(28, 15, 8500000, 20000, 3, 0, 9839813, 0, 8480000, 'PERSONAL DEVELOPMENT', 'not cancelled', '2021-08-19', '2021-05-14', 3, 'lump', 'cleared', 'NO', '2021-10-11 06:32:05', '2021-10-11 18:06:15'),
(29, 12, 6000000, 20000, 1, 0, 6300000, 0, 5980000, 'PERSONAL LOAN', 'not cancelled', '2021-07-03', '2021-06-01', 1, 'lump', 'cleared', 'NO', '2021-10-11 06:53:07', '2021-10-11 10:56:36'),
(30, 19, 24000000, 100000, 3, 149700, 27783000, 0, 23750300, 'BUSINESS LOAN', 'not cancelled', '2021-10-28', '2021-07-26', 3, 'lump', 'cleared', 'NO', '2021-10-11 07:40:18', '2021-11-03 13:55:02'),
(31, 18, 24000000, 100000, 3, 263734, 27783000, 0, 23636266, 'BUSINESS LOAN', 'not cancelled', '2021-11-17', '2021-08-17', 3, 'lump', 'cleared', 'NO', '2021-10-11 15:10:05', '2021-11-17 10:47:22'),
(32, 17, 24600000, 100000, 3, 0, 28477575, 0, 24500000, 'BUSINESS LOAN', 'not cancelled', '2021-11-19', '2021-08-18', 3, 'lump', 'cleared', 'NO', '2021-10-11 17:55:24', '2021-11-18 21:32:23'),
(33, 13, 5000000, 20000, 3, 0, 5788125, 0, 4980000, 'BUSINESS LOAN', 'not cancelled', '2021-11-21', '2021-08-20', 3, 'lump', 'cleared', 'NO', '2021-10-11 19:08:56', '2021-11-04 14:11:28'),
(34, 10, 14100000, 100000, 3, 0, 16322513, 0, 14000000, 'BUSINESS LOAN', 'not cancelled', '2022-01-06', '2021-10-05', 3, 'lump', 'cleared', 'NO', '2021-10-11 19:17:38', '2022-01-06 11:29:02'),
(35, 11, 18100000, 100000, 3, 0, 20953013, 0, 18000000, 'BUSINESS LOAN', 'no reason', '2021-02-12', '2020-11-10', 3, 'lump', 'cleared', 'NO', '2021-10-15 16:13:07', '2021-10-15 16:13:07'),
(36, 9, 4000000, 20000, 3, 313500, 4630500, 0, 3666500, 'PERSONAL LOAN', 'NO REASON', '2021-01-14', '2020-10-07', 3, 'lump', 'cleared', 'NO', '2021-10-15 16:29:09', '2021-10-15 16:29:09'),
(41, 13, 15100000, 100000, 3, 0, 17480138, 0, 15000000, 'BUSINESS LOAN', 'NO REASON', '2022-02-01', '2021-11-01', 3, 'lump', 'cleared', 'NO', '2021-11-04 15:24:53', '2022-02-01 19:20:31'),
(42, 9, 11000000, 100000, 3, 0, 12733875, 0, 10900000, 'PERSONAL LOAN', 'NO REASON', '2022-01-07', '2021-10-07', 3, 'lump', 'cleared', 'NO', '2021-11-06 10:56:52', '2022-01-07 06:32:13'),
(43, 12, 26100000, 100000, 3, 0, 30214013, 0, 26000000, 'BUSINESS LOAN', 'not cancelled', '2022-02-11', '2021-11-11', 3, 'lump', 'cleared', 'NO', '2021-11-11 12:02:03', '2022-02-11 06:36:33'),
(44, 15, 9800000, 20000, 3, 0, 11344725, 0, 9780000, 'PERSONAL LOAN', 'no reason', '2022-01-16', '2021-10-16', 3, 'lumpsum', 'cleared', 'NO', '2021-11-23 16:22:24', '2022-01-17 15:15:36'),
(45, 19, 20000000, 100000, 3, 0, 23152500, 0, 19900000, 'BUSINESS LOAN', 'not cancelled', '2022-02-25', '2021-11-25', 3, 'lump', 'cleared', 'NO', '2021-11-25 07:32:38', '2022-02-23 11:23:07'),
(46, 16, 8000000, 20000, 3, 1319815, 9261000, 0, 6660185, 'Jessica 0772 834233', 'not cancelled', '2022-03-02', '2021-12-02', 3, 'instalments', 'cleared', 'NO', '2021-12-02 15:38:47', '2022-03-02 14:38:58'),
(47, 17, 27100000, 100000, 3, 0, 31371638, 0, 27000000, 'BUSINESS LOAN', 'not cancelled', '2022-04-07', '2021-12-08', 3, 'lump', 'cleared', 'NO', '2021-12-08 08:29:24', '2022-04-07 14:17:00'),
(48, 18, 20100000, 100000, 3, 0, 23268263, 0, 20000000, 'BUSINESS LOAN', 'not cancelled', '2022-04-08', '2022-01-07', 3, 'lump', 'cleared', 'NO', '2022-01-07 10:45:19', '2022-04-09 16:36:26'),
(49, 13, 15100000, 100000, 3, 0, 17480138, 0, 15000000, 'Personal development', 'not cancelled', '2022-05-14', '2022-02-11', 3, 'instalments', 'cleared', 'NO', '2022-02-11 06:45:05', '2022-05-25 14:59:14'),
(50, 19, 23000000, 100000, 3, 0, 26625375, 0, 22900000, 'Business Loan', 'not cancelled', '2022-05-24', '2022-02-23', 3, 'lump', 'cleared', 'NO', '2022-02-23 11:29:22', '2022-05-25 14:59:12'),
(51, 11, 20100000, 100000, 3, 0, 23268263, 0, 20000000, 'Bussinesss', 'not cancelled', '2022-06-15', '2022-03-11', 3, 'lump', 'cleared', 'NO', '2022-03-11 06:40:39', '2022-06-02 11:55:15'),
(52, 12, 2000000, 20000, 3, 0, 2315250, 0, 1980000, 'Personal development', 'not cancelled', '2022-07-03', '2022-03-31', 1, 'lump', 'cleared', 'NO', '2022-03-31 09:09:16', '2022-04-25 09:18:19'),
(53, 12, 5020000, 20000, 2, 2080501, 5534550, 5271000, 2919499, 'Business', 'not cancelled', '2022-06-25', '2022-04-25', 1, 'lump', 'declined', 'NO', '2022-04-25 09:22:18', '2022-05-10 11:11:44'),
(54, 18, 15400000, 100000, 3, 299008, 17827425, 0, 15000992, 'BUSINESS LOAN', 'not cancelled', '2022-08-10', '2022-05-09', 3, 'lump', 'cleared', 'NO', '2022-05-09 10:30:00', '2022-08-10 10:17:03'),
(55, 12, 5020000, 20000, 2, 0, 5534550, 0, 5000000, 'Development', 'not cancelled', '2022-07-10', '2022-05-10', 1, 'lump', 'cleared', 'NO', '2022-05-10 11:09:16', '2022-06-06 03:52:01'),
(56, 17, 30100000, 100000, 3, 0, 34844513, 31605000, 30000000, 'BUSINESS FINANCING', 'not cancelled', '2022-08-10', '2022-05-10', 1, 'lump', 'declined', 'NO', '2022-05-10 14:49:23', '2022-05-25 15:13:59'),
(57, 17, 28600000, 100000, 3, 0, 33108075, 0, 28500000, 'BUSINESS LOAN', 'not cancelled', '2022-08-25', '2022-05-25', 3, 'lump', 'cleared', 'NO', '2022-05-25 15:03:49', '2022-08-17 06:39:23'),
(58, 11, 22170000, 100000, 3, 69971, 25664546, 0, 22000029, 'Bussiness', 'not cancelled', '2022-09-03', '2022-06-02', 3, 'lump', 'cleared', 'NO', '2022-06-02 12:03:24', '2022-09-03 07:13:34'),
(59, 15, 25000000, 100000, 3, 0, 28940625, 0, 24900000, 'BUSINESS LOAN', 'not cancelled', '2022-09-07', '2022-06-07', 3, 'lump', 'cleared', 'NO', '2022-06-07 10:22:04', '2022-09-07 18:51:02'),
(60, 19, 30100000, 100000, 3, 0, 34844513, 0, 30000000, 'BUSINESS LOAN', 'not cancelled', '2022-09-20', '2022-06-20', 3, 'lump', 'cleared', 'NO', '2022-06-20 05:47:31', '2022-09-20 06:45:28'),
(61, 10, 17600000, 100000, 3, 0, 20374200, 0, 17500000, 'PERSONAL DEVELOPMENT', 'not cancelled', '2022-11-09', '2022-08-08', 3, 'lump', 'cleared', 'NO', '2022-08-08 18:00:18', '2022-11-08 21:35:02'),
(62, 18, 30100000, 100000, 2, 0, 33185250, 0, 30000000, 'Business Loan', 'not cancelled', '2022-10-11', '2022-08-10', 3, 'lump', 'cleared', 'NO', '2022-08-10 11:40:21', '2022-10-10 21:00:18'),
(63, 17, 31900000, 100000, 3, 0, 36928238, 0, 31800000, 'BUSINESS LOAN', 'not cancelled', '2022-11-17', '2022-08-17', 3, 'lump', 'cleared', 'NO', '2022-08-17 06:48:56', '2022-11-17 06:17:41'),
(64, 16, 2500000, 20000, 2, 0, 2756250, 0, 2480000, 'Personal growth', 'not cancelled', '2022-11-03', '2022-08-28', 3, 'instalments', 'cleared', 'NO', '2022-08-28 18:18:16', '2022-11-03 13:36:26'),
(65, 11, 21100000, 100000, 3, 0, 24425888, 0, 21000000, 'Bussiness', 'not cancelled', '2022-12-03', '2022-09-03', 3, 'lump', 'cleared', 'NO', '2022-09-03 08:46:34', '2022-12-03 14:04:15'),
(66, 19, 33000000, 100000, 3, 0, 38201625, 0, 32900000, 'BUSINESS LOAN', 'not cancelled', '2023-01-08', '2022-10-08', 3, 'lump', 'cleared', 'NO', '2022-10-08 10:03:06', '2023-01-06 08:43:41'),
(67, 13, 7020000, 20000, 3, 0, 8126528, 0, 7000000, 'BUSINESS LOAN', 'not cancelled', '2023-01-11', '2022-10-11', 2, 'lump', 'cleared', 'NO', '2022-10-11 06:12:40', '2022-12-04 19:17:15'),
(68, 12, 5020000, 20000, 3, 0, 5811278, 5271000, 5000000, 'Development', 'not cancelled', '2023-01-31', '2022-10-31', 1, 'lump', 'declined', 'NO', '2022-10-31 13:46:34', '2022-11-11 06:57:07'),
(69, 18, 25000000, 100000, 2, 0, 27562500, 0, 24900000, 'Business', 'not cancelled', '2023-01-12', '2022-11-11', 2, 'lump', 'cleared', 'NO', '2022-11-11 06:18:52', '2023-01-11 21:50:27'),
(70, 12, 26100000, 100000, 3, 0, 30214013, 0, 26000000, 'Development', 'not cancelled', '2023-02-12', '2022-11-11', 3, 'lump', 'cleared', 'NO', '2022-11-11 06:33:24', '2023-02-13 10:25:15'),
(71, 17, 34300000, 100000, 3, 0, 39706538, 0, 34200000, 'Business loan', 'not cancelled', '2023-03-12', '2022-12-08', 3, 'lump', 'cleared', 'NO', '2022-12-08 09:20:05', '2023-03-13 06:06:37'),
(72, 13, 19100000, 100000, 3, 0, 22110638, 0, 19000000, 'PERSONAL DEVELOPMENT', 'not cancelled', '2023-03-19', '2022-12-13', 3, 'lump', 'cleared', 'NO', '2022-12-13 07:47:47', '2023-03-20 08:02:07'),
(73, 11, 20100000, 100000, 3, 3984, 23268263, 0, 19996016, 'loan', 'not cancelled', '2023-04-04', '2023-01-03', 3, 'lump', 'cleared', 'NO', '2023-01-03 13:22:30', '2023-04-05 09:42:45'),
(74, 10, 23400000, 100000, 3, 211938, 27088425, 24570000, 23088062, 'Business loan', 'not cancelled', '2023-04-06', '2023-01-06', 1, 'instalments', 'declined', 'NO', '2023-01-06 06:08:42', '2023-03-09 09:51:50'),
(75, 19, 20100000, 100000, 3, 0, 23268263, 0, 20000000, 'BUSINESS LOAN', 'not cancelled', '2023-04-06', '2023-01-06', 3, 'lump', 'cleared', 'NO', '2023-01-06 11:09:00', '2023-04-07 15:50:02'),
(76, 18, 34100000, 100000, 2, 0, 37595250, 0, 34000000, 'Business', 'not cancelled', '2023-04-15', '2023-02-15', 2, 'lump', 'cleared', 'NO', '2023-02-15 07:43:10', '2023-04-15 12:44:35'),
(77, 10, 34600000, 100000, 3, 543729, 40053825, 36330000, 33956271, 'Personal Development', 'not cancelled', '2023-06-07', '2023-03-07', 1, 'lump', 'declined', 'NO', '2023-03-07 18:40:38', '2023-03-09 09:53:15'),
(78, 12, 5020000, 20000, 3, 0, 5811278, 5271000, 5000000, 'Personal Development', 'not cancelled', '2023-06-13', '2023-03-13', 1, 'lump', 'declined', 'NO', '2023-03-13 07:36:13', '2023-05-13 07:47:14'),
(79, 10, 27000000, 100000, 3, 0, 31255875, 0, 26900000, 'Personal Development', 'not cancelled', '2023-06-13', '2023-03-13', 3, 'lump', 'cleared', 'NO', '2023-03-13 10:48:44', '2023-06-13 08:00:54'),
(80, 16, 3000000, 20000, 3, 293467, 3472875, 0, 2686533, 'Personal development.', 'not cancelled', '2023-07-08', '2023-04-02', 2, 'instalments', 'cleared', 'NO', '2023-04-02 06:32:04', '2023-05-24 08:09:50'),
(81, 17, 36700000, 100000, 3, 0, 42484838, 0, 36600000, 'Business Loan', 'not cancelled', '2023-07-08', '2023-04-08', 3, 'lump', 'cleared', 'NO', '2023-04-08 10:07:22', '2023-07-08 10:09:22'),
(82, 19, 30100000, 100000, 3, 0, 34844513, 0, 30000000, 'Business Loan', 'not cancelled', '2023-07-08', '2023-04-08', 3, 'lump', 'cleared', 'NO', '2023-04-08 12:13:03', '2023-07-08 10:09:21'),
(83, 13, 30100000, 100000, 3, 0, 34844513, 0, 30000000, 'Personal Development', 'not cancelled', '2023-07-08', '2023-04-08', 3, 'lump', 'cleared', 'NO', '2023-04-08 12:47:48', '2023-07-08 10:09:19'),
(84, 18, 37100000, 100000, 2, 0, 40902750, 0, 37000000, 'Business', 'not cancelled', '2023-07-12', '2023-05-11', 2, 'lump', 'cleared', 'NO', '2023-05-10 21:53:39', '2023-07-12 12:32:26'),
(85, 12, 5000000, 20000, 3, 0, 5788125, 0, 4980000, 'BUSINESS', 'not cancelled', '2023-08-13', '2023-05-13', 2, 'lump', 'cleared', 'NO', '2023-05-13 04:40:14', '2023-06-27 17:46:06'),
(86, 33, 35100000, 100000, 3, 0, 40632638, 0, 35000000, 'BUSINESS LOAN', 'not cancelled', '2023-09-06', '2023-06-06', 3, 'lump', 'cleared', 'NO', '2023-06-06 17:52:06', '2023-09-06 11:42:04'),
(87, 17, 38400000, 100000, 3, 0, 44452800, 0, 38300000, 'BUSINESS LOAN', 'not cancelled', '2023-10-14', '2023-07-12', 2, 'lump', 'cleared', 'NO', '2023-07-12 16:24:38', '2023-09-13 11:42:54'),
(88, 13, 30100000, 100000, 3, 0, 34844513, 34844513, 30000000, 'Personal Development', 'not cancelled', '2023-10-21', '2023-07-21', 3, 'lump', 'running', 'NO', '2023-07-21 11:11:08', '2023-10-02 05:20:40'),
(89, 18, 30100000, 100000, 2, 0, 33185250, 0, 30000000, 'Business', 'not cancelled', '2023-10-11', '2023-08-11', 2, 'lump', 'cleared', 'NO', '2023-08-11 11:42:52', '2023-10-11 13:01:21'),
(90, 11, 38600000, 100000, 3, 0, 44684325, 42556500, 38500000, 'BUSINESS DEVELOPMENT', 'not cancelled', '2023-11-29', '2023-08-28', 2, 'lump', 'running', 'NO', '2023-08-28 08:34:30', '2023-10-02 05:20:40'),
(91, 12, 10020000, 20000, 3, 0, 11599403, 11047050, 10000000, 'BUSINESS', 'not cancelled', '2023-11-30', '2023-08-30', 2, 'lump', 'running', 'NO', '2023-08-30 18:32:43', '2023-10-02 05:20:40'),
(92, 10, 27100000, 100000, 3, 0, 31371638, 29877750, 27000000, 'Personal development', 'not cancelled', '2023-12-01', '2023-08-30', 2, 'instalments', 'running', 'NO', '2023-08-30 19:48:06', '2023-10-02 05:20:40'),
(93, 33, 38100000, 100000, 3, 0, 44105513, 42005250, 38000000, 'Project funding', 'not cancelled', '2023-12-11', '2023-09-09', 2, 'instalments', 'running', 'NO', '2023-09-09 13:41:00', '2023-10-11 13:01:21'),
(94, 17, 40100000, 100000, 3, 0, 46420763, 42105000, 40000000, 'BUSINESS LOAN', 'not cancelled', '2024-01-12', '2023-10-11', 1, 'instalments', 'running', 'NO', '2023-10-11 17:11:23', '2023-10-12 08:44:06');

-- --------------------------------------------------------

--
-- Table structure for table `loan_chats`
--

CREATE TABLE `loan_chats` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `loans_id` int NOT NULL,
  `action` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_chats`
--

INSERT INTO `loan_chats` (`id`, `user_id`, `loans_id`, `action`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 53, 'clarify', 'This loan has figures. You put it in before the payment was captured', '2022-04-28 06:39:23', '2022-04-28 06:39:23'),
(2, 2, 53, 'declined', 'This was reapplied after clearing all the outstanding arrears', '2022-05-10 11:11:44', '2022-05-10 11:11:44'),
(3, 1, 56, 'clarify', 'Inadequate funds. Please apply for a maximum of 28.5M', '2022-05-25 14:59:41', '2022-05-25 14:59:41'),
(4, 2, 56, 'declined', 'Insufficient balance on association account', '2022-05-25 15:13:59', '2022-05-25 15:13:59'),
(5, 2, 68, 'declined', 'The Member applied for another loan of higher amount', '2022-11-11 06:57:07', '2022-11-11 06:57:07'),
(6, 1, 74, 'clarify', 'I am informed the applicant is nolonger interested in the amount. Considering to revise it. Thanks', '2023-01-06 08:06:40', '2023-01-06 08:06:40'),
(7, 2, 74, 'declined', 'The Member dropped the interest', '2023-03-09 09:51:50', '2023-03-09 09:51:50'),
(8, 2, 77, 'declined', 'Member to first re-organize and will re-apply', '2023-03-09 09:53:15', '2023-03-09 09:53:15'),
(9, 2, 78, 'declined', 'The borrower revised the loan amount', '2023-05-13 07:47:14', '2023-05-13 07:47:14');

-- --------------------------------------------------------

--
-- Table structure for table `loan_payments`
--

CREATE TABLE `loan_payments` (
  `id` int NOT NULL,
  `loans_id` bigint NOT NULL,
  `amount` bigint NOT NULL,
  `balance` bigint DEFAULT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_payments`
--

INSERT INTO `loan_payments` (`id`, `loans_id`, `amount`, `balance`, `date`, `created_at`, `updated_at`) VALUES
(1, 2, 4630500, 0, '2021-01-12', '2021-10-09 11:51:29', '2021-10-09 11:51:29'),
(2, 4, 12733875, 0, '2021-09-15', '2021-10-09 11:53:36', '2021-10-09 11:53:36'),
(3, 1, 1500000, 6375000, '2020-06-17', '2021-10-09 11:59:30', '2021-10-09 11:59:30'),
(4, 1, 7028438, 0, '2020-08-29', '2021-10-09 12:05:32', '2021-10-09 12:05:32'),
(5, 3, 8566425, 0, '2021-05-18', '2021-10-09 14:55:43', '2021-10-09 14:55:43'),
(6, 5, 2951944, 0, '2020-11-07', '2021-10-09 15:00:41', '2021-10-09 15:00:41'),
(7, 6, 3472875, 0, '2021-03-23', '2021-10-09 15:03:52', '2021-10-09 15:03:52'),
(8, 7, 5788125, 0, '2021-07-30', '2021-10-09 15:07:18', '2021-10-09 15:07:18'),
(16, 26, 11576250, 0, '2020-12-17', '2021-10-11 18:11:25', '2021-10-11 18:11:25'),
(15, 27, 23152500, 0, '2021-05-11', '2021-10-11 18:09:16', '2021-10-11 18:09:16'),
(14, 28, 9839813, 0, '2021-08-19', '2021-10-11 18:06:15', '2021-10-11 18:06:15'),
(13, 29, 6300000, 0, '2021-07-07', '2021-10-11 10:56:36', '2021-10-11 10:56:36'),
(17, 25, 8709750, 0, '2020-08-03', '2021-10-11 18:14:30', '2021-10-11 18:14:30'),
(18, 24, 21105000, 0, '2021-08-02', '2021-10-11 18:17:45', '2021-10-11 18:17:45'),
(19, 23, 8704500, 0, '2021-07-01', '2021-10-11 18:19:53', '2021-10-11 18:19:53'),
(20, 22, 4630500, 0, '2020-12-29', '2021-10-11 18:21:41', '2021-10-11 18:21:41'),
(21, 21, 17364375, 0, '2021-05-16', '2021-10-11 18:24:01', '2021-10-11 18:24:01'),
(22, 20, 13891500, 0, '2021-02-18', '2021-10-11 18:25:36', '2021-10-11 18:25:36'),
(23, 19, 23940000, 0, '2021-06-22', '2021-10-11 18:28:23', '2021-10-11 18:28:23'),
(24, 18, 11576250, 0, '2021-05-18', '2021-10-11 18:29:50', '2021-10-11 18:29:50'),
(25, 17, 20837250, 0, '2021-08-19', '2021-10-11 18:32:06', '2021-10-11 18:32:06'),
(26, 16, 20113734, 0, '2021-04-21', '2021-10-11 18:34:00', '2021-10-11 18:34:00'),
(27, 15, 6366938, 0, '2020-09-04', '2021-10-11 18:35:43', '2021-10-11 18:35:43'),
(28, 14, 28917473, 0, '2021-01-14', '2021-10-11 18:37:40', '2021-10-11 18:37:40'),
(29, 13, 21277148, 0, '2020-10-09', '2021-10-11 18:39:17', '2021-10-11 18:39:17'),
(30, 12, 26393850, 0, '2021-08-19', '2021-10-11 18:40:51', '2021-10-11 18:40:51'),
(31, 8, 5250000, 0, '2020-09-09', '2021-10-11 18:45:20', '2021-10-11 18:45:20'),
(32, 9, 15743700, 0, '2020-11-09', '2021-10-11 18:47:12', '2021-10-11 18:47:12'),
(33, 11, 14773500, 0, '2020-05-26', '2021-10-11 18:50:22', '2021-10-11 18:50:22'),
(34, 10, 13650000, 0, '2021-02-08', '2021-10-11 18:57:20', '2021-10-11 18:57:20'),
(35, 35, 20953013, 0, '2021-02-12', '2021-10-15 16:17:02', '2021-10-15 16:17:02'),
(36, 36, 4630500, 0, '2021-01-14', '2021-10-15 16:32:21', '2021-10-15 16:32:21'),
(38, 30, 27783000, 0, '2021-11-03', '2021-11-03 13:55:02', '2021-11-03 13:55:02'),
(39, 33, 5788125, 0, '2021-11-01', '2021-11-04 14:11:28', '2021-11-04 14:11:28'),
(40, 31, 27783000, 0, '2021-11-17', '2021-11-17 10:47:22', '2021-11-17 10:47:22'),
(41, 32, 28477575, 0, '2021-11-19', '2021-11-18 21:32:23', '2021-11-18 21:32:23'),
(42, 34, 16322513, 0, '2022-01-06', '2022-01-06 11:29:02', '2022-01-06 11:29:02'),
(43, 42, 12733875, 0, '2022-01-07', '2022-01-07 06:32:13', '2022-01-07 06:32:13'),
(44, 44, 11344725, 0, '2022-01-17', '2022-01-17 15:15:36', '2022-01-17 15:15:36'),
(45, 41, 17480138, 0, '2022-02-01', '2022-02-01 19:20:31', '2022-02-01 19:20:31'),
(46, 43, 30214013, 0, '2022-02-11', '2022-02-11 06:36:33', '2022-02-11 06:36:33'),
(47, 45, 23152500, 0, '2022-02-23', '2022-02-23 11:23:07', '2022-02-23 11:23:07'),
(48, 46, 9261000, 0, '2022-03-02', '2022-03-02 14:38:58', '2022-03-02 14:38:58'),
(49, 47, 31371638, 0, '2022-04-07', '2022-04-07 14:17:00', '2022-04-07 14:17:00'),
(50, 48, 23268263, 0, '2022-04-09', '2022-04-09 16:36:26', '2022-04-09 16:36:26'),
(51, 52, 2100000, 0, '2022-04-25', '2022-04-25 09:18:19', '2022-04-25 09:18:19'),
(52, 50, 26625375, 0, '2022-05-25', '2022-05-25 14:59:12', '2022-05-25 14:59:12'),
(53, 49, 17480138, 0, '2022-05-25', '2022-05-25 14:59:14', '2022-05-25 14:59:14'),
(54, 51, 23268263, 0, '2022-06-02', '2022-06-02 11:55:15', '2022-06-02 11:55:15'),
(55, 55, 5271000, 0, '2022-06-04', '2022-06-06 03:52:01', '2022-06-06 03:52:01'),
(56, 54, 17827425, 0, '2022-08-10', '2022-08-10 10:17:03', '2022-08-10 10:17:03'),
(57, 57, 33108075, 0, '2022-08-17', '2022-08-17 06:39:23', '2022-08-17 06:39:23'),
(58, 58, 25664546, 0, '2022-09-03', '2022-09-03 07:13:34', '2022-09-03 07:13:34'),
(59, 59, 28940625, 0, '2022-09-07', '2022-09-07 18:51:02', '2022-09-07 18:51:02'),
(60, 60, 34844513, 0, '2022-09-20', '2022-09-20 06:45:28', '2022-09-20 06:45:28'),
(61, 62, 33185250, 0, '2022-10-11', '2022-10-10 21:00:18', '2022-10-10 21:00:18'),
(62, 64, 2756250, 0, '2022-11-03', '2022-11-03 13:36:26', '2022-11-03 13:36:26'),
(63, 61, 20374200, 0, '2022-11-09', '2022-11-08 21:35:02', '2022-11-08 21:35:02'),
(64, 63, 36928238, 0, '2022-11-17', '2022-11-17 06:17:41', '2022-11-17 06:17:41'),
(65, 65, 24425888, 0, '2022-12-03', '2022-12-03 14:04:15', '2022-12-03 14:04:15'),
(66, 67, 7739550, 0, '2022-12-04', '2022-12-04 19:17:15', '2022-12-04 19:17:15'),
(67, 66, 38201625, 0, '2023-01-06', '2023-01-06 08:43:41', '2023-01-06 08:43:41'),
(68, 69, 27562500, 0, '2023-01-12', '2023-01-11 21:50:27', '2023-01-11 21:50:27'),
(69, 70, 30214013, 0, '2023-02-13', '2023-02-13 10:25:15', '2023-02-13 10:25:15'),
(70, 71, 39706538, 0, '2023-03-13', '2023-03-13 06:06:37', '2023-03-13 06:06:37'),
(71, 72, 22110638, 0, '2023-03-20', '2023-03-20 08:02:07', '2023-03-20 08:02:07'),
(72, 73, 23268263, 0, '2023-04-05', '2023-04-05 09:42:45', '2023-04-05 09:42:45'),
(73, 75, 23268263, 0, '2023-04-07', '2023-04-07 15:50:02', '2023-04-07 15:50:02'),
(74, 76, 37595250, 0, '2023-04-15', '2023-04-15 12:44:35', '2023-04-15 12:44:35'),
(75, 80, 3307500, 0, '2023-05-24', '2023-05-24 08:09:50', '2023-05-24 08:09:50'),
(76, 79, 31255875, 0, '2023-06-13', '2023-06-13 08:00:54', '2023-06-13 08:00:54'),
(77, 85, 5512500, 0, '2023-06-27', '2023-06-27 17:46:06', '2023-06-27 17:46:06'),
(78, 83, 34844513, 0, '2023-07-08', '2023-07-08 10:09:19', '2023-07-08 10:09:19'),
(79, 82, 34844513, 0, '2023-07-08', '2023-07-08 10:09:21', '2023-07-08 10:09:21'),
(80, 81, 42484838, 0, '2023-07-08', '2023-07-08 10:09:22', '2023-07-08 10:09:22'),
(81, 84, 40902750, 0, '2023-07-12', '2023-07-12 12:32:26', '2023-07-12 12:32:26'),
(82, 86, 40632638, 0, '2023-09-06', '2023-09-06 11:42:04', '2023-09-06 11:42:04'),
(83, 87, 42336000, 0, '2023-09-13', '2023-09-13 11:42:54', '2023-09-13 11:42:54'),
(84, 89, 33185250, 0, '2023-10-11', '2023-10-11 13:01:21', '2023-10-11 13:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_29_184000_create_expenses_table', 1),
(5, '2021_03_09_111026_create_savings_table', 1),
(6, '2021_04_09_063131_create_loans_table', 1),
(7, '2021_04_14_061048_create_guarantors_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `total_monthly` bigint NOT NULL,
  `total_social` bigint NOT NULL,
  `total_fines` bigint NOT NULL,
  `total_late_payment` bigint DEFAULT '0',
  `total_deposits` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`id`, `user_id`, `total_monthly`, `total_social`, `total_fines`, `total_late_payment`, `total_deposits`, `created_at`, `updated_at`) VALUES
(1, 9, 0, 1022200, 250000, 2707620, 50802963, '2021-09-28 07:37:57', '2021-12-24 17:28:30'),
(2, 10, 0, 1184700, 700000, 7464685, 132345423, '2021-09-29 07:22:34', '2023-10-10 14:46:13'),
(3, 11, 0, 3600000, 500000, 3909154, 146455714, '2021-09-29 10:07:07', '2023-10-10 14:47:26'),
(4, 12, 600000, 1500000, 950000, 54240, 102773935, '2021-09-29 10:28:25', '2023-10-11 18:28:47'),
(5, 13, 300000, 2250000, 300000, 997544, 161146675, '2021-09-29 10:41:01', '2023-10-10 10:36:08'),
(6, 14, 495300, 267500, 300000, 90000, 63742020, '2021-09-29 11:02:44', '2021-10-05 08:46:59'),
(7, 15, 300000, 2034700, 425000, 19368672, 100388412, '2021-09-29 11:29:51', '2022-09-12 09:39:50'),
(8, 16, 300000, 1234700, 510000, 6007038, 55247982, '2021-09-29 11:51:44', '2023-10-11 18:28:40'),
(9, 17, 350000, 6779700, 10000, 0, 357330801, '2021-09-29 12:05:39', '2023-10-10 10:35:21'),
(10, 18, 355000, 4184700, 335000, 8329035, 289092245, '2021-09-29 12:20:05', '2023-10-10 14:46:36'),
(11, 19, 300000, 4184700, 235000, 457455, 269916344, '2021-09-29 13:00:43', '2023-10-10 14:46:22'),
(12, 20, 0, 134700, 50000, 135000, 3215000, '2021-09-29 13:08:21', '2021-09-29 13:11:15'),
(13, 21, 300000, 134700, 60000, 90000, 1644700, '2021-09-29 14:08:57', '2021-09-29 14:10:53'),
(14, 23, 300000, 134700, 75000, 135000, 1750000, '2021-09-29 14:32:52', '2021-09-29 14:35:07'),
(15, 26, 300000, 134700, 75000, 225000, 1245000, '2021-09-29 14:50:34', '2021-09-29 14:51:27'),
(16, 24, 0, 134700, 150000, 270000, 1620000, '2021-09-29 15:09:12', '2021-09-29 15:12:47'),
(17, 25, 0, 0, 75000, 90000, 300000, '2021-09-29 15:21:49', '2021-09-29 15:23:33'),
(18, 28, 300000, 134700, 100000, 180000, 300000, '2021-09-29 15:30:32', '2021-09-29 15:32:20'),
(19, 33, 31106600, 0, 0, 0, 72939238, '2023-06-06 17:48:53', '2023-10-10 14:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `saving_declines`
--

CREATE TABLE `saving_declines` (
  `tid` int NOT NULL,
  `savingId` int DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saving_declines`
--

INSERT INTO `saving_declines` (`tid`, `savingId`, `message`, `created_at`, `updated_at`) VALUES
(1, 16, 'Double entry', '2021-09-28 07:53:28', '2021-09-28 07:53:28'),
(2, 17, 'Double entry2', '2021-09-28 07:53:41', '2021-09-28 07:53:41'),
(3, 18, 'Double entry3', '2021-09-28 07:53:51', '2021-09-28 07:53:51'),
(4, 19, 'Double entry4', '2021-09-28 07:54:04', '2021-09-28 07:54:04'),
(5, 20, 'Double entry5', '2021-09-28 07:54:15', '2021-09-28 07:54:15'),
(6, 21, 'Double entry6', '2021-09-28 07:54:32', '2021-09-28 07:54:32'),
(7, 22, 'Double entry8', '2021-09-28 07:54:47', '2021-09-28 07:54:47'),
(8, 23, 'Double entry 8', '2021-09-28 07:55:04', '2021-09-28 07:55:04'),
(9, 24, 'Double entry 9', '2021-09-28 07:55:16', '2021-09-28 07:55:16'),
(10, 25, 'Double entry11', '2021-09-28 07:55:40', '2021-09-28 07:55:40'),
(11, 26, 'Double entry12', '2021-09-28 07:55:50', '2021-09-28 07:55:50'),
(12, 27, 'Double entry13', '2021-09-28 07:56:02', '2021-09-28 07:56:02'),
(13, 30, 'Double Entry', '2021-09-29 07:23:57', '2021-09-29 07:23:57'),
(14, 31, 'Wrong deposit amount', '2021-09-29 07:24:52', '2021-09-29 07:24:52'),
(15, 32, 'Wrong marriage amount', '2021-09-29 07:26:03', '2021-09-29 07:26:03'),
(16, 47, 'Wrong date', '2021-09-29 10:07:54', '2021-09-29 10:07:54'),
(17, 56, 'Wrong Interest', '2021-09-29 10:14:35', '2021-09-29 10:14:35'),
(18, 57, 'Wrong interest', '2021-09-29 10:14:56', '2021-09-29 10:14:56'),
(19, 64, 'Double Entry', '2021-09-29 10:26:57', '2021-09-29 10:26:57'),
(20, 70, 'Double Entry', '2021-09-29 10:27:50', '2021-09-29 10:27:50'),
(21, 44, 'Double Entry', '2021-09-29 10:28:49', '2021-09-29 10:28:49'),
(22, 80, 'Wrong date', '2021-09-29 10:41:43', '2021-09-29 10:41:43'),
(23, 104, 'No deposit in put', '2021-09-29 10:46:28', '2021-09-29 10:46:28'),
(24, 94, 'Double Entry', '2021-09-29 11:01:32', '2021-09-29 11:01:32'),
(25, 98, 'Wrong Entry', '2021-09-29 11:08:30', '2021-09-29 11:08:30'),
(26, 99, 'Wrong Date', '2021-09-29 11:08:59', '2021-09-29 11:08:59'),
(27, 108, 'No marriage Bill', '2021-09-29 11:10:42', '2021-09-29 11:10:42'),
(28, 115, 'Double Entry', '2021-09-29 11:50:19', '2021-09-29 11:50:19'),
(29, 201, 'Wrong Entries', '2021-09-29 14:09:48', '2021-09-29 14:09:48'),
(30, 227, 'No charge for missing meetings', '2021-09-29 15:22:15', '2021-09-29 15:22:15'),
(31, 240, 'Wrong Entry on fine', '2021-09-30 11:32:40', '2021-09-30 11:32:40'),
(32, 247, 'Wrong Date', '2021-09-30 12:34:31', '2021-09-30 12:34:31'),
(33, 248, 'Wrong Date', '2021-09-30 12:35:53', '2021-09-30 12:35:53'),
(34, 249, 'Wrong Date', '2021-09-30 12:36:20', '2021-09-30 12:36:20'),
(35, 258, 'Wrong Date', '2021-09-30 13:55:48', '2021-09-30 13:55:48'),
(36, 261, 'Wrong sickness value', '2021-09-30 13:57:09', '2021-09-30 13:57:09'),
(37, 273, 'Wrong Sickness figure', '2021-09-30 14:39:21', '2021-09-30 14:39:21'),
(38, 276, 'Wrong date', '2021-09-30 14:41:14', '2021-09-30 14:41:14'),
(39, 285, 'Wrong Dtae', '2021-09-30 14:46:53', '2021-09-30 14:46:53'),
(40, 286, 'Wrong Date', '2021-09-30 14:49:38', '2021-09-30 14:49:38'),
(41, 312, 'Wrong date', '2021-09-30 14:59:04', '2021-09-30 14:59:04'),
(42, 328, 'Wrong Date', '2021-09-30 15:22:11', '2021-09-30 15:22:11'),
(43, 329, 'Wrong Date', '2021-09-30 15:23:18', '2021-09-30 15:23:18'),
(44, 361, 'Wrong Date', '2021-09-30 15:37:13', '2021-09-30 15:37:13'),
(45, 369, 'Wrong Date', '2021-10-04 12:34:57', '2021-10-04 12:34:57'),
(46, 394, 'Wrong marriage contribution', '2021-10-05 07:56:30', '2021-10-05 07:56:30'),
(47, 385, 'Wrong Year', '2021-10-05 07:59:39', '2021-10-05 07:59:39'),
(48, 384, 'Wrong Year', '2021-10-05 07:59:52', '2021-10-05 07:59:52'),
(49, 383, 'Wrong Year', '2021-10-05 08:00:19', '2021-10-05 08:00:19'),
(50, 409, 'Wrong amount for wedding', '2021-10-05 08:30:07', '2021-10-05 08:30:07'),
(51, 450, 'Left', '2021-10-05 08:47:22', '2021-10-05 08:47:22'),
(52, 451, 'Left', '2021-10-05 08:47:33', '2021-10-05 08:47:33'),
(53, 452, 'Left', '2021-10-05 08:47:49', '2021-10-05 08:47:49'),
(54, 453, 'Left', '2021-10-05 08:48:00', '2021-10-05 08:48:00'),
(55, 454, 'Left', '2021-10-05 08:48:09', '2021-10-05 08:48:09'),
(56, 455, 'Left', '2021-10-05 08:48:20', '2021-10-05 08:48:20'),
(57, 479, 'No burial fees', '2021-10-06 08:56:47', '2021-10-06 08:56:47'),
(58, 492, 'Double Entry', '2021-10-06 09:12:33', '2021-10-06 09:12:33'),
(59, 492, 'Double Entry', '2021-10-06 10:08:57', '2021-10-06 10:08:57'),
(60, 479, 'No entry for burial', '2021-10-06 10:09:53', '2021-10-06 10:09:53'),
(61, 509, 'Double entry', '2021-10-06 10:16:51', '2021-10-06 10:16:51'),
(62, 506, 'No absence', '2021-10-06 10:18:39', '2021-10-06 10:18:39'),
(63, 503, 'Wrong date and fine', '2021-10-06 10:31:04', '2021-10-06 10:31:04'),
(64, 523, 'Saving is wrong', '2021-10-06 11:01:04', '2021-10-06 11:01:04'),
(65, 568, 'Wait for quarterly meeting and end of month', '2021-10-16 12:14:53', '2021-10-16 12:14:53'),
(66, 614, 'Godwin did not attend the Quarterly meeting. Include a meeting fine by selecting Absenteism', '2022-01-29 10:21:00', '2022-01-29 10:21:00'),
(67, 608, 'Isaac did not attend the Quarterly meeting. Include a meeting fine by selecting Absenteism', '2022-01-29 10:21:58', '2022-01-29 10:21:58'),
(68, 617, 'Considering that the system attaches a fine on arrears yet the loan cleared after 10th of Jan. I will need to first harmonise with developers', '2022-01-31 05:22:10', '2022-01-31 05:22:10'),
(69, 621, 'I have handled this with the developers and the right row has been added. Please lets remember to take the 10th very important', '2022-02-07 17:04:48', '2022-02-07 17:04:48'),
(70, 637, 'This late payment does not apply as the loan was maturing after the 10th of February. The late payment will apply after the 10th of March. I think let us in put the money early next month.', '2022-02-24 13:21:52', '2022-02-24 13:21:52'),
(71, 642, 'Do not use the official mail. Use a his personal mail.', '2022-03-10 16:34:18', '2022-03-10 16:34:18'),
(72, 659, 'Capture the 100K for missing of meeting at once.', '2022-04-28 06:40:52', '2022-04-28 06:40:52'),
(73, 694, 'Add Wedding Pledge of Godwin', '2022-08-08 17:11:40', '2022-08-08 17:11:40'),
(74, 727, 'Wrong Late Payment figure', '2022-10-31 13:50:43', '2022-10-31 13:50:43'),
(75, 747, 'Put the date to 11.12.2022.\r\nThat issue of the 10th is a bug and am working with team to fix it. Reput indicating 11th December', '2022-12-11 12:51:37', '2022-12-11 12:51:37'),
(76, 767, 'The right amount is 401,500', '2023-02-10 16:08:17', '2023-02-10 16:08:17'),
(77, 766, 'Richard paid today 10th Feb', '2023-02-10 16:09:03', '2023-02-10 16:09:03'),
(78, 777, 'You have in put this amount on the account of Vice Chaiperson. It needs to be input on the account of Isaac as a member', '2023-03-09 21:23:51', '2023-03-09 21:23:51'),
(79, 810, 'No input made', '2023-05-13 07:01:20', '2023-05-13 07:01:20'),
(80, 811, 'No input made', '2023-05-13 07:01:32', '2023-05-13 07:01:32');

-- --------------------------------------------------------

--
-- Table structure for table `saving_logs`
--

CREATE TABLE `saving_logs` (
  `id` bigint NOT NULL,
  `member` int NOT NULL,
  `monthly_contr` bigint NOT NULL,
  `late_payment` bigint NOT NULL,
  `late_meeting` bigint NOT NULL,
  `absenteeism` bigint NOT NULL,
  `marriage` bigint NOT NULL,
  `birth` bigint NOT NULL,
  `graduation` bigint NOT NULL,
  `consecration` bigint NOT NULL,
  `death` bigint NOT NULL,
  `sickness` bigint NOT NULL,
  `arrears` bigint DEFAULT NULL,
  `date` date NOT NULL,
  `log_type` varchar(255) NOT NULL DEFAULT 'normal',
  `status` int NOT NULL DEFAULT '0',
  `approve` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `saving_logs`
--

INSERT INTO `saving_logs` (`id`, `member`, `monthly_contr`, `late_payment`, `late_meeting`, `absenteeism`, `marriage`, `birth`, `graduation`, `consecration`, `death`, `sickness`, `arrears`, `date`, `log_type`, `status`, `approve`, `created_at`, `updated_at`) VALUES
(1, 9, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 1825000, '2018-04-30', 'normal', 0, 1, '2021-09-18 09:21:55', '2021-09-28 07:37:57'),
(2, 9, 345000, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 1480000, '2018-05-31', 'normal', 0, 1, '2021-09-18 09:23:57', '2021-09-28 07:38:48'),
(3, 9, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1825000, '2018-06-18', 'normal', 0, 1, '2021-09-18 09:25:01', '2021-09-28 07:40:46'),
(4, 9, 0, 45000, 0, 25000, 0, 17200, 0, 0, 0, 0, 1842200, '2018-07-31', 'normal', 0, 1, '2021-09-18 09:26:53', '2021-09-28 07:42:23'),
(5, 9, 1557200, 0, 0, 0, 105000, 0, 0, 0, 0, 0, 347800, '2018-08-10', 'normal', 0, 1, '2021-09-18 09:28:41', '2021-09-28 07:42:38'),
(6, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1800000, '2018-09-10', 'normal', 0, 1, '2021-09-18 09:29:44', '2021-09-28 07:43:02'),
(7, 9, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 1800000, '2018-10-31', 'normal', 0, 1, '2021-09-18 09:32:12', '2021-09-28 07:43:23'),
(8, 9, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 1800000, '2018-11-30', 'normal', 0, 1, '2021-09-18 09:33:12', '2021-09-28 07:43:51'),
(9, 9, 300000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 1500000, '2018-12-31', 'normal', 0, 1, '2021-09-18 09:34:18', '2021-09-28 07:44:20'),
(10, 9, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1500000, '2019-01-10', 'normal', 0, 1, '2021-09-18 09:37:08', '2021-09-28 07:44:51'),
(11, 9, 1000000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 800000, '2019-02-28', 'normal', 0, 1, '2021-09-18 09:37:59', '2021-09-28 07:45:12'),
(12, 9, 635000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1165000, '2019-03-10', 'normal', 0, 1, '2021-09-18 09:39:02', '2021-09-28 07:45:43'),
(13, 9, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 1800000, '2019-04-30', 'normal', 0, 1, '2021-09-18 09:40:07', '2021-09-28 07:46:26'),
(14, 9, 450000, 90000, 0, 0, 0, 0, 0, 0, 150000, 0, 1500000, '2019-05-31', 'normal', 0, 1, '2021-09-18 09:42:11', '2021-09-28 07:47:01'),
(15, 9, 500000, 67500, 0, 0, 0, 0, 0, 0, 0, 100000, 1400000, '2019-06-30', 'normal', 0, 1, '2021-09-18 09:43:47', '2021-09-28 07:47:07'),
(31, 10, 345000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12565500, '2018-06-10', 'normal', 0, 1, '2021-09-29 06:52:53', '2021-09-29 07:38:32'),
(385, 10, 345000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 4784700, '2020-09-30', 'normal', 0, 1, '2021-10-05 06:23:13', '2021-10-05 08:09:54'),
(29, 10, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-05-31', 'normal', 0, 1, '2021-09-29 06:48:11', '2021-09-29 07:23:30'),
(28, 10, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-04-30', 'normal', 0, 1, '2021-09-29 06:45:05', '2021-09-29 07:22:34'),
(158, 18, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-06-30', 'normal', 0, 1, '2021-09-29 12:07:17', '2021-09-29 12:20:46'),
(157, 18, 300000, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 12325000, '2018-05-10', 'normal', 0, 1, '2021-09-29 12:06:23', '2021-09-29 12:20:29'),
(154, 17, 850000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 11900000, '2019-05-10', 'normal', 0, 1, '2021-09-29 12:01:50', '2021-09-29 12:11:01'),
(155, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 12700000, '2019-06-10', 'normal', 0, 1, '2021-09-29 12:02:37', '2021-09-29 12:11:30'),
(384, 10, 1830000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3299700, '2020-08-10', 'normal', 0, 1, '2021-10-05 06:22:10', '2021-10-05 08:10:04'),
(153, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-04-10', 'normal', 0, 1, '2021-09-29 12:00:46', '2021-09-29 12:12:03'),
(156, 18, 355000, 45000, 10000, 0, 0, 0, 0, 0, 0, 0, 12255000, '2018-04-30', 'normal', 0, 1, '2021-09-29 12:05:18', '2021-09-29 12:20:05'),
(152, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-03-10', 'normal', 0, 1, '2021-09-29 11:59:49', '2021-09-29 12:12:53'),
(32, 10, 1005000, 45000, 0, 25000, 105000, 17200, 0, 0, 0, 0, 11647700, '2018-07-31', 'normal', 0, 1, '2021-09-29 06:55:07', '2021-09-29 07:39:09'),
(33, 10, 300000, 0, 0, 0, 0, 12500, 0, 0, 0, 0, 12312500, '2018-08-10', 'normal', 0, 1, '2021-09-29 06:56:34', '2021-09-29 07:27:00'),
(34, 10, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-09-30', 'normal', 0, 1, '2021-09-29 06:57:40', '2021-09-29 07:27:20'),
(35, 10, 600000, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 12025000, '2018-10-10', 'normal', 0, 1, '2021-09-29 07:11:11', '2021-09-29 07:27:51'),
(36, 10, 300000, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 12325000, '2018-11-10', 'normal', 0, 1, '2021-09-29 07:12:27', '2021-09-29 07:28:09'),
(37, 10, 300000, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 12325000, '2018-12-10', 'normal', 0, 1, '2021-09-29 07:13:07', '2021-09-29 07:28:30'),
(38, 10, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2019-01-31', 'normal', 0, 1, '2021-09-29 07:13:49', '2021-09-29 07:28:50'),
(39, 10, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2019-02-28', 'normal', 0, 1, '2021-09-29 07:14:36', '2021-09-29 07:29:11'),
(40, 10, 1360000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11240000, '2019-03-10', 'normal', 0, 1, '2021-09-29 07:15:49', '2021-09-29 07:29:35'),
(41, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-04-10', 'normal', 0, 1, '2021-09-29 07:16:32', '2021-09-29 07:29:58'),
(42, 10, 750000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 12000000, '2019-05-10', 'normal', 0, 1, '2021-09-29 07:17:37', '2021-09-29 07:30:33'),
(43, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 12700000, '2019-06-10', 'normal', 0, 1, '2021-09-29 07:18:20', '2021-09-29 07:30:45'),
(45, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-04-10', 'normal', 0, 1, '2021-09-29 07:59:21', '2021-09-29 10:07:07'),
(46, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-05-10', 'normal', 0, 1, '2021-09-29 08:00:13', '2021-09-29 10:07:22'),
(47, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-06-10', 'normal', 0, 1, '2021-09-29 08:00:46', '2021-09-29 10:18:04'),
(369, 9, 0, 135000, 0, 0, 0, 0, 0, 0, 0, 0, 2637500, '2020-08-31', 'normal', 0, 1, '2021-10-04 09:53:01', '2021-10-04 12:41:50'),
(49, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-07-10', 'normal', 0, 1, '2021-09-29 08:02:26', '2021-09-29 10:09:02'),
(50, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-08-10', 'normal', 0, 1, '2021-09-29 08:03:09', '2021-09-29 10:09:08'),
(51, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-09-10', 'normal', 0, 1, '2021-09-29 08:03:49', '2021-09-29 10:09:35'),
(52, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-10-10', 'normal', 0, 1, '2021-09-29 08:04:16', '2021-09-29 10:09:44'),
(53, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-11-10', 'normal', 0, 1, '2021-09-29 08:05:20', '2021-09-29 10:10:05'),
(54, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-12-10', 'normal', 0, 1, '2021-09-29 08:06:08', '2021-09-29 10:10:27'),
(55, 11, 296550, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12303450, '2019-01-10', 'normal', 0, 1, '2021-09-29 08:07:21', '2021-09-29 10:10:46'),
(56, 11, 296550, 518, 0, 0, 0, 0, 0, 0, 0, 0, 12303450, '2019-02-10', 'normal', 0, 1, '2021-09-29 08:13:23', '2021-09-29 10:18:20'),
(57, 11, 296550, 518, 0, 0, 0, 0, 0, 0, 0, 0, 12303450, '2019-03-10', 'normal', 0, 1, '2021-09-29 08:14:20', '2021-09-29 10:18:27'),
(58, 11, 309550, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 12290450, '2019-04-10', 'normal', 0, 1, '2021-09-29 08:15:30', '2021-09-29 10:11:39'),
(59, 11, 340000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 12410000, '2019-05-10', 'normal', 0, 1, '2021-09-29 08:16:39', '2021-09-29 10:12:08'),
(60, 11, 305000, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 12395000, '2019-06-10', 'normal', 0, 1, '2021-09-29 08:18:08', '2021-09-29 10:12:33'),
(61, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-04-10', 'normal', 0, 1, '2021-09-29 08:24:12', '2021-09-29 10:28:36'),
(62, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-05-10', 'normal', 0, 1, '2021-09-29 08:24:49', '2021-09-29 10:28:56'),
(63, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-06-10', 'normal', 0, 1, '2021-09-29 08:25:23', '2021-09-29 10:29:00'),
(160, 18, 434700, 0, 0, 0, 105000, 12500, 0, 0, 0, 0, 12282800, '2018-08-10', 'normal', 0, 1, '2021-09-29 12:10:22', '2021-09-29 12:21:59'),
(65, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-07-19', 'normal', 0, 1, '2021-09-29 08:27:57', '2021-09-29 10:29:05'),
(66, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-08-10', 'normal', 0, 1, '2021-09-29 08:28:37', '2021-09-29 10:29:14'),
(67, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-09-16', 'normal', 0, 1, '2021-09-29 08:29:10', '2021-09-29 10:29:20'),
(68, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-10-10', 'normal', 0, 1, '2021-09-29 08:29:42', '2021-09-29 10:29:31'),
(69, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-11-10', 'normal', 0, 1, '2021-09-29 08:30:18', '2021-09-29 10:29:37'),
(159, 18, 645000, 0, 0, 0, 0, 17200, 0, 0, 0, 0, 11972200, '2018-07-10', 'normal', 0, 1, '2021-09-29 12:08:45', '2021-09-29 12:21:19'),
(71, 12, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12000000, '2018-12-10', 'normal', 0, 1, '2021-09-29 08:32:19', '2021-09-29 10:28:25'),
(72, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2019-01-10', 'normal', 0, 1, '2021-09-29 08:33:13', '2021-09-29 10:30:03'),
(73, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-02-10', 'normal', 0, 1, '2021-09-29 08:34:06', '2021-09-29 10:31:05'),
(74, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-03-10', 'normal', 0, 1, '2021-09-29 08:34:51', '2021-09-29 10:31:19'),
(75, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-04-10', 'normal', 0, 1, '2021-09-29 08:35:49', '2021-09-29 10:30:57'),
(76, 12, 3150000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 9600000, '2019-05-10', 'normal', 0, 1, '2021-09-29 08:37:14', '2021-09-29 10:31:47'),
(77, 12, 400000, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 12300000, '2019-06-10', 'normal', 0, 1, '2021-09-29 08:38:16', '2021-09-29 10:31:52'),
(78, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-04-10', 'normal', 0, 1, '2021-09-29 08:42:27', '2021-09-29 10:42:20'),
(79, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-05-10', 'normal', 0, 1, '2021-09-29 08:43:55', '2021-09-29 10:42:34'),
(80, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-06-10', 'normal', 0, 1, '2021-09-29 08:44:53', '2021-09-29 10:59:07'),
(81, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-07-10', 'normal', 0, 1, '2021-09-29 08:45:41', '2021-09-29 10:42:46'),
(82, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-08-10', 'normal', 0, 1, '2021-09-29 08:46:48', '2021-09-29 10:42:59'),
(83, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-04-10', 'normal', 0, 1, '2021-09-29 08:52:40', '2021-09-29 11:03:23'),
(84, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-05-10', 'normal', 0, 1, '2021-09-29 08:53:49', '2021-09-29 11:03:26'),
(85, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-06-10', 'normal', 0, 1, '2021-09-29 08:55:01', '2021-09-29 11:03:30'),
(86, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-07-10', 'normal', 0, 1, '2021-09-29 08:55:55', '2021-09-29 11:03:34'),
(87, 14, 495300, 0, 0, 0, 105000, 12500, 0, 0, 0, 0, 12222200, '2018-08-10', 'normal', 0, 1, '2021-09-29 08:57:28', '2021-09-29 11:02:44'),
(88, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-09-10', 'normal', 0, 1, '2021-09-29 08:58:22', '2021-09-29 11:04:16'),
(89, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-10-10', 'normal', 0, 1, '2021-09-29 08:59:09', '2021-09-29 11:04:21'),
(90, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-11-10', 'normal', 0, 1, '2021-09-29 08:59:43', '2021-09-29 11:04:30'),
(91, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-09-10', 'normal', 0, 1, '2021-09-29 09:02:06', '2021-09-29 10:43:23'),
(92, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-10-10', 'normal', 0, 1, '2021-09-29 09:03:12', '2021-09-29 10:44:07'),
(93, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-11-10', 'normal', 0, 1, '2021-09-29 09:03:53', '2021-09-29 10:44:23'),
(126, 16, 300000, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 12310000, '2018-04-10', 'normal', 0, 1, '2021-09-29 11:25:47', '2021-09-29 11:51:44'),
(95, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-12-10', 'normal', 0, 1, '2021-09-29 09:04:31', '2021-09-29 10:41:01'),
(96, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-12-10', 'normal', 0, 1, '2021-09-29 09:04:57', '2021-09-29 11:04:34'),
(97, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-01-10', 'normal', 0, 1, '2021-09-29 09:05:29', '2021-09-29 10:47:55'),
(383, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5129700, '2020-07-10', 'normal', 0, 1, '2021-10-05 06:20:59', '2021-10-05 08:09:42'),
(99, 14, 372600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12227400, '2019-01-10', 'normal', 0, 1, '2021-09-29 09:07:13', '2021-09-29 11:21:41'),
(100, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-02-10', 'normal', 0, 1, '2021-09-29 09:08:01', '2021-09-29 10:48:02'),
(101, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-03-10', 'normal', 0, 1, '2021-09-29 09:10:11', '2021-09-29 10:48:10'),
(102, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-02-10', 'normal', 0, 1, '2021-09-29 09:10:59', '2021-09-29 11:09:48'),
(103, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-04-10', 'normal', 0, 1, '2021-09-29 09:11:14', '2021-09-29 10:48:21'),
(104, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2019-05-10', 'normal', 0, 1, '2021-09-29 09:11:58', '2021-09-29 10:59:18'),
(105, 14, 150000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12450000, '2019-03-10', 'normal', 0, 1, '2021-09-29 09:12:26', '2021-09-29 11:09:56'),
(106, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-04-10', 'normal', 0, 1, '2021-09-29 09:13:14', '2021-09-29 11:11:04'),
(107, 13, 400000, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 12300000, '2019-06-10', 'normal', 0, 1, '2021-09-29 09:13:15', '2021-09-29 10:45:02'),
(108, 14, 450000, 0, 0, 0, 150000, 0, 0, 0, 0, 0, 12150000, '2019-05-10', 'normal', 0, 1, '2021-09-29 09:14:56', '2021-09-29 11:21:46'),
(109, 15, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-04-10', 'normal', 0, 1, '2021-09-29 09:15:17', '2021-09-29 11:29:51'),
(110, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12200000, '2019-06-10', 'normal', 0, 1, '2021-09-29 09:15:36', '2021-09-29 11:22:38'),
(111, 15, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-05-31', 'normal', 0, 1, '2021-09-29 09:17:30', '2021-09-29 11:30:14'),
(112, 15, 715000, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 11910000, '2018-06-10', 'normal', 0, 1, '2021-09-29 09:18:51', '2021-09-29 11:30:32'),
(113, 15, 300000, 45000, 0, 25000, 0, 17200, 0, 0, 0, 0, 12342200, '2018-07-31', 'normal', 0, 1, '2021-09-29 09:21:08', '2021-09-29 11:30:50'),
(114, 15, 492200, 45000, 0, 25000, 105000, 12500, 0, 0, 0, 0, 12250300, '2018-08-31', 'normal', 0, 1, '2021-09-29 09:28:07', '2021-09-29 11:31:34'),
(151, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-02-12', 'normal', 0, 1, '2021-09-29 11:58:57', '2021-09-29 12:13:05'),
(116, 15, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-09-30', 'normal', 0, 1, '2021-09-29 09:32:11', '2021-09-29 11:32:02'),
(117, 15, 740000, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 11885000, '2018-10-10', 'normal', 0, 1, '2021-09-29 09:33:27', '2021-09-29 11:32:25'),
(118, 15, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-11-30', 'normal', 0, 1, '2021-09-29 10:59:56', '2021-09-29 11:32:54'),
(119, 15, 750000, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 11875000, '2018-12-10', 'normal', 0, 1, '2021-09-29 11:01:07', '2021-09-29 11:33:11'),
(120, 15, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2019-01-30', 'normal', 0, 1, '2021-09-29 11:04:01', '2021-09-29 11:33:28'),
(121, 15, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2019-02-28', 'normal', 0, 1, '2021-09-29 11:04:55', '2021-09-29 11:34:00'),
(122, 15, 1500000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 11100000, '2019-03-30', 'normal', 0, 1, '2021-09-29 11:05:50', '2021-09-29 11:34:23'),
(123, 15, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-04-10', 'normal', 0, 1, '2021-09-29 11:06:46', '2021-09-29 11:34:43'),
(124, 15, 850000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 11900000, '2019-05-10', 'normal', 0, 1, '2021-09-29 11:07:49', '2021-09-29 11:34:56'),
(125, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 400000, 13000000, '2019-06-10', 'normal', 0, 1, '2021-09-29 11:09:55', '2021-09-29 11:35:34'),
(127, 16, 310000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12290000, '2018-05-10', 'normal', 0, 1, '2021-09-29 11:27:05', '2021-09-29 11:51:55'),
(128, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-06-10', 'normal', 0, 1, '2021-09-29 11:28:10', '2021-09-29 11:52:05'),
(129, 16, 300000, 0, 0, 0, 0, 17200, 0, 0, 0, 0, 12317200, '2018-07-10', 'normal', 0, 1, '2021-09-29 11:29:30', '2021-09-29 11:52:28'),
(130, 16, 450000, 0, 0, 0, 105000, 12500, 0, 0, 0, 0, 12267500, '2018-08-10', 'normal', 0, 1, '2021-09-29 11:30:53', '2021-09-29 11:52:42'),
(131, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-09-10', 'normal', 0, 1, '2021-09-29 11:31:34', '2021-09-29 11:53:03'),
(132, 16, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12000000, '2018-10-10', 'normal', 0, 1, '2021-09-29 11:32:16', '2021-09-29 11:53:13'),
(133, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-11-10', 'normal', 0, 1, '2021-09-29 11:32:59', '2021-09-29 11:53:34'),
(134, 16, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12000000, '2018-12-10', 'normal', 0, 1, '2021-09-29 11:33:42', '2021-09-29 11:53:47'),
(135, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2019-01-10', 'normal', 0, 1, '2021-09-29 11:34:24', '2021-09-29 11:54:01'),
(136, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-02-10', 'normal', 0, 1, '2021-09-29 11:35:03', '2021-09-29 11:54:20'),
(137, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-03-10', 'normal', 0, 1, '2021-09-29 11:35:52', '2021-09-29 11:54:30'),
(138, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-04-10', 'normal', 0, 1, '2021-09-29 11:37:52', '2021-09-29 11:54:43'),
(139, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 12450000, '2019-05-10', 'normal', 0, 1, '2021-09-29 11:38:49', '2021-09-29 11:55:14'),
(140, 16, 450000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12150000, '2019-06-10', 'normal', 0, 1, '2021-09-29 11:39:37', '2021-09-29 11:55:37'),
(141, 17, 350000, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 12260000, '2018-04-10', 'normal', 0, 1, '2021-09-29 11:50:25', '2021-09-29 12:05:39'),
(142, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-05-10', 'normal', 0, 1, '2021-09-29 11:51:15', '2021-09-29 12:06:26'),
(143, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-06-10', 'normal', 0, 1, '2021-09-29 11:51:56', '2021-09-29 12:06:55'),
(144, 17, 300000, 0, 0, 0, 0, 17200, 0, 0, 0, 0, 12317200, '2018-07-10', 'normal', 0, 1, '2021-09-29 11:52:46', '2021-09-29 12:07:18'),
(145, 17, 330000, 0, 0, 0, 0, 12500, 0, 0, 0, 0, 12282500, '2018-08-10', 'normal', 0, 1, '2021-09-29 11:53:37', '2021-09-29 12:07:50'),
(146, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-09-10', 'normal', 0, 1, '2021-09-29 11:54:17', '2021-09-29 12:08:12'),
(147, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-10-10', 'normal', 0, 1, '2021-09-29 11:55:34', '2021-09-29 12:08:36'),
(148, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-11-10', 'normal', 0, 1, '2021-09-29 11:56:15', '2021-09-29 12:09:19'),
(149, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-12-10', 'normal', 0, 1, '2021-09-29 11:56:57', '2021-09-29 12:09:50'),
(150, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-01-10', 'normal', 0, 1, '2021-09-29 11:58:14', '2021-09-29 12:10:12'),
(161, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-09-11', 'normal', 0, 1, '2021-09-29 12:10:56', '2021-09-29 12:22:12'),
(162, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-10-10', 'normal', 0, 1, '2021-09-29 12:11:33', '2021-09-29 12:22:24'),
(163, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-11-10', 'normal', 0, 1, '2021-09-29 12:12:55', '2021-09-29 12:22:35'),
(164, 18, 300000, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 12325000, '2018-12-10', 'normal', 0, 1, '2021-09-29 12:14:18', '2021-09-29 12:23:11'),
(165, 18, 300000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-01-31', 'normal', 0, 1, '2021-09-29 12:15:16', '2021-09-29 12:23:30'),
(166, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-02-28', 'normal', 0, 1, '2021-09-29 12:17:00', '2021-09-29 12:23:52'),
(167, 18, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2019-03-30', 'normal', 0, 1, '2021-09-29 12:17:55', '2021-09-29 12:24:14'),
(168, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-04-10', 'normal', 0, 1, '2021-09-29 12:18:53', '2021-09-29 12:24:33'),
(169, 18, 600000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 12150000, '2019-05-10', 'normal', 0, 1, '2021-09-29 12:20:02', '2021-09-29 12:24:50'),
(170, 18, 550000, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 11805000, '2019-06-10', 'normal', 0, 1, '2021-09-29 12:21:06', '2021-09-29 12:25:06'),
(171, 19, 300000, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 12310000, '2018-04-10', 'normal', 0, 1, '2021-09-29 12:22:42', '2021-09-29 13:00:43'),
(172, 19, 320000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12280000, '2018-05-10', 'normal', 0, 1, '2021-09-29 12:23:43', '2021-09-29 13:00:52'),
(173, 19, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-06-12', 'normal', 0, 1, '2021-09-29 12:24:36', '2021-09-29 13:01:02'),
(174, 19, 650000, 0, 0, 0, 0, 17200, 0, 0, 0, 0, 11967200, '2018-07-10', 'normal', 0, 1, '2021-09-29 12:26:34', '2021-09-29 13:01:26'),
(175, 19, 430000, 0, 0, 0, 105000, 12500, 0, 0, 0, 0, 12287500, '2018-08-10', 'normal', 0, 1, '2021-09-29 12:27:51', '2021-09-29 13:01:40'),
(176, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-09-10', 'normal', 0, 1, '2021-09-29 12:28:40', '2021-09-29 13:01:56'),
(177, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-10-10', 'normal', 0, 1, '2021-09-29 12:29:40', '2021-09-29 13:02:11'),
(178, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-11-10', 'normal', 0, 1, '2021-09-29 12:30:27', '2021-09-29 13:02:16'),
(179, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-12-10', 'normal', 0, 1, '2021-09-29 12:31:17', '2021-09-29 13:02:33'),
(180, 19, 300000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-01-31', 'normal', 0, 1, '2021-09-29 12:32:05', '2021-09-29 13:02:45'),
(181, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2019-02-10', 'normal', 0, 1, '2021-09-29 12:33:20', '2021-09-29 13:02:50'),
(182, 19, 360000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 12240000, '2019-03-31', 'normal', 0, 1, '2021-09-29 12:34:45', '2021-09-29 13:02:55'),
(183, 19, 345000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12255000, '2019-04-10', 'normal', 0, 1, '2021-09-29 12:35:45', '2021-09-29 13:03:19'),
(184, 19, 850000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 11900000, '2019-05-10', 'normal', 0, 1, '2021-09-29 12:36:50', '2021-09-29 13:03:37'),
(185, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 12700000, '2019-06-10', 'normal', 0, 1, '2021-09-29 12:39:20', '2021-09-29 13:03:41'),
(186, 20, 645000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 11955000, '2018-04-30', 'normal', 0, 1, '2021-09-29 12:44:05', '2021-09-29 13:09:04'),
(187, 20, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-05-10', 'normal', 0, 1, '2021-09-29 12:45:38', '2021-09-29 13:09:19'),
(188, 20, 300000, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 12325000, '2018-06-10', 'normal', 0, 1, '2021-09-29 12:47:27', '2021-09-29 13:09:28'),
(189, 20, 380000, 0, 0, 0, 0, 17200, 0, 0, 0, 0, 12237200, '2018-07-10', 'normal', 0, 1, '2021-09-29 12:49:37', '2021-09-29 13:09:55'),
(190, 20, 390000, 0, 0, 0, 105000, 12500, 0, 0, 0, 0, 12327500, '2018-08-10', 'normal', 0, 1, '2021-09-29 12:51:16', '2021-09-29 13:10:08'),
(191, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-09-10', 'normal', 0, 1, '2021-09-29 12:51:59', '2021-09-29 13:10:21'),
(192, 20, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-10-10', 'normal', 0, 1, '2021-09-29 12:52:57', '2021-09-29 13:11:06'),
(193, 20, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12000000, '2018-11-10', 'normal', 0, 1, '2021-09-29 12:53:42', '2021-09-29 13:11:10'),
(194, 20, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-12-10', 'normal', 0, 1, '2021-09-29 12:55:04', '2021-09-29 13:11:15'),
(195, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2019-01-10', 'normal', 0, 1, '2021-09-29 12:56:34', '2021-09-29 13:10:58'),
(196, 20, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2019-02-28', 'normal', 0, 1, '2021-09-29 12:57:40', '2021-09-29 13:08:50'),
(197, 20, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2019-03-30', 'normal', 0, 1, '2021-09-29 12:58:26', '2021-09-29 13:08:21'),
(198, 21, 300000, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 12310000, '2018-04-10', 'normal', 0, 1, '2021-09-29 14:00:35', '2021-09-29 14:08:57'),
(199, 21, 310000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12290000, '2018-05-10', 'normal', 0, 1, '2021-09-29 14:01:22', '2021-09-29 14:09:08'),
(200, 21, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-06-10', 'normal', 0, 1, '2021-09-29 14:02:06', '2021-09-29 14:09:22'),
(235, 9, 500000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 7385000, '2019-07-31', 'normal', 0, 1, '2021-09-30 07:42:40', '2021-09-30 11:30:43'),
(202, 21, 300000, 0, 0, 0, 105000, 17200, 0, 0, 0, 0, 12422200, '2018-07-10', 'normal', 0, 1, '2021-09-29 14:05:05', '2021-09-29 14:10:13'),
(203, 21, 434700, 0, 0, 0, 0, 12500, 0, 0, 0, 0, 12177800, '2018-08-10', 'normal', 0, 1, '2021-09-29 14:06:17', '2021-09-29 14:10:30'),
(204, 21, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-09-30', 'normal', 0, 1, '2021-09-29 14:07:11', '2021-09-29 14:10:46'),
(205, 21, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-10-31', 'normal', 0, 1, '2021-09-29 14:07:42', '2021-09-29 14:10:53'),
(206, 23, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-04-10', 'normal', 0, 1, '2021-09-29 14:25:53', '2021-09-29 14:32:52'),
(207, 23, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-05-10', 'normal', 0, 1, '2021-09-29 14:26:35', '2021-09-29 14:33:01'),
(208, 23, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-06-10', 'normal', 0, 1, '2021-09-29 14:27:06', '2021-09-29 14:33:17'),
(209, 23, 300000, 45000, 0, 25000, 105000, 17200, 0, 0, 0, 0, 12447200, '2018-07-31', 'normal', 0, 1, '2021-09-29 14:28:35', '2021-09-29 14:34:50'),
(210, 23, 0, 0, 0, 0, 0, 12500, 0, 0, 0, 0, 12612500, '2018-08-10', 'normal', 0, 1, '2021-09-29 14:29:23', '2021-09-29 14:34:55'),
(211, 23, 550000, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12075000, '2018-09-30', 'normal', 0, 1, '2021-09-29 14:31:26', '2021-09-29 14:35:01'),
(212, 23, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-10-31', 'normal', 0, 1, '2021-09-29 14:31:59', '2021-09-29 14:35:07'),
(213, 26, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-04-10', 'normal', 0, 1, '2021-09-29 14:45:19', '2021-09-29 14:50:34'),
(214, 26, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-05-10', 'normal', 0, 1, '2021-09-29 14:45:50', '2021-09-29 14:50:38'),
(215, 26, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-06-30', 'normal', 0, 1, '2021-09-29 14:46:21', '2021-09-29 14:50:42'),
(216, 26, 645000, 45000, 0, 0, 105000, 17200, 0, 0, 0, 0, 12077200, '2018-07-31', 'normal', 0, 1, '2021-09-29 14:47:59', '2021-09-29 14:50:53'),
(217, 26, 0, 45000, 0, 25000, 0, 12500, 0, 0, 0, 0, 12637500, '2018-08-31', 'normal', 0, 1, '2021-09-29 14:48:50', '2021-09-29 14:51:13'),
(218, 26, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-09-30', 'normal', 0, 1, '2021-09-29 14:49:27', '2021-09-29 14:51:23'),
(219, 26, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-10-31', 'normal', 0, 1, '2021-09-29 14:49:52', '2021-09-29 14:51:27'),
(220, 24, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 12600000, '2018-04-30', 'normal', 0, 1, '2021-09-29 15:01:17', '2021-09-29 15:09:12'),
(221, 24, 670000, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 11955000, '2018-05-10', 'normal', 0, 1, '2021-09-29 15:02:22', '2021-09-29 15:09:19'),
(222, 24, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-06-30', 'normal', 0, 1, '2021-09-29 15:03:16', '2021-09-29 15:09:24'),
(223, 24, 950000, 45000, 0, 25000, 105000, 17200, 0, 0, 0, 0, 11797200, '2018-07-31', 'normal', 0, 1, '2021-09-29 15:04:50', '2021-09-29 15:09:29'),
(224, 24, 0, 45000, 0, 25000, 0, 12500, 0, 0, 0, 0, 12637500, '2018-08-31', 'normal', 0, 1, '2021-09-29 15:05:58', '2021-09-29 15:12:39'),
(225, 24, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-09-30', 'normal', 0, 1, '2021-09-29 15:06:26', '2021-09-29 15:12:43'),
(226, 24, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-10-31', 'normal', 0, 1, '2021-09-29 15:06:54', '2021-09-29 15:12:47'),
(227, 25, 300000, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 12300000, '2018-04-10', 'normal', 0, 1, '2021-09-29 15:19:32', '2021-09-29 15:23:33'),
(228, 25, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-05-31', 'normal', 0, 1, '2021-09-29 15:20:05', '2021-09-29 15:21:49'),
(229, 25, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-06-30', 'normal', 0, 1, '2021-09-29 15:20:47', '2021-09-29 15:21:54'),
(230, 28, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12300000, '2018-04-10', 'normal', 0, 1, '2021-09-29 15:27:17', '2021-09-29 15:30:32'),
(231, 28, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-05-31', 'normal', 0, 1, '2021-09-29 15:27:46', '2021-09-29 15:30:35'),
(232, 28, 0, 45000, 0, 25000, 0, 0, 0, 0, 0, 0, 12625000, '2018-06-30', 'normal', 0, 1, '2021-09-29 15:28:25', '2021-09-29 15:30:45'),
(233, 28, 0, 45000, 0, 25000, 105000, 17200, 0, 0, 0, 0, 12747200, '2018-07-31', 'normal', 0, 1, '2021-09-29 15:29:26', '2021-09-29 15:30:49'),
(234, 28, 0, 45000, 0, 25000, 0, 12500, 0, 0, 0, 0, 12534700, '2018-08-31', 'normal', 0, 1, '2021-09-29 15:31:57', '2021-09-29 15:32:20'),
(236, 9, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 7885000, '2019-08-31', 'normal', 0, 1, '2021-09-30 07:45:32', '2021-09-30 11:31:03'),
(237, 9, 0, 90000, 0, 0, 0, 0, 0, 0, 0, 0, 7885000, '2019-09-30', 'normal', 0, 1, '2021-09-30 07:47:36', '2021-09-30 11:31:21'),
(238, 9, 0, 135000, 0, 0, 0, 0, 0, 0, 0, 150000, 8035000, '2019-10-31', 'normal', 0, 1, '2021-09-30 07:48:50', '2021-09-30 11:31:44'),
(239, 9, 0, 180000, 0, 0, 0, 0, 0, 0, 0, 0, 7885000, '2019-11-30', 'normal', 0, 1, '2021-09-30 07:50:11', '2021-09-30 11:32:05'),
(240, 9, 0, 225000, 0, 0, 0, 0, 0, 0, 0, 0, 7885000, '2019-12-31', 'normal', 0, 1, '2021-09-30 07:53:32', '2021-09-30 12:16:42'),
(241, 9, 0, 270000, 0, 0, 0, 0, 0, 0, 0, 0, 7885000, '2020-01-31', 'normal', 0, 1, '2021-09-30 07:55:34', '2021-09-30 11:32:50'),
(242, 9, 1500000, 315000, 0, 0, 0, 0, 0, 0, 0, 0, 6385000, '2020-02-29', 'normal', 0, 1, '2021-09-30 07:56:42', '2021-09-30 11:33:00'),
(243, 9, 300000, 90000, 0, 0, 0, 0, 0, 0, 0, 0, 7585000, '2020-03-31', 'normal', 0, 1, '2021-09-30 07:57:34', '2021-09-30 11:33:11'),
(244, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7885000, '2020-04-10', 'normal', 0, 1, '2021-09-30 07:58:42', '2021-09-30 11:33:28'),
(245, 9, 2500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5385000, '2020-05-10', 'normal', 0, 1, '2021-09-30 08:00:09', '2021-09-30 11:33:52'),
(246, 9, 1947500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7437500, '2020-06-30', 'normal', 0, 1, '2021-09-30 08:02:57', '2021-09-30 11:34:23'),
(247, 10, 300000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 7624700, '2019-07-10', 'normal', 0, 1, '2021-09-30 08:10:50', '2021-09-30 12:47:07'),
(248, 10, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7324700, '2019-08-10', 'normal', 0, 1, '2021-09-30 08:14:57', '2021-09-30 12:47:18'),
(249, 10, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 7824700, '2019-09-30', 'normal', 0, 1, '2021-09-30 08:19:48', '2021-09-30 12:47:32'),
(250, 10, 795000, 0, 50000, 0, 0, 0, 0, 0, 0, 0, 7079700, '2019-10-10', 'normal', 0, 1, '2021-09-30 08:21:04', '2021-09-30 12:31:59'),
(251, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7524700, '2019-11-10', 'normal', 0, 1, '2021-09-30 08:22:24', '2021-09-30 12:31:34'),
(252, 10, 0, 90000, 50000, 0, 0, 0, 0, 0, 0, 0, 7874700, '2020-01-31', 'normal', 0, 1, '2021-09-30 08:38:37', '2021-09-30 12:40:47'),
(253, 10, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6824700, '2020-02-10', 'normal', 0, 1, '2021-09-30 08:40:45', '2021-09-30 12:31:01'),
(254, 10, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 7824700, '2020-03-31', 'normal', 0, 1, '2021-09-30 08:41:55', '2021-09-30 12:29:44'),
(255, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7824700, '2020-04-30', 'normal', 0, 1, '2021-09-30 08:43:17', '2021-09-30 12:29:27'),
(256, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7824700, '2020-05-30', 'normal', 0, 1, '2021-09-30 08:44:16', '2021-09-30 12:29:03'),
(257, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7824700, '2020-06-30', 'normal', 0, 1, '2021-09-30 08:45:03', '2021-09-30 12:28:41'),
(258, 11, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9305800, '2019-07-10', 'normal', 0, 1, '2021-09-30 08:46:53', '2021-09-30 14:00:59'),
(259, 11, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9305800, '2019-08-10', 'normal', 0, 1, '2021-09-30 08:48:07', '2021-09-30 13:56:18'),
(260, 11, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9705800, '2019-09-10', 'normal', 0, 1, '2021-09-30 08:48:56', '2021-09-30 13:56:26'),
(261, 11, 300000, 45000, 0, 100000, 0, 0, 0, 0, 0, 500000, 10155800, '2019-10-31', 'normal', 0, 1, '2021-09-30 08:50:09', '2021-09-30 14:01:11'),
(262, 11, 300000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 10005800, '2019-11-30', 'normal', 0, 1, '2021-09-30 08:52:02', '2021-09-30 13:57:40'),
(263, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10005800, '2019-12-10', 'normal', 0, 1, '2021-09-30 08:53:24', '2021-09-30 13:57:52'),
(264, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10005800, '2020-01-10', 'normal', 0, 1, '2021-09-30 08:54:15', '2021-09-30 13:03:32'),
(265, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10005800, '2020-02-10', 'normal', 0, 1, '2021-09-30 08:55:03', '2021-09-30 13:03:12'),
(266, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10005800, '2020-03-10', 'normal', 0, 1, '2021-09-30 08:55:48', '2021-09-30 13:02:53'),
(267, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10305800, '2020-04-10', 'normal', 0, 1, '2021-09-30 08:56:22', '2021-09-30 13:02:38'),
(268, 11, 1300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9005800, '2020-05-10', 'normal', 0, 1, '2021-09-30 08:57:13', '2021-09-30 13:02:05'),
(269, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10305800, '2020-06-10', 'normal', 0, 1, '2021-09-30 08:58:50', '2021-09-30 13:01:39'),
(270, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7400000, '2019-07-10', 'normal', 0, 1, '2021-09-30 08:59:39', '2021-09-30 14:38:00'),
(271, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7700000, '2019-08-10', 'normal', 0, 1, '2021-09-30 09:00:28', '2021-09-30 14:38:22'),
(272, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7400000, '2019-09-10', 'normal', 0, 1, '2021-09-30 09:01:18', '2021-09-30 14:38:45'),
(273, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 500000, 7450000, '2019-10-10', 'normal', 0, 1, '2021-09-30 09:02:19', '2021-09-30 14:44:27'),
(274, 12, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7200000, '2019-11-10', 'normal', 0, 1, '2021-09-30 09:03:12', '2021-09-30 14:39:42'),
(275, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7400000, '2019-12-10', 'normal', 0, 1, '2021-09-30 09:05:25', '2021-09-30 14:40:42'),
(276, 12, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7200000, '2020-01-10', 'normal', 0, 1, '2021-09-30 09:07:03', '2021-09-30 14:44:32'),
(277, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7400000, '2020-02-10', 'normal', 0, 1, '2021-09-30 09:09:50', '2021-09-30 14:41:38'),
(278, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7400000, '2020-03-10', 'normal', 0, 1, '2021-09-30 09:10:42', '2021-09-30 14:41:50'),
(279, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7700000, '2020-04-10', 'normal', 0, 1, '2021-09-30 09:11:58', '2021-09-30 14:42:10'),
(280, 12, 700000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7000000, '2020-05-10', 'normal', 0, 1, '2021-09-30 09:12:45', '2021-09-30 14:37:53'),
(281, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7400000, '2020-06-10', 'normal', 0, 1, '2021-09-30 09:13:26', '2021-09-30 14:42:17'),
(282, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10100000, '2019-07-10', 'normal', 0, 1, '2021-09-30 09:17:56', '2021-09-30 14:45:47'),
(283, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10100000, '2019-08-10', 'normal', 0, 1, '2021-09-30 09:18:47', '2021-09-30 14:46:06'),
(284, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10100000, '2019-09-10', 'normal', 0, 1, '2021-09-30 09:19:38', '2021-09-30 14:46:17'),
(285, 13, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 300000, 10700000, '2019-10-31', 'normal', 0, 1, '2021-09-30 09:20:47', '2021-09-30 14:51:36'),
(286, 13, 0, 90000, 0, 0, 0, 0, 0, 0, 0, 0, 10400000, '2019-11-30', 'normal', 0, 1, '2021-09-30 09:22:15', '2021-09-30 14:51:41'),
(287, 13, 0, 135000, 0, 0, 0, 0, 0, 0, 0, 0, 10400000, '2019-12-31', 'normal', 0, 1, '2021-09-30 09:23:47', '2021-09-30 14:47:21'),
(288, 13, 0, 180000, 0, 100000, 0, 0, 0, 0, 0, 0, 10500000, '2020-01-31', 'normal', 0, 1, '2021-09-30 10:39:02', '2021-09-30 14:47:36'),
(289, 13, 300000, 180000, 0, 0, 0, 0, 0, 0, 0, 0, 10100000, '2020-02-29', 'normal', 0, 1, '2021-09-30 10:42:04', '2021-09-30 14:47:52'),
(290, 13, 1000000, 30000, 50000, 0, 0, 0, 0, 0, 0, 0, 9450000, '2020-03-31', 'normal', 0, 1, '2021-09-30 10:43:09', '2021-09-30 14:48:31'),
(291, 13, 1300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9100000, '2020-04-10', 'normal', 0, 1, '2021-09-30 10:44:29', '2021-09-30 14:49:20'),
(292, 13, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9400000, '2020-05-10', 'normal', 0, 1, '2021-09-30 10:45:21', '2021-09-30 14:48:54'),
(293, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10400000, '2020-06-10', 'normal', 0, 1, '2021-09-30 10:46:00', '2021-09-30 14:49:06'),
(294, 14, 300000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 7799600, '2019-07-10', 'normal', 0, 1, '2021-09-30 10:48:11', '2021-09-30 14:52:41'),
(295, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7699600, '2019-08-10', 'normal', 0, 1, '2021-09-30 10:49:13', '2021-09-30 14:53:23'),
(296, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7699600, '2019-09-10', 'normal', 0, 1, '2021-09-30 10:50:15', '2021-09-30 14:53:36'),
(297, 14, 300000, 0, 0, 100000, 0, 0, 0, 0, 0, 500000, 8299600, '2019-10-10', 'normal', 0, 1, '2021-09-30 10:51:35', '2021-09-30 14:53:54'),
(298, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7699600, '2019-11-10', 'normal', 0, 1, '2021-09-30 10:53:16', '2021-09-30 14:54:07'),
(299, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7699600, '2019-12-10', 'normal', 0, 1, '2021-09-30 10:54:11', '2021-09-30 14:54:14'),
(300, 14, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 7999600, '2020-01-31', 'normal', 0, 1, '2021-09-30 10:55:34', '2021-09-30 14:54:29'),
(301, 14, 1145000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6854600, '2020-02-10', 'normal', 0, 1, '2021-09-30 10:56:36', '2021-09-30 14:54:44'),
(302, 14, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 7999600, '2020-03-31', 'normal', 0, 1, '2021-09-30 10:58:15', '2021-09-30 14:55:17'),
(303, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7999600, '2020-04-10', 'normal', 0, 1, '2021-09-30 10:59:20', '2021-09-30 14:55:48'),
(304, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7999600, '2020-05-10', 'normal', 0, 1, '2021-09-30 10:59:56', '2021-09-30 14:55:53'),
(305, 14, 2234600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5765000, '2020-06-10', 'normal', 0, 1, '2021-09-30 11:01:31', '2021-09-30 14:52:14'),
(306, 15, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6862500, '2019-07-10', 'normal', 0, 1, '2021-09-30 11:03:54', '2021-09-30 14:57:09'),
(307, 15, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6862500, '2019-08-10', 'normal', 0, 1, '2021-09-30 11:05:32', '2021-09-30 14:57:14'),
(308, 15, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6862500, '2019-09-10', 'normal', 0, 1, '2021-09-30 11:06:20', '2021-09-30 14:57:19'),
(309, 15, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 600000, 7462500, '2019-10-10', 'normal', 0, 1, '2021-09-30 11:07:36', '2021-09-30 14:57:39'),
(310, 15, 450000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6712500, '2019-11-10', 'normal', 0, 1, '2021-09-30 11:08:40', '2021-09-30 14:58:01'),
(311, 15, 300000, 0, 0, 0, 0, 0, 0, 0, 600000, 0, 7462500, '2019-12-10', 'normal', 0, 1, '2021-09-30 11:09:31', '2021-09-30 14:58:14'),
(312, 15, 0, 45000, 50000, 0, 0, 0, 0, 0, 0, 0, 7212500, '2020-01-31', 'normal', 0, 1, '2021-09-30 11:10:28', '2021-09-30 15:03:08'),
(313, 15, 0, 90000, 0, 0, 0, 0, 0, 0, 0, 0, 7162500, '2020-02-29', 'normal', 0, 1, '2021-09-30 12:14:52', '2021-09-30 14:59:31'),
(314, 15, 0, 135000, 0, 0, 0, 0, 0, 0, 0, 0, 7162500, '2020-03-31', 'normal', 0, 1, '2021-09-30 12:15:44', '2021-09-30 14:59:45'),
(315, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7162500, '2020-04-10', 'normal', 0, 1, '2021-09-30 12:16:42', '2021-09-30 15:00:21'),
(316, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7162500, '2020-05-10', 'normal', 0, 1, '2021-09-30 12:18:28', '2021-09-30 15:00:31'),
(317, 15, 2737500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4425000, '2020-06-10', 'normal', 0, 1, '2021-09-30 12:19:44', '2021-09-30 14:56:44'),
(318, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7784700, '2019-07-10', 'normal', 0, 1, '2021-09-30 12:29:22', '2021-09-30 15:16:53'),
(319, 16, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7484700, '2019-08-10', 'normal', 0, 1, '2021-09-30 12:29:57', '2021-09-30 15:17:15'),
(320, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8084700, '2019-09-10', 'normal', 0, 1, '2021-09-30 12:31:02', '2021-09-30 15:17:25'),
(321, 16, 0, 45000, 50000, 0, 0, 0, 0, 0, 0, 150000, 8284700, '2019-10-31', 'normal', 0, 1, '2021-09-30 12:32:13', '2021-09-30 15:17:45'),
(322, 16, 0, 90000, 0, 0, 0, 0, 0, 0, 0, 0, 8084700, '2019-11-30', 'normal', 0, 1, '2021-09-30 12:33:50', '2021-09-30 15:18:08'),
(323, 16, 700000, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 7384700, '2019-12-31', 'normal', 0, 1, '2021-09-30 12:41:46', '2021-09-30 15:18:33'),
(324, 16, 0, 75000, 50000, 0, 0, 0, 0, 0, 0, 0, 8134700, '2020-01-31', 'normal', 0, 1, '2021-09-30 12:42:56', '2021-09-30 15:19:00'),
(325, 16, 0, 120000, 0, 0, 0, 0, 0, 0, 0, 0, 8084700, '2020-02-29', 'normal', 0, 1, '2021-09-30 12:43:52', '2021-09-30 15:19:27'),
(326, 10, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 5829700, '2019-12-31', 'normal', 0, 1, '2021-09-30 12:45:30', '2021-09-30 12:59:22'),
(327, 16, 300000, 120000, 0, 0, 0, 0, 0, 0, 0, 0, 7784700, '2020-03-31', 'normal', 0, 1, '2021-09-30 12:45:45', '2021-09-30 15:21:43'),
(328, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8084700, '2020-04-10', 'normal', 0, 1, '2021-09-30 12:47:44', '2021-09-30 15:25:47'),
(329, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7784700, '2020-05-10', 'normal', 0, 1, '2021-09-30 12:49:46', '2021-09-30 15:25:52'),
(330, 16, 1900000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6184700, '2020-06-30', 'normal', 0, 1, '2021-09-30 12:50:34', '2021-09-30 15:16:38'),
(331, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2019-07-10', 'normal', 0, 1, '2021-09-30 13:00:54', '2021-09-30 15:28:34'),
(332, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2019-08-10', 'normal', 0, 1, '2021-09-30 13:01:23', '2021-09-30 15:28:39'),
(333, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2019-09-10', 'normal', 0, 1, '2021-09-30 13:01:56', '2021-09-30 15:28:44'),
(334, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2019-10-10', 'normal', 0, 1, '2021-09-30 13:02:27', '2021-09-30 15:28:49'),
(335, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2019-11-10', 'normal', 0, 1, '2021-09-30 13:02:57', '2021-09-30 15:28:54'),
(336, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2019-12-10', 'normal', 0, 1, '2021-09-30 13:03:29', '2021-09-30 15:29:04'),
(337, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2020-01-10', 'normal', 0, 1, '2021-09-30 13:04:00', '2021-09-30 15:29:15'),
(338, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2020-02-10', 'normal', 0, 1, '2021-09-30 13:04:33', '2021-09-30 15:29:20'),
(339, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2020-03-10', 'normal', 0, 1, '2021-09-30 13:05:08', '2021-09-30 15:29:25'),
(340, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2020-04-10', 'normal', 0, 1, '2021-09-30 13:05:46', '2021-09-30 15:29:30'),
(341, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2020-05-10', 'normal', 0, 1, '2021-09-30 13:06:22', '2021-09-30 15:29:46'),
(342, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7659700, '2020-06-10', 'normal', 0, 1, '2021-09-30 13:06:52', '2021-09-30 15:28:22'),
(343, 18, 400000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7585000, '2019-07-10', 'normal', 0, 1, '2021-09-30 13:09:36', '2021-09-30 15:30:38'),
(344, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7685000, '2019-08-10', 'normal', 0, 1, '2021-09-30 13:10:22', '2021-09-30 15:30:55'),
(345, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7685000, '2019-09-10', 'normal', 0, 1, '2021-09-30 13:11:14', '2021-09-30 15:31:14'),
(346, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 500000, 8185000, '2019-10-10', 'normal', 0, 1, '2021-09-30 13:12:14', '2021-09-30 15:32:30'),
(347, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7685000, '2019-11-10', 'normal', 0, 1, '2021-09-30 13:13:02', '2021-09-30 15:32:46'),
(348, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7685000, '2019-12-10', 'normal', 0, 1, '2021-09-30 13:13:49', '2021-09-30 15:33:05'),
(349, 18, 300000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 7685000, '2020-01-31', 'normal', 0, 1, '2021-09-30 13:14:32', '2021-09-30 15:33:20'),
(350, 18, 345000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7640000, '2020-02-10', 'normal', 0, 1, '2021-09-30 13:15:17', '2021-09-30 15:33:31'),
(351, 18, 800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7185000, '2020-03-10', 'normal', 0, 1, '2021-09-30 13:16:02', '2021-09-30 15:34:00'),
(352, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7985000, '2020-04-10', 'normal', 0, 1, '2021-09-30 13:16:45', '2021-09-30 15:34:12'),
(353, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7685000, '2020-05-10', 'normal', 0, 1, '2021-09-30 13:17:28', '2021-09-30 15:34:28'),
(354, 18, 365000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7620000, '2020-06-10', 'normal', 0, 1, '2021-09-30 13:18:21', '2021-09-30 15:30:22'),
(355, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7564700, '2019-07-10', 'normal', 0, 1, '2021-09-30 13:19:09', '2021-09-30 15:35:58'),
(356, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7564700, '2019-08-10', 'normal', 0, 1, '2021-09-30 13:19:50', '2021-09-30 15:36:03'),
(357, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7564700, '2019-09-10', 'normal', 0, 1, '2021-09-30 13:20:30', '2021-09-30 15:36:08'),
(358, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 500000, 8064700, '2019-10-10', 'normal', 0, 1, '2021-09-30 13:21:12', '2021-09-30 15:36:22'),
(359, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7564700, '2019-11-10', 'normal', 0, 1, '2021-09-30 13:21:54', '2021-09-30 15:36:36'),
(360, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7564700, '2019-12-10', 'normal', 0, 1, '2021-09-30 13:22:32', '2021-09-30 15:36:54'),
(361, 19, 300000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 7564700, '2020-01-31', 'normal', 0, 1, '2021-09-30 13:23:21', '2021-09-30 15:41:33'),
(368, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2637500, '2020-07-10', 'normal', 0, 1, '2021-10-04 09:51:55', '2021-10-04 12:34:04'),
(363, 19, 345000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7519700, '2020-02-10', 'normal', 0, 1, '2021-09-30 13:25:09', '2021-09-30 15:38:15'),
(364, 19, 800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7064700, '2020-03-10', 'normal', 0, 1, '2021-09-30 13:25:57', '2021-09-30 15:38:27'),
(365, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7864700, '2020-04-10', 'normal', 0, 1, '2021-09-30 13:26:36', '2021-09-30 15:38:51'),
(366, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7864700, '2020-05-10', 'normal', 0, 1, '2021-09-30 13:27:14', '2021-09-30 15:38:57'),
(367, 19, 400000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7464700, '2020-06-10', 'normal', 0, 1, '2021-09-30 13:28:04', '2021-09-30 15:39:02'),
(370, 9, 6000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-09-10', 'normal', 0, 1, '2021-10-04 09:54:05', '2021-10-04 12:35:11'),
(371, 9, 5963437, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-10-10', 'normal', 0, 1, '2021-10-04 09:55:21', '2021-10-04 12:35:26'),
(372, 9, 0, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 2737500, '2020-11-10', 'normal', 0, 1, '2021-10-04 09:57:10', '2021-10-04 12:35:38'),
(373, 9, 1100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1537500, '2020-12-10', 'normal', 0, 1, '2021-10-04 10:28:20', '2021-10-04 12:35:50'),
(374, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2637500, '2021-01-10', 'normal', 0, 1, '2021-10-04 10:29:33', '2021-10-04 12:36:09'),
(375, 9, 1844826, 164325, 0, 0, 0, 0, 0, 0, 0, 0, 792674, '2021-02-28', 'normal', 0, 1, '2021-10-04 10:31:18', '2021-10-04 12:36:33'),
(376, 9, 300000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 2487500, '2021-03-10', 'normal', 0, 1, '2021-10-04 10:32:44', '2021-10-04 12:37:03'),
(377, 9, 0, 45000, 50000, 0, 0, 0, 0, 0, 0, 0, 2687500, '2021-04-30', 'normal', 0, 1, '2021-10-04 10:34:12', '2021-10-04 12:37:19'),
(378, 9, 0, 90000, 0, 0, 0, 0, 0, 0, 0, 0, 2637500, '2021-05-31', 'normal', 0, 1, '2021-10-04 10:35:37', '2021-10-04 12:37:57'),
(379, 9, 9420000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-06-10', 'normal', 0, 1, '2021-10-04 10:39:22', '2021-10-04 12:38:14'),
(380, 9, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 2637500, '2021-07-31', 'normal', 0, 1, '2021-10-04 10:54:11', '2021-10-04 12:38:36'),
(381, 9, 1000000, 90000, 0, 0, 0, 0, 0, 0, 200000, 0, 1837500, '2021-08-31', 'normal', 0, 1, '2021-10-04 10:55:15', '2021-10-04 12:38:52'),
(382, 9, 3700000, 0, 0, 0, 400000, 0, 0, 0, 0, 0, 0, '2021-09-10', 'normal', 0, 1, '2021-10-04 10:56:16', '2021-10-04 12:39:30'),
(386, 10, 1129700, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 4100000, '2021-01-10', 'normal', 0, 1, '2021-10-05 06:27:00', '2021-10-05 07:59:17'),
(387, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4829700, '2021-02-10', 'normal', 0, 1, '2021-10-05 06:28:02', '2021-10-05 07:58:42'),
(388, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4829700, '2021-03-10', 'normal', 0, 1, '2021-10-05 06:29:19', '2021-10-05 07:58:26'),
(389, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4829700, '2021-04-10', 'normal', 0, 1, '2021-10-05 06:30:29', '2021-10-05 07:58:13'),
(390, 10, 345000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 4784700, '2021-05-31', 'normal', 0, 1, '2021-10-05 06:31:28', '2021-10-05 07:57:57'),
(391, 10, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 5129700, '2021-06-30', 'normal', 0, 1, '2021-10-05 06:32:27', '2021-10-05 07:57:37'),
(392, 10, 30654500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-07-10', 'normal', 0, 1, '2021-10-05 06:33:49', '2021-10-05 07:57:20'),
(393, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 200000, 0, 5029700, '2021-08-10', 'normal', 0, 1, '2021-10-05 06:35:32', '2021-10-05 07:55:56'),
(394, 10, 300000, 0, 0, 0, 500000, 0, 0, 0, 0, 0, 4879700, '2021-09-10', 'normal', 0, 1, '2021-10-05 06:36:46', '2021-10-05 08:09:27'),
(395, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4705800, '2020-07-10', 'normal', 0, 1, '2021-10-05 06:38:52', '2021-10-05 08:24:15'),
(396, 11, 1542000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3163800, '2020-08-10', 'normal', 0, 1, '2021-10-05 06:40:07', '2021-10-05 08:24:26'),
(397, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4405800, '2020-09-10', 'normal', 0, 1, '2021-10-05 06:41:20', '2021-10-05 08:24:56'),
(398, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4405800, '2020-10-10', 'normal', 0, 1, '2021-10-05 06:58:20', '2021-10-05 08:25:02'),
(399, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 4505800, '2020-11-10', 'normal', 0, 1, '2021-10-05 06:59:52', '2021-10-05 08:25:30'),
(400, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4405800, '2020-12-10', 'normal', 0, 1, '2021-10-05 07:00:38', '2021-10-05 08:25:38'),
(401, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4405800, '2021-01-10', 'normal', 0, 1, '2021-10-05 07:01:55', '2021-10-05 08:25:59'),
(402, 11, 21353013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-02-10', 'normal', 0, 1, '2021-10-05 07:03:57', '2021-10-05 08:27:33'),
(403, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 4555800, '2021-03-10', 'normal', 0, 1, '2021-10-05 07:05:51', '2021-10-05 08:28:11');
INSERT INTO `saving_logs` (`id`, `member`, `monthly_contr`, `late_payment`, `late_meeting`, `absenteeism`, `marriage`, `birth`, `graduation`, `consecration`, `death`, `sickness`, `arrears`, `date`, `log_type`, `status`, `approve`, `created_at`, `updated_at`) VALUES
(404, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4405800, '2021-04-10', 'normal', 0, 1, '2021-10-05 07:07:31', '2021-10-05 08:28:30'),
(405, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4405800, '2021-05-10', 'normal', 0, 1, '2021-10-05 07:09:00', '2021-10-05 08:28:48'),
(406, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4405800, '2021-06-10', 'normal', 0, 1, '2021-10-05 07:10:01', '2021-10-05 08:29:00'),
(407, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4405800, '2021-07-10', 'normal', 0, 1, '2021-10-05 07:10:44', '2021-10-05 08:29:10'),
(408, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 300000, 0, 4705800, '2021-08-10', 'normal', 0, 1, '2021-10-05 07:13:08', '2021-10-05 08:29:48'),
(409, 11, 300000, 0, 0, 0, 1000000, 0, 0, 0, 0, 0, 4505800, '2021-09-10', 'normal', 0, 1, '2021-10-05 07:14:02', '2021-10-05 08:33:00'),
(410, 12, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3300000, '2020-07-10', 'normal', 0, 1, '2021-10-05 07:15:35', '2021-10-05 08:34:29'),
(411, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3900000, '2020-08-10', 'normal', 0, 1, '2021-10-05 07:16:13', '2021-10-05 08:34:35'),
(412, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3600000, '2021-09-10', 'normal', 0, 1, '2021-10-05 07:16:56', '2021-10-05 08:35:13'),
(413, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3600000, '2020-10-10', 'normal', 0, 1, '2021-10-05 07:18:07', '2021-10-05 08:35:20'),
(414, 12, 500000, 0, 0, 100000, 0, 0, 0, 0, 0, 100000, 3600000, '2020-11-10', 'normal', 0, 1, '2021-10-05 07:20:18', '2021-10-05 08:35:37'),
(415, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3600000, '2020-12-10', 'normal', 0, 1, '2021-10-05 07:21:02', '2021-10-05 08:35:56'),
(416, 12, 300000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 3700000, '2021-01-10', 'normal', 0, 1, '2021-10-05 07:22:07', '2021-10-05 08:36:07'),
(417, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3600000, '2021-02-10', 'normal', 0, 1, '2021-10-05 07:23:10', '2021-10-05 08:36:32'),
(418, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 3750000, '2021-03-10', 'normal', 0, 1, '2021-10-05 07:25:17', '2021-10-05 08:36:44'),
(419, 12, 300000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 3700000, '2021-04-10', 'normal', 0, 1, '2021-10-05 07:26:13', '2021-10-05 08:37:00'),
(420, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3600000, '2021-05-10', 'normal', 0, 1, '2021-10-05 07:27:10', '2021-10-05 08:37:11'),
(421, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3600000, '2021-06-10', 'normal', 0, 1, '2021-10-05 07:28:03', '2021-10-05 08:37:32'),
(422, 12, 6500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-07-10', 'normal', 0, 1, '2021-10-05 07:29:36', '2021-10-05 08:37:52'),
(423, 12, 600000, 0, 0, 0, 0, 0, 0, 0, 200000, 0, 3500000, '2021-08-10', 'normal', 0, 1, '2021-10-05 07:30:37', '2021-10-05 08:38:08'),
(424, 12, 0, 0, 0, 0, 300000, 0, 0, 0, 0, 0, 4200000, '2021-09-10', 'normal', 0, 1, '2021-10-05 07:34:18', '2021-10-05 08:38:26'),
(425, 13, 2800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3250000, '2020-07-10', 'normal', 0, 1, '2021-10-05 07:52:19', '2021-10-05 08:38:46'),
(426, 13, 310000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5740000, '2020-08-10', 'normal', 0, 1, '2021-10-05 07:56:35', '2021-10-05 08:39:11'),
(427, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5750000, '2020-09-10', 'normal', 0, 1, '2021-10-05 07:57:38', '2021-10-05 08:39:25'),
(428, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5750000, '2020-10-10', 'normal', 0, 1, '2021-10-05 07:58:45', '2021-10-05 08:39:37'),
(429, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 5850000, '2020-11-10', 'normal', 0, 1, '2021-10-05 07:59:52', '2021-10-05 08:40:02'),
(430, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5750000, '2020-12-10', 'normal', 0, 1, '2021-10-05 08:03:30', '2021-10-05 08:40:23'),
(431, 13, 300000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 5850000, '2021-01-10', 'normal', 0, 1, '2021-10-05 08:04:13', '2021-10-05 08:40:33'),
(432, 13, 14300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-02-10', 'normal', 0, 1, '2021-10-05 08:05:19', '2021-10-05 08:40:54'),
(433, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 5900000, '2021-03-10', 'normal', 0, 1, '2021-10-05 08:06:11', '2021-10-05 08:41:11'),
(434, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5750000, '2021-04-10', 'normal', 0, 1, '2021-10-05 08:09:36', '2021-10-05 08:41:23'),
(435, 13, 17500000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-31', 'normal', 0, 1, '2021-10-05 08:11:08', '2021-10-05 08:41:41'),
(436, 13, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5450000, '2021-06-10', 'normal', 0, 1, '2021-10-05 08:12:11', '2021-10-05 08:41:58'),
(437, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5750000, '2021-07-10', 'normal', 0, 1, '2021-10-05 08:13:04', '2021-10-05 08:42:19'),
(438, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 300000, 0, 6050000, '2021-08-10', 'normal', 0, 1, '2021-10-05 08:14:07', '2021-10-05 08:42:26'),
(439, 13, 300000, 0, 0, 0, 500000, 0, 0, 0, 0, 0, 6250000, '2021-09-10', 'normal', 0, 1, '2021-10-05 08:14:52', '2021-10-05 08:42:41'),
(440, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-10-10', 'normal', 0, 1, '2021-10-05 08:16:23', '2021-10-05 08:20:26'),
(441, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2820000, '2020-07-10', 'normal', 0, 1, '2021-10-05 08:16:58', '2021-10-05 08:43:05'),
(442, 10, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 100000, 0, '2020-11-30', 'normal', 0, 1, '2021-10-05 08:17:20', '2021-10-05 08:20:49'),
(443, 14, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2820000, '2020-08-10', 'normal', 0, 1, '2021-10-05 08:17:38', '2021-10-05 08:44:16'),
(444, 14, 3000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 120000, '2020-09-10', 'normal', 0, 1, '2021-10-05 08:19:13', '2021-10-05 08:45:10'),
(445, 10, 4630500, 90000, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-12-31', 'normal', 0, 1, '2021-10-05 08:19:40', '2021-10-05 08:21:12'),
(446, 14, 21277147, 0, 0, 0, 0, 0, 0, 0, 0, 200000, 0, '2020-10-10', 'normal', 0, 1, '2021-10-05 08:21:41', '2021-10-05 08:45:36'),
(447, 14, 0, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 3220000, '2020-11-10', 'normal', 0, 1, '2021-10-05 08:22:33', '2021-10-05 08:46:10'),
(448, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3120000, '2020-12-10', 'normal', 0, 1, '2021-10-05 08:23:33', '2021-10-05 08:46:21'),
(449, 14, 28917373, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-01-10', 'normal', 0, 1, '2021-10-05 08:27:33', '2021-10-05 08:46:59'),
(531, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-10', 'normal', 0, 1, '2021-10-06 10:08:15', '2021-10-06 10:09:14'),
(456, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3125000, '2020-07-10', 'normal', 0, 1, '2021-10-05 08:51:03', '2021-10-06 08:50:21'),
(457, 15, 9650000, 91462, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-08-10', 'normal', 0, 1, '2021-10-05 08:54:28', '2021-10-06 08:50:04'),
(458, 15, 351212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2773788, '2020-09-10', 'normal', 0, 1, '2021-10-05 08:57:05', '2021-10-06 08:49:44'),
(459, 15, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2825000, '2020-10-10', 'normal', 0, 1, '2021-10-05 08:57:55', '2021-10-06 08:49:22'),
(460, 15, 0, 45000, 50000, 0, 0, 0, 0, 0, 0, 100000, 3275000, '2020-11-30', 'normal', 0, 1, '2021-10-05 09:00:32', '2021-10-06 08:49:01'),
(461, 15, 0, 90000, 0, 0, 0, 0, 0, 0, 0, 0, 3125000, '2020-12-31', 'normal', 0, 1, '2021-10-05 09:21:15', '2021-10-06 08:48:21'),
(462, 15, 13000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-01-10', 'normal', 0, 1, '2021-10-05 09:24:40', '2021-10-06 08:48:05'),
(463, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3125000, '2021-02-10', 'normal', 0, 1, '2021-10-05 09:25:27', '2021-10-06 08:41:13'),
(464, 15, 1000000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 2275000, '2021-03-10', 'normal', 0, 1, '2021-10-05 09:26:19', '2021-10-06 08:40:53'),
(465, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3125000, '2021-04-10', 'normal', 0, 1, '2021-10-05 09:27:05', '2021-10-06 08:40:32'),
(466, 15, 23352500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-10', 'normal', 0, 1, '2021-10-05 09:30:49', '2021-10-06 08:39:10'),
(467, 15, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 3125000, '2021-06-10', 'normal', 0, 1, '2021-10-05 09:42:50', '2021-10-06 08:38:40'),
(468, 15, 500000, 90000, 0, 0, 0, 0, 0, 0, 0, 0, 2625000, '2021-07-31', 'normal', 0, 1, '2021-10-05 09:43:49', '2021-10-06 08:38:20'),
(469, 15, 0, 60000, 0, 0, 0, 0, 0, 0, 500000, 0, 3625000, '2021-08-31', 'normal', 0, 1, '2021-10-05 09:44:42', '2021-10-06 08:36:57'),
(470, 15, 0, 1686909, 0, 0, 0, 0, 0, 0, 0, 0, 3125000, '2021-09-30', 'normal', 0, 1, '2021-10-05 09:45:42', '2021-10-06 08:36:21'),
(471, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4084700, '2020-07-10', 'normal', 0, 1, '2021-10-05 09:49:00', '2021-10-06 09:03:51'),
(472, 16, 814700, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3270000, '2020-08-10', 'normal', 0, 1, '2021-10-05 09:50:13', '2021-10-06 09:03:38'),
(473, 16, 550000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3534700, '2020-09-10', 'normal', 0, 1, '2021-10-05 09:51:07', '2021-10-06 09:03:07'),
(474, 16, 3700000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 384700, '2020-10-10', 'normal', 0, 1, '2021-10-05 09:52:00', '2021-10-06 09:02:49'),
(475, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4084700, '2020-11-10', 'normal', 0, 1, '2021-10-05 09:55:06', '2021-10-06 09:01:44'),
(476, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4084700, '2020-12-10', 'normal', 0, 1, '2021-10-05 09:56:00', '2021-10-06 09:01:34'),
(477, 16, 0, 30293, 0, 0, 0, 0, 0, 0, 0, 0, 4084700, '2021-01-31', 'normal', 0, 1, '2021-10-05 09:57:10', '2021-10-06 09:01:10'),
(478, 16, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3084700, '2021-02-10', 'normal', 0, 1, '2021-10-05 09:58:03', '2021-10-06 09:00:51'),
(479, 16, 0, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 4084700, '2021-03-10', 'normal', 0, 1, '2021-10-05 09:58:41', '2021-10-06 10:12:33'),
(480, 16, 4350000, 563268, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-30', 'normal', 0, 1, '2021-10-05 10:00:59', '2021-10-06 08:55:43'),
(481, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4084700, '2021-05-10', 'normal', 0, 1, '2021-10-05 10:01:40', '2021-10-06 08:55:19'),
(482, 16, 900000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3184700, '2021-07-06', 'normal', 0, 1, '2021-10-05 10:02:25', '2021-10-06 08:55:02'),
(483, 16, 2100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1984700, '2021-07-10', 'normal', 0, 1, '2021-10-05 10:03:12', '2021-10-06 08:54:30'),
(484, 16, 1900000, 390977, 0, 0, 0, 0, 0, 0, 150000, 0, 2334700, '2021-08-31', 'normal', 0, 1, '2021-10-05 10:05:04', '2021-10-06 08:53:53'),
(485, 16, 1100000, 247123, 0, 0, 200000, 0, 0, 0, 0, 0, 3184700, '2021-09-30', 'normal', 0, 1, '2021-10-05 10:06:13', '2021-10-06 08:53:23'),
(486, 17, 2300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4059700, '2020-07-10', 'normal', 0, 1, '2021-10-05 10:14:30', '2021-10-06 09:14:45'),
(487, 17, 3550000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 809700, '2020-08-10', 'normal', 0, 1, '2021-10-05 10:15:43', '2021-10-06 09:14:32'),
(488, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4059700, '2020-09-10', 'normal', 0, 1, '2021-10-05 10:16:19', '2021-10-06 09:14:13'),
(489, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4059700, '2020-10-10', 'normal', 0, 1, '2021-10-05 10:17:13', '2021-10-06 09:13:58'),
(490, 17, 16400000, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 0, '2020-11-10', 'normal', 0, 1, '2021-10-05 10:18:09', '2021-10-06 09:13:41'),
(491, 17, 70000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4289700, '2020-12-10', 'normal', 0, 1, '2021-10-05 10:20:00', '2021-10-06 09:13:23'),
(532, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-09-10', 'normal', 0, 1, '2021-10-06 10:50:10', '2021-10-06 10:52:21'),
(493, 17, 13950000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-02-10', 'normal', 0, 1, '2021-10-05 10:21:44', '2021-10-06 09:11:28'),
(494, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 150000, 0, 4209700, '2021-03-10', 'normal', 0, 1, '2021-10-05 10:22:37', '2021-10-06 09:11:10'),
(495, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4059700, '2021-01-10', 'normal', 0, 1, '2021-10-05 10:23:38', '2021-10-06 09:12:14'),
(496, 17, 15073500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-10', 'normal', 0, 1, '2021-10-05 10:24:47', '2021-10-06 09:10:24'),
(497, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4059700, '2021-06-10', 'normal', 0, 1, '2021-10-05 10:25:29', '2021-10-06 09:10:04'),
(498, 17, 450000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3909700, '2021-07-10', 'normal', 0, 1, '2021-10-05 10:26:30', '2021-10-06 09:09:50'),
(499, 17, 26693850, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-08-10', 'normal', 0, 1, '2021-10-05 10:27:32', '2021-10-06 09:09:26'),
(500, 17, 300000, 0, 0, 0, 1100000, 0, 0, 0, 0, 0, 5159700, '2021-09-10', 'normal', 0, 1, '2021-10-05 10:28:37', '2021-10-06 09:09:03'),
(501, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3975000, '2020-07-10', 'normal', 0, 1, '2021-10-05 10:29:28', '2021-10-06 10:30:34'),
(502, 18, 900000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3075000, '2020-08-10', 'normal', 0, 1, '2021-10-05 10:31:17', '2021-10-06 10:30:09'),
(503, 18, 300000, 955041, 0, 0, 0, 0, 0, 0, 0, 0, 3675000, '2020-10-30', 'normal', 0, 1, '2021-10-05 10:32:59', '2021-10-06 10:39:07'),
(504, 18, 7721978, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 0, '2020-11-10', 'normal', 0, 1, '2021-10-05 10:35:31', '2021-10-06 10:23:22'),
(505, 18, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 3975000, '2020-12-31', 'normal', 0, 1, '2021-10-05 10:58:37', '2021-10-06 10:22:44'),
(506, 18, 945000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 3030000, '2021-01-10', 'normal', 0, 1, '2021-10-05 11:01:00', '2021-10-06 10:38:30'),
(507, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3975000, '2021-02-10', 'normal', 0, 1, '2021-10-05 11:01:38', '2021-10-06 10:17:38'),
(508, 18, 345000, 45000, 0, 0, 0, 0, 0, 0, 150000, 0, 3780000, '2021-03-31', 'normal', 0, 1, '2021-10-05 11:02:44', '2021-10-06 10:17:10'),
(510, 18, 20300000, 0, 50000, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-10', 'normal', 0, 1, '2021-10-05 11:06:53', '2021-10-06 10:16:28'),
(511, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3675000, '2021-05-10', 'normal', 0, 1, '2021-10-05 11:07:42', '2021-10-06 10:15:57'),
(512, 18, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 3975000, '2021-06-30', 'normal', 0, 1, '2021-10-05 11:08:28', '2021-10-06 10:15:14'),
(513, 18, 645000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3330000, '2021-07-10', 'normal', 0, 1, '2021-10-05 11:09:12', '2021-10-06 10:14:59'),
(514, 18, 21137250, 0, 0, 0, 0, 0, 0, 0, 400000, 0, 0, '2021-08-10', 'normal', 0, 1, '2021-10-05 11:10:21', '2021-10-06 10:14:38'),
(515, 18, 0, 45000, 0, 0, 1000000, 0, 0, 0, 0, 0, 4975000, '2021-09-30', 'normal', 0, 1, '2021-10-05 11:12:23', '2021-10-06 10:13:57'),
(517, 19, 1100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3119700, '2020-08-10', 'normal', 0, 1, '2021-10-05 11:22:08', '2021-10-06 11:03:15'),
(518, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3919700, '2020-09-10', 'normal', 0, 1, '2021-10-05 11:26:56', '2021-10-06 11:02:47'),
(519, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3919700, '2020-10-10', 'normal', 0, 1, '2021-10-05 11:27:50', '2021-10-06 11:02:29'),
(520, 19, 400000, 0, 0, 0, 0, 0, 0, 0, 0, 100000, 3919700, '2020-11-10', 'normal', 0, 1, '2021-10-05 11:28:49', '2021-10-06 11:02:11'),
(521, 19, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 4219700, '2020-12-31', 'normal', 0, 1, '2021-10-05 11:31:20', '2021-10-06 11:01:57'),
(522, 19, 945000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3274700, '2021-01-10', 'normal', 0, 1, '2021-10-05 11:32:39', '2021-10-06 11:01:37'),
(523, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4219700, '2021-02-10', 'normal', 0, 1, '2021-10-05 11:33:10', '2021-10-06 11:53:40'),
(524, 19, 345000, 45000, 0, 0, 0, 0, 0, 0, 150000, 0, 4024700, '2021-03-31', 'normal', 0, 1, '2021-10-05 11:34:05', '2021-10-06 11:00:35'),
(525, 19, 300000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 4019700, '2021-04-10', 'normal', 0, 1, '2021-10-05 11:35:04', '2021-10-06 10:59:44'),
(526, 19, 11876250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-10', 'normal', 0, 1, '2021-10-05 11:36:04', '2021-10-06 10:59:19'),
(527, 19, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 4219700, '2021-06-30', 'normal', 0, 1, '2021-10-05 11:37:01', '2021-10-06 10:58:52'),
(528, 19, 24585000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-07-10', 'normal', 0, 1, '2021-10-05 11:37:52', '2021-10-06 10:58:36'),
(529, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 400000, 0, 4319700, '2021-08-10', 'normal', 0, 1, '2021-10-05 11:38:46', '2021-10-06 10:58:00'),
(530, 19, 0, 45000, 0, 0, 1000000, 0, 0, 0, 0, 0, 5219700, '2021-09-30', 'normal', 0, 1, '2021-10-05 11:39:38', '2021-10-06 10:57:46'),
(533, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-05-28', 'arrears', 0, 1, '2021-10-08 13:17:59', '2021-10-08 13:17:59'),
(536, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-06-14', 'arrears', 0, 1, '2021-10-09 08:23:28', '2021-10-09 08:23:28'),
(537, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-08-07', 'arrears', 0, 1, '2021-10-09 13:34:43', '2021-10-09 13:34:43'),
(538, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-12-23', 'arrears', 0, 1, '2021-10-09 13:39:06', '2021-10-09 13:39:06'),
(539, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-04-29', 'arrears', 0, 1, '2021-10-09 13:41:13', '2021-10-09 13:41:13'),
(540, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-18', 'arrears', 0, 1, '2021-10-09 13:56:27', '2021-10-09 13:56:27'),
(541, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-03-12', 'arrears', 0, 1, '2021-10-09 13:58:19', '2021-10-09 13:58:19'),
(542, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-01-13', 'arrears', 0, 1, '2021-10-09 14:01:23', '2021-10-09 14:01:23'),
(543, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-18', 'arrears', 0, 1, '2021-10-09 14:14:29', '2021-10-09 14:14:29'),
(544, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-18', 'arrears', 0, 1, '2021-10-09 14:21:37', '2021-10-09 14:21:37'),
(545, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-07-08', 'arrears', 0, 1, '2021-10-09 14:52:14', '2021-10-09 14:52:14'),
(546, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-10-13', 'arrears', 0, 1, '2021-10-09 14:54:54', '2021-10-09 14:54:54'),
(547, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-03', 'arrears', 0, 1, '2021-10-09 15:32:13', '2021-10-09 15:32:13'),
(548, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-01-20', 'arrears', 0, 1, '2021-10-09 15:34:09', '2021-10-09 15:34:09'),
(549, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-18', 'arrears', 0, 1, '2021-10-09 15:35:34', '2021-10-09 15:35:34'),
(550, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-02-17', 'arrears', 0, 1, '2021-10-09 15:43:47', '2021-10-09 15:43:47'),
(551, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-21', 'arrears', 0, 1, '2021-10-09 15:46:23', '2021-10-09 15:46:23'),
(552, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-11-17', 'arrears', 0, 1, '2021-10-09 15:52:25', '2021-10-09 15:52:25'),
(553, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-02-15', 'arrears', 0, 1, '2021-10-09 15:53:32', '2021-10-09 15:53:32'),
(554, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-09-28', 'arrears', 0, 1, '2021-10-09 16:11:27', '2021-10-09 16:11:27'),
(555, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-31', 'arrears', 0, 1, '2021-10-09 16:14:29', '2021-10-09 16:14:29'),
(556, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-07-02', 'arrears', 0, 1, '2021-10-09 16:15:59', '2021-10-09 16:15:59'),
(557, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-06-02', 'arrears', 0, 1, '2021-10-11 06:35:57', '2021-10-11 06:35:57'),
(558, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2020-09-16', 'arrears', 0, 1, '2021-10-11 06:44:39', '2021-10-11 06:44:39'),
(559, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-02-10', 'arrears', 0, 1, '2021-10-11 06:47:44', '2021-10-11 06:47:44'),
(560, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-05-18', 'arrears', 0, 1, '2021-10-11 06:51:14', '2021-10-11 06:51:14'),
(561, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-06-02', 'arrears', 0, 1, '2021-10-11 06:55:15', '2021-10-11 06:55:15'),
(562, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-07-27', 'arrears', 0, 1, '2021-10-11 07:42:10', '2021-10-11 07:42:10'),
(563, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-08-16', 'arrears', 0, 1, '2021-10-11 15:17:12', '2021-10-11 15:17:12'),
(564, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-08-18', 'arrears', 0, 1, '2021-10-11 18:01:19', '2021-10-11 18:01:19'),
(565, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-08-20', 'arrears', 0, 1, '2021-10-11 19:12:55', '2021-10-11 19:12:55'),
(567, 9, 9640000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-10-07', 'normal', 0, 1, '2021-10-13 07:58:37', '2021-10-13 08:00:24'),
(569, 16, 450000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-09-27', 'normal', 0, 1, '2021-11-04 13:01:52', '2021-11-04 13:02:27'),
(570, 10, 300000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 0, '2021-10-08', 'normal', 0, 1, '2021-11-04 13:13:19', '2021-11-04 13:14:10'),
(571, 11, 600000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 0, '2021-10-08', 'normal', 0, 1, '2021-11-04 13:16:08', '2021-11-04 13:17:25'),
(572, 12, 300000, 0, 50000, 0, 0, 0, 0, 0, 0, 0, 0, '2021-10-03', 'normal', 0, 1, '2021-11-04 13:18:59', '2021-11-04 13:32:36'),
(573, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-10-08', 'normal', 0, 1, '2021-11-04 13:20:42', '2021-11-04 13:30:31'),
(574, 15, 16000000, 2059946, 50000, 0, 0, 0, 0, 0, 0, 0, 0, '2021-10-13', 'normal', 0, 1, '2021-11-04 13:22:46', '2021-11-04 13:28:41'),
(575, 16, 1500000, 36692, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-10-05', 'normal', 0, 1, '2021-11-04 13:24:20', '2021-11-04 13:32:40'),
(576, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-10-08', 'normal', 0, 1, '2021-11-04 13:24:52', '2021-11-04 13:30:41'),
(577, 18, 645000, 0, 50000, 0, 0, 0, 0, 0, 0, 0, 0, '2021-10-08', 'normal', 0, 1, '2021-11-04 13:26:14', '2021-11-04 13:32:23'),
(578, 19, 645000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-10-08', 'normal', 0, 1, '2021-11-04 13:26:38', '2021-11-04 13:32:28'),
(579, 13, 5788125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-01', 'normal', 0, 1, '2021-11-04 13:57:24', '2021-11-04 14:04:59'),
(580, 19, 27783000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-02', 'normal', 0, 1, '2021-11-04 13:58:27', '2021-11-04 14:04:41'),
(581, 12, 350000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-02', 'normal', 0, 1, '2021-11-04 13:59:11', '2021-11-04 14:04:52'),
(582, 10, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-06', 'normal', 0, 1, '2021-11-06 08:31:59', '2021-11-06 08:34:21'),
(583, 17, 1400000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-06', 'normal', 0, 1, '2021-11-06 08:32:30', '2021-11-06 08:34:29'),
(584, 15, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-09', 'normal', 0, 1, '2021-11-10 14:15:51', '2021-11-10 14:18:31'),
(585, 18, 2200000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-10', 'normal', 0, 1, '2021-11-10 14:16:25', '2021-11-10 14:18:08'),
(586, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-10', 'normal', 0, 1, '2021-11-10 14:17:04', '2021-11-10 14:18:15'),
(587, 19, 2000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-10', 'normal', 0, 1, '2021-11-10 14:17:36', '2021-11-10 14:18:26'),
(588, 9, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-11', 'normal', 0, 1, '2021-11-11 06:32:38', '2021-11-11 06:34:00'),
(589, 16, 0, 87368, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-11', 'normal', 0, 1, '2021-11-11 06:33:26', '2021-11-11 06:34:09'),
(590, 12, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-11', 'normal', 0, 1, '2021-11-11 08:50:05', '2021-11-11 09:01:26'),
(591, 17, 8477575, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-25', 'normal', 0, 1, '2021-11-25 09:41:48', '2021-11-25 09:43:12'),
(592, 17, 20300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-02', 'normal', 0, 1, '2021-12-02 12:37:35', '2021-12-02 12:40:31'),
(593, 16, 1319815, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1319815, '2021-12-02', 'arrears', 0, 1, '2021-12-02 15:56:56', '2021-12-02 15:56:56'),
(594, 11, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-09', 'normal', 0, 1, '2021-12-11 12:26:13', '2021-12-11 12:31:08'),
(595, 11, 363000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-10', 'normal', 0, 1, '2021-12-11 12:27:22', '2021-12-11 12:31:00'),
(596, 11, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-11-08', 'normal', 0, 1, '2021-12-11 12:41:50', '2021-12-11 12:43:23'),
(597, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-09', 'normal', 0, 1, '2021-12-11 12:47:22', '2021-12-11 12:51:09'),
(598, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-10', 'normal', 0, 1, '2021-12-11 12:48:12', '2021-12-11 12:50:41'),
(599, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-10', 'normal', 0, 1, '2021-12-11 12:48:44', '2021-12-11 12:51:00'),
(600, 9, 0, 180795, 0, 0, 0, 0, 0, 0, 0, 0, 1205300, '2021-12-24', 'normal', 0, 1, '2021-12-24 17:18:02', '2021-12-24 17:28:31'),
(601, 10, 600000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-12-13', 'normal', 0, 1, '2021-12-24 17:19:11', '2021-12-24 17:28:56'),
(602, 13, 1350000, 202631, 0, 0, 0, 0, 0, 0, 0, 0, 875, '2021-12-24', 'normal', 0, 1, '2021-12-24 17:24:13', '2021-12-24 17:28:41'),
(603, 15, 0, 21438, 0, 0, 0, 0, 0, 0, 0, 0, 142918, '2021-12-24', 'normal', 0, 1, '2021-12-24 17:25:18', '2021-12-24 17:29:09'),
(604, 18, 0, 4162010, 0, 0, 0, 0, 0, 0, 0, 0, 27746735, '2021-12-24', 'normal', 0, 1, '2021-12-24 17:26:28', '2021-12-24 17:29:02'),
(605, 11, 0, 95, 0, 0, 0, 0, 0, 0, 0, 0, 636, '2021-12-24', 'normal', 0, 1, '2021-12-24 17:36:14', '2021-12-24 17:37:17'),
(606, 18, 32210000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-01-07', 'normal', 0, 1, '2022-01-07 10:25:26', '2022-01-07 10:26:08'),
(607, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-01-07', 'arrears', 0, 1, '2022-01-07 16:10:26', '2022-01-07 16:10:26'),
(608, 12, 300000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 0, '2022-01-09', 'normal', 0, 1, '2022-01-28 19:26:31', '2022-01-31 05:18:33'),
(609, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-01-07', 'normal', 0, 1, '2022-01-28 19:30:43', '2022-01-29 10:15:00'),
(610, 11, 303000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 731, '2022-01-10', 'normal', 0, 1, '2022-01-28 19:31:16', '2022-01-29 10:05:29'),
(611, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-01-10', 'normal', 0, 1, '2022-01-28 19:32:15', '2022-01-29 10:08:10'),
(612, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-01-10', 'normal', 0, 1, '2022-01-28 19:32:47', '2022-01-29 10:09:28'),
(613, 13, 510000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-01-10', 'normal', 0, 1, '2022-01-28 19:34:40', '2022-01-29 10:11:58'),
(614, 10, 300000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 16170963, '2022-01-10', 'normal', 0, 1, '2022-01-28 19:35:14', '2022-01-31 05:17:43'),
(617, 15, 0, 1861362, 50000, 0, 0, 0, 0, 0, 0, 0, 12459081, '2022-01-11', 'normal', 0, 2, '2022-01-30 08:32:28', '2022-01-31 05:22:10'),
(616, 16, 0, 45000, 0, 100000, 0, 0, 0, 0, 0, 0, 400000, '2022-01-30', 'normal', 0, 1, '2022-01-30 07:58:51', '2022-01-31 05:17:11'),
(618, 12, 1214012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-01-27', 'normal', 0, 1, '2022-02-01 19:30:01', '2022-02-02 09:15:22'),
(619, 12, 9000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-02-01', 'normal', 0, 1, '2022-02-01 19:31:13', '2022-02-02 09:15:10'),
(621, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16470963, '2022-01-11', 'normal', 0, 2, '2022-02-01 19:47:00', '2022-02-07 17:04:48'),
(622, 10, 0, 2410644, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-01-11', 'normal', 0, 1, '2022-02-07 17:03:07', '2022-02-07 17:09:01'),
(623, 15, 0, 159653, 50000, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-01-11', 'normal', 0, 1, '2022-02-07 17:18:54', '2022-02-07 17:20:42'),
(624, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-02-09', 'normal', 0, 1, '2022-02-10 06:04:00', '2022-02-10 07:43:00'),
(625, 13, 16500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1273644, '2022-02-09', 'normal', 0, 1, '2022-02-10 06:05:02', '2022-02-10 07:43:41'),
(626, 16, 690000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55000, '2022-02-09', 'normal', 0, 1, '2022-02-10 06:07:28', '2022-02-10 07:44:00'),
(627, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-02-08', 'normal', 0, 1, '2022-02-10 06:08:14', '2022-02-10 07:44:06'),
(628, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-02-01', 'normal', 0, 1, '2022-02-10 06:15:13', '2022-02-10 07:43:53'),
(629, 13, 1280000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-02-10', 'normal', 0, 1, '2022-02-10 15:56:21', '2022-02-10 15:59:36'),
(630, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-02-10', 'normal', 0, 1, '2022-02-10 17:09:52', '2022-02-10 17:15:41'),
(631, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-02-10', 'normal', 0, 1, '2022-02-10 17:10:29', '2022-02-10 17:15:50'),
(632, 15, 0, 1937810, 0, 0, 0, 0, 0, 0, 0, 0, 12918734, '2022-02-11', 'normal', 0, 1, '2022-02-14 17:19:15', '2022-02-14 17:38:37'),
(633, 16, 0, 8250, 0, 0, 0, 0, 0, 0, 0, 0, 55000, '2022-02-11', 'normal', 0, 1, '2022-02-14 17:20:06', '2022-02-14 17:39:14'),
(634, 10, 0, 2832241, 0, 0, 0, 0, 0, 0, 0, 0, 18881607, '2022-02-11', 'normal', 0, 1, '2022-02-14 17:21:04', '2022-02-14 17:37:22'),
(635, 11, 0, 177, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '2022-02-11', 'normal', 0, 1, '2022-02-21 13:17:40', '2022-02-21 13:19:56'),
(636, 19, 23152500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-02-23', 'normal', 0, 1, '2022-02-23 10:57:11', '2022-02-23 11:04:23'),
(637, 12, 5369500, 3007500, 0, 0, 0, 0, 0, 0, 0, 0, 14680501, '2022-02-24', 'normal', 0, 2, '2022-02-24 06:18:54', '2022-02-24 13:21:52'),
(638, 11, 310000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-10', 'normal', 0, 1, '2022-03-10 14:33:25', '2022-03-10 16:34:34'),
(639, 12, 20369500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-10', 'normal', 0, 1, '2022-03-10 16:19:39', '2022-03-10 16:47:00'),
(640, 16, 910000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8714250, '2022-02-26', 'normal', 0, 1, '2022-03-10 16:24:58', '2022-03-10 16:36:18'),
(641, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-09', 'normal', 0, 1, '2022-03-10 16:25:53', '2022-03-10 16:34:46'),
(642, 29, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14100000, '2022-03-10', 'normal', 0, 2, '2022-03-10 16:26:57', '2022-03-10 16:34:18'),
(643, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-10', 'normal', 0, 1, '2022-03-10 16:58:50', '2022-03-10 17:06:00'),
(644, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-10', 'normal', 0, 1, '2022-03-10 17:00:28', '2022-03-10 17:06:07'),
(645, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-10', 'normal', 0, 1, '2022-03-10 17:06:35', '2022-03-10 17:11:08'),
(646, 10, 22013848, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-10', 'normal', 0, 1, '2022-03-10 17:38:19', '2022-03-10 17:40:44'),
(647, 15, 0, 2273482, 0, 0, 0, 0, 0, 0, 0, 0, 15156544, '2022-03-11', 'normal', 0, 1, '2022-03-11 13:49:22', '2022-03-11 14:24:53'),
(648, 16, 0, 1307138, 0, 0, 0, 0, 0, 0, 0, 0, 8714250, '2022-03-11', 'normal', 0, 1, '2022-03-11 13:50:04', '2022-03-11 14:24:59'),
(649, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-30', 'normal', 0, 1, '2022-03-31 09:05:13', '2022-03-31 11:40:52'),
(650, 17, 31671638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-03-31', 'normal', 0, 1, '2022-03-31 11:24:45', '2022-03-31 11:39:32'),
(651, 18, 23268000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-04-09', 'normal', 0, 1, '2022-04-09 17:43:58', '2022-04-09 18:13:55'),
(652, 16, 930000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9391388, '2022-04-07', 'normal', 0, 1, '2022-04-10 20:36:43', '2022-04-10 20:46:40'),
(653, 11, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-04-09', 'normal', 0, 1, '2022-04-10 20:38:25', '2022-04-10 20:45:58'),
(654, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-04-09', 'normal', 0, 1, '2022-04-10 20:40:01', '2022-04-10 20:46:25'),
(655, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-04-10', 'normal', 0, 1, '2022-04-10 21:37:28', '2022-04-10 21:43:11'),
(656, 15, 0, 2659504, 0, 0, 0, 0, 0, 0, 0, 0, 17730026, '2022-04-11', 'normal', 0, 1, '2022-04-10 21:38:29', '2022-04-10 21:42:46'),
(657, 10, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 300000, '2022-04-11', 'normal', 0, 1, '2022-04-10 21:39:06', '2022-04-10 21:42:58'),
(658, 16, 0, 1408708, 0, 0, 0, 0, 0, 0, 0, 0, 9391388, '2022-04-11', 'normal', 0, 1, '2022-04-10 21:40:27', '2022-04-10 21:44:13'),
(659, 12, 2100000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 0, '2022-04-25', 'normal', 0, 1, '2022-04-25 09:14:22', '2022-05-02 17:14:45'),
(660, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-05-09', 'normal', 0, 1, '2022-05-09 12:10:20', '2022-05-09 16:03:42'),
(661, 18, 299008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 299008, '2022-05-10', 'arrears', 0, 1, '2022-05-10 03:27:53', '2022-05-10 03:27:53'),
(662, 16, 1720000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 9480096, '2022-05-09', 'normal', 0, 1, '2022-05-10 03:29:25', '2022-05-10 06:55:36'),
(663, 12, 390000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-05-10', 'normal', 0, 1, '2022-05-10 03:36:13', '2022-05-10 06:55:23'),
(664, 11, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-05-10', 'normal', 0, 1, '2022-05-10 11:14:17', '2022-05-10 16:18:49'),
(665, 16, 1400000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8080096, '2022-05-10', 'normal', 0, 1, '2022-05-10 16:16:59', '2022-05-10 16:18:35'),
(666, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-05-10', 'normal', 0, 1, '2022-05-10 16:24:08', '2022-05-10 16:31:41'),
(667, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-05-10', 'normal', 0, 1, '2022-05-10 16:24:41', '2022-05-10 16:31:12'),
(668, 18, 100000, 0, 50000, 0, 0, 0, 0, 0, 0, 0, 0, '2022-05-10', 'normal', 0, 1, '2022-05-10 16:26:05', '2022-05-10 16:31:06'),
(669, 10, 645000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-05-10', 'normal', 0, 1, '2022-05-10 16:36:11', '2022-05-10 16:38:26'),
(670, 16, 0, 1212014, 0, 0, 0, 0, 0, 0, 0, 0, 8080096, '2022-05-11', 'normal', 0, 1, '2022-05-10 23:32:01', '2022-05-11 12:06:28'),
(671, 15, 0, 3103430, 0, 0, 0, 0, 0, 0, 0, 0, 20689530, '2022-05-11', 'normal', 0, 1, '2022-05-10 23:34:07', '2022-05-11 12:05:49'),
(672, 11, 23100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-06-02', 'normal', 0, 1, '2022-06-02 08:25:39', '2022-06-02 10:11:55'),
(673, 13, 10000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7773782, '2022-05-31', 'normal', 0, 1, '2022-06-02 10:33:14', '2022-06-02 10:36:05'),
(674, 19, 26625375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 249700, '2022-06-02', 'normal', 0, 1, '2022-06-02 10:34:00', '2022-06-02 10:36:21'),
(675, 11, 69971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69971, '2022-06-03', 'arrears', 0, 1, '2022-06-03 09:51:08', '2022-06-03 09:51:08'),
(676, 12, 5980000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-06-04', 'normal', 0, 1, '2022-06-06 03:58:26', '2022-06-07 09:55:40'),
(677, 15, 24500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-06-07', 'normal', 0, 1, '2022-06-07 10:10:29', '2022-06-07 10:11:36'),
(678, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-06-07', 'normal', 0, 1, '2022-06-07 10:11:05', '2022-06-07 10:11:51'),
(679, 13, 8080000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-06-10', 'normal', 0, 1, '2022-06-10 19:15:37', '2022-06-10 19:56:15'),
(680, 16, 10000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-06-10', 'normal', 0, 1, '2022-06-10 19:16:26', '2022-06-10 19:56:23'),
(681, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-06-10', 'normal', 0, 1, '2022-06-10 19:17:31', '2022-06-10 19:56:31'),
(682, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-06-10', 'normal', 0, 1, '2022-06-10 19:19:53', '2022-06-10 19:56:44'),
(683, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-06-10', 'normal', 0, 1, '2022-06-11 13:41:42', '2022-06-11 14:46:41'),
(684, 11, 2500000, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-07-11', 'normal', 0, 1, '2022-07-11 19:47:18', '2022-07-12 15:35:14'),
(685, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-07-08', 'normal', 0, 1, '2022-07-11 19:48:24', '2022-07-12 15:40:58'),
(686, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-07-10', 'normal', 0, 1, '2022-07-11 19:49:19', '2022-07-12 15:36:56'),
(687, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-07-08', 'normal', 0, 1, '2022-07-11 19:50:28', '2022-07-12 15:42:02'),
(688, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-06-24', 'normal', 0, 1, '2022-07-11 19:51:52', '2022-07-12 15:48:38'),
(689, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-07-11', 'normal', 0, 1, '2022-07-11 19:54:14', '2022-07-12 15:36:29'),
(690, 18, 0, 37500, 0, 0, 0, 0, 0, 0, 0, 0, 250000, '2022-07-11', 'normal', 0, 1, '2022-07-11 19:54:54', '2022-07-12 15:34:51'),
(691, 19, 0, 37455, 0, 0, 0, 0, 0, 0, 0, 0, 249700, '2022-07-11', 'normal', 0, 1, '2022-07-11 19:55:33', '2022-07-12 15:34:16'),
(692, 10, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 300000, '2022-07-11', 'normal', 0, 1, '2022-07-11 20:03:05', '2022-07-12 15:37:18'),
(693, 10, 645000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-08', 'normal', 0, 1, '2022-08-08 17:09:28', '2022-08-08 17:11:21'),
(694, 12, 650000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-08', 'normal', 0, 2, '2022-08-08 17:10:17', '2022-08-08 17:11:40'),
(695, 12, 650000, 0, 0, 0, 500000, 0, 0, 0, 0, 0, 31501, '2022-08-08', 'normal', 0, 1, '2022-08-08 17:14:22', '2022-08-08 17:31:35'),
(696, 11, 0, 0, 0, 0, 2000000, 0, 0, 0, 0, 0, 148450, '2022-08-08', 'normal', 0, 1, '2022-08-08 17:18:55', '2022-08-08 17:39:16'),
(697, 13, 0, 0, 0, 0, 1000000, 0, 0, 0, 0, 0, 993782, '2022-08-08', 'normal', 0, 1, '2022-08-08 17:19:47', '2022-08-08 17:39:52'),
(698, 15, 0, 0, 0, 0, 500000, 0, 0, 0, 0, 0, 692960, '2022-08-08', 'normal', 0, 1, '2022-08-08 17:21:07', '2022-08-08 17:40:09'),
(699, 16, 320000, 0, 0, 0, 200000, 0, 0, 0, 0, 0, 0, '2022-07-26', 'normal', 0, 1, '2022-08-08 17:25:11', '2022-08-08 17:40:44'),
(700, 17, 300000, 0, 0, 0, 5000000, 0, 0, 0, 0, 0, 4933400, '2022-08-08', 'normal', 0, 1, '2022-08-08 17:27:25', '2022-08-08 17:40:25'),
(701, 18, 0, 0, 0, 0, 2000000, 0, 0, 0, 0, 0, 2587500, '2022-08-08', 'normal', 0, 1, '2022-08-08 17:28:09', '2022-08-08 17:40:56'),
(702, 19, 0, 0, 0, 0, 2000000, 0, 0, 0, 0, 0, 2587155, '2022-08-08', 'normal', 0, 1, '2022-08-08 17:28:40', '2022-08-08 17:41:14'),
(703, 17, 5000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-09', 'normal', 0, 1, '2022-08-09 08:56:21', '2022-08-09 08:57:19'),
(704, 19, 2587155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-10', 'normal', 0, 1, '2022-08-10 10:32:57', '2022-08-10 10:38:39'),
(705, 18, 20414925, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-10', 'normal', 0, 1, '2022-08-10 10:35:10', '2022-08-10 10:39:26'),
(706, 11, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-10', 'normal', 0, 1, '2022-08-10 10:36:54', '2022-08-10 10:38:52'),
(707, 13, 1300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-10', 'normal', 0, 1, '2022-08-10 13:51:16', '2022-08-10 13:56:08'),
(708, 15, 800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-10', 'normal', 0, 1, '2022-08-10 18:10:15', '2022-08-10 18:11:37'),
(709, 12, 0, 4725, 0, 0, 0, 0, 0, 0, 0, 0, 31501, '2022-08-11', 'normal', 0, 1, '2022-08-11 17:23:02', '2022-08-11 17:25:29'),
(710, 17, 33100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-17', 'normal', 0, 1, '2022-08-17 06:28:55', '2022-08-17 06:30:23'),
(711, 16, 310000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-08-24', 'normal', 0, 1, '2022-09-03 07:35:21', '2022-09-03 07:50:04'),
(712, 11, 25664546, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-09-02', 'normal', 0, 1, '2022-09-03 07:38:36', '2022-09-03 07:49:30'),
(713, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-09-06', 'normal', 0, 1, '2022-09-06 11:35:31', '2022-09-06 11:42:16'),
(714, 12, 340000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-09-09', 'normal', 0, 1, '2022-09-10 07:24:42', '2022-09-10 07:38:56'),
(715, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-09-10', 'normal', 0, 1, '2022-09-10 10:32:44', '2022-09-10 11:10:05'),
(716, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-09-10', 'normal', 0, 1, '2022-09-10 10:36:35', '2022-09-10 11:10:14'),
(717, 15, 0, 4370038, 0, 0, 0, 0, 0, 0, 0, 0, 29133585, '2022-09-12', 'normal', 0, 1, '2022-09-12 09:37:18', '2022-09-12 09:39:52'),
(718, 10, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 300000, '2022-09-12', 'normal', 0, 1, '2022-09-12 09:38:56', '2022-09-12 09:58:32'),
(719, 19, 35145663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-10-07', 'normal', 0, 1, '2022-10-08 09:58:25', '2022-10-08 10:00:20'),
(720, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-10-08', 'normal', 0, 1, '2022-10-08 10:26:01', '2022-10-08 10:54:07'),
(721, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-10-08', 'normal', 0, 1, '2022-10-08 10:26:20', '2022-10-08 10:27:14'),
(722, 16, 1800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-10-08', 'normal', 0, 1, '2022-10-08 10:26:46', '2022-10-08 10:27:16'),
(723, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-10-09', 'normal', 0, 1, '2022-10-10 08:22:43', '2022-10-10 09:20:55'),
(724, 10, 650000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-10-09', 'normal', 0, 1, '2022-10-10 09:44:21', '2022-10-10 09:45:14'),
(725, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-10-09', 'normal', 0, 1, '2022-10-10 13:43:23', '2022-10-10 13:48:19'),
(726, 18, 0, 45173, 0, 0, 0, 0, 0, 0, 0, 0, 301150, '2022-10-10', 'normal', 0, 1, '2022-10-10 19:43:45', '2022-10-10 20:53:38'),
(727, 18, 0, 5278625, 0, 0, 0, 0, 0, 0, 0, 0, 33531573, '2022-10-11', 'normal', 0, 2, '2022-10-16 14:39:27', '2022-10-31 13:50:43'),
(728, 16, 1720000, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 0, '2022-11-08', 'normal', 0, 1, '2022-11-08 15:20:47', '2022-11-08 15:21:11'),
(729, 11, 0, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 358800, '2022-11-08', 'normal', 0, 1, '2022-11-08 15:29:26', '2022-11-08 15:31:18'),
(730, 12, 0, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 396226, '2022-11-08', 'normal', 0, 1, '2022-11-08 15:30:00', '2022-11-08 15:34:27'),
(731, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-11-09', 'normal', 0, 1, '2022-11-09 12:08:11', '2022-11-09 12:21:57'),
(732, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-11-09', 'normal', 0, 1, '2022-11-09 12:08:40', '2022-11-09 12:22:04'),
(733, 12, 400000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-11-09', 'normal', 0, 1, '2022-11-10 07:00:58', '2022-11-10 07:03:32'),
(734, 10, 15797950, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4871250, '2022-11-09', 'normal', 0, 1, '2022-11-10 18:26:48', '2022-11-10 18:28:00'),
(735, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58800, '2022-11-09', 'normal', 0, 1, '2022-11-10 18:27:36', '2022-11-10 18:28:13'),
(736, 18, 33832000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-11-09', 'normal', 0, 1, '2022-11-10 18:28:42', '2022-11-10 18:29:15'),
(737, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-11-09', 'normal', 0, 1, '2022-11-10 18:29:13', '2022-11-10 18:29:29'),
(738, 10, 0, 730688, 0, 0, 0, 0, 0, 0, 0, 0, 4871250, '2022-11-11', 'normal', 0, 1, '2022-11-12 06:14:24', '2022-11-12 11:07:50'),
(739, 11, 0, 8820, 0, 0, 0, 0, 0, 0, 0, 0, 58800, '2022-11-11', 'normal', 0, 1, '2022-11-12 06:14:49', '2022-11-12 11:08:07'),
(740, 17, 37228238, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-12-01', 'normal', 0, 1, '2022-12-02 13:28:25', '2022-12-02 18:35:32'),
(741, 13, 8039550, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-12-01', 'normal', 0, 1, '2022-12-02 13:29:43', '2022-12-02 18:35:58'),
(742, 16, 100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-12-05', 'normal', 0, 1, '2022-12-05 20:47:32', '2022-12-06 12:14:06'),
(743, 12, 310000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-12-08', 'normal', 0, 1, '2022-12-08 11:45:30', '2022-12-08 11:46:45'),
(744, 10, 5990000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-12-08', 'normal', 0, 1, '2022-12-08 17:32:15', '2022-12-08 17:48:29'),
(745, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-12-09', 'normal', 0, 1, '2022-12-10 21:11:05', '2022-12-10 22:02:45'),
(746, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2022-12-09', 'normal', 0, 1, '2022-12-10 21:11:57', '2022-12-10 22:03:40'),
(747, 11, 0, 3719026, 0, 0, 0, 0, 0, 0, 0, 0, 24793508, '2022-12-10', 'normal', 0, 2, '2022-12-11 11:50:22', '2022-12-11 12:51:37'),
(748, 11, 0, 3719026, 0, 0, 0, 0, 0, 0, 0, 0, 24793508, '2022-12-11', 'normal', 0, 1, '2022-12-11 12:55:15', '2022-12-11 12:57:16'),
(749, 11, 28812000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 534, '2023-01-03', 'normal', 0, 1, '2023-01-03 13:09:52', '2023-01-03 13:13:09'),
(750, 11, 3984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3984, '2023-01-04', 'arrears', 0, 1, '2023-01-04 10:28:52', '2023-01-04 10:28:52'),
(751, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-01-04', 'normal', 0, 1, '2023-01-04 10:33:27', '2023-01-04 10:39:15'),
(752, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-01-04', 'normal', 0, 1, '2023-01-04 10:36:57', '2023-01-04 10:39:25'),
(753, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-01-04', 'normal', 0, 1, '2023-01-04 13:56:01', '2023-01-04 14:07:15'),
(754, 19, 38501625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-01-04', 'normal', 0, 1, '2023-01-04 14:15:35', '2023-01-04 14:17:18'),
(755, 12, 285000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1226, '2023-01-09', 'normal', 0, 1, '2023-01-13 07:24:06', '2023-01-13 07:33:53'),
(756, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-01-10', 'normal', 0, 1, '2023-01-13 07:24:45', '2023-01-13 07:33:13'),
(757, 16, 0, 31307, 0, 100000, 0, 0, 0, 0, 0, 0, 308710, '2023-01-11', 'normal', 0, 1, '2023-01-16 12:47:28', '2023-01-16 13:00:19'),
(758, 12, 0, 184, 0, 100000, 0, 0, 0, 0, 0, 0, 101226, '2023-01-16', 'normal', 0, 1, '2023-01-16 12:48:47', '2023-01-16 12:59:53'),
(759, 19, 0, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 100000, '2023-01-16', 'normal', 0, 1, '2023-01-16 12:49:38', '2023-01-16 13:00:40'),
(760, 11, 0, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 100000, '2023-01-16', 'normal', 0, 1, '2023-01-16 12:50:10', '2023-01-16 13:00:46'),
(761, 13, 0, 0, 50000, 0, 0, 0, 0, 0, 0, 0, 43782, '2023-01-16', 'normal', 0, 1, '2023-01-16 12:50:41', '2023-01-16 13:00:52'),
(762, 16, 650000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-01-27', 'normal', 0, 1, '2023-02-04 07:10:23', '2023-02-04 08:11:33'),
(763, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-02-09', 'normal', 0, 1, '2023-02-10 15:49:01', '2023-02-10 16:09:37'),
(764, 11, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-02-09', 'normal', 0, 1, '2023-02-10 15:52:25', '2023-02-10 16:14:40'),
(765, 13, 345000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-02-10', 'normal', 0, 1, '2023-02-10 15:54:56', '2023-02-10 16:09:26'),
(766, 18, 10000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17862073, '2023-02-09', 'normal', 0, 2, '2023-02-10 15:59:10', '2023-02-10 16:09:03'),
(767, 12, 370000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31410, '2023-02-09', 'normal', 0, 2, '2023-02-10 16:00:03', '2023-02-10 16:08:17'),
(768, 12, 370000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31410, '2023-02-06', 'normal', 0, 1, '2023-02-10 16:18:57', '2023-02-10 16:19:31'),
(769, 12, 31500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-02-10', 'normal', 0, 1, '2023-02-10 16:20:33', '2023-02-10 16:23:00'),
(770, 18, 10000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17862073, '2023-02-10', 'normal', 0, 1, '2023-02-10 16:21:38', '2023-02-10 16:22:55'),
(773, 18, 0, 2679311, 0, 0, 0, 0, 0, 0, 0, 0, 17862073, '2023-02-11', 'normal', 0, 1, '2023-02-11 09:09:36', '2023-02-11 09:14:44'),
(774, 10, 0, 31791, 0, 0, 0, 0, 0, 0, 0, 0, 211938, '2023-02-11', 'normal', 0, 1, '2023-02-11 09:10:13', '2023-02-11 09:14:50'),
(775, 19, 0, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 400000, '2023-02-11', 'normal', 0, 1, '2023-02-11 09:11:13', '2023-02-11 09:15:02'),
(776, 18, 20541384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-02-13', 'normal', 0, 1, '2023-02-14 05:52:52', '2023-02-15 07:01:38'),
(777, 29, 30513922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-09', 'normal', 0, 2, '2023-03-09 09:49:28', '2023-03-09 21:23:51'),
(778, 10, 543729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-09', 'normal', 0, 1, '2023-03-09 09:50:34', '2023-03-09 21:24:17'),
(779, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-09', 'normal', 0, 1, '2023-03-09 09:54:14', '2023-03-09 21:24:33'),
(780, 12, 30513922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-09', 'normal', 0, 1, '2023-03-10 06:25:11', '2023-03-10 06:35:55'),
(781, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-10', 'normal', 0, 1, '2023-03-10 06:47:43', '2023-03-10 06:50:05'),
(782, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-09', 'normal', 0, 1, '2023-03-10 11:13:58', '2023-03-10 16:13:01'),
(783, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-10', 'normal', 0, 1, '2023-03-10 18:49:50', '2023-03-10 20:29:37'),
(784, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-10', 'normal', 0, 1, '2023-03-10 18:54:19', '2023-03-10 20:29:52'),
(785, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-10', 'normal', 0, 1, '2023-03-10 18:55:11', '2023-03-10 20:30:03'),
(786, 19, 760000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-03-10', 'normal', 0, 1, '2023-03-10 18:55:54', '2023-03-10 20:30:19'),
(787, 17, 40000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-04-08', 'normal', 0, 1, '2023-04-08 09:57:42', '2023-04-08 09:58:04'),
(788, 13, 22410000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-04-08', 'normal', 0, 1, '2023-04-08 10:02:21', '2023-04-08 10:03:16'),
(789, 19, 23569000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-04-08', 'normal', 0, 1, '2023-04-08 10:04:51', '2023-04-08 10:05:14'),
(790, 11, 23480000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-04-08', 'normal', 0, 1, '2023-04-08 12:27:05', '2023-04-08 12:27:52'),
(791, 16, 293467, 0, 0, 0, 0, 0, 0, 0, 0, 0, 293467, '2023-04-08', 'arrears', 0, 1, '2023-04-08 12:38:42', '2023-04-08 12:38:42'),
(792, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-04-09', 'normal', 0, 1, '2023-04-09 18:10:09', '2023-04-11 20:10:53'),
(793, 10, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 300000, '2023-04-11', 'normal', 0, 1, '2023-04-11 17:23:10', '2023-04-11 20:10:10'),
(794, 18, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 0, 300000, '2023-04-11', 'normal', 0, 1, '2023-04-11 17:23:38', '2023-04-11 20:10:24'),
(795, 12, 0, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 100000, '2023-04-18', 'normal', 0, 1, '2023-04-18 07:59:45', '2023-04-29 07:34:52'),
(796, 11, 0, 0, 0, 100000, 0, 0, 0, 0, 0, 0, 91713, '2023-04-18', 'normal', 0, 1, '2023-04-18 08:00:46', '2023-04-29 07:34:36'),
(797, 10, 0, 0, 0, 0, 0, 0, 0, 0, 200000, 0, 845000, '2023-04-30', 'normal', 0, 1, '2023-05-09 07:57:44', '2023-05-09 08:00:42'),
(798, 12, 0, 0, 0, 0, 0, 0, 0, 0, 200000, 0, 600000, '2023-04-30', 'normal', 0, 1, '2023-05-09 08:03:39', '2023-05-09 08:27:45'),
(799, 13, 0, 0, 0, 0, 0, 0, 0, 0, 300000, 0, 599420, '2023-04-30', 'normal', 0, 1, '2023-05-09 08:04:39', '2023-05-09 08:52:29'),
(800, 16, 0, 0, 0, 0, 0, 0, 0, 0, 250000, 0, 550000, '2023-04-30', 'normal', 0, 1, '2023-05-09 08:05:15', '2023-05-09 08:52:49'),
(801, 17, 0, 0, 0, 0, 0, 0, 0, 0, 350000, 0, 598013, '2023-04-30', 'normal', 0, 1, '2023-05-09 08:06:38', '2023-05-09 08:53:06'),
(802, 18, 0, 0, 0, 0, 0, 0, 0, 0, 350000, 0, 38590250, '2023-04-30', 'normal', 0, 1, '2023-05-09 08:08:40', '2023-05-09 08:53:17'),
(803, 19, 0, 0, 0, 0, 0, 0, 0, 0, 350000, 0, 649263, '2023-04-30', 'normal', 0, 1, '2023-05-09 08:09:21', '2023-05-09 08:27:00'),
(804, 17, 650000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-09', 'normal', 0, 1, '2023-05-09 08:13:17', '2023-05-09 08:26:30'),
(805, 11, 400000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-09', 'normal', 0, 1, '2023-05-10 10:33:44', '2023-05-10 11:46:08'),
(806, 12, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-09', 'normal', 0, 1, '2023-05-10 10:39:06', '2023-05-10 11:41:21'),
(807, 18, 38590250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-10', 'normal', 0, 1, '2023-05-10 10:40:53', '2023-05-10 11:41:09'),
(808, 19, 649263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-10', 'normal', 0, 1, '2023-05-10 10:42:32', '2023-05-10 11:40:40'),
(809, 10, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 845000, '2023-05-10', 'normal', 0, 1, '2023-05-13 05:33:21', '2023-05-13 06:49:35'),
(818, 13, 990000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-20', 'normal', 0, 1, '2023-05-23 16:49:57', '2023-05-23 17:04:09'),
(817, 13, 0, 89913, 0, 0, 0, 0, 0, 0, 0, 0, 599420, '2023-05-13', 'normal', 0, 1, '2023-05-23 16:05:25', '2023-05-23 16:46:10'),
(812, 17, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-13', 'normal', 0, 1, '2023-05-13 07:46:34', '2023-05-13 07:56:58'),
(813, 10, 0, 51750, 0, 0, 0, 0, 0, 0, 0, 0, 345000, '2023-05-11', 'normal', 0, 1, '2023-05-13 08:39:55', '2023-05-13 08:44:34');
INSERT INTO `saving_logs` (`id`, `member`, `monthly_contr`, `late_payment`, `late_meeting`, `absenteeism`, `marriage`, `birth`, `graduation`, `consecration`, `death`, `sickness`, `arrears`, `date`, `log_type`, `status`, `approve`, `created_at`, `updated_at`) VALUES
(819, 16, 0, 82500, 0, 0, 0, 0, 0, 0, 0, 0, 632500, '2023-05-13', 'normal', 0, 1, '2023-05-23 16:52:53', '2023-05-23 16:53:21'),
(820, 16, 4000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-22', 'normal', 0, 1, '2023-05-23 17:01:01', '2023-05-23 17:04:17'),
(821, 33, 31106600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-05-23', 'normal', 0, 1, '2023-06-06 17:45:51', '2023-06-06 17:48:54'),
(822, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-10', 'normal', 0, 1, '2023-06-10 07:56:01', '2023-06-10 08:02:43'),
(823, 16, 310000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-09', 'normal', 0, 1, '2023-06-10 07:56:44', '2023-06-10 08:02:51'),
(824, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-10', 'normal', 0, 1, '2023-06-10 08:25:08', '2023-06-10 08:36:17'),
(825, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-10', 'normal', 0, 1, '2023-06-10 17:34:05', '2023-06-10 17:35:28'),
(826, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-10', 'normal', 0, 1, '2023-06-10 17:47:12', '2023-06-10 17:48:01'),
(827, 12, 5820000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-06-27', 'normal', 0, 1, '2023-06-27 17:40:55', '2023-06-27 17:44:09'),
(828, 33, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-04', 'normal', 0, 1, '2023-07-04 17:47:42', '2023-07-04 17:55:33'),
(829, 10, 24468816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7783809, '2023-07-07', 'normal', 0, 1, '2023-07-07 20:11:39', '2023-07-08 11:21:01'),
(830, 10, 5000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2783809, '2023-07-08', 'normal', 0, 1, '2023-07-08 11:44:59', '2023-07-08 15:13:05'),
(831, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-08', 'normal', 0, 1, '2023-07-08 11:47:38', '2023-07-08 15:13:01'),
(832, 19, 35144513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-08', 'normal', 0, 1, '2023-07-08 11:51:02', '2023-07-08 15:12:56'),
(833, 17, 42450000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-10', 'normal', 0, 1, '2023-07-10 08:54:48', '2023-07-10 09:00:01'),
(834, 13, 35144000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-10', 'normal', 0, 1, '2023-07-10 08:55:31', '2023-07-10 09:09:45'),
(835, 16, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-10', 'normal', 0, 1, '2023-07-10 11:20:22', '2023-07-10 11:31:41'),
(836, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-10', 'normal', 0, 1, '2023-07-10 11:20:52', '2023-07-10 11:30:47'),
(837, 10, 0, 417571, 0, 0, 0, 0, 0, 0, 0, 0, 2783809, '2023-07-11', 'normal', 0, 1, '2023-07-11 13:44:28', '2023-07-11 14:41:35'),
(838, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-08', 'normal', 0, 1, '2023-08-09 09:27:01', '2023-08-09 11:05:23'),
(839, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-09', 'normal', 0, 1, '2023-08-09 09:27:59', '2023-08-09 11:05:18'),
(840, 10, 3501380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-09', 'normal', 0, 1, '2023-08-09 18:42:40', '2023-08-09 18:55:52'),
(841, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-09', 'normal', 0, 1, '2023-08-09 18:43:25', '2023-08-09 18:55:44'),
(842, 18, 41202750, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-10', 'normal', 0, 1, '2023-08-10 12:41:44', '2023-08-10 12:44:26'),
(843, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-10', 'normal', 0, 1, '2023-08-10 12:42:23', '2023-08-10 12:44:18'),
(844, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-10', 'normal', 0, 1, '2023-08-11 08:39:14', '2023-08-11 09:08:09'),
(845, 33, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-08-10', 'normal', 0, 1, '2023-08-11 08:40:50', '2023-08-11 09:08:10'),
(846, 16, 0, 35535, 0, 0, 0, 0, 0, 0, 0, 0, 236900, '2023-08-11', 'normal', 0, 1, '2023-08-11 08:43:28', '2023-08-11 09:08:18'),
(847, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-09-07', 'normal', 0, 1, '2023-09-07 15:19:41', '2023-09-09 13:01:17'),
(848, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-09-08', 'normal', 0, 1, '2023-09-08 08:18:28', '2023-09-09 13:01:05'),
(849, 33, 40932638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-09-09', 'normal', 0, 1, '2023-09-09 11:42:53', '2023-09-09 13:00:32'),
(850, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-09-09', 'normal', 0, 1, '2023-09-09 11:44:03', '2023-09-09 13:00:56'),
(851, 11, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-09-09', 'normal', 0, 1, '2023-09-09 14:51:49', '2023-09-09 14:59:25'),
(852, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-09-09', 'normal', 0, 1, '2023-09-09 14:53:44', '2023-09-09 14:59:33'),
(853, 16, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-09-09', 'normal', 0, 1, '2023-09-09 15:00:00', '2023-09-09 15:08:46'),
(854, 19, 302000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-09-10', 'normal', 0, 1, '2023-09-11 07:49:02', '2023-09-11 08:02:42'),
(855, 12, 0, 43875, 0, 0, 0, 0, 0, 0, 0, 0, 292500, '2023-09-11', 'normal', 0, 1, '2023-09-11 07:49:42', '2023-09-11 08:02:47'),
(856, 17, 42336000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-09-10', 'normal', 0, 1, '2023-09-13 13:18:07', '2023-09-13 13:45:53'),
(857, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36375, '2023-09-12', 'normal', 0, 1, '2023-09-13 14:59:44', '2023-09-13 15:01:33'),
(858, 12, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36375, '2023-10-05', 'normal', 0, 1, '2023-10-10 10:27:44', '2023-10-10 10:36:16'),
(859, 17, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-10', 'normal', 0, 1, '2023-10-10 10:28:11', '2023-10-10 10:35:24'),
(860, 13, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-10', 'normal', 0, 1, '2023-10-10 10:28:28', '2023-10-10 10:36:10'),
(861, 10, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-10', 'normal', 0, 1, '2023-10-10 14:40:18', '2023-10-10 14:46:17'),
(862, 19, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-10', 'normal', 0, 1, '2023-10-10 14:42:25', '2023-10-10 14:46:27'),
(863, 18, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-10', 'normal', 0, 1, '2023-10-10 14:42:42', '2023-10-10 14:46:41'),
(864, 33, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-10', 'normal', 0, 1, '2023-10-10 14:43:06', '2023-10-10 14:46:51'),
(865, 11, 310000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2023-10-10', 'normal', 0, 1, '2023-10-10 14:43:45', '2023-10-10 14:47:27'),
(866, 16, 0, 40865, 0, 0, 0, 0, 0, 0, 0, 0, 272435, '2023-10-11', 'normal', 0, 1, '2023-10-11 14:55:17', '2023-10-11 18:28:42'),
(867, 12, 0, 5456, 0, 0, 0, 0, 0, 0, 0, 0, 36375, '2023-10-11', 'normal', 0, 1, '2023-10-11 14:55:39', '2023-10-11 18:28:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fwpnumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone1` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `fwpnumber`, `email`, `phone1`, `phone2`, `image`, `userType`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Chair Person', 'NONE_CP', 'chairperson@fwpassociation.org', '0773410155', '0703063238', 'pp1_1638372386.jpg', 'chairman', '1', NULL, '$2y$10$B10N4MxoTgrOnk7PfWzmmePMAGYDx8x6ahHoy9XGV.UnFLLH2rz1G', NULL, NULL, '2021-12-01 15:26:26'),
(2, 'KATUNGYE LEONARD Finance', 'NONE_TR', 'finance.projects@fwpassociation.org', '0779374622', '0700291343', 'Leo_1643465243_1659972274.jpg', 'treasurer', '1', NULL, '$2y$10$XlHaxWUdLj/fUgsVjyXWuuIfAtlSIF1.JsBvafStJC3cobgJt792q', NULL, NULL, '2023-06-06 17:43:59'),
(9, 'ANGARUKAMU RONAD', 'FWP16/2018', 'angarukamur@gmail.com', '0789621380', '0785220944', 'Ronad_1638373808.jpg', 'Member', 'Deactivated', NULL, '$2y$10$iUmPti8Gy1yu/9NoCxEkSOSuW0CNCWk6ju3cGzlK22i89Ug8u5ipy', NULL, '2021-09-15 10:07:41', '2022-01-07 16:15:04'),
(10, 'AINOMUJUNI GODWIN', 'FWP15/2018', 'godwin.ainomujuni2013@gmail.com', '0774143998', '0703794618', 'Godwin_1638373862.jpg', 'Member', 'Activated', NULL, '$2y$10$uiwjfpM9i5cs3U7.orqVce/KNso378HuZCsDG8CBGKLvwMOVpH7.a', NULL, '2021-09-15 10:09:23', '2022-12-15 15:41:22'),
(11, 'MUKUNDANE JAVAN', 'FWP17/2018', 'javamukn04@gmail.com', '0779212694', '0700717125', 'Javan_1638373905.jpg', 'Member', 'Activated', NULL, '$2y$10$CbaCMo/RxWHioDYs6x6QEuWGXUG25dC3z8PdHT37p1QGbRxKdIn2C', NULL, '2021-09-15 10:10:30', '2021-12-01 15:51:45'),
(12, 'TWETERANE ISAAC', 'FWP18/2018', 'tweteranesc6@gmail.com', '0773188245', '0704992186', 'Isaac_1638374171.jpg', 'Member', 'Activated', NULL, '$2y$10$lR7J9/EQPZvlE4gWydMHN.hdk5UT/I27XaHAWuShLGnEZdg6d9qEi', NULL, '2021-09-15 10:11:36', '2022-02-04 06:37:50'),
(13, 'KATUNGYE LEONARD', 'FWP19/2018', 'lkatungye724@gmail.com', '0779374622', '0700291343', 'Leo_1638374005.jpg', 'Member', 'Activated', NULL, '$2y$10$WQenCaCD0rUgVWBvgbaUKuFlnW8NQpk7humDtA8Jz3KE/Mu9P5/xm', NULL, '2021-09-15 10:13:33', '2021-12-01 15:53:25'),
(14, 'KAZIMIRI VICTOR', 'FWP07/2018', 'victorkazimiri@gmail.com', NULL, NULL, 'default.jpg', 'Member', 'Deactivated', NULL, '$2y$10$2YEVZbrp6JjWV9ZxDtA6C.GMC3QnUTFsXq7.Fd8lxAaxkklaO7qJG', NULL, '2021-09-15 10:14:25', '2021-10-15 08:16:49'),
(15, 'MUBANGIZI ALOYSIUS', 'FWP08/2018', 'muloysius@gmail.com', '0782039453', '0701487750', '20210814_083526_1638962520.jpg', 'Member', 'Deactivated', NULL, '$2y$10$On1M4yNXBf/eohCw0urpKecgbCoSkKdVGqLSAL6rhnTO../Ee43U2', NULL, '2021-09-15 10:29:34', '2022-10-08 16:19:40'),
(16, 'NABAASA JESSICA', 'FWP04/2018', 'jsscnabaasa@yahoo.co.uk', '0772834233', '0759752959', 'Jessica_1638374064.jpg', 'Member', 'Activated', NULL, '$2y$10$uyC7Azb7IA76FMxxRXRaouJpX5Vresd2hhoJ/9TEPCsyUvRTtf9Am', NULL, '2021-09-15 10:31:41', '2022-08-28 08:51:48'),
(17, 'TUHAIRWE EDWIN', 'FWP01/2018', 'tuhairweedwin@yahoo.com', '0773410155', '0703063238', 'PPM_1638372452.jpeg', 'Member', 'Activated', NULL, '$2y$10$5K./6p.q0BDgvdKjk3Bu9eUbm7abzV5RER6NYI2Lw37spzlN0ImJG', NULL, '2021-09-15 10:32:38', '2021-12-01 15:38:28'),
(18, 'TWEBAZE RICHARD', 'FWP13/2018', 'twebazerichard@gmail.com', '0789902996', '0707249980', 'Twebaze_1603026950_1638374278.jpeg', 'Member', 'Activated', NULL, '$2y$10$l1CQYvXtJo3.j76Djy5kkey7gTehjCJtjKDhkyjlEGT5OzKSt1/Ca', NULL, '2021-09-15 10:33:40', '2021-12-01 15:57:58'),
(19, 'TWESIGYE KENETH', 'FWP03/2018', 'twesigyekeneth@gmail.com', '0789902469', '0706512741', 'Keneth_1603026517_1638374354.jpeg', 'Member', 'Activated', NULL, '$2y$10$Dl30iEBrwDhCsSQycfDONesWjnfVhjzGS6oWd4XbKYCz.OLqQAuOC', NULL, '2021-09-15 10:35:12', '2021-12-01 15:59:14'),
(20, 'NATWIJUKA CHRIS', 'FWP10/2018', 'ckasu20@gmail.com', NULL, NULL, 'default.jpg', 'Member', 'Deactivated', NULL, '$2y$10$bXczT5KtndDI.HrDBZMIHuUQiww7J9RQ39HV.SYOaa2Y8dBB/pjQy', NULL, '2021-09-29 12:35:55', '2021-10-15 07:56:55'),
(21, 'KARYARUGOKWE DENIS', 'FWP02/2018', 'denkarya12@gmail.com', NULL, NULL, 'default.jpg', 'Member', 'Deactivated', NULL, '$2y$10$YRGGHRCxO4xDOqOXzfldSeO9ICMe9lJeZdDSjNRQzHi5mzVC7UCsS', NULL, '2021-09-29 12:45:05', '2021-10-15 06:00:00'),
(23, 'KAMBENDYAHO ANOCH', 'FWP05/2018', 'anoch.k@adritexug.com', NULL, NULL, 'default.jpg', 'Member', 'Deactivated', NULL, '$2y$10$sIcNonwNTj7mX81NYE30wez0iYsiXAP4fP2GntuMDBfXxrjUhDBVy', NULL, '2021-09-29 12:46:56', '2021-10-15 09:00:36'),
(24, 'GALABUZI HENRY', 'FWP06/2018', 'galabuzi@gmail.com', NULL, NULL, 'default.jpg', 'Member', 'Deactivated', NULL, '$2y$10$i73RgqoWLZt/xc0EvhMIcuPK3XGidNJqKn8kjsDQ4fpvri93/Xp0S', NULL, '2021-09-29 12:47:56', '2021-10-15 08:55:39'),
(25, 'MUSINGUZI JOSEPHAT', 'FWP09/2018', 'sales@waterandpumps.com', NULL, NULL, 'default.jpg', 'Member', 'Deactivated', NULL, '$2y$10$oZ7cyjJDR8B.umXieu9yiuLMdXaAgKXci475QEevVWDO.cP51kjQq', NULL, '2021-09-29 12:48:41', '2021-10-14 07:10:59'),
(26, 'TUGUME INNOCENT', 'FWP12/2018', 'innocent.t@adritexug.com', NULL, NULL, 'default.jpg', 'Member', 'Deactivated', NULL, '$2y$10$tvH3uY6jel9CqZ2iaZqGO.yYoOgfHqMiQ.rAufpBfwdyFFCu3jVA6', NULL, '2021-09-29 12:49:30', '2021-10-15 07:25:14'),
(27, 'TAREMWA ERIAS', 'FWP14/2018', 'taremwaerias@gmail.com', NULL, NULL, 'default.jpg', 'Member', 'Deactivated', NULL, '$2y$10$bSIFBnhQs1BlCZ.10CkeJeVWEeQgW8XjZF8yazLQOLijW.nLYxUHe', NULL, '2021-09-29 12:50:15', '2021-10-15 07:31:52'),
(28, 'TIBEKIKANWA MOSES', 'FWP11/2018', 'moses.tibekikanwa@yahoo.com', NULL, NULL, 'default.jpg', 'Member', 'Deactivated', NULL, '$2y$10$UpYXHg.UmIN7ElJMQOOyHOI6I8i92i0sOyuiFLHRucdYX15EZiSP.', NULL, '2021-09-29 12:54:44', '2021-10-15 08:55:31'),
(29, 'ISAAC TWETERANE V/CP', 'NONE_VC', 'vice.chairperson@fwpassociation.org', '0773188245', '0704992186', 'VICE_1638374628_1659972089.jpg', 'Vice Chairperson', 'Activated', NULL, '$2y$10$SfEY9Zn48pkO4HQcpojbaOZ2mUPRUkUO6QRHZfQ8hkJbqnfy50.je', NULL, '2020-08-18 07:06:37', '2022-08-08 15:22:04'),
(30, 'Keneth Twesigye', 'NONE_GS', 'general.secretary@fwpassociation.org', '0789902469', '0706512741', 'Keneth_1603026517_1638377107.jpeg', 'General Secretary', 'Activated', NULL, '$2y$10$cj5hKxVTj/TSUukEr/FVsOGLZBk82J7tKA0R8YqfS8s5u4rzoc7Ym', NULL, '2020-08-18 07:07:08', '2021-12-01 16:45:07'),
(31, 'Richard Twebaze', 'NONE_IP', 'information.publicity@fwpassociation.org', '0789902996', '0707249980', 'default.jpg', 'Information and Publicity', 'Activated', NULL, '$2y$10$CbaCMo/RxWHioDYs6x6QEuWGXUG25dC3z8PdHT37p1QGbRxKdIn2C', NULL, '2020-08-18 07:07:47', '2021-12-01 17:20:36'),
(32, 'fwpassociation.org bbbdnwkdowifhrdokpwoeiyutrieowsowddfbvksodkasofjgiekwskfieghrhjkfejfegigofwkdkbhbgiejfwokdd', '305415', 'dimafokin199506780tx+0232@inbox.ru', NULL, NULL, 'default.jpg', 'Member', 'Deactivated', NULL, '$2y$10$phaFW1Wn/IchRF/odiWnIOVzqud/rVzdnRMRNqx5IRokOsVBeYLhm', NULL, '2022-02-07 21:03:53', '2022-02-07 21:03:53'),
(33, 'KAMUGISHA RICHARD', 'FWP01/2023', 'richardkamugisha02@gmail.com', '0701951109', '0784595832', 'Kamupp_1686070924.jpg', 'Member', 'Activated', NULL, '$2y$10$NjtXtvFrNecCb91qBw7fVe52GuECMFFZix1YnvB.Tx7EJhpWyl.D2', NULL, '2023-05-23 17:21:45', '2023-06-06 17:02:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biodatas`
--
ALTER TABLE `biodatas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departures`
--
ALTER TABLE `departures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departure_declines`
--
ALTER TABLE `departure_declines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disburses`
--
ALTER TABLE `disburses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `1` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guarantertemps`
--
ALTER TABLE `guarantertemps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guarantors`
--
ALTER TABLE `guarantors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_chats`
--
ALTER TABLE `loan_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saving_declines`
--
ALTER TABLE `saving_declines`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `saving_logs`
--
ALTER TABLE `saving_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_fwpnumber_unique` (`fwpnumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biodatas`
--
ALTER TABLE `biodatas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `departures`
--
ALTER TABLE `departures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `departure_declines`
--
ALTER TABLE `departure_declines`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `disburses`
--
ALTER TABLE `disburses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guarantertemps`
--
ALTER TABLE `guarantertemps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `guarantors`
--
ALTER TABLE `guarantors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `loan_chats`
--
ALTER TABLE `loan_chats`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `savings`
--
ALTER TABLE `savings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `saving_declines`
--
ALTER TABLE `saving_declines`
  MODIFY `tid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `saving_logs`
--
ALTER TABLE `saving_logs`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=868;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Database: `fwpassoc_fwptest`
--
CREATE DATABASE IF NOT EXISTS `fwpassoc_fwptest` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fwpassoc_fwptest`;

-- --------------------------------------------------------

--
-- Table structure for table `additional_fees`
--

CREATE TABLE `additional_fees` (
  `id` bigint UNSIGNED NOT NULL,
  `sid` bigint NOT NULL,
  `class` bigint NOT NULL,
  `term` tinyint DEFAULT NULL,
  `year` year DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `additional_fees`
--

INSERT INTO `additional_fees` (`id`, `sid`, `class`, `term`, `year`, `amount`, `reason`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 1, '2022', 50000, 'Fines for punishments.', 1, 1, '2022-08-17 06:34:04', '2022-08-17 06:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` bigint UNSIGNED NOT NULL,
  `activity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `schoolId` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `activity`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, ' added a new class PRIMARY ONE successfully ', 1, 1, '2022-08-13 17:20:46', '2022-08-13 17:20:46'),
(2, ' added a new class PRIMARY TWO successfully ', 1, 1, '2022-08-13 17:21:13', '2022-08-13 17:21:13'),
(3, ' added a new class PRIMARY THREE successfully ', 1, 1, '2022-08-13 17:21:51', '2022-08-13 17:21:51'),
(4, ' added a new class PRIMARY FOUR successfully ', 1, 1, '2022-08-13 17:22:15', '2022-08-13 17:22:15'),
(5, ' added a new class PRIMARY FIVE successfully ', 1, 1, '2022-08-13 17:22:36', '2022-08-13 17:22:36'),
(6, ' added a new class PRIMARY SIX successfully ', 1, 1, '2022-08-13 17:23:54', '2022-08-13 17:23:54'),
(7, ' added a new class PRIMARY SEVEN successfully ', 1, 1, '2022-08-13 17:24:08', '2022-08-13 17:24:08'),
(8, ' edited class PRIMARY SEVEN1 successfully ', 1, 1, '2022-08-13 17:24:17', '2022-08-13 17:24:17'),
(9, ' edited class PRIMARY SEVEN successfully ', 1, 1, '2022-08-13 17:24:24', '2022-08-13 17:24:24'),
(10, ' added a new class PRIMARY TEST successfully ', 1, 1, '2022-08-13 17:24:45', '2022-08-13 17:24:45'),
(11, ' deleted stream PRIMARY TEST successfully ', 1, 1, '2022-08-13 17:24:52', '2022-08-13 17:24:52'),
(12, ' added a new stream BLUE', 1, 1, '2022-08-13 17:25:17', '2022-08-13 17:25:17'),
(13, ' added a new stream GREEN', 1, 1, '2022-08-13 17:28:59', '2022-08-13 17:28:59'),
(14, ' added a new stream YELLOW', 1, 1, '2022-08-13 17:29:17', '2022-08-13 17:29:17'),
(15, ' added a new stream RED', 1, 1, '2022-08-13 17:29:24', '2022-08-13 17:29:24'),
(16, ' added a new stream GREEN', 1, 1, '2022-08-13 17:31:38', '2022-08-13 17:31:38'),
(17, ' added a new stream YELLOW', 1, 1, '2022-08-13 17:31:50', '2022-08-13 17:31:50'),
(18, ' added a new stream BLUE', 1, 1, '2022-08-13 17:32:10', '2022-08-13 17:32:10'),
(19, ' added a new stream GREEN', 1, 1, '2022-08-13 17:32:27', '2022-08-13 17:32:27'),
(20, ' added a new stream BLUE', 1, 1, '2022-08-13 17:33:04', '2022-08-13 17:33:04'),
(21, ' added a new stream GREEN', 1, 1, '2022-08-13 17:33:25', '2022-08-13 17:33:25'),
(22, ' added a new stream YELLLOW', 1, 1, '2022-08-13 17:33:39', '2022-08-13 17:33:39'),
(23, ' added a new stream RED', 1, 1, '2022-08-13 17:33:46', '2022-08-13 17:33:46'),
(24, ' added a new stream BLUE', 1, 1, '2022-08-13 17:34:00', '2022-08-13 17:34:00'),
(25, ' added a new stream GRAY', 1, 1, '2022-08-13 17:34:19', '2022-08-13 17:34:19'),
(26, ' edited stream GRAY1 successfully ', 1, 1, '2022-08-13 17:34:30', '2022-08-13 17:34:30'),
(27, ' deleted stream GRAY1 successfully ', 1, 1, '2022-08-13 17:34:36', '2022-08-13 17:34:36'),
(28, ' added a new subject MATHEMATICS successfully ', 1, 1, '2022-08-13 17:37:01', '2022-08-13 17:37:01'),
(29, ' added a new subject MATHEMATICS successfully ', 1, 1, '2022-08-13 17:37:01', '2022-08-13 17:37:01'),
(30, ' added a new subject MATHEMATICS successfully ', 1, 1, '2022-08-13 17:37:02', '2022-08-13 17:37:02'),
(31, ' added a new subject MATHEMATICS successfully ', 1, 1, '2022-08-13 17:37:02', '2022-08-13 17:37:02'),
(32, ' added a new subject MATHEMATICS successfully ', 1, 1, '2022-08-13 17:37:03', '2022-08-13 17:37:03'),
(33, ' added a new subject MATHEMATICS successfully ', 1, 1, '2022-08-13 17:37:03', '2022-08-13 17:37:03'),
(34, ' added a new subject MATHEMATICS successfully ', 1, 1, '2022-08-13 17:37:04', '2022-08-13 17:37:04'),
(35, ' added a new subject ENGLISH successfully ', 1, 1, '2022-08-13 17:37:26', '2022-08-13 17:37:26'),
(36, ' added a new subject ENGLISH successfully ', 1, 1, '2022-08-13 17:37:26', '2022-08-13 17:37:26'),
(37, ' added a new subject ENGLISH successfully ', 1, 1, '2022-08-13 17:37:26', '2022-08-13 17:37:26'),
(38, ' added a new subject ENGLISH successfully ', 1, 1, '2022-08-13 17:37:27', '2022-08-13 17:37:27'),
(39, ' added a new subject ENGLISH successfully ', 1, 1, '2022-08-13 17:37:27', '2022-08-13 17:37:27'),
(40, ' added a new subject ENGLISH successfully ', 1, 1, '2022-08-13 17:37:27', '2022-08-13 17:37:27'),
(41, ' added a new subject ENGLISH successfully ', 1, 1, '2022-08-13 17:37:27', '2022-08-13 17:37:27'),
(42, ' added a new subject SOCIAL STUDIES successfully ', 1, 1, '2022-08-13 17:38:04', '2022-08-13 17:38:04'),
(43, ' added a new subject SOCIAL STUDIES successfully ', 1, 1, '2022-08-13 17:38:04', '2022-08-13 17:38:04'),
(44, ' added a new subject SOCIAL STUDIES successfully ', 1, 1, '2022-08-13 17:38:04', '2022-08-13 17:38:04'),
(45, ' added a new subject SOCIAL STUDIES successfully ', 1, 1, '2022-08-13 17:38:05', '2022-08-13 17:38:05'),
(46, ' added a new subject SOCIAL STUDIES successfully ', 1, 1, '2022-08-13 17:38:05', '2022-08-13 17:38:05'),
(47, ' added a new subject SOCIAL STUDIES successfully ', 1, 1, '2022-08-13 17:38:05', '2022-08-13 17:38:05'),
(48, ' added a new subject SOCIAL STUDIES successfully ', 1, 1, '2022-08-13 17:38:06', '2022-08-13 17:38:06'),
(49, ' added a new subject SCIENCE successfully ', 1, 1, '2022-08-13 17:38:27', '2022-08-13 17:38:27'),
(50, ' added a new subject SCIENCE successfully ', 1, 1, '2022-08-13 17:38:27', '2022-08-13 17:38:27'),
(51, ' added a new subject SCIENCE successfully ', 1, 1, '2022-08-13 17:38:27', '2022-08-13 17:38:27'),
(52, ' added a new subject SCIENCE successfully ', 1, 1, '2022-08-13 17:38:28', '2022-08-13 17:38:28'),
(53, ' added a new subject SCIENCE successfully ', 1, 1, '2022-08-13 17:38:28', '2022-08-13 17:38:28'),
(54, ' added a new subject SCIENCE successfully ', 1, 1, '2022-08-13 17:38:29', '2022-08-13 17:38:29'),
(55, ' added a new subject SCIENCE successfully ', 1, 1, '2022-08-13 17:38:29', '2022-08-13 17:38:29'),
(56, ' edited a subject MATHEMATICS successfully ', 1, 1, '2022-08-13 17:38:45', '2022-08-13 17:38:45'),
(57, ' edited a subject MATHEMATICS successfully ', 1, 1, '2022-08-13 17:38:56', '2022-08-13 17:38:56'),
(58, ' added a new subject TEST SUBJECT successfully ', 1, 1, '2022-08-13 17:39:21', '2022-08-13 17:39:21'),
(59, ' deleted subject TEST SUBJECT successfully ', 1, 1, '2022-08-13 17:39:28', '2022-08-13 17:39:28'),
(60, 'Added a payment method BEN WHITE of type mobile MTN and account number 0781076109', 1, 1, '2022-08-13 17:40:53', '2022-08-13 17:40:53'),
(61, 'Added a payment method BRYAN AUSTIN of type bank EQUITY and account number 10004586953215', 1, 1, '2022-08-13 17:41:54', '2022-08-13 17:41:54'),
(62, 'Changed the current term to 1 and study year 2022', 1, 1, '2022-08-13 17:44:08', '2022-08-13 17:44:08'),
(63, ' added a new position CLASS TEACHER successfully ', 1, 1, '2022-08-13 17:50:19', '2022-08-13 17:50:19'),
(64, ' added a new position ADMINISTRATOR successfully ', 1, 1, '2022-08-13 17:50:46', '2022-08-13 17:50:46'),
(65, ' added a new position TEACHER successfully ', 1, 1, '2022-08-13 17:51:27', '2022-08-13 17:51:27'),
(66, ' added a new staff with name K DE BRIAN successfully ', 1, 1, '2022-08-13 17:53:59', '2022-08-13 17:53:59'),
(67, ' added a new staff with name FRANCIS ABALIWANO successfully ', 1, 1, '2022-08-13 17:57:25', '2022-08-13 17:57:25'),
(68, ' added a new staff with name BENTEKE CHRISTIAN successfully ', 1, 1, '2022-08-13 17:58:44', '2022-08-13 17:58:44'),
(69, ' Edited staff with name K DE BRIAN1 successfully ', 1, 1, '2022-08-13 17:59:26', '2022-08-13 17:59:26'),
(70, ' Edited staff with name K DE BRIAN successfully ', 1, 1, '2022-08-13 17:59:40', '2022-08-13 17:59:40'),
(71, ' Edited staff with name FRANCIS ABALIWANO successfully ', 1, 1, '2022-08-13 18:00:02', '2022-08-13 18:00:02'),
(72, ' Edited staff with name BENTEKE CHRISTIAN successfully ', 1, 1, '2022-08-13 18:00:11', '2022-08-13 18:00:11'),
(73, 'Added a new Student: LYDIA LYTON successfully', 1, 1, '2022-08-13 18:10:59', '2022-08-13 18:10:59'),
(74, 'Added a new Student: CHRISTIAN ELIKSEN successfully', 1, 1, '2022-08-13 18:13:05', '2022-08-13 18:13:05'),
(75, 'Added a new Student: DAVID DEG successfully', 1, 1, '2022-08-13 18:15:01', '2022-08-13 18:15:01'),
(76, 'Added a new Student: VAN DE BEEK successfully', 1, 1, '2022-08-13 18:19:28', '2022-08-13 18:19:28'),
(77, 'Added a new Student: AISHA NAMAALA successfully', 1, 1, '2022-08-13 18:22:04', '2022-08-13 18:22:04'),
(78, 'Edited Student: FRANK RIBERY successfully', 1, 1, '2022-08-13 19:01:31', '2022-08-13 19:01:31'),
(79, 'Added a new Student: MICHEAL ATETA successfully', 1, 1, '2022-08-14 07:41:19', '2022-08-14 07:41:19'),
(80, 'Added a new Student: ERIC TENHAG successfully', 1, 1, '2022-08-14 07:42:46', '2022-08-14 07:42:46'),
(81, 'Added a new Student: ALICE NASUUNA successfully', 1, 1, '2022-08-14 07:43:39', '2022-08-14 07:43:39'),
(82, 'Added a new Student: SANDRA NABIRYE successfully', 1, 1, '2022-08-14 07:44:13', '2022-08-14 07:44:13'),
(83, 'Added a new Student: ELIZABETH SYN successfully', 1, 1, '2022-08-14 08:07:56', '2022-08-14 08:07:56'),
(84, ' Added a new Grade with name DISTINCTION ONE successfully ', 1, 1, '2022-08-14 09:59:39', '2022-08-14 09:59:39'),
(85, ' Added a new Grade with name DISTINCTION TWO successfully ', 1, 1, '2022-08-14 10:00:45', '2022-08-14 10:00:45'),
(86, ' Added a new Grade with name CREDIT 3 successfully ', 1, 1, '2022-08-14 10:28:14', '2022-08-14 10:28:14'),
(87, ' Added a new Grade with name CREDIT 4 successfully ', 1, 1, '2022-08-14 10:32:46', '2022-08-14 10:32:46'),
(88, ' Added a new Grade with name CREDIT 5 successfully ', 1, 1, '2022-08-14 10:33:45', '2022-08-14 10:33:45'),
(89, ' Added a new Grade with name CREDIT 6 successfully ', 1, 1, '2022-08-14 10:34:31', '2022-08-14 10:34:31'),
(90, ' Added a new Grade with name PASS 7 successfully ', 1, 1, '2022-08-14 10:35:41', '2022-08-14 10:35:41'),
(91, ' Added a new Grade with name PASS 8 successfully ', 1, 1, '2022-08-14 10:36:21', '2022-08-14 10:36:21'),
(92, ' Added a new Grade with name FAILED 9 successfully ', 1, 1, '2022-08-14 10:36:49', '2022-08-14 10:36:49'),
(93, ' added a new test set BEGINNING OF TERM successfully ', 1, 1, '2022-08-14 10:39:37', '2022-08-14 10:39:37'),
(94, ' added a new test set MID TERM successfully ', 1, 1, '2022-08-14 10:39:57', '2022-08-14 10:39:57'),
(95, ' added a new test set END OF TERM successfully ', 1, 1, '2022-08-14 10:40:13', '2022-08-14 10:40:13'),
(96, ' added a new test set consideration of BEGINNING OF TERM for year 2022 successfully ', 1, 1, '2022-08-14 10:41:14', '2022-08-14 10:41:14'),
(97, ' added a new test set consideration of MID TERM for year 2022 successfully ', 1, 1, '2022-08-14 10:42:21', '2022-08-14 10:42:21'),
(98, ' added a new test set consideration of END OF TERM for year 2022 successfully ', 1, 1, '2022-08-14 10:42:28', '2022-08-14 10:42:28'),
(99, ' Added a new test set contribution of BEGINNING OF TERM', 1, 1, '2022-08-14 10:43:22', '2022-08-14 10:43:22'),
(100, ' Added a new test set contribution of MID TERM', 1, 1, '2022-08-14 10:43:51', '2022-08-14 10:43:51'),
(101, ' Added a new test set contribution of END OF TERM', 1, 1, '2022-08-14 10:44:07', '2022-08-14 10:44:07'),
(102, ' added a new load to K DE BRIAN for subject MATHEMATICS and class PRIMARY ONE', 1, 1, '2022-08-14 10:46:09', '2022-08-14 10:46:09'),
(103, ' added a new load to K DE BRIAN for subject ENGLISH and class PRIMARY ONE', 1, 1, '2022-08-14 10:46:15', '2022-08-14 10:46:15'),
(104, ' added a new load to K DE BRIAN for subject MATHEMATICS and class PRIMARY ONE', 1, 1, '2022-08-14 11:25:24', '2022-08-14 11:25:24'),
(105, ' added a new load to K DE BRIAN for subject ENGLISH and class PRIMARY ONE', 1, 1, '2022-08-14 11:25:36', '2022-08-14 11:25:36'),
(106, ' added a new load to K DE BRIAN for subject SOCIAL STUDIES and class PRIMARY ONE', 1, 1, '2022-08-14 17:52:17', '2022-08-14 17:52:17'),
(107, ' added a new load to K DE BRIAN for subject SCIENCE and class PRIMARY ONE', 1, 1, '2022-08-14 17:52:29', '2022-08-14 17:52:29'),
(108, ' added a new load to K DE BRIAN for subject MATHEMATICS and class PRIMARY TWO', 1, 1, '2022-08-14 17:58:17', '2022-08-14 17:58:17'),
(109, ' added a new load to K DE BRIAN for subject ENGLISH and class PRIMARY TWO', 1, 1, '2022-08-14 17:58:32', '2022-08-14 17:58:32'),
(110, ' added a new load to K DE BRIAN for subject SOCIAL STUDIES and class PRIMARY TWO', 1, 1, '2022-08-14 17:58:48', '2022-08-14 17:58:48'),
(111, ' added a new load to K DE BRIAN for subject SCIENCE and class PRIMARY TWO', 1, 1, '2022-08-14 17:58:59', '2022-08-14 17:58:59'),
(112, ' added a new load to FRANCIS ABALIWANO for subject MATHEMATICS and class PRIMARY THREE', 1, 1, '2022-08-14 17:59:18', '2022-08-14 17:59:18'),
(113, ' added a new load to FRANCIS ABALIWANO for subject ENGLISH and class PRIMARY THREE', 1, 1, '2022-08-14 17:59:27', '2022-08-14 17:59:27'),
(114, ' added a new load to FRANCIS ABALIWANO for subject SOCIAL STUDIES and class PRIMARY THREE', 1, 1, '2022-08-14 17:59:35', '2022-08-14 17:59:35'),
(115, ' added a new load to FRANCIS ABALIWANO for subject SCIENCE and class PRIMARY THREE', 1, 1, '2022-08-14 17:59:51', '2022-08-14 17:59:51'),
(116, ' added a new load to FRANCIS ABALIWANO for subject MATHEMATICS and class PRIMARY FOUR', 1, 1, '2022-08-14 18:00:10', '2022-08-14 18:00:10'),
(117, ' added a new load to FRANCIS ABALIWANO for subject ENGLISH and class PRIMARY FOUR', 1, 1, '2022-08-14 18:00:49', '2022-08-14 18:00:49'),
(118, ' added a new load to FRANCIS ABALIWANO for subject SCIENCE and class PRIMARY FOUR', 1, 1, '2022-08-14 18:00:58', '2022-08-14 18:00:58'),
(119, ' added a new load to FRANCIS ABALIWANO for subject SOCIAL STUDIES and class PRIMARY FOUR', 1, 1, '2022-08-14 18:01:22', '2022-08-14 18:01:22'),
(120, ' added a new load to BENTEKE CHRISTIAN for subject MATHEMATICS and class PRIMARY FIVE', 1, 1, '2022-08-14 18:02:26', '2022-08-14 18:02:26'),
(121, ' added a new load to BENTEKE CHRISTIAN for subject ENGLISH and class PRIMARY FIVE', 1, 1, '2022-08-14 18:02:34', '2022-08-14 18:02:34'),
(122, ' added a new load to BENTEKE CHRISTIAN for subject SOCIAL STUDIES and class PRIMARY FIVE', 1, 1, '2022-08-14 18:02:43', '2022-08-14 18:02:43'),
(123, ' added a new load to BENTEKE CHRISTIAN for subject SCIENCE and class PRIMARY FIVE', 1, 1, '2022-08-14 18:02:52', '2022-08-14 18:02:52'),
(124, ' added a new load to BENTEKE CHRISTIAN for subject MATHEMATICS and class PRIMARY SIX', 1, 1, '2022-08-14 18:03:01', '2022-08-14 18:03:01'),
(125, ' added a new load to BENTEKE CHRISTIAN for subject ENGLISH and class PRIMARY SIX', 1, 1, '2022-08-14 18:03:14', '2022-08-14 18:03:14'),
(126, ' added a new load to BENTEKE CHRISTIAN for subject SOCIAL STUDIES and class PRIMARY SIX', 1, 1, '2022-08-14 18:03:22', '2022-08-14 18:03:22'),
(127, ' added a new load to BENTEKE CHRISTIAN for subject SCIENCE and class PRIMARY SIX', 1, 1, '2022-08-14 18:03:37', '2022-08-14 18:03:37'),
(128, ' added a new load to BENTEKE CHRISTIAN for subject MATHEMATICS and class PRIMARY SEVEN', 1, 1, '2022-08-14 18:04:03', '2022-08-14 18:04:03'),
(129, ' added a new load to BENTEKE CHRISTIAN for subject ENGLISH and class PRIMARY SEVEN', 1, 1, '2022-08-14 18:05:41', '2022-08-14 18:05:41'),
(130, ' added a new load to BENTEKE CHRISTIAN for subject SOCIAL STUDIES and class PRIMARY SEVEN', 1, 1, '2022-08-14 18:05:48', '2022-08-14 18:05:48'),
(131, ' added a new load to BENTEKE CHRISTIAN for subject SCIENCE and class PRIMARY SEVEN', 1, 1, '2022-08-14 18:05:59', '2022-08-14 18:05:59'),
(132, ' added a new test set consideration of BEGINNING OF TERM for year 2021 successfully ', 1, 1, '2022-08-15 13:43:39', '2022-08-15 13:43:39'),
(133, ' deleted test consideration record for year 2021', 1, 1, '2022-08-15 13:45:00', '2022-08-15 13:45:00'),
(134, 'Added a new Fees Item Fees successfully ', 1, 1, '2022-08-17 05:39:45', '2022-08-17 05:39:45'),
(135, 'Added a new Fees Item School Trip successfully ', 1, 1, '2022-08-17 05:40:50', '2022-08-17 05:40:50'),
(136, 'Added a new Fees Item Feeding successfully ', 1, 1, '2022-08-17 05:41:05', '2022-08-17 05:41:05'),
(137, 'Added a new fee of Fees to class P.7 and term 1 and amount 500,000', 1, 1, '2022-08-17 05:42:22', '2022-08-17 05:42:22'),
(138, 'Added a new fee of School Trip to class P.7 and term 1 and amount 200,000', 1, 1, '2022-08-17 06:07:29', '2022-08-17 06:07:29'),
(139, 'Added a new fee of Feeding to class P.7 and term 1 and amount 100,000', 1, 1, '2022-08-17 06:08:18', '2022-08-17 06:08:18'),
(140, 'Added a bursary category Good Performance', 1, 1, '2022-08-17 06:10:47', '2022-08-17 06:10:47'),
(141, 'Added a bursary category Disabled Students', 1, 1, '2022-08-17 06:11:52', '2022-08-17 06:11:52'),
(142, 'Added a bursary Good Performance to student DAVID DEG', 1, 1, '2022-08-17 06:15:26', '2022-08-17 06:15:26'),
(143, 'Added a bursary category Uniform', 1, 1, '2022-08-17 06:29:37', '2022-08-17 06:29:37'),
(144, 'Added a fees exemption of amount 50,000 to student LYDIA LYTON', 1, 1, '2022-08-17 06:32:08', '2022-08-17 06:32:08'),
(145, 'Added an additional fee of amount 50,000 to student AISHA NAMAALA for Fines for punishments.', 1, 1, '2022-08-17 06:34:04', '2022-08-17 06:34:04'),
(146, 'Paid fees for LYDIA LYTON and class P.1 and amount 500,000', 1, 1, '2022-08-17 06:45:36', '2022-08-17 06:45:36'),
(147, 'Added a new Revenue Category School Fees', 1, 1, '2022-08-17 07:04:13', '2022-08-17 07:04:13'),
(148, 'Added a new Revenue Category Farming', 1, 1, '2022-08-17 07:05:34', '2022-08-17 07:05:34'),
(149, 'Added a new Expense Category Staff Payments', 1, 1, '2022-08-17 07:06:36', '2022-08-17 07:06:36'),
(150, 'Added a new Expense Category Staff Welfare.', 1, 1, '2022-08-17 07:07:00', '2022-08-17 07:07:00'),
(151, 'Added a new Expense Item Food', 1, 1, '2022-08-17 07:07:19', '2022-08-17 07:07:19'),
(152, 'Added a new Expense Item Sugar', 1, 1, '2022-08-17 07:07:34', '2022-08-17 07:07:34'),
(153, 'Added a new Expense Item Salary', 1, 1, '2022-08-17 07:10:19', '2022-08-17 07:10:19'),
(154, 'Added a new Revenue Projection of School Fees and amount 8', 1, 1, '2022-08-17 07:11:13', '2022-08-17 07:11:13'),
(155, 'Modified revenue projection for School Fees and amount 80', 1, 1, '2022-08-17 07:11:17', '2022-08-17 07:11:17'),
(156, 'Modified revenue projection for School Fees and amount 800', 1, 1, '2022-08-17 07:11:19', '2022-08-17 07:11:19'),
(157, 'Modified revenue projection for School Fees and amount 8000', 1, 1, '2022-08-17 07:11:20', '2022-08-17 07:11:20'),
(158, 'Modified revenue projection for School Fees and amount 80000', 1, 1, '2022-08-17 07:11:22', '2022-08-17 07:11:22'),
(159, 'Modified revenue projection for School Fees and amount 800000', 1, 1, '2022-08-17 07:11:23', '2022-08-17 07:11:23'),
(160, 'Modified revenue projection for School Fees and amount 8000000', 1, 1, '2022-08-17 07:11:24', '2022-08-17 07:11:24'),
(161, 'Added a new Revenue Projection of Farming and amount 80000000', 1, 1, '2022-08-17 07:11:25', '2022-08-17 07:11:25'),
(162, 'Modified revenue projection for School Fees and amount 5', 1, 1, '2022-08-17 07:11:27', '2022-08-17 07:11:27'),
(163, 'Modified revenue projection for Farming and amount 50', 1, 1, '2022-08-17 07:11:28', '2022-08-17 07:11:28'),
(164, 'Modified revenue projection for Farming and amount 500', 1, 1, '2022-08-17 07:11:29', '2022-08-17 07:11:29'),
(165, 'Modified revenue projection for Farming and amount 5000', 1, 1, '2022-08-17 07:11:31', '2022-08-17 07:11:31'),
(166, 'Modified revenue projection for Farming and amount 50000', 1, 1, '2022-08-17 07:11:32', '2022-08-17 07:11:32'),
(167, 'Modified revenue projection for Farming and amount 500000', 1, 1, '2022-08-17 07:11:33', '2022-08-17 07:11:33'),
(168, 'Modified revenue projection for Farming and amount 5000000', 1, 1, '2022-08-17 07:11:33', '2022-08-17 07:11:33'),
(169, 'Added a new Expense Projection of Salary and amount 1', 1, 1, '2022-08-17 07:12:09', '2022-08-17 07:12:09'),
(170, 'Modified Expense projection for Salary and amount 2', 1, 1, '2022-08-17 07:12:11', '2022-08-17 07:12:11'),
(171, 'Modified Expense projection for Salary and amount 20', 1, 1, '2022-08-17 07:12:12', '2022-08-17 07:12:12'),
(172, 'Modified Expense projection for Salary and amount 200', 1, 1, '2022-08-17 07:12:14', '2022-08-17 07:12:14'),
(173, 'Modified Expense projection for Salary and amount 2000', 1, 1, '2022-08-17 07:12:17', '2022-08-17 07:12:17'),
(174, 'Modified Expense projection for Salary and amount 20000', 1, 1, '2022-08-17 07:12:19', '2022-08-17 07:12:19'),
(175, 'Modified Expense projection for Salary and amount 200000', 1, 1, '2022-08-17 07:12:20', '2022-08-17 07:12:20'),
(176, 'Modified Expense projection for Salary and amount 2000000', 1, 1, '2022-08-17 07:12:21', '2022-08-17 07:12:21'),
(177, 'Added a new Expense Projection of Food and amount 5', 1, 1, '2022-08-17 07:12:25', '2022-08-17 07:12:25'),
(178, 'Modified Expense projection for Food and amount 50', 1, 1, '2022-08-17 07:12:25', '2022-08-17 07:12:25'),
(179, 'Modified Expense projection for Food and amount 500', 1, 1, '2022-08-17 07:12:27', '2022-08-17 07:12:27'),
(180, 'Modified Expense projection for Food and amount 5000', 1, 1, '2022-08-17 07:12:28', '2022-08-17 07:12:28'),
(181, 'Modified Expense projection for Food and amount 50000', 1, 1, '2022-08-17 07:12:28', '2022-08-17 07:12:28'),
(182, 'Modified Expense projection for Food and amount 500000', 1, 1, '2022-08-17 07:12:31', '2022-08-17 07:12:31'),
(183, 'Modified Expense projection for Food and amount 5000000', 1, 1, '2022-08-17 07:12:32', '2022-08-17 07:12:32'),
(184, 'Added a new Expense Projection of Sugar and amount 2', 1, 1, '2022-08-17 07:12:36', '2022-08-17 07:12:36'),
(185, 'Modified Expense projection for Sugar and amount 20', 1, 1, '2022-08-17 07:12:37', '2022-08-17 07:12:37'),
(186, 'Modified Expense projection for Sugar and amount 200', 1, 1, '2022-08-17 07:12:38', '2022-08-17 07:12:38'),
(187, 'Modified Expense projection for Sugar and amount 2000', 1, 1, '2022-08-17 07:12:40', '2022-08-17 07:12:40'),
(188, 'Modified Expense projection for Sugar and amount 20000', 1, 1, '2022-08-17 07:12:41', '2022-08-17 07:12:41'),
(189, 'Modified Expense projection for Sugar and amount 200000', 1, 1, '2022-08-17 07:12:42', '2022-08-17 07:12:42'),
(190, 'Modified Expense projection for Sugar and amount 2000000', 1, 1, '2022-08-17 07:12:44', '2022-08-17 07:12:44'),
(191, 'Modified revenue projection for School Fees and amount 8', 1, 1, '2022-08-17 07:14:35', '2022-08-17 07:14:35'),
(192, 'Modified revenue projection for School Fees and amount 80', 1, 1, '2022-08-17 07:14:37', '2022-08-17 07:14:37'),
(193, 'Modified revenue projection for School Fees and amount 800', 1, 1, '2022-08-17 07:14:40', '2022-08-17 07:14:40'),
(194, 'Modified revenue projection for School Fees and amount 8000', 1, 1, '2022-08-17 07:14:42', '2022-08-17 07:14:42'),
(195, 'Modified revenue projection for School Fees and amount 80000', 1, 1, '2022-08-17 07:14:44', '2022-08-17 07:14:44'),
(196, 'Modified revenue projection for School Fees and amount 800000', 1, 1, '2022-08-17 07:14:45', '2022-08-17 07:14:45'),
(197, 'Modified revenue projection for School Fees and amount 8000000', 1, 1, '2022-08-17 07:14:46', '2022-08-17 07:14:46'),
(198, 'Modified revenue projection for School Fees and amount 80000000', 1, 1, '2022-08-17 07:14:48', '2022-08-17 07:14:48'),
(199, 'Recorded a revenue from Farm Manager and category Farming and amount 1,000,000 description This was received from the maize garden.', 1, 1, '2022-08-17 07:16:41', '2022-08-17 07:16:41'),
(200, 'Added a supplier Brian Shrik and phone 0786594235', NULL, 1, '2022-08-17 07:33:55', '2022-08-17 07:33:55'),
(201, 'Added a supplier Ashiraf and phone 0756423698', NULL, 1, '2022-08-17 07:35:39', '2022-08-17 07:35:39'),
(202, 'Recorded an Expense of 500,000 and amount paid 500,000 spent on 2022-08-17', NULL, 1, '2022-08-17 07:37:29', '2022-08-17 07:37:29'),
(203, 'Recorded an Expense of 1,000,000 and amount paid 1,000,000 spent on 2022-08-17', NULL, 1, '2022-08-17 07:39:04', '2022-08-17 07:39:04'),
(204, 'Added a bursary Disabled Students to student CHRISTIAN ELIKSEN', 1, 1, '2022-08-17 08:18:39', '2022-08-17 08:18:39'),
(205, 'Added a bursary Disabled Students to student VAN DE BEEK', 1, 1, '2022-08-17 08:19:11', '2022-08-17 08:19:11'),
(206, 'Added a new Expense Item overtime', 1, 1, '2022-08-18 08:01:08', '2022-08-18 08:01:08'),
(207, 'Added a new Expense Projection of overtime and amount 9', 1, 1, '2022-08-18 08:01:42', '2022-08-18 08:01:42'),
(208, 'Modified Expense projection for overtime and amount 90', 1, 1, '2022-08-18 08:01:43', '2022-08-18 08:01:43'),
(209, 'Modified Expense projection for overtime and amount 900', 1, 1, '2022-08-18 08:01:44', '2022-08-18 08:01:44'),
(210, 'Modified Expense projection for overtime and amount 9000', 1, 1, '2022-08-18 08:01:44', '2022-08-18 08:01:44'),
(211, 'Modified Expense projection for overtime and amount 90000', 1, 1, '2022-08-18 08:01:45', '2022-08-18 08:01:45'),
(212, 'Modified Expense projection for overtime and amount 900000', 1, 1, '2022-08-18 08:01:46', '2022-08-18 08:01:46'),
(213, 'Recorded an Expense of 1,300,000 and amount paid 1,300,000 spent on 2022-08-18', NULL, 1, '2022-08-18 08:05:46', '2022-08-18 08:05:46'),
(214, 'Paid fees for CHRISTIAN ELIKSEN and class P.1 and amount 100,000', 1, 1, '2022-08-18 08:07:56', '2022-08-18 08:07:56'),
(215, 'Added a new Expense Category Transport', 1, 1, '2022-08-18 08:23:12', '2022-08-18 08:23:12'),
(216, 'Recorded an Expense of 600,000 and amount paid 600,000 spent on 2022-09-14', NULL, 1, '2022-09-14 08:27:54', '2022-09-14 08:27:54'),
(217, 'Added a new Fees Item Uniform successfully ', 1, 1, '2022-09-14 08:40:21', '2022-09-14 08:40:21'),
(218, 'Paid fees for CHRISTIAN ELIKSEN and class P.1 and amount 300,000', 1, 1, '2022-09-15 16:46:59', '2022-09-15 16:46:59'),
(219, 'Added a new Fees Item Transport successfully ', 1, 1, '2022-09-15 16:48:04', '2022-09-15 16:48:04'),
(220, 'Added a new fee of Transport to class P.1 and term 1 and amount 400,000', 1, 1, '2022-09-15 16:50:42', '2022-09-15 16:50:42'),
(221, 'Edited Bursary Category Academic', 1, 1, '2022-09-15 16:59:36', '2022-09-15 16:59:36'),
(222, 'Added a bursary category Sports', 1, 1, '2022-09-15 17:00:22', '2022-09-15 17:00:22'),
(223, 'Added a bursary Sports to student CHRISTIAN ELIKSEN', 1, 1, '2022-09-15 17:00:50', '2022-09-15 17:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `bulk_s_m_s`
--

CREATE TABLE `bulk_s_m_s` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint NOT NULL,
  `class` bigint NOT NULL,
  `number` int NOT NULL,
  `type` int NOT NULL,
  `message` year NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bursaries`
--

CREATE TABLE `bursaries` (
  `id` bigint UNSIGNED NOT NULL,
  `sid` bigint NOT NULL,
  `class` bigint NOT NULL,
  `term` tinyint DEFAULT NULL,
  `year` year DEFAULT NULL,
  `bId` int NOT NULL,
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bursaries`
--

INSERT INTO `bursaries` (`id`, `sid`, `class`, `term`, `year`, `bId`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, '2022', 1, 1, 1, '2022-08-17 06:15:26', '2022-08-17 06:15:26'),
(2, 2, 1, 1, '2022', 2, 1, 1, '2022-08-17 08:18:39', '2022-08-17 08:18:39'),
(3, 4, 1, 1, '2022', 2, 1, 1, '2022-08-17 08:19:11', '2022-08-17 08:19:11'),
(4, 2, 1, 1, '2022', 4, 1, 1, '2022-09-15 17:00:50', '2022-09-15 17:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `bursary_categories`
--

CREATE TABLE `bursary_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bursary_categories`
--

INSERT INTO `bursary_categories` (`id`, `name`, `type`, `amount`, `description`, `status`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 'Academic', 2, NULL, NULL, 1, 1, 1, '2022-08-17 06:10:46', '2022-09-15 16:59:36'),
(2, 'Disabled Students', 2, NULL, 'Bursary for disabilities.', 1, 1, 1, '2022-08-17 06:11:52', '2022-08-17 06:11:52'),
(3, 'Uniform', 3, 50000, 'New students.', 1, 1, 1, '2022-08-17 06:29:37', '2022-08-17 06:29:37'),
(4, 'Sports', 3, 400000, NULL, 1, 1, 1, '2022-09-15 17:00:22', '2022-09-15 17:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `schoolId` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `short`, `user_id`, `level`, `status`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 'PRIMARY ONE', 'P.1', 1, 2, 1, 1, '2022-08-13 17:20:46', '2022-08-13 17:20:46'),
(2, 'PRIMARY TWO', 'P.2', 1, 2, 1, 1, '2022-08-13 17:21:13', '2022-08-13 17:21:13'),
(3, 'PRIMARY THREE', 'P.3', 1, 2, 1, 1, '2022-08-13 17:21:51', '2022-08-13 17:21:51'),
(4, 'PRIMARY FOUR', 'P.4', 1, 2, 1, 1, '2022-08-13 17:22:15', '2022-08-13 17:22:15'),
(5, 'PRIMARY FIVE', 'P.5', 1, 1, 1, 1, '2022-08-13 17:22:34', '2022-08-13 17:22:34'),
(6, 'PRIMARY SIX', 'P.6', 1, 1, 1, 1, '2022-08-13 17:23:54', '2022-08-13 17:23:54'),
(7, 'PRIMARY SEVEN', 'P.7', 1, 1, 1, 1, '2022-08-13 17:24:08', '2022-08-13 17:24:24'),
(8, 'PRIMARY TEST', 'P.T', 1, 1, 0, 1, '2022-08-13 17:24:45', '2022-08-13 17:24:52');

-- --------------------------------------------------------

--
-- Table structure for table `current_settings`
--

CREATE TABLE `current_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `term` tinyint DEFAULT NULL,
  `year` year DEFAULT NULL,
  `userId` int NOT NULL,
  `schoolId` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `current_settings`
--

INSERT INTO `current_settings` (`id`, `term`, `year`, `userId`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, '2022', 1, 1, '2022-08-13 17:44:08', '2022-08-13 17:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_students`
--

CREATE TABLE `enrolled_students` (
  `id` bigint UNSIGNED NOT NULL,
  `sid` bigint NOT NULL,
  `class` bigint NOT NULL,
  `stream` bigint DEFAULT NULL,
  `term` tinyint NOT NULL,
  `entry_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `residence` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` year NOT NULL,
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrolled_students`
--

INSERT INTO `enrolled_students` (`id`, `sid`, `class`, `stream`, `term`, `entry_status`, `residence`, `year`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '2', '1', '2022', 1, 1, '2022-08-13 18:10:59', '2022-08-13 18:10:59'),
(2, 2, 1, 2, 1, '1', '0', '2022', 1, 1, '2022-08-13 18:13:05', '2022-08-13 18:13:05'),
(3, 3, 1, 1, 1, '2', '1', '2022', 1, 1, '2022-08-13 18:15:01', '2022-08-13 18:15:01'),
(4, 4, 1, 1, 1, '1', '0', '2022', 1, 1, '2022-08-13 18:19:28', '2022-08-13 18:19:28'),
(5, 5, 1, 1, 1, '2', '1', '2022', 1, 1, '2022-08-13 18:22:04', '2022-08-13 18:22:04'),
(6, 6, 2, 3, 1, '1', '1', '2022', 1, 1, '2022-08-13 18:58:15', '2022-08-13 18:58:15'),
(7, 7, 2, 3, 1, '0', '0', '2022', 1, 1, '2022-08-13 18:58:15', '2022-08-13 18:58:15'),
(8, 8, 2, 4, 1, '0', '1', '2022', 1, 1, '2022-08-13 18:59:14', '2022-08-13 18:59:14'),
(9, 9, 2, 4, 1, '1', '1', '2022', 1, 1, '2022-08-13 18:59:14', '2022-08-13 18:59:14'),
(10, 10, 2, 4, 1, '0', '0', '2022', 1, 1, '2022-08-13 18:59:14', '2022-08-13 18:59:14'),
(11, 11, 3, 5, 1, '1', '1', '2022', 1, 1, '2022-08-13 19:13:10', '2022-08-13 19:13:10'),
(12, 12, 3, 5, 1, '0', '0', '2022', 1, 1, '2022-08-13 19:13:10', '2022-08-13 19:13:10'),
(13, 13, 3, 5, 1, '0', '0', '2022', 1, 1, '2022-08-13 19:13:10', '2022-08-13 19:13:10'),
(14, 14, 3, 5, 1, '1', '1', '2022', 1, 1, '2022-08-13 19:13:10', '2022-08-13 19:13:10'),
(15, 15, 3, 5, 1, '0', '0', '2022', 1, 1, '2022-08-13 19:13:10', '2022-08-13 19:13:10'),
(16, 16, 4, 7, 1, 'New', '1', '2022', 1, 1, '2022-08-14 07:41:19', '2022-08-14 07:41:19'),
(17, 17, 4, 8, 1, 'Continuing', '0', '2022', 1, 1, '2022-08-14 07:42:46', '2022-08-14 07:42:46'),
(18, 18, 4, 7, 1, 'New', '0', '2022', 1, 1, '2022-08-14 07:43:39', '2022-08-14 07:43:39'),
(19, 19, 4, 8, 1, 'New', '1', '2022', 1, 1, '2022-08-14 07:44:13', '2022-08-14 07:44:13'),
(20, 20, 4, 8, 1, 'Continuing', '0', '2022', 1, 1, '2022-08-14 08:07:56', '2022-08-14 08:07:56'),
(21, 21, 5, 9, 1, '1', '1', '2022', 1, 1, '2022-08-14 08:18:06', '2022-08-14 08:18:06'),
(22, 22, 5, 9, 1, '0', '0', '2022', 1, 1, '2022-08-14 08:18:06', '2022-08-14 08:18:06'),
(23, 23, 5, 10, 1, '0', '0', '2022', 1, 1, '2022-08-14 08:18:36', '2022-08-14 08:18:36'),
(24, 24, 5, 10, 1, '0', '0', '2022', 1, 1, '2022-08-14 08:18:36', '2022-08-14 08:18:36'),
(25, 25, 5, 10, 1, '1', '1', '2022', 1, 1, '2022-08-14 08:18:36', '2022-08-14 08:18:36'),
(26, 26, 6, 11, 1, '1', '1', '2022', 1, 1, '2022-08-14 08:24:37', '2022-08-14 08:24:37'),
(27, 27, 6, 11, 1, '0', '0', '2022', 1, 1, '2022-08-14 08:24:37', '2022-08-14 08:24:37'),
(28, 28, 6, 12, 1, '0', '0', '2022', 1, 1, '2022-08-14 08:25:03', '2022-08-14 08:25:03'),
(29, 29, 7, 13, 1, '1', '1', '2022', 1, 1, '2022-08-14 08:38:15', '2022-08-14 08:38:15'),
(30, 30, 7, 13, 1, '0', '0', '2022', 1, 1, '2022-08-14 08:38:15', '2022-08-14 08:38:15'),
(31, 31, 7, 13, 1, '0', '0', '2022', 1, 1, '2022-08-14 08:38:15', '2022-08-14 08:38:15'),
(32, 32, 7, 13, 1, '1', '1', '2022', 1, 1, '2022-08-14 08:38:15', '2022-08-14 08:38:15'),
(33, 33, 7, 13, 1, '0', '0', '2022', 1, 1, '2022-08-14 08:38:15', '2022-08-14 08:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `exam_comments`
--

CREATE TABLE `exam_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `term` int NOT NULL,
  `year` year NOT NULL,
  `stream` bigint NOT NULL,
  `class` bigint NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` bigint UNSIGNED NOT NULL,
  `sub` bigint NOT NULL,
  `type` bigint NOT NULL,
  `term` int NOT NULL,
  `year` year NOT NULL,
  `stream` bigint NOT NULL,
  `class` bigint NOT NULL,
  `marks` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` bigint DEFAULT NULL,
  `schoolId` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_marks`
--

INSERT INTO `exam_marks` (`id`, `sub`, `type`, `term`, `year`, `stream`, `class`, `marks`, `added_by`, `schoolId`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2022', 1, 1, '-1:10|-3:98|-4:86|-5:57', 1, 1, 1, '2022-08-14 18:07:39', '2022-09-15 16:01:49'),
(2, 1, 2, 1, '2022', 1, 1, '-1:65|-3:98|-4:56|-5:89', 1, 1, 1, '2022-08-14 18:07:39', '2022-08-15 02:42:21'),
(3, 1, 3, 1, '2022', 1, 1, '-1:65|-3:98|-4:62|-5:55', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-15 02:45:29'),
(4, 8, 1, 1, '2022', 1, 1, '-1:76|-3:94|-4:68|-5:78', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-14 18:29:03'),
(5, 8, 2, 1, '2022', 1, 1, '-1:85|-3:65|-4:46|-5:95', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-15 02:42:30'),
(6, 8, 3, 1, '2022', 1, 1, '-1:56|-3:65|-4:46|-5:90', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-15 02:44:50'),
(7, 15, 1, 1, '2022', 1, 1, '-1:86|-3:67|-4:83|-5:75', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-14 18:29:39'),
(8, 15, 2, 1, '2022', 1, 1, '-1:86|-3:81|-4:56|-5:62', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-15 02:43:00'),
(9, 15, 3, 1, '2022', 1, 1, '-1:80|-3:85|-4:68|-5:85', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-15 02:44:39'),
(10, 22, 1, 1, '2022', 1, 1, '-1:70|-3:69|-4:60|-5:77', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-14 18:30:01'),
(11, 22, 2, 1, '2022', 1, 1, '-1:52|-3:55|-4:91|-5:62', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-15 02:43:16'),
(12, 22, 3, 1, '2022', 1, 1, '-1:52|-3:55|-4:91|-5:62', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-15 02:44:10'),
(13, 1, 1, 1, '2022', 2, 1, '-2:78', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-14 18:28:24'),
(14, 1, 2, 1, '2022', 2, 1, '-2:56', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-15 02:42:11'),
(15, 1, 3, 1, '2022', 2, 1, '-2:52', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-15 02:45:07'),
(16, 8, 1, 1, '2022', 2, 1, '-2:68', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-14 18:29:12'),
(17, 8, 2, 1, '2022', 2, 1, '-2:56', 1, 1, 1, '2022-08-14 18:07:40', '2022-08-15 02:42:37'),
(18, 8, 3, 1, '2022', 2, 1, '-2:84', 1, 1, 1, '2022-08-14 18:07:41', '2022-08-15 02:45:01'),
(19, 15, 1, 1, '2022', 2, 1, '-2:91', 1, 1, 1, '2022-08-14 18:07:41', '2022-08-14 18:29:23'),
(20, 15, 2, 1, '2022', 2, 1, '-2:60', 1, 1, 1, '2022-08-14 18:07:41', '2022-08-15 02:42:42'),
(21, 15, 3, 1, '2022', 2, 1, '-2:60', 1, 1, 1, '2022-08-14 18:07:41', '2022-08-15 02:44:17'),
(22, 22, 1, 1, '2022', 2, 1, '-2:0', 1, 1, 1, '2022-08-14 18:07:41', '2022-08-14 18:07:41'),
(23, 22, 2, 1, '2022', 2, 1, '-2:85', 1, 1, 1, '2022-08-14 18:07:41', '2022-08-15 02:43:40'),
(24, 22, 3, 1, '2022', 2, 1, '-2:85', 1, 1, 1, '2022-08-14 18:07:41', '2022-08-15 02:43:57'),
(25, 2, 1, 1, '2022', 3, 2, '-6:64|-7:89', 1, 1, 1, '2022-08-14 18:30:25', '2022-08-14 18:31:54'),
(26, 2, 2, 1, '2022', 3, 2, '-6:0|-7:0', 1, 1, 1, '2022-08-14 18:30:25', '2022-08-14 18:30:25'),
(27, 2, 3, 1, '2022', 3, 2, '-6:0|-7:0', 1, 1, 1, '2022-08-14 18:30:25', '2022-08-14 18:30:25'),
(28, 9, 1, 1, '2022', 3, 2, '-6:53|-7:65', 1, 1, 1, '2022-08-14 18:30:25', '2022-08-14 18:32:40'),
(29, 9, 2, 1, '2022', 3, 2, '-6:0|-7:0', 1, 1, 1, '2022-08-14 18:30:25', '2022-08-14 18:30:25'),
(30, 9, 3, 1, '2022', 3, 2, '-6:0|-7:0', 1, 1, 1, '2022-08-14 18:30:25', '2022-08-14 18:30:25'),
(31, 16, 1, 1, '2022', 3, 2, '-6:58|-7:95', 1, 1, 1, '2022-08-14 18:30:25', '2022-08-14 18:32:50'),
(32, 16, 2, 1, '2022', 3, 2, '-6:0|-7:0', 1, 1, 1, '2022-08-14 18:30:25', '2022-08-14 18:30:25'),
(33, 16, 3, 1, '2022', 3, 2, '-6:0|-7:0', 1, 1, 1, '2022-08-14 18:30:25', '2022-08-14 18:30:25'),
(34, 23, 1, 1, '2022', 3, 2, '-6:68|-7:86', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:33:25'),
(35, 23, 2, 1, '2022', 3, 2, '-6:0|-7:0', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:30:26'),
(36, 23, 3, 1, '2022', 3, 2, '-6:0|-7:0', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:30:26'),
(37, 2, 1, 1, '2022', 4, 2, '-8:75|-9:68|-10:88', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:32:06'),
(38, 2, 2, 1, '2022', 4, 2, '-8:0|-9:0|-10:0', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:30:26'),
(39, 2, 3, 1, '2022', 4, 2, '-8:0|-9:0|-10:0', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:30:26'),
(40, 9, 1, 1, '2022', 4, 2, '-8:86|-9:97|-10:87', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:32:24'),
(41, 9, 2, 1, '2022', 4, 2, '-8:0|-9:0|-10:0', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:30:26'),
(42, 9, 3, 1, '2022', 4, 2, '-8:0|-9:0|-10:0', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:30:26'),
(43, 16, 1, 1, '2022', 4, 2, '-8:87|-9:85|-10:56', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:33:03'),
(44, 16, 2, 1, '2022', 4, 2, '-8:0|-9:0|-10:0', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:30:26'),
(45, 16, 3, 1, '2022', 4, 2, '-8:0|-9:0|-10:0', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:30:26'),
(46, 23, 1, 1, '2022', 4, 2, '-8:98|-9:85|-10:85', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:33:38'),
(47, 23, 2, 1, '2022', 4, 2, '-8:0|-9:0|-10:0', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:30:26'),
(48, 23, 3, 1, '2022', 4, 2, '-8:0|-9:0|-10:0', 1, 1, 1, '2022-08-14 18:30:26', '2022-08-14 18:30:26'),
(49, 3, 1, 1, '2022', 5, 3, '-11:89|-12:80|-13:60|-14:76|-15:80', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:34:29'),
(50, 3, 2, 1, '2022', 5, 3, '-11:98|-12:96|-13:0|-14:0|-15:0', 1, 1, 1, '2022-08-14 18:33:59', '2022-09-14 08:53:31'),
(51, 3, 3, 1, '2022', 5, 3, '-11:0|-12:0|-13:0|-14:0|-15:0', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:33:59'),
(52, 10, 1, 1, '2022', 5, 3, '-11:56|-12:68|-13:78|-14:90|-15:85', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:37:39'),
(53, 10, 2, 1, '2022', 5, 3, '-11:0|-12:0|-13:0|-14:0|-15:0', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:33:59'),
(54, 10, 3, 1, '2022', 5, 3, '-11:0|-12:0|-13:0|-14:0|-15:0', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:33:59'),
(55, 17, 1, 1, '2022', 5, 3, '-11:85|-12:79|-13:56|-14:68|-15:98', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:38:09'),
(56, 17, 2, 1, '2022', 5, 3, '-11:0|-12:0|-13:0|-14:0|-15:0', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:33:59'),
(57, 17, 3, 1, '2022', 5, 3, '-11:0|-12:0|-13:0|-14:0|-15:0', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:33:59'),
(58, 24, 1, 1, '2022', 5, 3, '-11:86|-12:54|-13:65|-14:73|-15:80', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:38:31'),
(59, 24, 2, 1, '2022', 5, 3, '-11:0|-12:0|-13:0|-14:0|-15:0', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:33:59'),
(60, 24, 3, 1, '2022', 5, 3, '-11:0|-12:0|-13:0|-14:0|-15:0', 1, 1, 1, '2022-08-14 18:33:59', '2022-08-14 18:33:59'),
(61, 4, 1, 1, '2022', 7, 4, '-16:68|-18:88', 1, 1, 1, '2022-08-14 18:38:43', '2022-08-14 18:38:56'),
(62, 4, 2, 1, '2022', 7, 4, '-16:0|-18:0', 1, 1, 1, '2022-08-14 18:38:43', '2022-08-14 18:38:43'),
(63, 4, 3, 1, '2022', 7, 4, '-16:0|-18:0', 1, 1, 1, '2022-08-14 18:38:43', '2022-08-14 18:38:43'),
(64, 11, 1, 1, '2022', 7, 4, '-16:57|-18:68', 1, 1, 1, '2022-08-14 18:38:43', '2022-08-14 18:39:30'),
(65, 11, 2, 1, '2022', 7, 4, '-16:0|-18:0', 1, 1, 1, '2022-08-14 18:38:43', '2022-08-14 18:38:43'),
(66, 11, 3, 1, '2022', 7, 4, '-16:0|-18:0', 1, 1, 1, '2022-08-14 18:38:43', '2022-08-14 18:38:43'),
(67, 18, 1, 1, '2022', 7, 4, '-16:86|-18:84', 1, 1, 1, '2022-08-14 18:38:43', '2022-08-14 18:39:49'),
(68, 18, 2, 1, '2022', 7, 4, '-16:0|-18:0', 1, 1, 1, '2022-08-14 18:38:43', '2022-08-14 18:38:43'),
(69, 18, 3, 1, '2022', 7, 4, '-16:0|-18:0', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:38:44'),
(70, 25, 1, 1, '2022', 7, 4, '-16:64|-18:75', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:40:54'),
(71, 25, 2, 1, '2022', 7, 4, '-16:0|-18:0', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:38:44'),
(72, 25, 3, 1, '2022', 7, 4, '-16:0|-18:0', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:38:44'),
(73, 4, 1, 1, '2022', 8, 4, '-17:88|-19:55|-20:77', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:39:06'),
(74, 4, 2, 1, '2022', 8, 4, '-17:0|-19:0|-20:0', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:38:44'),
(75, 4, 3, 1, '2022', 8, 4, '-17:0|-19:0|-20:0', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:38:44'),
(76, 11, 1, 1, '2022', 8, 4, '-17:94|-19:84|-20:69', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:39:20'),
(77, 11, 2, 1, '2022', 8, 4, '-17:0|-19:0|-20:0', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:38:44'),
(78, 11, 3, 1, '2022', 8, 4, '-17:0|-19:0|-20:0', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:38:44'),
(79, 18, 1, 1, '2022', 8, 4, '-17:66|-19:77|-20:68', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:40:36'),
(80, 18, 2, 1, '2022', 8, 4, '-17:0|-19:0|-20:0', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:38:44'),
(81, 18, 3, 1, '2022', 8, 4, '-17:0|-19:0|-20:0', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:38:44'),
(82, 25, 1, 1, '2022', 8, 4, '-17:84|-19:73|-20:68', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:41:30'),
(83, 25, 2, 1, '2022', 8, 4, '-17:0|-19:0|-20:0', 1, 1, 1, '2022-08-14 18:38:44', '2022-08-14 18:38:44'),
(84, 25, 3, 1, '2022', 8, 4, '-17:0|-19:0|-20:0', 1, 1, 1, '2022-08-14 18:38:45', '2022-08-14 18:38:45'),
(85, 5, 1, 1, '2022', 9, 5, '-21:85|-22:76', 1, 1, 1, '2022-08-14 18:41:50', '2022-08-14 18:42:06'),
(86, 5, 2, 1, '2022', 9, 5, '-21:0|-22:0', 1, 1, 1, '2022-08-14 18:41:50', '2022-08-14 18:41:50'),
(87, 5, 3, 1, '2022', 9, 5, '-21:0|-22:0', 1, 1, 1, '2022-08-14 18:41:50', '2022-08-14 18:41:50'),
(88, 12, 1, 1, '2022', 9, 5, '-21:87|-22:79', 1, 1, 1, '2022-08-14 18:41:50', '2022-08-14 18:42:32'),
(89, 12, 2, 1, '2022', 9, 5, '-21:0|-22:0', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:41:51'),
(90, 12, 3, 1, '2022', 9, 5, '-21:0|-22:0', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:41:51'),
(91, 19, 1, 1, '2022', 9, 5, '-21:69|-22:79', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:43:16'),
(92, 19, 2, 1, '2022', 9, 5, '-21:0|-22:0', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:41:51'),
(93, 19, 3, 1, '2022', 9, 5, '-21:0|-22:0', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:41:51'),
(94, 26, 1, 1, '2022', 9, 5, '-21:72|-22:65', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:44:06'),
(95, 26, 2, 1, '2022', 9, 5, '-21:0|-22:0', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:41:51'),
(96, 26, 3, 1, '2022', 9, 5, '-21:0|-22:0', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:41:51'),
(97, 5, 1, 1, '2022', 10, 5, '-23:68|-24:83|-25:81', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:42:18'),
(98, 5, 2, 1, '2022', 10, 5, '-23:0|-24:0|-25:0', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:41:51'),
(99, 5, 3, 1, '2022', 10, 5, '-23:0|-24:0|-25:0', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:41:51'),
(100, 12, 1, 1, '2022', 10, 5, '-23:88|-24:59|-25:85', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:42:48'),
(101, 12, 2, 1, '2022', 10, 5, '-23:0|-24:0|-25:0', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:41:51'),
(102, 12, 3, 1, '2022', 10, 5, '-23:0|-24:0|-25:0', 1, 1, 1, '2022-08-14 18:41:51', '2022-08-14 18:41:51'),
(103, 19, 1, 1, '2022', 10, 5, '-23:89|-24:87|-25:96', 1, 1, 1, '2022-08-14 18:41:52', '2022-08-14 18:43:39'),
(104, 19, 2, 1, '2022', 10, 5, '-23:0|-24:0|-25:0', 1, 1, 1, '2022-08-14 18:41:52', '2022-08-14 18:41:52'),
(105, 19, 3, 1, '2022', 10, 5, '-23:0|-24:0|-25:0', 1, 1, 1, '2022-08-14 18:41:52', '2022-08-14 18:41:52'),
(106, 26, 1, 1, '2022', 10, 5, '-23:94|-24:87|-25:56', 1, 1, 1, '2022-08-14 18:41:52', '2022-08-14 18:44:17'),
(107, 26, 2, 1, '2022', 10, 5, '-23:0|-24:0|-25:0', 1, 1, 1, '2022-08-14 18:41:52', '2022-08-14 18:41:52'),
(108, 26, 3, 1, '2022', 10, 5, '-23:0|-24:0|-25:0', 1, 1, 1, '2022-08-14 18:41:52', '2022-08-14 18:41:52'),
(109, 6, 1, 1, '2022', 11, 6, '-26:86|-27:88', 1, 1, 1, '2022-08-14 18:44:25', '2022-08-14 18:44:58'),
(110, 6, 2, 1, '2022', 11, 6, '-26:0|-27:0', 1, 1, 1, '2022-08-14 18:44:26', '2022-08-14 18:44:26'),
(111, 6, 3, 1, '2022', 11, 6, '-26:0|-27:0', 1, 1, 1, '2022-08-14 18:44:26', '2022-08-14 18:44:26'),
(112, 13, 1, 1, '2022', 11, 6, '-26:86|-27:85', 1, 1, 1, '2022-08-14 18:44:26', '2022-08-14 18:45:21'),
(113, 13, 2, 1, '2022', 11, 6, '-26:0|-27:0', 1, 1, 1, '2022-08-14 18:44:26', '2022-08-14 18:44:26'),
(114, 13, 3, 1, '2022', 11, 6, '-26:0|-27:0', 1, 1, 1, '2022-08-14 18:44:26', '2022-08-14 18:44:26'),
(115, 20, 1, 1, '2022', 11, 6, '-26:69|-27:86', 1, 1, 1, '2022-08-14 18:44:26', '2022-08-14 18:45:42'),
(116, 20, 2, 1, '2022', 11, 6, '-26:0|-27:0', 1, 1, 1, '2022-08-14 18:44:26', '2022-08-14 18:44:26'),
(117, 20, 3, 1, '2022', 11, 6, '-26:0|-27:0', 1, 1, 1, '2022-08-14 18:44:26', '2022-08-14 18:44:26'),
(118, 27, 1, 1, '2022', 11, 6, '-26:82|-27:90', 1, 1, 1, '2022-08-14 18:44:26', '2022-08-14 18:46:14'),
(119, 27, 2, 1, '2022', 11, 6, '-26:0|-27:0', 1, 1, 1, '2022-08-14 18:44:26', '2022-08-14 18:44:26'),
(120, 27, 3, 1, '2022', 11, 6, '-26:0|-27:0', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:44:27'),
(121, 6, 1, 1, '2022', 12, 6, '-28:98', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:45:07'),
(122, 6, 2, 1, '2022', 12, 6, '-28:0', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:44:27'),
(123, 6, 3, 1, '2022', 12, 6, '-28:0', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:44:27'),
(124, 13, 1, 1, '2022', 12, 6, '-28:78', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:45:12'),
(125, 13, 2, 1, '2022', 12, 6, '-28:0', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:44:27'),
(126, 13, 3, 1, '2022', 12, 6, '-28:0', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:44:27'),
(127, 20, 1, 1, '2022', 12, 6, '-28:87', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:45:30'),
(128, 20, 2, 1, '2022', 12, 6, '-28:0', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:44:27'),
(129, 20, 3, 1, '2022', 12, 6, '-28:0', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:44:27'),
(130, 27, 1, 1, '2022', 12, 6, '-28:87', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:45:53'),
(131, 27, 2, 1, '2022', 12, 6, '-28:0', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:44:27'),
(132, 27, 3, 1, '2022', 12, 6, '-28:0', 1, 1, 1, '2022-08-14 18:44:27', '2022-08-14 18:44:27'),
(133, 7, 1, 1, '2022', 13, 7, '-29:85|-30:70|-31:77|-32:59|-33:61', 1, 1, 1, '2022-08-14 18:46:21', '2022-08-14 18:46:50'),
(134, 7, 2, 1, '2022', 13, 7, '-29:0|-30:0|-31:0|-32:0|-33:0', 1, 1, 1, '2022-08-14 18:46:21', '2022-08-14 18:46:21'),
(135, 7, 3, 1, '2022', 13, 7, '-29:0|-30:0|-31:0|-32:0|-33:0', 1, 1, 1, '2022-08-14 18:46:21', '2022-08-14 18:46:21'),
(136, 14, 1, 1, '2022', 13, 7, '-29:84|-30:65|-31:87|-32:86|-33:88', 1, 1, 1, '2022-08-14 18:46:22', '2022-08-14 18:47:13'),
(137, 14, 2, 1, '2022', 13, 7, '-29:0|-30:0|-31:0|-32:0|-33:0', 1, 1, 1, '2022-08-14 18:46:22', '2022-08-14 18:46:22'),
(138, 14, 3, 1, '2022', 13, 7, '-29:0|-30:0|-31:0|-32:0|-33:0', 1, 1, 1, '2022-08-14 18:46:22', '2022-08-14 18:46:22'),
(139, 21, 1, 1, '2022', 13, 7, '-29:84|-30:86|-31:80|-32:94|-33:68', 1, 1, 1, '2022-08-14 18:46:22', '2022-08-14 18:47:51'),
(140, 21, 2, 1, '2022', 13, 7, '-29:0|-30:0|-31:0|-32:0|-33:0', 1, 1, 1, '2022-08-14 18:46:22', '2022-08-14 18:46:22'),
(141, 21, 3, 1, '2022', 13, 7, '-29:0|-30:0|-31:0|-32:0|-33:0', 1, 1, 1, '2022-08-14 18:46:22', '2022-08-14 18:46:22'),
(142, 28, 1, 1, '2022', 13, 7, '-29:86|-30:69|-31:76|-32:76|-33:68', 1, 1, 1, '2022-08-14 18:46:22', '2022-08-14 18:48:11'),
(143, 28, 2, 1, '2022', 13, 7, '-29:0|-30:0|-31:0|-32:0|-33:0', 1, 1, 1, '2022-08-14 18:46:22', '2022-08-14 18:46:22'),
(144, 28, 3, 1, '2022', 13, 7, '-29:0|-30:0|-31:0|-32:0|-33:0', 1, 1, 1, '2022-08-14 18:46:23', '2022-08-14 18:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `exemptions`
--

CREATE TABLE `exemptions` (
  `id` bigint UNSIGNED NOT NULL,
  `sid` bigint NOT NULL,
  `class` bigint NOT NULL,
  `term` tinyint DEFAULT NULL,
  `year` year DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exemptions`
--

INSERT INTO `exemptions` (`id`, `sid`, `class`, `term`, `year`, `amount`, `reason`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2022', 50000, 'Staff Member Child', 1, 1, '2022-08-17 06:32:08', '2022-08-17 06:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `fyearId` bigint NOT NULL,
  `total` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `mode` bigint NOT NULL,
  `supplier` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `fyearId`, `total`, `paid`, `date`, `mode`, `supplier`, `userId`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, 500000, 500000, '2022-08-17', 1, '1', 1, 1, '2022-08-17 07:37:29', '2022-08-17 07:37:29'),
(2, 1, 1000000, 1000000, '2022-08-17', 1, '2', 1, 1, '2022-08-17 07:39:03', '2022-08-17 07:39:03'),
(3, 1, 1300000, 1300000, '2022-08-18', 2, '2', 1, 1, '2022-08-18 08:05:45', '2022-08-18 08:05:45'),
(4, 1, 600000, 600000, '2022-09-14', 1, '1', 1, 1, '2022-09-14 08:27:53', '2022-09-14 08:27:53');

-- --------------------------------------------------------

--
-- Table structure for table `expense_carts`
--

CREATE TABLE `expense_carts` (
  `id` bigint UNSIGNED NOT NULL,
  `itemId` bigint NOT NULL,
  `amount` double DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_details`
--

CREATE TABLE `expense_details` (
  `id` bigint UNSIGNED NOT NULL,
  `expId` bigint NOT NULL,
  `itemId` bigint NOT NULL,
  `amount` double DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fyearId` bigint NOT NULL,
  `userId` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_details`
--

INSERT INTO `expense_details` (`id`, `expId`, `itemId`, `amount`, `description`, `fyearId`, `userId`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 500000, 'Bought Posho', 1, 1, 1, '2022-08-17 07:37:29', '2022-08-17 07:37:29'),
(2, 2, 2, 1000000, 'Bought 5 bags of sugar.', 1, 1, 1, '2022-08-17 07:39:03', '2022-08-17 07:39:03'),
(3, 3, 2, 500000, 'staff sugar', 1, 1, 1, '2022-08-18 08:05:45', '2022-08-18 08:05:45'),
(4, 3, 3, 800000, 'brian', 1, 1, 1, '2022-08-18 08:05:45', '2022-08-18 08:05:45'),
(5, 4, 1, 400000, 'jyhtgrf', 1, 1, 1, '2022-09-14 08:27:54', '2022-09-14 08:27:54'),
(6, 4, 2, 200000, 'gnnh', 1, 1, 1, '2022-09-14 08:27:54', '2022-09-14 08:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

CREATE TABLE `exp_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `userId` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_categories`
--

INSERT INTO `exp_categories` (`id`, `name`, `status`, `userId`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 'Staff Payments', 1, 1, 1, '2022-08-17 07:06:36', '2022-08-17 07:06:36'),
(2, 'Staff Welfare.', 1, 1, 1, '2022-08-17 07:07:00', '2022-08-17 07:07:00'),
(3, 'Transport', 1, 1, 1, '2022-08-18 08:23:12', '2022-08-18 08:23:12');

-- --------------------------------------------------------

--
-- Table structure for table `exp_items`
--

CREATE TABLE `exp_items` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoryId` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `userId` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_items`
--

INSERT INTO `exp_items` (`id`, `name`, `categoryId`, `status`, `userId`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 'Food', 2, 1, 1, 1, '2022-08-17 07:07:19', '2022-08-17 07:07:19'),
(2, 'Sugar', 2, 1, 1, 1, '2022-08-17 07:07:34', '2022-08-17 07:07:34'),
(3, 'Salary', 1, 1, 1, 1, '2022-08-17 07:10:19', '2022-08-17 07:10:19'),
(4, 'overtime', 1, 1, 1, 1, '2022-08-18 08:01:08', '2022-08-18 08:01:08');

-- --------------------------------------------------------

--
-- Table structure for table `exp_projections`
--

CREATE TABLE `exp_projections` (
  `id` bigint UNSIGNED NOT NULL,
  `itemId` bigint NOT NULL,
  `fyearId` bigint NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `userId` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_projections`
--

INSERT INTO `exp_projections` (`id`, `itemId`, `fyearId`, `amount`, `status`, `userId`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 2000000, 0, 1, 1, '2022-08-17 07:12:09', '2022-08-17 07:12:21'),
(2, 1, 1, 5000000, 0, 1, 1, '2022-08-17 07:12:25', '2022-08-17 07:12:32'),
(3, 2, 1, 2000000, 0, 1, 1, '2022-08-17 07:12:36', '2022-08-17 07:12:44'),
(4, 4, 1, 900000, 0, 1, 1, '2022-08-18 08:01:42', '2022-08-18 08:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_items`
--

CREATE TABLE `fees_items` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `schoolId` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees_items`
--

INSERT INTO `fees_items` (`id`, `name`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 'Fees', 1, 1, '2022-08-17 05:39:45', '2022-08-17 05:39:45'),
(2, 'School Trip', 1, 1, '2022-08-17 05:40:50', '2022-08-17 05:40:50'),
(3, 'Feeding', 1, 1, '2022-08-17 05:41:05', '2022-08-17 05:41:05'),
(4, 'Uniform', 1, 1, '2022-09-14 08:40:21', '2022-09-14 08:40:21'),
(5, 'Transport', 1, 1, '2022-09-15 16:48:03', '2022-09-15 16:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `fees_payments`
--

CREATE TABLE `fees_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `sid` bigint NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `pbalance` double NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `class` bigint NOT NULL,
  `term` double DEFAULT NULL,
  `year` year DEFAULT NULL,
  `mode` int NOT NULL,
  `slip` int DEFAULT NULL,
  `rec` int DEFAULT NULL,
  `receipt` bigint DEFAULT NULL,
  `paidBy` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees_payments`
--

INSERT INTO `fees_payments` (`id`, `sid`, `amount`, `pbalance`, `date`, `class`, `term`, `year`, `mode`, `slip`, `rec`, `receipt`, `paidBy`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, 500000, 0, '2022-08-17', 1, 1, '2022', 1, 56874, 1, 2022081, 'Lydia', 1, 1, '2022-08-17 06:45:36', '2022-08-17 06:45:36'),
(2, 2, 100000, 0, '2022-08-18', 1, 1, '2022', 2, 5885, 2, 2022082, 'null', 1, 1, '2022-08-18 08:07:55', '2022-08-18 08:07:55'),
(3, 2, 300000, 0, '2022-09-15', 1, 1, '2022', 2, 4587, 3, 2022093, 'Brian', 1, 1, '2022-09-15 16:46:59', '2022-09-15 16:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `fees_settings`
--

CREATE TABLE `fees_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `item_id` bigint NOT NULL,
  `amount` int NOT NULL,
  `class` int NOT NULL,
  `term` tinyint DEFAULT NULL,
  `residence` tinyint(1) DEFAULT NULL,
  `entry` tinyint DEFAULT NULL,
  `year` year DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees_settings`
--

INSERT INTO `fees_settings` (`id`, `item_id`, `amount`, `class`, `term`, `residence`, `entry`, `year`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, 500000, 1, 1, 3, 3, '2022', 1, 1, '2022-08-17 05:42:22', '2022-08-17 05:42:22'),
(2, 1, 500000, 2, 1, 3, 3, '2022', 1, 1, '2022-08-17 05:42:22', '2022-08-17 05:42:22'),
(3, 1, 500000, 3, 1, 3, 3, '2022', 1, 1, '2022-08-17 05:42:22', '2022-08-17 05:42:22'),
(4, 1, 500000, 4, 1, 3, 3, '2022', 1, 1, '2022-08-17 05:42:22', '2022-08-17 05:42:22'),
(5, 1, 500000, 5, 1, 3, 3, '2022', 1, 1, '2022-08-17 05:42:22', '2022-08-17 05:42:22'),
(6, 1, 500000, 6, 1, 3, 3, '2022', 1, 1, '2022-08-17 05:42:22', '2022-08-17 05:42:22'),
(7, 1, 500000, 7, 1, 3, 3, '2022', 1, 1, '2022-08-17 05:42:22', '2022-08-17 05:42:22'),
(8, 2, 200000, 7, 1, 3, 3, '2022', 1, 1, '2022-08-17 06:07:29', '2022-08-17 06:07:29'),
(9, 3, 100000, 1, 1, 3, 3, '2022', 1, 1, '2022-08-17 06:08:18', '2022-08-17 06:08:18'),
(10, 3, 100000, 2, 1, 3, 3, '2022', 1, 1, '2022-08-17 06:08:18', '2022-08-17 06:08:18'),
(11, 3, 100000, 3, 1, 3, 3, '2022', 1, 1, '2022-08-17 06:08:18', '2022-08-17 06:08:18'),
(12, 3, 100000, 4, 1, 3, 3, '2022', 1, 1, '2022-08-17 06:08:18', '2022-08-17 06:08:18'),
(13, 3, 100000, 5, 1, 3, 3, '2022', 1, 1, '2022-08-17 06:08:18', '2022-08-17 06:08:18'),
(14, 3, 100000, 6, 1, 3, 3, '2022', 1, 1, '2022-08-17 06:08:18', '2022-08-17 06:08:18'),
(15, 3, 100000, 7, 1, 3, 3, '2022', 1, 1, '2022-08-17 06:08:18', '2022-08-17 06:08:18'),
(16, 5, 400000, 2, 1, 1, 3, '2022', 1, 1, '2022-09-15 16:50:42', '2022-09-15 16:50:42'),
(17, 5, 400000, 1, 1, 1, 3, '2022', 1, 1, '2022-09-15 16:50:42', '2022-09-15 16:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `financial_years`
--

CREATE TABLE `financial_years` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `financial_years`
--

INSERT INTO `financial_years` (`id`, `name`, `start`, `end`, `status`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, '2022 TERM 2', '2022-01-01', '2022-12-31', 1, 1, 1, '2022-08-03 20:07:39', '2022-08-03 20:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `range_from` int DEFAULT NULL,
  `range_to` int DEFAULT NULL,
  `grade_value` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `user_id` int DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `full_name`, `grade_number`, `default_comm`, `range_from`, `range_to`, `grade_value`, `status`, `user_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'DISTINCTION ONE', 'D1', 'Excellent Performance.', 100, 80, 1, 1, 1, 1, '2022-08-14 09:59:39', '2022-08-14 09:59:39'),
(2, 'DISTINCTION TWO', 'D2', 'Very Good Performance.', 79, 75, 2, 1, 1, 1, '2022-08-14 10:00:45', '2022-08-14 10:00:45'),
(3, 'CREDIT 3', 'C3', 'Good Performance.', 74, 70, 3, 1, 1, 1, '2022-08-14 10:28:13', '2022-08-14 10:28:13'),
(4, 'CREDIT 4', 'C4', 'Good Performance, need more effort.', 69, 65, 4, 1, 1, 1, '2022-08-14 10:32:46', '2022-08-14 10:32:46'),
(5, 'CREDIT 5', 'C5', 'Average Performance.', 64, 60, 5, 1, 1, 1, '2022-08-14 10:33:45', '2022-08-14 10:33:45'),
(6, 'CREDIT 6', 'C6', 'Aim at good grades.', 59, 55, 6, 1, 1, 1, '2022-08-14 10:34:31', '2022-08-14 10:34:31'),
(7, 'PASS 7', 'P7', 'Poor Performance.', 54, 45, 7, 1, 1, 1, '2022-08-14 10:35:41', '2022-08-14 10:35:41'),
(8, 'PASS 8', 'P8', 'Failed.', 44, 35, 8, 1, 1, 1, '2022-08-14 10:36:20', '2022-08-14 10:36:20'),
(9, 'FAILED 9', 'F9', 'Failed.', 34, 0, 9, 1, 1, 1, '2022-08-14 10:36:49', '2022-08-14 10:36:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_10_12_153946_create_savings_table', 1),
(6, '2021_12_11_191918_create_positions_table', 2),
(7, '2021_12_11_195312_create_audits_table', 2),
(8, '2021_12_14_172637_create_staff_table', 2),
(9, '2021_12_31_093452_create_students_table', 3),
(10, '2021_12_31_094220_create_schools_table', 3),
(11, '2022_01_06_153615_create_classes_table', 4),
(12, '2022_01_06_161437_create_streams_table', 4),
(13, '2022_01_06_161542_create_subjects_table', 4),
(14, '2022_02_01_202610_create_grades_table', 4),
(15, '2022_02_05_184224_create_test_sets_table', 5),
(16, '2022_02_06_124524_create_test_set_considerations_table', 5),
(17, '2022_02_06_125202_create_test_set_contributions_table', 5),
(18, '2022_02_20_124613_create_teaches_table', 6),
(19, '2022_02_20_142113_create_permissions_table', 6),
(20, '2022_02_25_200233_create_exam_marks_table', 7),
(21, '2022_03_13_101934_create_fees_items_table', 8),
(22, '2022_03_13_102300_create_fees_settings_table', 8),
(23, '2022_03_15_192402_create_modes_table', 8),
(24, '2022_03_15_192642_create_transactions_table', 8),
(25, '2022_03_18_194834_create_fees_payments_table', 8),
(26, '2022_03_19_141540_create_exemptions_table', 8),
(27, '2022_03_20_182641_create_bursary_categories_table', 9),
(28, '2022_03_20_183132_create_bursaries_table', 9),
(29, '2022_04_05_123828_create_enrolled_students_table', 9),
(30, '2022_03_27_141129_create_additional_fees_table', 10),
(31, '2022_04_06_195336_create_financial_years_table', 10),
(32, '2022_04_07_195712_create_rev_categories_table', 10),
(33, '2022_04_07_195930_create_exp_categories_table', 10),
(34, '2022_04_07_195945_create_exp_items_table', 10),
(35, '2022_04_07_200010_create_exp_projections_table', 10),
(36, '2022_04_07_200026_create_rev_projections_table', 10),
(37, '2022_04_07_200040_create_revenues_table', 10),
(38, '2022_04_07_200054_create_expenses_table', 10),
(39, '2022_04_07_201508_create_expense_carts_table', 10),
(40, '2022_04_07_201521_create_expense_details_table', 10),
(41, '2022_05_05_185419_create_suppliers_table', 10),
(42, '2022_06_18_232702_create_exam_comments_table', 11),
(43, '2022_06_17_215936_create_current_settings_table', 12),
(44, '2022_06_30_085341_create_previous_debts_table', 12),
(45, '2022_07_30_092936_create_pass_marks_table', 13),
(46, '2022_08_24_214633_create_bulk_s_m_s_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `modes`
--

CREATE TABLE `modes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` bigint DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modes`
--

INSERT INTO `modes` (`id`, `name`, `type`, `type_name`, `account_number`, `status`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 'BEN WHITE', 'mobile', 'MTN', 781076109, 1, 1, 1, '2022-08-13 17:40:52', '2022-08-13 17:40:52'),
(2, 'BRYAN AUSTIN', 'bank', 'EQUITY', 10004586953215, 1, 1, 1, '2022-08-13 17:41:54', '2022-08-13 17:41:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pass_marks`
--

CREATE TABLE `pass_marks` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `class` bigint NOT NULL,
  `mark_type` int NOT NULL,
  `marks` int NOT NULL,
  `year` year NOT NULL,
  `schoolId` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pass_marks`
--

INSERT INTO `pass_marks` (`id`, `user_id`, `class`, `mark_type`, `marks`, `year`, `schoolId`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 15, '2022', 1, 1, '2022-08-14 10:38:44', '2022-08-14 10:38:44'),
(2, 1, 2, 1, 15, '2022', 1, 1, '2022-08-14 10:38:50', '2022-08-14 10:38:50'),
(3, 1, 3, 1, 15, '2022', 1, 1, '2022-08-14 10:38:54', '2022-08-14 10:38:54'),
(4, 1, 4, 1, 15, '2022', 1, 1, '2022-08-14 10:38:58', '2022-08-14 10:38:58'),
(5, 1, 5, 1, 15, '2022', 1, 1, '2022-08-14 10:39:02', '2022-08-14 10:39:02'),
(6, 1, 6, 1, 17, '2022', 1, 1, '2022-08-14 10:39:06', '2022-09-15 15:37:10'),
(7, 1, 7, 1, 15, '2022', 1, 1, '2022-08-14 10:39:09', '2022-08-14 10:39:09');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, 'App\\User', 3, 'App-token', '8c9a98413ea1d14e66e1ceaa144532e675cb2f3d22468231b263c8923bb98618', '[\"*\"]', NULL, '2022-01-02 16:42:41', '2022-01-02 16:42:41'),
(2, 'App\\User', 3, 'App-token', 'a0864b429c1ca45dafac976a5f6b1036fa886f550684f233b1bf9f8ae5802fc5', '[\"*\"]', NULL, '2022-01-02 16:42:57', '2022-01-02 16:42:57'),
(3, 'App\\User', 3, 'App-token', '27ab4d2e341916d6fa834beae36bbb93262f925d950e8f58232c0b8031661c45', '[\"*\"]', NULL, '2022-01-02 16:43:43', '2022-01-02 16:43:43'),
(4, 'App\\User', 3, 'App-token', 'eb8140928a2ca951466a31a4db32aea429eab3ccac14312d1cc6fd13158ae824', '[\"*\"]', NULL, '2022-01-02 16:50:48', '2022-01-02 16:50:48'),
(5, 'App\\User', 1, 'App-token', 'a7e683906deacf8119ef5bf37673c539caed36927b4988a82820186f20b59467', '[\"*\"]', NULL, '2022-01-02 17:39:14', '2022-01-02 17:39:14'),
(6, 'App\\User', 1, 'App-token', 'b7af1d906bb28b74b9ab001bbefd816e795b70b4031feb38f64a2153cbe59656', '[\"*\"]', NULL, '2022-01-02 17:43:53', '2022-01-02 17:43:53'),
(7, 'App\\User', 1, 'App-token', '6ea695a3ff05128181395e76dcc532417894a6ea67dcf33e79c0ccb49ac0b8c7', '[\"*\"]', NULL, '2022-01-02 17:44:21', '2022-01-02 17:44:21'),
(8, 'App\\User', 1, 'App-token', 'b70ff87b5f708b68b34c73233ae2347e19216208d44321cdb491f8568b93312f', '[\"*\"]', NULL, '2022-01-02 17:45:01', '2022-01-02 17:45:01'),
(9, 'App\\User', 1, 'App-token', 'c7868b8745dd9ba5e2c63d24f3b63bf4f225f7edfdf2c16f7b91b4c29340904c', '[\"*\"]', NULL, '2022-01-02 17:46:12', '2022-01-02 17:46:12'),
(10, 'App\\User', 1, 'App-token', 'e2f5722d82c8b8e879f5c1e3b1c7b148d9347b21bd583c033a0c129a8beb923c', '[\"*\"]', NULL, '2022-01-02 18:08:37', '2022-01-02 18:08:37'),
(11, 'App\\User', 1, 'App-token', 'ea689a695a56fa4e4afe21a14e9562a799c8df9c8050f4b5dc1604382b413c19', '[\"*\"]', NULL, '2022-01-05 17:13:33', '2022-01-05 17:13:33'),
(12, 'App\\User', 1, 'App-token', '569b4112b03a67083a9aa947dbc00ad0c5395e4c6bdf79cd2bb22691ff40eb44', '[\"*\"]', NULL, '2022-01-05 17:23:47', '2022-01-05 17:23:47'),
(13, 'App\\User', 1, 'App-token', '0d40c50223514b6cc3ea230005503c3e7c8472e39a8a290818e81d32bcc4da6c', '[\"*\"]', NULL, '2022-01-05 17:29:45', '2022-01-05 17:29:45'),
(14, 'App\\User', 1, 'App-token', '2572bef955e1d9cd4c73093ba4092532f1ef08533da1552038deb00f3e64696a', '[\"*\"]', NULL, '2022-01-09 15:57:58', '2022-01-09 15:57:58'),
(15, 'App\\User', 1, 'App-token', '6c83e55159623b63b8d67908a1abe07686a8f3a9474b6088ee0ab130cc5d960b', '[\"*\"]', NULL, '2022-01-10 12:59:55', '2022-01-10 12:59:55'),
(16, 'App\\User', 1, 'App-token', 'd1a0d9487717562f54a6bae5d6eb0431119ae3d1c3b25892dbe173b490e9ef25', '[\"*\"]', NULL, '2022-01-10 12:59:56', '2022-01-10 12:59:56'),
(18, 'App\\User', 1, 'App-token', '72d14650ce226d59910836f5a5533392bfcafae63500214e4c340648b6b0fa47', '[\"*\"]', '2022-01-13 14:23:10', '2022-01-13 14:22:22', '2022-01-13 14:23:10'),
(19, 'App\\User', 1, 'App-token', '19f2ba9d88e6789ae783483f1cb019fcf643b6631a174f802d0939023b0418f6', '[\"*\"]', NULL, '2022-01-13 14:22:24', '2022-01-13 14:22:24'),
(24, 'App\\User', 1, 'App-token', 'c4ba264b93e84055949211770097931dd562d212a35ef4188487e027f2d4de42', '[\"*\"]', NULL, '2022-01-14 21:08:56', '2022-01-14 21:08:56'),
(25, 'App\\User', 1, 'App-token', '4eceb3b9f44375e89e6702fe6d62a3635eeeb7ad941d6f5dcc23155c8260f9cc', '[\"*\"]', NULL, '2022-01-14 21:15:11', '2022-01-14 21:15:11'),
(26, 'App\\User', 1, 'App-token', '496d0e9eae230a839b28d6f5b4c8d34d8c128685e534f72a8a62b84196e25073', '[\"*\"]', NULL, '2022-01-14 21:16:47', '2022-01-14 21:16:47'),
(27, 'App\\User', 1, 'App-token', '7fd1c1b6ff9adc2bf2114ce675afbcf28f34586e0d6347b11fce0f2ae6d9fe79', '[\"*\"]', NULL, '2022-01-14 21:16:50', '2022-01-14 21:16:50'),
(28, 'App\\User', 1, 'App-token', 'c5b31a0109b09e80cc1d91747fc414a818035214340a40216e2a9535b7bcc742', '[\"*\"]', NULL, '2022-01-14 21:16:52', '2022-01-14 21:16:52'),
(29, 'App\\User', 1, 'App-token', '6a9fb0d0b797789a13ff4ff4006c2666a5c924cedb40563ef457d4289c88581b', '[\"*\"]', NULL, '2022-01-14 21:16:55', '2022-01-14 21:16:55'),
(30, 'App\\User', 1, 'App-token', 'e70d6351ef8359068866d571a07175b82f86a9c7a275d4b59770bc01b0aec086', '[\"*\"]', NULL, '2022-01-14 21:16:57', '2022-01-14 21:16:57'),
(31, 'App\\User', 1, 'App-token', '1d8ebf12ef8ca531479817ca39c14fab5b7770d2fc3f251ad405220022cf5d45', '[\"*\"]', NULL, '2022-01-14 21:17:01', '2022-01-14 21:17:01'),
(32, 'App\\User', 1, 'App-token', '4be243c52185322da635f12f566223c927aa3c8c83c018e481968f3b385d88de', '[\"*\"]', NULL, '2022-01-14 21:17:03', '2022-01-14 21:17:03'),
(33, 'App\\User', 1, 'App-token', '410cd21361243f4197193db3aa9be175aa33d7e5f4509c43c30941d3234984a5', '[\"*\"]', NULL, '2022-01-14 21:17:07', '2022-01-14 21:17:07'),
(34, 'App\\User', 1, 'App-token', 'e1007fccb070c94b59b76fb7ce74cad9e576fe322d5ab3cf59303dd45b677d74', '[\"*\"]', NULL, '2022-01-14 21:17:23', '2022-01-14 21:17:23'),
(41, 'App\\User', 1, 'App-token', '924d2792fa3b651365666eb55a85925e354e30d372f6eb59dc90ddefefd23b12', '[\"*\"]', NULL, '2022-07-27 19:50:44', '2022-07-27 19:50:44'),
(44, 'App\\User', 1, 'App-token', '1819acbe2634562bec1cba1a8b470b4b018a39b0a365fe6f8aca7bee6dd88897', '[\"*\"]', '2022-09-15 17:04:34', '2022-08-25 19:59:26', '2022-09-15 17:04:34'),
(45, 'App\\User', 1, 'App-token', '03fccb282516de57169a79c6a27387ec9150eb885795792e9986bc38c6b49979', '[\"*\"]', '2022-09-20 16:52:47', '2022-09-20 16:47:12', '2022-09-20 16:52:47'),
(46, 'App\\User', 1, 'App-token', '08e9c791f120c223fc1033e29ac21c1b0cf22087fb4253e9328d2922abe7910b', '[\"*\"]', '2022-09-26 15:38:49', '2022-09-21 15:03:03', '2022-09-26 15:38:49'),
(47, 'App\\User', 1, 'App-token', 'e8440c2f2ef8145692813b77d893cad0744713ddc835b5f1c0d9442083d60707', '[\"*\"]', '2022-09-26 13:52:26', '2022-09-26 13:51:05', '2022-09-26 13:52:26'),
(48, 'App\\User', 2, 'App-token', '0f6aced89f87483624dd5f5488c9d1904d9a83087bdf993e5443f3d8e69bc71b', '[\"*\"]', '2022-11-28 08:43:55', '2022-11-28 08:35:05', '2022-11-28 08:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint UNSIGNED NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position`, `user_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'CLASS TEACHER', 1, 1, '2022-08-13 17:50:19', '2022-08-13 17:50:19'),
(2, 'ADMINISTRATOR', 1, 1, '2022-08-13 17:50:46', '2022-08-13 17:50:46'),
(3, 'TEACHER', 1, 1, '2022-08-13 17:51:27', '2022-08-13 17:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `previous_debts`
--

CREATE TABLE `previous_debts` (
  `id` bigint UNSIGNED NOT NULL,
  `sId` int NOT NULL,
  `classId` int NOT NULL,
  `term` tinyint NOT NULL,
  `year` year DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `userId` int NOT NULL,
  `schoolId` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revenues`
--

CREATE TABLE `revenues` (
  `id` bigint UNSIGNED NOT NULL,
  `categoryId` bigint NOT NULL,
  `fyearId` bigint NOT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `mode` bigint NOT NULL,
  `from` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revenues`
--

INSERT INTO `revenues` (`id`, `categoryId`, `fyearId`, `amount`, `date`, `mode`, `from`, `description`, `userId`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1000000, '2022-08-17', 1, 'Farm Manager', 'This was received from the maize garden.', 1, 1, '2022-08-17 07:16:41', '2022-08-17 07:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `rev_categories`
--

CREATE TABLE `rev_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `userId` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rev_categories`
--

INSERT INTO `rev_categories` (`id`, `name`, `status`, `userId`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 'School Fees', 1, 1, 1, '2022-08-17 07:04:13', '2022-08-17 07:04:13'),
(2, 'Farming', 1, 1, 1, '2022-08-17 07:05:34', '2022-08-17 07:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `rev_projections`
--

CREATE TABLE `rev_projections` (
  `id` bigint UNSIGNED NOT NULL,
  `categoryId` bigint NOT NULL,
  `fyearId` bigint NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `userId` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rev_projections`
--

INSERT INTO `rev_projections` (`id`, `categoryId`, `fyearId`, `amount`, `status`, `userId`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 80000000, 0, 1, 1, '2022-08-17 07:11:13', '2022-08-17 07:14:48'),
(2, 2, 1, 5000000, 0, 1, 1, '2022-08-17 07:11:25', '2022-08-17 07:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `id` bigint UNSIGNED NOT NULL,
  `member` bigint DEFAULT NULL,
  `amount` bigint DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `badge` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `boxno` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacts` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schools`
--

INSERT INTO `schools` (`id`, `name`, `motto`, `badge`, `district`, `boxno`, `location`, `contact`, `contacts`, `license`, `email`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'St. Francis Nursary and Primary School', '', 'No File', 'Jinja', 'P.O BOX 124', 'Jinja East, Bugembe, Budumbuli', 'Francis Abaliwale', '0787568421, 0785684256', '2022-01-20', 'francis123@gmail.com.com', 2, 1, '2021-12-31 16:58:24', '2022-06-06 18:54:47'),
(3, 'Namungarwe Primary School', '', 'No File', 'Iganga', 'P.O BOX 100', 'Kigulu, Kigulu South, Namugarwe', 'Francis Abaliwano', '0703548695, 0785469258', '2022-01-20', 'francis@school.com', 1, 1, '2021-12-31 17:01:53', '2022-06-06 18:55:01'),
(4, 'Bryan Nursary and Primary School', 'My Motto', 'hmrau_1656015652.PNG', 'Mukono', 'P.O BOX 756', 'Seeta, Seeta, parish', 'Brian Austin', '0787568421, 0785684256', '2022-01-31', 'bryanovic@school.com', 1, 1, '2021-12-31 17:03:18', '2022-06-23 20:20:52'),
(6, 'Test School', '', 'No File', 'Kampala', 'P.O BOX 123', 'Nakawa, Mutungo, Biina.', 'Bryan Brighton', '0785469875, 0756894232', '2022-06-06', 'school@email.com', 2, 1, '2022-06-06 18:21:55', '2022-06-06 18:55:32'),
(7, 'sdf', 'wer', 'loan requesting form_1656010420.PNG', 'wewe', 'werw', 'erwe', 'wer', 'sdfw', '2022-06-23', 'werw@wee.com', 2, 1, '2022-06-23 18:53:40', '2022-06-23 18:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `merital_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `dateOfAppointment` date DEFAULT NULL,
  `education_level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NIN` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initials` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `schoolId` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `email`, `phone1`, `phone2`, `address`, `position_id`, `salary`, `gender`, `merital_status`, `dateOfBirth`, `dateOfAppointment`, `education_level`, `photo`, `NIN`, `initials`, `user_id`, `status`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 'K DE BRIAN', 'bryan@bryanaustin.com', '0781076109', '0706263042', 'NAKAWA', '1', NULL, 'Male', 'Single', '1992-02-13', '2020-01-13', 'Bachelor Degree', NULL, 'CM245IT3FLVE', 'KDB', 1, 1, 1, '2022-08-13 17:53:59', '2022-08-13 17:59:40'),
(2, 'FRANCIS ABALIWANO', 'francis@abaliwano.com', '0788685425', '0756865213', 'NAKAWA', '1', NULL, 'Male', 'Single', '1996-01-13', '2021-01-13', 'Diploma', NULL, 'CM245IT3FLVE', 'FA', 1, 1, 1, '2022-08-13 17:57:25', '2022-08-13 18:00:01'),
(3, 'BENTEKE CHRISTIAN', 'benteke@christian.com', '0781800256', '0755623564', 'KAMPALA', '3', NULL, 'Female', 'Married', '1996-01-13', '2021-01-13', 'Diploma', NULL, 'CM245IT3FLVE', 'BC', 1, 1, 1, '2022-08-13 17:58:44', '2022-08-13 18:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

CREATE TABLE `streams` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `user_id` int DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `streams`
--

INSERT INTO `streams` (`id`, `name`, `class`, `status`, `user_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'BLUE', 1, 1, 1, 1, '2022-08-13 17:25:17', '2022-08-13 17:25:17'),
(2, 'GREEN', 1, 1, 1, 1, '2022-08-13 17:28:58', '2022-08-13 17:28:58'),
(3, 'YELLOW', 2, 1, 1, 1, '2022-08-13 17:29:17', '2022-08-13 17:29:17'),
(4, 'RED', 2, 1, 1, 1, '2022-08-13 17:29:24', '2022-08-13 17:29:24'),
(5, 'GREEN', 3, 1, 1, 1, '2022-08-13 17:31:38', '2022-08-13 17:31:38'),
(6, 'YELLOW', 3, 1, 1, 1, '2022-08-13 17:31:50', '2022-08-13 17:31:50'),
(7, 'BLUE', 4, 1, 1, 1, '2022-08-13 17:32:10', '2022-08-13 17:32:10'),
(8, 'GREEN', 4, 1, 1, 1, '2022-08-13 17:32:27', '2022-08-13 17:32:27'),
(9, 'BLUE', 5, 1, 1, 1, '2022-08-13 17:33:04', '2022-08-13 17:33:04'),
(10, 'GREEN', 5, 1, 1, 1, '2022-08-13 17:33:25', '2022-08-13 17:33:25'),
(11, 'YELLLOW', 6, 1, 1, 1, '2022-08-13 17:33:39', '2022-08-13 17:33:39'),
(12, 'RED', 6, 1, 1, 1, '2022-08-13 17:33:46', '2022-08-13 17:33:46'),
(13, 'BLUE', 7, 1, 1, 1, '2022-08-13 17:34:00', '2022-08-13 17:34:00'),
(14, 'GRAY1', 6, 0, 1, 1, '2022-08-13 17:34:19', '2022-08-13 17:34:36');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` int DEFAULT NULL,
  `stream` int DEFAULT NULL,
  `term` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `residence` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guardian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resident` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gemail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gcontacts` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `schoolId` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `photo`, `dob`, `gender`, `class`, `stream`, `term`, `year`, `residence`, `guardian`, `resident`, `gemail`, `gcontacts`, `user_id`, `status`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 'LYDIA LYTON', 'penguins_1660414258.jpg', '2018-01-13', 'Female', 1, 1, 1, 2022, '1', 'JANE LYTON', 'Jinja, Bugembe', 'lyton@gmail.com', '0785462315', 1, 1, 1, '2022-08-13 18:10:59', '2022-08-13 18:10:59'),
(2, 'CHRISTIAN ELIKSEN', 'default.jpg', '2019-03-21', 'Male', 1, 2, 1, 2022, '0', 'ELIKSEN GENK', 'Kampala, Kawempe', 'genk@gmail.com', '0756423198, 0756984321', 1, 1, 1, '2022-08-13 18:13:05', '2022-08-13 18:13:05'),
(3, 'DAVID DEG', 'man-template_1660414501.png', '2019-11-27', 'Male', 1, 1, 1, 2022, '1', 'GENK FLOOR', 'Kampala, Ntinda', 'genk@yahoo.com', '0789456123, 0758946123', 1, 1, 1, '2022-08-13 18:15:01', '2022-08-13 18:15:01'),
(4, 'VAN DE BEEK', 'default.jpg', '2018-06-15', 'Male', 1, 1, 1, 2022, '0', 'DATCH VAN', 'Mukono, Wanton', 'van@datch.com', '0783586542, 0751556223', 1, 1, 1, '2022-08-13 18:19:27', '2022-08-13 18:19:27'),
(5, 'AISHA NAMAALA', 'female-template_1660414924.png', '2019-12-23', 'Female', 1, 1, 1, 2022, '1', 'NAMAALA JENIFER', 'Kampala, Gayaza', 'namaala@gmail.com', '07654236851, 07658965236', 1, 1, 1, '2022-08-13 18:22:04', '2022-08-13 18:22:04'),
(6, 'FRANK RIBERY', 'man-template_1660417290.png', '2018-02-02', 'Male', 2, 3, 1, 2022, '1', 'REBERY PARENT', 'Kampala, Gayaza', 'ribery@email.com', '0756231489', 1, 1, 1, '2022-08-13 18:58:15', '2022-08-13 19:01:31'),
(7, 'GABRIEL JESUS', 'default.jpg', '2018-02-03', 'Male', 2, 3, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-13 18:58:15', '2022-08-13 18:58:15'),
(8, 'EMILY PEPE', 'default.jpg', '2018-02-04', 'Female', 2, 4, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-13 18:59:14', '2022-08-13 18:59:14'),
(9, 'ROBEN DIAZ', 'default.jpg', '2017-10-22', 'Male', 2, 4, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-13 18:59:14', '2022-08-13 18:59:14'),
(10, 'SHAMIM MALENDE', 'default.jpg', '2017-12-23', 'Female', 2, 4, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-13 18:59:14', '2022-08-13 18:59:14'),
(11, 'NKETIA EDDY', 'default.jpg', '2016-07-10', 'Male', 3, 5, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-13 19:13:10', '2022-08-13 19:13:10'),
(12, 'KEVIN DE BRUYN', 'default.jpg', '2017-10-03', 'Male', 3, 5, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-13 19:13:10', '2022-08-13 19:13:10'),
(13, 'HASIFA NASUUNA', 'default.jpg', '2016-12-04', 'Female', 3, 5, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-13 19:13:10', '2022-08-13 19:13:10'),
(14, 'SALAH MOHAMMAD', 'default.jpg', '2017-11-23', 'Male', 3, 5, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-13 19:13:10', '2022-08-13 19:13:10'),
(15, 'NABWETEME SANDRA', 'default.jpg', '2017-1-23', 'Female', 3, 5, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-13 19:13:10', '2022-08-13 19:13:10'),
(16, 'MICHEAL ATETA', 'default.jpg', '2015-01-09', 'Male', 4, 7, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 07:41:19', '2022-08-14 07:41:19'),
(17, 'ERIC TENHAG', 'default.jpg', '2015-01-22', 'Male', 4, 8, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 07:42:46', '2022-08-14 07:42:46'),
(18, 'ALICE NASUUNA', 'female-template_1660463018.png', '2015-01-22', 'Female', 4, 7, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 07:43:38', '2022-08-14 07:43:38'),
(19, 'SANDRA NABIRYE', 'female-template_1660463052.png', '2015-01-22', 'Female', 4, 8, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 07:44:12', '2022-08-14 07:44:12'),
(20, 'ELIZABETH SYN', 'female-template_1660464475.png', '2015-01-28', 'Female', 4, 8, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:07:55', '2022-08-14 08:07:55'),
(21, 'DANIEL LEWIS', 'default.jpg', '2015-03-10', 'Male', 5, 9, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:18:06', '2022-08-14 08:18:06'),
(22, 'MERYL STREEP', 'default.jpg', '2015-02-23', 'Female', 5, 9, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:18:06', '2022-08-14 08:18:06'),
(23, 'TOM CRUSE', 'default.jpg', '2015-10-13', 'Male', 5, 10, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:18:36', '2022-08-14 08:18:36'),
(24, 'ROBERT DE NAIRO', 'default.jpg', '2014-12-04', 'Male', 5, 10, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:18:36', '2022-08-14 08:18:36'),
(25, 'KATHARINE HEPBURN', 'default.jpg', '2015-11-21', 'Female', 5, 10, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:18:36', '2022-08-14 08:18:36'),
(26, 'CLARK GABLE', 'default.jpg', '2014-04-10', 'Male', 6, 11, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:24:36', '2022-08-14 08:24:36'),
(27, 'INGRID BERGMAN', 'default.jpg', '2014-12-10', 'Male', 6, 11, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:24:37', '2022-08-14 08:24:37'),
(28, 'TOM HANKS', 'default.jpg', '2014-12-04', 'Male', 6, 12, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:25:03', '2022-08-14 08:25:03'),
(29, 'LEONARDO DICAPRIO', 'default.jpg', '2014-04-10', 'Male', 7, 13, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:38:15', '2022-08-14 08:38:15'),
(30, 'GREGORY PECK', 'default.jpg', '2014-12-10', 'Male', 7, 13, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:38:15', '2022-08-14 08:38:15'),
(31, 'SPENCER TRACY', 'default.jpg', '2014-12-04', 'Male', 7, 13, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:38:15', '2022-08-14 08:38:15'),
(32, 'BETTE DAVIS', 'default.jpg', '2015-11-21', 'Female', 7, 13, 1, 2022, '1', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:38:15', '2022-08-14 08:38:15'),
(33, 'ELIZABETH TAYLOR', 'default.jpg', '2015-02-23', 'Female', 7, 13, 1, 2022, '0', NULL, NULL, NULL, NULL, 1, 1, 1, '2022-08-14 08:38:15', '2022-08-14 08:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `user_id` int DEFAULT NULL,
  `school_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `short`, `class`, `status`, `user_id`, `school_id`, `created_at`, `updated_at`) VALUES
(1, 'MATHEMATICS', 'MATH', 1, 1, 1, 1, '2022-08-13 17:37:00', '2022-08-13 17:38:55'),
(2, 'MATHEMATICS', 'MATH', 2, 1, 1, 1, '2022-08-13 17:37:01', '2022-08-13 17:37:01'),
(3, 'MATHEMATICS', 'MATH', 3, 1, 1, 1, '2022-08-13 17:37:01', '2022-08-13 17:37:01'),
(4, 'MATHEMATICS', 'MATH', 4, 1, 1, 1, '2022-08-13 17:37:02', '2022-08-13 17:37:02'),
(5, 'MATHEMATICS', 'MATH', 5, 1, 1, 1, '2022-08-13 17:37:03', '2022-08-13 17:37:03'),
(6, 'MATHEMATICS', 'MATH', 6, 1, 1, 1, '2022-08-13 17:37:03', '2022-08-13 17:37:03'),
(7, 'MATHEMATICS', 'MATH', 7, 1, 1, 1, '2022-08-13 17:37:03', '2022-08-13 17:37:03'),
(8, 'ENGLISH', 'ENG', 1, 1, 1, 1, '2022-08-13 17:37:26', '2022-08-13 17:37:26'),
(9, 'ENGLISH', 'ENG', 2, 1, 1, 1, '2022-08-13 17:37:26', '2022-08-13 17:37:26'),
(10, 'ENGLISH', 'ENG', 3, 1, 1, 1, '2022-08-13 17:37:26', '2022-08-13 17:37:26'),
(11, 'ENGLISH', 'ENG', 4, 1, 1, 1, '2022-08-13 17:37:26', '2022-08-13 17:37:26'),
(12, 'ENGLISH', 'ENG', 5, 1, 1, 1, '2022-08-13 17:37:27', '2022-08-13 17:37:27'),
(13, 'ENGLISH', 'ENG', 6, 1, 1, 1, '2022-08-13 17:37:27', '2022-08-13 17:37:27'),
(14, 'ENGLISH', 'ENG', 7, 1, 1, 1, '2022-08-13 17:37:27', '2022-08-13 17:37:27'),
(15, 'SOCIAL STUDIES', 'SST', 1, 1, 1, 1, '2022-08-13 17:38:04', '2022-08-13 17:38:04'),
(16, 'SOCIAL STUDIES', 'SST', 2, 1, 1, 1, '2022-08-13 17:38:04', '2022-08-13 17:38:04'),
(17, 'SOCIAL STUDIES', 'SST', 3, 1, 1, 1, '2022-08-13 17:38:04', '2022-08-13 17:38:04'),
(18, 'SOCIAL STUDIES', 'SST', 4, 1, 1, 1, '2022-08-13 17:38:05', '2022-08-13 17:38:05'),
(19, 'SOCIAL STUDIES', 'SST', 5, 1, 1, 1, '2022-08-13 17:38:05', '2022-08-13 17:38:05'),
(20, 'SOCIAL STUDIES', 'SST', 6, 1, 1, 1, '2022-08-13 17:38:05', '2022-08-13 17:38:05'),
(21, 'SOCIAL STUDIES', 'SST', 7, 1, 1, 1, '2022-08-13 17:38:05', '2022-08-13 17:38:05'),
(22, 'SCIENCE', 'SCI', 1, 1, 1, 1, '2022-08-13 17:38:27', '2022-08-13 17:38:27'),
(23, 'SCIENCE', 'SCI', 2, 1, 1, 1, '2022-08-13 17:38:27', '2022-08-13 17:38:27'),
(24, 'SCIENCE', 'SCI', 3, 1, 1, 1, '2022-08-13 17:38:27', '2022-08-13 17:38:27'),
(25, 'SCIENCE', 'SCI', 4, 1, 1, 1, '2022-08-13 17:38:28', '2022-08-13 17:38:28'),
(26, 'SCIENCE', 'SCI', 5, 1, 1, 1, '2022-08-13 17:38:28', '2022-08-13 17:38:28'),
(27, 'SCIENCE', 'SCI', 6, 1, 1, 1, '2022-08-13 17:38:29', '2022-08-13 17:38:29'),
(28, 'SCIENCE', 'SCI', 7, 1, 1, 1, '2022-08-13 17:38:29', '2022-08-13 17:38:29'),
(29, 'TEST SUBJECT', 'SUB', 1, 0, 1, 1, '2022-08-13 17:39:21', '2022-08-13 17:39:28');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int NOT NULL,
  `schoolId` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `address`, `email`, `contact`, `userId`, `schoolId`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Brian Shrik', 'Kampala, Mutungo', 'shrik@gmail.com', '0786594235', 1, 1, 1, '2022-08-17 07:33:55', '2022-08-17 07:33:55'),
(2, 'Ashiraf', 'Iganga', 'ashiraf@gmail.com', '0756423698', 1, 1, 1, '2022-08-17 07:35:39', '2022-08-17 07:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  `staff_id` bigint NOT NULL,
  `stream` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `schoolId` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`id`, `class_id`, `subject_id`, `staff_id`, `stream`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, 1, 1, '2022-08-14 11:25:24', '2022-08-14 11:25:24'),
(2, 1, 8, 1, NULL, 1, 1, '2022-08-14 11:25:36', '2022-08-14 11:25:36'),
(3, 1, 15, 1, NULL, 1, 1, '2022-08-14 17:52:16', '2022-08-14 17:52:16'),
(4, 1, 22, 1, NULL, 1, 1, '2022-08-14 17:52:29', '2022-08-14 17:52:29'),
(5, 2, 2, 1, NULL, 1, 1, '2022-08-14 17:58:17', '2022-08-14 17:58:17'),
(6, 2, 9, 1, NULL, 1, 1, '2022-08-14 17:58:31', '2022-08-14 17:58:31'),
(7, 2, 16, 1, NULL, 1, 1, '2022-08-14 17:58:48', '2022-08-14 17:58:48'),
(8, 2, 23, 1, NULL, 1, 1, '2022-08-14 17:58:58', '2022-08-14 17:58:58'),
(9, 3, 3, 2, NULL, 1, 1, '2022-08-14 17:59:18', '2022-08-14 17:59:18'),
(10, 3, 10, 2, NULL, 1, 1, '2022-08-14 17:59:26', '2022-08-14 17:59:26'),
(11, 3, 17, 2, NULL, 1, 1, '2022-08-14 17:59:34', '2022-08-14 17:59:34'),
(12, 3, 24, 2, NULL, 1, 1, '2022-08-14 17:59:51', '2022-08-14 17:59:51'),
(13, 4, 4, 2, NULL, 1, 1, '2022-08-14 18:00:09', '2022-08-14 18:00:09'),
(14, 4, 11, 2, NULL, 1, 1, '2022-08-14 18:00:49', '2022-08-14 18:00:49'),
(15, 4, 25, 2, NULL, 1, 1, '2022-08-14 18:00:58', '2022-08-14 18:00:58'),
(16, 4, 18, 2, NULL, 1, 1, '2022-08-14 18:01:22', '2022-08-14 18:01:22'),
(17, 5, 5, 3, NULL, 1, 1, '2022-08-14 18:02:26', '2022-08-14 18:02:26'),
(18, 5, 12, 3, NULL, 1, 1, '2022-08-14 18:02:34', '2022-08-14 18:02:34'),
(19, 5, 19, 3, NULL, 1, 1, '2022-08-14 18:02:43', '2022-08-14 18:02:43'),
(20, 5, 26, 3, NULL, 1, 1, '2022-08-14 18:02:52', '2022-08-14 18:02:52'),
(21, 6, 5, 3, NULL, 1, 1, '2022-08-14 18:03:01', '2022-08-14 18:03:01'),
(22, 6, 13, 3, NULL, 1, 1, '2022-08-14 18:03:13', '2022-08-14 18:03:13'),
(23, 6, 20, 3, NULL, 1, 1, '2022-08-14 18:03:22', '2022-08-14 18:03:22'),
(24, 6, 27, 3, NULL, 1, 1, '2022-08-14 18:03:37', '2022-08-14 18:03:37'),
(25, 7, 7, 3, NULL, 1, 1, '2022-08-14 18:04:03', '2022-08-14 18:04:03'),
(26, 7, 14, 3, NULL, 1, 1, '2022-08-14 18:05:41', '2022-08-14 18:05:41'),
(27, 7, 21, 3, NULL, 1, 1, '2022-08-14 18:05:48', '2022-08-14 18:05:48'),
(28, 7, 28, 3, NULL, 1, 1, '2022-08-14 18:05:59', '2022-08-14 18:05:59');

-- --------------------------------------------------------

--
-- Table structure for table `test_sets`
--

CREATE TABLE `test_sets` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `user_id` int NOT NULL,
  `schoolId` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_sets`
--

INSERT INTO `test_sets` (`id`, `name`, `short`, `status`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 'BEGINNING OF TERM', 'BOT', 1, 1, 1, '2022-08-14 10:39:37', '2022-08-14 10:39:37'),
(2, 'MID TERM', 'MID', 1, 1, 1, '2022-08-14 10:39:57', '2022-08-14 10:39:57'),
(3, 'END OF TERM', 'EOT', 1, 1, 1, '2022-08-14 10:40:13', '2022-08-14 10:40:13');

-- --------------------------------------------------------

--
-- Table structure for table `test_set_considerations`
--

CREATE TABLE `test_set_considerations` (
  `id` bigint UNSIGNED NOT NULL,
  `test` int NOT NULL,
  `year` year DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `schoolId` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_set_considerations`
--

INSERT INTO `test_set_considerations` (`id`, `test`, `year`, `priority`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, '2022', 1, 1, 1, '2022-08-14 10:41:14', '2022-08-14 10:41:14'),
(2, 2, '2022', 2, 1, 1, '2022-08-14 10:42:21', '2022-08-14 10:42:21'),
(3, 3, '2022', 3, 1, 1, '2022-08-14 10:42:28', '2022-08-14 10:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `test_set_contributions`
--

CREATE TABLE `test_set_contributions` (
  `id` bigint UNSIGNED NOT NULL,
  `test` int NOT NULL,
  `class` int NOT NULL,
  `marked` int DEFAULT NULL,
  `converted` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `schoolId` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_set_contributions`
--

INSERT INTO `test_set_contributions` (`id`, `test`, `class`, `marked`, `converted`, `user_id`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 100, 100, 1, 1, '2022-08-14 10:43:21', '2022-08-14 10:43:21'),
(2, 1, 2, 100, 100, 1, 1, '2022-08-14 10:43:21', '2022-08-14 10:43:21'),
(3, 1, 3, 100, 100, 1, 1, '2022-08-14 10:43:21', '2022-08-14 10:43:21'),
(4, 1, 4, 100, 100, 1, 1, '2022-08-14 10:43:21', '2022-08-14 10:43:21'),
(5, 1, 5, 100, 100, 1, 1, '2022-08-14 10:43:21', '2022-08-14 10:43:21'),
(6, 1, 6, 100, 100, 1, 1, '2022-08-14 10:43:22', '2022-08-14 10:43:22'),
(7, 1, 7, 100, 100, 1, 1, '2022-08-14 10:43:22', '2022-08-14 10:43:22'),
(8, 2, 1, 100, 100, 1, 1, '2022-08-14 10:43:50', '2022-08-14 10:43:50'),
(9, 2, 2, 100, 100, 1, 1, '2022-08-14 10:43:50', '2022-08-14 10:43:50'),
(10, 2, 3, 100, 100, 1, 1, '2022-08-14 10:43:50', '2022-08-14 10:43:50'),
(11, 2, 4, 100, 100, 1, 1, '2022-08-14 10:43:50', '2022-08-14 10:43:50'),
(12, 2, 5, 100, 100, 1, 1, '2022-08-14 10:43:50', '2022-08-14 10:43:50'),
(13, 2, 6, 100, 100, 1, 1, '2022-08-14 10:43:51', '2022-08-14 10:43:51'),
(14, 2, 7, 100, 100, 1, 1, '2022-08-14 10:43:51', '2022-08-14 10:43:51'),
(15, 3, 1, 100, 100, 1, 1, '2022-08-14 10:44:06', '2022-08-14 10:44:06'),
(16, 3, 2, 100, 100, 1, 1, '2022-08-14 10:44:06', '2022-08-14 10:44:06'),
(17, 3, 3, 100, 100, 1, 1, '2022-08-14 10:44:06', '2022-08-14 10:44:06'),
(18, 3, 4, 100, 100, 1, 1, '2022-08-14 10:44:06', '2022-08-14 10:44:06'),
(19, 3, 5, 100, 100, 1, 1, '2022-08-14 10:44:06', '2022-08-14 10:44:06'),
(20, 3, 6, 100, 100, 1, 1, '2022-08-14 10:44:07', '2022-08-14 10:44:07'),
(21, 3, 7, 100, 100, 1, 1, '2022-08-14 10:44:07', '2022-08-14 10:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `amount_in` double NOT NULL DEFAULT '0',
  `amount_out` double NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `type` tinyint DEFAULT NULL COMMENT '1=initial balance, 2=fees payment',
  `mode` bigint NOT NULL,
  `transactionId` bigint NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schoolId` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `amount_in`, `amount_out`, `date`, `type`, `mode`, `transactionId`, `description`, `schoolId`, `created_at`, `updated_at`) VALUES
(1, 500000, 0, '2022-08-17', 2, 1, 1, 'Fees Payment', 1, '2022-08-17 06:45:36', '2022-08-17 06:45:36'),
(2, 1000000, 0, '2022-08-17', 3, 1, 1, 'Received Revenue', 1, '2022-08-17 07:16:41', '2022-08-17 07:16:41'),
(3, 500000, 0, '2022-08-17', 4, 1, 1, 'Expense', 1, '2022-08-17 07:37:29', '2022-08-17 07:37:29'),
(4, 1000000, 0, '2022-08-17', 4, 1, 2, 'Expense', 1, '2022-08-17 07:39:03', '2022-08-17 07:39:03'),
(5, 1300000, 0, '2022-08-18', 4, 2, 3, 'Expense', 1, '2022-08-18 08:05:45', '2022-08-18 08:05:45'),
(6, 100000, 0, '2022-08-18', 2, 2, 2, 'Fees Payment', 1, '2022-08-18 08:07:56', '2022-08-18 08:07:56'),
(7, 600000, 0, '2022-09-14', 4, 1, 4, 'Expense', 1, '2022-09-14 08:27:54', '2022-09-14 08:27:54'),
(8, 300000, 0, '2022-09-15', 2, 2, 3, 'Fees Payment', 1, '2022-09-15 16:46:59', '2022-09-15 16:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` bigint DEFAULT NULL,
  `role` bigint DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schoolId` int DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `staff_id`, `role`, `email`, `phone`, `email_verified_at`, `password`, `schoolId`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kulaba Brian', NULL, NULL, NULL, 'chaya.streich@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'Q7KI6D5puq', '2022-01-02 16:41:17', '2022-01-02 16:41:17'),
(2, 'Eldon Pagac MD', NULL, NULL, NULL, 'lucius59@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$CD9DbfKQUklEvSyGcmWsKu.rAWsFDH/hOnSHFsLE8DNMORB0gjXCq', 1, 'FGzVLDhHxP', '2022-01-02 16:41:17', '2022-01-02 16:41:17'),
(3, 'Freddie Kirlin', NULL, NULL, NULL, 'ondricka.elta@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'vlBfU0aHVN', '2022-01-02 16:41:18', '2022-01-02 16:41:18'),
(4, 'Ms. Eloise Schulist', NULL, NULL, NULL, 'lazaro87@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'PBxH0a4LSh', '2022-01-02 16:41:18', '2022-01-02 16:41:18'),
(5, 'Amelie Kerluke', NULL, NULL, NULL, 'schultz.vanessa@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '5cO1FkQyNH', '2022-01-02 16:41:18', '2022-01-02 16:41:18'),
(6, 'Krystina Wolff', NULL, NULL, NULL, 'coralie10@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '94mfYpYCvF', '2022-01-02 16:41:18', '2022-01-02 16:41:18'),
(7, 'Pietro Lynch', NULL, NULL, NULL, 'zzulauf@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'eFp6WHsVdc', '2022-01-02 16:41:18', '2022-01-02 16:41:18'),
(8, 'Reinhold Dare', NULL, NULL, NULL, 'marie70@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'cwcOqUvavV', '2022-01-02 16:41:19', '2022-01-02 16:41:19'),
(9, 'Kaitlyn Aufderhar', NULL, NULL, NULL, 'ratke.brady@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'aPepV863Zu', '2022-01-02 16:41:19', '2022-01-02 16:41:19'),
(10, 'Agustina Olson', NULL, NULL, NULL, 'sporer.newell@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'W9MQqA0pIv', '2022-01-02 16:41:19', '2022-01-02 16:41:19'),
(11, 'Casper Jakubowski', NULL, NULL, NULL, 'buckridge.cierra@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '39Yx3jWUs0', '2022-01-02 16:41:19', '2022-01-02 16:41:19'),
(12, 'Ethelyn Waters I', NULL, NULL, NULL, 'cristal62@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'Qkm3sLVjU2', '2022-01-02 16:41:19', '2022-01-02 16:41:19'),
(13, 'Rahsaan Buckridge', NULL, NULL, NULL, 'pagac.carey@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'TNGWDjJaAG', '2022-01-02 16:41:19', '2022-01-02 16:41:19'),
(14, 'Prof. Vicenta Lemke V', NULL, NULL, NULL, 'murray.nash@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'WB6Dl5jUDT', '2022-01-02 16:41:19', '2022-01-02 16:41:19'),
(15, 'Prof. Yolanda Skiles PhD', NULL, NULL, NULL, 'kayla02@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '5oKbMBOq7R', '2022-01-02 16:41:19', '2022-01-02 16:41:19'),
(16, 'Roger Olson Jr.', NULL, NULL, NULL, 'marianna21@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'xbxVnTPcna', '2022-01-02 16:41:20', '2022-01-02 16:41:20'),
(17, 'Lexi Johns DVM', NULL, NULL, NULL, 'ihoeger@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'a1XDU3JRdW', '2022-01-02 16:41:20', '2022-01-02 16:41:20'),
(18, 'Ramon Powlowski', NULL, NULL, NULL, 'watsica.dereck@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'DQ3CPWZx1L', '2022-01-02 16:41:20', '2022-01-02 16:41:20'),
(19, 'Dr. Toby Mertz', NULL, NULL, NULL, 'michel.nolan@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'StTaPEF8tn', '2022-01-02 16:41:20', '2022-01-02 16:41:20'),
(20, 'Helene Heathcote', NULL, NULL, NULL, 'ccronin@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'HgnMJriAka', '2022-01-02 16:41:20', '2022-01-02 16:41:20'),
(21, 'Bradley Rempel', NULL, NULL, NULL, 'trunolfsson@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'ujlAGZ55E4', '2022-01-02 16:41:20', '2022-01-02 16:41:20'),
(22, 'Ronaldo Robel DVM', NULL, NULL, NULL, 'jrunolfsdottir@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'XiAI2D9sMr', '2022-01-02 16:41:20', '2022-01-02 16:41:20'),
(23, 'Noemi Wiegand', NULL, NULL, NULL, 'katlyn69@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'uHyc0i19Aa', '2022-01-02 16:41:20', '2022-01-02 16:41:20'),
(24, 'Dwight Donnelly', NULL, NULL, NULL, 'adell.mante@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'vNFIOmOZeX', '2022-01-02 16:41:20', '2022-01-02 16:41:20'),
(25, 'Vicky Miller', NULL, NULL, NULL, 'leta.senger@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'xhOv6jI2kr', '2022-01-02 16:41:21', '2022-01-02 16:41:21'),
(26, 'Winnifred Witting', NULL, NULL, NULL, 'federico.damore@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'AVoncTDpuO', '2022-01-02 16:41:21', '2022-01-02 16:41:21'),
(27, 'Kaci Lakin', NULL, NULL, NULL, 'dejah.torp@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'HMkjv7oTfa', '2022-01-02 16:41:21', '2022-01-02 16:41:21'),
(28, 'Marlin Murazik', NULL, NULL, NULL, 'sylvan.schimmel@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'OdY67a7WTi', '2022-01-02 16:41:21', '2022-01-02 16:41:21'),
(29, 'Catherine Keebler', NULL, NULL, NULL, 'asa.walter@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'gdSz6v5crW', '2022-01-02 16:41:21', '2022-01-02 16:41:21'),
(30, 'Jacklyn Von', NULL, NULL, NULL, 'sheridan.hintz@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'Ca9gc5eXOZ', '2022-01-02 16:41:21', '2022-01-02 16:41:21'),
(31, 'Prof. Malachi Leffler', NULL, NULL, NULL, 'lherzog@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'JCDxvnKoVh', '2022-01-02 16:41:21', '2022-01-02 16:41:21'),
(32, 'Eloy Zieme', NULL, NULL, NULL, 'jamarcus15@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'tK5UElQX8w', '2022-01-02 16:41:22', '2022-01-02 16:41:22'),
(33, 'Alessia Durgan', NULL, NULL, NULL, 'greta.schoen@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'qnKfu7dOfu', '2022-01-02 16:41:22', '2022-01-02 16:41:22'),
(34, 'Halle Weissnat', NULL, NULL, NULL, 'ekoss@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'JXKNC3K88Q', '2022-01-02 16:41:22', '2022-01-02 16:41:22'),
(35, 'Haylee Bernhard', NULL, NULL, NULL, 'rachael.mills@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'PuGnIgZxkN', '2022-01-02 16:41:22', '2022-01-02 16:41:22'),
(36, 'Mr. Landen Ortiz I', NULL, NULL, NULL, 'jennie65@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'AdvM1wrsPx', '2022-01-02 16:41:22', '2022-01-02 16:41:22'),
(37, 'Rosemarie Predovic Sr.', NULL, NULL, NULL, 'rolfson.athena@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '6ygpg2Ch35', '2022-01-02 16:41:22', '2022-01-02 16:41:22'),
(38, 'Hannah Schuster', NULL, NULL, NULL, 'marilyne90@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'KYloe1qTvP', '2022-01-02 16:41:22', '2022-01-02 16:41:22'),
(39, 'Rae Rippin DDS', NULL, NULL, NULL, 'pbalistreri@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '8g3KjvjnIS', '2022-01-02 16:41:22', '2022-01-02 16:41:22'),
(40, 'Rhianna Hettinger', NULL, NULL, NULL, 'ned.gibson@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'guWlyjYE3K', '2022-01-02 16:41:22', '2022-01-02 16:41:22'),
(41, 'Reed Marks', NULL, NULL, NULL, 'cordelia.hamill@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'mLMFuNQS9K', '2022-01-02 16:41:22', '2022-01-02 16:41:22'),
(42, 'Shayna Bailey', NULL, NULL, NULL, 'lehner.pedro@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'J0eIZw7HOF', '2022-01-02 16:41:23', '2022-01-02 16:41:23'),
(43, 'Tressa Schiller', NULL, NULL, NULL, 'walter.bette@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'KQECFfUZ8T', '2022-01-02 16:41:23', '2022-01-02 16:41:23'),
(44, 'Kadin Schroeder', NULL, NULL, NULL, 'makenna14@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '9Q1jlV9emk', '2022-01-02 16:41:23', '2022-01-02 16:41:23'),
(45, 'Ervin Kemmer', NULL, NULL, NULL, 'demarco.daniel@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'BYICcrjE4T', '2022-01-02 16:41:23', '2022-01-02 16:41:23'),
(46, 'Carole Treutel', NULL, NULL, NULL, 'kaitlin.bartoletti@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'FBfSvLYkGh', '2022-01-02 16:41:23', '2022-01-02 16:41:23'),
(47, 'Noemy Parker', NULL, NULL, NULL, 'miller.stefanie@example.com', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'K344qURjRK', '2022-01-02 16:41:23', '2022-01-02 16:41:23'),
(48, 'Prof. Jose Herman', NULL, NULL, NULL, 'jrunolfsson@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '19uqhlGrYw', '2022-01-02 16:41:24', '2022-01-02 16:41:24'),
(49, 'Miss Bernice Lehner', NULL, NULL, NULL, 'gerlach.dortha@example.net', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '7fUPgWuveg', '2022-01-02 16:41:24', '2022-01-02 16:41:24'),
(50, 'Joseph McKenzie', NULL, NULL, NULL, 'fay.ross@example.org', NULL, '2022-01-02 16:41:17', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'R69sjNL9ug', '2022-01-02 16:41:24', '2022-01-02 16:41:24'),
(51, 'Ms. Aubree Weimann', NULL, NULL, NULL, 'rzboncak@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'ujmbHEsmiM', '2022-01-02 16:41:56', '2022-01-02 16:41:56'),
(52, 'Stephany O\'Reilly I', NULL, NULL, NULL, 'bcorwin@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'zwldyzxSkk', '2022-01-02 16:41:56', '2022-01-02 16:41:56'),
(53, 'Antoinette Lesch', NULL, NULL, NULL, 'shanny03@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'Glj1sXsE7o', '2022-01-02 16:41:57', '2022-01-02 16:41:57'),
(54, 'Dejah Parker', NULL, NULL, NULL, 'lhyatt@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'f3AN7Gsn7H', '2022-01-02 16:41:57', '2022-01-02 16:41:57'),
(55, 'Augustine Torphy', NULL, NULL, NULL, 'alec67@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'yro0Keyczy', '2022-01-02 16:41:57', '2022-01-02 16:41:57'),
(56, 'Jarred Bednar', NULL, NULL, NULL, 'leatha.hackett@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'r8KxjlhrGB', '2022-01-02 16:41:57', '2022-01-02 16:41:57'),
(57, 'Prof. Jovani Smith', NULL, NULL, NULL, 'ykerluke@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'vQVuxvqWLd', '2022-01-02 16:41:57', '2022-01-02 16:41:57'),
(58, 'Brenden O\'Conner', NULL, NULL, NULL, 'mohammad.russel@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'TzbJFdO9Uz', '2022-01-02 16:41:57', '2022-01-02 16:41:57'),
(59, 'Viola Langosh', NULL, NULL, NULL, 'ykovacek@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'ggZPBFA2qy', '2022-01-02 16:41:57', '2022-01-02 16:41:57'),
(60, 'Assunta Ankunding', NULL, NULL, NULL, 'epollich@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'XmWRpQWCm6', '2022-01-02 16:41:58', '2022-01-02 16:41:58'),
(61, 'Hayley Emmerich II', NULL, NULL, NULL, 'davion.leuschke@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'kOk2mzha3r', '2022-01-02 16:41:58', '2022-01-02 16:41:58'),
(62, 'Rogelio Crooks II', NULL, NULL, NULL, 'oschultz@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'eF51TyOCVq', '2022-01-02 16:41:58', '2022-01-02 16:41:58'),
(63, 'Ms. Lillian Collins', NULL, NULL, NULL, 'wehner.russ@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'PEeIkPE36L', '2022-01-02 16:41:58', '2022-01-02 16:41:58'),
(64, 'Izaiah Champlin I', NULL, NULL, NULL, 'gennaro50@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'iqYNj4u9ay', '2022-01-02 16:41:58', '2022-01-02 16:41:58'),
(65, 'Blaze Cassin', NULL, NULL, NULL, 'dayna48@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'OivQc7A1aU', '2022-01-02 16:41:58', '2022-01-02 16:41:58'),
(66, 'Mr. Ryley Braun', NULL, NULL, NULL, 'kulas.mae@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '7i3E2fAvSB', '2022-01-02 16:41:58', '2022-01-02 16:41:58'),
(67, 'Camille Howe V', NULL, NULL, NULL, 'matt39@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'jKtoAiRCpf', '2022-01-02 16:41:59', '2022-01-02 16:41:59'),
(68, 'Orville Gutkowski', NULL, NULL, NULL, 'bernier.mauricio@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'pUZ8WCnzEa', '2022-01-02 16:41:59', '2022-01-02 16:41:59'),
(69, 'Ward Farrell', NULL, NULL, NULL, 'xgerlach@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'JrKUYJqtwg', '2022-01-02 16:41:59', '2022-01-02 16:41:59'),
(70, 'Priscilla Lueilwitz', NULL, NULL, NULL, 'lesch.wilfrid@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'pSzJ1p0jQo', '2022-01-02 16:41:59', '2022-01-02 16:41:59'),
(71, 'Carlo McDermott', NULL, NULL, NULL, 'osvaldo.collier@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'trs4LuxNbE', '2022-01-02 16:41:59', '2022-01-02 16:41:59'),
(72, 'Dejon Stroman I', NULL, NULL, NULL, 'rau.tara@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'HT7DbXebI4', '2022-01-02 16:41:59', '2022-01-02 16:41:59'),
(73, 'Arnulfo Windler I', NULL, NULL, NULL, 'lauren62@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '4rBvydPy1c', '2022-01-02 16:41:59', '2022-01-02 16:41:59'),
(74, 'Orville Aufderhar PhD', NULL, NULL, NULL, 'schmeler.helmer@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'CKrQByTd0V', '2022-01-02 16:41:59', '2022-01-02 16:41:59'),
(75, 'Rafaela Lang', NULL, NULL, NULL, 'narciso.runolfsdottir@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'BDMUF07Bh9', '2022-01-02 16:41:59', '2022-01-02 16:41:59'),
(76, 'Joel Heidenreich', NULL, NULL, NULL, 'alverta.schulist@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '5Hzad0jKNW', '2022-01-02 16:41:59', '2022-01-02 16:41:59'),
(77, 'Maiya Dach III', NULL, NULL, NULL, 'bergnaum.sam@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'Lz6If5zLN5', '2022-01-02 16:42:00', '2022-01-02 16:42:00'),
(78, 'Alex Willms', NULL, NULL, NULL, 'ppfeffer@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'nWpHUCR1GZ', '2022-01-02 16:42:00', '2022-01-02 16:42:00'),
(79, 'Clair Rogahn', NULL, NULL, NULL, 'ezra.koch@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'nuwB7GqUqx', '2022-01-02 16:42:00', '2022-01-02 16:42:00'),
(80, 'Graciela Lindgren', NULL, NULL, NULL, 'fschmeler@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'jvMPhgIlqV', '2022-01-02 16:42:00', '2022-01-02 16:42:00'),
(81, 'Mr. Sim Renner', NULL, NULL, NULL, 'zieme.elva@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'HjA69YWfpT', '2022-01-02 16:42:00', '2022-01-02 16:42:00'),
(82, 'Keara Tremblay', NULL, NULL, NULL, 'cara.lind@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'cDkL6AXpfu', '2022-01-02 16:42:00', '2022-01-02 16:42:00'),
(83, 'Emmett Walter', NULL, NULL, NULL, 'wilkinson.retha@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'eM0K5lIkwT', '2022-01-02 16:42:00', '2022-01-02 16:42:00'),
(84, 'Jerrell Collins', NULL, NULL, NULL, 'johanna.nienow@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '6eta1ZVxlZ', '2022-01-02 16:42:00', '2022-01-02 16:42:00'),
(85, 'Jeramy Dicki', NULL, NULL, NULL, 'becker.elvie@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'lz9I0l7yPy', '2022-01-02 16:42:00', '2022-01-02 16:42:00'),
(86, 'Dr. Curt Schowalter Jr.', NULL, NULL, NULL, 'georgette.ritchie@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'pd3mfdg32B', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(87, 'Dane Kovacek', NULL, NULL, NULL, 'montana.parker@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'fO45b7Emvn', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(88, 'Prof. Amber Sanford', NULL, NULL, NULL, 'fleta59@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'qA96K5wUPd', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(89, 'Paris Douglas', NULL, NULL, NULL, 'fhamill@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'RD00g4BR3s', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(90, 'Alfreda Schumm I', NULL, NULL, NULL, 'abraham82@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'bcdJy3N3Pi', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(91, 'Valentin Jaskolski V', NULL, NULL, NULL, 'lavada65@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'LznqyDq5Pt', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(92, 'Ewald Boehm', NULL, NULL, NULL, 'damon.nicolas@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'waoY2IGu2R', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(93, 'Jeremy Spinka', NULL, NULL, NULL, 'julien67@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, '1Zk3hMy0bE', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(94, 'Torrance Spencer', NULL, NULL, NULL, 'wilma06@example.org', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'F6dSlQdnxo', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(95, 'Damion Hauck', NULL, NULL, NULL, 'darwin.schumm@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'A9lvY76OGe', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(96, 'Layla Kuphal Jr.', NULL, NULL, NULL, 'ciara14@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'v2XuAFnBd6', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(97, 'Dr. Barbara Christiansen', NULL, NULL, NULL, 'brent37@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'cnCp6n0txd', '2022-01-02 16:42:01', '2022-01-02 16:42:01'),
(98, 'Jaden Rohan', NULL, NULL, NULL, 'uschmidt@example.net', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'eCYRDCxQXv', '2022-01-02 16:42:02', '2022-01-02 16:42:02'),
(99, 'Francesco Blanda', NULL, NULL, NULL, 'fzboncak@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'XUcfs36Ikg', '2022-01-02 16:42:02', '2022-01-02 16:42:02'),
(100, 'Mr. Rogelio Reinger', NULL, NULL, NULL, 'oboyle@example.com', NULL, '2022-01-02 16:41:56', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1, 'YRkB8s4izN', '2022-01-02 16:42:02', '2022-01-02 16:42:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_fees`
--
ALTER TABLE `additional_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `additional_fees_sid_index` (`sid`),
  ADD KEY `additional_fees_class_index` (`class`),
  ADD KEY `additional_fees_user_id_index` (`user_id`),
  ADD KEY `additional_fees_schoolid_index` (`schoolId`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_s_m_s`
--
ALTER TABLE `bulk_s_m_s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bulk_s_m_s_student_id_index` (`student_id`),
  ADD KEY `bulk_s_m_s_class_index` (`class`),
  ADD KEY `bulk_s_m_s_number_index` (`number`),
  ADD KEY `bulk_s_m_s_type_index` (`type`),
  ADD KEY `bulk_s_m_s_message_index` (`message`),
  ADD KEY `bulk_s_m_s_schoolid_index` (`schoolId`);

--
-- Indexes for table `bursaries`
--
ALTER TABLE `bursaries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bursaries_sid_index` (`sid`),
  ADD KEY `bursaries_class_index` (`class`),
  ADD KEY `bursaries_bid_index` (`bId`),
  ADD KEY `bursaries_user_id_index` (`user_id`),
  ADD KEY `bursaries_schoolid_index` (`schoolId`);

--
-- Indexes for table `bursary_categories`
--
ALTER TABLE `bursary_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bursary_categories_user_id_index` (`user_id`),
  ADD KEY `bursary_categories_schoolid_index` (`schoolId`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schoolId` (`schoolId`);

--
-- Indexes for table `current_settings`
--
ALTER TABLE `current_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `current_settings_userid_index` (`userId`),
  ADD KEY `current_settings_schoolid_index` (`schoolId`);

--
-- Indexes for table `enrolled_students`
--
ALTER TABLE `enrolled_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrolled_students_sid_index` (`sid`),
  ADD KEY `enrolled_students_class_index` (`class`),
  ADD KEY `enrolled_students_term_index` (`term`),
  ADD KEY `enrolled_students_year_index` (`year`),
  ADD KEY `enrolled_students_user_id_index` (`user_id`),
  ADD KEY `enrolled_students_schoolid_index` (`schoolId`);

--
-- Indexes for table `exam_comments`
--
ALTER TABLE `exam_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_comments_term_index` (`term`),
  ADD KEY `exam_comments_year_index` (`year`),
  ADD KEY `exam_comments_stream_index` (`stream`),
  ADD KEY `exam_comments_class_index` (`class`),
  ADD KEY `exam_comments_comment_index` (`comment`(768)),
  ADD KEY `exam_comments_added_by_index` (`added_by`),
  ADD KEY `exam_comments_schoolid_index` (`schoolId`),
  ADD KEY `schoolId` (`schoolId`);

--
-- Indexes for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_marks_sub_index` (`sub`),
  ADD KEY `exam_marks_type_index` (`type`),
  ADD KEY `exam_marks_term_index` (`term`),
  ADD KEY `exam_marks_year_index` (`year`),
  ADD KEY `exam_marks_stream_index` (`stream`),
  ADD KEY `exam_marks_class_index` (`class`),
  ADD KEY `schoolId` (`schoolId`),
  ADD KEY `marks` (`marks`(768));

--
-- Indexes for table `exemptions`
--
ALTER TABLE `exemptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exemptions_sid_index` (`sid`),
  ADD KEY `exemptions_class_index` (`class`),
  ADD KEY `exemptions_user_id_index` (`user_id`),
  ADD KEY `exemptions_schoolid_index` (`schoolId`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_fyearid_index` (`fyearId`),
  ADD KEY `expenses_mode_index` (`mode`),
  ADD KEY `expenses_userid_index` (`userId`),
  ADD KEY `expenses_schoolid_index` (`schoolId`);

--
-- Indexes for table `expense_carts`
--
ALTER TABLE `expense_carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_carts_itemid_index` (`itemId`),
  ADD KEY `expense_carts_userid_index` (`userId`),
  ADD KEY `expense_carts_schoolid_index` (`schoolId`);

--
-- Indexes for table `expense_details`
--
ALTER TABLE `expense_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_details_expid_index` (`expId`),
  ADD KEY `expense_details_itemid_index` (`itemId`),
  ADD KEY `expense_details_fyearid_index` (`fyearId`),
  ADD KEY `expense_details_userid_index` (`userId`),
  ADD KEY `expense_details_schoolid_index` (`schoolId`);

--
-- Indexes for table `exp_categories`
--
ALTER TABLE `exp_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exp_categories_userid_index` (`userId`),
  ADD KEY `exp_categories_schoolid_index` (`schoolId`);

--
-- Indexes for table `exp_items`
--
ALTER TABLE `exp_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exp_items_categoryid_index` (`categoryId`),
  ADD KEY `exp_items_userid_index` (`userId`),
  ADD KEY `exp_items_schoolid_index` (`schoolId`);

--
-- Indexes for table `exp_projections`
--
ALTER TABLE `exp_projections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exp_projections_itemid_index` (`itemId`),
  ADD KEY `exp_projections_fyearid_index` (`fyearId`),
  ADD KEY `exp_projections_amount_index` (`amount`),
  ADD KEY `exp_projections_userid_index` (`userId`),
  ADD KEY `exp_projections_schoolid_index` (`schoolId`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_items`
--
ALTER TABLE `fees_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_items_user_id_index` (`user_id`),
  ADD KEY `fees_items_schoolid_index` (`schoolId`);

--
-- Indexes for table `fees_payments`
--
ALTER TABLE `fees_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_payments_sid_index` (`sid`),
  ADD KEY `fees_payments_class_index` (`class`),
  ADD KEY `fees_payments_mode_index` (`mode`),
  ADD KEY `fees_payments_user_id_index` (`user_id`),
  ADD KEY `fees_payments_schoolid_index` (`schoolId`);

--
-- Indexes for table `fees_settings`
--
ALTER TABLE `fees_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_settings_item_id_index` (`item_id`),
  ADD KEY `fees_settings_amount_index` (`amount`),
  ADD KEY `fees_settings_class_index` (`class`),
  ADD KEY `fees_settings_user_id_index` (`user_id`),
  ADD KEY `fees_settings_schoolid_index` (`schoolId`);

--
-- Indexes for table `financial_years`
--
ALTER TABLE `financial_years`
  ADD PRIMARY KEY (`id`),
  ADD KEY `financial_years_user_id_index` (`user_id`),
  ADD KEY `financial_years_schoolid_index` (`schoolId`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modes`
--
ALTER TABLE `modes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modes_user_id_index` (`user_id`),
  ADD KEY `modes_schoolid_index` (`schoolId`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pass_marks`
--
ALTER TABLE `pass_marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pass_marks_class_index` (`class`),
  ADD KEY `pass_marks_mark_type_index` (`mark_type`),
  ADD KEY `pass_marks_marks_index` (`marks`),
  ADD KEY `pass_marks_year_index` (`year`),
  ADD KEY `pass_marks_schoolid_index` (`schoolId`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_user_id_index` (`user_id`),
  ADD KEY `permissions_schoolid_index` (`schoolId`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `previous_debts`
--
ALTER TABLE `previous_debts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `previous_debts_sid_index` (`sId`),
  ADD KEY `previous_debts_classid_index` (`classId`),
  ADD KEY `previous_debts_term_index` (`term`),
  ADD KEY `previous_debts_userid_index` (`userId`),
  ADD KEY `previous_debts_schoolid_index` (`schoolId`);

--
-- Indexes for table `revenues`
--
ALTER TABLE `revenues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revenues_categoryid_index` (`categoryId`),
  ADD KEY `revenues_fyearid_index` (`fyearId`),
  ADD KEY `revenues_mode_index` (`mode`),
  ADD KEY `revenues_userid_index` (`userId`),
  ADD KEY `revenues_schoolid_index` (`schoolId`);

--
-- Indexes for table `rev_categories`
--
ALTER TABLE `rev_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rev_categories_userid_index` (`userId`),
  ADD KEY `rev_categories_schoolid_index` (`schoolId`);

--
-- Indexes for table `rev_projections`
--
ALTER TABLE `rev_projections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rev_projections_categoryid_index` (`categoryId`),
  ADD KEY `rev_projections_fyearid_index` (`fyearId`),
  ADD KEY `rev_projections_amount_index` (`amount`),
  ADD KEY `rev_projections_userid_index` (`userId`),
  ADD KEY `rev_projections_schoolid_index` (`schoolId`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stream` (`stream`),
  ADD KEY `class` (`class`),
  ADD KEY `schoolId` (`schoolId`),
  ADD KEY `year` (`year`),
  ADD KEY `term` (`term`),
  ADD KEY `residence` (`residence`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers_userid_index` (`userId`),
  ADD KEY `suppliers_schoolid_index` (`schoolId`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teaches_class_id_index` (`class_id`),
  ADD KEY `teaches_subject_id_index` (`subject_id`),
  ADD KEY `teaches_staff_id_index` (`staff_id`),
  ADD KEY `teaches_user_id_index` (`user_id`),
  ADD KEY `teaches_schoolid_index` (`schoolId`);

--
-- Indexes for table `test_sets`
--
ALTER TABLE `test_sets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_sets_user_id_index` (`user_id`),
  ADD KEY `test_sets_schoolid_index` (`schoolId`);

--
-- Indexes for table `test_set_considerations`
--
ALTER TABLE `test_set_considerations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_set_considerations_test_index` (`test`),
  ADD KEY `test_set_considerations_user_id_index` (`user_id`),
  ADD KEY `test_set_considerations_schoolid_index` (`schoolId`),
  ADD KEY `year` (`year`);

--
-- Indexes for table `test_set_contributions`
--
ALTER TABLE `test_set_contributions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_set_contributions_test_index` (`test`),
  ADD KEY `test_set_contributions_class_index` (`class`),
  ADD KEY `test_set_contributions_user_id_index` (`user_id`),
  ADD KEY `test_set_contributions_schoolid_index` (`schoolId`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_mode_index` (`mode`),
  ADD KEY `transactions_transactionid_index` (`transactionId`),
  ADD KEY `transactions_schoolid_index` (`schoolId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_fees`
--
ALTER TABLE `additional_fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `bulk_s_m_s`
--
ALTER TABLE `bulk_s_m_s`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bursaries`
--
ALTER TABLE `bursaries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bursary_categories`
--
ALTER TABLE `bursary_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `current_settings`
--
ALTER TABLE `current_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enrolled_students`
--
ALTER TABLE `enrolled_students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `exam_comments`
--
ALTER TABLE `exam_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `exemptions`
--
ALTER TABLE `exemptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expense_carts`
--
ALTER TABLE `expense_carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `expense_details`
--
ALTER TABLE `expense_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exp_categories`
--
ALTER TABLE `exp_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_items`
--
ALTER TABLE `exp_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exp_projections`
--
ALTER TABLE `exp_projections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_items`
--
ALTER TABLE `fees_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fees_payments`
--
ALTER TABLE `fees_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fees_settings`
--
ALTER TABLE `fees_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `financial_years`
--
ALTER TABLE `financial_years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `modes`
--
ALTER TABLE `modes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pass_marks`
--
ALTER TABLE `pass_marks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `previous_debts`
--
ALTER TABLE `previous_debts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revenues`
--
ALTER TABLE `revenues`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rev_categories`
--
ALTER TABLE `rev_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rev_projections`
--
ALTER TABLE `rev_projections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `savings`
--
ALTER TABLE `savings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teaches`
--
ALTER TABLE `teaches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `test_sets`
--
ALTER TABLE `test_sets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_set_considerations`
--
ALTER TABLE `test_set_considerations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test_set_contributions`
--
ALTER TABLE `test_set_contributions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
