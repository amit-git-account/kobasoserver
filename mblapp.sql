-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 30, 2020 at 04:03 AM
-- Server version: 5.6.47-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mblapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `application_logs`
--

CREATE TABLE `application_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `section` varchar(240) DEFAULT NULL,
  `action` varchar(200) DEFAULT NULL,
  `item` varchar(200) DEFAULT NULL,
  `action_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application_logs`
--

INSERT INTO `application_logs` (`id`, `user_id`, `section`, `action`, `item`, `action_time`, `created_at`) VALUES
(1, 3, 'Store', 'update', '1', '2019-12-21 14:36:28', NULL),
(2, 3, 'Store', 'update', '1', '2019-12-21 14:37:05', NULL),
(3, 3, 'Store', 'update', '1', '2019-12-21 14:38:21', NULL),
(4, 3, 'Store', 'update', '1', '2019-12-21 14:38:29', NULL),
(5, 3, 'Item', 'update', '2', '2019-12-21 18:15:37', NULL),
(6, 3, 'Store', 'update', '1', '2020-01-26 17:55:54', NULL),
(7, 3, 'Store', 'update', '1', '2020-01-26 17:57:00', NULL),
(8, 3, 'Store', 'update', '1', '2020-01-26 17:57:23', NULL),
(9, 3, 'Item', 'update', '2', '2020-01-26 18:06:41', NULL),
(10, 3, 'Item', 'update', '2', '2020-01-26 18:06:45', NULL),
(11, 3, 'Item', 'update', '3', '2020-02-06 17:52:21', NULL),
(12, 12, 'Item', 'update', '18', '2020-02-07 14:14:54', NULL),
(13, 12, 'Item', 'update', '18', '2020-02-14 04:19:48', NULL),
(14, 12, 'Item', 'update', '16', '2020-03-08 05:08:59', NULL),
(15, 12, 'Item', 'update', '24', '2020-03-08 05:10:03', NULL),
(16, 2, 'Item', 'update', '26', '2020-03-19 18:28:39', NULL),
(17, 15, 'Item', 'update', '30', '2020-04-28 17:38:10', NULL),
(18, 15, 'Item', 'update', '30', '2020-04-28 17:38:23', NULL),
(19, 15, 'Item', 'update', '30', '2020-04-28 17:40:16', NULL),
(20, 15, 'Item', 'update', '30', '2020-04-28 17:41:19', NULL),
(21, 15, 'Item', 'update', '30', '2020-04-28 17:41:30', NULL),
(22, 1, 'Item', 'update', '5', '2020-05-15 23:50:15', NULL),
(23, 1, 'Item', 'update', '100', '2020-06-28 02:16:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_enterprise_detail`
--

CREATE TABLE `data_enterprise_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enterprise_currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INR',
  `enterprise_display_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'enterprise_default_display.png',
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_enterprise_detail`
--

INSERT INTO `data_enterprise_detail` (`id`, `user_id`, `title`, `description`, `address`, `city`, `state`, `zip`, `country`, `enterprise_currency`, `enterprise_display_image`, `latitude`, `longitude`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Chaat Bhavan', 'Best Home for Indian Vegeterian Food', '976 E El Camino Real', 'Sunnyvale', 'California', '94087', 'USA', '$', 'chaat_bhavan.png', '37.351860', '-122.009209', 1, '2019-12-21 09:04:11', '2020-01-26 12:27:23'),
(2, 2, 'Pasha', 'PASHA MEDITERRANEAN & HOOKAH LOUNGE\r\n\r\n\r\n37.48575\r\n-122.22779\r\n', '837 Jefferson Ave, Redwood City', 'Redwood City', 'California', '94063', 'USA', '$', 'pasha.png', '37.53862', '-122.24979', 1, '2019-12-21 09:04:11', '2020-01-26 12:27:23'),
(3, 3, 'Band of Bohemia', 'A CULINARY BREWHOUSE\r\nThe First Michelin Starred Brewpub', '4710 N Ravenswood Ave', 'Chicago', 'Illionis', '60640', 'USA', '$', 'band_bohemia.png', '41.96761', '87.6751', 1, '2019-12-21 09:04:11', '2020-01-26 12:27:23'),
(4, 4, 'Area Four', 'THIS IS REAL FOOD. FROM THE OVEN.', '500 Technology Square, Cambridge', 'Cambridge', 'Massachusetts', '02139', 'USA', '$', 'area_four.png', '42.3629', '-71.09252', 1, '2019-12-21 09:04:11', '2020-01-26 12:27:23'),
(5, 5, 'Junoon', 'Michelin Starred', '27 W 24th St', 'New York City', 'New York', '10010', 'USA', '$', 'junoon.png', '40.74304', '-73.99105', 1, '2019-12-21 09:04:11', '2020-01-26 12:27:23'),
(6, 6, 'I Sacked Newton', 'We create delicious experiences', '5th floor Logix mall, Wave City Center, Sector 32', 'Noida', '', '94087', 'India', '₹', 'i_sacked_newton.png', '28.579195', '77.350448', 1, '2019-12-21 09:04:11', '2020-01-26 12:27:23'),
(7, 7, 'Pind Balluchi', 'True Flavours of Northern India', 'Sector 29, Leisure Valley', 'Gurgaon', 'Haryana', '122001', 'India', '₹', 'pind_balluchi.png', '28.4729', '77.06606', 1, NULL, NULL),
(8, 8, 'Leopold Cafe', 'This old-school cafe/bar dating to 1871 serves Continental, Chinese & Indian snacks, plus cocktails', 'Colaba Causeway', 'Mumbai', 'Maharashtra', '400001', 'India', '₹', 'leopold_cafe.png', '18.924650', '72.832190', 1, '2019-12-21 09:04:11', '2020-01-26 12:27:23'),
(9, 9, 'Deccan Harvest', 'Eat. Drink. Socialize.', '143, Tower No.1, Cybercity, Magarpatta, Hadapsar', 'Pune', 'Maharashtra', '411028', 'India', '₹', 'deccan_harvest.png', '18.51526', '73.93278', 1, NULL, NULL),
(10, 10, 'Sahib Sindh Sultan', 'North Indian cuisine, cocktails and wine served in an upscale setting with a retro train carriage.', 'Forum Mall, 2nd Floor, Koramangala', 'Bangalore', 'Karnataka', '560029', 'India', '₹', 'sahib_sindh_sultan.png', '12.93798', '77.61053', 1, NULL, NULL),
(11, 11, 'Radhika Beauty Salon', 'Radhika Beauty Salon', '1810 El Camino Real, Redwood City', 'Redwood City', 'California', '94063', 'USA', '$', 'radhika_beauty_salon.png', '37.478000', '-122.224530', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_food_category`
--

CREATE TABLE `data_food_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `food_short_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `food_description` text COLLATE utf8mb4_unicode_ci,
  `food_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default_food_image.png',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_food_category`
--

INSERT INTO `data_food_category` (`id`, `food_short_name`, `food_description`, `food_image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'BreakFast', 'BreakFast', 'default.png', 1, NULL, NULL),
(2, 'Lunch', 'Lunch', 'default.png', 1, NULL, NULL),
(3, 'Dinner', 'Dinner', 'default.png', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_food_item_detail`
--

CREATE TABLE `data_food_item_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `enterprise_id` int(11) NOT NULL,
  `food_category_id` int(11) NOT NULL,
  `food_short_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `food_description` text COLLATE utf8mb4_unicode_ci,
  `price_with_tax` decimal(8,2) DEFAULT NULL,
  `price_without_tax` decimal(8,2) DEFAULT NULL,
  `food_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `price_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'USD',
  `is_fav` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_food_item_detail`
--

INSERT INTO `data_food_item_detail` (`id`, `user_id`, `enterprise_id`, `food_category_id`, `food_short_name`, `food_description`, `price_with_tax`, `price_without_tax`, `food_image`, `price_currency`, `is_fav`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'Gajar Halwa', 'Shredded carrots pudding mixed with nuts and dried fruits', '6.00', '5.00', 'default.png', 'USD', 1, 1, NULL, '2020-02-07 00:52:21'),
(4, 1, 1, 3, 'Mix Vegetable Sabzi', 'Fresh mixed vegetables cooked with ginger, garlic, tomato and spices', '6.00', '4.50', 'default.png', 'USD', 0, 1, NULL, NULL),
(5, 3, 1, 1, 'Pizza', 'This is Product Description.', '10.00', '6.90', 'default.png', 'USD', 1, 1, '2020-01-26 12:31:07', '2020-05-16 06:50:15'),
(12, 1, 2, 2, 'Lahmacun', 'Flatbread topped with ground lamb and chopped garden vegetables', '14.00', '10.00', 'default.png', 'USD', 0, 1, '2020-02-06 16:17:22', NULL),
(13, 3, 1, 1, 'Matter Paneer', 'Home-made cheese cooked in special gravy with green peas', '5.00', '4.00', 'default.png', 'USD', 0, 1, '2020-02-07 00:29:07', '2020-02-07 00:29:07'),
(14, 2, 1, 1, 'Aloo Palak Masala', 'Potatoes and fresh spinach cooked together with spices', '25.50', '18.20', 'default.png', 'USD', 0, 1, '2020-02-07 00:00:24', '2020-02-07 00:00:24'),
(16, 9, 1, 1, 'Faluda Drink', 'Rose flavored milk with ice cream, vermicelli and nuts', '36.00', '19.30', 'default.png', 'USD', 0, 1, '2020-02-07 00:00:24', '2020-03-08 12:08:59'),
(18, 12, 5, 1, 'Cheese Vegetarian Pizza', 'Cheesy Pizza with Olives, Capsicum, Onions, Tomato', '6.80', '5.35', 'default.png', 'USD', 0, 1, '2020-02-07 00:00:24', '2020-02-14 11:19:48'),
(20, 12, 5, 3, 'Seasonal Salad', 'Market greens dressed in tangy herb yoghurt with bindi and pickled onions', '10.00', '9.00', 'default.png', 'USD', 0, 1, '2020-02-14 09:59:11', '2020-02-14 09:59:11'),
(21, 12, 5, 3, 'General Tsao’s Cauliflower', 'Indian Chinese style cauliflower in a tomato chili sauce, chives and sesame seeds', '9.00', '8.00', 'default.png', 'USD', 0, 1, '2020-02-14 10:23:36', '2020-02-14 10:23:36'),
(22, 12, 5, 2, 'Onion Bhaji', 'Red onion pakoras topped with whipped homemade yoghurt and chutneys', '7.00', '6.00', 'default.png', 'USD', 0, 1, '2020-02-14 10:24:45', '2020-02-14 10:24:45'),
(23, 12, 5, 3, 'Samosa', 'Savory flaky pastry stuffed with cumin seasoned potatoes and peas', '6.00', '5.00', 'default.png', 'USD', 0, 1, '2020-02-14 10:25:33', '2020-02-14 10:25:33'),
(25, 12, 4, 2, 'Plain Dosa', 'Cheese', '11.00', '10.00', 'default.png', 'USD', 0, 1, '2020-03-08 12:31:40', '2020-03-08 12:31:40'),
(26, 12, 6, 2, 'Lamb and Beef Gyros Wrap', 'Lettuce, tomato, cucumber, onion and tzatziki sauce. Served on lavash bread.', '190.00', '190.00', 'default.png', 'INR', 1, 1, '2020-03-08 12:31:40', '2020-03-08 12:31:40'),
(27, 12, 6, 2, 'Classic Hummus', 'Chickpeas, imported Tahini, lemon juice, garlic and spices. Served with pita bread. Gluten free.', '290.00', '290.00', 'default.png', 'INR', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 3, 1, 1, 'Vegetable Burger', 'Indian style burger with potato fries and choice of soda', '10.00', '6.90', 'default.png', 'USD', 1, 1, '2020-04-27 13:39:55', '2020-04-27 13:39:55'),
(29, 3, 1, 1, 'Bombay Vada Pav', 'Spiced potato patty sandwiched between two slices of pav served with chutneys', '3.90', '3.60', 'default.png', 'USD', 0, 1, '2020-04-27 13:40:41', '2020-04-27 13:40:41'),
(30, 15, 1, 1, 'Masala Chaat', 'Crispy flat wafers layered with vegetables, topped with chutney, sev and chaat masala', '16.00', '14.00', 'default.png', 'USD', 1, 1, '2020-04-29 00:35:54', '2020-04-29 00:41:30'),
(31, 15, 1, 1, 'Aloo Tikki with Chana', 'Spiced potato patty served with garbanzo curry and chutneys', '16.00', '14.00', 'default.png', 'USD', 0, 1, '2020-04-29 00:35:54', '2020-04-29 00:41:30'),
(32, 15, 1, 1, 'Samosa', 'Triangular crispy shell stuffed with spiced potatoes, peas, coriander and served with chutney', '16.00', '14.00', 'default.png', 'USD', 1, 1, '2020-04-29 00:35:54', '2020-04-29 00:41:30'),
(33, 16, 2, 3, 'Lahmacun', 'Flatbread topped with ground lamb and chopped garden vegetables', '14.00', '14.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 17, 2, 3, 'Mix Grill Plate', 'Kofte, chicken kebab, beef kebab, lamb and beef gyros and chicken gyros', '17.95', '17.95', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 18, 2, 3, 'Chicken Gyros Plate', 'Slow cooked, thinly sliced, marinated chicken', '13.45', '13.45', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 19, 2, 3, 'Chicken Kebab Plate', 'Herbed marinated chicken breast cubes', '14.45', '14.45', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 20, 2, 3, 'Baba Ghanoush', 'Smoked eggplant, Tahini, mint, garlic and lemon. Served with pita bread. Gluten free', '6.95', '6.95', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 21, 2, 3, 'Appetizer Combo Plate', 'Hummus,baba ghanoush, thatziki, muhammara, dolma and falafel. Served with pita bread', '14.95', '14.95', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 22, 3, 3, 'Green Goddess & Avocado Salad', 'Brioche, arugula, poached egg, lime', '14.00', '14.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 23, 3, 3, 'Scallop Crudo', 'Pickled mussels, gigante bean pur', '16.00', '16.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 24, 3, 3, 'BoB Pocket', 'red bell pepper filling, goat cheese icing, chicken liver mousse', '14.00', '14.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 25, 3, 3, 'Biscuit and Cheese', 'Sesame biscuit, shishito cheese, fried egg', '13.00', '13.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 26, 3, 3, 'Bello Sando', 'Fried portobello mushroom, shiitake bread, apple katsu sauce', '13.00', '13.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 27, 4, 3, 'Shaved Brussels Sprout and Kale Salad', 'With hazelnuts, red onion, and pecorino with lemon vinaigrette', '12.00', '12.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 28, 4, 3, 'Pineapple Carrot Cake Parfait', 'Fresh baked carrot cake, fire-roasted pineapple, orange, marscapone cream, almonds', '7.00', '7.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 29, 4, 3, 'Milbrant Cabernet Sauvignon', 'Bottle of 2018 Milbrandt Cabernet Sauvignon', '18.00', '18.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 30, 4, 3, 'Guinness Irish Stout 4.2%', 'Smooth, creamy, balanced. Four pack of 16oz cans', '7.00', '7.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 31, 4, 3, 'Gluten Free Brownie', 'Gluten Free Brownie with cheesecake swirl. 1 per order', '3.00', '3.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 32, 5, 3, 'LITTI CHONKA', 'mustard seasoned root vegetables,\nstuffed wheat bread, tomato and green chili chutney', '16.50', '16.50', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 33, 5, 3, 'LAHSOONI GOBI', 'crispy cauliflower, tomato-garlic chili chutney', '16.50', '16.50', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 34, 5, 3, 'LAL MIRCH KA PANEER', 'house made cheese, apple ginger chutney, apple fennel salad', '18.50', '18.50', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 35, 5, 3, 'ARTICHOKE MATTAR', 'sunchoke, artichoke hearts, green peas, tomato sauce, fenugreek', '25.00', '25.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 36, 5, 3, 'NIZAMI PANEER', 'stuffed paneer, cranberry, almonds, khoya, tomato sauce', '25.00', '25.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 37, 5, 3, 'MURGH LABABDAR', 'tandoor grilled chicken, tomato sauce, fenugreek', '34.00', '34.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 38, 5, 3, 'YELLOW DAAL TADKA', 'masoor, channa, toor daal, green chili', '18.75', '18.75', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 39, 6, 3, 'Manchow Chicken', '', '265.00', '265.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 40, 6, 3, 'Manchow Veg', '', '225.00', '225.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 41, 6, 3, 'Hot and Sour Veg', '', '225.00', '225.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 42, 6, 3, 'How and Sour Chicken', '', '265.00', '265.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 43, 6, 3, 'Potato Bombs', 'Mashed potato balls, corn, cheese and chilli served with bbq sauce', '345.00', '345.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 44, 6, 3, 'Masala Peanut', 'Peanuts merged with tomato, onions, green chillies coriander and tangy tamarind sauce', '275.00', '275.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 45, 6, 3, 'Sev Puri Chaat', 'Sev poori chaat served in vermicelli baskets with tangy tamarind sauce and mint sauce', '295.00', '295.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 46, 7, 3, 'Makki de Kebab (6 pcs)', '', '219.00', '219.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 47, 7, 3, 'Dahi De Kebab (6 pcs)', '', '259.00', '259.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 48, 7, 3, 'Mixed Vegetable', '', '219.00', '219.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 49, 7, 3, 'Paneer Lababdar', '', '259.00', '259.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 50, 7, 3, 'Malai Kofta', '', '259.00', '259.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 51, 7, 3, 'Murg Tikka (6 pcs)', '', '299.00', '299.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 52, 7, 3, 'Tandoori Roti', '', '24.00', '24.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 53, 7, 3, 'Pudina Paratha', '', '48.00', '48.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 54, 7, 3, 'Plain Rice', '', '149.00', '149.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 55, 7, 3, 'Boondi Raita', '', '69.00', '69.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 56, 7, 3, 'Mix Veg Raita', '', '79.00', '79.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 57, 8, 3, 'Chicken Teriyaki Soup', '', '150.00', '150.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 58, 8, 3, 'Clear Soup Veg', '', '127.00', '127.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 59, 8, 3, 'Clear Soup Chicken', '', '150.00', '150.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 60, 8, 3, 'Clear Soup Prawns', '', '164.00', '164.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 61, 8, 3, 'Veg. Chow Chow', '', '382.00', '382.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 62, 8, 3, 'Veg Manchurian', '', '382.00', '382.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 63, 8, 3, 'Veg. Garlic Fried Rice', '', '382.00', '382.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 64, 8, 3, 'Butter Roti', '', '82.00', '82.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 65, 8, 3, 'Hot Chocolate', '', '90.00', '90.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 66, 9, 3, 'Crispy Corn', 'Spiced oriental snack made by frying sweet corn kernels', '260.00', '260.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 67, 9, 3, 'Cottage Cheese Hot Pan', 'Light healty oriental appetizer', '260.00', '260.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 68, 9, 3, 'Thai Manchurian', 'Fusion version of Manchurian recipe', '260.00', '260.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 69, 9, 3, 'Green Salad', 'Classical mix veg green salad', '160.00', '160.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 70, 9, 3, 'Caesar Salad', 'Olives, lettuce topped with crisp croutons tossed in house made caeser dressing ', '160.00', '160.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 71, 9, 3, 'Phad Thai Veg', '', '260.00', '260.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 72, 9, 3, 'Phad Thai Chicken', '', '285.00', '285.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 73, 9, 3, 'Phad Thai Prawns', '', '310.00', '310.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 74, 10, 3, 'Tandoori Kalimirch Chaat', 'A shashlik of peppers, paneer and sweet potato, spiced with crushed pepper corns', '285.00', '285.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 75, 10, 3, 'Tandoori Gobhi aur Broccoli', 'A duet of flowers marinated and char grilled in tandoor, served with kebab masala', '290.00', '290.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 76, 10, 3, 'Subz kadak seekh', 'Crispy fried tandoori vegetable kebab rolls with raw bananas and root raisins', '290.00', '290.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 77, 10, 3, 'Vegetable Patti Samosa', 'The Deccan version of Samosa with Spicy minced vegetable hash', '270.00', '270.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 78, 10, 3, 'Paneer Makhani', 'An all time vegetarian favorite', '305.00', '305.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 79, 10, 3, 'Maa ki Daal', 'A national favorite lentil delicacy simmered overnight on Tandoor', '225.00', '225.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 80, 10, 3, 'Whole Grain Roti', 'Bread of germinated wheat and whole wheat flour', '100.00', '100.00', 'default.png', 'USD', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 3, 1, 1, 'Is Fav Item', 'This is Product Description.', '3.90', '3.60', 'default.png', 'USD', 1, 1, '2020-06-14 14:25:43', '2020-06-14 14:25:43'),
(99, 3, 1, 1, 'Is Fav Item1', 'This is Product Description.', '3.90', '3.60', 'default.png', 'INR', 1, 1, '2020-06-14 14:27:06', '2020-06-14 14:27:06'),
(102, 80, 11, 3, 'Eyebrows', '', '10.00', '10.00', 'default.png', '$', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 81, 11, 3, 'Upper Lips', '', '5.00', '5.00', 'default.png', '$', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 82, 11, 3, 'Forehead', '', '5.00', '5.00', 'default.png', '$', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 83, 11, 3, 'Chin / Lower Lip', '', '5.00', '5.00', 'default.png', '$', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 84, 11, 3, 'Full Face Threading', '', '30.00', '30.00', 'default.png', '$', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 85, 11, 3, 'Eyebrow Tinting', '', '20.00', '20.00', 'default.png', '$', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 86, 11, 3, 'Neck', '', '5.00', '5.00', 'default.png', '$', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 87, 11, 3, 'Skin Tags Removal', '', '25.00', '25.00', 'default.png', '$', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `data_orders`
--

CREATE TABLE `data_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `queue_id` int(11) DEFAULT NULL,
  `processed_by` int(11) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '0',
  `qr_code_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_order_details`
--

CREATE TABLE `data_order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price_with_tax` decimal(10,2) DEFAULT NULL,
  `price_without_tax` decimal(10,2) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_queues`
--

CREATE TABLE `data_queues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `qdate` date DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_queue_members`
--

CREATE TABLE `data_queue_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `queue_number` int(11) NOT NULL DEFAULT '1',
  `member_count` int(11) NOT NULL DEFAULT '1',
  `processed_number` int(11) DEFAULT NULL,
  `processed_at` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `graph_logic`
--

CREATE TABLE `graph_logic` (
  `id` int(10) NOT NULL,
  `restaurent_id` int(10) NOT NULL,
  `week` date NOT NULL,
  `total_logins` varchar(255) NOT NULL,
  `value_generated` varchar(255) NOT NULL,
  `is_deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `graph_logic`
--

INSERT INTO `graph_logic` (`id`, `restaurent_id`, `week`, `total_logins`, `value_generated`, `is_deleted`) VALUES
(1, 1, '2020-03-15', '1', '11', '0'),
(2, 3, '2020-03-15', '1', '10', '0'),
(3, 1, '2020-03-17', '2', '100', '0'),
(4, 3, '2020-03-16', '3', '15.20', '0'),
(5, 3, '2020-02-12', '5', '25.50', '0'),
(6, 3, '2020-03-11', '2', '10', '0'),
(7, 3, '2020-02-18', '2', '25', '0'),
(8, 3, '2020-03-06', '3', '15.20', '0'),
(9, 3, '2020-02-19', '6', '30', '0'),
(10, 3, '2020-03-09', '7', '25', '0'),
(11, 3, '2020-03-06', '5', '15.20', '0'),
(12, 1, '2020-03-19', '2', '100', '0'),
(13, 3, '2020-03-20', '1', '-90.83', '0'),
(14, 5, '2020-03-21', '2', '-90.83', '0'),
(15, 1, '2020-03-21', '2', '100', '0'),
(16, 1, '2020-03-31', '1', '100', '0'),
(17, 1, '2020-04-11', '1', '100', '0'),
(18, 1, '2020-05-02', '6', '100', '0'),
(19, 1, '2020-05-04', '3', '100', '0'),
(20, 1, '2020-05-09', '1', '100', '0'),
(21, 1, '2020-05-11', '1', '100', '0'),
(22, 1, '2020-05-12', '2', '100', '0'),
(23, 1, '2020-05-13', '1', '100', '0'),
(24, 1, '2020-05-15', '3', '100', '0'),
(25, 1, '2020-05-17', '4', '100', '0'),
(26, 1, '2020-05-20', '4', '100', '0'),
(27, 5, '2020-05-21', '1', '-90.83', '0'),
(28, 1, '2020-06-02', '2', '100', '0'),
(33, 1, '2020-06-04', '1', '100', '0'),
(34, 1, '2020-06-06', '4', '120', '0'),
(35, 1, '2020-06-07', '1', '111.421', '0'),
(36, 1, '2020-06-12', '2', '4.51', '0'),
(37, 1, '2020-06-14', '2', '4.51', '0'),
(38, 4, '2020-06-14', '1', '2.23', '0'),
(39, 1, '2020-06-15', '5', '18.06', '0'),
(40, 1, '2020-06-17', '1', '4.51', '0'),
(41, 1, '2020-06-20', '5', '18.06', '0'),
(42, 5, '2020-06-20', '1', '2.23', '0'),
(43, 1, '2020-06-21', '2', '4.51', '0'),
(44, 11, '2020-06-21', '2', '4.51', '0'),
(45, 1, '2020-06-22', '1', '4.51', '0'),
(46, 1, '2020-06-23', '1', '4.51', '0'),
(47, 1, '2020-06-28', '4', '13.54', '0');

-- --------------------------------------------------------

--
-- Table structure for table `graph_master`
--

CREATE TABLE `graph_master` (
  `id` int(11) NOT NULL,
  `restaurent_id` int(11) NOT NULL,
  `business_open` varchar(255) NOT NULL COMMENT 'A1 - Business is open',
  `weekend_busy_days` varchar(255) NOT NULL COMMENT 'A2 - of Weekend as Busy Days',
  `heavy_business_weekend` varchar(255) NOT NULL COMMENT 'A3 - of heavy engagement at the business during Weekend',
  `heavy_business_weekdays` varchar(255) NOT NULL COMMENT 'A4 - of heavy engagement at the business during Weekdays',
  `average_per_table` varchar(255) NOT NULL COMMENT 'A5 - per table on an average',
  `waiting_times` varchar(255) NOT NULL COMMENT 'A6 - of wait time during busy times',
  `order_from_menu` varchar(255) NOT NULL COMMENT 'A7 - to decide the order from menu',
  `customer_turn_wait_time` varchar(255) NOT NULL COMMENT 'A8 - customer churn during wait times',
  `turn_the_table` varchar(255) NOT NULL COMMENT 'A9 - to turn the table',
  `at_the_restaurent` varchar(255) NOT NULL COMMENT 'A10 - at the restaurant',
  `customer_per_table_average` varchar(255) NOT NULL COMMENT 'A11 -  per table on an average',
  `reduce_order_time` varchar(255) NOT NULL COMMENT 'A12 - Reduce order time',
  `reduce_churn_rate` varchar(255) NOT NULL COMMENT 'A13 - Reduce Churn rate',
  `customer_adoption_per_week` varchar(255) NOT NULL COMMENT 'A14 - Customer Adoption per week',
  `is_deleted` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `graph_master`
--

INSERT INTO `graph_master` (`id`, `restaurent_id`, `business_open`, `weekend_busy_days`, `heavy_business_weekend`, `heavy_business_weekdays`, `average_per_table`, `waiting_times`, `order_from_menu`, `customer_turn_wait_time`, `turn_the_table`, `at_the_restaurent`, `customer_per_table_average`, `reduce_order_time`, `reduce_churn_rate`, `customer_adoption_per_week`, `is_deleted`, `created_at`) VALUES
(1, 11, '6', '2', '4', '2', '75', '15', '10', '10', '45', '15', '3', '50', '50', '8', '0', '2020-03-15 00:00:00'),
(2, 4, '6', '4', '4', '4', '75', '15', '10', '10', '4', '15', '5', '5', '5', '8', '0', '2020-03-15 00:00:00'),
(3, 3, '6', '4', '4', '4', '75', '15', '10', '10', '4', '15', '5', '5', '5', '8', '0', '2020-03-15 00:00:00'),
(4, 6, '6', '4', '4', '4', '75', '15', '10', '10', '4', '15', '5', '5', '5', '8', '0', '2020-03-15 00:00:00'),
(5, 5, '6', '4', '4', '4', '75', '15', '10', '10', '4', '15', '5', '5', '5', '8', '0', '2020-03-15 00:00:00'),
(6, 1, '7', '2', '4', '2', '75', '15', '10', '10', '45', '15', '3', '50', '50', '8', '0', '2020-03-15 00:00:00'),
(7, 2, '6', '4', '4', '4', '75', '15', '10', '10', '4', '15', '5', '5', '5', '8', '0', '2020-03-15 00:00:00'),
(8, 7, '6', '2', '4', '2', '75', '15', '10', '10', '45', '15', '3', '50', '50', '8', '0', '2020-03-15 00:00:00'),
(9, 8, '6', '2', '4', '2', '75', '15', '10', '10', '45', '15', '3', '50', '50', '8', '0', '2020-03-15 00:00:00'),
(10, 9, '6', '2', '4', '2', '75', '15', '10', '10', '45', '15', '3', '50', '50', '8', '0', '2020-03-15 00:00:00'),
(11, 10, '6', '2', '4', '2', '75', '15', '10', '10', '45', '15', '3', '50', '50', '8', '0', '2020-03-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `entity_id` int(10) UNSIGNED DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assets` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_types`
--

CREATE TABLE `history_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `history_types`
--

INSERT INTO `history_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'User', '2019-12-19 00:19:11', '2019-12-19 00:19:11'),
(2, 'Role', '2019-12-19 00:19:11', '2019-12-19 00:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_12_28_171741_create_social_logins_table', 1),
(4, '2015_12_29_015055_setup_access_tables', 1),
(5, '2016_07_03_062439_create_history_tables', 1),
(6, '2017_04_04_131153_create_sessions_table', 1),
(7, '2019_12_20_171654_add_fields_to_user_table', 2),
(8, '2019_12_21_134048_add_lat_long_to_users_table', 3),
(9, '2019_12_21_141123_create_table_data_user_stores', 4),
(10, '2019_12_21_154627_create_table_data_items', 5),
(11, '2019_12_21_180643_create_table_data_categories', 6),
(12, '2019_12_22_055057_create_table_data_queues', 7),
(13, '2019_12_22_055612_create_table_data_queue_members', 8),
(14, '2019_12_22_111221_create_table_data_orders', 9),
(15, '2019_12_22_111456_create_table_data_order_details', 10),
(16, '2020_01_22_151559_add_column_to_data_items', 11),
(17, '2020_01_22_152047_add_column_to_data_user_stores', 12),
(18, '2020_01_26_175320_add_country_code_to_table_users', 13);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'view-backend', 'View Backend', 1, '2019-12-19 00:19:11', '2019-12-19 00:19:11');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `all` tinyint(1) NOT NULL DEFAULT '0',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `all`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 1, 1, '2019-12-19 00:19:10', '2019-12-19 00:19:10'),
(2, 'Executive', 0, 2, '2019-12-19 00:19:10', '2019-12-19 00:19:10'),
(3, 'User', 0, 3, '2019-12-19 00:19:10', '2019-12-19 00:19:10');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_logins`
--

CREATE TABLE `social_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_pic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `age` int(11) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `radius` decimal(8,2) NOT NULL DEFAULT '100.00',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `customer_id`, `name`, `email`, `password`, `status`, `user_type`, `gender`, `country_code`, `phone`, `profile_pic`, `age`, `birthdate`, `latitude`, `longitude`, `device_token`, `radius`, `notes`, `confirmation_code`, `confirmed`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'UCC1', 'Amit Tomar', 'amit.tomar@gmail.com', '$2y$10$ajAeK0AUTqS3vwABTxZnr.l3A4J5BysgqQmhJazAoPyiV3gHpIIZ.', 1, '1', 'Male', '+1', '6174011249', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10158298483483210&height=200&width=200&ext=1595278792&hash=AeQ2pHJkSWa9PnHT', 22, '1992-12-02', '37.55394359469298', '-122.2481475114419', NULL, '100.00', NULL, '90682fb4c3e1f7f35e649bb7c363ae8e', 1, NULL, '2019-12-19 00:19:10', '2020-06-30 02:21:22', NULL),
(2, 'UCP2', 'Amit Tomar', 'amit.tomar@gmail.com', '$2y$10$NaTQww7nqawfcGYxTYkJ0ugJxQwt6o4qMvLCEx7so6cPWebkOM1J2', 1, '1', 'Female', '+1', '6174011248', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10158295382948210&height=200&width=200&ext=1591032171&hash=AeRE-CCnckG1iaAi', 18, '1992-10-01', '37.53823969516674', '-122.249572444821', NULL, '100.00', 'PASHA MEDITERRANEAN & HOOKAH LOUNGE', '3844691315fa1b69c9f2049cfcfc87ce', 1, NULL, '2019-12-19 00:19:10', '2020-05-03 01:06:56', NULL),
(3, 'UCB3', 'Admin', 'aDGGsvVvSDVdvdVdvd', '$2y$10$Eo3XDTMev7o5atx9Zyqc3OsQCNkwugZ3rKBiBt49bH7MhNO8UtEr2', 1, '1', 'female', '123', '123456', 'https://miro.medium.com/max/1400/0*Ggt-XwliwAO6QURi.jpg', 22, '1991-10-10', '41.967610', '87.675100', 'kjdfl2u4h3423kjkj', '100.00', NULL, '6c0194adf9756dada5616bcb7c484776', 1, NULL, '2019-12-19 00:19:10', '2020-04-29 12:52:48', NULL),
(4, 'UBA4', 'Admin', NULL, '$2y$10$OUxspzrRBq91.YsL0pYe/O3KRGC0c7jWpi7IUxhpFXykaSuWM1dFC', 1, '1', 'Female', '+1', '6174011248', 'https://miro.medium.com/max/1400/0*Ggt-XwliwAO6QURi.jpg', 18, NULL, '42.3629', '-71.09252', 'kjdfl2u4h3423kjkj', '100.00', NULL, NULL, 1, NULL, '2020-02-07 11:17:42', '2020-04-29 12:44:15', NULL),
(5, 'UNJ5', 'Junoon User', 'Junoon.user@kobaso.com', '$2y$10$1YOuZ0AXGVKr1a62dYMyHu0a0Y8l4H/cGZrpLfoelvSXo8LkQNZI2', 1, '1', 'Male', '+1', '6174011248', 'junoon.png', 18, NULL, '40.74304', '-73.99105', NULL, '100.00', NULL, NULL, 1, NULL, '2020-02-15 23:43:48', '2020-03-29 08:54:19', NULL),
(6, 'INI6', 'Archana Singh Tomar', 'singarchana@gmail.com', '$2y$10$1YOuZ0AXGVKr1a62dYMyHu0a0Y8l4H/cGZrpLfoelvSXo8LkQNZI2', 1, '1', 'Female', '+91', '6174171050', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=2857541077697540&height=200&width=200&ext=1591059743&hash=AeT38AVDTmgW1fMG', 18, NULL, '37.55394359469298', '-122.2481475114419', NULL, '100.00', NULL, NULL, 1, NULL, '2020-02-15 23:43:48', '2020-05-12 09:21:03', NULL),
(7, 'IGP7', 'PindBalluchi User', 'pindBalucchi.user@kobaso.com', '$2y$10$uOKLDyuWdfo0VYy.jHRZ5urS/AYwSpEZXne.dHMmeCmQ6Wr1IIuF2', 1, '1', 'Female', '+91', '8859260131', 'pind_balluchi.png', 18, NULL, '28.4729', '77.06606', NULL, '100.00', NULL, NULL, 1, NULL, '2020-03-07 17:12:05', '2020-03-07 17:12:05', NULL),
(8, 'IML8', 'Leopold User', 'leopold.user@kobaso.com', '$2y$10$6zV11KUYNQO98sa8lDEw8uV6dm0whoKLgDxGMw2f47MIDEra4nJsq', 1, '1', 'Male', '+91', '6174011248', 'leopold_cafe.png', 0, NULL, '37.53819661218444', '-122.2496536654627', NULL, '100.00', NULL, NULL, 1, NULL, '2020-04-22 08:33:00', '2020-04-26 07:13:25', NULL),
(9, 'IPD9', 'DeccanHarvest User', 'deccanharvest.user@kobaso.com', '$2y$10$0JsVHpVZsixESJYIjF9okeeaTWJes9UN0fHZNFBED/GnUtRKYHbr2', 1, '1', 'Male', '+91', '8859260131', 'deccan_harvest.png', 18, NULL, '18.51526', '73.93278', NULL, '100.00', NULL, NULL, 1, NULL, '2020-04-24 11:48:59', '2020-04-25 18:11:59', NULL),
(10, 'IBS10', 'Sahib User', 'sahib.user@kobaso.com', '$2y$10$0JsVHpVZsixESJYIjF9okeeaTWJes9UN0fHZNFBED/GnUtRKYHbr2', 1, '1', 'Male', '+91', '8859260131', 'sahib_sindh_sultan.png', 18, NULL, '12.93798', '77.61053', 'kjdfl2u4h3423kjkj', '100.00', NULL, NULL, 1, NULL, '2020-04-24 11:48:59', '2020-04-25 22:12:58', NULL),
(11, 'UCR1', 'Radhika Beauty Salonn', '', '$2y$10$zCeqJf361ER7YNwIFm9gFunjC.aUCguAubM9R0Z5RpunoNXo2ngFS', 1, '1', 'Female', '+1', '6504229182', 'radhika_beauty_salon.png', 18, NULL, '37.478000', '-122.224530', NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-04 18:59:25', '2020-06-04 18:59:25', NULL),
(38, 'UCB34', NULL, NULL, '$2y$10$ekQbQuFTxfoHHIQCCnPnEOrpFFlRIv.WcXMHnvjo/2e6Tme8Dpl0u', 1, '0', '', '+91', '9173558182', 'default.png', 18, NULL, '0', '0', NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-16 00:03:17', '2020-06-17 22:16:24', NULL),
(39, NULL, 'Satish Shah', 'test2@gmail.com', '$2y$10$KEf/CdqRSa.My22CrfwbKOSXbt.xs2B6h.Ts7JZe3DWG7nOSf6qsa', 1, '0', 'Male', '+91', '9537984864', 'default.png', 18, '1992-10-10', NULL, NULL, NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-16 00:06:23', '2020-06-16 00:10:50', NULL),
(42, NULL, '', '', '$2y$10$WQJblKAqHUBb5mUlgW01HOv27VPI0plhj2bDIfXfmyc3fvpbR28em', 1, '0', '', '+91', '9537984861', 'default.png', 18, NULL, NULL, NULL, NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-21 11:53:03', '2020-06-21 11:53:03', NULL),
(43, NULL, 'Amit Tomar', 'amit.tomar@gmail.com', '$2y$10$dBU2k2yW0lufwdTTRB.5oueiTog/H4PUYzlWRTi2kShTvyHgWVUAa', 1, '0', '', '+1', '6174011249', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10158295382948210&height=200&width=200&ext=1595902518&hash=AeSL_4U5cvvoCNtU', 18, NULL, '37.55394359469298', '-122.2481475114419', NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-21 12:12:39', '2020-06-28 09:15:18', NULL),
(44, NULL, '', '', '$2y$10$P0ndmnyEdUlE2ZXP6kSL1eZGcCo0beEaQGFTqSG6Y7m4N92eCB1UC', 1, '0', '', '+91', '9016744831', 'default.png', 18, NULL, NULL, NULL, NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-21 12:55:52', '2020-06-21 12:55:52', NULL),
(45, NULL, '', '', '$2y$10$acWoeTA3OnJCTixht43XseP.SoghTNapydPuYECeIFRC91aykNy5e', 1, '0', '', '+91', '9016744832', 'default.png', 18, NULL, NULL, NULL, NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-21 12:57:25', '2020-06-21 12:57:25', NULL),
(46, NULL, '', '', '$2y$10$3KtA.LQvwxqiYmDh2H0PPu4JjDpo6yER.v5tdXqCCglYGkFf6jgKq', 1, '0', '', '+91', '9016744833', 'default.png', 18, NULL, NULL, NULL, NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-21 13:08:27', '2020-06-21 13:08:27', NULL),
(47, NULL, '', '', '$2y$10$MHk.fLrlH2I7IJdPGKwmseEYV175W3w2Ux3jMXzAERLBJ6u9IEFPy', 1, '0', '', '+91', '9016744834', 'default.png', 18, NULL, NULL, NULL, NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-21 13:09:14', '2020-06-21 13:09:14', NULL),
(48, NULL, '', '', '$2y$10$wRFMzGJAAi1iIRZBz4kWfuKaiy1phe3OdJm.Tv.k99F4CbsUR8ETS', 1, '0', '', '+1', '4084766514', 'default.png', 18, NULL, '0', '0', NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-26 06:44:23', '2020-06-26 06:44:23', NULL),
(49, NULL, 'Archana1', '6174171051@yopmail.com', '$2y$10$JN.kJeZad02OWy.h5H5YSOzTOD30m3D/eZ4huR6GH0dGEkiys6MGW', 1, '0', NULL, '+1', '6174171051', 'default.png', 18, NULL, NULL, NULL, NULL, '100.00', NULL, NULL, 1, NULL, '2020-06-28 09:18:31', '2020-06-28 09:18:31', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application_logs`
--
ALTER TABLE `application_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_enterprise_detail`
--
ALTER TABLE `data_enterprise_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_food_category`
--
ALTER TABLE `data_food_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_food_item_detail`
--
ALTER TABLE `data_food_item_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_orders`
--
ALTER TABLE `data_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_order_details`
--
ALTER TABLE `data_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_queues`
--
ALTER TABLE `data_queues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_queue_members`
--
ALTER TABLE `data_queue_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `graph_logic`
--
ALTER TABLE `graph_logic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `graph_master`
--
ALTER TABLE `graph_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_type_id_foreign` (`type_id`),
  ADD KEY `history_user_id_foreign` (`user_id`);

--
-- Indexes for table `history_types`
--
ALTER TABLE `history_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `social_logins`
--
ALTER TABLE `social_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_logins_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application_logs`
--
ALTER TABLE `application_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `data_enterprise_detail`
--
ALTER TABLE `data_enterprise_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `data_food_category`
--
ALTER TABLE `data_food_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_food_item_detail`
--
ALTER TABLE `data_food_item_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `data_orders`
--
ALTER TABLE `data_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_order_details`
--
ALTER TABLE `data_order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_queues`
--
ALTER TABLE `data_queues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_queue_members`
--
ALTER TABLE `data_queue_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `graph_logic`
--
ALTER TABLE `graph_logic`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `graph_master`
--
ALTER TABLE `graph_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_types`
--
ALTER TABLE `history_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_logins`
--
ALTER TABLE `social_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `history_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_logins`
--
ALTER TABLE `social_logins`
  ADD CONSTRAINT `social_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
