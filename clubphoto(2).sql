-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 16 fév. 2024 à 10:51
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `clubphoto`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `idarti` int NOT NULL AUTO_INCREMENT,
  `titrearti` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `datearti` date NOT NULL,
  `textearti` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `idphotographe` int NOT NULL,
  `idtype` int NOT NULL,
  PRIMARY KEY (`idarti`),
  KEY `idtype` (`idtype`),
  KEY `idphotographe` (`idphotographe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`idarti`, `titrearti`, `datearti`, `textearti`, `idphotographe`, `idtype`) VALUES
(1, 'Quelles sont les meilleures cartes graphiques ? Co', '2024-02-10', 'Cet article propose un comparatif des meilleures cartes graphiques pour les joueurs et créateurs, testant différents modèles pour identifier les plus performants. Les fabricants principaux comme Nvidia et AMD offrent des séries telles que RTX 3000 chez Nvidia et RX 6000 chez AMD. La carte graphique est cruciale pour le rendu 3D en temps réel dans les jeux vidéo', 1, 1),
(2, 'Stockage pour PC Gamer : SSD vs HDD', '2024-02-01', 'Le stockage sur PC peut être réalisé via des disques durs (HDD) ou des SSD. Les SSD sont préférés pour leur rapidité, avec des vitesses allant jusqu\'à 5000 Mb/s pour les modèles NVMe de dernière génération, comparativement à 100 Mb/s pour les HDD. Les disques durs deviennent obsolètes face aux SSD, qui sont désormais standard dans les PC modernes', 1, 2),
(3, 'Choisir son alimentation PC : Ce qu\'il faut savoir', '2024-02-07', 'Chaque PC a besoin d\'un bloc d\'alimentation pour convertir le courant alternatif en courant continu utilisable par les composants. Cet article explique l\'importance du choix de l\'alimentation, sa capacité à fournir une énergie stable et suffisante pour tous les composants internes?', 1, 3),
(4, 'Tests et comparatifs de la mémoire RAM DDR5', '2024-02-03', 'Les derniers tests de mémoire RAM DDR5, incluant des modèles de G.Skill, Corsair, et Kingston, mettent en avant les capacités, vitesses, et timings des différents kits. Avec l\'arrivée de la DDR5, les performances ont été améliorées, proposant des capacités allant jusqu\'à 64 Go et des vitesses impressionnantes pour répondre aux besoins des utilisateurs les plus exigeants', 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `idphoto` int NOT NULL AUTO_INCREMENT,
  `titrephoto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `textephoto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `imagephoto` varchar(50) NOT NULL,
  `idarti` int NOT NULL,
  PRIMARY KEY (`idphoto`),
  KEY `idarti` (`idarti`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`idphoto`, `titrephoto`, `textephoto`, `imagephoto`, `idarti`) VALUES
(1, 'NVIDIA GeForce RTX 4080 Super : Une Puissance Revu', 'La série Super de NVIDIA a toujours été synonyme d', 'test.jpg', 1);

-- --------------------------------------------------------

--
-- Structure de la table `photographe`
--

DROP TABLE IF EXISTS `photographe`;
CREATE TABLE IF NOT EXISTS `photographe` (
  `idphotographe` int NOT NULL,
  `nomphotographe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prenomphotographe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`idphotographe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `photographe`
--

INSERT INTO `photographe` (`idphotographe`, `nomphotographe`, `prenomphotographe`) VALUES
(1, 'Fort', 'Axel');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `idtype` int NOT NULL,
  `nomtype` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`idtype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`idtype`, `nomtype`) VALUES
(1, 'Cartes Graphiques'),
(2, 'Stockage'),
(3, 'Alimentation'),
(4, 'RAM');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`idtype`) REFERENCES `type` (`idtype`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`idphotographe`) REFERENCES `photographe` (`idphotographe`);

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`idarti`) REFERENCES `article` (`idarti`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
