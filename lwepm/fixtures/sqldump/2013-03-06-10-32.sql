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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HLEPM_email_purpose`
--

LOCK TABLES `HLEPM_email_purpose` WRITE;
/*!40000 ALTER TABLE `HLEPM_email_purpose` DISABLE KEYS */;
/*!40000 ALTER TABLE `HLEPM_email_purpose` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add comment',8,'add_comment'),(23,'Can change comment',8,'change_comment'),(24,'Can delete comment',8,'delete_comment'),(25,'Can moderate comments',8,'can_moderate'),(26,'Can add comment flag',9,'add_commentflag'),(27,'Can change comment flag',9,'change_commentflag'),(28,'Can delete comment flag',9,'delete_commentflag'),(29,'Can add product',10,'add_product'),(30,'Can change product',10,'change_product'),(31,'Can delete product',10,'delete_product'),(35,'Can add requirement status',12,'add_requirementstatus'),(36,'Can change requirement status',12,'change_requirementstatus'),(37,'Can delete requirement status',12,'delete_requirementstatus'),(38,'Can add requirement owner',13,'add_requirementowner'),(39,'Can change requirement owner',13,'change_requirementowner'),(40,'Can delete requirement owner',13,'delete_requirementowner'),(41,'Can add version',14,'add_version'),(42,'Can change version',14,'change_version'),(43,'Can delete version',14,'delete_version'),(44,'Can add requirement',15,'add_requirement'),(45,'Can change requirement',15,'change_requirement'),(46,'Can delete requirement',15,'delete_requirement'),(47,'Can add phase',16,'add_phase'),(48,'Can change phase',16,'change_phase'),(49,'Can delete phase',16,'delete_phase'),(50,'Can add project type',17,'add_projecttype'),(51,'Can change project type',17,'change_projecttype'),(52,'Can delete project type',17,'delete_projecttype'),(53,'Can add project status',18,'add_projectstatus'),(54,'Can change project status',18,'change_projectstatus'),(55,'Can delete project status',18,'delete_projectstatus'),(56,'Can add project owner',19,'add_projectowner'),(57,'Can change project owner',19,'change_projectowner'),(58,'Can delete project owner',19,'delete_projectowner'),(59,'Can add project',20,'add_project'),(60,'Can change project',20,'change_project'),(61,'Can delete project',20,'delete_project'),(62,'Can add member type',21,'add_membertype'),(63,'Can change member type',21,'change_membertype'),(64,'Can delete member type',21,'delete_membertype'),(65,'Can add member',22,'add_member'),(66,'Can change member',22,'change_member'),(67,'Can delete member',22,'delete_member'),(68,'Can add stakeholder type',23,'add_stakeholdertype'),(69,'Can change stakeholder type',23,'change_stakeholdertype'),(70,'Can delete stakeholder type',23,'delete_stakeholdertype'),(71,'Can add department',24,'add_department'),(72,'Can change department',24,'change_department'),(73,'Can delete department',24,'delete_department'),(74,'Can add section',25,'add_section'),(75,'Can change section',25,'change_section'),(76,'Can delete section',25,'delete_section'),(77,'Can add stakeholder',26,'add_stakeholder'),(78,'Can change stakeholder',26,'change_stakeholder'),(79,'Can delete stakeholder',26,'delete_stakeholder'),(80,'Can add impact',27,'add_impact'),(81,'Can change impact',27,'change_impact'),(82,'Can delete impact',27,'delete_impact'),(83,'Can add response',28,'add_response'),(84,'Can change response',28,'change_response'),(85,'Can delete response',28,'delete_response'),(86,'Can add priority',29,'add_priority'),(87,'Can change priority',29,'change_priority'),(88,'Can delete priority',29,'delete_priority'),(89,'Can add probability',30,'add_probability'),(90,'Can change probability',30,'change_probability'),(91,'Can delete probability',30,'delete_probability'),(92,'Can add risk status',31,'add_riskstatus'),(93,'Can change risk status',31,'change_riskstatus'),(94,'Can delete risk status',31,'delete_riskstatus'),(95,'Can add risk',32,'add_risk'),(96,'Can change risk',32,'change_risk'),(97,'Can delete risk',32,'delete_risk'),(98,'Can add issue status',33,'add_issuestatus'),(99,'Can change issue status',33,'change_issuestatus'),(100,'Can delete issue status',33,'delete_issuestatus'),(101,'Can add issue',34,'add_issue'),(102,'Can change issue',34,'change_issue'),(103,'Can delete issue',34,'delete_issue'),(104,'Can add requirement history',35,'add_requirementhistory'),(105,'Can change requirement history',35,'change_requirementhistory'),(106,'Can delete requirement history',35,'delete_requirementhistory'),(107,'Can add project history',36,'add_projecthistory'),(108,'Can change project history',36,'change_projecthistory'),(109,'Can delete project history',36,'delete_projecthistory'),(110,'Can add email purpose',37,'add_emailpurpose'),(111,'Can change email purpose',37,'change_emailpurpose'),(112,'Can delete email purpose',37,'delete_emailpurpose'),(113,'Can add email templates',38,'add_emailtemplates'),(114,'Can change email templates',38,'change_emailtemplates'),(115,'Can delete email templates',38,'delete_emailtemplates'),(116,'Can add migration history',39,'add_migrationhistory'),(117,'Can change migration history',39,'change_migrationhistory'),(118,'Can delete migration history',39,'delete_migrationhistory'),(119,'Can add requirement type',40,'add_requirementtype'),(120,'Can change requirement type',40,'change_requirementtype'),(121,'Can delete requirement type',40,'delete_requirementtype');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','weizhou@redhat.com','pbkdf2_sha256$10000$6l0SiWkb6JVu$pW6WNaW9UMNmXvXk0Lf4vQQJwxbz5g51VCLvJI9zf3c=',1,1,1,'2013-03-04 09:31:09','2013-01-30 08:45:48'),(2,'docai','','','','pbkdf2_sha256$10000$8S2UC7IwJcdF$aKHWSiaSJXDBhTZm0atwzS5IEv6AHZ6O0u7zPLfW7cs=',0,1,0,'2013-03-05 07:31:47','2013-03-05 07:31:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-01-30 09:16:37',1,10,'1','tcms',1,''),(2,'2013-01-30 09:16:48',1,10,'2','product360',1,''),(3,'2013-01-30 09:17:45',1,10,'3','authenticity',1,''),(4,'2013-01-30 09:18:03',1,14,'1','v1.0',1,''),(5,'2013-01-30 09:18:13',1,14,'2','v2.0',1,''),(6,'2013-01-30 09:18:21',1,14,'3','v3.0',1,''),(7,'2013-01-30 09:18:30',1,14,'4','v4.0',1,''),(11,'2013-01-30 09:21:34',1,13,'1','Owner-1',1,''),(12,'2013-01-30 09:21:57',1,13,'1','Drafting',2,'Changed name.'),(13,'2013-01-30 09:22:14',1,13,'2','preparation',1,''),(14,'2013-01-30 09:22:28',1,13,'3','sign off',1,''),(15,'2013-01-30 09:22:39',1,13,'4','pending',1,''),(16,'2013-01-30 09:22:52',1,13,'5','delivered',1,''),(17,'2013-01-30 09:23:11',1,12,'1','Open',1,''),(18,'2013-01-30 09:23:26',1,12,'2','Delayed',1,''),(19,'2013-02-16 07:36:30',1,40,'1','BRD',1,''),(20,'2013-02-16 07:37:50',1,40,'2','MRD',1,''),(21,'2013-02-16 07:38:02',1,40,'3','PRD',1,''),(22,'2013-03-05 03:08:58',1,27,'1','high',1,''),(23,'2013-03-05 03:09:06',1,27,'2','middle',1,''),(24,'2013-03-05 03:10:14',1,27,'3','low',1,''),(25,'2013-03-05 03:15:37',1,28,'1','high',1,''),(26,'2013-03-05 03:15:43',1,28,'2','middle',1,''),(27,'2013-03-05 03:15:48',1,28,'3','low',1,''),(28,'2013-03-05 03:19:21',1,30,'1','high',1,''),(29,'2013-03-05 03:19:30',1,30,'2','middle',1,''),(30,'2013-03-05 03:19:36',1,30,'3','low',1,''),(31,'2013-03-05 03:22:19',1,31,'1','high',1,''),(32,'2013-03-05 03:22:27',1,31,'2','middle',1,''),(33,'2013-03-05 03:22:33',1,31,'3','low',1,''),(34,'2013-03-05 07:31:47',1,3,'2','docai',1,''),(35,'2013-03-05 07:31:52',1,3,'2','docai',2,'Changed password.'),(36,'2013-03-05 08:20:00',1,32,'7','docai',1,''),(37,'2013-03-05 08:20:18',1,32,'4','admin',3,''),(38,'2013-03-05 08:20:18',1,32,'3','admin',3,''),(39,'2013-03-05 08:20:18',1,32,'2','admin',3,''),(40,'2013-03-05 08:20:18',1,32,'7','docai',3,''),(41,'2013-03-05 08:20:18',1,32,'1','docai',3,''),(42,'2013-03-05 09:32:25',1,32,'9','admin',3,''),(43,'2013-03-05 09:32:25',1,32,'8','admin',3,''),(44,'2013-03-05 09:32:25',1,32,'12','docai',3,''),(45,'2013-03-05 09:32:25',1,32,'11','docai',3,''),(46,'2013-03-05 09:32:25',1,32,'10','docai',3,''),(47,'2013-03-05 09:42:10',1,32,'13','admin',3,''),(48,'2013-03-05 09:57:07',1,32,'15','admin',3,''),(49,'2013-03-05 09:57:07',1,32,'14','admin',3,''),(50,'2013-03-05 09:57:07',1,32,'16','docai',3,''),(51,'2013-03-05 10:10:38',1,32,'18','docai',3,''),(52,'2013-03-05 10:10:38',1,32,'17','docai',3,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'comment','comments','comment'),(9,'comment flag','comments','commentflag'),(10,'product','track','product'),(12,'requirement status','track','requirementstatus'),(13,'requirement owner','track','requirementowner'),(14,'version','track','version'),(15,'requirement','track','requirement'),(16,'phase','track','phase'),(17,'project type','track','projecttype'),(18,'project status','track','projectstatus'),(19,'project owner','track','projectowner'),(20,'project','track','project'),(21,'member type','track','membertype'),(22,'member','track','member'),(23,'stakeholder type','track','stakeholdertype'),(24,'department','track','department'),(25,'section','track','section'),(26,'stakeholder','track','stakeholder'),(27,'impact','track','impact'),(28,'response','track','response'),(29,'priority','track','priority'),(30,'probability','track','probability'),(31,'risk status','track','riskstatus'),(32,'risk','track','risk'),(33,'issue status','track','issuestatus'),(34,'issue','track','issue'),(35,'requirement history','track','requirementhistory'),(36,'project history','track','projecthistory'),(37,'email purpose','remind','emailpurpose'),(38,'email templates','remind','emailtemplates'),(39,'migration history','south','migrationhistory'),(40,'requirement type','track','requirementtype');
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
INSERT INTO `django_session` VALUES ('3c5344c32a610bb0f5bfff8ec515e124','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-03-02 07:37:44'),('6fc05b5315bd47d48dee20296166b69a','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-03-18 09:28:03'),('9bcafa222393e48d295e6f76d51736a7','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-02-13 09:16:30'),('b13cb6d407cb0f2daa7007d9339cd1dc','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-02-13 08:48:48'),('da10a01eddfe14c6b5d0bd78d71026a3','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-03-18 09:31:09'),('f3f9a376db64df9a4407875b71871a4e','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-03-02 02:28:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'track','0001_initial','2013-01-30 08:52:27'),(2,'track','0002_auto__del_field_requirement_name','2013-02-16 06:42:07'),(3,'track','0003_auto__del_requirementcontent__add_requirementtype__del_field_requireme','2013-02-16 07:35:07'),(4,'track','0004_auto__chg_field_requirement_target_date__chg_field_requirement_start_d','2013-02-16 07:51:32'),(5,'track','0005_auto__del_field_risk_due_date__add_field_risk_target_date','2013-03-06 02:30:07');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_impact`
--

LOCK TABLES `track_impact` WRITE;
/*!40000 ALTER TABLE `track_impact` DISABLE KEYS */;
INSERT INTO `track_impact` VALUES (1,'high',1),(2,'middle',2),(3,'low',3);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_probability`
--

LOCK TABLES `track_probability` WRITE;
/*!40000 ALTER TABLE `track_probability` DISABLE KEYS */;
INSERT INTO `track_probability` VALUES (1,'high',1),(2,'middle',2),(3,'low',3);
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
INSERT INTO `track_product` VALUES (1,'tcms'),(2,'product360'),(3,'authenticity');
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
  KEY `track_project_44bdf3ee` (`product_id`),
  KEY `track_project_6657a0ce` (`requirement_id`),
  KEY `track_project_10f4f63` (`version_id`),
  KEY `track_project_44224078` (`status_id`),
  KEY `track_project_5d52dd10` (`owner_id`),
  KEY `track_project_55a6607c` (`project_manager_id`),
  KEY `track_project_777d41c8` (`type_id`),
  CONSTRAINT `owner_id_refs_id_255337cd` FOREIGN KEY (`owner_id`) REFERENCES `track_projectowner` (`id`),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
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
  `author_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `target_date` datetime DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `version_id` int(11) DEFAULT NULL,
  `update` datetime NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_requirement_337b96ff` (`author_id`),
  KEY `track_requirement_44224078` (`status_id`),
  KEY `track_requirement_5d52dd10` (`owner_id`),
  KEY `track_requirement_44bdf3ee` (`product_id`),
  KEY `track_requirement_10f4f63` (`version_id`),
  KEY `track_requirement_777d41c8` (`type_id`),
  CONSTRAINT `author_id_refs_id_1aa8ead8` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `owner_id_refs_id_74729d27` FOREIGN KEY (`owner_id`) REFERENCES `track_requirementowner` (`id`),
  CONSTRAINT `product_id_refs_id_76d7a27d` FOREIGN KEY (`product_id`) REFERENCES `track_product` (`id`),
  CONSTRAINT `status_id_refs_id_2611672d` FOREIGN KEY (`status_id`) REFERENCES `track_requirementstatus` (`id`),
  CONSTRAINT `type_id_refs_id_4101bef1` FOREIGN KEY (`type_id`) REFERENCES `track_requirementtype` (`id`),
  CONSTRAINT `version_id_refs_id_1adb3050` FOREIGN KEY (`version_id`) REFERENCES `track_version` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirement`
--

LOCK TABLES `track_requirement` WRITE;
/*!40000 ALTER TABLE `track_requirement` DISABLE KEYS */;
INSERT INTO `track_requirement` VALUES (1,1,NULL,NULL,1,1,1,2,'2013-02-16 07:51:48',1),(2,1,NULL,NULL,1,1,1,1,'2013-02-16 08:03:04',1),(3,1,'2013-02-16 06:00:00','2013-02-21 06:00:00',1,1,1,1,'2013-02-16 08:08:50',1),(4,1,'2013-02-16 06:00:00','2013-02-26 06:00:00',1,1,1,1,'2013-02-16 08:18:04',1),(5,1,'2013-02-16 06:00:00','2013-02-26 06:00:00',1,1,1,1,'2013-02-16 08:19:57',1),(6,1,'2013-02-16 06:00:00','2013-02-26 06:00:00',1,1,1,1,'2013-02-16 08:20:59',1),(7,1,'2013-02-16 06:00:00','2013-02-26 06:00:00',1,1,1,1,'2013-02-16 08:29:46',1),(8,1,'2013-02-16 06:00:00','2013-02-26 06:00:00',1,1,1,1,'2013-02-16 09:01:36',2),(9,1,'2013-02-15 06:00:00','2013-02-19 06:00:00',1,1,1,3,'2013-02-16 09:13:55',2);
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
  KEY `track_requirementhistory_57fc0019` (`editor_id`),
  KEY `track_requirementhistory_6657a0ce` (`requirement_id`),
  KEY `track_requirementhistory_5d52dd10` (`owner_id`),
  CONSTRAINT `editor_id_refs_id_31127ef1` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `owner_id_refs_id_50c219d0` FOREIGN KEY (`owner_id`) REFERENCES `track_requirementowner` (`id`),
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
  CONSTRAINT `type_id_refs_id_6470541d` FOREIGN KEY (`type_id`) REFERENCES `track_requirementtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementowner`
--

LOCK TABLES `track_requirementowner` WRITE;
/*!40000 ALTER TABLE `track_requirementowner` DISABLE KEYS */;
INSERT INTO `track_requirementowner` VALUES (1,'Drafting',1,0),(2,'preparation',2,0),(3,'sign off',3,0),(4,'pending',4,0),(5,'delivered',5,0);
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
  CONSTRAINT `type_id_refs_id_55a58961` FOREIGN KEY (`type_id`) REFERENCES `track_requirementtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementstatus`
--

LOCK TABLES `track_requirementstatus` WRITE;
/*!40000 ALTER TABLE `track_requirementstatus` DISABLE KEYS */;
INSERT INTO `track_requirementstatus` VALUES (1,'Open',1,0),(2,'Delayed',2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementtype`
--

LOCK TABLES `track_requirementtype` WRITE;
/*!40000 ALTER TABLE `track_requirementtype` DISABLE KEYS */;
INSERT INTO `track_requirementtype` VALUES (1,'BRD',1),(2,'MRD',2),(3,'PRD',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_response`
--

LOCK TABLES `track_response` WRITE;
/*!40000 ALTER TABLE `track_response` DISABLE KEYS */;
INSERT INTO `track_response` VALUES (1,'high',1),(2,'middle',2),(3,'low',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_risk`
--

LOCK TABLES `track_risk` WRITE;
/*!40000 ALTER TABLE `track_risk` DISABLE KEYS */;
INSERT INTO `track_risk` VALUES (19,2,1,1,1,1,'2013-03-05 06:00:00','aaadcdde','2013-03-09 06:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_riskstatus`
--

LOCK TABLES `track_riskstatus` WRITE;
/*!40000 ALTER TABLE `track_riskstatus` DISABLE KEYS */;
INSERT INTO `track_riskstatus` VALUES (1,'high',1),(2,'middle',2),(3,'low',3);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_version`
--

LOCK TABLES `track_version` WRITE;
/*!40000 ALTER TABLE `track_version` DISABLE KEYS */;
INSERT INTO `track_version` VALUES (1,'v1.0',1),(2,'v2.0',2),(3,'v3.0',3),(4,'v4.0',4);
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

-- Dump completed on 2013-03-06 10:32:43
