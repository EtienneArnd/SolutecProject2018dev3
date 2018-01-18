-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 16 Janvier 2018 à 13:34
-- Version du serveur :  5.6.36
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gest_formation`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `inscrire_session_formation` (IN `idStagiaire` INT, IN `idSessionCursus` INT)  NO SQL
Begin
DECLARE idSessionFormation INTEGER DEFAULT NULL;
DECLARE done INT DEFAULT 0;

DEClARE curseur CURSOR FOR SELECT id_session_formation from session_formation where id_session_cursus = idSessionCursus;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

OPEN curseur;

boucle: LOOP
FETCH curseur INTO idSessionFormation;

if done then 
leave boucle;
end if;

insert into stagiaire_session_formation (id_stagiaire, id_session_formation) values(idStagiaire,  idSessionFormation);

END LOOP boucle;
close curseur;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `bilan_formation`
--

CREATE TABLE `bilan_formation` (
  `id_bilan` int(11) NOT NULL,
  `formateur_maitrise_sujet` int(25) DEFAULT '0',
  `formateur_qualites_pedagogiques` int(25) DEFAULT '0',
  `formateur_comprehension_problemes` int(25) DEFAULT '0',
  `environnement_accueil` int(25) DEFAULT '0',
  `environnement_salle_formation` int(25) DEFAULT '0',
  `environnement_materiel_informatique` int(25) DEFAULT '0',
  `environnement_support_cours` int(25) DEFAULT '0',
  `formation_info_contenu` int(25) DEFAULT '0',
  `formation_contenu_adapte` int(25) DEFAULT '0',
  `formation_frequence_exercices` int(25) DEFAULT '0',
  `formation_adaptation_exercices_profession` int(25) DEFAULT '0',
  `formation_niveau_groupe_homogene` int(25) DEFAULT '0',
  `formation_stage_correspondant_besoin` int(25) DEFAULT '0',
  `satisfaction_globale` int(25) DEFAULT '0',
  `points_forts_du_stage` varchar(2000) DEFAULT '0',
  `points_faibles_du_stage` varchar(2000) DEFAULT '0',
  `observations_diverses` varchar(2000) DEFAULT '0',
  `besoin_formation_complementaire` varchar(2000) DEFAULT '0',
  `pointvueformateur_prerequis` int(25) DEFAULT '0',
  `pointvueformateur_qualite_ecoute` int(25) DEFAULT '0',
  `pointvueformateur_integration_notions` int(25) DEFAULT '0',
  `pointvueformateur_stage_correspond_besoin` int(25) DEFAULT '0',
  `id_stagiaire` int(11) DEFAULT NULL,
  `id_formateur` int(11) DEFAULT NULL,
  `id_session_formation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`) VALUES
(1, 'Développement'),
(2, 'Méthodes et Conception'),
(3, 'Bases des données'),
(4, 'Si et Gestion de projet'),
(5, 'Systèmes et réseaux'),
(6, 'Projet'),
(7, 'AMOA, Tests & Recette');

-- --------------------------------------------------------

--
-- Structure de la table `cursus`
--

CREATE TABLE `cursus` (
  `id_cursus` int(11) NOT NULL,
  `nom` varchar(150) DEFAULT NULL,
  `tarif` decimal(15,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cursus`
--

INSERT INTO `cursus` (`id_cursus`, `nom`, `tarif`) VALUES
(1, 'Développeurs et AMOA', '12000.000'),
(2, 'Solutec Lyon Exploit', '10000.000'),
(3, 'Solutec Paris - AMOA, Tests & Recette', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE `equipement` (
  `id_equipement` int(11) NOT NULL,
  `numero_serie` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `id_salle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `formateur`
--

CREATE TABLE `formateur` (
  `id_formateur` int(11) NOT NULL,
  `nom` varchar(150) DEFAULT NULL,
  `prenom` varchar(150) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `statut` enum('Externe','Interne') DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `adresse` varchar(70) DEFAULT NULL,
  `cout` decimal(15,3) DEFAULT NULL,
  `civilite` enum('Monsieur','Madame') DEFAULT NULL,
  `mail` varchar(150) DEFAULT NULL,
  `id_societe` int(11) DEFAULT NULL,
  `id_ville` int(11) DEFAULT NULL,
  `id_identificateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `formateur`
--

INSERT INTO `formateur` (`id_formateur`, `nom`, `prenom`, `date_naissance`, `statut`, `telephone`, `adresse`, `cout`, `civilite`, `mail`, `id_societe`, `id_ville`, `id_identificateur`) VALUES
(1, 'BOUKEBECHE', 'Madani', NULL, 'Interne', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'ZADI', 'Joachim', NULL, 'Externe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'HAGHIGHI', 'David', NULL, 'Externe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'DEBLANGY', 'Claude', NULL, 'Externe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'TCHOFFO', 'Merlin', NULL, 'Externe', NULL, NULL, NULL, 'Monsieur', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `formateur_session_formation`
--

CREATE TABLE `formateur_session_formation` (
  `date_debut` date DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `tarif` decimal(15,3) DEFAULT NULL,
  `frais` decimal(15,3) DEFAULT NULL,
  `id_formateur` int(11) NOT NULL,
  `id_session_formation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `formateur_session_formation`
--

INSERT INTO `formateur_session_formation` (`date_debut`, `duree`, `tarif`, `frais`, `id_formateur`, `id_session_formation`) VALUES
(NULL, NULL, NULL, NULL, 1, 1),
(NULL, NULL, NULL, NULL, 1, 3),
('2018-01-24', NULL, NULL, NULL, 1, 25),
(NULL, NULL, NULL, NULL, 1, 27),
(NULL, NULL, NULL, NULL, 2, 2),
(NULL, NULL, NULL, NULL, 2, 24),
('2018-01-25', NULL, NULL, NULL, 2, 25),
(NULL, NULL, NULL, NULL, 2, 26),
(NULL, NULL, NULL, NULL, 2, 28),
(NULL, NULL, NULL, NULL, 2, 30),
('2018-01-22', NULL, NULL, NULL, 2, 41),
(NULL, NULL, NULL, NULL, 2, 48),
(NULL, NULL, NULL, NULL, 3, 29),
(NULL, NULL, NULL, NULL, 4, 31),
('2018-01-19', NULL, NULL, NULL, 5, 41),
(NULL, NULL, NULL, NULL, 5, 42),
(NULL, NULL, NULL, NULL, 5, 43),
('2018-01-29', NULL, NULL, NULL, 5, 44),
('2018-01-31', NULL, NULL, NULL, 5, 46);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id_formation` int(11) NOT NULL,
  `duree` int(11) DEFAULT NULL,
  `tarif_intra` decimal(15,3) DEFAULT NULL,
  `tarif_inter` decimal(15,3) DEFAULT NULL,
  `intitule` varchar(255) DEFAULT NULL,
  `niveau` enum('Base','Moyen','Confirmé','Expert') DEFAULT NULL,
  `id_theme` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `formation`
--

INSERT INTO `formation` (`id_formation`, `duree`, `tarif_intra`, `tarif_inter`, `intitule`, `niveau`, `id_theme`) VALUES
(1, 3, '3000.000', '1200.000', 'POO en Java', 'Base', 1),
(2, 2, '2000.000', '1000.000', 'Java Swing', 'Base', 1),
(3, 2, '2000.000', '1000.000', 'JDBC & JPA', 'Base', 1),
(4, 2, '2000.000', '700.000', 'Algorithmique', 'Base', 10),
(5, 2, '2500.000', '900.000', 'AOO et UML', 'Base', 5),
(6, 1, NULL, NULL, 'Conception de données avec Merise', 'Base', 6),
(7, 2, NULL, NULL, 'SQL', 'Base', 3),
(8, 3, NULL, NULL, 'PL SQL - Oracle', 'Base', 3),
(9, 1, NULL, NULL, 'Introduction au Web : HTML, CSS et Javascript', 'Base', 11),
(10, 2, NULL, NULL, 'JEE Web : Servlets et JSP', 'Base', 1),
(11, 2, NULL, NULL, 'JEE Web : JSF', 'Base', 1),
(12, 2, NULL, NULL, 'JEE Web : Services Web SOAP & REST', 'Base', 1),
(13, 3, NULL, NULL, 'POO en C#', 'Base', 2),
(14, 2, NULL, NULL, 'Winforms avec C#', 'Base', 2),
(15, 2, NULL, NULL, 'Initiation à Unix et Shell', 'Base', 12),
(16, 2, NULL, NULL, 'SI, ALM et activité AMOA', 'Base', 4),
(17, 10, NULL, NULL, 'Projet', 'Moyen', 14),
(18, 1, NULL, NULL, 'Accueil, SI, Les fondamentaux des tests', 'Base', 15),
(21, 3, NULL, NULL, 'Algorithmique & Programmation ', 'Base', 10),
(22, 3, NULL, NULL, 'HP ALM', 'Base', 17),
(23, 3, NULL, NULL, 'Automatisation - UFT', 'Base', 17),
(24, 4, NULL, NULL, 'ISTQB', 'Base', 18),
(25, 1, NULL, NULL, 'Introduction à XML', 'Base', 1);

-- --------------------------------------------------------

--
-- Structure de la table `formation_cursus`
--

CREATE TABLE `formation_cursus` (
  `id_cursus` int(11) NOT NULL,
  `id_formation` int(11) NOT NULL,
  `ordre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `formation_cursus`
--

INSERT INTO `formation_cursus` (`id_cursus`, `id_formation`, `ordre`) VALUES
(1, 1, 2),
(1, 2, 4),
(1, 3, 9),
(1, 4, 1),
(1, 5, 3),
(1, 6, 6),
(1, 7, 7),
(1, 8, 8),
(1, 9, 10),
(1, 10, 11),
(1, 11, 12),
(1, 12, 13),
(1, 13, 14),
(1, 14, 15),
(1, 15, 16),
(1, 16, 17),
(1, 17, 18),
(1, 25, 5),
(3, 7, 3),
(3, 18, 1),
(3, 21, 2),
(3, 22, 5),
(3, 23, 4),
(3, 24, 6);

-- --------------------------------------------------------

--
-- Structure de la table `identificateur`
--

CREATE TABLE `identificateur` (
  `id_identificateur` int(11) NOT NULL,
  `logger` varchar(25) DEFAULT NULL,
  `mdp` varchar(25) DEFAULT NULL,
  `droit` enum('Administration','Formateur','Stagiaire','SuperAdmin') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id_salle` int(11) NOT NULL,
  `nom` varchar(250) DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `session_cursus`
--

CREATE TABLE `session_cursus` (
  `id_session_cursus` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `id_cursus` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL COMMENT 'affecté par déclencheur'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `session_cursus`
--

INSERT INTO `session_cursus` (`id_session_cursus`, `nom`, `id_cursus`, `date_debut`) VALUES
(12, 'Dév 1', 1, '2018-01-02'),
(17, 'Dév 1-18', 1, '2018-01-02'),
(18, 'Dév 1-2018', 1, '2018-01-02'),
(19, '1-Jan 2018', 3, '2018-01-15');

--
-- Déclencheurs `session_cursus`
--
DELIMITER $$
CREATE TRIGGER `creation_session_cursus` AFTER INSERT ON `session_cursus` FOR EACH ROW begin
INSERT INTO `session_formation`(`id_session_formation`, `date_debut`, `type`, `tarif_intra`, `ordre`, `id_formation`, `id_session_cursus`)(SELECT NULL, NULL, 'intra', `tarif_intra`, ordre, `id_formation`, NEW.id_session_cursus FROM `formation` f left join formation_cursus fc using (id_formation) WHERE fc.id_cursus = NEW.id_cursus);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `session_formation`
--

CREATE TABLE `session_formation` (
  `id_session_formation` int(11) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  `tarif_intra` decimal(15,0) DEFAULT NULL,
  `type` enum('intra','inter') DEFAULT NULL,
  `id_formation` int(11) DEFAULT NULL,
  `id_session_cursus` int(11) DEFAULT NULL,
  `id_salle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `session_formation`
--

INSERT INTO `session_formation` (`id_session_formation`, `date_debut`, `date_fin`, `ordre`, `tarif_intra`, `type`, `id_formation`, `id_session_cursus`, `id_salle`) VALUES
(1, NULL, NULL, 3, '3000', 'intra', 1, 12, NULL),
(2, NULL, NULL, 4, '2000', 'intra', 2, 12, NULL),
(3, '2018-01-02', NULL, 1, '2000', 'intra', 4, 12, NULL),
(4, NULL, NULL, 2, '2500', 'intra', 5, 12, NULL),
(24, '2018-01-04', '2018-01-08', 2, '3000', 'intra', 1, 18, NULL),
(25, '2018-01-24', '2018-01-25', 9, '2000', 'intra', 3, 18, NULL),
(26, '2018-01-11', '2018-01-12', 4, '2000', 'intra', 2, 18, NULL),
(27, '2018-01-02', '2018-01-03', 1, '2000', 'intra', 4, 18, NULL),
(28, '2018-01-09', '2018-01-10', 3, '2500', 'intra', 5, 18, NULL),
(29, '2018-01-16', '2018-01-16', 6, NULL, 'intra', 6, 18, NULL),
(30, '2018-01-17', '2018-01-18', 7, NULL, 'intra', 7, 18, NULL),
(31, '2018-01-19', '2018-01-23', 8, NULL, 'intra', 8, 18, NULL),
(32, '2018-01-26', '2018-01-26', 10, NULL, 'intra', 9, 18, NULL),
(33, '2018-01-29', '2018-01-30', 11, NULL, 'intra', 10, 18, NULL),
(34, '2018-01-31', '2018-02-01', 12, NULL, 'intra', 11, 18, NULL),
(35, '2018-02-02', '2018-02-05', 13, NULL, 'intra', 12, 18, NULL),
(36, '2018-02-06', '2018-02-08', 14, NULL, 'intra', 13, 18, NULL),
(37, '2018-02-09', '2018-02-12', 15, NULL, 'intra', 14, 18, NULL),
(38, '2018-02-13', '2018-02-14', 16, NULL, 'intra', 15, 18, NULL),
(39, '2018-02-15', '2018-02-16', 17, NULL, 'intra', 16, 18, NULL),
(40, '2018-02-19', '2018-03-02', 18, NULL, 'intra', 17, 18, NULL),
(41, '2018-01-19', '2018-01-22', 3, NULL, 'intra', 7, 19, NULL),
(42, '2018-01-15', '2018-01-15', 1, NULL, 'intra', 18, 19, NULL),
(43, '2018-01-16', '2018-01-18', 2, NULL, 'intra', 21, 19, NULL),
(44, '2018-01-26', '2018-01-30', 5, NULL, 'intra', 22, 19, NULL),
(45, '2018-01-23', '2018-01-25', 4, NULL, 'intra', 23, 19, NULL),
(46, '2018-01-31', '2018-02-05', 6, NULL, 'intra', 24, 19, NULL),
(48, '2018-01-15', '2018-01-15', 5, NULL, 'intra', 25, 18, NULL);

--
-- Déclencheurs `session_formation`
--
DELIMITER $$
CREATE TRIGGER `update_date_session_cursus` AFTER UPDATE ON `session_formation` FOR EACH ROW if NEW.ordre = 1 THEN
update session_cursus set date_debut = NEW.date_debut where id_session_cursus = NEW.id_session_cursus;
end if
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE `societe` (
  `id_societe` int(11) NOT NULL,
  `nom` varchar(250) DEFAULT NULL,
  `complement_nom` varchar(250) DEFAULT NULL,
  `telephone` char(10) DEFAULT NULL,
  `adresse` varchar(250) DEFAULT NULL,
  `mail` varchar(150) DEFAULT NULL,
  `id_ville` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `societe`
--

INSERT INTO `societe` (`id_societe`, `nom`, `complement_nom`, `telephone`, `adresse`, `mail`, `id_ville`) VALUES
(1, 'Solutec', 'Paris', NULL, NULL, NULL, NULL),
(2, 'Solutec', 'Lyon', NULL, NULL, NULL, NULL),
(3, 'Fekra', NULL, NULL, NULL, NULL, NULL),
(4, 'Sogeti', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire`
--

CREATE TABLE `stagiaire` (
  `id_stagiaire` int(11) NOT NULL,
  `nom` varchar(150) DEFAULT NULL,
  `prenom` varchar(150) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `civilite` enum('Monsieur','Madame') DEFAULT NULL,
  `mail` varchar(150) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `id_societe` int(11) DEFAULT NULL,
  `id_identificateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stagiaire`
--

INSERT INTO `stagiaire` (`id_stagiaire`, `nom`, `prenom`, `date_naissance`, `civilite`, `mail`, `telephone`, `id_societe`, `id_identificateur`) VALUES
(1, 'X', 'Eli', NULL, 'Monsieur', NULL, NULL, 1, NULL),
(2, 'Y', 'Amine', NULL, 'Monsieur', NULL, NULL, 1, NULL),
(3, 'Z', 'Chloé', NULL, 'Madame', NULL, NULL, 1, NULL),
(4, 'W', 'Mathias', NULL, 'Monsieur', NULL, NULL, 1, NULL),
(5, 'A', 'David', NULL, 'Monsieur', NULL, NULL, 2, NULL),
(7, 'Stagiaire', 'non_cursus', NULL, 'Monsieur', NULL, NULL, 1, NULL),
(8, 'GARNIER', 'Adrien', NULL, 'Monsieur', NULL, NULL, 1, NULL),
(9, 'ADAVOODY-JOLFAEI', 'Saïna-Eloïse', NULL, 'Madame', NULL, NULL, 1, NULL),
(10, 'LANTZ', 'Jean-Benoît', NULL, NULL, NULL, NULL, 1, NULL),
(11, 'SOUMASTRE', 'Baptiste', NULL, NULL, NULL, NULL, 1, NULL),
(12, 'MUGLER', 'Jean-Loup', NULL, NULL, NULL, NULL, 1, NULL),
(13, 'SOUSSANA', 'Lou-Hélène', NULL, 'Madame', NULL, NULL, 1, NULL),
(14, 'BOUNIF', 'Teddy ', NULL, 'Monsieur', NULL, NULL, 1, NULL),
(15, 'LE CORRE', 'Gaëlle', NULL, 'Madame', NULL, NULL, 1, NULL),
(16, 'BETTOLO', 'Laura', NULL, 'Madame', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire_session_cursus`
--

CREATE TABLE `stagiaire_session_cursus` (
  `id_stagiaire` int(11) NOT NULL,
  `id_session_cursus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stagiaire_session_cursus`
--

INSERT INTO `stagiaire_session_cursus` (`id_stagiaire`, `id_session_cursus`) VALUES
(1, 12),
(2, 12),
(3, 12),
(5, 12),
(8, 18),
(9, 18),
(10, 18),
(11, 18),
(12, 18),
(13, 19),
(14, 19),
(15, 19),
(16, 19);

--
-- Déclencheurs `stagiaire_session_cursus`
--
DELIMITER $$
CREATE TRIGGER `desincription_suite_suppression` BEFORE DELETE ON `stagiaire_session_cursus` FOR EACH ROW Begin
if (OLD.id_session_cursus IS NOT NULL) then
delete from participe where id_stagiaire = old.id_stagiaire and  id_session_formation IN (select  id_session_formation from session_formation where id_session_cursus = OLD.id_session_cursus);
end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inscription_formation_cursus` AFTER INSERT ON `stagiaire_session_cursus` FOR EACH ROW if ( NEW.id_session_cursus IS NOT NULL) then

CALL `inscrire_session_formation`(New.id_stagiaire, New.id_session_cursus);
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inscription_formation_cursus_modif` AFTER UPDATE ON `stagiaire_session_cursus` FOR EACH ROW Begin
if (NEW.id_session_cursus IS NULL) then
delete from participe where id_stagiaire = old.id_stagiaire and  id_session_formation IN (select  id_session_formation from session_formation where id_session_cursus = OLD.id_session_cursus);
end if;

if (NEW.id_session_cursus IS NOT NULL) AND ((OLD.id_session_cursus IS NULL) OR (NEW.id_session_cursus != OLD.id_session_cursus)) then

CALL `inscrire_session_formation`(New.id_stagiaire, New.id_session_cursus);

end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire_session_formation`
--

CREATE TABLE `stagiaire_session_formation` (
  `id_stagiaire` int(11) NOT NULL,
  `id_session_formation` int(11) NOT NULL,
  `tarif` decimal(15,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stagiaire_session_formation`
--

INSERT INTO `stagiaire_session_formation` (`id_stagiaire`, `id_session_formation`, `tarif`) VALUES
(1, 1, NULL),
(1, 2, NULL),
(1, 3, NULL),
(1, 4, NULL),
(2, 1, NULL),
(2, 2, NULL),
(2, 3, NULL),
(2, 4, NULL),
(3, 1, NULL),
(3, 2, NULL),
(3, 3, NULL),
(3, 4, NULL),
(5, 1, NULL),
(5, 2, NULL),
(5, 3, NULL),
(5, 4, NULL),
(8, 24, NULL),
(8, 25, NULL),
(8, 26, NULL),
(8, 27, NULL),
(8, 28, NULL),
(8, 29, NULL),
(8, 30, NULL),
(8, 31, NULL),
(8, 32, NULL),
(8, 33, NULL),
(8, 34, NULL),
(8, 35, NULL),
(8, 36, NULL),
(8, 37, NULL),
(8, 38, NULL),
(8, 39, NULL),
(8, 40, NULL),
(9, 24, NULL),
(9, 25, NULL),
(9, 26, NULL),
(9, 27, NULL),
(9, 28, NULL),
(9, 29, NULL),
(9, 30, NULL),
(9, 31, NULL),
(9, 32, NULL),
(9, 33, NULL),
(9, 34, NULL),
(9, 35, NULL),
(9, 36, NULL),
(9, 37, NULL),
(9, 38, NULL),
(9, 39, NULL),
(9, 40, NULL),
(10, 24, NULL),
(10, 25, NULL),
(10, 26, NULL),
(10, 27, NULL),
(10, 28, NULL),
(10, 29, NULL),
(10, 30, NULL),
(10, 31, NULL),
(10, 32, NULL),
(10, 33, NULL),
(10, 34, NULL),
(10, 35, NULL),
(10, 36, NULL),
(10, 37, NULL),
(10, 38, NULL),
(10, 39, NULL),
(10, 40, NULL),
(11, 24, NULL),
(11, 25, NULL),
(11, 26, NULL),
(11, 27, NULL),
(11, 28, NULL),
(11, 29, NULL),
(11, 30, NULL),
(11, 31, NULL),
(11, 32, NULL),
(11, 33, NULL),
(11, 34, NULL),
(11, 35, NULL),
(11, 36, NULL),
(11, 37, NULL),
(11, 38, NULL),
(11, 39, NULL),
(11, 40, NULL),
(12, 24, NULL),
(12, 25, NULL),
(12, 26, NULL),
(12, 27, NULL),
(12, 28, NULL),
(12, 29, NULL),
(12, 30, NULL),
(12, 31, NULL),
(12, 32, NULL),
(12, 33, NULL),
(12, 34, NULL),
(12, 35, NULL),
(12, 36, NULL),
(12, 37, NULL),
(12, 38, NULL),
(12, 39, NULL),
(12, 40, NULL),
(13, 41, NULL),
(13, 42, NULL),
(13, 43, NULL),
(13, 44, NULL),
(13, 45, NULL),
(13, 46, NULL),
(14, 41, NULL),
(14, 42, NULL),
(14, 43, NULL),
(14, 44, NULL),
(14, 45, NULL),
(14, 46, NULL),
(15, 41, NULL),
(15, 42, NULL),
(15, 43, NULL),
(15, 44, NULL),
(15, 45, NULL),
(15, 46, NULL),
(16, 41, NULL),
(16, 42, NULL),
(16, 43, NULL),
(16, 44, NULL),
(16, 45, NULL),
(16, 46, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `id_theme` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `theme`
--

INSERT INTO `theme` (`id_theme`, `nom`, `id_categorie`) VALUES
(1, 'Java', 1),
(2, 'C#', 1),
(3, 'SQL', 3),
(4, 'Pl SQL Oracle', 3),
(5, 'UML', 2),
(6, 'Merise', 2),
(7, 'PHP', 1),
(8, 'VB.NET', 1),
(9, 'Gestion de projet', 4),
(10, 'Algo', 1),
(11, 'HTML-CSS-JS', 1),
(12, 'Unix', 5),
(13, 'SI', 4),
(14, 'Projet', 6),
(15, 'Tests et Recette', 7),
(16, 'HP ALM', 7),
(17, 'Automatisation - UFT', 7),
(18, 'ISTQB', 7);

-- --------------------------------------------------------

--
-- Structure de la table `theme_formateur`
--

CREATE TABLE `theme_formateur` (
  `niveau` enum('Base','Moyen','Confirmé','Expert') DEFAULT NULL,
  `id_formateur` int(11) NOT NULL,
  `id_theme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id_ville` int(11) NOT NULL,
  `nom` varchar(150) DEFAULT NULL,
  `code_postal` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bilan_formation`
--
ALTER TABLE `bilan_formation`
  ADD PRIMARY KEY (`id_bilan`),
  ADD KEY `FK_bilan_formation_id_stagiaire` (`id_stagiaire`),
  ADD KEY `FK_bilan_formation_id_formateur` (`id_formateur`),
  ADD KEY `FK_bilan_formation_id_session_formation` (`id_session_formation`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `cursus`
--
ALTER TABLE `cursus`
  ADD PRIMARY KEY (`id_cursus`);

--
-- Index pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`id_equipement`),
  ADD KEY `numero_serie` (`numero_serie`),
  ADD KEY `FK_equipement_id_salle` (`id_salle`);

--
-- Index pour la table `formateur`
--
ALTER TABLE `formateur`
  ADD PRIMARY KEY (`id_formateur`),
  ADD KEY `FK_formateur_id_identificateur` (`id_identificateur`),
  ADD KEY `FK_formateur_id_societe` (`id_societe`),
  ADD KEY `FK_formateur_id_ville` (`id_ville`);

--
-- Index pour la table `formateur_session_formation`
--
ALTER TABLE `formateur_session_formation`
  ADD PRIMARY KEY (`id_formateur`,`id_session_formation`),
  ADD KEY `FK_formateur_session_formation_id_session_formation` (`id_session_formation`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id_formation`),
  ADD KEY `FK_formation_id_theme` (`id_theme`);

--
-- Index pour la table `formation_cursus`
--
ALTER TABLE `formation_cursus`
  ADD PRIMARY KEY (`id_cursus`,`id_formation`),
  ADD KEY `FK_formation_cursus_id_formation` (`id_formation`);

--
-- Index pour la table `identificateur`
--
ALTER TABLE `identificateur`
  ADD PRIMARY KEY (`id_identificateur`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id_salle`);

--
-- Index pour la table `session_cursus`
--
ALTER TABLE `session_cursus`
  ADD PRIMARY KEY (`id_session_cursus`),
  ADD KEY `FK_session_cursus_id_cursus` (`id_cursus`);

--
-- Index pour la table `session_formation`
--
ALTER TABLE `session_formation`
  ADD PRIMARY KEY (`id_session_formation`),
  ADD KEY `FK_session_formation_id_formation` (`id_formation`),
  ADD KEY `FK_session_formation_id_session_cursus` (`id_session_cursus`),
  ADD KEY `FK_session_formation_id_salle` (`id_salle`);

--
-- Index pour la table `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`id_societe`),
  ADD KEY `FK_societe_id_ville` (`id_ville`);

--
-- Index pour la table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD PRIMARY KEY (`id_stagiaire`),
  ADD KEY `FK_stagiaire_id_identificateur` (`id_identificateur`),
  ADD KEY `FK_stagiaire_id_societe` (`id_societe`);

--
-- Index pour la table `stagiaire_session_cursus`
--
ALTER TABLE `stagiaire_session_cursus`
  ADD PRIMARY KEY (`id_stagiaire`,`id_session_cursus`),
  ADD KEY `FK_stagiaire_session_cursus_id_session_cursus` (`id_session_cursus`);

--
-- Index pour la table `stagiaire_session_formation`
--
ALTER TABLE `stagiaire_session_formation`
  ADD PRIMARY KEY (`id_stagiaire`,`id_session_formation`),
  ADD KEY `FK_stagiaire_session_formation_id_session_formation` (`id_session_formation`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id_theme`),
  ADD KEY `FK_theme_id_categorie` (`id_categorie`);

--
-- Index pour la table `theme_formateur`
--
ALTER TABLE `theme_formateur`
  ADD PRIMARY KEY (`id_formateur`,`id_theme`),
  ADD KEY `FK_theme_formateur_id_theme` (`id_theme`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id_ville`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bilan_formation`
--
ALTER TABLE `bilan_formation`
  MODIFY `id_bilan` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `cursus`
--
ALTER TABLE `cursus`
  MODIFY `id_cursus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `equipement`
--
ALTER TABLE `equipement`
  MODIFY `id_equipement` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `formateur`
--
ALTER TABLE `formateur`
  MODIFY `id_formateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id_formation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `identificateur`
--
ALTER TABLE `identificateur`
  MODIFY `id_identificateur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id_salle` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `session_cursus`
--
ALTER TABLE `session_cursus`
  MODIFY `id_session_cursus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `session_formation`
--
ALTER TABLE `session_formation`
  MODIFY `id_session_formation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT pour la table `societe`
--
ALTER TABLE `societe`
  MODIFY `id_societe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `stagiaire`
--
ALTER TABLE `stagiaire`
  MODIFY `id_stagiaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `theme`
--
ALTER TABLE `theme`
  MODIFY `id_theme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id_ville` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bilan_formation`
--
ALTER TABLE `bilan_formation`
  ADD CONSTRAINT `FK_bilan_formation_id_formateur` FOREIGN KEY (`id_formateur`) REFERENCES `formateur` (`id_formateur`),
  ADD CONSTRAINT `FK_bilan_formation_id_session_formation` FOREIGN KEY (`id_session_formation`) REFERENCES `session_formation` (`id_session_formation`),
  ADD CONSTRAINT `FK_bilan_formation_id_stagiaire` FOREIGN KEY (`id_stagiaire`) REFERENCES `stagiaire` (`id_stagiaire`);

--
-- Contraintes pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD CONSTRAINT `FK_equipement_id_salle` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`);

--
-- Contraintes pour la table `formateur`
--
ALTER TABLE `formateur`
  ADD CONSTRAINT `FK_formateur_id_identificateur` FOREIGN KEY (`id_identificateur`) REFERENCES `identificateur` (`id_identificateur`),
  ADD CONSTRAINT `FK_formateur_id_societe` FOREIGN KEY (`id_societe`) REFERENCES `societe` (`id_societe`),
  ADD CONSTRAINT `FK_formateur_id_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);

--
-- Contraintes pour la table `formateur_session_formation`
--
ALTER TABLE `formateur_session_formation`
  ADD CONSTRAINT `FK_formateur_session_formation_id_formateur` FOREIGN KEY (`id_formateur`) REFERENCES `formateur` (`id_formateur`),
  ADD CONSTRAINT `FK_formateur_session_formation_id_session_formation` FOREIGN KEY (`id_session_formation`) REFERENCES `session_formation` (`id_session_formation`);

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_formation_id_theme` FOREIGN KEY (`id_theme`) REFERENCES `theme` (`id_theme`);

--
-- Contraintes pour la table `formation_cursus`
--
ALTER TABLE `formation_cursus`
  ADD CONSTRAINT `FK_formation_cursus_id_cursus` FOREIGN KEY (`id_cursus`) REFERENCES `cursus` (`id_cursus`),
  ADD CONSTRAINT `FK_formation_cursus_id_formation` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id_formation`);

--
-- Contraintes pour la table `session_cursus`
--
ALTER TABLE `session_cursus`
  ADD CONSTRAINT `FK_session_cursus_id_cursus` FOREIGN KEY (`id_cursus`) REFERENCES `cursus` (`id_cursus`);

--
-- Contraintes pour la table `session_formation`
--
ALTER TABLE `session_formation`
  ADD CONSTRAINT `FK_session_formation_id_formation` FOREIGN KEY (`id_formation`) REFERENCES `formation` (`id_formation`),
  ADD CONSTRAINT `FK_session_formation_id_salle` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`),
  ADD CONSTRAINT `FK_session_formation_id_session_cursus` FOREIGN KEY (`id_session_cursus`) REFERENCES `session_cursus` (`id_session_cursus`);

--
-- Contraintes pour la table `societe`
--
ALTER TABLE `societe`
  ADD CONSTRAINT `FK_societe_id_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);

--
-- Contraintes pour la table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD CONSTRAINT `FK_stagiaire_id_identificateur` FOREIGN KEY (`id_identificateur`) REFERENCES `identificateur` (`id_identificateur`),
  ADD CONSTRAINT `FK_stagiaire_id_societe` FOREIGN KEY (`id_societe`) REFERENCES `societe` (`id_societe`);

--
-- Contraintes pour la table `stagiaire_session_cursus`
--
ALTER TABLE `stagiaire_session_cursus`
  ADD CONSTRAINT `FK_stagiaire_session_cursus_id_session_cursus` FOREIGN KEY (`id_session_cursus`) REFERENCES `session_cursus` (`id_session_cursus`),
  ADD CONSTRAINT `FK_stagiaire_session_cursus_id_stagiaire` FOREIGN KEY (`id_stagiaire`) REFERENCES `stagiaire` (`id_stagiaire`);

--
-- Contraintes pour la table `stagiaire_session_formation`
--
ALTER TABLE `stagiaire_session_formation`
  ADD CONSTRAINT `FK_stagiaire_session_formation_id_session_formation` FOREIGN KEY (`id_session_formation`) REFERENCES `session_formation` (`id_session_formation`),
  ADD CONSTRAINT `FK_stagiaire_session_formation_id_stagiaire` FOREIGN KEY (`id_stagiaire`) REFERENCES `stagiaire` (`id_stagiaire`);

--
-- Contraintes pour la table `theme`
--
ALTER TABLE `theme`
  ADD CONSTRAINT `FK_theme_id_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Contraintes pour la table `theme_formateur`
--
ALTER TABLE `theme_formateur`
  ADD CONSTRAINT `FK_theme_formateur_id_formateur` FOREIGN KEY (`id_formateur`) REFERENCES `formateur` (`id_formateur`),
  ADD CONSTRAINT `FK_theme_formateur_id_theme` FOREIGN KEY (`id_theme`) REFERENCES `theme` (`id_theme`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
