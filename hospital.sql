DROP SCHEMA IF Exists hospital;
CREATE SCHEMA hospital;
USE hospital;
DROP TABLE IF EXISTS appointmentreq;
CREATE TABLE `appointmentreq` (
  `PatID` varchar(10) NOT NULL,
  `DocID` varchar(10) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Approved` varchar(10) NOT NULL
) ;
INSERT INTO `appointmentreq` (`PatID`, `DocID`, `Date`, `Approved`) VALUES
('P001', 'D001', '2/4', 'NO');

DROP TABLE IF EXISTS channel;
CREATE TABLE `channel` (
  `ChannelID` varchar(10) NOT NULL,
  `PatientName` varchar(100) NOT NULL,
  `Age` int(10) NOT NULL,
  `RoomNo` varchar(7) NOT NULL,
  `Prescribed` varchar(5) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `channel` (`ChannelID`, `PatientName`, `Age`, `RoomNo`, `Prescribed`) VALUES
('C001', 'ABC', 89, '765', 'YES'),
('c002', 'ABC', 89, '765', 'NO');

drop table if exists createchannel;
CREATE TABLE `createchannel` (
  `ChannelID` varchar(10) NOT NULL,
  `DocID` varchar(10) NOT NULL,
  `PatID` varchar(10) NOT NULL,
  `Date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `createchannel` (`ChannelID`, `DocID`, `PatID`, `Date`) VALUES
('C001', 'D001', 'P001', '2/4');

drop table if exists doctor;
CREATE TABLE `doctor` (
  `DocID` varchar(10) NOT NULL,
  `DocName` varchar(100) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `EmailID` varchar(50) NOT NULL,
  `Room` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `doctor` (`DocID`, `DocName`, `Department`, `PhoneNo`, `EmailID`, `Room`) VALUES
('D001', 'DOC1', 'ORTHO', '9865567867', 'DOC@GMAIL.COM', '765');

drop table if exists drugs;
CREATE TABLE `drugs` (
  `DrugID` varchar(8) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` bigint(50) NOT NULL,
  `Purchased` bigint(50) NOT NULL,
  `Sold` bigint(50) NOT NULL,
  `Left` bigint(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `drugs` (`DrugID`, `Name`, `Price`, `Purchased`, `Sold`, `Left`) VALUES
('DR001', 'DRUG1', 10, 10, 2, 8),
('DR002', 'DRUG2', 67, 14, 14, 0);

drop table if exists login;
CREATE TABLE `login` (
  `UserID` varchar(10) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `UserType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `login` (`UserID`, `UserName`, `Password`, `UserType`) VALUES
('REC001', 'JOHN', 'JOHN', 'RECEPTIONIST'),
('P001', 'ABC', 'ABC', 'PATIENT'),
('D001', 'DOC1', 'DOC1', 'DOCTOR'),
('PH001', 'PHARMA', 'PHARMA', 'PHARMACIST');

drop table if exists patient;
CREATE TABLE `patient` (
  `PatID` varchar(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Age` varchar(90) NOT NULL,
  `PhoneNo` varchar(10) NOT NULL,
  `EmailID` varchar(100) NOT NULL,
  `Address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `patient` (`PatID`, `Name`, `Age`, `PhoneNo`, `EmailID`, `Address`) VALUES
('P001', 'ABC', '89', '9876543210', 'ABC@GMAIL.COM', 'XYZB');

drop table if exists prescription;
CREATE TABLE `prescription` (
  `PID` varchar(5) NOT NULL,
  `CID` varchar(5) NOT NULL,
  `DiseaseType` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Billing` varchar(10) NOT NULL DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `prescription` (`PID`, `CID`, `DiseaseType`, `Description`, `Billing`) VALUES
('PR001', 'C001', 'XYZ', 'DRUG1,DRUG2', 'DONE');

drop table if exists salesproduct;
CREATE TABLE `salesproduct` (
  `SalesID` varchar(10) NOT NULL,
  `ProdID` varchar(10) NOT NULL,
  `Quantity` int(100) NOT NULL,
  `Price` decimal(50,0) NOT NULL,
  `Total` decimal(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `salesproduct` (`SalesID`, `ProdID`, `Quantity`, `Price`, `Total`) VALUES
('4', 'PR001', 10, '2', '20'),
('4', 'PR001', 67, '14', '938');

drop table if exists salesreport;
CREATE TABLE `salesreport` (
  `SalesID` int(8) NOT NULL,
  `Date` date NOT NULL,
  `Subtotal` bigint(11) NOT NULL,
  `Pay` bigint(11) NOT NULL,
  `Balance` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `salesreport` (`SalesID`, `Date`, `Subtotal`, `Pay`, `Balance`) VALUES
(4, '2020-06-16', 958, 1000, 42);

ALTER TABLE `salesreport`
  ADD PRIMARY KEY (`SalesID`);

ALTER TABLE `salesreport`
  MODIFY `SalesID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
