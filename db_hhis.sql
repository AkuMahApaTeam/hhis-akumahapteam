-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 30, 2017 at 12:27 PM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 5.6.30-1+deb.sury.org~xenial+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hhis`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ainun', 'j1ryLIbAB5wLGD3Jq9_v_CPZK_lgUl7H', '$2y$13$t8hwthbXMSR2C.rG.3nuWO7wkNuNiKazmDKBsZ.pxnf9C1Nsnhs6K', NULL, 'abdullah.ainun4@gmail.com', 10, 1490839988, 1490839988),
(2, 'admin', 'z3NdgTbcbrnFCWYrYJ0RFPBH_ty-9c_o', '$2y$13$V9wvXseut4d34T/.ROmj2uq5LPFTzVEX3vqBm1MAiXYVMsnqeI7o.', NULL, 'admin@gmail.com', 10, 1490840072, 1490840072);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `no_izin` varchar(25) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat_rumah` varchar(255) DEFAULT NULL,
  `alamat_praktik` varchar(255) DEFAULT NULL,
  `nama_dokter` varchar(255) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `no_izin`, `email`, `alamat_rumah`, `alamat_praktik`, `nama_dokter`, `no_telp`) VALUES
(1, 'D001', 'mifdholnafis@gmail.com', 'rt 12 r3 04 sekargadung dukun gresik', 'jalan raya deadles no 12 sidayu  gresik', 'Mifdlol Nafis Al Khafidz', '081217238486');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1490839829),
('m130524_201442_init', 1490839957);

-- --------------------------------------------------------

--
-- Table structure for table `no_izin_dokter`
--

CREATE TABLE `no_izin_dokter` (
  `no_izin` varchar(25) NOT NULL,
  `keahlian` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `no_izin_dokter`
--

INSERT INTO `no_izin_dokter` (`no_izin`, `keahlian`) VALUES
('D001', 'Sp.A - Spesialis Anak'),
('D002', 'Spesialis vagina');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telp_pasien` varchar(15) DEFAULT NULL,
  `gol_darah` varchar(2) DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat`
--

CREATE TABLE `riwayat` (
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `umur` int(11) DEFAULT NULL,
  `berat_badan` int(11) DEFAULT NULL,
  `tinggi_badan` int(11) DEFAULT NULL,
  `turunan_penyakit` text,
  `gejala` text,
  `diagnosa` text,
  `larangan` text,
  `note` text,
  `tgl_periksa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_dokter`
--

CREATE TABLE `user_dokter` (
  `id` int(10) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `username_dokter` varchar(255) DEFAULT NULL,
  `password_dokter` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `fk_relasi_dokter` (`no_izin`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `no_izin_dokter`
--
ALTER TABLE `no_izin_dokter`
  ADD PRIMARY KEY (`no_izin`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD KEY `fk_dokter_riwayat` (`id_dokter`),
  ADD KEY `fk_pasien_riwayat` (`id_pasien`);

--
-- Indexes for table `user_dokter`
--
ALTER TABLE `user_dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_dokter` (`id_dokter`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_dokter`
--
ALTER TABLE `user_dokter`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_relasi_dokter` FOREIGN KEY (`no_izin`) REFERENCES `no_izin_dokter` (`no_izin`);

--
-- Constraints for table `riwayat`
--
ALTER TABLE `riwayat`
  ADD CONSTRAINT `fk_dokter_riwayat` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `fk_pasien_riwayat` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);

--
-- Constraints for table `user_dokter`
--
ALTER TABLE `user_dokter`
  ADD CONSTRAINT `fk_user_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
