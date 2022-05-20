-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: los_heroes_database
-- ------------------------------------------------------
-- Server version	5.7.33

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

CREATE DATABASE los_heroes_database;

USE los_heroes_database;


--
-- Table structure for table `comuna`
--

DROP TABLE IF EXISTS `comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comuna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_region` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comuna_region_idRegion_idx` (`id_region`),
  CONSTRAINT `fk_comuna_region_idRegion` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comuna`
--

LOCK TABLES `comuna` WRITE;
/*!40000 ALTER TABLE `comuna` DISABLE KEYS */;
INSERT INTO `comuna` VALUES (1,'puente alto',1),(2,'iquique',2),(3,'arauco',3);
/*!40000 ALTER TABLE `comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rut` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'123-1','google','tobalaba'),(2,'1234-1','microsoft','colon');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licencias_medicas`
--

DROP TABLE IF EXISTS `licencias_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licencias_medicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duracion` varchar(45) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `n_veces_reiniciado` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_calculo` datetime DEFAULT NULL,
  `es_digital` tinyint(4) DEFAULT NULL,
  `id_tipo_licencia` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_formato` int(11) DEFAULT NULL,
  `nombre_trabajador` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_licencia_sucursal_idSucursal_idx` (`id_sucursal`),
  KEY `fk_licencia_empresa_idEmpresa_idx` (`id_empresa`),
  KEY `fk_licencia_formato_idFormato_idx` (`id_formato`),
  KEY `fk_licencia_tipoLicen_idTipoLicen` (`id_tipo_licencia`),
  CONSTRAINT `fk_licencia_empresa_idEmpresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_licencia_formato_idFormato` FOREIGN KEY (`id_formato`) REFERENCES `tipo_formato_licencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_licencia_sucursal_idSucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_licencia_tipoLicen_idTipoLicen` FOREIGN KEY (`id_tipo_licencia`) REFERENCES `tipo_licencia_medica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licencias_medicas`
--

LOCK TABLES `licencias_medicas` WRITE;
/*!40000 ALTER TABLE `licencias_medicas` DISABLE KEYS */;
INSERT INTO `licencias_medicas` VALUES (1,'1 meses',50000,1,'2022-05-21 00:00:00','2022-06-21 00:00:00',1,1,1,1,1,'thomas'),(2,'2 meses',120000,0,'2022-05-21 00:00:00','2022-07-21 00:00:00',0,2,2,2,1,'chris'),(3,'1mes',40000,0,'2022-05-21 00:00:00','2022-06-21 00:00:00',1,1,1,1,1,'seba');
/*!40000 ALTER TABLE `licencias_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'metropolitana'),(2,'tarapaca'),(3,'biobio');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `habilitada` tinyint(4) DEFAULT NULL,
  `id_region` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sucursal_region_idRegion_idx` (`id_region`),
  CONSTRAINT `fk_sucursal_region_idRegion` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,'tobalaba','tobalaba',1,1),(2,'color','color',0,2);
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_formato_licencia`
--

DROP TABLE IF EXISTS `tipo_formato_licencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_formato_licencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_formato_licencia`
--

LOCK TABLES `tipo_formato_licencia` WRITE;
/*!40000 ALTER TABLE `tipo_formato_licencia` DISABLE KEYS */;
INSERT INTO `tipo_formato_licencia` VALUES (1,'maternal'),(2,'sanna');
/*!40000 ALTER TABLE `tipo_formato_licencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_licencia_medica`
--

DROP TABLE IF EXISTS `tipo_licencia_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_licencia_medica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_licencia_medica`
--

LOCK TABLES `tipo_licencia_medica` WRITE;
/*!40000 ALTER TABLE `tipo_licencia_medica` DISABLE KEYS */;
INSERT INTO `tipo_licencia_medica` VALUES (1,'digital'),(2,'mixta'),(3,'fisica');
/*!40000 ALTER TABLE `tipo_licencia_medica` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-20 18:56:56
