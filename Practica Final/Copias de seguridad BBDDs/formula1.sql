/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `formula1` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `formula1`;

CREATE TABLE IF NOT EXISTS `carrera` (
  `idCarrera` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `fecha` (
  `idFecha` int NOT NULL AUTO_INCREMENT,
  `dia` int DEFAULT NULL,
  `mes` int DEFAULT NULL,
  `anyo` int DEFAULT NULL,
  PRIMARY KEY (`idFecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `nacionalidad` (
  `idNacionalidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idNacionalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `piloto` (
  `idPiloto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPiloto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rendimiento del piloto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tiempo_medio_x_vuelta` decimal(10,0) DEFAULT NULL COMMENT 'lap_times.time_ results SUM(milisg)/laps',
  `Posicion_pit-lane` int DEFAULT NULL COMMENT 'results.grid V',
  `Numero_puntos_ganados` decimal(10,0) DEFAULT NULL COMMENT 'driver_standing.points_ results.points V',
  `Nacionalidad_idNacionalidad` int NOT NULL,
  `Carrera_idCarrera` int NOT NULL,
  `Fecha_idFecha` int NOT NULL,
  `Piloto_idPiloto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Rendimiento del piloto_Nacionalidad_idx` (`Nacionalidad_idNacionalidad`),
  KEY `fk_Rendimiento del piloto_Carrera1_idx` (`Carrera_idCarrera`),
  KEY `fk_Rendimiento del piloto_Fecha1_idx` (`Fecha_idFecha`),
  KEY `fk_Rendimiento del piloto_Piloto1_idx` (`Piloto_idPiloto`),
  CONSTRAINT `fk_Rendimiento del piloto_Carrera1` FOREIGN KEY (`Carrera_idCarrera`) REFERENCES `carrera` (`idCarrera`),
  CONSTRAINT `fk_Rendimiento del piloto_Fecha1` FOREIGN KEY (`Fecha_idFecha`) REFERENCES `fecha` (`idFecha`),
  CONSTRAINT `fk_Rendimiento del piloto_Nacionalidad` FOREIGN KEY (`Nacionalidad_idNacionalidad`) REFERENCES `nacionalidad` (`idNacionalidad`),
  CONSTRAINT `fk_Rendimiento del piloto_Piloto1` FOREIGN KEY (`Piloto_idPiloto`) REFERENCES `piloto` (`idPiloto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
