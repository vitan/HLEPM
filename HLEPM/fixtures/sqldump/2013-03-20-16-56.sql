-- MySQL dump 10.13  Distrib 5.5.28, for Linux (x86_64)
--
-- Host: localhost    Database: hlepm
-- ------------------------------------------------------
-- Server version	5.5.28

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
-- Table structure for table `HLEPM_email_config`
--

DROP TABLE IF EXISTS `HLEPM_email_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HLEPM_email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `mail_to` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `purpose_id` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `HLEPM_email_config_3f385c1b` (`purpose_id`),
  CONSTRAINT `purpose_id_refs_id_6dcdca60` FOREIGN KEY (`purpose_id`) REFERENCES `HLEPM_email_purpose` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HLEPM_email_config`
--

LOCK TABLES `HLEPM_email_config` WRITE;
/*!40000 ALTER TABLE `HLEPM_email_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `HLEPM_email_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HLEPM_email_purpose`
--

DROP TABLE IF EXISTS `HLEPM_email_purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HLEPM_email_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HLEPM_email_purpose`
--

LOCK TABLES `HLEPM_email_purpose` WRITE;
/*!40000 ALTER TABLE `HLEPM_email_purpose` DISABLE KEYS */;
/*!40000 ALTER TABLE `HLEPM_email_purpose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments_attachment`
--

DROP TABLE IF EXISTS `attachments_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `creator_id` int(11) NOT NULL,
  `attachment_file` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_attachment_e4470c6e` (`content_type_id`),
  KEY `attachments_attachment_f97a5119` (`creator_id`),
  CONSTRAINT `content_type_id_refs_id_c5ad706b818ff04` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `creator_id_refs_id_12322100e7256180` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments_attachment`
--

LOCK TABLES `attachments_attachment` WRITE;
/*!40000 ALTER TABLE `attachments_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments_attachment` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add comment',8,'add_comment'),(23,'Can change comment',8,'change_comment'),(24,'Can delete comment',8,'delete_comment'),(25,'Can moderate comments',8,'can_moderate'),(26,'Can add comment flag',9,'add_commentflag'),(27,'Can change comment flag',9,'change_commentflag'),(28,'Can delete comment flag',9,'delete_commentflag'),(29,'Can add email purpose',10,'add_emailpurpose'),(30,'Can change email purpose',10,'change_emailpurpose'),(31,'Can delete email purpose',10,'delete_emailpurpose'),(32,'Can add email templates',11,'add_emailtemplates'),(33,'Can change email templates',11,'change_emailtemplates'),(34,'Can delete email templates',11,'delete_emailtemplates'),(35,'Can add migration history',12,'add_migrationhistory'),(36,'Can change migration history',12,'change_migrationhistory'),(37,'Can delete migration history',12,'delete_migrationhistory'),(38,'Can add product',13,'add_product'),(39,'Can change product',13,'change_product'),(40,'Can delete product',13,'delete_product'),(41,'Can add requirement type',14,'add_requirementtype'),(42,'Can change requirement type',14,'change_requirementtype'),(43,'Can delete requirement type',14,'delete_requirementtype'),(44,'Can add requirement status',15,'add_requirementstatus'),(45,'Can change requirement status',15,'change_requirementstatus'),(46,'Can delete requirement status',15,'delete_requirementstatus'),(47,'Can add requirement owner',16,'add_requirementowner'),(48,'Can change requirement owner',16,'change_requirementowner'),(49,'Can delete requirement owner',16,'delete_requirementowner'),(50,'Can add version',17,'add_version'),(51,'Can change version',17,'change_version'),(52,'Can delete version',17,'delete_version'),(53,'Can add requirement',18,'add_requirement'),(54,'Can change requirement',18,'change_requirement'),(55,'Can delete requirement',18,'delete_requirement'),(56,'Can add phase',19,'add_phase'),(57,'Can change phase',19,'change_phase'),(58,'Can delete phase',19,'delete_phase'),(59,'Can add project type',20,'add_projecttype'),(60,'Can change project type',20,'change_projecttype'),(61,'Can delete project type',20,'delete_projecttype'),(62,'Can add project status',21,'add_projectstatus'),(63,'Can change project status',21,'change_projectstatus'),(64,'Can delete project status',21,'delete_projectstatus'),(65,'Can add project owner',22,'add_projectowner'),(66,'Can change project owner',22,'change_projectowner'),(67,'Can delete project owner',22,'delete_projectowner'),(68,'Can add project',23,'add_project'),(69,'Can change project',23,'change_project'),(70,'Can delete project',23,'delete_project'),(71,'Can add member type',24,'add_membertype'),(72,'Can change member type',24,'change_membertype'),(73,'Can delete member type',24,'delete_membertype'),(74,'Can add member',25,'add_member'),(75,'Can change member',25,'change_member'),(76,'Can delete member',25,'delete_member'),(77,'Can add stakeholder type',26,'add_stakeholdertype'),(78,'Can change stakeholder type',26,'change_stakeholdertype'),(79,'Can delete stakeholder type',26,'delete_stakeholdertype'),(80,'Can add department',27,'add_department'),(81,'Can change department',27,'change_department'),(82,'Can delete department',27,'delete_department'),(83,'Can add section',28,'add_section'),(84,'Can change section',28,'change_section'),(85,'Can delete section',28,'delete_section'),(86,'Can add stakeholder',29,'add_stakeholder'),(87,'Can change stakeholder',29,'change_stakeholder'),(88,'Can delete stakeholder',29,'delete_stakeholder'),(89,'Can add impact',30,'add_impact'),(90,'Can change impact',30,'change_impact'),(91,'Can delete impact',30,'delete_impact'),(92,'Can add response',31,'add_response'),(93,'Can change response',31,'change_response'),(94,'Can delete response',31,'delete_response'),(95,'Can add priority',32,'add_priority'),(96,'Can change priority',32,'change_priority'),(97,'Can delete priority',32,'delete_priority'),(98,'Can add probability',33,'add_probability'),(99,'Can change probability',33,'change_probability'),(100,'Can delete probability',33,'delete_probability'),(101,'Can add risk status',34,'add_riskstatus'),(102,'Can change risk status',34,'change_riskstatus'),(103,'Can delete risk status',34,'delete_riskstatus'),(104,'Can add risk',35,'add_risk'),(105,'Can change risk',35,'change_risk'),(106,'Can delete risk',35,'delete_risk'),(107,'Can add issue status',36,'add_issuestatus'),(108,'Can change issue status',36,'change_issuestatus'),(109,'Can delete issue status',36,'delete_issuestatus'),(110,'Can add issue',37,'add_issue'),(111,'Can change issue',37,'change_issue'),(112,'Can delete issue',37,'delete_issue'),(113,'Can add requirement history',38,'add_requirementhistory'),(114,'Can change requirement history',38,'change_requirementhistory'),(115,'Can delete requirement history',38,'delete_requirementhistory'),(116,'Can add project history',39,'add_projecthistory'),(117,'Can change project history',39,'change_projecthistory'),(118,'Can delete project history',39,'delete_projecthistory'),(119,'Can add attachment',40,'add_attachment'),(120,'Can change attachment',40,'change_attachment'),(121,'Can delete attachment',40,'delete_attachment'),(122,'Can delete foreign attachments',40,'delete_foreign_attachments'),(123,'Can add mitigation',41,'add_mitigation'),(124,'Can change mitigation',41,'change_mitigation'),(125,'Can delete mitigation',41,'delete_mitigation');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','admin@163.com','pbkdf2_sha256$10000$vNDxfs0yyrBL$MQeTExvUPjTIkLQ0bH51zpljuq+gZEOdFiub+yA9iSA=',1,1,1,'2013-03-20 06:13:05','2013-03-15 05:35:47'),(2,'docai','','','','pbkdf2_sha256$10000$qKf0lS1Ngj9H$07IVqKoUf0apNldvYdgW8CtgSzCuqKRqHZmjCAeiOB0=',1,1,1,'2013-03-19 06:36:41','2013-03-19 06:36:41');
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
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-03-15 05:44:49',1,14,'1','high',1,''),(2,'2013-03-15 05:44:57',1,14,'2','middle',1,''),(3,'2013-03-15 05:45:05',1,14,'3','low',1,''),(4,'2013-03-15 05:45:22',1,13,'1','high',1,''),(5,'2013-03-15 05:45:28',1,13,'2','middle',1,''),(6,'2013-03-15 05:45:33',1,13,'3','low',1,''),(7,'2013-03-15 05:46:02',1,15,'1','high',1,''),(8,'2013-03-15 05:46:12',1,15,'2','middle',1,''),(9,'2013-03-15 05:46:28',1,15,'3','low',1,''),(10,'2013-03-15 05:46:53',1,16,'1','high',1,''),(11,'2013-03-15 05:47:02',1,16,'2','middle',1,''),(12,'2013-03-15 05:47:09',1,16,'3','low',1,''),(13,'2013-03-15 05:47:32',1,17,'1','high',1,''),(14,'2013-03-15 05:47:40',1,17,'2','middle',1,''),(15,'2013-03-15 05:47:48',1,17,'3','low',1,''),(16,'2013-03-15 06:53:15',1,30,'1','high',1,''),(17,'2013-03-15 06:53:24',1,33,'1','high',1,''),(18,'2013-03-15 06:53:29',1,31,'1','high',1,''),(19,'2013-03-15 06:53:36',1,34,'1','high',1,''),(20,'2013-03-15 06:53:43',1,35,'1','admin',1,''),(21,'2013-03-15 07:42:00',1,35,'1','admin',2,'No fields changed.'),(22,'2013-03-15 07:42:26',1,35,'2','admin',1,''),(23,'2013-03-15 08:13:48',1,35,'2','admin',2,'Changed description.'),(24,'2013-03-15 08:53:01',1,35,'7','admin',3,''),(25,'2013-03-15 08:53:02',1,35,'6','admin',3,''),(26,'2013-03-15 08:53:02',1,35,'5','admin',3,''),(27,'2013-03-15 08:53:02',1,35,'4','admin',3,''),(28,'2013-03-15 08:53:02',1,35,'3','admin',3,''),(29,'2013-03-15 08:53:02',1,35,'2','admin',3,''),(30,'2013-03-15 08:53:02',1,35,'1','admin',3,''),(31,'2013-03-18 06:36:45',1,36,'1','high',1,''),(32,'2013-03-18 06:37:07',1,32,'1','high',1,''),(33,'2013-03-18 09:05:31',1,37,'4','admin',3,''),(34,'2013-03-18 09:05:31',1,37,'3','admin',3,''),(35,'2013-03-18 09:05:31',1,37,'2','admin',3,''),(36,'2013-03-18 09:05:32',1,37,'1','admin',3,''),(37,'2013-03-18 10:39:09',1,37,'12','admin',3,''),(38,'2013-03-18 10:39:09',1,37,'11','admin',3,''),(39,'2013-03-18 10:39:09',1,37,'10','admin',3,''),(40,'2013-03-18 10:39:09',1,37,'9','admin',3,''),(41,'2013-03-18 10:39:09',1,37,'8','admin',3,''),(42,'2013-03-18 10:39:09',1,37,'7','admin',3,''),(43,'2013-03-18 10:39:09',1,37,'6','admin',3,''),(44,'2013-03-18 10:39:09',1,37,'5','admin',3,''),(45,'2013-03-19 02:31:59',1,37,'28','admin',3,''),(46,'2013-03-19 02:31:59',1,37,'27','admin',3,''),(47,'2013-03-19 02:31:59',1,37,'26','admin',3,''),(48,'2013-03-19 02:31:59',1,37,'25','admin',3,''),(49,'2013-03-19 02:31:59',1,37,'24','admin',3,''),(50,'2013-03-19 02:32:00',1,37,'23','admin',3,''),(51,'2013-03-19 02:32:00',1,37,'22','admin',3,''),(52,'2013-03-19 02:32:00',1,37,'21','admin',3,''),(53,'2013-03-19 02:32:00',1,37,'20','admin',3,''),(54,'2013-03-19 02:32:00',1,37,'19','admin',3,''),(55,'2013-03-19 02:32:00',1,37,'18','admin',3,''),(56,'2013-03-19 02:32:00',1,37,'17','admin',3,''),(57,'2013-03-19 02:32:00',1,37,'16','admin',3,''),(58,'2013-03-19 02:32:00',1,37,'15','admin',3,''),(59,'2013-03-19 02:32:00',1,37,'14','admin',3,''),(60,'2013-03-19 02:32:00',1,37,'13','admin',3,''),(61,'2013-03-19 04:57:08',1,37,'33','admin',3,''),(62,'2013-03-19 04:57:08',1,37,'32','admin',3,''),(63,'2013-03-19 04:57:08',1,37,'31','admin',3,''),(64,'2013-03-19 04:57:08',1,37,'30','admin',3,''),(65,'2013-03-19 04:57:08',1,37,'29','admin',3,''),(66,'2013-03-19 06:36:41',1,3,'2','docai',1,''),(67,'2013-03-19 06:36:46',1,3,'2','docai',2,'Changed password, is_staff and is_superuser.'),(68,'2013-03-20 02:54:40',1,30,'2','middle',1,''),(69,'2013-03-20 05:33:42',1,33,'2','middle',1,''),(70,'2013-03-20 05:33:52',1,34,'2','middle',1,''),(71,'2013-03-20 05:34:39',1,31,'2','middle',1,''),(72,'2013-03-20 05:47:14',1,32,'2','middle',1,''),(73,'2013-03-20 05:47:29',1,36,'2','middle',1,''),(74,'2013-03-20 06:47:38',1,36,'3','low',1,''),(75,'2013-03-20 08:25:37',1,41,'1','high',1,''),(76,'2013-03-20 08:37:50',1,41,'2','middle',1,''),(77,'2013-03-20 08:39:19',1,37,'38','admin',3,''),(78,'2013-03-20 08:39:19',1,37,'36','docai',3,''),(79,'2013-03-20 08:39:19',1,37,'35','docai',3,''),(80,'2013-03-20 08:39:19',1,37,'40','docai',3,''),(81,'2013-03-20 08:39:19',1,37,'39','docai',3,''),(82,'2013-03-20 08:39:19',1,37,'34','docai',3,''),(83,'2013-03-20 08:39:19',1,37,'37','docai',3,''),(84,'2013-03-20 08:54:36',1,37,'43','docai',3,''),(85,'2013-03-20 08:54:36',1,37,'42','docai',3,''),(86,'2013-03-20 08:54:36',1,37,'41','docai',3,''),(87,'2013-03-20 08:54:45',1,37,'44','docai',3,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_flags`
--

DROP TABLE IF EXISTS `django_comment_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comment_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `flag` varchar(30) NOT NULL,
  `flag_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`comment_id`,`flag`),
  KEY `django_comment_flags_fbfc09f1` (`user_id`),
  KEY `django_comment_flags_9b3dc754` (`comment_id`),
  KEY `django_comment_flags_111c90f9` (`flag`),
  CONSTRAINT `user_id_refs_id_603c4dcb` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `comment_id_refs_id_373a05f7` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_flags`
--

LOCK TABLES `django_comment_flags` WRITE;
/*!40000 ALTER TABLE `django_comment_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comments`
--

DROP TABLE IF EXISTS `django_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `object_pk` longtext NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(75) NOT NULL,
  `user_url` varchar(200) NOT NULL,
  `comment` longtext NOT NULL,
  `submit_date` datetime NOT NULL,
  `ip_address` char(15) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comments_e4470c6e` (`content_type_id`),
  KEY `django_comments_6223029` (`site_id`),
  KEY `django_comments_fbfc09f1` (`user_id`),
  CONSTRAINT `site_id_refs_id_8db720f8` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `content_type_id_refs_id_f2a7975b` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_81622011` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comments`
--

LOCK TABLES `django_comments` WRITE;
/*!40000 ALTER TABLE `django_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'comment','comments','comment'),(9,'comment flag','comments','commentflag'),(10,'email purpose','remind','emailpurpose'),(11,'email templates','remind','emailtemplates'),(12,'migration history','south','migrationhistory'),(13,'product','track','product'),(14,'requirement type','track','requirementtype'),(15,'requirement status','track','requirementstatus'),(16,'requirement owner','track','requirementowner'),(17,'version','track','version'),(18,'requirement','track','requirement'),(19,'phase','track','phase'),(20,'project type','track','projecttype'),(21,'project status','track','projectstatus'),(22,'project owner','track','projectowner'),(23,'project','track','project'),(24,'member type','track','membertype'),(25,'member','track','member'),(26,'stakeholder type','track','stakeholdertype'),(27,'department','track','department'),(28,'section','track','section'),(29,'stakeholder','track','stakeholder'),(30,'impact','track','impact'),(31,'response','track','response'),(32,'priority','track','priority'),(33,'probability','track','probability'),(34,'risk status','track','riskstatus'),(35,'risk','track','risk'),(36,'issue status','track','issuestatus'),(37,'issue','track','issue'),(38,'requirement history','track','requirementhistory'),(39,'project history','track','projecthistory'),(40,'attachment','attachments','attachment'),(41,'mitigation','track','mitigation');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0baaca2fb504f1cd7b33a0451fe00c76','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-03-29 05:38:58'),('16ac236684f7f9635e8267a8b395d36d','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-03-29 05:41:26'),('1a25624d8812be5425a55b903ab71470','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-04-03 06:13:05');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'track','0001_initial','2013-03-15 05:36:40'),(2,'track','0002_auto__del_field_requirement_name','2013-03-15 05:36:40'),(3,'track','0003_auto__del_requirementcontent__add_requirementtype__del_field_requireme','2013-03-15 05:36:44'),(4,'track','0004_auto__chg_field_requirement_target_date__chg_field_requirement_start_d','2013-03-15 05:36:45'),(5,'track','0005_auto__del_field_risk_due_date__add_field_risk_target_date','2013-03-15 05:36:45'),(6,'track','0006_auto__add_field_risk_content_type__add_field_risk_object_id__add_field','2013-03-15 05:36:47'),(7,'search','0001_initial','2013-03-15 05:37:07'),(8,'attachments','0001_initial','2013-03-15 05:37:21'),(9,'attachments','0002_auto__add_field_attachment_is_removed','2013-03-15 05:37:21'),(10,'attachments','0003_auto__del_field_attachment_is_removed','2013-03-15 05:37:21'),(11,'track','0007_auto__del_field_issue_dur_date__add_field_issue_target_date','2013-03-18 09:01:27'),(12,'track','0008_auto__add_mitigation','2013-03-20 08:19:43'),(13,'track','0009_auto__add_field_issue_mitigation','2013-03-20 08:26:43');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_department`
--

DROP TABLE IF EXISTS `track_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_department`
--

LOCK TABLES `track_department` WRITE;
/*!40000 ALTER TABLE `track_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_impact`
--

DROP TABLE IF EXISTS `track_impact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_impact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_impact`
--

LOCK TABLES `track_impact` WRITE;
/*!40000 ALTER TABLE `track_impact` DISABLE KEYS */;
INSERT INTO `track_impact` VALUES (1,'high',1),(2,'middle',2);
/*!40000 ALTER TABLE `track_impact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_issue`
--

DROP TABLE IF EXISTS `track_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reporter_id` int(11) NOT NULL,
  `impact_id` int(11) NOT NULL,
  `priority_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `description` varchar(1024) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `target_date` datetime NOT NULL,
  `mitigation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_issue_8231e1c7` (`reporter_id`),
  KEY `track_issue_b551c318` (`impact_id`),
  KEY `track_issue_b62206ec` (`priority_id`),
  KEY `track_issue_44224078` (`status_id`),
  KEY `track_issue_e4470c6e` (`content_type_id`),
  KEY `track_issue_3657c425` (`mitigation_id`),
  CONSTRAINT `mitigation_id_refs_id_b11aa08442a5786` FOREIGN KEY (`mitigation_id`) REFERENCES `track_mitigation` (`id`),
  CONSTRAINT `content_type_id_refs_id_33b8f50d52055ae` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `impact_id_refs_id_496d57dcc0891ebf` FOREIGN KEY (`impact_id`) REFERENCES `track_impact` (`id`),
  CONSTRAINT `priority_id_refs_id_1d0c01ceef815393` FOREIGN KEY (`priority_id`) REFERENCES `track_priority` (`id`),
  CONSTRAINT `reporter_id_refs_id_61a84feeab0679e` FOREIGN KEY (`reporter_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `status_id_refs_id_4d38ef1d8cebe915` FOREIGN KEY (`status_id`) REFERENCES `track_issuestatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_issue`
--

LOCK TABLES `track_issue` WRITE;
/*!40000 ALTER TABLE `track_issue` DISABLE KEYS */;
INSERT INTO `track_issue` VALUES (45,2,2,2,2,'2013-03-14 05:00:00','hhhhhhhhh',18,1,'2013-03-15 05:00:00',2),(46,2,2,2,2,'2013-03-14 05:00:00','hhhhhhhhh',18,1,'2013-03-15 05:00:00',2),(47,1,2,2,2,'2013-03-14 05:00:00','aaaaaaaaaa',18,1,'2013-03-15 05:00:00',2);
/*!40000 ALTER TABLE `track_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_issuestatus`
--

DROP TABLE IF EXISTS `track_issuestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_issuestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_issuestatus`
--

LOCK TABLES `track_issuestatus` WRITE;
/*!40000 ALTER TABLE `track_issuestatus` DISABLE KEYS */;
INSERT INTO `track_issuestatus` VALUES (1,'high',1),(2,'middle',2),(3,'low',3);
/*!40000 ALTER TABLE `track_issuestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_member`
--

DROP TABLE IF EXISTS `track_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `type_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_member_777d41c8` (`type_id`),
  KEY `track_member_b6620684` (`project_id`),
  CONSTRAINT `project_id_refs_id_10567ed1e4c426a7` FOREIGN KEY (`project_id`) REFERENCES `track_project` (`id`),
  CONSTRAINT `type_id_refs_id_435308242fcd02cb` FOREIGN KEY (`type_id`) REFERENCES `track_membertype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_member`
--

LOCK TABLES `track_member` WRITE;
/*!40000 ALTER TABLE `track_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_membertype`
--

DROP TABLE IF EXISTS `track_membertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_membertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_membertype`
--

LOCK TABLES `track_membertype` WRITE;
/*!40000 ALTER TABLE `track_membertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_membertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_mitigation`
--

DROP TABLE IF EXISTS `track_mitigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_mitigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_mitigation`
--

LOCK TABLES `track_mitigation` WRITE;
/*!40000 ALTER TABLE `track_mitigation` DISABLE KEYS */;
INSERT INTO `track_mitigation` VALUES (1,'high',1),(2,'middle',2);
/*!40000 ALTER TABLE `track_mitigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_phase`
--

DROP TABLE IF EXISTS `track_phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_phase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_phase`
--

LOCK TABLES `track_phase` WRITE;
/*!40000 ALTER TABLE `track_phase` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_phase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_priority`
--

DROP TABLE IF EXISTS `track_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_priority`
--

LOCK TABLES `track_priority` WRITE;
/*!40000 ALTER TABLE `track_priority` DISABLE KEYS */;
INSERT INTO `track_priority` VALUES (1,'high',1),(2,'middle',2);
/*!40000 ALTER TABLE `track_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_probability`
--

DROP TABLE IF EXISTS `track_probability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_probability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_probability`
--

LOCK TABLES `track_probability` WRITE;
/*!40000 ALTER TABLE `track_probability` DISABLE KEYS */;
INSERT INTO `track_probability` VALUES (1,'high',1),(2,'middle',2);
/*!40000 ALTER TABLE `track_probability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_product`
--

DROP TABLE IF EXISTS `track_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_product`
--

LOCK TABLES `track_product` WRITE;
/*!40000 ALTER TABLE `track_product` DISABLE KEYS */;
INSERT INTO `track_product` VALUES (1,'high'),(2,'middle'),(3,'low');
/*!40000 ALTER TABLE `track_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_project`
--

DROP TABLE IF EXISTS `track_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `requirement_id` int(11) NOT NULL,
  `version_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `project_manager_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `type_id` int(11) NOT NULL,
  `update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_project_bb420c12` (`product_id`),
  KEY `track_project_99a85f32` (`requirement_id`),
  KEY `track_project_fef0b09d` (`version_id`),
  KEY `track_project_44224078` (`status_id`),
  KEY `track_project_5d52dd10` (`owner_id`),
  KEY `track_project_55a6607c` (`project_manager_id`),
  KEY `track_project_777d41c8` (`type_id`),
  CONSTRAINT `type_id_refs_id_3ae8b9e35c7b97fd` FOREIGN KEY (`type_id`) REFERENCES `track_projecttype` (`id`),
  CONSTRAINT `owner_id_refs_id_56244840daacc833` FOREIGN KEY (`owner_id`) REFERENCES `track_projectowner` (`id`),
  CONSTRAINT `product_id_refs_id_5028cc9a8933f6b1` FOREIGN KEY (`product_id`) REFERENCES `track_product` (`id`),
  CONSTRAINT `project_manager_id_refs_id_32eed84e99bb6ffa` FOREIGN KEY (`project_manager_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `requirement_id_refs_id_635b7a23dcb66f4f` FOREIGN KEY (`requirement_id`) REFERENCES `track_requirement` (`id`),
  CONSTRAINT `status_id_refs_id_3681fa51f95fd18b` FOREIGN KEY (`status_id`) REFERENCES `track_projectstatus` (`id`),
  CONSTRAINT `version_id_refs_id_4e3ad3ba5eafa822` FOREIGN KEY (`version_id`) REFERENCES `track_version` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_project`
--

LOCK TABLES `track_project` WRITE;
/*!40000 ALTER TABLE `track_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_projecthistory`
--

DROP TABLE IF EXISTS `track_projecthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_projecthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `editor_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_projecthistory_a803ffe7` (`editor_id`),
  KEY `track_projecthistory_b6620684` (`project_id`),
  KEY `track_projecthistory_777d41c8` (`type_id`),
  CONSTRAINT `type_id_refs_id_2d0c56f46463764` FOREIGN KEY (`type_id`) REFERENCES `track_projecttype` (`id`),
  CONSTRAINT `editor_id_refs_id_1b1e6a4b9f63930d` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `project_id_refs_id_1f04b1f997f444d8` FOREIGN KEY (`project_id`) REFERENCES `track_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_projecthistory`
--

LOCK TABLES `track_projecthistory` WRITE;
/*!40000 ALTER TABLE `track_projecthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_projecthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_projectowner`
--

DROP TABLE IF EXISTS `track_projectowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_projectowner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_projectowner`
--

LOCK TABLES `track_projectowner` WRITE;
/*!40000 ALTER TABLE `track_projectowner` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_projectowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_projectstatus`
--

DROP TABLE IF EXISTS `track_projectstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_projectstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_projectstatus`
--

LOCK TABLES `track_projectstatus` WRITE;
/*!40000 ALTER TABLE `track_projectstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_projectstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_projecttype`
--

DROP TABLE IF EXISTS `track_projecttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_projecttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_projecttype`
--

LOCK TABLES `track_projecttype` WRITE;
/*!40000 ALTER TABLE `track_projecttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_projecttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_requirement`
--

DROP TABLE IF EXISTS `track_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `start_date` datetime,
  `target_date` datetime,
  `status_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `version_id` int(11) DEFAULT NULL,
  `update` datetime NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_requirement_cc846901` (`author_id`),
  KEY `track_requirement_44224078` (`status_id`),
  KEY `track_requirement_5d52dd10` (`owner_id`),
  KEY `track_requirement_bb420c12` (`product_id`),
  KEY `track_requirement_fef0b09d` (`version_id`),
  KEY `track_requirement_777d41c8` (`type_id`),
  CONSTRAINT `author_id_refs_id_75a87e701aa8ead8` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `owner_id_refs_id_3d23a7668b8d62d9` FOREIGN KEY (`owner_id`) REFERENCES `track_requirementowner` (`id`),
  CONSTRAINT `product_id_refs_id_61a6f9a789285d83` FOREIGN KEY (`product_id`) REFERENCES `track_product` (`id`),
  CONSTRAINT `status_id_refs_id_5dc8ff97d9ee98d3` FOREIGN KEY (`status_id`) REFERENCES `track_requirementstatus` (`id`),
  CONSTRAINT `type_id_refs_id_40c1fdd14101bef1` FOREIGN KEY (`type_id`) REFERENCES `track_requirementtype` (`id`),
  CONSTRAINT `version_id_refs_id_b7db5a5e524cfb0` FOREIGN KEY (`version_id`) REFERENCES `track_version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirement`
--

LOCK TABLES `track_requirement` WRITE;
/*!40000 ALTER TABLE `track_requirement` DISABLE KEYS */;
INSERT INTO `track_requirement` VALUES (1,1,NULL,NULL,1,1,1,1,'2013-03-15 05:48:06',1);
/*!40000 ALTER TABLE `track_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_requirement_requirement`
--

DROP TABLE IF EXISTS `track_requirement_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_requirement_requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_requirement_id` int(11) NOT NULL,
  `to_requirement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `track_requirement_req_from_requirement_id_7455f61ae55dffad_uniq` (`from_requirement_id`,`to_requirement_id`),
  KEY `track_requirement_requirement_9515e044` (`from_requirement_id`),
  KEY `track_requirement_requirement_ba36952d` (`to_requirement_id`),
  CONSTRAINT `to_requirement_id_refs_id_6a472029a22e1575` FOREIGN KEY (`to_requirement_id`) REFERENCES `track_requirement` (`id`),
  CONSTRAINT `from_requirement_id_refs_id_6a472029a22e1575` FOREIGN KEY (`from_requirement_id`) REFERENCES `track_requirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirement_requirement`
--

LOCK TABLES `track_requirement_requirement` WRITE;
/*!40000 ALTER TABLE `track_requirement_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_requirement_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_requirementhistory`
--

DROP TABLE IF EXISTS `track_requirementhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_requirementhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `editor_id` int(11) NOT NULL,
  `requirement_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_requirementhistory_a803ffe7` (`editor_id`),
  KEY `track_requirementhistory_99a85f32` (`requirement_id`),
  KEY `track_requirementhistory_5d52dd10` (`owner_id`),
  CONSTRAINT `owner_id_refs_id_7983d3bc50c219d0` FOREIGN KEY (`owner_id`) REFERENCES `track_requirementowner` (`id`),
  CONSTRAINT `editor_id_refs_id_1bff9b7731127ef1` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `requirement_id_refs_id_4438504112f0ca34` FOREIGN KEY (`requirement_id`) REFERENCES `track_requirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementhistory`
--

LOCK TABLES `track_requirementhistory` WRITE;
/*!40000 ALTER TABLE `track_requirementhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_requirementhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_requirementowner`
--

DROP TABLE IF EXISTS `track_requirementowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_requirementowner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `track_requirementowner_777d41c8` (`type_id`),
  CONSTRAINT `type_id_refs_id_232322999b8fabe3` FOREIGN KEY (`type_id`) REFERENCES `track_requirementtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementowner`
--

LOCK TABLES `track_requirementowner` WRITE;
/*!40000 ALTER TABLE `track_requirementowner` DISABLE KEYS */;
INSERT INTO `track_requirementowner` VALUES (1,'high',1,1),(2,'middle',2,2),(3,'low',3,3);
/*!40000 ALTER TABLE `track_requirementowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_requirementstatus`
--

DROP TABLE IF EXISTS `track_requirementstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_requirementstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `track_requirementstatus_777d41c8` (`type_id`),
  CONSTRAINT `type_id_refs_id_527301f255a58961` FOREIGN KEY (`type_id`) REFERENCES `track_requirementtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementstatus`
--

LOCK TABLES `track_requirementstatus` WRITE;
/*!40000 ALTER TABLE `track_requirementstatus` DISABLE KEYS */;
INSERT INTO `track_requirementstatus` VALUES (1,'high',1,1),(2,'middle',2,2),(3,'low',3,3);
/*!40000 ALTER TABLE `track_requirementstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_requirementtype`
--

DROP TABLE IF EXISTS `track_requirementtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_requirementtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementtype`
--

LOCK TABLES `track_requirementtype` WRITE;
/*!40000 ALTER TABLE `track_requirementtype` DISABLE KEYS */;
INSERT INTO `track_requirementtype` VALUES (1,'high',1),(2,'middle',2),(3,'low',3);
/*!40000 ALTER TABLE `track_requirementtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_response`
--

DROP TABLE IF EXISTS `track_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_response`
--

LOCK TABLES `track_response` WRITE;
/*!40000 ALTER TABLE `track_response` DISABLE KEYS */;
INSERT INTO `track_response` VALUES (1,'high',1),(2,'middle',2);
/*!40000 ALTER TABLE `track_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_risk`
--

DROP TABLE IF EXISTS `track_risk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_risk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reporter_id` int(11) NOT NULL,
  `impact_id` int(11) NOT NULL,
  `probability_id` int(11) NOT NULL,
  `response_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `description` varchar(1024) NOT NULL,
  `target_date` datetime NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_risk_8231e1c7` (`reporter_id`),
  KEY `track_risk_b551c318` (`impact_id`),
  KEY `track_risk_3700f512` (`probability_id`),
  KEY `track_risk_d5ea739f` (`response_id`),
  KEY `track_risk_44224078` (`status_id`),
  KEY `track_risk_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_29fbc70d5202accf` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `impact_id_refs_id_6783ff456ce7a7fe` FOREIGN KEY (`impact_id`) REFERENCES `track_impact` (`id`),
  CONSTRAINT `probability_id_refs_id_70fd5afeb6d32f24` FOREIGN KEY (`probability_id`) REFERENCES `track_probability` (`id`),
  CONSTRAINT `reporter_id_refs_id_76d8c4948147e80d` FOREIGN KEY (`reporter_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `response_id_refs_id_274d53df182e0b5` FOREIGN KEY (`response_id`) REFERENCES `track_response` (`id`),
  CONSTRAINT `status_id_refs_id_39a227c570438081` FOREIGN KEY (`status_id`) REFERENCES `track_riskstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_risk`
--

LOCK TABLES `track_risk` WRITE;
/*!40000 ALTER TABLE `track_risk` DISABLE KEYS */;
INSERT INTO `track_risk` VALUES (8,1,2,2,2,2,'2013-03-20 05:00:00','bbb','2013-03-29 05:00:00',18,1),(9,1,1,1,1,1,'2013-03-20 05:00:00','bbbaaa','2013-03-29 05:00:00',18,1),(10,1,1,1,1,1,'2013-03-20 05:00:00','hhh','2013-03-29 05:00:00',18,1),(11,1,1,1,1,1,'2013-03-20 05:00:00','fff','2013-03-31 05:00:00',18,1),(12,2,2,2,2,2,'2013-03-20 05:00:00','ffddd','2013-03-31 05:00:00',18,1),(13,1,1,1,1,1,'2013-03-20 05:00:00','t','2013-03-31 05:00:00',18,1),(14,2,1,2,1,2,'2013-03-21 05:00:00','eee','2013-03-15 05:00:00',18,1),(15,1,1,2,1,2,'2013-03-21 05:00:00','aaa','2013-03-15 05:00:00',18,1),(16,1,1,2,1,2,'2013-03-21 05:00:00','ccccccccc','2013-03-15 05:00:00',18,1);
/*!40000 ALTER TABLE `track_risk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_riskstatus`
--

DROP TABLE IF EXISTS `track_riskstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_riskstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_riskstatus`
--

LOCK TABLES `track_riskstatus` WRITE;
/*!40000 ALTER TABLE `track_riskstatus` DISABLE KEYS */;
INSERT INTO `track_riskstatus` VALUES (1,'high',1),(2,'middle',2);
/*!40000 ALTER TABLE `track_riskstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_section`
--

DROP TABLE IF EXISTS `track_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_section_2ae7390` (`department_id`),
  CONSTRAINT `department_id_refs_id_5020d25a11bbd463` FOREIGN KEY (`department_id`) REFERENCES `track_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_section`
--

LOCK TABLES `track_section` WRITE;
/*!40000 ALTER TABLE `track_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_stakeholder`
--

DROP TABLE IF EXISTS `track_stakeholder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_stakeholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_stakeholder_777d41c8` (`type_id`),
  KEY `track_stakeholder_b6620684` (`project_id`),
  KEY `track_stakeholder_c007bd5a` (`section_id`),
  CONSTRAINT `section_id_refs_id_51ca3e6374520166` FOREIGN KEY (`section_id`) REFERENCES `track_section` (`id`),
  CONSTRAINT `project_id_refs_id_619fe6f469448f88` FOREIGN KEY (`project_id`) REFERENCES `track_project` (`id`),
  CONSTRAINT `type_id_refs_id_4bf30d6eaefe0f69` FOREIGN KEY (`type_id`) REFERENCES `track_stakeholdertype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_stakeholder`
--

LOCK TABLES `track_stakeholder` WRITE;
/*!40000 ALTER TABLE `track_stakeholder` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_stakeholder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_stakeholdertype`
--

DROP TABLE IF EXISTS `track_stakeholdertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_stakeholdertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_stakeholdertype`
--

LOCK TABLES `track_stakeholdertype` WRITE;
/*!40000 ALTER TABLE `track_stakeholdertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_stakeholdertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_version`
--

DROP TABLE IF EXISTS `track_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_version`
--

LOCK TABLES `track_version` WRITE;
/*!40000 ALTER TABLE `track_version` DISABLE KEYS */;
INSERT INTO `track_version` VALUES (1,'high',1),(2,'middle',2),(3,'low',3);
/*!40000 ALTER TABLE `track_version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-20 16:57:02
