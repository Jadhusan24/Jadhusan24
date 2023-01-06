-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1/phpmyadmin/
-- Generation Time: November 30, 2022 at 12:59 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aia`
--

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary`
--

DROP TABLE IF EXISTS `beneficiary`;
CREATE TABLE IF NOT EXISTS `beneficiary` (
  `Bene_Id` varchar(15) NOT NULL,
  `Policy_Number` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Contact_Number` int(11) NOT NULL,
  `Relationship` varchar(20) NOT NULL,
  `Percentage` int(11) NOT NULL,
  PRIMARY KEY (`Bene_Id`,`Policy_Number`),
  KEY `myfk1` (`Bene_Id`) USING BTREE,
  KEY `myfk2` (`Policy_Number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branch_staff`
--

DROP TABLE IF EXISTS `branch_staff`;
CREATE TABLE IF NOT EXISTS `branch_staff` (
  `Employee_Id` int(11) NOT NULL,
  `Score` int(11) NOT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `claim`
--

DROP TABLE IF EXISTS `claim`;
CREATE TABLE IF NOT EXISTS `claim` (
  `Claim_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) NOT NULL,
  `Doc` mediumblob NOT NULL,
  `Requested_Date` date NOT NULL,
  `Approved_Date` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `ClaimsManager_ID` int(11) NOT NULL,
  `Pol_No` int(11) NOT NULL,
  PRIMARY KEY (`Claim_Id`),
  KEY `fk1` (`ClaimsManager_ID`),
  KEY `fk2` (`Pol_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `claims_manager`
--

DROP TABLE IF EXISTS `claims_manager`;
CREATE TABLE IF NOT EXISTS `claims_manager` (
  `Employee_Id` int(11) NOT NULL,
  `Qualification` varchar(50) NOT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `NIC` varchar(15) NOT NULL,
  `Customer_Name` varchar(50) NOT NULL,
  `Contact_No` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Wealthplanner_Id` int(11) NOT NULL,
  PRIMARY KEY (`NIC`),
  KEY `FK3` (`Wealthplanner_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`NIC`, `Customer_Name`, `Contact_No`, `DOB`, `Gender`, `Address`, `Age`, `Password`, `Wealthplanner_Id`) VALUES
('111111111111', 'shehan', 0, '2000-04-12', '', 'london', 21, '123', 1),
('222222222222', 'vithushan', 0, '2000-04-12', '', 'york', 21, '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `Rec_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Doc_Type` varchar(50) NOT NULL,
  `Doc` mediumblob NOT NULL,
  `Requested_Date` date NOT NULL,
  `Uploaded_Date` date NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `Feedback` varchar(70) NOT NULL,
  `Comment` varchar(70) NOT NULL,
  `Policy_Num` int(11) NOT NULL,
  `Branchstaff_Id` int(11) NOT NULL,
  `UWuser_Id` int(11) NOT NULL,
  PRIMARY KEY (`Rec_Id`),
  KEY `FK8` (`Policy_Num`),
  KEY `FK9` (`Branchstaff_Id`),
  KEY `FK10` (`UWuser_Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `Employee_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Access` int(11) NOT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `letter`
--

DROP TABLE IF EXISTS `letter`;
CREATE TABLE IF NOT EXISTS `letter` (
  `Letter_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Letter_Doc` mediumblob NOT NULL,
  `Requested_Date` date NOT NULL,
  `Uploaded_Date` date NOT NULL,
  `Policy_No` int(11) NOT NULL,
  `Cus_NIC` varchar(15) NOT NULL,
  `Serviceofficer_ID` int(11) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `Request` varchar(100) NOT NULL,
  PRIMARY KEY (`Letter_ID`),
  KEY `FK11` (`Cus_NIC`),
  KEY `FK12` (`Serviceofficer_ID`),
  KEY `fk33` (`Policy_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `Receipt_No` int(11) NOT NULL AUTO_INCREMENT,
  `Amount` decimal(10,2) NOT NULL,
  `Date` date NOT NULL,
  `Policy_No` int(11) NOT NULL,
  PRIMARY KEY (`Receipt_No`),
  KEY `FK15` (`Policy_No`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
CREATE TABLE IF NOT EXISTS `policy` (
  `Policy_No` int(11) NOT NULL AUTO_INCREMENT,
  `Premium` decimal(10,2) NOT NULL,
  `Commencing_Date` date NOT NULL,
  `Maturity_Date` date NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `Cus_ID` varchar(15) NOT NULL,
  `UWuser_Id` int(11) NOT NULL,
  `Product_Id` varchar(50) NOT NULL,
  PRIMARY KEY (`Policy_No`),
  KEY `FK5` (`Cus_ID`),
  KEY `FK6` (`UWuser_Id`),
  KEY `FK7` (`Product_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policy_beneficiary`
--

DROP TABLE IF EXISTS `policy_beneficiary`;
CREATE TABLE IF NOT EXISTS `policy_beneficiary` (
  `Beneficiary_Id` varchar(15) NOT NULL,
  `Policy_Number` int(11) NOT NULL,
  PRIMARY KEY (`Beneficiary_Id`,`Policy_Number`),
  KEY `check222` (`Policy_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Product_Name` varchar(50) NOT NULL,
  `Maturity_Amount` decimal(10,2) NOT NULL,
  `Monthly_Premium` decimal(10,2) NOT NULL,
  `Maturity_Period` int(11) NOT NULL,
  `Productmanager_ID` int(11) NOT NULL,
  PRIMARY KEY (`Product_Name`),
  KEY `FK4` (`Productmanager_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_manager`
--

DROP TABLE IF EXISTS `product_manager`;
CREATE TABLE IF NOT EXISTS `product_manager` (
  `Employee_Id` int(11) NOT NULL,
  `Qualification` varchar(50) NOT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `servicing_officer`
--

DROP TABLE IF EXISTS `servicing_officer`;
CREATE TABLE IF NOT EXISTS `servicing_officer` (
  `Employee_Id` int(11) NOT NULL,
  `Certification` varchar(50) NOT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uw_distributor`
--

DROP TABLE IF EXISTS `uw_distributor`;
CREATE TABLE IF NOT EXISTS `uw_distributor` (
  `Employee_Id` int(11) NOT NULL,
  `Experience` varchar(50) NOT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uw_distributor_user`
--

DROP TABLE IF EXISTS `uw_distributor_user`;
CREATE TABLE IF NOT EXISTS `uw_distributor_user` (
  `Assign_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Distributor_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Policy_Number` int(11) NOT NULL,
  `Assigned_Date` date NOT NULL,
  PRIMARY KEY (`Assign_ID`),
  KEY `fk31` (`User_Id`),
  KEY `fk32` (`Policy_Number`),
  KEY `fk33` (`Distributor_Id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uw_user`
--

DROP TABLE IF EXISTS `uw_user`;
CREATE TABLE IF NOT EXISTS `uw_user` (
  `Employee_Id` int(11) NOT NULL,
  `Level` varchar(15) NOT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wealth_planner`
--

DROP TABLE IF EXISTS `wealth_planner`;
CREATE TABLE IF NOT EXISTS `wealth_planner` (
  `Employee_Id` int(11) NOT NULL,
  `Experience` varchar(50) NOT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch_staff`
--
ALTER TABLE `branch_staff`
  ADD CONSTRAINT `check555` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`Employee_Id`);

--
-- Constraints for table `claims_manager`
--
ALTER TABLE `claims_manager`
  ADD CONSTRAINT `check444` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`Employee_Id`),
  ADD CONSTRAINT `fk789` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`Employee_Id`);

--
-- Constraints for table `policy_beneficiary`
--
ALTER TABLE `policy_beneficiary`
  ADD CONSTRAINT `check222` FOREIGN KEY (`Policy_Number`) REFERENCES `policy` (`Policy_No`),
  ADD CONSTRAINT `check333` FOREIGN KEY (`Beneficiary_Id`) REFERENCES `beneficiary` (`Bene_Id`);

--
-- Constraints for table `product_manager`
--
ALTER TABLE `product_manager`
  ADD CONSTRAINT `check666` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`Employee_Id`);

--
-- Constraints for table `servicing_officer`
--
ALTER TABLE `servicing_officer`
  ADD CONSTRAINT `check777` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`Employee_Id`);

--
-- Constraints for table `uw_distributor`
--
ALTER TABLE `uw_distributor`
  ADD CONSTRAINT `check888` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`Employee_Id`);

--
-- Constraints for table `uw_user`
--
ALTER TABLE `uw_user`
  ADD CONSTRAINT `check999` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`Employee_Id`);

--
-- Constraints for table `wealth_planner`
--
ALTER TABLE `wealth_planner`
  ADD CONSTRAINT `check10` FOREIGN KEY (`Employee_Id`) REFERENCES `employee` (`Employee_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
