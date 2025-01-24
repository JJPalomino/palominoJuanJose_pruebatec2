-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3309
-- Tiempo de generación: 24-01-2025 a las 06:22:56
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `turnero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT 0,
  `FECHA` date DEFAULT NULL,
  `HORA` varchar(255) DEFAULT NULL,
  `ciudadano` bigint(20) DEFAULT NULL,
  `tramite` bigint(20) DEFAULT NULL,
  `id_cita` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`ID`, `DESCRIPCION`, `ESTADO`, `FECHA`, `HORA`, `ciudadano`, `tramite`, `id_cita`) VALUES
(1, 'Tramite de Pasaporte', 0, '2025-01-24', '10:00', 5, 1, NULL),
(2, 'Obtención de documento fiscal', 0, '2025-01-24', '9:00', 1, 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudadano`
--

CREATE TABLE `ciudadano` (
  `ID` bigint(20) NOT NULL,
  `CURP` varchar(255) DEFAULT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT 0,
  `FECHANOCIMIENTO` date DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ciudadano`
--

INSERT INTO `ciudadano` (`ID`, `CURP`, `APELLIDO`, `DIRECCION`, `EMAIL`, `ESTADO`, `FECHANOCIMIENTO`, `NOMBRE`, `TELEFONO`) VALUES
(1, 'PEGJ870315HDFRZN04', 'PÃ©rez', 'Calle Roble 123, Col. Centro, CDMX 06000', 'juan.perez@gmail.com', 1, '1991-11-20', 'Juan', ' 5512345678'),
(2, 'ROSM920621MDFNRA07', 'RodrÃ­guez', 'Av. Libertad 456, Tijuana, BC 22000', 'maria.rodriguez@hotmail.com', 1, '2010-06-18', 'MarÃ­a', '6641098765'),
(3, 'MAHC850914HDFRRR02', 'MartÃ­nez ', 'Calle Nogal 789, Monterrey, NL 64000', 'carlos.martinez@outlook.com', 1, '2008-03-02', 'Carlos', '8112344321'),
(4, 'GALA901205MDFPRN05', 'GarcÃ­a', 'Paseo de las Flores 234, MÃ©rida, YucatÃ¡n 97000', 'ana.garcia@gmail.com', 1, '2004-04-30', 'Ana', '9932167890'),
(5, 'RATM881130HDFMGR09', 'RamÃ­rez', 'Calzada del Sol 567, Guadalajara, Jalisco 44000', 'miguel.ramirez@yahoo.com', 1, '2001-10-11', 'Miguel', '3387654321'),
(6, 'HEMS940703MDFRRR08', 'HernÃ¡ndez', 'Calle Olivo 678, CuliacÃ¡n, Sinaloa 80000', 'sofia.hernandez@gmail.com', 1, '1980-12-09', 'SofÃ­a', '6662345678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramite`
--

CREATE TABLE `tramite` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT 0,
  `NOMBRETRAMITE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tramite`
--

INSERT INTO `tramite` (`ID`, `DESCRIPCION`, `ESTADO`, `NOMBRETRAMITE`) VALUES
(1, 'Documento oficial que permite a ciudadanos mexicanos viajar al extranjero y acreditar su identidad internacional.', 1, 'Pasaporte Mexicano'),
(2, 'AutorizaciÃ³n oficial que permite a un individuo conducir vehÃ­culos motorizados en territorio mexicano.', 1, 'Licencia de Conducir'),
(3, 'Documento legal que certifica el nacimiento de una persona, registrando fecha, lugar y padres.', 1, 'Acta de Nacimiento'),
(4, 'Registro que permite a trabajadores acceder a servicios de seguridad social, atenciÃ³n mÃ©dica y beneficios laborales.', 1, 'InscripciÃ³n al IMSS'),
(5, 'TrÃ¡mite fiscal donde los ciudadanos reportan sus ingresos y pagan o solicitan devoluciÃ³n de impuestos.', 1, 'DeclaraciÃ³n Anual de Impuestos (SAT)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` bigint(20) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `EMAIL`, `PASSWORD`) VALUES
(1, 'daniel.torres@yahoo.com', '123456'),
(2, 'daniel.torres@yahoo.com', '789632');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CITA_tramite` (`tramite`),
  ADD KEY `FK_CITA_id_cita` (`id_cita`),
  ADD KEY `FK_CITA_ciudadano` (`ciudadano`);

--
-- Indices de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CURP` (`CURP`);

--
-- Indices de la tabla `tramite`
--
ALTER TABLE `tramite`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tramite`
--
ALTER TABLE `tramite`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `FK_CITA_ciudadano` FOREIGN KEY (`ciudadano`) REFERENCES `ciudadano` (`ID`),
  ADD CONSTRAINT `FK_CITA_id_cita` FOREIGN KEY (`id_cita`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `FK_CITA_tramite` FOREIGN KEY (`tramite`) REFERENCES `tramite` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
