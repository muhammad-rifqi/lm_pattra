-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2025 at 04:01 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_patra`
--

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `masuk` time DEFAULT NULL,
  `keluar` time DEFAULT NULL,
  `status` enum('hadir','tidak_hadir') NOT NULL DEFAULT 'hadir',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id`, `karyawan_id`, `tanggal_masuk`, `masuk`, `keluar`, `status`, `notes`) VALUES
(1, 1, '2025-05-12', '14:12:19', '20:04:19', 'hadir', 'masuk'),
(2, 2, '2025-05-12', '11:06:12', '07:06:12', 'tidak_hadir', 'tidak masuk');

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `id_departemen` int(11) NOT NULL,
  `nama_departemen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`id_departemen`, `nama_departemen`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E'),
(6, 'F');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `no` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `jk` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `divisi` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `gaji` int(11) NOT NULL,
  `tanggal_input` date NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `id_departemen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `no`, `nama`, `nik`, `jk`, `alamat`, `divisi`, `level`, `jabatan`, `gaji`, `tanggal_input`, `tanggal_lahir`, `tanggal_masuk`, `id_departemen`) VALUES
(1, 'A-001', 'RIFKY', 'MS-001', 'pria', 'Alamat: 2, Jl. RS. Fatmawati Raya No.64, RT.2/RW.5, Cilandak Bar., Kec. Cilandak, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12430', 'Big Data', 'senior', 'Manager', 10000000, '2025-05-28', '1988-12-27', '2021-05-28', 1),
(2, 'A-002', 'HANAFI', 'MS-002', 'pria', 'Alamat: 2, Jl. RS. Fatmawati Raya No.64, RT.2/RW.5, Cilandak Bar., Kec. Cilandak, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12430', 'Backend Dev', 'middle', 'Staff', 1000000, '2025-05-27', '1988-05-01', '2022-05-28', 1),
(3, 'A-003', 'PEPPY', 'MS-003', 'pria', 'Alamat: 2, Jl. RS. Fatmawati Raya No.64, RT.2/RW.5, Cilandak Bar., Kec. Cilandak, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12430', 'Backend Dev', 'basic', 'Staff', 1000000, '2025-05-29', '1969-03-12', '2023-05-28', 2),
(4, 'A-004', 'Penny', 'MS-004', 'wanita', 'Alamat: 2, Jl. RS. Fatmawati Raya No.64, RT.2/RW.5, Cilandak Bar., Kec. Cilandak, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12430', 'Frontend Dev', 'basic', 'Staff', 1000000, '2025-05-25', '1990-03-12', '2024-05-28', 2),
(5, 'A-005', 'BOY', 'MS-005', 'pria', 'Alamat: 2, Jl. RS. Fatmawati Raya No.64, RT.2/RW.5, Cilandak Bar., Kec. Cilandak, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12430', 'Frontend Dev', 'middle', 'Staff', 1000000, '2025-05-30', '2000-03-12', '2019-05-28', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id_departemen`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id_departemen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
