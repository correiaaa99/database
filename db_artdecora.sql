-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07-Nov-2019 às 13:06
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_artdecora`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1571299844),
('m130524_201442_init', 1571299847),
('m190124_110200_add_verification_token_column_to_user_table', 1571299847);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_address`
--

CREATE TABLE `tbl_address` (
  `idAddress` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip_code` varchar(8) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(7, 'Administrador', '-KpH2LJ0FGNnvk6EXcyt5RsUW-izy55e', '$2y$13$QZLd/Hs2PHCV8xwDubY/2OCkwKPtDB/qx.xeGGh.oiX4vNEm1iWLq', NULL, 'artdecora@gmail.com', 10, 1572199045, 1572199045, 'dn2reN2d5JOPMuoklM-Q8T0vRM2uj7iq_1572199045');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_category`
--

CREATE TABLE `tbl_category` (
  `idCategory` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_category`
--

INSERT INTO `tbl_category` (`idCategory`, `name`) VALUES
(5, 'Quarto '),
(4, 'Casa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_designer`
--

CREATE TABLE `tbl_designer` (
  `idDesigner` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_designer_project`
--

CREATE TABLE `tbl_designer_project` (
  `id_Designer_Project` int(11) NOT NULL,
  `idDesigner` int(11) NOT NULL,
  `idProject` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_idea_book`
--

CREATE TABLE `tbl_idea_book` (
  `idBook` int(11) NOT NULL,
  `description` text NOT NULL,
  `title` varchar(30) NOT NULL,
  `date` varchar(20) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_image`
--

CREATE TABLE `tbl_image` (
  `idImage` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `idRequest` int(11) DEFAULT NULL,
  `idProject` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_project`
--

CREATE TABLE `tbl_project` (
  `idProject` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` text NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_project_category`
--

CREATE TABLE `tbl_project_category` (
  `id_Project_Category` int(11) NOT NULL,
  `idProject` int(11) NOT NULL,
  `idCategory` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_project_idea_book`
--

CREATE TABLE `tbl_project_idea_book` (
  `id_Project_idea_book` int(11) NOT NULL,
  `idProject` int(11) NOT NULL,
  `idBook` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_project_user`
--

CREATE TABLE `tbl_project_user` (
  `id_Project_User` int(11) NOT NULL,
  `idProject` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `evalution` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_request`
--

CREATE TABLE `tbl_request` (
  `idRequest` int(11) NOT NULL,
  `description` text NOT NULL,
  `idUser` int(11) NOT NULL,
  `idProject` int(11) DEFAULT NULL,
  `idAddress` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_user`
--

CREATE TABLE `tbl_user` (
  `idUser` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD PRIMARY KEY (`idAddress`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`idCategory`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tbl_designer`
--
ALTER TABLE `tbl_designer`
  ADD PRIMARY KEY (`idDesigner`);

--
-- Indexes for table `tbl_designer_project`
--
ALTER TABLE `tbl_designer_project`
  ADD PRIMARY KEY (`id_Designer_Project`),
  ADD KEY `idDesigner` (`idDesigner`),
  ADD KEY `idProject` (`idProject`);

--
-- Indexes for table `tbl_idea_book`
--
ALTER TABLE `tbl_idea_book`
  ADD PRIMARY KEY (`idBook`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `tbl_image`
--
ALTER TABLE `tbl_image`
  ADD PRIMARY KEY (`idImage`),
  ADD KEY `idRequest` (`idRequest`),
  ADD KEY `idProject` (`idProject`);

--
-- Indexes for table `tbl_project`
--
ALTER TABLE `tbl_project`
  ADD PRIMARY KEY (`idProject`);

--
-- Indexes for table `tbl_project_category`
--
ALTER TABLE `tbl_project_category`
  ADD PRIMARY KEY (`id_Project_Category`),
  ADD KEY `idProject` (`idProject`),
  ADD KEY `idCategory` (`idCategory`);

--
-- Indexes for table `tbl_project_idea_book`
--
ALTER TABLE `tbl_project_idea_book`
  ADD PRIMARY KEY (`id_Project_idea_book`),
  ADD KEY `idProject` (`idProject`),
  ADD KEY `idBook` (`idBook`);

--
-- Indexes for table `tbl_project_user`
--
ALTER TABLE `tbl_project_user`
  ADD PRIMARY KEY (`id_Project_User`),
  ADD KEY `idProject` (`idProject`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD PRIMARY KEY (`idRequest`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idProject` (`idProject`),
  ADD KEY `idAddress` (`idAddress`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_address`
--
ALTER TABLE `tbl_address`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `idCategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_designer`
--
ALTER TABLE `tbl_designer`
  MODIFY `idDesigner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_designer_project`
--
ALTER TABLE `tbl_designer_project`
  MODIFY `id_Designer_Project` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_idea_book`
--
ALTER TABLE `tbl_idea_book`
  MODIFY `idBook` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_image`
--
ALTER TABLE `tbl_image`
  MODIFY `idImage` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_project`
--
ALTER TABLE `tbl_project`
  MODIFY `idProject` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_project_category`
--
ALTER TABLE `tbl_project_category`
  MODIFY `id_Project_Category` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_project_idea_book`
--
ALTER TABLE `tbl_project_idea_book`
  MODIFY `id_Project_idea_book` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_project_user`
--
ALTER TABLE `tbl_project_user`
  MODIFY `id_Project_User` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_request`
--
ALTER TABLE `tbl_request`
  MODIFY `idRequest` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD CONSTRAINT `tbl_address_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `tbl_user` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
