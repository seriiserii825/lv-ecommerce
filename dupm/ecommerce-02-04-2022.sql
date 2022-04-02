-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.7.37

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_path_unique` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'/uploads/ancelle.jpg','ancelle.jpg','2022-04-02 06:52:51','2022-04-02 06:52:51'),(2,'/uploads/antiche-porte-editrice-ogg.jpg','antiche-porte-editrice-ogg.jpg','2022-04-02 06:52:51','2022-04-02 06:52:51'),(3,'/uploads/autotrasporti.jpg','autotrasporti.jpg','2022-04-02 06:52:51','2022-04-02 06:52:51'),(4,'/uploads/chiusa-giorgio.jpg','chiusa-giorgio.jpg','2022-04-02 06:52:51','2022-04-02 06:52:51'),(5,'/uploads/cibarium.jpg','cibarium.jpg','2022-04-02 06:52:51','2022-04-02 06:52:51'),(6,'/uploads/consorzio.jpg','consorzio.jpg','2022-04-02 06:52:51','2022-04-02 06:52:51'),(7,'/uploads/cose-cosi.jpg','cose-cosi.jpg','2022-04-02 06:52:51','2022-04-02 06:52:51'),(8,'/uploads/delisa.jpg','delisa.jpg','2022-04-02 06:52:51','2022-04-02 06:52:51'),(9,'/uploads/diber.jpg','diber.jpg','2022-04-02 06:52:51','2022-04-02 06:52:51'),(10,'/uploads/eliana.jpg','eliana.jpg','2022-04-02 06:52:51','2022-04-02 06:52:51'),(11,'/uploads/fava.jpg','fava.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(12,'/uploads/federicomaras.jpg','federicomaras.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(13,'/uploads/fepsas.jpg','fepsas.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(14,'/uploads/feramentagazzotti.jpg','feramentagazzotti.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(15,'/uploads/frattelibandini.jpg','frattelibandini.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(16,'/uploads/fustellificio-gadda.jpg','fustellificio-gadda.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(17,'/uploads/gamerecords.jpg','gamerecords.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(18,'/uploads/iconsulenti.jpg','iconsulenti.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(19,'/uploads/ideagelato.jpg','ideagelato.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(20,'/uploads/ilpastericie.jpg','ilpastericie.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(21,'/uploads/imprendocasa.jpg','imprendocasa.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(22,'/uploads/klautomation.jpg','klautomation.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(23,'/uploads/lagellateria.jpg','lagellateria.jpg','2022-04-02 06:53:02','2022-04-02 06:53:02'),(24,'/uploads/leiscofeius.jpg','leiscofeius.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(25,'/uploads/madison.jpg','madison.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(26,'/uploads/makerdojo.jpg','makerdojo.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(27,'/uploads/mamma-luciana.jpg','mamma-luciana.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(28,'/uploads/mbfevolution.jpg','mbfevolution.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(29,'/uploads/me.jpg','me.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(30,'/uploads/merceria-maura.jpg','merceria-maura.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(31,'/uploads/miccigiovani.jpg','miccigiovani.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(32,'/uploads/modena.jpg','modena.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(33,'/uploads/moonflower.jpg','moonflower.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(34,'/uploads/negoziamo.jpg','negoziamo.jpg','2022-04-02 06:54:23','2022-04-02 06:54:23'),(35,'/uploads/negozioferreira.jpg','negozioferreira.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(36,'/uploads/new-energy-og.jpg','new-energy-og.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(37,'/uploads/non-solo-pizza.jpg','non-solo-pizza.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(38,'/uploads/og-freehouseimmobiliare.jpg','og-freehouseimmobiliare.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(39,'/uploads/og-pasticceria-micci-fabio.jpg','og-pasticceria-micci-fabio.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(40,'/uploads/og-rewind-telefomunicazioni.jpg','og-rewind-telefomunicazioni.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(41,'/uploads/og-semplicemente-.jpg','og-semplicemente-.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(42,'/uploads/ottico-rachelle.jpg','ottico-rachelle.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(43,'/uploads/pallinagellateria.jpg','pallinagellateria.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(44,'/uploads/papavero.jpg','papavero.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(45,'/uploads/piscozzo.jpg','piscozzo.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(46,'/uploads/pizzavoglia.jpg','pizzavoglia.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(47,'/uploads/rubiera.jpg','rubiera.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(48,'/uploads/sacco.jpg','sacco.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(49,'/uploads/salumi-og.jpg','salumi-og.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(50,'/uploads/sanitaria.jpg','sanitaria.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(51,'/uploads/segalerba.jpg','segalerba.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(52,'/uploads/spacefood.jpg','spacefood.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(53,'/uploads/studiobazzo.jpg','studiobazzo.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(54,'/uploads/tecnorubicone.jpg','tecnorubicone.jpg','2022-04-02 07:07:56','2022-04-02 07:07:56'),(55,'/uploads/zuccato.jpg','zuccato.jpg','2022-04-02 08:01:17','2022-04-02 08:01:17'),(56,'/uploads/whynotcaffe.jpg','whynotcaffe.jpg','2022-04-02 08:28:17','2022-04-02 08:28:17'),(57,'/uploads/visitrosolina.jpg','visitrosolina.jpg','2022-04-02 08:30:56','2022-04-02 08:30:56'),(58,'/uploads/village.jpg','village.jpg','2022-04-02 08:43:31','2022-04-02 08:43:31'),(59,'/uploads/24max.jpg','24max.jpg','2022-04-02 09:40:28','2022-04-02 09:40:28'),(61,'/uploads/ogremax.jpg','ogremax.jpg','2022-04-02 10:18:22','2022-04-02 10:18:22'),(62,'/uploads/unison.jpg','unison.jpg','2022-04-02 10:22:52','2022-04-02 10:22:52'),(63,'/uploads/vechi-laura.jpg','vechi-laura.jpg','2022-04-02 10:23:29','2022-04-02 10:23:29');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_03_26_084326_create_media_table',1),(6,'2022_03_26_091146_create_categories_table',1),(7,'2022_03_31_161343_create_posts_table',2),(8,'2022_03_31_163804_add_column_text_to_posts_table',3),(9,'2022_04_01_170947_create_types_table',4),(10,'2022_04_01_173553_create_portfolios_table',5),(13,'2022_04_02_070952_add_date_column_to_portfolios_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolios_type_id_foreign` (`type_id`),
  CONSTRAINT `portfolios_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
INSERT INTO `portfolios` VALUES (6,'Why not caffe','https://whynotcaffe.it/','/uploads/whynotcaffe.jpg',1,'2022-04-02 08:28:31','2022-04-02 08:28:31','2021-01-12T09:27:10.395Z'),(7,'Visit Rosolina','https://visitrosolina.it/','/uploads/visitrosolina.jpg',1,'2022-04-02 08:31:06','2022-04-02 08:31:06','2021-11-10T09:29:28.000Z'),(8,'Village','https://village.altuofianco.com/','/uploads/village.jpg',1,'2022-04-02 08:43:52','2022-04-02 08:43:52','2022-03-07T09:42:56.000Z'),(131,'Ancelle','https://www.ancellesacrocuore.it/','/uploads/ancelle.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:24:45','2022-04-02 08:01:32'),(132,'Antiche Porte','https://www.anticheporte.it/','/uploads/antiche-porte-editrice-ogg.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:24:59','2022-04-02 08:01:32'),(133,'Autotrasporti agliari','https://autotrasportiagliari.it/','/uploads/autotrasporti.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:25:42','2022-04-02 08:01:32'),(134,'Chiusa giorgio','https://chiusagiorgio.negoziamo.shop/','/uploads/chiusa-giorgio.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:25:56','2022-04-02 08:01:32'),(135,'Cibarium','https://cibarium.negoziamo.shop/','/uploads/cibarium.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:26:15','2022-04-02 08:01:32'),(136,'Consorzio Storm','https://www.consorziostorm.it/','/uploads/consorzio.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:26:29','2022-04-02 08:01:32'),(137,'Cose cosi','https://cosecosi.negoziamo.shop/','/uploads/cose-cosi.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:26:52','2022-04-02 08:01:32'),(138,'Delisa','https://delisaimmobiliare.it/','/uploads/delisa.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:27:07','2022-04-02 08:01:32'),(139,'Diber bevande','https://www.diberbevande.it/','/uploads/diber.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:27:18','2022-04-02 08:01:32'),(140,'Eliana difussion','https://elianadiffusion.negoziamo.shop/','/uploads/delisa.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:27:32','2022-04-02 08:01:32'),(141,'Fava','https://favatermoidraulica.com/','/uploads/fava.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:28:01','2022-04-02 08:01:32'),(142,'Federico Maras','https://federicomarras.it/','/uploads/federicomaras.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:28:15','2022-04-02 08:01:32'),(143,'Fepsas','https://fepsas.it/','/uploads/fepsas.jpg',1,'2022-04-02 09:22:34','2022-04-02 10:28:26','2022-04-02 08:01:32'),(144,'Ferramenta Gazzotti','https://ferramentagazzotti.it/','/uploads/feramentagazzotti.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:06:02','2022-04-02 08:01:32'),(145,'Fratelli bandini','https://fratellibandinishop.it/','/uploads/frattelibandini.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:06:17','2022-04-02 08:01:32'),(146,'Freehouse','https://freehouseimmobiliare.it/','/uploads/og-freehouseimmobiliare.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:06:27','2022-04-02 08:01:32'),(147,'Fustellificio Gadda','https://gaddafustelle.it/','/uploads/fustellificio-gadda.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:06:36','2022-04-02 08:01:32'),(148,'Game records','https://gamerecords.it/','/uploads/gamerecords.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:06:47','2022-04-02 08:01:32'),(149,'I Consulenti Immobiliari','https://iconsulentimmobiliari.it/','/uploads/iconsulenti.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:06:56','2022-04-02 08:01:32'),(150,'Il Pasticciere','https://ilpasticciere.negoziamo.shop/','/uploads/ilpastericie.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:07:06','2022-04-02 08:01:32'),(151,'Imprendocasa','https://www.imprendocasa.it/','/uploads/imprendocasa.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:07:20','2022-04-02 08:01:32'),(152,'Ideagelato','https://www.ideagelato.com/','/uploads/ideagelato.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:07:33','2022-04-02 08:01:32'),(153,'Klautomation','https://klautomation.it/','/uploads/klautomation.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:07:47','2022-04-02 08:01:32'),(154,'Lagellateria','https://lagelatteria.negoziamo.shop/','/uploads/lagellateria.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:08:01','2022-04-02 08:01:32'),(155,'Les Coiffeuses','https://lescoiffeuses.negoziamo.shop/','/uploads/leiscofeius.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:08:24','2022-04-02 08:01:32'),(156,'24 max','https://24max.altuofianco.com/','/uploads/24max.jpg',1,'2022-04-02 09:22:35','2022-04-02 09:43:19','2022-04-02 08:01:32'),(157,'Madison','https://madisonshop.it/','/uploads/madison.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:08:38','2022-04-02 08:01:32'),(158,'Maker Dojo','https://www.makerdojo.it/','/uploads/makerdojo.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:08:52','2022-04-02 08:01:32'),(159,'Mammaluciana','https://mammalucianastore.it/','/uploads/mamma-luciana.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:09:06','2022-04-02 08:01:32'),(160,'Mbf Evolution','https://mbfevolution.altuofianco.com/','/uploads/mbfevolution.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:09:28','2022-04-02 08:01:32'),(161,'Merceria Maura','https://merceriamaura.negoziamo.shop/','/uploads/merceria-maura.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:09:45','2022-04-02 08:01:32'),(162,'Micci Giovani','https://miccigiovanni.altuofianco.com/','/uploads/miccigiovani.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:10:01','2022-04-02 08:01:32'),(163,'Modena Consulenza','https://modenaconsulenza.it/','/uploads/modena.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:10:20','2022-04-02 08:01:32'),(164,'Moon Flower','https://moonflower.it/','/uploads/moonflower.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:10:47','2022-04-02 08:01:32'),(165,'Rewind Telecommunicazioni','https://www.rewindtelecomunicazioni.it/','/uploads/og-rewind-telefomunicazioni.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:11:51','2022-04-02 08:01:32'),(166,'Negoziamo','https://negoziamo.shop/','/uploads/negoziamo.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:12:09','2022-04-02 08:01:32'),(167,'Negozio Ferreira','https://negoziotelefoniaferrara.it/','/uploads/negozioferreira.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:13:37','2022-04-02 08:01:32'),(168,'Non solo pizza','https://nonsolopizzadagrisu.it/','/uploads/non-solo-pizza.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:13:54','2022-04-02 08:01:32'),(169,'Ottico Rachelle','https://otticorachele.negoziamo.shop/','/uploads/ottico-rachelle.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:14:09','2022-04-02 08:01:32'),(170,'Pallinagellateria','https://pallinagelateria.ro/','/uploads/pallinagellateria.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:14:24','2022-04-02 08:01:32'),(171,'Papavero','https://papaverogelateria.it/','/uploads/papavero.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:14:38','2022-04-02 08:01:32'),(172,'Pastirecia Micci Fabio','https://pasticceriamiccifabio.it/','/uploads/og-pasticceria-micci-fabio.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:14:54','2022-04-02 08:01:32'),(173,'Piscozzo Assicurazioni','https://piscozzoassicurazioni.it/','/uploads/piscozzo.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:15:57','2022-04-02 08:01:32'),(174,'Pizzavoglia','https://pizzavoglia.altuofianco.com/','/uploads/pizzavoglia.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:17:33','2022-04-02 08:01:32'),(175,'Remax','https://immobiliareclass.com/','/uploads/ogremax.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:18:32','2022-04-02 08:01:32'),(176,'Rubiera Relais','https://rubierarelais.it/','/uploads/rubiera.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:18:48','2022-04-02 08:01:32'),(177,'Sacco','https://saccocase.altuofianco.com/','/uploads/sacco.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:19:03','2022-04-02 08:01:32'),(178,'Sanitaria Anna','https://sanitariaanna.negoziamo.shop/','/uploads/sanitaria.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:20:24','2022-04-02 08:01:32'),(179,'Segalerba','https://immobiliaresegalerba.it/','/uploads/segalerba.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:20:56','2022-04-02 08:01:32'),(180,'Semplicemente','https://semplicemente.eu/','/uploads/og-semplicemente-.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:21:09','2022-04-02 08:01:32'),(181,'Spacefood','https://spacefood.md/','/uploads/spacefood.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:21:25','2022-04-02 08:01:32'),(182,'Studiobazzo','https://studiomichelebazzoassociati.it/','/uploads/studiobazzo.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:21:44','2022-04-02 08:01:32'),(183,'Tecnorubicone','https://tecnorubicone.it/','/uploads/tecnorubicone.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:21:57','2022-04-02 08:01:32'),(184,'Unison','http://unisonresearch.cf/','/uploads/unison.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:23:02','2022-04-02 08:01:32'),(185,'Vecchi Laura','https://vecchi.altuofianco.com/','/uploads/vechi-laura.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:23:39','2022-04-02 08:01:32'),(189,'Zuccatto','https://zuccatoenergia.it/it/','/uploads/zuccato.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:23:51','2022-04-02 08:01:32'),(190,'New energy','https://newenergy.altuofianco.com/','/uploads/new-energy-og.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:24:06','2022-04-02 08:01:32'),(191,'Salumificio Tarasconi','https://tarasconi.altuofianco.com/','/uploads/salumi-og.jpg',1,'2022-04-02 09:22:35','2022-04-02 10:24:25','2022-04-02 08:01:32');
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_category_id_foreign` (`category_id`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Catalog','2022-04-01 17:20:54','2022-04-01 17:20:54'),(3,'Immobil','2022-04-01 17:25:10','2022-04-01 17:25:10'),(4,'Landing','2022-04-01 17:25:21','2022-04-01 17:25:21'),(5,'Ecommerce','2022-04-01 17:34:51','2022-04-01 17:34:51');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Serii','seriiburduja@gmail.com',NULL,'$2y$10$z0WRjHCaNGMyxwqikvG8SumYW6UXcDOYby9BmpuzL3KfeObxt6VZe',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-02 13:33:26
