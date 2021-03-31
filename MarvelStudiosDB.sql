-- MySQL dump 10.14  Distrib 5.5.57-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: marvelstudiosdb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB

DROP SCHEMA IF EXISTS `marvelstudiosdb`;
CREATE SCHEMA `marvelstudiosdb`;
USE `marvelstudiosdb`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `act_char`
--

DROP TABLE IF EXISTS `act_char`;
/*!50001 DROP VIEW IF EXISTS `act_char`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `act_char` (
  `Characters` tinyint NOT NULL,
  `Actors` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `actorID` char(5) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `sex` enum('male','female') DEFAULT NULL,
  `oscarsWon` int(10) unsigned DEFAULT NULL,
  `charName` varchar(45) NOT NULL,
  PRIMARY KEY (`actorID`),
  KEY `fk_actors_characters1_idx` (`charName`),
  CONSTRAINT `FK_actors_charName` FOREIGN KEY (`charName`) REFERENCES `characters` (`charName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES ('A01','Robert Downey Jr','American','1965-04-04','male',NULL,'Iron Man'),('A02','Edward Norton','American','1969-08-19','male',2,'Hulk'),('A08','Chris Hemsworth','Australian','1983-08-11','male',5,'Thor'),('A12','Chris Evans','American','1981-06-13','male',7,'Captain America'),('A14','Elizabeth Olsen','American','1989-02-16','female',NULL,'Scarlet Witch'),('A15','Mark Ruffalo','American','1967-11-22','male',NULL,'Hulk'),('A20','Benedict Cumberbatch','Englishman','1976-07-19','male',4,'Doctor Strange');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MarvelStudiosDB`.`actors_BEFORE_INSERT` BEFORE INSERT ON `actors` FOR EACH ROW
BEGIN
	IF(NEW.dateOfBirth < '1900-01-01' ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid date of birth';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MarvelStudiosDB`.`actors_BEFORE_UPDATE` BEFORE UPDATE ON `actors` FOR EACH ROW
BEGIN
	IF(NEW.dateOfBirth < '1900-01-01' ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid date of birth';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `char_abilities`
--

DROP TABLE IF EXISTS `char_abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `char_abilities` (
  `abilities` varchar(45) NOT NULL,
  `charName` varchar(45) NOT NULL,
  PRIMARY KEY (`abilities`,`charName`),
  KEY `charName_idx` (`charName`),
  CONSTRAINT `FK_charName` FOREIGN KEY (`charName`) REFERENCES `characters` (`charName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `char_abilities`
--

LOCK TABLES `char_abilities` WRITE;
/*!40000 ALTER TABLE `char_abilities` DISABLE KEYS */;
INSERT INTO `char_abilities` VALUES ('Captain America','speed'),('Captain America','stamina'),('Captain America','superhuman strength'),('Hulk','invulnerability'),('Hulk','superhuman strength'),('Scarlet Witch','chaos magic reality warping');
/*!40000 ALTER TABLE `char_abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `charName` varchar(45) NOT NULL,
  `species` enum('human','eternal-deviant hybrid','human mutate','asgardian') DEFAULT NULL,
  `dateOfBirth` int(4) unsigned DEFAULT NULL,
  `item` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`charName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES ('Captain America','human',1920,'vibranium made shield'),('Doctor Strange','human',NULL,'cloak of levitation'),('Hulk','human',1969,NULL),('Iron Man','human',1970,'powered armor suit'),('Scarlet Witch','human mutate',1998,NULL),('Thanos','eternal-deviant hybrid',1013,NULL),('Thor','asgardian',964,'mighty hammer Mjolnir');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters_participatein_events`
--

DROP TABLE IF EXISTS `characters_participatein_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters_participatein_events` (
  `characters_charName` varchar(45) NOT NULL,
  `events_eventID` char(5) NOT NULL,
  `events_movieName` varchar(45) NOT NULL,
  PRIMARY KEY (`characters_charName`,`events_eventID`,`events_movieName`),
  KEY `fk_characters_has_events_events1_idx` (`events_eventID`,`events_movieName`),
  KEY `fk_characters_has_events_characters1_idx` (`characters_charName`),
  CONSTRAINT `fk_characters_has_events_characters1` FOREIGN KEY (`characters_charName`) REFERENCES `characters` (`charName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_characters_has_events_events1` FOREIGN KEY (`events_eventID`, `events_movieName`) REFERENCES `events` (`eventID`, `movieName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters_participatein_events`
--

LOCK TABLES `characters_participatein_events` WRITE;
/*!40000 ALTER TABLE `characters_participatein_events` DISABLE KEYS */;
INSERT INTO `characters_participatein_events` VALUES ('Captain America','E01','Captain America: The First Avenger'),('Captain America','E05','Marvel\'s The Avengers'),('Iron Man','E05','Marvel\'s The Avengers'),('Spider-Man','E02','Spider-Man: Homecoming'),('Thanos','E04','Avengers: Infinity War');
/*!40000 ALTER TABLE `characters_participatein_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directors` (
  `directorID` char(5) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `sex` enum('male','female') DEFAULT NULL,
  PRIMARY KEY (`directorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES ('D01','Jon Favreau','American','1996-10-19','male'),('D02','Louis Leterrier','French','1973-06-17','male'),('D03','Anthony Russo','American','1970-02-03','male'),('D04','Joe Russo','American','1971-07-18','male'),('D05','Taika Waititi','New Zealander','1975-08-16','male'),('D06','Scott Derrickson','American','1996-07-16','male');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MarvelStudiosDB`.`directors_BEFORE_INSERT` BEFORE INSERT ON `directors` FOR EACH ROW
BEGIN
	IF(NEW.dateOfBirth < '1900-01-01' ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid date of birth';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MarvelStudiosDB`.`directors_BEFORE_UPDATE` BEFORE UPDATE ON `directors` FOR EACH ROW
BEGIN
	IF(NEW.dateOfBirth < '1900-01-01' ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid date of birth';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `event_char`
--

DROP TABLE IF EXISTS `event_char`;
/*!50001 DROP VIEW IF EXISTS `event_char`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `event_char` (
  `Characters` tinyint NOT NULL,
  `Type` tinyint NOT NULL,
  `Description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventID` char(5) NOT NULL,
  `type` enum('battle','death','creation','victory') DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `locationID` char(5) DEFAULT NULL,
  `movieName` varchar(45) NOT NULL,
  PRIMARY KEY (`eventID`,`movieName`),
  KEY `fk_events_locations_idx` (`locationID`),
  KEY `fk_events_movies1_idx` (`movieName`),
  CONSTRAINT `fk_events_locations` FOREIGN KEY (`locationID`) REFERENCES `locations` (`locationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_movies1` FOREIGN KEY (`movieName`) REFERENCES `movies` (`movieName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES ('E01','creation','Steve Rogers becomes Captain America','L10','Captain America: The First Avenger'),('E02','creation','Peter Parker is bitten by a genetically altered spider and becomes Spider-Man','L06','Spider-Man: Homecoming'),('E03','victory','Doctor Strange becomes the new protector of the New York Sanctum','L06','Doctor Strange'),('E04','death','Thanos sacrifices Gamora and retrieves the Soul Stone','L25','Avengers: Infinity War'),('E05','battle','Battle of New York','L06','Marvel\'s The Avengers'),('E06','battle','War of the Nine Realms','L25','Thor: The Dark World');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `locationID` char(5) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `planet` varchar(45) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('L01','Wakanda','Earth',29.4155,30.382),('L02','Asgard','Nine Realms',NULL,NULL),('L03','Sokovia','Earth',-8.792,121.771492),('L04','Washington D.C','Earth',38.53424,77.21093),('L05','Stark Tower','Earth',40.78333,-73.966667),('L06','New York City','Earth',40.73061,-73.935242),('L25','Nine Realms','Nine Realms',NULL,NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `mov_prod_div`
--

DROP TABLE IF EXISTS `mov_prod_div`;
/*!50001 DROP VIEW IF EXISTS `mov_prod_div`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `mov_prod_div` (
  `Movie` tinyint NOT NULL,
  `Producers` tinyint NOT NULL,
  `Directors` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `movieName` varchar(45) NOT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `sequenceOfEvents` int(10) unsigned DEFAULT NULL,
  `oscarsWon` int(10) unsigned DEFAULT NULL,
  `budget` int(10) unsigned DEFAULT NULL,
  `boxOffice` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`movieName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES ('Avengers: Endgame',181,'2019-04-22',22,NULL,356000000,2798000000),('Captain America: The Winter Soldier',124,'2008-06-13',10,3,175000000,714700000),('Doctor Strange',115,'2014-04-04',17,7,185000000,677700000),('Eternals',NULL,'2021-11-05',NULL,NULL,200000000,NULL),('Iron man',126,'2008-05-02',3,8,140000000,585300000),('The Incredible Hulk',112,'2008-06-13',5,NULL,150000000,246800000),('Thor: Ragnarok',130,'2017-11-04',19,NULL,180000000,854000000),('Thor: The Dark World',112,'2013-10-22',8,NULL,170000000,644800000);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MarvelStudiosDB`.`movies_BEFORE_INSERT` BEFORE INSERT ON `movies` FOR EACH ROW
BEGIN
	IF(NEW.duration <= 0 ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MarvelStudiosDB`.`movies_BEFORE_UPDATE` BEFORE UPDATE ON `movies` FOR EACH ROW
BEGIN
	IF(NEW.duration <= 0 ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movies_have_characters`
--

DROP TABLE IF EXISTS `movies_have_characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_have_characters` (
  `movieName` varchar(45) NOT NULL,
  `charName` varchar(45) NOT NULL,
  PRIMARY KEY (`movieName`,`charName`),
  KEY `fk_movies_has_characters_characters1_idx` (`charName`),
  KEY `fk_movies_has_characters_movies1_idx` (`movieName`),
  CONSTRAINT `fk_movies_has_characters_movies1` FOREIGN KEY (`movieName`) REFERENCES `movies` (`movieName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movies_has_characters_characters1` FOREIGN KEY (`charName`) REFERENCES `characters` (`charName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_have_characters`
--

LOCK TABLES `movies_have_characters` WRITE;
/*!40000 ALTER TABLE `movies_have_characters` DISABLE KEYS */;
INSERT INTO `movies_have_characters` VALUES ('Avengers: Endgame','Captain America'),('Avengers: Endgame','Hulk'),('Avengers: Endgame','Iron Man'),('Captain America: The Winter Soldier','Captain America'),('Iron Man','Iron Man'),('The Incredible Hulk','Hulk'),('Thor: Ragnarok','Thor');
/*!40000 ALTER TABLE `movies_have_characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_have_directors`
--

DROP TABLE IF EXISTS `movies_have_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_have_directors` (
  `movieName` varchar(45) NOT NULL,
  `directorID` char(5) NOT NULL,
  PRIMARY KEY (`movieName`,`directorID`),
  KEY `fk_movies_has_directors_directors1_idx` (`directorID`),
  KEY `fk_movies_has_directors_movies1_idx` (`movieName`),
  CONSTRAINT `fk_movies_has_directors_movies1` FOREIGN KEY (`movieName`) REFERENCES `movies` (`movieName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movies_has_directors_directors1` FOREIGN KEY (`directorID`) REFERENCES `directors` (`directorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_have_directors`
--

LOCK TABLES `movies_have_directors` WRITE;
/*!40000 ALTER TABLE `movies_have_directors` DISABLE KEYS */;
INSERT INTO `movies_have_directors` VALUES ('Avengers: Endgame','D03'),('Avengers: Endgame','D04'),('Captain America: The Winter Soldier','D03'),('Captain America: The Winter Soldier','D04'),('Doctor Strange','D06'),('Iron Man','D01'),('The Incredible Hulk','D02');
/*!40000 ALTER TABLE `movies_have_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_have_producers`
--

DROP TABLE IF EXISTS `movies_have_producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_have_producers` (
  `movieName` varchar(45) NOT NULL,
  `producerID` char(5) NOT NULL,
  PRIMARY KEY (`movieName`,`producerID`),
  KEY `fk_movies_has_producers_producers1_idx` (`producerID`),
  KEY `fk_movies_has_producers_movies1_idx` (`movieName`),
  CONSTRAINT `fk_movies_has_producers_movies1` FOREIGN KEY (`movieName`) REFERENCES `movies` (`movieName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movies_has_producers_producers1` FOREIGN KEY (`producerID`) REFERENCES `producers` (`producerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_have_producers`
--

LOCK TABLES `movies_have_producers` WRITE;
/*!40000 ALTER TABLE `movies_have_producers` DISABLE KEYS */;
INSERT INTO `movies_have_producers` VALUES ('Captain America: The Winter Soldier','P01'),('Doctor Strange','P01'),('The Incredible Hulk','P01'),('The Incredible Hulk','P02'),('The Incredible Hulk','P03');
/*!40000 ALTER TABLE `movies_have_producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producers`
--

DROP TABLE IF EXISTS `producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producers` (
  `producerID` char(5) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `sex` enum('male','female') DEFAULT NULL,
  PRIMARY KEY (`producerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producers`
--

LOCK TABLES `producers` WRITE;
/*!40000 ALTER TABLE `producers` DISABLE KEYS */;
INSERT INTO `producers` VALUES ('P01','Kevin Feige','1973-06-02','male'),('P02','Avi Arad','1948-04-18','male'),('P03','Gale Anne Hurd','1955-10-25','female'),('P04','Amy Pascal','1958-03-25','female'),('P05','Stephen Broussard',NULL,'male');
/*!40000 ALTER TABLE `producers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MarvelStudiosDB`.`producers_BEFORE_INSERT` BEFORE INSERT ON `producers` FOR EACH ROW
BEGIN
	IF(NEW.dateOfBirth < '1900-01-01' ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid date of birth';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MarvelStudiosDB`.`producers_BEFORE_UPDATE` BEFORE UPDATE ON `producers` FOR EACH ROW
BEGIN
	IF(NEW.dateOfBirth < '1900-01-01' ) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'invalid date of birth';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `act_char`
--

/*!50001 DROP TABLE IF EXISTS `act_char`*/;
/*!50001 DROP VIEW IF EXISTS `act_char`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `act_char` AS select `characters`.`charName` AS `Characters`,`actors`.`name` AS `Actors` from (`characters` join `actors` on((`characters`.`charName` = `actors`.`charName`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `event_char`
--

/*!50001 DROP TABLE IF EXISTS `event_char`*/;
/*!50001 DROP VIEW IF EXISTS `event_char`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `event_char` AS select `characters`.`charName` AS `Characters`,`events`.`type` AS `Type`,`events`.`description` AS `Description` from ((`characters` join `characters_participatein_events` on((`characters`.`charName` = `characters_participatein_events`.`characters_charName`))) join `events` on((`characters_participatein_events`.`events_eventID` = `events`.`eventID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mov_prod_div`
--

/*!50001 DROP TABLE IF EXISTS `mov_prod_div`*/;
/*!50001 DROP VIEW IF EXISTS `mov_prod_div`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mov_prod_div` AS select `movies_have_directors`.`movieName` AS `Movie`,`producers`.`name` AS `Producers`,`directors`.`name` AS `Directors` from (((`producers` join `movies_have_producers` on((`movies_have_producers`.`producerID` = `producers`.`producerID`))) join `movies_have_directors` on((`movies_have_directors`.`movieName` = `movies_have_producers`.`movieName`))) join `directors` on((`movies_have_directors`.`directorID` = `directors`.`directorID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-18 16:48:53
