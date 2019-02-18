-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 18, 2019 at 07:33 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theclinic`
--
CREATE DATABASE IF NOT EXISTS `theclinic` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `theclinic`;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `app_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(30) DEFAULT NULL,
  `appointment_day` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `reminder` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`app_id`, `service_id`, `patient_id`, `patient_name`, `appointment_day`, `status`, `reminder`) VALUES
(1, 1, 3, NULL, '2019-02-18', NULL, '2019-02-18'),
(2, 1, 3, NULL, '2019-02-18', 'Cancelled', '2019-02-18');

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE `consultations` (
  `cons_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `consultation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `test_results` varchar(150) DEFAULT NULL,
  `consultation_results` varchar(150) DEFAULT NULL,
  `drug_id` int(11) NOT NULL,
  `recep_id` int(11) NOT NULL,
  `pharmacist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultations`
--

INSERT INTO `consultations` (`cons_id`, `service_id`, `patient_id`, `consultation_date`, `test_results`, `consultation_results`, `drug_id`, `recep_id`, `pharmacist_id`) VALUES
(1, 1, 3, '2019-02-18 05:58:38', 'issa boy', ' vitamins', 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(30) NOT NULL,
  `drug_type` varchar(30) NOT NULL,
  `stock` int(5) NOT NULL,
  `price` int(10) DEFAULT NULL,
  `pharmacist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`drug_id`, `drug_name`, `drug_type`, `stock`, `price`, `pharmacist_id`) VALUES
(1, 'Ibruprofen', 'Anti-biotic', 50, 500, 0),
(2, 'Magnetris', 'Gas', 34, 300, 0),
(3, 'Vitamin B', 'Vitamins', 79, 800, 0),
(4, 'LA', 'Malarial Drug', 60, 700, 0),
(5, 'Paracetamol', 'Anti-biotic', 30, 400, 0);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `contact` int(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `fname`, `lname`, `dob`, `address`, `contact`, `username`, `pass`) VALUES
(1, 'Ahmed', 'Muhammed', '1980-03-03', 'P.O Box 313, Lilongwe', 996123123, 'manager', '');

-- --------------------------------------------------------

--
-- Table structure for table `medical_schemes`
--

CREATE TABLE `medical_schemes` (
  `scheme_id` int(11) NOT NULL,
  `scheme_name` varchar(50) NOT NULL,
  `scheme_type` varchar(50) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `validity` varchar(20) DEFAULT NULL,
  `manager_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medical_schemes`
--

INSERT INTO `medical_schemes` (`scheme_id`, `scheme_name`, `scheme_type`, `provider_id`, `validity`, `manager_id`) VALUES
(1, 'MASM', 'MASM Scheme', 3, '1 Year', 0),
(2, 'Employee Dependent Medical Plan', 'MRA Medical Scheme', 1, '1 year', 0),
(3, 'Employee Plan', 'MDF Scheme', 2, '1 year', 0),
(4, 'VIP Scheme', 'VIP Health Plan', 4, '6 months', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `sex` varchar(7) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact` int(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `dependent` varchar(30) DEFAULT NULL,
  `dependent_contact` varchar(15) DEFAULT NULL,
  `scheme_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `fname`, `lname`, `sex`, `dob`, `address`, `contact`, `email`, `dependent`, `dependent_contact`, `scheme_id`) VALUES
(1, 'John', 'Smith', 'Male', '1970-07-01', 'P.O Box 21, Lilongwe', 999637987, 'js@ymail.com', 'Neil Don', '144562689', 1),
(2, 'Hong', 'Wang', 'Male', '1930-08-08', 'P.O Box 9, Lilongwe', 888746318, 'wang@gmail.com', 'Lee Wang', '888168325', 3),
(3, 'Chimwemwe', 'Lobwe', 'Female', '1993-07-03', 'Box 69, Blantyre', 888696969, 'chimz@gmail.com', 'Al Khal', '999969696', 3),
(4, 'Cain', 'Pers', 'Male', '1900-01-01', 'Box 1, Chitipa', 111111111, 'cain@abel.com', 'Abel Pers', '111122222', 3),
(5, 'Lois', 'Lane', 'Female', '1970-05-06', 'P.O Box 5', 888461357, 'brucechitsa16@gmail.com', 'Kent Clart', '999555555', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `pharmacist_id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `contact` int(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`pharmacist_id`, `fname`, `lname`, `dob`, `address`, `contact`, `username`, `pass`) VALUES
(1, 'Paul', 'Zitaye', '1985-07-01', 'P.O Box 23, Lilongwe', 995987987, 'pharmacy', ''),
(2, 'Marcus', 'Fodi', '1998-05-08', 'P.O Box 90, Lilongwe', 999852641, 'marcus19', '');

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL,
  `provider_name` varchar(40) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `contact` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`provider_id`, `provider_name`, `address`, `email`, `contact`) VALUES
(1, 'Malawi Revenue Authority', 'P. Bag 1135', 'mra@c.com', 11126589),
(2, 'Malawi Defence Force', 'P. Bag 43', 'mdf@mdf.com', 111268479),
(3, 'Medical Aid Society of Malawi', 'P. Bag 67', 'masm@masm.org', 11132158),
(4, 'The Clinic', 'P. Bag 6', 'theclinic@gmail.com', 11138794);

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `recep_id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `contact` int(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`recep_id`, `fname`, `lname`, `dob`, `address`, `contact`, `username`, `pass`) VALUES
(1, 'Mary', 'Banda', '1989-05-06', 'P.O Box 45, Lumbadzi', 881456456, 'reception', ''),
(2, 'Pheona', 'Phiri', '1974-06-02', 'P.O. Box 43, Lilongwe', 224653187, 'pheona', '');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `report` varchar(100) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `report_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `report`, `patient_id`, `service_id`, `report_date`) VALUES
(1, ' dsds', 3, 1, '2019-02-18 06:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(30) NOT NULL,
  `charge` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_name`, `charge`) VALUES
(1, 'Ultrasound Scanning', 8000),
(2, 'Malaria Test', 1500),
(3, 'VCT Service', 2000),
(4, 'X-Ray', 5200),
(5, 'Surgery', 20000),
(6, 'Consultation', 2000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `fk_serv` (`service_id`),
  ADD KEY `fk_pat` (`patient_id`);

--
-- Indexes for table `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`cons_id`),
  ADD KEY `fk_service` (`service_id`),
  ADD KEY `fk_patient` (`patient_id`),
  ADD KEY `fk_drugs` (`drug_id`),
  ADD KEY `fk_recep` (`recep_id`),
  ADD KEY `fk_pharmac` (`pharmacist_id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drug_id`),
  ADD KEY `fk_pharma` (`pharmacist_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `medical_schemes`
--
ALTER TABLE `medical_schemes`
  ADD PRIMARY KEY (`scheme_id`),
  ADD KEY `fk_mangr` (`manager_id`),
  ADD KEY `fk_provr` (`provider_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `fk_scheme` (`scheme_id`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`pharmacist_id`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`provider_id`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`recep_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `fk_pid` (`patient_id`),
  ADD KEY `fk_serid` (`service_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `cons_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `manager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medical_schemes`
--
ALTER TABLE `medical_schemes`
  MODIFY `scheme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pharmacist`
--
ALTER TABLE `pharmacist`
  MODIFY `pharmacist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `provider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `receptionist`
--
ALTER TABLE `receptionist`
  MODIFY `recep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_pat` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `fk_serv` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `consultations`
--
ALTER TABLE `consultations`
  ADD CONSTRAINT `fk_drugs` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`drug_id`),
  ADD CONSTRAINT `fk_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `fk_pharmac` FOREIGN KEY (`pharmacist_id`) REFERENCES `pharmacist` (`pharmacist_id`),
  ADD CONSTRAINT `fk_recep` FOREIGN KEY (`recep_id`) REFERENCES `receptionist` (`recep_id`),
  ADD CONSTRAINT `fk_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `fk_pharma` FOREIGN KEY (`pharmacist_id`) REFERENCES `pharmacist` (`pharmacist_id`);

--
-- Constraints for table `medical_schemes`
--
ALTER TABLE `medical_schemes`
  ADD CONSTRAINT `fk_mangr` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`),
  ADD CONSTRAINT `fk_provr` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`);

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `fk_scheme` FOREIGN KEY (`scheme_id`) REFERENCES `medical_schemes` (`scheme_id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `fk_pid` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `fk_serid` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
