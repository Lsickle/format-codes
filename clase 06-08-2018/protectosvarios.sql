-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2018 at 04:17 AM
-- Server version: 5.7.20-log
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pruebas`
--

-- --------------------------------------------------------

--
-- Table structure for table `protectosvarios`
--

CREATE TABLE `protectosvarios` (
  `Proyecto` int(11) DEFAULT NULL,
  `Fase` varchar(16) DEFAULT NULL,
  `Actividad` varchar(16) DEFAULT NULL,
  `InicioP` datetime DEFAULT NULL,
  `InicioR` varchar(16) DEFAULT NULL,
  `TerminoP` datetime DEFAULT NULL,
  `TerminoR` varchar(16) DEFAULT NULL,
  `estado` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `protectosvarios`
--

INSERT INTO `protectosvarios` (`Proyecto`, `Fase`, `Actividad`, `InicioP`, `InicioR`, `TerminoP`, `TerminoR`, `estado`) VALUES
(44, 'A', 'analizar', '2018-08-17 00:00:00', '2018-08-30', '2018-08-22 00:00:00', '', 'p');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `protectosvarios`
--
ALTER TABLE `protectosvarios`
  ADD UNIQUE KEY `Proyecto` (`Proyecto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
