-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:8080
-- Generation Time: Jul 03, 2021 at 11:53 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointmentreq`
--
CREATE DATABASE hospital;
USE hospital;
CREATE TABLE `appointmentreq` (
  `PatID` varchar(10) NOT NULL,
  `DocID` varchar(10) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Approved` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointmentreq`
--

INSERT INTO `appointmentreq` (`PatID`, `DocID`, `Date`, `Approved`) VALUES
('P001', 'D001', '2/4', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `ChannelID` varchar(10) NOT NULL,
  `PatientName` varchar(100) NOT NULL,
  `Age` int(10) NOT NULL,
  `RoomNo` varchar(7) NOT NULL,
  `Prescribed` varchar(5) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`ChannelID`, `PatientName`, `Age`, `RoomNo`, `Prescribed`) VALUES
('C001', 'ABC', 89, '765', 'YES'),
('c002', 'ABC', 89, '765', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `createchannel`
--

CREATE TABLE `createchannel` (
  `ChannelID` varchar(10) NOT NULL,
  `DocID` varchar(10) NOT NULL,
  `PatID` varchar(10) NOT NULL,
  `Date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `createchannel`
--

INSERT INTO `createchannel` (`ChannelID`, `DocID`, `PatID`, `Date`) VALUES
('C001', 'D001', 'P001', '2/4');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DocID` varchar(10) NOT NULL,
  `DocName` varchar(100) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `EmailID` varchar(50) NOT NULL,
  `Room` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DocID`, `DocName`, `Department`, `PhoneNo`, `EmailID`, `Room`) VALUES
('D001', 'DOC1', 'ORTHO', '9865567867', 'DOC@GMAIL.COM', '765');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `DrugID` varchar(8) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` bigint(50) NOT NULL,
  `Purchased` bigint(50) NOT NULL,
  `Sold` bigint(50) NOT NULL,
  `Left` bigint(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`DrugID`, `Name`, `Price`, `Purchased`, `Sold`, `Left`) VALUES
('DR001', 'DRUG1', 10, 10, 2, 8),
('DR002', 'DRUG2', 67, 14, 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `UserID` varchar(10) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `UserType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`UserID`, `UserName`, `Password`, `UserType`) VALUES
('REC001', 'JOHN', 'JOHN', 'RECEPTIONIST'),
('P001', 'ABC', 'ABC', 'PATIENT'),
('D001', 'DOC1', 'DOC1', 'DOCTOR'),
('PH001', 'PHARMA', 'PHARMA', 'PHARMACIST');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatID` varchar(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Age` varchar(90) NOT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `EmailID` varchar(100) NOT NULL,
  `Address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatID`, `Name`, `Age`, `PhoneNo`, `EmailID`, `Address`) VALUES
('P001', 'ABC', '89', '9876543210', 'ABC@GMAIL.COM', 'XYZB');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `PID` varchar(5) NOT NULL,
  `CID` varchar(5) NOT NULL,
  `DiseaseType` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Billing` varchar(10) NOT NULL DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`PID`, `CID`, `DiseaseType`, `Description`, `Billing`) VALUES
('PR001', 'C001', 'XYZ', 'DRUG1,DRUG2', 'DONE');

-- --------------------------------------------------------

--
-- Table structure for table `salesproduct`
--

CREATE TABLE `salesproduct` (
  `SalesID` varchar(10) NOT NULL,
  `ProdID` varchar(10) NOT NULL,
  `Quantity` int(100) NOT NULL,
  `Price` decimal(50,0) NOT NULL,
  `Total` decimal(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesproduct`
--

INSERT INTO `salesproduct` (`SalesID`, `ProdID`, `Quantity`, `Price`, `Total`) VALUES
('4', 'PR001', 10, '2', '20'),
('4', 'PR001', 67, '14', '938');

-- --------------------------------------------------------

--
-- Table structure for table `salesreport`
--

CREATE TABLE `salesreport` (
  `SalesID` int(8) NOT NULL,
  `Date` date NOT NULL,
  `Subtotal` bigint(11) NOT NULL,
  `Pay` bigint(11) NOT NULL,
  `Balance` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salesreport`
--

INSERT INTO `salesreport` (`SalesID`, `Date`, `Subtotal`, `Pay`, `Balance`) VALUES
(4, '2020-06-16', 958, 1000, 42);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `salesreport`
--
ALTER TABLE `salesreport`
  ADD PRIMARY KEY (`SalesID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `salesreport`
--
ALTER TABLE `salesreport`
  MODIFY `SalesID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
