-- MySQL dump 10.13  Distrib 5.5.29, for Linux (i686)
--
-- Host: localhost    Database: hlepm
-- ------------------------------------------------------
-- Server version	5.5.29

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
  KEY `attachments_attachment_1bb8f392` (`content_type_id`),
  KEY `attachments_attachment_685aee7` (`creator_id`),
  CONSTRAINT `content_type_id_refs_id_47e700fc` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `creator_id_refs_id_18da9e80` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(28,'Can add comment',10,'add_comment'),(29,'Can change comment',10,'change_comment'),(30,'Can delete comment',10,'delete_comment'),(31,'Can moderate comments',10,'can_moderate'),(32,'Can add comment flag',11,'add_commentflag'),(33,'Can change comment flag',11,'change_commentflag'),(34,'Can delete comment flag',11,'delete_commentflag'),(35,'Can add Threaded comment',12,'add_threadedcomment'),(36,'Can change Threaded comment',12,'change_threadedcomment'),(37,'Can delete Threaded comment',12,'delete_threadedcomment'),(38,'Can add migration history',13,'add_migrationhistory'),(39,'Can change migration history',13,'change_migrationhistory'),(40,'Can delete migration history',13,'delete_migrationhistory'),(41,'Can add product',14,'add_product'),(42,'Can change product',14,'change_product'),(43,'Can delete product',14,'delete_product'),(44,'Can add version',15,'add_version'),(45,'Can change version',15,'change_version'),(46,'Can delete version',15,'delete_version'),(47,'Can add impact',16,'add_impact'),(48,'Can change impact',16,'change_impact'),(49,'Can delete impact',16,'delete_impact'),(50,'Can add response',17,'add_response'),(51,'Can change response',17,'change_response'),(52,'Can delete response',17,'delete_response'),(53,'Can add probability',18,'add_probability'),(54,'Can change probability',18,'change_probability'),(55,'Can delete probability',18,'delete_probability'),(56,'Can add risk status',19,'add_riskstatus'),(57,'Can change risk status',19,'change_riskstatus'),(58,'Can delete risk status',19,'delete_riskstatus'),(59,'Can add risk',20,'add_risk'),(60,'Can change risk',20,'change_risk'),(61,'Can delete risk',20,'delete_risk'),(62,'Can add issue status',21,'add_issuestatus'),(63,'Can change issue status',21,'change_issuestatus'),(64,'Can delete issue status',21,'delete_issuestatus'),(65,'Can add priority',22,'add_priority'),(66,'Can change priority',22,'change_priority'),(67,'Can delete priority',22,'delete_priority'),(68,'Can add mitigation',23,'add_mitigation'),(69,'Can change mitigation',23,'change_mitigation'),(70,'Can delete mitigation',23,'delete_mitigation'),(71,'Can add issue',24,'add_issue'),(72,'Can change issue',24,'change_issue'),(73,'Can delete issue',24,'delete_issue'),(74,'Can add phase',25,'add_phase'),(75,'Can change phase',25,'change_phase'),(76,'Can delete phase',25,'delete_phase'),(77,'Can add project type',26,'add_projecttype'),(78,'Can change project type',26,'change_projecttype'),(79,'Can delete project type',26,'delete_projecttype'),(80,'Can add project status',27,'add_projectstatus'),(81,'Can change project status',27,'change_projectstatus'),(82,'Can delete project status',27,'delete_projectstatus'),(83,'Can add project owner',28,'add_projectowner'),(84,'Can change project owner',28,'change_projectowner'),(85,'Can delete project owner',28,'delete_projectowner'),(86,'Can add project',29,'add_project'),(87,'Can change project',29,'change_project'),(88,'Can delete project',29,'delete_project'),(89,'Can add member type',30,'add_membertype'),(90,'Can change member type',30,'change_membertype'),(91,'Can delete member type',30,'delete_membertype'),(92,'Can add member',31,'add_member'),(93,'Can change member',31,'change_member'),(94,'Can delete member',31,'delete_member'),(95,'Can add stakeholder type',32,'add_stakeholdertype'),(96,'Can change stakeholder type',32,'change_stakeholdertype'),(97,'Can delete stakeholder type',32,'delete_stakeholdertype'),(98,'Can add department',33,'add_department'),(99,'Can change department',33,'change_department'),(100,'Can delete department',33,'delete_department'),(101,'Can add section',34,'add_section'),(102,'Can change section',34,'change_section'),(103,'Can delete section',34,'delete_section'),(104,'Can add stakeholder',35,'add_stakeholder'),(105,'Can change stakeholder',35,'change_stakeholder'),(106,'Can delete stakeholder',35,'delete_stakeholder'),(107,'Can add project history',36,'add_projecthistory'),(108,'Can change project history',36,'change_projecthistory'),(109,'Can delete project history',36,'delete_projecthistory'),(110,'Can add requirement type',37,'add_requirementtype'),(111,'Can change requirement type',37,'change_requirementtype'),(112,'Can delete requirement type',37,'delete_requirementtype'),(113,'Can add requirement status',38,'add_requirementstatus'),(114,'Can change requirement status',38,'change_requirementstatus'),(115,'Can delete requirement status',38,'delete_requirementstatus'),(116,'Can add requirement owner',39,'add_requirementowner'),(117,'Can change requirement owner',39,'change_requirementowner'),(118,'Can delete requirement owner',39,'delete_requirementowner'),(119,'Can add requirement',40,'add_requirement'),(120,'Can change requirement',40,'change_requirement'),(121,'Can delete requirement',40,'delete_requirement'),(122,'Can add requirement history',41,'add_requirementhistory'),(123,'Can change requirement history',41,'change_requirementhistory'),(124,'Can delete requirement history',41,'delete_requirementhistory'),(125,'Can add attachment',42,'add_attachment'),(126,'Can change attachment',42,'change_attachment'),(127,'Can delete attachment',42,'delete_attachment'),(128,'Can delete foreign attachments',42,'delete_foreign_attachments'),(129,'Can add email template',43,'add_emailtemplate'),(130,'Can change email template',43,'change_emailtemplate'),(131,'Can delete email template',43,'delete_emailtemplate');
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
INSERT INTO `auth_user` VALUES (1,'weizhou','','','weizhou@redhat.com','pbkdf2_sha256$10000$DJ3vOMWqebWp$uQCykgT+rLczDRuVbOMoeUcRDfd5zTSIeqf9AKGUE54=',1,1,1,'2013-04-11 06:18:09','2013-04-11 06:17:30');
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
  CONSTRAINT `user_id_refs_id_603c4dcb` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `comment_id_refs_id_373a05f7` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(10,'comment','comments','comment'),(11,'comment flag','comments','commentflag'),(12,'Threaded comment','threadedcomments','threadedcomment'),(13,'migration history','south','migrationhistory'),(14,'product','track','product'),(15,'version','track','version'),(16,'impact','track','impact'),(17,'response','track','response'),(18,'probability','track','probability'),(19,'risk status','track','riskstatus'),(20,'risk','track','risk'),(21,'issue status','track','issuestatus'),(22,'priority','track','priority'),(23,'mitigation','track','mitigation'),(24,'issue','track','issue'),(25,'phase','track','phase'),(26,'project type','track','projecttype'),(27,'project status','track','projectstatus'),(28,'project owner','track','projectowner'),(29,'project','track','project'),(30,'member type','track','membertype'),(31,'member','track','member'),(32,'stakeholder type','track','stakeholdertype'),(33,'department','track','department'),(34,'section','track','section'),(35,'stakeholder','track','stakeholder'),(36,'project history','track','projecthistory'),(37,'requirement type','track','requirementtype'),(38,'requirement status','track','requirementstatus'),(39,'requirement owner','track','requirementowner'),(40,'requirement','track','requirement'),(41,'requirement history','track','requirementhistory'),(42,'attachment','attachments','attachment'),(43,'email template','remind','emailtemplate');
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
INSERT INTO `django_session` VALUES ('3ac0ef83a88cf6a89dfb67ed924b6be8','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-04-17 05:17:20'),('5fba8ab0e2d0c8474cbe4d90eda43897','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-04-11 09:49:10'),('76ee6fe5759f2898f0c43613dedbc605','ODc5MjU4OWNmMmQzZDNjODNiYmZjMGIzOWQzYmY4YTM1YzkwZjA2ZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-17 05:15:21'),('7a65969d848b958d62c3aefbfcd22a9d','ODc5MjU4OWNmMmQzZDNjODNiYmZjMGIzOWQzYmY4YTM1YzkwZjA2ZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-21 09:47:52'),('95727416e1311db51bca1dcf49b2f6b1','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-04-25 06:18:09'),('bd98704c7daa7cb0d0f0c1461fb842fb','N2ZhNmM1OTgyYTY4ZTk5NTg0MTc2MDc0YWZhMWJjODk1ZTQ1MmY1NzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2013-04-17 05:15:45'),('be9e4a129584b388798fa7c21d546542','ODc5MjU4OWNmMmQzZDNjODNiYmZjMGIzOWQzYmY4YTM1YzkwZjA2ZDqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2013-04-23 05:33:05');
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
-- Table structure for table `remind_emailtemplate`
--

DROP TABLE IF EXISTS `remind_emailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remind_emailtemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `from_email` varchar(100) DEFAULT NULL,
  `is_with_attachment` tinyint(1) NOT NULL,
  `is_enable` tinyint(1) NOT NULL,
  `update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `remind_emailtemplate_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_2401e604` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remind_emailtemplate`
--

LOCK TABLES `remind_emailtemplate` WRITE;
/*!40000 ALTER TABLE `remind_emailtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `remind_emailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remind_emailtemplate_cc_groups`
--

DROP TABLE IF EXISTS `remind_emailtemplate_cc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remind_emailtemplate_cc_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailtemplate_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailtemplate_id` (`emailtemplate_id`,`group_id`),
  KEY `remind_emailtemplate_cc_groups_1b7235d` (`emailtemplate_id`),
  KEY `remind_emailtemplate_cc_groups_425ae3c4` (`group_id`),
  CONSTRAINT `emailtemplate_id_refs_id_1ce1f53d` FOREIGN KEY (`emailtemplate_id`) REFERENCES `remind_emailtemplate` (`id`),
  CONSTRAINT `group_id_refs_id_36a1f65f` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remind_emailtemplate_cc_groups`
--

LOCK TABLES `remind_emailtemplate_cc_groups` WRITE;
/*!40000 ALTER TABLE `remind_emailtemplate_cc_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `remind_emailtemplate_cc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remind_emailtemplate_cc_users`
--

DROP TABLE IF EXISTS `remind_emailtemplate_cc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remind_emailtemplate_cc_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailtemplate_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailtemplate_id` (`emailtemplate_id`,`user_id`),
  KEY `remind_emailtemplate_cc_users_1b7235d` (`emailtemplate_id`),
  KEY `remind_emailtemplate_cc_users_403f60f` (`user_id`),
  CONSTRAINT `emailtemplate_id_refs_id_24cbfbb6` FOREIGN KEY (`emailtemplate_id`) REFERENCES `remind_emailtemplate` (`id`),
  CONSTRAINT `user_id_refs_id_43b3a87f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remind_emailtemplate_cc_users`
--

LOCK TABLES `remind_emailtemplate_cc_users` WRITE;
/*!40000 ALTER TABLE `remind_emailtemplate_cc_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `remind_emailtemplate_cc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remind_emailtemplate_to`
--

DROP TABLE IF EXISTS `remind_emailtemplate_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remind_emailtemplate_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailtemplate_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailtemplate_id` (`emailtemplate_id`,`user_id`),
  KEY `remind_emailtemplate_to_1b7235d` (`emailtemplate_id`),
  KEY `remind_emailtemplate_to_403f60f` (`user_id`),
  CONSTRAINT `emailtemplate_id_refs_id_1304a4ac` FOREIGN KEY (`emailtemplate_id`) REFERENCES `remind_emailtemplate` (`id`),
  CONSTRAINT `user_id_refs_id_63cddf89` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remind_emailtemplate_to`
--

LOCK TABLES `remind_emailtemplate_to` WRITE;
/*!40000 ALTER TABLE `remind_emailtemplate_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `remind_emailtemplate_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threadedcomments_comment`
--

DROP TABLE IF EXISTS `threadedcomments_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threadedcomments_comment` (
  `comment_ptr_id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `last_child_id` int(11) DEFAULT NULL,
  `tree_path` longtext NOT NULL,
  PRIMARY KEY (`comment_ptr_id`),
  KEY `threadedcomments_comment_tree_path` (`tree_path`(255)),
  KEY `threadedcomments_comment_63f17a16` (`parent_id`),
  KEY `threadedcomments_comment_2a9c59` (`last_child_id`),
  CONSTRAINT `comment_ptr_id_refs_id_5d19e31` FOREIGN KEY (`comment_ptr_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `last_child_id_refs_comment_ptr_id_2132847b` FOREIGN KEY (`last_child_id`) REFERENCES `threadedcomments_comment` (`comment_ptr_id`),
  CONSTRAINT `parent_id_refs_comment_ptr_id_2132847b` FOREIGN KEY (`parent_id`) REFERENCES `threadedcomments_comment` (`comment_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threadedcomments_comment`
--

LOCK TABLES `threadedcomments_comment` WRITE;
/*!40000 ALTER TABLE `threadedcomments_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `threadedcomments_comment` ENABLE KEYS */;
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
INSERT INTO `track_impact` VALUES (1,'High',1),(2,'Medium',2),(3,'Low',3);
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
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `impact_id` int(11) NOT NULL,
  `mitigation_id` int(11) NOT NULL,
  `priority_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `target_date` datetime DEFAULT NULL,
  `description` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_issue_1bb8f392` (`content_type_id`),
  KEY `track_issue_7dce1e39` (`reporter_id`),
  KEY `track_issue_4aae3ce8` (`impact_id`),
  KEY `track_issue_3657c425` (`mitigation_id`),
  KEY `track_issue_49ddf914` (`priority_id`),
  KEY `track_issue_44224078` (`status_id`),
  CONSTRAINT `impact_id_refs_id_3f76e141` FOREIGN KEY (`impact_id`) REFERENCES `track_impact` (`id`),
  CONSTRAINT `content_type_id_refs_id_2adfaa52` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `mitigation_id_refs_id_442a5786` FOREIGN KEY (`mitigation_id`) REFERENCES `track_mitigation` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_issuestatus`
--

LOCK TABLES `track_issuestatus` WRITE;
/*!40000 ALTER TABLE `track_issuestatus` DISABLE KEYS */;
INSERT INTO `track_issuestatus` VALUES (1,'Open',1),(2,'In Progress',2),(3,'Resolved',3),(4,'Reopened',4),(5,'Closed',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_mitigation`
--

LOCK TABLES `track_mitigation` WRITE;
/*!40000 ALTER TABLE `track_mitigation` DISABLE KEYS */;
INSERT INTO `track_mitigation` VALUES (1,'High',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_priority`
--

LOCK TABLES `track_priority` WRITE;
/*!40000 ALTER TABLE `track_priority` DISABLE KEYS */;
INSERT INTO `track_priority` VALUES (1,'Blocker',1),(2,'Critical',2),(3,'Major',3),(4,'Minor',4),(5,'Trivial',5);
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
INSERT INTO `track_probability` VALUES (1,'High',1),(2,'Medium',2),(3,'Low',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_product`
--

LOCK TABLES `track_product` WRITE;
/*!40000 ALTER TABLE `track_product` DISABLE KEYS */;
INSERT INTO `track_product` VALUES (1,'product360'),(2,'authenticity'),(3,'treasury'),(4,'portal'),(5,'cantas'),(6,'Vault'),(7,'Conflux'),(8,'Beaker'),(9,'Bugzillar'),(10,'Errata Tool'),(11,'Newspaper');
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
  CONSTRAINT `type_id_refs_id_5c7b97fd` FOREIGN KEY (`type_id`) REFERENCES `track_projecttype` (`id`),
  CONSTRAINT `owner_id_refs_id_255337cd` FOREIGN KEY (`owner_id`) REFERENCES `track_projectowner` (`id`),
  CONSTRAINT `product_id_refs_id_76cc094f` FOREIGN KEY (`product_id`) REFERENCES `track_product` (`id`),
  CONSTRAINT `project_manager_id_refs_id_66449006` FOREIGN KEY (`project_manager_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `requirement_id_refs_id_234990b1` FOREIGN KEY (`requirement_id`) REFERENCES `track_requirement` (`id`),
  CONSTRAINT `status_id_refs_id_6a02e75` FOREIGN KEY (`status_id`) REFERENCES `track_projectstatus` (`id`),
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
  CONSTRAINT `type_id_refs_id_46463764` FOREIGN KEY (`type_id`) REFERENCES `track_projecttype` (`id`),
  CONSTRAINT `editor_id_refs_id_609c6cf3` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `project_id_refs_id_680bbb28` FOREIGN KEY (`project_id`) REFERENCES `track_project` (`id`)
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
  `name` varchar(64) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `target_date` datetime DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `version_id` int(11) DEFAULT NULL,
  `update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `track_requirement_337b96ff` (`author_id`),
  KEY `track_requirement_777d41c8` (`type_id`),
  KEY `track_requirement_44224078` (`status_id`),
  KEY `track_requirement_5d52dd10` (`owner_id`),
  KEY `track_requirement_44bdf3ee` (`product_id`),
  KEY `track_requirement_10f4f63` (`version_id`),
  CONSTRAINT `type_id_refs_id_4101bef1` FOREIGN KEY (`type_id`) REFERENCES `track_requirementtype` (`id`),
  CONSTRAINT `author_id_refs_id_1aa8ead8` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `owner_id_refs_id_74729d27` FOREIGN KEY (`owner_id`) REFERENCES `track_requirementowner` (`id`),
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
-- Table structure for table `track_requirementhistory`
--

DROP TABLE IF EXISTS `track_requirementhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_requirementhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `editor_id` int(11) NOT NULL,
  `requirement_id` int(11) NOT NULL,
  `before_owner_id` int(11) NOT NULL,
  `after_owner_id` int(11) NOT NULL,
  `add_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_requirementhistory_57fc0019` (`editor_id`),
  KEY `track_requirementhistory_6657a0ce` (`requirement_id`),
  KEY `track_requirementhistory_62825951` (`before_owner_id`),
  KEY `track_requirementhistory_676d76ab` (`after_owner_id`),
  CONSTRAINT `editor_id_refs_id_31127ef1` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `after_owner_id_refs_id_50c219d0` FOREIGN KEY (`after_owner_id`) REFERENCES `track_requirementowner` (`id`),
  CONSTRAINT `before_owner_id_refs_id_50c219d0` FOREIGN KEY (`before_owner_id`) REFERENCES `track_requirementowner` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementowner`
--

LOCK TABLES `track_requirementowner` WRITE;
/*!40000 ALTER TABLE `track_requirementowner` DISABLE KEYS */;
INSERT INTO `track_requirementowner` VALUES (1,'Open',1,1),(2,'PM',2,1),(3,'EIP',3,1),(4,'Closed',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_requirementstatus`
--

LOCK TABLES `track_requirementstatus` WRITE;
/*!40000 ALTER TABLE `track_requirementstatus` DISABLE KEYS */;
INSERT INTO `track_requirementstatus` VALUES (1,'on track',1,1),(2,'suspend',2,1),(3,'Delayed',3,1),(4,'Cancel',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_response`
--

LOCK TABLES `track_response` WRITE;
/*!40000 ALTER TABLE `track_response` DISABLE KEYS */;
INSERT INTO `track_response` VALUES (1,'Avoid',1),(2,'Transfer',2),(3,'Mitigate',3),(4,'Accept',4);
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
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `impact_id` int(11) NOT NULL,
  `probability_id` int(11) NOT NULL,
  `response_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `target_date` datetime DEFAULT NULL,
  `description` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_risk_1bb8f392` (`content_type_id`),
  KEY `track_risk_7dce1e39` (`reporter_id`),
  KEY `track_risk_4aae3ce8` (`impact_id`),
  KEY `track_risk_3700f512` (`probability_id`),
  KEY `track_risk_2a158c61` (`response_id`),
  KEY `track_risk_44224078` (`status_id`),
  CONSTRAINT `impact_id_refs_id_6ce7a7fe` FOREIGN KEY (`impact_id`) REFERENCES `track_impact` (`id`),
  CONSTRAINT `content_type_id_refs_id_5202accf` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_riskstatus`
--

LOCK TABLES `track_riskstatus` WRITE;
/*!40000 ALTER TABLE `track_riskstatus` DISABLE KEYS */;
INSERT INTO `track_riskstatus` VALUES (1,'Open',1),(2,'In Progress',2),(3,'Resolved',3),(4,'Reopened',4),(5,'Closed',5);
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

-- Dump completed on 2013-04-11 14:33:20
