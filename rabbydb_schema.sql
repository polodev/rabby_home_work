-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: rabbydb
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `Author_Number` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`Author_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Author name one','1980-02-10'),(2,'Authon name two','1990-09-25'),(3,'Author name three','1975-01-01'),(4,'Author name four','1998-11-20'),(5,'Auhor name four ','1988-09-12'),(6,'Author Name Five','1995-04-29');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` varchar(20) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `PublishDate` date DEFAULT NULL,
  `PUBLISHER_PublisherID` int NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `fk_BOOK_PUBLISHER_idx` (`PUBLISHER_PublisherID`),
  CONSTRAINT `fk_BOOK_PUBLISHER` FOREIGN KEY (`PUBLISHER_PublisherID`) REFERENCES `publisher` (`PublisherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('0234567890','Business book one',27,'2019-10-10',4),('1123456789','Business book two',55,'2020-01-01',5),('1234567890','Science Book one',20,'2010-10-10',1),('1234567891','Science Book Two',25,'2000-01-05',1),('1234567892','Science Book trhee',10,'1990-02-01',2),('1234567893','Science Book four',15,'1997-09-22',1),('1234567894','commerce book one',22,'2011-11-11',5),('1234567895','commerce book two',60,'2002-09-12',4),('1234567896','commerce book three',45,'2003-06-15',3),('1234567897','Computer science one',40,'1998-09-19',2),('1234567898','Computer book two',35,'2009-04-25',1),('1234567899','Computer book three',31,'2008-01-29',3);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_has_author`
--

DROP TABLE IF EXISTS `book_has_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_has_author` (
  `AUTHOR_Author_Number` int NOT NULL,
  `BOOK_ISBN` varchar(20) NOT NULL,
  `RoyaltyPct` decimal(20,0) DEFAULT NULL,
  `LeadAuthor` tinyint DEFAULT NULL,
  `SequenceNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AUTHOR_Author_Number`,`BOOK_ISBN`),
  KEY `fk_BOOK_has_AUTHOR_AUTHOR1_idx` (`AUTHOR_Author_Number`),
  KEY `fk_BOOK_has_AUTHOR_BOOK1_idx` (`BOOK_ISBN`),
  CONSTRAINT `fk_BOOK_has_AUTHOR_AUTHOR1` FOREIGN KEY (`AUTHOR_Author_Number`) REFERENCES `author` (`Author_Number`),
  CONSTRAINT `fk_BOOK_has_AUTHOR_BOOK1` FOREIGN KEY (`BOOK_ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_has_author`
--

LOCK TABLES `book_has_author` WRITE;
/*!40000 ALTER TABLE `book_has_author` DISABLE KEYS */;
INSERT INTO `book_has_author` VALUES (1,'1234567890',2,1,'1'),(1,'1234567891',2,1,'2'),(1,'1234567893',2,1,'3'),(2,'1234567897',2,2,'1'),(2,'1234567898',3,2,'2'),(3,'0234567890',4,3,'1'),(4,'1234567895',3,4,'1'),(5,'1123456789',2,5,'1'),(6,'1234567899',3,6,'1');
/*!40000 ALTER TABLE `book_has_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_has_book`
--

DROP TABLE IF EXISTS `book_has_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_has_book` (
  `BOOK_ISBN` varchar(20) NOT NULL,
  `Series_ISBN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BOOK_ISBN`),
  CONSTRAINT `fk_BOOK_has_BOOK_BOOK1` FOREIGN KEY (`BOOK_ISBN`) REFERENCES `book` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_has_book`
--

LOCK TABLES `book_has_book` WRITE;
/*!40000 ALTER TABLE `book_has_book` DISABLE KEYS */;
INSERT INTO `book_has_book` VALUES ('0234567890','22334'),('1123456789','22334'),('1234567890','11223'),('1234567891','11223'),('1234567892','11223'),('1234567893','11223'),('1234567894','33445'),('1234567895','33445'),('1234567896','33445'),('1234567897','11223'),('1234567898','44556'),('1234567899','44556');
/*!40000 ALTER TABLE `book_has_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `PublisherID` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Publisher one'),(2,'Publisher two'),(3,'Publisher three'),(4,'Publisher four'),(5,'Publisher five');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-24 17:32:46
