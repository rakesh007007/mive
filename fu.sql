-- MySQL dump 10.13  Distrib 5.6.25, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: veggex
-- ------------------------------------------------------
-- Server version	5.6.25-0ubuntu0.15.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
--
-- Dumping data for table `veggex_product`
--

LOCK TABLES `veggex_product` WRITE;
/*!40000 ALTER TABLE `veggex_product` DISABLE KEYS */;
INSERT INTO `veggex_product` VALUES (1,'Tomatoes','xx',1,NULL,'10 kg','custom rates',100,'./tomatoes-_low.jpg','chomu',1000,'dd',1,1,1),(2,'apple','ff',2,NULL,'kg','custom rates',12,'./apples2.jpg','jaipur',12,'fff',1,NULL,0),(3,'Green Apple','http://www.mive.in/main',2,NULL,'kg','custom rates',123,'./image-4-compressed_FMUSsJZ.jpg','agra',12,'dgds',1,NULL,0),(4,'Carrot','http://www.mive.in/main',1,NULL,'kg','custom rates',123,'./image-2-compressed_0U1BLaq.jpg','delhi',12,'ddsf',1,1,1),(5,'Apple','cfsc',1,NULL,'kg','custom rates',123,'./e.jpg','delhi',12,'dsd',1,NULL,0),(7,'a','ddd',2,NULL,'kg','custom rates',1000,'./image-2-compressed.jpg','Delhi',1212,'ff',1,NULL,0),(8,'Green Apple','gdfg',1,NULL,'kg','custom rates',10,'./image-4-compressed.jpg','ggg',1000,'dddd',1,NULL,0),(9,'Cherry ','red cherry ',2,4,'kg','custom rates',100,'./cherry_PNG611.jpg','agra',12,'superb quality , ideal for shakes ',1,1,0),(10,'Oranges','Juicy sweet orange ',2,9,'kg','as per mandi rates',45,'./ORANGES.jpg','agra ',100,'amazing quality ',1,1,0),(11,'Lemons ','juicy lemon ',1,5,'kg','as per mandi rates',100,'./lemons.jpg','agra ',452,'superp quality and perishable ',1,1,1),(12,'CauliFlower ','White Cauliflower ',1,5,'kg','as per mandi rates',60,'./cauliflower.jpg','Agra ',20,'superb quality ',1,1,0),(13,'Litchi ','Juicy lichi ',2,6,'kg','as per mandi rates',80,'./LICHI.jpg','china ',4,'juicy litchi ',1,1,0),(14,'Black Grapes ','Sweet grapes ',2,9,'kg','as per mandi rates',80,'./black_grapes.jpg','india',120,'amazing sweet grapes ',1,1,0),(15,'Guava ','sweet guava ',2,4,'kg','as per mandi rates',30,'./guava1.jpg','nagpur ',50,'sweet guavas with less seeds ',1,1,0),(16,'Kiwi Fruit ','Newzealand imported Kiwi fruit ',2,7,'kg','as per mandi rates',200,'./FreshKiwiFruitPhoto5.jpg','newzealand',10,'superb quality ',1,1,0);
/*!40000 ALTER TABLE `veggex_product` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Dumping data for table `veggex_address`
--

LOCK TABLES `veggex_address` WRITE;
/*!40000 ALTER TABLE `veggex_address` DISABLE KEYS */;
INSERT INTO `veggex_address` VALUES (1,'delhi','delhi','raj',110016);
/*!40000 ALTER TABLE `veggex_address` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Dumping data for table `veggex_cart`
--

LOCK TABLES `veggex_cart` WRITE;
/*!40000 ALTER TABLE `veggex_cart` DISABLE KEYS */;
INSERT INTO `veggex_cart` VALUES (1,'2015-09-12 10:00:54.204953','2015-09-12 10:00:54.204961',23671),(2,'2015-09-12 10:14:37.607463','2015-09-12 10:14:37.607471',0),(3,'2015-09-11 03:26:26.161206','2015-09-11 03:26:26.161215',3912);
/*!40000 ALTER TABLE `veggex_cart` ENABLE KEYS */;
UNLOCK TABLES;

-- Dumping data for table `veggex_user`
--

LOCK TABLES `veggex_user` WRITE;
/*!40000 ALTER TABLE `veggex_user` DISABLE KEYS */;
INSERT INTO `veggex_user` VALUES (3,'Mezbaan','Hatim Singh','veg. vendors','rak.dev007@gmail.com',8377950711,'pbkdf2_sha256$20000$xcPbF0CMVCyw$eZECZo2qDkuIVr8+UxTiIosfDPdHx6mMQNhUbp3AAjM=','','./1269438_708935059120411_1743592332_o_Cropped.jpg',1,2),(4,'Shubham','Shubham','hotels','ra@gmail.com',8449091239,'pbkdf2_sha256$12000$LwPATwemj5J2$ftGbMJSKtho6HrM+uXoKDHBRc7Uxgg+Pn9Ay5ySDk6E=','','./255390_4223000579700_1242451309_n_Cropped.jpg',1,1),(5,'PC Hotels','PC Yadav','hotels','info@mive.in',9289010333,'pbkdf2_sha256$20000$zAvkslEN3qXO$gPPOFn2xQR4FHdJkxcAsIyCvBUwmBGDS+0g33xrOWEY=','','./255390_4223000579700_1242451309_n_Cropped_6b0QkxH.jpg',1,3);
/*!40000 ALTER TABLE `veggex_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-13  3:36:27
