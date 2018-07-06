-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: carrental
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `availability`
--

DROP TABLE IF EXISTS `availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `availability` (
  `Vehicle_id` int(4) NOT NULL,
  `Available_start` date DEFAULT NULL,
  `Available_end` date DEFAULT NULL,
  PRIMARY KEY (`Vehicle_id`),
  CONSTRAINT `availability_ibfk_1` FOREIGN KEY (`Vehicle_id`) REFERENCES `car` (`Vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability`
--

LOCK TABLES `availability` WRITE;
/*!40000 ALTER TABLE `availability` DISABLE KEYS */;
INSERT INTO `availability` VALUES (1012,'2018-04-20','2018-05-20'),(1013,'2018-04-24','2018-05-20'),(1014,'2018-04-21','2018-05-20'),(1015,'2018-04-20','2018-05-20'),(1016,'2018-04-20','2018-05-20'),(1017,'2018-04-20','2018-05-20'),(1019,'2018-04-20','2018-05-20'),(1020,'2018-04-20','2018-05-20'),(1021,'2018-04-20','2018-05-20'),(1022,'2018-04-25','2018-05-20'),(1023,'2018-04-20','2018-05-20'),(1024,'2018-04-24','2018-05-20'),(1025,'2018-04-20','2018-05-20'),(1026,'2018-04-20','2018-05-20'),(1027,'2018-04-25','2018-05-20'),(1028,'2018-04-20','2018-05-20'),(1029,'2018-04-20','2018-05-20'),(1030,'2018-04-25','2018-05-20'),(1031,'2018-04-20','2018-05-20'),(1032,'2018-04-20','2018-05-20'),(1033,'2018-04-20','2018-05-20'),(1034,'2018-04-20','2018-05-20'),(1035,'2018-04-20','2018-05-20'),(1036,'2018-04-21','2018-05-21'),(1037,'2018-04-21','2018-05-21');
/*!40000 ALTER TABLE `availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `Vehicle_id` int(4) NOT NULL AUTO_INCREMENT,
  `Model` varchar(10) DEFAULT NULL,
  `Year` decimal(4,0) DEFAULT NULL,
  `Type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Vehicle_id`),
  KEY `Type_id` (`Type_id`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`Type_id`) REFERENCES `cartype` (`Type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1038 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1001,'Ford',2018,1),(1002,'Ford',2018,1),(1003,'Ford',1991,5),(1004,'Chevy',1992,2),(1005,'Chevy',1889,3),(1007,'honda',1990,4),(1012,'Chevy',2008,1),(1013,'Ford',2009,5),(1014,'Toyota',2010,2),(1015,'BMW',2011,3),(1016,'Benz',2012,4),(1017,'Honda City',1990,6),(1018,'Jaguar',1991,1),(1019,'Jaguar',1991,1),(1020,'Ferrari',1992,5),(1021,'Buggaati',1993,2),(1022,'Porsche',2014,3),(1023,'Volvo',2017,4),(1024,'Chevy',2008,1),(1025,'Ford',2009,5),(1026,'Toyota',2010,2),(1027,'BMW',2011,3),(1028,'Benz',2012,4),(1029,'Honda City',1990,6),(1030,'Jaguar',1991,1),(1031,'Ferrari',1992,5),(1032,'Buggaati',1993,2),(1033,'Porche',2014,3),(1034,'Volvo',2017,4),(1035,'Chevrolet',1998,6),(1036,'Ferrari',2016,4),(1037,'toyata',2011,5);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartype`
--

DROP TABLE IF EXISTS `cartype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartype` (
  `Type_id` int(11) NOT NULL,
  `Weekly_rate` decimal(5,2) DEFAULT NULL,
  `Daily_rate` decimal(5,2) DEFAULT NULL,
  `Car_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartype`
--

LOCK TABLES `cartype` WRITE;
/*!40000 ALTER TABLE `cartype` DISABLE KEYS */;
INSERT INTO `cartype` VALUES (1,100.50,10.50,'van'),(2,100.00,6.00,'compact'),(3,300.50,30.50,'medium'),(4,400.50,40.50,'large'),(5,500.50,50.50,'suv'),(6,600.50,60.50,'truck');
/*!40000 ALTER TABLE `cartype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Idno` int(11) NOT NULL AUTO_INCREMENT,
  `Phone` varchar(12) DEFAULT NULL,
  `Customer_type` varchar(20) DEFAULT NULL,
  `Initial` char(1) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `Cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Idno`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (12,'123-456-7890','Individual','S','Shree',NULL),(13,'234-567-8901','Individual','R','Surya',NULL),(14,'345-678-9012','Individual','P','Priya',NULL),(15,'456-789-0123','Individual','U','Ramya',NULL),(16,'567-890-1234','Individual','A','Kavya',NULL),(17,'678-901-2345','Company',NULL,NULL,'Google'),(18,'789-012-3456','Company',NULL,NULL,'Wiseloan'),(19,'890-123-4567','Company',NULL,NULL,'Redhat'),(20,'901-234-5678','Company',NULL,NULL,'WWE'),(21,'101-101-1101','Company',NULL,NULL,'EF Johnson'),(22,'653-276-1234','Individual','a','avinash',NULL),(23,'425-876-1324','Company',NULL,NULL,'tcs');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owner` (
  `Owner_id` int(11) NOT NULL,
  `Owner_type` varchar(20) DEFAULT NULL,
  `Cname` varchar(20) DEFAULT NULL,
  `Bname` varchar(20) DEFAULT NULL,
  `Fname` varchar(20) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (11,'Company','HPE',NULL,NULL,NULL),(12,'Company','Ericson',NULL,NULL,NULL),(13,'Bank',NULL,'Axis',NULL,NULL),(14,'Bank',NULL,'HDFC',NULL,NULL),(15,'Individual',NULL,NULL,'Shree','Shilpa'),(16,'Individual',NULL,NULL,'Surya','Ritin'),(1001540443,'Bank',NULL,'Axis Bank',NULL,NULL);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rents`
--

DROP TABLE IF EXISTS `rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rents` (
  `Customer_id` int(11) NOT NULL,
  `Vehicle_id` int(4) NOT NULL,
  `Start_date` date DEFAULT NULL,
  `Return_date` date DEFAULT NULL,
  `Amount_due` decimal(10,2) DEFAULT NULL,
  `Noofdays` int(11) DEFAULT NULL,
  `Noofweeks` int(11) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `Scheduled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`,`Vehicle_id`),
  KEY `Vehicle_id` (`Vehicle_id`),
  CONSTRAINT `rents_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Idno`),
  CONSTRAINT `rents_ibfk_2` FOREIGN KEY (`Vehicle_id`) REFERENCES `car` (`Vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rents`
--

LOCK TABLES `rents` WRITE;
/*!40000 ALTER TABLE `rents` DISABLE KEYS */;
INSERT INTO `rents` VALUES (12,1024,'2018-04-20','2018-04-23',100.50,0,1,1,0),(12,1027,'2018-04-20','2018-04-24',122.00,4,0,1,0),(13,1022,'2018-04-20','2018-04-24',122.00,4,0,1,0),(14,1013,'2018-04-20','2018-04-23',151.50,3,0,1,0),(15,1030,'2018-04-20','2018-04-24',42.00,4,0,1,0);
/*!40000 ALTER TABLE `rents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_owner`
--

DROP TABLE IF EXISTS `vehicle_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_owner` (
  `Vehicle_id` int(4) NOT NULL,
  `Owner_id` int(11) NOT NULL,
  PRIMARY KEY (`Vehicle_id`,`Owner_id`),
  KEY `Owner_id` (`Owner_id`),
  CONSTRAINT `vehicle_owner_ibfk_1` FOREIGN KEY (`Vehicle_id`) REFERENCES `car` (`Vehicle_id`),
  CONSTRAINT `vehicle_owner_ibfk_2` FOREIGN KEY (`Owner_id`) REFERENCES `owner` (`Owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_owner`
--

LOCK TABLES `vehicle_owner` WRITE;
/*!40000 ALTER TABLE `vehicle_owner` DISABLE KEYS */;
INSERT INTO `vehicle_owner` VALUES (1012,11),(1019,11),(1029,11),(1035,11),(1013,12),(1020,12),(1024,12),(1030,12),(1014,13),(1021,13),(1025,13),(1031,13),(1037,13),(1015,14),(1022,14),(1026,14),(1032,14),(1016,15),(1023,15),(1027,15),(1033,15),(1036,15),(1017,16),(1028,16),(1034,16);
/*!40000 ALTER TABLE `vehicle_owner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-21  3:15:08
