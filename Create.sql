-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: comapp
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(90) DEFAULT NULL,
  `Bio` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `community_posts`
--

DROP TABLE IF EXISTS `community_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_posts` (
  `Community_Id` int NOT NULL,
  `Post_Id` int NOT NULL,
  PRIMARY KEY (`Community_Id`,`Post_Id`),
  KEY `Post_Id` (`Post_Id`),
  CONSTRAINT `community_posts_ibfk_1` FOREIGN KEY (`Community_Id`) REFERENCES `communities` (`Id`),
  CONSTRAINT `community_posts_ibfk_2` FOREIGN KEY (`Post_Id`) REFERENCES `posts` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_posts`
--

DROP TABLE IF EXISTS `help_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `help_posts` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(90) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Price` int NOT NULL,
  `Telephone` varchar(20) DEFAULT NULL,
  `HelpPostTime` datetime DEFAULT NULL,
  `User_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `help_posts_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pins`
--

DROP TABLE IF EXISTS `pins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pins` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `User_Id` int NOT NULL,
  `Title` varchar(90) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `PostTime` datetime DEFAULT NULL,
  `X_cord` double DEFAULT NULL,
  `Y_cord` double DEFAULT NULL,
  `Community_Id` int DEFAULT NULL,
  `PinType` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Community_Id` (`Community_Id`),
  CONSTRAINT `pins_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`Id`),
  CONSTRAINT `pins_ibfk_2` FOREIGN KEY (`Community_Id`) REFERENCES `communities` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `User_Id` int NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Content` text,
  `PostTime` datetime DEFAULT NULL,
  `isNews` int DEFAULT NULL,
  `Community_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Community_Id` (`Community_Id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`Id`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`Community_Id`) REFERENCES `communities` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_community_membership`
--

DROP TABLE IF EXISTS `user_community_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_community_membership` (
  `User_Id` int NOT NULL,
  `Community_Id` int NOT NULL,
  PRIMARY KEY (`User_Id`,`Community_Id`),
  KEY `Community_Id` (`Community_Id`),
  CONSTRAINT `user_community_membership_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`Id`),
  CONSTRAINT `user_community_membership_ibfk_2` FOREIGN KEY (`Community_Id`) REFERENCES `communities` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(90) DEFAULT NULL,
  `Email` varchar(125) DEFAULT NULL,
  `Bio` varchar(600) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-24 21:38:34
