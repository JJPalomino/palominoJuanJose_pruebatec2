-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3309
-- Tiempo de generación: 23-01-2025 a las 17:35:24
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
  `FECHA` datetime DEFAULT NULL,
  `ciudadano` bigint(20) DEFAULT NULL,
  `tramite` bigint(20) DEFAULT NULL,
  `id_cita` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`ID`, `DESCRIPCION`, `ESTADO`, `FECHA`, `ciudadano`, `tramite`, `id_cita`) VALUES
(1, 'Tramite de prueba', 1, '2025-01-24 10:33:33', 2, 10, 2),
(2, 'Tramite de prueba 2', 1, '2025-01-28 09:00:00', 1, 2, 1);

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
(1, 'PAJJ980729HVZLCN07', 'Palomino', 'Emilio Carranza 21', 'josepalomino_@outlook.com', 1, '2023-02-07', 'Juan Jose ', '2331263285'),
(2, 'PAVF390720HVZLZR00', 'Gimenez', 'C. HONORABLE GALEANA SN', 'palominojuanjose577@gmail.com', 0, '2006-02-10', 'Pedro', '1245873254'),
(4, 'PAVF390720HVZLZRgdsg', 'Aparicio', 'Emilio Carranza 21', 'mariagarsanchez0209@gmail.com', 1, '1992-06-26', 'Javier', '2285818364'),
(6, 'No se puede modificar', 'Aparisc', 'Emilio Carranza 21', 'mariagarsanchez0209@gmail.com', 0, '1992-06-26', 'Javier', '2285818364');

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
(2, 'Este tramite sssss', 1, 'Consulta de recibo de luz'),
(8, 'Este tramite permite a los usuarios acceder a su recibo de luz de manera rÃ¡pida y sencilla.', 0, 'Consulta de recibo de luz'),
(9, 'Este tramite permite a los usuarios acceder a su recibo de luz de manera rÃ¡pida y sencilla.', 0, 'Consulta de recibo de luz'),
(10, 'Este tramite permite a los usuarios acceder a su recibo de luz de manera rÃ¡pida y sencilla.', 0, 'Consulta de recibo de luz'),
(11, 'dgsgregrsgs', 0, 'Consulta de recibo de luz'),
(12, 'dgsgregrsgsgsrgrzgcshhhhh', 1, 'Consulta de recibo de luz');

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
(1, 'josejose_@hotmail.com', '12345'),
(2, 'pedriogutierrez_outlook.com', 'e124578');

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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
