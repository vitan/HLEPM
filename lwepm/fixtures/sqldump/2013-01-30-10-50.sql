-- MySQL dump 10.13  Distrib 5.5.28, for Linux (i686)
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
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add product',8,'add_product'),(23,'Can change product',8,'change_product'),(24,'Can delete product',8,'delete_product'),(25,'Can add requirement content',9,'add_requirementcontent'),(26,'Can change requirement content',9,'change_requirementcontent'),(27,'Can delete requirement content',9,'delete_requirementcontent'),(28,'Can add requirement status',10,'add_requirementstatus'),(29,'Can change requirement status',10,'change_requirementstatus'),(30,'Can delete requirement status',10,'delete_requirementstatus'),(31,'Can add requirement ack',11,'add_requirementack'),(32,'Can change requirement ack',11,'change_requirementack'),(33,'Can delete requirement ack',11,'delete_requirementack'),(34,'Can add version',12,'add_version'),(35,'Can change version',12,'change_version'),(36,'Can delete version',12,'delete_version'),(37,'Can add requirement',13,'add_requirement'),(38,'Can change requirement',13,'change_requirement'),(39,'Can delete requirement',13,'delete_requirement'),(40,'Can add project type',14,'add_projecttype'),(41,'Can change project type',14,'change_projecttype'),(42,'Can delete project type',14,'delete_projecttype'),(43,'Can add project status',15,'add_projectstatus'),(44,'Can change project status',15,'change_projectstatus'),(45,'Can delete project status',15,'delete_projectstatus'),(46,'Can add project ack',16,'add_projectack'),(47,'Can change project ack',16,'change_projectack'),(48,'Can delete project ack',16,'delete_projectack'),(49,'Can add project',17,'add_project'),(50,'Can change project',17,'change_project'),(51,'Can delete project',17,'delete_project'),(52,'Can add member type',18,'add_membertype'),(53,'Can change member type',18,'change_membertype'),(54,'Can delete member type',18,'delete_membertype'),(55,'Can add member',19,'add_member'),(56,'Can change member',19,'change_member'),(57,'Can delete member',19,'delete_member'),(58,'Can add stakeholder type',20,'add_stakeholdertype'),(59,'Can change stakeholder type',20,'change_stakeholdertype'),(60,'Can delete stakeholder type',20,'delete_stakeholdertype'),(61,'Can add department',21,'add_department'),(62,'Can change department',21,'change_department'),(63,'Can delete department',21,'delete_department'),(64,'Can add section',22,'add_section'),(65,'Can change section',22,'change_section'),(66,'Can delete section',22,'delete_section'),(67,'Can add stakeholder',23,'add_stakeholder'),(68,'Can change stakeholder',23,'change_stakeholder'),(69,'Can delete stakeholder',23,'delete_stakeholder'),(70,'Can add impact',24,'add_impact'),(71,'Can change impact',24,'change_impact'),(72,'Can delete impact',24,'delete_impact'),(73,'Can add response',25,'add_response'),(74,'Can change response',25,'change_response'),(75,'Can delete response',25,'delete_response'),(76,'Can add priority',26,'add_priority'),(77,'Can change priority',26,'change_priority'),(78,'Can delete priority',26,'delete_priority'),(79,'Can add probability',27,'add_probability'),(80,'Can change probability',27,'change_probability'),(81,'Can delete probability',27,'delete_probability'),(82,'Can add risk status',28,'add_riskstatus'),(83,'Can change risk status',28,'change_riskstatus'),(84,'Can delete risk status',28,'delete_riskstatus'),(85,'Can add risk',29,'add_risk'),(86,'Can change risk',29,'change_risk'),(87,'Can delete risk',29,'delete_risk'),(88,'Can add issue status',30,'add_issuestatus'),(89,'Can change issue status',30,'change_issuestatus'),(90,'Can delete issue status',30,'delete_issuestatus'),(91,'Can add issue',31,'add_issue'),(92,'Can change issue',31,'change_issue'),(93,'Can delete issue',31,'delete_issue'),(94,'Can add requirement history',32,'add_requirementhistory'),(95,'Can change requirement history',32,'change_requirementhistory'),(96,'Can delete requirement history',32,'delete_requirementhistory'),(97,'Can add project history',33,'add_projecthistory'),(98,'Can change project history',33,'change_projecthistory'),(99,'Can delete project history',33,'delete_projecthistory'),(100,'Can add comment',34,'add_comment'),(101,'Can change comment',34,'change_comment'),(102,'Can delete comment',34,'delete_comment'),(103,'Can moderate comments',34,'can_moderate'),(104,'Can add comment flag',35,'add_commentflag'),(105,'Can change comment flag',35,'change_commentflag'),(106,'Can delete comment flag',35,'delete_commentflag');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','weizhou@redhat.com','pbkdf2_sha256$10000$2wBDEDnjGfev$zTRz8MVWiA0qnHuKWj8YhxjHEkwcG5ZbFSPSlYR3D+8=',1,1,1,'2013-01-28 07:11:30','2013-01-18 06:37:56');
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
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-01-28 08:10:46',1,9,'1','RequirementContent - BRD',1,''),(2,'2013-01-28 08:23:31',1,9,'2','RequirementContent - MRD',1,''),(3,'2013-01-28 08:23:39',1,9,'3','RequirementContent - PRD',1,''),(4,'2013-01-29 10:23:28',1,8,'1','tcms',1,''),(5,'2013-01-29 10:23:52',1,8,'2','beaker',1,''),(6,'2013-01-29 10:24:06',1,8,'3','treasury',1,''),(7,'2013-01-29 10:24:31',1,12,'1','V1.0',1,''),(8,'2013-01-29 10:24:54',1,12,'2','V2.0',1,''),(9,'2013-01-29 10:25:15',1,12,'3','v3.0',1,''),(10,'2013-01-29 10:25:25',1,12,'4','v4.0',1,''),(11,'2013-01-29 10:25:29',1,12,'4','v4.0',2,'No fields changed.'),(12,'2013-01-29 10:42:40',1,10,'1','on track',1,''),(13,'2013-01-29 10:42:52',1,10,'2','suspend',1,''),(14,'2013-01-29 10:43:24',1,10,'3','Delay',1,''),(15,'2013-01-29 10:43:37',1,10,'4','Cancel',1,''),(16,'2013-01-29 10:44:14',1,11,'1','drafting',1,''),(17,'2013-01-29 10:44:30',1,11,'2','preparation',1,''),(18,'2013-01-29 10:44:44',1,11,'3','sign off',1,''),(19,'2013-01-29 10:44:59',1,11,'4','pending',1,''),(20,'2013-01-29 10:45:12',1,11,'5','delivered',1,'');
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
  KEY `django_comment_flags_403f60f` (`user_id`),
  KEY `django_comment_flags_64c238ac` (`comment_id`),
  KEY `django_comment_flags_111c90f9` (`flag`),
  CONSTRAINT `comment_id_refs_id_373a05f7` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `user_id_refs_id_603c4dcb` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `django_comments_1bb8f392` (`content_type_id`),
  KEY `django_comments_6223029` (`site_id`),
  KEY `django_comments_403f60f` (`user_id`),
  CONSTRAINT `content_type_id_refs_id_d5868a5` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `site_id_refs_id_7248df08` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `user_id_refs_id_7e9ddfef` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'product','track','product'),(9,'requirement content','track','requirementcontent'),(10,'requirement status','track','requirementstatus'),(11,'requirement ack','track','requirementack'),(12,'version','track','version'),(13,'requirement','track','requirement'),(14,'project type','track','projecttype'),(15,'project status','track','projectstatus'),(16,'project ack','track','projectack'),(17,'project','track','project'),(18,'member type','track','membertype'),(19,'member','track','member'),(20,'stakeholder type','track','stakeholdertype'),(21,'department','track','department'),(22,'section','track','section'),(23,'stakeholder','track','stakeholder'),(24,'impact','track','impact'),(25,'response','track','response'),(26,'priority','track','priority'),(27,'probability','track','probability'),(28,'risk status','track','riskstatus'),(29,'risk','track','risk'),(30,'issue status','track','issuestatus'),(31,'issue','track','issue'),(32,'requirement history','track','requirementhistory'),(33,'project history','track','projecthistory'),(34,'comment','comments','comment'),(35,'comment flag','comments','commentflag');
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
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7e115f284e093436ccba38e11a0bb3be','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-02-11 07:11:30'),('a2cc7347bcb1a8a0ce43c99891931fca','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-02-08 06:42:11'),('a69f746c80d93cdc6a6855becc0a3808','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-02-01 06:40:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
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
-- Table structure for table `track_department`
--

DROP TABLE IF EXISTS `track_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_impact`
--

LOCK TABLES `track_impact` WRITE;
/*!40000 ALTER TABLE `track_impact` DISABLE KEYS */;
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
  `dur_date` datetime NOT NULL,
  `description` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_issue_7dce1e39` (`reporter_id`),
  KEY `track_issue_4aae3ce8` (`impact_id`),
  KEY `track_issue_49ddf914` (`priority_id`),
  KEY `track_issue_44224078` (`status_id`),
  CONSTRAINT `impact_id_refs_id_3f76e141` FOREIGN KEY (`impact_id`) REFERENCES `track_impact` (`id`),
  CONSTRAINT `priority_id_refs_id_107eac6d` FOREIGN KEY (`priority_id`) REFERENCES `track_priority` (`id`),
  CONSTRAINT `reporter_id_refs_id_154f9862` FOREIGN KEY (`reporter_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `status_id_refs_id_731416eb` FOREIGN KEY (`status_id`) REFERENCES `track_issuestatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_issue`
--

LOCK TABLES `track_issue` WRITE;
/*!40000 ALTER TABLE `track_issue` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_issuestatus`
--

LOCK TABLES `track_issuestatus` WRITE;
/*!40000 ALTER TABLE `track_issuestatus` DISABLE KEYS */;
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
  KEY `track_member_499df97c` (`project_id`),
  CONSTRAINT `project_id_refs_id_1b3bd959` FOREIGN KEY (`project_id`) REFERENCES `track_project` (`id`),
  CONSTRAINT `type_id_refs_id_2fcd02cb` FOREIGN KEY (`type_id`) REFERENCES `track_membertype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_membertype`
--

LOCK TABLES `track_membertype` WRITE;
/*!40000 ALTER TABLE `track_membertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_membertype` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_priority`
--

LOCK TABLES `track_priority` WRITE;
/*!40000 ALTER TABLE `track_priority` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_probability`
--

LOCK TABLES `track_probability` WRITE;
/*!40000 ALTER TABLE `track_probability` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_product`
--

LOCK TABLES `track_product` WRITE;
/*!40000 ALTER TABLE `track_product` DISABLE KEYS */;
INSERT INTO `track_product` VALUES (1,'tcms'),(2,'beaker'),(3,'treasury');
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
  `ack_id` int(11) NOT NULL,
  `project_manager_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `type_id` int(11) NOT NULL,
  `update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_project_44bdf3ee` (`product_id`),
  KEY `track_project_6657a0ce` (`requirement_id`),
  KEY `track_project_10f4f63` (`version_id`),
  KEY `track_project_44224078` (`status_id`),
  KEY `track_project_1b2b653c` (`ack_id`),
  KEY `track_project_55a6607c` (`project_manager_id`),
  KEY `track_project_777d41c8` (`type_id`),
  CONSTRAINT `ack_id_refs_id_d09aabb` FOREIGN KEY (`ack_id`) REFERENCES `track_projectack` (`id`),
  CONSTRAINT `product_id_refs_id_76cc094f` FOREIGN KEY (`product_id`) REFERENCES `track_product` (`id`),
  CONSTRAINT `project_manager_id_refs_id_66449006` FOREIGN KEY (`project_manager_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `requirement_id_refs_id_234990b1` FOREIGN KEY (`requirement_id`) REFERENCES `track_requirement` (`id`),
  CONSTRAINT `status_id_refs_id_6a02e75` FOREIGN KEY (`status_id`) REFERENCES `track_projectstatus` (`id`),
  CONSTRAINT `type_id_refs_id_5c7b97fd` FOREIGN KEY (`type_id`) REFERENCES `track_projecttype` (`id`),
  CONSTRAINT `version_id_refs_id_5eafa822` FOREIGN KEY (`version_id`) REFERENCES `track_version` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_project`
--

LOCK TABLES `track_project` WRITE;
/*!40000 ALTER TABLE `track_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_projectack`
--

DROP TABLE IF EXISTS `track_projectack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_projectack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_projectack`
--

LOCK TABLES `track_projectack` WRITE;
/*!40000 ALTER TABLE `track_projectack` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_projectack` ENABLE KEYS */;
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
  KEY `track_projecthistory_57fc0019` (`editor_id`),
  KEY `track_projecthistory_499df97c` (`project_id`),
  KEY `track_projecthistory_777d41c8` (`type_id`),
  CONSTRAINT `editor_id_refs_id_609c6cf3` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `project_id_refs_id_680bbb28` FOREIGN KEY (`project_id`) REFERENCES `track_project` (`id`),
  CONSTRAINT `type_id_refs_id_46463764` FOREIGN KEY (`type_id`) REFERENCES `track_projecttype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_projecthistory`
--

LOCK TABLES `track_projecthistory` WRITE;
/*!40000 ALTER TABLE `track_projecthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_projecthistory` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `name` varchar(150) NOT NULL,
  `author_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `docfile` varchar(100) NOT NULL,
  `content_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `ack_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `version_id` int(11) DEFAULT NULL,
  `update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_requirement_337b96ff` (`author_id`),
  KEY `track_requirement_cc8ff3c` (`content_id`),
  KEY `track_requirement_44224078` (`status_id`),
  KEY `track_requirement_1b2b653c` (`ack_id`),
  KEY `track_requirement_44bdf3ee` (`product_id`),
  KEY `track_requirement_10f4f63` (`version_id`),
  CONSTRAINT `ack_id_refs_id_fe44663` FOREIGN KEY (`ack_id`) REFERENCES `track_requirementack` (`id`),
  CONSTRAINT `author_id_refs_id_1aa8ead8` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_id_refs_id_28edda99` FOREIGN KEY (`content_id`) REFERENCES `track_requirementcontent` (`id`),
  CONSTRAINT `product_id_refs_id_76d7a27d` FOREIGN KEY (`product_id`) REFERENCES `track_product` (`id`),
  CONSTRAINT `status_id_refs_id_2611672d` FOREIGN KEY (`status_id`) REFERENCES `track_requirementstatus` (`id`),
  CONSTRAINT `version_id_refs_id_1adb3050` FOREIGN KEY (`version_id`) REFERENCES `track_version` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirement`
--

LOCK TABLES `track_requirement` WRITE;
/*!40000 ALTER TABLE `track_requirement` DISABLE KEYS */;
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
  UNIQUE KEY `from_requirement_id` (`from_requirement_id`,`to_requirement_id`),
  KEY `track_requirement_requirement_6aea1fbc` (`from_requirement_id`),
  KEY `track_requirement_requirement_45c96ad3` (`to_requirement_id`),
  CONSTRAINT `from_requirement_id_refs_id_5dd1ea8b` FOREIGN KEY (`from_requirement_id`) REFERENCES `track_requirement` (`id`),
  CONSTRAINT `to_requirement_id_refs_id_5dd1ea8b` FOREIGN KEY (`to_requirement_id`) REFERENCES `track_requirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirement_requirement`
--

LOCK TABLES `track_requirement_requirement` WRITE;
/*!40000 ALTER TABLE `track_requirement_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_requirement_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_requirementack`
--

DROP TABLE IF EXISTS `track_requirementack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_requirementack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_requirementack_cc8ff3c` (`content_id`),
  CONSTRAINT `content_id_refs_id_203e63c7` FOREIGN KEY (`content_id`) REFERENCES `track_requirementcontent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementack`
--

LOCK TABLES `track_requirementack` WRITE;
/*!40000 ALTER TABLE `track_requirementack` DISABLE KEYS */;
INSERT INTO `track_requirementack` VALUES (1,'drafting',1,1),(2,'preparation',2,1),(3,'sign off',3,1),(4,'pending',4,1),(5,'delivered',5,1);
/*!40000 ALTER TABLE `track_requirementack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_requirementcontent`
--

DROP TABLE IF EXISTS `track_requirementcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_requirementcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementcontent`
--

LOCK TABLES `track_requirementcontent` WRITE;
/*!40000 ALTER TABLE `track_requirementcontent` DISABLE KEYS */;
INSERT INTO `track_requirementcontent` VALUES (1,'BRD',1),(2,'MRD',2),(3,'PRD',3);
/*!40000 ALTER TABLE `track_requirementcontent` ENABLE KEYS */;
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
  `ack_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_requirementhistory_57fc0019` (`editor_id`),
  KEY `track_requirementhistory_6657a0ce` (`requirement_id`),
  KEY `track_requirementhistory_1b2b653c` (`ack_id`),
  CONSTRAINT `ack_id_refs_id_3ac8cc54` FOREIGN KEY (`ack_id`) REFERENCES `track_requirementack` (`id`),
  CONSTRAINT `editor_id_refs_id_31127ef1` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `requirement_id_refs_id_12f0ca34` FOREIGN KEY (`requirement_id`) REFERENCES `track_requirement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementhistory`
--

LOCK TABLES `track_requirementhistory` WRITE;
/*!40000 ALTER TABLE `track_requirementhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_requirementhistory` ENABLE KEYS */;
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
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_requirementstatus_cc8ff3c` (`content_id`),
  CONSTRAINT `content_id_refs_id_3c1e7329` FOREIGN KEY (`content_id`) REFERENCES `track_requirementcontent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementstatus`
--

LOCK TABLES `track_requirementstatus` WRITE;
/*!40000 ALTER TABLE `track_requirementstatus` DISABLE KEYS */;
INSERT INTO `track_requirementstatus` VALUES (1,'on track',1,1),(2,'suspend',2,1),(3,'Delay',3,1),(4,'Cancel',4,1);
/*!40000 ALTER TABLE `track_requirementstatus` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_response`
--

LOCK TABLES `track_response` WRITE;
/*!40000 ALTER TABLE `track_response` DISABLE KEYS */;
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
  `due_date` datetime NOT NULL,
  `description` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_risk_7dce1e39` (`reporter_id`),
  KEY `track_risk_4aae3ce8` (`impact_id`),
  KEY `track_risk_3700f512` (`probability_id`),
  KEY `track_risk_2a158c61` (`response_id`),
  KEY `track_risk_44224078` (`status_id`),
  CONSTRAINT `impact_id_refs_id_6ce7a7fe` FOREIGN KEY (`impact_id`) REFERENCES `track_impact` (`id`),
  CONSTRAINT `probability_id_refs_id_492cd0dc` FOREIGN KEY (`probability_id`) REFERENCES `track_probability` (`id`),
  CONSTRAINT `reporter_id_refs_id_7eb817f3` FOREIGN KEY (`reporter_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `response_id_refs_id_e7d1f4b` FOREIGN KEY (`response_id`) REFERENCES `track_response` (`id`),
  CONSTRAINT `status_id_refs_id_70438081` FOREIGN KEY (`status_id`) REFERENCES `track_riskstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_risk`
--

LOCK TABLES `track_risk` WRITE;
/*!40000 ALTER TABLE `track_risk` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_riskstatus`
--

LOCK TABLES `track_riskstatus` WRITE;
/*!40000 ALTER TABLE `track_riskstatus` DISABLE KEYS */;
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
  CONSTRAINT `department_id_refs_id_11bbd463` FOREIGN KEY (`department_id`) REFERENCES `track_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `track_stakeholder_499df97c` (`project_id`),
  KEY `track_stakeholder_3ff842a6` (`section_id`),
  CONSTRAINT `project_id_refs_id_69448f88` FOREIGN KEY (`project_id`) REFERENCES `track_project` (`id`),
  CONSTRAINT `section_id_refs_id_74520166` FOREIGN KEY (`section_id`) REFERENCES `track_section` (`id`),
  CONSTRAINT `type_id_refs_id_5101f097` FOREIGN KEY (`type_id`) REFERENCES `track_stakeholdertype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_version`
--

LOCK TABLES `track_version` WRITE;
/*!40000 ALTER TABLE `track_version` DISABLE KEYS */;
INSERT INTO `track_version` VALUES (1,'V1.0',1),(2,'V2.0',2),(3,'v3.0',3),(4,'v4.0',4);
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

-- Dump completed on 2013-01-30 10:51:52
