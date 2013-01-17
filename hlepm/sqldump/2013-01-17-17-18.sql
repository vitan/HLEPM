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
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add product',9,'add_product'),(26,'Can change product',9,'change_product'),(27,'Can delete product',9,'delete_product'),(28,'Can add requirement content',10,'add_requirementcontent'),(29,'Can change requirement content',10,'change_requirementcontent'),(30,'Can delete requirement content',10,'delete_requirementcontent'),(31,'Can add requirement status',11,'add_requirementstatus'),(32,'Can change requirement status',11,'change_requirementstatus'),(33,'Can delete requirement status',11,'delete_requirementstatus'),(34,'Can add requirement ack',12,'add_requirementack'),(35,'Can change requirement ack',12,'change_requirementack'),(36,'Can delete requirement ack',12,'delete_requirementack'),(37,'Can add version',13,'add_version'),(38,'Can change version',13,'change_version'),(39,'Can delete version',13,'delete_version'),(40,'Can add requirement',14,'add_requirement'),(41,'Can change requirement',14,'change_requirement'),(42,'Can delete requirement',14,'delete_requirement'),(43,'Can add project type',15,'add_projecttype'),(44,'Can change project type',15,'change_projecttype'),(45,'Can delete project type',15,'delete_projecttype'),(46,'Can add project status',16,'add_projectstatus'),(47,'Can change project status',16,'change_projectstatus'),(48,'Can delete project status',16,'delete_projectstatus'),(49,'Can add project ack',17,'add_projectack'),(50,'Can change project ack',17,'change_projectack'),(51,'Can delete project ack',17,'delete_projectack'),(52,'Can add project',18,'add_project'),(53,'Can change project',18,'change_project'),(54,'Can delete project',18,'delete_project'),(55,'Can add member type',19,'add_membertype'),(56,'Can change member type',19,'change_membertype'),(57,'Can delete member type',19,'delete_membertype'),(58,'Can add member',20,'add_member'),(59,'Can change member',20,'change_member'),(60,'Can delete member',20,'delete_member'),(61,'Can add stakeholder type',21,'add_stakeholdertype'),(62,'Can change stakeholder type',21,'change_stakeholdertype'),(63,'Can delete stakeholder type',21,'delete_stakeholdertype'),(64,'Can add department',22,'add_department'),(65,'Can change department',22,'change_department'),(66,'Can delete department',22,'delete_department'),(67,'Can add section',23,'add_section'),(68,'Can change section',23,'change_section'),(69,'Can delete section',23,'delete_section'),(70,'Can add stakeholder',24,'add_stakeholder'),(71,'Can change stakeholder',24,'change_stakeholder'),(72,'Can delete stakeholder',24,'delete_stakeholder'),(73,'Can add impact',25,'add_impact'),(74,'Can change impact',25,'change_impact'),(75,'Can delete impact',25,'delete_impact'),(76,'Can add response',26,'add_response'),(77,'Can change response',26,'change_response'),(78,'Can delete response',26,'delete_response'),(79,'Can add priority',27,'add_priority'),(80,'Can change priority',27,'change_priority'),(81,'Can delete priority',27,'delete_priority'),(82,'Can add probability',28,'add_probability'),(83,'Can change probability',28,'change_probability'),(84,'Can delete probability',28,'delete_probability'),(85,'Can add risk status',29,'add_riskstatus'),(86,'Can change risk status',29,'change_riskstatus'),(87,'Can delete risk status',29,'delete_riskstatus'),(88,'Can add risk',30,'add_risk'),(89,'Can change risk',30,'change_risk'),(90,'Can delete risk',30,'delete_risk'),(91,'Can add issue status',31,'add_issuestatus'),(92,'Can change issue status',31,'change_issuestatus'),(93,'Can delete issue status',31,'delete_issuestatus'),(94,'Can add issue',32,'add_issue'),(95,'Can change issue',32,'change_issue'),(96,'Can delete issue',32,'delete_issue'),(97,'Can add requirement history',33,'add_requirementhistory'),(98,'Can change requirement history',33,'change_requirementhistory'),(99,'Can delete requirement history',33,'delete_requirementhistory'),(100,'Can add project history',34,'add_projecthistory'),(101,'Can change project history',34,'change_projecthistory'),(102,'Can delete project history',34,'delete_projecthistory');
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
INSERT INTO `auth_user` VALUES (1,'admin','','','weizhou@redhat.com','sha1$875e8$d29da61a9bd4776f45826b78ea8825148f183bc8',1,1,1,'2013-01-17 03:09:42','2013-01-17 02:52:29');
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
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-01-17 03:01:32',1,13,'1','Version - V1.0',1,''),(2,'2013-01-17 03:02:37',1,13,'2','Version - V2.0',1,''),(3,'2013-01-17 03:02:47',1,13,'2','Version - V3.0',2,'Changed name and order.'),(4,'2013-01-17 03:02:59',1,13,'2','Version - V4.0',2,'Changed name and order.'),(5,'2013-01-17 03:03:07',1,13,'3','Version - V2.0',1,''),(6,'2013-01-17 03:03:30',1,13,'4','Version - V3.0',1,''),(7,'2013-01-17 03:07:44',1,22,'1','Department - R&D',1,''),(8,'2013-01-17 03:08:07',1,22,'2','Department - ESO',1,''),(9,'2013-01-17 03:08:21',1,22,'3','Department - Marketing BU\'s',1,''),(10,'2013-01-17 03:09:58',1,23,'1','Section - Cloud',1,''),(11,'2013-01-17 03:10:11',1,23,'2','Section - Middleware',1,''),(12,'2013-01-17 03:10:26',1,23,'3','Section - OpenShift',1,'');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'product','track','product'),(10,'requirement content','track','requirementcontent'),(11,'requirement status','track','requirementstatus'),(12,'requirement ack','track','requirementack'),(13,'version','track','version'),(14,'requirement','track','requirement'),(15,'project type','track','projecttype'),(16,'project status','track','projectstatus'),(17,'project ack','track','projectack'),(18,'project','track','project'),(19,'member type','track','membertype'),(20,'member','track','member'),(21,'stakeholder type','track','stakeholdertype'),(22,'department','track','department'),(23,'section','track','section'),(24,'stakeholder','track','stakeholder'),(25,'impact','track','impact'),(26,'response','track','response'),(27,'priority','track','priority'),(28,'probability','track','probability'),(29,'risk status','track','riskstatus'),(30,'risk','track','risk'),(31,'issue status','track','issuestatus'),(32,'issue','track','issue'),(33,'requirement history','track','requirementhistory'),(34,'project history','track','projecthistory');
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
INSERT INTO `django_session` VALUES ('36becef9654af2fd0df8b14fd2d87e02','ODk2NDRjMDBhMmIxNjYwYTFjMWRhYjcxOGNmZjFjYWVmYWE4YmJkZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-01-31 03:09:42'),('a0387b663ba32e77cff4d95b3f4aaca3','ODk2NDRjMDBhMmIxNjYwYTFjMWRhYjcxOGNmZjFjYWVmYWE4YmJkZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-01-31 02:53:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_department`
--

LOCK TABLES `track_department` WRITE;
/*!40000 ALTER TABLE `track_department` DISABLE KEYS */;
INSERT INTO `track_department` VALUES (1,'R&D'),(2,'ESO'),(3,'Marketing BU\'s');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_product`
--

LOCK TABLES `track_product` WRITE;
/*!40000 ALTER TABLE `track_product` DISABLE KEYS */;
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
  CONSTRAINT `version_id_refs_id_5eafa822` FOREIGN KEY (`version_id`) REFERENCES `track_version` (`id`),
  CONSTRAINT `ack_id_refs_id_d09aabb` FOREIGN KEY (`ack_id`) REFERENCES `track_projectack` (`id`),
  CONSTRAINT `product_id_refs_id_76cc094f` FOREIGN KEY (`product_id`) REFERENCES `track_product` (`id`),
  CONSTRAINT `project_manager_id_refs_id_66449006` FOREIGN KEY (`project_manager_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `requirement_id_refs_id_234990b1` FOREIGN KEY (`requirement_id`) REFERENCES `track_requirement` (`id`),
  CONSTRAINT `status_id_refs_id_6a02e75` FOREIGN KEY (`status_id`) REFERENCES `track_projectstatus` (`id`),
  CONSTRAINT `type_id_refs_id_5c7b97fd` FOREIGN KEY (`type_id`) REFERENCES `track_projecttype` (`id`)
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
  CONSTRAINT `project_id_refs_id_680bbb28` FOREIGN KEY (`project_id`) REFERENCES `track_project` (`id`),
  CONSTRAINT `editor_id_refs_id_609c6cf3` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`),
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
  CONSTRAINT `version_id_refs_id_1adb3050` FOREIGN KEY (`version_id`) REFERENCES `track_version` (`id`),
  CONSTRAINT `ack_id_refs_id_fe44663` FOREIGN KEY (`ack_id`) REFERENCES `track_requirementack` (`id`),
  CONSTRAINT `author_id_refs_id_1aa8ead8` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_id_refs_id_28edda99` FOREIGN KEY (`content_id`) REFERENCES `track_requirementcontent` (`id`),
  CONSTRAINT `product_id_refs_id_76d7a27d` FOREIGN KEY (`product_id`) REFERENCES `track_product` (`id`),
  CONSTRAINT `status_id_refs_id_2611672d` FOREIGN KEY (`status_id`) REFERENCES `track_requirementstatus` (`id`)
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
  CONSTRAINT `to_requirement_id_refs_id_5dd1ea8b` FOREIGN KEY (`to_requirement_id`) REFERENCES `track_requirement` (`id`),
  CONSTRAINT `from_requirement_id_refs_id_5dd1ea8b` FOREIGN KEY (`from_requirement_id`) REFERENCES `track_requirement` (`id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementack`
--

LOCK TABLES `track_requirementack` WRITE;
/*!40000 ALTER TABLE `track_requirementack` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementcontent`
--

LOCK TABLES `track_requirementcontent` WRITE;
/*!40000 ALTER TABLE `track_requirementcontent` DISABLE KEYS */;
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
  CONSTRAINT `requirement_id_refs_id_12f0ca34` FOREIGN KEY (`requirement_id`) REFERENCES `track_requirement` (`id`),
  CONSTRAINT `ack_id_refs_id_3ac8cc54` FOREIGN KEY (`ack_id`) REFERENCES `track_requirementack` (`id`),
  CONSTRAINT `editor_id_refs_id_31127ef1` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementstatus`
--

LOCK TABLES `track_requirementstatus` WRITE;
/*!40000 ALTER TABLE `track_requirementstatus` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_section`
--

LOCK TABLES `track_section` WRITE;
/*!40000 ALTER TABLE `track_section` DISABLE KEYS */;
INSERT INTO `track_section` VALUES (1,'Cloud',1),(2,'Middleware',1),(3,'OpenShift',1);
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
  CONSTRAINT `section_id_refs_id_74520166` FOREIGN KEY (`section_id`) REFERENCES `track_section` (`id`),
  CONSTRAINT `project_id_refs_id_69448f88` FOREIGN KEY (`project_id`) REFERENCES `track_project` (`id`),
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
INSERT INTO `track_version` VALUES (1,'V1.0',1),(2,'V4.0',4),(3,'V2.0',2),(4,'V3.0',3);
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

-- Dump completed on 2013-01-17 17:19:17
