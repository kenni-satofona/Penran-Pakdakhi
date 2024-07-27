-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2019 at 09:41 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penran-dakhi`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `kode_automatis` (`kode` INT) RETURNS CHAR(7) CHARSET latin1 BEGIN
DECLARE kodebaru CHAR(7);
DECLARE urut INT;
 
SET urut = IF(kode IS NULL, 1, kode + 1);
SET kodebaru = CONCAT("TRX", LPAD(urut, 4, 0));
 
RETURN kodebaru;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `kode_automatis2` (`kode` INT) RETURNS CHAR(7) CHARSET latin1 BEGIN
DECLARE kodebaru CHAR(7);
DECLARE urut INT;
 
SET urut = IF(kode IS NULL, 1, kode + 1);
SET kodebaru = CONCAT("TRF", LPAD(urut, 4, 0));
 
RETURN kodebaru;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pemasukkan`
--

CREATE TABLE `pemasukkan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  `sumber` varchar(30) NOT NULL,
  `jumlah` varchar(250) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_username_masuk` (`username`),
  CONSTRAINT `fk_username_masuk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemasukkan`
--

INSERT INTO `pemasukkan` (`id`, `tanggal`, `keterangan`, `sumber`, `jumlah`, `username`) VALUES
(7, '2019-04-23', 'Temen bayar hutang', 'Piutang', '200.000', 'azmirf'),
(8, '2019-04-23', 'Jual nasi goreng', 'Laba penjualan', '250.000', 'azmirf'),
(16, '2019-03-28', 'Tarik tunai', 'ATM', '350.000', 'alfath'),
(21, '2019-04-24', 'Tarik tunai', 'ATM', '50.000', 'azmirf'),
(23, '2019-04-24', 'Jual baso tikus', 'Laba penjualan', '150.000', 'azmirf'),
(24, '2019-04-23', 'Keyboard mekanik', 'Laba penjualan', '250.000', 'azmirf'),
(25, '2019-03-27', 'Tarik tunai', 'ATM', '250.000', 'dira'),
(26, '2019-04-24', 'Tarik tunai', 'ATM', '50.000', 'azmirf'),
(27, '2019-03-28', 'Jual baso tikus', 'Laba penjualan', '250.000', 'alfath'),
(31, '2019-04-24', 'Tarik tunai ', 'ATM', '200.000', 'azmirf');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `keperluan` varchar(30) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_username_keluar` (`username`),
  CONSTRAINT `fk_username_keluar` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id`, `tanggal`, `keterangan`, `keperluan`, `jumlah`, `username`) VALUES
(3, '2019-04-23', 'Nasi goreng', 'Makan dan Minum', '15.000', 'azmirf'),
(4, '2019-04-23', 'Nasi goreng katsu', 'Makan dan Minum', '15.000', 'azmirf'),
(5, '2019-04-23', 'Hisana', 'Makan dan Minum', '14.000', 'azmirf'),
(7, '2019-04-24', 'Bensin', 'Kendaraan', '10.000', 'azmirf'),
(8, '2019-04-24', 'cutter dan gunting', 'Keperluan pribadi', '24.000', 'azmirf'),
(9, '2019-04-24', 'Bensin', 'Kendaraan', '15.000', 'azmirf'),
(10, '2019-03-28', 'Ayam geprek', 'Makan dan Minum', '15.000', 'alfath'),
(11, '2019-03-28', 'DAP Panitia onion', 'Organisasi', '150.000', 'alfath'),
(12, '2019-03-28', 'Nasi goreng', 'Makan dan Minum', '16.000', 'alfath'),
(13, '2019-04-24', 'Ayam bakar', 'Makan dan Minum', '16.000', 'azmirf');

-- --------------------------------------------------------

--
-- Table structure for table `rekening_keluar`
--

CREATE TABLE `rekening_keluar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `aksi` varchar(10) NOT NULL DEFAULT 'keluar',
  `tanggal` date NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_username_rekening_keluar` (`username`),
  CONSTRAINT `fk_username_rekening_keluar` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekening_keluar`
--

INSERT INTO `rekening_keluar` (`id`, `kode`, `jumlah`, `aksi`, `tanggal`, `username`) VALUES
(1, 'TRF0001', '150.000', 'keluar', '2019-03-22', 'azmirf'),
(2, 'TRF0002', '50.000', 'keluar', '2019-03-22', 'azmirf'),
(3, 'TRF0003', '250.000', 'keluar', '2019-03-27', 'dira'),
(4, 'TRF0004', '50.000', 'keluar', '2019-03-28', 'azmirf'),
(5, 'TRF0005', '200.000', 'keluar', '2019-04-01', 'azmirf'),
(13, 'TRF0006', '200.000', 'keluar', '2019-04-24', 'azmirf'),
(14, 'TRF0007', '200.000', 'keluar', '2019-04-24', 'azmirf');

--
-- Triggers `rekening_keluar`
--
DELIMITER $$
CREATE TRIGGER `tg_kodekeluar` BEFORE INSERT ON `rekening_keluar` FOR EACH ROW BEGIN
DECLARE s VARCHAR(8);
DECLARE i INTEGER;
 
SET i = (SELECT SUBSTRING(kode,4,4) AS Nomer
FROM rekening_keluar ORDER BY Nomer DESC LIMIT 1);
 
SET s = (SELECT kode_automatis2(i));
 
IF(NEW.kode IS NULL OR NEW.kode = '')
 THEN SET NEW.kode =s;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `rekening_masuk`
--

CREATE TABLE `rekening_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `aksi` varchar(10) NOT NULL DEFAULT 'masuk',
  `tanggal` date NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_username_rekening_masuk` (`username`),
  CONSTRAINT `fk_username_rekening_masuk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekening_masuk`
--

INSERT INTO `rekening_masuk` (`id`, `kode`, `jumlah`, `aksi`, `tanggal`, `username`) VALUES
(1, 'TRX0001', '200.000', 'masuk', '2019-03-22', 'azmirf'),
(2, 'TRX0002', '50.000', 'masuk', '2019-03-22', 'azmirf'),
(3, 'TRX0003', '250.000', 'masuk', '2019-03-27', 'dira'),
(4, 'TRX0004', '150.000', 'masuk', '2019-03-28', 'azmirf'),
(5, 'TRX0005', '100.000', 'masuk', '2019-04-01', 'azmirf'),
(13, 'TRX0006', '200.000', 'masuk', '2019-04-24', 'azmirf');

--
-- Triggers `rekening_masuk`
--
DELIMITER $$
CREATE TRIGGER `tg_kodemasuk` BEFORE INSERT ON `rekening_masuk` FOR EACH ROW BEGIN
DECLARE s VARCHAR(8);
DECLARE i INTEGER;
 
SET i = (SELECT SUBSTRING(kode,4,4) AS Nomer
FROM rekening_masuk ORDER BY Nomer DESC LIMIT 1);
 
SET s = (SELECT kode_automatis(i));
 
IF(NEW.kode IS NULL OR NEW.kode = '')
 THEN SET NEW.kode =s;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `email`, `role`, `aktif`, `created_at`) VALUES
('azmirf', '$2y$10$jq1a1KD1jTkWSxgfHGwFrOgZpbge8pM/Y5LJdM1IM0/Zt3DaGA/.u', 'azmirf@gmail.com', 'admin', '1', '2019-03-22 13:43:03'),
('alfath', '$2y$10$FS3hdXZ8YrxtkpV85M04bOanFm.Xj7CmrdLpRcZ/01ME0r5Fj75M.', 'alfath@gmail.com', 'member', '1', '2019-03-22 13:43:03'),
('dira', '$2y$10$7GvOY0Z/JrFVE6i9s5PvP.5EOI8l3dQOtwFCy3HepkoxI9G7zvZoW', 'dira@gmail.com', 'member', '1', '2019-03-22 13:43:03');

-- --------------------------------------------------------

--
-- Tabel cabang_nias
--

CREATE TABLE `cabang_nias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `alamat` text,
  `telepon` varchar(20),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Finalize the transaction
--

COMMIT;
