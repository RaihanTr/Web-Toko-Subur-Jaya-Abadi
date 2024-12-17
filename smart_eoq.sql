-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for smart_eoq
CREATE DATABASE IF NOT EXISTS `smart_eoq` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smart_eoq`;

-- Dumping structure for table smart_eoq.eoq_analysis
CREATE TABLE IF NOT EXISTS `eoq_analysis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `annual_demand` int DEFAULT NULL,
  `purchasing_price` decimal(20,0) DEFAULT NULL,
  `eoq_result` int DEFAULT NULL,
  `number_order` int DEFAULT NULL,
  `frequency_order` int DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table smart_eoq.eoq_analysis: ~2 rows (approximately)
INSERT INTO `eoq_analysis` (`id`, `name`, `annual_demand`, `purchasing_price`, `eoq_result`, `number_order`, `frequency_order`, `created`, `modified`) VALUES
	(1, 'Lampu TL LED', 775, 35000, 114, 7, 54, '2024-10-11 15:06:26', '2024-10-12 20:54:31'),
	(11, 'Lampu Tidur', 800, 40000, 108, 7, 49, '2024-10-12 20:54:58', '2024-10-12 20:55:05');

-- Dumping structure for table smart_eoq.eoq_default_parameter
CREATE TABLE IF NOT EXISTS `eoq_default_parameter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` enum('HC','TC') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `value` decimal(20,1) DEFAULT NULL,
  `type` enum('Percent','Ammount') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table smart_eoq.eoq_default_parameter: ~0 rows (approximately)
INSERT INTO `eoq_default_parameter` (`id`, `code`, `name`, `category`, `value`, `type`, `created`, `modified`) VALUES
	(1, 'average_hourly_salary', 'Hourly rate - Average salary', 'TC', 12000.0, 'Ammount', '2024-10-11 14:51:40', '2024-10-12 18:43:35');

-- Dumping structure for table smart_eoq.eoq_parameter
CREATE TABLE IF NOT EXISTS `eoq_parameter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` enum('HC','TC') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `value` decimal(20,1) DEFAULT NULL,
  `type` enum('Percent','Ammount') DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table smart_eoq.eoq_parameter: ~12 rows (approximately)
INSERT INTO `eoq_parameter` (`id`, `code`, `name`, `category`, `value`, `type`, `created`, `modified`) VALUES
	(1, 'rent_price', 'Harga Sewa Gudang per Item', 'HC', 3.0, 'Percent', '2024-10-11 14:44:22', '2024-10-11 14:48:19'),
	(2, 'damage_price', 'Harga Kerusakan per Item', 'HC', 1.0, 'Percent', '2024-10-11 14:45:35', '2024-10-11 14:48:20'),
	(3, 'loss_price', 'Harga Kehilangan per Item', 'HC', 1.5, 'Percent', '2024-10-11 14:49:08', '2024-10-11 14:50:01'),
	(4, 'marketing_price', 'Harga Promosi', 'HC', 1.5, 'Percent', '2024-10-11 14:50:29', '2024-10-11 14:50:44'),
	(6, 'order_process', 'Ordering Process', 'TC', 0.2, 'Ammount', '2024-10-11 14:53:12', '2024-10-11 14:54:13'),
	(7, 'order_validation', 'Order Validation', 'TC', 0.2, 'Ammount', '2024-10-11 14:53:34', '2024-10-11 14:54:09'),
	(8, 'communication', 'Communication with supplier', 'TC', 0.3, 'Ammount', '2024-10-11 14:54:57', '2024-10-11 14:55:06'),
	(9, 'follow_up', 'Follow-up', 'TC', 0.2, 'Ammount', '2024-10-11 14:54:57', '2024-10-11 14:55:06'),
	(10, 'reception', 'Reception', 'TC', 0.3, 'Ammount', '2024-10-11 14:54:57', '2024-10-11 14:56:06'),
	(11, 'inspection', 'Inspection', 'TC', 0.1, 'Ammount', '2024-10-11 14:54:57', '2024-10-11 14:56:06'),
	(12, 'putting_storage', 'Putting into Storage', 'TC', 0.3, 'Ammount', '2024-10-11 14:54:57', '2024-10-11 14:56:06'),
	(13, 'supplier_payment', 'Supplier Payment', 'TC', 0.1, 'Ammount', '2024-10-11 14:57:39', '2024-10-11 14:57:39');

-- Dumping structure for table smart_eoq.goods
CREATE TABLE IF NOT EXISTS `goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `eoq_id` int DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_goods_eoqanalysis` (`eoq_id`),
  CONSTRAINT `fk_goods_eoqanalysis` FOREIGN KEY (`eoq_id`) REFERENCES `eoq_analysis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table smart_eoq.goods: ~2 rows (approximately)
INSERT INTO `goods` (`id`, `name`, `qty`, `eoq_id`, `created`, `modified`) VALUES
	(1, 'Lampu', 108, 11, '2024-10-31 05:17:11', '2024-10-31 07:01:27');

-- Dumping structure for table smart_eoq.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` enum('Administrator','User') DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table smart_eoq.user: ~2 rows (approximately)
INSERT INTO `user` (`id`, `full_name`, `username`, `password`, `role`, `status`, `created`, `modified`) VALUES
	(1, 'Administrator', 'admin', '$2y$12$OmYwoAvr5VX2niFPcab4TejjnfZyuA7OHuXFvnOpSxSDAq9RpYDIK', 'Administrator', 1, '2024-10-11 10:17:25', '2024-10-12 21:10:00'),
	(2, 'Dany Prastio', 'dany.prastio', '$2y$12$D9aRFjMs3Dx5SSXebnOzmeOKwNdknByqIaafrqXSf.YZtMAROrTdK', 'Administrator', 1, '2024-10-12 19:50:21', '2024-10-12 20:13:29');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
