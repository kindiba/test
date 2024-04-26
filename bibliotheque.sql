-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 23 avr. 2024 à 18:44
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE `emprunts` (
  `ID_Emprunt` int(11) NOT NULL,
  `NumeroMembre` int(11) DEFAULT NULL,
  `ISBN` int(11) DEFAULT NULL,
  `DateEmprunt` date DEFAULT NULL,
  `DateRetourPrevue` date DEFAULT NULL,
  `DateRetourEffective` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunts`
--

INSERT INTO `emprunts` (`ID_Emprunt`, `NumeroMembre`, `ISBN`, `DateEmprunt`, `DateRetourPrevue`, `DateRetourEffective`) VALUES
(1, 1, 1234567890, '2024-04-01', '2024-04-15', '2024-04-25'),
(2, 2, 2147483647, '2024-04-05', '2024-04-20', '2024-05-01'),
(3, 3, 2147483645, '2024-04-10', '2024-04-25', '2024-04-29'),
(4, 1, 2147483647, '2024-04-15', '2024-04-30', '2024-05-10');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `ISBN` int(11) NOT NULL,
  `Titre` varchar(25) DEFAULT NULL,
  `Auteur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`ISBN`, `Titre`, `Auteur`) VALUES
(1234567890, 'Une Si Longue Lettre', 'Mariama Ba'),
(2047483647, ' L\'Étranger', 'Albert Camus'),
(2147483645, 'Le pagne noir', 'Bernard Dadié'),
(2147483647, 'L\'enfant', 'Camara Laye');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE `membres` (
  `NumeroMembre` int(11) NOT NULL,
  `Nom` varchar(25) DEFAULT NULL,
  `Prenom` varchar(25) DEFAULT NULL,
  `INE` varchar(11) DEFAULT NULL,
  `Filiere` varchar(25) DEFAULT NULL,
  `Classe` varchar(15) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`NumeroMembre`, `Nom`, `Prenom`, `INE`, `Filiere`, `Classe`, `DateNaissance`) VALUES
(1, 'Toba', 'Ndiaye', 'N012345', 'IDA', 'Licence2', '2000-01-01'),
(2, 'Kindi', 'Ba', 'N067890', 'MIC', 'Licence2', '2003-02-02'),
(3, 'Rokhaya', 'Gueye', 'N0123456', 'Informatique', 'Licence2', '2002-01-01'),
(4, 'Aissatou', 'Diop', 'N0678901', 'CD', 'Licence3', '2004-02-02');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `ID_Reservation` int(11) NOT NULL,
  `NumeroMembre` int(11) DEFAULT NULL,
  `ISBN` int(11) DEFAULT NULL,
  `DateReservation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`ID_Reservation`, `NumeroMembre`, `ISBN`, `DateReservation`) VALUES
(1, 2, 2147483647, '2024-05-05'),
(2, 1, 1234567890, '2024-05-15'),
(3, 1, 1234567890, '2024-04-10'),
(4, 2, 2047483647, '2024-04-15');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `ID_Utilisateur` int(11) NOT NULL,
  `NomUtilisateur` varchar(50) DEFAULT NULL,
  `MotDePasse` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`ID_Utilisateur`, `NomUtilisateur`, `MotDePasse`) VALUES
(1, 'Rokhaya06', 'Unchk20'),
(2, 'Aissatou02', 'Collette@50'),
(3, 'Toba04', 'Ndiaye345'),
(4, 'Kindi23', 'Ba456');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD PRIMARY KEY (`ID_Emprunt`),
  ADD KEY `NumeroMembre` (`NumeroMembre`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`ISBN`);

--
-- Index pour la table `membres`
--
ALTER TABLE `membres`
  ADD PRIMARY KEY (`NumeroMembre`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ID_Reservation`),
  ADD KEY `NumeroMembre` (`NumeroMembre`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`ID_Utilisateur`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`NumeroMembre`) REFERENCES `membres` (`NumeroMembre`),
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `livres` (`ISBN`);

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`NumeroMembre`) REFERENCES `membres` (`NumeroMembre`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `livres` (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
