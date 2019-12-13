-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.17 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for roytuts
DROP DATABASE IF EXISTS `roytuts`;
CREATE DATABASE IF NOT EXISTS `roytuts` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `roytuts`;

-- Dumping structure for table roytuts.addresses
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Used to store user''s address';

-- Dumping data for table roytuts.addresses: ~2 rows (approximately)
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` (`id`, `street`, `city`, `pin`) VALUES
	(1, 'street1', 'city1', 123456),
	(2, 'street2', 'city2', 123457);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;

-- Dumping structure for table roytuts.databasechangelog
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE IF NOT EXISTS `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table roytuts.databasechangelog: ~3 rows (approximately)
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
	('01', 'Soumitra Roy', 'classpath:db/changelog/01-create-users-and-addresses-schema.xml', '2019-12-13 17:16:47', 1, 'EXECUTED', '8:f064675b5dfb44aa74cc343bfddb6c1f', 'createTable tableName=users; createTable tableName=addresses; addForeignKeyConstraint baseTableName=users, constraintName=address_fk, referencedTableName=addresses', '', NULL, '3.8.2', NULL, NULL, '6237607110'),
	('02', 'Soumitra Roy', 'classpath:db/changelog/02-insert-data-addresses.xml', '2019-12-13 17:16:47', 2, 'EXECUTED', '8:7469ed8028aa762990cce657c0f19d02', 'insert tableName=addresses; insert tableName=addresses', '', NULL, '3.8.2', NULL, NULL, '6237607110'),
	('03', 'Soumitra Roy', 'classpath:db/changelog/02-insert-data-users.xml', '2019-12-13 17:16:47', 3, 'EXECUTED', '8:8a1a0d205f46adf4c7e335d9afe786a5', 'insert tableName=users; insert tableName=users', '', NULL, '3.8.2', NULL, NULL, '6237607110');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;

-- Dumping structure for table roytuts.databasechangeloglock
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE IF NOT EXISTS `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table roytuts.databasechangeloglock: ~1 rows (approximately)
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
	(1, b'0', NULL, NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;

-- Dumping structure for table roytuts.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_fk` (`address`),
  CONSTRAINT `address_fk` FOREIGN KEY (`address`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Used to store user''s information';

-- Dumping data for table roytuts.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`) VALUES
	(1, 'Soumitra', 'contact@roytuts.com', 1234567890, 1),
	(2, 'Rushikesh', 'contact@roytuts.com', 1234567891, 2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
