-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2021 at 08:21 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel-reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
                         `hotel_id` int(11) NOT NULL,
                         `state_name` varchar(50) NOT NULL,
                         `hotel_name` varchar(50) NOT NULL,
                         `hotel_status` tinyint(1) NOT NULL,
                         `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `state_name`, `hotel_name`, `hotel_status`, `state_id`) VALUES
(1, 'Delhi', 'The Umrao', 0, 1),
(2, 'Delhi', 'Radisson Blu Hotel', 1, 1),
(3, 'Delhi', ' Le Méridien', 0, 1),
(4, 'Uttarakhand', 'Jungle Lore Birding Hotel Resort Nainital', 1, 2),
(5, 'Uttarakhand', 'The Cocoon Camps & Nature Resorts', 0, 2),
(6, 'Uttarakhand', 'Hotel Aranya Virasat', 0, 2),
(7, 'Manali', 'Himalayan Heights', 1, 3),
(8, 'Manali', 'Sun Park Resort', 0, 3),
(9, 'Manali', 'Himalayan Heights Manali', 0, 3),
(10, 'Chennai', 'ITC Grand Chola', 1, 4),
(11, 'Chennai', 'The Park Chennai', 0, 4),
(12, 'Hyderabad', 'Red Fox Hotel', 1, 5),
(13, 'Hyderabad', 'The Peerless Inn', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_information`
--

CREATE TABLE `hotel_information` (
                                     `hotel_id` int(11) NOT NULL,
                                     `room_id` int(11) NOT NULL,
                                     `room_type` varchar(50) NOT NULL,
                                     `price` decimal(10,0) NOT NULL,
                                     `gst` decimal(10,0) NOT NULL,
                                     `total` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel_information`
--

INSERT INTO `hotel_information` (`hotel_id`, `room_id`, `room_type`, `price`, `gst`, `total`) VALUES
(1, 1, 'Luxury', '5000', '50', '5050'),
(2, 3, 'Luxury', '4000', '50', '4050'),
(3, 5, 'Luxury', '5000', '50', '5050'),
(4, 7, 'Luxury', '5000', '50', '5050'),
(5, 9, 'Luxury', '5000', '50', '5050'),
(6, 10, 'Suite', '6000', '80', '6080'),
(7, 11, 'Luxury', '4000', '50', '4050'),
(9, 13, 'Luxury', '4000', '50', '4050'),
(10, 14, 'Suite', '8000', '60', '8060'),
(11, 15, 'Luxury', '4000', '50', '4050'),
(12, 16, 'Suite', '6000', '60', '6060'),
(13, 17, 'Luxury', '4000', '50', '4050');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
                         `id` int(11) NOT NULL,
                         `state_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `state_name`) VALUES
(4, 'Chennai'),
(1, 'Delhi'),
(5, 'Hyderabad'),
(3, 'Manali'),
(2, 'Uttarakhand');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
    ADD PRIMARY KEY (`hotel_id`),
    ADD KEY `state_name` (`state_name`);

--
-- Indexes for table `hotel_information`
--
ALTER TABLE `hotel_information`
    ADD PRIMARY KEY (`room_id`),
    ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
    ADD PRIMARY KEY (`state_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
    MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `hotel_information`
--
ALTER TABLE `hotel_information`
    MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
    ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`state_name`) REFERENCES `state` (`state_name`);

--
-- Constraints for table `hotel_information`
--
ALTER TABLE `hotel_information`
    ADD CONSTRAINT `hotel_information_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
