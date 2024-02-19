-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2024 at 11:18 PM
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
-- Database: `canteen`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `product_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`product_id`, `ip_address`, `quantity`) VALUES
(1, '::1', 5),
(3, '::1', 0),
(7, '::1', 5);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(1, 'Snacks'),
(2, 'Hot Drinks'),
(3, 'Chinese Corner'),
(4, 'Dosa Corner'),
(5, 'Chat Items'),
(6, 'Cold Drinks'),
(7, 'Frankie'),
(8, 'Ice creams');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(100) NOT NULL,
  `product_desciption` varchar(255) NOT NULL,
  `product_keywords` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_desciption`, `product_keywords`, `category_id`, `product_image`, `product_price`, `date`, `status`) VALUES
(1, 'Tea', 'A soothing, aromatic beverage ', 'Tea,Chai,hot drinks,hot,drinks', 2, 'tea.jpg', '15', '2024-02-09 19:54:20', 'true'),
(2, 'vadapav', 'Delight, consisting of a spiced potato vada sandwiched between a soft pav.', 'vadapav,Snacks,Vadapav', 1, 'vadapav.jpg', '13', '2024-02-09 19:50:22', 'true'),
(3, 'Misal pav', 'Misal Pav is a flavorful and spicy curry made from sprouted moth beans or mixed legumes, simmered in a fiery gravy of spices.', 'misal pav,Misal pav,Snacks', 1, 'misalpav.jpg', '30', '2024-02-09 19:50:52', 'true'),
(4, 'Masala Dosa', 'South Indian delicacy consisting of a thin, crispy crepe made from fermented rice and lentil batter, generously filled with a flavorful spiced potato mixture', 'masala dosa,Masala Dosa,dosa corner', 4, 'Masala-Dosa.jpg', '30', '2024-02-08 09:04:45', 'true'),
(5, 'Veg Fried rice', 'Fragrant Basmati rice wok-tossed with a medley of colorful vegetables, aromatic spices, and a hint of tangy sauce', 'veg fried rice,Fried rice,chinese corner', 3, 'friedrice.jpg', '50', '2024-02-08 09:04:50', 'true'),
(6, 'Bhel puri', 'Refreshing and light, bhelpuri offers a delightful combination of sweet, sour, tangy, and spicy flavors', 'bhel puri,Bhel puri,chat items', 5, 'bhelpuri.jpg', '20', '2024-02-09 19:53:34', 'true'),
(7, 'Butter Milk', 'Refreshing and tangy buttermilk, a traditional Indian beverage made from yogurt. ', 'butter milk,Buttermilk,Butter milk,cold drink', 6, 'buttermilk.jpg', '10', '2024-02-09 19:53:55', 'true');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
