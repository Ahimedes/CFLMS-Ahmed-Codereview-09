-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Jul 2020 um 16:20
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_ahmed_abdelaal_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_ahmed_abdelaal_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_ahmed_abdelaal_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) DEFAULT NULL,
  `fk_c_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `fk_c_address`) VALUES
(1, 'Max Mustermann', 111),
(2, 'Wonder Woman', 222),
(3, 'Machete Sanchez', 333);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer_address`
--

CREATE TABLE `customer_address` (
  `c_address_id` int(11) NOT NULL,
  `c_street` varchar(55) DEFAULT NULL,
  `c_number` int(11) DEFAULT NULL,
  `c_zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer_address`
--

INSERT INTO `customer_address` (`c_address_id`, `c_street`, `c_number`, `c_zip`) VALUES
(111, 'Musterstraße', 2, 1130),
(222, 'Wunderstraße', 23, 1220),
(333, 'Mexikoplatz', 42, 1020);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `fk_process` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `delivery_time`, `fk_process`) VALUES
(1001, '2020-07-10 15:30:00', 101),
(2002, '2020-07-11 11:22:20', 202),
(3003, '2020-07-09 12:12:00', 303);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deposit`
--

CREATE TABLE `deposit` (
  `deposit_id` int(11) NOT NULL,
  `deposit_time` datetime DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_ms_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `deposit`
--

INSERT INTO `deposit` (`deposit_id`, `deposit_time`, `fk_package_id`, `fk_ms_id`) VALUES
(77, '2020-07-09 13:00:00', 12, 444),
(88, '2020-07-10 10:08:00', 13, 444),
(99, '2020-07-07 12:34:00', 14, 444);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(55) DEFAULT NULL,
  `fk_ms_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_name`, `fk_ms_id`) VALUES
(11, 'Barney Barnes', 444),
(22, 'Steve Stevenson', 444),
(33, 'Max Powers', 444);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail_service`
--

CREATE TABLE `mail_service` (
  `ms_id` int(11) NOT NULL,
  `ms_name` varchar(55) DEFAULT NULL,
  `ms_tel` int(11) DEFAULT NULL,
  `ms_mail` varchar(55) DEFAULT NULL,
  `fk_ms_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `mail_service`
--

INSERT INTO `mail_service` (`ms_id`, `ms_name`, `ms_tel`, `ms_mail`, `fk_ms_address`) VALUES
(444, 'Fastmail co.', 12345678, 'fast@mail.com', 42);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ms_address`
--

CREATE TABLE `ms_address` (
  `m_address_id` int(11) NOT NULL,
  `m_street` varchar(55) DEFAULT NULL,
  `m_number` int(11) DEFAULT NULL,
  `m_zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ms_address`
--

INSERT INTO `ms_address` (`m_address_id`, `m_street`, `m_number`, `m_zip`) VALUES
(42, 'Bakerstreet', 44, 1030);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_info` varchar(55) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_recipent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`package_id`, `package_info`, `fk_customer_id`, `fk_recipent_id`) VALUES
(12, 'Letter', 1, 44),
(13, 'Small Package', 2, 55),
(14, 'Large Package', 3, 66);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processing_system`
--

CREATE TABLE `processing_system` (
  `process_id` int(11) NOT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `processing_system`
--

INSERT INTO `processing_system` (`process_id`, `fk_employee_id`) VALUES
(101, 11),
(202, 22),
(303, 33);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipent`
--

CREATE TABLE `recipent` (
  `recipent_id` int(11) NOT NULL,
  `recipent_name` varchar(55) DEFAULT NULL,
  `fk_r_address` int(11) DEFAULT NULL,
  `fk_delivery` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `recipent`
--

INSERT INTO `recipent` (`recipent_id`, `recipent_name`, `fk_r_address`, `fk_delivery`) VALUES
(44, 'Marta Musterfrau', 4, 1001),
(55, 'Clark Kent', 5, 2002),
(66, 'Sartana Rivera', 6, 3003);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipent_address`
--

CREATE TABLE `recipent_address` (
  `r_address_id` int(11) NOT NULL,
  `r_street` varchar(55) DEFAULT NULL,
  `r_number` int(11) DEFAULT NULL,
  `r_zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `recipent_address`
--

INSERT INTO `recipent_address` (`r_address_id`, `r_street`, `r_number`, `r_zip`) VALUES
(4, 'Ottakringer Straße', 12, 1160),
(5, 'Währinger Straße', 23, 1090),
(6, 'Baumgartner Höhe', 14, 1140);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_c_address` (`fk_c_address`);

--
-- Indizes für die Tabelle `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`c_address_id`);

--
-- Indizes für die Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_process` (`fk_process`);

--
-- Indizes für die Tabelle `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`deposit_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_ms_id` (`fk_ms_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_ms_id` (`fk_ms_id`);

--
-- Indizes für die Tabelle `mail_service`
--
ALTER TABLE `mail_service`
  ADD PRIMARY KEY (`ms_id`),
  ADD KEY `fk_ms_address` (`fk_ms_address`);

--
-- Indizes für die Tabelle `ms_address`
--
ALTER TABLE `ms_address`
  ADD PRIMARY KEY (`m_address_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_recipent_id` (`fk_recipent_id`);

--
-- Indizes für die Tabelle `processing_system`
--
ALTER TABLE `processing_system`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indizes für die Tabelle `recipent`
--
ALTER TABLE `recipent`
  ADD PRIMARY KEY (`recipent_id`),
  ADD KEY `fk_r_address` (`fk_r_address`),
  ADD KEY `fk_delivery` (`fk_delivery`);

--
-- Indizes für die Tabelle `recipent_address`
--
ALTER TABLE `recipent_address`
  ADD PRIMARY KEY (`r_address_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_c_address`) REFERENCES `customer_address` (`c_address_id`);

--
-- Constraints der Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_process`) REFERENCES `processing_system` (`process_id`);

--
-- Constraints der Tabelle `deposit`
--
ALTER TABLE `deposit`
  ADD CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `deposit_ibfk_2` FOREIGN KEY (`fk_ms_id`) REFERENCES `mail_service` (`ms_id`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_ms_id`) REFERENCES `mail_service` (`ms_id`);

--
-- Constraints der Tabelle `mail_service`
--
ALTER TABLE `mail_service`
  ADD CONSTRAINT `mail_service_ibfk_1` FOREIGN KEY (`fk_ms_address`) REFERENCES `ms_address` (`m_address_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_recipent_id`) REFERENCES `recipent` (`recipent_id`);

--
-- Constraints der Tabelle `processing_system`
--
ALTER TABLE `processing_system`
  ADD CONSTRAINT `processing_system_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints der Tabelle `recipent`
--
ALTER TABLE `recipent`
  ADD CONSTRAINT `recipent_ibfk_1` FOREIGN KEY (`fk_r_address`) REFERENCES `recipent_address` (`r_address_id`),
  ADD CONSTRAINT `recipent_ibfk_2` FOREIGN KEY (`fk_delivery`) REFERENCES `delivery` (`delivery_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
