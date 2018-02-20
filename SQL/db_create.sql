-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.2.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cancer_sucks
CREATE DATABASE IF NOT EXISTS `cancer_sucks` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cancer_sucks`;

-- Dumping structure for table cancer_sucks.event
CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_type_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `desc` varchar(500) CHARACTER SET utf8 NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `FK_event_event_type` (`event_type_id`),
  CONSTRAINT `FK_event_event_type` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`event_type_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table cancer_sucks.event: ~43 rows (approximately)
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`event_id`, `event_type_id`, `person_id`, `desc`, `date_start`, `date_end`, `time_start`, `time_end`) VALUES
	(1, 9, 1, 'Clinic CBC', '2017-07-18', '2017-07-18', NULL, NULL),
	(2, 9, 1, 'Clinic CBC', '2017-07-25', '2017-07-25', NULL, NULL),
	(3, 9, 1, 'Clinic CBC', '2017-08-01', '2017-08-01', NULL, NULL),
	(4, 9, 1, 'Clinic CBC', '2017-08-08', '2017-08-08', NULL, NULL),
	(5, 9, 1, 'Clinic CBC', '2017-08-15', '2017-08-15', NULL, NULL),
	(6, 9, 1, 'Clinic CBC', '2017-08-22', '2017-08-22', NULL, NULL),
	(7, 9, 1, 'Clinic CBC', '2017-08-29', '2017-08-29', NULL, NULL),
	(8, 9, 1, 'Clinic CBC', '2017-09-05', '2017-09-05', NULL, NULL),
	(9, 9, 1, 'Clinic CBC', '2017-09-12', '2017-09-12', NULL, NULL),
	(10, 10, 1, 'Round 1 - Week 1 - Day 1', '2017-07-27', '2017-07-27', NULL, NULL),
	(11, 10, 1, 'Round 1 - Week 1 - Day 2', '2017-07-28', '2017-07-28', NULL, NULL),
	(12, 10, 1, 'Round 1 - Week 4 - Day 1', '2017-08-16', '2017-08-16', NULL, NULL),
	(13, 10, 1, 'Round 1 - Week 5 - Day 1', '2017-08-23', '2017-08-23', NULL, NULL),
	(14, 10, 1, 'Round 2 - Week 1 - Day 1', '2017-08-30', '2017-08-30', NULL, NULL),
	(15, 10, 1, 'Round 2 - Week 1 - Day 2', '2017-08-31', '2017-08-31', NULL, NULL),
	(16, 14, 1, 'Neulasta Shot', '2017-07-29', '2017-09-29', NULL, NULL),
	(17, 14, 1, 'Neulasta Shot', '2017-09-02', '2017-09-02', NULL, NULL),
	(34, 9, 1, 'Pre-admit', '2017-09-19', '2017-09-19', NULL, NULL),
	(35, 16, 1, 'Pre-admit', '2017-09-20', '2017-09-20', '14:09:00', '14:09:00'),
	(36, 14, 1, 'Round 7', '2017-09-20', '2017-09-20', '17:00:00', '21:00:00'),
	(37, 9, 1, '72 MTX CBC', '2017-09-23', '2017-09-23', NULL, NULL),
	(38, 9, 1, 'Post HDMTX', '2017-09-26', '2017-09-26', NULL, NULL),
	(39, 16, 1, '', '2017-09-26', '2017-09-26', '10:44:18', '10:44:18'),
	(40, 14, 1, 'Blank', '2017-10-02', '2017-10-02', '16:20:00', '20:20:00'),
	(41, 9, 1, 'Last day of MXT', '2017-10-05', '2017-10-05', NULL, NULL),
	(42, 9, 1, 'Pre-op CBC', '2017-10-13', '2017-10-13', NULL, NULL),
	(43, 9, 1, 'Post op day 2', '2017-10-19', '2017-10-19', NULL, NULL),
	(44, 9, 1, 'Post op day 3', '2017-10-20', '2017-10-20', NULL, NULL),
	(45, 9, 1, 'Post op day 4', '2017-10-21', '2017-10-21', NULL, NULL),
	(46, 9, 1, 'Pre-admit for chemo starting 2017-11-01', '2017-10-30', '2017-10-30', NULL, NULL),
	(47, 14, 1, 'Blank', '2017-11-01', '2017-11-01', '14:00:00', '21:00:00'),
	(48, 14, 1, 'Blank', '2017-11-01', '2017-11-01', '14:00:00', '21:00:00'),
	(49, 9, 1, 'N/A', '2017-11-03', '2017-11-03', NULL, NULL),
	(50, 14, 1, 'Blank', '2017-11-02', '2017-11-02', '14:30:00', '21:00:00'),
	(51, 14, 1, 'Blank', '2017-11-02', '2017-11-02', '14:30:00', '21:00:00'),
	(52, 14, 1, 'Blank', '2017-11-04', '2017-11-04', '21:00:00', '21:00:00'),
	(53, 9, 1, 'N/A', '2017-11-08', '2017-11-08', NULL, NULL),
	(54, 16, 1, '', '2017-11-08', '2017-11-08', '13:44:00', '13:44:00'),
	(55, 16, 1, '', '2017-10-30', '2017-10-30', '11:27:00', '11:27:00'),
	(56, 9, 1, 'N/A', '2017-11-15', '2017-11-15', NULL, NULL),
	(57, 9, 1, 'N/A', '2017-11-20', '2017-11-20', NULL, NULL),
	(60, 17, 1, 'Rotaionplasty', '2017-10-17', '2017-10-17', '11:30:00', '20:00:00'),
	(61, 14, 1, 'Round 3 Week 4', '2017-11-21', '2017-11-21', '17:00:00', '21:00:00');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.event_cbc
CREATE TABLE IF NOT EXISTS `event_cbc` (
  `event_cbc_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `wbc` float DEFAULT NULL,
  `rbc` float DEFAULT NULL,
  `hgb` float DEFAULT NULL,
  `hct` float DEFAULT NULL,
  `mcv` float DEFAULT NULL,
  `mch` float DEFAULT NULL,
  `mchc` float DEFAULT NULL,
  `rdw` float DEFAULT NULL,
  `plt` float DEFAULT NULL,
  `mpv` float DEFAULT NULL,
  `gran_percent` float DEFAULT NULL,
  `lymph_percent` float DEFAULT NULL,
  `mono_percent` float DEFAULT NULL,
  `eos_percent` float DEFAULT NULL,
  `baso_percent` float DEFAULT NULL,
  `ig_percent` float DEFAULT NULL,
  `nrbc_percent` float DEFAULT NULL,
  `gran_num` float DEFAULT NULL,
  `lymph_num` float DEFAULT NULL,
  `mono_num` float DEFAULT NULL,
  `eos_num` float DEFAULT NULL,
  `baso_num` float DEFAULT NULL,
  `ig_num` float DEFAULT NULL,
  `nrbc_num` float DEFAULT NULL,
  `anc` float DEFAULT NULL,
  PRIMARY KEY (`event_cbc_id`),
  KEY `fk_event_event_id` (`event_id`),
  CONSTRAINT `fk_event_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Dumping data for table cancer_sucks.event_cbc: ~22 rows (approximately)
/*!40000 ALTER TABLE `event_cbc` DISABLE KEYS */;
INSERT INTO `event_cbc` (`event_cbc_id`, `event_id`, `wbc`, `rbc`, `hgb`, `hct`, `mcv`, `mch`, `mchc`, `rdw`, `plt`, `mpv`, `gran_percent`, `lymph_percent`, `mono_percent`, `eos_percent`, `baso_percent`, `ig_percent`, `nrbc_percent`, `gran_num`, `lymph_num`, `mono_num`, `eos_num`, `baso_num`, `ig_num`, `nrbc_num`, `anc`) VALUES
	(1, 1, 8.05, NULL, 12.6, NULL, NULL, NULL, NULL, NULL, 348, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2978),
	(2, 2, 8.35, NULL, 12.6, NULL, NULL, NULL, NULL, NULL, 342, NULL, 30.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2521),
	(3, 3, 21.69, NULL, 12.1, NULL, NULL, NULL, NULL, NULL, 199, NULL, 70.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15334),
	(4, 4, 4.42, NULL, 11.2, NULL, NULL, NULL, NULL, NULL, 137, NULL, 15.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 689),
	(5, 5, 6.17, NULL, 11.7, NULL, NULL, NULL, NULL, NULL, 448, NULL, 38.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2350),
	(6, 6, 7.31, NULL, 12.3, NULL, NULL, NULL, NULL, NULL, 409, NULL, 52.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3823),
	(7, 7, 6.52, NULL, 12.1, NULL, NULL, NULL, NULL, NULL, 312, NULL, 57.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3742),
	(8, 8, 12.59, NULL, 11.2, NULL, NULL, NULL, NULL, NULL, 123, NULL, 64.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8107),
	(9, 9, 6.83, NULL, 9.5, NULL, NULL, NULL, NULL, NULL, 66, NULL, 23.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1584),
	(19, 34, 6.06, NULL, 9.2, NULL, NULL, NULL, NULL, NULL, 485, NULL, 32.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1963),
	(20, 37, 4.54, NULL, 9.8, NULL, NULL, NULL, NULL, NULL, 415, NULL, 37.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1720),
	(21, 38, 4.66, NULL, 10.1, NULL, NULL, NULL, NULL, NULL, 332, NULL, 36.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1691),
	(22, 41, 5.29, NULL, 9.9, NULL, NULL, NULL, NULL, NULL, 243, NULL, 38.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2030),
	(23, 42, 14.68, NULL, 11.7, NULL, NULL, NULL, NULL, NULL, 195, NULL, 76.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11200),
	(24, 43, 8.3, NULL, 6.8, NULL, NULL, NULL, NULL, NULL, 188, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4000),
	(25, 44, 8.3, NULL, 6.7, NULL, NULL, NULL, NULL, NULL, 189, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4000),
	(26, 45, 5.7, NULL, 9, NULL, NULL, NULL, NULL, NULL, 199, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4143),
	(27, 46, 7.63, NULL, 10.6, NULL, NULL, NULL, NULL, NULL, 429, NULL, 55.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4180),
	(28, 49, 4.06, NULL, 10, NULL, NULL, NULL, NULL, NULL, 363, NULL, 79.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3219),
	(29, 53, 3.21, NULL, 10.9, NULL, NULL, NULL, NULL, NULL, 101, NULL, 18.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 603),
	(30, 56, 4.14, NULL, 9.2, NULL, NULL, NULL, NULL, NULL, 65, NULL, 16.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 699),
	(31, 57, 6.16, NULL, 9.7, NULL, NULL, NULL, NULL, NULL, 357, NULL, 38.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2353);
/*!40000 ALTER TABLE `event_cbc` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.event_medication
CREATE TABLE IF NOT EXISTS `event_medication` (
  `event_medication_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `medication_id` int(11) NOT NULL DEFAULT 0,
  `dose` float DEFAULT 0,
  `dose_um` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`event_medication_id`),
  KEY `FK_event_medication_event` (`event_id`),
  KEY `FK_event_medication_medication` (`medication_id`),
  CONSTRAINT `FK_event_medication_event` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_event_medication_medication` FOREIGN KEY (`medication_id`) REFERENCES `medication` (`medication_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Dumping data for table cancer_sucks.event_medication: ~20 rows (approximately)
/*!40000 ALTER TABLE `event_medication` DISABLE KEYS */;
INSERT INTO `event_medication` (`event_medication_id`, `event_id`, `medication_id`, `dose`, `dose_um`) VALUES
	(10, 10, 10, 0, 'mL'),
	(11, 10, 11, 0, 'mL'),
	(12, 11, 10, 0, 'mL'),
	(13, 11, 11, 0, 'mL'),
	(14, 12, 12, 0, 'mL'),
	(15, 13, 12, 0, 'mL'),
	(16, 14, 10, 0, 'mL'),
	(17, 14, 11, 0, 'mL'),
	(18, 15, 10, 0, 'mL'),
	(19, 15, 11, 0, 'mL'),
	(20, 16, 13, 2.2, 'mL'),
	(21, 17, 13, 2.2, 'mL'),
	(28, 36, 12, NULL, NULL),
	(29, 40, 12, NULL, NULL),
	(30, 47, 10, NULL, NULL),
	(31, 48, 11, NULL, NULL),
	(32, 50, 10, NULL, NULL),
	(33, 51, 11, NULL, NULL),
	(34, 52, 13, 2.2, NULL),
	(35, 61, 12, NULL, NULL);
/*!40000 ALTER TABLE `event_medication` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.event_methotrexate_levels
CREATE TABLE IF NOT EXISTS `event_methotrexate_levels` (
  `event_mtx_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_medication_id` int(11) NOT NULL DEFAULT 0,
  `level_date` date DEFAULT NULL,
  `level` decimal(10,2) NOT NULL DEFAULT 0.00,
  `hour` int(11) NOT NULL DEFAULT 0,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`event_mtx_level_id`),
  KEY `fk_event_eventid` (`event_medication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- Dumping data for table cancer_sucks.event_methotrexate_levels: ~15 rows (approximately)
/*!40000 ALTER TABLE `event_methotrexate_levels` DISABLE KEYS */;
INSERT INTO `event_methotrexate_levels` (`event_mtx_level_id`, `event_medication_id`, `level_date`, `level`, `hour`, `description`) VALUES
	(1, 14, '2017-08-17', 3.67, 24, ''),
	(2, 14, '2017-08-18', 0.24, 48, ''),
	(3, 14, '2017-08-19', 0.07, 72, ''),
	(34, 15, '2017-08-24', 2.09, 24, ''),
	(35, 15, '2017-08-25', 0.32, 48, ''),
	(36, 15, '2017-08-26', 0.09, 72, ''),
	(37, 28, '2017-09-21', 5.20, 24, ''),
	(38, 28, '2017-09-22', 0.85, 48, ''),
	(39, 28, '2017-09-23', 0.18, 72, ''),
	(40, 28, '2017-09-23', 0.09, 84, ''),
	(41, 28, '2017-09-24', 0.07, 96, ''),
	(42, 29, '2017-10-03', 2.02, 24, ''),
	(43, 29, '2017-10-04', 0.18, 48, ''),
	(44, 29, '2017-10-05', 0.09, 72, ''),
	(45, 35, '2017-11-22', 4.30, 24, ''),
	(46, 35, '2017-11-23', 0.38, 48, NULL);
/*!40000 ALTER TABLE `event_methotrexate_levels` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.event_procedure
CREATE TABLE IF NOT EXISTS `event_procedure` (
  `event_procedure_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `procedure_type_id` int(11) NOT NULL,
  `description` varchar(4000) NOT NULL DEFAULT '0',
  `doctors` varchar(500) DEFAULT NULL,
  `facility` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_procedure_id`),
  KEY `FK_event_procedure_event` (`event_id`),
  KEY `FK_event_procedure_procedure_type` (`procedure_type_id`),
  CONSTRAINT `FK_event_procedure_event` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_event_procedure_procedure_type` FOREIGN KEY (`procedure_type_id`) REFERENCES `procedure_type` (`proc_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table cancer_sucks.event_procedure: ~0 rows (approximately)
/*!40000 ALTER TABLE `event_procedure` DISABLE KEYS */;
INSERT INTO `event_procedure` (`event_procedure_id`, `event_id`, `procedure_type_id`, `description`, `doctors`, `facility`, `city`, `state`, `country`) VALUES
	(1, 60, 1, 'Rotaionplasty. University of Florida (Shands). Gainseville FL. Dr. Scarborough and Dr. Speigle.', 'Dr. Scarborough, Dr. Speigel', 'University of Florida', 'Gainesville', 'FL', 'USA');
/*!40000 ALTER TABLE `event_procedure` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.event_type
CREATE TABLE IF NOT EXISTS `event_type` (
  `event_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_type_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table cancer_sucks.event_type: ~10 rows (approximately)
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
INSERT INTO `event_type` (`event_type_id`, `event_type_name`) VALUES
	(8, 'Clinic'),
	(9, 'CBC'),
	(10, 'Chemotherapy'),
	(11, 'Transfusion'),
	(12, 'Emergency Room'),
	(13, 'Illness'),
	(14, 'Medication'),
	(15, 'Imaging'),
	(16, 'Vitals'),
	(17, 'Surgery');
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.event_vitals
CREATE TABLE IF NOT EXISTS `event_vitals` (
  `event_vitals_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL DEFAULT 0,
  `height` float DEFAULT 0,
  `weight` float DEFAULT 0,
  `bmi` float DEFAULT 0,
  `temperature` float DEFAULT 0,
  `bp_systolic` float DEFAULT 0,
  `bp_diastolic` float DEFAULT 0,
  PRIMARY KEY (`event_vitals_id`),
  KEY `FK_event_vitals_event` (`event_id`),
  CONSTRAINT `FK_event_vitals_event` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table cancer_sucks.event_vitals: ~5 rows (approximately)
/*!40000 ALTER TABLE `event_vitals` DISABLE KEYS */;
INSERT INTO `event_vitals` (`event_vitals_id`, `event_id`, `height`, `weight`, `bmi`, `temperature`, `bp_systolic`, `bp_diastolic`) VALUES
	(1, 7, 1.14, 21.95, 16.78, 98.2, 118, 74),
	(3, 35, 1.14, 21.95, 16.84, 98.6, 100, 65),
	(4, 39, 1.14, 22.05, 17, 98.24, 101, 60),
	(5, 54, 1.162, 20.96, 15.5231, 97.88, 117, 75),
	(6, 55, 1.162, 20.86, 15.4491, 98, 100, 54);
/*!40000 ALTER TABLE `event_vitals` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.medication
CREATE TABLE IF NOT EXISTS `medication` (
  `medication_id` int(11) NOT NULL AUTO_INCREMENT,
  `medication_type_id` int(11) NOT NULL DEFAULT 0,
  `name_common` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`medication_id`),
  KEY `FK_medication_medication_type` (`medication_type_id`),
  CONSTRAINT `FK_medication_medication_type` FOREIGN KEY (`medication_type_id`) REFERENCES `medication_type` (`medication_type_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table cancer_sucks.medication: ~4 rows (approximately)
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` (`medication_id`, `medication_type_id`, `name_common`, `name`) VALUES
	(10, 10, 'Doxorubicin', 'Doxorubicin'),
	(11, 10, 'Cisplatin', 'Cisplatin'),
	(12, 10, 'Methotrexate', 'Methotrexate'),
	(13, 11, 'Neulasta', 'Neulasta');
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.medication_type
CREATE TABLE IF NOT EXISTS `medication_type` (
  `medication_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`medication_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Dumping data for table cancer_sucks.medication_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `medication_type` DISABLE KEYS */;
INSERT INTO `medication_type` (`medication_type_id`, `description`) VALUES
	(10, 'Chemotherapy'),
	(11, 'Injection');
/*!40000 ALTER TABLE `medication_type` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.person
CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_type` int(11) NOT NULL,
  `person_first_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `person_last_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `person_address` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `person_city` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `person_county` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `person_zip` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `person_country` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `person_phone_main` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `person_phone_secondary` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `person_phone_main_type` int(11) DEFAULT NULL,
  `person_phone_secondary_type` int(11) DEFAULT NULL,
  `person_email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table cancer_sucks.person: ~2 rows (approximately)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`person_id`, `person_type`, `person_first_name`, `person_last_name`, `person_address`, `person_city`, `person_county`, `person_zip`, `person_country`, `person_phone_main`, `person_phone_secondary`, `person_phone_main_type`, `person_phone_secondary_type`, `person_email`) VALUES
	(1, 1, 'Zachary', 'Yanch', '6329 E Rock Creek Rd', 'Norman', 'Cleveland', '73026', 'United States', '+14057195766', '+14052038024', NULL, NULL, NULL),
	(2, 2, 'Jordan', 'Yanch', '6329 E Rock Creek Rd', 'Norman', 'Cleveland', '73026', 'United States', '+14057195766', NULL, NULL, NULL, NULL),
	(3, 2, 'Jeff', 'Yanch', '6329 E Rock Creek Rd', 'Norman', 'Cleveland', '73026', 'United States', '+14052038024', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.person_type
CREATE TABLE IF NOT EXISTS `person_type` (
  `person_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_type_description` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`person_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table cancer_sucks.person_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `person_type` DISABLE KEYS */;
INSERT INTO `person_type` (`person_type_id`, `person_type_description`) VALUES
	(1, 'Patient'),
	(2, 'Parent');
/*!40000 ALTER TABLE `person_type` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.plot_config
CREATE TABLE IF NOT EXISTS `plot_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `R` int(11) DEFAULT NULL,
  `G` int(11) DEFAULT NULL,
  `B` int(11) DEFAULT NULL,
  `low` float DEFAULT NULL,
  `high` float DEFAULT NULL,
  `div_by` float DEFAULT NULL,
  `legend_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table cancer_sucks.plot_config: ~12 rows (approximately)
/*!40000 ALTER TABLE `plot_config` DISABLE KEYS */;
INSERT INTO `plot_config` (`config_id`, `name`, `R`, `G`, `B`, `low`, `high`, `div_by`, `legend_name`) VALUES
	(1, 'wbc', 31, 19, 180, 5, 14.5, 10, 'WBC (K/mm3)'),
	(2, 'hgb', 255, 127, 14, 10.9, 14.9, 10, 'HGB (g/dL)'),
	(3, 'plt', 44, 160, 44, 150, 400, 100, 'PLT (k/mm3)'),
	(4, 'gran_percent', 227, 119, 194, 30, 70, 10, 'GRAN %'),
	(5, 'anc', 148, 103, 189, 1000, 5000, 1000, 'ANC'),
	(6, 'Doxorubicin', 214, 39, 40, NULL, NULL, NULL, 'Doxorubicin'),
	(7, 'Cisplatin', 188, 189, 34, NULL, NULL, NULL, 'Cisplatin'),
	(8, 'Methotrexate', 148, 103, 189, NULL, NULL, NULL, 'Methotrexate'),
	(9, 'Neulasta', 23, 190, 207, NULL, NULL, NULL, 'Neulasta'),
	(10, 'rbc', 255, 255, 255, 4.1, 5.3, 1, 'RBC (M/mm3)'),
	(11, 'hct', 255, 255, 255, 30.5, 44.5, 10, 'HCT %'),
	(12, 'mcv', 255, 255, 255, 77, 95, 10, 'HCT fL');
/*!40000 ALTER TABLE `plot_config` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.procedure_type
CREATE TABLE IF NOT EXISTS `procedure_type` (
  `proc_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `proc_type` varchar(50) NOT NULL,
  `proc_type_desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`proc_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table cancer_sucks.procedure_type: ~8 rows (approximately)
/*!40000 ALTER TABLE `procedure_type` DISABLE KEYS */;
INSERT INTO `procedure_type` (`proc_type_id`, `proc_type`, `proc_type_desc`) VALUES
	(1, 'Surgery', 'Surgery'),
	(2, 'Transfusion', 'Transfusion'),
	(3, 'PET', 'PET'),
	(4, 'CT', 'CT'),
	(5, 'MRI', 'MRI'),
	(6, 'GFR', 'GFR'),
	(7, 'Audiogram', 'Audiogram'),
	(8, 'Biopsy', 'Biopsy');
/*!40000 ALTER TABLE `procedure_type` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `role_description` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `role_admin` bit(1) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table cancer_sucks.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for procedure cancer_sucks.sp_add_event_cbc
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_event_cbc`(
	IN `eventtypeid` INT,
	IN `personid` INT,
	IN `description` VARCHAR(500),
	IN `datestart` DATE,
	IN `dateend` DATE,
	IN `timestart` TIME,
	IN `timeend` TIME,
	IN `wbc` FLOAT,
	IN `hgb` FLOAT,
	IN `plt` FLOAT,
	IN `granpercent` FLOAT,
	IN `anc` FLOAT,
	OUT `ResponseMessage` VARCHAR(250)


)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	-- SELECT @full_error;
	SELECT 'Insert failed.' INTO ResponseMessage;
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	-- SELECT @full_error;
	SELECT 'Insert failed.' INTO ResponseMessage;
	END;

	INSERT INTO `event` (`event_type_id`, `person_id`, `desc`, `date_start`, `date_end`, `time_start`, `time_end`)
	VALUES (eventtypeid, personid, description, datestart, dateend, timestart, timeend);
	
	INSERT INTO `event_cbc` (`event_id`, `wbc`, `hgb`, `plt`, `gran_percent`, `anc`)
	VALUES(LAST_INSERT_ID(), wbc, hgb, plt, granpercent, anc);
	
	SELECT 'Success!' INTO ResponseMessage;
	
END//
DELIMITER ;

-- Dumping structure for procedure cancer_sucks.sp_add_event_medication
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_event_medication`(
	IN `eventtypeid` INT,
	IN `personid` INT,
	IN `description` VARCHAR(500),
	IN `datestart` DATE,
	IN `dateend` DATE,
	IN `timestart` TIME,
	IN `timeend` TIME,
	IN `medicationid` INT,
	IN `dose` FLOAT,
	IN `doseum` VARCHAR(20)
,
	OUT `ResponseMessage` VARCHAR(50)

)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	-- SELECT @full_error;
	SELECT 'Insert failed.' INTO ResponseMessage;
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	-- SELECT @full_error;
	SELECT 'Insert failed.' INTO ResponseMessage;
	END;

	INSERT INTO `event` (`event_type_id`, `person_id`, `desc`, `date_start`, `date_end`, `time_start`, `time_end`)
	VALUES (eventtypeid, personid, description, datestart, dateend, timestart, timeend);
	
	INSERT INTO `event_medication` (`event_id`, `medication_id`, `dose`, `dose_um`)
	VALUES(LAST_INSERT_ID(), medicationid, dose, doseum);
	
	SELECT 'Success!' INTO ResponseMessage;

END//
DELIMITER ;

-- Dumping structure for procedure cancer_sucks.sp_add_event_surgery
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_event_surgery`(
	IN `eventtypeid` INT,
	IN `personid` INT,
	IN `description` VARCHAR(500),
	IN `datestart` DATE,
	IN `dateend` DATE,
	IN `timestart` TIME,
	IN `timeend` TIME,
	IN `surgerydescription` VARCHAR(4000),
	OUT `ResponseMessage` VARCHAR(50)


)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	SET @rollback = 1;
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	-- SELECT @full_error;
	SELECT 'Insert failed.' INTO ResponseMessage;
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
	SET @rollback = 1;
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	-- SELECT @full_error;
	SELECT 'Insert failed.' INTO ResponseMessage;
	END;

	SET @rollback = 0;

	START TRANSACTION;

	INSERT INTO `event` (`event_type_id`, `person_id`, `desc`, `date_start`, `date_end`, `time_start`, `time_end`)
	VALUES (eventtypeid, personid, description, datestart, dateend, timestart, timeend);
	
	INSERT INTO `event_surgery` (`event_id`, `description`)
	VALUES(LAST_INSERT_ID(), surgerydescription);
	
	IF @rollback THEN
		ROLLBACK;
	ELSE
		SELECT 'Success!' INTO ResponseMessage;
		COMMIT;
	END IF;
	
END//
DELIMITER ;

-- Dumping structure for procedure cancer_sucks.sp_add_event_vitals
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_event_vitals`(
	IN `eventtypeid` INT,
	IN `personid` INT,
	IN `description` VARCHAR(500),
	IN `datestart` DATE,
	IN `dateend` DATE,
	IN `timestart` TIME,
	IN `timeend` TIME,
	IN `height` FLOAT,
	IN `weight` FLOAT,
	IN `bmi` FLOAT,
	IN `temperature` FLOAT,
	IN `bp_systolic` FLOAT,
	IN `bp_diastolic` FLOAT,
	OUT `ResponseMessage` VARCHAR(50)


)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	SELECT @full_error;
	SELECT 'Insert failed.' INTO ResponseMessage;
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	SELECT @full_error;
	SELECT 'Insert failed.' INTO ResponseMessage;
	END;

	INSERT INTO `event` (`event_type_id`, `person_id`, `desc`, `date_start`, `date_end`, `time_start`, `time_end`)
	VALUES (eventtypeid, personid, description, datestart, dateend, timestart, timeend);
	
	INSERT INTO `event_vitals` (`event_id`, `height`, `weight`, `bmi`, `temperature`, `bp_systolic`, `bp_diastolic`)
	VALUES(LAST_INSERT_ID(), height, weight, bmi, temperature, bp_systolic, bp_diastolic);
	
	SELECT 'Success!' INTO ResponseMessage;

END//
DELIMITER ;

-- Dumping structure for procedure cancer_sucks.sp_add_user
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_user`(
	IN `pLogin` VARCHAR(50),
	IN `pPassword` VARCHAR(50),
	OUT `ResponseMessage` VARCHAR(250)





)
    MODIFIES SQL DATA
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	-- SELECT @full_error;
	SELECT 'Insert failed.' INTO ResponseMessage;
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	-- SELECT @full_error;
	SELECT 'Insert failed.' INTO ResponseMessage;
	END;

	SET @salt = UUID();
		
	INSERT IGNORE INTO `users` (user_name, user_password, user_salt)
	VALUES (pLogin, SHA2(CONCAT(pPassword, @salt), 512), @salt);

	SELECT 'Success!' INTO ResponseMessage;

END//
DELIMITER ;

-- Dumping structure for procedure cancer_sucks.sp_login
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`(
	IN `Login` VARCHAR(50),
	IN `Password` VARCHAR(250)
,
	OUT `ResponseMessage` VARCHAR(50)

)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	-- SELECT @full_error;
	SELECT 'Log in failed.' INTO ResponseMessage;
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
	GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
	 @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
	-- SELECT @full_error;
	SELECT 'Log in failed.' INTO ResponseMessage;
	END;
	
	IF (EXISTS (SELECT user_id FROM `users` WHERE user_name = Login LIMIT 1)) THEN
		SELECT user_id FROM `users` WHERE user_name = Login AND user_password = SHA2(CONCAT(`Password`, user_salt), 512) INTO @userid;
		IF (@userid IS NULL) THEN
			SELECT 'Incorrect Password' INTO ResponseMessage;
		ELSE
			SELECT 'User successfully logged in!' INTO ResponseMessage;
		END IF; 
	ELSE
		SELECT 'Invalid login ID.' INTO ResponseMessage;
	END IF;

END//
DELIMITER ;

-- Dumping structure for table cancer_sucks.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `user_password` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `user_salt` varchar(36) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table cancer_sucks.users: ~9 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_salt`) VALUES
	(1, 'test', 'c61039e2a1f5673cb3a39768e2c201826735d0858d32704414a42c5998ef27339d94255afe0bcf42f29aa626d76909de5fc619a247c504ac3109b7ca68275b37', '211d0422-9a20-11e7-a015-d481d7d52d39'),
	(3, 'test1', '0b1cf2ddacbd2aa8af1907921e7546bec65df9fb1e4f6bc1b5c07282bc582af4784bfed39831e40424fae9f3da38cf3b256eb52e76a193bd94a7f7114098ce10', '2fbd59d5-9a20-11e7-a015-d481d7d52d39'),
	(8, 'test2', '8e13a90a00e5d3e6cc70e5fbc012e99039fecc9208e0f23eaab902f0a7b63f861930f3a9167b222bcc937bc70751de90b892ae685b75ec4c52ee4dcd62806cbf', '7618f08a-9a20-11e7-a015-d481d7d52d39'),
	(9, 'test3', '3eef0a580ccab91b7c117d2c63fbaf25ca6bec0fd75716cd16d48f39e558a80a442fb299edab9b5fd437cf2744631eb91f6fa5c67611ecd0b77be6f87ad9f5d3', '7622dd86-9a20-11e7-a015-d481d7d52d39'),
	(11, 'test5', 'fdcc12d16f4dd12560fa80969c21d4741c7d33f74b118722e7136f5984e0b3440e804832ea2c140a5a01724d71db4f46c69b82daa8b5543ddfc0e03c95a66fee', 'f9d2a64a-9a20-11e7-a015-d481d7d52d39'),
	(12, 'test6', '9b4f7f9f43bf1cb2ecde18d900f2cc57fcd2f0455a07aabb5582c1afac3781cf11beeb5437ad4de354eb91f7d64766855013e1c2021dd5f57d9a1de18941b2da', '143ff2be-9a21-11e7-a015-d481d7d52d39'),
	(13, 'test4', 'd44c5a7c062df9b7a1b53934fd7386a90266fcf8f49e360f9f6b47bb3b1e217dac7d482bd4db286b4459b85e8952eca31ad6b85ccb3e846c03794ed782e91ff8', '14481836-9a21-11e7-a015-d481d7d52d39'),
	(14, 'test7', '2b293ebf3581ddb9d005f3f6a07b6d6d1d80fc87f2b15b8c0d029d36962ab4023ae244a69d96a74b778686a2c7da3ead99e5dcd97c23a8df0089855480e8ca76', '20c3055f-9a21-11e7-a015-d481d7d52d39'),
	(18, 'test8', '2b3eb1702b902d8783fcf6a1ed816870dfd94f04377199a7790e4454689783bfaca8028ccd7c2c1c844b1b9be9b6fd2765ea51323615ed12aa6e77d027a8c72c', '431fae93-9a21-11e7-a015-d481d7d52d39'),
	(19, 'test9', '1fe2350dcfff0eb4a4afbb89f3d3afaf9cd4e2526b75fb1931574f75292c794dbdbfe8b9be41e45cb9972258ed1e67f8125539c7991e4e153d9865faae252efd', '43271e49-9a21-11e7-a015-d481d7d52d39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.user_person
CREATE TABLE IF NOT EXISTS `user_person` (
  `user_person_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`user_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table cancer_sucks.user_person: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_person` ENABLE KEYS */;

-- Dumping structure for table cancer_sucks.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `user_role_description` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table cancer_sucks.user_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
