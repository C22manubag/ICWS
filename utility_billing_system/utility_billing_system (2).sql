-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2025 at 09:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utility_billing_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Status` enum('active','inactive') DEFAULT 'active',
  `LastLogin` datetime DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `FirstName`, `LastName`, `Email`, `Password`, `Status`, `LastLogin`, `CreatedAt`) VALUES
(1, 'Admin', 'User', 'admin@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'active', '2025-10-20 11:21:32', '2025-10-07 15:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `adminlogs`
--

CREATE TABLE `adminlogs` (
  `LogID` int(11) NOT NULL,
  `AdminID` int(11) DEFAULT NULL,
  `Action` text NOT NULL,
  `IPAddress` varchar(50) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminlogs`
--

INSERT INTO `adminlogs` (`LogID`, `AdminID`, `Action`, `IPAddress`, `Timestamp`) VALUES
(1, 1, 'Admin logged in', '::1', '2025-10-09 05:24:01'),
(2, 1, 'Admin logged in', '::1', '2025-10-09 20:28:58'),
(3, 1, 'Admin logged in', '::1', '2025-10-10 23:35:07'),
(4, 1, 'Admin logged in', '::1', '2025-10-18 10:59:26'),
(5, 1, 'Updated consumer: michaela cristobal (ID: 2)', '::1', '2025-10-18 11:14:37'),
(6, 1, 'Updated consumer: michaela mia (ID: 2)', '::1', '2025-10-19 12:37:31'),
(7, 1, 'Admin logged in', '::1', '2025-10-19 12:39:10'),
(8, 1, 'Updated reader: lucas vesquiza (ID: 1)', '::1', '2025-10-19 13:50:31'),
(9, 1, 'Admin logged in', '::1', '2025-10-19 16:18:44'),
(10, 1, 'Admin logged in', '::1', '2025-10-20 00:50:55'),
(11, 1, 'Admin logged in', '::1', '2025-10-20 03:08:09'),
(12, 1, 'Admin logged in', '::1', '2025-10-20 03:21:32'),
(13, 1, 'Updated consumer: Maria Liza Alforque (ID: 3)', '::1', '2025-10-20 03:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `billingstatement`
--

CREATE TABLE `billingstatement` (
  `BillingID` int(11) NOT NULL,
  `MeterID` int(11) NOT NULL,
  `BillingPeriod` varchar(50) NOT NULL,
  `BillingDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `PreviousReading` decimal(10,2) NOT NULL,
  `CurrentReading` decimal(10,2) NOT NULL,
  `Consumption` decimal(10,2) NOT NULL,
  `RatePerUnit` decimal(10,2) NOT NULL,
  `FixedCharge` decimal(10,2) DEFAULT 0.00,
  `TaxRate` decimal(5,2) DEFAULT 0.00,
  `TaxAmount` decimal(10,2) DEFAULT 0.00,
  `TotalAmount` decimal(10,2) NOT NULL,
  `PaymentStatus` enum('paid','unpaid','overdue') DEFAULT 'unpaid',
  `PaymentDate` datetime DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consumer`
--

CREATE TABLE `consumer` (
  `ConsumerID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ContactNumber` varchar(20) NOT NULL,
  `Address` text NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Status` enum('active','inactive','pending') DEFAULT 'pending',
  `BillingPreference` enum('paper','mobile_app') NOT NULL DEFAULT 'paper',
  `AppNotificationToken` varchar(255) DEFAULT NULL,
  `RegistrationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumer`
--

INSERT INTO `consumer` (`ConsumerID`, `FirstName`, `LastName`, `Email`, `ContactNumber`, `Address`, `Password`, `Status`, `BillingPreference`, `AppNotificationToken`, `RegistrationDate`) VALUES
(1, 'jed angelo', 'manubag', 'jedangelo@gmail.com', '09945830992', 'bahayan', '$2y$10$px8Lq1SBS6bU5pAjXk1VI.nOyI1VCChTAPmqQhGv9UM8Do0yqiU2G', 'pending', 'mobile_app', NULL, '2025-10-18 10:58:13'),
(2, 'michaela', 'mia', 'michaelacristobal1998@gmail.com', '09976075691', 'Tambacan', '$2y$10$mYtTwfbsyVSabjJ5hGHkP../wb1oxhXoWxopUR9Ve7IcU13nyQDpq', 'active', 'mobile_app', NULL, '2025-10-18 11:03:58'),
(3, 'Maria Liza', 'Alforque', 'liza.alforque113@gmail.com', '09659466773', '31 street Purok Falcata Hills, Tubod Iligan City', '$2y$10$SuecP0Epp1Jkavfb.9m/nupvkbYPZovWDyliL1Yw4SpVasJT4Kf7i', 'inactive', 'paper', NULL, '2025-10-20 03:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `meter`
--

CREATE TABLE `meter` (
  `MeterID` int(11) NOT NULL,
  `MeterNumber` varchar(50) NOT NULL,
  `ConsumerID` int(11) DEFAULT NULL,
  `ReaderID` int(11) DEFAULT NULL,
  `Area` varchar(100) DEFAULT NULL,
  `InstallationDate` date NOT NULL,
  `LastReading` decimal(10,2) DEFAULT 0.00,
  `LastReadingDate` datetime DEFAULT NULL,
  `Status` enum('active','inactive','faulty') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meter`
--

INSERT INTO `meter` (`MeterID`, `MeterNumber`, `ConsumerID`, `ReaderID`, `Area`, `InstallationDate`, `LastReading`, `LastReadingDate`, `Status`) VALUES
(1, '2273444242', 2, NULL, 'bahayan', '2025-10-18', 0.00, NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `meterreadingdata`
--

CREATE TABLE `meterreadingdata` (
  `ReadingID` int(11) NOT NULL,
  `MeterID` int(11) NOT NULL,
  `ReaderID` int(11) NOT NULL,
  `PreviousReading` decimal(10,2) NOT NULL,
  `CurrentReading` decimal(10,2) NOT NULL,
  `Consumption` decimal(10,2) NOT NULL,
  `ReadingDate` datetime NOT NULL,
  `Notes` text DEFAULT NULL,
  `Status` enum('pending','approved','rejected') DEFAULT 'pending',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utilityreader`
--

CREATE TABLE `utilityreader` (
  `ReaderID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ContactNumber` varchar(20) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `AuthToken` varchar(255) DEFAULT NULL,
  `Area` varchar(100) DEFAULT NULL,
  `Status` enum('active','inactive') DEFAULT 'active',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utilityreader`
--

INSERT INTO `utilityreader` (`ReaderID`, `FirstName`, `LastName`, `Username`, `Email`, `ContactNumber`, `Password`, `AuthToken`, `Area`, `Status`, `CreatedAt`) VALUES
(1, 'lucas', 'vesquiza', 'lucas', 'lucasvesquiza@gmail.com', '09975821123', '$2y$10$rvCY8zS.0N78zjro2L4/menprypLIfcfYn0x8S.XlZyx9nENUOh4y', NULL, 'luinab', 'active', '2025-10-19 13:50:31'),
(2, 'john', 'doe', 'johndoe', 'john@example.com', '09978907654', '$2y$10$hqUN/zdra.Juj/y1HLVYV.Lykb4iGoCgGNbx/dEUu5cx9OgAaBCMG', 'bc3dd12c20756bbe25d6b8bc25bf5b5d9890fe54a5a2807cda1483a304a5f087', 'palao', 'active', '2025-10-19 16:54:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `adminlogs`
--
ALTER TABLE `adminlogs`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `billingstatement`
--
ALTER TABLE `billingstatement`
  ADD PRIMARY KEY (`BillingID`),
  ADD KEY `MeterID` (`MeterID`);

--
-- Indexes for table `consumer`
--
ALTER TABLE `consumer`
  ADD PRIMARY KEY (`ConsumerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `meter`
--
ALTER TABLE `meter`
  ADD PRIMARY KEY (`MeterID`),
  ADD UNIQUE KEY `MeterNumber` (`MeterNumber`),
  ADD KEY `ConsumerID` (`ConsumerID`),
  ADD KEY `ReaderID` (`ReaderID`);

--
-- Indexes for table `meterreadingdata`
--
ALTER TABLE `meterreadingdata`
  ADD PRIMARY KEY (`ReadingID`),
  ADD KEY `MeterID` (`MeterID`),
  ADD KEY `ReaderID` (`ReaderID`);

--
-- Indexes for table `utilityreader`
--
ALTER TABLE `utilityreader`
  ADD PRIMARY KEY (`ReaderID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `idx_authtoken` (`AuthToken`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `adminlogs`
--
ALTER TABLE `adminlogs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `billingstatement`
--
ALTER TABLE `billingstatement`
  MODIFY `BillingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consumer`
--
ALTER TABLE `consumer`
  MODIFY `ConsumerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `meter`
--
ALTER TABLE `meter`
  MODIFY `MeterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meterreadingdata`
--
ALTER TABLE `meterreadingdata`
  MODIFY `ReadingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utilityreader`
--
ALTER TABLE `utilityreader`
  MODIFY `ReaderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminlogs`
--
ALTER TABLE `adminlogs`
  ADD CONSTRAINT `adminlogs_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`) ON DELETE SET NULL;

--
-- Constraints for table `billingstatement`
--
ALTER TABLE `billingstatement`
  ADD CONSTRAINT `billingstatement_ibfk_1` FOREIGN KEY (`MeterID`) REFERENCES `meter` (`MeterID`) ON DELETE CASCADE;

--
-- Constraints for table `meter`
--
ALTER TABLE `meter`
  ADD CONSTRAINT `meter_ibfk_1` FOREIGN KEY (`ConsumerID`) REFERENCES `consumer` (`ConsumerID`) ON DELETE SET NULL,
  ADD CONSTRAINT `meter_ibfk_2` FOREIGN KEY (`ReaderID`) REFERENCES `utilityreader` (`ReaderID`) ON DELETE SET NULL;

--
-- Constraints for table `meterreadingdata`
--
ALTER TABLE `meterreadingdata`
  ADD CONSTRAINT `meterreadingdata_ibfk_1` FOREIGN KEY (`MeterID`) REFERENCES `meter` (`MeterID`) ON DELETE CASCADE,
  ADD CONSTRAINT `meterreadingdata_ibfk_2` FOREIGN KEY (`ReaderID`) REFERENCES `utilityreader` (`ReaderID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
