-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: medical
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app1_department`
--

DROP TABLE IF EXISTS `app1_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app1_department` (
  `deptid` int NOT NULL AUTO_INCREMENT,
  `deptname` varchar(255) NOT NULL,
  `deptdesc` longtext NOT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app1_department`
--

LOCK TABLES `app1_department` WRITE;
/*!40000 ALTER TABLE `app1_department` DISABLE KEYS */;
INSERT INTO `app1_department` VALUES (1,'Cardiology','The cardiology department at our clinic provides expert care for heart health, offering advanced diagnostics, compassionate treatment, and personalized wellness plans for optimal cardiovascular well-being.'),(2,'Dental','Our dental department offers comprehensive oral care with state-of-the-art diagnostics and personalized treatments. Experience expert dental services, from routine check-ups to specialized procedures, ensuring your optimal oral health.');
/*!40000 ALTER TABLE `app1_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app1_doctor`
--

DROP TABLE IF EXISTS `app1_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app1_doctor` (
  `did` int NOT NULL AUTO_INCREMENT,
  `dname` varchar(150) NOT NULL,
  `dqua` varchar(255) NOT NULL,
  `aboutdoc` longtext NOT NULL,
  `dspec` varchar(255) NOT NULL,
  `dept_id` int NOT NULL,
  PRIMARY KEY (`did`),
  KEY `app1_doctor_dept_id_83ebc278_fk_app1_department_deptid` (`dept_id`),
  CONSTRAINT `app1_doctor_dept_id_83ebc278_fk_app1_department_deptid` FOREIGN KEY (`dept_id`) REFERENCES `app1_department` (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app1_doctor`
--

LOCK TABLES `app1_doctor` WRITE;
/*!40000 ALTER TABLE `app1_doctor` DISABLE KEYS */;
INSERT INTO `app1_doctor` VALUES (1,'S Basu','MBBS,MD','A Good Doctor','Cardiology',1),(2,'I. Das','BDS','sibidbdlvjwdvnw','Dental',2);
/*!40000 ALTER TABLE `app1_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app1_pataient`
--

DROP TABLE IF EXISTS `app1_pataient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app1_pataient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `age` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app1_pataient`
--

LOCK TABLES `app1_pataient` WRITE;
/*!40000 ALTER TABLE `app1_pataient` DISABLE KEYS */;
INSERT INTO `app1_pataient` VALUES (1,'pbkdf2_sha256$600000$HPeeGPBxvTT0Zf0r0YvDMq$vRtMNkXVTWN/s6Nfu8w/e5POQ2Xy710qgEBN7v3Qrys=','2024-01-12 07:21:50.239899',0,'ayanbari','Ayaan','Bari','ayaanbari@gmail.com',0,1,'2024-01-12 06:21:06.560691','Male','96649761994','21'),(2,'pbkdf2_sha256$600000$Tzi7d44yoHxkkKV1o5ADD3$XQLpSd1SpWtexlvELU979McjVzP2buHfG5+/00jXO3E=',NULL,0,'abc','Ayaan','Bari','ayanbari@gmail.com',0,1,'2024-01-12 06:30:06.406340','Male','9664976199','21'),(3,'pbkdf2_sha256$600000$vsAxi5vdqO7sVQJT3N0jZK$iqWo2luguulAhvQpp7okSzioOlYkgOS4r5hcl9WeCN0=','2024-01-12 07:04:43.836317',1,'admin','','','admin@gmail.com',1,1,'2024-01-12 07:04:13.654853','','','');
/*!40000 ALTER TABLE `app1_pataient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app1_pataient_groups`
--

DROP TABLE IF EXISTS `app1_pataient_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app1_pataient_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pataient_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app1_pataient_groups_pataient_id_group_id_63485230_uniq` (`pataient_id`,`group_id`),
  KEY `app1_pataient_groups_group_id_0bbdacb2_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app1_pataient_groups_group_id_0bbdacb2_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app1_pataient_groups_pataient_id_2a4f0c8b_fk_app1_pataient_id` FOREIGN KEY (`pataient_id`) REFERENCES `app1_pataient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app1_pataient_groups`
--

LOCK TABLES `app1_pataient_groups` WRITE;
/*!40000 ALTER TABLE `app1_pataient_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app1_pataient_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app1_pataient_user_permissions`
--

DROP TABLE IF EXISTS `app1_pataient_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app1_pataient_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pataient_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app1_pataient_user_permi_pataient_id_permission_i_7c3fe1a8_uniq` (`pataient_id`,`permission_id`),
  KEY `app1_pataient_user_p_permission_id_f223e2b5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app1_pataient_user_p_pataient_id_97981ca9_fk_app1_pata` FOREIGN KEY (`pataient_id`) REFERENCES `app1_pataient` (`id`),
  CONSTRAINT `app1_pataient_user_p_permission_id_f223e2b5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app1_pataient_user_permissions`
--

LOCK TABLES `app1_pataient_user_permissions` WRITE;
/*!40000 ALTER TABLE `app1_pataient_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app1_pataient_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app1_schedule`
--

DROP TABLE IF EXISTS `app1_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app1_schedule` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `days` varchar(200) NOT NULL,
  `t_slot` varchar(200) NOT NULL,
  `noofpp` varchar(2) NOT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `app1_schedule_doctor_id_e0d2da95_fk_app1_doctor_did` (`doctor_id`),
  CONSTRAINT `app1_schedule_doctor_id_e0d2da95_fk_app1_doctor_did` FOREIGN KEY (`doctor_id`) REFERENCES `app1_doctor` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app1_schedule`
--

LOCK TABLES `app1_schedule` WRITE;
/*!40000 ALTER TABLE `app1_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `app1_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add doctor',1,'add_doctor'),(2,'Can change doctor',1,'change_doctor'),(3,'Can delete doctor',1,'delete_doctor'),(4,'Can view doctor',1,'view_doctor'),(5,'Can add schedule',2,'add_schedule'),(6,'Can change schedule',2,'change_schedule'),(7,'Can delete schedule',2,'delete_schedule'),(8,'Can view schedule',2,'view_schedule'),(9,'Can add user',3,'add_pataient'),(10,'Can change user',3,'change_pataient'),(11,'Can delete user',3,'delete_pataient'),(12,'Can view user',3,'view_pataient'),(13,'Can add log entry',4,'add_logentry'),(14,'Can change log entry',4,'change_logentry'),(15,'Can delete log entry',4,'delete_logentry'),(16,'Can view log entry',4,'view_logentry'),(17,'Can add permission',5,'add_permission'),(18,'Can change permission',5,'change_permission'),(19,'Can delete permission',5,'delete_permission'),(20,'Can view permission',5,'view_permission'),(21,'Can add group',6,'add_group'),(22,'Can change group',6,'change_group'),(23,'Can delete group',6,'delete_group'),(24,'Can view group',6,'view_group'),(25,'Can add content type',7,'add_contenttype'),(26,'Can change content type',7,'change_contenttype'),(27,'Can delete content type',7,'delete_contenttype'),(28,'Can view content type',7,'view_contenttype'),(29,'Can add session',8,'add_session'),(30,'Can change session',8,'change_session'),(31,'Can delete session',8,'delete_session'),(32,'Can view session',8,'view_session'),(33,'Can add department',9,'add_department'),(34,'Can change department',9,'change_department'),(35,'Can delete department',9,'delete_department'),(36,'Can view department',9,'view_department');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app1_pataient_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app1_pataient_id` FOREIGN KEY (`user_id`) REFERENCES `app1_pataient` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-01-12 07:07:23.219906','1','Department object (1)',1,'[{\"added\": {}}]',9,3),(2,'2024-01-12 07:08:18.948234','2','Department object (2)',1,'[{\"added\": {}}]',9,3),(3,'2024-01-12 07:15:48.099749','1','Doctor object (1)',1,'[{\"added\": {}}]',1,3),(4,'2024-01-12 07:17:30.233676','2','Doctor object (2)',1,'[{\"added\": {}}]',1,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (4,'admin','logentry'),(9,'app1','department'),(1,'app1','doctor'),(3,'app1','pataient'),(2,'app1','schedule'),(6,'auth','group'),(5,'auth','permission'),(7,'contenttypes','contenttype'),(8,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-12 05:43:28.988827'),(2,'contenttypes','0002_remove_content_type_name','2024-01-12 05:43:29.022824'),(3,'auth','0001_initial','2024-01-12 05:43:29.193284'),(4,'auth','0002_alter_permission_name_max_length','2024-01-12 05:43:29.231963'),(5,'auth','0003_alter_user_email_max_length','2024-01-12 05:43:29.238182'),(6,'auth','0004_alter_user_username_opts','2024-01-12 05:43:29.243554'),(7,'auth','0005_alter_user_last_login_null','2024-01-12 05:43:29.250216'),(8,'auth','0006_require_contenttypes_0002','2024-01-12 05:43:29.254343'),(9,'auth','0007_alter_validators_add_error_messages','2024-01-12 05:43:29.260834'),(10,'auth','0008_alter_user_username_max_length','2024-01-12 05:43:29.266753'),(11,'auth','0009_alter_user_last_name_max_length','2024-01-12 05:43:29.274162'),(12,'auth','0010_alter_group_name_max_length','2024-01-12 05:43:29.287438'),(13,'auth','0011_update_proxy_permissions','2024-01-12 05:43:29.295600'),(14,'auth','0012_alter_user_first_name_max_length','2024-01-12 05:43:29.302321'),(15,'app1','0001_initial','2024-01-12 05:43:29.541628'),(16,'admin','0001_initial','2024-01-12 05:43:29.626225'),(17,'admin','0002_logentry_remove_auto_add','2024-01-12 05:43:29.653785'),(18,'admin','0003_logentry_add_action_flag_choices','2024-01-12 05:43:29.660761'),(19,'sessions','0001_initial','2024-01-12 05:43:29.686506'),(20,'app1','0002_department_alter_pataient_gender_doctor_dept','2024-01-12 07:01:52.196326');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('73b8ee8nb5fc394jhrdu0ozlr6b7fpas','.eJxVjDsOwjAQBe_iGll2VusPJT1nsNa7BgeQI8VJhbg7iZQC2jcz760SrUtNay9zGkWdlVWn3y0TP0vbgTyo3SfNU1vmMetd0Qft-jpJeV0O9--gUq9bnYNH4uzAAgALgHVcKCDHcDOInlAiDkOMxbsSCKJBE_LGjQRvmNTnC9L6N1E:1rOBrS:0bVhJkN_kd_fYOTJhbLoz2sKxffmZiSX47gZx9BGvrw','2024-01-26 07:21:50.242426');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-13 19:34:03
