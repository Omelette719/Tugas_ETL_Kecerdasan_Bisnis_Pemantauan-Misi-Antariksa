-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 06 Okt 2025 pada 12.23
-- Versi server: 8.0.30
-- Versi PHP: 8.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `space_mission_dw`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dim_agency`
--

CREATE TABLE `dim_agency` (
  `agency_key` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `dim_agency`
--

INSERT INTO `dim_agency` (`agency_key`, `name`, `country`) VALUES
(1, 'NASA', 'USA'),
(2, 'NASA', 'USA'),
(3, 'NASA', 'USA'),
(4, 'NASA', 'USA'),
(6, 'NASA', 'USA'),
(7, 'NASA', 'USA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dim_date`
--

CREATE TABLE `dim_date` (
  `date_key` int NOT NULL,
  `launch_date` date DEFAULT NULL,
  `launch_year` int DEFAULT NULL,
  `launch_quarter` int DEFAULT NULL,
  `launch_month` int DEFAULT NULL,
  `launch_day` int DEFAULT NULL,
  `day_of_week` varchar(10) DEFAULT NULL,
  `is_weekend` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `dim_date`
--

INSERT INTO `dim_date` (`date_key`, `launch_date`, `launch_year`, `launch_quarter`, `launch_month`, `launch_day`, `day_of_week`, `is_weekend`) VALUES
(19690716, '1969-07-16', 1969, 3, 7, 16, 'Wednesday', 0),
(20181020, '2018-10-20', 2018, 4, 10, 20, 'Saturday', 1),
(20200723, '2020-07-23', 2020, 3, 7, 23, 'Thursday', 0),
(20200730, '2020-07-30', 2020, 3, 7, 30, 'Thursday', 0),
(20230315, '2023-03-15', 2023, 1, 3, 15, 'Wednesday', 0),
(20230414, '2023-04-14', 2023, 2, 4, 14, 'Friday', 0),
(20230714, '2023-07-14', 2023, 3, 7, 14, 'Friday', 0),
(20230826, '2023-08-26', 2023, 3, 8, 26, 'Saturday', 1),
(20240323, '2024-03-23', 2024, 1, 3, 23, 'Saturday', 1),
(20240606, '2024-06-06', 2024, 2, 6, 6, 'Thursday', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dim_destination`
--

CREATE TABLE `dim_destination` (
  `destination_key` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `dim_destination`
--

INSERT INTO `dim_destination` (`destination_key`, `name`, `type`) VALUES
(1, 'Mars', 'Planet'),
(2, 'Mars', 'Planet'),
(3, 'Mars', 'Planet'),
(5, 'Mars', 'Planet'),
(10, 'Mars', 'Planet');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dim_mission`
--

CREATE TABLE `dim_mission` (
  `mission_key` int NOT NULL,
  `mission_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `dim_mission`
--

INSERT INTO `dim_mission` (`mission_key`, `mission_name`) VALUES
(1, 'Mars 2020 Perseverance Rover'),
(2, 'Apollo 11'),
(3, 'ISS Supply Mission CRS-27'),
(4, 'Chandrayaan-3'),
(5, 'Tianwen-1'),
(6, 'BepiColombo Mercury Mission'),
(7, 'Soyuz MS-25 Crew Transport'),
(8, 'Starliner Test Flight'),
(9, 'Crew-7 to ISS'),
(10, 'JUICE Mission to Jupiter');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dim_spacecraft`
--

CREATE TABLE `dim_spacecraft` (
  `spacecraft_key` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `dim_spacecraft`
--

INSERT INTO `dim_spacecraft` (`spacecraft_key`, `name`, `type`) VALUES
(1, 'Rover', 'Robot'),
(2, 'Rover', 'Robot'),
(3, 'Rover', 'Robot'),
(4, 'Rover', 'Robot'),
(5, 'Rover', 'Robot'),
(6, 'Rover', 'Robot'),
(7, 'Rover', 'Robot'),
(8, 'Rover', 'Robot'),
(9, 'Rover', 'Robot'),
(10, 'Rover', 'Robot');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fact_mission_performance`
--

CREATE TABLE `fact_mission_performance` (
  `fact_id` int NOT NULL,
  `mission_key` int DEFAULT NULL,
  `agency_key` int DEFAULT NULL,
  `spacecraft_key` int DEFAULT NULL,
  `destination_key` int DEFAULT NULL,
  `date_key` int DEFAULT NULL,
  `avg_temperature` decimal(5,2) DEFAULT NULL,
  `avg_signal_strength` decimal(5,2) DEFAULT NULL,
  `duration_days` int DEFAULT NULL,
  `mission_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `fact_mission_performance`
--

INSERT INTO `fact_mission_performance` (`fact_id`, `mission_key`, `agency_key`, `spacecraft_key`, `destination_key`, `date_key`, `avg_temperature`, `avg_signal_strength`, `duration_days`, `mission_status`) VALUES
(61, 1, 1, 1, 1, 20200730, -60.50, 90.20, 687, 'Ongoing'),
(62, 2, 1, 2, 2, 19690716, 21.50, 87.00, 8, 'Completed'),
(63, 3, 7, 3, 3, 20230315, 24.00, 95.00, 30, 'Completed'),
(64, 4, 3, 4, 2, 20230714, -10.50, 92.00, 40, 'Completed'),
(65, 5, 6, 5, 1, 20200723, -55.00, 88.70, 780, 'Ongoing'),
(66, 6, 2, 6, 5, 20181020, 150.00, 75.00, 2555, 'Ongoing'),
(67, 7, 4, 7, 3, 20240323, 22.00, 97.00, 180, 'Ongoing'),
(68, 8, 1, 8, 3, 20240606, 25.00, 94.00, 8, 'Completed'),
(69, 9, 7, 9, 3, 20230826, 21.00, 96.50, 180, 'Ongoing'),
(70, 10, 2, 10, 10, 20230414, -120.00, 85.00, 4380, 'Ongoing');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dim_agency`
--
ALTER TABLE `dim_agency`
  ADD PRIMARY KEY (`agency_key`);

--
-- Indeks untuk tabel `dim_date`
--
ALTER TABLE `dim_date`
  ADD PRIMARY KEY (`date_key`);

--
-- Indeks untuk tabel `dim_destination`
--
ALTER TABLE `dim_destination`
  ADD PRIMARY KEY (`destination_key`);

--
-- Indeks untuk tabel `dim_mission`
--
ALTER TABLE `dim_mission`
  ADD PRIMARY KEY (`mission_key`);

--
-- Indeks untuk tabel `dim_spacecraft`
--
ALTER TABLE `dim_spacecraft`
  ADD PRIMARY KEY (`spacecraft_key`);

--
-- Indeks untuk tabel `fact_mission_performance`
--
ALTER TABLE `fact_mission_performance`
  ADD PRIMARY KEY (`fact_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `fact_mission_performance`
--
ALTER TABLE `fact_mission_performance`
  MODIFY `fact_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
