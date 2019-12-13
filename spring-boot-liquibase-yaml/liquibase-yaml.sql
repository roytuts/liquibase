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
  `ID` int(11) NOT NULL,
  `STREET` varchar(100) NOT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `PIN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table roytuts.addresses: ~2 rows (approximately)
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` (`ID`, `STREET`, `CITY`, `PIN`) VALUES
	(1, 'street1', 'city1', 111111),
	(2, 'street2', 'city2', NULL);
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
	('createTable', 'Soumitra Roy', 'classpath:db/db.changelog-master.yaml', '2019-12-13 17:42:30', 1, 'EXECUTED', '8:d46f6a07497ce29b5907e7c0cec87e39', 'sqlFile', '', NULL, '3.8.2', NULL, NULL, '6239149892'),
	('insertTableAddresses', 'Soumitra Roy', 'classpath:db/db.changelog-master.yaml', '2019-12-13 17:42:30', 2, 'EXECUTED', '8:b519b6d5c979d8ebb2928a64d72fb432', 'sqlFile', '', NULL, '3.8.2', NULL, NULL, '6239149892'),
	('insertTableUsers', 'Soumitra Roy', 'classpath:db/db.changelog-master.yaml', '2019-12-13 17:42:30', 3, 'EXECUTED', '8:94375a5c50836cb61afa5729c5626d63', 'sqlFile', '', NULL, '3.8.2', NULL, NULL, '6239149892');
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
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PHONE` int(11) DEFAULT NULL,
  `ADDRESS` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `USERS_FK` (`ADDRESS`),
  CONSTRAINT `USERS_FK` FOREIGN KEY (`ADDRESS`) REFERENCES `addresses` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table roytuts.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`ID`, `NAME`, `EMAIL`, `PHONE`, `ADDRESS`) VALUES
	(1, 'Soumitra', 'soumitra@email.com', NULL, 1),
	(2, 'Suman', 'suman@email.com', 1254789541, 2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
