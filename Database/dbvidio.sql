-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 09, 2014 at 04:15 AM
-- Server version: 5.1.71-community
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbvidio`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `adminname` varchar(20) NOT NULL,
  `adminpassword` varchar(20) NOT NULL,
  PRIMARY KEY (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminname`, `adminpassword`) VALUES
('sanjay', '123');

-- --------------------------------------------------------

--
-- Table structure for table `v_category`
--

CREATE TABLE IF NOT EXISTS `v_category` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `v_category`
--

INSERT INTO `v_category` (`id`, `categoryname`) VALUES
(4, 'Education'),
(10, 'Comedy'),
(56, 'Entertainment'),
(57, 'Videos');

-- --------------------------------------------------------

--
-- Table structure for table `v_comment`
--

CREATE TABLE IF NOT EXISTS `v_comment` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userid` int(50) NOT NULL,
  `vid` int(11) NOT NULL,
  `comment` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `v_comment`
--

INSERT INTO `v_comment` (`id`, `userid`, `vid`, `comment`) VALUES
(14, 10, 80, 'nice'),
(15, 17, 88, 'fbe'),
(16, 17, 88, 'fbe'),
(17, 17, 88, 'fbe'),
(18, 17, 88, 'fbe'),
(19, 17, 88, 'fbe'),
(20, 17, 88, 'fbe'),
(21, 17, 106, 'wow'),
(22, 17, 121, 'wiow'),
(23, 10, 128, 'hsfh'),
(27, 22, 128, 'sanjay'),
(46, 22, 128, 'asdj'),
(47, 22, 128, 'asdj'),
(48, 22, 170, 'dth'),
(49, 22, 170, 'dth'),
(50, 22, 170, 'er'),
(51, 22, 171, 'hii'),
(52, 22, 171, 'drtg'),
(53, 22, 174, 'fv'),
(54, 22, 174, 'rgw'),
(55, 22, 174, 'erg'),
(56, 16, 174, 'hello'),
(57, 16, 174, 'nice video'),
(58, 16, 174, 'ha ha haa'),
(59, 16, 198, 'amazing'),
(60, 24, 198, 'super video'),
(61, 16, 198, 'keep it up.'),
(62, 16, 198, 'good');

-- --------------------------------------------------------

--
-- Table structure for table `v_userinfo`
--

CREATE TABLE IF NOT EXISTS `v_userinfo` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `postalcode` int(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `sequrityque` varchar(50) NOT NULL,
  `sequrityans` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `v_userinfo`
--

INSERT INTO `v_userinfo` (`id`, `fname`, `lname`, `dob`, `address`, `city`, `state`, `postalcode`, `country`, `phoneno`, `email`, `username`, `password`, `sequrityque`, `sequrityans`) VALUES
(16, 'vivek', 'patel', '26-1-1990', 'tyu67', 'visnagar', 'maharasta', 384315, 'india', '220660', 'patel@yahoo.com', 'vivek', '3', 'what is your name', 'tu'),
(22, 'Sanjay', 'Prajapati', '24/05/1993', '2ssfddjj2ekff', 'Ahmedabad', 'GUJARAT', 380054, 'India', '9409142702', 'asyourwish24@gmail.com', 'sanjay', '123', 'what is your mobile no', '9409142702'),
(23, 'Rakesh', 'Patel', '1992-07-17', 'vadaj', 'Ahmedabad', 'GUJARAT', 385001, 'India', '9654123780', 'asdnf@gamil.com', 'rakesh124', '123', 'what is your name', 'raku'),
(24, 'darji', 'parth', '15/01/1993', 'c/5 nandanvan', 'ahmedabad', 'gujarat', 382230, 'india', '8980108869', 'parth@gmail.com', 'parth', 'darji', '', ''),
(25, 'ajay', 'solanki', '25/04/1992', 'jamnagar', 'jamnagar', 'gujarat', 258993, 'india', '8579638975', 'solanki@gmail.com', 'ajay', 'solanki', '', ''),
(26, 'pavan', 'patel', '15/02/1994', '5, adarsh nagar', 'mehsana', 'gujarat', 380023, 'india', '9856258452', 'bhjgjh@ymail.com', 'pavan', 'pavan', '', ''),
(27, 'vishal', 'pandhi', '25/04/1996', '91,pavankunj', 'gandhinagar', 'gujarat', 386521, 'india', '2654654665', 'vishalpandhi@gmail.com', 'vishal', 'vishal', '', ''),
(28, 'amit', 'parikh', '4/6/1995', '21, Shrinagar Society', 'visnagar', 'gujarat', 384315, 'india', '9856258485', 'amitparikh@y7mail.com', 'amit', 'amit', '', ''),
(29, 'ashok', 'sakhavat', '21/3/2001', '6,madhav park', 'vadnagar', 'gujarat', 658542, 'india', '9856235412', 'ashoksakhavat@yahoo.com', 'ashok', 'ashok', '', ''),
(30, 'drshan', 'patel', '3/8/1996', '4, manav ashram', 'kheda', 'gujarat', 652325, 'india', '8958475621', 'darshanpatel@gmail.com', 'darshan', 'darshan', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `v_vidiodetail`
--

CREATE TABLE IF NOT EXISTS `v_vidiodetail` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `categoryid` int(20) NOT NULL,
  `userid` int(20) NOT NULL,
  `title` varchar(225) NOT NULL,
  `vidiopath` varchar(225) DEFAULT NULL,
  `description` varchar(225) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryid` (`categoryid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=211 ;

--
-- Dumping data for table `v_vidiodetail`
--

INSERT INTO `v_vidiodetail` (`id`, `categoryid`, `userid`, `title`, `vidiopath`, `description`, `thumbnail`, `date`, `time`) VALUES
(170, 10, 22, 'shoping mall', 'VID-20130128-WA0000.mp4', 'one girl', 'VID-20130128-WA0000.jpg', '2014-04-28', '12:29:16'),
(174, 10, 22, 'dance India dance', 'VID-20140318-WA0000.mp4', 'Super dance by politician ', 'VID-20140318-WA0000.jpg', '2014-04-29', '09:30:13'),
(177, 10, 22, 'Kejriwal  ', 'Official Dukhdarshan News Tragediwal Kejriwal Expose !.mp4', 'nice video', 'Official.jpg', '2014-04-29', '17:43:44'),
(187, 4, 16, 'Ipv6 subnetting ', 'IPv6 subnetting example in Hindi example 1 CCNP (v-12).mp4', 'learn ipv6 subnetting', 'IPv6.jpg', '2014-04-30', '21:55:20'),
(188, 4, 16, 'Apache Hadoop', 'Introducing Apache Hadoop- The Modern Data Operating System.mp4', 'Introduction ', 'Introducing.jpg', '2014-04-30', '21:58:35'),
(191, 4, 16, 'Use ejb module', 'How to use EJB Module with JSP.mp4', 'How to use EJB Module with JSP', 'EJB.jpg', '2014-04-30', '22:13:50'),
(192, 4, 16, 'IEEE Project Insights', 'JAVA 2012 IEEE Project Insights on Media Streaming Progress 2 - YouTube.MP4', 'JAVA 2012 IEEE Project Insights on Media Streaming Progress 2 - YouTube', 'JAVA.jpg', '2014-04-30', '22:17:30'),
(193, 4, 16, 'Hibernate Tutorial 01', 'Hibernate Tutorial 01 - Introduction To Hibernate.MP4', 'Introduction To Hibernate', 'Hibernate1.jpg', '2014-04-30', '22:19:58'),
(194, 4, 16, 'Hibernate Tutorial 02', 'Hibernate Tutorial 02 - Setting Up Hibernate.MP4', 'Setting Up Hibernate', 'Hibernate2.jpg', '2014-04-30', '22:21:07'),
(196, 10, 22, 'english ispeaking', 'englis ispeaking.mp4', 'Learn English funny', 'englis.jpg', '2014-04-30', '22:29:54'),
(197, 10, 22, 'rahul', 'VID-20130211-WA0017.mp4', 'must watch', 'VID-20130211-WA0017.jpg', '2014-04-30', '22:34:48'),
(198, 56, 22, 'amazing dance', 'VID-20130217-WA0003.mp4', 'dance', 'VID-20130217-WA0003.jpg', '2014-04-30', '22:36:49'),
(199, 10, 22, 'nice baby', 'VID-20130216-WA0008.mp4', 'good', 'VID-20130216-WA0008.jpg', '2014-04-30', '22:37:59'),
(200, 57, 16, 'art', 'VID-20130131-WA0000.mp4', 'nice', 'VID-20130131-WA0000.jpg', '2014-05-01', '12:28:24'),
(201, 4, 16, 'Jsp Servlet 1', 'JSPs and Servlets Tutorial 04 - Servlet XML Configuration.MP4', 'learning', 'JSPs1.jpg', '2014-05-01', '12:58:57'),
(202, 4, 16, 'Jsp Servlet 2', 'JSPs and Servlets Tutorial 08 - Request, Session and Context Part 1.MP4', 'Learning', 'JSPs2.jpg', '2014-05-01', '13:01:17'),
(203, 4, 16, 'struct1', 'Struts 2 Tutorial 01 - Introduction To MVC.MP4', 'Learning', 'Struts2.jpg', '2014-05-01', '13:02:43'),
(204, 4, 16, 'struct2', 'Struts 2 Tutorial 07 - The ValueStack.MP4', 'Learning', 'Struts3.jpg', '2014-05-01', '13:04:13'),
(210, 57, 16, 'tu', 'VID-20130128-WA0004.mp4', 'tty', 'VID-20130128-WA0004.jpg', '2014-05-09', '09:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `v_vidioview`
--

CREATE TABLE IF NOT EXISTS `v_vidioview` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `vidiodetailid` int(20) DEFAULT NULL,
  `rate` int(20) DEFAULT NULL,
  `view` int(20) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_v_vidioview_1` (`categoryid`),
  KEY `vidiodetailid` (`vidiodetailid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `v_vidioview`
--

INSERT INTO `v_vidioview` (`id`, `vidiodetailid`, `rate`, `view`, `categoryid`) VALUES
(86, 170, 4, 6, 10),
(88, 174, NULL, 8, 10),
(89, 177, NULL, 3, 10),
(91, 187, 5, 32, 4),
(93, 188, NULL, 7, 4),
(94, 191, NULL, 4, 4),
(95, 192, NULL, 2, 4),
(96, 193, NULL, 3, 4),
(97, 196, NULL, 2, 10),
(98, 197, 5, 6, 10),
(99, 198, 4, 9, 56),
(100, 200, NULL, 1, 57),
(101, 194, NULL, 1, 4),
(102, 201, NULL, 1, 4),
(103, 203, NULL, 1, 4),
(104, 204, NULL, 1, 4),
(105, 199, NULL, 1, 10),
(111, 210, NULL, 1, 57);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `v_vidiodetail`
--
ALTER TABLE `v_vidiodetail`
  ADD CONSTRAINT `v_vidiodetail_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `v_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `v_vidiodetail_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `v_userinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `v_vidioview`
--
ALTER TABLE `v_vidioview`
  ADD CONSTRAINT `v_vidioview_ibfk_1` FOREIGN KEY (`vidiodetailid`) REFERENCES `v_vidiodetail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `v_vidioview_ibfk_2` FOREIGN KEY (`categoryid`) REFERENCES `v_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
