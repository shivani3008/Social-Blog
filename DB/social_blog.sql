-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2018 at 12:49 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad_city`
--

CREATE TABLE IF NOT EXISTS `ad_city` (
  `city_id` int(10) NOT NULL,
  `state_id` int(10) NOT NULL,
  `city_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_city`
--

INSERT INTO `ad_city` (`city_id`, `state_id`, `city_name`) VALUES
(1, 1, 'Ahmedabad'),
(2, 1, 'Amreli'),
(3, 1, 'Anand'),
(4, 1, 'Bardoli'),
(5, 1, 'Bharuch'),
(6, 1, 'Bhavnagar'),
(7, 1, 'Bhuj'),
(8, 1, 'Botad'),
(9, 1, 'Changa'),
(10, 1, 'Dahod'),
(12, 1, 'Daskroi'),
(13, 1, 'Dhari'),
(14, 1, 'Dholka'),
(15, 1, 'Gandhinagar'),
(16, 1, 'Godhra'),
(17, 1, 'Himmatnagar'),
(18, 1, 'Jalalpore'),
(19, 1, 'Jamnagar'),
(20, 1, 'Junagadh'),
(21, 1, 'Kadi'),
(22, 1, 'Kalol'),
(23, 1, 'Kheda'),
(24, 1, 'Khedbrahma'),
(25, 1, 'Mandvi'),
(26, 1, 'Mehsana'),
(27, 1, 'Modasa'),
(28, 1, 'Morbi'),
(29, 1, 'Nadiad'),
(30, 1, 'Navsari'),
(31, 1, 'Olpad'),
(32, 1, 'Palanpur'),
(33, 1, 'Patan'),
(34, 1, 'Petlad'),
(35, 1, 'Prantij'),
(36, 1, 'Rajkot'),
(37, 1, 'Sabarkantha'),
(38, 1, 'Sahera'),
(39, 1, 'Surat'),
(40, 1, 'Unjha'),
(41, 1, 'Vadodara'),
(42, 1, 'Valia'),
(43, 1, 'Vallabh Vidyanagar'),
(44, 1, 'Valsad'),
(45, 1, 'Visnagar'),
(46, 1, 'Wadhwan'),
(47, 4, 'Mumbai'),
(48, 4, 'Goa');

-- --------------------------------------------------------

--
-- Table structure for table `ad_clg`
--

CREATE TABLE IF NOT EXISTS `ad_clg` (
  `clg_id` int(10) NOT NULL,
  `city_id` int(10) NOT NULL,
  `clg_code` int(5) NOT NULL,
  `clg_name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_clg`
--

INSERT INTO `ad_clg` (`clg_id`, `city_id`, `clg_code`, `clg_name`) VALUES
(3, 0, 1, 'A. D. PATEL INSTITUTE OF TECHNOLOGY, KARAMSAD'),
(4, 1, 2, 'AHMEDABAD INSTITUTE OF TECHNOLOGY, GOTA, AHMEDABAD'),
(5, 36, 3, 'ATMIYA INSTITUTE OF TECHNOLOGY & SCIENCE, RAJKOT'),
(6, 43, 7, 'BIRLA VISHVAKARMA MAHAVIDYALAYA, VALLABH VIDYANAGA'),
(7, 1, 28, 'L. D. COLLEGE OF ENGINEERING, AHMEDABAD'),
(8, 41, 50, 'SIGMA INSTITUTE OF ENGINEERING, VADODARA');

-- --------------------------------------------------------

--
-- Table structure for table `ad_country`
--

CREATE TABLE IF NOT EXISTS `ad_country` (
  `country_id` int(10) NOT NULL,
  `country_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_country`
--

INSERT INTO `ad_country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'Shrilanka'),
(3, 'Pakistan'),
(4, 'Bangladesh');

-- --------------------------------------------------------

--
-- Table structure for table `ad_country_code`
--

CREATE TABLE IF NOT EXISTS `ad_country_code` (
  `country_code_id` int(10) NOT NULL,
  `country_code` varchar(5) NOT NULL,
  `country_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_country_code`
--

INSERT INTO `ad_country_code` (`country_code_id`, `country_code`, `country_name`) VALUES
(1, '+91', 'India'),
(2, '+92', 'Pakistan'),
(3, '+93', 'Afghanistan'),
(4, '+94', 'Shri Lanka'),
(5, '+880', 'Bangladesh');

-- --------------------------------------------------------

--
-- Table structure for table `ad_login`
--

CREATE TABLE IF NOT EXISTS `ad_login` (
  `email` varchar(20) NOT NULL,
  `pswd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ad_state`
--

CREATE TABLE IF NOT EXISTS `ad_state` (
  `state_id` int(10) NOT NULL,
  `country_id` int(10) NOT NULL,
  `state_name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ad_state`
--

INSERT INTO `ad_state` (`state_id`, `country_id`, `state_name`) VALUES
(1, 1, 'Gujarat'),
(2, 1, 'Rajasthan'),
(3, 1, 'Madhya Pradesh'),
(4, 1, 'Maharashra');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `msg_id` int(10) NOT NULL,
  `from_id` int(10) NOT NULL,
  `to_id` int(10) NOT NULL,
  `msg` varchar(500) NOT NULL,
  `date_time` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`msg_id`, `from_id`, `to_id`, `msg`, `date_time`) VALUES
(1, 6, 1, 'hii....Shivu', '14/06/2017 1:17:04 P'),
(2, 1, 6, 'hi...', '14/06/2017 1:17:17 P'),
(3, 5, 1, 'zhi', '01/07/2017 10:39:12 '),
(4, 1, 5, 'helloo', '01/07/2017 10:39:27 ');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(10) NOT NULL,
  `reg_id` int(10) NOT NULL,
  `caption` varchar(200) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `date_time` varchar(20) NOT NULL,
  `likes` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `reg_id`, `caption`, `image`, `date_time`, `likes`) VALUES
(2, 1, '', '~/Lib/images/1_201717112039.jpg', '18/05/2017 4:50:39 A', 0),
(4, 1, 'Sea', '~/Lib/images/1_201717112051.jpg', '18/05/2017 4:50:51 A', 0),
(5, 1, '', '~/Lib/images/1_211717112108.jpg', '18/05/2017 4:51:08 A', 0),
(6, 6, '', '~/Lib/images/6_251717112531.jpg', '18/05/2017 4:55:31 A', 0),
(7, 2, '', '~/Lib/images/2_281717112817.jpg', '18/05/2017 4:58:17 A', 0),
(8, 6, '', '~/Lib/images/6_291717112915.jpg', '18/05/2017 4:59:15 A', 0),
(9, 2, '#Late Post', '~/Lib/images/2_192417071954.jpg', '24/05/2017 12:49:54 ', 0),
(10, 6, '', '~/Lib/images/6_531417075344.jpg', '14/06/2017 1:23:44 P', 0),
(11, 1, 'asd', '~/Lib/images/1_100117051059.jpg', '01/07/2017 10:40:59 ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `profile_id` int(10) NOT NULL,
  `reg_id` int(10) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `age` int(3) NOT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `qualification` varchar(30) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `profile_photo` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profile_id`, `reg_id`, `dob`, `age`, `designation`, `qualification`, `description`, `profile_photo`) VALUES
(1, 2, '8/21/1996', 20, '', '', 'I am Jainee', '~/Lib/images/2_351017063535.jpg'),
(2, 4, '8/31/2000', 17, '', '', 'I am Purva', '~/Lib/images/4_411017064101.jpg'),
(3, 1, '8/30/1996', 20, '', '', 'I am Shivani', '~/Lib/images/1_181017071839.jpg'),
(4, 7, '7/10/1996', 20, '', '', 'I am Sejal', '~/Lib/images/7_301817033027.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `reg_id` int(10) NOT NULL,
  `fn` varchar(20) NOT NULL,
  `ln` varchar(20) NOT NULL,
  `country_id` int(10) NOT NULL,
  `state_id` int(10) NOT NULL,
  `city_id` int(10) NOT NULL,
  `clg_id` int(10) NOT NULL,
  `country_code_id` int(10) NOT NULL,
  `mob_no` varchar(15) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pswd` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`reg_id`, `fn`, `ln`, `country_id`, `state_id`, `city_id`, `clg_id`, `country_code_id`, `mob_no`, `gender`, `email`, `pswd`) VALUES
(1, 'Shivani', 'Patel', 0, 0, 43, 6, 1, '9876543210', 'Female', 'shivani@gmail.com', 'pswd'),
(2, 'Jainee', 'Solanki', 0, 0, 43, 6, 1, '1234567890', 'Female', 'jainee@gmail.com', 'pswd'),
(3, 'Nirali', 'Tuvar', 0, 0, 43, 6, 1, '7894567897', 'Female', 'nirali@gmail.com', 'pswd'),
(4, 'Purva', 'Patel', 1, 4, 1, 0, 1, '9879879879', 'Male', 'purva@gmail.com', 'pswd'),
(5, 'Yash', 'Sartanpara', 1, 1, 1, 0, 1, '1234567890', 'Male', 'yash@gmail.com', 'pswd'),
(6, 'Jigar', 'Pathak', 1, 1, 1, 0, 1, '9876543210', 'Male', 'jigar@gmail.com', 'pswd'),
(7, 'Sejal', 'Tuvar', 1, 4, 1, 0, 1, '1234567895', 'Female', 'sejal@gmail.com', 'pswd');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `request_id` int(10) NOT NULL,
  `from_id` int(10) NOT NULL,
  `to_id` int(10) NOT NULL,
  `is_accepted` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`request_id`, `from_id`, `to_id`, `is_accepted`) VALUES
(11, 2, 1, 1),
(13, 6, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad_city`
--
ALTER TABLE `ad_city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `ad_clg`
--
ALTER TABLE `ad_clg`
  ADD PRIMARY KEY (`clg_id`);

--
-- Indexes for table `ad_country`
--
ALTER TABLE `ad_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `ad_country_code`
--
ALTER TABLE `ad_country_code`
  ADD PRIMARY KEY (`country_code_id`);

--
-- Indexes for table `ad_state`
--
ALTER TABLE `ad_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`reg_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad_city`
--
ALTER TABLE `ad_city`
  MODIFY `city_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `ad_clg`
--
ALTER TABLE `ad_clg`
  MODIFY `clg_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ad_country`
--
ALTER TABLE `ad_country`
  MODIFY `country_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ad_country_code`
--
ALTER TABLE `ad_country_code`
  MODIFY `country_code_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ad_state`
--
ALTER TABLE `ad_state`
  MODIFY `state_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `msg_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `reg_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
