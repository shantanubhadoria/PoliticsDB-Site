-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: political_database
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2-log

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
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `political_party_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loksabha_constituencies`
--

DROP TABLE IF EXISTS `loksabha_constituencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loksabha_constituencies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `constituency_number` int(11) NOT NULL,
  `state_code` varchar(2) DEFAULT NULL,
  `is_union_territory` tinyint(1) NOT NULL,
  `reserved_for` enum('SC','ST','None') NOT NULL DEFAULT 'None',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index3` (`constituency_number`,`state_code`),
  KEY `fk_loksabha_constituencies_1` (`state_code`),
  CONSTRAINT `fk_loksabha_constituencies_1` FOREIGN KEY (`state_code`) REFERENCES `states` (`state_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loksabha_constituencies`
--

LOCK TABLES `loksabha_constituencies` WRITE;
/*!40000 ALTER TABLE `loksabha_constituencies` DISABLE KEYS */;
INSERT INTO `loksabha_constituencies` VALUES (1,'Adilabad',1,'AP',0,'ST'),(2,'Peddapalli',2,'AP',0,'SC'),(4,'Karimnagar',3,'AP',0,'None'),(6,'Nizamabad',4,'AP',0,'None'),(7,'Zahirabad',5,'AP',0,'None'),(8,'Medak',6,'AP',0,'None'),(9,'Malkajgiri',7,'AP',0,'None'),(11,'Secundrabad',8,'AP',0,'None'),(12,'Hyderabad',9,'AP',0,'None'),(13,'Chevella',10,'AP',0,'None'),(14,'Mahbubnagar',11,'AP',0,'None'),(15,'Nagarkurnool',12,'AP',0,'None'),(16,'Nalgonda',13,'AP',0,'None'),(17,'Bhongir',14,'AP',0,'None'),(18,'Warangal',15,'AP',0,'None'),(19,'Secundrabad',16,'AP',0,'None'),(20,'Khammam',17,'AP',0,'None'),(21,'Araku',18,'AP',0,'None'),(22,'Srikakulam',19,'AP',0,'None'),(23,'Vizianagaram',20,'AP',0,'None'),(24,'Visakhapatnam',21,'AP',0,'None'),(25,'Anakapalli',22,'AP',0,'None'),(26,'Kakinada',23,'AP',0,'None'),(27,'Amalapuram',24,'AP',0,'None'),(28,'Rajahmundry',25,'AP',0,'None'),(29,'Naraspur',26,'AP',0,'None'),(30,'Eluru',27,'AP',0,'None'),(31,'Machillipatnam',28,'AP',0,'None'),(32,'Vijayawada',29,'AP',0,'None'),(33,'Guntur',30,'AP',0,'None'),(34,'Narasaraopet',31,'AP',0,'None'),(35,'Bapatla',32,'AP',0,'None'),(36,'Ongole',33,'AP',0,'None'),(37,'Nandyal',34,'AP',0,'None'),(38,'Kurnool',35,'AP',0,'None'),(39,'Anantapur',36,'AP',0,'None'),(40,'Hindupur',37,'AP',0,'None'),(41,'Cuddapah',38,'AP',0,'None'),(42,'Nellore',39,'AP',0,'None'),(43,'Tirupathi',40,'AP',0,'None'),(44,'Rajampet',41,'AP',0,'None'),(45,'Chittoor',42,'AP',0,'None'),(46,'Arunachal West',1,'AR',0,'None'),(47,'Arunachal East',2,'AR',0,'None'),(48,'Karimganj',1,'AS',0,'None'),(49,'Silchar',2,'AS',0,'None'),(50,'Autonomous District',3,'AS',0,'None'),(51,'Dhubri',4,'AS',0,'None'),(52,'Kokrajhar',5,'AS',0,'None'),(53,'Barpeta',6,'AS',0,'None'),(54,'Gauhati',7,'AS',0,'None'),(55,'Mangaldoi',8,'AS',0,'None'),(56,'Tezpur',9,'AS',0,'None'),(57,'Nowgong',10,'AS',0,'None'),(58,'Kallabor',11,'AS',0,'None'),(59,'Jorhat',12,'AS',0,'None'),(60,'Dibrugarh',13,'AS',0,'None'),(61,'Lakhimpur',14,'AS',0,'None'),(62,'Valmiki Nagar',1,'BR',0,'None'),(63,'Paschim Champaran',2,'BR',0,'None'),(64,'Purvi Champaran',3,'BR',0,'None'),(65,'Sheohar',4,'BR',0,'None'),(66,'Sitamarhi',5,'BR',0,'None'),(67,'Madhubani',6,'BR',0,'None'),(68,'Jhanjharpur',7,'BR',0,'None'),(69,'Supaul',8,'BR',0,'None'),(70,'Araria',9,'BR',0,'None'),(71,'Kishanganj',10,'BR',0,'None'),(72,'Katihar',11,'BR',0,'None'),(73,'Purnia',12,'BR',0,'None'),(74,'Madhepura',13,'BR',0,'None'),(75,'Darbhanga',14,'BR',0,'None'),(76,'Muzaffarpur',15,'BR',0,'None'),(77,'Vaishali',16,'BR',0,'None'),(78,'Gopalganj',17,'BR',0,'None'),(79,'Siwan',18,'BR',0,'None'),(81,'Maharajganj',19,'BR',0,'None'),(82,'Saran',20,'BR',0,'None'),(83,'Hajipur',21,'BR',0,'None'),(84,'Ujiarpur',22,'BR',0,'None'),(85,'Samastipur',23,'BR',0,'None'),(86,'Begusarai',24,'BR',0,'None'),(87,'Khagaria',25,'BR',0,'None'),(88,'Bhagalpur',26,'BR',0,'None'),(89,'Banka',27,'BR',0,'None'),(90,'Munger',28,'BR',0,'None'),(91,'Nalanda',29,'BR',0,'None'),(92,'Patna Sahib',30,'BR',0,'None'),(93,'Patliputra',31,'BR',0,'None'),(94,'Arrah',32,'BR',0,'None'),(95,'Buxar',33,'BR',0,'None'),(96,'Sasaram',34,'BR',0,'None'),(97,'Karakat',35,'BR',0,'None'),(98,'Jahanabad',36,'BR',0,'None'),(99,'Aurangabad',37,'BR',0,'None'),(100,'Gaya',38,'BR',0,'None'),(101,'Nawada',39,'BR',0,'None'),(102,'Jamui',40,'BR',0,'None'),(103,'Sarguja',1,'CT',0,'None'),(104,'Raigarh',2,'CT',0,'None'),(105,'Janjgir',3,'CT',0,'None'),(106,'Korba',4,'CT',0,'None'),(107,'Bilaspur',5,'CT',0,'None'),(108,'Rajnandgaon',6,'CT',0,'None'),(109,'Durg',7,'CT',0,'None'),(110,'Raipur',8,'CT',0,'None'),(111,'Mahasamund',9,'CT',0,'None'),(112,'Bastar',10,'CT',0,'None'),(113,'Kanker',11,'CT',0,'None'),(114,'North Goa',1,'GA',0,'None'),(115,'South Goa',2,'GA',0,'None'),(116,'Kachchh',1,'GJ',0,'None'),(117,'Banaskantha',2,'GJ',0,'None'),(118,'Patan',3,'GJ',0,'None'),(119,'Mahesana',4,'GJ',0,'None'),(120,'Sabarkantha',5,'GJ',0,'None'),(121,'Gandhinagar',6,'GJ',0,'None'),(122,'Ahmedabad East',7,'GJ',0,'None'),(123,'Ahmedabad West',8,'GJ',0,'None'),(124,'Surendranagar',9,'GJ',0,'None'),(125,'Rajkot',10,'GJ',0,'None'),(126,'Porbandar',11,'GJ',0,'None'),(127,'Jamnagar',12,'GJ',0,'None'),(128,'Junagadh',13,'GJ',0,'None'),(129,'Amreli',14,'GJ',0,'None'),(130,'Bhavnagar',15,'GJ',0,'None'),(131,'Anand',16,'GJ',0,'None'),(132,'Kheda',17,'GJ',0,'None'),(133,'Panchmahal',18,'GJ',0,'None'),(134,'Dahod',19,'GJ',0,'None'),(135,'Vadodara',20,'GJ',0,'None'),(136,'Chhota Udaipur',21,'GJ',0,'None'),(137,'Bharuch',22,'GJ',0,'None'),(138,'Bardoli',23,'GJ',0,'None'),(139,'Surat',24,'GJ',0,'None'),(140,'Navsari',25,'GJ',0,'None'),(141,'Valsad',26,'GJ',0,'None'),(142,'Ambala',1,'HR',0,'None'),(143,'Kurukshetra',2,'HR',0,'None'),(144,'Sirsa',3,'HR',0,'None'),(145,'Hissar',4,'HR',0,'None'),(146,'Karnal',5,'HR',0,'None'),(147,'Sonepat',6,'HR',0,'None'),(149,'Rohtak',7,'HR',0,'None'),(150,'Bhiwani-Mahendragarh',8,'HR',0,'None'),(151,'Gurgaon',9,'HR',0,'None'),(152,'Faridabad',10,'HR',0,'None'),(153,'Kangra',1,'HP',0,'None'),(154,'Mandi',2,'HP',0,'None'),(155,'Hamirpur',3,'HP',0,'None'),(156,'Shimla',4,'HP',0,'None'),(157,'Baramulla',1,'JK',0,'None'),(158,'Srinagar',2,'JK',0,'None'),(159,'Anantnag',3,'JK',0,'None'),(160,'Ladakh',4,'JK',0,'None'),(161,'Jammu',6,'JK',0,'None'),(162,'Rajmahal',1,'JH',0,'None'),(163,'Dumka',2,'JH',0,'None'),(164,'Godda',3,'JH',0,'None'),(165,'Chatra',4,'JH',0,'None'),(166,'Kodarma',5,'JH',0,'None'),(167,'Giridih',6,'JH',0,'None'),(168,'Dhanbad',7,'JH',0,'None'),(170,'Ranchi',8,'JH',0,'None'),(171,'Jamshedpur',9,'JH',0,'None'),(172,'Singhbhum',10,'JH',0,'None'),(174,'Khunti',11,'JH',0,'None'),(175,'Lohardaga',12,'JH',0,'None'),(176,'Palamau',13,'JH',0,'None'),(177,'Hazaribagh',14,'JH',0,'None'),(178,'Chikkodi',1,'KA',0,'None'),(179,'Belgaum',2,'KA',0,'None'),(180,'Bagalkot',3,'KA',0,'None'),(181,'Bijapur',4,'KA',0,'None'),(182,'Gulbarga',5,'KA',0,'None'),(183,'Raichur',6,'KA',0,'None'),(184,'Bidar',7,'KA',0,'None'),(186,'Koppal',8,'KA',0,'None'),(187,'Bellary',9,'KA',0,'None'),(188,'Haveri',10,'KA',0,'None'),(189,'Dharwad',11,'KA',0,'None'),(190,'Uttara Kannada',12,'KA',0,'None'),(191,'Davanagere',13,'KA',0,'None'),(192,'Shimoga',14,'KA',0,'None'),(193,'Udupi Chikamagalur',15,'KA',0,'None'),(194,'Hassan',16,'KA',0,'None'),(195,'Dakshina Kannada',17,'KA',0,'None'),(196,'Chitradurga',18,'KA',0,'None'),(197,'Tumkur',19,'KA',0,'None'),(198,'Mandya',20,'KA',0,'None'),(199,'Mysore',21,'KA',0,'None'),(200,'Chamrajanagar',22,'KA',0,'None'),(201,'Bangalore Rural',23,'KA',0,'None'),(202,'Bangalore North',24,'KA',0,'None'),(203,'Bangalore Central',25,'KA',0,'None'),(204,'Bangalore South',26,'KA',0,'None'),(205,'Chikballapur',27,'KA',0,'None'),(206,'Kolar',28,'KA',0,'None'),(207,'Kasaragod',1,'KL',0,'None'),(208,'Kannur',2,'KL',0,'None'),(209,'Vadakara',3,'KL',0,'None'),(210,'Wayanad',4,'KL',0,'None'),(211,'Kozhikode',5,'KL',0,'None'),(213,'Malappuram',6,'KL',0,'None'),(214,'Ponnani',7,'KL',0,'None'),(215,'Palakkad',8,'KL',0,'None'),(216,'Alathur',9,'KL',0,'None'),(217,'Thrissur',10,'KL',0,'None'),(218,'Chalakudy',11,'KL',0,'None'),(219,'Ernakulam',12,'KL',0,'None'),(220,'Idukki',13,'KL',0,'None'),(221,'Kottayam',14,'KL',0,'None'),(222,'Alappuzha',15,'KL',0,'None'),(223,'Mavelikera',16,'KL',0,'None'),(224,'Pathanamthitta',17,'KL',0,'None'),(225,'Kollam',18,'KL',0,'None'),(226,'Attingal',19,'KL',0,'None'),(227,'Thiruvananthapuram',20,'KL',0,'None'),(228,'Morena',1,'MP',0,'None'),(229,'Bhind',2,'MP',0,'None'),(230,'Gwalior',3,'MP',0,'None'),(231,'Guna',4,'MP',0,'None'),(232,'Sagar',5,'MP',0,'None'),(233,'Tikamgarh',6,'MP',0,'None'),(234,'Damoh',7,'MP',0,'None'),(235,'Khajuraho',8,'MP',0,'None'),(236,'Satna',9,'MP',0,'None'),(237,'Rewa',10,'MP',0,'None'),(238,'Sidhi',11,'MP',0,'None'),(240,'Shahdol',12,'MP',0,'None'),(241,'Jabalpur',13,'MP',0,'None'),(242,'Mandla',14,'MP',0,'None'),(243,'Balaghat',15,'MP',0,'None'),(244,'Chhindwara',16,'MP',0,'None'),(245,'Hoshangabad',17,'MP',0,'None'),(246,'Vidisha',18,'MP',0,'None'),(247,'Bhopal',19,'MP',0,'None'),(248,'Rajgarh',20,'MP',0,'None'),(249,'Dewas',21,'MP',0,'None'),(250,'Ujjain',22,'MP',0,'None'),(251,'Mandsaur',23,'MP',0,'None'),(252,'Ratlam',24,'MP',0,'None'),(253,'Dhar',25,'MP',0,'None'),(254,'Indore',26,'MP',0,'None'),(255,'Khargone',27,'MP',0,'None'),(256,'Khandwa',28,'MP',0,'None'),(257,'Betul',29,'MP',0,'None'),(258,'Nandurbar',1,'MH',0,'None'),(259,'Dhule',2,'MH',0,'None'),(260,'Jalgaon',3,'MH',0,'None'),(261,'Raver',4,'MH',0,'None'),(262,'Buldhana',5,'MH',0,'None'),(263,'Akola',6,'MH',0,'None'),(264,'Amravati',7,'MH',0,'None'),(265,'Wardha',8,'MH',0,'None'),(266,'Ramtek',9,'MH',0,'None'),(267,'Nagpur',10,'MH',0,'None'),(268,'Bhandara-Gondiya',11,'MH',0,'None'),(269,'Gadchiroli-Chimur',12,'MH',0,'None'),(270,'Chandrapur',13,'MH',0,'None'),(271,'Yavatmal-Washim',14,'MH',0,'None'),(273,'Hingoli',15,'MH',0,'None'),(274,'Nanded',16,'MH',0,'None'),(275,'Parbhani',17,'MH',0,'None'),(276,'Jalna',18,'MH',0,'None'),(277,'Aurangabad',19,'MH',0,'None'),(278,'Dindori',20,'MH',0,'None'),(279,'Nashik',21,'MH',0,'None'),(280,'Palghar',22,'MH',0,'None'),(281,'Bhiwandi',23,'MH',0,'None'),(282,'Kalyan',24,'MH',0,'None'),(284,'Thane',25,'MH',0,'None'),(285,'Mumbai North',26,'MH',0,'None'),(286,'Mumbai North West',27,'MH',0,'None'),(287,'Mumbai North East',28,'MH',0,'None'),(289,'Mumbai North Central',29,'MH',0,'None'),(290,'Mumbai South Central',30,'MH',0,'None'),(291,'Mumbai South',31,'MH',0,'None'),(292,'Raigad',32,'MH',0,'None'),(293,'Maval',33,'MH',0,'None'),(294,'Pune',34,'MH',0,'None'),(295,'Baramati',35,'MH',0,'None'),(296,'Shirur',36,'MH',0,'None'),(299,'Ahmednagar',37,'MH',0,'None'),(300,'Shirdi',38,'MH',0,'None'),(301,'Beed',39,'MH',0,'None'),(302,'Osmanabad',40,'MH',0,'None'),(303,'Latur',41,'MH',0,'None'),(304,'Solapur',42,'MH',0,'None'),(305,'Madha',43,'MH',0,'None'),(306,'Sangli',44,'MH',0,'None'),(307,'Satara',45,'MH',0,'None'),(308,'Ratnagiri-Sindhudurg',46,'MH',0,'None'),(309,'Kolhapur',47,'MH',0,'None'),(310,'Hatkanangle',48,'MH',0,'None'),(311,'Inner Manipur',1,'MN',0,'None'),(312,'Outer Manipur',2,'MN',0,'None'),(313,'Shillong',1,'ML',0,'None'),(314,'Tura',2,'ML',0,'None'),(315,'Mizoram',1,'MZ',0,'None'),(316,'Nagaland',1,'NL',0,'None'),(317,'Bargarh',1,'OR',0,'None'),(318,'Sundargarh',2,'OR',0,'None'),(319,'Sambalpur',3,'OR',0,'None'),(320,'Keonjhar',4,'OR',0,'None'),(321,'Mayurbhanj',5,'OR',0,'None'),(322,'Balasore',6,'OR',0,'None'),(323,'Bhadrak',7,'OR',0,'None'),(324,'Jajpur',8,'OR',0,'None'),(325,'Dhenkanal',9,'OR',0,'None'),(326,'Bolangir',10,'OR',0,'None'),(327,'Kalahandi',11,'OR',0,'None'),(328,'Nabarangpur',12,'OR',0,'None'),(329,'Kandhamal',13,'OR',0,'None'),(330,'Cuttack',14,'OR',0,'None'),(331,'Kendrapara',15,'OR',0,'None'),(332,'Jagatsinghpur',16,'OR',0,'None'),(333,'Puri',17,'OR',0,'None'),(334,'Bhubaneshwar',18,'OR',0,'None'),(335,'Aska',19,'OR',0,'None'),(336,'Berhampur',20,'OR',0,'None'),(337,'Koraput',21,'OR',0,'None'),(338,'Gurdaspur',1,'PB',0,'None'),(339,'Amritsar',2,'PB',0,'None'),(340,'Khadoor Sahib',3,'PB',0,'None'),(341,'Jalandhar',4,'PB',0,'None'),(342,'Hoshiarpur',5,'PB',0,'None'),(343,'Anandpur Sahib',6,'PB',0,'None'),(344,'Ludhiana',7,'PB',0,'None'),(345,'Fatehgarh Sahib',8,'PB',0,'None'),(346,'Faridkot',9,'PB',0,'None'),(347,'Firozpur',10,'PB',0,'None'),(348,'Bathinda',11,'PB',0,'None'),(349,'Sangrur',12,'PB',0,'None'),(350,'Patiala',13,'PB',0,'None'),(351,'Ganganagar',1,'RJ',0,'None'),(352,'Bikaner',2,'RJ',0,'None'),(353,'Churu',3,'RJ',0,'None'),(354,'Jhunjhunu',4,'RJ',0,'None'),(355,'Sikar',5,'RJ',0,'None'),(356,'Jaipur Rural',6,'RJ',0,'None'),(357,'Jaipur',7,'RJ',0,'None'),(358,'Alwar',8,'RJ',0,'None'),(359,'Bharatpur',9,'RJ',0,'None'),(360,'Karauli-Dholpur',10,'RJ',0,'None'),(361,'Dausa',11,'RJ',0,'None'),(362,'Tonk-Sawai Madhopur',12,'RJ',0,'None'),(363,'Ajmer',13,'RJ',0,'None'),(364,'Nagaur',14,'RJ',0,'None'),(365,'Pali',15,'RJ',0,'None'),(366,'Jodhpur',16,'RJ',0,'None'),(367,'Barmer',17,'RJ',0,'None'),(368,'Jalore',18,'RJ',0,'None'),(369,'Udaipur',19,'RJ',0,'None'),(370,'Banswara',20,'RJ',0,'None'),(371,'Chittorgarh',21,'RJ',0,'None'),(372,'Rajsamand',22,'RJ',0,'None'),(373,'Bhilwara',23,'RJ',0,'None'),(374,'Kota',24,'RJ',0,'None'),(375,'Jhalawar-Baran',25,'RJ',0,'None'),(376,'Sikkim',1,'SK',0,'None'),(377,'Thiruvallur',1,'TN',0,'None'),(378,'Chennai North',2,'TN',0,'None'),(379,'Chennai South',3,'TN',0,'None'),(380,'Chennai Central',4,'TN',0,'None'),(381,'Sriperumbudur',5,'TN',0,'None'),(382,'Kancheepuram',6,'TN',0,'None'),(383,'Arakkonam',7,'TN',0,'None'),(384,'Vellore',8,'TN',0,'None'),(385,'Krishnagiri',9,'TN',0,'None'),(386,'Dharmapuri',10,'TN',0,'None'),(388,'Thiruvannamalai',11,'TN',0,'None'),(389,'Arani',12,'TN',0,'None'),(390,'Villupuram',13,'TN',0,'None'),(391,'Kallakurichi',14,'TN',0,'None'),(392,'Salem',15,'TN',0,'None'),(393,'Namakkal',16,'TN',0,'None'),(394,'Erode',17,'TN',0,'None'),(395,'Tiruppur',18,'TN',0,'None'),(396,'Nilgiris',19,'TN',0,'None'),(397,'Coimbatore',20,'TN',0,'None'),(398,'Pollachi',21,'TN',0,'None'),(399,'Dindigul',22,'TN',0,'None'),(400,'Karur',23,'TN',0,'None'),(401,'Tiruchirappalli',24,'TN',0,'None'),(402,'Perambalur',25,'TN',0,'None'),(403,'Cuddalore',26,'TN',0,'None'),(404,'Chidambaram',27,'TN',0,'None'),(405,'Mayiladuturai',28,'TN',0,'None'),(406,'Nagapattinam',29,'TN',0,'None'),(407,'Thanjavur',30,'TN',0,'None'),(408,'Sivaganga',31,'TN',0,'None'),(409,'Madurai',32,'TN',0,'None'),(410,'Theni',33,'TN',0,'None'),(411,'Virudhunagar',34,'TN',0,'None'),(412,'Ramanathapuram',35,'TN',0,'None'),(413,'Thoothukudi',36,'TN',0,'None'),(414,'Tenkasi',37,'TN',0,'None'),(415,'Tirunelveli',38,'TN',0,'None'),(418,'Kanyakumari',39,'TN',0,'None'),(419,'Tripura West',1,'TR',0,'None'),(420,'Tripura East',2,'TR',0,'None'),(421,'Saharanpur',1,'UP',0,'None'),(422,'Kairana',2,'UP',0,'None'),(423,'Muzaffarnagar',3,'UP',0,'None'),(425,'Bijnor',4,'UP',0,'None'),(426,'Nagina',5,'UP',0,'None'),(427,'Moradabad',6,'UP',0,'None'),(429,'Rampur',7,'UP',0,'None'),(430,'Sambhal',8,'UP',0,'None'),(431,'Amroha',9,'UP',0,'None'),(432,'Meerut',10,'UP',0,'None'),(434,'Baghpat',11,'UP',0,'None'),(435,'Ghaziabad',12,'UP',0,'None'),(436,'Gautam Buddha Nagar',13,'UP',0,'None'),(437,'Bulandshahr',14,'UP',0,'None'),(438,'Aligarh',15,'UP',0,'None'),(439,'Hathras',16,'UP',0,'None'),(440,'Mathura',17,'UP',0,'None'),(441,'Agra',18,'UP',0,'None'),(442,'Fatehpur Sikri',19,'UP',0,'None'),(443,'Firozabad',20,'UP',0,'None'),(444,'Mainpuri',21,'UP',0,'None'),(445,'Etah',22,'UP',0,'None'),(446,'Badaun',23,'UP',0,'None'),(447,'Aonla',24,'UP',0,'None'),(448,'Bareilly',25,'UP',0,'None'),(449,'Pilibhit',26,'UP',0,'None'),(451,'Shahjahanpur',27,'UP',0,'None'),(452,'Kheri',28,'UP',0,'None'),(453,'Daurahra',29,'UP',0,'None'),(454,'Sitapur',30,'UP',0,'None'),(455,'Hardoi',31,'UP',0,'None'),(456,'Misrikh',32,'UP',0,'None'),(457,'Unnao',33,'UP',0,'None'),(458,'Mohanlalganj',34,'UP',0,'None'),(460,'Lucknow',35,'UP',0,'None'),(461,'Rae Bareli',36,'UP',0,'None'),(462,'Amethi',37,'UP',0,'None'),(463,'Sultanpur',38,'UP',0,'None'),(464,'Pratapgarh',39,'UP',0,'None'),(465,'Farrukhabad',40,'UP',0,'None'),(466,'Etawah',41,'UP',0,'None'),(467,'Kannauj',42,'UP',0,'None'),(468,'Kanpur Urban',43,'UP',0,'None'),(469,'Kanpur Rural',44,'UP',0,'None'),(471,'Jalaun',45,'UP',0,'None'),(472,'Jhansi',46,'UP',0,'None'),(473,'Hamirpur',47,'UP',0,'None'),(474,'Banda',48,'UP',0,'None'),(475,'Fatehpur',49,'UP',0,'None'),(476,'Kaushambi',50,'UP',0,'None'),(477,'Phulpur',51,'UP',0,'None'),(478,'Allahabad',52,'UP',0,'None'),(479,'Barabanki',53,'UP',0,'None'),(480,'Faizabad',54,'UP',0,'None'),(481,'Ambedkarnagar',55,'UP',0,'None'),(483,'Bahraich',56,'UP',0,'None'),(484,'Kaiserganj',57,'UP',0,'None'),(485,'Shrawasti',58,'UP',0,'None'),(486,'Gonda',59,'UP',0,'None'),(487,'Domariyaganj',60,'UP',0,'None'),(488,'Basti',61,'UP',0,'None'),(489,'Sant Kabir Nagar',62,'UP',0,'None'),(490,'Maharajganj',63,'UP',0,'None'),(492,'Gorakhpur',64,'UP',0,'None'),(493,'Kushi Nagar',65,'UP',0,'None'),(494,'Deoria',66,'UP',0,'None'),(495,'Bansgaon',67,'UP',0,'None'),(496,'Lalganj',68,'UP',0,'None'),(497,'Azamgarh',69,'UP',0,'None'),(498,'Ghosi',70,'UP',0,'None'),(499,'Salempur',71,'UP',0,'None'),(500,'Ballia',72,'UP',0,'None'),(501,'Jaunpur',73,'UP',0,'None'),(502,'Machhlishahr',74,'UP',0,'None'),(503,'Ghazipur',75,'UP',0,'None'),(504,'Chandauli',76,'UP',0,'None'),(505,'Varanasi',77,'UP',0,'None'),(506,'Bhadohi',78,'UP',0,'None'),(507,'Mirzapur',79,'UP',0,'None'),(508,'Robertsganj',80,'UP',0,'None'),(509,'Tehri Garhwal',1,'UK',0,'None'),(510,'Garhwal',2,'UK',0,'None'),(511,'Almora',3,'UK',0,'None'),(512,'Nainital',4,'UK',0,'None'),(513,'Haridwar',5,'UK',0,'None'),(514,'Cooch Behar',1,'WB',0,'None'),(515,'Alipurduars',2,'WB',0,'None'),(516,'Jalpaiguri',3,'WB',0,'None'),(517,'Darjeeling',4,'WB',0,'None'),(518,'Raiganj',5,'WB',0,'None'),(519,'Balurghat',6,'WB',0,'None'),(520,'Maldaha Uttar',7,'WB',0,'None'),(521,'Maldaha Dakshin',8,'WB',0,'None'),(522,'Jangipur',9,'WB',0,'None'),(523,'Baharampur',10,'WB',0,'None'),(524,'Murshidabad',11,'WB',0,'None'),(525,'Krishnanagar',12,'WB',0,'None'),(527,'Ranaghat',13,'WB',0,'None'),(528,'Bangaon',14,'WB',0,'None'),(529,'Barrackpore',15,'WB',0,'None'),(530,'Dum Dum',16,'WB',0,'None'),(531,'Barasat',17,'WB',0,'None'),(532,'Basirhat',18,'WB',0,'None'),(533,'Jaynagar',19,'WB',0,'None'),(534,'Mathurapur',20,'WB',0,'None'),(535,'Diamond Harbour',21,'WB',0,'None'),(536,'Jadavpur',22,'WB',0,'None'),(537,'Kolkata Dakshin',23,'WB',0,'None'),(538,'Kolkata Uttar',24,'WB',0,'None'),(540,'Howrah',25,'WB',0,'None'),(541,'Uluberia',26,'WB',0,'None'),(542,'Sreerampur',27,'WB',0,'None'),(543,'Hooghly',28,'WB',0,'None'),(544,'Arambag',29,'WB',0,'None'),(545,'Tamluk',30,'WB',0,'None'),(546,'Kanthi',31,'WB',0,'None'),(547,'Ghatal',32,'WB',0,'None'),(548,'Jhargram',33,'WB',0,'None'),(549,'Medinipur',34,'WB',0,'None'),(550,'Purulia',35,'WB',0,'None'),(551,'Bankura',36,'WB',0,'None'),(552,'Bishnupur',37,'WB',0,'None'),(553,'Bardhaman Purba',38,'WB',0,'None'),(554,'Bardhaman-Durgapur',39,'WB',0,'None'),(555,'Asansol',40,'WB',0,'None'),(556,'Bolpur',41,'WB',0,'None'),(557,'Birbhum',42,'WB',0,'None'),(562,'Andaman and Nicobar Islands',1,NULL,1,'None'),(563,'Chandigarh',1,NULL,1,'None'),(564,'Dadra and Nagar Haveli',1,NULL,1,'None'),(565,'Daman and Diu',1,NULL,1,'None'),(566,'Lakshadweep',1,NULL,1,'None'),(567,'Puducherry',1,NULL,1,'None'),(568,'Chandni Chowk',1,'DL',0,'None'),(569,'North East Delhi',2,'DL',0,'None'),(570,'East Delhi',0,NULL,0,''),(571,'New Delhi',4,'DL',0,'None'),(572,'North West Delhi',5,'DL',0,'None'),(573,'West Delhi',6,'DL',0,'None'),(574,'South Delhi',7,'DL',0,'None');
/*!40000 ALTER TABLE `loksabha_constituencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loksabha_constituencies_candidate_maps`
--

DROP TABLE IF EXISTS `loksabha_constituencies_candidate_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loksabha_constituencies_candidate_maps` (
  `candidate_id` int(11) unsigned NOT NULL,
  `loksabha_constituency_id` int(11) unsigned NOT NULL,
  `year` year(4) NOT NULL,
  `political_party_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`candidate_id`,`loksabha_constituency_id`,`year`),
  KEY `fk_loksabha_constituencies_candidate_maps_1` (`candidate_id`),
  KEY `fk_loksabha_constituencies_candidate_maps_2` (`loksabha_constituency_id`),
  KEY `fk_loksabha_constituencies_candidate_maps_3` (`political_party_id`),
  CONSTRAINT `fk_loksabha_constituencies_candidate_maps_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loksabha_constituencies_candidate_maps_2` FOREIGN KEY (`loksabha_constituency_id`) REFERENCES `loksabha_constituencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loksabha_constituencies_candidate_maps_3` FOREIGN KEY (`political_party_id`) REFERENCES `political_parties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loksabha_constituencies_candidate_maps`
--

LOCK TABLES `loksabha_constituencies_candidate_maps` WRITE;
/*!40000 ALTER TABLE `loksabha_constituencies_candidate_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `loksabha_constituencies_candidate_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `political_parties`
--

DROP TABLE IF EXISTS `political_parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `political_parties` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `election_symbol` varchar(255) NOT NULL,
  `election_symbol_image_96` varchar(255) DEFAULT NULL,
  `type_of_party` enum('national','state','registered_unrecognized') NOT NULL,
  `founding_year` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `political_parties`
--

LOCK TABLES `political_parties` WRITE;
/*!40000 ALTER TABLE `political_parties` DISABLE KEYS */;
INSERT INTO `political_parties` VALUES (1,'Bahujan Samaj Party','Elephant',NULL,'national',1984),(2,'Bharatiya Janata Party','Lotus',NULL,'national',1980),(3,'Communist Party Of India','Ears of Corn and Sickle',NULL,'national',1925);
/*!40000 ALTER TABLE `political_parties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `parent_role_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roles_1` (`parent_role_id`),
  CONSTRAINT `fk_roles_1` FOREIGN KEY (`parent_role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_political_parties_maps`
--

DROP TABLE IF EXISTS `state_political_parties_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_political_parties_maps` (
  `political_party_id` int(11) unsigned NOT NULL,
  `state_code` varchar(2) NOT NULL,
  PRIMARY KEY (`political_party_id`,`state_code`),
  KEY `fk_state_political_parties_maps_1` (`political_party_id`),
  KEY `fk_state_political_parties_maps_2` (`state_code`),
  CONSTRAINT `fk_state_political_parties_maps_1` FOREIGN KEY (`political_party_id`) REFERENCES `political_parties` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_state_political_parties_maps_2` FOREIGN KEY (`state_code`) REFERENCES `states` (`state_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_political_parties_maps`
--

LOCK TABLES `state_political_parties_maps` WRITE;
/*!40000 ALTER TABLE `state_political_parties_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `state_political_parties_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `state_code` varchar(2) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`state_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('AP','Andhra Pradesh'),('AR','Arunachal Pradesh'),('AS','Assam'),('BR','Bihar'),('CT','Chattisgarh'),('DL','Delhi'),('GA','Goa'),('GJ','Gujarat'),('HP','Himachal Pradesh'),('HR','Haryana'),('JH','Jharkand'),('JK','Jammu & Kashmir'),('KA','Karnataka'),('KL','Kerala'),('MH','Maharashtra'),('ML','Meghalaya'),('MN','Manipur'),('MP','Madhya Pradesh'),('MZ','Mizoram'),('NL','Nagaland'),('OR','Odisha'),('PB','Punjab'),('RJ','Rajasthan'),('SK','Sikkim'),('TN','Tamil Nadu'),('TR','Tripura'),('UK','Uttarakhand'),('UP','Uttar Pradesh'),('WB','West Bengal');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_maps`
--

DROP TABLE IF EXISTS `user_role_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_maps` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_role_maps_1` (`user_id`),
  KEY `fk_user_role_maps_2` (`role_id`),
  CONSTRAINT `fk_user_role_maps_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_role_maps_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_maps`
--

LOCK TABLES `user_role_maps` WRITE;
/*!40000 ALTER TABLE `user_role_maps` DISABLE KEYS */;
INSERT INTO `user_role_maps` VALUES (1,1);
/*!40000 ALTER TABLE `user_role_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `mobile_number` varchar(45) NOT NULL,
  `authenticated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `mobile_number_UNIQUE` (`mobile_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'shantanubhadoria','shantanu@cpan.org','{SSHA}ilEqMEeXrN4hQKAwV3+0j5NTda75O8fqN06hcOS2Ad7sjV0gG+2nug==','Shantanu',NULL,'Bhadoria','92296717',0);
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

-- Dump completed on 2014-03-26 10:33:38
