-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 23, 2018 at 10:18 PM
-- Server version: 10.0.33-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foobarcs411_scheduler`
--

-- --------------------------------------------------------

--
-- Table structure for table `AnalyzedFrom`
--

CREATE TABLE `AnalyzedFrom` (
  `Email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Courses` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `Code` int(11) NOT NULL,
  `Professor` varchar(20) CHARACTER SET latin1 NOT NULL,
  `Name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Semester` varchar(5) CHARACTER SET latin1 NOT NULL,
  `Level` varchar(10) CHARACTER SET latin1 NOT NULL,
  `Field` varchar(20) CHARACTER SET latin1 NOT NULL,
  `GPA` double NOT NULL,
  `Workload` double NOT NULL,
  `Difficulty` double NOT NULL,
  `Usefulness` double NOT NULL,
  `Opinion_Count` int(11) NOT NULL,
  `Prerequisite` int(11) DEFAULT NULL,
  `Required` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`Code`, `Professor`, `Name`, `Semester`, `Level`, `Field`, `GPA`, `Workload`, `Difficulty`, `Usefulness`, `Opinion_Count`, `Prerequisite`, `Required`) VALUES
(125, 'Chapman', 'intro to computer science', 'FA', '1', 'Required', 3.4, 2.75, 2.25, 3.5, 8, NULL, 'r'),
(126, 'Zilles', 'Software Design Studio', 'SP', '1', 'Software', 3.43, 4.78, 4.54, 3.89, 12, NULL, 'r'),
(173, 'Fleck', 'Discrete Structures', 'SP', '1', 'Algorithms', 3.05, 3, 3, 5, 0, NULL, 'r'),
(210, 'Cunningham', 'Ethical & Professional', 'SP', '3', 'Required', 3.59, 3, 3, 3, 0, NULL, 'r'),
(225, 'Fagen', 'Data Structures', 'SP', '2', 'Algorithms', 3.05, 4, 4, 5, 0, NULL, 'r'),
(225, 'Heeren', 'Data Structures', 'FA', '2', 'Algorithms', 3.09, 4, 4, 5, 0, NULL, 'r'),
(233, 'Herman', 'Computer Architecture', 'FA', '2', 'Systems', 2.98, 3, 3, 3, 0, NULL, 'r'),
(233, 'Zilles', 'Computer Architecture', 'FA', '2', 'Systems', 2.87, 3, 3, 3, 0, NULL, 'r'),
(241, 'Angrave', 'System Programming', 'SP', '2', 'Systems', 2.77, 5, 5, 5, 0, NULL, 'r'),
(357, 'Kloeckner', 'Numerical Methods', 'SP', '3', 'Algorithms', 3.03, 3, 3, 3, 0, NULL, 'r'),
(374, 'Erickson', 'Intro to Algs & Models of Comp', 'FA', '3', 'Algorithms', 2.5, 5, 5, 5, 0, NULL, 'r'),
(411, 'Parameswaran', 'Database Systems', 'SP', '4', 'Data', 3.49, 3, 3, 5, 0, NULL, 'TE'),
(412, 'Han', 'Data Mining', 'FA', '4', 'Data', 3.18, 3, 3, 3.5, 0, NULL, 'TE'),
(425, 'Gupta', 'Distributed Systems', 'FA', '4', 'Systems', 3.36, 5, 5, 5, 0, NULL, 'TE'),
(440, 'Lazebnik', 'Artificial Intelligence', 'FA', '4', 'Data', 3.23, 3, 3, 5, 0, NULL, 'TE'),
(445, 'Hoiem', 'Computational Photography', 'FA', '4', 'Data', 3.56, 5, 4, 4, 0, NULL, 'TE'),
(446, 'Coyejo', 'Machine Learning', 'FA', '4', 'Data', 3.23, 5, 4.5, 4.5, 0, NULL, 'TE'),
(446, 'Roth', 'Machine Learning', 'SP', '4', 'Data', 3.37, 5, 5, 4, 0, NULL, 'TE'),
(447, 'Hockenmaier', 'Natural Language Processing', 'FA', '4', 'Data', 3.55, 3, 3, 3, 0, NULL, 'TE'),
(519, 'Shaffer', 'Scientific Visualisation', 'FA', '5', 'Data', 3.7, 2, 2.5, 3, 0, NULL, 'TE'),
(543, 'Lazebnik', 'Computer Vision', 'SP', '5', 'Data', 3.2, 5, 4, 3.5, 0, NULL, 'TE'),
(544, 'Forsyth', 'Optimization in Computer Vision', 'FA', '5', 'Algorithms', 3.96, 2.5, 4.8, 3.5, 0, NULL, 'TE'),
(546, 'Hockenmaier', 'ML in Natural Language Processing', 'SP', '5', 'Data', 3.67, 4, 4.5, 3, 0, NULL, 'TE'),
(574, 'Chekuri', 'Randomized Algorithm', 'SP', '5', 'Algorithms', 3.33, 5, 5, 3.5, 0, NULL, 'TE');

-- --------------------------------------------------------

--
-- Table structure for table `CoursesWithKoofersAvgGpa`
--

CREATE TABLE `CoursesWithKoofersAvgGpa` (
  `Code` int(11) NOT NULL,
  `KoofersAvggpa` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CoursesWithKoofersAvgGpa`
--

INSERT INTO `CoursesWithKoofersAvgGpa` (`Code`, `KoofersAvggpa`) VALUES
(125, 3.26),
(173, 2.51),
(225, 2.71),
(241, 2.57),
(411, 3.12),
(425, 2.96),
(440, 2.81),
(446, 3.21),
(543, 3);

-- --------------------------------------------------------

--
-- Table structure for table `CoursesWithWadeAvgGpa`
--

CREATE TABLE `CoursesWithWadeAvgGpa` (
  `Code` int(11) NOT NULL,
  `WadeAvgGpa` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CoursesWithWadeAvgGpa`
--

INSERT INTO `CoursesWithWadeAvgGpa` (`Code`, `WadeAvgGpa`) VALUES
(125, 3.17451),
(126, 3.49317),
(173, 3.14753),
(210, 2.82112),
(225, 3.02096),
(233, 2.42132),
(241, 3.51024),
(357, 3.25204),
(374, 3.05672),
(411, 2.77723),
(412, 3.80339),
(425, 2.81291),
(440, 2.62548),
(445, 3.01538),
(446, 3.14428),
(447, 3.85594),
(519, 3.43015),
(546, 3.73684);

-- --------------------------------------------------------

--
-- Table structure for table `DetailedCourse`
--

CREATE TABLE `DetailedCourse` (
  `Code` int(11) NOT NULL,
  `Professor` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Prerequisite` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DetailedCourse`
--

INSERT INTO `DetailedCourse` (`Code`, `Professor`, `Prerequisite`) VALUES
(173, 'Fleck', '125'),
(225, 'Fagen', '173');

-- --------------------------------------------------------

--
-- Table structure for table `HasTaken`
--

CREATE TABLE `HasTaken` (
  `Email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Code` int(11) NOT NULL,
  `Semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `HasTaken`
--

INSERT INTO `HasTaken` (`Email`, `Code`, `Semester`) VALUES
('admin1@illinois.edu', 0, 0),
('admin1@illinois.edu', 122, 0),
('admin1@illinois.edu', 123, 0),
('admin1@illinois.edu', 324, 0),
('avishn2@illinois.edu', 125, 1),
('avishn2@illinois.edu', 126, 2),
('avishn2@illinois.edu', 173, 2),
('avishn2@illinois.edu', 225, 3),
('avishn2@illinois.edu', 233, 3),
('avishn2@illinois.edu', 241, 4),
('avishn2@illinois.edu', 357, 4),
('avishn2@illinois.edu', 374, 5),
('avishn2@illinois.edu', 410, 5),
('avishn2@illinois.edu', 411, 5),
('avishn2@illinois.edu', 412, 6),
('avishn2@illinois.edu', 421, 6),
('avishn2@illinois.edu', 425, 0),
('bob@illinois.edu', 125, 1),
('bob@illinois.edu', 126, 2),
('bob@illinois.edu', 173, 2),
('bob@illinois.edu', 210, 5),
('bob@illinois.edu', 225, 3),
('bob@illinois.edu', 233, 3),
('bob@illinois.edu', 241, 4),
('bob@illinois.edu', 357, 4),
('bob@illinois.edu', 374, 5),
('bob@illinois.edu', 411, 5),
('bob@illinois.edu', 440, 0),
('ex@illinois.edu', 0, 0),
('ex@illinois.edu', 125, 0),
('example@illinois.edu', 125, 0),
('example@illinois.edu', 126, 0),
('example@illinois.edu', 173, 0),
('example@illinois.edu', 225, 0),
('example@illinois.edu', 233, 0),
('example@illinois.edu', 241, 0),
('gwehner2@illinois.edu', 0, 0),
('gwehner2@illinois.edu', 125, 1),
('gwehner2@illinois.edu', 126, 2),
('gwehner2@illinois.edu', 173, 2),
('gwehner2@illinois.edu', 225, 3),
('gwehner2@illinois.edu', 233, 3),
('gwehner2@illinois.edu', 241, 4),
('gwehner2@illinois.edu', 411, 4),
('gwehner2@illinois.edu', 412, 0),
('gwehner2@illinois.edu', 413, 0),
('gwehner2@illinois.edu', 414, 0),
('ish@illinois.edu', 0, 0),
('ish@illinois.edu', 101, 0),
('ish@illinois.edu', 125, 0),
('ish@illinois.edu', 126, 0),
('lavisha2@illinois.edu', 0, 0),
('lavisha2@illinois.edu', 411, 8),
('lavisha2@illinois.edu', 445, 7),
('lavisha2@illinois.edu', 446, 7),
('lavisha2@illinois.edu', 519, 7),
('lavisha2@illinois.edu', 546, 8),
('lavisha2@illinois.edu', 597, 8),
('mv5@illinois.edu', 0, 0),
('mv5@illinois.edu', 125, 1),
('mv5@illinois.edu', 126, 0),
('mv5@illinois.edu', 173, 0),
('mv5@illinois.edu', 225, 2),
('mv5@illinois.edu', 233, 0),
('mv5@illinois.edu', 241, 0),
('mv5@illinois.edu', 410, 0),
('mv5@illinois.edu', 425, 0),
('new@illinois.edu', 0, 0),
('new@illinois.edu', 125, 0),
('new@illinois.edu', 126, 0),
('new@illinois.edu', 225, 0),
('new@illinois.edu', 374, 0),
('new@illinois.edu', 411, 0),
('pranavk2@illinois.edu', 0, 0),
('pranavk2@illinois.edu', 241, 0),
('pranavk2@illinois.edu', 421, 0),
('rishika2@illinois.edu', 0, 0),
('rishika2@illinois.edu', 412, 7),
('rishika2@illinois.edu', 447, 7),
('rishika2@illinois.edu', 466, 8),
('rishika2@illinois.edu', 546, 8),
('rishika2@illinois.edu', 581, 8),
('rohank2@illinois.edu', 0, 0),
('rohank2@illinois.edu', 123, 0),
('rohank2@illinois.edu', 125, 0),
('rohank2@illinois.edu', 127, 0),
('shrutib2@illinois.edu', 446, 7),
('shrutib2@illinois.edu', 544, 7),
('shrutib2@illinois.edu', 546, 8),
('shrutib2@illinois.edu', 574, 8),
('test2@illinois.edu', 0, 0),
('test2@illinois.edu', 241, 0),
('test2@illinois.edu', 421, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Hastaken`
--

CREATE TABLE `Hastaken` (
  `Email` varchar(50) NOT NULL,
  `Code` int(11) NOT NULL,
  `Semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Hastaken`
--

INSERT INTO `Hastaken` (`Email`, `Code`, `Semester`) VALUES
('agupta2@illinois.edu', 0, 2),
('agupta2@illinois.edu', 125, 2),
('agupta2@illinois.edu', 126, 2),
('agupta2@illinois.edu', 173, 2),
('avishn2@illinois.edu', 125, 1),
('avishn2@illinois.edu', 126, 2),
('avishn2@illinois.edu', 173, 2),
('avishn2@illinois.edu', 225, 3),
('avishn2@illinois.edu', 233, 3),
('avishn2@illinois.edu', 241, 4),
('avishn2@illinois.edu', 357, 4),
('avishn2@illinois.edu', 374, 5),
('avishn2@illinois.edu', 410, 5),
('avishn2@illinois.edu', 411, 5),
('avishn2@illinois.edu', 412, 6),
('avishn2@illinois.edu', 421, 6),
('bob@illinois.edu', 125, 1),
('bob@illinois.edu', 126, 2),
('bob@illinois.edu', 173, 2),
('bob@illinois.edu', 210, 5),
('bob@illinois.edu', 225, 3),
('bob@illinois.edu', 233, 3),
('bob@illinois.edu', 241, 4),
('bob@illinois.edu', 357, 4),
('bob@illinois.edu', 374, 5),
('bob@illinois.edu', 411, 5),
('gwehner2@illinois.edu', 0, 1),
('gwehner2@illinois.edu', 125, 1),
('gwehner2@illinois.edu', 126, 2),
('gwehner2@illinois.edu', 173, 2),
('gwehner2@illinois.edu', 411, 4),
('lavisha2@illinois.edu', 411, 8),
('lavisha2@illinois.edu', 445, 7),
('lavisha2@illinois.edu', 446, 7),
('lavisha2@illinois.edu', 519, 7),
('lavisha2@illinois.edu', 546, 8),
('lavisha2@illinois.edu', 597, 8),
('mv5@illinois.edu', 125, 1),
('mv5@illinois.edu', 225, 2),
('rishika2@illinois.edu', 412, 7),
('rishika2@illinois.edu', 447, 7),
('rishika2@illinois.edu', 466, 8),
('rishika2@illinois.edu', 546, 8),
('rishika2@illinois.edu', 581, 8),
('shrutib2@illinois.edu', 446, 7),
('shrutib2@illinois.edu', 544, 7),
('shrutib2@illinois.edu', 546, 8),
('shrutib2@illinois.edu', 574, 8),
('test@illinois.edu', 125, 1),
('test@illinois.edu', 126, 1),
('trial@illinois.edu', 1, 1),
('trial@illinois.edu', 2, 1),
('trial@illinois.edu', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Login`
--

CREATE TABLE `Login` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Login`
--

INSERT INTO `Login` (`Username`, `Password`) VALUES
('admin1@illinois.edu', '1234'),
('aghei@illinois.edu', 'hi'),
('agupta2@illinois.edu', '1234'),
('billybob@billy.com', 'password'),
('gwehner2@illinois.edu', 'password'),
('ish@illinois.edu', 'qwerty'),
('kushal@gmail.com', 'whywouldi'),
('lavisha2@illinois.edu', 'qwerty'),
('rohank2@illinois.edu', 'gameboy1123'),
('test@illinois.edu', 'hi'),
('trial@illinois.edu', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `Schedule`
--

CREATE TABLE `Schedule` (
  `Email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Courses` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Credit_Hours` int(11) NOT NULL,
  `GPA` double NOT NULL,
  `Semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Schedule`
--

INSERT INTO `Schedule` (`Email`, `Courses`, `Credit_Hours`, `GPA`, `Semester`) VALUES
('admin1@illinois.edu', '434', 32, 2.3, 3),
('avishn2@illinois.edu', '125', 4, 4, 1),
('avishn2@illinois.edu', '126 173', 6, 3.5, 2),
('avishn2@illinois.edu', '225 233', 8, 3, 3),
('avishn2@illinois.edu', '241 357', 7, 3.33, 4),
('avishn2@illinois.edu', '374 411 410', 10, 3, 5),
('avishn2@illinois.edu', '412 421', 7, 4, 6),
('bob@illinois.edu', '125', 4, 4, 1),
('bob@illinois.edu', '126 173', 6, 4, 2),
('bob@illinois.edu', '225 233', 8, 3.5, 3),
('bob@illinois.edu', '241 357', 7, 3, 4),
('bob@illinois.edu', '411 374 210', 10, 3.75, 5),
('gwehner2@illinois.edu', '125', 4, 4, 1),
('gwehner2@illinois.edu', '126 173', 6, 4, 2),
('gwehner2@illinois.edu', '225 233', 8, 4, 3),
('gwehner2@illinois.edu', '241 411', 7, 3.67, 4),
('lavisha2@illinois.edu', '445 446 519', 12, 3.9, 7),
('lavisha2@illinois.edu', '546 411 597', 12, 3.67, 8),
('mv5@illinois.edu', '125', 4, 4, 1),
('mv5@illinois.edu', '225', 4, 4, 2),
('rishika2@illinois.edu', '447 412', 8, 4, 7),
('rishika2@illinois.edu', '546 466 581', 12, 4, 8),
('shrutib2@illinois.edu', '544 446', 8, 3.67, 7),
('shrutib2@illinois.edu', '546 574', 8, 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Schedules`
--

CREATE TABLE `Schedules` (
  `Email` varchar(50) NOT NULL,
  `Semester` int(11) NOT NULL,
  `Credits` int(11) NOT NULL,
  `GPA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Schedules`
--

INSERT INTO `Schedules` (`Email`, `Semester`, `Credits`, `GPA`) VALUES
('', 2, 15, 4),
('admin1@illinois.edu', 3, 32, 2.3),
('agupta2@illinois.edu', 2, 15, 4),
('avishn2@illinois.edu', 1, 4, 4),
('avishn2@illinois.edu', 2, 6, 3.5),
('avishn2@illinois.edu', 3, 8, 3),
('avishn2@illinois.edu', 4, 7, 3.33),
('avishn2@illinois.edu', 5, 10, 3),
('avishn2@illinois.edu', 6, 7, 4),
('bob@illinois.edu', 1, 4, 4),
('bob@illinois.edu', 2, 6, 4),
('bob@illinois.edu', 3, 8, 3.5),
('bob@illinois.edu', 4, 7, 3),
('bob@illinois.edu', 5, 10, 3.75),
('gwehner2@illinois.edu', 1, 4, 4),
('gwehner2@illinois.edu', 2, 6, 4),
('gwehner2@illinois.edu', 3, 8, 4),
('gwehner2@illinois.edu', 4, 7, 3.67),
('lavisha2@illinois.edu', 7, 12, 3.9),
('lavisha2@illinois.edu', 8, 12, 3.67),
('mv5@illinois.edu', 1, 4, 4),
('mv5@illinois.edu', 2, 4, 4),
('rishika2@illinois.edu', 7, 8, 4),
('rishika2@illinois.edu', 8, 12, 4),
('shrutib2@illinois.edu', 7, 8, 3.67),
('shrutib2@illinois.edu', 8, 8, 4),
('trial@illinois.edu', 1, 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `Email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Current_Semester` int(11) NOT NULL,
  `Credits` int(11) NOT NULL,
  `Field_of_study` varchar(20) CHARACTER SET latin1 NOT NULL,
  `Priority` varchar(20) CHARACTER SET latin1 NOT NULL,
  `genedhours` int(11) NOT NULL DEFAULT '18',
  `electivehours` int(11) NOT NULL DEFAULT '24'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`Email`, `Current_Semester`, `Credits`, `Field_of_study`, `Priority`, `genedhours`, `electivehours`) VALUES
('', 4, 100, 'Data', 'L', 100, 40),
('admin1@illinois.edu', 1, 32, 'Algorithms', 'L', 18, 24),
('agupta2@illinois.edu', 2, 12, 'Software', 'G', 15, 15),
('gwehner2@illinois.edu', 3, 18, 'Software', 'L', 4, 4),
('rohank2@illinois.edu', 3, 12, 'Software', 'G', 18, 24),
('test@illinois.edu', 2, 18, 'Systems', 'L', 10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `WadeCourseInfo`
--

CREATE TABLE `WadeCourseInfo` (
  `Year` int(11) DEFAULT NULL,
  `YearTerm` varchar(8) DEFAULT NULL,
  `Subject` varchar(7) DEFAULT NULL,
  `Number` int(11) DEFAULT NULL,
  `Course Title` varchar(30) DEFAULT NULL,
  `Aplus` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  `Aminus` int(11) DEFAULT NULL,
  `Bplus` int(11) DEFAULT NULL,
  `B` int(11) DEFAULT NULL,
  `Bminus` int(11) DEFAULT NULL,
  `Cplus` int(11) DEFAULT NULL,
  `C` int(11) DEFAULT NULL,
  `Cminus` int(11) DEFAULT NULL,
  `Dplus` int(11) DEFAULT NULL,
  `D` int(11) DEFAULT NULL,
  `Dminus` int(11) DEFAULT NULL,
  `F` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `PrimaryInstructor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `WadeCourseInfo`
--

INSERT INTO `WadeCourseInfo` (`Year`, `YearTerm`, `Subject`, `Number`, `Course Title`, `Aplus`, `A`, `Aminus`, `Bplus`, `B`, `Bminus`, `Cplus`, `C`, `Cminus`, `Dplus`, `D`, `Dminus`, `F`, `W`, `PrimaryInstructor`) VALUES
(2017, '2017-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 439, 90, 43, 30, 19, 16, 5, 9, 6, 1, 9, 0, 14, 1, 'Davis, Neal E'),
(2017, '2017-fa', 'CS', 105, 'Intro Computing: Non-Tech', 40, 157, 204, 0, 100, 0, 0, 15, 0, 0, 4, 0, 8, 1, 'Harris, Albert F'),
(2017, '2017-fa', 'CS', 125, 'Intro to Computer Science', 8, 125, 36, 25, 20, 23, 31, 21, 13, 0, 11, 0, 9, 4, 'Angrave, Lawrence C'),
(2017, '2017-fa', 'CS', 125, 'Intro to Computer Science', 8, 74, 27, 20, 15, 9, 16, 7, 3, 0, 6, 0, 2, 0, 'Angrave, Lawrence C'),
(2017, '2017-fa', 'CS', 125, 'Intro to Computer Science', 3, 65, 14, 23, 10, 11, 21, 7, 8, 0, 7, 0, 6, 1, 'Angrave, Lawrence C'),
(2017, '2017-fa', 'CS', 126, 'Software Design Studio', 22, 23, 18, 10, 18, 3, 6, 5, 2, 0, 1, 0, 3, 2, 'Zilles, Craig'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 0, 5, 6, 8, 6, 3, 0, 1, 0, 0, 2, 0, 1, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 1, 5, 6, 5, 6, 2, 1, 1, 0, 1, 0, 0, 2, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 0, 9, 3, 10, 3, 2, 2, 2, 0, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 0, 6, 8, 3, 2, 4, 3, 2, 0, 0, 0, 1, 1, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 1, 8, 6, 7, 4, 7, 0, 1, 1, 1, 2, 2, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 0, 12, 8, 3, 5, 3, 3, 3, 1, 0, 1, 1, 0, 1, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 0, 8, 6, 7, 6, 2, 5, 3, 2, 1, 0, 0, 0, 1, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 2, 5, 9, 4, 7, 5, 3, 4, 0, 0, 0, 1, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 1, 2, 7, 6, 5, 3, 2, 7, 1, 1, 2, 2, 2, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 0, 6, 9, 3, 5, 7, 4, 3, 0, 0, 0, 2, 1, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 3, 7, 1, 6, 4, 4, 1, 2, 1, 0, 1, 0, 1, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 1, 6, 2, 2, 5, 6, 3, 0, 1, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 4, 0, 4, 2, 4, 3, 2, 2, 2, 0, 3, 0, 0, 1, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 4, 3, 2, 5, 4, 4, 0, 1, 1, 0, 1, 0, 2, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 1, 7, 2, 5, 2, 1, 2, 2, 3, 0, 0, 0, 0, 1, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 173, 'Discrete Structures', 5, 2, 2, 4, 5, 1, 1, 3, 0, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 196, 'Freshman Honors', 7, 97, 29, 14, 7, 1, 3, 1, 2, 0, 0, 0, 2, 1, 'Challen, Geoffrey W'),
(2017, '2017-fa', 'CS', 196, 'Freshman Honors', 0, 22, 7, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-fa', 'CS', 199, 'De-Bug your Brain', 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 'Angrave, Lawrence C'),
(2017, '2017-fa', 'CS', 210, 'Ethical & Professional Issues', 32, 90, 15, 5, 12, 1, 1, 4, 1, 0, 1, 0, 6, 0, 'Cunningham, Ryan M'),
(2017, '2017-fa', 'CS', 225, 'Data Structures', 114, 47, 27, 26, 28, 17, 14, 18, 13, 12, 9, 12, 16, 2, 'Fagen-Ulmschnei, Wad'),
(2017, '2017-fa', 'CS', 225, 'Data Structures', 121, 40, 27, 20, 29, 16, 14, 24, 4, 12, 14, 16, 14, 4, 'Fagen-Ulmschnei, Wad'),
(2017, '2017-fa', 'CS', 233, 'Computer Architecture', 1, 89, 8, 3, 34, 4, 2, 18, 2, 0, 5, 0, 8, 1, 'Herman, Geoffrey L'),
(2017, '2017-fa', 'CS', 233, 'Computer Architecture', 1, 55, 0, 5, 29, 3, 3, 20, 0, 0, 9, 0, 10, 1, 'Herman, Geoffrey L'),
(2017, '2017-fa', 'CS', 241, 'System Programming', 11, 24, 15, 21, 7, 23, 12, 12, 8, 7, 8, 10, 5, 3, 'Evans, Graham C'),
(2017, '2017-fa', 'CS', 242, 'Programming Studio', 10, 37, 52, 24, 7, 8, 5, 4, 2, 1, 3, 0, 3, 1, 'Woodley, Michael J'),
(2017, '2017-fa', 'CS', 242, 'Programming Studio', 3, 17, 25, 9, 2, 3, 5, 4, 2, 0, 1, 0, 5, 1, 'Woodley, Michael J'),
(2017, '2017-fa', 'CS', 296, 'Honors Course', 0, 92, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 1, 'Fagen-Ulmschnei, Wad'),
(2017, '2017-fa', 'CS', 296, 'Honors Course', 4, 12, 0, 2, 6, 0, 0, 1, 0, 0, 0, 0, 3, 1, 'Zilles, Craig'),
(2017, '2017-fa', 'CS', 357, 'Numerical Methods I', 24, 46, 15, 21, 26, 12, 8, 15, 4, 1, 6, 0, 3, 0, 'Olson, Luke'),
(2017, '2017-fa', 'CS', 357, 'Numerical Methods I', 25, 40, 28, 27, 29, 18, 23, 21, 9, 11, 5, 5, 11, 1, 'Olson, Luke'),
(2017, '2017-fa', 'CS', 361, 'Prob & Stat for Computer Sci', 4, 20, 5, 2, 0, 0, 0, 0, 1, 0, 0, 0, 3, 0, 'Barber, Richard C'),
(2017, '2017-fa', 'CS', 374, 'Intro to Algs & Models of Comp', 7, 41, 33, 38, 35, 50, 65, 51, 33, 33, 8, 6, 8, 0, 'Har-Peled, Sariel'),
(2017, '2017-fa', 'CS', 410, 'Text Information Systems', 95, 27, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zhai, Chengxiang'),
(2017, '2017-fa', 'CS', 411, 'Database Systems', 7, 19, 15, 14, 19, 20, 10, 6, 7, 5, 3, 6, 11, 0, 'Chang, Kevin C'),
(2017, '2017-fa', 'CS', 412, 'Introduction to Data Mining', 0, 5, 3, 1, 4, 5, 0, 1, 0, 0, 0, 0, 2, 0, 'Han, Jiawei'),
(2017, '2017-fa', 'CS', 412, 'Introduction to Data Mining', 13, 24, 19, 23, 35, 18, 4, 8, 4, 1, 2, 1, 6, 0, 'Han, Jiawei'),
(2017, '2017-fa', 'CS', 418, 'Interactive Computer Graphics', 9, 54, 13, 14, 16, 8, 11, 5, 3, 0, 6, 0, 4, 0, 'Shaffer, Eric G'),
(2017, '2017-fa', 'CS', 420, 'Parallel Progrmg: Sci & Engrg', 0, 8, 3, 7, 9, 9, 3, 1, 3, 1, 1, 0, 0, 0, 'Snir, Marc'),
(2017, '2017-fa', 'CS', 421, 'Progrmg Languages & Compilers', 7, 45, 3, 8, 10, 2, 3, 5, 2, 0, 1, 3, 1, 0, 'Misailovic, Sasa'),
(2017, '2017-fa', 'CS', 421, 'Progrmg Languages & Compilers', 12, 97, 7, 5, 13, 7, 4, 4, 2, 2, 2, 2, 0, 0, 'Gunter, Elsa'),
(2017, '2017-fa', 'CS', 424, 'Real-Time Systems', 2, 14, 8, 6, 6, 0, 2, 3, 1, 0, 1, 0, 0, 0, 'Abdelzaher, Tarek'),
(2017, '2017-fa', 'CS', 425, 'Distributed Systems', 0, 5, 4, 17, 9, 3, 3, 3, 1, 0, 0, 0, 5, 1, 'Gupta, Indranil'),
(2017, '2017-fa', 'CS', 425, 'Distributed Systems', 20, 24, 48, 27, 31, 20, 0, 1, 0, 0, 0, 0, 4, 1, 'Gupta, Indranil'),
(2017, '2017-fa', 'CS', 425, 'Distributed Systems', 0, 3, 6, 8, 6, 3, 0, 1, 0, 0, 0, 0, 0, 0, 'Gupta, Indranil'),
(2017, '2017-fa', 'CS', 427, 'Software Engineering I', 15, 37, 15, 21, 18, 7, 6, 2, 1, 1, 2, 0, 1, 0, 'Rosu, Grigore'),
(2017, '2017-fa', 'CS', 431, 'Embedded Systems', 2, 6, 1, 5, 11, 5, 3, 3, 2, 0, 3, 0, 2, 1, 'Caccamo, Marco'),
(2017, '2017-fa', 'CS', 433, 'Computer System Organization', 4, 6, 0, 4, 4, 3, 0, 2, 1, 0, 0, 0, 0, 0, 'Torrellas, Josep'),
(2017, '2017-fa', 'CS', 438, 'Communication Networks', 7, 20, 12, 9, 23, 3, 5, 2, 0, 0, 0, 0, 0, 0, 'Al-Hassanieh, Haitha'),
(2017, '2017-fa', 'CS', 440, 'Artificial Intelligence', 43, 56, 6, 4, 46, 1, 3, 15, 0, 0, 6, 1, 4, 0, 'Lazebnik, Svetlana'),
(2017, '2017-fa', 'CS', 440, 'Artificial Intelligence', 31, 66, 13, 12, 76, 15, 8, 19, 3, 1, 15, 2, 1, 1, 'Hasegawa-Johnso, Mar'),
(2017, '2017-fa', 'CS', 445, 'Computational Photography', 12, 53, 9, 3, 3, 4, 4, 3, 0, 0, 1, 0, 0, 0, 'Hoiem, Derek W'),
(2017, '2017-fa', 'CS', 446, 'Machine Learning', 9, 30, 24, 16, 19, 1, 4, 1, 3, 2, 0, 2, 6, 1, 'Koyejo, Oluwasanmi O'),
(2017, '2017-fa', 'CS', 447, 'Natural Language Processing', 18, 30, 15, 7, 4, 6, 1, 1, 0, 0, 0, 0, 1, 0, 'Hockenmaier, Julia C'),
(2017, '2017-fa', 'CS', 450, 'Numerical Analysis', 2, 29, 23, 24, 14, 14, 10, 3, 3, 1, 0, 1, 1, 0, 'Fischer, Paul'),
(2017, '2017-fa', 'CS', 461, 'Computer Security I', 23, 39, 43, 44, 34, 14, 12, 0, 0, 0, 2, 0, 3, 0, 'Cunningham, Ryan M'),
(2017, '2017-fa', 'CS', 465, 'User Interface Design', 1, 24, 21, 9, 76, 21, 7, 4, 5, 2, 1, 0, 1, 0, 'Bailey, Brian P'),
(2017, '2017-fa', 'CS', 484, 'Parallel Programming', 2, 11, 2, 4, 8, 2, 0, 5, 1, 0, 1, 0, 0, 0, 'Kale, Laxmikant V'),
(2017, '2017-fa', 'CS', 498, 'Digital Forensics', 0, 29, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'Campbell, R H'),
(2017, '2017-fa', 'CS', 498, 'Theory II', 5, 5, 7, 6, 7, 6, 4, 3, 4, 0, 0, 0, 0, 0, 'Chan, Timothy M'),
(2017, '2017-fa', 'CS', 498, 'The Art of Web Programming', 5, 37, 29, 27, 28, 19, 5, 7, 7, 0, 1, 0, 0, 0, 'Kumar, Ranjitha'),
(2017, '2017-fa', 'CS', 498, 'Virtual Reality', 28, 114, 12, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'Yershova, Ganna'),
(2017, '2017-fa', 'CS', 510, 'Advanced Information Retrieval', 16, 40, 15, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zhai, Chengxiang'),
(2017, '2017-fa', 'CS', 519, 'Scientific Visualization', 7, 17, 6, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shaffer, Eric G'),
(2017, '2017-fa', 'CS', 523, 'Advanced Operating Systems', 11, 10, 5, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Campbell, R H'),
(2017, '2017-fa', 'CS', 527, 'Topics in Software Engineering', 4, 11, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Marinov, Darko'),
(2017, '2017-fa', 'CS', 548, 'Models of Cognitive Processes', 0, 7, 2, 13, 17, 2, 3, 0, 0, 0, 1, 0, 0, 0, 'Fu, Wai-Tat'),
(2017, '2017-fa', 'CS', 554, 'Parallel Numerical Algorithms', 1, 9, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Solomonik, Edgar V'),
(2017, '2017-fa', 'CS', 598, 'Secure Processor Design', 3, 19, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fletcher, Christophe'),
(2017, '2017-fa', 'CS', 598, 'Advanced Bayesian Modeling', 8, 20, 5, 9, 5, 2, 0, 1, 0, 0, 0, 0, 0, 0, 'Park, Trevor H'),
(2017, '2017-fa', 'CS', 598, 'Adv Social&Information Network', 12, 7, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sundaram, Hari'),
(2017, '2017-fa', 'CS', 598, 'Mach Lrng for Signal Processng', 17, 32, 19, 2, 0, 1, 0, 1, 0, 0, 0, 0, 2, 1, 'Smaragdis, Paris'),
(2017, '2017-fa', 'CS', 598, 'Machine Learning Theory', 2, 13, 5, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Telgarsky, Matus J'),
(2017, '2017-sp', 'CS', 101, 'Intro Computing: Engrg & Sci', 239, 159, 72, 61, 44, 24, 9, 12, 9, 7, 2, 4, 15, 3, 'Davis, Neal E'),
(2017, '2017-sp', 'CS', 105, 'Intro Computing: Non-Tech', 184, 130, 64, 42, 41, 21, 11, 14, 1, 5, 9, 1, 21, 3, 'Haberman, Michael'),
(2017, '2017-sp', 'CS', 125, 'Intro to Computer Science', 28, 44, 22, 10, 26, 10, 12, 14, 7, 1, 1, 0, 2, 2, 'Chapman, William L'),
(2017, '2017-sp', 'CS', 125, 'Intro to Computer Science', 24, 43, 23, 9, 19, 15, 15, 10, 14, 2, 2, 0, 1, 0, 'Chapman, William L'),
(2017, '2017-sp', 'CS', 125, 'Intro to Computer Science', 25, 54, 16, 11, 23, 15, 9, 12, 8, 3, 1, 1, 0, 2, 'Chapman, William L'),
(2017, '2017-sp', 'CS', 126, 'Software Design Studio', 27, 32, 32, 29, 12, 10, 7, 2, 2, 1, 0, 1, 3, 0, 'Angrave, Lawrence C'),
(2017, '2017-sp', 'CS', 126, 'Software Design Studio', 9, 15, 26, 18, 8, 10, 3, 4, 4, 2, 0, 0, 4, 0, 'Angrave, Lawrence C'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 2, 13, 7, 5, 8, 1, 2, 3, 1, 0, 0, 1, 1, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 2, 9, 10, 10, 8, 2, 3, 0, 1, 1, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 2, 14, 4, 8, 2, 5, 2, 2, 2, 0, 1, 0, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 3, 7, 7, 4, 8, 2, 1, 6, 1, 2, 1, 0, 1, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 5, 8, 5, 3, 5, 5, 6, 2, 1, 0, 0, 0, 1, 1, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 0, 11, 5, 7, 5, 3, 1, 5, 1, 1, 0, 1, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 3, 6, 8, 3, 9, 2, 1, 4, 1, 0, 0, 1, 1, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 1, 11, 8, 6, 2, 3, 4, 3, 2, 0, 2, 0, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 2, 13, 7, 4, 7, 1, 2, 3, 0, 1, 1, 0, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 1, 3, 5, 5, 6, 4, 1, 4, 1, 1, 1, 0, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 2, 8, 5, 7, 2, 2, 5, 2, 1, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 6, 5, 6, 2, 2, 2, 4, 2, 0, 0, 1, 0, 0, 1, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 4, 12, 1, 5, 4, 0, 0, 2, 0, 2, 0, 0, 1, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 2, 10, 2, 2, 3, 3, 0, 4, 2, 1, 0, 1, 1, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 173, 'Discrete Structures', 4, 5, 2, 3, 5, 3, 1, 3, 1, 0, 2, 1, 0, 0, 'Fleck, Margaret M'),
(2017, '2017-sp', 'CS', 196, 'Freshman Honors', 4, 25, 11, 8, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 'Chapman, William L'),
(2017, '2017-sp', 'CS', 199, 'Undergraduate Open Seminar', 3, 20, 8, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Heeren, Cinda'),
(2017, '2017-sp', 'CS', 210, 'Ethical & Professional Issues', 10, 108, 20, 3, 12, 2, 2, 0, 1, 0, 0, 0, 2, 0, 'Cunningham, Ryan M'),
(2017, '2017-sp', 'CS', 225, 'Data Structures', 8, 175, 28, 19, 20, 10, 6, 27, 0, 0, 29, 0, 24, 0, 'Heeren, Cinda'),
(2017, '2017-sp', 'CS', 225, 'Data Structures', 11, 137, 27, 20, 33, 17, 10, 17, 0, 0, 27, 0, 24, 4, 'Heeren, Cinda'),
(2017, '2017-sp', 'CS', 233, 'Computer Architecture', 5, 69, 4, 12, 44, 0, 2, 15, 1, 0, 14, 0, 24, 2, 'Herman, Geoffrey L'),
(2017, '2017-sp', 'CS', 241, 'System Programming', 21, 14, 13, 16, 14, 23, 17, 19, 13, 7, 13, 7, 9, 0, 'Evans, Graham C'),
(2017, '2017-sp', 'CS', 241, 'System Programming', 11, 17, 24, 10, 6, 11, 14, 9, 6, 16, 4, 6, 6, 1, 'Evans, Graham C'),
(2017, '2017-sp', 'CS', 242, 'Programming Studio', 16, 54, 34, 29, 12, 13, 8, 2, 3, 6, 0, 3, 2, 0, 'Woodley, Michael J'),
(2017, '2017-sp', 'CS', 296, 'Honors Course', 35, 36, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'Heeren, Cinda'),
(2017, '2017-sp', 'CS', 296, 'Honors Course', 7, 19, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Angrave, Lawrence C'),
(2017, '2017-sp', 'CS', 357, 'Numerical Methods I', 30, 27, 24, 17, 13, 20, 17, 16, 2, 5, 4, 2, 6, 2, 'Kloeckner, Andreas P'),
(2017, '2017-sp', 'CS', 357, 'Numerical Methods I', 29, 20, 28, 18, 18, 14, 15, 9, 13, 3, 4, 3, 6, 0, 'Kloeckner, Andreas P'),
(2017, '2017-sp', 'CS', 361, 'Prob & Stat for Computer Sci', 8, 21, 14, 3, 6, 6, 1, 1, 0, 0, 2, 1, 1, 0, 'Sinha, Saurabh'),
(2017, '2017-sp', 'CS', 374, 'Intro to Algs & Models of Comp', 20, 51, 28, 46, 67, 45, 46, 32, 38, 17, 7, 5, 6, 0, 'Chekuri, Chandra S'),
(2017, '2017-sp', 'CS', 410, 'Text Information Systems', 76, 54, 32, 7, 5, 1, 0, 2, 1, 0, 1, 1, 0, 0, 'Zhai, Chengxiang'),
(2017, '2017-sp', 'CS', 411, 'Database Systems', 13, 21, 66, 63, 22, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Parameswaran, Aditya'),
(2017, '2017-sp', 'CS', 412, 'Introduction to Data Mining', 3, 16, 21, 5, 6, 0, 0, 2, 0, 0, 0, 0, 1, 1, 'Han, Jiawei'),
(2017, '2017-sp', 'CS', 412, 'Introduction to Data Mining', 29, 55, 26, 9, 6, 5, 6, 2, 0, 0, 0, 0, 1, 0, 'Sundaram, Hari'),
(2017, '2017-sp', 'CS', 418, 'Interactive Computer Graphics', 14, 25, 23, 13, 22, 19, 5, 17, 3, 0, 14, 0, 8, 2, 'Shaffer, Eric G'),
(2017, '2017-sp', 'CS', 419, 'Production Computer Graphics', 5, 5, 1, 5, 0, 1, 1, 2, 0, 0, 0, 0, 3, 0, 'Shaffer, Eric G'),
(2017, '2017-sp', 'CS', 421, 'Progrmg Languages & Compilers', 12, 86, 24, 14, 14, 5, 8, 8, 2, 0, 9, 0, 5, 1, 'Beckman, A M'),
(2017, '2017-sp', 'CS', 421, 'Progrmg Languages & Compilers', 15, 50, 13, 4, 6, 3, 1, 1, 1, 0, 3, 0, 2, 0, 'Beckman, A M'),
(2017, '2017-sp', 'CS', 423, 'Operating Systems Design', 4, 13, 12, 17, 28, 17, 8, 12, 5, 0, 5, 0, 0, 0, 'Bates, Adam M'),
(2017, '2017-sp', 'CS', 425, 'Distributed Systems', 11, 25, 24, 20, 20, 21, 17, 10, 4, 6, 4, 1, 5, 2, 'Borisov, Nikita'),
(2017, '2017-sp', 'CS', 429, 'Software Engineering II, ACP', 2, 9, 10, 5, 7, 4, 3, 0, 0, 0, 0, 0, 0, 0, 'Xie, Tao'),
(2017, '2017-sp', 'CS', 431, 'Embedded Systems', 5, 7, 18, 16, 5, 1, 0, 1, 0, 0, 0, 0, 0, 0, 'Sha, Lui R'),
(2017, '2017-sp', 'CS', 433, 'Computer System Organization', 5, 6, 4, 5, 4, 1, 1, 0, 0, 0, 0, 0, 0, 0, 'Adve, Sarita V'),
(2017, '2017-sp', 'CS', 438, 'Communication Networks', 2, 28, 2, 4, 12, 7, 3, 6, 4, 1, 2, 3, 9, 1, 'Kravets, Robin H'),
(2017, '2017-sp', 'CS', 440, 'Artificial Intelligence', 3, 52, 3, 0, 54, 2, 0, 49, 0, 0, 3, 0, 1, 0, 'DeJong, Gerald F'),
(2017, '2017-sp', 'CS', 446, 'Machine Learning', 14, 22, 30, 31, 34, 7, 0, 2, 0, 0, 2, 0, 4, 1, 'Roth, Dan'),
(2017, '2017-sp', 'CS', 450, 'Numerical Analysis', 3, 10, 26, 28, 22, 17, 14, 7, 3, 0, 4, 1, 1, 3, 'Fischer, Paul'),
(2017, '2017-sp', 'CS', 460, 'Security Laboratory', 5, 72, 3, 0, 10, 0, 0, 0, 1, 1, 1, 0, 3, 2, 'Bambenek, John C'),
(2017, '2017-sp', 'CS', 461, 'Computer Security I', 8, 31, 9, 12, 51, 9, 9, 10, 7, 0, 8, 0, 4, 0, ''),
(2017, '2017-sp', 'CS', 463, 'Computer Security II', 0, 13, 0, 0, 24, 0, 0, 10, 0, 0, 0, 0, 0, 0, 'Gunter, Carl'),
(2017, '2017-sp', 'CS', 465, 'User Interface Design', 1, 29, 59, 31, 33, 18, 4, 3, 1, 0, 1, 0, 0, 1, 'Fu, Wai-Tat'),
(2017, '2017-sp', 'CS', 466, 'Introduction to Bioinformatics', 2, 6, 4, 2, 1, 1, 0, 1, 2, 0, 1, 0, 1, 0, 'Warnow, Tandy'),
(2017, '2017-sp', 'CS', 484, 'Parallel Programming', 4, 14, 5, 4, 10, 3, 1, 4, 2, 0, 1, 0, 0, 0, 'Kale, Laxmikant V'),
(2017, '2017-sp', 'CS', 492, 'Senior Project I', 1, 12, 6, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Woodley, Michael J'),
(2017, '2017-sp', 'CS', 493, 'Senior Project II, ACP', 0, 9, 9, 3, 4, 2, 1, 2, 1, 1, 1, 0, 0, 0, 'Woodley, Michael J'),
(2017, '2017-sp', 'CS', 498, 'Applied Machine Learning', 1, 11, 7, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Forsyth, David A'),
(2017, '2017-sp', 'CS', 498, 'Applied Machine Learning', 10, 56, 59, 52, 2, 0, 0, 3, 0, 0, 0, 0, 0, 0, 'Forsyth, David A'),
(2017, '2017-sp', 'CS', 498, 'Theory II', 3, 13, 18, 14, 13, 10, 11, 10, 4, 2, 1, 0, 5, 2, 'Erickson, Jeff G'),
(2017, '2017-sp', 'CS', 498, 'Cloud Computing Applications', 18, 19, 10, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Campbell, R H'),
(2017, '2017-sp', 'CS', 498, 'Virtual Reality', 17, 53, 30, 17, 53, 8, 0, 5, 0, 0, 0, 0, 1, 0, 'Lavalle, Steven M'),
(2017, '2017-sp', 'CS', 511, 'Advanced Data Management', 1, 8, 17, 4, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 'Chang, Kevin C'),
(2017, '2017-sp', 'CS', 512, 'Data Mining Principles', 9, 32, 17, 3, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 'Han, Jiawei'),
(2017, '2017-sp', 'CS', 525, 'Advanced Distributed Systems', 7, 13, 13, 14, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gupta, Indranil'),
(2017, '2017-sp', 'CS', 538, 'Advanced Computer Networks', 2, 16, 0, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 'Godfrey, Philip B'),
(2017, '2017-sp', 'CS', 555, 'Numerical Methods for PDEs', 0, 28, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Olson, Luke'),
(2017, '2017-sp', 'CS', 565, 'Human-Computer Interaction', 0, 20, 3, 4, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bailey, Brian P'),
(2017, '2017-sp', 'CS', 598, 'Autonomous Vehicles for AI', 0, 26, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'Forsyth, David A'),
(2017, '2017-sp', 'CS', 598, 'Cutting-Edge Trends In DLR', 12, 27, 11, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lazebnik, Svetlana'),
(2017, '2017-sp', 'CS', 598, 'Social Sensing', 7, 11, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Abdelzaher, Tarek'),
(2016, '2016-fa', 'CS', 100, 'Freshman Orientation', 0, 279, 0, 5, 11, 0, 1, 6, 0, 0, 3, 0, 6, 1, 'Pitt, Leonard B'),
(2016, '2016-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 93, 154, 124, 67, 72, 36, 39, 26, 11, 10, 15, 14, 21, 2, 'Davis, Neal E'),
(2016, '2016-fa', 'CS', 105, 'Intro Computing: Non-Tech', 125, 191, 109, 87, 76, 25, 15, 8, 6, 4, 2, 1, 11, 1, 'Hellwig, Martin'),
(2016, '2016-fa', 'CS', 125, 'Intro to Computer Science', 38, 60, 24, 12, 14, 20, 11, 14, 3, 1, 1, 1, 1, 0, 'Chapman, William L'),
(2016, '2016-fa', 'CS', 125, 'Intro to Computer Science', 33, 55, 26, 13, 28, 14, 13, 4, 3, 1, 0, 2, 1, 1, 'Chapman, William L'),
(2016, '2016-fa', 'CS', 125, 'Intro to Computer Science', 32, 63, 28, 9, 21, 15, 12, 9, 3, 1, 0, 0, 1, 1, 'Chapman, William L'),
(2016, '2016-fa', 'CS', 126, 'Software Design Studio', 4, 23, 0, 3, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 'Zilles, Craig'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 0, 5, 6, 1, 6, 5, 1, 1, 1, 1, 1, 0, 1, 0, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 1, 6, 12, 6, 3, 1, 1, 1, 0, 1, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 0, 3, 5, 3, 9, 8, 3, 2, 0, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 0, 5, 7, 3, 4, 4, 1, 4, 0, 0, 1, 0, 1, 0, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 0, 4, 7, 4, 8, 1, 4, 4, 1, 2, 1, 1, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 1, 7, 7, 8, 3, 6, 2, 1, 1, 3, 1, 1, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 4, 7, 7, 6, 5, 3, 2, 1, 0, 1, 2, 2, 1, 1, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 0, 4, 5, 4, 7, 4, 3, 3, 1, 4, 1, 0, 1, 0, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 2, 8, 7, 6, 3, 4, 4, 3, 2, 0, 0, 0, 0, 1, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 1, 6, 4, 5, 4, 3, 3, 7, 0, 1, 2, 0, 0, 2, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 1, 5, 6, 7, 4, 5, 0, 1, 0, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 2, 3, 3, 3, 3, 4, 2, 4, 1, 0, 0, 1, 1, 0, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 2, 3, 2, 0, 5, 7, 4, 3, 3, 0, 0, 1, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 4, 5, 3, 3, 4, 2, 3, 1, 2, 1, 0, 0, 0, 1, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 173, 'Discrete Structures', 3, 8, 0, 7, 3, 2, 0, 2, 0, 0, 0, 1, 0, 2, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 196, 'Freshman Honors', 25, 89, 0, 2, 1, 0, 0, 4, 0, 0, 0, 0, 0, 1, 'Chapman, William L'),
(2016, '2016-fa', 'CS', 196, 'Freshman Honors', 2, 15, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1, 1, 'Fleck, Margaret M'),
(2016, '2016-fa', 'CS', 199, 'Undergraduate Open Seminar', 0, 25, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Heeren, Cinda'),
(2016, '2016-fa', 'CS', 210, 'Ethical & Professional Issues', 8, 128, 17, 16, 15, 4, 1, 3, 0, 0, 1, 0, 1, 0, 'Cunningham, Ryan M'),
(2016, '2016-fa', 'CS', 225, 'Data Structures', 15, 148, 40, 25, 34, 13, 17, 27, 0, 0, 21, 0, 13, 2, 'Heeren, Cinda'),
(2016, '2016-fa', 'CS', 225, 'Data Structures', 11, 148, 47, 29, 39, 12, 13, 20, 0, 0, 14, 0, 15, 5, 'Heeren, Cinda'),
(2016, '2016-fa', 'CS', 233, 'Computer Architecture', 8, 73, 9, 7, 34, 3, 2, 21, 3, 1, 13, 1, 10, 1, 'Zilles, Craig'),
(2016, '2016-fa', 'CS', 233, 'Computer Architecture', 5, 69, 6, 7, 49, 4, 4, 22, 1, 1, 8, 1, 12, 1, 'Zilles, Craig'),
(2016, '2016-fa', 'CS', 241, 'System Programming', 26, 28, 16, 24, 12, 8, 5, 5, 5, 3, 8, 5, 6, 3, 'Angrave, Lawrence C'),
(2016, '2016-fa', 'CS', 241, 'System Programming', 25, 20, 13, 15, 14, 11, 10, 3, 2, 10, 6, 3, 11, 1, 'Angrave, Lawrence C'),
(2016, '2016-fa', 'CS', 242, 'Programming Studio', 4, 40, 53, 32, 17, 6, 11, 6, 0, 1, 0, 0, 1, 2, 'Woodley, Michael J'),
(2016, '2016-fa', 'CS', 296, 'Honors Course', 0, 53, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 'Heeren, Cinda'),
(2016, '2016-fa', 'CS', 296, 'Honors Course', 2, 8, 7, 1, 0, 1, 2, 1, 1, 1, 0, 0, 1, 0, 'Zilles, Craig'),
(2016, '2016-fa', 'CS', 296, 'Honors Course', 5, 22, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Angrave, Lawrence C'),
(2016, '2016-fa', 'CS', 357, 'Numerical Methods I', 8, 78, 17, 15, 14, 11, 6, 9, 5, 4, 9, 3, 9, 1, 'Kloeckner, Andreas P'),
(2016, '2016-fa', 'CS', 357, 'Numerical Methods I', 4, 35, 3, 3, 1, 1, 3, 2, 2, 7, 3, 1, 0, 0, 'Kloeckner, Andreas P'),
(2016, '2016-fa', 'CS', 361, 'Prob & Stat for Computer Sci', 12, 16, 7, 14, 6, 1, 4, 2, 2, 0, 1, 0, 1, 0, 'Peng, Jian'),
(2016, '2016-fa', 'CS', 374, 'Intro to Algs & Models of Comp', 14, 45, 27, 31, 38, 42, 53, 40, 33, 38, 17, 5, 14, 1, 'Erickson, Jeff G'),
(2016, '2016-fa', 'CS', 410, 'Text Information Systems', 36, 24, 4, 2, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 'Zhai, Chengxiang'),
(2016, '2016-fa', 'CS', 411, 'Database Systems', 16, 23, 48, 17, 30, 26, 6, 6, 13, 5, 4, 5, 7, 0, 'Chang, Kevin C'),
(2016, '2016-fa', 'CS', 412, 'Introduction to Data Mining', 2, 10, 7, 1, 2, 3, 2, 2, 2, 0, 0, 0, 0, 1, 'Han, Jiawei'),
(2016, '2016-fa', 'CS', 412, 'Introduction to Data Mining', 21, 24, 24, 23, 28, 16, 10, 8, 2, 0, 2, 0, 4, 2, 'Han, Jiawei'),
(2016, '2016-fa', 'CS', 418, 'Interactive Computer Graphics', 6, 28, 25, 22, 24, 19, 8, 9, 4, 0, 11, 0, 6, 2, 'Shaffer, Eric G'),
(2016, '2016-fa', 'CS', 420, 'Parallel Progrmg: Sci & Engrg', 3, 3, 5, 3, 4, 9, 3, 2, 2, 1, 1, 0, 0, 1, 'Snir, Marc'),
(2016, '2016-fa', 'CS', 421, 'Progrmg Languages & Compilers', 35, 37, 15, 12, 28, 3, 8, 16, 5, 3, 3, 1, 3, 3, 'Gunter, Elsa'),
(2016, '2016-fa', 'CS', 424, 'Real-Time Systems', 4, 13, 10, 6, 3, 3, 1, 0, 0, 0, 1, 0, 0, 0, 'Abdelzaher, Tarek'),
(2016, '2016-fa', 'CS', 425, 'Distributed Systems', 3, 3, 5, 9, 3, 5, 0, 0, 0, 0, 0, 0, 1, 1, 'Gupta, Indranil'),
(2016, '2016-fa', 'CS', 425, 'Distributed Systems', 14, 18, 46, 36, 40, 20, 2, 0, 0, 0, 0, 0, 1, 0, 'Gupta, Indranil'),
(2016, '2016-fa', 'CS', 426, 'Compiler Construction', 0, 11, 4, 7, 3, 5, 2, 0, 0, 0, 0, 0, 0, 0, 'Adve, Vikram S'),
(2016, '2016-fa', 'CS', 427, 'Software Engineering I', 9, 16, 21, 16, 25, 15, 17, 5, 2, 1, 0, 0, 1, 0, 'Rosu, Grigore'),
(2016, '2016-fa', 'CS', 431, 'Embedded Systems', 3, 9, 2, 11, 16, 7, 8, 7, 3, 0, 5, 0, 3, 0, 'Caccamo, Marco'),
(2016, '2016-fa', 'CS', 433, 'Computer System Organization', 5, 9, 3, 2, 3, 5, 0, 0, 0, 0, 1, 0, 0, 0, 'Adve, Sarita V'),
(2016, '2016-fa', 'CS', 438, 'Communication Networks', 2, 11, 9, 8, 7, 12, 9, 8, 4, 2, 1, 0, 8, 0, 'Borisov, Nikita'),
(2016, '2016-fa', 'CS', 440, 'Artificial Intelligence', 27, 52, 8, 6, 55, 3, 3, 22, 1, 1, 4, 2, 1, 0, 'Lazebnik, Svetlana'),
(2016, '2016-fa', 'CS', 440, 'Artificial Intelligence', 8, 21, 0, 2, 24, 1, 4, 9, 0, 2, 2, 1, 4, 0, 'Hasegawa-Johnso, Mar'),
(2016, '2016-fa', 'CS', 446, 'Machine Learning', 9, 41, 25, 63, 13, 11, 0, 5, 0, 0, 2, 0, 4, 1, 'Roth, Dan'),
(2016, '2016-fa', 'CS', 450, 'Numerical Analysis', 4, 17, 24, 15, 26, 20, 16, 14, 12, 1, 1, 3, 2, 2, 'Heath, Michael T'),
(2016, '2016-fa', 'CS', 461, 'Computer Security I', 15, 24, 11, 14, 42, 9, 7, 23, 3, 0, 8, 0, 3, 0, ''),
(2016, '2016-fa', 'CS', 465, 'User Interface Design', 3, 15, 19, 24, 72, 7, 14, 10, 3, 0, 1, 0, 0, 0, 'Bailey, Brian P'),
(2016, '2016-fa', 'CS', 466, 'Introduction to Bioinformatics', 9, 18, 14, 9, 15, 4, 3, 5, 1, 0, 0, 0, 0, 0, 'Sinha, Saurabh'),
(2016, '2016-fa', 'CS', 492, 'Senior Project I', 1, 6, 11, 15, 4, 4, 2, 0, 1, 0, 0, 0, 0, 0, 'Woodley, Michael J'),
(2016, '2016-fa', 'CS', 498, 'Digital Forensics', 0, 12, 6, 1, 8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Campbell, R H'),
(2016, '2016-fa', 'CS', 498, 'Theory II', 2, 7, 8, 7, 11, 10, 2, 1, 0, 1, 1, 0, 1, 0, 'Chekuri, Chandra S'),
(2016, '2016-fa', 'CS', 498, 'Social & Information Networks', 5, 26, 9, 3, 3, 6, 3, 3, 2, 0, 0, 0, 0, 0, 'Sundaram, Hari'),
(2016, '2016-fa', 'CS', 498, 'Intro to Data Science', 11, 9, 15, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stodden, Victoria'),
(2016, '2016-fa', 'CS', 498, 'The Art of Web Programming', 4, 22, 11, 19, 13, 9, 8, 1, 6, 1, 1, 0, 0, 1, 'Kumar, Ranjitha'),
(2016, '2016-fa', 'CS', 498, 'Virtual Reality', 0, 81, 49, 31, 12, 1, 1, 0, 0, 0, 0, 0, 0, 0, 'Yershova, Ganna'),
(2016, '2016-fa', 'CS', 519, 'Scientific Visualization', 0, 13, 9, 7, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 'Shaffer, Eric G'),
(2016, '2016-fa', 'CS', 527, 'Topics in Software Engineering', 4, 8, 3, 2, 2, 1, 0, 0, 0, 0, 0, 0, 1, 0, 'Marinov, Darko'),
(2016, '2016-fa', 'CS', 548, 'Models of Cognitive Processes', 1, 18, 3, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fu, Wai-Tat'),
(2016, '2016-fa', 'CS', 563, 'Advanced Computer Security', 0, 24, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 'Gunter, Carl'),
(2016, '2016-fa', 'CS', 598, 'Advanced Information Retrieval', 6, 17, 9, 4, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Zhai, Chengxiang'),
(2016, '2016-fa', 'CS', 598, 'Graphical Models', 3, 19, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 'Koyejo, Oluwasanmi O'),
(2016, '2016-sp', 'CS', 101, 'Intro Computing: Engrg & Sci', 6, 341, 78, 65, 96, 14, 13, 33, 11, 0, 15, 0, 16, 5, 'Cunningham, Ryan M'),
(2016, '2016-sp', 'CS', 105, 'Intro Computing: Non-Tech', 161, 135, 86, 49, 34, 15, 11, 3, 4, 1, 1, 0, 8, 2, 'Hellwig, Martin'),
(2016, '2016-sp', 'CS', 125, 'Intro to Computer Science', 60, 112, 39, 34, 49, 10, 25, 21, 6, 2, 4, 1, 7, 4, 'Chapman, William L'),
(2016, '2016-sp', 'CS', 125, 'Intro to Computer Science', 48, 72, 20, 8, 21, 3, 12, 5, 1, 1, 0, 0, 2, 1, 'Chapman, William L'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 4, 10, 2, 10, 1, 2, 1, 2, 0, 1, 1, 0, 1, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 4, 10, 8, 7, 1, 5, 0, 3, 0, 0, 1, 1, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 0, 6, 4, 6, 8, 1, 4, 1, 1, 1, 0, 1, 1, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 2, 9, 6, 3, 9, 5, 1, 2, 0, 0, 2, 0, 1, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 0, 7, 4, 11, 6, 1, 6, 1, 1, 0, 0, 1, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 1, 12, 4, 8, 6, 3, 1, 1, 0, 1, 2, 0, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 1, 6, 7, 9, 10, 1, 3, 1, 1, 0, 1, 0, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 2, 10, 5, 5, 4, 3, 2, 0, 0, 2, 2, 0, 0, 1, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 4, 8, 9, 8, 4, 1, 1, 0, 2, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 3, 9, 2, 4, 9, 2, 1, 2, 1, 0, 4, 0, 2, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 2, 7, 2, 5, 6, 4, 2, 1, 0, 0, 4, 0, 1, 1, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 7, 6, 2, 4, 3, 2, 2, 3, 2, 0, 2, 0, 0, 1, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 3, 5, 2, 1, 5, 4, 2, 1, 0, 0, 4, 0, 4, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 173, 'Discrete Structures', 4, 7, 2, 2, 2, 1, 1, 1, 0, 0, 2, 0, 4, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 196, 'Freshman Honors', 23, 39, 11, 9, 6, 0, 0, 1, 0, 0, 0, 0, 3, 1, 'Chapman, William L'),
(2016, '2016-sp', 'CS', 196, 'Freshman Honors', 7, 6, 6, 2, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2016, '2016-sp', 'CS', 210, 'Ethical & Professional Issues', 3, 81, 25, 18, 35, 8, 8, 6, 1, 0, 1, 0, 3, 1, 'Cunningham, Ryan M'),
(2016, '2016-sp', 'CS', 225, 'Data Structures', 11, 128, 54, 26, 52, 21, 12, 28, 0, 0, 21, 0, 17, 4, 'Heeren, Cinda'),
(2016, '2016-sp', 'CS', 225, 'Data Structures', 5, 82, 29, 14, 24, 3, 8, 14, 0, 0, 9, 0, 6, 1, 'Heeren, Cinda'),
(2016, '2016-sp', 'CS', 225, 'Data Structures', 0, 17, 14, 5, 10, 6, 1, 6, 0, 0, 5, 0, 7, 1, 'Yershova, Ganna'),
(2016, '2016-sp', 'CS', 233, 'Computer Architecture', 7, 64, 7, 5, 35, 6, 5, 24, 1, 1, 10, 2, 13, 1, 'Zilles, Craig'),
(2016, '2016-sp', 'CS', 241, 'System Programming', 14, 16, 12, 16, 20, 29, 21, 10, 5, 14, 6, 1, 12, 1, 'Angrave, Lawrence C'),
(2016, '2016-sp', 'CS', 241, 'System Programming', 19, 14, 21, 16, 23, 14, 14, 4, 3, 7, 5, 3, 9, 1, 'Angrave, Lawrence C'),
(2016, '2016-sp', 'CS', 242, 'Programming Studio', 2, 39, 48, 26, 20, 10, 10, 8, 0, 2, 0, 0, 0, 2, 'Woodley, Michael J'),
(2016, '2016-sp', 'CS', 296, 'Honors Course', 8, 25, 10, 8, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Heeren, Cinda'),
(2016, '2016-sp', 'CS', 296, 'Honors Course', 3, 22, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Angrave, Lawrence C'),
(2016, '2016-sp', 'CS', 357, 'Numerical Methods I', 9, 16, 21, 14, 33, 18, 18, 24, 10, 4, 8, 3, 6, 1, 'Heath, Michael T'),
(2016, '2016-sp', 'CS', 357, 'Numerical Methods I', 3, 9, 9, 10, 17, 7, 8, 7, 9, 3, 2, 4, 1, 0, 'Shaffer, Eric G'),
(2016, '2016-sp', 'CS', 410, 'Text Information Systems', 17, 155, 0, 2, 11, 0, 1, 1, 0, 0, 1, 0, 0, 1, 'Zhai, Chengxiang'),
(2016, '2016-sp', 'CS', 411, 'Database Systems', 6, 28, 62, 56, 25, 13, 0, 0, 0, 0, 0, 0, 0, 0, 'Parameswaran, Aditya'),
(2016, '2016-sp', 'CS', 412, 'Introduction to Data Mining', 5, 26, 17, 4, 8, 9, 1, 2, 5, 0, 2, 0, 2, 2, 'Sundaram, Hari'),
(2016, '2016-sp', 'CS', 418, 'Interactive Computer Graphics', 18, 52, 51, 13, 13, 9, 4, 3, 2, 1, 0, 0, 1, 3, 'Hart, John C'),
(2016, '2016-sp', 'CS', 419, 'Production Computer Graphics', 4, 13, 8, 6, 3, 2, 0, 2, 0, 0, 1, 0, 0, 0, 'Shaffer, Eric G'),
(2016, '2016-sp', 'CS', 421, 'Progrmg Languages & Compilers', 53, 47, 15, 10, 11, 3, 4, 9, 3, 0, 1, 0, 4, 0, 'Beckman, A M'),
(2016, '2016-sp', 'CS', 421, 'Progrmg Languages & Compilers', 23, 24, 10, 10, 13, 3, 1, 4, 1, 0, 0, 0, 0, 0, 'Beckman, A M'),
(2016, '2016-sp', 'CS', 423, 'Operating Systems Design', 16, 39, 13, 11, 15, 6, 1, 0, 2, 0, 0, 2, 0, 3, 'Abdelzaher, Tarek'),
(2016, '2016-sp', 'CS', 425, 'Distributed Systems', 6, 35, 18, 16, 47, 13, 5, 14, 3, 5, 0, 1, 2, 1, 'Vaidya, Nitin H'),
(2016, '2016-sp', 'CS', 428, 'Software Engineering II', 9, 11, 4, 4, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Xie, Tao'),
(2016, '2016-sp', 'CS', 429, 'Software Engineering II, ACP', 10, 8, 20, 18, 7, 1, 1, 1, 0, 0, 0, 0, 0, 0, 'Xie, Tao'),
(2016, '2016-sp', 'CS', 431, 'Embedded Systems', 3, 2, 0, 10, 16, 3, 4, 3, 3, 0, 0, 0, 0, 0, 'Sha, Lui R'),
(2016, '2016-sp', 'CS', 433, 'Computer System Organization', 0, 6, 5, 4, 5, 2, 0, 1, 1, 0, 0, 0, 0, 0, 'Adve, Sarita V'),
(2016, '2016-sp', 'CS', 438, 'Communication Networks', 3, 30, 3, 5, 8, 6, 2, 3, 1, 2, 4, 4, 12, 0, 'Kravets, Robin H'),
(2016, '2016-sp', 'CS', 440, 'Artificial Intelligence', 11, 32, 5, 0, 56, 14, 0, 13, 0, 0, 6, 0, 3, 0, 'DeJong, Gerald F'),
(2016, '2016-sp', 'CS', 450, 'Numerical Analysis', 7, 54, 10, 13, 23, 5, 5, 7, 1, 2, 2, 0, 2, 2, 'Kloeckner, Andreas P'),
(2016, '2016-sp', 'CS', 460, 'Security Laboratory', 3, 45, 3, 4, 3, 1, 6, 5, 1, 0, 1, 2, 3, 0, 'Bambenek, John C'),
(2016, '2016-sp', 'CS', 461, 'Computer Security I', 6, 28, 8, 6, 43, 14, 7, 20, 4, 2, 2, 2, 5, 1, 'Bailey, Michael D'),
(2016, '2016-sp', 'CS', 463, 'Computer Security II', 0, 14, 0, 0, 19, 0, 0, 3, 0, 0, 0, 0, 0, 0, 'Gunter, Carl'),
(2016, '2016-sp', 'CS', 465, 'User Interface Design', 3, 41, 49, 35, 30, 8, 5, 0, 1, 1, 0, 0, 2, 0, 'Kirlik, Alex'),
(2016, '2016-sp', 'CS', 466, 'Introduction to Bioinformatics', 2, 19, 2, 10, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Peng, Jian'),
(2016, '2016-sp', 'CS', 467, 'Social Visualization', 2, 42, 16, 8, 8, 3, 0, 1, 0, 0, 0, 0, 0, 0, 'Karahalios, Kyratso '),
(2016, '2016-sp', 'CS', 484, 'Parallel Programming', 5, 4, 6, 1, 4, 3, 3, 2, 1, 1, 0, 0, 0, 0, 'Kale, Laxmikant V'),
(2016, '2016-sp', 'CS', 493, 'Senior Project II, ACP', 21, 38, 17, 12, 5, 4, 2, 0, 0, 0, 0, 0, 4, 0, 'Woodley, Michael J'),
(2016, '2016-sp', 'CS', 494, 'Senior Project II', 6, 9, 5, 2, 5, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Woodley, Michael J'),
(2016, '2016-sp', 'CS', 498, 'Mobile Interaction Design', 3, 17, 11, 5, 6, 1, 0, 0, 1, 0, 0, 0, 0, 0, 'Bailey, Brian P'),
(2016, '2016-sp', 'CS', 498, 'Algorithms and Models of Comp', 19, 37, 67, 14, 39, 80, 19, 35, 13, 34, 10, 0, 0, 2, 'Viswanathan, Mahesh'),
(2016, '2016-sp', 'CS', 498, 'Probability in CS', 14, 15, 13, 7, 1, 1, 2, 2, 2, 2, 0, 0, 0, 1, 'Smaragdis, Paris'),
(2016, '2016-sp', 'CS', 498, 'Applied Machine Learning', 6, 79, 54, 16, 5, 0, 0, 0, 0, 0, 0, 0, 3, 1, 'Forsyth, David A'),
(2016, '2016-sp', 'CS', 498, 'Theory II', 5, 18, 15, 14, 15, 11, 12, 5, 3, 2, 0, 1, 1, 0, 'Erickson, Jeff G'),
(2016, '2016-sp', 'CS', 498, 'Software Testing', 9, 3, 3, 4, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 'Marinov, Darko'),
(2016, '2016-sp', 'CS', 498, 'Art and Science of Web Prog', 3, 20, 16, 10, 13, 11, 16, 1, 1, 0, 2, 0, 0, 1, 'Kumar, Ranjitha'),
(2016, '2016-sp', 'CS', 498, 'Virtual Reality', 10, 26, 22, 9, 19, 6, 0, 4, 0, 0, 0, 0, 0, 0, 'Lavalle, Steven M'),
(2016, '2016-sp', 'CS', 511, 'Advanced Data Management', 4, 15, 10, 3, 5, 2, 1, 0, 0, 0, 0, 0, 0, 0, 'Chang, Kevin C'),
(2016, '2016-sp', 'CS', 512, 'Data Mining Principles', 10, 39, 6, 5, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'Han, Jiawei'),
(2016, '2016-sp', 'CS', 525, 'Advanced Distributed Systems', 8, 13, 24, 26, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gupta, Indranil'),
(2016, '2016-sp', 'CS', 533, 'Parallel Computer Architecture', 3, 11, 3, 4, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Torrellas, Josep'),
(2016, '2016-sp', 'CS', 538, 'Advanced Computer Networks', 0, 15, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nahrstedt, Klara'),
(2016, '2016-sp', 'CS', 546, 'Machine Learning in NLP', 2, 18, 5, 7, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Roth, Dan'),
(2016, '2016-sp', 'CS', 555, 'Numerical Methods for PDEs', 0, 21, 3, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Olson, Luke'),
(2015, '2015-fa', 'CS', 100, 'Freshman Orientation', 0, 234, 0, 9, 11, 4, 0, 10, 0, 0, 2, 2, 4, 0, 'Pitt, Leonard B'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 13, 2, 5, 10, 3, 0, 3, 0, 0, 2, 0, 0, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 6, 4, 4, 9, 4, 4, 2, 1, 0, 1, 0, 3, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 1, 12, 4, 5, 6, 1, 2, 2, 0, 0, 3, 0, 1, 1, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 13, 7, 9, 5, 2, 0, 2, 0, 0, 2, 0, 0, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 11, 8, 3, 11, 2, 0, 2, 1, 0, 0, 0, 1, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 7, 4, 3, 10, 2, 3, 5, 1, 0, 2, 0, 1, 1, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 1, 13, 5, 7, 11, 2, 0, 0, 1, 0, 1, 0, 0, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 14, 4, 4, 7, 0, 2, 2, 1, 0, 1, 0, 1, 1, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 9, 5, 1, 8, 4, 1, 7, 0, 0, 2, 0, 1, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 14, 3, 5, 10, 2, 2, 1, 0, 0, 1, 0, 0, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 1, 20, 4, 5, 3, 2, 1, 1, 1, 0, 1, 0, 1, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 1, 11, 6, 7, 9, 0, 0, 4, 1, 0, 0, 0, 1, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 7, 2, 7, 13, 1, 0, 6, 1, 0, 2, 0, 1, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 1, 14, 6, 4, 5, 3, 2, 4, 0, 0, 1, 0, 1, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 10, 5, 4, 5, 2, 3, 3, 2, 0, 2, 0, 3, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 1, 7, 2, 2, 5, 2, 2, 5, 1, 0, 3, 0, 4, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 0, 16, 2, 6, 7, 1, 1, 1, 0, 0, 1, 0, 4, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 101, 'Intro Computing: Engrg & Sci', 1, 16, 3, 2, 8, 2, 0, 3, 1, 0, 1, 0, 1, 0, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 17, 3, 2, 5, 7, 2, 1, 0, 0, 1, 0, 0, 1, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 9, 13, 5, 1, 4, 1, 2, 0, 0, 1, 0, 0, 1, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 8, 12, 6, 6, 3, 2, 0, 1, 0, 0, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 8, 5, 6, 2, 4, 2, 3, 2, 1, 0, 0, 0, 1, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 11, 13, 3, 4, 2, 1, 0, 1, 1, 0, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 7, 5, 4, 4, 8, 3, 2, 0, 1, 1, 1, 0, 0, 1, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 11, 7, 3, 4, 4, 4, 1, 1, 0, 0, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 10, 11, 7, 2, 1, 1, 3, 1, 0, 0, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 5, 18, 2, 7, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 7, 10, 5, 9, 4, 1, 1, 0, 2, 0, 1, 0, 1, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 10, 11, 6, 5, 5, 0, 1, 1, 0, 0, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 14, 11, 7, 3, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 11, 10, 8, 4, 3, 1, 1, 0, 0, 0, 0, 0, 1, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 16, 9, 2, 3, 1, 2, 0, 1, 2, 0, 1, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 11, 12, 4, 3, 1, 0, 1, 0, 0, 0, 0, 0, 2, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 15, 11, 2, 1, 2, 1, 1, 1, 1, 1, 0, 0, 1, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 14, 15, 4, 1, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 12, 11, 1, 3, 6, 2, 1, 1, 0, 0, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 14, 7, 3, 5, 1, 2, 1, 0, 0, 0, 0, 1, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 14, 5, 9, 2, 4, 1, 0, 0, 0, 1, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 14, 9, 2, 3, 5, 2, 1, 0, 1, 1, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 14, 11, 5, 3, 3, 3, 1, 0, 0, 0, 0, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 8, 13, 5, 3, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 105, 'Intro Computing: Non-Tech', 8, 5, 10, 4, 1, 2, 1, 0, 0, 2, 0, 0, 1, 2, 'Fagen, Wade A'),
(2015, '2015-fa', 'CS', 125, 'Intro to Computer Science', 51, 59, 17, 16, 10, 5, 8, 15, 1, 1, 0, 1, 3, 0, 'Chapman, William L'),
(2015, '2015-fa', 'CS', 125, 'Intro to Computer Science', 47, 57, 18, 12, 22, 5, 12, 12, 2, 2, 1, 0, 4, 0, 'Chapman, William L'),
(2015, '2015-fa', 'CS', 125, 'Intro to Computer Science', 54, 54, 7, 16, 17, 5, 14, 14, 1, 3, 0, 0, 5, 5, 'Chapman, William L'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 1, 5, 5, 2, 4, 8, 4, 0, 1, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 0, 8, 4, 3, 5, 3, 2, 1, 3, 0, 0, 0, 0, 1, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 3, 7, 7, 5, 3, 2, 2, 2, 0, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 1, 7, 5, 2, 6, 4, 0, 0, 1, 1, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 4, 6, 9, 3, 8, 3, 2, 2, 0, 0, 1, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 1, 11, 5, 5, 4, 3, 3, 3, 0, 1, 2, 0, 1, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 1, 5, 14, 6, 4, 1, 3, 4, 0, 0, 2, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 2, 11, 4, 2, 6, 4, 4, 4, 3, 1, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 0, 6, 6, 3, 3, 7, 1, 5, 3, 2, 1, 1, 1, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 1, 7, 7, 10, 4, 4, 3, 0, 0, 0, 1, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 4, 1, 3, 4, 5, 1, 2, 0, 1, 3, 0, 1, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 5, 0, 2, 3, 9, 2, 2, 0, 1, 1, 1, 0, 1, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 4, 2, 4, 4, 4, 4, 2, 2, 1, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 6, 0, 3, 3, 4, 4, 1, 1, 2, 1, 3, 2, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 6, 5, 8, 5, 3, 0, 1, 1, 0, 1, 0, 1, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 173, 'Discrete Structures', 2, 5, 2, 3, 1, 3, 4, 1, 0, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 196, 'Freshman Honors', 62, 55, 9, 1, 5, 2, 1, 4, 0, 0, 0, 0, 1, 1, 'Chapman, William L'),
(2015, '2015-fa', 'CS', 196, 'Freshman Honors', 8, 12, 5, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 'Fleck, Margaret M'),
(2015, '2015-fa', 'CS', 199, 'Undergraduate Open Seminar', 0, 24, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'Heeren, Cinda'),
(2015, '2015-fa', 'CS', 210, 'Ethical & Professional Issues', 3, 106, 32, 10, 21, 5, 1, 3, 0, 0, 1, 0, 2, 1, 'Cunningham, Ryan M'),
(2015, '2015-fa', 'CS', 225, 'Data Structures', 5, 89, 48, 26, 56, 13, 13, 20, 4, 0, 12, 0, 12, 3, 'Heeren, Cinda'),
(2015, '2015-fa', 'CS', 225, 'Data Structures', 3, 86, 36, 23, 39, 19, 16, 26, 11, 0, 20, 0, 11, 3, 'Heeren, Cinda'),
(2015, '2015-fa', 'CS', 233, 'Computer Architecture', 7, 44, 4, 7, 54, 4, 4, 29, 2, 0, 4, 3, 3, 5, 'Zilles, Craig'),
(2015, '2015-fa', 'CS', 233, 'Computer Architecture', 5, 37, 8, 6, 39, 5, 3, 24, 7, 0, 4, 2, 8, 0, 'Zilles, Craig'),
(2015, '2015-fa', 'CS', 241, 'System Programming', 14, 17, 13, 33, 16, 18, 7, 14, 8, 13, 7, 9, 4, 2, 'Angrave, Lawrence C'),
(2015, '2015-fa', 'CS', 242, 'Programming Studio', 4, 52, 60, 24, 8, 3, 9, 5, 1, 3, 1, 1, 4, 1, 'Woodley, Michael J'),
(2015, '2015-fa', 'CS', 296, 'Honors Course', 7, 9, 6, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Zilles, Craig'),
(2015, '2015-fa', 'CS', 357, 'Numerical Methods I', 0, 51, 24, 32, 33, 14, 17, 8, 7, 6, 3, 3, 0, 0, 'Olson, Luke'),
(2015, '2015-fa', 'CS', 411, 'Database Systems', 31, 65, 31, 12, 30, 17, 2, 3, 1, 0, 0, 0, 2, 0, 'Sinha, Saurabh'),
(2015, '2015-fa', 'CS', 412, 'Introduction to Data Mining', 10, 23, 36, 16, 19, 25, 7, 9, 18, 4, 6, 2, 9, 1, 'Chang, Kevin C'),
(2015, '2015-fa', 'CS', 418, 'Interactive Computer Graphics', 10, 47, 26, 21, 22, 11, 6, 7, 6, 0, 3, 0, 6, 2, 'Shaffer, Eric G'),
(2015, '2015-fa', 'CS', 420, 'Parallel Progrmg: Sci & Engrg', 4, 16, 11, 6, 7, 7, 2, 1, 0, 0, 0, 0, 0, 0, 'Kale, Laxmikant V'),
(2015, '2015-fa', 'CS', 425, 'Distributed Systems', 20, 24, 58, 61, 27, 3, 2, 0, 0, 0, 0, 0, 1, 1, 'Gupta, Indranil'),
(2015, '2015-fa', 'CS', 426, 'Compiler Construction', 2, 7, 5, 3, 2, 1, 0, 4, 0, 0, 0, 0, 0, 0, 'Adve, Vikram S'),
(2015, '2015-fa', 'CS', 427, 'Software Engineering I', 13, 46, 32, 30, 17, 15, 12, 5, 0, 0, 0, 0, 1, 0, 'Marinov, Darko'),
(2015, '2015-fa', 'CS', 431, 'Embedded Systems', 8, 20, 0, 12, 19, 7, 0, 9, 0, 3, 2, 0, 1, 0, 'Sha, Lui R'),
(2015, '2015-fa', 'CS', 433, 'Computer System Organization', 5, 9, 1, 0, 7, 0, 0, 2, 1, 0, 0, 0, 1, 0, 'Torrellas, Josep'),
(2015, '2015-fa', 'CS', 438, 'Communication Networks', 9, 27, 21, 15, 13, 0, 0, 1, 1, 0, 0, 0, 0, 1, 'Roy Choudhury, Romit'),
(2015, '2015-fa', 'CS', 440, 'Artificial Intelligence', 30, 52, 7, 5, 44, 5, 2, 19, 1, 3, 5, 1, 4, 0, 'Lazebnik, Svetlana'),
(2015, '2015-fa', 'CS', 445, 'Computational Photography', 9, 22, 12, 9, 12, 4, 3, 1, 0, 1, 0, 0, 2, 0, 'Hoiem, Derek W'),
(2015, '2015-fa', 'CS', 446, 'Machine Learning', 9, 29, 43, 45, 15, 2, 0, 0, 0, 0, 2, 0, 4, 0, 'Roth, Dan'),
(2015, '2015-fa', 'CS', 447, 'Natural Language Processing', 15, 18, 10, 10, 6, 7, 2, 1, 2, 0, 0, 0, 0, 1, 'Hockenmaier, Julia C'),
(2015, '2015-fa', 'CS', 450, 'Numerical Analysis', 9, 30, 18, 11, 22, 6, 6, 2, 2, 0, 1, 0, 0, 0, 'Fischer, Paul'),
(2015, '2015-fa', 'CS', 461, 'Computer Security I', 4, 31, 10, 17, 41, 7, 5, 12, 8, 0, 11, 0, 4, 1, 'Bailey, Michael D'),
(2015, '2015-fa', 'CS', 465, 'User Interface Design', 6, 24, 28, 19, 56, 20, 10, 16, 4, 0, 2, 0, 1, 0, 'Fu, Wai-Tat'),
(2015, '2015-fa', 'CS', 492, 'Senior Project I', 0, 8, 56, 25, 22, 24, 2, 0, 1, 1, 0, 0, 0, 0, 'Woodley, Michael J'),
(2015, '2015-fa', 'CS', 498, 'Digital Forensics', 2, 5, 12, 12, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Campbell, R H'),
(2015, '2015-fa', 'CS', 498, 'Algorithms and Models of Comp', 13, 51, 47, 35, 38, 39, 39, 38, 20, 12, 10, 13, 3, 0, 'Chekuri, Chandra S'),
(2015, '2015-fa', 'CS', 498, 'Probability in CS', 1, 26, 7, 17, 17, 7, 1, 1, 2, 0, 1, 0, 3, 0, 'Forsyth, David A'),
(2015, '2015-fa', 'CS', 498, 'Theory II', 0, 5, 5, 4, 4, 2, 2, 3, 0, 0, 0, 0, 0, 0, 'Har-Peled, Sariel'),
(2015, '2015-fa', 'CS', 498, 'Virtual Reality', 5, 46, 19, 16, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 'Yershova, Ganna'),
(2015, '2015-fa', 'CS', 519, 'Scientific Visualization', 2, 21, 4, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shaffer, Eric G'),
(2015, '2015-fa', 'CS', 527, 'Topics in Software Engineering', 6, 11, 8, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 1, 'Xie, Tao'),
(2015, '2015-fa', 'CS', 554, 'Parallel Numerical Algorithms', 3, 6, 4, 8, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'Heath, Michael T'),
(2015, '2015-fa', 'CS', 565, 'Human-Computer Interaction', 3, 9, 9, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Bailey, Brian P'),
(2015, '2015-fa', 'CS', 598, 'Advanced Data Structures', 0, 14, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erickson, Jeff G'),
(2015, '2015-fa', 'CS', 598, 'Machine Lrning Computation Bio', 5, 13, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Peng, Jian'),
(2015, '2015-fa', 'CS', 598, 'Data-Driven Design', 2, 8, 5, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kumar, Ranjitha'),
(2015, '2015-sp', 'CS', 101, 'Intro Computing: Engrg & Sci', 116, 83, 83, 68, 73, 66, 48, 43, 16, 20, 19, 7, 35, 4, 'Gambill, Thomas N'),
(2015, '2015-sp', 'CS', 105, 'Intro Computing: Non-Tech', 60, 101, 61, 40, 52, 41, 25, 24, 10, 6, 2, 1, 8, 0, 'Fagen, Wade A'),
(2015, '2015-sp', 'CS', 125, 'Intro to Computer Science', 43, 48, 18, 15, 26, 4, 10, 13, 7, 1, 1, 3, 3, 0, 'Chapman, William L'),
(2015, '2015-sp', 'CS', 125, 'Intro to Computer Science', 35, 53, 22, 18, 22, 8, 9, 13, 2, 4, 0, 1, 1, 2, 'Chapman, William L'),
(2015, '2015-sp', 'CS', 125, 'Intro to Computer Science', 44, 51, 25, 14, 15, 5, 10, 13, 3, 3, 2, 1, 3, 1, 'Chapman, William L'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 0, 6, 7, 4, 7, 0, 3, 1, 1, 0, 4, 1, 1, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 2, 10, 6, 6, 4, 3, 3, 0, 0, 2, 1, 1, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 0, 7, 9, 3, 2, 4, 3, 3, 2, 5, 0, 0, 1, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 0, 9, 16, 4, 4, 3, 2, 1, 0, 0, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 1, 9, 7, 10, 6, 3, 1, 1, 1, 2, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 1, 6, 7, 9, 11, 2, 0, 4, 1, 0, 0, 0, 1, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 0, 6, 8, 9, 3, 2, 1, 1, 2, 2, 1, 1, 2, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 1, 10, 4, 5, 7, 3, 4, 1, 1, 0, 1, 1, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 2, 13, 6, 6, 5, 2, 1, 1, 1, 0, 0, 0, 1, 0, 'Fleck, Margaret M');
INSERT INTO `WadeCourseInfo` (`Year`, `YearTerm`, `Subject`, `Number`, `Course Title`, `Aplus`, `A`, `Aminus`, `Bplus`, `B`, `Bminus`, `Cplus`, `C`, `Cminus`, `Dplus`, `D`, `Dminus`, `F`, `W`, `PrimaryInstructor`) VALUES
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 4, 6, 5, 5, 5, 3, 0, 0, 0, 0, 1, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 1, 8, 10, 3, 7, 2, 3, 3, 1, 0, 1, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 0, 4, 6, 9, 6, 2, 4, 4, 1, 1, 0, 0, 0, 0, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 3, 2, 7, 7, 7, 4, 3, 0, 2, 2, 0, 0, 0, 1, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 173, 'Discrete Structures', 2, 7, 5, 9, 6, 1, 3, 2, 2, 0, 1, 0, 0, 1, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 196, 'Freshman Honors', 26, 68, 23, 6, 5, 2, 0, 0, 0, 0, 0, 0, 0, 2, 'Chapman, William L'),
(2015, '2015-sp', 'CS', 196, 'Freshman Honors', 3, 12, 6, 6, 3, 2, 1, 0, 1, 0, 0, 0, 0, 1, 'Fleck, Margaret M'),
(2015, '2015-sp', 'CS', 199, 'Undergraduate Open Seminar', 0, 18, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Yershova, Ganna'),
(2015, '2015-sp', 'CS', 210, 'Ethical & Professional Issues', 4, 42, 9, 14, 12, 0, 1, 4, 0, 0, 1, 0, 0, 0, 'Cunningham, Ryan M'),
(2015, '2015-sp', 'CS', 210, 'Ethical & Professional Issues', 1, 37, 11, 8, 12, 4, 3, 7, 1, 0, 0, 0, 1, 0, 'Cunningham, Ryan M'),
(2015, '2015-sp', 'CS', 210, 'Ethical & Professional Issues', 1, 32, 9, 11, 18, 4, 2, 6, 1, 1, 0, 0, 1, 0, 'Cunningham, Ryan M'),
(2015, '2015-sp', 'CS', 225, 'Data Structures', 33, 89, 79, 37, 35, 15, 23, 18, 6, 9, 6, 0, 13, 1, 'Heeren, Cinda'),
(2015, '2015-sp', 'CS', 225, 'Data Structures', 19, 56, 30, 27, 12, 11, 5, 5, 4, 5, 4, 0, 4, 3, 'Heeren, Cinda'),
(2015, '2015-sp', 'CS', 233, 'Computer Architecture', 7, 42, 11, 8, 46, 2, 7, 25, 0, 2, 14, 4, 9, 0, 'Zilles, Craig'),
(2015, '2015-sp', 'CS', 233, 'Computer Architecture', 5, 29, 6, 5, 37, 2, 5, 16, 2, 2, 12, 5, 10, 1, 'Zilles, Craig'),
(2015, '2015-sp', 'CS', 241, 'System Programming', 18, 19, 31, 23, 23, 19, 9, 9, 11, 14, 5, 3, 9, 1, 'Angrave, Lawrence C'),
(2015, '2015-sp', 'CS', 242, 'Programming Studio', 10, 38, 42, 24, 14, 10, 4, 8, 3, 4, 1, 0, 4, 0, 'Woodley, Michael J'),
(2015, '2015-sp', 'CS', 296, 'Honors Course', 6, 38, 3, 2, 3, 1, 0, 0, 0, 0, 0, 0, 3, 0, 'Heeren, Cinda'),
(2015, '2015-sp', 'CS', 296, 'Honors Course', 2, 14, 4, 1, 10, 0, 0, 4, 0, 0, 2, 0, 1, 0, 'Zilles, Craig'),
(2015, '2015-sp', 'CS', 357, 'Numerical Methods I', 2, 41, 10, 14, 25, 11, 16, 24, 3, 5, 3, 0, 4, 0, 'Shaffer, Eric G'),
(2015, '2015-sp', 'CS', 357, 'Numerical Methods I', 5, 52, 13, 21, 24, 7, 13, 11, 10, 7, 6, 3, 0, 1, 'Kloeckner, Andreas P'),
(2015, '2015-sp', 'CS', 410, 'Text Information Systems', 21, 102, 16, 11, 10, 4, 0, 0, 0, 0, 0, 0, 0, 1, 'Zhai, Chengxiang'),
(2015, '2015-sp', 'CS', 411, 'Database Systems', 17, 20, 50, 25, 27, 26, 7, 8, 9, 4, 1, 1, 2, 0, 'Chang, Kevin C'),
(2015, '2015-sp', 'CS', 418, 'Interactive Computer Graphics', 12, 32, 48, 31, 16, 10, 3, 5, 3, 1, 2, 2, 5, 1, 'Hart, John C'),
(2015, '2015-sp', 'CS', 421, 'Progrmg Languages & Compilers', 18, 61, 22, 18, 8, 16, 9, 6, 1, 2, 1, 2, 2, 1, 'Agha, Gul A'),
(2015, '2015-sp', 'CS', 423, 'Operating Systems Design', 21, 50, 22, 15, 8, 2, 1, 0, 0, 0, 1, 0, 0, 0, 'Abdelzaher, Tarek'),
(2015, '2015-sp', 'CS', 425, 'Distributed Systems', 2, 26, 8, 19, 22, 22, 14, 11, 5, 3, 0, 0, 0, 0, 'Vaidya, Nitin H'),
(2015, '2015-sp', 'CS', 428, 'Software Engineering II', 6, 10, 8, 6, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Xie, Tao'),
(2015, '2015-sp', 'CS', 429, 'Software Engineering II, ACP', 16, 18, 12, 20, 25, 6, 4, 2, 0, 0, 1, 0, 0, 0, 'Xie, Tao'),
(2015, '2015-sp', 'CS', 431, 'Embedded Systems', 1, 5, 6, 8, 8, 11, 0, 12, 0, 0, 6, 0, 1, 0, 'Caccamo, Marco'),
(2015, '2015-sp', 'CS', 433, 'Computer System Organization', 4, 6, 0, 1, 3, 0, 2, 4, 0, 0, 0, 0, 1, 0, 'Garzaran, Maria J'),
(2015, '2015-sp', 'CS', 438, 'Communication Networks', 2, 27, 5, 3, 13, 4, 4, 7, 4, 3, 2, 5, 15, 1, 'Kravets, Robin H'),
(2015, '2015-sp', 'CS', 440, 'Artificial Intelligence', 18, 59, 7, 7, 41, 0, 0, 19, 2, 0, 5, 1, 9, 1, 'Lazebnik, Svetlana'),
(2015, '2015-sp', 'CS', 446, 'Machine Learning', 7, 29, 9, 19, 12, 16, 6, 6, 0, 2, 0, 1, 2, 1, 'Hockenmaier, Julia C'),
(2015, '2015-sp', 'CS', 450, 'Numerical Analysis', 7, 16, 19, 20, 29, 14, 7, 6, 6, 0, 2, 0, 1, 2, 'Fischer, Paul'),
(2015, '2015-sp', 'CS', 460, 'Security Laboratory', 0, 99, 4, 6, 5, 0, 1, 2, 1, 0, 0, 0, 1, 1, 'Bambenek, John C'),
(2015, '2015-sp', 'CS', 461, 'Computer Security I', 16, 24, 9, 11, 22, 5, 11, 13, 2, 0, 10, 0, 2, 1, 'Bailey, Michael D'),
(2015, '2015-sp', 'CS', 463, 'Computer Security II', 0, 36, 0, 0, 16, 0, 0, 8, 0, 0, 0, 0, 0, 0, 'Gunter, Carl'),
(2015, '2015-sp', 'CS', 465, 'User Interface Design', 2, 13, 24, 21, 35, 22, 13, 12, 5, 0, 2, 0, 1, 0, 'Fu, Wai-Tat'),
(2015, '2015-sp', 'CS', 466, 'Introduction to Bioinformatics', 5, 13, 9, 7, 10, 4, 3, 3, 0, 0, 0, 0, 1, 0, 'Sinha, Saurabh'),
(2015, '2015-sp', 'CS', 473, 'Fundamental Algorithms', 0, 3, 6, 4, 10, 14, 10, 9, 6, 5, 4, 1, 0, 0, 'Har-Peled, Sariel'),
(2015, '2015-sp', 'CS', 484, 'Parallel Programming', 2, 8, 2, 2, 9, 3, 1, 3, 2, 1, 1, 0, 0, 1, 'Kale, Laxmikant V'),
(2015, '2015-sp', 'CS', 493, 'Senior Project II, ACP', 4, 21, 25, 13, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'Woodley, Michael J'),
(2015, '2015-sp', 'CS', 494, 'Senior Project II', 2, 6, 6, 4, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Woodley, Michael J'),
(2015, '2015-sp', 'CS', 498, 'Algorithms and Models of Comp', 21, 33, 24, 43, 39, 30, 35, 27, 32, 24, 20, 8, 5, 2, 'Pitt, Leonard B'),
(2015, '2015-sp', 'CS', 498, 'Probability in CS', 2, 16, 8, 8, 10, 10, 1, 2, 0, 0, 1, 0, 6, 0, 'Forsyth, David A'),
(2015, '2015-sp', 'CS', 498, 'Theory II', 4, 11, 5, 8, 7, 3, 3, 0, 2, 0, 0, 0, 0, 1, 'Erickson, Jeff G'),
(2015, '2015-sp', 'CS', 498, 'Software Testing', 6, 4, 3, 3, 4, 5, 1, 0, 0, 0, 0, 0, 0, 0, 'Marinov, Darko'),
(2015, '2015-sp', 'CS', 498, 'Art and Science of Web Prog', 7, 18, 8, 18, 13, 6, 11, 2, 1, 0, 1, 0, 0, 1, 'Kumar, Ranjitha'),
(2015, '2015-sp', 'CS', 498, 'Virtual Reality', 11, 41, 28, 7, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 'Lavalle, Steven M'),
(2015, '2015-sp', 'CS', 512, 'Data Mining Principles', 10, 31, 19, 0, 3, 1, 0, 1, 0, 0, 0, 0, 0, 1, 'Han, Jiawei'),
(2015, '2015-sp', 'CS', 519, 'Scientific Visualization', 0, 15, 5, 3, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 'Shaffer, Eric G'),
(2015, '2015-sp', 'CS', 525, 'Advanced Distributed Systems', 3, 17, 40, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gupta, Indranil'),
(2015, '2015-sp', 'CS', 533, 'Parallel Computer Architecture', 4, 6, 1, 2, 6, 1, 0, 1, 0, 0, 0, 0, 0, 0, 'Torrellas, Josep'),
(2015, '2015-sp', 'CS', 555, 'Numerical Methods for PDEs', 0, 21, 3, 0, 1, 3, 0, 0, 0, 0, 0, 0, 1, 0, 'Olson, Luke'),
(2015, '2015-sp', 'CS', 598, 'Topic in Algorithms', 3, 8, 7, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blum, Avrim L'),
(2015, '2015-sp', 'CS', 598, 'Improving Your Research Skills', 9, 12, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sha, Lui R'),
(2015, '2015-su', 'CS', 101, 'Intro Computing: Engrg & Sci', 16, 18, 6, 6, 8, 6, 2, 2, 4, 6, 0, 2, 2, 0, 'Gambill, Thomas N'),
(2015, '2015-su', 'CS', 101, 'Intro Computing: Engrg & Sci', 8, 2, 10, 10, 0, 0, 2, 0, 0, 4, 4, 0, 0, 0, 'Gambill, Thomas N'),
(2015, '2015-su', 'CS', 225, 'Data Structures', 8, 48, 22, 32, 40, 14, 14, 16, 8, 6, 8, 2, 16, 8, 'Geigle, Chase A'),
(2015, '2015-su', 'CS', 233, 'Computer Architecture', 6, 10, 6, 14, 14, 8, 0, 4, 2, 0, 0, 2, 0, 6, 'Meenai, Shoaib A'),
(2015, '2015-su', 'CS', 421, 'Progrmg Languages & Compilers', 4, 12, 4, 4, 2, 0, 2, 0, 0, 0, 0, 0, 2, 0, 'Kalyanaraman, Kaushi'),
(2015, '2015-su', 'CS', 421, 'Progrmg Languages & Compilers', 2, 18, 6, 2, 4, 0, 2, 2, 4, 0, 0, 0, 2, 2, 'Gunter, Elsa'),
(2015, '2015-su', 'CS', 528, 'Obj-Oriented Progrmg & Design', 2, 26, 0, 2, 10, 2, 0, 2, 2, 0, 0, 0, 0, 0, 'Zilles, Craig');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AnalyzedFrom`
--
ALTER TABLE `AnalyzedFrom`
  ADD PRIMARY KEY (`Courses`);

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`Code`,`Professor`);

--
-- Indexes for table `DetailedCourse`
--
ALTER TABLE `DetailedCourse`
  ADD PRIMARY KEY (`Code`,`Professor`);

--
-- Indexes for table `HasTaken`
--
ALTER TABLE `HasTaken`
  ADD PRIMARY KEY (`Email`,`Code`);

--
-- Indexes for table `Hastaken`
--
ALTER TABLE `Hastaken`
  ADD PRIMARY KEY (`Email`,`Code`);

--
-- Indexes for table `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `Schedule`
--
ALTER TABLE `Schedule`
  ADD PRIMARY KEY (`Email`,`Courses`);

--
-- Indexes for table `Schedules`
--
ALTER TABLE `Schedules`
  ADD PRIMARY KEY (`Email`,`Semester`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`Email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
