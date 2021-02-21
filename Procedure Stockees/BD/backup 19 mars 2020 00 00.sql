-- MySqlBackup.NET 2.3.1
-- Dump Time: 2020-03-19 14:51:26
-- --------------------------------------
-- Server version 8.0.19 MySQL Community Server - GPL


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 
-- Definition of propriete_fichier
-- 

DROP TABLE IF EXISTS `propriete_fichier`;
CREATE TABLE IF NOT EXISTS `propriete_fichier` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `entete_gauche` varchar(50) DEFAULT NULL,
  `entete_droite` varchar(50) DEFAULT NULL,
  `taux_dolars` double(8,2) DEFAULT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table propriete_fichier
-- 

/*!40000 ALTER TABLE `propriete_fichier` DISABLE KEYS */;
INSERT INTO `propriete_fichier`(`id`,`entete_gauche`,`entete_droite`,`taux_dolars`,`adresse`,`telephone`) VALUES
(1,'La confidence','Toujours à votre service',1700,'1002 Ruashi av. salama','+243994163572');
/*!40000 ALTER TABLE `propriete_fichier` ENABLE KEYS */;

-- 
-- Definition of taux_interet
-- 

DROP TABLE IF EXISTS `taux_interet`;
CREATE TABLE IF NOT EXISTS `taux_interet` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `montant_1` double(9,2) DEFAULT NULL,
  `echeance` smallint NOT NULL,
  `taux` double(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `montant_1` (`montant_1`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table taux_interet
-- 

/*!40000 ALTER TABLE `taux_interet` DISABLE KEYS */;
INSERT INTO `taux_interet`(`id`,`montant_1`,`echeance`,`taux`) VALUES
(1,200000,1,10),
(2,500000,3,20),
(3,1000000,4,20);
/*!40000 ALTER TABLE `taux_interet` ENABLE KEYS */;

-- 
-- Definition of users
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table users
-- 

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users`(`id`,`login`,`password`) VALUES
(1,'kapapa','1993');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 
-- Definition of clients
-- 

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `postnom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(50) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `adresse_physique` text,
  `date_inscription` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `users_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table clients
-- 

/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients`(`id`,`nom`,`postnom`,`prenom`,`date_naissance`,`lieu_naissance`,`telephone`,`adresse_physique`,`users_id`) VALUES
(1,'KAPAPA','MUMBA','Théophile','1993-07-15 00:00:00','lubumbashi','+243994163572','',1),
(2,'KAPAPA','MUMBA','Théophile','1993-07-15 00:00:00','lubumbashi','+243994163572','',1),
(3,'katasi','fanikisa','Christa','1995-02-09 00:00:00','kinshasa','+243994163572','',1),
(4,'katasi','fanikisa','Christa','1995-02-09 00:00:00','kinshasa','+243994163572','',1),
(5,'kapapa','mumba','Chloé','2019-04-01 00:00:00','lubumabashi','+243994163572','',1),
(6,'kapapa','mumba','Chloé','2019-04-01 00:00:00','lubumabashi','+243994163572','',1),
(7,'kumwimba','kalulenga','alex','1991-01-01 00:00:00','lubumbashi','+2439906565685','',1),
(8,'kafanka','kumwimba','modeste','1997-02-05 00:00:00','lubumbashi','+24399065656','',1),
(9,'kafanka','kumwimba','modeste','1997-02-05 00:00:00','lubumbashi','+24399065656','',1),
(10,'kafanka','kumwimba','modeste','1997-02-05 00:00:00','lubumbashi','+24399065656','',1),
(11,'kafanka','kumwimba','modeste','1997-02-05 00:00:00','lubumbashi','+24399065656','',1),
(12,'kafanka','kumwimba','modeste','1997-02-05 00:00:00','lubumbashi','+24399065656','',1),
(13,'kasongo','banza','yves','2020-03-10 00:00:00','likasi','+243994152658','',1),
(14,'masengo','nsunga','gérome','2020-03-11 00:00:00','lubumbashi','+243994163572','',1),
(15,'musonko','ilunga','jean','2020-03-11 00:00:00','likasi','+243994163572','',1),
(16,'kasongo','lukenya','fidèle','2020-03-11 00:00:00','kasumbalesa','+243994163572','',1),
(17,'kisimba','lowa','kennedy','2020-03-11 00:00:00','lubumbashi','+243994525633','',1),
(18,'kalunga','musimbwa','barnabé','2020-03-11 00:00:00','kongolo','+243994163571','',1),
(19,'kalunga','musimbwa','barnabé','2020-03-11 00:00:00','kongolo','+243994163571','',1),
(20,'kalunga','musimbwa','barnabé','2020-03-11 00:00:00','kongolo','+243994163571','',1),
(21,'kalenga','mbidi','jeef','2020-03-11 00:00:00','lubumbashi','+2438575425','',1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

-- 
-- Definition of comptes
-- 

DROP TABLE IF EXISTS `comptes`;
CREATE TABLE IF NOT EXISTS `comptes` (
  `id` smallint(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `numero_compte` varchar(12) NOT NULL,
  `intitule_compte` mediumtext NOT NULL,
  `type_compte` enum('courant','epargne') DEFAULT NULL,
  `devise` enum('USD','CDF') DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `solde` double(12,2) NOT NULL DEFAULT '0.00',
  `client_id` smallint unsigned NOT NULL,
  `users_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_compte` (`numero_compte`),
  UNIQUE KEY `type_compte` (`type_compte`,`devise`,`client_id`),
  KEY `client_id` (`client_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `comptes_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `comptes_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table comptes
-- 

/*!40000 ALTER TABLE `comptes` DISABLE KEYS */;
INSERT INTO `comptes`(`id`,`numero_compte`,`intitule_compte`,`type_compte`,`devise`,`solde`,`client_id`,`users_id`) VALUES
(1,'1235','kumwimba usd courant','courant','USD',35450,6,1),
(4,'1236','kumwimba usd CDF','epargne','CDF',35450,9,1),
(6,'1237','KATUMBA usd CDF','epargne','CDF',35450,11,1),
(7,'157','musonko ilunga jean','epargne','CDF',60400,14,1),
(8,'168','kasongo lukenya fidèle','courant','CDF',285400,15,1),
(9,'179','kisimba lowa kennedy','epargne','CDF',135400,16,1),
(10,'1810','kalunga musimbwa barnabé','courant','USD',35440,17,1),
(13,'2111','kalenga mbidi jeef','courant','CDF',535400,20,1),
(14,'2214','KAPAPA MUMBA Théophile','courant','USD',35650,1,1),
(15,'2215','KAPAPA MUMBA Théophile','courant','CDF',60400,1,1),
(20,'2216','KAPAPA MUMBA Théophile','courant','CDF',60400,2,1),
(23,'2221','KAPAPA MUMBA Théophile','courant','USD',36400,2,1),
(26,'2224','masengo nsunga gérome','courant','CDF',37900,14,1),
(29,'2227','kafanka kumwimba modeste','courant','CDF',37900,10,1),
(31,'2230','kapapa mumba Chloé','courant','USD',35500,5,1),
(36,'2232','kalenga mbidi jeef','courant','USD',35900,21,1),
(41,'2237','kafanka kumwimba modeste','courant','CDF',100000,9,1);
/*!40000 ALTER TABLE `comptes` ENABLE KEYS */;

-- 
-- Definition of depots
-- 

DROP TABLE IF EXISTS `depots`;
CREATE TABLE IF NOT EXISTS `depots` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `date_depots` date NOT NULL,
  `montant_depot` double(12,2) NOT NULL,
  `comptes_id` smallint unsigned NOT NULL,
  `users_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comptes_id` (`comptes_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `depots_ibfk_1` FOREIGN KEY (`comptes_id`) REFERENCES `comptes` (`id`),
  CONSTRAINT `depots_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table depots
-- 

/*!40000 ALTER TABLE `depots` DISABLE KEYS */;
INSERT INTO `depots`(`id`,`date_depots`,`montant_depot`,`comptes_id`,`users_id`) VALUES
(1,'2020-03-12 00:00:00',10,1,1),
(2,'2020-03-12 00:00:00',-10,1,1),
(4,'2020-03-12 00:00:00',301,1,1),
(5,'2020-03-12 00:00:00',30,1,1),
(6,'2020-03-12 00:00:00',139,1,1),
(7,'2020-03-12 00:00:00',9100,13,1),
(8,'2020-03-13 00:00:00',5000,1,1),
(9,'2020-03-13 00:00:00',5200,4,1),
(10,'2020-03-13 00:00:00',1000,1,1),
(11,'2020-03-13 00:00:00',120,6,1),
(12,'2020-03-13 00:00:00',180,6,1),
(13,'2020-03-13 00:00:00',180,6,1),
(14,'2020-03-13 00:00:00',500,1,1),
(15,'2020-03-13 00:00:00',500,1,1),
(16,'2020-03-13 00:00:00',1000,9,1),
(17,'2020-03-13 00:00:00',5200,9,1),
(18,'2020-03-13 00:00:00',500,23,1),
(19,'2020-03-13 00:00:00',500,23,1),
(20,'2020-03-13 00:00:00',5200,13,1),
(21,'2020-03-13 00:00:00',5200,8,1),
(22,'2020-03-13 00:00:00',2000,8,1),
(23,'2020-03-13 00:00:00',1000,23,1);
/*!40000 ALTER TABLE `depots` ENABLE KEYS */;

-- 
-- Definition of emprunts_cdf
-- 

DROP TABLE IF EXISTS `emprunts_cdf`;
CREATE TABLE IF NOT EXISTS `emprunts_cdf` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `date_emprunt` date NOT NULL,
  `echeance` date NOT NULL,
  `montant_emprunt` double(10,2) DEFAULT NULL,
  `clients_id` smallint unsigned NOT NULL,
  `users_id` smallint unsigned NOT NULL,
  `paye` enum('NON','OUI') DEFAULT 'NON',
  PRIMARY KEY (`id`),
  KEY `clients_id` (`clients_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `emprunts_cdf_ibfk_1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `emprunts_cdf_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table emprunts_cdf
-- 

/*!40000 ALTER TABLE `emprunts_cdf` DISABLE KEYS */;
INSERT INTO `emprunts_cdf`(`id`,`date_emprunt`,`echeance`,`montant_emprunt`,`clients_id`,`users_id`,`paye`) VALUES
(5,'2020-03-15 00:00:00','2020-04-15 00:00:00',100,21,1,'NON'),
(7,'2020-03-15 00:00:00','2020-04-15 00:00:00',10000,7,1,'NON'),
(8,'2020-03-15 00:00:00','2020-04-15 00:00:00',60000,4,1,'NON'),
(9,'2020-03-16 00:00:00','2020-04-16 00:00:00',10000,10,1,'NON'),
(10,'2020-03-16 00:00:00','2020-04-16 00:00:00',200000,19,1,'NON'),
(11,'2020-03-16 00:00:00','2020-06-16 00:00:00',250000,5,1,'NON'),
(12,'2020-03-16 00:00:00','2020-04-16 00:00:00',100000,6,1,'NON'),
(13,'2020-03-16 00:00:00','2020-04-16 00:00:00',120000,11,1,'NON'),
(14,'2020-03-17 00:00:00','2020-04-17 00:00:00',1000,12,1,'NON');
/*!40000 ALTER TABLE `emprunts_cdf` ENABLE KEYS */;

-- 
-- Definition of emprunts_usd
-- 

DROP TABLE IF EXISTS `emprunts_usd`;
CREATE TABLE IF NOT EXISTS `emprunts_usd` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `date_emprunt` date NOT NULL,
  `echeance` date NOT NULL,
  `montant_emprunt` double(10,2) DEFAULT NULL,
  `clients_id` smallint unsigned NOT NULL,
  `users_id` smallint unsigned NOT NULL,
  `paye` enum('NON','OUI') DEFAULT 'NON',
  PRIMARY KEY (`id`),
  KEY `clients_id` (`clients_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `emprunts_usd_ibfk_1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `emprunts_usd_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table emprunts_usd
-- 

/*!40000 ALTER TABLE `emprunts_usd` DISABLE KEYS */;
INSERT INTO `emprunts_usd`(`id`,`date_emprunt`,`echeance`,`montant_emprunt`,`clients_id`,`users_id`,`paye`) VALUES
(1,'2020-03-15 00:00:00','2020-04-15 00:00:00',10000000,3,1,'NON'),
(2,'2020-03-15 00:00:00','2020-06-15 00:00:00',10000000,9,1,'OUI'),
(3,'2020-03-15 00:00:00','2020-04-15 00:00:00',10000000,15,1,'NON'),
(4,'2020-03-16 00:00:00','2020-04-16 00:00:00',10000000,14,1,'NON'),
(5,'2020-03-16 00:00:00','2020-04-16 00:00:00',10000000,1,1,'OUI'),
(6,'2020-03-16 00:00:00','2020-04-16 00:00:00',10000000,8,1,'NON');
/*!40000 ALTER TABLE `emprunts_usd` ENABLE KEYS */;

-- 
-- Definition of paiement_emprunt_cdf
-- 

DROP TABLE IF EXISTS `paiement_emprunt_cdf`;
CREATE TABLE IF NOT EXISTS `paiement_emprunt_cdf` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `date_paie` date NOT NULL,
  `montant_paie` double(10,2) DEFAULT NULL,
  `emprunts_id` smallint unsigned NOT NULL,
  `users_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emprunts_id` (`emprunts_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `paiement_emprunt_cdf_ibfk_1` FOREIGN KEY (`emprunts_id`) REFERENCES `emprunts_cdf` (`id`),
  CONSTRAINT `paiement_emprunt_cdf_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table paiement_emprunt_cdf
-- 

/*!40000 ALTER TABLE `paiement_emprunt_cdf` DISABLE KEYS */;
INSERT INTO `paiement_emprunt_cdf`(`id`,`date_paie`,`montant_paie`,`emprunts_id`,`users_id`) VALUES
(1,'2020-03-19 00:00:00',9000,9,1);
/*!40000 ALTER TABLE `paiement_emprunt_cdf` ENABLE KEYS */;

-- 
-- Definition of paiement_emprunt_usd
-- 

DROP TABLE IF EXISTS `paiement_emprunt_usd`;
CREATE TABLE IF NOT EXISTS `paiement_emprunt_usd` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `date_paie` date NOT NULL,
  `montant_paie` double(10,2) DEFAULT NULL,
  `emprunts_id` smallint unsigned NOT NULL,
  `users_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emprunts_id` (`emprunts_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `paiement_emprunt_usd_ibfk_1` FOREIGN KEY (`emprunts_id`) REFERENCES `emprunts_usd` (`id`),
  CONSTRAINT `paiement_emprunt_usd_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table paiement_emprunt_usd
-- 

/*!40000 ALTER TABLE `paiement_emprunt_usd` DISABLE KEYS */;
INSERT INTO `paiement_emprunt_usd`(`id`,`date_paie`,`montant_paie`,`emprunts_id`,`users_id`) VALUES
(1,'2020-03-18 00:00:00',1000,2,1),
(2,'2020-03-19 00:00:00',1000,2,1),
(3,'2020-03-19 00:00:00',98000,2,1),
(4,'2020-03-19 00:00:00',200000,2,1),
(5,'2020-03-19 00:00:00',11700000,2,1),
(6,'2020-03-19 00:00:00',11700000,2,1),
(7,'2020-03-19 00:00:00',12000000,5,1);
/*!40000 ALTER TABLE `paiement_emprunt_usd` ENABLE KEYS */;

-- 
-- Definition of retraits
-- 

DROP TABLE IF EXISTS `retraits`;
CREATE TABLE IF NOT EXISTS `retraits` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `date_retraits` date NOT NULL,
  `montant_retraits` double(12,2) NOT NULL DEFAULT '0.00',
  `comptes_id` smallint unsigned NOT NULL,
  `users_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comptes_id` (`comptes_id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `retraits_ibfk_1` FOREIGN KEY (`comptes_id`) REFERENCES `comptes` (`id`),
  CONSTRAINT `retraits_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 
-- Dumping data for table retraits
-- 

/*!40000 ALTER TABLE `retraits` DISABLE KEYS */;
INSERT INTO `retraits`(`id`,`date_retraits`,`montant_retraits`,`comptes_id`,`users_id`) VALUES
(1,'2020-03-12 00:00:00',30,1,1),
(2,'2020-03-12 00:00:00',30,1,1),
(3,'2020-03-13 00:00:00',500,23,1),
(4,'2020-03-13 00:00:00',1000,23,1),
(5,'2020-03-13 00:00:00',500,23,1),
(6,'2020-03-13 00:00:00',430,13,1),
(7,'2020-03-14 00:00:00',5000,23,1);
/*!40000 ALTER TABLE `retraits` ENABLE KEYS */;

-- 
-- Dumping triggers
-- 

DROP TRIGGER /*!50030 IF EXISTS */ `before_insert_depots`;
DELIMITER |
CREATE TRIGGER `before_insert_depots` BEFORE INSERT ON `depots` FOR EACH ROW BEGIN
	if new.montant_depot is not null 
		AND new.montant_depot > 0
    THEN
        update comptes SET SOLDE= SOLDE + new.montant_depot ;
	end if ;
END |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `before_insert_paiement_emprunt_cdf`;
DELIMITER |
CREATE TRIGGER `before_insert_paiement_emprunt_cdf` AFTER INSERT ON `paiement_emprunt_cdf` FOR EACH ROW BEGIN
	-- obtenir le montant total payé et le montant emprunté par numéro du  client
	declare montant_total_paye double;
	declare montant_emprunte double;
    
	 set montant_total_paye= (select sum(montant_paie) from paiement_emprunt_cdf where emprunts_id=new.emprunts_id);
	 set montant_emprunte=(select montant_emprunt from emprunts_cdf where id=new.emprunts_id);
	 
	 -- Si montant payé est égal au montant emprunté alors on met à jour la table emprunts_cdf la colonne paye
	 
		if montant_total_paye is not null 
			AND montant_emprunte is not null
			AND montant_total_paye >= montant_emprunte
		THEN
		-- on met à jour la colonne payé par rapport à l'id
		
			update emprunts_cdf SET paye= "OUI" where id=new.emprunts_id;
		end if ;
END |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `before_insert_paiement_emprunt_usd`;
DELIMITER |
CREATE TRIGGER `before_insert_paiement_emprunt_usd` AFTER INSERT ON `paiement_emprunt_usd` FOR EACH ROW BEGIN
	-- obtenir le montant total payé et le montant emprunté par numéro du  client
	declare montant_total_paye double;
	declare montant_emprunte double;
    
	 set montant_total_paye= (select sum(montant_paie) from paiement_emprunt_usd where emprunts_id=new.emprunts_id);
	 set montant_emprunte=(select montant_emprunt from emprunts_usd where id=new.emprunts_id);
	 
	 -- Si montant payé est égal au montant emprunté alors on met à jour la table emprunts_cdf la colonne paye
	 
		if montant_total_paye is not null 
			AND montant_emprunte is not null
			AND montant_total_paye >= montant_emprunte
		THEN
		-- on met à jour la colonne payé par rapport à l'id
		
			update emprunts_usd SET paye= "OUI" where id=new.emprunts_id;
		end if ;
END |
DELIMITER ;

DROP TRIGGER /*!50030 IF EXISTS */ `before_insert_retraits`;
DELIMITER |
CREATE TRIGGER `before_insert_retraits` BEFORE INSERT ON `retraits` FOR EACH ROW BEGIN
	if new.montant_retraits is not null 
		AND new.montant_retraits > 0
    THEN
        update comptes SET solde= solde - new.montant_retraits ;
	end if ;
END |
DELIMITER ;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2020-03-19 14:51:26
-- Total time: 0:0:0:0:125 (d:h:m:s:ms)
