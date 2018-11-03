/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.26-MariaDB : Database - scwv2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`scwv2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `scwv2`;

/*Table structure for table `cicc13` */

DROP TABLE IF EXISTS `cicc13`;

CREATE TABLE `cicc13` (
  `IdCCredito` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` char(1) NOT NULL DEFAULT 'C',
  `IdCliente` int(11) NOT NULL,
  `MontoLimite` float NOT NULL,
  `Saldo` float NOT NULL,
  PRIMARY KEY (`IdCCredito`),
  KEY `FKCC` (`IdCliente`),
  CONSTRAINT `FKCC` FOREIGN KEY (`IdCliente`) REFERENCES `cicl11` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cicc13` */

/*Table structure for table `cicf18` */

DROP TABLE IF EXISTS `cicf18`;

CREATE TABLE `cicf18` (
  `IdClieFac` int(11) NOT NULL AUTO_INCREMENT,
  `IdFac` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`IdClieFac`),
  KEY `FKIDFAC` (`IdFac`),
  KEY `FKIDCL` (`IdCliente`),
  CONSTRAINT `FKIDCL` FOREIGN KEY (`IdCliente`) REFERENCES `cicl11` (`IdCliente`),
  CONSTRAINT `FKIDFAC` FOREIGN KEY (`IdFac`) REFERENCES `cifa16` (`IdFac`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cicf18` */

/*Table structure for table `cicl11` */

DROP TABLE IF EXISTS `cicl11`;

CREATE TABLE `cicl11` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `IdPersona` int(11) NOT NULL,
  PRIMARY KEY (`IdCliente`),
  KEY `FKPERSONA` (`IdPersona`),
  CONSTRAINT `FKPERSONA` FOREIGN KEY (`IdPersona`) REFERENCES `uspr01` (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cicl11` */

/*Table structure for table `cico14` */

DROP TABLE IF EXISTS `cico14`;

CREATE TABLE `cico14` (
  `IdCContado` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` char(1) NOT NULL DEFAULT 'O',
  `IdCliente` int(11) NOT NULL,
  `Monto` float NOT NULL,
  PRIMARY KEY (`IdCContado`),
  KEY `FKCCON` (`IdCliente`),
  CONSTRAINT `FKCCON` FOREIGN KEY (`IdCliente`) REFERENCES `cicl11` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cico14` */

/*Table structure for table `cidf17` */

DROP TABLE IF EXISTS `cidf17`;

CREATE TABLE `cidf17` (
  `IdDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `IdFac` int(11) NOT NULL,
  `Producto_Nombre` varchar(30) NOT NULL,
  `Precio_Unit` float NOT NULL,
  `Cantidad` float NOT NULL,
  `IdLote` int(11) NOT NULL,
  `Total` float NOT NULL,
  PRIMARY KEY (`IdDetalle`),
  KEY `FKIDFA` (`IdFac`),
  KEY `FKLOT` (`IdLote`),
  CONSTRAINT `FKIDFA` FOREIGN KEY (`IdFac`) REFERENCES `cifa16` (`IdFac`),
  CONSTRAINT `FKLOT` FOREIGN KEY (`IdLote`) REFERENCES `selo09` (`IdLote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cidf17` */

/*Table structure for table `cifa16` */

DROP TABLE IF EXISTS `cifa16`;

CREATE TABLE `cifa16` (
  `IdFac` int(11) NOT NULL AUTO_INCREMENT,
  `FechaV` datetime NOT NULL,
  `IdUser` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `TotalFac` float NOT NULL,
  PRIMARY KEY (`IdFac`),
  KEY `FKUSERF` (`IdUser`),
  KEY `FKCLIENTEF` (`IdCliente`),
  CONSTRAINT `FKCLIENTEF` FOREIGN KEY (`IdCliente`) REFERENCES `cicl11` (`IdCliente`),
  CONSTRAINT `FKUSERF` FOREIGN KEY (`IdUser`) REFERENCES `sgus05` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cifa16` */

/*Table structure for table `citc12` */

DROP TABLE IF EXISTS `citc12`;

CREATE TABLE `citc12` (
  `IdTipoC` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` char(1) NOT NULL DEFAULT 'O',
  PRIMARY KEY (`IdTipoC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `citc12` */

/*Table structure for table `inin08` */

DROP TABLE IF EXISTS `inin08`;

CREATE TABLE `inin08` (
  `IdInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `IdTI` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Cantidad` float NOT NULL,
  `FechaComp` datetime NOT NULL,
  `PrecioUnit` float NOT NULL,
  `Detalle` varchar(30) DEFAULT NULL,
  `FechaVence` datetime NOT NULL,
  `Procedencia` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdInsumo`),
  KEY `FKTIPO` (`IdTI`),
  CONSTRAINT `FKTIPO` FOREIGN KEY (`IdTI`) REFERENCES `inti07` (`IdTI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `inin08` */

/*Table structure for table `intc10` */

DROP TABLE IF EXISTS `intc10`;

CREATE TABLE `intc10` (
  `IdTdCampo` int(11) NOT NULL AUTO_INCREMENT,
  `IdInsumo` int(11) NOT NULL,
  `IdLote` int(11) NOT NULL,
  `TrabajoRealiazado` varchar(30) NOT NULL,
  `CantidadAplicada` float NOT NULL,
  `FechaAplicacion` datetime NOT NULL,
  PRIMARY KEY (`IdTdCampo`),
  KEY `FKINSTDC` (`IdInsumo`),
  KEY `FKLOIN` (`IdLote`),
  CONSTRAINT `FKINSTDC` FOREIGN KEY (`IdInsumo`) REFERENCES `inin08` (`IdInsumo`),
  CONSTRAINT `FKLOIN` FOREIGN KEY (`IdLote`) REFERENCES `selo09` (`IdLote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `intc10` */

/*Table structure for table `inti07` */

DROP TABLE IF EXISTS `inti07`;

CREATE TABLE `inti07` (
  `IdTI` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(30) NOT NULL,
  PRIMARY KEY (`IdTI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `inti07` */

/*Table structure for table `plco03` */

DROP TABLE IF EXISTS `plco03`;

CREATE TABLE `plco03` (
  `IdColaborador` int(11) NOT NULL AUTO_INCREMENT,
  `IdPersona` int(11) NOT NULL,
  `IdTipoColaborador` int(11) NOT NULL,
  `FechaBaja` datetime DEFAULT NULL,
  `FechaIngreso` datetime NOT NULL,
  PRIMARY KEY (`IdColaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plco03` */

/*Table structure for table `plgc23` */

DROP TABLE IF EXISTS `plgc23`;

CREATE TABLE `plgc23` (
  `IdGasCola` int(11) NOT NULL AUTO_INCREMENT,
  `IdGasto` int(11) NOT NULL,
  `IdColaborador` int(11) NOT NULL,
  PRIMARY KEY (`IdGasCola`),
  KEY `FKGASCOL` (`IdGasto`),
  KEY `FKCOLGAS` (`IdColaborador`),
  CONSTRAINT `FKCOLGAS` FOREIGN KEY (`IdColaborador`) REFERENCES `plco03` (`IdColaborador`),
  CONSTRAINT `FKGASCOL` FOREIGN KEY (`IdGasto`) REFERENCES `plgo21` (`IdGasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plgc23` */

/*Table structure for table `plgo21` */

DROP TABLE IF EXISTS `plgo21`;

CREATE TABLE `plgo21` (
  `IdGasto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(15) NOT NULL,
  `Porcentaje` float NOT NULL,
  `Total` float NOT NULL,
  PRIMARY KEY (`IdGasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plgo21` */

/*Table structure for table `plno24` */

DROP TABLE IF EXISTS `plno24`;

CREATE TABLE `plno24` (
  `IdNomina` int(11) NOT NULL AUTO_INCREMENT,
  `IdColaborador` int(11) NOT NULL,
  `SalarioBase` float NOT NULL,
  `SalarioBruto` float NOT NULL,
  PRIMARY KEY (`IdNomina`),
  KEY `FKNOMICOLA` (`IdColaborador`),
  CONSTRAINT `FKNOMICOLA` FOREIGN KEY (`IdColaborador`) REFERENCES `plco03` (`IdColaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plno24` */

/*Table structure for table `plpc22` */

DROP TABLE IF EXISTS `plpc22`;

CREATE TABLE `plpc22` (
  `IdProCola` int(11) NOT NULL AUTO_INCREMENT,
  `IdProvicion` int(11) NOT NULL,
  `IdColaborador` int(11) NOT NULL,
  PRIMARY KEY (`IdProCola`),
  KEY `FKPROCOL` (`IdProvicion`),
  KEY `FKCOLPRO` (`IdColaborador`),
  CONSTRAINT `FKCOLPRO` FOREIGN KEY (`IdColaborador`) REFERENCES `plco03` (`IdColaborador`),
  CONSTRAINT `FKPROCOL` FOREIGN KEY (`IdProvicion`) REFERENCES `plpr20` (`IdProvicion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plpc22` */

/*Table structure for table `plpl25` */

DROP TABLE IF EXISTS `plpl25`;

CREATE TABLE `plpl25` (
  `IdPlanilla` int(11) NOT NULL AUTO_INCREMENT,
  `IdColaborador` int(11) NOT NULL,
  `Total` float NOT NULL,
  PRIMARY KEY (`IdPlanilla`),
  KEY `FKCOLABORADORN` (`IdColaborador`),
  CONSTRAINT `FKCOLABORADORN` FOREIGN KEY (`IdColaborador`) REFERENCES `plco03` (`IdColaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plpl25` */

/*Table structure for table `plpr20` */

DROP TABLE IF EXISTS `plpr20`;

CREATE TABLE `plpr20` (
  `IdProvicion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Porcentaje` float NOT NULL,
  `Total` float NOT NULL,
  PRIMARY KEY (`IdProvicion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `plpr20` */

/*Table structure for table `pltc02` */

DROP TABLE IF EXISTS `pltc02`;

CREATE TABLE `pltc02` (
  `IdTipoColaborador` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` int(11) NOT NULL DEFAULT '0',
  `Detalle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdTipoColaborador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pltc02` */

/*Table structure for table `seil19` */

DROP TABLE IF EXISTS `seil19`;

CREATE TABLE `seil19` (
  `IdDLote` int(11) NOT NULL AUTO_INCREMENT,
  `IdTrabajoC` int(11) NOT NULL,
  `Costo` float NOT NULL,
  `FechaApl` datetime NOT NULL,
  PRIMARY KEY (`IdDLote`),
  KEY `FKTRACAM` (`IdTrabajoC`),
  CONSTRAINT `FKTRACAM` FOREIGN KEY (`IdTrabajoC`) REFERENCES `intc10` (`IdTdCampo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `seil19` */

/*Table structure for table `selo09` */

DROP TABLE IF EXISTS `selo09`;

CREATE TABLE `selo09` (
  `IdLote` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `AreaL` float NOT NULL,
  `Estado` char(1) DEFAULT 'I',
  `Produccion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdLote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `selo09` */

/*Table structure for table `sgar06` */

DROP TABLE IF EXISTS `sgar06`;

CREATE TABLE `sgar06` (
  `IdUR` int(11) NOT NULL AUTO_INCREMENT,
  `IdUser` int(11) NOT NULL,
  `IdRol` int(11) NOT NULL,
  PRIMARY KEY (`IdUR`),
  KEY `FKUSER` (`IdUser`),
  KEY `FKROL` (`IdRol`),
  CONSTRAINT `FKROL` FOREIGN KEY (`IdRol`) REFERENCES `sgro04` (`IdRol`),
  CONSTRAINT `FKUSER` FOREIGN KEY (`IdUser`) REFERENCES `sgus05` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sgar06` */

/*Table structure for table `sgro04` */

DROP TABLE IF EXISTS `sgro04`;

CREATE TABLE `sgro04` (
  `IdRol` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(30) NOT NULL,
  PRIMARY KEY (`IdRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sgro04` */

/*Table structure for table `sgus05` */

DROP TABLE IF EXISTS `sgus05`;

CREATE TABLE `sgus05` (
  `IdPersona` int(11) NOT NULL,
  `IdUser` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`IdUser`),
  KEY `FKIDPERSONA` (`IdPersona`),
  CONSTRAINT `FKIDPERSONA` FOREIGN KEY (`IdPersona`) REFERENCES `uspr01` (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sgus05` */

/*Table structure for table `uspr01` */

DROP TABLE IF EXISTS `uspr01`;

CREATE TABLE `uspr01` (
  `IdPersona` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` varchar(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido1` varchar(30) NOT NULL,
  `Apellido2` varchar(30) NOT NULL,
  `Telefono` varchar(11) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IdPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `uspr01` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
