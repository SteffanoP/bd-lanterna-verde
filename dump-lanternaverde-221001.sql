-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: Lanterna_Verde
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Administrador`
--

DROP TABLE IF EXISTS `Administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrador` (
  `email` varchar(30) NOT NULL,
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `funcao` enum('Diretor','Gerente') DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `email` (`email`),
  CONSTRAINT `Administrador_ibfk_1` FOREIGN KEY (`email`) REFERENCES `Usuario` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrador`
--

LOCK TABLES `Administrador` WRITE;
/*!40000 ALTER TABLE `Administrador` DISABLE KEYS */;
INSERT INTO `Administrador` VALUES ('gio@gmail.com',1,'Diretor'),('carla@gmail.com',2,'Diretor'),('luana@gmail.com',3,'Gerente');
/*!40000 ALTER TABLE `Administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Analista`
--

DROP TABLE IF EXISTS `Analista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Analista` (
  `email` varchar(30) NOT NULL,
  `cpf` int NOT NULL,
  `disponivel` tinyint(1) DEFAULT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `email` (`email`),
  CONSTRAINT `Analista_ibfk_1` FOREIGN KEY (`email`) REFERENCES `Usuario` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Analista`
--

LOCK TABLES `Analista` WRITE;
/*!40000 ALTER TABLE `Analista` DISABLE KEYS */;
INSERT INTO `Analista` VALUES ('caio@gmail.com',245678912,1,'Ambiental'),('marcos@hotmail.com',692581478,1,'Sustentável'),('luiza@gmail.com',894561231,0,'Florestal');
/*!40000 ALTER TABLE `Analista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Avalia`
--

DROP TABLE IF EXISTS `Avalia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Avalia` (
  `idConsumidor` int NOT NULL,
  `cnpjEmpresa` int NOT NULL,
  `nota` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`idConsumidor`,`cnpjEmpresa`),
  KEY `cnpjEmpresa` (`cnpjEmpresa`),
  CONSTRAINT `Avalia_ibfk_1` FOREIGN KEY (`idConsumidor`) REFERENCES `Consumidor` (`id_cons`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Avalia_ibfk_2` FOREIGN KEY (`cnpjEmpresa`) REFERENCES `Empresa` (`cnpj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Avalia`
--

LOCK TABLES `Avalia` WRITE;
/*!40000 ALTER TABLE `Avalia` DISABLE KEYS */;
INSERT INTO `Avalia` VALUES (1,146745612,5.0),(2,315487432,3.2),(3,254796863,4.0);
/*!40000 ALTER TABLE `Avalia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comenta`
--

DROP TABLE IF EXISTS `Comenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comenta` (
  `idConsumidor` int NOT NULL,
  `cnpjEmpresa` int NOT NULL,
  `comentario` char(200) DEFAULT NULL,
  PRIMARY KEY (`idConsumidor`,`cnpjEmpresa`),
  KEY `cnpjEmpresa` (`cnpjEmpresa`),
  CONSTRAINT `Comenta_ibfk_1` FOREIGN KEY (`idConsumidor`) REFERENCES `Consumidor` (`id_cons`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Comenta_ibfk_2` FOREIGN KEY (`cnpjEmpresa`) REFERENCES `Empresa` (`cnpj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comenta`
--

LOCK TABLES `Comenta` WRITE;
/*!40000 ALTER TABLE `Comenta` DISABLE KEYS */;
INSERT INTO `Comenta` VALUES (1,146745612,'Roupas incríveis! Sendo o tecido, de fato, sustentável.'),(2,315487432,'Objetos de baixa qualidade.'),(3,254796863,'As roupas são interessantes.');
/*!40000 ALTER TABLE `Comenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Consumidor`
--

DROP TABLE IF EXISTS `Consumidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Consumidor` (
  `id_cons` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_cons`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consumidor`
--

LOCK TABLES `Consumidor` WRITE;
/*!40000 ALTER TABLE `Consumidor` DISABLE KEYS */;
INSERT INTO `Consumidor` VALUES (1,'Bárbara'),(2,'Luan'),(3,'Alice');
/*!40000 ALTER TABLE `Consumidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa` (
  `email` varchar(30) NOT NULL,
  `cnpj` int NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cnpj`),
  KEY `email` (`email`),
  CONSTRAINT `Empresa_ibfk_1` FOREIGN KEY (`email`) REFERENCES `Usuario` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
INSERT INTO `Empresa` VALUES ('bellemodas@hotmail.com',146745612,'Rua das Flores, 281, Piedade'),('sportsfc@gmail.com',254796863,'Rua Gabriela, 85, Recife'),('artefatos@gmail.com',315487432,'Rua Amarela, 175, Olinda');
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EspecialidadeEmp`
--

DROP TABLE IF EXISTS `EspecialidadeEmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EspecialidadeEmp` (
  `cnpjEmpresa` int NOT NULL,
  `especialidade` varchar(15) NOT NULL,
  PRIMARY KEY (`cnpjEmpresa`,`especialidade`),
  CONSTRAINT `EspecialidadeEmp_ibfk_1` FOREIGN KEY (`cnpjEmpresa`) REFERENCES `Empresa` (`cnpj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EspecialidadeEmp`
--

LOCK TABLES `EspecialidadeEmp` WRITE;
/*!40000 ALTER TABLE `EspecialidadeEmp` DISABLE KEYS */;
INSERT INTO `EspecialidadeEmp` VALUES (146745612,'Roupas'),(254796863,'Roupa'),(315487432,'Recicláveis');
/*!40000 ALTER TABLE `EspecialidadeEmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FazAnalise`
--

DROP TABLE IF EXISTS `FazAnalise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FazAnalise` (
  `cpfAnalista` int NOT NULL,
  `cnpjEmpresa` int NOT NULL,
  `comentario` text,
  `score` decimal(3,2) DEFAULT NULL,
  `autorizada` tinyint(1) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  PRIMARY KEY (`cpfAnalista`,`cnpjEmpresa`),
  KEY `cnpjEmpresa` (`cnpjEmpresa`),
  CONSTRAINT `FazAnalise_ibfk_1` FOREIGN KEY (`cpfAnalista`) REFERENCES `Analista` (`cpf`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FazAnalise_ibfk_2` FOREIGN KEY (`cnpjEmpresa`) REFERENCES `Empresa` (`cnpj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FazAnalise`
--

LOCK TABLES `FazAnalise` WRITE;
/*!40000 ALTER TABLE `FazAnalise` DISABLE KEYS */;
INSERT INTO `FazAnalise` VALUES (245678912,146745612,'A empresa não apresenta falhas nas suas políticas sustentáveis.',5.00,1,'2022-09-26'),(692581478,254796863,'A empresa não apresenta falhas consideráveis nas suas políticas sustentáveis.',4.70,1,'2022-09-09'),(692581478,315487432,'Empresa nota 10.',9.00,1,'2022-09-30'),(894561231,315487432,'A empresa apresenta falhas nas suas políticas sustentáveis.',2.50,0,'2022-10-10');
/*!40000 ALTER TABLE `FazAnalise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Noticia`
--

DROP TABLE IF EXISTS `Noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Noticia` (
  `id_noti` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `autor` varchar(30) DEFAULT NULL,
  `corpo` mediumtext,
  `dataHora` datetime DEFAULT NULL,
  `idAdmin` int NOT NULL,
  PRIMARY KEY (`id_noti`),
  KEY `idAdmin` (`idAdmin`),
  CONSTRAINT `Noticia_ibfk_1` FOREIGN KEY (`idAdmin`) REFERENCES `Administrador` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Noticia`
--

LOCK TABLES `Noticia` WRITE;
/*!40000 ALTER TABLE `Noticia` DISABLE KEYS */;
INSERT INTO `Noticia` VALUES (1,'Empresa x ganha prêmio','Giovani','Após avalização baixa no site Lanter Verde, a empresa resolveu rever suas atitudes e a melhora foi excelente.','2022-09-26 11:02:00',1),(2,'Empresa perde pontos','Carla','Empresa perde pontos por ser muito ruim','2022-09-22 10:30:20',2),(3,'Empresa do grupo x cresce','Luana','Empresa do grupo x se destaca pelo seu processo de reciclagem','2022-09-20 19:02:00',3);
/*!40000 ALTER TABLE `Noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Notícias`
--

DROP TABLE IF EXISTS `Notícias`;
/*!50001 DROP VIEW IF EXISTS `Notícias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Notícias` AS SELECT 
 1 AS `Título`,
 1 AS `Autor`,
 1 AS `Corpo`,
 1 AS `Data`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SolicitacaoAnalise`
--

DROP TABLE IF EXISTS `SolicitacaoAnalise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SolicitacaoAnalise` (
  `id_soli` int NOT NULL AUTO_INCREMENT,
  `cnpjEmpresa` int NOT NULL,
  `descricao` tinytext,
  `dataHora` datetime DEFAULT NULL,
  PRIMARY KEY (`id_soli`),
  KEY `cnpjEmpresa` (`cnpjEmpresa`),
  CONSTRAINT `SolicitacaoAnalise_ibfk_1` FOREIGN KEY (`cnpjEmpresa`) REFERENCES `Empresa` (`cnpj`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SolicitacaoAnalise`
--

LOCK TABLES `SolicitacaoAnalise` WRITE;
/*!40000 ALTER TABLE `SolicitacaoAnalise` DISABLE KEYS */;
INSERT INTO `SolicitacaoAnalise` VALUES (1,146745612,'Peço a avaliação da empresa, pois não aguento tanto comercial lixo','2022-09-26 11:08:00'),(2,315487432,'Peço a avaliação da empresa, pois ela descarta seu lixo de maneira incorreta','2022-09-26 11:08:00'),(3,254796863,'A empresa pode não estar reciclando seus tecidos como diz que faz','2022-09-26 11:08:00');
/*!40000 ALTER TABLE `SolicitacaoAnalise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SugestaoDeEmpresa`
--

DROP TABLE IF EXISTS `SugestaoDeEmpresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SugestaoDeEmpresa` (
  `id_suge` int NOT NULL AUTO_INCREMENT,
  `cnpj` int DEFAULT NULL,
  `nomeEmpresa` varchar(30) NOT NULL,
  `informacaoContato` int DEFAULT NULL,
  `idConsumidor` int NOT NULL,
  `descricao` tinytext,
  `qtd_sugestao_empresa` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_suge`),
  KEY `idConsumidor` (`idConsumidor`),
  CONSTRAINT `SugestaoDeEmpresa_ibfk_1` FOREIGN KEY (`idConsumidor`) REFERENCES `Consumidor` (`id_cons`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SugestaoDeEmpresa`
--

LOCK TABLES `SugestaoDeEmpresa` WRITE;
/*!40000 ALTER TABLE `SugestaoDeEmpresa` DISABLE KEYS */;
INSERT INTO `SugestaoDeEmpresa` VALUES (1,146745612,'Google',NULL,1,'A empresa maltrata seus programadores',1),(2,315487432,'Amazon',NULL,2,'Descarte incorreto dos produtos excedidos',1),(3,254796863,'SpaceX',NULL,3,'A empresa produz muito lixo espacial.',1);
/*!40000 ALTER TABLE `SugestaoDeEmpresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `email` varchar(30) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `senha` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES ('artefatos@gmail.com','Davi','artdavi'),('bellemodas@hotmail.com','Ana','anab123'),('caio@gmail.com','Caio','senha'),('carla@gmail.com','Carla','admin'),('gio@gmail.com','Giovani','1234'),('luana@gmail.com','Luana','123'),('luiza@gmail.com','Luiza','luiza'),('marcos@hotmail.com','Marcos','m123'),('sportsfc@gmail.com','Paula','sportsp');
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `avaliacaoConsumidor`
--

DROP TABLE IF EXISTS `avaliacaoConsumidor`;
/*!50001 DROP VIEW IF EXISTS `avaliacaoConsumidor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `avaliacaoConsumidor` AS SELECT 
 1 AS `cnpj`,
 1 AS `cnpjEmpresa`,
 1 AS `nota`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!50001 DROP VIEW IF EXISTS `comentarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comentarios` AS SELECT 
 1 AS `cnpj`,
 1 AS `Consumidor`,
 1 AS `Comentario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `relatorio_empresa`
--

DROP TABLE IF EXISTS `relatorio_empresa`;
/*!50001 DROP VIEW IF EXISTS `relatorio_empresa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `relatorio_empresa` AS SELECT 
 1 AS `cnpj`,
 1 AS `comentario`,
 1 AS `score`,
 1 AS `deadline`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `solicitacoesdeanalise`
--

DROP TABLE IF EXISTS `solicitacoesdeanalise`;
/*!50001 DROP VIEW IF EXISTS `solicitacoesdeanalise`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `solicitacoesdeanalise` AS SELECT 
 1 AS `cnpjEmpresa`,
 1 AS `Descrição`,
 1 AS `Data`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `Notícias`
--

/*!50001 DROP VIEW IF EXISTS `Notícias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`steffano`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Notícias` AS select `Noticia`.`titulo` AS `Título`,`Noticia`.`autor` AS `Autor`,`Noticia`.`corpo` AS `Corpo`,`Noticia`.`dataHora` AS `Data` from `Noticia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `avaliacaoConsumidor`
--

/*!50001 DROP VIEW IF EXISTS `avaliacaoConsumidor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`steffano`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `avaliacaoConsumidor` AS select `e`.`cnpj` AS `cnpj`,`a`.`cnpjEmpresa` AS `cnpjEmpresa`,`a`.`nota` AS `nota` from (`Avalia` `a` join `Empresa` `e` on((`a`.`cnpjEmpresa` = `e`.`cnpj`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `comentarios`
--

/*!50001 DROP VIEW IF EXISTS `comentarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`steffano`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comentarios` AS select `Empresa`.`cnpj` AS `cnpj`,`Consumidor`.`nome` AS `Consumidor`,`Comenta`.`comentario` AS `Comentario` from (((`Consumidor` join `Comenta`) join `Empresa`) join `Usuario`) where ((`Comenta`.`idConsumidor` = `Consumidor`.`id_cons`) and (`Empresa`.`email` = `Usuario`.`email`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `relatorio_empresa`
--

/*!50001 DROP VIEW IF EXISTS `relatorio_empresa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`steffano`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `relatorio_empresa` AS select `Empresa`.`cnpj` AS `cnpj`,`FazAnalise`.`comentario` AS `comentario`,`FazAnalise`.`score` AS `score`,`FazAnalise`.`deadline` AS `deadline` from (`Empresa` join `FazAnalise` on((`Empresa`.`cnpj` = `FazAnalise`.`cnpjEmpresa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `solicitacoesdeanalise`
--

/*!50001 DROP VIEW IF EXISTS `solicitacoesdeanalise`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`steffano`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `solicitacoesdeanalise` AS select `SolicitacaoAnalise`.`cnpjEmpresa` AS `cnpjEmpresa`,`SolicitacaoAnalise`.`descricao` AS `Descrição`,`SolicitacaoAnalise`.`dataHora` AS `Data` from `SolicitacaoAnalise` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-01 19:01:41
