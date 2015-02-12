-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2015 at 08:46 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `park_ranger`
--

-- --------------------------------------------------------

--
-- Table structure for table `ditanggapi`
--

CREATE TABLE IF NOT EXISTS `ditanggapi` (
  `id_laporan` int(11) NOT NULL,
  `id_tanggapan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `jumlah_report` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE IF NOT EXISTS `pengaduan` (
`id_laporan` int(11) NOT NULL,
  `rank_vote` int(11) DEFAULT NULL,
  `waktu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT NULL,
  `file_foto` varchar(50) DEFAULT NULL,
  `id_taman` int(11) NOT NULL,
  `ditangani_by` int(11) NOT NULL,
  `pelapor` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `jenis_laporan` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id_laporan`, `rank_vote`, `waktu`, `status`, `file_foto`, `id_taman`, `ditangani_by`, `pelapor`, `keterangan`, `jenis_laporan`) VALUES
(1, NULL, '2015-02-12 04:08:30', NULL, '', 1, 2, 1, '', 'Kerusakan'),
(2, NULL, '2015-02-12 09:03:33', NULL, '10455499_10203091808194003_1289517217_n.jpg', 2, 2, 1, 'Ada banyak preman di taman jomblo, mohon ditindak lanjuti', 'Ketertiban');

-- --------------------------------------------------------

--
-- Table structure for table `pihak_berwenang`
--

CREATE TABLE IF NOT EXISTS `pihak_berwenang` (
  `kategori` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pihak_berwenang`
--

INSERT INTO `pihak_berwenang` (`kategori`, `id_user`) VALUES
('Satpol PP', 2);

-- --------------------------------------------------------

--
-- Table structure for table `taman`
--

CREATE TABLE IF NOT EXISTS `taman` (
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
`id_taman` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `taman`
--

INSERT INTO `taman` (`nama`, `alamat`, `id_taman`) VALUES
('Taman Lansia', 'Jalan Cisangkuy', 1),
('Taman Jomblo', 'Jalan Pasupati', 2),
('Taman Musik Centrum', 'Jalan Belitung', 3),
('Taman Fotografi', ' Jl. Taman Cempaka (Jl. RE Martadinata (Riau))', 4),
('Taman Pustaka Bunga', 'Jalan Cilaki', 5),
('Taman Film', 'Jalan Layang Pasupati', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE IF NOT EXISTS `tanggapan` (
`id_tanggapan` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `id_penanggap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
`id_user` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `picture` varchar(50) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`nama`, `email`, `username`, `password`, `id_user`, `role`, `picture`) VALUES
('Riky Taniman', 'rikytaniman@gmail,co', 'riky1234', 'asdf', 1, 1, NULL),
('Nanda prasetyo', 'nanda123@gmail.com', 'nanda12', 'qwerty', 2, 2, NULL),
('Diah Fauziah', 'diahfauziah09@gmail.com', 'diahfauziah09', 'asdf1234', 3, 3, NULL),
('Edmund Ophie', 'edmund@gmail.com', 'edmund', 'tyuio', 4, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vote_laporan`
--

CREATE TABLE IF NOT EXISTS `vote_laporan` (
  `id_laporan` int(11) NOT NULL,
  `vote_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ditanggapi`
--
ALTER TABLE `ditanggapi`
 ADD KEY `id_tanggapan` (`id_tanggapan`), ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
 ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
 ADD PRIMARY KEY (`id_laporan`), ADD KEY `id_taman` (`id_taman`), ADD KEY `ditangani_by` (`ditangani_by`), ADD KEY `pelapor` (`pelapor`);

--
-- Indexes for table `pihak_berwenang`
--
ALTER TABLE `pihak_berwenang`
 ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `taman`
--
ALTER TABLE `taman`
 ADD PRIMARY KEY (`id_taman`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
 ADD PRIMARY KEY (`id_tanggapan`), ADD KEY `id_penanggap` (`id_penanggap`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `vote_laporan`
--
ALTER TABLE `vote_laporan`
 ADD PRIMARY KEY (`vote_by`), ADD KEY `id_laporan` (`id_laporan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `taman`
--
ALTER TABLE `taman`
MODIFY `id_taman` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ditanggapi`
--
ALTER TABLE `ditanggapi`
ADD CONSTRAINT `ditanggapi_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `pengaduan` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ditanggapi_ibfk_2` FOREIGN KEY (`id_tanggapan`) REFERENCES `tanggapan` (`id_tanggapan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengaduan`
--
ALTER TABLE `pengaduan`
ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`id_taman`) REFERENCES `taman` (`id_taman`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `pengaduan_ibfk_2` FOREIGN KEY (`ditangani_by`) REFERENCES `pihak_berwenang` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pihak_berwenang`
--
ALTER TABLE `pihak_berwenang`
ADD CONSTRAINT `pihak_berwenang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tanggapan`
--
ALTER TABLE `tanggapan`
ADD CONSTRAINT `tanggapan_ibfk_1` FOREIGN KEY (`id_penanggap`) REFERENCES `pihak_berwenang` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vote_laporan`
--
ALTER TABLE `vote_laporan`
ADD CONSTRAINT `vote_laporan_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `pengaduan` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `vote_laporan_ibfk_2` FOREIGN KEY (`vote_by`) REFERENCES `member` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
