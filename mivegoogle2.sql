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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add address',8,'add_address'),(23,'Can change address',8,'change_address'),(24,'Can delete address',8,'delete_address'),(25,'Can add cart',9,'add_cart'),(26,'Can change cart',9,'change_cart'),(27,'Can delete cart',9,'delete_cart'),(28,'Can add user',10,'add_user'),(29,'Can change user',10,'change_user'),(30,'Can delete user',10,'delete_user'),(31,'Can add mandi',11,'add_mandi'),(32,'Can change mandi',11,'change_mandi'),(33,'Can delete mandi',11,'delete_mandi'),(34,'Can add seller',12,'add_seller'),(35,'Can change seller',12,'change_seller'),(36,'Can delete seller',12,'delete_seller'),(37,'Can add product',13,'add_product'),(38,'Can change product',13,'change_product'),(39,'Can delete product',13,'delete_product'),(40,'Can add custom category products',14,'add_customcategoryproducts'),(41,'Can change custom category products',14,'change_customcategoryproducts'),(42,'Can delete custom category products',14,'delete_customcategoryproducts'),(43,'Can add cartitem',15,'add_cartitem'),(44,'Can change cartitem',15,'change_cartitem'),(45,'Can delete cartitem',15,'delete_cartitem'),(46,'Can add accartitem',16,'add_accartitem'),(47,'Can change accartitem',16,'change_accartitem'),(48,'Can delete accartitem',16,'delete_accartitem'),(49,'Can add order',17,'add_order'),(50,'Can change order',17,'change_order'),(51,'Can delete order',17,'delete_order'),(52,'Can add orderitem',18,'add_orderitem'),(53,'Can change orderitem',18,'change_orderitem'),(54,'Can delete orderitem',18,'delete_orderitem'),(55,'Can add subscribe',19,'add_subscribe'),(56,'Can change subscribe',19,'change_subscribe'),(57,'Can delete subscribe',19,'delete_subscribe'),(58,'Can add token',20,'add_token'),(59,'Can change token',20,'change_token'),(60,'Can delete token',20,'delete_token'),(61,'Can add contact',21,'add_contact'),(62,'Can change contact',21,'change_contact'),(63,'Can delete contact',21,'delete_contact'),(64,'Can add career',22,'add_career'),(65,'Can change career',22,'change_career'),(66,'Can delete career',22,'delete_career');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$FNfgAGCxxAEZ$oZd3/XroNmqaM4uowKy7/opErnFVVqG8tQfoBusSAhg=','2015-09-04 04:30:28.789155',1,'admin','','','rak.dev007@gmail.com',1,1,'2015-08-24 15:07:16.739041');
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-08-24 15:22:53.280661','1','Cart object',1,'',9,1),(2,'2015-08-24 15:22:59.999072','1','Mezbaan',1,'',10,1),(3,'2015-08-24 15:23:30.603798','1','vegetables',1,'',7,1),(4,'2015-08-24 15:23:50.229210','2','fruits',1,'',7,1),(5,'2015-08-24 15:25:24.304156','1','tomatoes',1,'',13,1),(6,'2015-08-24 15:26:09.632649','2','apple',1,'',13,1),(7,'2015-08-24 15:35:24.630957','1','Cart object',1,'',9,1),(8,'2015-08-24 15:36:38.924678','1','Cart object',2,'No fields changed.',9,1),(9,'2015-08-24 16:01:12.111825','1','Cartitem object',1,'',15,1),(10,'2015-08-24 16:06:31.524119','2','Cartitem object',1,'',15,1),(11,'2015-08-24 16:19:52.268484','1','Cart object',2,'Changed cartTotal.',9,1),(12,'2015-08-24 18:17:58.906191','1','Cartitem object',3,'',15,1),(13,'2015-08-24 18:18:48.896548','3','Cartitem object',1,'',15,1),(14,'2015-08-24 18:52:05.227950','2','Cartitem object',3,'',15,1),(15,'2015-08-24 18:52:46.294694','2','Cart object',1,'',9,1),(16,'2015-08-24 18:53:01.164640','4','Cartitem object',1,'',15,1),(17,'2015-08-24 18:53:50.270358','4','Cartitem object',3,'',15,1),(18,'2015-08-24 18:54:32.866578','3','Cartitem object',2,'Changed cart.',15,1),(19,'2015-08-24 19:48:51.268273','3','Cartitem object',2,'Changed cart.',15,1),(20,'2015-08-24 21:27:23.176156','5','Cartitem object',1,'',15,1),(21,'2015-08-24 21:27:39.620501','6','Cartitem object',1,'',15,1),(22,'2015-08-24 23:48:27.347789','20','Cartitem object',3,'',15,1),(23,'2015-08-24 23:48:27.449817','19','Cartitem object',3,'',15,1),(24,'2015-08-24 23:48:27.505229','18','Cartitem object',3,'',15,1),(25,'2015-08-24 23:48:27.560763','17','Cartitem object',3,'',15,1),(26,'2015-08-24 23:48:27.693755','16','Cartitem object',3,'',15,1),(27,'2015-08-24 23:48:27.815917','15','Cartitem object',3,'',15,1),(28,'2015-08-24 23:48:27.871263','14','Cartitem object',3,'',15,1),(29,'2015-08-24 23:48:27.926741','13','Cartitem object',3,'',15,1),(30,'2015-08-24 23:48:27.982179','11','Cartitem object',3,'',15,1),(31,'2015-08-24 23:48:28.059998','10','Cartitem object',3,'',15,1),(32,'2015-08-24 23:48:28.115402','5','Cartitem object',3,'',15,1),(33,'2015-08-25 00:03:11.429778','2','Cart object',3,'',9,1),(34,'2015-08-25 00:03:11.566039','1','Cart object',3,'',9,1),(35,'2015-08-25 00:04:33.340855','3','Cart object',1,'',9,1),(36,'2015-08-25 00:04:35.543584','2','Mezbaan',1,'',10,1),(37,'2015-08-25 01:29:22.187884','33','Cartitem object',3,'',15,1),(38,'2015-08-25 01:29:22.304972','32','Cartitem object',3,'',15,1),(39,'2015-08-25 01:29:22.349470','31','Cartitem object',3,'',15,1),(40,'2015-08-25 01:29:22.393895','30','Cartitem object',3,'',15,1),(41,'2015-08-25 01:29:22.438435','29','Cartitem object',3,'',15,1),(42,'2015-08-25 01:29:22.504872','28','Cartitem object',3,'',15,1),(43,'2015-08-25 01:29:22.638123','27','Cartitem object',3,'',15,1),(44,'2015-08-25 01:29:37.642459','3','Cart object',2,'Changed cartTotal.',9,1),(45,'2015-08-25 01:31:34.531625','3','Cart object',2,'Changed cartTotal.',9,1),(46,'2015-08-25 01:31:45.403573','35','Cartitem object',3,'',15,1),(47,'2015-08-25 01:31:45.465865','34','Cartitem object',3,'',15,1),(48,'2015-08-25 01:32:45.241283','3','Cart object',2,'Changed cartTotal.',9,1),(49,'2015-08-25 01:32:55.084219','37','Cartitem object',3,'',15,1),(50,'2015-08-25 01:32:55.158071','36','Cartitem object',3,'',15,1),(51,'2015-08-25 01:37:19.811730','38','Cartitem object',3,'',15,1),(52,'2015-08-25 01:43:28.886362','40','Cartitem object',3,'',15,1),(53,'2015-08-25 01:43:28.934698','39','Cartitem object',3,'',15,1),(54,'2015-08-25 01:43:48.256308','3','Cart object',3,'',9,1),(55,'2015-08-25 01:44:44.485705','1','1',1,'',8,1),(56,'2015-08-25 01:44:51.114451','4','Cart object',1,'',9,1),(57,'2015-08-25 01:44:53.597233','3','Mezbaan',1,'',10,1),(58,'2015-08-25 01:58:51.391172','4','Cart object',2,'Changed cartTotal.',9,1),(59,'2015-08-25 03:51:51.092393','2','apple',2,'Changed coverphoto.',13,1),(60,'2015-08-25 06:03:29.422191','2','apple',2,'Changed coverphoto.',13,1),(61,'2015-08-25 06:04:20.742251','3','Green Apple',1,'',13,1),(62,'2015-08-25 06:04:51.484948','4','carrot',1,'',13,1),(63,'2015-08-25 06:05:23.967966','5','A new foo',1,'',13,1),(64,'2015-08-25 06:11:21.681797','6','x',1,'',13,1),(65,'2015-08-25 06:11:47.767493','7','A new foo',1,'',13,1),(66,'2015-08-25 06:12:44.145911','8','rakesh',1,'',13,1),(67,'2015-08-25 06:13:06.885458','7','a',2,'Changed name.',13,1),(68,'2015-08-25 06:13:16.428672','5','q',2,'Changed name.',13,1),(69,'2015-08-25 07:58:37.616597','6','x',3,'',13,1),(70,'2015-08-26 04:34:55.870452','8','rakesh',2,'Changed coverphoto.',13,1),(71,'2015-08-26 04:35:06.649560','7','a',2,'Changed coverphoto.',13,1),(72,'2015-08-26 04:35:18.320316','5','q',2,'Changed coverphoto.',13,1),(73,'2015-08-26 04:35:29.670113','4','carrot',2,'Changed coverphoto.',13,1),(74,'2015-08-26 04:35:41.656300','3','Green Apple',2,'Changed coverphoto.',13,1),(75,'2015-08-26 04:35:51.507733','2','apple',2,'Changed coverphoto.',13,1),(76,'2015-08-26 04:36:02.446917','1','tomatoes',2,'Changed coverphoto.',13,1),(77,'2015-08-28 08:53:09.004922','9','A new foo',1,'',13,1),(78,'2015-09-02 21:01:53.111224','1','Hatim Singh',1,'',14,1),(79,'2015-09-02 21:11:05.755799','1','Hatim Singh',1,'',14,1),(80,'2015-09-02 21:11:22.301240','2','Hatim Singh',1,'',14,1),(81,'2015-09-03 17:49:57.454803','9','A new foo',2,'Changed description.',13,1),(82,'2015-09-03 17:55:00.650226','1','azadpur',1,'',11,1),(83,'2015-09-03 17:55:06.422312','1','Mive PVT LTD',1,'',12,1),(84,'2015-09-03 17:55:55.851734','9','A new foo',2,'Changed seller.',13,1),(85,'2015-09-03 18:00:20.160389','1','tomatoes',2,'Changed seller and isPerishable.',13,1),(86,'2015-09-03 18:01:13.424266','4','carrot',2,'Changed seller and isPerishable.',13,1),(87,'2015-09-04 04:32:22.714997','5','Cart object',1,'',9,1),(88,'2015-09-04 04:32:28.580369','4','Shubham',1,'',10,1);
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(20,'authtoken','token'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(16,'veggex','accartitem'),(8,'veggex','address'),(22,'veggex','career'),(9,'veggex','cart'),(15,'veggex','cartitem'),(7,'veggex','category'),(21,'veggex','contact'),(14,'veggex','customcategoryproducts'),(11,'veggex','mandi'),(17,'veggex','order'),(18,'veggex','orderitem'),(13,'veggex','product'),(12,'veggex','seller'),(19,'veggex','subscribe'),(10,'veggex','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-08-24 15:06:12.112164'),(2,'auth','0001_initial','2015-08-24 15:06:25.595833'),(3,'admin','0001_initial','2015-08-24 15:06:29.570589'),(4,'contenttypes','0002_remove_content_type_name','2015-08-24 15:06:31.661191'),(5,'auth','0002_alter_permission_name_max_length','2015-08-24 15:06:33.111614'),(6,'auth','0003_alter_user_email_max_length','2015-08-24 15:06:34.527613'),(7,'auth','0004_alter_user_username_opts','2015-08-24 15:06:34.604619'),(8,'auth','0005_alter_user_last_login_null','2015-08-24 15:06:35.594330'),(9,'auth','0006_require_contenttypes_0002','2015-08-24 15:06:35.660826'),(10,'authtoken','0001_initial','2015-08-24 15:06:38.091573'),(11,'sessions','0001_initial','2015-08-24 15:06:39.235845');
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
INSERT INTO `django_session` VALUES ('0zhm3k5rpnadpcmjts1raplahjxsko0o','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 21:36:55.073519'),('14i0h45hem7btzklm1c748iu4g9z3vtv','NTFiYTYyMDFhZDQyNjg2MmRlNTY1MDUxYWM4Y2I3MmRmYjZiMzM5Njp7Im1pdmV1c2VyIjozLCJtb2JpbGUiOiI4Mzc3OTUwNzExIiwibG9nZ2VkaW4iOnRydWV9','2015-09-09 18:36:07.736752'),('1tdvhc4l639ujieazr0wicm5sixbv5m7','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 14:29:05.819506'),('2jjcgjh0rggfhfr7listqeun7lqx5hyu','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-11 07:21:16.528511'),('2x0lq7v0db03kmb244cv9x4gvrvf3qiw','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-10 22:24:27.596527'),('37xowxucguvshdg0zehgw4w949ibk7r4','ZmRmMmQ3ZDNkMzkxYmM0NzI3YmQxYWZmZjk0ZWIzY2YzMTRmODU3MDp7Im1pdmV1c2VyIjoyLCJtb2JpbGUiOiI4Mzc3OTUwNzExIiwibG9nZ2VkaW4iOnRydWV9','2015-09-08 00:29:17.749143'),('3s7hqr50duqvzebvs2j1d3glp0izzpbw','OGE1MzhmNmQ3ZTY1YWVmMjVhM2M5NTI4ODQ2YTkzODNkMzE1ZTE0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlNTE1NmMxY2Q0MmNjOWQwNjQ4NTk4ZTcxNjYwNGVkMzdjOGIwZGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-09-18 04:30:29.083481'),('3znkjhh6ee5uk9l6hrzu2aaxmzsww311','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-17 21:01:52.308393'),('4f14cy3x97f7zh8mijh6if8pgdc9laxk','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-11 01:18:34.214298'),('6i8hidaohgbqpii4jwo52630mpchw3z6','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 21:30:36.782873'),('9kj7o6bnciearg6az3nyjwp5f4lmqdb8','ODJkMjRkZTk5MDc3YWMxYTg1NTVjNTMzYTkzZmEwOTllMzcwYTA1OTp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1pdmV1c2VyIjozLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1vYmlsZSI6IjgzNzc5NTA3MTEiLCJfYXV0aF91c2VyX2hhc2giOiIyZTUxNTZjMWNkNDJjYzlkMDY0ODU5OGU3MTY2MDRlZDM3YzhiMGRiIn0=','2015-09-10 23:24:19.396728'),('9uilcbveauofqrkcee5hiej7qfzt778u','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 04:56:03.189497'),('a8bqwfdbxz0b66p39trneo6xo6dix0kc','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-18 11:58:54.417667'),('aco442oo912dbkt0mkrhok9d4ot3eqae','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-17 18:17:52.465113'),('bd5skvyhwuh15b92h7egrx7szzwe0htt','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-08 04:02:26.933089'),('bsbj7tqrpj53vfg19dpbg4jj7e1mbnwc','ODJkMjRkZTk5MDc3YWMxYTg1NTVjNTMzYTkzZmEwOTllMzcwYTA1OTp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1pdmV1c2VyIjozLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1vYmlsZSI6IjgzNzc5NTA3MTEiLCJfYXV0aF91c2VyX2hhc2giOiIyZTUxNTZjMWNkNDJjYzlkMDY0ODU5OGU3MTY2MDRlZDM3YzhiMGRiIn0=','2015-09-17 19:41:37.921222'),('cyf3roo07robv79pdo3lf4wg8sypkfyf','OTU1MzVmMjlhYjI0ZmE2M2U3ZTI1ZjYyZWU4MTUyMGUxOTg2YjBlOTp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1vYmlsZSI6IjgzNzc5NTA3MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1pdmV1c2VyIjozLCJfYXV0aF91c2VyX2hhc2giOiIyZTUxNTZjMWNkNDJjYzlkMDY0ODU5OGU3MTY2MDRlZDM3YzhiMGRiIn0=','2015-09-08 20:59:46.267714'),('d957offi74mfve5e1nns2csj259oa4l1','ZDlhODhlODdiNTA2OTBiNzIyYTliNDU1YWFlYmQyYzBiNDllZDE4ZDp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MSwibG9nZ2VkaW4iOnRydWV9','2015-09-07 16:22:18.753322'),('dcp2gmz8xuhki6zek6jjrjj364k9j7lg','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-11 00:10:16.331208'),('es8kffx20v7gv42i2gtskqh2st124q7e','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-16 23:07:59.324177'),('eyfqx20hivhpzsiusaggfb0egzfoi30p','ODJkMjRkZTk5MDc3YWMxYTg1NTVjNTMzYTkzZmEwOTllMzcwYTA1OTp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1pdmV1c2VyIjozLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1vYmlsZSI6IjgzNzc5NTA3MTEiLCJfYXV0aF91c2VyX2hhc2giOiIyZTUxNTZjMWNkNDJjYzlkMDY0ODU5OGU3MTY2MDRlZDM3YzhiMGRiIn0=','2015-09-08 04:38:38.912711'),('gsxcdufn97gm6pjztzaytyl1f1vxaade','ZGVhNGJhODVjYmFjZDk5YTY1NWFhNWIxMWQyYjIzODRjMjkwNWNkNDp7Im1pdmV1c2VyIjoxLCJtb2JpbGUiOiI4Mzc3OTUwNzExIiwibG9nZ2VkaW4iOnRydWV9','2015-09-07 22:25:48.863169'),('hazlq5w43dejq3xo07z1zja5kv7mwl4t','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-17 20:59:46.013454'),('hr2bulwgk8ucqoqnv5b5y2vsrxui2jlb','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-10 18:21:34.277123'),('hwdw18xlwiu65cuibi29idi7i1d8398d','YTliZGQzN2RiZmRkNThmZTgzYmQyOTMxMjNhMWM2ZWI3ZjBjZjViMTp7Im1vYmlsZSI6Ijg0NDkwOTEyMzkiLCJtaXZldXNlciI6NCwibG9nZ2VkaW4iOnRydWV9','2015-09-18 04:34:00.422453'),('hwlekaefo2ucxg2qrn3yz8zgi3lnehrj','NTFiYTYyMDFhZDQyNjg2MmRlNTY1MDUxYWM4Y2I3MmRmYjZiMzM5Njp7Im1pdmV1c2VyIjozLCJtb2JpbGUiOiI4Mzc3OTUwNzExIiwibG9nZ2VkaW4iOnRydWV9','2015-09-11 08:58:38.219296'),('hyj6jckkdt5gngghw7zjboqbgin7gets','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-18 10:47:52.687087'),('i09bbe1lekdjtas7mmkvlqtryirg6chq','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 03:31:53.428435'),('igzy2f6vitkmibrzml9rm338ilaghukj','NTFiYTYyMDFhZDQyNjg2MmRlNTY1MDUxYWM4Y2I3MmRmYjZiMzM5Njp7Im1pdmV1c2VyIjozLCJtb2JpbGUiOiI4Mzc3OTUwNzExIiwibG9nZ2VkaW4iOnRydWV9','2015-09-09 20:07:29.584524'),('jhhftdy1118s19w13o60100exlltcugv','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-11 07:39:46.958567'),('jrgsdizx5eqpr3a2wtkpok2ilvbrjaci','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 22:37:34.839983'),('ltm3pp6sixswf10kstg080n3kwz3x22a','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-10 22:52:08.234903'),('lvepemw83ddqi9k3f5wqd19trjx13ekx','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 20:55:59.595503'),('m7r1mgawlbr40o3yuk76s1aud7kiavxr','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-16 23:53:17.949153'),('mi0gyhkcpqbi5zt0kldggg2653tp969c','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 03:09:55.618696'),('mn6n0h0g4z8uko15rzoct39fhbb3rc3r','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-17 03:12:03.695594'),('np7ew8x92rb5s9w0edjpevewg4ek4pn3','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-10 23:50:12.857581'),('o6jbf6skvfh2pq6ricd4svzyqlqln9yo','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 20:05:36.298355'),('o82j7n5iw9r5yrse1qb0tf37wombpp72','OGE1MzhmNmQ3ZTY1YWVmMjVhM2M5NTI4ODQ2YTkzODNkMzE1ZTE0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJlNTE1NmMxY2Q0MmNjOWQwNjQ4NTk4ZTcxNjYwNGVkMzdjOGIwZGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-09-11 15:29:45.923487'),('pebnbxv4thiep4m0hpz8cnjb9wkzuzj6','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-08 22:25:07.535949'),('qpn3f91zvewdsu0r2xrg2q18232bzto4','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-18 14:55:59.521720'),('rxofw9p6vir3m6a5lg1qecr2nf1e56qa','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-08 07:59:53.339140'),('szn0q82pixl8dp0fh8pgcxradjhn4vp6','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 23:39:06.717996'),('t76ky0oyz1jblnsk6z55uze5cn6ed5ac','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 07:36:48.478654'),('vgexrfjmvl65u3u4peth347pkprnxfsr','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-11 01:29:28.599103'),('vq69ogorefk8icmshpvzo0q3uqbxdwoy','NTFiYTYyMDFhZDQyNjg2MmRlNTY1MDUxYWM4Y2I3MmRmYjZiMzM5Njp7Im1pdmV1c2VyIjozLCJtb2JpbGUiOiI4Mzc3OTUwNzExIiwibG9nZ2VkaW4iOnRydWV9','2015-09-09 18:20:26.989000'),('w58owac7olhfcqeh1xme91edru1qxyfs','NTFiYTYyMDFhZDQyNjg2MmRlNTY1MDUxYWM4Y2I3MmRmYjZiMzM5Njp7Im1pdmV1c2VyIjozLCJtb2JpbGUiOiI4Mzc3OTUwNzExIiwibG9nZ2VkaW4iOnRydWV9','2015-09-08 18:53:57.463668'),('wv8kpfu26rxdorfmkle359ufxupth2xw','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-18 11:55:34.723036'),('xe7tegdtzxfa8tb6xwd913jtuw2gxk6w','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-09 21:09:40.131663'),('y32zakcrnic20dzlnanvpb1rszrvlk1q','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-08 23:39:10.405836'),('y9gcbvd5sq8u78vm2v4nm6aj3app7u2r','ODJkMjRkZTk5MDc3YWMxYTg1NTVjNTMzYTkzZmEwOTllMzcwYTA1OTp7ImxvZ2dlZGluIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMSIsIm1pdmV1c2VyIjozLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIm1vYmlsZSI6IjgzNzc5NTA3MTEiLCJfYXV0aF91c2VyX2hhc2giOiIyZTUxNTZjMWNkNDJjYzlkMDY0ODU5OGU3MTY2MDRlZDM3YzhiMGRiIn0=','2015-09-09 22:47:29.380954'),('yr8vhcg9wgd2f1hzalhusrxcf71xltlh','YjAxOTg5MWQ4MWMzNzY2NWNmZmQwNGFjNDZlNWNhMDRiYWQ1ZjM0Njp7Im1vYmlsZSI6IjgzNzc5NTA3MTEiLCJtaXZldXNlciI6MywibG9nZ2VkaW4iOnRydWV9','2015-09-10 10:32:40.761787');
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
  `cart_id` int(11) NOT NULL,
  `qtyInUnits` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `resason` longtext,
  PRIMARY KEY (`accartitem_id`),
  KEY `veggex_accartitem_cart_id_1aa388bb_fk_veggex_cart_cart_id` (`cart_id`),
  KEY `veggex_accartit_product_id_20f089ad_fk_veggex_product_product_id` (`product_id`),
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
  PRIMARY KEY (`career_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_career`
--

LOCK TABLES `veggex_career` WRITE;
/*!40000 ALTER TABLE `veggex_career` DISABLE KEYS */;
INSERT INTO `veggex_career` VALUES (1,'Rakesh','yadav','info@rees52.org','Django developer','hh','./26af7f70-314c-45fa-8056-2ff2ff2c8fcf_1.jpg'),(2,'Rakesh','yadav','info@rees52.org','Django developer','hh','./02_Bad_Baby_Second_Hand_Husband_BADshah_320kbps.mp3'),(3,'Rakesh','yadav','info@rees52.org',' Django Developer - Python/Magento - eCommerce','dsfsdf','./1010950_658847130842026_658744676_n_Cropped.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_cart`
--

LOCK TABLES `veggex_cart` WRITE;
/*!40000 ALTER TABLE `veggex_cart` DISABLE KEYS */;
INSERT INTO `veggex_cart` VALUES (4,'2015-09-04 16:07:01.312542','2015-09-04 16:07:01.312563',133),(5,'2015-09-04 04:32:22.639107','2015-09-04 04:32:22.639154',0);
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
  `cart_id` int(11) NOT NULL,
  `qtyInUnits` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`cartitem_id`),
  KEY `veggex_cartitem_cart_id_e97a525_fk_veggex_cart_cart_id` (`cart_id`),
  KEY `veggex_cartitem_product_id_410c13a3_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `veggex_cartitem_cart_id_e97a525_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`),
  CONSTRAINT `veggex_cartitem_product_id_410c13a3_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_cartitem`
--

LOCK TABLES `veggex_cartitem` WRITE;
/*!40000 ALTER TABLE `veggex_cartitem` DISABLE KEYS */;
INSERT INTO `veggex_cartitem` VALUES (151,4,1,4),(152,4,1,9);
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
INSERT INTO `veggex_category` VALUES (1,'vegetables','./vegetables.png','these kind of vegetables are being used for fuck'),(2,'fruits','./fruits.png','Django administration Welcome, admin. View site / Change password / Log out Home › Veggex › Products › rakesh Change product History  Name: Description: Category:  Change  Add PopularityIndex: Unit: PriceType: PricePerUnit: Coverphoto: Currently: ./Rees52-Raspberry-Pi-2-Model-SDL605139026-1-07246_r4');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_contact`
--

LOCK TABLES `veggex_contact` WRITE;
/*!40000 ALTER TABLE `veggex_contact` DISABLE KEYS */;
INSERT INTO `veggex_contact` VALUES (1,'Rakesh yadav','info@rees52.org','dffgfd',918377950711),(2,'Rakesh yadav','info@rees52.org','gdg',918377950711),(3,'Rakesh yadav','info@rees52.org','fgfdg',918377950711),(4,'categ3','akjsna@gmail.com','f',9928524925),(5,'Rakesh yadav','info@rees52.org','j',918377950711),(6,'Rakesh yadav','info@rees52.org','h',918377950711),(7,'Rakesh yadav','info@rees52.org','hi',918377950711);
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
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `veggex_customcategorypro_user_id_39efe98a_fk_veggex_user_user_id` (`user_id`),
  KEY `veggex_customcat_product_id_6e90b19_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `veggex_customcat_product_id_6e90b19_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_customcategorypro_user_id_39efe98a_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_customcategoryproducts`
--

LOCK TABLES `veggex_customcategoryproducts` WRITE;
/*!40000 ALTER TABLE `veggex_customcategoryproducts` DISABLE KEYS */;
INSERT INTO `veggex_customcategoryproducts` VALUES (1,3,2),(2,3,4);
/*!40000 ALTER TABLE `veggex_customcategoryproducts` ENABLE KEYS */;
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
INSERT INTO `veggex_mandi` VALUES (1,'azadpur','Best Available','',NULL);
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
  `user_id` int(11) NOT NULL,
  `timeOfCreate` datetime(6) NOT NULL,
  `timeOfUpdate` datetime(6) NOT NULL,
  `payment_mode` varchar(200) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `deliveryTime` longtext,
  PRIMARY KEY (`order_id`),
  KEY `veggex_order_user_id_45dbd524_fk_veggex_user_user_id` (`user_id`),
  CONSTRAINT `veggex_order_user_id_45dbd524_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_order`
--

LOCK TABLES `veggex_order` WRITE;
/*!40000 ALTER TABLE `veggex_order` DISABLE KEYS */;
INSERT INTO `veggex_order` VALUES (1,3,'2015-08-25 20:59:09.182868','2015-08-25 20:59:09.182900','COD',369,'PLACED',NULL),(2,3,'2015-08-25 21:10:06.428378','2015-08-25 21:10:06.428430','COD',123,'PLACED',NULL),(3,3,'2015-08-25 21:10:52.386483','2015-08-25 21:10:52.386520','COD',1130,'PLACED',NULL),(4,3,'2015-08-25 21:16:23.738372','2015-08-25 21:16:23.738406','COD',123,'PLACED',NULL),(5,3,'2015-08-25 21:24:26.142799','2015-08-25 21:24:26.142831','COD',123,'PLACED',NULL),(6,3,'2015-08-25 21:25:44.750335','2015-08-25 21:25:44.750370','COD',123,'PLACED',NULL),(7,3,'2015-08-25 21:26:13.735189','2015-08-25 21:26:13.735223','COD',12,'PLACED',NULL),(8,3,'2015-08-25 21:27:29.673824','2015-08-25 21:27:29.673857','COD',123,'PLACED',NULL),(9,3,'2015-08-25 21:28:44.308283','2015-08-25 21:28:44.308315','COD',246,'PLACED',NULL),(10,3,'2015-08-25 21:31:05.877656','2015-08-25 21:31:05.877710','COD',123,'PLACED',NULL),(11,3,'2015-08-25 21:33:16.502339','2015-08-25 21:33:16.502372','COD',123,'PLACED',NULL),(12,3,'2015-08-25 21:41:04.521731','2015-08-25 21:41:04.521762','COD',123,'PLACED',NULL),(13,3,'2015-08-25 21:43:07.509254','2015-08-25 21:43:07.509285','COD',246,'PLACED',NULL),(14,3,'2015-08-25 21:57:00.483148','2015-08-25 21:57:00.483201','COD',123,'PLACED',NULL),(15,3,'2015-08-25 22:07:15.926444','2015-08-25 22:07:15.926480','COD',12,'PLACED',NULL),(16,3,'2015-08-25 22:08:14.590354','2015-08-25 22:08:14.590387','COD',369,'PLACED',NULL),(17,3,'2015-08-25 22:09:16.924802','2015-08-25 22:09:16.924837','COD',12,'PLACED',NULL),(18,3,'2015-08-25 22:12:13.209333','2015-08-25 22:12:13.209369','COD',123,'PLACED',NULL),(19,3,'2015-08-25 22:17:33.364116','2015-08-25 22:17:33.364149','COD',123,'PLACED',NULL),(20,3,'2015-08-25 22:18:12.420999','2015-08-25 22:18:12.421034','COD',369,'PLACED',NULL),(21,3,'2015-08-25 22:20:21.799644','2015-08-25 22:20:21.799676','COD',369,'PLACED',NULL),(22,3,'2015-08-25 22:22:10.864552','2015-08-25 22:22:10.864590','COD',123,'PLACED',NULL),(23,3,'2015-08-25 22:25:59.858649','2015-08-25 22:25:59.858715','COD',100,'PLACED',NULL),(24,3,'2015-08-25 22:48:55.750850','2015-08-25 22:48:55.750885','COD',123,'PLACED',NULL),(25,3,'2015-08-25 22:50:52.623073','2015-08-25 22:50:52.623106','COD',123,'PLACED',NULL),(26,3,'2015-08-25 22:56:28.707193','2015-08-25 22:56:28.707228','COD',12,'PLACED',NULL),(27,3,'2015-08-25 23:38:34.988999','2015-08-25 23:38:34.989065','COD',36,'PLACED',NULL),(28,3,'2015-08-25 23:39:55.682370','2015-08-25 23:39:55.682473','COD',12,'PLACED',NULL),(29,3,'2015-08-26 00:31:57.854911','2015-08-26 00:31:57.854942','COD',1857,'PLACED',NULL),(30,3,'2015-08-26 00:31:58.501989','2015-08-26 00:31:58.502064','COD',1857,'PLACED',NULL),(31,3,'2015-08-26 02:59:50.434570','2015-08-26 02:59:50.434645','COD',369,'PLACED',NULL),(32,3,'2015-08-26 03:15:17.183004','2015-08-26 03:15:17.183038','COD',123,'PLACED',NULL),(33,3,'2015-08-26 03:16:07.502623','2015-08-26 03:16:07.502679','COD',369,'PLACED',NULL),(34,3,'2015-08-26 03:30:07.252310','2015-08-26 03:30:07.252393','COD',369,'PLACED',NULL),(35,3,'2015-08-26 03:32:48.534205','2015-08-26 03:32:48.534273','COD',100,'PLACED',NULL),(36,3,'2015-08-26 04:54:56.048068','2015-08-26 04:54:56.048101','COD',123,'PLACED',NULL),(37,3,'2015-08-26 04:56:43.014982','2015-08-26 04:56:43.015009','COD',123,'PLACED',NULL),(38,3,'2015-08-26 04:58:13.636613','2015-08-26 04:58:13.636646','COD',123,'PLACED',NULL),(39,3,'2015-08-26 05:00:07.400914','2015-08-26 05:00:07.400945','COD',123,'PLACED',NULL),(40,3,'2015-08-26 05:01:13.142036','2015-08-26 05:01:13.142074','COD',12,'PLACED',NULL),(41,3,'2015-08-26 05:02:46.834909','2015-08-26 05:02:46.834943','COD',1000,'PLACED',NULL),(42,3,'2015-08-26 05:04:33.124908','2015-08-26 05:04:33.124935','COD',123,'PLACED',NULL),(43,3,'2015-08-26 05:52:17.292866','2015-08-26 05:52:17.292892','COD',12,'PLACED',NULL),(44,3,'2015-08-26 06:05:36.459733','2015-08-26 06:05:36.459816','COD',12,'PLACED',NULL),(45,3,'2015-08-26 14:30:08.647590','2015-08-26 14:30:08.647646','COD',123,'PLACED',NULL),(46,3,'2015-08-26 14:31:43.265643','2015-08-26 14:31:43.265789','COD',12,'PLACED',NULL),(47,3,'2015-08-26 14:33:44.923041','2015-08-26 14:33:44.923073','COD',12,'PLACED',NULL),(48,3,'2015-08-26 14:35:05.146819','2015-08-26 14:35:05.146940','COD',123,'PLACED',NULL),(49,3,'2015-08-26 14:35:45.401293','2015-08-26 14:35:45.401325','COD',123,'PLACED',NULL),(50,3,'2015-08-26 19:14:08.626309','2015-08-26 19:14:08.626343','COD',1147,'PLACED',NULL),(51,3,'2015-08-26 19:14:35.395019','2015-08-26 19:14:35.395052','COD',100,'PLACED',NULL),(52,3,'2015-08-26 19:15:46.654629','2015-08-26 19:15:46.654663','COD',12,'PLACED',NULL),(53,3,'2015-08-26 22:09:38.030376','2015-08-26 22:09:38.030433','COD',111,'PLACED',NULL),(54,3,'2015-08-27 16:54:04.923951','2015-08-27 16:54:04.924014','COD',1871,'PLACED',NULL),(55,3,'2015-08-27 17:07:07.177375','2015-08-27 17:07:07.177439','COD',123,'PLACED',NULL),(56,3,'2015-08-27 17:18:12.573925','2015-08-27 17:18:12.574025','COD',123,'PLACED',NULL),(57,3,'2015-08-27 22:58:40.015454','2015-08-27 22:58:40.015542','COD',335,'PLACED',NULL),(58,3,'2015-08-27 23:05:00.153210','2015-08-27 23:05:00.153242','COD',123,'PLACED',NULL),(59,3,'2015-08-27 23:07:14.977938','2015-08-27 23:07:14.977987','COD',12,'PLACED',NULL),(60,3,'2015-08-27 23:08:21.174163','2015-08-27 23:08:21.174221','COD',12,'PLACED',NULL),(61,3,'2015-08-27 23:11:06.779874','2015-08-27 23:11:06.779911','COD',123,'PLACED',NULL),(62,3,'2015-08-27 23:12:27.202899','2015-08-27 23:12:27.202949','COD',123,'PLACED',NULL),(63,3,'2015-08-27 23:13:38.768997','2015-08-27 23:13:38.769033','COD',10,'PLACED',NULL),(64,3,'2015-08-27 23:14:28.513561','2015-08-27 23:14:28.513597','COD',123,'PLACED',NULL),(65,3,'2015-08-27 23:16:40.545456','2015-08-27 23:16:40.545559','COD',123,'PLACED',NULL),(66,3,'2015-08-27 23:17:48.864540','2015-08-27 23:17:48.864601','COD',123,'PLACED',NULL),(67,3,'2015-08-27 23:23:18.760601','2015-08-27 23:23:18.760664','COD',123,'PLACED',NULL),(68,3,'2015-08-27 23:26:27.120585','2015-08-27 23:26:27.120643','COD',133,'PLACED',NULL),(69,3,'2015-08-27 23:28:12.338891','2015-08-27 23:28:12.338932','COD',123,'PLACED',NULL),(70,3,'2015-08-27 23:29:35.622553','2015-08-27 23:29:35.622623','COD',123,'PLACED',NULL),(71,3,'2015-08-27 23:29:54.545499','2015-08-27 23:29:54.545537','COD',123,'PLACED',NULL),(72,3,'2015-08-27 23:33:24.485843','2015-08-27 23:33:24.485878','COD',123,'PLACED',NULL),(73,3,'2015-08-27 23:37:30.986187','2015-08-27 23:37:30.986232','COD',123,'PLACED',NULL),(74,3,'2015-08-27 23:39:41.387236','2015-08-27 23:39:41.387275','COD',123,'PLACED',NULL),(75,3,'2015-08-27 23:39:41.409847','2015-08-27 23:39:41.409893','COD',123,'PLACED',NULL),(76,3,'2015-08-27 23:42:46.279737','2015-08-27 23:42:46.279769','COD',246,'PLACED',NULL),(77,3,'2015-08-27 23:42:46.849512','2015-08-27 23:42:46.849543','COD',246,'PLACED',NULL),(78,3,'2015-08-27 23:48:19.980734','2015-08-27 23:48:19.980797','COD',123,'PLACED',NULL),(79,3,'2015-08-27 23:48:20.014822','2015-08-27 23:48:20.014874','COD',123,'PLACED',NULL),(80,3,'2015-08-27 23:52:18.066581','2015-08-27 23:52:18.066668','COD',123,'PLACED',NULL),(81,3,'2015-08-27 23:52:18.102189','2015-08-27 23:52:18.102227','COD',123,'PLACED',NULL),(82,3,'2015-08-27 23:53:13.475304','2015-08-27 23:53:13.475349','COD',10,'PLACED',NULL),(83,3,'2015-08-27 23:53:13.497662','2015-08-27 23:53:13.497696','COD',10,'PLACED',NULL),(84,3,'2015-08-28 00:03:36.304244','2015-08-28 00:03:36.304335','COD',1012,'PLACED',NULL),(85,3,'2015-08-28 00:03:36.324426','2015-08-28 00:03:36.324515','COD',1012,'PLACED',NULL),(86,3,'2015-08-28 00:06:15.222764','2015-08-28 00:06:15.222805','COD',123,'PLACED',NULL),(87,3,'2015-08-28 00:07:06.316813','2015-08-28 00:07:06.316867','COD',123,'PLACED',NULL),(88,3,'2015-08-28 00:11:56.028977','2015-08-28 00:11:56.029034','COD',133,'PLACED',NULL),(89,3,'2015-08-28 00:44:19.870898','2015-08-28 00:44:19.870934','COD',123,'PLACED',NULL),(90,3,'2015-08-28 00:50:52.491056','2015-08-28 00:50:52.491145','COD',123,'PLACED',NULL),(91,3,'2015-08-28 00:52:04.734793','2015-08-28 00:52:04.734845','COD',123,'PLACED',NULL),(92,3,'2015-08-28 01:00:13.532520','2015-08-28 01:00:13.532557','COD',123,'PLACED',NULL),(93,3,'2015-08-28 01:05:32.306102','2015-08-28 01:05:32.306202','COD',123,'PLACED',NULL),(94,3,'2015-08-28 01:12:57.523383','2015-08-28 01:12:57.523465','COD',12,'PLACED',NULL),(95,3,'2015-08-28 01:46:08.217225','2015-08-28 01:46:08.217255','COD',5665,'PLACED',NULL),(96,3,'2015-08-28 01:46:41.244678','2015-08-28 01:46:41.244733','COD',123,'PLACED',NULL),(97,3,'2015-08-28 02:10:04.137983','2015-08-28 02:10:04.138041','COD',1657,'PLACED',NULL),(98,3,'2015-08-28 02:49:10.824105','2015-08-28 02:49:10.824154','COD',10,'PLACED',NULL),(99,3,'2015-08-28 05:47:54.975730','2015-08-28 05:47:54.975809','COD',3135,'PLACED',NULL),(100,3,'2015-08-28 07:25:47.359752','2015-08-28 07:25:47.359803','COD',1768,'PLACED',NULL),(101,3,'2015-08-28 07:27:00.526454','2015-08-28 07:27:00.526515','COD',123,'PLACED',NULL),(102,3,'2015-09-03 19:51:37.538681','2015-09-03 19:51:37.538721','COD',1361,'PLACED',NULL),(103,3,'2015-09-04 15:37:46.371476','2015-09-04 15:37:46.371514','COD',1513,'PLACED',NULL);
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
  `order_id` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `qtyInUnits` int(11) NOT NULL,
  `priceType` varchar(200) NOT NULL,
  `priceAtThatTime` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`orderitem_id`),
  KEY `veggex_orderitem_order_id_25245ba7_fk_veggex_order_order_id` (`order_id`),
  KEY `veggex_orderite_product_id_407f03ca_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `veggex_orderite_product_id_407f03ca_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_orderitem_order_id_25245ba7_fk_veggex_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `veggex_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_orderitem`
--

LOCK TABLES `veggex_orderitem` WRITE;
/*!40000 ALTER TABLE `veggex_orderitem` DISABLE KEYS */;
INSERT INTO `veggex_orderitem` VALUES (1,1,'kg',3,'custom rates',123,5),(2,2,'kg',1,'custom rates',123,3),(3,3,'kg',3,'custom rates',12,2),(4,4,'kg',1,'custom rates',123,3),(5,5,'kg',1,'custom rates',123,3),(6,6,'kg',1,'custom rates',123,3),(7,7,'kg',1,'custom rates',12,2),(8,8,'kg',1,'custom rates',123,3),(9,9,'kg',2,'custom rates',123,3),(10,10,'kg',1,'custom rates',123,3),(11,11,'kg',1,'custom rates',123,3),(12,12,'kg',1,'custom rates',123,3),(13,13,'kg',2,'custom rates',123,4),(14,14,'kg',1,'custom rates',123,5),(15,15,'kg',1,'custom rates',12,2),(16,16,'kg',3,'custom rates',123,3),(17,17,'kg',1,'custom rates',12,2),(18,18,'kg',1,'custom rates',123,3),(19,19,'kg',1,'custom rates',123,3),(20,20,'kg',3,'custom rates',123,3),(21,21,'kg',3,'custom rates',123,4),(22,22,'kg',1,'custom rates',123,3),(23,23,'10 kg',1,'custom rates',100,1),(24,24,'kg',1,'custom rates',123,3),(25,25,'kg',1,'custom rates',123,3),(26,26,'kg',1,'custom rates',12,2),(27,27,'kg',3,'custom rates',12,2),(28,28,'kg',1,'custom rates',12,2),(29,29,'kg',1,'custom rates',12,2),(30,30,'kg',1,'custom rates',12,2),(31,29,'kg',15,'custom rates',123,3),(32,30,'kg',15,'custom rates',123,3),(33,31,'kg',3,'custom rates',123,3),(34,32,'kg',1,'custom rates',123,3),(35,33,'kg',3,'custom rates',123,3),(36,34,'kg',3,'custom rates',123,3),(37,35,'10 kg',1,'custom rates',100,1),(38,36,'kg',1,'custom rates',123,3),(39,37,'kg',1,'custom rates',123,3),(40,38,'kg',1,'custom rates',123,3),(41,39,'kg',1,'custom rates',123,3),(42,40,'kg',1,'custom rates',12,2),(43,41,'kg',1,'custom rates',1000,7),(44,42,'kg',1,'custom rates',123,3),(45,43,'kg',1,'custom rates',12,2),(46,44,'kg',1,'custom rates',12,2),(47,45,'kg',1,'custom rates',123,3),(48,46,'kg',1,'custom rates',12,2),(49,47,'kg',1,'custom rates',12,2),(50,48,'kg',1,'custom rates',123,3),(51,49,'kg',1,'custom rates',123,3),(52,50,'kg',2,'custom rates',12,2),(53,50,'kg',1,'custom rates',1000,7),(54,50,'kg',1,'custom rates',123,3),(55,51,'10 kg',1,'custom rates',100,1),(56,52,'kg',1,'custom rates',12,2),(57,53,'kg',1,'custom rates',123,4),(58,53,'kg',1,'custom rates',123,3),(59,54,'kg',5,'custom rates',123,4),(60,54,'kg',6,'custom rates',10,8),(61,54,'kg',1,'custom rates',12,2),(62,54,'kg',3,'custom rates',123,5),(63,54,'10 kg',2,'custom rates',100,1),(64,54,'kg',5,'custom rates',123,3),(65,55,'kg',1,'custom rates',123,3),(66,56,'kg',1,'custom rates',123,5),(67,57,'kg',1,'custom rates',123,5),(68,57,'10 kg',2,'custom rates',100,1),(69,57,'kg',1,'custom rates',12,2),(70,58,'kg',1,'custom rates',123,3),(71,59,'kg',1,'custom rates',12,2),(72,60,'kg',1,'custom rates',12,2),(73,61,'kg',1,'custom rates',123,3),(74,62,'kg',1,'custom rates',123,4),(75,63,'kg',1,'custom rates',10,8),(76,64,'kg',1,'custom rates',123,4),(77,65,'kg',1,'custom rates',123,4),(78,66,'kg',1,'custom rates',123,5),(79,67,'kg',1,'custom rates',123,3),(80,68,'kg',1,'custom rates',123,5),(81,68,'kg',1,'custom rates',10,8),(82,69,'kg',1,'custom rates',123,4),(83,70,'kg',1,'custom rates',123,5),(84,71,'kg',1,'custom rates',123,5),(85,72,'kg',1,'custom rates',123,5),(86,73,'kg',1,'custom rates',123,4),(87,74,'kg',1,'custom rates',123,5),(88,75,'kg',1,'custom rates',123,5),(89,76,'kg',2,'custom rates',123,5),(90,77,'kg',2,'custom rates',123,5),(91,78,'kg',1,'custom rates',123,3),(92,79,'kg',1,'custom rates',123,3),(93,80,'kg',1,'custom rates',123,5),(94,81,'kg',1,'custom rates',123,5),(95,82,'kg',1,'custom rates',10,8),(96,83,'kg',1,'custom rates',10,8),(97,84,'kg',1,'custom rates',12,2),(98,85,'kg',1,'custom rates',12,2),(99,84,'kg',1,'custom rates',1000,7),(100,85,'kg',1,'custom rates',1000,7),(101,86,'kg',1,'custom rates',123,3),(102,87,'kg',1,'custom rates',123,5),(103,88,'kg',1,'custom rates',123,3),(104,88,'kg',1,'custom rates',10,8),(105,89,'kg',1,'custom rates',123,4),(106,90,'kg',1,'custom rates',123,4),(107,91,'kg',1,'custom rates',123,4),(108,92,'kg',1,'custom rates',123,3),(109,93,'kg',1,'custom rates',123,3),(110,94,'kg',1,'custom rates',12,2),(111,95,'10 kg',12,'custom rates',100,1),(112,95,'kg',1,'custom rates',123,4),(113,95,'kg',4,'custom rates',1000,7),(114,95,'kg',8,'custom rates',12,2),(115,95,'kg',2,'custom rates',123,3),(116,96,'kg',1,'custom rates',123,4),(117,97,'kg',7,'custom rates',12,2),(118,97,'kg',6,'custom rates',123,4),(119,97,'10 kg',2,'custom rates',100,1),(120,97,'kg',2,'custom rates',10,8),(121,97,'kg',5,'custom rates',123,3),(122,98,'kg',1,'custom rates',10,8),(123,99,'kg',1,'custom rates',12,2),(124,99,'kg',1,'custom rates',123,3),(125,99,'kg',3,'custom rates',1000,7),(126,100,'kg',3,'custom rates',12,2),(127,100,'kg',6,'custom rates',123,3),(128,100,'kg',5,'custom rates',123,4),(129,100,'kg',3,'custom rates',123,5),(130,100,'kg',1,'custom rates',10,8),(131,101,'kg',1,'custom rates',123,3),(132,102,'10 kg',5,'custom rates',100,1),(133,102,'kg',1,'custom rates',123,5),(134,102,'kg',6,'custom rates',123,3),(135,103,'kg',1,'custom rates',10,8),(136,103,'kg',3,'custom rates',123,3),(137,103,'kg',2,'custom rates',12,2),(138,103,'kg',1,'custom rates',1000,7),(139,103,'kg',1,'custom rates',10,9),(140,103,'10 kg',1,'custom rates',100,1);
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
  `category_id` int(11) NOT NULL,
  `popularityIndex` int(11) DEFAULT NULL,
  `unit` varchar(100) NOT NULL,
  `priceType` varchar(300) NOT NULL,
  `pricePerUnit` int(11) NOT NULL,
  `coverphoto` varchar(100) NOT NULL,
  `origin` varchar(300) NOT NULL,
  `maxAvailableUnits` int(11) NOT NULL,
  `qualityRemarks` longtext NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `isPerishable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `veggex_produ_category_id_31eec16e_fk_veggex_category_category_id` (`category_id`),
  KEY `veggex_product_seller_id_9a0512d_fk_veggex_seller_seller_id` (`seller_id`),
  CONSTRAINT `veggex_produ_category_id_31eec16e_fk_veggex_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `veggex_category` (`category_id`),
  CONSTRAINT `veggex_product_seller_id_9a0512d_fk_veggex_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `veggex_seller` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_product`
--

LOCK TABLES `veggex_product` WRITE;
/*!40000 ALTER TABLE `veggex_product` DISABLE KEYS */;
INSERT INTO `veggex_product` VALUES (1,'tomatoes','xx',1,NULL,'10 kg','custom rates',100,'./d.jpg','chomu',1000,'dd',1,1),(2,'apple','ff',2,NULL,'kg','custom rates',12,'./e_uc2IpjZ.jpg','jaipur',12,'fff',NULL,0),(3,'Green Apple','http://www.mive.in/main',2,NULL,'kg','custom rates',123,'./image-4-compressed_FMUSsJZ.jpg','agra',12,'dgds',NULL,0),(4,'carrot','http://www.mive.in/main',1,NULL,'kg','custom rates',123,'./image-2-compressed_0U1BLaq.jpg','delhi',12,'ddsf',1,1),(5,'q','cfsc',1,NULL,'kg','custom rates',123,'./e.jpg','delhi',12,'dsd',NULL,0),(7,'a','ddd',2,NULL,'kg','custom rates',1000,'./image-2-compressed.jpg','Delhi',1212,'ff',NULL,0),(8,'rakesh','gdfg',1,NULL,'kg','custom rates',10,'./image-4-compressed.jpg','ggg',1000,'dddd',NULL,0),(9,'A new foo','hiiii',1,4,'kg','custom rates',10,'./1269438_708935059120411_1743592332_o.jpg','agra',12,'vdv',1,0);
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
INSERT INTO `veggex_seller` VALUES (1,'Mive PVT LTD','info@mive.in',8377950711,'',1,1);
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
  KEY `veggex_user_address_id_755b7296_fk_veggex_address_address_id` (`address_id`),
  KEY `veggex_user_cart_id_63b84d4f_fk_veggex_cart_cart_id` (`cart_id`),
  CONSTRAINT `veggex_user_address_id_755b7296_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`),
  CONSTRAINT `veggex_user_cart_id_63b84d4f_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_user`
--

LOCK TABLES `veggex_user` WRITE;
/*!40000 ALTER TABLE `veggex_user` DISABLE KEYS */;
INSERT INTO `veggex_user` VALUES (3,'Mezbaan','Hatim Singh','veg. vendors','rak.dev007@gmail.com',8377950711,'pbkdf2_sha256$20000$xcPbF0CMVCyw$eZECZo2qDkuIVr8+UxTiIosfDPdHx6mMQNhUbp3AAjM=','','./apple-6_dVrFLe9.jpg',1,4),(4,'Shubham','Shubham','hotels','ra@gmail.com',8449091239,'pbkdf2_sha256$12000$LwPATwemj5J2$ftGbMJSKtho6HrM+uXoKDHBRc7Uxgg+Pn9Ay5ySDk6E=','','./255390_4223000579700_1242451309_n_Cropped.jpg',1,5);
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

-- Dump completed on 2015-09-04 20:29:16

