-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2022 at 03:06 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leoclinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `treatment` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `usermail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `fullname`, `email`, `phone`, `date`, `time`, `treatment`, `status`, `usermail`) VALUES
(1, 'Amirah Aqilah', 'amirah@gmail.com', '012-5123252', '22/1/2023', '09:00', 'Acne Treatment', 'Approved', 'admin@gmail.com'),
(2, 'Mohd Hafiz', 'hafizz@gmail.com', '012-5210326', '22/11/2023', '10:00', 'Eczyma', 'Approved', 'admin@gmail.com'),
(3, 'Nur Hafizah', 'hafizah@gmail.com', '012-8400125', '3/12/2022', '09:45', 'Dark Circle', 'Rejected', 'admin@gmail.com'),
(4, 'Nur Qaisara', 'qaisara@gmail.com', '012-9852126', '24/2/2023', '14:30', 'Blackhead Treatment', 'Pending', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `name` varchar(100) NOT NULL,
  `staffID` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `specialties` varchar(200) NOT NULL,
  `qualification` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`name`, `staffID`, `email`, `phone`, `specialties`, `qualification`, `image`, `status`) VALUES
('Dr James Morgan', 'A32847V', 'jamesmorgan@gmail.com', '0162832937', 'Consultant Orthopaedics', 'MD (Kaoshiung Medical\r\nUniversity, TW)\r\nArthroplasty Trainer of MOH', 'doctor3.png', 'Active'),
('Dr Chang Yee', 'A56781S', 'chang@gmail.com', '0124853926', 'Consultant Plastic Surgeon', 'MD (Taiwan)\r\nPlastic Surgery Specialist (CGMH, Taiwan)', 'doctor2.png', 'In-Active'),
('Dr Sevlana Kurkina', 'A92873G', 'sevlana@gmail.com', '0174829164', 'Consultant Dermatologist', 'MBChB (Glasgow, UK)\r\nDip.S.B.Derm (Cardiff, UK)\r\nAM (Mal)', 'doctor1.png', 'Active'),
('Dr Cathleen Hale', 'A94720H', 'cathleen@gmail.com', '0193846573', 'Consultant Aesthetic Physician', 'MD (USM)\r\nMedical Aesthetic LCP (MOH, M’sia)', 'doctor4.png', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_date` varchar(100) NOT NULL,
  `pay_date` varchar(100) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `courier` varchar(100) DEFAULT NULL,
  `trackingno` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `instruction` varchar(100) NOT NULL,
  `packing` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `quantity`, `description`, `instruction`, `packing`, `image`) VALUES
(10001, 'Leo Gentle Cleansing Gel', '59.00', 50, 'A soap-free, cleansing gel that thoroughly removes impurities without disturbing the skin?s natural moisture. \n                                                        Sodium alginate hydrates and soothes skin, leaving it feeling soft and silky. Suita', 'Dispense two to three pumps of gel into palms and rub between your hands. Spread it all over the fac', '150 ml/tube', 'cleansinggel.png'),
(10002, 'Leo Vitamin Glow Serum', '89.00', 50, 'Made to give your skin a healthy glow, our signature, vitamin-packed Vitamin \n                                                    Glow Serum boosts your skins hydration with Vitamins C, E & beta-carotene naturally derived from fruit and veggie \n     ', 'Dispense two to three pumps of serum into palms and rub between your hands \n                        ', '30 ml/bottle', 'serum.png'),
(10003, 'Leo Repairing Wash Off Mask', '69.00', 50, 'Made to give your skin instant hydration and rejuvenation, the best-selling Leo Repairing Wash Off Mask features \n                                                        rose oil to soothe and calm, and gardenia fruit extracts to reduce fine lines an', 'Dispense a pea-sized amount of mask into your palms. Spread it all over the face but dont leave it u', '100 ml/tube', 'washoffmask.png'),
(10004, 'Leo Skin Renewal Cream', '69.00', 50, 'Gentle exfoliating cream for use at night to renew dull, pigmented, oily and congested skin.\n                                                    Suitable for all skin types.\n                                                    Key Ingredient :\n       ', 'For best results, apply AY Solar Defense in the daytime to minimise sun damage.', '150 ml/jar', 'cream.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`fullname`, `email`, `phone`, `password`, `address`) VALUES
('Leo Skin Specialist Clinic', 'admin@gmail.com', '0712345567', 'admin', '10A-24B, Jalan Sejahtera, Taman Sejahtera, 81300 Skudai, Johor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usermail` (`usermail`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `usermail` FOREIGN KEY (`usermail`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
