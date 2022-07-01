

DROP TABLE IF EXISTS `tb_address_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_address_types` (
  `ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE_NAME` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_address_types`
--

LOCK TABLES `tb_address_types` WRITE;
/*!40000 ALTER TABLE `tb_address_types` DISABLE KEYS */;
INSERT INTO `tb_address_types` VALUES (1,'Ev'),(2,'İş'),(3,'Diğer');
/*!40000 ALTER TABLE `tb_address_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_email_types`
--

DROP TABLE IF EXISTS `tb_email_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_email_types` (
  `ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE_NAME` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_email_types`
--

LOCK TABLES `tb_email_types` WRITE;
/*!40000 ALTER TABLE `tb_email_types` DISABLE KEYS */;
INSERT INTO `tb_email_types` VALUES (1,'İş'),(2,'Kişisel'),(3,'Diğer');
/*!40000 ALTER TABLE `tb_email_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_phone_types`
--

DROP TABLE IF EXISTS `tb_phone_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_phone_types` (
  `ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE_NAME` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_phone_types`
--

LOCK TABLES `tb_phone_types` WRITE;
/*!40000 ALTER TABLE `tb_phone_types` DISABLE KEYS */;
INSERT INTO `tb_phone_types` VALUES (1,'Ev'),(2,'İş'),(3,'Cep'),(4,'FAX'),(5,'Diğer');
/*!40000 ALTER TABLE `tb_phone_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profile_addresses`
--

DROP TABLE IF EXISTS `tb_profile_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_profile_addresses` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROFILE_ID` int(10) unsigned NOT NULL,
  `ADDRESS_TYPE` tinyint(3) unsigned NOT NULL,
  `ADDRESS_NAME` varchar(150) CHARACTER SET utf8 NOT NULL,
  `ADDRESS_CONTENT` text CHARACTER SET utf8 NOT NULL,
  `CITY` varchar(100) CHARACTER SET utf8 NOT NULL,
  `TOWN` varchar(100) CHARACTER SET utf8 NOT NULL,
  `COUNTRY` varchar(100) CHARACTER SET utf8 NOT NULL,
  `ZIP_CODE` varchar(7) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profile_addresses`
--


--
-- Table structure for table `tb_profile_emails`
--

DROP TABLE IF EXISTS `tb_profile_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_profile_emails` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROFILE_ID` int(10) unsigned NOT NULL,
  `EMAIL_TYPE` tinyint(3) unsigned NOT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profile_emails`
--

LOCK TABLES `tb_profile_emails` WRITE;
/*!40000 ALTER TABLE `tb_profile_emails` DISABLE KEYS */;
INSERT INTO `tb_profile_emails` VALUES (1,1,2,'111111111111');
/*!40000 ALTER TABLE `tb_profile_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profile_phones`
--

DROP TABLE IF EXISTS `tb_profile_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_profile_phones` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROFILE_ID` int(10) unsigned NOT NULL,
  `PHONE_TYPE` tinyint(3) unsigned NOT NULL,
  `PHONE` char(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profile_phones`
--

LOCK TABLES `tb_profile_phones` WRITE;
/*!40000 ALTER TABLE `tb_profile_phones` DISABLE KEYS */;
INSERT INTO `tb_profile_phones` VALUES (1,1,2,'111111');
/*!40000 ALTER TABLE `tb_profile_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profile_websites`
--

DROP TABLE IF EXISTS `tb_profile_websites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_profile_websites` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROFILE_ID` int(10) unsigned NOT NULL,
  `WEBSITE_TYPE` tinyint(3) unsigned NOT NULL,
  `WEBSITE` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profile_websites`
--

LOCK TABLES `tb_profile_websites` WRITE;
/*!40000 ALTER TABLE `tb_profile_websites` DISABLE KEYS */;
INSERT INTO `tb_profile_websites` VALUES (1,1,5,'11111111');
/*!40000 ALTER TABLE `tb_profile_websites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profiles`
--

DROP TABLE IF EXISTS `tb_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_profiles` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROFILE_CODE` char(8) NOT NULL,
  `CARD_NAME` varchar(150) CHARACTER SET utf8 NOT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 NOT NULL,
  `PASSWORD_HASH` char(32) NOT NULL,
  `FIRSTNAME` varchar(100) CHARACTER SET utf8 NOT NULL,
  `LASTNAME` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `BIRTHDAY` varchar(20) DEFAULT NULL,
  `ORG_NAME` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `POSITION_TITLE` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `NOTE` text CHARACTER SET utf8,
  `CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profiles`
--

--
-- Table structure for table `tb_website_types`
--

DROP TABLE IF EXISTS `tb_website_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_website_types` (
  `ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE_NAME` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_website_types`
--

LOCK TABLES `tb_website_types` WRITE;
/*!40000 ALTER TABLE `tb_website_types` DISABLE KEYS */;
INSERT INTO `tb_website_types` VALUES (1,'Instagram'),(2,'Facebook'),(3,'Twitter'),(4,'Linkedin'),(5,'Kişisel'),(6,'Diğer');
/*!40000 ALTER TABLE `tb_website_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'root'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_ADDRESS_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ADDRESS_ADD`(
	IN p_PROFILE_ID int unsigned,
    IN p_ADDRESS_TYPE tinyint unsigned,
    IN p_ADDRESS_NAME varchar(150) charset utf8,
    IN p_ADDRESS_CONTENT text charset utf8,
    IN p_CITY varchar(100) charset utf8,
    IN p_TOWN varchar(100) charset utf8,
    IN p_COUNTRY varchar(100) charset utf8,
    In p_ZIP_CODE varchar(7) charset utf8
)
BEGIN
	INSERT INTO tb_profile_addresses (
		PROFILE_ID,
		ADDRESS_TYPE,
		ADDRESS_NAME,
		ADDRESS_CONTENT,
		CITY,
		TOWN,
		COUNTRY,
		ZIP_CODE
    ) VALUES (
		p_PROFILE_ID,
		p_ADDRESS_TYPE,
		p_ADDRESS_NAME,
		p_ADDRESS_CONTENT,
		p_CITY,
		p_TOWN,
		p_COUNTRY,
		p_ZIP_CODE
    );
	
    SELECT 'success' AS STATUS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ADDRESS_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ADDRESS_DELETE`(
	IN p_PROFILE_ID char(8),
	IN p_ADDRESS_ID int unsigned,
    IN p_EMAIL varchar(100) charset utf8,
    IN p_PASSWORD_HASH char(32)
)
BEGIN
	IF EXISTS (SELECT ID FROM tb_profiles WHERE ID = p_PROFILE_ID AND EMAIL = p_EMAIL AND PASSWORD_HASH = p_PASSWORD_HASH) THEN
		IF EXISTS (SELECT ID FROM tb_profile_addresses WHERE ID = p_ADDRESS_ID AND PROFILE_ID = p_PROFILE_ID) THEN
			
            SET SQL_SAFE_UPDATES = 0;
				DELETE FROM tb_profile_addresses WHERE ID = p_ADDRESS_ID;
            SET SQL_SAFE_UPDATES = 1;
            
            SELECT 'success' AS STATUS;
        ELSE
			SELECT 'not-found' AS STATUS;
        END IF;
    ELSE
		SELECT 'auth-error' AS STATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ADDRESS_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ADDRESS_GET`(
	IN p_PROFILE_ID int unsigned
)
BEGIN
	SELECT
		tb_profile_addresses.ID AS ADDRESS_ID,
        tb_profile_addresses.ADDRESS_TYPE,
        tb_address_types.TYPE_NAME,
        tb_profile_addresses.ADDRESS_NAME,
        tb_profile_addresses.ADDRESS_CONTENT,
        tb_profile_addresses.CITY,
        tb_profile_addresses.TOWN,
        tb_profile_addresses.COUNTRY,
        tb_profile_addresses.ZIP_CODE
	FROM 
		tb_profile_addresses
	INNER JOIN
		tb_address_types
	ON
		tb_profile_addresses.ADDRESS_TYPE = tb_address_types.ID
	WHERE
		tb_profile_addresses.PROFILE_ID = p_PROFILE_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ADDRESS_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ADDRESS_UPDATE`(
	IN p_PROFILE_ID char(8), --
	IN p_ADDRESS_ID int unsigned, --
    IN p_EMAIL varchar(100) charset utf8, --
    IN p_PASSWORD_HASH char(32), --
    
    IN p_NEW_ADDRESS_TYPE tinyint unsigned,
    IN p_NEW_ADDRESS_NAME varchar(150) charset utf8,
    IN p_NEW_ADDRESS_CONTENT text charset utf8,
    IN p_NEW_CITY varchar(100) charset utf8,
    IN p_NEW_TOWN varchar(100) charset utf8,
    IN p_NEW_COUNTRY varchar(100) charset utf8,
    In p_NEW_ZIP_CODE varchar(7) charset utf8
)
BEGIN
	IF EXISTS (SELECT ID FROM tb_profiles WHERE ID = p_PROFILE_ID AND EMAIL = p_EMAIL AND PASSWORD_HASH = p_PASSWORD_HASH) THEN
		IF EXISTS (SELECT ID FROM tb_profile_addresses WHERE ID = p_ADDRESS_ID AND PROFILE_ID = p_PROFILE_ID) THEN
			
            SET SQL_SAFE_UPDATES = 0;
				UPDATE tb_profile_addresses SET
					ADDRESS_TYPE = p_NEW_ADDRESS_TYPE,
					ADDRESS_NAME = p_NEW_ADDRESS_NAME,
					ADDRESS_CONTENT = p_NEW_ADDRESS_CONTENT,
					CITY = p_NEW_CITY,
					TOWN = p_NEW_TOWN,
					COUNTRY = p_NEW_COUNTRY,
					ZIP_CODE = p_NEW_ZIP_CODE
                WHERE ID = p_ADDRESS_ID;
            SET SQL_SAFE_UPDATES = 1;
            
            SELECT 'success' AS STATUS;
        ELSE
			SELECT 'not-found' AS STATUS;
        END IF;
    ELSE
		SELECT 'auth-error' AS STATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_AUTH_CHECK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_AUTH_CHECK`(
	IN p_PROFILE_CODE char(8),
    IN p_EMAIL varchar(100) charset utf8,
    IN p_PASSWORD_HASH char(32)
)
BEGIN
	IF EXISTS (SELECT ID FROM tb_profiles WHERE PROFILE_CODE = p_PROFILE_CODE AND EMAIL = p_EMAIL AND PASSWORD_HASH = p_PASSWORD_HASH) THEN
		SELECT 'success' AS STATUS;
    ELSE
		SELECT 'auth-error' AS STATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_EMAIL_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EMAIL_ADD`(
	IN p_PROFILE_ID int unsigned,
    IN p_EMAIL_TYPE tinyint unsigned,
    IN p_EMAIL varchar(100) charset utf8
)
BEGIN
	INSERT INTO tb_profile_emails (
		PROFILE_ID,
        EMAIL_TYPE,
        EMAIL
    ) VALUES (
		p_PROFILE_ID,
        p_EMAIL_TYPE,
        p_EMAIL
    );
	SELECT 'success' AS STATUS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_EMAIL_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EMAIL_DELETE`(
	IN p_PROFILE_ID char(8),
	IN p_EMAIL_ID int unsigned,
    IN p_EMAIL varchar(100) charset utf8,
    IN p_PASSWORD_HASH char(32)
)
BEGIN
	IF EXISTS (SELECT ID FROM tb_profiles WHERE ID = p_PROFILE_ID AND EMAIL = p_EMAIL AND PASSWORD_HASH = p_PASSWORD_HASH) THEN
		IF EXISTS (SELECT ID FROM tb_profile_emails WHERE ID = p_EMAIL_ID AND PROFILE_ID = p_PROFILE_ID) THEN
			
            SET SQL_SAFE_UPDATES = 0;
				DELETE FROM tb_profile_emails WHERE ID = p_EMAIL_ID;
            SET SQL_SAFE_UPDATES = 1;
            
            SELECT 'success' AS STATUS;
        ELSE
			SELECT 'not-found' AS STATUS;
        END IF;
    ELSE
		SELECT 'auth-error' AS STATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_EMAIL_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EMAIL_GET`(
	IN p_PROFILE_ID int unsigned
)
BEGIN
	SELECT
		tb_profile_emails.ID AS EMAIL_ID,
        tb_profile_emails.EMAIL_TYPE,
        tb_email_types.TYPE_NAME,
        tb_profile_emails.EMAIL
	FROM 
		tb_profile_emails
	INNER JOIN
		tb_email_types
	ON
		tb_profile_emails.EMAIL_TYPE = tb_email_types.ID
	WHERE
		tb_profile_emails.PROFILE_ID = p_PROFILE_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_EMAIL_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_EMAIL_UPDATE`(
	IN p_PROFILE_ID char(8), --
	IN p_EMAIL_ID int unsigned, --
    IN p_EMAIL varchar(100) charset utf8, --
    IN p_PASSWORD_HASH char(32), --
    
    IN p_NEW_EMAIL_TYPE tinyint unsigned,
    IN p_NEW_EMAIL varchar(100) charset utf8
)
BEGIN
IF EXISTS (SELECT ID FROM tb_profiles WHERE ID = p_PROFILE_ID AND EMAIL = p_EMAIL AND PASSWORD_HASH = p_PASSWORD_HASH) THEN
		IF EXISTS (SELECT ID FROM tb_profile_emails WHERE ID = p_EMAIL_ID AND PROFILE_ID = p_PROFILE_ID) THEN
			
            SET SQL_SAFE_UPDATES = 0;
				UPDATE tb_profile_emails SET
					EMAIL_TYPE = p_NEW_EMAIL_TYPE,
					EMAIL = p_NEW_EMAIL
                WHERE ID = p_EMAIL_ID;
            SET SQL_SAFE_UPDATES = 1;
            
            SELECT 'success' AS STATUS;
        ELSE
			SELECT 'not-found' AS STATUS;
        END IF;
    ELSE
		SELECT 'auth-error' AS STATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PHONE_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_PHONE_ADD`(
	IN p_PROFILE_ID int unsigned,
    IN p_PHONE_TYPE tinyint unsigned,
    IN p_PHONE char(11)
)
BEGIN
	INSERT INTO tb_profile_phones(
		PROFILE_ID,
        PHONE_TYPE,
        PHONE
    ) VALUES (
		p_PROFILE_ID,
        p_PHONE_TYPE,
        p_PHONE
    );
    
	SELECT 'success' AS STATUS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PHONE_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_PHONE_DELETE`(
	IN p_PROFILE_ID char(8),
	IN p_PHONE_ID int unsigned,
    IN p_EMAIL varchar(100) charset utf8,
    IN p_PASSWORD_HASH char(32)
)
BEGIN
	IF EXISTS (SELECT ID FROM tb_profiles WHERE ID = p_PROFILE_ID AND EMAIL = p_EMAIL AND PASSWORD_HASH = p_PASSWORD_HASH) THEN
		IF EXISTS (SELECT ID FROM tb_profile_phones WHERE ID = p_PHONE_ID AND PROFILE_ID = p_PROFILE_ID) THEN
			
            SET SQL_SAFE_UPDATES = 0;
				DELETE FROM tb_profile_phones WHERE ID = p_PHONE_ID;
            SET SQL_SAFE_UPDATES = 1;
            
            SELECT 'success' AS STATUS;
        ELSE
			SELECT 'not-found' AS STATUS;
        END IF;
    ELSE
		SELECT 'auth-error' AS STATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PHONE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_PHONE_GET`(
	IN p_PROFILE_ID int unsigned
)
BEGIN
	SELECT
		tb_profile_phones.ID AS PHONE_ID,
        tb_profile_phones.PHONE_TYPE,
        tb_phone_types.TYPE_NAME,
        tb_profile_phones.PHONE
	FROM 
		tb_profile_phones
	INNER JOIN
		tb_phone_types
	ON
		tb_profile_phones.PHONE_TYPE = tb_phone_types.ID
	WHERE
		tb_profile_phones.PROFILE_ID = p_PROFILE_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PHONE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_PHONE_UPDATE`(
	IN p_PROFILE_ID char(8), --
	IN p_PHONE_ID int unsigned, --
    IN p_EMAIL varchar(100) charset utf8, --
    IN p_PASSWORD_HASH char(32), --
    
    IN p_NEW_PHONE_TYPE tinyint unsigned,
    IN p_NEW_PHONE char(11)
)
BEGIN
IF EXISTS (SELECT ID FROM tb_profiles WHERE ID = p_PROFILE_ID AND EMAIL = p_EMAIL AND PASSWORD_HASH = p_PASSWORD_HASH) THEN
		IF EXISTS (SELECT ID FROM tb_profile_phones WHERE ID = p_PHONE_ID AND PROFILE_ID = p_PROFILE_ID) THEN
			
            SET SQL_SAFE_UPDATES = 0;
				UPDATE tb_profile_phones SET
					PHONE_TYPE = p_NEW_PHONE_TYPE,
					PHONE = p_NEW_PHONE
                WHERE ID = p_PHONE_ID;
            SET SQL_SAFE_UPDATES = 1;
            
            SELECT 'success' AS STATUS;
        ELSE
			SELECT 'not-found' AS STATUS;
        END IF;
    ELSE
		SELECT 'auth-error' AS STATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PROFILE_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_PROFILE_ADD`(
	IN p_PROFILE_CODE char(8),
    IN p_CARD_NAME varchar(150) charset utf8,
    IN p_EMAIL varchar(100) charset utf8,
    IN p_PASSWORD_HASH char(32),
    IN p_FIRSTNAME varchar(100) charset utf8,
    IN p_LASTNAME varchar(100) charset utf8,
    IN p_BIRTHDAY varchar(20) charset utf8,
    IN p_ORG_NAME varchar(300) charset utf8,
    IN p_POSITION_TITLE varchar(300) charset utf8,
    IN p_NOTE text charset utf8
)
BEGIN
	INSERT INTO tb_profiles(
		PROFILE_CODE,
		CARD_NAME,
		EMAIL,
		PASSWORD_HASH,
		FIRSTNAME,
		LASTNAME,
		BIRTHDAY,
		ORG_NAME,
		POSITION_TITLE,
		NOTE
	) VALUES (
		p_PROFILE_CODE,
		p_CARD_NAME,
		p_EMAIL,
		p_PASSWORD_HASH,
		p_FIRSTNAME,
		p_LASTNAME,
		p_BIRTHDAY,
		p_ORG_NAME,
		p_POSITION_TITLE,
		p_NOTE
	);
	SELECT LAST_INSERT_ID() AS PROFILE_ID, 'success' AS STATUS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PROFILE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_PROFILE_GET`(
	IN p_PROFILE_CODE char(8)
)
BEGIN
	SELECT
		ID AS PROFILE_ID,
        CARD_NAME,
        FIRSTNAME,
        LASTNAME,
        BIRTHDAY,
        ORG_NAME,
        POSITION_TITLE,
        NOTE,
		date_format(CREATED_DATE, '%d.%m.%Y') AS CREATED_DATE
	FROM tb_profiles WHERE PROFILE_CODE = p_PROFILE_CODE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PROFILE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_PROFILE_UPDATE`(
	IN p_PROFILE_ID char(8), --
    IN p_NEW_CARD_NAME varchar(150) charset utf8,
    IN p_EMAIL varchar(100) charset utf8, --
    IN p_PASSWORD_HASH char(32), --
    IN p_NEW_FIRSTNAME varchar(100) charset utf8,
    IN p_NEW_LASTNAME varchar(100) charset utf8,
    IN p_NEW_BIRTHDAY varchar(20) charset utf8,
    IN p_NEW_ORG_NAME varchar(300) charset utf8,
    IN p_NEW_POSITION_TITLE varchar(300) charset utf8,
    IN p_NEW_NOTE text charset utf8
)
BEGIN
	IF EXISTS (SELECT ID FROM tb_profiles WHERE ID = p_PROFILE_ID AND EMAIL = p_EMAIL AND PASSWORD_HASH = p_PASSWORD_HASH) THEN
		SET SQL_SAFE_UPDATES = 0;
			UPDATE tb_profiles SET 
				CARD_NAME = p_NEW_CARD_NAME,
				FIRSTNAME = p_NEW_FIRSTNAME,
				LASTNAME = p_NEW_LASTNAME,
				BIRTHDAY = p_NEW_BIRTHDAY,
				ORG_NAME = p_NEW_ORG_NAME,
				POSITION_TITLE = p_NEW_POSITION_TITLE,
				NOTE = p_NEW_NOTE
			WHERE ID = p_PROFILE_ID;
        SET SQL_SAFE_UPDATES = 1;
        
        SELECT 'success' AS STATUS;
    ELSE
		SELECT 'auth-error' AS STATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TYPES_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_TYPES_GET`(
	IN p_TABLE_TYPE tinyint unsigned
)
BEGIN
	IF (p_TABLE_TYPE = 1) THEN 
		SELECT * FROM tb_address_types;
	ELSEIF (p_TABLE_TYPE = 2) THEN
		SELECT * FROM tb_email_types;
	ELSEIF (p_TABLE_TYPE = 3) THEN
		SELECT * FROM tb_phone_types;
	ELSEIF (p_TABLE_TYPE = 4) THEN
		SELECT * FROM tb_website_types;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_WEBSITE_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_WEBSITE_ADD`(
	IN p_PROFILE_ID int unsigned,
    IN p_WEBSITE_TYPE tinyint unsigned,
    IN p_WEBSITE varchar(100) charset utf8
)
BEGIN
	INSERT INTO tb_profile_websites(
		PROFILE_ID,
        WEBSITE_TYPE,
        WEBSITE
    ) VALUES (
		p_PROFILE_ID,
        p_WEBSITE_TYPE,
        p_WEBSITE
    );
    
    SELECT 'success' AS STATUS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_WEBSITE_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_WEBSITE_DELETE`(
	IN p_PROFILE_ID char(8),
	IN p_WEBSITE_ID int unsigned,
    IN p_EMAIL varchar(100) charset utf8,
    IN p_PASSWORD_HASH char(32)
)
BEGIN
	IF EXISTS (SELECT ID FROM tb_profiles WHERE ID = p_PROFILE_ID AND EMAIL = p_EMAIL AND PASSWORD_HASH = p_PASSWORD_HASH) THEN
		IF EXISTS (SELECT ID FROM tb_profile_websites WHERE ID = p_WEBSITE_ID AND PROFILE_ID = p_PROFILE_ID) THEN
			
            SET SQL_SAFE_UPDATES = 0;
				DELETE FROM tb_profile_websites WHERE ID = p_WEBSITE_ID;
            SET SQL_SAFE_UPDATES = 1;
            
            SELECT 'success' AS STATUS;
        ELSE
			SELECT 'not-found' AS STATUS;
        END IF;
    ELSE
		SELECT 'auth-error' AS STATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_WEBSITE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_WEBSITE_GET`(
	IN p_PROFILE_ID int unsigned
)
BEGIN
	SELECT
		tb_profile_websites.ID AS WEBSITE_ID,
        tb_profile_websites.WEBSITE_TYPE,
        tb_website_types.TYPE_NAME,
        tb_profile_websites.WEBSITE
	FROM 
		tb_profile_websites
	INNER JOIN
		tb_website_types
	ON
		tb_profile_websites.WEBSITE_TYPE = tb_website_types.ID
	WHERE
		tb_profile_websites.PROFILE_ID = p_PROFILE_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_WEBSITE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_WEBSITE_UPDATE`(
	IN p_PROFILE_ID char(8), --
	IN p_WEBSITE_ID int unsigned, --
    IN p_EMAIL varchar(100) charset utf8, --
    IN p_PASSWORD_HASH char(32), --
    
    IN p_NEW_WEBSITE_TYPE tinyint unsigned,
    IN p_NEW_WEBSITE varchar(100) charset utf8
)
BEGIN
IF EXISTS (SELECT ID FROM tb_profiles WHERE ID = p_PROFILE_ID AND EMAIL = p_EMAIL AND PASSWORD_HASH = p_PASSWORD_HASH) THEN
		IF EXISTS (SELECT ID FROM tb_profile_websites WHERE ID = p_WEBSITE_ID AND PROFILE_ID = p_PROFILE_ID) THEN
			
            SET SQL_SAFE_UPDATES = 0;
				UPDATE tb_profile_websites SET
					WEBSITE_TYPE = p_NEW_WEBSITE_TYPE,
					WEBSITE = p_NEW_WEBSITE
                WHERE ID = p_WEBSITE_ID;
            SET SQL_SAFE_UPDATES = 1;
            
            SELECT 'success' AS STATUS;
        ELSE
			SELECT 'not-found' AS STATUS;
        END IF;
    ELSE
		SELECT 'auth-error' AS STATUS;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 22:41:47
