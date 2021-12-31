-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2021 at 11:06 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nti_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `streat` varchar(50) NOT NULL,
  `building` int(3) NOT NULL,
  `floor` int(2) NOT NULL,
  `flat` int(3) NOT NULL,
  `notes` varchar(100) NOT NULL DEFAULT 'none',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `users_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `image` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `catagories`
--

CREATE TABLE `catagories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` int(11) NOT NULL,
  `name_ar` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` mediumint(50) DEFAULT NULL,
  `discount` int(5) NOT NULL,
  `discount_type` varchar(50) NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `max_discount_val` int(5) NOT NULL,
  `min_discount_val` int(5) NOT NULL,
  `max_usge_number` int(3) NOT NULL,
  `max_usge_number_per_user` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(100) NOT NULL,
  `title_ar` int(100) NOT NULL,
  `discount` int(5) NOT NULL,
  `image` varchar(50) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` bigint(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `total_price` decimal(7,2) NOT NULL,
  `deliever_date` datetime NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `coupons_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `quantity` smallint(3) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL,
  `desc_en` longtext NOT NULL,
  `desc_ar` longtext NOT NULL,
  `image` varchar(50) NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `subcatagory_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_offers`
--

CREATE TABLE `products_offers` (
  `id_products` bigint(20) UNSIGNED NOT NULL,
  `id_offers` bigint(20) UNSIGNED NOT NULL,
  `price_after_disc` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_orders`
--

CREATE TABLE `products_orders` (
  `id_products` bigint(20) UNSIGNED NOT NULL,
  `id_orders` bigint(20) UNSIGNED NOT NULL,
  `price_after_order` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cities_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subcatagories`
--

CREATE TABLE `subcatagories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `catagories_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `image` varchar(50) DEFAULT 'default.jpg',
  `code` mediumint(5) DEFAULT NULL,
  `gender` enum('m','f') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_users_fk` (`users_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catagories`
--
ALTER TABLE `catagories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_address_fk` (`address_id`),
  ADD KEY `orders_coupons_fk` (`coupons_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brands_fk` (`brand_id`),
  ADD KEY `produtcs_subcatagory_fk` (`subcatagory_id`);

--
-- Indexes for table `products_offers`
--
ALTER TABLE `products_offers`
  ADD KEY `products_offers_offers_fk` (`id_offers`),
  ADD KEY `products_offers_products_fk` (`id_products`);

--
-- Indexes for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD KEY `produtcs_orders_orders_fk` (`id_orders`),
  ADD KEY `produtcs_orders_products_fk` (`id_products`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regions_address_fk` (`address_id`),
  ADD KEY `regions_cities_fk` (`cities_id`);

--
-- Indexes for table `subcatagories`
--
ALTER TABLE `subcatagories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcatagories_catagories_fk` (`catagories_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catagories`
--
ALTER TABLE `catagories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcatagories`
--
ALTER TABLE `subcatagories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_users_fk` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `orders_coupons_fk` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brands_fk` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `produtcs_subcatagory_fk` FOREIGN KEY (`subcatagory_id`) REFERENCES `subcatagories` (`id`);

--
-- Constraints for table `products_offers`
--
ALTER TABLE `products_offers`
  ADD CONSTRAINT `products_offers_offers_fk` FOREIGN KEY (`id_offers`) REFERENCES `offers` (`id`),
  ADD CONSTRAINT `products_offers_products_fk` FOREIGN KEY (`id_products`) REFERENCES `products` (`id`);

--
-- Constraints for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD CONSTRAINT `produtcs_orders_orders_fk` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `produtcs_orders_products_fk` FOREIGN KEY (`id_products`) REFERENCES `products` (`id`);

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_address_fk` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `regions_cities_fk` FOREIGN KEY (`cities_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `subcatagories`
--
ALTER TABLE `subcatagories`
  ADD CONSTRAINT `subcatagories_catagories_fk` FOREIGN KEY (`catagories_id`) REFERENCES `catagories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
