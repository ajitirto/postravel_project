-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2020 at 11:33 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `postravel_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by_user_id` int(11) NOT NULL,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `fullname`, `gender`, `phone`, `address`, `email`, `company`, `created`, `created_by_user_id`, `updated`, `updated_by_user_id`) VALUES
(1, 'PT Enseval Putera Megatrading Tbk', 'L', '081328955048', 'Sukoharjo', 'triutomo233@gmail.com', 'PT Enseval Putera Megatrading Tbk', '2020-02-27 04:18:21', 2, NULL, NULL),
(12, 'PT Konimex', 'L', '081328955048', 'sukoharjo', 'triutomo233@gmail.com', 'PT Konimex', '2020-02-27 04:31:12', 2, NULL, 2),
(13, 'PT Konimex 2', 'L', '081328955040', 'surakarta', 'triutomo233@gmail.com', 'PT Konimex 2', '2020-02-27 04:31:12', 2, NULL, 2),
(14, 'PT BMW', 'L', '082329469379', 'California', NULL, 'PT BMW', '2020-03-07 06:23:08', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eighty88asia`
--

CREATE TABLE `eighty88asia` (
  `eighty88asia_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `invoice` varchar(45) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `stay_of_nights` varchar(45) NOT NULL,
  `rate` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `conflet` varchar(45) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by_user_id` int(11) NOT NULL,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eighty88asia`
--

INSERT INTO `eighty88asia` (`eighty88asia_id`, `customer_id`, `hotel_id`, `package_id`, `invoice`, `check_in`, `check_out`, `stay_of_nights`, `rate`, `total_amount`, `conflet`, `payment_method`, `status`, `created`, `created_by_user_id`, `updated`, `updated_by_user_id`) VALUES
(6, 14, 2, 2, 'INV070320001', '2020-03-07', '2020-03-10', '3', 4000000, 0, '998877', 'cash', 'In process', '2020-03-07 06:24:10', 2, NULL, NULL),
(7, 13, 3, 4, 'INV070320002', '2020-03-07', '2020-03-09', '2', 10000000, 0, '887744', 'Cash', 'In process', '2020-03-07 06:32:42', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flight_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `description` text,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by_user_id` int(11) NOT NULL,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_id`, `name`, `phone`, `address`, `description`, `created`, `created_by_user_id`, `updated`, `updated_by_user_id`) VALUES
(1, 'Garuda Indonesia', '082329469371', 'Jakarta', 'Penerbangan', '2020-02-27 08:30:30', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotel_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `description` text,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by_user_id` int(11) NOT NULL,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotel_id`, `name`, `phone`, `address`, `description`, `created`, `created_by_user_id`, `updated`, `updated_by_user_id`) VALUES
(1, 'Hotel Alila', '081328955049', 'Surakarta', NULL, '2020-02-27 04:34:45', 2, NULL, NULL),
(2, 'Hotel Best Western', '081224334222', 'Sukoharjo', NULL, '2020-02-27 04:39:24', 2, NULL, NULL),
(3, 'Hotel Agas', '081776885447', 'Manahan, Solo', 'Hotel Bintang 3', '2020-03-07 06:30:42', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_packages`
--

CREATE TABLE `hotel_packages` (
  `package_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by_user_id` int(11) NOT NULL,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel_packages`
--

INSERT INTO `hotel_packages` (`package_id`, `hotel_id`, `name`, `type`, `price`, `created`, `created_by_user_id`, `updated`, `updated_by_user_id`) VALUES
(1, 1, 'Room Kamar', 'Luxury', 400000, '2020-02-27 04:35:57', 2, NULL, NULL),
(2, 2, 'Room Kamar', 'Medium', 300000, '2020-02-27 04:39:48', 2, NULL, NULL),
(3, 1, 'Room Kamar 2', 'Medium', 200000, '2020-02-27 04:40:17', 2, NULL, NULL),
(4, 3, 'Luxury Room', 'Exclusive', 5000000, '2020-03-07 06:31:53', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lantravelind`
--

CREATE TABLE `lantravelind` (
  `lantravelind_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `invoice` varchar(45) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `stay_of_nights` varchar(45) NOT NULL,
  `rate` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `conflet` varchar(45) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by_user_id` int(11) NOT NULL,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lantravelind`
--

INSERT INTO `lantravelind` (`lantravelind_id`, `customer_id`, `hotel_id`, `package_id`, `invoice`, `check_in`, `check_out`, `stay_of_nights`, `rate`, `total_amount`, `conflet`, `payment_method`, `status`, `created`, `created_by_user_id`, `updated`, `updated_by_user_id`) VALUES
(6, 14, 2, 2, 'INV070320001', '2020-03-07', '2020-03-10', '3', 4000000, 0, '998877', 'cash', 'In process', '2020-03-07 06:24:10', 2, NULL, NULL),
(7, 13, 3, 4, 'INV070320002', '2020-03-07', '2020-03-09', '2', 10000000, 0, '887744', 'Cash', 'In process', '2020-03-07 06:32:42', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `others`
--

CREATE TABLE `others` (
  `others_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` text NOT NULL,
  `description` text,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by_user_id` int(11) NOT NULL,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `others`
--

INSERT INTO `others` (`others_id`, `name`, `phone`, `address`, `description`, `created`, `created_by_user_id`, `updated`, `updated_by_user_id`) VALUES
(1, 'Teh presiden', '125', 'Aktif', 'Masih tersedia', '2020-02-27 08:30:30', 2, '2020-09-17 13:55:26', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `gender` enum('M','F') NOT NULL COMMENT 'M:Male, F:Female',
  `password` varchar(45) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1:Master, 2:Admin, 3:Member',
  `address` text,
  `status` enum('ON','OFF') NOT NULL DEFAULT 'OFF',
  `last_login` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by_user_id` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `username`, `gender`, `password`, `level`, `address`, `status`, `last_login`, `created`, `created_by_user_id`, `updated`, `updated_by_user_id`) VALUES
(1, 'Master POS', 'Master POS', 'M', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 'Sukoharjo', 'OFF', '2020-02-25 12:42:58', '2020-02-25 18:39:59', 1, '2020-02-25 18:42:58', NULL),
(2, 'Admin POS', 'Admin POS', 'F', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 'Surakarta', 'ON', '2020-09-17 19:01:19', '2020-02-25 12:41:24', 1, '2020-09-17 19:01:19', NULL),
(3, 'Member POS', 'Member POS', 'M', '7c4a8d09ca3762af61e59520943dc26494f8941b', 3, 'Surakarta', 'OFF', NULL, '2020-02-25 12:42:05', 2, NULL, NULL),
(4, 'Admin POS 2', 'Admin POS 2', 'M', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 'Sukoharjo', 'OFF', NULL, '2020-02-25 12:42:54', 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `created_by_user_id` (`created_by_user_id`),
  ADD KEY `updated_by_user_id` (`updated_by_user_id`);

--
-- Indexes for table `eighty88asia`
--
ALTER TABLE `eighty88asia`
  ADD PRIMARY KEY (`eighty88asia_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `created_by_user_id` (`created_by_user_id`),
  ADD KEY `updated_by_user_id` (`updated_by_user_id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `created_by_user_id` (`created_by_user_id`),
  ADD KEY `updated_by_user_id` (`updated_by_user_id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `created_by_user_id` (`created_by_user_id`),
  ADD KEY `updated_by_user_id` (`updated_by_user_id`);

--
-- Indexes for table `hotel_packages`
--
ALTER TABLE `hotel_packages`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `id_hotel` (`hotel_id`),
  ADD KEY `created_by_user_id` (`created_by_user_id`),
  ADD KEY `update_by_user_id` (`updated_by_user_id`);

--
-- Indexes for table `lantravelind`
--
ALTER TABLE `lantravelind`
  ADD PRIMARY KEY (`lantravelind_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `created_by_user_id` (`created_by_user_id`),
  ADD KEY `updated_by_user_id` (`updated_by_user_id`);

--
-- Indexes for table `others`
--
ALTER TABLE `others`
  ADD PRIMARY KEY (`others_id`),
  ADD KEY `created_by_user_id` (`created_by_user_id`),
  ADD KEY `updated_by_user_id` (`updated_by_user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `created_by_user_id` (`created_by_user_id`),
  ADD KEY `updated_by_user_id` (`updated_by_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `eighty88asia`
--
ALTER TABLE `eighty88asia`
  MODIFY `eighty88asia_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hotel_packages`
--
ALTER TABLE `hotel_packages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lantravelind`
--
ALTER TABLE `lantravelind`
  MODIFY `lantravelind_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `others`
--
ALTER TABLE `others`
  MODIFY `others_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`updated_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`updated_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hotels_ibfk_2` FOREIGN KEY (`updated_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `hotel_packages`
--
ALTER TABLE `hotel_packages`
  ADD CONSTRAINT `hotel_packages_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hotel_packages_ibfk_2` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `hotel_packages_ibfk_3` FOREIGN KEY (`updated_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `lantravelind`
--
ALTER TABLE `lantravelind`
  ADD CONSTRAINT `lantravelind_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `lantravelind_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `lantravelind_ibfk_3` FOREIGN KEY (`package_id`) REFERENCES `hotel_packages` (`package_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `lantravelind_ibfk_5` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `lantravelind_ibfk_6` FOREIGN KEY (`updated_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`updated_by_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
