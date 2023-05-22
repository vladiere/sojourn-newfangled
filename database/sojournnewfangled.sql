-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: sojournnewfangled
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `access_token`
--

DROP TABLE IF EXISTS `access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_token` (
  `access_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_token`
--

LOCK TABLES `access_token` WRITE;
/*!40000 ALTER TABLE `access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `province` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `barangay` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (5,'weqr','qwer','wer','qwte',12442),(6,'gasg','gfas','sdag','asdg',124),(7,'asdfa','asdgasdfg','ashgasdf','asdfas',14123),(8,'sdf','ahagag','sgfg','shdf',5325),(9,'sadfagh','dhsfdh','sdfh','ASDFG',1246),(10,'sunset','under the sun','sungo','sogo',9090),(11,'abrot','bilbile','rotoro','toro',2920);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'john','anora','anora123','$2b$10$t/IdWaRLvsG/oZ1P9vQ9veC0bxC.4peCVcgSieOA.WEE2IdhZT6dq'),(2,'didis','diesd','dodo123','$2b$10$3dv8jeMZz6e.oTQSoaHhP.Y1kUn7l2mKI4joCRX0XG3xtwoK9iUGa'),(3,'hidi','hidi','hidi','$2b$10$PSiX8ZWnILudx4cWJmGvKOApuFb4JBBDuWEjP/4FcPfv7DSuHDL2q'),(4,'asdf','asdf','asdf','$2b$10$C.WRg3QP1NA.YU3W1achfu7dqxmtR7MSeZNVQTemVYQ5dMQ3wa2N2');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `building_id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `building_name` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `open_time` time NOT NULL,
  `address_id` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (2,1,'1684473194434sojourn-logo.png','qweqe',124,'11:55:00',5,'2023-05-19 13:13:29','2023-05-21 18:54:58','ready'),(3,1,'1684473352671sojourn-logo.png','aggs',3421,'10:51:00',6,'2023-05-19 13:16:06','2023-05-19 17:04:51','ready'),(4,1,'1684473399932sojourn-logo.png','tqwe',15134,'10:46:00',7,'2023-05-19 13:16:53','2023-05-21 00:30:44','ready'),(5,1,'1684473467043sojourn-logo.png','sdgahhj',15735,'00:00:00',8,'2023-05-19 13:18:02','2023-05-19 17:04:50','ready'),(6,1,'1684473522242sojourn-logo.png','ahgjhs',156425,'10:50:00',9,'2023-05-19 13:19:00','2023-05-19 17:04:49','ready'),(7,7,'1684491027548theology.png','theology boarding',1500,'08:00:00',10,'2023-05-19 18:11:21','2023-05-19 18:11:21','complicated'),(8,7,'1684491160520bible.png','bileele',1200,'09:00:00',11,'2023-05-19 18:13:12','2023-05-19 18:13:12','widow');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `files` blob,
  `message` text NOT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(45) NOT NULL,
  `customer_id` int NOT NULL,
  `buidling_id` int NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `birthdate` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'john123','$2b$10$z123ul4RLjlI4RBWu0dSxOIsErc4aS4XW4RA3rE9VIdfr3qVbH0vq','john customer','anora','yesedom590@appxapi.com','1212-12-04','0912346789','2023-05-17 22:30:39','2023-05-17 22:30:39'),(2,'123qwe','$2b$10$YxaOpg3TYND7dry5HvozreHzqtjKeBo86QmyQijRJZz4Ijs5WqpVO','qwe','qwe','email@email.com','1221-05-05','0987464103','2023-05-17 22:42:43','2023-05-17 22:42:43'),(3,'zxczz','$2b$10$BXsDAXhEr1oTjJydrtUXo.B5eSdbQggPADsVguApCmRbATGS5O.2a','zxczxc','zxczxc','zxc@azs.zxc','1313-07-13','0946012315','2023-05-17 22:47:28','2023-05-17 22:47:28'),(4,'testing123','$2b$10$in80BteKNG7RfdTtTDGVfeZKtSQvtcUQjQGRQMUEMNPcBEM0F0mKC','testing','test','test@test.com','1242-05-06','0963258963','2023-05-18 08:52:53','2023-05-18 08:52:53'),(5,'somu123','$2b$10$ShNJ6.hpg9kbUo.Zu9WP/.k8iJGhdy.Zd.t/BXkXnIUZWySGL0tSi','somuar','iroue','email@email.com','1233-12-04','0985632654','2023-05-20 23:57:40','2023-05-20 23:57:40'),(6,'thern123','$2b$10$kUXH8HvmtomOM/QUP1TDtuwkxdfl6bB0C1TgcwWUxOgRKCCuPyNIG','someti','thern','thern@email.com','1500-12-15','0987463214','2023-05-21 12:02:37','2023-05-21 12:02:37'),(7,'patty123','$2b$10$.okKwyTZGQTMByoMhaopB.scTJrW8AECIGUDPAc7W3RQgYdyRWIgu','patty','patskie','patskie@email.com','1600-05-05','0948964896','2023-05-21 12:45:26','2023-05-21 12:45:26');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `owner_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `birthdate` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'john123','$2b$10$S9J3aygtwz5uc/Omsi74luCKqfEJS7NES9aefwpG7bv4eo7raZjYW','john','anora','yesedom590@appxapi.com','1212-12-04','0912346789','2023-05-17 22:17:33','2023-05-17 22:17:33'),(5,'asdasd','$2b$10$BFk2fW58lYs/SKeqvjJ0Z.ZEzGExu2aR0VwwYBZ6ZrSV82KDGWPce','asd','asd','asd@email.com','1313-05-13','0946012313','2023-05-17 22:44:12','2023-05-17 22:44:12'),(7,'hado123','$2b$10$GMKSabyf2I4Rl1ghf..7Ku/tlsNnuvpTPFKTwaOHlpoJkGfUJPABu','hadoken','hado','hao@hao.dom','0800-12-12','0965326598','2023-05-19 18:04:06','2023-05-19 18:04:06');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `building_id` int NOT NULL,
  `number` varchar(45) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `amount` int NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,7,5,'09632145698','gcash',31470,'2023-05-22 00:25:53');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `rate_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `building_id` int NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `star` tinyint NOT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent` (
  `rent_id` int NOT NULL AUTO_INCREMENT,
  `building_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `day_in` varchar(45) NOT NULL,
  `day_out` varchar(45) NOT NULL,
  `total` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(45) NOT NULL DEFAULT 'pending',
  `notif_status` varchar(45) NOT NULL DEFAULT 'unread',
  PRIMARY KEY (`rent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `rent` VALUES (1,4,4,'2023/05/20','2023/05/23',45402,'2023-05-20 11:55:19','accept','read'),(2,4,5,'2023/05/22','2023/05/26',60536,'2023-05-20 23:57:59','accept','read'),(3,3,5,'2023/05/29','2023/05/31',6842,'2023-05-20 23:58:46','accept','read'),(4,5,5,'2023/05/30','2023/05/31',15735,'2023-05-21 00:00:18','decline','read'),(5,2,5,'2023/06/05','2023/06/08',372,'2023-05-21 00:07:56','accept','read'),(6,4,4,'2023/05/28','2023/05/31',45402,'2023-05-21 00:12:22','accept','read'),(7,2,4,'2023/06/04','2023/06/08',496,'2023-05-21 00:16:01','accept','read'),(8,8,7,'2023/07/02','2023/07/13',13200,'2023-05-21 12:46:07','accept','read'),(9,7,4,'2023/07/02','2023/07/05',4500,'2023-05-21 22:47:09','accept','read'),(10,8,4,'2023/05/23','2023/05/26',3600,'2023-05-21 22:49:54','accept','read'),(11,8,7,'2023/05/30','2023/05/31',1200,'2023-05-21 23:01:01','pending','unread'),(12,6,4,'2023/05/28','2023/05/31',469275,'2023-05-21 23:22:05','accept','read'),(13,5,4,'2023/05/29','2023/05/31',31470,'2023-05-21 23:22:51','pending','read'),(14,6,4,'2023/05/28','2023/05/31',469275,'2023-05-21 23:25:16','pending','read'),(15,6,4,'2023/05/28','2023/05/31',469275,'2023-05-22 00:17:53','pending','read'),(16,4,7,'2023/05/28','2023/05/30',30268,'2023-05-22 00:23:23','pending','read'),(17,6,7,'2023/05/28','2023/05/31',469275,'2023-05-22 00:23:57','pending','read'),(18,7,7,'2023/05/30','2023/05/31',1500,'2023-05-22 00:25:04','pending','unread'),(19,5,7,'2023/05/29','2023/05/31',31470,'2023-05-22 00:25:53','pending','read');
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rentedview`
--

DROP TABLE IF EXISTS `rentedview`;
/*!50001 DROP VIEW IF EXISTS `rentedview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rentedview` AS SELECT 
 1 AS `rent_id`,
 1 AS `customer_id`,
 1 AS `day_in`,
 1 AS `day_out`,
 1 AS `total`,
 1 AS `date_created`,
 1 AS `rent_status`,
 1 AS `rent_notif`,
 1 AS `img_url`,
 1 AS `owner_id`,
 1 AS `building_name`,
 1 AS `price`,
 1 AS `open_time`,
 1 AS `province`,
 1 AS `city`,
 1 AS `barangay`,
 1 AS `street`,
 1 AS `postal_code`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `payment_method`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewbuildings`
--

DROP TABLE IF EXISTS `viewbuildings`;
/*!50001 DROP VIEW IF EXISTS `viewbuildings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewbuildings` AS SELECT 
 1 AS `owner_id`,
 1 AS `building_id`,
 1 AS `img_url`,
 1 AS `building_name`,
 1 AS `price`,
 1 AS `open_hours`,
 1 AS `date_created`,
 1 AS `date_updated`,
 1 AS `location`,
 1 AS `building_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'sojournnewfangled'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_accessByAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_accessByAdmin`(
	IN p_desc VARCHAR(45)
)
BEGIN
	IF p_desc = 'owners' THEN
		SELECT owner_id, username, firstname, lastname, email, birthdate, phone_number, DATE_FORMAT(created_at, '%M %d, %Y') AS created_at, DATE_FORMAT(updated_at, '%M %d, %Y') AS updated_at FROM owners;
	ELSEIF p_desc = 'customers' THEN
		SELECT customer_id, username, firstname, lastname, email, birthdate, phone_number, DATE_FORMAT(created_at, '%M %d, %Y') AS created_at, DATE_FORMAT(updated_at, '%M %d, %Y') AS updated_at FROM customers;
    ELSE
		SELECT admin_id, firstname, lastname, username FROM admins;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_addBuilding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addBuilding`(
	IN p_id int,
	IN p_img VARCHAR(255),
	IN p_title VARCHAR(45),
	IN p_time VARCHAR(45),
    IN p_price int,
    IN p_city VARCHAR(45),
    IN p_province VARCHAR(45),
    IN p_brgy VARCHAR(45),
    IN p_street VARCHAR(45),
    IN p_pcode int,
    IN p_status VARCHAR(45),
    IN p_buildID int,
    IN p_desc int
)
BEGIN
	DECLARE st_code int;
    DECLARE st_msg VARCHAR(45);
    DECLARE add_id int;
    
    IF p_desc = 0 THEN
		IF p_img <> '' AND p_title <> '' AND p_city <> '' AND p_province <> '' AND p_brgy <> '' AND p_street <> '' AND p_pcode <> '' THEN
			INSERT INTO address (`province`,`city`,`barangay`,`street`,`postal_code`) VALUES (p_province,p_city,p_brgy,p_street,p_pcode);
			SET add_id = LAST_INSERT_ID();
			INSERT INTO building (`owner_id`,`img_url`,`building_name`,`price`,`open_time`,`address_id`,`status`) VALUES (p_id,p_img,p_title,p_price,p_time,add_id,p_status);
			
			SET st_code = 200;
			SET st_msg = 'Data inserted successfully';
		ELSE
			SET st_code = 400;
			SET st_msg = 'Invalid input data';
		END IF;
    ELSEIF p_desc = 1 THEN
		IF p_status <> '' AND p_price <> '' AND p_time <> '' THEN
			UPDATE building SET `status` = p_status, `price` = p_price, `open_time` = p_time, `date_updated` = NOW() WHERE building_id = p_buildID;
            
			SET st_code = 200;
			SET st_msg = 'Building updated successfully';
        END IF;
        
        IF p_status <> '' AND p_price = '' AND p_time <> '' THEN
			UPDATE building SET `status` = p_status, `open_time` = p_time, `date_updated` = NOW() WHERE building_id = p_buildID;    
            
			SET st_code = 200;
			SET st_msg = 'Building status and open hours updated successfully';
        END IF;
        
        IF p_status = '' AND p_price <> '' AND p_time <> '' THEN
			UPDATE building SET `price` = p_price, `open_time` = p_time, `date_updated` = NOW() WHERE building_id = p_buildID;    
            
			SET st_code = 200;
			SET st_msg = 'Building price and open hours updated successfully';
        END IF;
        
        IF p_status <> '' AND p_price <> '' AND p_time = '' THEN
			UPDATE building SET `price` = p_price, `open_time` = p_time, `date_updated` = NOW() WHERE building_id = p_buildID;    
            
			SET st_code = 200;
			SET st_msg = 'Building price and status updated successfully';
        END IF;
        
        IF p_status = '' AND p_price = '' AND p_time <> '' THEN
			UPDATE building SET `open_time` = p_time, `date_updated` = NOW() WHERE building_id = p_buildID;    
            
			SET st_code = 200;
			SET st_msg = 'Building open hours updated successfully';
        END IF;
        
        IF p_status = '' AND p_price <> '' AND p_time = '' THEN
			UPDATE building SET `open_time` = p_time, `date_updated` = NOW() WHERE building_id = p_buildID;    
            
			SET st_code = 200;
			SET st_msg = 'Building price updated successfully';
        END IF;
        
        IF p_status <> '' AND p_price = '' AND p_time = '' THEN
			UPDATE building SET `open_time` = p_time, `date_updated` = NOW() WHERE building_id = p_buildID;    
            
			SET st_code = 200;
			SET st_msg = 'Building status updated successfully';
        END IF;
        
        IF p_status = '' AND p_price = '' AND p_time = '' THEN
			SET st_code = 409;
			SET st_msg = 'Empty fields';
        END IF;
		
    END IF;
    
    SELECT st_code, st_msg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_addPayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addPayment`(
	IN p_cid INT,
	IN p_bid INT,
    IN p_method VARCHAR(45),
    IN p_amount INT,
    IN p_number VARCHAR(45)
)
BEGIN
	INSERT INTO payments (`customer_id`, `building_id`, `number`, `payment_method`, `amount`) VALUES (p_cid,p_bid,p_number,p_method,p_amount);
    SELECT 200, 'success';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_displaySearchBuilding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_displaySearchBuilding`(
	IN p_search VARCHAR(255),
    IN p_bid int,
    IN p_oid int,
    IN p_desc VARCHAR(45)
)
BEGIN
	DECLARE st_code int;
    DECLARE st_msg VARCHAR(45);
	
    IF p_oid <> 0 THEN
		IF p_bid = 0 THEN
			IF p_search = '' THEN
				SELECT * FROM viewbuildings WHERE building_status != 'deleted' AND owner_id = p_oid;
			ELSE
				SELECT * FROM viewbuildings 
					WHERE
						building_name LIKE CONCAT('%',p_search,'%') OR
						price LIKE CONCAT('%',p_search,'%') OR
						open_hours LIKE CONCAT('%',p_search,'%') OR
						date_created LIKE CONCAT('%',p_search,'%') OR
						date_updated LIKE CONCAT('%',p_search,'%') OR
						status LIKE CONCAT('%',p_search,'%') OR
						location LIKE CONCAT('%',p_search,'%');
			END IF;
		ELSE
			IF p_desc = '' THEN
				SELECT * FROM viewbuildings WHERE building_id = p_bid;
			ELSEIF p_desc = 'remove' THEN
				UPDATE building SET `status` = 'deleted', `date_updated` = NOW() WHERE building_id = p_bid;    
				
				SET st_code = 200;
				SET st_msg = 'Building removed successfully';
				
				SELECT st_code, st_msg;
			END IF;
		END IF;
    ELSE
		SELECT * FROM viewbuildings WHERE building_status != 'deleted';
    END IF;
	
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_loginCustomerOwner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_loginCustomerOwner`(
	IN p_username VARCHAR(45)
)
BEGIN
	DECLARE ret int;
	DECLARE st_code int;
    DECLARE st_msg VARCHAR(45);
    DECLARE st_role VARCHAR(255);
    
    IF EXISTS(SELECT * FROM owners WHERE username = p_username) THEN
        SET st_role = 'owner';
		SET st_code = 200;
        SET st_msg = 'Owner login successful';
        SELECT *, st_role, st_code, st_msg FROM owners WHERE username = p_username;
	ELSEIF EXISTS(SELECT * FROM customers WHERE username = p_username) THEN
        SET st_role = 'customer';
		SET st_code = 200;
        SET st_msg = 'Customer login successful';
        SELECT *, st_role, st_code, st_msg FROM customers WHERE username = p_username;
	ELSE
		SET st_code = 404;
        SET st_msg = 'No username found';
		SELECT st_code, st_msg;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registerCustomerOwner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registerCustomerOwner`(
	IN p_firstname VARCHAR(45),
    IN p_lastname VARCHAR(45),
    IN p_phone_number VARCHAR(45),
    IN p_birthdate VARCHAR(45),
    IN p_email VARCHAR(45),
    IN p_username VARCHAR(45),
    IN p_password VARCHAR(255),
    IN p_role VARCHAR(45)
)
BEGIN
	DECLARE st_code int;
    DECLARE st_msg VARCHAR(45);
    
    IF EXISTS(SELECT * FROM owners WHERE username = p_username) THEN
		SET st_code = 406;
		SET st_msg = 'Username already registered';
    ELSEIF EXISTS(SELECT * FROM customers WHERE username = p_username) THEN
		SET st_code = 406;
		SET st_msg = 'Username already registered';
	ELSE
		IF p_role = 'owner' THEN
			IF p_firstname = '' AND p_lastname = '' AND p_phone_number = '' AND p_birthdate = '' AND  p_email = '' AND p_username AND p_password = '' THEN
				SET st_code = 401, st_msg = 'Empty Fields';
			ELSE
				INSERT INTO owners 
					(`username`,`password`,`firstname`,`lastname`,`email`,`birthdate`,`phone_number`)
					VALUES
					(p_username, p_password, p_firstname, p_lastname, p_email, p_birthdate, p_phone_number);
				SET st_code = 200, st_msg = 'Success';
			END IF;
		ELSEIF p_role = 'customer' THEN
			IF p_firstname = '' AND p_lastname = '' AND p_phone_number = '' AND p_birthdate = '' AND  p_email = '' AND p_username AND p_password = '' THEN
				SET st_code = 401, st_msg = 'Empty Fields';
			ELSE
				INSERT INTO customers 
					(`username`,`password`,`firstname`,`lastname`,`email`,`birthdate`,`phone_number`)
					VALUES
					(p_username, p_password, p_firstname, p_lastname, p_email, p_birthdate, p_phone_number) ;
				SET st_code = 200, st_msg = 'Success';
			END IF;
		END IF;
    END IF;
	
    SELECT st_code, st_msg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rentBuilding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rentBuilding`(
	IN p_bid INT,
    IN p_cid INT,
    IN p_din VARCHAR(45),
    IN p_dout VARCHAR(45),
    IN p_total INT
)
BEGIN
	DECLARE st_code INT;
    DECLARE st_msg VARCHAR(45);
	
	IF p_bid = 0 AND p_din = '' AND p_dout = '' AND p_cid <> 0 THEN
		SELECT * FROM rent WHERE customer_id = p_cid;
    ELSE
		INSERT INTO rent (`building_id`, `customer_id`, `day_in`, `day_out`, `total`) 
			VALUES (p_bid,p_cid,p_din,p_dout,p_total);
		SET st_code = 200, st_msg = 'Rent building successfully';
        SELECT st_code, st_msg;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rentedView` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rentedView`(
	IN p_id INT,
	IN p_rid INT,
    IN p_oid INT,
    IN p_stats VARCHAR(45)
)
BEGIN
	DECLARE st_code INT;
    DECLARE st_msg VARCHAR(45);
    
    IF p_id = 0 THEN
		IF p_stats = 'read' THEN
			UPDATE rent AS r LEFT JOIN building AS b on r.building_id = b.building_id SET r.notif_status = 'read' WHERE r.rent_id > 0 AND b.owner_id = p_oid;
        ELSEIF p_stats = 'unread' THEN
			SELECT COUNT(*) AS unread FROM rentedview WHERE owner_id = p_oid AND rent_notif = 'unread';
		ELSEIF p_stats = 'accept' THEN
			UPDATE rent AS r LEFT JOIN building AS b on r.building_id = b.building_id SET r.status = p_stats WHERE r.rent_id = p_rid AND b.owner_id = p_oid;
            
            SET st_code = 200, st_msg = 'accepted';
            SELECT st_code, st_msg;
		ELSEIF p_stats = 'decline' THEN
			UPDATE rent AS r LEFT JOIN building AS b on r.building_id = b.building_id SET r.status = p_stats WHERE r.rent_id = p_rid AND b.owner_id = p_oid;
            
            SET st_code = 200, st_msg = 'decline';
            SELECT st_code, st_msg;
		ELSEIF p_stats = '' THEN
			SELECT * FROM rentedview WHERE owner_id = p_oid;
        END IF;
    ELSE
		SELECT * FROM rentedview WHERE customer_id = p_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_signinSignupAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_signinSignupAdmin`(
	IN p_firstname VARCHAR(45),
	IN p_lastname VARCHAR(45),
	IN p_username VARCHAR(45),
	IN p_password VARCHAR(255),
    IN p_desc VARCHAR(45)
)
BEGIN
	DECLARE st_code INT;
    DECLARE st_msg VARCHAR(45);
    
    IF p_desc = 'register' THEN
		INSERT INTO admins (`firstname`, `lastname`, `username`, `password`) VALUES (p_firstname,p_lastname,p_username,p_password);
        
        SET st_code = 200, st_msg = 'Successfully Register';
        SELECT st_code, st_msg;
    ELSEIF p_desc = 'login' THEN
		IF EXISTS(SELECT * FROM admins WHERE username = p_username) THEN
			SELECT * FROM admins WHERE username = p_username;
		ELSE
			SET st_code = 409, st_msg = 'No admin found';
            SELECT st_code, st_msg;
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `rentedview`
--

/*!50001 DROP VIEW IF EXISTS `rentedview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rentedview` AS select `r`.`rent_id` AS `rent_id`,`r`.`customer_id` AS `customer_id`,`r`.`day_in` AS `day_in`,`r`.`day_out` AS `day_out`,`r`.`total` AS `total`,`r`.`date_created` AS `date_created`,`r`.`status` AS `rent_status`,`r`.`notif_status` AS `rent_notif`,`b`.`img_url` AS `img_url`,`b`.`owner_id` AS `owner_id`,`b`.`building_name` AS `building_name`,`b`.`price` AS `price`,`b`.`open_time` AS `open_time`,`a`.`province` AS `province`,`a`.`city` AS `city`,`a`.`barangay` AS `barangay`,`a`.`street` AS `street`,`a`.`postal_code` AS `postal_code`,`c`.`firstname` AS `firstname`,`c`.`lastname` AS `lastname`,`p`.`payment_method` AS `payment_method` from ((((`rent` `r` left join `building` `b` on((`r`.`building_id` = `b`.`building_id`))) left join `address` `a` on((`a`.`address_id` = `b`.`address_id`))) left join `customers` `c` on((`c`.`customer_id` = `r`.`customer_id`))) left join `payments` `p` on((`p`.`customer_id` = `c`.`customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewbuildings`
--

/*!50001 DROP VIEW IF EXISTS `viewbuildings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewbuildings` AS select `b`.`owner_id` AS `owner_id`,`b`.`building_id` AS `building_id`,`b`.`img_url` AS `img_url`,`b`.`building_name` AS `building_name`,`b`.`price` AS `price`,time_format(`b`.`open_time`,'%h:%i %p') AS `open_hours`,date_format(`b`.`date_created`,'%M %d %Y') AS `date_created`,date_format(`b`.`date_updated`,'%M %d, %Y') AS `date_updated`,concat(`a`.`province`,', ',`a`.`city`,', ',`a`.`barangay`,', ',`a`.`street`,', ',`a`.`postal_code`) AS `location`,`b`.`status` AS `building_status` from (`building` `b` left join `address` `a` on((`b`.`address_id` = `a`.`address_id`))) */;
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

-- Dump completed on 2023-05-22 15:32:00
