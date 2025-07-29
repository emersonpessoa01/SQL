CREATE DATABASE  IF NOT EXISTS `dbestoque` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbestoque`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: dbestoque
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `tbproduto`
--

DROP TABLE IF EXISTS `tbproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbproduto` (
  `CoProduto` int NOT NULL AUTO_INCREMENT,
  `NoProduto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CoProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbproduto`
--

LOCK TABLES `tbproduto` WRITE;
/*!40000 ALTER TABLE `tbproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbprodutorequisicao`
--

DROP TABLE IF EXISTS `tbprodutorequisicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbprodutorequisicao` (
  `IdProdutoRequisicao` int NOT NULL AUTO_INCREMENT,
  `CoRequisicao` int NOT NULL,
  `CoProduto` int NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`IdProdutoRequisicao`),
  KEY `fk_tbprodutorequisicaotbrequisicao` (`CoRequisicao`),
  KEY `fk_tbprodutorequisicaotbproduto` (`CoProduto`),
  CONSTRAINT `fk_tbprodutorequisicaotbproduto` FOREIGN KEY (`CoProduto`) REFERENCES `tbproduto` (`CoProduto`),
  CONSTRAINT `fk_tbprodutorequisicaotbrequisicao` FOREIGN KEY (`CoRequisicao`) REFERENCES `tbrequisicao` (`CoRequisicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbprodutorequisicao`
--

LOCK TABLES `tbprodutorequisicao` WRITE;
/*!40000 ALTER TABLE `tbprodutorequisicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbprodutorequisicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbrequisicao`
--

DROP TABLE IF EXISTS `tbrequisicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbrequisicao` (
  `CoRequisicao` int NOT NULL AUTO_INCREMENT,
  `DaRequisicao` date NOT NULL,
  `CoUsuario` int NOT NULL,
  `CoSetor` int NOT NULL,
  PRIMARY KEY (`CoRequisicao`),
  KEY `fk_tbusuariotbrequisicao` (`CoUsuario`),
  KEY `fk_tbsetortbrequisicao` (`CoSetor`),
  CONSTRAINT `fk_tbsetortbrequisicao` FOREIGN KEY (`CoSetor`) REFERENCES `tbsetor` (`CoSetor`),
  CONSTRAINT `fk_tbusuariotbrequisicao` FOREIGN KEY (`CoUsuario`) REFERENCES `tbusuario` (`CoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbrequisicao`
--

LOCK TABLES `tbrequisicao` WRITE;
/*!40000 ALTER TABLE `tbrequisicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbrequisicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbsetor`
--

DROP TABLE IF EXISTS `tbsetor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbsetor` (
  `CoSetor` int NOT NULL AUTO_INCREMENT,
  `NoSetor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CoSetor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsetor`
--

LOCK TABLES `tbsetor` WRITE;
/*!40000 ALTER TABLE `tbsetor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbsetor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbusuario`
--

DROP TABLE IF EXISTS `tbusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbusuario` (
  `CoUsuario` int NOT NULL AUTO_INCREMENT,
  `NoUsuario` varchar(50) NOT NULL,
  `NuCPF` int NOT NULL,
  PRIMARY KEY (`CoUsuario`),
  UNIQUE KEY `NoCPF` (`NuCPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbusuario`
--

LOCK TABLES `tbusuario` WRITE;
/*!40000 ALTER TABLE `tbusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbusuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-04 20:39:49
