-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cardoor
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `bid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cid` bigint(20) unsigned NOT NULL,
  `vehicle no` varchar(50) NOT NULL,
  `uid` bigint(20) unsigned NOT NULL,
  `booking date/time` datetime NOT NULL,
  `pickup date` varchar(20) DEFAULT NULL,
  `pickup time` varchar(20) DEFAULT NULL,
  `drop date` varchar(20) DEFAULT NULL,
  `drop time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  UNIQUE KEY `bid` (`bid`),
  KEY `fkuid` (`uid`),
  CONSTRAINT `fkuid` FOREIGN KEY (`uid`) REFERENCES `customer` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (2,2,'BR-10-1198',1,'2018-11-25 03:10:09','11/28/2018',NULL,'11/25/2018',NULL),(3,2,'HR-0IB-5767',1,'2018-11-25 03:13:56','11/30/2018','17','11/28/2018','18'),(4,2,'JR-01-3198',1,'2018-11-25 03:30:17','11/29/2018','18','12/14/2018','16'),(5,2,'JR-01-3498',1,'2018-11-25 03:33:38','11/28/2018','17','11/30/2018','11'),(6,2,'JR-10-3198',1,'2018-11-25 03:43:07','11/24/2018','17','11/30/2018','10'),(7,2,'KA-1WB-8797',1,'2018-11-25 03:43:50','11/24/2018','17','11/30/2018','10');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `UID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Mobile` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `DLNo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `UID` (`UID`),
  UNIQUE KEY `email` (`Email`),
  UNIQUE KEY `mobile` (`Mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'tarun','7027555409','test@gmail.com','1234',20,'623492347009');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `bid` bigint(20) NOT NULL,
  `basefare` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `penatly` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `v_no`
--

DROP TABLE IF EXISTS `v_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `v_no` (
  `vehicle no` varchar(50) NOT NULL,
  `cid` bigint(20) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`vehicle no`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_no`
--

LOCK TABLES `v_no` WRITE;
/*!40000 ALTER TABLE `v_no` DISABLE KEYS */;
INSERT INTO `v_no` VALUES ('BR-0A-4567',1,0),('BR-10-1198',2,0),('DL-0RT-4677',2,0),('HR-0AB-6567',3,0),('HR-0IB-5767',2,0),('JR-01-3198',2,0),('JR-01-3498',2,0),('JR-10-3198',2,0),('KA-1WB-8797',2,0);
/*!40000 ALTER TABLE `v_no` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vdetails`
--

DROP TABLE IF EXISTS `vdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vdetails` (
  `cid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name of car` varchar(50) NOT NULL,
  `rate/hour` int(11) NOT NULL,
  `avaialbility` int(11) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vdetails`
--

LOCK TABLES `vdetails` WRITE;
/*!40000 ALTER TABLE `vdetails` DISABLE KEYS */;
INSERT INTO `vdetails` VALUES (2,'i10',20,36),(3,'i10',20,9),(4,'i10',20,9),(5,'i10',20,9),(6,'i10',20,9),(7,'i10',20,9),(8,'i10',20,9),(10,'i30',20,0),(11,'i30',20,0),(12,'i30',20,0),(13,'i30',20,0),(14,'i40',20,5);
/*!40000 ALTER TABLE `vdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-25 13:16:42
