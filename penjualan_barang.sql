-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2023 at 03:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `Kode_Brg` varchar(50) NOT NULL,
  `Nama_Brg` varchar(50) DEFAULT NULL,
  `Harga` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Id_Customer` varchar(50) NOT NULL,
  `Nama_Customer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `No_Jual` varchar(50) DEFAULT NULL,
  `Kode_Brg` varchar(50) DEFAULT NULL,
  `Qty_Jual` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_barang`
--

CREATE TABLE `penjualan_barang` (
  `No_Jual` varchar(50) NOT NULL,
  `Tgl_Jual` varchar(50) DEFAULT NULL,
  `Id_Customer` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Kode_Brg`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id_Customer`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD KEY `No_Jual` (`No_Jual`,`Kode_Brg`,`Qty_Jual`),
  ADD KEY `Kode_Brg` (`Kode_Brg`);

--
-- Indexes for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD PRIMARY KEY (`No_Jual`),
  ADD KEY `Id_Customer` (`Id_Customer`),
  ADD KEY `Id_Customer_2` (`Id_Customer`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`Kode_Brg`) REFERENCES `barang` (`Kode_Brg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan_barang`
--
ALTER TABLE `penjualan_barang`
  ADD CONSTRAINT `penjualan_barang_ibfk_1` FOREIGN KEY (`Id_Customer`) REFERENCES `customer` (`Id_Customer`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
