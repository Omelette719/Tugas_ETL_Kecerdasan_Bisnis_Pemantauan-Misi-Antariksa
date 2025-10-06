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
-- Database: `space_mission_oltp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agencies`
--

CREATE TABLE `agencies` (
  `agency_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `founded_year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `agencies`
--

INSERT INTO `agencies` (`agency_id`, `name`, `country`, `founded_year`) VALUES
(1, 'NASA', 'USA', 1958),
(2, 'ESA', 'Europe', 1975),
(3, 'ISRO', 'India', 1969),
(4, 'Roscosmos', 'Russia', 1992),
(5, 'JAXA', 'Japan', 2003),
(6, 'CNSA', 'China', 1993),
(7, 'SpaceX', 'USA', 2002),
(8, 'Blue Origin', 'USA', 2000),
(9, 'Virgin Galactic', 'UK', 2004),
(10, 'Arianespace', 'France', 1980);

-- --------------------------------------------------------

--
-- Struktur dari tabel `crew_members`
--

CREATE TABLE `crew_members` (
  `crew_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `crew_members`
--

INSERT INTO `crew_members` (`crew_id`, `name`, `role`, `nationality`) VALUES
(1, 'Neil Armstrong', 'Commander', 'USA'),
(2, 'Buzz Aldrin', 'Pilot', 'USA'),
(3, 'Samantha Cristoforetti', 'Engineer', 'Italy'),
(4, 'Raja Chari', 'Commander', 'USA'),
(5, 'Yuri Gagarin', 'Pilot', 'Russia'),
(6, 'Sunita Williams', 'Engineer', 'USA'),
(7, 'Koichi Wakata', 'Engineer', 'Japan'),
(8, 'Zhai Zhigang', 'Commander', 'China'),
(9, 'Jessica Watkins', 'Scientist', 'USA'),
(10, 'Alexander Gerst', 'Engineer', 'Germany');

-- --------------------------------------------------------

--
-- Struktur dari tabel `destinations`
--

CREATE TABLE `destinations` (
  `destination_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `destinations`
--

INSERT INTO `destinations` (`destination_id`, `name`, `type`) VALUES
(1, 'Mars', 'Planet'),
(2, 'Moon', 'Moon'),
(3, 'International Space Station', 'Station'),
(4, 'Venus', 'Planet'),
(5, 'Mercury', 'Planet'),
(6, 'Low Earth Orbit', 'Orbit'),
(7, 'Sun', 'Star'),
(8, 'Asteroid Belt', 'Region'),
(9, 'Titan', 'Moon'),
(10, 'Jupiter', 'Planet');

-- --------------------------------------------------------

--
-- Struktur dari tabel `missions`
--

CREATE TABLE `missions` (
  `mission_id` int NOT NULL,
  `mission_name` varchar(100) DEFAULT NULL,
  `agency_id` int DEFAULT NULL,
  `spacecraft_id` int DEFAULT NULL,
  `destination_id` int DEFAULT NULL,
  `launch_date` date DEFAULT NULL,
  `duration_days` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `missions`
--

INSERT INTO `missions` (`mission_id`, `mission_name`, `agency_id`, `spacecraft_id`, `destination_id`, `launch_date`, `duration_days`, `status`) VALUES
(1, 'Mars 2020 Perseverance Rover', 1, 1, 1, '2020-07-30', 687, 'Ongoing'),
(2, 'Apollo 11', 1, 2, 2, '1969-07-16', 8, 'Completed'),
(3, 'ISS Supply Mission CRS-27', 7, 3, 3, '2023-03-15', 30, 'Completed'),
(4, 'Chandrayaan-3', 3, 4, 2, '2023-07-14', 40, 'Completed'),
(5, 'Tianwen-1', 6, 5, 1, '2020-07-23', 780, 'Ongoing'),
(6, 'BepiColombo Mercury Mission', 2, 6, 5, '2018-10-20', 2555, 'Ongoing'),
(7, 'Soyuz MS-25 Crew Transport', 4, 7, 3, '2024-03-23', 180, 'Ongoing'),
(8, 'Starliner Test Flight', 1, 8, 3, '2024-06-06', 8, 'Completed'),
(9, 'Crew-7 to ISS', 7, 9, 3, '2023-08-26', 180, 'Ongoing'),
(10, 'JUICE Mission to Jupiter', 2, 10, 10, '2023-04-14', 4380, 'Ongoing');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mission_crew`
--

CREATE TABLE `mission_crew` (
  `mission_id` int NOT NULL,
  `crew_id` int NOT NULL,
  `role_in_mission` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `mission_crew`
--

INSERT INTO `mission_crew` (`mission_id`, `crew_id`, `role_in_mission`) VALUES
(2, 1, 'Commander'),
(2, 2, 'Pilot'),
(3, 3, 'Engineer'),
(4, 8, 'Commander'),
(7, 5, 'Pilot'),
(8, 6, 'Engineer'),
(9, 4, 'Commander'),
(9, 7, 'Engineer'),
(9, 9, 'Scientist'),
(10, 10, 'Engineer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spacecrafts`
--

CREATE TABLE `spacecrafts` (
  `spacecraft_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `spacecrafts`
--

INSERT INTO `spacecrafts` (`spacecraft_id`, `name`, `type`, `manufacturer`) VALUES
(1, 'Perseverance', 'Rover', 'Jet Propulsion Laboratory'),
(2, 'Apollo 11', 'Shuttle', 'North American Aviation'),
(3, 'Dragon Capsule', 'Capsule', 'SpaceX'),
(4, 'Chandrayaan-3 Lander', 'Lander', 'ISRO'),
(5, 'Tianwen-1 Orbiter', 'Orbiter', 'CNSA'),
(6, 'BepiColombo', 'Orbiter', 'ESA & JAXA'),
(7, 'Soyuz MS-25', 'Capsule', 'RKK Energia'),
(8, 'Starliner', 'Capsule', 'Boeing'),
(9, 'Crew Dragon Endurance', 'Capsule', 'SpaceX'),
(10, 'JUICE', 'Orbiter', 'ESA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `telemetry_data`
--

CREATE TABLE `telemetry_data` (
  `telemetry_id` int NOT NULL,
  `mission_id` int DEFAULT NULL,
  `record_time` datetime DEFAULT NULL,
  `temperature` decimal(5,2) DEFAULT NULL,
  `radiation_level` decimal(5,2) DEFAULT NULL,
  `signal_strength` decimal(5,2) DEFAULT NULL,
  `battery_level` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `telemetry_data`
--

INSERT INTO `telemetry_data` (`telemetry_id`, `mission_id`, `record_time`, `temperature`, `radiation_level`, `signal_strength`, `battery_level`) VALUES
(1, 1, '2024-01-01 12:00:00', -60.50, 3.40, 90.20, 85.00),
(3, 3, '2023-05-13 10:00:00', 24.00, 1.20, 95.00, 99.00),
(4, 4, '2023-08-01 08:00:00', -10.50, 2.00, 92.00, 96.00),
(5, 5, '2022-06-01 15:00:00', -55.00, 3.90, 88.70, 82.50),
(6, 6, '2024-01-01 09:00:00', 150.00, 5.60, 75.00, 80.00),
(7, 7, '2024-03-25 12:00:00', 22.00, 1.10, 97.00, 99.50),
(8, 8, '2024-06-07 14:00:00', 25.00, 1.50, 94.00, 98.00),
(9, 9, '2024-04-01 09:00:00', 21.00, 1.00, 96.50, 99.20),
(10, 10, '2024-02-10 10:00:00', -120.00, 4.20, 85.00, 87.00),
(12, 2, '1969-07-18 12:00:00', 21.50, 2.10, 87.00, 94.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`agency_id`);

--
-- Indeks untuk tabel `crew_members`
--
ALTER TABLE `crew_members`
  ADD PRIMARY KEY (`crew_id`);

--
-- Indeks untuk tabel `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`destination_id`);

--
-- Indeks untuk tabel `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`mission_id`),
  ADD KEY `agency_id` (`agency_id`),
  ADD KEY `spacecraft_id` (`spacecraft_id`),
  ADD KEY `destination_id` (`destination_id`);

--
-- Indeks untuk tabel `mission_crew`
--
ALTER TABLE `mission_crew`
  ADD PRIMARY KEY (`mission_id`,`crew_id`),
  ADD KEY `crew_id` (`crew_id`);

--
-- Indeks untuk tabel `spacecrafts`
--
ALTER TABLE `spacecrafts`
  ADD PRIMARY KEY (`spacecraft_id`);

--
-- Indeks untuk tabel `telemetry_data`
--
ALTER TABLE `telemetry_data`
  ADD PRIMARY KEY (`telemetry_id`),
  ADD KEY `mission_id` (`mission_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agencies`
--
ALTER TABLE `agencies`
  MODIFY `agency_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `crew_members`
--
ALTER TABLE `crew_members`
  MODIFY `crew_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `destinations`
--
ALTER TABLE `destinations`
  MODIFY `destination_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `missions`
--
ALTER TABLE `missions`
  MODIFY `mission_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `spacecrafts`
--
ALTER TABLE `spacecrafts`
  MODIFY `spacecraft_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `telemetry_data`
--
ALTER TABLE `telemetry_data`
  MODIFY `telemetry_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `missions`
--
ALTER TABLE `missions`
  ADD CONSTRAINT `missions_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`agency_id`),
  ADD CONSTRAINT `missions_ibfk_2` FOREIGN KEY (`spacecraft_id`) REFERENCES `spacecrafts` (`spacecraft_id`),
  ADD CONSTRAINT `missions_ibfk_3` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`destination_id`);

--
-- Ketidakleluasaan untuk tabel `mission_crew`
--
ALTER TABLE `mission_crew`
  ADD CONSTRAINT `mission_crew_ibfk_1` FOREIGN KEY (`mission_id`) REFERENCES `missions` (`mission_id`),
  ADD CONSTRAINT `mission_crew_ibfk_2` FOREIGN KEY (`crew_id`) REFERENCES `crew_members` (`crew_id`);

--
-- Ketidakleluasaan untuk tabel `telemetry_data`
--
ALTER TABLE `telemetry_data`
  ADD CONSTRAINT `telemetry_data_ibfk_1` FOREIGN KEY (`mission_id`) REFERENCES `missions` (`mission_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
