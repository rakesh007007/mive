<<<<<<< HEAD
-- MySQL dump 10.13  Distrib 5.6.25, for debian-linux-gnu (x86_64)
=======
-- MySQL dump 10.13  Distrib 5.6.25, for debian-linux-gnu (i686)
>>>>>>> origin
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
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
<<<<<<< HEAD
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
=======
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
>>>>>>> origin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
<<<<<<< HEAD
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
=======
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
>>>>>>> origin
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add address',8,'add_address'),(23,'Can change address',8,'change_address'),(24,'Can delete address',8,'delete_address'),(25,'Can add contact',9,'add_contact'),(26,'Can change contact',9,'change_contact'),(27,'Can delete contact',9,'delete_contact'),(28,'Can add career',10,'add_career'),(29,'Can change career',10,'change_career'),(30,'Can delete career',10,'delete_career'),(31,'Can add cart',11,'add_cart'),(32,'Can change cart',11,'change_cart'),(33,'Can delete cart',11,'delete_cart'),(34,'Can add user',12,'add_user'),(35,'Can change user',12,'change_user'),(36,'Can delete user',12,'delete_user'),(37,'Can add mandi',13,'add_mandi'),(38,'Can change mandi',13,'change_mandi'),(39,'Can delete mandi',13,'delete_mandi'),(40,'Can add seller',14,'add_seller'),(41,'Can change seller',14,'change_seller'),(42,'Can delete seller',14,'delete_seller'),(43,'Can add product',15,'add_product'),(44,'Can change product',15,'change_product'),(45,'Can delete product',15,'delete_product'),(46,'Can add custom category products',16,'add_customcategoryproducts'),(47,'Can change custom category products',16,'change_customcategoryproducts'),(48,'Can delete custom category products',16,'delete_customcategoryproducts'),(49,'Can add cartitem',17,'add_cartitem'),(50,'Can change cartitem',17,'change_cartitem'),(51,'Can delete cartitem',17,'delete_cartitem'),(52,'Can add accartitem',18,'add_accartitem'),(53,'Can change accartitem',18,'change_accartitem'),(54,'Can delete accartitem',18,'delete_accartitem'),(55,'Can add order',19,'add_order'),(56,'Can change order',19,'change_order'),(57,'Can delete order',19,'delete_order'),(58,'Can add orderitem',20,'add_orderitem'),(59,'Can change orderitem',20,'change_orderitem'),(60,'Can delete orderitem',20,'delete_orderitem'),(61,'Can add subscribe',21,'add_subscribe'),(62,'Can change subscribe',21,'change_subscribe'),(63,'Can delete subscribe',21,'delete_subscribe'),(64,'Can add token',22,'add_token'),(65,'Can change token',22,'change_token'),(66,'Can delete token',22,'delete_token');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$IYzp1lHlJkfg$jC7ob3fZxPVLHO5yG2G3mdJ49pILH9imJos5/QbJWFA=','2015-09-18 11:45:50.417007',1,'admin','','','rak.dev007@gmail.com',1,1,'2015-09-13 06:54:48.294285');
=======
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$QcnLH5cSPswH$NCvhlPIB9DyykXz9lC7vdLk5/bQo+AdfFUxO2FbvNhQ=','2015-09-13 14:49:19.470210',1,'admin','','','rak.dev007@gmail.com',1,1,'2015-09-13 14:46:22.100347');
>>>>>>> origin
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
<<<<<<< HEAD
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
=======
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
>>>>>>> origin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
<<<<<<< HEAD
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
=======
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
>>>>>>> origin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
<<<<<<< HEAD
  CONSTRAINT `authtoken_token_user_id_1d10c57f535fb363_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
=======
  CONSTRAINT `authtoken_token_user_id_535fb363_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
>>>>>>> origin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
<<<<<<< HEAD
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
=======
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
>>>>>>> origin
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `django_admin_log` VALUES (1,'2015-09-13 06:55:48.172340','1','azadpur',1,'',13,1),(2,'2015-09-13 06:55:51.387489','1','Mive PVT LTD',1,'',14,1),(3,'2015-09-13 07:13:24.335813','16','Kiwi Fruit ',2,'Changed status.',15,1),(4,'2015-09-13 07:28:47.653276','5','Apple',3,'',15,1),(5,'2015-09-13 07:29:35.813120','8','Green Apple',3,'',15,1),(6,'2015-09-13 07:30:13.794110','16','Kiwi Fruit ',2,'Changed status.',15,1),(7,'2015-09-13 11:13:30.620355','16','Kiwi Fruit ',2,'No fields changed.',15,1),(8,'2015-09-13 11:13:48.470418','15','Guava ',2,'Changed status.',15,1),(9,'2015-09-13 11:13:56.425170','14','Black Grapes ',2,'No fields changed.',15,1),(10,'2015-09-13 11:14:08.914922','13','Litchi ',2,'Changed status.',15,1),(11,'2015-09-13 11:15:56.775171','12','CauliFlower ',2,'Changed pricePerUnit.',15,1),(12,'2015-09-13 11:16:50.897366','11','Lemons ',2,'Changed pricePerUnit.',15,1),(13,'2015-09-13 11:16:54.753733','11','Lemons ',2,'No fields changed.',15,1),(14,'2015-09-13 11:17:31.741437','10','Oranges',2,'Changed status.',15,1),(15,'2015-09-13 11:17:57.745886','9','Cherry ',2,'Changed pricePerUnit.',15,1),(16,'2015-09-13 11:18:09.934297','7','a',3,'',15,1),(17,'2015-09-13 11:18:37.704375','4','Carrot',2,'Changed pricePerUnit.',15,1),(18,'2015-09-13 11:20:08.191019','3','Green Apple',2,'Changed status.',15,1),(19,'2015-09-13 11:20:35.226587','2','apple',2,'Changed pricePerUnit.',15,1),(20,'2015-09-13 11:21:50.200249','1','Tomatoes',2,'No fields changed.',15,1),(21,'2015-09-13 15:52:40.665074','1','Hatim Singh',1,'',16,1),(22,'2015-09-13 23:14:15.041186','13','Litchi ',2,'Changed status.',15,1),(23,'2015-09-13 23:14:31.136868','3','Green Apple',2,'Changed status.',15,1),(24,'2015-09-13 23:15:27.511907','17','rakesh',1,'',15,1),(25,'2015-09-13 23:16:34.817723','17','rakesh',3,'',15,1),(26,'2015-09-13 23:16:47.126981','13','Litchi ',2,'Changed status.',15,1),(27,'2015-09-13 23:16:59.528735','3','Green Apple',2,'Changed status.',15,1),(28,'2015-09-13 23:41:54.859102','13','Litchi ',2,'Changed status.',15,1),(29,'2015-09-13 23:53:53.406777','4','Cart object',1,'',11,1),(30,'2015-09-13 23:53:55.994920','6','Angara',1,'',12,1),(31,'2015-09-14 02:42:48.293130','2','Shubham',1,'',16,1),(32,'2015-09-14 03:04:38.519283','4','Carrot',2,'Changed unit and pricePerUnit.',15,1),(33,'2015-09-14 03:04:53.108049','2','apple',2,'No fields changed.',15,1),(34,'2015-09-14 03:05:24.768931','12','CauliFlower ',2,'Changed unit and pricePerUnit.',15,1),(35,'2015-09-14 08:17:33.590922','16','Kiwi Fruit ',2,'Changed unit and pricePerUnit.',15,1),(36,'2015-09-14 08:17:35.851843','16','Kiwi Fruit ',2,'No fields changed.',15,1),(37,'2015-09-14 08:44:57.820610','18','Amrood ',1,'',15,1),(38,'2015-09-14 09:06:04.550863','19','BANANA MAH',1,'',15,1),(39,'2015-09-14 09:09:11.723497','20','PEARS - GRADE A',1,'',15,1),(40,'2015-09-14 09:11:16.991294','21','PINE APPLE  - GRADE A',1,'',15,1),(41,'2015-09-14 09:12:56.281469','22','JAMUN - GRADE A ',1,'',15,1),(42,'2015-09-14 09:14:48.482402','23','WATER MELON - GRADEA ',1,'',15,1),(43,'2015-09-14 09:18:00.160131','24','ALMOND - GRADE A ',1,'',15,1),(44,'2015-09-14 09:21:13.523369','25','MUSHROOM - GRADE A ',1,'',15,1),(45,'2015-09-14 09:24:04.503635','4','CARROT - GRADE A',2,'Changed name, popularityIndex, unit, priceType and pricePerUnit.',15,1),(46,'2015-09-14 09:48:56.479356','25','Mushroom - Grade A',2,'Changed name.',15,1),(47,'2015-09-14 09:49:30.667709','4','Carrot - Grade A',2,'Changed name.',15,1),(48,'2015-09-14 09:50:07.315820','19','Banana ',2,'Changed name.',15,1),(49,'2015-09-14 09:50:28.031591','22','Jamun - Grade A',2,'Changed name.',15,1),(50,'2015-09-14 09:52:29.756639','24','Almond - Grade A',2,'Changed name.',15,1),(51,'2015-09-14 09:53:04.380047','23','Water Melon - Grade A ',2,'Changed name.',15,1),(52,'2015-09-14 09:53:32.115245','21','Pine Apple - Grade A',2,'Changed name.',15,1),(53,'2015-09-14 09:54:12.474759','20','Pears - Grade A ',2,'Changed name.',15,1),(54,'2015-09-14 09:56:42.172080','2','Apple - Grade A',2,'Changed name, popularityIndex, unit, priceType and pricePerUnit.',15,1),(55,'2015-09-14 09:59:02.080710','10','Oranges',2,'Changed description, unit, pricePerUnit and status.',15,1),(56,'2015-09-14 09:59:48.226364','9','Cherry ',2,'Changed unit, pricePerUnit and origin.',15,1),(57,'2015-09-14 10:04:35.160257','26','Potato - Grade - A1',1,'',15,1),(58,'2015-09-14 10:18:16.087306','27','Melon ',1,'',15,1),(59,'2015-09-14 10:21:11.229578','28','Arvi - Grade A ',1,'',15,1),(60,'2015-09-14 10:22:17.556501','29','Amla - Grade A',1,'',15,1),(61,'2015-09-14 10:24:03.014453','30','Brinjal - Grade A',1,'',15,1),(62,'2015-09-14 10:25:28.228957','31','Cabbage - Grade A',1,'',15,1),(63,'2015-09-14 10:26:45.375069','32','Cucumber - Grade A',1,'',15,1),(64,'2015-09-14 10:28:26.616614','33','Garlic - Grade A ',1,'',15,1),(65,'2015-09-14 10:29:03.118837','34','Gourd - Grade A ',1,'',15,1),(66,'2015-09-14 10:30:11.614239','35','Kathal - Grade A ',1,'',15,1),(67,'2015-09-14 10:31:17.064790','36','Onion - Grade A',1,'',15,1),(68,'2015-09-14 10:32:19.102869','37','Spinach -Grade A',1,'',15,1),(69,'2015-09-14 10:33:35.810407','38','Dragan ',1,'',15,1),(70,'2015-09-14 17:52:36.305355','13','Litchi ',2,'Changed status.',15,1),(71,'2015-09-14 17:53:13.996895','14','Black Grapes ',2,'Changed status.',15,1),(72,'2015-09-14 17:54:19.647409','27','Melon ',2,'Changed unit and seller.',15,1),(73,'2015-09-15 01:48:12.004539','39','Chikoo - Grade A',1,'',15,1),(74,'2015-09-15 01:50:37.551332','40','Plum - Grade A ',1,'',15,1),(75,'2015-09-15 01:53:39.498194','41','Coconut ',1,'',15,1),(76,'2015-09-15 01:55:08.558090','42','Nakh - Grade A',1,'',15,1),(77,'2015-09-15 01:57:35.928298','43','Peach - Grade A',1,'',15,1),(78,'2015-09-15 04:59:18.426743','44','Lady Finger - Grade A ',1,'',15,1),(79,'2015-09-15 05:02:37.369230','45','Mint - Grade A',1,'',15,1),(80,'2015-09-15 05:06:52.014932','46','Bitter Gourd - Grade A ',1,'',15,1),(81,'2015-09-15 11:23:30.078353','1','Hatim Singh',2,'Changed product.',16,1),(82,'2015-09-15 16:52:13.122458','5','Cart object',1,'',11,1),(83,'2015-09-15 16:52:19.403929','7','Test',1,'',12,1),(84,'2015-09-15 17:11:38.675561','7','Test',2,'Changed password.',12,1),(85,'2015-09-15 17:30:17.313235','7','Test',2,'Changed password.',12,1),(86,'2015-09-15 17:35:36.453170','3','test',1,'',16,1),(87,'2015-09-16 05:37:48.201092','4','Anagar',1,'',16,1),(88,'2015-09-16 05:38:03.422796','5','Hatim Singh',1,'',16,1),(89,'2015-09-16 05:38:21.268779','6','PC Yadav',1,'',16,1);
=======
INSERT INTO `django_admin_log` VALUES (1,'2015-09-13 14:50:24.828506','1','azadpur',1,'',13,1),(2,'2015-09-13 14:50:27.618252','1','Mive PVT LTD',1,'',14,1),(3,'2015-09-13 15:22:17.585412','1','Hatim Singh',1,'',16,1),(4,'2015-09-13 15:36:57.714931','2','Hatim Singh',1,'',16,1),(5,'2015-09-13 15:37:16.920052','1','Shubham',2,'Changed user.',16,1),(6,'2015-09-13 15:37:30.996274','3','PC Yadav',1,'',16,1);
>>>>>>> origin
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
<<<<<<< HEAD
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
=======
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
>>>>>>> origin
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(22,'authtoken','token'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(18,'veggex','accartitem'),(8,'veggex','address'),(10,'veggex','career'),(11,'veggex','cart'),(17,'veggex','cartitem'),(7,'veggex','category'),(9,'veggex','contact'),(16,'veggex','customcategoryproducts'),(13,'veggex','mandi'),(19,'veggex','order'),(20,'veggex','orderitem'),(15,'veggex','product'),(14,'veggex','seller'),(21,'veggex','subscribe'),(12,'veggex','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
>>>>>>> origin
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-09-13 06:42:51.108265'),(2,'auth','0001_initial','2015-09-13 06:42:51.416661'),(3,'admin','0001_initial','2015-09-13 06:42:51.510731'),(4,'contenttypes','0002_remove_content_type_name','2015-09-13 06:42:51.635177'),(5,'auth','0002_alter_permission_name_max_length','2015-09-13 06:42:51.678425'),(6,'auth','0003_alter_user_email_max_length','2015-09-13 06:42:51.720147'),(7,'auth','0004_alter_user_username_opts','2015-09-13 06:42:51.734304'),(8,'auth','0005_alter_user_last_login_null','2015-09-13 06:42:51.778640'),(9,'auth','0006_require_contenttypes_0002','2015-09-13 06:42:51.781734'),(10,'authtoken','0001_initial','2015-09-13 06:42:51.842204'),(11,'sessions','0001_initial','2015-09-13 06:42:51.877064'),(12,'veggex','0001_initial','2015-09-13 06:42:53.138196'),(13,'veggex','0002_product_status','2015-09-13 06:42:53.226097'),(14,'veggex','0003_auto_20150912_2245','2015-09-13 06:42:53.299311'),(15,'veggex','0004_auto_20150912_2257','2015-09-13 06:42:53.333921'),(16,'veggex','0005_auto_20150912_2303','2015-09-13 06:42:53.367548'),(17,'veggex','0006_remove_product_status','2015-09-13 06:42:53.431338'),(18,'veggex','0007_product_status','2015-09-13 06:57:11.270614'),(19,'veggex','0004_auto_20150913_2050','2015-09-13 15:51:31.868698'),(20,'veggex','0005_auto_20150913_2100','2015-09-13 15:51:31.902611'),(21,'veggex','0008_merge','2015-09-13 15:51:31.906303');
=======
>>>>>>> origin
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `django_session` VALUES ('043pyc3kdfojhjjxyauxtubmx8ncl4a0','NzFmYmUxOGFkMDdlMjJhZjViMjY1NTM5YTgzYzk1NDI5ZTc4M2ZiMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NzI4NDEwZjI1NzE0MjVlYWJkYjY0ZTlhOWFkYmUwMDRhODUxNWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-09-29 17:10:06.965303'),('2pl25uuder3rdqdrkued1lspgawc09yk','MDIwYzA5ZjlkMGUwZTUyY2JkYmI1MDlmNDU1MGRjMmViZTA1NTQwOTp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1vYmlsZSI6Ijg0NDkwOTEyMzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1pdmV1c2VyIjo0LCJfYXV0aF91c2VyX2hhc2giOiIwOTcyODQxMGYyNTcxNDI1ZWFiZGI2NGU5YTlhZGJlMDA0YTg1MTVmIn0=','2015-09-28 02:41:38.457264'),('60ih1ahol78xofhcspft0sit9mpn9qkl','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-28 10:02:53.345638'),('7zovul9n403a1retdopkfxknrwcjdfwc','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-29 18:58:56.687138'),('d6uabi8ivh6mlgrzvfh8kxe99qb8fjb6','NzFmYmUxOGFkMDdlMjJhZjViMjY1NTM5YTgzYzk1NDI5ZTc4M2ZiMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NzI4NDEwZjI1NzE0MjVlYWJkYjY0ZTlhOWFkYmUwMDRhODUxNWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-09-28 04:51:28.182488'),('g0c2xmdv30iukmbi4p00p24rk6tee8ba','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-28 10:15:51.582927'),('gk1vsculg9fveecwfwoiwkgeu0cafsdn','NzFmYmUxOGFkMDdlMjJhZjViMjY1NTM5YTgzYzk1NDI5ZTc4M2ZiMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5NzI4NDEwZjI1NzE0MjVlYWJkYjY0ZTlhOWFkYmUwMDRhODUxNWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-09-27 11:13:07.521731'),('glg26lk0o2q1szkgbpbka1tzqv28aazo','MTgyY2I4YjBhZTQ3ZTZlYTk3NTMxYTBiYTEzMjMyYzcyODAxNzc0Zjp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1vYmlsZSI6IjgzNzc5NTA3MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1pdmV1c2VyIjozLCJfYXV0aF91c2VyX2hhc2giOiIwOTcyODQxMGYyNTcxNDI1ZWFiZGI2NGU5YTlhZGJlMDA0YTg1MTVmIn0=','2015-10-02 11:45:50.419183'),('i9zcaydocnmweycu2dexa1v9edv0mazp','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-28 02:11:26.982935'),('luayhxdnyr0amaqbwi6f8qz5o2er4lc6','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-28 11:34:52.992551'),('o4btqw3c44uvl5yq051smg0ocp78etr3','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-28 02:37:28.064256'),('pz2fczkufdqohw514oi6pspt8wu2cc78','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-28 10:24:27.347056'),('z7n02ujm0tizwtt44k1d3zzlih1qt810','ZTc2ZDExZjY3OGFkNjJjZWQ0ZGY3NzQ1YzQ3YmNiOGQ2YWE3NDJiYzp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1pdmV1c2VyIjo3LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1vYmlsZSI6IjAxMjM0NTY3ODkiLCJfYXV0aF91c2VyX2hhc2giOiIwOTcyODQxMGYyNTcxNDI1ZWFiZGI2NGU5YTlhZGJlMDA0YTg1MTVmIn0=','2015-09-29 16:52:43.672109');
=======
INSERT INTO `django_session` VALUES ('1g1avuwx8e5kz9jrcx0446elrlh2x5ah','ZTIzODAxYWJjZWFiMjY0NGU5ZTgyMjUyODJkNmFmM2I1ZTEzMmE3NDp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1pdmV1c2VyIjozLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1vYmlsZSI6IjgzNzc5NTA3MTEiLCJfYXV0aF91c2VyX2hhc2giOiI4MzM0MGVkMTYzOTQzOGZlYTJiNTQ1YTIzODMzZGNkYTMyNWI0NDU2In0=','2015-09-28 01:25:42.912473'),('8iz0ymzx0iobblsaztga3e3mpm1ljjsx','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-28 20:03:33.248253'),('nmlv1gz7bnsfrypr22zn6p2m21mpqrfw','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-27 23:46:00.150066'),('onjssxsdp8dxmso78v35l25g1640nrsd','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-27 21:58:08.840615');
>>>>>>> origin
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_accartitem`
--

DROP TABLE IF EXISTS `veggex_accartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_accartitem` (
  `accartitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `qtyInUnits` int(11) NOT NULL,
  `resason` longtext,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`accartitem_id`),
  KEY `veggex_accartitem_c44d83f7` (`cart_id`),
  KEY `veggex_accartitem_9bea82de` (`product_id`),
<<<<<<< HEAD
  CONSTRAINT `veggex__product_id_791847ff20f089ad_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_accartite_cart_id_44ca152ae55c7745_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`)
=======
  CONSTRAINT `veggex_accartit_product_id_20f089ad_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_accartitem_cart_id_1aa388bb_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`)
>>>>>>> origin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_accartitem`
--

LOCK TABLES `veggex_accartitem` WRITE;
/*!40000 ALTER TABLE `veggex_accartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `veggex_accartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_address`
--

DROP TABLE IF EXISTS `veggex_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(300) NOT NULL,
  `city` varchar(300) NOT NULL,
  `state` varchar(300) NOT NULL,
  `pincode` int(11) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_address`
--

LOCK TABLES `veggex_address` WRITE;
/*!40000 ALTER TABLE `veggex_address` DISABLE KEYS */;
INSERT INTO `veggex_address` VALUES (1,'delhi','delhi','raj',110016);
/*!40000 ALTER TABLE `veggex_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_career`
--

DROP TABLE IF EXISTS `veggex_career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_career` (
  `career_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(300) NOT NULL,
  `lastname` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `subject` varchar(300) NOT NULL,
  `coverletter` longtext NOT NULL,
  `resume` varchar(100) NOT NULL,
  PRIMARY KEY (`career_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_career`
--

LOCK TABLES `veggex_career` WRITE;
/*!40000 ALTER TABLE `veggex_career` DISABLE KEYS */;
/*!40000 ALTER TABLE `veggex_career` ENABLE KEYS */;
UNLOCK TABLES;

--
<<<<<<< HEAD
=======
-- Table structure for table `veggex_cart`
--

DROP TABLE IF EXISTS `veggex_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `timeOfCreate` datetime(6) NOT NULL,
  `timeOfUpdate` datetime(6) NOT NULL,
  `cartTotal` int(11) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_cart`
--

LOCK TABLES `veggex_cart` WRITE;
/*!40000 ALTER TABLE `veggex_cart` DISABLE KEYS */;
INSERT INTO `veggex_cart` VALUES (1,'2015-09-12 10:00:54.204000','2015-09-12 10:00:54.204000',23671),(2,'2015-09-14 20:42:35.637576','2015-09-14 20:42:35.637586',1270),(3,'2015-09-11 03:26:26.161000','2015-09-11 03:26:26.161000',3912);
/*!40000 ALTER TABLE `veggex_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_cartitem`
--

DROP TABLE IF EXISTS `veggex_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_cartitem` (
  `cartitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `qtyInUnits` int(10) unsigned NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`cartitem_id`),
  KEY `veggex_cartitem_cart_id_e97a525_fk_veggex_cart_cart_id` (`cart_id`),
  KEY `veggex_cartitem_9bea82de` (`product_id`),
  CONSTRAINT `veggex_cartitem_cart_id_e97a525_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`),
  CONSTRAINT `veggex_cartitem_product_id_410c13a3_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_cartitem`
--

LOCK TABLES `veggex_cartitem` WRITE;
/*!40000 ALTER TABLE `veggex_cartitem` DISABLE KEYS */;
INSERT INTO `veggex_cartitem` VALUES (22,2,2,4),(23,2,2,2),(24,1,2,7);
/*!40000 ALTER TABLE `veggex_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
>>>>>>> origin
-- Table structure for table `veggex_category`
--

DROP TABLE IF EXISTS `veggex_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `coverphoto` varchar(100) DEFAULT NULL,
  `description` varchar(300) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_category`
--

LOCK TABLES `veggex_category` WRITE;
/*!40000 ALTER TABLE `veggex_category` DISABLE KEYS */;
INSERT INTO `veggex_category` VALUES (1,'Vegetables','./vegetables.png','these kind of vegetables are being used for fuck'),(2,'Fruits','./fruits.png','Django administration Welcome, admin. View site / Change password / Log out Home › Veggex › Products › rakesh Change product History  Name: Description: Category:  Change  Add PopularityIndex: Unit: PriceType: PricePerUnit: Coverphoto: Currently: ./Rees52-Raspberry-Pi-2-Model-SDL605139026-1-07246_r4');
/*!40000 ALTER TABLE `veggex_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_contact`
--

DROP TABLE IF EXISTS `veggex_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `message` longtext NOT NULL,
  `mobile` bigint(20) NOT NULL,
  PRIMARY KEY (`contact_id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
=======
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
>>>>>>> origin
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_contact`
--

LOCK TABLES `veggex_contact` WRITE;
/*!40000 ALTER TABLE `veggex_contact` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `veggex_contact` VALUES (1,'Utsav Somani','hi@utsavsomani.com','Hi guys,\r\n\r\nInteresting venture.\r\n\r\nWould love to have a chat.\r\n\r\nPortfolio and background - www.utsavsomani.com\r\n\r\nBest,\r\nUtsav Somani',9810111213),(2,'Garima Yadav','garima.chhavi@gmail.com','doing great :-* \r\nAmber, Rakesh and team ... very nice :-*\r\n\r\nloads of love and tonnes of hugs \r\ngarima',7042363861);
=======
>>>>>>> origin
/*!40000 ALTER TABLE `veggex_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_customcategoryproducts`
--

DROP TABLE IF EXISTS `veggex_customcategoryproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_customcategoryproducts` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `veggex_customcategoryproducts_e8701ad4` (`user_id`),
<<<<<<< HEAD
  CONSTRAINT `veggex_customcat_user_id_47e33e12c6101676_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
=======
  CONSTRAINT `veggex_customcategorypro_user_id_39efe98a_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
>>>>>>> origin
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_customcategoryproducts`
--

LOCK TABLES `veggex_customcategoryproducts` WRITE;
/*!40000 ALTER TABLE `veggex_customcategoryproducts` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `veggex_customcategoryproducts` VALUES (1,3),(5,3),(2,4),(6,5),(4,6),(3,7);
=======
INSERT INTO `veggex_customcategoryproducts` VALUES (2,3),(1,4),(3,5);
>>>>>>> origin
/*!40000 ALTER TABLE `veggex_customcategoryproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_customcategoryproducts_product`
--

DROP TABLE IF EXISTS `veggex_customcategoryproducts_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_customcategoryproducts_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customcategoryproducts_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customcategoryproducts_id` (`customcategoryproducts_id`,`product_id`),
<<<<<<< HEAD
  KEY `veggex__product_id_230b5244155d8ce3_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `e9b60da926013fcbb04cb8a9a4763f42` FOREIGN KEY (`customcategoryproducts_id`) REFERENCES `veggex_customcategoryproducts` (`uid`),
  CONSTRAINT `veggex__product_id_230b5244155d8ce3_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
=======
  KEY `veggex_customca_product_id_155d8ce3_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `c391af7c2656c8ea07b96799bb3e3451` FOREIGN KEY (`customcategoryproducts_id`) REFERENCES `veggex_customcategoryproducts` (`uid`),
  CONSTRAINT `veggex_customca_product_id_155d8ce3_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
>>>>>>> origin
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_customcategoryproducts_product`
--

LOCK TABLES `veggex_customcategoryproducts_product` WRITE;
/*!40000 ALTER TABLE `veggex_customcategoryproducts_product` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `veggex_customcategoryproducts_product` VALUES (9,1,1),(10,1,2),(11,1,3),(12,1,4),(13,1,43),(14,1,44),(15,1,45),(5,2,1),(6,2,2),(7,2,3),(8,2,4),(16,3,2),(17,4,1),(18,4,2),(19,5,1),(20,5,2),(21,6,2),(22,6,3);
=======
INSERT INTO `veggex_customcategoryproducts_product` VALUES (14,1,1),(15,1,2),(16,1,3),(17,1,4),(18,1,5),(19,1,7),(20,1,8),(21,1,9),(22,1,10),(23,1,11),(11,2,1),(12,2,2),(13,2,3),(24,3,1),(25,3,3),(26,3,5);
>>>>>>> origin
/*!40000 ALTER TABLE `veggex_customcategoryproducts_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_mandi`
--

DROP TABLE IF EXISTS `veggex_mandi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_mandi` (
  `mandi_id` int(11) NOT NULL AUTO_INCREMENT,
  `nameOfMandi` varchar(300) NOT NULL,
  `description` longtext NOT NULL,
  `Photo` varchar(100) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`mandi_id`),
<<<<<<< HEAD
  KEY `veggex__address_id_3dda75cce0678d1b_fk_veggex_address_address_id` (`address_id`),
  CONSTRAINT `veggex__address_id_3dda75cce0678d1b_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`)
=======
  KEY `veggex_mandi_address_id_1f9872e5_fk_veggex_address_address_id` (`address_id`),
  CONSTRAINT `veggex_mandi_address_id_1f9872e5_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`)
>>>>>>> origin
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_mandi`
--

LOCK TABLES `veggex_mandi` WRITE;
/*!40000 ALTER TABLE `veggex_mandi` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `veggex_mandi` VALUES (1,'azadpur','hh','./1654221_956833487662614_4256020199414774531_n.jpg',1);
=======
INSERT INTO `veggex_mandi` VALUES (1,'azadpur','g','./utkars.png',1);
>>>>>>> origin
/*!40000 ALTER TABLE `veggex_mandi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_order`
--

DROP TABLE IF EXISTS `veggex_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `timeOfCreate` datetime(6) NOT NULL,
  `timeOfUpdate` datetime(6) NOT NULL,
  `payment_mode` varchar(200) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `deliveryTime` longtext,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `veggex_order_e8701ad4` (`user_id`),
<<<<<<< HEAD
  CONSTRAINT `veggex_order_user_id_2911d94545dbd524_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
=======
  CONSTRAINT `veggex_order_user_id_45dbd524_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
>>>>>>> origin
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_order`
--

LOCK TABLES `veggex_order` WRITE;
/*!40000 ALTER TABLE `veggex_order` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `veggex_order` VALUES (1,'2015-09-13 07:39:09.389762','2015-09-13 07:39:09.389806','COD',223,'PLACED','13.09.2015',4),(2,'2015-09-13 08:06:45.678736','2015-09-13 08:06:45.678766','COD',123,'PLACED','13.09.2015',4),(3,'2015-09-13 16:32:00.223437','2015-09-13 16:32:00.223470','COD',471,'PLACED','14.09.2015',5),(4,'2015-09-13 16:32:51.103099','2015-09-13 16:32:51.103139','COD',4342,'PLACED','14.09.2015',5),(5,'2015-09-13 23:54:40.718444','2015-09-13 23:54:40.718485','COD',80,'PLACED',NULL,6),(6,'2015-09-13 23:55:09.900879','2015-09-13 23:55:09.900902','COD',90,'PLACED',NULL,6),(7,'2015-09-14 02:28:21.724321','2015-09-14 02:28:21.724352','COD',1127,'PLACED','15.09.2015',4),(8,'2015-09-14 03:03:24.114347','2015-09-14 03:03:24.114370','COD',1150,'PLACED',NULL,3),(9,'2015-09-14 08:15:03.024077','2015-09-14 08:15:03.024101','COD',800,'PLACED',NULL,3),(10,'2015-09-14 10:16:32.116970','2015-09-14 10:16:32.116995','COD',9430,'PLACED',NULL,3),(11,'2015-09-15 11:28:38.223431','2015-09-15 11:28:38.223466','COD',3210,'PLACED','16.09.2015',3),(12,'2015-09-15 16:10:45.749370','2015-09-15 16:10:45.749407','COD',53242,'PLACED','16.09.2015',4),(13,'2015-09-15 16:35:45.661253','2015-09-15 16:35:45.661285','COD',6350,'PLACED','16.09.2015',3),(14,'2015-09-15 17:45:36.269727','2015-09-15 17:45:36.269761','COD',400,'PLACED','16.09.2015',7),(15,'2015-09-16 05:58:47.762617','2015-09-16 05:58:47.762650','COD',7272,'PLACED','17.09.2015',7),(16,'2015-09-16 16:33:08.580808','2015-09-16 16:33:08.580865','COD',5070,'PLACED','17.09.2015',4);
=======
INSERT INTO `veggex_order` VALUES (1,'2015-09-14 01:06:55.144868','2015-09-14 01:06:55.144924','COD',2213,'PLACED',NULL,3);
>>>>>>> origin
/*!40000 ALTER TABLE `veggex_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_orderitem`
--

DROP TABLE IF EXISTS `veggex_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_orderitem` (
  `orderitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(100) NOT NULL,
  `qtyInUnits` int(11) NOT NULL,
  `priceType` varchar(200) NOT NULL,
  `priceAtThatTime` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`orderitem_id`),
<<<<<<< HEAD
  KEY `veggex_orderi_order_id_76bbb0cc25245ba7_fk_veggex_order_order_id` (`order_id`),
  KEY `veggex_orderitem_9bea82de` (`product_id`),
  CONSTRAINT `veggex__product_id_17b482d0407f03ca_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_orderi_order_id_76bbb0cc25245ba7_fk_veggex_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `veggex_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
=======
  KEY `veggex_orderitem_order_id_25245ba7_fk_veggex_order_order_id` (`order_id`),
  KEY `veggex_orderitem_9bea82de` (`product_id`),
  CONSTRAINT `veggex_orderite_product_id_407f03ca_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_orderitem_order_id_25245ba7_fk_veggex_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `veggex_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
>>>>>>> origin
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_orderitem`
--

LOCK TABLES `veggex_orderitem` WRITE;
/*!40000 ALTER TABLE `veggex_orderitem` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `veggex_orderitem` VALUES (1,'kg',1,'as per mandi rates',100,1,11),(2,'kg',1,'custom rates',123,1,4),(3,'kg',1,'custom rates',123,2,4),(4,'10 kg',3,'custom rates',100,3,1),(5,'kg',3,'custom rates',15,3,4),(6,'kg',2,'as per mandi rates',22,3,11),(7,'kg',2,'as per mandi rates',41,3,12),(8,'10 kg',3,'custom rates',100,4,1),(9,'kg',3,'custom rates',15,4,4),(10,'kg',2,'as per mandi rates',22,4,11),(11,'kg',3,'as per mandi rates',41,4,12),(12,'kg',3,'custom rates',90,4,2),(13,'kg',3,'custom rates',1000,4,9),(14,'kg',2,'as per mandi rates',80,4,14),(15,'kg',2,'as per mandi rates',200,4,16),(16,'kg',1,'as per mandi rates',80,5,13),(17,'kg',1,'custom rates',90,6,2),(18,'kg',1,'custom rates',90,7,2),(19,'kg',1,'custom rates',1000,7,9),(20,'kg',1,'custom rates',15,7,4),(21,'kg',1,'as per mandi rates',22,7,11),(22,'kg',3,'as per mandi rates',200,8,16),(23,'kg',3,'custom rates',90,8,2),(24,'10 kg',2,'custom rates',100,8,1),(25,'kg',1,'as per mandi rates',80,8,14),(26,'kg',3,'custom rates',90,9,2),(27,'kg',1,'as per mandi rates',200,9,16),(28,'10 kg',1,'custom rates',150,9,4),(29,'10 kg',1,'custom rates',100,9,1),(30,'kg',1,'as per mandi rates',80,9,14),(31,'kg',1,'as per mandi rates',80,10,13),(32,'4 kg',3,'as per mandi rates',450,10,24),(33,'5 kg',1,'custom rates',5500,10,9),(34,'20 kg',1,'as per mandi rates',2400,10,2),(35,'10 kg',1,'custom rates',100,10,1),(36,'80 kg',1,'as per mandi rates',1250,11,4),(37,'10 kg',8,'custom rates',100,11,1),(38,'50 kg',1,'as per mandi rates',575,11,28),(39,'1 kg',1,'as per mandi rates',160,11,25),(40,'10 kg ',1,'as per mandi rates',425,11,18),(41,'20 kg',15,'as per mandi rates',2400,12,2),(42,'5 kg',1,'custom rates',5500,12,9),(43,'kg',4,'custom rates',123,12,3),(44,'80 kg',9,'as per mandi rates',1250,12,4),(45,'10 kg',3,'custom rates',100,13,1),(46,'20 kg',2,'as per mandi rates',2400,13,2),(47,'80 kg',1,'as per mandi rates',1250,13,4),(48,'1 kg',1,'as per mandi rates',400,14,10),(49,'40 kg',1,'as per mandi rates',500,15,32),(50,'40 kg',1,'as per mandi rates',650,15,31),(51,'40 kg',1,'as per mandi rates',400,15,30),(52,'8 kg',1,'custom rates',450,15,27),(53,'4 kg',1,'as per mandi rates',450,15,24),(54,'kg',1,'as per mandi rates',22,15,11),(55,'20 kg',2,'as per mandi rates',2400,15,2),(56,'1 kg',2,'as per mandi rates',35,16,23),(57,'20 kg',2,'as per mandi rates',2500,16,22);
=======
INSERT INTO `veggex_orderitem` VALUES (1,'kg',1,'as per mandi rates',60,1,12),(2,'kg',1,'as per mandi rates',80,1,13),(3,'kg',2,'custom rates',123,1,4),(4,'kg',1,'custom rates',100,1,9),(5,'10 kg',1,'custom rates',100,1,1),(6,'kg',9,'custom rates',123,1,3),(7,'kg',10,'custom rates',12,1,2),(8,'kg',4,'as per mandi rates',100,1,11);
>>>>>>> origin
/*!40000 ALTER TABLE `veggex_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_product`
--

DROP TABLE IF EXISTS `veggex_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `description` longtext,
  `popularityIndex` int(11) DEFAULT NULL,
  `unit` varchar(100) NOT NULL,
  `priceType` varchar(300) NOT NULL,
  `pricePerUnit` int(11) NOT NULL,
  `coverphoto` varchar(100) NOT NULL,
  `origin` varchar(300) NOT NULL,
  `maxAvailableUnits` int(11) NOT NULL,
  `qualityRemarks` longtext NOT NULL,
  `isPerishable` tinyint(1) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `seller_id` int(11),
  `status` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
<<<<<<< HEAD
  KEY `vegg_category_id_3f4b5a7b31eec16e_fk_veggex_category_category_id` (`category_id`),
  KEY `veggex_product_0a7c7ff2` (`seller_id`),
  CONSTRAINT `vegg_category_id_3f4b5a7b31eec16e_fk_veggex_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `veggex_category` (`category_id`),
  CONSTRAINT `veggex_prod_seller_id_52c4dfbf65faed3_fk_veggex_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `veggex_seller` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
=======
  KEY `veggex_produ_category_id_31eec16e_fk_veggex_category_category_id` (`category_id`),
  KEY `veggex_product_0a7c7ff2` (`seller_id`),
  CONSTRAINT `veggex_produ_category_id_31eec16e_fk_veggex_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `veggex_category` (`category_id`),
  CONSTRAINT `veggex_product_seller_id_9a0512d_fk_veggex_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `veggex_seller` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
>>>>>>> origin
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_product`
--

LOCK TABLES `veggex_product` WRITE;
/*!40000 ALTER TABLE `veggex_product` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `veggex_product` VALUES (1,'Tomatoes','xx',NULL,'10 kg','custom rates',100,'./tomatoes-_low.jpg','chomu',1000,'dd',1,1,1,1),(2,'Apple - Grade A','ff',4,'20 kg','as per mandi rates',2400,'./apples2.jpg','jaipur',12,'fff',0,2,NULL,1),(3,'Green Apple','http://www.mive.in/main',NULL,'kg','custom rates',123,'./image-4-compressed_FMUSsJZ.jpg','agra',12,'dgds',0,2,NULL,0),(4,'Carrot - Grade A','http://www.mive.in/main',4,'80 kg','as per mandi rates',1250,'./image-2-compressed_0U1BLaq.jpg','delhi',12,'ddsf',1,1,1,1),(9,'Cherry ','red cherry ',4,'5 kg','custom rates',5500,'./cherry_PNG611.jpg','usa',12,'superb quality , ideal for shakes ',0,2,1,1),(10,'Oranges','Juicy sweet orange. \r\nORANGE MINI from THAILAND ',9,'1 kg','as per mandi rates',400,'./ORANGES.jpg','agra ',100,'amazing quality ',0,2,1,1),(11,'Lemons ','juicy lemon ',5,'kg','as per mandi rates',22,'./lemons.jpg','agra ',452,'superp quality and perishable ',1,1,1,1),(12,'CauliFlower ','White Cauliflower ',5,'20kg','as per mandi rates',820,'./cauliflower.jpg','Agra ',20,'superb quality ',0,1,1,1),(13,'Litchi ','Juicy lichi ',6,'kg','as per mandi rates',80,'./LICHI.jpg','china ',4,'juicy litchi ',0,2,1,0),(14,'Black Grapes ','Sweet grapes ',9,'kg','as per mandi rates',80,'./black_grapes.jpg','india',120,'amazing sweet grapes ',0,2,1,0),(15,'Guava ','sweet guava ',4,'kg','as per mandi rates',30,'./guava1.jpg','nagpur ',50,'sweet guavas with less seeds ',0,2,1,0),(16,'Kiwi Fruit ','Newzealand imported Kiwi fruit ',7,'3 kg','as per mandi rates',850,'./FreshKiwiFruitPhoto5.jpg','newzealand',10,'superb quality ',0,2,1,1),(18,'Amrood ','Amrood - WB',6,'10 kg ','as per mandi rates',425,'./guava1_G7UN0gZ.jpg','west bengal ',25,'sweet fruit ,less seeds',0,2,1,1),(19,'Banana ','BANANA',6,'100 kg ','as per mandi rates',1150,'./Bananas-Great-Food-Pre-Post-Workout.jpg','MAH',4,'SWEET BANANa ',0,2,1,1),(20,'Pears - Grade A ','PUN \r\n\r\nGRADE -A ',5,'15 kg','custom rates',350,'./pear_green.jpg','PUNJAB ',21,'SOFT AND SWEET PEARS ',0,2,1,1),(21,'Pine Apple - Grade A','WB/KERALA/RAJ./T.NADU \r\n ',4,'1 KG','as per mandi rates',36,'./27-health-benefits-of-pineapple-fruit.jpg','west bengal',25,'JUICY PINEAPPLE ',0,2,1,1),(22,'Jamun - Grade A','PUNJAB ',7,'20 kg','as per mandi rates',2500,'./Jamun.jpg','PUNJAB',4,'SWEET JAMUN ',0,2,1,1),(23,'Water Melon - Grade A ','AP',6,'1 kg','as per mandi rates',35,'./d0e5Watermelon21.jpg','ARUNACHAL PRADESH ',45,'RED AND SWEET ',0,2,1,1),(24,'Almond - Grade A','HP ',NULL,'4 kg','as per mandi rates',450,'./almonds-face-packs.jpg','HP ',10,'ALMD',0,2,1,1),(25,'Mushroom - Grade A','MUSHROOM HP/ PUN / HAR/ UTK ',4,'1 kg','as per mandi rates',160,'./Mushroom-Vegetable.jpg','PUNJAB',4,'GOOD',0,2,1,1),(26,'Potato - Grade - A1','HP/Shimla ',9,'80 kg','as per mandi rates',1400,'./potato.jpg','HP',55,'GOOD',0,1,1,1),(27,'Melon ','melon from thailand ',4,'8 kg','custom rates',450,'./1622_melon.jpg','Thailand ',45,'good ',0,2,1,1),(28,'Arvi - Grade A ','',4,'50 kg','as per mandi rates',575,'./DSCN1983.jpg','uttar pradesh',4,'good ',0,1,1,1),(29,'Amla - Grade A','t.NADU / UP/Har',7,'20 kg','as per mandi rates',800,'./Taiyo_amla_fruit.jpg','UP',4,'GOod ',0,1,1,1),(30,'Brinjal - Grade A','brinjal from rajasthan, up ',7,'40 kg','as per mandi rates',400,'./brinjal_long.jpg','uttar pradesh',5,'good ',0,1,1,1),(31,'Cabbage - Grade A','leafy ',6,'40 kg','as per mandi rates',650,'./raw-cabbage.jpg','karnataka',5,'good ',0,1,1,1),(32,'Cucumber - Grade A','Cucumber ',8,'40 kg','as per mandi rates',500,'./Cucumber.jpg','bihar ',50,'good ',0,1,1,1),(33,'Garlic - Grade A ','good ',2,'40 kg','as per mandi rates',4800,'./garlic-04.jpg','kullu ',52,'good ',0,1,1,1),(34,'Gourd - Grade A ','Good Gourd ',7,'25 kg','as per mandi rates',170,'./bottlegourd.jpg','chattisgarh ',45,'good ',0,1,1,1),(35,'Kathal - Grade A ','kathal from kerala ',7,'40 kg','as per mandi rates',600,'./KT.jpg','kerala ',4,'good',0,1,1,1),(36,'Onion - Grade A','good ',9,'40kg','as per mandi rates',1450,'./Red-Onion-2.jpg','nasik ',40,'good ',0,1,1,1),(37,'Spinach -Grade A','LEAFY',7,'40kg','as per mandi rates',600,'./270609-spinach.jpg','uttar pradesh',50,'good ',0,1,1,1),(38,'Dragan ','USA',8,'10kg','as per mandi rates',3000,'./tumblr_mh0aj3T6Yn1qg5xklo1_r1_1280.jpg','USA ',10,'good ',0,2,1,1),(39,'Chikoo - Grade A','chikoo',6,'10 kg','as per mandi rates',300,'./27-health-benefits-of-pineapple-fruit_BPBeTYD.jpg','Gujrat ',20,'good',0,2,1,1),(40,'Plum - Grade A ','red Plum',NULL,'8 kg','as per mandi rates',400,'./Plum-Casselman1.jpg','J&K',20,'good',0,2,1,1),(41,'Coconut ','coconut',6,'220 pc','as per mandi rates',3400,'./coconuts.jpg','karnataka',10,'good ',0,2,1,1),(42,'Nakh - Grade A','Nakh ',3,'8 kg','as per mandi rates',200,'./NAKH.jpg','UP',12,'good',0,2,1,1),(43,'Peach - Grade A','peach from utk ',6,'14 kg','custom rates',250,'./peach-image-free-1.jpg','UTK',12,'good',0,2,1,1),(44,'Lady Finger - Grade A ','LADY FINGER ',4,'40 kg','as per mandi rates',550,'./06102012331.jpg','haryana',10,'good ',0,1,1,1),(45,'Mint - Grade A','MiNT ',4,'40 kg ','as per mandi rates',1600,'./mint-leaves.jpg','haryana',10,'amazing ',0,1,1,1),(46,'Bitter Gourd - Grade A ','bitter gourd from uTK/Raj',5,'40kg','as per mandi rates',625,'./24126_bitter-gourd.jpg','rajasthan',10,'GOOD ',0,1,1,1);
=======
INSERT INTO `veggex_product` VALUES (1,'Tomatoes','xx',NULL,'10 kg','custom rates',100,'./tomatoes-_low.jpg','chomu',1000,'dd',1,1,1,1),(2,'apple','ff',NULL,'kg','custom rates',12,'./apples2.jpg','jaipur',12,'fff',0,2,NULL,1),(3,'Green Apple','http://www.mive.in/main',NULL,'kg','custom rates',123,'./image-4-compressed_FMUSsJZ.jpg','agra',12,'dgds',0,2,NULL,1),(4,'Carrot','http://www.mive.in/main',NULL,'kg','custom rates',123,'./image-2-compressed_0U1BLaq.jpg','delhi',12,'ddsf',1,1,1,1),(5,'Apple','cfsc',NULL,'kg','custom rates',123,'./e.jpg','delhi',12,'dsd',0,1,NULL,1),(7,'a','ddd',NULL,'kg','custom rates',1000,'./image-2-compressed.jpg','Delhi',1212,'ff',0,2,NULL,1),(8,'Green Apple','gdfg',NULL,'kg','custom rates',10,'./image-4-compressed.jpg','ggg',1000,'dddd',0,1,NULL,1),(9,'Cherry ','red cherry ',4,'kg','custom rates',100,'./cherry_PNG611.jpg','agra',12,'superb quality , ideal for shakes ',0,2,1,1),(10,'Oranges','Juicy sweet orange ',9,'kg','as per mandi rates',45,'./ORANGES.jpg','agra ',100,'amazing quality ',0,2,1,1),(11,'Lemons ','juicy lemon ',5,'kg','as per mandi rates',100,'./lemons.jpg','agra ',452,'superp quality and perishable ',1,1,1,1),(12,'CauliFlower ','White Cauliflower ',5,'kg','as per mandi rates',60,'./cauliflower.jpg','Agra ',20,'superb quality ',0,1,1,1),(13,'Litchi ','Juicy lichi ',6,'kg','as per mandi rates',80,'./LICHI.jpg','china ',4,'juicy litchi ',0,2,1,1),(14,'Black Grapes ','Sweet grapes ',9,'kg','as per mandi rates',80,'./black_grapes.jpg','india',120,'amazing sweet grapes ',0,2,1,1),(15,'Guava ','sweet guava ',4,'kg','as per mandi rates',30,'./guava1.jpg','nagpur ',50,'sweet guavas with less seeds ',0,2,1,1),(16,'Kiwi Fruit ','Newzealand imported Kiwi fruit ',7,'kg','as per mandi rates',200,'./FreshKiwiFruitPhoto5.jpg','newzealand',10,'superb quality ',0,2,1,1);
>>>>>>> origin
/*!40000 ALTER TABLE `veggex_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_seller`
--

DROP TABLE IF EXISTS `veggex_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_seller` (
  `seller_id` int(11) NOT NULL AUTO_INCREMENT,
  `nameOfSeller` varchar(300) NOT NULL,
  `mailId` varchar(300) NOT NULL,
  `mobileNo` bigint(20) NOT NULL,
  `profilePhoto` varchar(100) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `mandi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
<<<<<<< HEAD
  KEY `veggex__address_id_5a5e3c01e6e4bf40_fk_veggex_address_address_id` (`address_id`),
  KEY `veggex_seller_mandi_id_2033cc6a06d87b2d_fk_veggex_mandi_mandi_id` (`mandi_id`),
  CONSTRAINT `veggex__address_id_5a5e3c01e6e4bf40_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`),
  CONSTRAINT `veggex_seller_mandi_id_2033cc6a06d87b2d_fk_veggex_mandi_mandi_id` FOREIGN KEY (`mandi_id`) REFERENCES `veggex_mandi` (`mandi_id`)
=======
  KEY `veggex_seller_address_id_191b40c0_fk_veggex_address_address_id` (`address_id`),
  KEY `veggex_seller_mandi_id_6d87b2d_fk_veggex_mandi_mandi_id` (`mandi_id`),
  CONSTRAINT `veggex_seller_address_id_191b40c0_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`),
  CONSTRAINT `veggex_seller_mandi_id_6d87b2d_fk_veggex_mandi_mandi_id` FOREIGN KEY (`mandi_id`) REFERENCES `veggex_mandi` (`mandi_id`)
>>>>>>> origin
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_seller`
--

LOCK TABLES `veggex_seller` WRITE;
/*!40000 ALTER TABLE `veggex_seller` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `veggex_seller` VALUES (1,'Mive PVT LTD','rak.dev007@gmail.com',837795071166,'./26af7f70-314c-45fa-8056-2ff2ff2c8fcf.jpg',1,1);
=======
INSERT INTO `veggex_seller` VALUES (1,'Mive PVT LTD','info@mive.in',8377950711,'./Screenshot_from_2015-09-07_024129.png',1,1);
>>>>>>> origin
/*!40000 ALTER TABLE `veggex_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_subscribe`
--

DROP TABLE IF EXISTS `veggex_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_subscribe`
--

LOCK TABLES `veggex_subscribe` WRITE;
/*!40000 ALTER TABLE `veggex_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `veggex_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_user`
--

DROP TABLE IF EXISTS `veggex_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `nameOfInstitution` varchar(300) NOT NULL,
  `nameOfOwner` varchar(300) NOT NULL,
  `institutionType` varchar(300) NOT NULL,
  `mailId` varchar(300) NOT NULL,
  `mobileNo` bigint(20) NOT NULL,
  `password` varchar(300) NOT NULL,
  `gpsLocation` varchar(300) DEFAULT NULL,
  `profilePhoto` varchar(100) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mobileNo` (`mobileNo`),
<<<<<<< HEAD
  KEY `veggex__address_id_35aed4a1755b7296_fk_veggex_address_address_id` (`address_id`),
  KEY `veggex_user_cart_id_76c7be8763b84d4f_fk_veggex_cart_cart_id` (`cart_id`),
  CONSTRAINT `veggex__address_id_35aed4a1755b7296_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`),
  CONSTRAINT `veggex_user_cart_id_76c7be8763b84d4f_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
=======
  KEY `veggex_user_address_id_755b7296_fk_veggex_address_address_id` (`address_id`),
  KEY `veggex_user_cart_id_63b84d4f_fk_veggex_cart_cart_id` (`cart_id`),
  CONSTRAINT `veggex_user_address_id_755b7296_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`),
  CONSTRAINT `veggex_user_cart_id_63b84d4f_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
>>>>>>> origin
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_user`
--

LOCK TABLES `veggex_user` WRITE;
/*!40000 ALTER TABLE `veggex_user` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `veggex_user` VALUES (3,'Mezbaan','Hatim Singh','veg. vendors','rak.dev007@gmail.com',8377950711,'pbkdf2_sha256$20000$xcPbF0CMVCyw$eZECZo2qDkuIVr8+UxTiIosfDPdHx6mMQNhUbp3AAjM=','','./1269438_708935059120411_1743592332_o_Cropped.jpg',1,2),(4,'Shubham','Shubham','hotels','ra@gmail.com',8449091239,'pbkdf2_sha256$12000$LwPATwemj5J2$ftGbMJSKtho6HrM+uXoKDHBRc7Uxgg+Pn9Ay5ySDk6E=','','./255390_4223000579700_1242451309_n_Cropped.jpg',1,1),(5,'PC Hotels','PC Yadav','hotels','info@mive.in',9289010333,'pbkdf2_sha256$20000$zAvkslEN3qXO$gPPOFn2xQR4FHdJkxcAsIyCvBUwmBGDS+0g33xrOWEY=','','./255390_4223000579700_1242451309_n_Cropped_6b0QkxH.jpg',1,3),(6,'Angara','Anagar','hotels','rak.dev007@gmail.com',9999999999,'pbkdf2_sha256$20000$2pi5WuWd76c3$SMYUW7RCx3GgD6KSoRHJpB9yGolUrChFBVusKAtjNbA=','','./sb.jpg',NULL,4),(7,'Test','test','hotels','rak.dev007@gmail.com',123456789,'pbkdf2_sha256$20000$7oWfiSkXcXK0$O45JhQVzk2mXo/9mIVtUT2ein2osuRHb+TS+bQJoEMg=','','./1654221_956833487662614_4256020199414774531_n_Cropped.jpg',NULL,5);
=======
INSERT INTO `veggex_user` VALUES (3,'Mezbaan','Hatim Singh','veg. vendors','rak.dev007@gmail.com',8377950711,'pbkdf2_sha256$20000$xcPbF0CMVCyw$eZECZo2qDkuIVr8+UxTiIosfDPdHx6mMQNhUbp3AAjM=','','./1269438_708935059120411_1743592332_o_Cropped.jpg',1,2),(4,'Shubham','Shubham','hotels','ra@gmail.com',8449091239,'pbkdf2_sha256$12000$LwPATwemj5J2$ftGbMJSKtho6HrM+uXoKDHBRc7Uxgg+Pn9Ay5ySDk6E=','','./255390_4223000579700_1242451309_n_Cropped.jpg',1,1),(5,'PC Hotels','PC Yadav','hotels','info@mive.in',9289010333,'pbkdf2_sha256$20000$zAvkslEN3qXO$gPPOFn2xQR4FHdJkxcAsIyCvBUwmBGDS+0g33xrOWEY=','','./255390_4223000579700_1242451309_n_Cropped_6b0QkxH.jpg',1,3);
>>>>>>> origin
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

<<<<<<< HEAD
-- Dump completed on 2015-09-18 21:34:20
=======
-- Dump completed on 2015-09-18 21:30:00
>>>>>>> origin
