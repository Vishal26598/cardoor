-- MySQL dump 10.13  Distrib 8.0.13, for Linux (x86_64)
--
-- Host: localhost    Database: cardoor
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
  CONSTRAINT `fkuid` FOREIGN KEY (`uid`) REFERENCES `customer` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (18,1,'BR-01AA-1234',9,'2018-11-26 22:08:18','11/07/2018','3','11/08/2018','14'),(19,6,'BR-09BB-8790',10,'2018-11-26 22:17:46','12/11/2018','1','12/13/2018','24');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (9,'Tanzy','9097686222','Tanzytia@gmail.com','123456',20,'908912678976'),(10,'Aditi','8296879147','agrawaladiti1112@gmail.com','aditi7774',20,'A327479013452678');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `v_no` VALUES ('BR-01AA-1234',1,1),('BR-02GT-1987',12,0),('BR-03KR-8213',1,0),('BR-07TF-6756',3,0),('BR-09BB-8790',6,1),('BR-10ED-7654',5,0),('BR-10JH-9870',4,0),('BR-11GT-1289',9,0),('BR-12LK-5454',10,0),('BR-13PR-8675',2,0),('BR-19ES-5673',11,0),('BR-65SW-0098',8,0),('DL-06TE-0993',11,0),('DL-08FD-8769',3,0),('DL-08LM-5465',2,0),('DL-10SD-7689',6,0),('DL-11TE-0012',12,0),('DL-12FR-7654',1,0),('DL-13DF-9786',1,0),('DL-14FF-9786',5,0),('DL-16TR-0936',4,0),('DL-54RT-0900',7,0),('DL-76AB-6567',6,0),('DL-87TG-0001',9,0),('DL-90LP-4448',8,0),('HR-01ED-0345',9,0),('HR-02GF-9090',10,0),('HR-07GT-0987',6,0),('HR-09AB-8768',5,0),('HR-09LK-7888',7,0),('HR-09RD-5543',11,0),('HR-09UI-7777',7,0),('HR-11BA-4321',1,0),('HR-11IE-1012',12,0),('HR-11KI-6754',4,0),('HR-12TR-7654',2,0),('HR-17VD-8907',3,0),('HR-23YR-8213',1,0),('HR-67TF-7899',8,0),('JK-15DR-8765',1,0),('KA-00AA-8799',9,0),('KA-02AZ-5678',1,0),('KA-02EB-1986',10,0),('KA-03RT-4557',12,0),('KA-07RT-5423',3,0),('KA-09LJ-3546',2,0),('KA-10HR-1342',4,0),('KA-10KJ-5548',8,0),('KA-13PR-4352',1,0),('KA-15RR-0909',5,0),('KA-16EF-0009',6,0),('KA-16RW-8777',11,0),('KA-90FT-8787',7,0),('UP-01RF-9922',10,0),('UP-02GF-6565',9,0),('UP-03AP-8657',1,0),('UP-04GR-5432',2,0),('UP-04PT-0980',7,0),('UP-08KL-0908',7,0),('UP-08NH-8987',6,0),('UP-09QS-5873',11,0),('UP-10GH-5433',12,0),('UP-11GF-9087',5,0),('UP-15TF-7658',4,0),('UP-18VE-0987',3,0),('UP-22AE-9086',10,0),('UP-55FF-4098',8,0);
/*!40000 ALTER TABLE `v_no` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vdetails`
--

DROP TABLE IF EXISTS `vdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `vdetails` VALUES (1,'Hyundai i20 Magna',50,9),(2,'Mahindra Verito',60,5),(3,'Hyundai Eon',40,5),(4,'Maruti Swift',60,5),(5,'Maruti Ritz',50,5),(6,'Maruti Suzuki Baleno',70,4),(7,'Ford Aspire',50,5),(8,'Wagon R',60,5),(9,'Hyundai Grand i10',60,5),(10,'Tata Bolt',40,5),(11,'Mahindra Scorpio',100,5),(12,'Celerio',40,2);
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

-- Dump completed on 2018-11-26 23:18:38
