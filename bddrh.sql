-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 13, 2021 at 02:59 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bddrh`
--

-- --------------------------------------------------------

--
-- Table structure for table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `id` int(11) NOT NULL,
  `dateDébut` date NOT NULL,
  `dateFin` date DEFAULT NULL,
  `idSal` varchar(11) NOT NULL,
  `idPoste` int(11) NOT NULL,
  `idService` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPoste` (`idPoste`),
  KEY `idService` (`idService`),
  KEY `idSal` (`idSal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contrat`
--

INSERT INTO `contrat` (`id`, `dateDébut`, `dateFin`, `idSal`, `idPoste`, `idService`) VALUES
(1977102, '1977-03-15', '1985-03-01', '148A12', 1, 'B01'),
(1985076, '1985-03-01', '2002-09-15', '148A12', 3, 'F01'),
(2000098, '2000-09-01', '2010-10-10', '156A12', 4, 'G01'),
(2002181, '2002-09-15', NULL, '148A12', 2, 'F01'),
(2008045, '2008-05-05', '2008-10-17', '196A12', 1, 'E21'),
(2008111, '2008-10-17', NULL, '196A12', 1, 'E21'),
(2010065, '2010-10-10', NULL, '156A12', 5, 'G01');

-- --------------------------------------------------------

--
-- Table structure for table `poste`
--

DROP TABLE IF EXISTS `poste`;
CREATE TABLE IF NOT EXISTS `poste` (
  `id` int(11) NOT NULL,
  `libelle` varchar(25) NOT NULL,
  `caracteristique` varchar(35) NOT NULL,
  `indice` int(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poste`
--

INSERT INTO `poste` (`id`, `libelle`, `caracteristique`, `indice`) VALUES
(1, 'Magasinier', 'magasinier en reserve ', 385),
(2, 'Responsable informatique ', 'Gestion équipe de 2 à 3 personnes ', 455),
(3, 'Informaticien', 'Maintenance technique ', 395),
(4, 'Hôtesse de caisse ', 'Rotation horaire et week-end', 365),
(5, 'Chargé d\'équipe', 'Manage de 10 hôte de caisse ', 430),
(6, 'Commercial ', 'Poste en Rayon ', 400);

-- --------------------------------------------------------

--
-- Table structure for table `salarie`
--

DROP TABLE IF EXISTS `salarie`;
CREATE TABLE IF NOT EXISTS `salarie` (
  `id` varchar(11) NOT NULL,
  `numSecu` varchar(25) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `dateNaiss` date NOT NULL,
  `dateEmbauche` date NOT NULL,
  `tel` int(11) NOT NULL,
  `mail` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salarie`
--

INSERT INTO `salarie` (`id`, `numSecu`, `nom`, `prenom`, `dateNaiss`, `dateEmbauche`, `tel`, `mail`) VALUES
('148A12', '1520814168026', 'MARTIN', 'Pierre', '1952-08-05', '1977-03-15', 3815050, 'pierre.martin@proxim.fr'),
('156A12', '2671154395023', 'ESTEN', 'Solène', '1967-11-18', '2000-09-01', 30552202, 'solene.esten@proxim.fr'),
('196A12', '2820388485089', 'BENARBIA', 'Samia', '1982-03-28', '2008-05-05', 647425522, 'samia.benerbia@proxim.fr');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `id` varchar(3) NOT NULL,
  `libelle` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `libelle`) VALUES
('A00', 'Direction générale'),
('B01', 'Approvisionnement'),
('C01', 'Comptabilité'),
('D11', 'Boucherie'),
('E01', 'Epicerie '),
('E11', 'Produits frais'),
('E21', 'Electroménager'),
('E31', 'Animalerie et jardin'),
('F01', 'Informatique'),
('F02', 'Ressources humaines'),
('G01', 'Caisse ');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `contrat_ibfk_1` FOREIGN KEY (`idPoste`) REFERENCES `poste` (`id`),
  ADD CONSTRAINT `contrat_ibfk_2` FOREIGN KEY (`idService`) REFERENCES `service` (`id`),
  ADD CONSTRAINT `contrat_ibfk_3` FOREIGN KEY (`idSal`) REFERENCES `salarie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
