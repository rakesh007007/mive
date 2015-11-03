-- MySQL dump 10.13  Distrib 5.6.25, for debian-linux-gnu (i686)
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
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$ZQaS0YIU4pON$fPbchPUomxreTDbh3Xbt+CyfSOan+nESVOUnAyF8kcE=','2015-09-19 21:36:20.079839',1,'admin','','','rak.dev007@gmail.com',1,1,'2015-09-18 16:16:45.062094');
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
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  CONSTRAINT `authtoken_token_user_id_535fb363_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('4754a9e31867a5602fe169062de2179c0a2b608d','2015-09-19 17:51:01.608041',1);
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
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-09-18 16:17:39.641352','1','Mive PVT LTD',1,'',14,1),(2,'2015-09-19 16:17:14.594275','16','Kiwi Fruit -Grade-A-newzealand',2,'Changed grade and related_products.',15,1),(3,'2015-09-19 16:20:11.813511','16','Kiwi Fruit -Grade-A-newzealand',2,'No fields changed.',15,1),(4,'2015-09-19 19:59:43.774793','4','Cart object',1,'',11,1),(5,'2015-09-19 19:59:48.041598','1','Rakesh yadav',1,'',12,1),(6,'2015-09-19 21:37:56.384189','1','Rakesh yadav',2,'Changed mobileNo and password.',12,1);
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
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-09-18 16:01:22.210890'),(2,'auth','0001_initial','2015-09-18 16:01:31.654749'),(3,'admin','0001_initial','2015-09-18 16:01:34.727572'),(4,'contenttypes','0002_remove_content_type_name','2015-09-18 16:01:36.290712'),(5,'auth','0002_alter_permission_name_max_length','2015-09-18 16:01:37.389129'),(6,'auth','0003_alter_user_email_max_length','2015-09-18 16:01:38.452616'),(7,'auth','0004_alter_user_username_opts','2015-09-18 16:01:38.528729'),(8,'auth','0005_alter_user_last_login_null','2015-09-18 16:01:39.908173'),(9,'auth','0006_require_contenttypes_0002','2015-09-18 16:01:39.985864'),(10,'authtoken','0001_initial','2015-09-18 16:01:41.241478'),(11,'sessions','0001_initial','2015-09-18 16:01:42.582711'),(12,'veggex','0001_initial','2015-09-18 16:02:17.752564'),(13,'veggex','0002_auto_20150918_2205','2015-09-18 16:35:45.277224'),(14,'veggex','0003_product_grade','2015-09-19 14:49:11.793546'),(15,'veggex','0004_auto_20150919_2050','2015-09-19 15:20:46.481261'),(16,'veggex','0005_auto_20150919_2148','2015-09-19 16:18:26.396656'),(17,'veggex','0006_auto_20150920_0310','2015-09-19 21:40:28.167935'),(18,'veggex','0007_auto_20150920_0413','2015-09-19 22:43:41.441393'),(19,'veggex','0008_auto_20150920_0414','2015-09-19 22:44:42.263436');
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
INSERT INTO `django_session` VALUES ('40a1aiozesk4t9i6fwhboihtthcrotc4','YjdmMDkyODdlZTNlODk3ZjBmMGI0YmYyZmUyY2IxMzQxYWQzM2Y3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwibWl2ZXVzZXIiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTNhMjk5NDJjMzA1NDI3MTU3N2VhZDZiOTFlNjhlYzlkNzJhYzA4NiJ9','2015-10-03 22:00:28.933418'),('cvdfkd7ndar098wq7wf0emhottaphais','NzA3MmU4ZWY1ZmYxYzJiMGZlMzNiOTBmNDE4NjEwYjQ2Nzg3NDc4MTp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1pdmV1c2VyIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1vYmlsZSI6IjgzNzc5NTA3MTEiLCJfYXV0aF91c2VyX2hhc2giOiJhM2EyOTk0MmMzMDU0MjcxNTc3ZWFkNmI5MWU2OGVjOWQ3MmFjMDg2In0=','2015-10-04 07:02:58.073975'),('wh9ihto6jaizu0y5jpfzbdhkt15lu193','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-10 04:01:31.149930');
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
  CONSTRAINT `veggex_accartit_product_id_20f089ad_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_accartitem_cart_id_1aa388bb_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`)
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
  `timeOfCreate` datetime(6) NOT NULL,
  `timeOfUpdate` datetime(6) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_cart`
--

LOCK TABLES `veggex_cart` WRITE;
/*!40000 ALTER TABLE `veggex_cart` DISABLE KEYS */;
INSERT INTO `veggex_cart` VALUES (1,'2015-09-12 10:00:54.204000','2015-09-12 10:00:54.204000',23671),(2,'2015-09-12 10:14:37.607000','2015-09-12 10:14:37.607000',0),(3,'2015-09-11 03:26:26.161000','2015-09-11 03:26:26.161000',3912),(4,'2015-09-26 04:01:49.245893','2015-09-26 04:01:49.245900',123);
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
  `timeOfCreate` datetime(6) NOT NULL,
  `timeOfUpdate` datetime(6) NOT NULL,
  PRIMARY KEY (`cartitem_id`),
  KEY `veggex_cartitem_cart_id_e97a525_fk_veggex_cart_cart_id` (`cart_id`),
  KEY `veggex_cartitem_9bea82de` (`product_id`),
  CONSTRAINT `veggex_cartitem_cart_id_e97a525_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`),
  CONSTRAINT `veggex_cartitem_product_id_410c13a3_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_cartitem`
--

LOCK TABLES `veggex_cartitem` WRITE;
/*!40000 ALTER TABLE `veggex_cartitem` DISABLE KEYS */;
INSERT INTO `veggex_cartitem` VALUES (1,1,4,3,'2015-09-26 04:01:49.319172','2015-09-26 04:01:49.319209');
/*!40000 ALTER TABLE `veggex_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
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
-- Table structure for table `veggex_categoryvendor`
--

DROP TABLE IF EXISTS `veggex_categoryvendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_categoryvendor` (
  `categoryvendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`categoryvendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_categoryvendor`
--

LOCK TABLES `veggex_categoryvendor` WRITE;
/*!40000 ALTER TABLE `veggex_categoryvendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `veggex_categoryvendor` ENABLE KEYS */;
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
  `timeOfCreate` datetime(6) NOT NULL,
  `timeOfUpdate` datetime(6) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_contact`
--

LOCK TABLES `veggex_contact` WRITE;
/*!40000 ALTER TABLE `veggex_contact` DISABLE KEYS */;
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
  CONSTRAINT `veggex_customcategorypro_user_id_39efe98a_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_customcategoryproducts`
--

LOCK TABLES `veggex_customcategoryproducts` WRITE;
/*!40000 ALTER TABLE `veggex_customcategoryproducts` DISABLE KEYS */;
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
  KEY `veggex_customca_product_id_155d8ce3_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `c391af7c2656c8ea07b96799bb3e3451` FOREIGN KEY (`customcategoryproducts_id`) REFERENCES `veggex_customcategoryproducts` (`uid`),
  CONSTRAINT `veggex_customca_product_id_155d8ce3_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_customcategoryproducts_product`
--

LOCK TABLES `veggex_customcategoryproducts_product` WRITE;
/*!40000 ALTER TABLE `veggex_customcategoryproducts_product` DISABLE KEYS */;
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
  KEY `veggex_mandi_address_id_1f9872e5_fk_veggex_address_address_id` (`address_id`),
  CONSTRAINT `veggex_mandi_address_id_1f9872e5_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_mandi`
--

LOCK TABLES `veggex_mandi` WRITE;
/*!40000 ALTER TABLE `veggex_mandi` DISABLE KEYS */;
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
  `deliveryTime` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `orderMsg` longtext,
  PRIMARY KEY (`order_id`),
  KEY `veggex_order_e8701ad4` (`user_id`),
  CONSTRAINT `veggex_order_user_id_45dbd524_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_order`
--

LOCK TABLES `veggex_order` WRITE;
/*!40000 ALTER TABLE `veggex_order` DISABLE KEYS */;
INSERT INTO `veggex_order` VALUES (1,'2015-09-19 22:32:55.014894','2015-09-19 22:32:55.014958','COD',300,'PLACED',NULL,1,NULL),(2,'2015-09-19 22:33:43.715548','2015-09-19 22:33:43.715590','COD',123,'PLACED',NULL,1,NULL),(3,'2015-09-19 22:34:41.581276','2015-09-19 22:34:41.581309','COD',123,'PLACED',NULL,1,NULL),(4,'2015-09-19 22:42:14.926788','2015-09-19 22:42:14.926820','COD',120,'PLACED','2015-09-30',1,'hfhfhfhf');
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
  KEY `veggex_orderitem_order_id_25245ba7_fk_veggex_order_order_id` (`order_id`),
  KEY `veggex_orderitem_9bea82de` (`product_id`),
  CONSTRAINT `veggex_orderite_product_id_407f03ca_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_orderitem_order_id_25245ba7_fk_veggex_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `veggex_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_orderitem`
--

LOCK TABLES `veggex_orderitem` WRITE;
/*!40000 ALTER TABLE `veggex_orderitem` DISABLE KEYS */;
INSERT INTO `veggex_orderitem` VALUES (1,'kg',1,'as per mandi rates',200,1,16),(2,'kg',1,'as per mandi rates',30,1,15),(3,'kg',1,'as per mandi rates',60,1,12),(4,'kg',1,'custom rates',10,1,8),(5,'kg',1,'custom rates',123,2,3),(6,'kg',1,'custom rates',123,3,3),(7,'kg',2,'custom rates',10,4,8),(8,'kg',1,'custom rates',100,4,9);
/*!40000 ALTER TABLE `veggex_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_owner`
--

DROP TABLE IF EXISTS `veggex_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_owner` (
  `owner_id` int(11) NOT NULL AUTO_INCREMENT,
  `nameOfOwner` varchar(300) NOT NULL,
  `mailId` varchar(300) NOT NULL,
  `mobileNo` bigint(20) NOT NULL,
  `profilePhoto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`owner_id`),
  UNIQUE KEY `mobileNo` (`mobileNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_owner`
--

LOCK TABLES `veggex_owner` WRITE;
/*!40000 ALTER TABLE `veggex_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `veggex_owner` ENABLE KEYS */;
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
  `status` int(11) NOT NULL,
  `isPerishable` tinyint(1) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `seller_id` int(11),
  `grade` varchar(200) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `veggex_produ_category_id_31eec16e_fk_veggex_category_category_id` (`category_id`),
  KEY `veggex_product_0a7c7ff2` (`seller_id`),
  CONSTRAINT `veggex_produ_category_id_31eec16e_fk_veggex_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `veggex_category` (`category_id`),
  CONSTRAINT `veggex_product_seller_id_9a0512d_fk_veggex_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `veggex_seller` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_product`
--

LOCK TABLES `veggex_product` WRITE;
/*!40000 ALTER TABLE `veggex_product` DISABLE KEYS */;
INSERT INTO `veggex_product` VALUES (1,'Tomatoes','xx',NULL,'10 kg','custom rates',100,'./tomatoes-_low.jpg','chomu',1000,'dd',1,1,1,1,''),(2,'apple','ff',NULL,'kg','custom rates',12,'./apples2.jpg','jaipur',12,'fff',1,0,2,NULL,''),(3,'Green Apple','http://www.mive.in/main',NULL,'kg','custom rates',123,'./image-4-compressed_FMUSsJZ.jpg','agra',12,'dgds',1,0,2,NULL,''),(4,'Carrot','http://www.mive.in/main',NULL,'kg','custom rates',123,'./image-2-compressed_0U1BLaq.jpg','delhi',12,'ddsf',1,1,1,1,''),(5,'Apple','cfsc',NULL,'kg','custom rates',123,'./e.jpg','delhi',12,'dsd',1,0,1,NULL,''),(7,'a','ddd',NULL,'kg','custom rates',1000,'./image-2-compressed.jpg','Delhi',1212,'ff',1,0,2,NULL,''),(8,'Green Apple','gdfg',NULL,'kg','custom rates',10,'./image-4-compressed.jpg','ggg',1000,'dddd',1,0,1,NULL,''),(9,'Cherry ','red cherry ',4,'kg','custom rates',100,'./cherry_PNG611.jpg','agra',12,'superb quality , ideal for shakes ',1,0,2,1,''),(10,'Oranges','Juicy sweet orange ',9,'kg','as per mandi rates',45,'./ORANGES.jpg','agra ',100,'amazing quality ',1,0,2,1,''),(11,'Lemons ','juicy lemon ',5,'kg','as per mandi rates',100,'./lemons.jpg','agra ',452,'superp quality and perishable ',1,1,1,1,''),(12,'CauliFlower ','White Cauliflower ',5,'kg','as per mandi rates',60,'./cauliflower.jpg','Agra ',20,'superb quality ',1,0,1,1,''),(13,'Litchi ','Juicy lichi ',6,'kg','as per mandi rates',80,'./LICHI.jpg','china ',4,'juicy litchi ',1,0,2,1,''),(14,'Black Grapes ','Sweet grapes ',9,'kg','as per mandi rates',80,'./black_grapes.jpg','india',120,'amazing sweet grapes ',1,0,2,1,''),(15,'Guava ','sweet guava ',4,'kg','as per mandi rates',30,'./guava1.jpg','nagpur ',50,'sweet guavas with less seeds ',1,0,2,1,''),(16,'Kiwi Fruit ','Newzealand imported Kiwi fruit ',7,'kg','as per mandi rates',200,'./FreshKiwiFruitPhoto5.jpg','newzealand',10,'superb quality ',1,0,2,1,'Grade-A');
/*!40000 ALTER TABLE `veggex_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_product_related_products`
--

DROP TABLE IF EXISTS `veggex_product_related_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_product_related_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_product_id` int(11) NOT NULL,
  `to_product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_product_id` (`from_product_id`,`to_product_id`),
  KEY `veggex_produ_to_product_id_5847c91f_fk_veggex_product_product_id` (`to_product_id`),
  CONSTRAINT `veggex_pro_from_product_id_6c06d52c_fk_veggex_product_product_id` FOREIGN KEY (`from_product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_produ_to_product_id_5847c91f_fk_veggex_product_product_id` FOREIGN KEY (`to_product_id`) REFERENCES `veggex_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_product_related_products`
--

LOCK TABLES `veggex_product_related_products` WRITE;
/*!40000 ALTER TABLE `veggex_product_related_products` DISABLE KEYS */;
INSERT INTO `veggex_product_related_products` VALUES (7,2,16),(8,3,16),(5,16,2),(6,16,3);
/*!40000 ALTER TABLE `veggex_product_related_products` ENABLE KEYS */;
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
  KEY `veggex_seller_address_id_191b40c0_fk_veggex_address_address_id` (`address_id`),
  KEY `veggex_seller_mandi_id_6d87b2d_fk_veggex_mandi_mandi_id` (`mandi_id`),
  CONSTRAINT `veggex_seller_address_id_191b40c0_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`),
  CONSTRAINT `veggex_seller_mandi_id_6d87b2d_fk_veggex_mandi_mandi_id` FOREIGN KEY (`mandi_id`) REFERENCES `veggex_mandi` (`mandi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_seller`
--

LOCK TABLES `veggex_seller` WRITE;
/*!40000 ALTER TABLE `veggex_seller` DISABLE KEYS */;
INSERT INTO `veggex_seller` VALUES (1,'Mive PVT LTD','rak.dev007@gmail.com',8377950711,'./Screenshot_from_2015-09-07_024129_1riGOw2.png',NULL,NULL,'rr');
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
  `owner_id` int(11),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `mobileNo` (`mobileNo`),
  KEY `veggex_user_address_id_755b7296_fk_veggex_address_address_id` (`address_id`),
  KEY `veggex_user_cart_id_63b84d4f_fk_veggex_cart_cart_id` (`cart_id`),
  KEY `veggex_user_5e7b1936` (`owner_id`),
  CONSTRAINT `veggex_user_address_id_755b7296_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`),
  CONSTRAINT `veggex_user_cart_id_63b84d4f_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_user`
--

LOCK TABLES `veggex_user` WRITE;
/*!40000 ALTER TABLE `veggex_user` DISABLE KEYS */;
INSERT INTO `veggex_user` VALUES (1,'Rakesh yadav','Rakesh yadav','hotels','rak.dev007@gmail.com',8377950711,'pbkdf2_sha256$20000$IOZKOuvKFIyS$Zf89nYnMv1a5PbVaxZ82Mz7vdmME2DSfJFM81tqS+ZA=','','./Screenshot_from_2015-09-07_024217.png',NULL,4,1);
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

-- Dump completed on 2015-10-11 23:46:58
