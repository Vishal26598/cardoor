-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cardoor
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB-3

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
  KEY `fkuid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (18,1,'BR-01AA-1234',9,'2018-11-26 22:08:18','11/07/2018','3','11/08/2018','14'),(19,6,'BR-09BB-8790',10,'2018-11-26 22:17:46','12/11/2018','1','12/13/2018','24'),(20,1,'BR-03KR-8213',11,'2018-11-27 14:34:38','12/04/2018','14','11/28/2018','16'),(21,1,'DL-13DF-9786',11,'2018-11-30 01:33:36','12/04/2018','19','11/28/2018','17'),(22,2,'BR-13PR-8675',11,'2018-11-30 09:43:33','12/04/2018','15','12/14/2018','16'),(23,2,'DL-08LM-5465',13,'2018-11-30 13:00:45','12/04/2018','18','11/29/2018','18'),(24,1,'HR-11BA-4321',11,'2018-12-04 00:46:52','11/24/2018','16','11/25/2018','15'),(25,3,'BR-07TF-6756',11,'2018-12-04 00:47:41','12/04/2018','14','11/27/2018','19'),(26,1,'HR-23YR-8213',11,'2018-12-04 02:13:50','11/29/2018','17','11/27/2018','17'),(27,1,'JK-15DR-8765',11,'2018-12-04 02:14:09','12/04/2018','19','11/30/2018','17'),(28,1,'KA-02AZ-5678',11,'2018-12-04 02:16:18','12/04/2018','19','11/30/2018','17'),(29,4,'BR-10JH-9870',11,'2018-12-04 02:16:44','12/04/2018','18','11/29/2018','18'),(31,5,'abc',1,'0000-00-00 00:00:00','11/11/11','20','12/11/11','20'),(33,5,'BR-10ED-7654',11,'2018-12-04 08:27:51','12/04/2018','18','12/05/2018','18'),(34,1,'UP-03AP-8657',15,'2018-12-04 09:12:22','12/05/2018','0','12/06/2018','12'),(35,2,'HR-12TR-7654',15,'2018-12-04 12:46:19','12/04/2018','18','12/05/2018','18'),(36,9,'BR-11GT-1289',11,'2018-12-06 01:07:26','12/12/2018','10','12/13/2018','17'),(37,5,'DL-14FF-9786',17,'2018-12-11 23:09:06','12/12/2018','8','12/13/2018','16');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (9,'Tanzy','9097686222','Tanzytia@gmail.com','123456',20,'908912678976'),(10,'Aditi','8296879147','agrawaladiti1112@gmail.com','aditi7774',20,'A327479013452678'),(11,'tarun','114516516','abc@gmail.com','1234',20,'2334123442'),(12,'','','','',0,''),(13,'tia','9431840545','xyz@gmail.com','123456',21,'BH12345666777'),(14,'Ankit','23456789876','ANKITKASHYAP398@gmail.com','ankit',21,'BH123456777'),(15,'xyz','98767890876','xyza@gmail.com','12345',21,'MJHTGH124537'),(16,'vishal','7027555408','vishal@gmail.com','78945',21,'787878787878'),(17,'ankit','99','loda@gmail.com','1234',65,'655');
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
INSERT INTO `payment` VALUES (1,100,20,0,120),(2,100,20,0,0),(3,100,18,0,0),(4,100,0,0,0),(5,100,18,0,118),(31,50,9,0,59),(33,1200,216,0,1416),(34,1800,324,0,2124),(35,1440,259,0,1699),(36,1860,335,0,2195),(37,1600,288,0,1888);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tax_sum before insert on payment for each row set 
new.tax = 0.18 * new.basefare, 
new.total = new.tax + new.basefare */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `v_no` VALUES ('BR-01AA-1234',1,1),('BR-02GT-1987',12,0),('BR-03KR-8213',1,1),('BR-07TF-6756',3,1),('BR-09BB-8790',6,1),('BR-10ED-7654',5,1),('BR-10JH-9870',4,1),('BR-11GT-1289',9,1),('BR-12LK-5454',10,1),('BR-13PR-8675',2,1),('BR-19ES-5673',11,0),('BR-65SW-0098',8,1),('DL-06TE-0993',11,0),('DL-08FD-8769',3,0),('DL-08LM-5465',2,1),('DL-10SD-7689',6,0),('DL-11TE-0012',12,0),('DL-12FR-7654',1,1),('DL-13DF-9786',1,1),('DL-14FF-9786',5,1),('DL-16TR-0936',4,0),('DL-54RT-0900',7,1),('DL-76AB-6567',6,0),('DL-87TG-0001',9,0),('DL-90LP-4448',8,0),('HR-01ED-0345',9,0),('HR-02GF-9090',10,0),('HR-07GT-0987',6,0),('HR-09AB-8768',5,0),('HR-09LK-7888',7,0),('HR-09RD-5543',11,0),('HR-09UI-7777',7,0),('HR-11BA-4321',1,1),('HR-11IE-1012',12,0),('HR-11KI-6754',4,0),('HR-12TR-7654',2,1),('HR-17VD-8907',3,0),('HR-23YR-8213',1,1),('HR-67TF-7899',8,0),('JK-15DR-8765',1,1),('KA-00AA-8799',9,0),('KA-02AZ-5678',1,1),('KA-02EB-1986',10,0),('KA-03RT-4557',12,0),('KA-07RT-5423',3,0),('KA-09LJ-3546',2,1),('KA-10HR-1342',4,0),('KA-10KJ-5548',8,0),('KA-13PR-4352',1,1),('KA-15RR-0909',5,0),('KA-16EF-0009',6,0),('KA-16RW-8777',11,0),('KA-90FT-8787',7,0),('UP-01RF-9922',10,0),('UP-02GF-6565',9,0),('UP-03AP-8657',1,1),('UP-04GR-5432',2,0),('UP-04PT-0980',7,0),('UP-08KL-0908',7,0),('UP-08NH-8987',6,0),('UP-09QS-5873',11,0),('UP-10GH-5433',12,0),('UP-11GF-9087',5,0),('UP-15TF-7658',4,0),('UP-18VE-0987',3,0),('UP-22AE-9086',10,0),('UP-55FF-4098',8,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vdetails`
--

LOCK TABLES `vdetails` WRITE;
/*!40000 ALTER TABLE `vdetails` DISABLE KEYS */;
INSERT INTO `vdetails` VALUES (1,'Hyundai i20 Magna',50,0),(2,'Mahindra Verito',60,1),(3,'Hyundai Eon',40,4),(4,'Maruti Swift',60,4),(5,'Maruti Ritz',50,3),(6,'Maruti Suzuki Baleno',70,4),(7,'Ford Aspire',50,4),(8,'Wagon R',60,4),(9,'Hyundai Grand i10',60,4),(10,'Tata Bolt',40,4),(11,'Mahindra Scorpio',100,5),(12,'Celerio',40,2);
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

-- Dump completed on 2019-01-19 14:59:52
