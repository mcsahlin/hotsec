-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2023 at 11:16 PM
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
-- Database: `hotsec`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `size` varchar(10) NOT NULL,
  `about` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `seller_id` int(11) NOT NULL,
  `sold` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `price`, `size`, `about`, `created_at`, `seller_id`, `sold`) VALUES
(1, 'Ullas gamla klänningar. 5 för 1', 50.00, 'XL', 'Blomstra som statsguld i sommar med klännignar för huset Löfven!', '2023-09-04 18:05:15', 1, 1),
(6, 'Svindyr skjorta, blå', 450.00, 'XL', 'Skjortan Stefan Löfven bar när han blev vald till statsminister. ', '2023-09-04 18:02:43', 2, 1),
(7, 'Sean-Åke', 455.50, '46', 'Kanonsko från Ullared, knappt använd.', '2023-09-05 03:34:44', 3, 0),
(8, 'Jumper', 19.50, 'S', 'Fantastisk upplevelse att leva i. Perfekt!.', '2023-09-05 07:34:01', 4, 0),
(9, 'Ladustrumpor från Italien', 1499.99, 'XS', 'Må som du förtjänar i ett par ökända strumpor från italien!', '2023-09-05 07:36:44', 4, 0),
(10, 'Gulgrön Kavaj', 365.50, 'XXL', 'Gulgrönkavaj från Smuckenbergh.', '2023-09-07 22:13:51', 5, 0),
(11, 'Svart halsduk', 65.50, 'One-size', 'Svart yllehalsduk med randiga ränder från kabanoss.', '2023-09-07 22:14:35', 6, 0),
(12, 'Rosa stövlar', 795.99, '47', 'Knallrosa stövlar för den som är beredd att kliva ut på åkern med stil. Kom och köp!.', '2023-09-07 22:15:34', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_events`
--

CREATE TABLE `item_events` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `tel` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `firstname`, `lastname`, `tel`) VALUES
(1, 'Stefan', 'Löfven', '0700133337'),
(2, 'Ulla', 'Löfven', '0731556677'),
(3, 'Maggan', 'Andersson', '0700000112'),
(4, 'Bruce', 'Willis', '0766996611'),
(5, 'Ernst', 'Johnson', '0812312312'),
(6, 'Jocke', 'Ålman', '021123123');

-- --------------------------------------------------------

--
-- Table structure for table `seller_events`
--

CREATE TABLE `seller_events` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_FK_1` (`item_id`) USING BTREE,
  ADD KEY `events_FK_2` (`seller_id`) USING BTREE;

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seller_id` (`seller_id`);

--
-- Indexes for table `item_events`
--
ALTER TABLE `item_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_events_FK_1` (`item_id`),
  ADD KEY `item_events_FK_2` (`event_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_events`
--
ALTER TABLE `seller_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_events_FK_1` (`seller_id`),
  ADD KEY `seller_events_FK_2` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `item_events`
--
ALTER TABLE `item_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `seller_events`
--
ALTER TABLE `seller_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_FK_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`),
  ADD CONSTRAINT `events_FK_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`);

--
-- Constraints for table `item_events`
--
ALTER TABLE `item_events`
  ADD CONSTRAINT `item_events_FK_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_events_FK_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `seller_events`
--
ALTER TABLE `seller_events`
  ADD CONSTRAINT `seller_events_FK_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`),
  ADD CONSTRAINT `seller_events_FK_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
