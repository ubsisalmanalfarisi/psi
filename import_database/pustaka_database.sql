-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2023 at 04:22 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pustaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` varchar(12) NOT NULL,
  `tgl_booking` date NOT NULL,
  `batas_ambil` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking_detail`
--

CREATE TABLE `booking_detail` (
  `id` int(11) NOT NULL,
  `id_booking` varchar(12) NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul_buku` varchar(128) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `pengarang` varchar(64) NOT NULL,
  `penerbit` varchar(64) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `isbn` varchar(64) NOT NULL,
  `stok` int(11) NOT NULL,
  `dipinjam` int(11) NOT NULL,
  `dibooking` int(11) NOT NULL,
  `image` varchar(256) DEFAULT 'book-default-cover.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul_buku`, `id_kategori`, `pengarang`, `penerbit`, `tahun_terbit`, `isbn`, `stok`, `dipinjam`, `dibooking`, `image`) VALUES
(1, 'Statistika dengan Program Komputer', 1, 'Ahmad Kholiqul Amin', 'Deep Publish', 2014, '9786022809432', 12, 1, -1, 'pro1638549977.jpg'),
(2, 'Mudah Belajar Komputer untuk Anak', 1, 'Bambang Agus Setiawan', 'Huta Media', 2014, '9786025118500', 6, 1, 1, 'img1557402397.jpg'),
(3, 'PHP Komplet', 1, 'Jubilee', 'Elex Media Komputindo', 2017, '8346753547', 3, 1, 3, 'img1555522493.jpg'),
(4, 'Detektif Conan Ep 200', 9, 'Okigawa sasuke Minori', 'Cultura', 2016, '874387583987', 4, 1, 2, 'img1557401465.jpg'),
(5, 'Bahasa Indonesia', 2, 'Umri Nur\'aini dan Indriyani', 'Pusat Perbukuan', 2015, '757254724884', 4, 0, 2, 'img1557402703.jpg'),
(6, 'Komunikasi Lintas Budaya', 5, 'Dr. Dedy Kurnia', 'Published', 2015, '878674646488', 1, 0, 0, 'img1557403156.jpg'),
(7, 'Kolaborasi Codeigniter dan Ajax dalam Perancangan CMS', 1, 'Anton Subagia', 'Elex Media komputindo', 2017, '43345356577', 3, 0, 0, 'img1557403502.jpg'),
(8, 'From Hobby to Money', 4, 'Deasylawati', 'Elex Media Komputindo', 2015, '87968686787879', 7, 0, 1, 'img1557403658.jpg'),
(9, 'Buku Saku Pramuka', 8, 'Rudi Himawan', 'Pusat Perbukuan', 2016, '97868687978796', 3, 0, 0, 'img1557404613.jpg'),
(10, 'Rahasia Keajaiban Bumi', 3, 'Nurul Ihsan', 'Luxima', 2014, '565756565768868', 1, 0, 0, 'img1557404689.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `no_pinjam` varchar(12) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_pinjam`
--

INSERT INTO `detail_pinjam` (`no_pinjam`, `id_buku`, `denda`) VALUES
('17032023001', 6, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'Komputer'),
(2, 'Bahasa'),
(3, 'Sains'),
(4, 'Hobby'),
(5, 'Komunikasi'),
(6, 'Hukum'),
(7, 'Agama'),
(8, 'Populer'),
(9, 'Komik');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `no_pinjam` varchar(12) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `id_booking` varchar(12) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `status` enum('Pinjam','Kembali','','') NOT NULL DEFAULT 'Pinjam',
  `total_denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`no_pinjam`, `tgl_pinjam`, `id_booking`, `id_user`, `tgl_kembali`, `tgl_pengembalian`, `status`, `total_denda`) VALUES
('17032023001', '2023-03-17', '16032023001', 9, '2023-03-20', '2023-03-17', 'Kembali', 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'Guru');

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `tgl_booking` datetime DEFAULT NULL,
  `id_user` varchar(12) NOT NULL,
  `nomor_unik` varchar(255) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `penulis` varchar(128) NOT NULL,
  `penerbit` varchar(128) NOT NULL,
  `tahun_terbit` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `nomor_unik` varchar(255) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `nomor_unik`, `image`, `password`, `jk`, `tgl_lahir`, `alamat`, `no_hp`, `kelas`, `jabatan`, `role_id`, `is_active`) VALUES
(1, 'Admin Pustaka Booking', '083843794419', 'pro1679444566.jpg', '$2y$10$zP2PxKgiaOXIIanZYHkKw.e49gm.38wEpg2oLAigY0tmQj/IzDvda', 'L', '1999-03-07', 'Kost Grey House', '083843794419', '12.6B.2A', 'Adminstrator Perpustakaan', 1, 1),
(2, 'Abib Mauladi', '0083443476', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-03-16', 'PURWANEGARA,RT 2,RW 5,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '088289153925', 'Kelas IXA', '', 4, 1),
(3, 'Abimanyu Azhar', '0103044672', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-02-15', 'JL. JAMBU GANG TOMAT KEDUNGWULUH,RT 5,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,', '089670424367', 'Kelas VIIB', '', 4, 1),
(4, 'Adeline Airine Agustine', '0096657027', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-08-01', 'Jl. Ketayasa,RT 2,RW 4,Desa/Kel.Kedungwringin,Kec.Kedungwringin,53171', '085803730948', 'Kelas VIIIA', '', 4, 1),
(5, 'Adif Febrie Kusnanto', '0086684717', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-02-06', 'Jalan Gerilya II,RT 5,RW 1,Tanjung,Kec.Kec.Purwokerto Selatan,53143', '089685489624', 'Kelas IXA', '', 4, 1),
(6, 'Adinda Elsani Putri', '0096882832', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-07-11', 'VETERAN,RT 4,RW 8,Desa/Kel.Rejasari,Kec.Rejasari,53134', '081548545768', 'Kelas VIIA', '', 4, 1),
(7, 'Adisty Nurfaizah Apriliana', '3089329722', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-04-08', 'Jl. Kober Gg. Duku,RT 5,RW 4,Desa/Kel.Kober,Kec.Kober,53132', '081215129050', 'Kelas IXA', '', 4, 1),
(8, 'Aditya Purnomo', '0074645510', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-06-11', 'JL. BALAIKAMBANG,RT 2,RW 7,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '083863826842', 'Kelas IXC', '', 4, 1),
(9, 'Aditya Zallfa', '0085300573', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-01-03', 'Jl. Murbai, Rejasari,RT 2,RW 9,Desa/Kel.Rejasari,Kec.Rejasari,53134', '083866409052', 'Kelas IXC', '', 4, 1),
(10, 'Adrian Maulana Yusuf', '0092509451', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-09-30', 'NGASINAN,RT 1,RW 11,KARANGBANGUN,Kec.Kec.Matesih,57781', '085640906115', 'Kelas VIIA', '', 4, 1),
(11, 'Agesta Saputra', '0096411469', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-08-07', 'Jl. Kober Gg. Manggis,RT 1,RW 4,Desa/Kel.Kober,Kec.Kober,53132', '085329912841', 'Kelas VIIIA', '', 4, 1),
(12, 'Aghny Laras Imanda', '0092530064', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-01-07', 'KEDUNGWULUH,RT 0,RW 0,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,', '0895384068871', 'Kelas VIIIC', '', 4, 1),
(13, 'Agustav Ardiansyah', '0089725355', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-08-28', 'Pasirmuncang,RT 1,RW 3,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '08816507686', 'Kelas IXC', '', 4, 1),
(14, 'Agustina Mulyawati', '0078064037', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-08-22', 'GUNUNG KERINCI,RT 6,RW 4,Desa/Kel.Bobosan,Kec.Bobosan,53127', '088232301836', 'Kelas IXB', '', 4, 1),
(15, 'Ahmad Fauzi', '0055379123', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2005-02-22', 'Jl. Kober,RT 4,RW 1,Desa/Kel.Kober,Kec.Kober,53133', '085871034458', 'Kelas VIIIC', '', 4, 1),
(16, 'Ahmad Zidan Nur Ramdani', '0092542155', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-10-15', 'JL. PASAR MANIS,RT 3,RW 6,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '083862706524', 'Kelas VIIC', '', 4, 1),
(17, 'Ainun Asih Kusworo', '0096393272', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-11-14', 'Jl. Stasiun Raya,RT 6,RW 1,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '085877113937', 'Kelas VIIC', '', 4, 1),
(18, 'Aldi Primadani', '0072589537', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-06-09', 'Jl. Sokajati,RT 3,RW 3,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '087883368084', 'Kelas IXD', '', 4, 1),
(19, 'Alena Adelina Putri Arziki', '0096189828', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-11-19', 'JL. PAHLAWAN 69,RT 2,RW 2,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '085742052445', 'Kelas VIIA', '', 4, 1),
(20, 'Alfika Citra Pertiwi', '0088435239', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-03-24', 'Jalan Letjend Pol Soemarto,RT 7,RW 3,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '089504030519', 'Kelas IXC', '', 4, 1),
(21, 'Alfin Rizki Santosa', '0084033599', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-04-11', 'Jln. Veteran Gg. Bajing,RT 5,RW 4,Desa/Kel.Rejasari,Kec.Rejasari,53134', '083824218029', 'Kelas IXE', '', 4, 1),
(22, 'Alfizah Zainita', '0104472067', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-07-01', 'Jl. Pasar Pon Utara No. 10,RT 5,RW 2,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '082299435760', 'Kelas VIIB', '', 4, 1),
(23, 'Alif Barkah Pratama', '0086957412', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-05-08', 'Jalan Gerilya Gang II,RT 3,RW 3,Tanjung,Kec.Kec.Purwokerto Selatan,53143', '085326979951', 'Kelas IXD', '', 4, 1),
(24, 'Alif Nur Hida', '0089166987', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-03-14', 'JALAN KAMPUNG BARU,RT 5,RW 5,Desa/Kel.Bantarsoka,Kec.Bantarsoka,', '087829881230', 'Kelas IXD', '', 4, 1),
(25, 'Alif Saputra', '0081883592', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-04-12', 'JL. H. MASHURI,RT 4,RW 8,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53134', '083816099760', 'Kelas IXB', '', 4, 1),
(26, 'Alifa Ramadhani', '0082749793', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-09-09', 'PURWOSARI,RT 1,RW 3,Desa/Kel.Purwosari,Kec.Purwosari,', '08157925018', 'Kelas VIIIC', '', 4, 1),
(27, 'Alina Kartika Dewi', '0093996873', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-03-16', 'Stasiun Gg. 2,RT 6,RW 1,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '088225474579', 'Kelas VIIIA', '', 4, 1),
(28, 'Allendea Devi Pramana', '0099105662', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-07-17', 'Jalan Raya Beji,RT 2,RW 3,Desa/Kel.Kutasari,Kec.Kutasari,53151', '088228732422', 'Kelas VIIIA', '', 4, 1),
(29, 'Alvatah Dwi Antony', '0083834615', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-08-31', 'Jl. Jend. Sutoyo Gg VI,RT 8,RW 1,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '085727553933', 'Kelas IXB', '', 4, 1),
(30, 'Alviersya Cessa Irawan', '0099942670', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-09-28', 'REJASARI,RT 1,RW 4,Desa/Kel.Rejasari,Kec.Rejasari,', '085713663313', 'Kelas VIIIB', '', 4, 1),
(31, 'Alvin Afrilian Tryanto', '0094781707', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-04-25', 'Jln. Kober,RT 4,RW 1,Desa/Kel.Kober,Kec.Kober,53132', '0895612459264', 'Kelas VIIIC', '', 4, 1),
(32, 'Alvino Mahardika Chaesar\'Alam', '0092380590', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2040-12-06', 'Jalan Kober,RT 1,RW 1,Desa/Kel.Kober,Kec.Kober,', '', 'Kelas VIIB', '', 4, 1),
(33, 'Alyssa Rizqi Ramadhani', '0081957182', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-09-25', 'Bantarsoka,RT 3,RW 3,Bantarsoka,Kec.Kec.Purwokerto Barat,53147', '085742704268', 'Kelas IXA', '', 4, 1),
(34, 'Amar Wisnu Fadillah', '0082957444', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-07-04', 'Jl. Sidodadi, Kedungwringin,RT 6,RW 5,Desa/Kel.Kedungwringin,Kec.Kedungwringin,53171', '0895703036678', 'Kelas IXE', '', 4, 1),
(35, 'Ananda Yesan Desni Kolas', '0045023387', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2004-12-28', 'Jl. Jend. Sutoyo Gg I,RT 5,RW 1,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '087717602714', 'Kelas IXB', '', 4, 1),
(36, 'Andhika Nizam Azlani', '0079527146', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-12-16', 'Jl. Pahlawan Gg. 7 ,RT 3,RW 5,Desa/Kel.Tanjung,Kec.Tanjung,', '085713664178', 'Kelas IXE', '', 4, 1),
(37, 'Andika Apri Finansyah', '0078016855', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-04-22', 'PASIRMUNCANG,RT 3,RW 4,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '088227237143', 'Kelas IXB', '', 4, 1),
(38, 'Andika Tri Saputra', '0073659112', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-12-16', 'Jl R.A Wiriaatmaja,RT 7,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '089691994986', 'Kelas VIIB', '', 4, 1),
(39, 'Andrian Eko Hernanta', '0099508399', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-04-09', 'JL. PAHLAWAN Gg MARGABAKTI,RT 2,RW 2,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '088220028022', 'Kelas VIIIA', '', 4, 1),
(40, 'Anggi Prasetyo', '0091141689', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-02-24', 'Jl.Gunung Cermai Gg.Gunung Agung,RT 9,RW 3,Desa/Kel.Bobosan,Kec.Bobosan,53127', '085876007656', 'Kelas VIIIB', '', 4, 1),
(41, 'Anindya Apriliana Putri Pradani', '0081732414', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-04-26', 'KS TUBUN GG ANGGUR,RT 7,RW 7,Desa/Kel.Rejasari,Kec.Rejasari,53134', '085801345462', 'Kelas IXB', '', 4, 1),
(42, 'Anisa Cahaya Putri', '3085745313', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-01-09', 'Jl Sidodadi Kedungwringin,RT 3,RW 5,Desa/Kel.Kedungwringin,Kec.Kedungwringin,53173', '', 'Kelas IXC', '', 4, 1),
(43, 'Anisa Eka Nuraini', '0095262728', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-09-10', 'JIPANG,RT 3,RW 4,Desa/Kel.Jipang,Kec.Jipang,53161', '082134128617', 'Kelas VIIIA', '', 4, 1),
(44, 'Anisyah Wulan Sari', '0073625580', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-10-26', 'Jl. Pahlawan Gg. IX ,RT 6,RW 5,Desa/Kel.Tanjung,Kec.Tanjung,', '082227068270', 'Kelas IXC', '', 4, 1),
(45, 'Annisa Dwi Sholeha', '0097282696', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-10-06', 'JENDERAL SUTOYO,RT 5,RW 1,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '083824691858', 'Kelas VIIB', '', 4, 1),
(46, 'Annisa Nur Ramadani', '0089940630', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-09-02', 'Jalan suparto no.24,RT 1,RW 2,Purwosari,Kec.Kec.Baturaden,53151', '088232052314', 'Kelas IXD', '', 4, 1),
(47, 'Anugerahdwi Saputra', '0098364892', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-06-26', 'JALAN SURAMENGGALA,RT 3,RW 6,REJASARI,Kec.Kec.Purwokerto Barat,53134', '085310700319', 'Kelas VIIA', '', 4, 1),
(48, 'Ardan Azhari', '0084805074', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-07-12', 'JENDRAL SOEDIRMAN BARAT GG KOPRAL PARTODO,RT 5,RW 4,Desa/Kel.Rejasari,Kec.Rejasari,53134', '083148675609', 'Kelas IXA', '', 4, 1),
(49, 'Ardha Ilyas Nuryahya', '0093501226', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-08-09', 'BANTARSOKA,RT 1,RW 4,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '085755657772', 'Kelas VIIIA', '', 4, 1),
(50, 'Ardi Firmansah', '0052361778', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2005-09-29', 'Jl.Kober Gg Sukun,RT 6,RW 3,Desa/Kel.Kober,Kec.Kober,53132', '081325635966', 'Kelas VIIIB', '', 4, 1),
(51, 'Ardian Pramuditya', '0081314004', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-08-09', 'Karangjambu-Purwanegara,RT 1,RW 2,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '0895357946447', 'Kelas IXE', '', 4, 1),
(52, 'Areta Putri Agustina', '0102961206', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-08-09', 'JL. JAMBU GANG GOWOK,RT 4,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,', '083861210881', 'Kelas VIIB', '', 4, 1),
(53, 'Argilian Tri Ibnu Gani', '0084492477', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-11-29', 'Karangblimbing,RT 1,RW 1,Desa/Kel.Pabuaran,Kec.Pabuaran,53124', '085866003583', 'Kelas IXC', '', 4, 1),
(54, 'Argyan Cahyo Saputra', '0086785332', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-02-17', 'Jl. Tanjlig,RT 6,RW 7,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '0895384088870', 'Kelas IXA', '', 4, 1),
(55, 'Arindya Putri Palupi', '0074574272', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-02-11', 'Tamansari,RT 3,RW 4,Desa/Kel.Sunyalangu,Kec.Sunyalangu,53161', '083148675749', 'Kelas IXC', '', 4, 1),
(56, 'Arka Ardiya Palupi', '3085189471', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-01-17', 'Jalan Pramuka Rt.3/5,RT ,RW ,Purwokerto Kulon,Kec.Kec.Purwokerto Selatan,', '083844486515', 'Kelas VIIIA', '', 4, 1),
(57, 'Arkan Kumara Nadhif', '0094931581', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-04-08', 'PASIRMUNCANG,RT 5,RW 6,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '0895421936794', 'Kelas VIIIA', '', 4, 1),
(58, 'Arle Desta Pratama', '0071487900', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-12-04', 'PAHLAWAN GG. 5,RT 3,RW 9,Desa/Kel.Tanjung,Kec.Tanjung,53143', '082329736400', 'Kelas IXE', '', 4, 1),
(59, 'Arsya Decha Olivia', '0092004052', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-06-24', 'Bantarsoka,RT 6,RW 3,Bantarsoka,Kec.Kec.Purwokerto Barat,53137', '0895808955544', 'Kelas VIIIA', '', 4, 1),
(60, 'Arthalyta Nur Azizah', '0091309503', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-05-16', 'Jl. Patriot,RT 1,RW 10,Desa/Kel.Karangpucung,Kec.Karangpucung,53142', '089669675107', 'Kelas VIIIB', '', 4, 1),
(61, 'Arva Dwi Kurniawan', '0055101897', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2005-06-15', 'Sidabowa, Gg. Janggur,RT 2,RW 4,Desa/Kel.Sidabowa,Kec.Sidabowa,', '085871034427', 'Kelas IXB', '', 4, 1),
(62, 'Aryasatya Adi Pratama', '0088110289', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-09-20', 'Jl. Suteja,RT 4,RW 6,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '081227557873', 'Kelas VIIIB', '', 4, 1),
(63, 'Arzeta Farah Nur Azizah', '0082265324', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-07-17', 'Jl. Pahlawan Gg. VII ,RT 3,RW 9,Desa/Kel.Tanjung,Kec.Tanjung,53145', '087808123932', 'Kelas IXE', '', 4, 1),
(64, 'Ashanur Nabila Putri Aruna', '0089063947', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-08-21', 'Jl.Pahlawan Gg.IV Purwokerto,RT 1,RW 4,Tanjung,Kec.Kec.Purwokerto Selatan,', '085870888960', 'Kelas IXA', '', 4, 1),
(65, 'Ashar Bagus Prastio', '0094605849', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-10-25', 'PURWANEGARA,RT 4,RW 4,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '083125188045', 'Kelas VIIB', '', 4, 1),
(66, 'Asyifa Putri Shenly Maharani', '0104372094', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-09-30', 'JL. PEMUDA Gg MASJID,RT 5,RW 4,KEDUNGWULUH,Kec.Kec.Purwokerto Barat,53131', '085540465875', 'Kelas VIIC', '', 4, 1),
(67, 'Athifa Davina Putri', '0092484455', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-04-12', 'JL BALAIKAMBANG,RT 2,RW 7,Desa/Kel.Bantarsoka,Kec.Bantarsoka,', '081542900742', 'Kelas VIIIC', '', 4, 1),
(68, 'Aurora Anatasya Putri', '0079154465', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-07-22', 'Jl. Kober Gg.Nusa Indah No. 10,RT 3,RW 2,Desa/Kel.Kober,Kec.Kober,53132', '081211576684', 'Kelas IXA', '', 4, 1),
(69, 'Ayu Laras Pangestika', '0062878012', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2006-04-16', 'Langgongsari,RT 6,RW 3,Langgongsari,Kec.Kec.Cilongok,53162', '085879163259', 'Kelas VIIIB', '', 4, 1),
(70, 'Azalea Chesia Anggraeni', '0091604756', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-02-19', 'Watumas Gang XII,RT 4,RW 2,Desa/Kel.Purwanegara,Kec.Purwanegara,', '08157730053', 'Kelas VIIIA', '', 4, 1),
(71, 'Azhar Musafri', '0095935673', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-10-31', 'Jl margantara,RT 0,RW 0,Desa/Kel.Tanjung,Kec.Tanjung,', '083123767158', 'Kelas VIIIC', '', 4, 1),
(72, 'Azzahra Khoerunnisa', '0106179456', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-03-10', 'JL. PAHLAWAN,RT 4,RW 2,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,', '085866079793', 'Kelas VIIB', '', 4, 1),
(73, 'Bagas Ramdhan Al Ghifari', '0099576011', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-09-05', 'Jl. Kober Gg, Delima,RT 7,RW 4,Desa/Kel.Kober,Kec.Kober,53132', '082221880800', 'Kelas VIIC', '', 4, 1),
(74, 'Bagus Dwi Andriansyah', '0075082737', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-01-12', 'Jl. Setasiun II No. 208,RT 5,RW 1,bantarsoka,Kec.Kec.Purwokerto Barat,53133', '085282903388', 'Kelas IXA', '', 4, 1),
(75, 'Bayu Rizqi Wicaksono', '0095169997', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-07-22', 'jl margantara,RT 0,RW 0,tanjung,Kec.Kec.Purwokerto Selatan,', '085647585611', 'Kelas VIIIB', '', 4, 1),
(76, 'Bintang Farela Ananda', '0065411717', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-10-24', 'Watumas, Gg. 12 No. 753,RT 2,RW 3,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '087819802610', 'Kelas IXC', '', 4, 1),
(77, 'Bintang Himawan', '0096679788', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-11-10', 'Jl.Pahlawan Gang II,RT 2,RW 1,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '087888736085', 'Kelas VIIB', '', 4, 1),
(78, 'Cahyo Agung Ramadhan', '0098152928', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-09-07', 'PAHLAWAN Gg. IV / 12,RT 4,RW 2,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,', '085747917302', 'Kelas VIIA', '', 4, 1),
(79, 'Catur Adika', '0069762807', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-05-24', 'Jl. KS. Tubun,RT 1,RW 6,Desa/Kel.Kober,Kec.Kober,53132', '081293310292', 'Kelas VIIIC', '', 4, 1),
(80, 'Celsi Gita Mefia', '0087733677', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-06-22', 'Jl.Hadi Soetoyo,RT 1,RW 4,Desa/Kel.Karanganyar,Kec.Karanganyar,53171', '089669409679', 'Kelas IXC', '', 4, 1),
(81, 'Crisa Putri Kinasih', '0082343451', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-05-12', 'JEND. SOETOYO GG.6,RT 2,RW 1,Desa/Kel.Sokanegara,Kec.Sokanegara,53131', '087805782929', 'Kelas VIIIB', '', 4, 1),
(82, 'Dafa Fajrin Purnama', '0094745335', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-05-10', 'Jl Jand A Yani Gg 4 No 4,RT 5,RW 7,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '081352025425', 'Kelas VIIIA', '', 4, 1),
(83, 'Damar Rizky', '0084521775', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-09-20', 'JEND SUDIRMAN BARAT,RT 7,RW 3,Desa/Kel.Rejasari,Kec.Rejasari,53134', '082221818746', 'Kelas VIIA', '', 4, 1),
(84, 'Danang Agus Triyono', '0075571862', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-08-16', 'Purwanegara,RT 5,RW 3,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '089669516939', 'Kelas IXE', '', 4, 1),
(85, 'Danil Hendra Mawan', '0085258381', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-12-15', 'BANTARSOKA,RT 2,RW 7,BANTARSOKA,Kec.Kec.Purwokerto Barat,53144', '082323699403', 'Kelas VIIIB', '', 4, 1),
(86, 'Della Dwi Santika Putri Liani', '0109103043', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-08-14', 'KUTASARI,RT 3,RW 4,KUTASARI,Kec.Kec.Baturaden,53151', '085848156611', 'Kelas VIIA', '', 4, 1),
(87, 'Delta Beno Anugrah', '3076047320', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-03-20', 'Kebanggan,RT 3,RW 1,Desa/Kel.Kebanggan,Kec.Kebanggan,53183', '083159382712', 'Kelas IXC', '', 4, 1),
(88, 'Demas Iman Al Dizwa', '0104552471', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-03-09', 'PAHLAWAN I,RT 1,RW 1,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53131', '087819550225', 'Kelas VIIB', '', 4, 1),
(89, 'Destian Dwi Rahman', '0092086309', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-12-08', 'JL.SIDODADI,RT 2,RW 5,Desa/Kel.Kedungwringin,Kec.Kedungwringin,53171', '085725489472', 'Kelas VIIB', '', 4, 1),
(90, 'Devana Ardan Januari', '0105632709', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-01-29', 'JALAN KAMANDAKA,RT 9,RW 3,Desa/Kel.Bobosan,Kec.Bobosan,53127', '085641872453', 'Kelas VIIA', '', 4, 1),
(91, 'Devi Pratama Asiva', '0085047331', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-03-01', 'Kalamentah, Kebumen,RT 7,RW 2,Desa/Kel.Kebumen,Kec.Kebumen,', '082158047617', 'Kelas IXD', '', 4, 1),
(92, 'Devina Lintang Mauliddina', '0067294987', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2006-12-20', 'Kober GG Nanas,RT 7,RW 4,Desa/Kel.Kober,Kec.Kober,', '081575734625', 'Kelas IXA', '', 4, 1),
(93, 'Devis Sabrina Putrisia', '0071034341', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-12-27', 'JEND. SUTOYO G. I,RT 3,RW 8,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,', '085972515922', 'Kelas IXB', '', 4, 1),
(94, 'Dhesta Aresha Kusumaningrum', '0101508875', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-01-02', 'Jl A. Yani No.17,RT 6,RW 6,Kedungwuluh,Kec.Kec.Purwokerto Barat,53131', '085727330937', 'Kelas VIIIC', '', 4, 1),
(95, 'Dhesti Putri Juzzanah Ulfah', '0072874382', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-12-26', 'Jl. A. Yani,RT 6,RW 5,Kedungwuluh,Kec.Kec.Purwokerto Barat,53131', '085848183133', 'Kelas IXA', '', 4, 1),
(96, 'Dias Arya Nugroho', '0089080610', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-01-21', 'Jl. Cermai Gg. Gunung agung,RT 9,RW 3,Desa/Kel.Bobosan,Kec.Bobosan,53127', '081320779134', 'Kelas IXE', '', 4, 1),
(97, 'Didit Agus Saputra', '0096079675', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-08-10', 'Bantarsoka,RT 1,RW 1,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '083162738952', 'Kelas VIIB', '', 4, 1),
(98, 'Dila Dian Juwanda', '0087424095', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-06-22', 'Jalan Gerilya,RT 3,RW 3,Desa/Kel.Tanjung,Kec.Tanjung,53143', '088227725402', 'Kelas IXD', '', 4, 1),
(99, 'Dimas Asraf Faturohman', '0072024756', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-01-10', 'Jl. Jambu Gang Lubi-lubi No.35,RT 5,RW 5,Desa/Kel.Rejasari,Kec.Rejasari,53134', '08883946150', 'Kelas IXD', '', 4, 1),
(100, 'Dina Aurelia Kalista', '0099947691', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-12-10', 'JL. JAMBU,RT 0,RW 0,KEDUNGWULUH,Kec.Kec.Purwokerto Barat,', '089697570302', 'Kelas VIIA', '', 4, 1),
(101, 'Divo Aditya Mardiansyah', '0093682717', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-12-08', 'Purwanegara,RT 1,RW 7,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '085868204854', 'Kelas VIIB', '', 4, 1),
(102, 'Dwi Septiana', '0074952307', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-09-26', 'JL SOKAJATI,RT 4,RW 3,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '085747812804', 'Kelas IXC', '', 4, 1),
(103, 'Dzikri Muhamad Fauzi', '0103839571', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-03-30', 'Jl. Pahlawan Gang III,RT 3,RW 1,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '085842811869', 'Kelas VIIC', '', 4, 1),
(104, 'Edward Sherwin Gene Sugiono', '0099523650', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-05-26', 'Jl. Pahlawan Gg Convoi,RT ,RW ,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,', '088809992272', 'Kelas VIIB', '', 4, 1),
(105, 'Elicia Chandra Asih', '0097308043', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-01-27', 'Jl. Masjid,RT 5,RW 4,Kutasari,Kec.Kec.Baturaden,53151', '088299539541', 'Kelas VIIIC', '', 4, 1),
(106, 'Elvaretta Nur Fahra', '0074160012', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-10-15', 'PURWANEGARA,RT 4,RW 3,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '088232465956', 'Kelas IXB', '', 4, 1),
(107, 'Evan Eka Riyanto', '0054378782', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2005-07-04', 'Jl. Setasiun Gang II,RT 3,RW 1,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53132', '085799483149', 'Kelas IXB', '', 4, 1),
(108, 'Ezra Tadita Rosedi', '0082121596', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-05-17', 'Jl. Rajawali Gg. Merak No. 39,RT 5,RW 7,Desa/Kel.Kober,Kec.Kober,53132', '088225368396', 'Kelas IXC', '', 4, 1),
(109, 'Ezy Panca Juliyano', '0063533940', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-07-05', 'Perum. Permai Indah Pasir,RT 2,RW 4,Desa/Kel.Pasir Kidul,Kec.Pasir Kidul,', '083846823821', 'Kelas IXB', '', 4, 1),
(110, 'Fa\'Iq Arva Nugraha', '0098579263', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-06-27', 'Jl. Pahlawan Gg. IX,RT 6,RW 5,Tanjung,Kec.Kec.Purwokerto Selatan,53143', '085728923012', 'Kelas VIIIB', '', 4, 1),
(111, 'Fabio Ellrey Prasetia', '0101421860', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-05-07', 'RA. WIRIATMAJA Gg. V,RT 3,RW 4,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '083824693520', 'Kelas VIIC', '', 4, 1),
(112, 'Fahakh Riski Hermandes', '3089028623', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-06-04', 'Beji, RT 05/RW 06,RT 5,RW 6,Desa/Kel.Beji,Kec.Beji,53152', '0895422451555', 'Kelas VIIC', '', 4, 1),
(113, 'Fahri Putra Myendra', '0074909555', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-11-21', 'JALAN SOKAJATI,RT 2,RW 3,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '088228632989', 'Kelas IXB', '', 4, 1),
(114, 'Fahri Tri Cahyo', '0092353152', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-01-03', 'Jalan Let.Jend.Pol.Soemarto,RT 1,RW 4,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '08973991443', 'Kelas VIIIA', '', 4, 1),
(115, 'Fahry Danu Ardhiansyah', '0106987350', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-02-04', 'Jl. Kober Gg. Nanas,RT 7,RW 4,Desa/Kel.Kober,Kec.Kober,53132', '081326806608', 'Kelas VIIB', '', 4, 1),
(116, 'Faizal Rizki Pamungkas', '0082276068', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-02-13', 'Jl. RA Wiriaatmaja Gg. II,RT 7,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '089669447163', 'Kelas IXE', '', 4, 1),
(117, 'Fajar Muhzaeni', '0105308009', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-06-17', 'PURWANEGARA,RT 2,RW 7,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '089518551295', 'Kelas VIIC', '', 4, 1),
(118, 'Fara Almaqvira Putri', '0099195123', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-02-17', 'Jenderal Soetoyo Gang 1 RT 03/08,RT 3,RW 8,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '083154936469', 'Kelas VIIIA', '', 4, 1),
(119, 'Farel Adinata Putra Pratama', '0075047820', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-06-05', 'Jl. Arsantaka, Arcawinangun,RT 1,RW 4,Desa/Kel.Arcawinangun,Kec.Arcawinangun,', '0895377081456', 'Kelas IXB', '', 4, 1),
(120, 'Farel Putra Aditya', '0076677019', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-05-23', 'Jl. Gerilya,RT 3,RW 3,Desa/Kel.Tanjung,Kec.Tanjung,', '088225088738', 'Kelas IXC', '', 4, 1),
(121, 'Farendra Dwi Setiawan', '0083310227', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-03-11', 'Jl. Kober RT 1/1. Kober,RT 1,RW 1,Desa/Kel.Kober,Kec.Kober,', '0895634494933', 'Kelas IXB', '', 4, 1),
(122, 'Farina Istialindi', '0058498321', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2005-12-15', 'Kol Sugiri,RT 7,RW 6,Desa/Kel.Kranji,Kec.Kranji,53116', '0895384236391', 'Kelas VIIIB', '', 4, 1),
(123, 'Fathina Thalita Sani', '0094920505', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-07-06', 'PASIR MUNCANG,RT 6,RW 4,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,', '081392335983', 'Kelas VIIIA', '', 4, 1),
(124, 'Fathur Rohman Ali Fahry', '0084225414', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-11-14', 'BANTARSOKA,RT 2,RW 7,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '085877254566', 'Kelas VIIIC', '', 4, 1),
(125, 'Fatin Nur Afrina', '0082378528', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-06-25', 'Karanglewas Kidul,RT 1,RW 4,Desa/Kel.Karanglewas Kidul,Kec.Karanglewas Kidul,53161', '0859126487222', 'Kelas IXE', '', 4, 1),
(126, 'Fauzan', '0082930570', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-07-11', 'Jl. Pramuka Gg. Seruni No. 4,RT 5,RW 5,Desa/Kel.Kober,Kec.Kober,53132', '087882225699', 'Kelas VIIIC', '', 4, 1),
(127, 'Fauzan Febrianto', '0040776900', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2004-02-22', 'Jl.Pasirmuncang,RT 4,RW 3,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '', 'Kelas IXA', '', 4, 1),
(128, 'Fayola Azka Indriani', '3097879410', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-04-30', 'KEDUNGWRINGIN,RT 3,RW 1,KEDUNGWRINGIN,Kec.Kec.Patikraja,', '081226666404', 'Kelas VIIIB', '', 4, 1),
(129, 'Fayyadh Baihaqi Gunawan', '0091138920', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-05-21', 'Jalan Kamandaka Barat,RT 2,RW 4,Desa/Kel.Karangsalam,Kec.Karangsalam ,53152', '085158227510', 'Kelas VIIIA', '', 4, 1),
(130, 'Febbi Liana', '0084974661', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-03-15', 'Jl. Pahlawan Gg. 8,RT 2,RW 4,Desa/Kel.Tanjung,Kec.Tanjung,', '085740369001', 'Kelas IXA', '', 4, 1),
(131, 'Febi Noor Setiawati', '0097121398', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-02-13', 'JL SURAMENGGALA,RT 2,RW 6,BANTARSOKA,Kec.Kec.Purwokerto Barat,53133', '081802879950', 'Kelas VIIIC', '', 4, 1),
(132, 'Febri Nurhidayat', '0084119740', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-02-15', 'JALAN LET JEND POL SOEMARTO,RT 5,RW 3,PURWANEGARA,Kec.Kec.Purwokerto Utara,53126', '089637049563', 'Kelas IXB', '', 4, 1),
(133, 'Feri Candra Praditya', '0106755745', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-02-18', 'Jl. Penatusan,RT 2,RW 7,Desa/Kel.Karangpucung,Kec.Karangpucung,53142', '085647262486', 'Kelas VIIA', '', 4, 1),
(134, 'Feri Ramadanu', '0083283592', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-09-05', 'Jl. PASAR PON SELATAN,RT 4,RW 2,BANTARSOKA,Kec.Kec.Purwokerto Barat,', '081293189047', 'Kelas IXC', '', 4, 1),
(135, 'Fillia Fitriani Salamah', '0095829124', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-09-26', 'JENDERAL SUTOYO,RT 1,RW 8,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '081218011140', 'Kelas VIIA', '', 4, 1),
(136, 'Finna Evellyna', '0085498086', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-02-04', 'Kedungwringin,RT 4,RW 0,Kedungwringin,Kec.Kec.Patikraja,53171', '089604034548', 'Kelas IXC', '', 4, 1),
(137, 'Fioline Lutfiana Dewi', '0091876815', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-03-25', 'JL.BOBOSAN NO. 48,RT 5,RW 1,PURWANEGARA,Kec.Kec.Purwokerto Utara,', '085649466923', 'Kelas VIIIC', '', 4, 1),
(138, 'Fiorenza Fitriani Salamah', '0096923946', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-09-26', 'JENDERAL SUTOYO,RT 1,RW 8,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '083824694238', 'Kelas VIIB', '', 4, 1),
(139, 'Fitria Ramadhani', '0077125780', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-10-12', 'Jl. Perum Sagabaru,RT 3,RW 5,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '081292602682', 'Kelas IXA', '', 4, 1),
(140, 'Fonda Ais Ramadhan', '0067066491', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-09-22', 'Jl. Pahlawan Gg. VII,RT 2,RW 5,tanjung,Kec.Kec.Purwokerto Selatan,', '085848155492', 'Kelas IXB', '', 4, 1),
(141, 'Frida Tri Hapsari', '0084241241', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-07-13', 'KEDUNGWULUH,RT 0,RW 0,KEDUNGWULUH,Kec.Kec.Purwokerto Barat,', '089697570501', 'Kelas VIIIA', '', 4, 1),
(142, 'Friska Tri Anjani', '0085577552', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-08-10', 'Bersole,RT 3,RW 9,Karangpucung,Kec.Kec.Purwokerto Selatan,53142', '085600710332', 'Kelas IXE', '', 4, 1),
(143, 'Furqon Ikram Slamet Maulana', '0086291216', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-10-20', 'Jl. Kober Gg. Nanas,RT 7,RW 4,Desa/Kel.Kober,Kec.Kober,53132', '081229402227', 'Kelas VIIIB', '', 4, 1),
(144, 'Galant Restiantono', '0085090866', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-04-01', 'JL. YOS SUDARSO,RT 1,RW 2,Desa/Kel.Rejasari,Kec.Rejasari,53133', '0895800420939', 'Kelas IXC', '', 4, 1),
(145, 'Galih Pramudya', '0089726585', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-06-28', 'JL.AHMAD YANI GANG GALUNGGUNG NO.13,RT 2,RW 1,PURWANEGARA,Kec.Kec.Purwokerto Utara,53126', '08816780196', 'Kelas IXD', '', 4, 1),
(146, 'Galih Saputra', '0053102606', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2005-08-02', 'JL SURAMENGGALA,RT 2,RW 5,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53134', '088238290875', 'Kelas IXB', '', 4, 1),
(147, 'Ghathfan Nawaf Tsani', '0079116652', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-09-18', 'JL. Pemuda Gg. Nuri No. 07,RT 1,RW 7,KOBER,Kec.Kec.Purwokerto Barat,53132', '082136826373', 'Kelas VIIIA', '', 4, 1),
(148, 'Gladis Mahardi', '0089563015', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-07-28', 'BANTARSOKA,RT 0,RW 0,Desa/Kel.Bantarsoka,Kec.Bantarsoka,', '089697570307', 'Kelas VIIC', '', 4, 1),
(149, 'Gomgom Evransyah Sihotang', '0093436703', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-02-01', 'Kober Gg. Anggrek No. 24,RT 2,RW 5,Kober,Kec.Kec.Purwokerto Barat,53132', '087732977545', 'Kelas VIIIB', '', 4, 1),
(150, 'Hafid Tahta Dziqro', '0062452180', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-05-12', 'Kalibener,RT 1,RW 2,Karangpucung,Kec.Kec.Purwokerto Selatan,53142', '085726260337', 'Kelas IXD', '', 4, 1),
(151, 'Hafidz Maftuf Adnan', '0103100120', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-01-11', 'Jl. Kober Gg. Manggis,RT 6,RW 4,Desa/Kel.Kober,Kec.Kober,53132', '082135166538', 'Kelas VIIA', '', 4, 1),
(152, 'Hafizh Rizky Adika', '0109676527', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-06-15', 'Jl. Suramenggala No. 32,RT 1,RW 6,Desa/Kel.Rejasari,Kec.Rejasari,53134', '082136334740', 'Kelas VIIA', '', 4, 1),
(153, 'Hafizzah Firqoh Na\'Jiah', '0108531944', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-10-22', 'Jl. RA Wiriaatmaja Gg V No. 48,RT 5,RW 4,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '082223802047', 'Kelas VIIA', '', 4, 1),
(154, 'Haikal Ezha Rafael', '0097025817', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-05-24', 'JALAN SANREJA,RT 1,RW 4,Desa/Kel.Kebanggan,Kec.Kebanggan,53183', '087883660853', 'Kelas VIIIC', '', 4, 1),
(155, 'Hanan Priyono', '0085242101', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-12-21', 'JENDERAL SUTOYO GG. 2,RT 5,RW 2,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '087839054187', 'Kelas VIIIC', '', 4, 1),
(156, 'Hanung Kurniawan', '0082324756', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-05-24', 'Jl. Sokajati,RT 2,RW 2,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '083820293159', 'Kelas IXC', '', 4, 1),
(157, 'Hasyyati Masturah', '0066372857', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2006-07-31', 'Jl. Pahlawan Gg Konvoi No. 31,RT 5,RW 1,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,', '085875942711', 'Kelas IXA', '', 4, 1),
(158, 'Hisyam Aqil', '0088727325', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-05-13', 'Pahlawan gg. konvoi,RT 5,RW 1,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,', '0895384043760', 'Kelas IXB', '', 4, 1),
(159, 'Hyundella Destari Kusuma Putri', '0086907170', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-12-17', 'JAMBU GG. MENTENG,RT 1,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '087818359901', 'Kelas VIIIC', '', 4, 1),
(160, 'Icha Nur Anggraeni', '0083502037', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-04-14', 'Jl. Pahlawan VII, Tanjung,RT 3,RW 5,Desa/Kel.Tanjung,Kec.Tanjung,53143', '', 'Kelas IXE', '', 4, 1),
(161, 'Indah Rahma Dayanti', '0085721682', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-05-27', 'Karangpucung,RT 3,RW 9,Desa/Kel.Karangpucung,Kec.Karangpucung,53142', '085803727386', 'Kelas IXE', '', 4, 1),
(162, 'Iqbal Zahara', '0108890589', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-01-06', 'JALAN KAMANDAKA,RT 2,RW 2,Desa/Kel.Bobosan,Kec.Bobosan,53127', '081229516502', 'Kelas VIIC', '', 4, 1),
(163, 'Irene Putri Pangestika', '0083561257', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-06-08', 'JL. PAHLAWAN Gg 5,RT 2,RW 9,Desa/Kel.Tanjung,Kec.Tanjung,53143', '088239604529', 'Kelas IXD', '', 4, 1),
(164, 'Ismail Febriansyah', '0084268422', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-02-23', 'JL.LETJEND POL SOEMARTO,RT 6,RW 2,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '082136954341', 'Kelas IXE', '', 4, 1),
(165, 'Ivvan Arafah', '0067443650', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-12-30', 'Jl. Pemuda,RT 6,RW 4,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '08885957938', 'Kelas IXC', '', 4, 1),
(166, 'Janetta Aura Putri', '0106449577', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-01-13', 'PASIRMUNCANG,RT 1,RW 3,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '085894145797', 'Kelas VIIC', '', 4, 1),
(167, 'Januar Kusuma', '0088303040', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-01-23', 'Jalan Sukadamai,RT 3,RW 3,Desa/Kel.Karangpucung,Kec.Karangpucung,53142', '08995028302', 'Kelas IXE', '', 4, 1),
(168, 'Julian Pramudipa', '0087529861', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-07-09', 'Ds. Karang Tengah,RT 1,RW 4,Desa/Kel.Karangtengah,Kec.Karangtengah,53151', '085600846025', 'Kelas IXC', '', 4, 1),
(169, 'Julian Rizqi Saputra', '0075813987', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-07-30', 'jl margantara,RT 6,RW 4,Desa/Kel.Tanjung,Kec.Tanjung,53143', '089696194868', 'Kelas IXA', '', 4, 1),
(170, 'Kayla Aliyya Azahra', '0092199525', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-01-14', 'PAHLAWAN GG. IX NO. 14,RT 2,RW 5,Desa/Kel.Tanjung,Kec.Tanjung,53143', '0882003394446', 'Kelas VIIIC', '', 4, 1),
(171, 'Keira Indrastata Susilo', '0074402655', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-06-09', 'Kutasari,RT 6,RW 5,Desa/Kel.Kutasari,Kec.Kutasari,53151', '082135393181', 'Kelas IXA', '', 4, 1),
(172, 'Kenes Latania', '0086597357', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-02-15', 'Jl. Rajawali,RT 6,RW 7,Desa/Kel.Kober,Kec.Kober,53142', '088227843062', 'Kelas IXE', '', 4, 1),
(173, 'Kevin Satria Pratama', '0085733335', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-04-24', 'Bantarsoka,RT 5,RW 4,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '082221879987', 'Kelas IXE', '', 4, 1),
(174, 'Keysha Savila Ulhusna', '0088019037', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-12-30', 'PAHLAWAN Gg. II,RT 1,RW 1,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,', '085848155417', 'Kelas VIIIA', '', 4, 1),
(175, 'Kezia Cantika Wahyuningtyas', '0072240014', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-10-13', 'Kedungwringin,RT 6,RW 6,Desa/Kel.Kedungwringin,Kec.Kedungwringin,53171', '085156864848', 'Kelas IXC', '', 4, 1),
(176, 'Khairunnisa Amanda Claresta', '3082170936', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-12-05', 'JL.H.MASHURI,RT 1,RW 8,REJASARI,Kec.Kec.Purwokerto Barat,', '081243856982', 'Kelas VIIIB', '', 4, 1),
(177, 'Khairunnisa Shintia Dewi', '0105032224', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-04-23', 'KP.PITARA JL. KERAMAT ASEM,RT 5,RW 14,PANCORAN MAS,Kec.Kec.Pancoran Mas,16436', '088289282197', 'Kelas VIIA', '', 4, 1),
(178, 'Khansa Nabila Nurahma', '0094047166', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-06-03', 'JL. GUNUNG MURIA,RT 1,RW 1,Desa/Kel.Bobosan,Kec.Bobosan,53127', '081383512812', 'Kelas VIIIB', '', 4, 1),
(179, 'Kiki Sapto Aji', '0095797340', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-05-03', 'Jalan Suparto,RT 1,RW 3,Desa/Kel.Kutasari,Kec.Kutasari,53151', '087883598078', 'Kelas VIIC', '', 4, 1),
(180, 'Kuat Setyawan', '0069631890', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-04-06', 'JL KS TUBUN,RT 2,RW 6,Desa/Kel.Kober,Kec.Kober,53134', '083127435482', 'Kelas VIIIC', '', 4, 1),
(181, 'Kukuh Setiyadi', '0069924309', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-03-02', 'JLN. PAHLAWAN GANG II,RT 6,RW 1,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,', '0882005065626', 'Kelas IXA', '', 4, 1),
(182, 'Laura Indah Permata', '0087324425', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-07-21', 'KOBER,RT 10,RW 6,Desa/Kel.Kober,Kec.Kober,', '081225688513', 'Kelas IXB', '', 4, 1),
(183, 'Lindu Pratama', '0077092871', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-07-06', 'JL. SURAMENGGALA NO. 43,RT 3,RW 7,Desa/Kel.Rejasari,Kec.Rejasari,53134', '089524248710', 'Kelas IXA', '', 4, 1),
(184, 'Lintang Cahya Baiti', '0099264038', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-05-23', 'Purwanegara,RT 4,RW 2,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '085891313059', 'Kelas VIIIA', '', 4, 1),
(185, 'Lionel Arnesta Putra Ramadhan', '0073126180', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-09-23', 'Jl. Pramuka,RT 3,RW 3,Desa/Kel.Purwokerto Kulon,Kec.Purwokerto Kulon,53141', '089618414355', 'Kelas IXD', '', 4, 1),
(186, 'Lisa Septriana', '0093507366', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-09-13', 'Jl. RA Wiryaatmaja Gg IV,RT 2,RW 4,Kedungwuluh,Kec.Kec.Purwokerto Barat,53131', '', 'Kelas VIIIB', '', 4, 1),
(187, 'Lu\'Lu\' Khairunnisa', '0083736137', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-04-01', 'Jl Raya Beji,RT 3,RW 12,Desa/Kel.Beji,Kec.Beji,53152', '085643787754', 'Kelas IXA', '', 4, 1),
(188, 'Lukman Hakim', '0072259782', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-12-22', 'KARANGSALAM,RT 4,RW 5,Desa/Kel.Karangsalam,Kec.Karangsalam ,', '089502182454', 'Kelas VIIIA', '', 4, 1),
(189, 'Luna Morisa', '0092086150', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-11-27', 'KS. TUBUN,RT 4,RW 4,Desa/Kel.Karangsalam,Kec.Karangsalam ,53152', '081229401571', 'Kelas VIIC', '', 4, 1),
(190, 'Lutfi Wahyuningsih', '0089920419', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-04-28', 'Jl. Gunung Singgalang Bancarkembar,RT 2,RW 2,Bancarkembar,Kec.Kec.Purwokerto Utara,', '088238462203', 'Kelas IXC', '', 4, 1),
(191, 'Malvin Alki Nova', '0079057196', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-04-14', 'BALAI DESA LAMA NO 22,RT 1,RW 3,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '081227522564', 'Kelas VIIIA', '', 4, 1),
(192, 'Mario Rafael Herwina', '0083075359', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-03-14', 'Karangwangkal griya limas permai,RT 5,RW 3,karangwangkal,Kec.Kec.Purwokerto Utara,53123', '08871567622', 'Kelas VIIIC', '', 4, 1),
(193, 'Marshall Fibi Radesta', '0081461478', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-06-08', 'Jl. Sitapen No. 10,RT 1,RW 5,Desa/Kel.Kranji,Kec.Kranji,53116', '081329369580', 'Kelas VIIIC', '', 4, 1),
(194, 'Marvell Resky Setyadi', '0096788420', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-03-13', 'Jl. Ampel,RT 4,RW 5,Desa/Kel.Kedungwringin,Kec.Kedungwringin,53171', '089526845257', 'Kelas VIIIC', '', 4, 1),
(195, 'Maulana Ardani', '0087014710', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-04-25', 'Jalan G.Cermai Gg.Gunung Agung,RT 9,RW 3,Desa/Kel.Bobosan,Kec.Bobosan,53127', '085700973044', 'Kelas IXC', '', 4, 1),
(196, 'Maulana Yusuf Ramadhani', '0089933401', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-09-20', 'JALAN PASIRMUNCANG,RT 7,RW 4,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '0882003379789', 'Kelas IXC', '', 4, 1),
(197, 'Maura Majid Putri Wilis', '0083446354', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-05-30', 'JL SURAMENGGALA,RT 2,RW 5,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '085878739411', 'Kelas IXB', '', 4, 1),
(198, 'Melly Triayu Nindia', '0085372049', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-08-01', 'Karangblimbing,RT 1,RW 1,Desa/Kel.Pabuaran,Kec.Pabuaran,53124', '085870674028', 'Kelas IXA', '', 4, 1),
(199, 'Mifta Tri Nurmaini', '0088766460', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-05-09', 'JL. Pahlawan, Tanjung,RT 2,RW 9,Desa/Kel.Tanjung,Kec.Tanjung,53143', '085227205019', 'Kelas IXE', '', 4, 1),
(200, 'Mohammad Raihan Abdul Aziz', '3088704890', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-07-25', 'Jl. Murbai, Rejasari Purwokerto Barat,RT 2,RW 9,Desa/Kel.Rejasari,Kec.Rejasari,53134', '085869624207', 'Kelas IXE', '', 4, 1);
INSERT INTO `user` (`id`, `nama`, `nomor_unik`, `image`, `password`, `jk`, `tgl_lahir`, `alamat`, `no_hp`, `kelas`, `jabatan`, `role_id`, `is_active`) VALUES
(201, 'Moniq Alifah Desmita', '0088413900', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-12-20', 'Jl. A Yani Gg II No 24 A,RT 2,RW 7,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '083839213196', 'Kelas VIIIC', '', 4, 1),
(202, 'Muhammad Arya Pratama', '0102205947', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-06-26', 'JL. JAMBU NO 28,RT 5,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '089652437123', 'Kelas VIIC', '', 4, 1),
(203, 'Muhammad Azriel Haekal', '0101980506', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-01-03', 'Jl. Pahlawan,RT 7,RW 1,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53131', '089673499977', 'Kelas VIIB', '', 4, 1),
(204, 'Muhammad Evan Setiawan', '0091633566', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-12-24', 'PURWANEGARA,RT 3,RW 4,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '083148563042', 'Kelas VIIB', '', 4, 1),
(205, 'Muhammad Fiqri Maulana', '0089036035', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-03-30', 'Jl. Sukajati No. 26,RT 2,RW 3,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '089608884309', 'Kelas IXB', '', 4, 1),
(206, 'Muhammad Naufal Muzhaffa', '0085030406', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-07-30', 'Bobosan,RT 1,RW 3,Desa/Kel.Bobosan,Kec.Bobosan,53127', '089524159911', 'Kelas IXE', '', 4, 1),
(207, 'Muhammad Risqy Pratama', '0105040875', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-01-30', 'Jl. Pahlawan Gg. V,RT 1,RW 3,Desa/Kel.Tanjung,Kec.Tanjung,53143', '081221540778', 'Kelas VIIA', '', 4, 1),
(208, 'Muhammad Willy Kurnyawan', '0096123665', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-07-03', 'PICUNG,RT 5,RW 5,PASAR KEMIS,Kec.Kec.Pasar Kemis,15560', '', 'Kelas VIIA', '', 4, 1),
(209, 'Muhammad Zulfa Nur', '3104623014', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-09-21', 'JL. JAMBURT 03/05 ,RT ,RW ,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,', '', 'Kelas VIIC', '', 4, 1),
(210, 'Musyaffa Zain', '0101467754', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-10-13', 'JAMBU Gg. MARKISA NO39,RT 1,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '083824695458', 'Kelas VIIA', '', 4, 1),
(211, 'Naailah Jinan', '0109336446', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-06-17', 'Jl. Pemuda No 3,RT 5,RW 4,Kedungwuluh,Kec.Kec.Purwokerto Barat,53131', '085641433859', 'Kelas VIIC', '', 4, 1),
(212, 'Nabhan Radinka Kevan', '0105931348', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-07-03', 'PASIRMUNCANG,RT 1,RW 1,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,', '083824695089', 'Kelas VIIC', '', 4, 1),
(213, 'Nabil Firmansyah', '0086500822', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-03-10', 'JL. PAHLAWAN Gg 1 No 43,RT 7,RW 1,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '', 'Kelas IXE', '', 4, 1),
(214, 'Nabila Ayu Fitria', '0085381673', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-09-24', 'Purwosari,RT 6,RW 1,Desa/Kel.Purwosari,Kec.Purwosari,53151', '088239468807', 'Kelas IXB', '', 4, 1),
(215, 'Nabilla Salma Putri', '0141105484', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-04-15', 'Jl. let. Jend. Pol. Soemarto Gg. Anjasmara,RT 3,RW 4,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '088226844037', 'Kelas IXB', '', 4, 1),
(216, 'Nadhifa Dwi Novalina', '0075351992', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-11-21', 'Jl. Pemuda Gg Kaswari No 26,RT 4,RW 7,Desa/Kel.Kober,Kec.Kober,53132', '085803734513', 'Kelas IXC', '', 4, 1),
(217, 'Nadila Albezi Noren', '0081007814', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-03-06', 'Jl. Candra Wijaya,RT 3,RW 3,Desa/Kel.Purwosari,Kec.Purwosari,53151', '083182040895', 'Kelas IXB', '', 4, 1),
(218, 'Nafid Raihan Prasetyo', '0096909883', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-03-23', 'H.Mashuri,RT 1,RW 8,Desa/Kel.Rejasari,Kec.Rejasari,53134', '087726526982', 'Kelas VIIIB', '', 4, 1),
(219, 'Nanang Rizky Saputra', '0101945678', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-06-17', 'PURWANEGARA,RT 1,RW 1,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '081215315020', 'Kelas VIIA', '', 4, 1),
(220, 'Naura Dinda Zyka Iskandar', '0103428064', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-03-12', 'Perum Griya Satria Blok Z A No. 12,RT 4,RW 9,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '085290912337', 'Kelas VIIIC', '', 4, 1),
(221, 'Neisha Riza Asyifa', '0072783966', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-12-08', 'Jl. Letjend Pol Sumarto RT 08 RW 03 Purwanegara Purwokerto Utara,RT 8,RW 3,Purwanegara,Kec.Kec.Purwokerto Utara,53126', '089649979078', 'Kelas IXE', '', 4, 1),
(222, 'Nindy Tri Kartika Sari', '0077001043', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2005-09-08', 'Jl. Kober Gg. Kenanga,RT 1,RW 2,Kober,Kec.Kec.Purwokerto Barat,53132', '085326979960', 'Kelas IXC', '', 4, 1),
(223, 'Noval Tri Pamungkas', '0057116733', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2005-11-12', 'Jl. Suramenggala No. 29,RT 4,RW 5,Desa/Kel.Rejasari,Kec.Rejasari,53134', '089669169647', 'Kelas IXA', '', 4, 1),
(224, 'Novan Alif Putra', '0075558382', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-11-24', 'JEND, SOETOYO GG. V ,RT 1,RW 2,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '085700775187', 'Kelas IXD', '', 4, 1),
(225, 'Noven Dwi Saputra', '0073134040', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-11-19', 'Jl Kober Gg Nanas,RT 7,RW 4,Desa/Kel.Kober,Kec.Kober,', '087829955993', 'Kelas IXD', '', 4, 1),
(226, 'Novia Feriska Sasti', '0075857589', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-11-01', 'JL VETERAN GG PELEM,RT 2,RW 3,Desa/Kel.Rejasari,Kec.Rejasari,', '083844074025', 'Kelas IXD', '', 4, 1),
(227, 'Nur Aulia Rahmania', '0088088480', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-08-26', 'PR GRIYA SATRIA MANDALATAMA BLOK IV NO 07,RT 2,RW 5,Desa/Kel.Pangebatan,Kec.Pangebatan,', '089619270369', 'Kelas IXB', '', 4, 1),
(228, 'Nur Hilal Al Ramadhani', '0074843972', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-10-11', 'Jalan Letjend Pol Soemarto,RT 7,RW 3,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '089514341530', 'Kelas IXB', '', 4, 1),
(229, 'Nur Isa Tri Yudha Utomo', '0093197684', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-05-11', 'JL KS TUBUN,RT 8,RW 6,Desa/Kel.Kober,Kec.Kober,53135', '08882643253', 'Kelas VIIIB', '', 4, 1),
(230, 'Nurmanita', '0086649241', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-12-07', 'Rejasari,RT 3,RW 5,Desa/Kel.Rejasari,Kec.Rejasari,53134', '085601333447', 'Kelas VIIC', '', 4, 1),
(231, 'Okta Firmansyah', '0083847967', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-10-08', 'Jl. Pasiraja,RT 2,RW 5,Desa/Kel.Rejasari,Kec.Rejasari,53133', '083126733674', 'Kelas VIIA', '', 4, 1),
(232, 'Ondatiara Prihastiti', '0081961543', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-08-22', 'Jl. Moch.Besar,RT 7,RW 4,Kutasari,Kec.Kec.Baturaden,53151', '087825562138', 'Kelas VIIIC', '', 4, 1),
(233, 'Ozil Gemilang Romadhony', '0106848767', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-09-07', 'JL. PEMUDA GANG RAGIL,RT 4,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,', '089697570401', 'Kelas VIIC', '', 4, 1),
(234, 'Pipit Dian Anggraini', '0094793533', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-07-02', 'Jl. Rajawali Gg. Merak,RT 5,RW 7,Desa/Kel.Kober,Kec.Kober,53132', '081904770802', 'Kelas VIIIA', '', 4, 1),
(235, 'Praditya Putra', '0084612015', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-05-21', 'JALAN KS TUBUN GANG RASAM,RT 10,RW 6,Desa/Kel.Kober,Kec.Kober,53138', '088221145024', 'Kelas IXD', '', 4, 1),
(236, 'Raditya Meilano Saputra', '0086914715', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-05-22', 'Jalan Gerilya Gg 2,RT 3,RW 3,Desa/Kel.Tanjung,Kec.Tanjung,53143', '088215458107', 'Kelas IXE', '', 4, 1),
(237, 'Raditya Nur Eka Ramdani', '0078153844', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-12-07', 'JL. KOBER GG. SUKUN,RT 7,RW 3,Desa/Kel.Kober,Kec.Kober,53132', '087890396342', 'Kelas IXD', '', 4, 1),
(238, 'Rafa Ananta Prayoga', '0102340238', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-03-08', 'SUPARTO,RT 1,RW 3,Desa/Kel.Kutasari,Kec.Kutasari,53151', '0895353320509', 'Kelas VIIC', '', 4, 1),
(239, 'Raffi Boing Saputra', '0094571834', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-11-25', 'JALAN BUNTU,RT 6,RW 4,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '085726577806', 'Kelas VIIB', '', 4, 1),
(240, 'Rafi Permana', '0065429172', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-12-26', 'JEND. SUTOYO G. VI,RT 2,RW 1,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,', '085600649743', 'Kelas VIIIA', '', 4, 1),
(241, 'Ragil Kusumaning Ayu', '3098876755', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-06-06', 'Jl. Ketayasa Kedungrandu,RT 4,RW 3,Desa/Kel.Kedungrandu,Kec.Kedungrandu,53171', '085741156804', 'Kelas VIIA', '', 4, 1),
(242, 'Rahmat Jati Ilham', '0068685120', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-10-06', 'KAMANDAKA,RT 2,RW 2,Desa/Kel.Bobosan,Kec.Bobosan,53127', '085747519612', 'Kelas IXD', '', 4, 1),
(243, 'Rahmat Ramdani', '0086571291', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-09-04', 'Jl. Kober Gg. Cempaka,RT 5,RW 2,Desa/Kel.Kober,Kec.Kober,53132', '089510831196', 'Kelas IXC', '', 4, 1),
(244, 'Raihan Rosmarsyah', '0097039215', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-08-07', 'Jl. Kober Gg. Nanas,RT 7,RW 4,Desa/Kel.Kober,Kec.Kober,53132', '082136049438', 'Kelas VIIIC', '', 4, 1),
(245, 'Raissa Mutiara Latifah', '0106909806', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-08-09', 'JL. JAMBU GANG LUBI LUBI,RT 5,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,', '085878463876', 'Kelas VIIB', '', 4, 1),
(246, 'Ranti Lestari', '0062742103', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2006-06-10', 'Jl. Sokajati,RT 6,RW 3,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '08886513813', 'Kelas IXB', '', 4, 1),
(247, 'Rashya Arletta Putri', '0081907101', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-06-11', 'Jalan Suprapto No. 1,RT 4,RW 3,Purwosari,Kec.Kec.Baturaden,53151', '081325261302', 'Kelas IXD', '', 4, 1),
(248, 'Rasya Aqila Ramadhan', '0081244315', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-09-21', 'PERUM GRIYA KOBER INDAH NO. 214,RT 1,RW 1,Desa/Kel.Kober,Kec.Kober,53132', '085727343918', 'Kelas VIIIC', '', 4, 1),
(249, 'Rayhan Windu Prasetya', '0098017637', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-07-25', 'SOKAJATI,RT 6,RW 3,Desa/Kel.Bantarsoka,Kec.Bantarsoka,', '083824696304', 'Kelas VIIA', '', 4, 1),
(250, 'Rayna Arsya Valentina', '0088402029', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-02-13', 'Jl.S.Parman,RT 4,RW 3,Desa/Kel.Purwokerto Kulon,Kec.Purwokerto Kulon,53141', '081542429386', 'Kelas IXE', '', 4, 1),
(251, 'Refina Alifia Putri', '0097513597', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-07-28', 'KARANG SALAM,RT 4,RW 5,Desa/Kel.Karangsalam,Kec.Karangsalam ,', '081391283755', 'Kelas VIIIB', '', 4, 1),
(252, 'Rendi Agil Kurniawan', '0066042100', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-02-25', 'Jl. Pasar Manis No.1,RT 2,RW 6,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '085643841541', 'Kelas IXA', '', 4, 1),
(253, 'Rera Aura Rizky', '3087333760', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-07-31', 'Rumah Dinas Perum. Kereta Api No. 10 Bantarsoka,RT 1,RW 3,Desa/Kel.Bantarsoka,Kec.Bantarsoka,', '082288291821', 'Kelas IXD', '', 4, 1),
(254, 'Restu Adi Santosa', '0093044112', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-09-08', 'Jl. Pemuda Gg. Rajawali,RT 6,RW 7,Desa/Kel.Kober,Kec.Kober,53132', '081226114068', 'Kelas VIIB', '', 4, 1),
(255, 'Restuningtyas Dwi Purwanti', '0143942103', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-08-25', 'JALAN LET JEND POL SOEMARTO,RT 5,RW 4,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '083154892272', 'Kelas IXD', '', 4, 1),
(256, 'Reva Putri Anjani', '0103311183', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-03-31', 'Jl. Pahlawan,RT 4,RW 1,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '082243605949', 'Kelas VIIB', '', 4, 1),
(257, 'Revan Adnan Wiyoga', '0073235086', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-06-08', 'jl margantara,RT 3,RW 4,Desa/Kel.Kedungwringin,Kec.Kedungwringin,53171', '081329251620', 'Kelas IXD', '', 4, 1),
(258, 'Revanno Lintang Haryanto', '', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2017-01-01', 'Jl.Wijaya Kusuma No 1,RT 2,RW 3,Desa/Kel.Rejasari,Kec.Rejasari,', '', 'Kelas VIIC', '', 4, 1),
(259, 'Rhevellyn Putri Rahmadani', '0084691238', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-09-14', 'Jl. Makam Pahlawan,RT 1,RW 4,Desa/Kel.Tanjung,Kec.Tanjung,', '08971388500', 'Kelas VIIA', '', 4, 1),
(260, 'Ridho Ramadhani Zaputra', '0095756069', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-08-31', 'PURWANEGARA,RT 2,RW 7,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '081914564919', 'Kelas VIIC', '', 4, 1),
(261, 'Ridwan Arya Putra', '0088824896', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-06-19', 'Jalan Kawi,RT 6,RW 2,Desa/Kel.Bobosan,Kec.Bobosan,53127', '085540248913', 'Kelas IXD', '', 4, 1),
(262, 'Rifat Nur Febrian', '0093366396', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-02-01', 'Purwanegara,RT 3,RW 4,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '085803539036', 'Kelas VIIB', '', 4, 1),
(263, 'Risky Andhika', '0065009853', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2005-10-31', 'jl. raya beiji,RT 6,RW 2,Desa/Kel.Kutasari,Kec.Kutasari,53151', '087883598078', 'Kelas IXE', '', 4, 1),
(264, 'Rizki Ami Fardan Hamdalah', '0094561596', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-05-05', 'Jl. Gerilya,RT 9,RW 1,Desa/Kel.Tanjung,Kec.Tanjung,53143', '0895358805021', 'Kelas VIIA', '', 4, 1),
(265, 'Rizki Ardiansyah', '0092998963', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-02-17', 'Jl. Suteja No.11,RT 3,RW 6,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '082223535103', 'Kelas VIIIA', '', 4, 1),
(266, 'Rizky Adiansyah', '0097715110', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-01-05', 'Jl.Gunung Rinjani,RT 6,RW 2,Desa/Kel.Bobosan,Kec.Bobosan,53127', '085741748400', 'Kelas VIIA', '', 4, 1),
(267, 'Rizqi Maulida Nur Rahma', '0085607137', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-03-23', 'PASIRMUNCANG,RT 6,RW 4,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '085842848189', 'Kelas IXC', '', 4, 1),
(268, 'Rosi Setiawan', '0083206576', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-03-20', 'Jalan Letjend Pol Soemarto,RT 6,RW 4,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '', 'Kelas IXE', '', 4, 1),
(269, 'Salfa Anindita', '0082718995', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-07-27', 'JL. VETERAN ,RT 5,RW 2,Desa/Kel.Rejasari,Kec.Rejasari,53134', '087812945429', 'Kelas IXB', '', 4, 1),
(270, 'Saprisal Purwanto', '0059739463', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2005-04-16', 'Jl. Tanjlig No. 83,RT 5,RW 9,Desa/Kel.Sokanegara,Kec.Sokanegara,53115', '0895383077820', 'Kelas VIIA', '', 4, 1),
(271, 'Satria Aji Werdoyo', '0086324392', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-05-10', 'Jl. Suteja No. 24,RT 3,RW 7,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '088216695343', 'Kelas IXA', '', 4, 1),
(272, 'Satria Julian Eka Pramudya', '0086366077', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-07-28', 'JL. ANGGUR,RT 5,RW 5,JENANG,Kec.Kec.Majenang,53257', '088740039785', 'Kelas VIIIC', '', 4, 1),
(273, 'Sekar Ayu Lestari', '0089479615', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-03-22', 'Kalamentah, Kebumen,RT 7,RW 2,Desa/Kel.Kebumen,Kec.Kebumen,53151', '085747306413', 'Kelas IXD', '', 4, 1),
(274, 'Sekar Ifa Dhini', '0084924972', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-06-25', 'JALAN LET JEND POL SOEMARTO,RT 3,RW 3,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '0895422457302', 'Kelas IXE', '', 4, 1),
(275, 'Septi Cahaya Nuraeni', '0107634411', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-09-15', 'JALAN BUNTU,RT 6,RW 4,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '089504039700', 'Kelas VIIB', '', 4, 1),
(276, 'Shakira Oka Pramesti', '0102516826', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-07-11', 'PURWANEGARA,RT 8,RW 3,Desa/Kel.Purwanegara,Kec.Purwanegara,53126', '081541443588', 'Kelas VIIB', '', 4, 1),
(277, 'Shela Dwi Octaviani', '0094103837', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-10-01', 'PAHLAWAN Gg. MARGABAKTI,RT 12,RW 2,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,', '083824697790', 'Kelas VIIA', '', 4, 1),
(278, 'Suha Rafidah', '0091705295', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-12-04', 'jl margantara,RT 4,RW 4,tanjung,Kec.Kec.Purwokerto Selatan,', '088238571499', 'Kelas VIIIB', '', 4, 1),
(279, 'Sukma Suci Ajengsari', '0068486737', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2006-11-03', 'bantarsoka,RT 4,RW 3,Desa/Kel.Bantarsoka,Kec.Bantarsoka,', '', 'Kelas IXA', '', 4, 1),
(280, 'Sultan Akbar Muhammad Ridho', '0097240949', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-07-11', 'Jl. Sokajati,RT 2,RW 3,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '085725719783', 'Kelas VIIIA', '', 4, 1),
(281, 'Sultan Sinathriya Rahardjo', '3099184951', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2016-01-01', 'PURWANEGARA,RT 4,RW 2,Desa/Kel.Purwanegara,Kec.Purwanegara,', '081804700836', 'Kelas VIIIB', '', 4, 1),
(282, 'Sutri Wibowo Pamungkas', '0085162197', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-10-04', 'jend. soetoyo,RT 3,RW 1,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,', '087802489602', 'Kelas IXD', '', 4, 1),
(283, 'Syafrill Satyana Rizqi Uransa', '0089978885', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-04-22', 'Jalan Ahmad Yani GG VII,RT 2,RW 1,Desa/Kel.Sokanegara,Kec.Sokanegara,53126', '08885974274', 'Kelas VIIIA', '', 4, 1),
(284, 'Syahrul Anam Mubarokah', '0081497589', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-09-04', 'Jalan Suparto,RT 5,RW 1,Desa/Kel.Kutasari,Kec.Kutasari,53151', '081215664865', 'Kelas VIIIA', '', 4, 1),
(285, 'Syahrul Putra Pratama', '0098690177', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-10-20', 'Jl. Pahlawan Gg. IX,RT 2,RW 5,Desa/Kel.Tanjung,Kec.Tanjung,53143', '083813412930', 'Kelas VIIIB', '', 4, 1),
(286, 'Syifa Nur Meilida', '0084304823', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-05-29', 'Jl. Sidodadi, Pengasinan-Kedungwringin,RT 6,RW 3,Desa/Kel.Kedungwringin,Kec.Kedungwringin,53171', '082242460792', 'Kelas IXD', '', 4, 1),
(287, 'Tiara Eka Ramdhani', '0107504820', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-06-27', 'SURAMENGGALA,RT 2,RW 5,Desa/Kel.Rejasari,Kec.Rejasari,53133', '085803730911', 'Kelas VIIA', '', 4, 1),
(288, 'Tiara Hertiani', '0088504558', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2008-01-31', 'Grendeng,RT 3,RW 4,Desa/Kel.Grendeng,Kec.Grendeng,53122', '085728583442', 'Kelas IXE', '', 4, 1),
(289, 'Tiara Putri Ramadhani', '0105951202', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-09-08', 'BATURRADEN BARAT,RT 2,RW 2,Desa/Kel.Kutasari,Kec.Kutasari,53151', '081585878093', 'Kelas VIIC', '', 4, 1),
(290, 'Trianastasya Janista Pranindya Soraya', '0092144301', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-01-04', 'KUTALIMAN,RT 1,RW 7,Desa/Kel.Kutaliman,Kec.Kutaliman,', '085727350424', 'Kelas VIIIB', '', 4, 1),
(291, 'Velove Grasel Maylano', '0075841603', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-05-05', 'Jln Veteran,RT 3,RW 3,Desa/Kel.Bantarsoka,Kec.Bantarsoka,', '0888011916102', 'Kelas VIIA', '', 4, 1),
(292, 'Venia Dwi Febriani', '0045638112', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2004-02-08', 'Jl M Yususf,RT 2,RW 4,Desa/Kel.Kranji,Kec.Kranji,53111', '081548171655', 'Kelas VIIIA', '', 4, 1),
(293, 'Vino Sisda Apriliano', '0088620392', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-04-27', 'Perum Pasir Indah Blok O-1,RT 7,RW 5,Desa/Kel.Kebocoran,Kec.Kebocoran,53132', '081392491198', 'Kelas VIIIC', '', 4, 1),
(294, 'Viondika Pranata Naendra', '0074247520', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-11-08', 'Jl.Veteran gang Pelem,RT 6,RW 3,Rejasari,Kec.Kec.Purwokerto Barat,53134', '085700627158', 'Kelas IXD', '', 4, 1),
(295, 'Wijaya Noor Qosim', '0096675657', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-05-08', 'Jl. Kober Gg. Manggis,RT 3,RW 4,Kober,Kec.Kec.Purwokerto Barat,53132', '082133859935', 'Kelas VIIIC', '', 4, 1),
(296, 'Wijdan Putra Rajendra', '0104939615', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2010-02-20', 'JL. RA WIRYAATMAJA,RT 7,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '081393056451', 'Kelas VIIC', '', 4, 1),
(297, 'Wina Oktaviana', '0108159368', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-10-10', 'JL. BANK GANG 3,RT 0,RW 0,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,', '089697570408', 'Kelas VIIB', '', 4, 1),
(298, 'Wisnu Dharma Uransa', '0064139177', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2006-03-13', 'JL AHMAD YANI GG.VII,RT 2,RW 1,PURWANEGARA,Kec.Kec.Purwokerto Utara,53126', '08886414440', 'Kelas IXA', '', 4, 1),
(299, 'Yoan Pasha Baby Atmaja', '0092256820', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-04-07', 'Kutasari,RT 4,RW 2,Desa/Kel.Kutasari,Kec.Kutasari,', '081227798410', 'Kelas VIIIA', '', 4, 1),
(300, 'Yuliati Kusnul Khotimah', '0099154995', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-07-19', 'Jl. Stasiun Gg. I,RT 1,RW 1,Desa/Kel.Bantarsoka,Kec.Bantarsoka,53133', '082133323031', 'Kelas VIIC', '', 4, 1),
(301, 'Yuniar Muqita Nurlarosa', '0072902797', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2007-06-23', 'Jl. RA Wirya Atmaja Gg. V,RT 7,RW 5,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '0882005065832', 'Kelas VIIIB', '', 4, 1),
(302, 'Yusuf Nugroho Bastian', '0085846253', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2008-05-31', 'JL.GUNUNG RINJANI,RT 2,RW 3,Desa/Kel.Bobosan,Kec.Bobosan,53127', '085878461577', 'Kelas IXA', '', 4, 1),
(303, 'Za\'Imah Ghina Rafilah Shidqi Priyono', '0091429914', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-11-05', 'Jl. Suteja,RT 1,RW 6,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '082133557700', 'Kelas VIIB', '', 4, 1),
(304, 'Zakki Romadhon', '0072594121', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2007-09-16', 'JL JENDERAL SUDIRMAN,RT 0,RW 0,BANTARSOKA,Kec.Kec.Purwokerto Barat,', '081365867212', 'Kelas VIIIB', '', 4, 1),
(305, 'Zaneta Oksatrianika', '0099223426', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2009-10-10', 'JENDERAL SUTOYO Gg. VI,RT 8,RW 1,Desa/Kel.Kedungwuluh,Kec.Kedungwuluh,53131', '083824697223', 'Kelas VIIC', '', 4, 1),
(306, 'Zhevana Wanda Hans Rafhael', '0102746412', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-01-19', 'PASIRMUNCANG,RT 6,RW 4,Desa/Kel.Pasirmuncang,Kec.Pasirmuncang,53137', '085700998406', 'Kelas VIIC', '', 4, 1),
(307, 'Zuyyina Sabrilla', '0109400466', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'P', '2010-05-13', 'Jl. Pahlawan Gg. IX,RT 2,RW 5,Desa/Kel.Tanjung,Kec.Tanjung,54143', '083103220234', 'Kelas VIIB', '', 4, 1),
(308, 'Naufal Mirza Afkar', '0096672418', 'default.jpg', '$2y$10$4RrJYzlvndgK/FGH/CBXdOqkXT1z2hirwFm..KgnR9Jd92HsMrvKi', 'L', '2009-02-16', 'JL. PINUS V/57,RT 3,RW 7,Kec.PURWOKERTO SELATAN,53143', '', 'Kelas VIIIC', '', 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indexes for table `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`no_pinjam`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_detail`
--
ALTER TABLE `booking_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `temp`
--
ALTER TABLE `temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
