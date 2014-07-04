-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	4.0.25


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mec
--

CREATE DATABASE IF NOT EXISTS mec;
USE mec;

DROP TABLE IF EXISTS `cargosnd`;
CREATE TABLE `cargosnd` (
  `cargo_agrup` int(1) NOT NULL default '0',
  `cargo_cod` int(3) NOT NULL default '0',
  `cargo_categ` int(2) NOT NULL default '0',
  `nivel` int(2) NOT NULL default '0',
  `cargo_desc` char(100) NOT NULL default '',
  PRIMARY KEY  (`cargo_agrup`,`cargo_cod`,`cargo_categ`)
) TYPE=MyISAM;

INSERT INTO `cargosnd` VALUES  (5,100,18,18,'Director Administrativo'),
 (1,24,4,4,'Portero - Casero'),
 (1,2,4,4,'Cocinero'),
 (1,15,3,5,'Mucama'),
 (8,1,4,7,'Director General'),
 (5,100,16,16,'Jefe de Departamento'),
 (5,100,12,12,'Jefe de División'),
 (1,10,4,4,'Guardián'),
 (1,17,2,6,'Ordenanza \"B\"'),
 (3,197,3,0,'Asistente de Casa Estudiantil'),
 (2,75,6,0,'Ayudante de Mantenimiento'),
 (3,16,2,0,'Auxiliar Técnico de Obras \"B\"'),
 (1,6,4,4,'Chofer \"B\"'),
 (2,20,3,0,'Encargado de Conmutador Telefónico'),
 (2,21,5,5,'Operador de Conmutador Telefónico'),
 (3,39,2,0,'Oficial Contable'),
 (3,40,3,0,'Auxiliar Contable'),
 (3,50,2,0,'Dibujante \"A\"'),
 (3,110,1,0,'Sistemas de Computación de Datos - Programador \"A\"'),
 (3,111,2,0,'Sistemas de Computación de Datos - Programador \"B\"'),
 (4,11,1,0,'Arquitecto \"A\"'),
 (4,21,15,2,'Contador \"B\"'),
 (4,77,2,0,'Ingeniero Forestal \"B\"'),
 (8,2,4,0,'Secretario General'),
 (7,2,5,2,'Subsecretario'),
 (7,1,3,1,'Ministro'),
 (4,98,3,0,'Investigador Científico \"C'),
 (3,47,2,0,'Oficial \"A\" de Depósitos y Almacenes'),
 (3,36,3,0,'Auxiliar de Compras'),
 (3,51,6,3,'Dibujante \"B\"'),
 (3,66,2,0,'Inspector de Recursos Naturales'),
 (3,105,3,0,'Sistemas de Computación de Datos - Analista \"C\"'),
 (1,16,3,5,'Ordenanza \"A\"'),
 (1,18,2,6,'Peón'),
 (2,13,9,3,'Capataz de Talleres Menores'),
 (1,111,5,0,'Costurera'),
 (4,17,3,0,'Auditor de Prestaciones Médicas'),
 (2,80,3,0,'Oficial Especializado en Cultivos'),
 (2,16,5,0,'Carpintero - Medio Oficial'),
 (3,15,1,0,'Auxiliar Técnico de Obras \"A\"'),
 (3,37,4,0,'Ayudante de Compras'),
 (1,29,6,3,'Chofer de Establecimiento Educativo'),
 (1,5,6,3,'Chofer \"A\"'),
 (7,3,5,2,'Subsecretario'),
 (1,3,3,5,'Ayudante de Cocina'),
 (1,4,2,4,'Correo'),
 (1,19,3,5,'Portero de Escuela'),
 (3,4,4,4,'Ayudante Administrativo'),
 (2,79,7,4,'Medio Oficial de Oficios Varios'),
 (2,2,5,5,'Medio Oficial Albañil'),
 (4,3,11,3,'Abogado \"C\"'),
 (2,1,7,4,'Albañil'),
 (3,105,6,0,'Sistemas de Computación de Datos - Analista \"C\"'),
 (3,166,6,3,'Asistente Infantil'),
 (3,3,6,3,'Auxiliar Administrativo'),
 (2,9,3,6,'Canalero'),
 (2,15,7,4,'Carpintero'),
 (1,1,6,3,'Cocinero de Residencia'),
 (4,20,17,1,'Contador \"A\"'),
 (2,111,5,5,'Costurera'),
 (2,32,7,4,'Encuadernador'),
 (2,40,7,4,'Foguista Encargado'),
 (2,65,3,6,'Jardinero'),
 (1,22,3,5,'Lavadero - Planchador'),
 (1,12,6,3,'Encargado de Maestranza'),
 (1,13,8,2,'Mayordomo'),
 (3,2,10,2,'Oficial Administrativo'),
 (2,81,7,4,'Oficial de Cultivo'),
 (2,78,9,3,'Oficial de Oficios Varios'),
 (3,1,14,1,'Oficial Superior Administrativo'),
 (4,2,15,2,'Personal Profesional Cat. 15'),
 (4,1,17,1,'Personal Profesional Cat. 17'),
 (3,131,10,2,'Técnico en Mantenimiento \"A\"'),
 (3,115,4,0,'Sistemas de Computación de Datos - Operador \"C\"'),
 (2,29,5,0,'Electricista Instalador - Medio Oficial'),
 (1,21,6,0,'UTILERO'),
 (2,21,7,0,'Operador de Conmutador Telefónico'),
 (4,138,17,0,'TECNOLOGO CLASE \"A\"'),
 (8,5,9,0,'SECRETARIO DE MINISTRO'),
 (0,0,1,0,'Planta Transitoria'),
 (1,1,2,0,'Personal de Servicio'),
 (1,1,3,0,'Personal de Servicio'),
 (1,1,4,0,'Personal de Servicio'),
 (2,1,1,0,'Personal Obrero'),
 (2,1,3,0,'Personal Obrero'),
 (2,1,4,0,'Personal Obrero'),
 (3,1,1,0,'Personal Administrativo'),
 (3,1,12,0,'Jefe de División'),
 (3,1,16,0,'Jefe de Departamento'),
 (3,1,2,0,'Personal Administrativo'),
 (3,1,3,0,'Personal Administrativo'),
 (3,1,4,0,'Personal Administrativo'),
 (4,1,1,0,'Personal Profesional y Técnico'),
 (4,1,3,0,'Personal Profesional y Técnico'),
 (7,4,5,0,''),
 (8,5,13,0,'');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
