CREATE DATABASE  IF NOT EXISTS `k00273405_black_jack` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `k00273405_black_jack`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: k00999999_framework_16
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `chatmsg`
--

DROP TABLE IF EXISTS `chatmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatmsg` (
  `msgID` int(11) NOT NULL AUTO_INCREMENT,
  `msgText` varchar(244) DEFAULT NULL,
  `dateTimeStamp` datetime DEFAULT current_timestamp(),
  `msgAuthorID` varchar(40) DEFAULT NULL,
  `userType` varchar(10) DEFAULT NULL,
  `msgTo` varchar(40) DEFAULT 'ALL',
  PRIMARY KEY (`msgID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatmsg`
--

LOCK TABLES `chatmsg` WRITE;
/*!40000 ALTER TABLE `chatmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `gamesId` int(11) NOT NULL,
  `gameResult` varchar(50) NOT NULL
  'gameDate' datetime DEFAULT current_timestamp(),
  'betAmount' int(11) NOT NULL,
  'created_at' datetime DEFAULT current_timestamp(),
  KEY `fk_user_user1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserNr` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `PassWord` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `idgame` int(11) NOT NULL,
  `userID` varchar(45) DEFAULT NULL,
  `userTypeNr` int(11) NOT NULL,
  `userEnabled` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`UserNr`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `userID_UNIQUE` (`userID`),
  KEY `fk_user_userType1_idx` (`userTypeNr`),
  CONSTRAINT `fk_user_userType1` FOREIGN KEY (`userTypeNr`) REFERENCES `usertype` (`userTypeNr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John','Smith','cf8f0c0d32522bc3d2ebe59d1fa46611d3369c96','jsmith@college.ie','0875869746',4,'jsmith@college.ie',1,1),(2,'Jane','Murphy','cf8f0c0d32522bc3d2ebe59d1fa46611d3369c96','janeh@mail.com','0871234567',13,'janeh@mail.com',3,1),(3,'Harry','Boland','cf8f0c0d32522bc3d2ebe59d1fa46611d3369c96','harry@lit.ie','01234567',2,'harry@lit.ie',3,1),(4,'James','Flannery','cf8f0c0d32522bc3d2ebe59d1fa46611d3369c96','flann@gmail.com','0875426984',3,'flann@gmail.com',2,1),(5,'James','Murphy','cf8f0c0d32522bc3d2ebe59d1fa46611d3369c96','james@framework.com','0862356897',19,'james@framework.com',3,1),(6,'Jack','McKeown','cf8f0c0d32522bc3d2ebe59d1fa46611d3369c96','jack@lit.ie','0875458745',8,'jack@lit.ie',2,1),(25,'elvis','presley','cf8f0c0d32522bc3d2ebe59d1fa46611d3369c96','presley@tus.ie','0865478745',2,'presley@tus.ie',3,1),(42,'Jimm','O','cf8f0c0d32522bc3d2ebe59d1fa46611d3369c96','jimmy@ob.com','085457854',3,'jimmy@ob.com',1,0),(44,'New','Customer','cf8f0c0d32522bc3d2ebe59d1fa46611d3369c96','cust@gmail.com','0854789654',2,'cust@gmail.com',3,1),(45,'John','Customer2','cf8f0c0d32522bc3d2ebe59d1fa46611d3369c96','cust2@cust.com','0587458745',5,'cust2@cust.com',3,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `userTypeNr` int(11) NOT NULL,
  `userTypeDescr` varchar(45) NOT NULL DEFAULT 'UNKNOWN',
  PRIMARY KEY (`userTypeNr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (1,'ADMIN'),(2,'DEALER'),(3,'PLAYER'),(99,'UNKNOWN');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'k00999999_framework_16'
--

--
-- Dumping routines for database 'k00999999_framework_16'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-12 11:54:04
