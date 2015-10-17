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
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  CONSTRAINT `authtoken_token_user_id_1d10c57f535fb363_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-09-12 16:17:43.805335'),(2,'auth','0001_initial','2015-09-12 16:17:44.100642'),(3,'admin','0001_initial','2015-09-12 16:17:44.189275'),(4,'contenttypes','0002_remove_content_type_name','2015-09-12 16:17:44.310950'),(5,'auth','0002_alter_permission_name_max_length','2015-09-12 16:17:44.353636'),(6,'auth','0003_alter_user_email_max_length','2015-09-12 16:17:44.397748'),(7,'auth','0004_alter_user_username_opts','2015-09-12 16:17:44.416786'),(8,'auth','0005_alter_user_last_login_null','2015-09-12 16:17:44.462021'),(9,'auth','0006_require_contenttypes_0002','2015-09-12 16:17:44.465352'),(10,'authtoken','0001_initial','2015-09-12 16:17:44.521283'),(11,'sessions','0001_initial','2015-09-12 16:17:44.557404');
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
  KEY `veggex_accartite_cart_id_44ca152ae55c7745_fk_veggex_cart_cart_id` (`cart_id`),
  KEY `veggex__product_id_791847ff20f089ad_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `veggex__product_id_791847ff20f089ad_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_accartite_cart_id_44ca152ae55c7745_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_address`
--

LOCK TABLES `veggex_address` WRITE;
/*!40000 ALTER TABLE `veggex_address` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_cart`
--

LOCK TABLES `veggex_cart` WRITE;
/*!40000 ALTER TABLE `veggex_cart` DISABLE KEYS */;
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
  `qtyInUnits` int(10) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`cartitem_id`),
  KEY `veggex_cartitem_cart_id_31672537f1685adb_fk_veggex_cart_cart_id` (`cart_id`),
  KEY `veggex__product_id_6cd81c06410c13a3_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `veggex__product_id_6cd81c06410c13a3_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_cartitem_cart_id_31672537f1685adb_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_cartitem`
--

LOCK TABLES `veggex_cartitem` WRITE;
/*!40000 ALTER TABLE `veggex_cartitem` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_category`
--

LOCK TABLES `veggex_category` WRITE;
/*!40000 ALTER TABLE `veggex_category` DISABLE KEYS */;
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
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `veggex_customcat_user_id_47e33e12c6101676_fk_veggex_user_user_id` (`user_id`),
  KEY `veggex__product_id_36536d2006e90b19_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `veggex__product_id_36536d2006e90b19_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_customcat_user_id_47e33e12c6101676_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
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
  KEY `veggex__address_id_3dda75cce0678d1b_fk_veggex_address_address_id` (`address_id`),
  CONSTRAINT `veggex__address_id_3dda75cce0678d1b_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`)
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
  `user_id` int(11) NOT NULL,
  `timeOfCreate` datetime(6) NOT NULL,
  `timeOfUpdate` datetime(6) NOT NULL,
  `payment_mode` varchar(200) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `deliveryTime` longtext,
  PRIMARY KEY (`order_id`),
  KEY `veggex_order_user_id_2911d94545dbd524_fk_veggex_user_user_id` (`user_id`),
  CONSTRAINT `veggex_order_user_id_2911d94545dbd524_fk_veggex_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `veggex_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_order`
--

LOCK TABLES `veggex_order` WRITE;
/*!40000 ALTER TABLE `veggex_order` DISABLE KEYS */;
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
  KEY `veggex_orderi_order_id_76bbb0cc25245ba7_fk_veggex_order_order_id` (`order_id`),
  KEY `veggex__product_id_17b482d0407f03ca_fk_veggex_product_product_id` (`product_id`),
  CONSTRAINT `veggex__product_id_17b482d0407f03ca_fk_veggex_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `veggex_product` (`product_id`),
  CONSTRAINT `veggex_orderi_order_id_76bbb0cc25245ba7_fk_veggex_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `veggex_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_orderitem`
--

LOCK TABLES `veggex_orderitem` WRITE;
/*!40000 ALTER TABLE `veggex_orderitem` DISABLE KEYS */;
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
  `status` varchar(300) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `isPerishable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `vegg_category_id_3f4b5a7b31eec16e_fk_veggex_category_category_id` (`category_id`),
  KEY `veggex_prod_seller_id_52c4dfbf65faed3_fk_veggex_seller_seller_id` (`seller_id`),
  CONSTRAINT `vegg_category_id_3f4b5a7b31eec16e_fk_veggex_category_category_id` FOREIGN KEY (`category_id`) REFERENCES `veggex_category` (`category_id`),
  CONSTRAINT `veggex_prod_seller_id_52c4dfbf65faed3_fk_veggex_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `veggex_seller` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_product`
--

LOCK TABLES `veggex_product` WRITE;
/*!40000 ALTER TABLE `veggex_product` DISABLE KEYS */;
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
  KEY `veggex__address_id_5a5e3c01e6e4bf40_fk_veggex_address_address_id` (`address_id`),
  KEY `veggex_seller_mandi_id_2033cc6a06d87b2d_fk_veggex_mandi_mandi_id` (`mandi_id`),
  CONSTRAINT `veggex__address_id_5a5e3c01e6e4bf40_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`),
  CONSTRAINT `veggex_seller_mandi_id_2033cc6a06d87b2d_fk_veggex_mandi_mandi_id` FOREIGN KEY (`mandi_id`) REFERENCES `veggex_mandi` (`mandi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_seller`
--

LOCK TABLES `veggex_seller` WRITE;
/*!40000 ALTER TABLE `veggex_seller` DISABLE KEYS */;
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
  KEY `veggex__address_id_35aed4a1755b7296_fk_veggex_address_address_id` (`address_id`),
  KEY `veggex_user_cart_id_76c7be8763b84d4f_fk_veggex_cart_cart_id` (`cart_id`),
  CONSTRAINT `veggex__address_id_35aed4a1755b7296_fk_veggex_address_address_id` FOREIGN KEY (`address_id`) REFERENCES `veggex_address` (`address_id`),
  CONSTRAINT `veggex_user_cart_id_76c7be8763b84d4f_fk_veggex_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `veggex_cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veggex_user`
--

LOCK TABLES `veggex_user` WRITE;
/*!40000 ALTER TABLE `veggex_user` DISABLE KEYS */;
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

-- Dump completed on 2015-09-12 21:49:53
