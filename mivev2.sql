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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add address',7,'add_address'),(20,'Can change address',7,'change_address'),(21,'Can delete address',7,'delete_address'),(22,'Can add mandi',8,'add_mandi'),(23,'Can change mandi',8,'change_mandi'),(24,'Can delete mandi',8,'delete_mandi'),(25,'Can add category',9,'add_category'),(26,'Can change category',9,'change_category'),(27,'Can delete category',9,'delete_category'),(28,'Can add seller',10,'add_seller'),(29,'Can change seller',10,'change_seller'),(30,'Can delete seller',10,'delete_seller'),(31,'Can add category vendor',11,'add_categoryvendor'),(32,'Can change category vendor',11,'change_categoryvendor'),(33,'Can delete category vendor',11,'delete_categoryvendor'),(34,'Can add contact',12,'add_contact'),(35,'Can change contact',12,'change_contact'),(36,'Can delete contact',12,'delete_contact'),(37,'Can add career',13,'add_career'),(38,'Can change career',13,'change_career'),(39,'Can delete career',13,'delete_career'),(40,'Can add cart',14,'add_cart'),(41,'Can change cart',14,'change_cart'),(42,'Can delete cart',14,'delete_cart'),(43,'Can add owner',15,'add_owner'),(44,'Can change owner',15,'change_owner'),(45,'Can delete owner',15,'delete_owner'),(46,'Can add user',16,'add_user'),(47,'Can change user',16,'change_user'),(48,'Can delete user',16,'delete_user'),(49,'Can add product',17,'add_product'),(50,'Can change product',17,'change_product'),(51,'Can delete product',17,'delete_product'),(52,'Can add custom category products',18,'add_customcategoryproducts'),(53,'Can change custom category products',18,'change_customcategoryproducts'),(54,'Can delete custom category products',18,'delete_customcategoryproducts'),(55,'Can add cartitem',19,'add_cartitem'),(56,'Can change cartitem',19,'change_cartitem'),(57,'Can delete cartitem',19,'delete_cartitem'),(58,'Can add accartitem',20,'add_accartitem'),(59,'Can change accartitem',20,'change_accartitem'),(60,'Can delete accartitem',20,'delete_accartitem'),(61,'Can add order',21,'add_order'),(62,'Can change order',21,'change_order'),(63,'Can delete order',21,'delete_order'),(64,'Can add orderitem',22,'add_orderitem'),(65,'Can change orderitem',22,'change_orderitem'),(66,'Can delete orderitem',22,'delete_orderitem'),(67,'Can add subscribe',23,'add_subscribe'),(68,'Can change subscribe',23,'change_subscribe'),(69,'Can delete subscribe',23,'delete_subscribe'),(70,'Can add token',24,'add_token'),(71,'Can change token',24,'change_token'),(72,'Can delete token',24,'delete_token');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$5czaExCTnUfR$z+C82fccRjGi1nD1Wk4IFwWiCk6YrPJp2v3FsBaPy/Q=','2015-10-12 21:07:22.269837',1,'admin','','','rak.dev007@gmail.com',1,1,'2015-10-11 23:14:33.949120');
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-10-11 23:18:38.997883','1','Chicken',1,'',9,1),(2,'2015-10-11 23:18:48.003666','2','Mutton',1,'',9,1),(3,'2015-10-11 23:18:48.365954','3','Mutton',1,'',9,1),(4,'2015-10-11 23:19:50.469873','1','1',1,'',7,1),(5,'2015-10-11 23:20:01.930153','1','1',1,'',14,1),(6,'2015-10-11 23:20:14.336555','1','Mezbaan restaurents',1,'',16,1),(7,'2015-10-12 08:10:43.261991','1','Mezbaan restaurents',2,'No fields changed.',16,1),(8,'2015-10-12 08:12:37.671692','1','azadpur',1,'',8,1),(9,'2015-10-12 08:12:42.740674','1','Mive',1,'',10,1),(10,'2015-10-12 08:13:52.671593','2','Mive-Chicken',1,'',11,1),(11,'2015-10-12 08:14:46.058999','3','Mive-Mutton',1,'',11,1),(12,'2015-10-12 08:14:51.295414','1','Mezbaan restaurents',2,'Changed categories.',16,1),(13,'2015-10-12 08:21:54.096237','4','Fruits',1,'',9,1),(14,'2015-10-12 08:22:27.757954','2','SupplyOnWheels',1,'',10,1),(15,'2015-10-12 08:22:31.292085','4','SupplyOnWheels-Fruits',1,'',11,1),(16,'2015-10-12 08:22:56.321647','5','Spices',1,'',9,1),(17,'2015-10-12 08:23:19.894289','3','Grofers',1,'',10,1),(18,'2015-10-12 08:23:22.688733','5','Grofers-Spices',1,'',11,1),(19,'2015-10-12 08:23:44.335183','1','Mezbaan restaurents',2,'Changed categories.',16,1),(20,'2015-10-12 15:08:29.767189','1','rakesh-Grade-A-chomu',1,'',17,1),(21,'2015-10-12 15:45:00.477431','1','rakesh-Grade-A-chomu',2,'Changed category.',17,1),(22,'2015-10-12 19:24:32.638461','1','rakesh-Grade-A-chomu',2,'No fields changed.',17,1),(23,'2015-10-12 19:27:20.177604','2','kellaff-Grade-B-delhi',1,'',17,1),(24,'2015-10-12 22:27:42.530356','3','Grofers-Mutton',2,'Changed seller.',11,1),(25,'2015-10-12 22:28:42.024429','3','Mive-Mutton',2,'Changed seller.',11,1),(26,'2015-10-12 22:29:58.644374','12','Litchi ',3,'',19,1),(27,'2015-10-12 22:29:58.737390','11','Litchi ',3,'',19,1),(28,'2015-10-12 22:29:58.804038','10','Litchi ',3,'',19,1),(29,'2015-10-12 22:29:58.960637','9','Oranges',3,'',19,1),(30,'2015-10-12 22:29:59.005245','8','Kiwi Fruit ',3,'',19,1),(31,'2015-10-12 22:29:59.049549','7','Guava ',3,'',19,1),(32,'2015-10-12 22:29:59.093831','6','Cherry ',3,'',19,1),(33,'2015-10-12 22:29:59.138216','5','Cherry ',3,'',19,1),(34,'2015-10-12 22:29:59.182605','4','Cherry ',3,'',19,1),(35,'2015-10-12 22:29:59.227042','3','Cherry ',3,'',19,1),(36,'2015-10-12 22:29:59.271374','2','kellaff',3,'',19,1),(37,'2015-10-12 22:29:59.315894','1','rakesh',3,'',19,1),(38,'2015-10-12 22:30:13.262485','1','1',2,'Changed cartTotal.',14,1),(39,'2015-10-12 22:44:59.322007','19','Black Grapes ',3,'',19,1),(40,'2015-10-12 22:44:59.400624','18','Black Grapes ',3,'',19,1),(41,'2015-10-12 22:44:59.445044','17','Black Grapes ',3,'',19,1),(42,'2015-10-12 22:44:59.489446','16','Oranges',3,'',19,1),(43,'2015-10-12 22:44:59.534106','15','Litchi ',3,'',19,1),(44,'2015-10-12 22:44:59.578604','14','Litchi ',3,'',19,1),(45,'2015-10-12 22:44:59.667555','13','Litchi ',3,'',19,1),(46,'2015-10-13 11:32:43.492997','1','1',2,'Changed cartTotal.',14,1),(47,'2015-10-13 11:35:30.228296','1','1',2,'Changed cartTotal.',14,1),(48,'2015-10-13 12:50:21.608067','1','Mezbaan restaurents',2,'Changed profilePhoto.',16,1),(49,'2015-10-13 19:35:09.283604','4','Bigbasket',1,'',10,1),(50,'2015-10-13 19:36:20.932618','5','zopnow',1,'',10,1),(51,'2015-10-13 19:37:39.818859','6','Peppertap',1,'',10,1),(52,'2015-10-14 17:23:59.731019','2','Mive-2',2,'Changed products.',11,1),(53,'2015-10-14 17:35:22.415826','10','SupplyOnWheels-10',3,'',11,1),(54,'2015-10-14 17:35:22.464584','9','SupplyOnWheels-9',3,'',11,1),(55,'2015-10-14 17:35:22.509010','8','SupplyOnWheels-8',3,'',11,1),(56,'2015-10-14 17:35:22.553264','7','SupplyOnWheels-7',3,'',11,1),(57,'2015-10-14 17:35:22.597706','6','SupplyOnWheels-6',3,'',11,1),(58,'2015-10-14 17:42:47.390924','11','SupplyOnWheels-11',3,'',11,1),(59,'2015-10-14 17:48:29.238386','3','Mive-3',3,'',11,1),(60,'2015-10-14 17:50:42.686270','2','2',1,'',14,1),(61,'2015-10-14 17:50:48.516374','2','Cafe Coffe Day',1,'',16,1),(62,'2015-10-14 17:51:43.039073','2','Cafe Coffe Day',2,'Changed profilePhoto.',16,1),(63,'2015-10-14 18:19:03.448809','13','SupplyOnWheels-13',2,'Changed products.',11,1),(64,'2015-10-14 18:45:10.592986','7','a-Grade-A-Delhi',2,'Changed grade and seller.',17,1),(65,'2015-10-14 19:08:18.108230','316','grof1Kiwi Fruit --newzealand',3,'',17,1),(66,'2015-10-14 19:08:18.178749','315','grof1Guava --nagpur ',3,'',17,1),(67,'2015-10-14 19:08:18.267765','314','grof1Black Grapes --india',3,'',17,1),(68,'2015-10-14 19:08:18.412131','313','grof1Litchi --china ',3,'',17,1),(69,'2015-10-14 19:08:18.456346','312','grof1CauliFlower --Agra ',3,'',17,1),(70,'2015-10-14 19:08:18.500836','311','grof1Lemons --agra ',3,'',17,1),(71,'2015-10-14 19:08:18.545093','310','grof1Oranges--agra ',3,'',17,1),(72,'2015-10-14 19:08:49.910203','39','grof1Cherry --agra',3,'',17,1),(73,'2015-10-15 07:35:16.979991','3','3',1,'',14,1),(74,'2015-10-15 07:35:24.157560','3','New hotel',1,'',16,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(24,'authtoken','token'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(20,'veggex','accartitem'),(7,'veggex','address'),(13,'veggex','career'),(14,'veggex','cart'),(19,'veggex','cartitem'),(9,'veggex','category'),(11,'veggex','categoryvendor'),(12,'veggex','contact'),(18,'veggex','customcategoryproducts'),(8,'veggex','mandi'),(21,'veggex','order'),(22,'veggex','orderitem'),(15,'veggex','owner'),(17,'veggex','product'),(10,'veggex','seller'),(23,'veggex','subscribe'),(16,'veggex','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'veggex','0001_initial','2015-10-11 18:31:19.725483'),(2,'veggex','0002_auto_20150918_2205','2015-10-11 18:31:19.844213'),(3,'veggex','0003_product_grade','2015-10-11 18:31:20.773990'),(4,'veggex','0004_auto_20150919_2050','2015-10-11 18:31:23.175216'),(5,'veggex','0005_auto_20150919_2148','2015-10-11 18:31:24.510805'),(6,'veggex','0006_auto_20150920_0310','2015-10-11 18:31:29.601537'),(7,'veggex','0007_auto_20150920_0413','2015-10-11 18:31:30.525473'),(8,'veggex','0008_auto_20150920_0414','2015-10-11 18:31:31.393265'),(9,'veggex','0009_auto_20151011_2303','2015-10-11 18:31:38.352763'),(10,'veggex','0010_user_categoryvendor','2015-10-11 18:31:40.678423'),(11,'veggex','0011_auto_20151011_2316','2015-10-11 18:31:45.773558'),(12,'veggex','0012_auto_20151011_2317','2015-10-11 18:31:48.532218'),(13,'veggex','0013_auto_20151011_2327','2015-10-11 18:31:48.777147'),(14,'veggex','0014_auto_20151011_2329','2015-10-11 18:31:48.933282'),(15,'veggex','0015_auto_20151011_2339','2015-10-11 18:31:50.826623'),(16,'contenttypes','0001_initial','2015-10-11 18:32:26.147469'),(17,'auth','0001_initial','2015-10-11 18:32:35.082490'),(18,'admin','0001_initial','2015-10-11 18:32:37.186373'),(19,'contenttypes','0002_remove_content_type_name','2015-10-11 18:32:38.546044'),(20,'auth','0002_alter_permission_name_max_length','2015-10-11 18:32:39.325166'),(21,'auth','0003_alter_user_email_max_length','2015-10-11 18:32:40.369962'),(22,'auth','0004_alter_user_username_opts','2015-10-11 18:32:40.447514'),(23,'auth','0005_alter_user_last_login_null','2015-10-11 18:32:41.504949'),(24,'auth','0006_require_contenttypes_0002','2015-10-11 18:32:41.571765'),(25,'authtoken','0001_initial','2015-10-11 18:32:42.883972'),(26,'sessions','0001_initial','2015-10-11 18:32:43.763473'),(27,'veggex','0016_auto_20151012_0002','2015-10-11 18:33:38.998172'),(28,'veggex','0017_auto_20151012_0059','2015-10-11 19:30:06.353374'),(29,'veggex','0018_auto_20151012_0447','2015-10-11 23:17:41.245340'),(30,'veggex','0019_remove_categoryvendor_category','2015-10-13 15:12:51.872508'),(31,'veggex','0020_categoryvendor_products','2015-10-13 15:18:44.587549'),(32,'veggex','0021_seller_categories','2015-10-13 19:28:47.908119'),(33,'veggex','0022_seller_rating','2015-10-13 19:30:32.103125'),(34,'veggex','0023_auto_20151014_2257','2015-10-14 17:27:26.755371');
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
INSERT INTO `django_session` VALUES ('4prkqewj4pn0af812oib6egllx82r5zf','NzhiMjNjMzZhMmY1YmU0NTgzYmNmZDRmODA0NjM0ODI2YzBmMGVlMjp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1pdmV1c2VyIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1vYmlsZSI6IjgzNzc5NTA3MTEiLCJfYXV0aF91c2VyX2hhc2giOiIyYzAyNzdhMzZkNjgzNTJjOTE3NTYyMDQ2ZDdhOGVjMjAxNTJjN2VhIn0=','2015-10-29 08:51:50.940668'),('5qq8lsrs4rbnbp5iqqvqfbm5ocpirw7h','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-26 20:45:17.110205'),('d4h5aicackqqvh46dnv3hdodkeprlbl6','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-27 14:04:26.289115'),('d5st1vpil26mz4ql5dgo3yfzzvce3uzi','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-27 12:03:50.363955'),('el5kmuww57tqxcx7tcsvb9stv5l5m0tl','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-26 16:07:08.215120'),('eunllwsr1kur5yet7j93beu7rals9032','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-29 11:18:39.367413'),('gasetl8xijr0h2tvo57ajicclcyzmm6r','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-27 07:39:29.943996'),('gdlzgoeijw9thoen4ix9gapekn8pfj1h','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-26 20:50:44.662312'),('i5mhmzg5vbam34uxta6dibyctoblrpv1','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-29 10:17:47.598197'),('l8lg23htyculo7hp5dmp33j60h8rk9ei','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-29 00:38:07.037763'),('nkj8hmcfh3b9bv5n9der2dol2u1zd9ht','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-27 01:29:35.544752'),('wb4pzvydv25ejispr3vc4i56te9eqdkb','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-10-27 09:51:46.044693'),('xqbxzs41zq3fj2mxag7sn1lm3zge6fpi','Y2M1YmI5MzI3YzAxMjhhYzkzZWFkMDAzNDVmMDY2MmU0NjFhOGM2MTp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1vYmlsZSI6IjgzNzc5NTA3MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1pdmV1c2VyIjoxLCJfYXV0aF91c2VyX2hhc2giOiIyYzAyNzdhMzZkNjgzNTJjOTE3NTYyMDQ2ZDdhOGVjMjAxNTJjN2VhIn0=','2015-10-26 21:07:22.314433'),('zgb0qnmzx7ok1t6lh6porogmnsksf9n4','ZGVhNGJhODVjYmFjZDk5YTY1NWFhNWIxMWQyYjIzODRjMjkwNWNkNDp7Im1pdmV1c2VyIjoxLCJtb2JpbGUiOiI4Mzc3OTUwNzExIiwibG9nZ2VkaW4iOnRydWV9','2015-10-28 23:49:00.770274');
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
INSERT INTO `veggex_address` VALUES (1,'delhi','delhi','delhi',110016);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_cart`
--

LOCK TABLES `veggex_cart` WRITE;
/*!40000 ALTER TABLE `veggex_cart` DISABLE KEYS */;
INSERT INTO `veggex_cart` VALUES (1,'2015-10-15 14:18:34.554514','2015-10-15 14:18:34.554526',-2147483568),(2,'2015-10-14 23:46:01.829377','2015-10-14 23:46:01.829388',1092),(3,'2015-10-15 08:01:27.911500','2015-10-15 08:01:27.911507',1223);
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_cartitem`
--

LOCK TABLES `veggex_cartitem` WRITE;
/*!40000 ALTER TABLE `veggex_cartitem` DISABLE KEYS */;
INSERT INTO `veggex_cartitem` VALUES (42,1,2,7,'2015-10-14 18:46:25.324197','2015-10-14 18:46:25.324238'),(47,1,2,13,'2015-10-14 19:57:29.951590','2015-10-14 19:57:29.951626'),(56,1,2,2,'2015-10-14 23:46:01.954452','2015-10-14 23:46:01.954490'),(62,1,3,35,'2015-10-15 07:43:00.844531','2015-10-15 07:43:00.844573'),(63,1,3,37,'2015-10-15 07:43:02.162803','2015-10-15 07:43:02.162844'),(64,1,3,11,'2015-10-15 08:01:27.986050','2015-10-15 08:01:27.986089'),(71,1,1,14,'2015-10-15 14:18:34.676812','2015-10-15 14:18:34.676851');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_category`
--

LOCK TABLES `veggex_category` WRITE;
/*!40000 ALTER TABLE `veggex_category` DISABLE KEYS */;
INSERT INTO `veggex_category` VALUES (1,'Chicken','','these kind of vegetables are being used for fuck'),(2,'Mutton','','Django administration Welcome, admin. View site / Change password / Log out Home › Veggex › Products › rakesh Change product History  Name: Description: Category:  Change  Add PopularityIndex: Unit: PriceType: PricePerUnit: Coverphoto: Currently: ./Rees52-Raspberry-Pi-2-Model-SDL605139026-1-07246_r4'),(3,'Mutton','','Django administration Welcome, admin. View site / Change password / Log out Home › Veggex › Products › rakesh Change product History  Name: Description: Category:  Change  Add PopularityIndex: Unit: PriceType: PricePerUnit: Coverphoto: Currently: ./Rees52-Raspberry-Pi-2-Model-SDL605139026-1-07246_r4'),(4,'Fruits','','Django administration Welcome, admin. View site / Change password / Log out Home › Veggex › Products › rakesh Change product History  Name: Description: Category:  Change  Add PopularityIndex: Unit: PriceType: PricePerUnit: Coverphoto: Currently: ./Rees52-Raspberry-Pi-2-Model-SDL605139026-1-07246_r4'),(5,'Spices','','these kind of vegetables are being used for fuck');
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
  `seller_id` int(11) NOT NULL,
  PRIMARY KEY (`categoryvendor_id`),
  KEY `veggex_categoryvendor_0a7c7ff2` (`seller_id`),
  CONSTRAINT `veggex_categoryven_seller_id_3a5abb11_fk_veggex_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `veggex_seller` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_categoryvendor`
--

LOCK TABLES `veggex_categoryvendor` WRITE;
/*!40000 ALTER TABLE `veggex_categoryvendor` DISABLE KEYS */;
INSERT INTO `veggex_categoryvendor` VALUES (24,1),(26,1),(27,1),(25,2),(28,3),(30,4);
/*!40000 ALTER TABLE `veggex_categoryvendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_categoryvendor_products`
--

DROP TABLE IF EXISTS `veggex_categoryvendor_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_categoryvendor_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryvendor_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categoryvendor_id` (`categoryvendor_id`,`product_id`),
  KEY `veggex_category_product_id_20a1d214_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `D0446eda7855aac6beafaad1c01d173f` FOREIGN KEY (`categoryvendor_id`) REFERENCES `veggex_categoryvendor` (`categoryvendor_id`),
  CONSTRAINT `veggex_category_product_id_20a1d214_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_categoryvendor_products`
--

LOCK TABLES `veggex_categoryvendor_products` WRITE;
/*!40000 ALTER TABLE `veggex_categoryvendor_products` DISABLE KEYS */;
INSERT INTO `veggex_categoryvendor_products` VALUES (81,24,11),(83,25,1),(82,25,2),(84,26,10),(85,26,11),(86,26,14),(87,27,9),(88,27,10),(89,27,11),(90,27,12),(93,28,35),(91,28,37),(92,28,38),(96,30,8);
/*!40000 ALTER TABLE `veggex_categoryvendor_products` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_mandi`
--

LOCK TABLES `veggex_mandi` WRITE;
/*!40000 ALTER TABLE `veggex_mandi` DISABLE KEYS */;
INSERT INTO `veggex_mandi` VALUES (1,'azadpur','dadasdd','',1);
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
  `category_id` int(11),
  `seller_id` int(11),
  PRIMARY KEY (`order_id`),
  KEY `veggex_order_e8701ad4` (`user_id`),
  KEY `veggex_order_b583a629` (`category_id`),
  KEY `veggex_order_0a7c7ff2` (`seller_id`),
  CONSTRAINT `veggex_order_category_id_48208ad5_fk_veggex_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `veggex_category` (`category_id`),
  CONSTRAINT `veggex_order_seller_id_6e0c256_fk_veggex_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `veggex_seller` (`seller_id`),
  CONSTRAINT `veggex_order_user_id_45dbd524_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_order`
--

LOCK TABLES `veggex_order` WRITE;
/*!40000 ALTER TABLE `veggex_order` DISABLE KEYS */;
INSERT INTO `veggex_order` VALUES (1,'2015-10-13 11:31:26.761843','2015-10-13 11:31:26.761872','COD',360,'PLACED','2015-10-15',1,'fsfsfsf',NULL,NULL),(2,'2015-10-13 11:31:49.340632','2015-10-13 11:31:49.340662','COD',1090,'PLACED','2015-10-23',1,'lklkl',NULL,NULL),(3,'2015-10-13 11:38:13.636479','2015-10-13 11:38:13.636512','COD',22,'PLACED','2015-10-29',1,'check',NULL,NULL),(4,'2015-10-13 11:42:10.086005','2015-10-13 11:42:10.086033','COD',260,'PLACED','2015-10-22',1,'asdsff',2,1),(5,'2015-10-13 12:05:41.178744','2015-10-13 12:05:41.178774','COD',10,'PLACED','2015-10-17',1,'Ggg',4,2),(6,'2015-10-14 15:52:00.809819','2015-10-14 15:52:00.809846','COD',845,'PLACED','2015-10-16',1,'ijk',NULL,1),(7,'2015-10-14 15:52:28.719826','2015-10-14 15:52:28.719854','COD',845,'PLACED','2015-10-16',1,'ijk',NULL,1),(8,'2015-10-14 15:52:42.766201','2015-10-14 15:52:42.766229','COD',845,'PLACED','2015-10-16',1,'ijk',NULL,1),(9,'2015-10-14 23:01:34.975856','2015-10-14 23:01:34.975886','COD',12,'PLACED','2015-10-22',1,'gjhgj',NULL,2),(10,'2015-10-15 07:43:14.945515','2015-10-15 07:43:14.945545','COD',300,'PLACED','2015-10-28',3,'fs',NULL,1),(11,'2015-10-15 10:33:16.494032','2015-10-15 10:33:16.494062','COD',4383,'PLACED','2015-10-16',1,'eesrewrew',NULL,3),(12,'2015-10-15 10:34:55.870706','2015-10-15 10:34:55.870736','COD',22,'PLACED','2015-10-23',1,'fsfsffs',NULL,2),(13,'2015-10-15 10:35:57.629974','2015-10-15 10:35:57.630002','COD',220,'PLACED','2015-10-16',1,'afdffsf',NULL,2),(14,'2015-10-15 10:37:16.812365','2015-10-15 10:37:16.812394','COD',11200,'PLACED','2015-10-17',1,'dfsfsd',NULL,2),(15,'2015-10-15 11:20:50.652728','2015-10-15 11:20:50.652758','COD',1590,'PLACED','2015-10-23',1,'hkh',NULL,1),(16,'2015-10-15 11:21:22.268525','2015-10-15 11:21:22.268554','COD',3153,'PLACED','2015-10-22',1,'jhkhkjh',NULL,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_orderitem`
--

LOCK TABLES `veggex_orderitem` WRITE;
/*!40000 ALTER TABLE `veggex_orderitem` DISABLE KEYS */;
INSERT INTO `veggex_orderitem` VALUES (1,'kg',6,'as per mandi rates',60,1,12),(2,'kg',4,'as per mandi rates',45,2,10),(3,'kg',2,'as per mandi rates',80,2,13),(4,'kg',5,'as per mandi rates',30,2,15),(5,'kg',3,'as per mandi rates',200,2,16),(6,'kg',1,'as per mandi rates',10,3,1),(7,'kg',1,'custom rates',12,3,2),(8,'kg',1,'custom rates',100,4,9),(9,'kg',2,'as per mandi rates',80,4,13),(10,'kg',1,'as per mandi rates',10,5,1),(11,'kg',5,'as per mandi rates',45,6,10),(12,'kg',7,'as per mandi rates',60,6,12),(13,'kg',1,'as per mandi rates',200,6,16),(14,'kg',5,'as per mandi rates',45,7,10),(15,'kg',7,'as per mandi rates',60,7,12),(16,'kg',1,'as per mandi rates',200,7,16),(17,'kg',5,'as per mandi rates',45,8,10),(18,'kg',7,'as per mandi rates',60,8,12),(19,'kg',1,'as per mandi rates',200,8,16),(20,'kg',1,'custom rates',12,9,2),(21,'kg',3,'as per mandi rates',100,10,11),(22,'kg',11,'custom rates',123,11,35),(23,'kg',3,'custom rates',1000,11,37),(24,'kg',3,'custom rates',10,11,38),(25,'kg',1,'as per mandi rates',10,12,1),(26,'kg',1,'custom rates',12,12,2),(27,'kg',10,'as per mandi rates',10,13,1),(28,'kg',10,'custom rates',12,13,2),(29,'kg',1000,'as per mandi rates',10,14,1),(30,'kg',100,'custom rates',12,14,2),(31,'kg',2,'custom rates',100,15,9),(32,'kg',1,'as per mandi rates',100,15,11),(33,'kg',1,'as per mandi rates',60,15,12),(34,'kg',1,'as per mandi rates',30,15,15),(35,'kg',6,'as per mandi rates',200,15,16),(36,'kg',3,'custom rates',10,16,78),(37,'kg',3,'custom rates',1000,16,77),(38,'kg',1,'custom rates',123,16,75);
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
) ENGINE=InnoDB AUTO_INCREMENT=717 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_product`
--

LOCK TABLES `veggex_product` WRITE;
/*!40000 ALTER TABLE `veggex_product` DISABLE KEYS */;
INSERT INTO `veggex_product` VALUES (1,'rakesh','fff',4,'kg','as per mandi rates',10,'./Whatsapp.png','chomu',1000,'yoo',1,1,4,2,'Grade-A'),(2,'kellaff','',NULL,'kg','custom rates',12,'./website17.png','delhi',12,'ff',1,0,4,2,'Grade-B'),(5,'1Apple','cfsc',NULL,'kg','custom rates',123,'./e.jpg','delhi',12,'dsd',1,0,1,4,''),(7,'1a','ddd',NULL,'kg','custom rates',1000,'./image-2-compressed.jpg','Delhi',1212,'ff',1,0,2,4,''),(8,'1Green Apple','gdfg',NULL,'kg','custom rates',10,'./image-4-compressed.jpg','ggg',1000,'dddd',1,0,1,4,''),(9,'1Cherry ','red cherry ',4,'kg','custom rates',100,'./cherry_PNG611.jpg','agra',12,'superb quality , ideal for shakes ',1,0,2,1,''),(10,'1Oranges','Juicy sweet orange ',9,'kg','as per mandi rates',45,'./ORANGES.jpg','agra ',100,'amazing quality ',1,0,2,1,''),(11,'1Lemons ','juicy lemon ',5,'kg','as per mandi rates',100,'./lemons.jpg','agra ',452,'superp quality and perishable ',1,1,1,1,''),(12,'1CauliFlower ','White Cauliflower ',5,'kg','as per mandi rates',60,'./cauliflower.jpg','Agra ',20,'superb quality ',1,0,1,1,''),(13,'1Litchi ','Juicy lichi ',6,'kg','as per mandi rates',80,'./LICHI.jpg','china ',4,'juicy litchi ',1,0,2,1,''),(14,'1Black Grapes ','Sweet grapes ',9,'kg','as per mandi rates',80,'./black_grapes.jpg','india',120,'amazing sweet grapes ',1,0,2,1,''),(15,'1Guava ','sweet guava ',4,'kg','as per mandi rates',30,'./guava1.jpg','nagpur ',50,'sweet guavas with less seeds ',1,0,2,1,''),(16,'1Kiwi Fruit ','Newzealand imported Kiwi fruit ',7,'kg','as per mandi rates',200,'./FreshKiwiFruitPhoto5.jpg','newzealand',10,'superb quality ',1,0,2,1,''),(35,'grof1Apple','cfsc',NULL,'kg','custom rates',123,'./e.jpg','delhi',12,'dsd',1,0,1,3,''),(37,'grof1a','ddd',NULL,'kg','custom rates',1000,'./image-2-compressed.jpg','Delhi',1212,'ff',1,0,2,3,''),(38,'grof1Green Apple','gdfg',NULL,'kg','custom rates',10,'./image-4-compressed.jpg','ggg',1000,'dddd',1,0,1,3,''),(55,'zopnowApple','cfsc',NULL,'kg','custom rates',123,'./e.jpg','delhi',12,'dsd',1,0,1,5,''),(57,'zopnowa','ddd',NULL,'kg','custom rates',1000,'./image-2-compressed.jpg','Delhi',1212,'ff',1,0,2,5,''),(58,'zopnowGreen Apple','gdfg',NULL,'kg','custom rates',10,'./image-4-compressed.jpg','ggg',1000,'dddd',1,0,1,5,''),(59,'zopnowCherry ','red cherry ',4,'kg','custom rates',100,'./cherry_PNG611.jpg','agra',12,'superb quality , ideal for shakes ',1,0,2,5,''),(75,'peppertapApple','cfsc',NULL,'kg','custom rates',123,'./e.jpg','delhi',12,'dsd',1,0,1,6,''),(77,'peppertapa','ddd',NULL,'kg','custom rates',1000,'./image-2-compressed.jpg','Delhi',1212,'ff',1,0,2,6,''),(78,'peppertapGreen Apple','gdfg',NULL,'kg','custom rates',10,'./image-4-compressed.jpg','ggg',1000,'dddd',1,0,1,6,''),(79,'peppertapCherry ','red cherry ',4,'kg','custom rates',100,'./cherry_PNG611.jpg','agra',12,'superb quality , ideal for shakes ',1,0,2,6,''),(510,'zopnowOranges','Juicy sweet orange ',9,'kg','as per mandi rates',45,'./ORANGES.jpg','agra ',100,'amazing quality ',1,0,2,5,''),(511,'zopnowLemons ','juicy lemon ',5,'kg','as per mandi rates',100,'./lemons.jpg','agra ',452,'superp quality and perishable ',1,1,1,5,''),(512,'zopnowCauliFlower ','White Cauliflower ',5,'kg','as per mandi rates',60,'./cauliflower.jpg','Agra ',20,'superb quality ',1,0,1,5,''),(513,'zopnowLitchi ','Juicy lichi ',6,'kg','as per mandi rates',80,'./LICHI.jpg','china ',4,'juicy litchi ',1,0,2,5,''),(514,'zopnowBlack Grapes ','Sweet grapes ',9,'kg','as per mandi rates',80,'./black_grapes.jpg','india',120,'amazing sweet grapes ',1,0,2,5,''),(515,'zopnowGuava ','sweet guava ',4,'kg','as per mandi rates',30,'./guava1.jpg','nagpur ',50,'sweet guavas with less seeds ',1,0,2,5,''),(516,'zopnowKiwi Fruit ','Newzealand imported Kiwi fruit ',7,'kg','as per mandi rates',200,'./FreshKiwiFruitPhoto5.jpg','newzealand',10,'superb quality ',1,0,2,5,''),(710,'peppertapOranges','Juicy sweet orange ',9,'kg','as per mandi rates',45,'./ORANGES.jpg','agra ',100,'amazing quality ',1,0,2,6,''),(711,'peppertapLemons ','juicy lemon ',5,'kg','as per mandi rates',100,'./lemons.jpg','agra ',452,'superp quality and perishable ',1,1,1,6,''),(712,'peppertapCauliFlower ','White Cauliflower ',5,'kg','as per mandi rates',60,'./cauliflower.jpg','Agra ',20,'superb quality ',1,0,1,6,''),(713,'peppertapLitchi ','Juicy lichi ',6,'kg','as per mandi rates',80,'./LICHI.jpg','china ',4,'juicy litchi ',1,0,2,6,''),(714,'peppertapBlack Grapes ','Sweet grapes ',9,'kg','as per mandi rates',80,'./black_grapes.jpg','india',120,'amazing sweet grapes ',1,0,2,6,''),(715,'peppertapGuava ','sweet guava ',4,'kg','as per mandi rates',30,'./guava1.jpg','nagpur ',50,'sweet guavas with less seeds ',1,0,2,6,''),(716,'peppertapKiwi Fruit ','Newzealand imported Kiwi fruit ',7,'kg','as per mandi rates',200,'./FreshKiwiFruitPhoto5.jpg','newzealand',10,'superb quality ',1,0,2,6,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_product_related_products`
--

LOCK TABLES `veggex_product_related_products` WRITE;
/*!40000 ALTER TABLE `veggex_product_related_products` DISABLE KEYS */;
INSERT INTO `veggex_product_related_products` VALUES (2,1,2),(1,2,1);
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
  `categories` varchar(240),
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`seller_id`),
  KEY `veggex_seller_address_id_191b40c0_fk_veggex_address_address_id` (`address_id`),
  KEY `veggex_seller_mandi_id_6d87b2d_fk_veggex_mandi_mandi_id` (`mandi_id`),
  CONSTRAINT `veggex_seller_address_id_191b40c0_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`),
  CONSTRAINT `veggex_seller_mandi_id_6d87b2d_fk_veggex_mandi_mandi_id` FOREIGN KEY (`mandi_id`) REFERENCES `veggex_mandi` (`mandi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_seller`
--

LOCK TABLES `veggex_seller` WRITE;
/*!40000 ALTER TABLE `veggex_seller` DISABLE KEYS */;
INSERT INTO `veggex_seller` VALUES (1,'Mive','ra@gmail.com',8377950711,'./web.png',1,1,NULL,0),(2,'SupplyOnWheels','rak.dev007@gmail.com',12,'',1,1,NULL,0),(3,'Grofers','grof@gmail.com',1234,'',1,1,NULL,0),(4,'Bigbasket','rak.dev007@gmail.com',12345,'./website17_sI0Nfj3.png',1,1,'fyt,ret,tyu',0),(5,'zopnow','rak.dev007@gmail.com',77777778,'./Vegetable_2.png',1,1,'fyt,ret,tyu',0),(6,'Peppertap','pcy.iitd@gmail.com',9289010333,'./Vegetable_1.png',1,1,'chicken,paranthe',0);
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
  CONSTRAINT `veggex_user_cart_id_63b84d4f_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`),
  CONSTRAINT `veggex_user_owner_id_21900597_fk_veggex_owner_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `veggex_owner` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_user`
--

LOCK TABLES `veggex_user` WRITE;
/*!40000 ALTER TABLE `veggex_user` DISABLE KEYS */;
INSERT INTO `veggex_user` VALUES (1,'Mezbaan restaurents','Rakesh Yadav','hotels','rak.dev007@gmail.com',8377950711,'pbkdf2_sha256$20000$xcPbF0CMVCyw$eZECZo2qDkuIVr8+UxTiIosfDPdHx6mMQNhUbp3AAjM=','','./rajat_Cropped.jpg',1,1,NULL),(2,'Cafe Coffe Day','Shyam lal','hotels','info@mive.in',9928524925,'pbkdf2_sha256$20000$xcPbF0CMVCyw$eZECZo2qDkuIVr8+UxTiIosfDPdHx6mMQNhUbp3AAjM=','','./unnamed.png',1,2,NULL),(3,'New hotel','twwe','hotels','kjfjs@p.com',9352132140,'pbkdf2_sha256$20000$xcPbF0CMVCyw$eZECZo2qDkuIVr8+UxTiIosfDPdHx6mMQNhUbp3AAjM=','','./pc_205x205.jpg',1,3,NULL);
/*!40000 ALTER TABLE `veggex_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veggex_user_categories`
--

DROP TABLE IF EXISTS `veggex_user_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veggex_user_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `categoryvendor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`categoryvendor_id`),
  KEY `D2a70c5e50a30f248d7775bd3cf297d7` (`categoryvendor_id`),
  CONSTRAINT `D2a70c5e50a30f248d7775bd3cf297d7` FOREIGN KEY (`categoryvendor_id`) REFERENCES `veggex_categoryvendor` (`categoryvendor_id`),
  CONSTRAINT `veggex_user_categories_user_id_30839502_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_user_categories`
--

LOCK TABLES `veggex_user_categories` WRITE;
/*!40000 ALTER TABLE `veggex_user_categories` DISABLE KEYS */;
INSERT INTO `veggex_user_categories` VALUES (29,1,26),(31,1,28),(33,1,30),(27,2,24),(28,2,25),(30,3,27);
/*!40000 ALTER TABLE `veggex_user_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-15 20:03:54
