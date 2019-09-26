CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `devolucao`
--

DROP TABLE IF EXISTS `devolucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucao` (
  `cod_devolucao` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `data_devolucao` date DEFAULT NULL,
  `cod_emprestimo` int(5) unsigned NOT NULL,
  `multa` float unsigned DEFAULT '0',
  PRIMARY KEY (`cod_devolucao`),
  KEY `cod_emprestimo` (`cod_emprestimo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao`
--

LOCK TABLES `devolucao` WRITE;
/*!40000 ALTER TABLE `devolucao` DISABLE KEYS */;
INSERT INTO `devolucao` VALUES (1,'2019-06-04',2,0),(2,'2019-06-04',4,0),(3,'2019-06-04',7,0);
/*!40000 ALTER TABLE `devolucao` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_dateDevolucao before insert on devolucao for each row
begin
	set new.data_devolucao = NOW();
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_reserva2 before insert on devolucao for each row
begin
	set @var1 = (select e.cod_exemplar from emprestimo as e where e.cod_emprestimo = new.cod_emprestimo);
	set @var2 = (select a.id_usuario from reserva as a where a.cod_exemplar = @var1);
    if @var2 != '' then
		update reserva as r set r.data_disponivel = NOW(),situacao = 'S' where id_usuario = @var2 and cod_exemplar = @var1;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_devolucao after insert on devolucao for each row
begin
	update exemplar as e set e.situacao = 'D' where e.cod_exemplar = (select e.cod_exemplar from emprestimo as e where new.cod_emprestimo = e.cod_emprestimo);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emprestimo` (
  `cod_emprestimo` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `cod_exemplar` int(4) unsigned NOT NULL,
  `data_retirada` date DEFAULT NULL,
  `data_devolucao` date DEFAULT NULL,
  `id_bibliotecario` int(5) unsigned NOT NULL,
  `id_usuario` int(5) unsigned NOT NULL,
  PRIMARY KEY (`cod_emprestimo`),
  KEY `cod_exemplar` (`cod_exemplar`),
  KEY `id_bibliotecario` (`id_bibliotecario`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,1,'2019-06-04','2019-06-29',2,1),(2,2,'2019-06-04','2019-06-29',2,3),(3,3,'2019-06-04','2019-06-29',2,4),(4,4,'2019-06-04','2019-06-29',2,6),(5,5,'2019-06-04','2019-06-29',2,1),(6,6,'2019-06-04','2019-06-29',2,3),(7,7,'2019-06-04','2019-06-29',2,6),(8,2,'2019-06-13','2019-07-08',2,1),(9,4,'2019-06-15','2019-07-10',2,1);
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_calculaData before insert on emprestimo for each row
begin
	set new.data_retirada = NOW();
    set new.data_devolucao = DATE_ADD(new.data_retirada, INTERVAL 25 DAY);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_aluga before insert on emprestimo for each row
begin
	update exemplar as e set e.situacao = 'A' where new.cod_exemplar = e.cod_exemplar;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `cod_estado` enum('1','2','3') NOT NULL,
  `desc_estado` text,
  PRIMARY KEY (`cod_estado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES ('1','Novo'),('2','Usado'),('3','Velho');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemplar`
--

DROP TABLE IF EXISTS `exemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exemplar` (
  `cod_exemplar` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `cod_livro` int(4) unsigned NOT NULL,
  `ano` int(4) unsigned NOT NULL,
  `cod_estado` enum('1','2','3') NOT NULL,
  `situacao` enum('D','A','R') DEFAULT 'D',
  PRIMARY KEY (`cod_exemplar`),
  KEY `cod_livro` (`cod_livro`),
  KEY `cod_estado` (`cod_estado`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplar`
--

LOCK TABLES `exemplar` WRITE;
/*!40000 ALTER TABLE `exemplar` DISABLE KEYS */;
INSERT INTO `exemplar` VALUES (1,1,2002,'1','R'),(2,2,1989,'1','A'),(3,3,1999,'1','R'),(4,4,2006,'1','A'),(5,5,2001,'2','R'),(6,6,1997,'2','A'),(7,7,2008,'2','D'),(8,1,1870,'2','D'),(9,2,1871,'3','D'),(10,3,1926,'3','D'),(11,4,1350,'3','D'),(12,5,1956,'3','D'),(13,6,1982,'1','D'),(14,7,2000,'2','D');
/*!40000 ALTER TABLE `exemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livro` (
  `codigo` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `autor` varchar(20) DEFAULT NULL,
  `descricao` text,
  `foto` text,
  `ano_publicacao` int(11) NOT NULL DEFAULT '2000',
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'Dom Quixote','Miguel de Cervantes','“Dom Quixote de La Mancha não tem outros inimigos além dos que povoam sua mente enlouquecida. Seu cavalo não é um alazão imponente, seu escudeiro é um simples camponês da vizinhança e ele próprio foi ordenado cavaleiro por um estalajadeiro. ','https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiYj4au-ZriAhXVB9QKHXsRCxQQjRx6BAgBEAU&url=https%3A%2F%2Flivros.mercadolivre.com.br%2Fdom-quixote%252C-de-cervantes%252C-capa-dura%252C-verde-e-dourado&psig=AOvVaw1EhVhmTL0CjArmzkktKOoi&ust=1557920768981922',1605),(2,'Guerra e Paz','Liev Tolstói','‘Milhões de pessoas praticaram, umas contra as outras, uma quantidade tão inumerável de crimes, embustes, traições, roubos, fraudes, falsificações de dinheiro, pilhagens, incêndios e assassinatos, como não se encontra nos autos de todos os tribunais do mundo em séculos inteiros.','https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiA1u_E-ZriAhXJHLkGHY0qB1wQjRx6BAgBEAU&url=https%3A%2F%2Fwww.lpm.com.br%2Flivros%2Fgo.asp%3FLivroID%3D827200&psig=AOvVaw21LytwM7h4OKZMHYmBhIHZ&ust=1557920829416360',1869),(3,'A Montanha Mágica','Thomas Mann','Neste clássico da literatura alemã, Mann renova a tradição do Bildungsroman — o romance de formação — a partir da trajetória do jovem engenheiro Hans Castorp. Durante uma inesperada estadia em um sanatório para tuberculosos, Hans relaciona-se com uma miríade de personagens enfermos que encarnam os conflitos espirituais e ideológicos que antecedem a Primeira Guerra Mundial.','https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiT_Ym9-priAhW5IrkGHR7zANwQjRx6BAgBEAU&url=https%3A%2F%2Fwww.saraiva.com.br%2Fa-montanha-magica-9379102.html&psig=AOvVaw3le3rkdW4KUlatn_upKPBH&ust=1557921092635618',1924),(4,'A Divina Comédia','Dante Alighieri','Texto fundador da língua italiana, súmula da cosmovisão de toda uma época, monumento poético de rigor e beleza, obra magna da literatura universal. É fato que a ‘Comédia’ merece esses e muitos outros adjetivos de louvor, incluindo o “divina” que Boccaccio lhe deu já no século 14.','https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjc8OyT-5riAhVbIbkGHQbqA9AQjRx6BAgBEAU&url=https%3A%2F%2Fwww.travessa.com.br%2Fa-divina-comedia-8-ed-2006%2Fartigo%2Fc205d86d-54c2-420d-bdb5-0552100738d5&psig=AOvVaw2Tv4sBu6ZBwNImyAqBhaTO&ust=1557921272363162',1321),(5,'As Crônicas de Nárnia','Clive Staples','É uma série de filmes de fantasia produzida pelo Walden Media e distribuída pela Disney e Fox. É baseada nos livros da série de mesmo nome escrita pelo irlandês C.S. Lewis. ','https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwji68Sz-5riAhWnEbkGHTCaAKUQjRx6BAgBEAU&url=https%3A%2F%2Fwww.amazon.com.br%2FAs-Cr%25C3%25B4nicas-N%25C3%25A1rnia-C-Lewis-ebook%2Fdp%2FB013RCB5SS&psig=AOvVaw24aExAazoxenonjRg4naS_&ust=1557921335873557',1949),(6,'Os Três Mosqueteiros','Alexandre Dumas','Os Três Mosqueteiros é um romance histórico escrito pelo francês Alexandre Dumas. Inicialmente publicado como folhetim no jornal Le Siècle de março a julho de 1844, foi posteriormente lançado como livro, ainda em 1844, pelas Edições Baudry, e reeditado em 1846 por J. B. Fellens e L. P. Dufour com ilustrações de Vivant Beaucé. ','https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwj9k42I_ZriAhXDFLkGHQjtAW4QjRx6BAgBEAU&url=https%3A%2F%2Focatequista.com.br%2Fblog%2Fitem%2F13253-a-verdade-por-tras-do-cardeal-richelieu-de-os-tres-mosqueteiros-2&psig=AOvVaw0TxZMVuxgBZN4vycVn7QGH&ust=1557921774728360',1844),(7,'A Guerra dos Tronos','George R. R. Martins','A Game of Thrones é o primeiro livro da série de fantasia épica As Crônicas de Gelo e Fogo, escrita pelo norte-americano George R. R. Martin e publicada pela editora Bantam Spectra. Lançado originalmente em 6 de agosto de 1996, o livro venceu o Prêmio Locus de 1997 e o Prêmio Nebula de 1998, tendo sido indicado também ao World Fantasy Award de 1997.[1][1][2] A novela Blood of the Dragon, compreendendo os capítulos de Daenerys Targaryen do romance, venceu o Prêmio Hugo de 1997 para \"Melhor Novela\".[3] ','https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiI4oHc-JriAhU-D7kGHS3BA5QQjRx6BAgBEAU&url=https%3A%2F%2Fwww.livrariascuritiba.com.br%2Fguerra-dos-tronos-a-livro-um-ed-comemorativa-leya-lv386059%2Fp&psig=AOvVaw3GYO_WPu288dYBf8NSqKFU&ust=1557920620058285',1996);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel` (
  `codigo` enum('1','2') NOT NULL,
  `tipo` text NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` VALUES ('1','Usuario'),('2','Funcionario');
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id_usuario` int(5) unsigned NOT NULL,
  `cod_exemplar` int(4) unsigned NOT NULL,
  `data_disponivel` date DEFAULT NULL,
  `situacao` enum('S','N') DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`cod_exemplar`),
  KEY `cod_exemplar` (`cod_exemplar`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (6,1,NULL,NULL),(3,3,NULL,NULL),(4,5,NULL,NULL);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_reserva after insert on reserva for each row
begin
	update exemplar as e set e.situacao = 'R' where new.cod_exemplar = e.cod_exemplar;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `pnome` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `logim` varchar(50) NOT NULL,
  `senha` varchar(15) NOT NULL,
  `nivel` enum('1','2') NOT NULL,
  `_status` enum('A','I') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `logim` (`logim`),
  KEY `nivel` (`nivel`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'Gabriel','gabrielbarros201612@gmail.com','gabrielbarros','16062000','1','A'),(3,'Daniel','danielsiqueira@gmail.com','vaireprovargeral','vaireprovar','2','A'),(4,'Gbarros','gabrielbarros@alu.ufc.br','gabbarros','16062000','2','A'),(5,'Gabriel Junior','gabrieljunior@alu.ufc.br','gabrieljunior','12345678','1','A'),(6,'hallissonkite','hallissonkite@gmail.com','hallissonkite','hallisson123','2','A'),(1,'Brena','brena@gmail.com','brenam','brena123','2','A');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'biblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-20 17:48:18
