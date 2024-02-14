-- MySQL dump 10.13  Distrib 5.7.36, for Linux (x86_64)
--
-- Host: localhost    Database: db_andimar
-- ------------------------------------------------------
-- Server version	5.7.36

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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Vendedor');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (9,1,85),(10,1,86),(11,1,88),(2,1,97),(3,1,98),(4,1,99),(5,1,100),(6,1,117),(7,1,118),(8,1,119),(1,1,128);
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Rol',6,'add_role'),(22,'Can change Rol',6,'change_role'),(23,'Can delete Rol',6,'delete_role'),(24,'Can view Rol',6,'view_role'),(25,'Can add user',7,'add_customuser'),(26,'Can change user',7,'change_customuser'),(27,'Can delete user',7,'delete_customuser'),(28,'Can view user',7,'view_customuser'),(29,'Can add Prestación de bus',8,'add_benefit'),(30,'Can change Prestación de bus',8,'change_benefit'),(31,'Can delete Prestación de bus',8,'delete_benefit'),(32,'Can view Prestación de bus',8,'view_benefit'),(33,'Can add Bus',9,'add_bus'),(34,'Can change Bus',9,'change_bus'),(35,'Can delete Bus',9,'delete_bus'),(36,'Can view Bus',9,'view_bus'),(37,'Can add Tipo de asiento',10,'add_seattype'),(38,'Can change Tipo de asiento',10,'change_seattype'),(39,'Can delete Tipo de asiento',10,'delete_seattype'),(40,'Can view Tipo de asiento',10,'view_seattype'),(41,'Can add Disposición en bus',11,'add_layout'),(42,'Can change Disposición en bus',11,'change_layout'),(43,'Can delete Disposición en bus',11,'delete_layout'),(44,'Can view Disposición en bus',11,'view_layout'),(45,'Can add Piso',12,'add_floor'),(46,'Can change Piso',12,'change_floor'),(47,'Can delete Piso',12,'delete_floor'),(48,'Can view Piso',12,'view_floor'),(49,'Can add Componente',13,'add_component'),(50,'Can change Componente',13,'change_component'),(51,'Can delete Componente',13,'delete_component'),(52,'Can view Componente',13,'view_component'),(53,'Can add Asiento',14,'add_seat'),(54,'Can change Asiento',14,'change_seat'),(55,'Can delete Asiento',14,'delete_seat'),(56,'Can view Asiento',14,'view_seat'),(57,'Can add Motivo',15,'add_motive'),(58,'Can change Motivo',15,'change_motive'),(59,'Can delete Motivo',15,'delete_motive'),(60,'Can view Motivo',15,'view_motive'),(61,'Can add Personal',16,'add_personal'),(62,'Can change Personal',16,'change_personal'),(63,'Can delete Personal',16,'delete_personal'),(64,'Can view Personal',16,'view_personal'),(65,'Can add Cargo',17,'add_position'),(66,'Can change Cargo',17,'change_position'),(67,'Can delete Cargo',17,'delete_position'),(68,'Can view Cargo',17,'view_position'),(69,'Can add personal position',18,'add_personalposition'),(70,'Can change personal position',18,'change_personalposition'),(71,'Can delete personal position',18,'delete_personalposition'),(72,'Can view personal position',18,'view_personalposition'),(73,'Can add personal motive',19,'add_personalmotive'),(74,'Can change personal motive',19,'change_personalmotive'),(75,'Can delete personal motive',19,'delete_personalmotive'),(76,'Can view personal motive',19,'view_personalmotive'),(77,'Can add Comisión',20,'add_commission'),(78,'Can change Comisión',20,'change_commission'),(79,'Can delete Comisión',20,'delete_commission'),(80,'Can view Comisión',20,'view_commission'),(81,'Can add Región',21,'add_region'),(82,'Can change Región',21,'change_region'),(83,'Can delete Región',21,'delete_region'),(84,'Can view Región',21,'view_region'),(85,'Can add Tarifa',22,'add_routestretchrate'),(86,'Can change Tarifa',22,'change_routestretchrate'),(87,'Can delete Tarifa',22,'delete_routestretchrate'),(88,'Can view Tarifa',22,'view_routestretchrate'),(89,'Can add Venta',23,'add_sale'),(90,'Can change Venta',23,'change_sale'),(91,'Can delete Venta',23,'delete_sale'),(92,'Can view Venta',23,'view_sale'),(93,'Can add Servicio',24,'add_service'),(94,'Can change Servicio',24,'change_service'),(95,'Can delete Servicio',24,'delete_service'),(96,'Can view Servicio',24,'view_service'),(97,'Can add Tipo de tarifa',25,'add_ratetype'),(98,'Can change Tipo de tarifa',25,'change_ratetype'),(99,'Can delete Tipo de tarifa',25,'delete_ratetype'),(100,'Can view Tipo de tarifa',25,'view_ratetype'),(101,'Can add Boleto',26,'add_ticket'),(102,'Can change Boleto',26,'change_ticket'),(103,'Can delete Boleto',26,'delete_ticket'),(104,'Can view Boleto',26,'view_ticket'),(105,'Can add Tramo',27,'add_masterroutestretch'),(106,'Can change Tramo',27,'change_masterroutestretch'),(107,'Can delete Tramo',27,'delete_masterroutestretch'),(108,'Can view Tramo',27,'view_masterroutestretch'),(109,'Can add route stretch',28,'add_routestretch'),(110,'Can change route stretch',28,'change_routestretch'),(111,'Can delete route stretch',28,'delete_routestretch'),(112,'Can view route stretch',28,'view_routestretch'),(113,'Can add master route stretch rate',29,'add_masterroutestretchrate'),(114,'Can change master route stretch rate',29,'change_masterroutestretchrate'),(115,'Can delete master route stretch rate',29,'delete_masterroutestretchrate'),(116,'Can view master route stretch rate',29,'view_masterroutestretchrate'),(117,'Can add Pasajeo',30,'add_passenger'),(118,'Can change Pasajeo',30,'change_passenger'),(119,'Can delete Pasajeo',30,'delete_passenger'),(120,'Can view Pasajeo',30,'view_passenger'),(121,'Can add Ruta maestra',31,'add_masterroute'),(122,'Can change Ruta maestra',31,'change_masterroute'),(123,'Can delete Ruta maestra',31,'delete_masterroute'),(124,'Can view Ruta maestra',31,'view_masterroute'),(125,'Can add Ruta',32,'add_route'),(126,'Can change Ruta',32,'change_route'),(127,'Can delete Ruta',32,'delete_route'),(128,'Can view Ruta',32,'view_route'),(129,'Can add Ciudad',33,'add_city'),(130,'Can change Ciudad',33,'change_city'),(131,'Can delete Ciudad',33,'delete_city'),(132,'Can view Ciudad',33,'view_city'),(133,'Can add Sucursal',34,'add_branch'),(134,'Can change Sucursal',34,'change_branch'),(135,'Can delete Sucursal',34,'delete_branch'),(136,'Can view Sucursal',34,'view_branch'),(137,'Can add Parada de bus',35,'add_busstop'),(138,'Can change Parada de bus',35,'change_busstop'),(139,'Can delete Parada de bus',35,'delete_busstop'),(140,'Can view Parada de bus',35,'view_busstop'),(141,'Can add Caja',36,'add_cashregister'),(142,'Can change Caja',36,'change_cashregister'),(143,'Can delete Caja',36,'delete_cashregister'),(144,'Can view Caja',36,'view_cashregister'),(145,'Can add Log de comisión',37,'add_commissionlog'),(146,'Can change Log de comisión',37,'change_commissionlog'),(147,'Can delete Log de comisión',37,'delete_commissionlog'),(148,'Can view Log de comisión',37,'view_commissionlog'),(149,'Can add Mapa de ruta maestra',38,'add_masterroutemap'),(150,'Can change Mapa de ruta maestra',38,'change_masterroutemap'),(151,'Can delete Mapa de ruta maestra',38,'delete_masterroutemap'),(152,'Can view Mapa de ruta maestra',38,'view_masterroutemap'),(153,'Can add Mapa de ruta',39,'add_routemap'),(154,'Can change Mapa de ruta',39,'change_routemap'),(155,'Can delete Mapa de ruta',39,'delete_routemap'),(156,'Can view Mapa de ruta',39,'view_routemap'),(157,'Can add Nacionalidad del pasajero',40,'add_passengernationality'),(158,'Can change Nacionalidad del pasajero',40,'change_passengernationality'),(159,'Can delete Nacionalidad del pasajero',40,'delete_passengernationality'),(160,'Can view Nacionalidad del pasajero',40,'view_passengernationality');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_cashregister`
--

DROP TABLE IF EXISTS `core_cashregister`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_cashregister` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` varchar(9) NOT NULL,
  `created` datetime(6) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `cashier_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_cashregister_branch_id_b5f8b045_fk_locations_branch_id` (`branch_id`),
  KEY `core_cashregister_cashier_id_2d509ab7_fk_crew_personal_user_id` (`cashier_id`),
  CONSTRAINT `core_cashregister_branch_id_b5f8b045_fk_locations_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `locations_branch` (`id`),
  CONSTRAINT `core_cashregister_cashier_id_2d509ab7_fk_crew_personal_user_id` FOREIGN KEY (`cashier_id`) REFERENCES `crew_personal` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_cashregister`
--

LOCK TABLES `core_cashregister` WRITE;
/*!40000 ALTER TABLE `core_cashregister` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_cashregister` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_masterroute`
--

DROP TABLE IF EXISTS `core_masterroute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_masterroute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_masterroute`
--

LOCK TABLES `core_masterroute` WRITE;
/*!40000 ALTER TABLE `core_masterroute` DISABLE KEYS */;
INSERT INTO `core_masterroute` VALUES (2,'','COP-OVA-SCL',1),(3,'','Pichilemu - Santiago',1),(4,'','Santiago - Pichilemu',1),(5,'','Santiago - Valdivia',1),(6,'','SCL-OVA-COP',1),(7,'','VALD- TCO- ANF',1),(8,'','Valdivia  - Santiago',1),(9,'001','prueba01 - prueba2',1),(10,'string','string',1),(11,'string','string',1),(12,'string','string',1);
/*!40000 ALTER TABLE `core_masterroute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_masterroutemap`
--

DROP TABLE IF EXISTS `core_masterroutemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_masterroutemap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `bus_stop_id` bigint(20) NOT NULL,
  `master_route_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique bus stop in master route` (`master_route_id`,`bus_stop_id`),
  KEY `core_masterroutemap_bus_stop_id_8bf21d3d_fk_locations_busstop_id` (`bus_stop_id`),
  CONSTRAINT `core_masterroutemap_bus_stop_id_8bf21d3d_fk_locations_busstop_id` FOREIGN KEY (`bus_stop_id`) REFERENCES `locations_busstop` (`id`),
  CONSTRAINT `core_masterroutemap_master_route_id_1b70d59e_fk_core_mast` FOREIGN KEY (`master_route_id`) REFERENCES `core_masterroute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_masterroutemap`
--

LOCK TABLES `core_masterroutemap` WRITE;
/*!40000 ALTER TABLE `core_masterroutemap` DISABLE KEYS */;
INSERT INTO `core_masterroutemap` VALUES (16,1,1,1,2),(17,2,1,7,2),(18,3,1,11,2),(19,4,1,20,2),(20,5,1,40,2),(21,6,1,51,2),(22,1,1,68,3),(23,2,1,67,3),(24,3,1,51,3),(25,1,1,51,4),(26,2,1,67,4),(27,3,1,68,4),(28,1,1,51,5),(29,2,1,52,5),(30,3,1,60,5),(31,4,1,87,5),(32,5,1,108,5),(33,6,1,118,5),(34,1,1,51,6),(35,2,1,40,6),(36,3,1,20,6),(37,4,1,7,6),(38,5,1,1,6),(39,1,1,118,7),(40,2,1,69,7),(41,3,1,109,7),(42,4,1,68,7),(43,5,1,77,7),(44,6,1,88,7),(45,7,1,70,7),(46,8,1,60,7),(47,9,1,52,7),(48,10,1,51,7),(49,11,1,22,7),(50,12,1,20,7),(51,13,1,11,7),(52,14,1,7,7),(53,15,1,1,7),(54,1,1,118,8),(55,2,1,109,8),(56,3,1,51,8),(57,4,1,52,8),(58,1,1,8,9),(59,2,1,11,9);
/*!40000 ALTER TABLE `core_masterroutemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_masterroutestretch`
--

DROP TABLE IF EXISTS `core_masterroutestretch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_masterroutestretch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `duration` time(6) DEFAULT NULL,
  `distance` decimal(7,3) DEFAULT NULL,
  `end_bus_stop_id` bigint(20) NOT NULL,
  `master_route_id` bigint(20) NOT NULL,
  `start_bus_stop_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_masterroutestre_end_bus_stop_id_a687e258_fk_locations` (`end_bus_stop_id`),
  KEY `core_masterroutestre_master_route_id_db5b2204_fk_core_mast` (`master_route_id`),
  KEY `core_masterroutestre_start_bus_stop_id_bfdcc509_fk_locations` (`start_bus_stop_id`),
  CONSTRAINT `core_masterroutestre_end_bus_stop_id_a687e258_fk_locations` FOREIGN KEY (`end_bus_stop_id`) REFERENCES `locations_busstop` (`id`),
  CONSTRAINT `core_masterroutestre_master_route_id_db5b2204_fk_core_mast` FOREIGN KEY (`master_route_id`) REFERENCES `core_masterroute` (`id`),
  CONSTRAINT `core_masterroutestre_start_bus_stop_id_bfdcc509_fk_locations` FOREIGN KEY (`start_bus_stop_id`) REFERENCES `locations_busstop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_masterroutestretch`
--

LOCK TABLES `core_masterroutestretch` WRITE;
/*!40000 ALTER TABLE `core_masterroutestretch` DISABLE KEYS */;
INSERT INTO `core_masterroutestretch` VALUES (15,1,'00:00:00.000000',0.000,7,2,1),(16,2,'00:00:00.000000',0.000,11,2,7),(17,3,'00:00:00.000000',0.000,20,2,11),(18,4,'00:00:00.000000',0.000,40,2,20),(19,5,'00:00:00.000000',0.000,51,2,40),(20,1,'00:00:00.000000',0.000,67,3,68),(21,2,'00:00:00.000000',0.000,51,3,67),(22,1,'00:00:00.000000',0.000,67,4,51),(23,2,'00:00:00.000000',0.000,68,4,67),(24,1,'00:00:00.000000',0.000,52,5,51),(25,2,'00:00:00.000000',0.000,60,5,52),(26,3,'00:00:00.000000',0.000,87,5,60),(27,4,'00:00:00.000000',0.000,108,5,87),(28,5,'00:00:00.000000',0.000,118,5,108),(29,1,'00:00:00.000000',0.000,40,6,51),(30,2,'00:00:00.000000',0.000,20,6,40),(31,3,'00:00:00.000000',0.000,7,6,20),(32,4,'00:00:00.000000',0.000,1,6,7),(33,1,'00:00:00.000000',0.000,69,7,118),(34,2,'00:00:00.000000',0.000,109,7,69),(35,3,'00:00:00.000000',0.000,68,7,109),(36,4,'00:00:00.000000',0.000,77,7,68),(37,5,'00:00:00.000000',0.000,88,7,77),(38,6,'00:00:00.000000',0.000,70,7,88),(39,7,'00:00:00.000000',0.000,60,7,70),(40,8,'00:00:00.000000',0.000,52,7,60),(41,9,'00:00:00.000000',0.000,51,7,52),(42,10,'00:00:00.000000',0.000,22,7,51),(43,11,'00:00:00.000000',0.000,20,7,22),(44,12,'00:00:00.000000',0.000,11,7,20),(45,13,'00:00:00.000000',0.000,7,7,11),(46,14,'00:00:00.000000',0.000,1,7,7),(47,1,'00:00:00.000000',0.000,109,8,118),(48,2,'00:00:00.000000',0.000,51,8,109),(49,3,'00:00:00.000000',0.000,52,8,51),(50,0,'12:00:00.000000',10.000,16,9,8);
/*!40000 ALTER TABLE `core_masterroutestretch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_masterroutestretchrate`
--

DROP TABLE IF EXISTS `core_masterroutestretchrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_masterroutestretchrate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) DEFAULT NULL,
  `master_route_stretch_id` bigint(20) NOT NULL,
  `seat_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_masterroutestre_master_route_stretch_4eccbe29_fk_core_mast` (`master_route_stretch_id`),
  KEY `core_masterroutestre_seat_type_id_e168f844_fk_transport` (`seat_type_id`),
  CONSTRAINT `core_masterroutestre_master_route_stretch_4eccbe29_fk_core_mast` FOREIGN KEY (`master_route_stretch_id`) REFERENCES `core_masterroutestretch` (`id`),
  CONSTRAINT `core_masterroutestre_seat_type_id_e168f844_fk_transport` FOREIGN KEY (`seat_type_id`) REFERENCES `transportation_seattype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_masterroutestretchrate`
--

LOCK TABLES `core_masterroutestretchrate` WRITE;
/*!40000 ALTER TABLE `core_masterroutestretchrate` DISABLE KEYS */;
INSERT INTO `core_masterroutestretchrate` VALUES (29,500.00,15,1),(30,500.00,15,2),(31,500.00,16,1),(32,500.00,16,2),(33,500.00,17,1),(34,500.00,17,2),(35,500.00,18,1),(36,500.00,18,2),(37,500.00,19,1),(38,500.00,19,2),(39,500.00,20,1),(40,500.00,20,2),(41,500.00,21,1),(42,500.00,21,2),(43,500.00,22,1),(44,500.00,22,2),(45,500.00,23,1),(46,500.00,23,2),(47,500.00,24,1),(48,500.00,24,2),(49,500.00,25,1),(50,500.00,25,2),(51,500.00,26,1),(52,500.00,26,2),(53,500.00,27,1),(54,500.00,27,2),(55,500.00,28,1),(56,500.00,28,2),(57,500.00,29,1),(58,500.00,29,2),(59,500.00,30,1),(60,500.00,30,2),(61,500.00,31,1),(62,500.00,31,2),(63,500.00,32,1),(64,500.00,32,2),(65,500.00,33,1),(66,500.00,33,2),(67,500.00,34,1),(68,500.00,34,2),(69,500.00,35,1),(70,500.00,35,2),(71,500.00,36,1),(72,500.00,36,2),(73,500.00,37,1),(74,500.00,37,2),(75,500.00,38,1),(76,500.00,38,2),(77,500.00,39,1),(78,500.00,39,2),(79,500.00,40,1),(80,500.00,40,2),(81,500.00,41,1),(82,500.00,41,2),(83,500.00,42,1),(84,500.00,42,2),(85,500.00,43,1),(86,500.00,43,2),(87,500.00,44,1),(88,500.00,44,2),(89,500.00,45,1),(90,500.00,45,2),(91,500.00,46,1),(92,500.00,46,2),(93,500.00,47,1),(94,500.00,47,2),(95,500.00,48,1),(96,500.00,48,2),(97,500.00,49,1),(98,500.00,49,2);
/*!40000 ALTER TABLE `core_masterroutestretchrate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_passenger`
--

DROP TABLE IF EXISTS `core_passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_passenger` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `document_number` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `document_type` varchar(5) NOT NULL,
  `nationality_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_passenger_nationality_id_778ebf08_fk_core_pass` (`nationality_id`),
  CONSTRAINT `core_passenger_nationality_id_778ebf08_fk_core_pass` FOREIGN KEY (`nationality_id`) REFERENCES `core_passengernationality` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_passenger`
--

LOCK TABLES `core_passenger` WRITE;
/*!40000 ALTER TABLE `core_passenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_passengernationality`
--

DROP TABLE IF EXISTS `core_passengernationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_passengernationality` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_passengernationality`
--

LOCK TABLES `core_passengernationality` WRITE;
/*!40000 ALTER TABLE `core_passengernationality` DISABLE KEYS */;
INSERT INTO `core_passengernationality` VALUES (1,'CHI','Chile'),(2,'ARG','Argentina'),(3,'BOL','Bolivia'),(4,'PER','Peru'),(5,'COL','Colombia'),(6,'BRA','BRASIL'),(7,'BRA','BRASIL'),(8,'BRA','BRASIL'),(9,'BRA','BRASIL'),(10,'PAR','Paraguay'),(11,'URU','Uruguay'),(12,'ECU','Ecuador'),(13,'MEX','Mexico'),(14,'VEN','Venezuela'),(15,'OTR','Otro');
/*!40000 ALTER TABLE `core_passengernationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_ratetype`
--

DROP TABLE IF EXISTS `core_ratetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_ratetype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `time_start` time(6) NOT NULL,
  `time_end` time(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_ratetype`
--

LOCK TABLES `core_ratetype` WRITE;
/*!40000 ALTER TABLE `core_ratetype` DISABLE KEYS */;
INSERT INTO `core_ratetype` VALUES (1,'Nocturnas','00:36:14.000000','06:00:00.000000'),(2,'Diurno','06:00:00.000000','18:00:00.000000');
/*!40000 ALTER TABLE `core_ratetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_route`
--

DROP TABLE IF EXISTS `core_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_route` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `master_route_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_route_master_route_id_567f5b82_fk_core_masterroute_id` (`master_route_id`),
  CONSTRAINT `core_route_master_route_id_567f5b82_fk_core_masterroute_id` FOREIGN KEY (`master_route_id`) REFERENCES `core_masterroute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_route`
--

LOCK TABLES `core_route` WRITE;
/*!40000 ALTER TABLE `core_route` DISABLE KEYS */;
INSERT INTO `core_route` VALUES (1,'01','Antofagasta --> Santiago',1,4),(3,'001','Rancagua --> Copiapo',1,9);
/*!40000 ALTER TABLE `core_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_routemap`
--

DROP TABLE IF EXISTS `core_routemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_routemap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `bus_stop_id` bigint(20) NOT NULL,
  `route_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique bus stop in route` (`route_id`,`bus_stop_id`),
  KEY `core_routemap_bus_stop_id_dae2da21_fk_locations_busstop_id` (`bus_stop_id`),
  CONSTRAINT `core_routemap_bus_stop_id_dae2da21_fk_locations_busstop_id` FOREIGN KEY (`bus_stop_id`) REFERENCES `locations_busstop` (`id`),
  CONSTRAINT `core_routemap_route_id_e6509321_fk_core_route_id` FOREIGN KEY (`route_id`) REFERENCES `core_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_routemap`
--

LOCK TABLES `core_routemap` WRITE;
/*!40000 ALTER TABLE `core_routemap` DISABLE KEYS */;
INSERT INTO `core_routemap` VALUES (1,0,1,5,1),(2,0,1,20,1),(3,0,1,1,1),(4,0,1,53,1),(7,0,1,63,3),(9,0,1,8,3);
/*!40000 ALTER TABLE `core_routemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_routestretch`
--

DROP TABLE IF EXISTS `core_routestretch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_routestretch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `master_route_stretch_id` bigint(20) NOT NULL,
  `route_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_routestretch_master_route_stretch_50f30622_fk_core_mast` (`master_route_stretch_id`),
  KEY `core_routestretch_route_id_b85f4b3f_fk_core_route_id` (`route_id`),
  CONSTRAINT `core_routestretch_master_route_stretch_50f30622_fk_core_mast` FOREIGN KEY (`master_route_stretch_id`) REFERENCES `core_masterroutestretch` (`id`),
  CONSTRAINT `core_routestretch_route_id_b85f4b3f_fk_core_route_id` FOREIGN KEY (`route_id`) REFERENCES `core_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_routestretch`
--

LOCK TABLES `core_routestretch` WRITE;
/*!40000 ALTER TABLE `core_routestretch` DISABLE KEYS */;
INSERT INTO `core_routestretch` VALUES (2,1,15,1);
/*!40000 ALTER TABLE `core_routestretch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_routestretchrate`
--

DROP TABLE IF EXISTS `core_routestretchrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_routestretchrate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) DEFAULT NULL,
  `rate_type_id` bigint(20) NOT NULL,
  `route_stretch_id` bigint(20) NOT NULL,
  `seat_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_routestretchrate_rate_type_id_d7594c6e_fk_core_ratetype_id` (`rate_type_id`),
  KEY `core_routestretchrat_route_stretch_id_26d9ef0f_fk_core_rout` (`route_stretch_id`),
  KEY `core_routestretchrat_seat_type_id_538c0c13_fk_transport` (`seat_type_id`),
  CONSTRAINT `core_routestretchrat_route_stretch_id_26d9ef0f_fk_core_rout` FOREIGN KEY (`route_stretch_id`) REFERENCES `core_routestretch` (`id`),
  CONSTRAINT `core_routestretchrat_seat_type_id_538c0c13_fk_transport` FOREIGN KEY (`seat_type_id`) REFERENCES `transportation_seattype` (`id`),
  CONSTRAINT `core_routestretchrate_rate_type_id_d7594c6e_fk_core_ratetype_id` FOREIGN KEY (`rate_type_id`) REFERENCES `core_ratetype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_routestretchrate`
--

LOCK TABLES `core_routestretchrate` WRITE;
/*!40000 ALTER TABLE `core_routestretchrate` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_routestretchrate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sale`
--

DROP TABLE IF EXISTS `core_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `status` varchar(9) NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `cash_register_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_sale_cash_register_id_5f5056a9_fk_core_cashregister_id` (`cash_register_id`),
  KEY `core_sale_seller_id_c1146cb2_fk_crew_personal_user_id` (`seller_id`),
  CONSTRAINT `core_sale_cash_register_id_5f5056a9_fk_core_cashregister_id` FOREIGN KEY (`cash_register_id`) REFERENCES `core_cashregister` (`id`),
  CONSTRAINT `core_sale_seller_id_c1146cb2_fk_crew_personal_user_id` FOREIGN KEY (`seller_id`) REFERENCES `crew_personal` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sale`
--

LOCK TABLES `core_sale` WRITE;
/*!40000 ALTER TABLE `core_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sale_tickets`
--

DROP TABLE IF EXISTS `core_sale_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sale_tickets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) NOT NULL,
  `ticket_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_sale_tickets_sale_id_ticket_id_313f1bf1_uniq` (`sale_id`,`ticket_id`),
  KEY `core_sale_tickets_ticket_id_cc7f71bd_fk_core_ticket_id` (`ticket_id`),
  CONSTRAINT `core_sale_tickets_sale_id_f9790ff7_fk_core_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `core_sale` (`id`),
  CONSTRAINT `core_sale_tickets_ticket_id_cc7f71bd_fk_core_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `core_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sale_tickets`
--

LOCK TABLES `core_sale_tickets` WRITE;
/*!40000 ALTER TABLE `core_sale_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_sale_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_service`
--

DROP TABLE IF EXISTS `core_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `datetime_publish` datetime(6) DEFAULT NULL,
  `datetime_from` datetime(6) NOT NULL,
  `datetime_to` datetime(6) NOT NULL,
  `service_type` varchar(9) NOT NULL,
  `bus_id` bigint(20) DEFAULT NULL,
  `route_id` bigint(20) NOT NULL,
  `renovation_months` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_service_bus_id_c0473aac_fk_transportation_bus_id` (`bus_id`),
  KEY `core_service_route_id_85a5515a_fk_core_route_id` (`route_id`),
  CONSTRAINT `core_service_bus_id_c0473aac_fk_transportation_bus_id` FOREIGN KEY (`bus_id`) REFERENCES `transportation_bus` (`id`),
  CONSTRAINT `core_service_route_id_85a5515a_fk_core_route_id` FOREIGN KEY (`route_id`) REFERENCES `core_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_service`
--

LOCK TABLES `core_service` WRITE;
/*!40000 ALTER TABLE `core_service` DISABLE KEYS */;
INSERT INTO `core_service` VALUES (35,'85d','Antofagasta - Santiago',0,'2021-12-30 11:15:00.000000','2021-12-27 20:34:00.000000','2022-03-27 20:34:00.000000','short',43,1,NULL),(36,NULL,'Rancagua - Copiapo',1,'2021-12-28 10:57:00.000000','2021-12-28 10:00:00.000000','2022-03-28 10:00:00.000000','short',44,3,NULL);
/*!40000 ALTER TABLE `core_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_service_assistants`
--

DROP TABLE IF EXISTS `core_service_assistants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_service_assistants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) NOT NULL,
  `personal_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_service_assistants_service_id_personal_id_5ba6fb8d_uniq` (`service_id`,`personal_id`),
  KEY `core_service_assista_personal_id_7792b7de_fk_crew_pers` (`personal_id`),
  CONSTRAINT `core_service_assista_personal_id_7792b7de_fk_crew_pers` FOREIGN KEY (`personal_id`) REFERENCES `crew_personal` (`user_id`),
  CONSTRAINT `core_service_assistants_service_id_7fdf78ff_fk_core_service_id` FOREIGN KEY (`service_id`) REFERENCES `core_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_service_assistants`
--

LOCK TABLES `core_service_assistants` WRITE;
/*!40000 ALTER TABLE `core_service_assistants` DISABLE KEYS */;
INSERT INTO `core_service_assistants` VALUES (21,35,52),(22,35,54),(23,36,52);
/*!40000 ALTER TABLE `core_service_assistants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_service_drivers`
--

DROP TABLE IF EXISTS `core_service_drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_service_drivers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) NOT NULL,
  `personal_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_service_drivers_service_id_personal_id_a5c8889c_uniq` (`service_id`,`personal_id`),
  KEY `core_service_drivers_personal_id_30587fe0_fk_crew_pers` (`personal_id`),
  CONSTRAINT `core_service_drivers_personal_id_30587fe0_fk_crew_pers` FOREIGN KEY (`personal_id`) REFERENCES `crew_personal` (`user_id`),
  CONSTRAINT `core_service_drivers_service_id_50f1e635_fk_core_service_id` FOREIGN KEY (`service_id`) REFERENCES `core_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_service_drivers`
--

LOCK TABLES `core_service_drivers` WRITE;
/*!40000 ALTER TABLE `core_service_drivers` DISABLE KEYS */;
INSERT INTO `core_service_drivers` VALUES (59,35,40),(60,35,49),(61,35,50),(62,36,40),(63,36,49),(64,36,50);
/*!40000 ALTER TABLE `core_service_drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_ticket`
--

DROP TABLE IF EXISTS `core_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_type` varchar(9) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `passenger_id` bigint(20) NOT NULL,
  `service_id` bigint(20) NOT NULL,
  `seat_id` bigint(20) NOT NULL,
  `reserved_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_ticket_passenger_id_2986ab84_fk_core_passenger_id` (`passenger_id`),
  KEY `core_ticket_service_id_6f014ed0_fk_core_service_id` (`service_id`),
  KEY `core_ticket_seat_id_95556df0_fk_transport` (`seat_id`),
  CONSTRAINT `core_ticket_passenger_id_2986ab84_fk_core_passenger_id` FOREIGN KEY (`passenger_id`) REFERENCES `core_passenger` (`id`),
  CONSTRAINT `core_ticket_seat_id_95556df0_fk_transport` FOREIGN KEY (`seat_id`) REFERENCES `transportation_seat` (`component_ptr_id`),
  CONSTRAINT `core_ticket_service_id_6f014ed0_fk_core_service_id` FOREIGN KEY (`service_id`) REFERENCES `core_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_ticket`
--

LOCK TABLES `core_ticket` WRITE;
/*!40000 ALTER TABLE `core_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_commission`
--

DROP TABLE IF EXISTS `crew_commission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew_commission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `status` int(11) NOT NULL,
  `personal_id` bigint(20) NOT NULL,
  `route_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `crew_commission_route_id_07490770_fk_core_route_id` (`route_id`),
  KEY `crew_commission_personal_id_1b5adc65` (`personal_id`),
  CONSTRAINT `crew_commission_route_id_07490770_fk_core_route_id` FOREIGN KEY (`route_id`) REFERENCES `core_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_commission`
--

LOCK TABLES `crew_commission` WRITE;
/*!40000 ALTER TABLE `crew_commission` DISABLE KEYS */;
INSERT INTO `crew_commission` VALUES (55,'2021-12-28 01:31:14.273486','2021-12-28 01:31:14.273510',5.00,'2021-12-01','2021-12-31',2,56,1),(57,'2021-12-28 01:46:09.176969','2021-12-28 01:46:09.176993',4.00,'2021-12-01','2021-12-31',2,51,3),(58,'2022-01-04 18:02:08.727368','2022-01-04 18:02:08.727394',7.00,'2022-01-04','2022-01-31',2,52,1),(59,'2022-01-05 10:08:32.538845','2022-01-05 10:08:32.538869',5.00,'2022-01-05','2022-01-31',2,51,3);
/*!40000 ALTER TABLE `crew_commission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_commissionlog`
--

DROP TABLE IF EXISTS `crew_commissionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew_commissionlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `date` date NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `commission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `crew_commissionlog_commission_id_816d4ea3_fk_crew_commission_id` (`commission_id`),
  CONSTRAINT `crew_commissionlog_commission_id_816d4ea3_fk_crew_commission_id` FOREIGN KEY (`commission_id`) REFERENCES `crew_commission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_commissionlog`
--

LOCK TABLES `crew_commissionlog` WRITE;
/*!40000 ALTER TABLE `crew_commissionlog` DISABLE KEYS */;
INSERT INTO `crew_commissionlog` VALUES (1,'2021-12-28 01:42:29.075703','2021-12-28 01:42:29.075728','2021-12-28',5.00,'2021-12-01','2021-12-31',55),(3,'2021-12-28 01:47:02.194505','2021-12-28 01:47:02.194530','2021-12-28',5.00,'2021-12-01','2021-12-31',57),(4,'2021-12-28 01:47:43.556589','2021-12-28 01:47:43.556613','2021-12-28',5.00,'2021-12-01','2021-12-31',57),(5,'2021-12-28 01:49:33.915960','2021-12-28 01:49:33.915983','2021-12-28',4.00,'2022-01-01','2022-01-31',57);
/*!40000 ALTER TABLE `crew_commissionlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_motive`
--

DROP TABLE IF EXISTS `crew_motive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew_motive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_motive`
--

LOCK TABLES `crew_motive` WRITE;
/*!40000 ALTER TABLE `crew_motive` DISABLE KEYS */;
INSERT INTO `crew_motive` VALUES (1,'Vacaciones'),(2,'Permiso Administrativo'),(3,'Desvinculación'),(4,'Licencia Médica'),(5,'Descanso'),(6,'permiso'),(7,'vacaciones');
/*!40000 ALTER TABLE `crew_motive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_personal`
--

DROP TABLE IF EXISTS `crew_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew_personal` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `contract_type` varchar(10) NOT NULL,
  `contract_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `crew_personal_user_id_5495d07a_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_personal`
--

LOCK TABLES `crew_personal` WRITE;
/*!40000 ALTER TABLE `crew_personal` DISABLE KEYS */;
INSERT INTO `crew_personal` VALUES ('2021-11-22 17:31:01.680997','2021-12-01 18:39:00.233681',40,2,'5x2','2021-11-22'),('2021-12-01 14:13:13.916802','2021-12-02 11:30:12.004878',49,1,'5x2','2021-12-01'),('2021-12-01 19:12:16.135711','2021-12-01 19:12:16.135736',50,2,'5x2','2010-02-01'),('2021-12-02 10:14:35.992166','2021-12-02 10:14:35.992187',51,2,'10x4','2021-12-02'),('2021-12-02 11:33:11.752671','2021-12-15 13:37:11.737485',52,2,'10x4','2021-12-02'),('2021-12-15 11:22:18.299079','2021-12-15 11:22:18.302787',54,1,'5x2','2018-04-09'),('2021-12-15 11:23:35.193472','2021-12-15 11:23:35.193507',55,1,'5x2','2018-04-09'),('2021-12-23 09:20:55.285622','2021-12-23 09:20:55.285654',56,1,'10x4','2021-12-23');
/*!40000 ALTER TABLE `crew_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_personalmotive`
--

DROP TABLE IF EXISTS `crew_personalmotive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew_personalmotive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `motive_id` bigint(20) NOT NULL,
  `personal_id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `manage_personal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crew_personalmotive_motive_id_ba415e2c_fk_crew_motive_id` (`motive_id`),
  KEY `crew_personalmotive_personal_id_42ec419c_fk_crew_pers` (`personal_id`),
  CONSTRAINT `crew_personalmotive_motive_id_ba415e2c_fk_crew_motive_id` FOREIGN KEY (`motive_id`) REFERENCES `crew_motive` (`id`),
  CONSTRAINT `crew_personalmotive_personal_id_42ec419c_fk_crew_pers` FOREIGN KEY (`personal_id`) REFERENCES `crew_personal` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_personalmotive`
--

LOCK TABLES `crew_personalmotive` WRITE;
/*!40000 ALTER TABLE `crew_personalmotive` DISABLE KEYS */;
INSERT INTO `crew_personalmotive` VALUES (1,'2018-09-13','2019-06-06',1,54,'2021-12-15 11:22:18.307250','Lorem irure labore'),(2,'2018-09-13','2019-06-06',1,55,'2021-12-15 11:23:35.197029','Lorem irure labore');
/*!40000 ALTER TABLE `crew_personalmotive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_personalposition`
--

DROP TABLE IF EXISTS `crew_personalposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew_personalposition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `personal_id` bigint(20) NOT NULL,
  `position_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `crew_personalpositio_personal_id_f4a2f7d9_fk_crew_pers` (`personal_id`),
  KEY `crew_personalposition_position_id_c1c794ff_fk_crew_position_id` (`position_id`),
  CONSTRAINT `crew_personalpositio_personal_id_f4a2f7d9_fk_crew_pers` FOREIGN KEY (`personal_id`) REFERENCES `crew_personal` (`user_id`),
  CONSTRAINT `crew_personalposition_position_id_c1c794ff_fk_crew_position_id` FOREIGN KEY (`position_id`) REFERENCES `crew_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_personalposition`
--

LOCK TABLES `crew_personalposition` WRITE;
/*!40000 ALTER TABLE `crew_personalposition` DISABLE KEYS */;
INSERT INTO `crew_personalposition` VALUES (75,2,40,1),(76,2,50,1),(77,2,50,2),(78,2,51,2),(79,2,49,2),(81,2,54,1),(82,2,55,1),(83,2,52,1),(84,2,52,2),(85,2,56,1);
/*!40000 ALTER TABLE `crew_personalposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_position`
--

DROP TABLE IF EXISTS `crew_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crew_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `description` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crew_position_description_c0393ffa_uniq` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_position`
--

LOCK TABLES `crew_position` WRITE;
/*!40000 ALTER TABLE `crew_position` DISABLE KEYS */;
INSERT INTO `crew_position` VALUES (1,'2021-11-12 10:38:24.830000','2021-11-12 10:38:24.830000','Auxiliar'),(2,'2021-11-12 10:38:38.313000','2021-11-12 10:38:38.313000','Chofer de Ruta'),(3,'2021-12-28 01:21:45.866226','2021-12-28 01:21:45.866251','Contador');
/*!40000 ALTER TABLE `crew_position` ENABLE KEYS */;
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
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-11-12 12:49:33.922314','2','Israel Castro',1,'[{\"added\": {}}]',16,2),(2,'2021-11-12 12:54:47.502132','1','Ignacio Figueroa',1,'[{\"added\": {}}]',16,2),(3,'2021-11-12 15:42:39.579872','1','a',1,'[{\"added\": {}}]',9,1),(4,'2021-11-12 17:26:10.865649','2','b',1,'[{\"added\": {}}]',9,1),(5,'2021-11-12 17:27:43.348530','3','dgfg',1,'[{\"added\": {}}]',9,1),(6,'2021-11-16 12:47:51.151943','1','Ignacio Figueroa',1,'[{\"added\": {}}]',16,1),(7,'2021-11-16 12:50:05.606527','1','Ignacio Figueroa',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',16,2),(8,'2021-11-18 17:35:23.726650','26','123123',3,'',7,1),(9,'2021-11-18 17:35:23.731003','8','andre4',3,'',7,1),(10,'2021-11-18 17:35:23.731880','11','andre5',3,'',7,1),(11,'2021-11-18 17:35:23.732422','34','Icastro5',3,'',7,1),(12,'2021-11-18 17:35:23.732914','14','icastroLinets1',3,'',7,1),(13,'2021-11-18 17:35:23.733395','28','ifigueroa',3,'',7,1),(14,'2021-11-18 17:35:23.733856','32','israel3',3,'',7,1),(15,'2021-11-18 17:35:23.734312','19','sdfsdfsdf',3,'',7,1),(16,'2021-11-18 17:35:54.483804','22','aaaa',3,'',7,1),(17,'2021-11-19 15:13:55.772110','35','Rosemary Montevilla',2,'[{\"changed\": {\"fields\": [\"Estado\", \"Tipo de contrato\", \"Fecha de contrataci\\u00f3n\"]}}]',16,4),(18,'2021-11-19 15:48:27.808380','5','Descanso',1,'[{\"added\": {}}]',15,4),(19,'2021-11-19 17:39:27.291583','33','Maria Helena Gomez2',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',16,4),(20,'2021-11-19 17:42:03.488410','1','uno',1,'[{\"added\": {}}]',10,4),(21,'2021-11-19 17:42:09.604930','2','2',1,'[{\"added\": {}}]',10,4),(22,'2021-11-22 13:58:16.546587','33','Maria Helena Gomez2',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',16,1),(23,'2021-11-23 12:20:37.769039','39','asdsad asdsad',3,'',16,2),(24,'2021-11-23 12:20:37.769889','37','xcxc sdsd',3,'',16,2),(25,'2021-11-23 12:20:37.770386','36','Carlos1 El',3,'',16,2),(26,'2021-11-23 12:20:37.770862','33','Maria Helena Gomez2',3,'',16,2),(27,'2021-11-24 11:37:37.509097','1','Commission object (1)',1,'[{\"added\": {}}]',20,2),(28,'2021-11-24 11:47:42.664489','2','Commission object (2)',1,'[{\"added\": {}}]',20,2),(29,'2021-11-26 12:16:06.172881','14','Commission object (14)',3,'',20,2),(30,'2021-11-26 12:16:06.177106','13','Commission object (13)',3,'',20,2),(31,'2021-11-26 12:16:06.177687','12','Commission object (12)',3,'',20,2),(32,'2021-11-26 12:16:06.178333','11','Commission object (11)',3,'',20,2),(33,'2021-11-26 12:16:06.181632','10','Commission object (10)',3,'',20,2),(34,'2021-11-26 12:16:06.182093','9','Commission object (9)',3,'',20,2),(35,'2021-11-26 12:16:06.182534','8','Commission object (8)',3,'',20,2),(36,'2021-11-26 12:16:06.182993','7','Commission object (7)',3,'',20,2),(37,'2021-11-26 12:16:06.183443','6','Commission object (6)',3,'',20,2),(38,'2021-11-26 12:16:06.183907','5','Commission object (5)',3,'',20,2),(39,'2021-11-26 12:16:06.184331','2','Commission object (2)',3,'',20,2),(40,'2021-11-26 12:16:06.184746','1','Commission object (1)',3,'',20,2),(41,'2021-11-26 14:16:45.237090','19','Commission object (19)',3,'',20,2),(42,'2021-11-26 14:16:45.237735','18','Commission object (18)',3,'',20,2),(43,'2021-11-26 14:16:45.238242','17','Commission object (17)',3,'',20,2),(44,'2021-11-26 14:16:45.238762','16','Commission object (16)',3,'',20,2),(45,'2021-11-26 14:16:45.239235','15','Commission object (15)',3,'',20,2),(46,'2021-11-26 14:34:19.521363','23','Commission object (23)',3,'',20,2),(47,'2021-11-26 14:34:19.522050','22','Commission object (22)',3,'',20,2),(48,'2021-11-26 14:34:19.527471','21','Commission object (21)',3,'',20,2),(49,'2021-11-26 14:34:19.528057','20','Commission object (20)',3,'',20,2),(50,'2021-11-26 14:38:48.983830','31','Commission object (31)',3,'',20,2),(51,'2021-11-26 14:38:48.984474','30','Commission object (30)',3,'',20,2),(52,'2021-11-26 14:38:48.985022','29','Commission object (29)',3,'',20,2),(53,'2021-11-26 14:38:48.985496','28','Commission object (28)',3,'',20,2),(54,'2021-11-26 14:38:48.986173','27','Commission object (27)',3,'',20,2),(55,'2021-11-26 14:38:48.991148','26','Commission object (26)',3,'',20,2),(56,'2021-11-26 14:38:48.991646','25','Commission object (25)',3,'',20,2),(57,'2021-11-26 14:38:48.992117','24','Commission object (24)',3,'',20,2),(58,'2021-11-29 12:44:51.340889','1','Metropolitana',1,'[{\"added\": {}}]',21,1),(59,'2021-11-29 12:44:54.178298','1','Santiago',1,'[{\"added\": {}}]',33,1),(60,'2021-11-30 12:06:42.570712','1','Vendedor',1,'[{\"added\": {}}]',6,2),(61,'2021-11-30 13:02:42.410307','45','gemerias',1,'[{\"added\": {}}]',7,2),(62,'2021-11-30 13:02:54.750306','45',' ',1,'[{\"added\": {}}]',16,2),(63,'2021-11-30 13:03:42.035404','45',' ',3,'',16,2),(64,'2021-11-30 13:03:58.746197','45',' ',1,'[{\"added\": {}}]',16,2),(65,'2021-11-30 13:08:50.723367','45',' ',3,'',16,2),(66,'2021-11-30 13:10:51.214196','45','gemerias',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Apellido Materno\", \"Sexo\", \"Email address\", \"RUT\", \"N\\u00famero de celular\", \"N\\u00famero de casa\", \"Direcci\\u00f3n\", \"N\\u00famero de trabajo\", \"Direcci\\u00f3n de trabajo\", \"Roles\", \"Last login\", \"Date joined\"]}}]',7,2),(67,'2021-11-30 13:10:54.572535','45','elchavo del8',1,'[{\"added\": {}}]',16,2),(68,'2021-11-30 17:24:02.248448','47','cristian sepúlveda',3,'',16,2),(69,'2021-11-30 17:24:02.249427','46','jorge Gomez',3,'',16,2),(70,'2021-11-30 17:24:02.250430','45','elchavo del8',3,'',16,2),(71,'2021-11-30 17:24:02.259305','44','israel33 castro33',3,'',16,2),(72,'2021-11-30 17:24:02.262613','42','israel castro ortega',3,'',16,2),(73,'2021-11-30 17:24:02.264129','41','israel castro ortega',3,'',16,2),(74,'2021-11-30 17:24:02.266367','38','israel1 castro1',3,'',16,2),(75,'2021-11-30 17:24:02.267268','35','Rosemary Montevilla',3,'',16,2),(76,'2021-12-01 14:11:58.159761','41','israel11',3,'',7,1),(77,'2021-12-01 14:11:58.160479','42','israel111',3,'',7,1),(78,'2021-12-01 14:11:58.161033','38','israel2',3,'',7,1),(79,'2021-12-01 14:11:58.161577','44','israel333',3,'',7,1),(80,'2021-12-01 14:11:58.181195','48','israelitodel8',3,'',7,1),(81,'2021-12-01 14:12:36.999371','5','andre3',3,'',7,1),(82,'2021-12-01 14:12:37.000534','39','asdasd',3,'',7,1),(83,'2021-12-01 14:12:37.001115','36','ElAmigo',3,'',7,1),(84,'2021-12-01 14:12:37.001912','45','gemerias',3,'',7,1),(85,'2021-12-01 14:12:37.002903','30','Icastro1',3,'',7,1),(86,'2021-12-01 14:12:37.003958','12','icastroLinets',3,'',7,1),(87,'2021-12-01 14:12:37.004680','31','ifigueroa1',3,'',7,1),(88,'2021-12-01 14:12:37.005155','46','Jorgito',3,'',7,1),(89,'2021-12-01 14:12:37.005855','43','Lcastro',3,'',7,1),(90,'2021-12-01 14:12:37.024424','37','zxczxc',3,'',7,1),(91,'2021-12-01 14:12:52.436254','33','Mgomez',3,'',7,1),(92,'2021-12-02 11:15:38.050618','42','Comisión de Alfredo Cancino',3,'',20,1),(93,'2021-12-02 11:15:38.051744','41','Comisión de Ignacio Figueroa',3,'',20,1),(94,'2021-12-02 11:15:48.016830','40','Comisión de Cristian Sepulveda',3,'',20,2),(95,'2021-12-02 11:16:03.174670','44','Comisión de Ignacio Figueroa',3,'',20,1),(96,'2021-12-02 11:16:03.175317','43','Comisión de Alfredo Cancino',3,'',20,1),(97,'2021-12-02 11:17:14.715602','46','Comisión de Ignacio Figueroa',3,'',20,1),(98,'2021-12-02 11:17:14.716373','45','Comisión de Alfredo Cancino',3,'',20,1),(99,'2021-12-02 11:17:31.608073','48','Comisión de Ignacio Figueroa',3,'',20,1),(100,'2021-12-02 11:17:31.613049','47','Comisión de Alfredo Cancino',3,'',20,1),(101,'2021-12-02 14:11:47.360883','1','ignacio',2,'[{\"changed\": {\"fields\": [\"Sexo\"]}}]',7,1),(102,'2021-12-02 17:11:28.659425','1','ignacio',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',7,1),(103,'2021-12-02 17:19:06.751382','1','ignacio',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',7,1),(104,'2021-12-02 17:20:14.443354','1','ignacio',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',7,1),(105,'2021-12-02 17:40:39.409530','1','ignacio',2,'[{\"changed\": {\"fields\": [\"Sexo\"]}}]',7,1),(106,'2021-12-02 17:41:11.057606','1','ignacio',2,'[{\"changed\": {\"fields\": [\"Sexo\"]}}]',7,1),(107,'2021-12-03 12:16:04.797123','2','israel',2,'[{\"changed\": {\"fields\": [\"Sexo\"]}}]',7,1),(108,'2021-12-03 12:16:54.328417','2','israel',2,'[{\"changed\": {\"fields\": [\"Sexo\"]}}]',7,1),(109,'2021-12-03 12:17:30.975307','2','israel',2,'[{\"changed\": {\"fields\": [\"Sexo\"]}}]',7,1),(110,'2021-12-03 17:27:25.204780','52','Comisión de Sara Sarabia',3,'',20,2),(111,'2021-12-03 17:27:25.205374','51','Comisión de Ignacio Figueroa',3,'',20,2),(112,'2021-12-03 17:27:25.205859','50','Comisión de Alfredo Cancino',3,'',20,2),(113,'2021-12-03 17:27:25.206294','49','Comisión de israel castro',3,'',20,2),(114,'2021-12-10 10:46:43.749338','152','Normal None',1,'[{\"added\": {}}]',14,53),(115,'2021-12-10 10:59:48.850889','152','Normal None',3,'',14,53),(116,'2021-12-10 12:14:16.769827','153','Normal None',1,'[{\"added\": {}}]',14,53),(117,'2021-12-10 12:27:13.253717','154','Escalera',1,'[{\"added\": {}}]',13,53),(118,'2021-12-13 13:57:47.408355','1','rutaTest',1,'[{\"added\": {}}]',32,2),(119,'2021-12-13 13:58:55.880317','1','Service object (1)',1,'[{\"added\": {}}]',24,2),(120,'2021-12-13 14:00:23.598135','2','Service object (2)',1,'[{\"added\": {}}]',24,2),(121,'2021-12-14 22:55:03.725606','3','Service object (3)',1,'[{\"added\": {}}]',24,1),(122,'2021-12-14 23:18:27.740437','4','Service object (4)',1,'[{\"added\": {}}]',24,1),(123,'2021-12-15 15:21:52.724836','1','rutaTest',2,'[{\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (1)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (2)\"}}]',32,1),(124,'2021-12-15 23:07:17.765670','3','RouteMap object (3)',1,'[{\"added\": {}}]',39,1),(125,'2021-12-15 23:35:34.418979','4','RouteMap object (4)',1,'[{\"added\": {}}]',39,1),(126,'2021-12-16 18:04:57.360599','6','Service object (6)',3,'',24,2),(127,'2021-12-16 18:04:57.361319','5','Service object (5)',3,'',24,2),(128,'2021-12-16 18:04:57.361929','2','Service object (2)',3,'',24,2),(129,'2021-12-17 10:04:57.708936','9','Service object (9)',3,'',24,2),(130,'2021-12-17 10:04:57.710521','8','Service object (8)',3,'',24,2),(131,'2021-12-17 10:04:57.711086','7','Service object (7)',3,'',24,2),(132,'2021-12-17 10:04:57.711625','1','Service object (1)',3,'',24,2),(133,'2021-12-17 10:17:26.155859','13','Pichilemu',1,'[{\"added\": {}}]',33,1),(134,'2021-12-17 10:52:39.397279','11','Service object (11)',3,'',24,2),(135,'2021-12-20 17:18:04.766108','14','Service object (14)',3,'',24,2),(136,'2021-12-20 17:18:04.766769','13','Service object (13)',3,'',24,2),(137,'2021-12-20 17:18:04.767292','12','Service object (12)',3,'',24,2),(138,'2021-12-20 17:18:04.767767','10','Service object (10)',3,'',24,2),(139,'2021-12-21 12:20:23.474285','2','01Prueba',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (5)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (6)\"}}, {\"added\": {\"name\": \"Tramo de ruta\", \"object\": \"RouteStretch object (1)\"}}]',32,4),(140,'2021-12-21 12:27:25.863845','2','01Prueba',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',32,4),(141,'2021-12-21 12:31:49.648793','1','RutaTest',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',32,4),(142,'2021-12-21 12:50:26.103498','20','CIC',3,'',24,2),(143,'2021-12-21 12:50:26.104114','19','CIC',3,'',24,2),(144,'2021-12-21 12:50:26.104816','18','CIC',3,'',24,2),(145,'2021-12-21 12:50:26.109612','17','CIC',3,'',24,2),(146,'2021-12-21 12:50:26.110139','16','Test2',3,'',24,2),(147,'2021-12-21 12:50:26.110642','15','TEST',3,'',24,2),(148,'2021-12-21 15:51:21.011744','9','prueba01',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta maestra\", \"object\": \"MasterRouteMap object (58)\"}}, {\"added\": {\"name\": \"Mapa de ruta maestra\", \"object\": \"MasterRouteMap object (59)\"}}, {\"added\": {\"name\": \"Tramo de ruta maestra\", \"object\": \"[prueba01] El Palomar - Punta Colorada\"}}]',31,4),(149,'2021-12-21 16:01:40.145358','9','prueba01 - prueba2',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',31,4),(150,'2021-12-21 16:05:53.272347','3','02Prueba',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (7)\"}}]',32,4),(151,'2021-12-21 16:22:37.555253','2','01Prueba',2,'[{\"changed\": {\"fields\": [\"Estado\"]}}]',32,4),(152,'2021-12-21 16:37:48.489974','23','CIC',3,'',24,2),(153,'2021-12-21 16:37:48.490592','22','CIC',3,'',24,2),(154,'2021-12-21 16:37:48.491132','4','RGA - ATFA',3,'',24,2),(155,'2021-12-21 16:37:48.491602','3','SCL - TCO',3,'',24,2),(156,'2021-12-22 10:29:52.089691','43','Andimar',2,'[{\"changed\": {\"fields\": [\"Disposici\\u00f3n\"]}}]',9,1),(157,'2021-12-23 13:06:03.793895','29','CIC',3,'',24,2),(158,'2021-12-23 13:06:03.794914','28','Test2',3,'',24,2),(159,'2021-12-23 13:06:03.795601','26','TEST',3,'',24,2),(160,'2021-12-23 13:06:03.796249','25','TEST DATETIME (por defecto)2',3,'',24,2),(161,'2021-12-23 13:06:03.796895','24','TEST DATETIME (por defecto)',3,'',24,2),(162,'2021-12-23 13:06:03.797636','21','TEST',3,'',24,2),(163,'2021-12-27 18:04:50.956571','155','Asiento conductor 001',1,'[{\"added\": {}}]',14,4),(164,'2021-12-27 18:37:01.375215','4','Asiento chofer',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',10,4),(165,'2021-12-27 19:35:56.304222','1','Mixto 60 Asientos',2,'[{\"changed\": {\"fields\": [\"Descripci\\u00f3n\"]}}]',11,4),(166,'2021-12-27 19:37:48.251613','4','01Prueba',1,'[{\"added\": {}}]',11,4),(167,'2021-12-27 19:52:17.291784','4','01Prueba',3,'',11,4),(168,'2021-12-27 20:21:32.184989','7','[Bus Cama 43] Piso 2',1,'[{\"added\": {}}]',12,4),(169,'2021-12-27 23:44:18.092556','8','RouteMap object (8)',1,'[{\"added\": {}}]',39,4),(170,'2021-12-27 23:46:29.473678','8','RouteMap object (8)',3,'',39,4),(171,'2021-12-27 23:55:09.698059','60','MasterRouteMap object (60)',1,'[{\"added\": {}}]',38,4),(172,'2021-12-27 23:55:27.784558','61','MasterRouteMap object (61)',1,'[{\"added\": {}}]',38,4),(173,'2021-12-27 23:55:50.277658','61','MasterRouteMap object (61)',3,'',38,4),(174,'2021-12-27 23:55:50.278261','60','MasterRouteMap object (60)',3,'',38,4),(175,'2021-12-28 00:31:48.741036','35','CIC',2,'[{\"changed\": {\"fields\": [\"C\\u00f3digo\", \"Estado\"]}}]',24,4),(176,'2021-12-28 00:36:34.621945','1','TT1',1,'[{\"added\": {}}]',25,4),(177,'2021-12-28 00:37:47.293096','1','Nocturnas',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',25,4),(178,'2021-12-28 00:38:20.940448','2','Dia',1,'[{\"added\": {}}]',25,4),(179,'2021-12-28 00:39:09.876841','1','RouteStretchRate object (1)',1,'[{\"added\": {}}]',22,4),(180,'2021-12-28 00:42:09.639469','2','RouteStretch object (2)',1,'[{\"added\": {}}]',28,4),(181,'2021-12-28 00:55:32.308640','2','Diurno',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',25,4),(182,'2021-12-28 00:55:52.983318','1','Nocturnas',2,'[{\"changed\": {\"fields\": [\"Hora de fin\"]}}]',25,4),(183,'2021-12-28 01:21:45.866826','3','Contador',1,'[{\"added\": {}}]',17,4),(184,'2021-12-28 01:22:08.958204','2','Conductor',2,'[{\"changed\": {\"fields\": [\"Descripci\\u00f3n\"]}}]',17,4),(185,'2021-12-28 01:24:50.328872','4','Vendedor',1,'[{\"added\": {}}]',17,4),(186,'2021-12-28 01:25:39.357764','4','Vendedor',3,'',17,4),(187,'2021-12-28 01:31:14.275403','55','Comisión de Ross             223dsffs',1,'[{\"added\": {}}]',20,4),(188,'2021-12-28 01:36:48.341555','56','Comisión de Ross             223dsffs',1,'[{\"added\": {}}]',20,4),(189,'2021-12-28 01:42:29.076561','1','CommissionLog object (1)',1,'[{\"added\": {}}]',37,4),(190,'2021-12-28 01:43:54.759375','2','CommissionLog object (2)',1,'[{\"added\": {}}]',37,4),(191,'2021-12-28 01:46:09.178933','57','Comisión de Alfredo             Cancino',1,'[{\"added\": {}}]',20,4),(192,'2021-12-28 01:47:02.195443','3','CommissionLog object (3)',1,'[{\"added\": {}}]',37,4),(193,'2021-12-28 01:47:43.557523','4','CommissionLog object (4)',1,'[{\"added\": {}}]',37,4),(194,'2021-12-28 01:49:33.916891','5','CommissionLog object (5)',1,'[{\"added\": {}}]',37,4),(195,'2021-12-28 01:57:43.831451','6','permiso',1,'[{\"added\": {}}]',15,4),(196,'2021-12-28 01:58:03.619500','7','vacaciones',1,'[{\"added\": {}}]',15,4),(197,'2021-12-28 02:31:34.026891','156','Televisión',1,'[{\"added\": {}}]',13,4),(198,'2021-12-28 02:31:56.596935','156','Televisión',3,'',13,4),(199,'2021-12-28 02:36:39.591168','5','cama 42',1,'[{\"added\": {}}]',11,4),(200,'2021-12-28 02:42:08.911309','1','prestacion1',1,'[{\"added\": {}}]',8,4),(201,'2021-12-28 02:42:36.950665','1','prestacion1',3,'',8,4),(202,'2021-12-28 02:44:30.776823','4','Asiento conductor',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',10,4),(203,'2021-12-28 02:53:25.566256','14','Santiago',1,'[{\"added\": {}}]',33,4),(204,'2021-12-28 02:55:09.494414','15','Santiago',1,'[{\"added\": {}}]',33,4),(205,'2021-12-28 02:55:41.311896','15','Santiago',3,'',33,4),(206,'2021-12-28 02:55:41.312498','14','Santiago',3,'',33,4),(207,'2021-12-28 08:25:41.412315','1','Antofagastas',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',21,4),(208,'2021-12-28 08:25:51.053369','1','Antofagasta',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',21,4),(209,'2021-12-28 08:25:56.978119','1','Antofagastas',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',33,4),(210,'2021-12-28 08:26:12.417306','1','Antofagasta',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',33,4),(211,'2021-12-28 08:29:20.851332','16','01Prueba',1,'[{\"added\": {}}]',33,4),(212,'2021-12-28 08:31:06.270467','17','02Prueba',1,'[{\"added\": {}}]',33,4),(213,'2021-12-28 08:31:46.499021','17','02Prueba',2,'[{\"changed\": {\"fields\": [\"C\\u00f3digo\"]}}]',33,4),(214,'2021-12-28 08:32:26.636291','16','01Pruebas',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',33,4),(215,'2021-12-28 08:33:14.565332','17','02Prueba',3,'',33,4),(216,'2021-12-28 08:33:14.565960','16','01Pruebas',3,'',33,4),(217,'2021-12-28 08:33:58.434813','3','Vallenar',2,'[]',33,4),(218,'2021-12-28 08:38:14.548440','130','02Prueba',1,'[{\"added\": {}}]',35,4),(219,'2021-12-28 08:50:43.208079','130','02Prueba',2,'[{\"changed\": {\"fields\": [\"C\\u00f3digo\"]}}]',35,4),(220,'2021-12-28 08:51:06.835964','130','02Prueba',3,'',35,4),(221,'2021-12-28 09:03:02.406746','9','01Prueba',1,'[{\"added\": {}}]',21,4),(222,'2021-12-28 09:35:58.254111','34','TEST',3,'',24,2),(223,'2021-12-28 09:35:58.254959','33','Test3',3,'',24,2),(224,'2021-12-28 09:35:58.255620','32','Test2',3,'',24,2),(225,'2021-12-28 09:35:58.256177','31','CIC',3,'',24,2),(226,'2021-12-28 09:35:58.256900','30','TEST',3,'',24,2),(227,'2021-12-28 09:35:58.257453','27','Iquique',3,'',24,2),(228,'2021-12-28 12:20:22.280088','44','01Prueba',2,'[{\"changed\": {\"fields\": [\"Disposici\\u00f3n\"]}}]',9,1),(229,'2021-12-28 17:06:09.699653','3','02Prueba',2,'[{\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (9)\"}}]',32,1),(230,'2021-12-28 17:29:31.034491','43','Andimar',2,'[{\"changed\": {\"fields\": [\"Disposici\\u00f3n\"]}}]',9,1),(231,'2021-12-30 09:57:54.486254','3','Rancagua --> Copiapo',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',32,2),(232,'2021-12-30 09:58:19.696029','2','Curicó --> Antofagasta',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',32,2),(233,'2021-12-30 09:58:53.148485','1','Antofagasta --> Santiago',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',32,2),(234,'2021-12-30 10:01:07.515701','4','CIC',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (10)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (11)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (12)\"}}, {\"added\": {\"name\": \"Tramo de ruta\", \"object\": \"RouteStretch object (3)\"}}]',32,2),(235,'2021-12-30 10:01:19.737182','4','Copiapo --> Santiago',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',32,2),(236,'2021-12-30 10:04:13.955140','37','Copiapo/Santiago',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',24,1),(237,'2021-12-30 10:04:26.243336','36','Rancagua/Copiapo',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',24,1),(238,'2021-12-30 10:04:39.622975','35','Antofagasta-Santiago',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',24,1),(239,'2021-12-30 10:04:50.610313','36','Rancagua - Copiapo',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',24,1),(240,'2021-12-30 10:04:58.072617','37','Copiapo - Santiago',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',24,1),(241,'2021-12-30 10:05:04.184905','35','Antofagasta - Santiago',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',24,1),(242,'2021-12-30 10:13:00.995075','5','Test2',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (13)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (14)\"}}]',32,2),(243,'2021-12-30 10:13:18.195436','5','Santiago --> Valdivia',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',32,2),(244,'2021-12-30 10:13:46.258370','38','Curico - Antofagasta',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',24,1),(245,'2021-12-30 10:18:42.691311','6','TEST',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (15)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (16)\"}}, {\"added\": {\"name\": \"Tramo de ruta\", \"object\": \"RouteStretch object (4)\"}}]',32,2),(246,'2021-12-30 10:19:03.368919','6','Santiago --> Rancagua',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',32,2),(247,'2021-12-30 10:21:01.593638','40','Santiago - Rancagua',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',24,1),(248,'2021-12-30 10:21:57.930963','7','test',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (17)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (18)\"}}, {\"added\": {\"name\": \"Tramo de ruta\", \"object\": \"RouteStretch object (5)\"}}]',32,2),(249,'2021-12-30 10:22:11.288091','7','Antofagasta --> La Serena',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',32,2),(250,'2021-12-30 10:29:05.928888','8','ssss',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (19)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (20)\"}}]',32,2),(251,'2021-12-30 10:29:19.651329','8','Santiago --> Rancagua',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',32,2),(252,'2021-12-30 10:30:40.604389','6','Santiago --> Rancagua',3,'',32,2),(253,'2022-01-03 16:33:40.974714','57','test',1,'[{\"added\": {}}]',7,1),(254,'2022-01-03 17:52:59.580217','9','Rancagua --> Santiago',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (21)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (22)\"}}]',32,1),(255,'2022-01-03 17:53:53.083390','45','Rancagua - Santiago',1,'[{\"added\": {}}]',24,1),(256,'2022-01-03 17:59:27.220009','9','Rancagua --> Santiago',2,'[{\"changed\": {\"fields\": [\"Ruta maestra\"]}}, {\"changed\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (21)\", \"fields\": [\"Paradas\"]}}, {\"changed\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (22)\", \"fields\": [\"Paradas\"]}}, {\"added\": {\"name\": \"Tramo de ruta\", \"object\": \"RouteStretch object (6)\"}}]',32,1),(257,'2022-01-03 17:59:31.664061','45','Rancagua - Santiago',2,'[]',24,1);
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(36,'core','cashregister'),(31,'core','masterroute'),(38,'core','masterroutemap'),(27,'core','masterroutestretch'),(29,'core','masterroutestretchrate'),(30,'core','passenger'),(40,'core','passengernationality'),(25,'core','ratetype'),(32,'core','route'),(39,'core','routemap'),(28,'core','routestretch'),(22,'core','routestretchrate'),(23,'core','sale'),(24,'core','service'),(26,'core','ticket'),(20,'crew','commission'),(37,'crew','commissionlog'),(15,'crew','motive'),(16,'crew','personal'),(19,'crew','personalmotive'),(18,'crew','personalposition'),(17,'crew','position'),(34,'locations','branch'),(35,'locations','busstop'),(33,'locations','city'),(21,'locations','region'),(5,'sessions','session'),(8,'transportation','benefit'),(9,'transportation','bus'),(13,'transportation','component'),(12,'transportation','floor'),(11,'transportation','layout'),(14,'transportation','seat'),(10,'transportation','seattype'),(7,'users','customuser'),(6,'users','role');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-11-12 12:28:10.493071'),(2,'contenttypes','0002_remove_content_type_name','2021-11-12 12:28:10.583649'),(3,'auth','0001_initial','2021-11-12 12:28:10.858612'),(4,'auth','0002_alter_permission_name_max_length','2021-11-12 12:28:10.882808'),(5,'auth','0003_alter_user_email_max_length','2021-11-12 12:28:10.899036'),(6,'auth','0004_alter_user_username_opts','2021-11-12 12:28:10.919050'),(7,'auth','0005_alter_user_last_login_null','2021-11-12 12:28:10.929812'),(8,'auth','0006_require_contenttypes_0002','2021-11-12 12:28:10.934540'),(9,'auth','0007_alter_validators_add_error_messages','2021-11-12 12:28:10.944445'),(10,'auth','0008_alter_user_username_max_length','2021-11-12 12:28:10.955058'),(11,'auth','0009_alter_user_last_name_max_length','2021-11-12 12:28:10.965635'),(12,'auth','0010_alter_group_name_max_length','2021-11-12 12:28:10.985924'),(13,'auth','0011_update_proxy_permissions','2021-11-12 12:28:10.998424'),(14,'auth','0012_alter_user_first_name_max_length','2021-11-12 12:28:11.009371'),(15,'users','0001_initial','2021-11-12 12:28:11.390337'),(16,'admin','0001_initial','2021-11-12 12:28:11.532225'),(17,'admin','0002_logentry_remove_auto_add','2021-11-12 12:28:11.546408'),(18,'admin','0003_logentry_add_action_flag_choices','2021-11-12 12:28:11.560702'),(19,'crew','0001_initial','2021-11-12 12:28:11.587086'),(20,'crew','0002_initial','2021-11-12 12:28:12.151224'),(21,'crew','0003_alter_position_description','2021-11-12 12:28:12.218809'),(22,'crew','0004_auto_20211111_2256','2021-11-12 12:28:12.308426'),(23,'sessions','0001_initial','2021-11-12 12:28:12.363071'),(24,'transportation','0001_initial','2021-11-12 12:28:13.172774'),(25,'users','0002_auto_20211110_1358','2021-11-12 12:28:13.416922'),(26,'crew','0005_alter_personalmotive_date_from','2021-11-15 09:59:32.252262'),(27,'crew','0006_commission','2021-11-16 13:50:58.639483'),(28,'crew','0007_auto_20211117_1115','2021-11-18 08:36:32.477534'),(29,'locations','0001_initial','2021-11-25 09:30:36.265225'),(30,'locations','0002_branch_busstop_city','2021-11-25 17:46:05.599541'),(31,'core','0001_initial','2021-11-25 17:46:07.371266'),(32,'crew','0008_alter_commission_personal','2021-11-25 17:46:07.402146'),(33,'transportation','0002_auto_20211129_1553','2021-11-29 15:56:46.256040'),(34,'locations','0003_auto_20211129_1553','2021-11-29 15:56:46.492660'),(35,'core','0002_auto_20211129_1553','2021-11-29 15:56:47.183786'),(36,'crew','0009_commissionlog','2021-12-01 05:25:28.243551'),(37,'crew','0010_alter_commission_personal','2021-12-01 05:26:42.495050'),(38,'crew','0011_alter_commissionlog_date','2021-12-01 05:26:42.516121'),(39,'core','0003_auto_20211202_0918','2021-12-02 11:14:06.567754'),(40,'core','0004_alter_masterroutestretchrate_master_route_stretch','2021-12-02 14:37:41.553189'),(41,'core','0005_masterroutemap','2021-12-10 10:11:54.406611'),(42,'core','0006_masterroutemap_unique bus stop in master route','2021-12-10 10:11:54.428735'),(43,'crew','0012_alter_personal_contract_type','2021-12-13 10:43:24.343770'),(44,'crew','0013_alter_personal_contract_type','2021-12-13 10:52:40.087806'),(45,'core','0007_remove_masterroutestretch_city','2021-12-13 17:58:27.888734'),(46,'core','0008_ticket_reserved_time','2021-12-14 13:27:45.489096'),(47,'core','0009_auto_20211214_2209','2021-12-14 22:29:08.539590'),(48,'core','0010_alter_routemap_route','2021-12-15 13:38:02.252514'),(49,'crew','0014_auto_20211215_1721','2021-12-21 10:34:26.228461'),(50,'core','0011_auto_20211221_0735','2021-12-21 10:34:26.568350'),(51,'locations','0004_city_priority','2021-12-22 10:28:53.812371'),(52,'transportation','0003_alter_floor_layout','2021-12-22 10:28:53.847043'),(53,'transportation','0004_rename_floor_component_floors','2021-12-23 04:41:41.440525'),(54,'core','0012_auto_20211223_1720','2021-12-23 17:45:09.691358'),(55,'transportation','0005_auto_20211228_1122','2021-12-28 11:30:15.092396');
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
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
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
-- Table structure for table `locations_branch`
--

DROP TABLE IF EXISTS `locations_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations_branch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` varchar(15) DEFAULT NULL,
  `longitude` varchar(15) DEFAULT NULL,
  `city_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_branch_city_id_5cee9f14_fk_locations_city_id` (`city_id`),
  CONSTRAINT `locations_branch_city_id_5cee9f14_fk_locations_city_id` FOREIGN KEY (`city_id`) REFERENCES `locations_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_branch`
--

LOCK TABLES `locations_branch` WRITE;
/*!40000 ALTER TABLE `locations_branch` DISABLE KEYS */;
INSERT INTO `locations_branch` VALUES (1,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Antofagasta - Oficina 13B','-23.5930135','-70.3901624',1),(2,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Andimar Copiapó','-23.5930135','-70.3901624',2),(3,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Copiapó','0','0',2),(4,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Vallenar - Oficina 09','-28.572346','-70.766121',3),(5,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal La Serena - Oficina 02','-29.910459','-71.256912',4),(6,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal La Serena','-29.910459','-71.256912',4),(7,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Ovalle','-30.6067816','-71.1969041',5),(8,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal San Borja - Oficina 37B','-33.4538439','-70.6799818',6),(9,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal San Borja - Oficina 49B','-33.4538439','-70.6799818',6),(10,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal San Borja - Oficina 65','-33.4538439','-70.6799818',6),(11,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Sur - Oficina 20-21','-33.4541655','-70.6883814',6),(12,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Sur - Oficina 132','-33.4541655','-70.6883814',6),(13,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Sur - Oficina 147-148','-33.4541655','-70.6883814',7),(14,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal O\'Higgins - Oficina 06','34.1676306','-70.7279278',7),(15,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal San Fernando - Oficina 11','-34.5856528','-70.982475',8),(16,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal San Fernando','-34.5856528','-70.982475',8),(17,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Santa Cruz','-34.6416985','-71.3714212',9),(18,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Curicó - Oficina 12','-34.9846917','-71.2454917',10),(19,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Curicó','-34.9846917','-71.2454917',10),(20,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Rodoviario Temuco - Oficina 25','-38.7159194','-72.5681528',11),(21,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Terminal Valdivia - Oficina 127','-39.815341','-73.23552',12);
/*!40000 ALTER TABLE `locations_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_busstop`
--

DROP TABLE IF EXISTS `locations_busstop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations_busstop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` varchar(15) DEFAULT NULL,
  `longitude` varchar(15) DEFAULT NULL,
  `stop_type` varchar(9) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_busstop_city_id_545af10f_fk_locations_city_id` (`city_id`),
  CONSTRAINT `locations_busstop_city_id_545af10f_fk_locations_city_id` FOREIGN KEY (`city_id`) REFERENCES `locations_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_busstop`
--

LOCK TABLES `locations_busstop` WRITE;
/*!40000 ALTER TABLE `locations_busstop` DISABLE KEYS */;
INSERT INTO `locations_busstop` VALUES (1,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Antofagasta',NULL,NULL,'terminal',1),(2,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','La Negra (Control)',NULL,NULL,'stop',1),(3,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Cruce Tal Tal',NULL,NULL,'stop',1),(4,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Cruce Chañaral',NULL,NULL,'stop',1),(5,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Caldera',NULL,NULL,'stop',1),(6,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Andimar Copiapó',NULL,NULL,'terminal',2),(7,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Copiapó',NULL,NULL,'terminal',2),(8,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','El Palomar',NULL,NULL,'stop',2),(9,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Nantoco',NULL,NULL,'stop',2),(10,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','SubEstación Cardones',NULL,NULL,'stop',2),(11,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Vallenar',NULL,NULL,'terminal',3),(12,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Domeiko',NULL,NULL,'stop',3),(13,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Cachiyuyo',NULL,NULL,'stop',3),(14,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','La Silla (La Campana)',NULL,NULL,'stop',3),(15,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Incahuasi',NULL,NULL,'stop',3),(16,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Punta Colorada',NULL,NULL,'stop',3),(17,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','El Trapiche',NULL,NULL,'stop',3),(18,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','La Higuiera',NULL,NULL,'stop',3),(19,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Caleta de Horno',NULL,NULL,'stop',3),(20,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','La Serena',NULL,NULL,'terminal',4),(21,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','KM45',NULL,NULL,'stop',4),(22,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Coquimbo (Santa Isabel)',NULL,NULL,'stop',4),(23,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Totoralillo',NULL,NULL,'stop',4),(24,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Tongoy (Tambillo)',NULL,NULL,'stop',4),(25,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Cruce Tongoy',NULL,NULL,'stop',4),(26,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Quebrada Seca',NULL,NULL,'stop',4),(27,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Cerrillos',NULL,NULL,'stop',4),(28,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Socos',NULL,NULL,'stop',4),(29,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','El Teniente',NULL,NULL,'stop',4),(30,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Canela',NULL,NULL,'stop',4),(31,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Mincha Norte',NULL,NULL,'stop',4),(32,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Huentelauquén',NULL,NULL,'stop',4),(33,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Los Vilos',NULL,NULL,'stop',4),(34,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Quilimary',NULL,NULL,'stop',4),(35,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Pichidangui',NULL,NULL,'stop',4),(36,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Los Molles',NULL,NULL,'stop',4),(37,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Guaquén',NULL,NULL,'stop',4),(38,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','La Ballena',NULL,NULL,'stop',4),(39,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Longotoma',NULL,NULL,'stop',4),(40,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Ovalle',NULL,NULL,'terminal',5),(41,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Pullally',NULL,NULL,'stop',5),(42,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','La Calera (Soporaval)',NULL,NULL,'stop',5),(43,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Hijuelas',NULL,NULL,'stop',5),(44,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Peaje Las Vegas',NULL,NULL,'stop',5),(45,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Cruce Llay Llay',NULL,NULL,'stop',5),(46,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Montenegro',NULL,NULL,'stop',5),(47,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Rungue (Norte)',NULL,NULL,'stop',5),(48,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Polpaico',NULL,NULL,'stop',5),(49,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','El Manzano',NULL,NULL,'stop',5),(50,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Lampa (Peaje)',NULL,NULL,'stop',5),(51,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Santiago - San Borja',NULL,NULL,'terminal',6),(52,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Sur',NULL,NULL,'terminal',6),(53,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Colón',NULL,NULL,'stop',6),(54,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Buin',NULL,NULL,'stop',6),(55,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Paine',NULL,NULL,'stop',6),(56,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Champa',NULL,NULL,'stop',6),(57,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Control Angostura',NULL,NULL,'stop',6),(58,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Monticello Grand Casino',NULL,NULL,'stop',6),(59,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Pasarela Monticello',NULL,NULL,'stop',6),(60,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Rancagua - O\'Higgins',NULL,NULL,'terminal',7),(61,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Los Lagartos',NULL,NULL,'stop',7),(62,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','San Francisco de Mostazal',NULL,NULL,'stop',7),(63,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Codegua',NULL,NULL,'stop',7),(64,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Graneros',NULL,NULL,'stop',7),(65,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Shopping',NULL,NULL,'stop',7),(66,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Los Alpes',NULL,NULL,'stop',7),(67,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Litueche',NULL,NULL,'stop',7),(68,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Pichilemu',NULL,NULL,'terminal',7),(69,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Pucón',NULL,NULL,'terminal',7),(70,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','San Fernando',NULL,NULL,'terminal',8),(71,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Gultro',NULL,NULL,'stop',8),(72,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Los Lirios',NULL,NULL,'stop',8),(73,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Requinoa',NULL,NULL,'stop',8),(74,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Rosario',NULL,NULL,'stop',8),(75,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Rengo',NULL,NULL,'stop',8),(76,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Pelequén',NULL,NULL,'stop',8),(77,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Santa Cruz',NULL,NULL,'terminal',9),(78,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Manantiales',NULL,NULL,'stop',9),(79,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Placilla',NULL,NULL,'stop',9),(80,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Nancagua 2da (feria)',NULL,NULL,'stop',9),(81,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Nancagua principal',NULL,NULL,'stop',9),(82,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Cunaco',NULL,NULL,'stop',9),(83,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','San gregorio',NULL,NULL,'stop',9),(84,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Paniahue',NULL,NULL,'stop',9),(85,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Hospital',NULL,NULL,'stop',9),(86,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Gonzalo Bulnes',NULL,NULL,'stop',9),(87,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Dónde Silva',NULL,NULL,'stop',9),(88,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Curicó',NULL,NULL,'terminal',10),(89,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Maggi',NULL,NULL,'stop',10),(90,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Tinguiririca',NULL,NULL,'stop',10),(91,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Chimbarongo',NULL,NULL,'stop',10),(92,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Quinta',NULL,NULL,'stop',10),(93,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','La Montaña',NULL,NULL,'stop',10),(94,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Teno',NULL,NULL,'stop',10),(95,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Sarmiento',NULL,NULL,'stop',10),(96,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Romeral',NULL,NULL,'stop',10),(97,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Soler',NULL,NULL,'stop',10),(98,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Aguas Negras (Cruce)',NULL,NULL,'stop',10),(99,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Paradero 10',NULL,NULL,'stop',10),(100,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Paradero 9',NULL,NULL,'stop',10),(101,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Paradero 7',NULL,NULL,'stop',10),(102,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Paradero 6',NULL,NULL,'stop',10),(103,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Merino/Alameda',NULL,NULL,'stop',10),(104,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Paradero 5',NULL,NULL,'stop',10),(105,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Paradero 1',NULL,NULL,'stop',10),(106,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Mall',NULL,NULL,'stop',10),(107,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Santa Marta',NULL,NULL,'stop',10),(108,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Yungay',NULL,NULL,'stop',10),(109,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Temuco',NULL,NULL,'terminal',11),(110,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Victoria',NULL,NULL,'stop',11),(111,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Púa (Peaje)',NULL,NULL,'stop',11),(112,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Galvarino',NULL,NULL,'stop',11),(113,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Perquenco',NULL,NULL,'stop',11),(114,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Lautaro',NULL,NULL,'stop',11),(115,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Pillanlebún',NULL,NULL,'stop',11),(116,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Cajón',NULL,NULL,'stop',11),(117,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Collipulli',NULL,NULL,'stop',11),(118,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Valdivia',NULL,NULL,'terminal',12),(119,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Freire',NULL,NULL,'stop',12),(120,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Lanco',NULL,NULL,'stop',12),(121,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Pitrufquen',NULL,NULL,'stop',12),(122,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Ciruelos',NULL,NULL,'stop',12),(123,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Rotonda Mariquina',NULL,NULL,'stop',12),(124,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Aeropuerto Pichoy',NULL,NULL,'stop',12),(125,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Villa Callumapu',NULL,NULL,'stop',12),(126,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','El Arenal',NULL,NULL,'stop',12),(127,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Copec Rocura',NULL,NULL,'stop',12),(128,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','El Parque',NULL,NULL,'stop',12),(129,'2021-12-07 12:16:21.000000','2021-12-07 12:16:21.000000','','Guata Amarilla',NULL,NULL,'stop',12);
/*!40000 ALTER TABLE `locations_busstop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_city`
--

DROP TABLE IF EXISTS `locations_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `region_id` bigint(20) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_city_region_id_785206de_fk_locations_region_id` (`region_id`),
  CONSTRAINT `locations_city_region_id_785206de_fk_locations_region_id` FOREIGN KEY (`region_id`) REFERENCES `locations_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_city`
--

LOCK TABLES `locations_city` WRITE;
/*!40000 ALTER TABLE `locations_city` DISABLE KEYS */;
INSERT INTO `locations_city` VALUES (1,'','Antofagasta',1,0),(2,'','Copiapo',2,0),(3,'','Vallenar',2,0),(4,'','La Serena',3,0),(5,'','Ovalle',3,0),(6,'','Santiago',4,0),(7,'','Rancagua',5,0),(8,'','San Fernando',5,0),(9,'','Santa Cruz',5,0),(10,'','Curicó',6,0),(11,'','Temuco',7,0),(12,'','Valdivia',8,0),(13,NULL,'Pichilemu',5,0);
/*!40000 ALTER TABLE `locations_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_region`
--

DROP TABLE IF EXISTS `locations_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations_region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `iso_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_region`
--

LOCK TABLES `locations_region` WRITE;
/*!40000 ALTER TABLE `locations_region` DISABLE KEYS */;
INSERT INTO `locations_region` VALUES (1,'','Antofagasta','CL-AN'),(2,'','Atacama','CL-AT'),(3,'','Coquimbo','CL-CO'),(4,'','Metropolitana de Santiago','CL-RM'),(5,'','Libertador General Bernardo O\'Higgins','CL-LI'),(6,'','Maule','CL-ML'),(7,'','Araucanía','CL-AR'),(8,'','Los Rios','CL-LR'),(9,'002n','01Prueba',NULL);
/*!40000 ALTER TABLE `locations_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_benefit`
--

DROP TABLE IF EXISTS `transportation_benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_benefit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_benefit`
--

LOCK TABLES `transportation_benefit` WRITE;
/*!40000 ALTER TABLE `transportation_benefit` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportation_benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_bus`
--

DROP TABLE IF EXISTS `transportation_bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_bus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `vehicle_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `kilometers` int(11) DEFAULT NULL,
  `motor_serial_number` varchar(50) DEFAULT NULL,
  `chassis_serial_number` varchar(50) DEFAULT NULL,
  `color` varchar(60) DEFAULT NULL,
  `year` smallint(5) unsigned DEFAULT NULL,
  `insurance_policy` varchar(50) DEFAULT NULL,
  `insurance_policy_end_date` date DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `layout_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transportation_bus_layout_id_ce6d66f4_fk_transport` (`layout_id`),
  CONSTRAINT `transportation_bus_layout_id_ce6d66f4_fk_transport` FOREIGN KEY (`layout_id`) REFERENCES `transportation_layout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_bus`
--

LOCK TABLES `transportation_bus` WRITE;
/*!40000 ALTER TABLE `transportation_bus` DISABLE KEYS */;
INSERT INTO `transportation_bus` VALUES (43,'2021-11-22 17:48:03.621047','2021-12-28 17:29:31.007295','123abc','Andimar',1,1,'abcd34',10,'1234','1234','rojo',2019,'1234','2021-11-22','porshe','911gtr3','Cristian',1),(44,'2021-12-22 15:52:37.676035','2021-12-28 12:20:22.277468','002','01Prueba',1,1,'prueba001',400,NULL,NULL,'12rojo',NULL,NULL,NULL,NULL,NULL,'ross monte',2);
/*!40000 ALTER TABLE `transportation_bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_bus_services`
--

DROP TABLE IF EXISTS `transportation_bus_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_bus_services` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bus_id` bigint(20) NOT NULL,
  `benefit_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transportation_bus_services_bus_id_benefit_id_eb93e299_uniq` (`bus_id`,`benefit_id`),
  KEY `transportation_bus_s_benefit_id_f8644550_fk_transport` (`benefit_id`),
  CONSTRAINT `transportation_bus_s_benefit_id_f8644550_fk_transport` FOREIGN KEY (`benefit_id`) REFERENCES `transportation_benefit` (`id`),
  CONSTRAINT `transportation_bus_s_bus_id_9d745fe5_fk_transport` FOREIGN KEY (`bus_id`) REFERENCES `transportation_bus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_bus_services`
--

LOCK TABLES `transportation_bus_services` WRITE;
/*!40000 ALTER TABLE `transportation_bus_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportation_bus_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_component`
--

DROP TABLE IF EXISTS `transportation_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `position_x` smallint(5) unsigned NOT NULL,
  `position_y` smallint(5) unsigned NOT NULL,
  `width` smallint(5) unsigned NOT NULL,
  `length` smallint(5) unsigned NOT NULL,
  `kind` varchar(10) NOT NULL,
  `polymorphic_ctype_id` int(11) DEFAULT NULL,
  `floors_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transportation_compo_polymorphic_ctype_id_6cd7ef04_fk_django_co` (`polymorphic_ctype_id`),
  KEY `transportation_compo_floors_id_a97b421c_fk_transport` (`floors_id`),
  CONSTRAINT `transportation_compo_floors_id_a97b421c_fk_transport` FOREIGN KEY (`floors_id`) REFERENCES `transportation_floor` (`id`),
  CONSTRAINT `transportation_compo_polymorphic_ctype_id_6cd7ef04_fk_django_co` FOREIGN KEY (`polymorphic_ctype_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_component`
--

LOCK TABLES `transportation_component` WRITE;
/*!40000 ALTER TABLE `transportation_component` DISABLE KEYS */;
INSERT INTO `transportation_component` VALUES (1,0,0,2,1,'seat',14,2),(2,1,0,2,1,'seat',14,2),(3,4,0,2,1,'seat',14,2),(4,5,0,2,1,'seat',14,2),(5,0,2,2,1,'seat',14,2),(6,1,2,2,1,'seat',14,2),(7,4,2,2,1,'seat',14,2),(8,5,2,2,1,'seat',14,2),(9,0,4,2,1,'seat',14,2),(10,1,4,2,1,'seat',14,2),(11,4,4,2,1,'space',13,2),(12,5,4,2,1,'space',13,2),(13,0,6,2,1,'seat',14,2),(14,1,6,2,1,'seat',14,2),(15,4,6,2,1,'space',13,2),(16,5,6,2,1,'space',13,2),(17,0,8,2,1,'seat',14,2),(18,1,8,2,1,'seat',14,2),(19,4,8,2,1,'seat',14,2),(20,5,8,2,1,'seat',14,2),(21,0,10,2,1,'seat',14,2),(22,1,10,2,1,'seat',14,2),(23,4,10,2,1,'seat',14,2),(24,5,10,2,1,'seat',14,2),(25,0,12,2,1,'seat',14,2),(26,1,12,2,1,'seat',14,2),(27,4,12,2,1,'seat',14,2),(28,5,12,2,1,'seat',14,2),(29,0,14,2,1,'seat',14,2),(30,1,14,2,1,'seat',14,2),(31,4,14,2,1,'seat',14,2),(32,5,14,2,1,'seat',14,2),(33,0,16,2,1,'seat',14,2),(34,1,16,2,1,'seat',14,2),(35,4,16,2,1,'seat',14,2),(36,5,16,2,1,'seat',14,2),(37,0,18,2,1,'seat',14,2),(38,1,18,2,1,'seat',14,2),(39,4,18,2,1,'seat',14,2),(40,5,18,2,1,'seat',14,2),(41,0,20,2,1,'seat',14,2),(42,1,20,2,1,'seat',14,2),(43,4,20,2,1,'seat',14,2),(44,5,20,2,1,'seat',14,2),(45,0,22,2,1,'seat',14,2),(46,1,22,2,1,'seat',14,2),(47,4,22,2,1,'seat',14,2),(48,5,22,2,1,'seat',14,2),(49,0,24,2,1,'seat',14,2),(50,1,24,2,1,'seat',14,2),(51,4,22,2,1,'seat',14,2),(52,5,22,2,1,'seat',14,1),(53,0,0,2,1,'seat',14,1),(54,1,0,2,1,'seat',14,1),(55,5,0,2,1,'seat',14,1),(56,0,2,2,1,'seat',14,1),(57,1,2,2,1,'seat',14,1),(58,5,2,2,1,'seat',14,1),(59,0,4,2,1,'seat',14,1),(60,1,4,2,1,'seat',14,1),(61,1,6,2,1,'seat',14,1),(62,5,6,2,1,'seat',14,1),(63,0,6,2,1,'seat',14,1),(64,5,6,2,1,'seat',14,1),(65,0,0,2,1,'seat',14,4),(66,1,0,2,1,'seat',14,4),(67,5,0,2,1,'seat',14,4),(68,0,2,2,1,'seat',14,4),(69,1,2,2,1,'seat',14,4),(70,5,2,2,1,'seat',14,4),(71,0,4,2,1,'seat',14,4),(72,1,4,2,1,'seat',14,4),(73,5,4,2,1,'seat',14,4),(74,0,6,2,1,'seat',14,4),(75,1,6,2,1,'seat',14,4),(76,5,6,2,1,'seat',14,4),(77,0,8,2,1,'seat',14,4),(78,1,8,2,1,'seat',14,4),(79,5,8,2,1,'seat',14,4),(80,0,10,2,1,'seat',14,4),(81,1,10,2,1,'seat',14,4),(82,5,10,2,1,'seat',14,4),(83,0,12,2,1,'seat',14,4),(84,1,12,2,1,'seat',14,4),(85,5,12,2,1,'seat',14,4),(86,0,14,2,1,'seat',14,4),(87,1,14,2,1,'seat',14,4),(88,5,14,2,1,'seat',14,4),(89,0,16,2,1,'seat',14,4),(90,1,16,2,1,'seat',14,4),(91,5,16,2,1,'seat',14,4),(92,0,18,2,1,'seat',14,4),(93,1,18,2,1,'seat',14,4),(94,5,18,2,1,'seat',14,4),(95,0,0,2,1,'seat',14,3),(96,1,0,2,1,'seat',14,3),(97,5,0,2,1,'seat',14,3),(98,0,2,2,1,'seat',14,3),(99,1,2,2,1,'seat',14,3),(100,5,2,2,1,'seat',14,3),(101,0,4,2,1,'seat',14,3),(102,1,4,2,1,'seat',14,3),(103,5,4,2,1,'seat',14,3),(104,0,6,2,1,'seat',14,3),(105,1,6,2,1,'seat',14,3),(106,5,6,2,1,'seat',14,6),(107,0,0,2,1,'seat',14,6),(108,1,0,2,1,'seat',14,6),(109,5,0,2,1,'seat',14,6),(110,5,2,2,1,'seat',14,6),(111,5,4,2,1,'seat',14,6),(112,0,2,2,1,'seat',14,6),(113,1,2,2,1,'seat',14,6),(114,0,4,2,1,'seat',14,6),(115,1,4,2,1,'seat',14,6),(116,0,6,2,1,'seat',14,6),(117,1,6,2,1,'seat',14,6),(118,5,6,2,1,'seat',14,6),(119,0,8,2,1,'seat',14,6),(120,1,8,2,1,'seat',14,6),(121,5,8,2,1,'seat',14,6),(122,0,10,2,1,'seat',14,6),(123,1,10,2,1,'seat',14,6),(124,5,10,2,1,'seat',14,6),(125,0,12,2,1,'seat',14,6),(126,1,12,2,1,'seat',14,6),(127,5,12,2,1,'seat',14,6),(128,0,14,2,1,'seat',14,6),(129,1,14,2,1,'seat',14,6),(130,5,14,2,1,'seat',14,6),(131,0,16,2,1,'seat',14,6),(132,1,16,2,1,'seat',14,6),(133,5,16,2,1,'seat',14,6),(134,0,18,2,1,'seat',14,6),(135,1,18,2,1,'seat',14,6),(136,5,18,2,1,'seat',14,6),(137,0,20,2,1,'seat',14,6),(138,1,20,2,1,'seat',14,6),(139,5,20,2,1,'seat',14,6),(140,0,0,2,1,'seat',14,5),(141,1,0,2,1,'seat',14,5),(142,5,0,2,1,'seat',14,5),(143,0,2,2,1,'seat',14,5),(144,1,2,2,1,'seat',14,5),(145,5,2,2,1,'seat',14,5),(146,0,4,2,1,'seat',14,5),(147,1,4,2,1,'seat',14,5),(148,5,4,2,1,'seat',14,5),(149,0,6,2,1,'seat',14,5),(150,1,6,2,1,'seat',14,5),(151,5,6,2,1,'seat',14,5),(155,1,1,1,1,'seat',14,NULL);
/*!40000 ALTER TABLE `transportation_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_floor`
--

DROP TABLE IF EXISTS `transportation_floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_floor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` smallint(5) unsigned NOT NULL,
  `length` smallint(5) unsigned NOT NULL,
  `width` smallint(5) unsigned NOT NULL,
  `seats` smallint(5) unsigned NOT NULL,
  `layout_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transportation_floor_layout_id_643be067_fk_transport` (`layout_id`),
  CONSTRAINT `transportation_floor_layout_id_643be067_fk_transport` FOREIGN KEY (`layout_id`) REFERENCES `transportation_layout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_floor`
--

LOCK TABLES `transportation_floor` WRITE;
/*!40000 ALTER TABLE `transportation_floor` DISABLE KEYS */;
INSERT INTO `transportation_floor` VALUES (1,1,0,0,12,1),(2,2,0,0,48,1),(3,1,0,0,12,2),(4,2,0,0,31,2),(5,1,0,0,12,3),(6,2,0,0,30,3),(7,2,2,4,36,3);
/*!40000 ALTER TABLE `transportation_floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_layout`
--

DROP TABLE IF EXISTS `transportation_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_layout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(40) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_layout`
--

LOCK TABLES `transportation_layout` WRITE;
/*!40000 ALTER TABLE `transportation_layout` DISABLE KEYS */;
INSERT INTO `transportation_layout` VALUES (1,'2021-11-10 09:52:26.000000','2021-11-10 09:52:35.000000','Mixto 60 Asientos','2+2, Mixto,Activo, Video (60 Asientos.) '),(2,'2021-11-10 09:52:26.000000','2021-11-10 09:52:35.000000','Cama 42','2+1, Salon Cama,Activo, Video (42 Asientos.) '),(3,'2021-11-10 09:52:26.000000','2021-11-10 09:52:35.000000','Bus Cama 43','2+2, Salon Cama,Activo, Video (43 Asientos.)'),(5,'2021-12-28 02:36:39.590360','2021-12-28 02:36:39.590384','cama 42','asdfgadasfa');
/*!40000 ALTER TABLE `transportation_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_seat`
--

DROP TABLE IF EXISTS `transportation_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_seat` (
  `component_ptr_id` bigint(20) NOT NULL,
  `seat_kind_id` bigint(20) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`component_ptr_id`),
  KEY `transportation_seat_seat_kind_id_5278f33d_fk_transport` (`seat_kind_id`),
  CONSTRAINT `transportation_seat_component_ptr_id_760d51e5_fk_transport` FOREIGN KEY (`component_ptr_id`) REFERENCES `transportation_component` (`id`),
  CONSTRAINT `transportation_seat_seat_kind_id_5278f33d_fk_transport` FOREIGN KEY (`seat_kind_id`) REFERENCES `transportation_seattype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_seat`
--

LOCK TABLES `transportation_seat` WRITE;
/*!40000 ALTER TABLE `transportation_seat` DISABLE KEYS */;
INSERT INTO `transportation_seat` VALUES (1,1,'1'),(2,1,'2'),(3,1,'3'),(4,1,'4'),(5,1,'5'),(6,1,'6'),(7,1,'7'),(8,1,'8'),(9,1,'9'),(10,1,'10'),(11,1,'11'),(12,1,'12'),(13,1,'13'),(14,1,'14'),(15,1,'15'),(16,1,'16'),(17,1,'17'),(18,1,'18'),(19,1,'19'),(20,1,'20'),(21,1,'21'),(22,1,'22'),(23,1,'23'),(24,1,'24'),(25,1,'25'),(26,1,'26'),(27,1,'27'),(28,1,'28'),(29,1,'29'),(30,1,'30'),(31,1,'31'),(32,1,'32'),(33,1,'33'),(34,1,'34'),(35,1,'35'),(36,1,'36'),(37,1,'37'),(38,1,'38'),(39,1,'39'),(40,1,'40'),(41,1,'41'),(42,1,'42'),(43,1,'43'),(44,1,'44'),(45,1,'45'),(46,1,'46'),(47,1,'47'),(48,1,'48'),(49,1,'49'),(50,1,'50'),(51,1,'51'),(52,1,'52'),(53,1,'53'),(54,1,'54'),(55,1,'55'),(56,1,'56'),(57,1,'57'),(58,1,'58'),(59,1,'59'),(60,1,'60'),(61,1,'61'),(62,1,'62'),(63,1,'63'),(64,1,'64'),(65,1,'1'),(66,1,'2'),(67,1,'3'),(68,1,'4'),(69,1,'5'),(70,1,'6'),(71,1,'7'),(72,1,'8'),(73,1,'9'),(74,1,'10'),(75,1,'11'),(76,1,'12'),(77,1,'13'),(78,1,'14'),(79,1,'15'),(80,1,'16'),(81,1,'17'),(82,1,'18'),(83,1,'19'),(84,1,'20'),(85,1,'21'),(86,1,'22'),(87,1,'23'),(88,1,'24'),(89,1,'25'),(90,1,'26'),(91,1,'27'),(92,1,'28'),(93,1,'29'),(94,1,'30'),(95,1,'31'),(96,1,'32'),(97,1,'33'),(98,1,'34'),(99,1,'35'),(100,1,'36'),(101,1,'37'),(102,1,'38'),(103,1,'39'),(104,1,'40'),(105,1,'41'),(106,1,'42'),(107,1,'1'),(108,1,'2'),(109,1,'3'),(110,1,'4'),(111,1,'5'),(112,1,'6'),(113,1,'7'),(114,1,'8'),(115,1,'9'),(116,1,'10'),(117,1,'11'),(118,1,'12'),(119,1,'13'),(120,1,'14'),(121,1,'15'),(122,1,'16'),(123,1,'17'),(124,1,'18'),(125,1,'19'),(126,1,'20'),(127,1,'21'),(128,1,'22'),(129,1,'23'),(130,1,'24'),(131,1,'25'),(132,1,'26'),(133,1,'27'),(134,1,'28'),(135,1,'29'),(136,1,'30'),(137,1,'31'),(138,1,'32'),(139,1,'33'),(140,1,'1'),(141,1,'2'),(142,1,'3'),(143,1,'4'),(144,1,'5'),(145,1,'6'),(146,1,'7'),(147,1,'8'),(148,1,'9'),(149,1,'10'),(150,1,'11'),(151,1,'12'),(155,4,'001');
/*!40000 ALTER TABLE `transportation_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportation_seattype`
--

DROP TABLE IF EXISTS `transportation_seattype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportation_seattype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportation_seattype`
--

LOCK TABLES `transportation_seattype` WRITE;
/*!40000 ALTER TABLE `transportation_seattype` DISABLE KEYS */;
INSERT INTO `transportation_seattype` VALUES (1,'Normal'),(2,'Semi cama'),(3,'Cama'),(4,'Asiento conductor'),(5,'Asiento para personas con capacidades diferentes');
/*!40000 ALTER TABLE `transportation_seattype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser`
--

DROP TABLE IF EXISTS `users_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
  `maternal_last_name` varchar(70) NOT NULL,
  `document_number` varchar(12) NOT NULL,
  `cellphone` varchar(15) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `sex` varchar(1) NOT NULL,
  `work_address` varchar(120) DEFAULT NULL,
  `work_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `document_number` (`document_number`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser`
--

LOCK TABLES `users_customuser` WRITE;
/*!40000 ALTER TABLE `users_customuser` DISABLE KEYS */;
INSERT INTO `users_customuser` VALUES (1,'pbkdf2_sha256$260000$TpO45uHqyrguxcc7Sec6EC$fB7rvmFs+/vlWkJ9K8mmg4SDTMIG8NJH+KFxfKRfTW0=','2021-12-28 12:19:53.399641',1,'ignacio','Ignacio','Figueroa','jfigueroa@linets.cl',1,1,'2021-11-12 12:29:28.000000','Figueroa','123123123','123123123',NULL,'',NULL,'M',NULL,NULL),(2,'pbkdf2_sha256$260000$nSxerDu4704slM6fWgnOSE$fKbSslTjcheTHbtAWxD785HDTldeu4f1FY9LDDLNKRY=','2021-12-27 20:29:56.218016',1,'israel','Israel','Castro','israel@linets.cl',1,1,'2021-11-12 12:30:21.000000','Castro','124124124','124124124',NULL,'',NULL,'M',NULL,NULL),(3,'pbkdf2_sha256$260000$hzbhhsXfbTQzklJBOmwPpi$GoL6HMFyZf/yPxAB7y0uLo4qUsBGtZik/4Af+Gx1y/4=',NULL,1,'margaret','Margaret','Comene','margaret@linets.cl',1,1,'2021-11-12 12:31:31.165582','Comene','125125125','125125125',NULL,'',NULL,'',NULL,NULL),(4,'pbkdf2_sha256$260000$1vTnjIqcRfsxaz0vEuqN1D$StaZQ11kIEWGiwUhthgMJVFBNmttjwwQ9Q9Xuw9KIxo=','2021-12-26 23:18:23.359295',1,'admin','Admin','Admin','admin@linets.cl',1,1,'2021-11-12 12:33:05.811597','Admin','122122122','122122122',NULL,'',NULL,'',NULL,NULL),(35,'pbkdf2_sha256$260000$uWVripF3laMgb4GuF4TnGn$V0URRGBRFY1h25ptY48pqChUIZQG3jX/tkAlXFcl+KQ=',NULL,1,'rmontevilla','Rosemary','Montevilla','1234@gmail.com',1,1,'2021-11-18 12:23:27.406506','Tancara','3721161','987322068','987322068','','string','F','string','string'),(40,'pbkdf2_sha256$260000$NPzM0I7xSmQHOW6hRY5578$ubOqV6DjCaj+46rp3xbazPv1At0nWCv5ifPgmGMDTJw=',NULL,1,'Csepulveda','Cristian','Sepulveda','elmaildelcris@gmail.com',1,1,'2021-11-22 17:31:01.473211','Valenzuela','13.082.622-9','987322068','987322068','','string','M','string','string'),(47,'pbkdf2_sha256$260000$BchbZnkf2lh4NaUzgHLqWx$mLBuxoRyz64vtfrhl0zohQAmcvV80hdJR19b4j93Cvc=',NULL,1,'cris','cristian','sepúlveda','cserv@gmail.com',1,1,'2021-11-30 14:35:40.244466','val','130826229','987654342','29866542','','string','M','string','string'),(49,'pbkdf2_sha256$260000$uaNgsFkg65kcxAEp2W2eJ0$KPQ7jN817o2H2aJ1LHw8GFYjdqXBgWG7LUl4TjAJ/ko=',NULL,1,'Jfigueroa','Ignacio','Figueroa','Jfigueroa@linets.cl',1,1,'2021-12-01 14:13:13.748440','zuñiga','19.186.509-k','987322068','987322068','','string','M','string','string'),(50,'pbkdf2_sha256$260000$saGVxqvojF8ExqNM5r4BHZ$0g9un4maQuDmE34UdeZPjKjKJG/1h6PaqV7rF3NnkDI=',NULL,1,'SSarabia','Sara','Sarabia','1234566@andimar.cl',1,1,'2021-12-01 19:12:15.816357','Caceres','5.697.913-1','987322068','987322068','','string','F','string','string'),(51,'pbkdf2_sha256$260000$G7Sn9PNLzipyEAGqQEYmEV$PpXxZooua+RG72VvUbhQrVhxPSeoLURCZn6z/5NUHsQ=',NULL,1,'Acancino','Alfredo','Cancino','Acancino@andimar.cl',1,1,'2021-12-02 10:14:35.802326','Vargas','19.238.278-5','987322068','987322068','','string','M','string','string'),(52,'pbkdf2_sha256$260000$Aa0BAP1fThA0RwzcDB2JIN$HOWkvETnV5cef5GkM9ys7WF6CkBbSuFaqxzx/E7DYgI=',NULL,1,'icastro','israel','castro','icastro@linets.cl',1,1,'2021-12-02 11:33:11.566005','ortega','18.695.756-3','987322068','987322068','','string','M','string','string'),(53,'pbkdf2_sha256$260000$EECQPTgyHeYjqyYGCY7DIM$ahkS3F4o22y2LUNs5F+x93AMBJDH9Az3CgK6WaA5P4M=','2021-12-27 13:16:53.079818',1,'carlo','Carlo','Alva','candre@linets.cl',1,1,'2021-12-10 10:17:32.896606','Cohello','71313909','987199629',NULL,'',NULL,'',NULL,NULL),(54,'pbkdf2_sha256$260000$mNjAnxBQJ2IpjjJzmGCw1O$NrS344rtaCvxwJh8sBjeTVQJMYdOSIJ50evR4M1uXgE=',NULL,1,'ea','mollit ad dolore','ex adipisicing','NZSNqaKODuR-ANO@fzldounscsimuycpdzvhcmcxpotunp.ys',1,1,'2021-12-15 11:22:17.963933','dolor labore dol','consequat','999999','labore','','pariatur mollit','M','cupidatat culpa et cillum in','ut'),(55,'pbkdf2_sha256$260000$PzGW9W886M6igUCHTDvUOg$8Y/yTdmONjIk6QHNiGmq1+vk2LZEWoBz2K2VqWwC2EE=',NULL,1,'DICE','mollit ad dolore','ex adipisicing','a@a.com',1,1,'2021-12-15 11:23:34.933176','dolor labore dol','qqqqqqq','999999','labore','','pariatur mollit','M','cupidatat culpa et cillum in','ut'),(56,'pbkdf2_sha256$260000$wIh9bTLApekI8C9MItDgV2$N0UPuBI/Tnz0s7Qg5C+xzeLZqYnSQUnPGrTik/bZRKI=',NULL,1,'Ross','Ross','223dsffs','rmontevilla@linets.cl',1,1,'2021-12-23 09:20:55.052614','123Montevilla','11.111.111-1','2344444rdddd','234fds','','string','F','string','string'),(57,'pbkdf2_sha256$260000$WqUW7JGT4sQmkBKt9ESe5N$AHpKiyw5WESZecgu1Id9HtjF21frAdstIkK7z+Z+um0=',NULL,0,'test','','','',0,1,'2022-01-03 16:33:40.760189','','','',NULL,'',NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `users_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_groups`
--

DROP TABLE IF EXISTS `users_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_customuser_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_groups`
--

LOCK TABLES `users_customuser_groups` WRITE;
/*!40000 ALTER TABLE `users_customuser_groups` DISABLE KEYS */;
INSERT INTO `users_customuser_groups` VALUES (6,49,1),(7,50,1),(8,51,1),(10,52,1),(11,54,1),(12,55,1),(14,56,1);
/*!40000 ALTER TABLE `users_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_user_permissions`
--

DROP TABLE IF EXISTS `users_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_customuser_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_user_permissions`
--

LOCK TABLES `users_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_customuser_user_permissions` DISABLE KEYS */;
INSERT INTO `users_customuser_user_permissions` VALUES (18,35,1),(63,40,1),(72,47,1),(77,49,1),(82,52,1),(78,54,1),(80,55,1);
/*!40000 ALTER TABLE `users_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-06 13:55:25
