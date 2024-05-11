-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2024 at 08:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ibm-express-final`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(20) NOT NULL,
  `ISBN` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `ISBN`, `title`, `author`, `createdAt`, `updatedAt`) VALUES
(1, '978-0-385-15806-0', 'To Kill a Mockingbird', 'Harper Lee', '2024-05-07 05:43:09', NULL),
(2, '978-3-16-148410-0', 'Crime and Punishment', 'Fyodor Dostoevsky', '2024-05-07 05:43:09', NULL),
(3, '978-0-618-34697-4', 'The Catcher in the Rye', 'J.D. Salinger', '2024-05-07 05:43:09', NULL),
(4, '978-0-545-01022-6', 'The Great Gatsby', 'F. Scott Fitzgerald', '2024-05-07 05:43:09', NULL),
(5, '978-0-15-688180-7', 'One Hundred Years of Solitude', 'Gabriel Garcia Marquez', '2024-05-07 05:43:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(20) NOT NULL,
  `userId` int(20) NOT NULL,
  `bookId` int(20) NOT NULL,
  `review_text` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `userId`, `bookId`, `review_text`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, 'This book was amazing! I couldn\'t put it down.', '2024-05-07 05:57:54', NULL),
(2, 2, 3, 'I found this book quite boring. Not recommended.', '2024-05-07 05:57:54', NULL),
(3, 3, 2, 'One of the best books I have ever read.', '2024-05-07 05:57:54', NULL),
(4, 4, 4, 'The characters were so well developed. A must-read!', '2024-05-07 05:57:54', NULL),
(5, 5, 5, 'I couldn\'t understand the plot of this book. Disappointing.', '2024-05-07 05:57:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'user1', '$2b$05$wJhOdJqd6Dg0C6WnSbDa7eCzen1HdcDADN51GWeV4gKPNmUiFf2VO', '2024-05-07 06:03:36', '2024-05-07 06:03:36'),
(2, 'user2', '$2b$05$TEXZFeozc6f7O1QZX60bieXMLCMj41leVj6NdSY4FN8GGSCVKu1Ga', '2024-05-07 06:03:44', '2024-05-07 06:03:44'),
(3, 'user3', '$2b$05$HVGE0grx4LgUImKd.bMlSurWzi2O0iV2KuJT6Y8RO/q7nBbhuknsu', '2024-05-07 06:03:47', '2024-05-07 06:03:47'),
(4, 'user4', '$2b$05$CVNKHvjPm1Runo9LUb6GCO7BfrxQRf02WMOd4z8fFBttDsGuNRZbS', '2024-05-07 06:03:50', '2024-05-07 06:03:50'),
(5, 'user5', '$2b$05$ASrMfoRHhtADP01PzZj9xuvnwcT8mhuq/ZuK.mlA9tu8pxicUZ6EC', '2024-05-07 06:03:53', '2024-05-07 06:03:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_book_id` FOREIGN KEY (`BookId`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
