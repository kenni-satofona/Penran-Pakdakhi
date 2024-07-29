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
SET NAMES utf8mb4;

--
-- Database: `penran_dakhi`
--
CREATE DATABASE IF NOT EXISTS `penran_dakhi`;
USE `penran_dakhi`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemasukkan`
--

INSERT INTO `pemasukkan` (`id`, `tanggal`, `keterangan`, `sumber`, `jumlah`, `username`) VALUES
(7, '2019-04-23', 'Temen bayar hutang', 'Piutang', '200.000', 'ideal'),
(8, '2019-04-23', 'Jual nasi goreng', 'Laba penjualan', '250.000', 'ideal'),
(16, '2019-03-28', 'Tarik tunai', 'ATM', '350.000', 'ideal'),
(21, '2019-04-24', 'Tarik tunai', 'ATM', '50.000', 'ideal'),
(23, '2019-04-24', 'Jual baso tikus', 'Laba penjualan', '150.000', 'ideal'),
(24, '2019-04-23', 'Keyboard mekanik', 'Laba penjualan', '250.000', 'ideal'),
(25, '2019-03-27', 'Tarik tunai', 'ATM', '250.000', 'ideal'),
(26, '2019-04-24', 'Tarik tunai', 'ATM', '50.000', 'ideal'),
(27, '2019-03-28', 'Jual baso tikus', 'Laba penjualan', '250.000', 'ideal'),
(31, '2019-04-24', 'Tarik tunai ', 'ATM', '200.000', 'ideal');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id`, `tanggal`, `keterangan`, `keperluan`, `jumlah`, `username`) VALUES
(3, '2019-04-23', 'Nasi goreng', 'Makan dan Minum', '15.000', 'ideal'),
(4, '2019-04-23', 'Nasi goreng katsu', 'Makan dan Minum', '15.000', 'ideal'),
(5, '2019-04-23', 'Hisana', 'Makan dan Minum', '14.000', 'ideal'),
(7, '2019-04-24', 'Bensin', 'Kendaraan', '10.000', 'ideal'),
(8, '2019-04-24', 'cutter dan gunting', 'Keperluan pribadi', '24.000', 'ideal'),
(9, '2019-04-24', 'Bensin', 'Kendaraan', '15.000', 'ideal'),
(10, '2019-03-28', 'Ayam geprek', 'Makan dan Minum', '15.000', 'ideal'),
(11, '2019-03-28', 'DAP Panitia onion', 'Organisasi', '150.000', 'ideal'),
(12, '2019-03-28', 'Nasi goreng', 'Makan dan Minum', '16.000', 'ideal'),
(13, '2019-04-24', 'Ayam bakar', 'Makan dan Minum', '16.000', 'ideal');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rekening_keluar`
--

INSERT INTO `rekening_keluar` (`id`, `kode`, `jumlah`, `aksi`, `tanggal`, `username`) VALUES
(1, 'TRF0001', '150.000', 'keluar', '2019-03-22', 'ideal'),
(2, 'TRF0002', '50.000', 'keluar', '2019-03-22', 'ideal'),
(3, 'TRF0003', '250.000', 'keluar', '2019-03-27', 'ideal'),
(4, 'TRF0004', '50.000', 'keluar', '2019-03-28', 'ideal'),
(5, 'TRF0005', '200.000', 'keluar', '2019-04-01', 'ideal'),
(13, 'TRF0006', '200.000', 'keluar', '2019-04-24', 'ideal'),
(14, 'TRF0007', '200.000', 'keluar', '2019-04-24', 'ideal');

--
-- Triggers `rekening_keluar`
--
DELIMITER $$
CREATE TRIGGER `tg_kodekeluar` BEFORE INSERT ON `rekening_keluar` FOR EACH ROW BEGIN
DECLARE s VARCHAR(8);
DECLARE i INTEGER;

SET i = (SELECT SUBSTRING(kode,4,4) + 1 FROM rekening_keluar ORDER BY kode DESC LIMIT 1);
SET s = (SELECT CONCAT('TRF',LPAD(i,4,'0')));
SET NEW.kode = s;

END$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
          `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `level` enum('admin','user') NOT NULL DEFAULT 'user',
  `status` enum('Aktif','Non-Aktif') NOT NULL DEFAULT 'Aktif',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `email`, `nama_lengkap`, `level`, `status`) VALUES
('admin', 'admin', 'admin@gmail.com', 'Administrator', 'admin', 'Aktif'),
('ideal', 'ideal', 'ideal@gmail.com', 'Ideal Man', 'user', 'Aktif');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
