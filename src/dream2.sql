-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-07-2021 a las 02:27:11
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dream2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `ART_ID_ARTICULO` int(11) NOT NULL,
  `ART_DESCRIPCION` varchar(45) NOT NULL,
  `ART_STOCK` int(11) NOT NULL,
  `ART_FECHA_VENCIMIENTO` date NOT NULL,
  `ART_ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `BAN_ID_BANCO` int(11) NOT NULL,
  `BAN_DESCRIPCION` varchar(45) NOT NULL,
  `BAN_ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canal`
--

CREATE TABLE `canal` (
  `CAN_ID_CANAL` int(11) NOT NULL,
  `CAN_NOMBRE` varchar(45) NOT NULL,
  `CAN_ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CAT_ID_CATEGORIA` int(11) NOT NULL,
  `CAT_DESCRIPCION` varchar(45) NOT NULL,
  `CAT_ESTADO` bit(1) DEFAULT NULL,
  `Articulo_ART_ID_ARTICULO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `CLI_ID_CLIENTE` int(11) NOT NULL,
  `CLI_NOMBRE` varchar(45) NOT NULL,
  `CLI_APELLIDO` varchar(45) NOT NULL,
  `CLI_DIRECCION` varchar(45) NOT NULL,
  `CLI_TELEFONO` int(11) NOT NULL,
  `CLI_CORREO` varchar(45) NOT NULL,
  `CAN_ID_CANAL` int(11) NOT NULL,
  `CLI_ESTADO` bit(1) DEFAULT NULL,
  `CLI_RUT` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `COM_ID` int(11) NOT NULL,
  `COM_NOMBRE` varchar(45) NOT NULL,
  `COM_ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_venta`
--

CREATE TABLE `estado_venta` (
  `EST_ID_ESTADO` int(11) NOT NULL,
  `EST_DESCRIPCION` varchar(45) NOT NULL,
  `EST_ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `FAC_ID_FACTURA` int(11) NOT NULL,
  `FAC_NUMERO` int(11) NOT NULL,
  `PRO_ID_PROVEEDOR` int(11) NOT NULL,
  `FAC_FECHA_FACTURA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadetalle`
--

CREATE TABLE `facturadetalle` (
  `DET_ID_DETALLE` int(11) NOT NULL,
  `FAC_ID_FACTURA` int(11) NOT NULL,
  `ART_ID_ARTICULO` int(11) NOT NULL,
  `DET_FECHA_VENCIMIENTO` date NOT NULL,
  `DET_CANTIDAD` int(11) NOT NULL,
  `DET_VALOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra`
--

CREATE TABLE `orden_compra` (
  `ORC_ID_ORDEN` int(11) NOT NULL,
  `ORC_NUMERO` int(11) DEFAULT NULL,
  `PRO_ID_PROVEEDOR` int(11) DEFAULT NULL,
  `ORC_FECHA_ORDEN` date DEFAULT NULL,
  `Proveedor_PRO_ID_PROVEEDOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra_detalle`
--

CREATE TABLE `orden_compra_detalle` (
  `OCD_ID_DETALLE` int(11) NOT NULL,
  `ART_ID_ARTICULO` int(11) DEFAULT NULL,
  `OCD_CANTIDAD` int(11) DEFAULT NULL,
  `OCD_DET_VALOR` int(11) DEFAULT NULL,
  `ORC_ID_ORDEN` int(11) DEFAULT NULL,
  `Orden_Compra_ORC_ID_ORDEN` int(11) NOT NULL,
  `Orden_Compra_Proveedor_PRO_ID_PROVEEDOR` int(11) NOT NULL,
  `Articulo_ART_ID_ARTICULO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pack`
--

CREATE TABLE `pack` (
  `PCK_ID_PACK` int(11) NOT NULL,
  `PCK_NOMBRE` varchar(45) NOT NULL,
  `PCK_COSTO` varchar(45) NOT NULL,
  `PCK_STOCK` int(11) NOT NULL,
  `PCK_ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pack_has_articulo`
--

CREATE TABLE `pack_has_articulo` (
  `PCK_ID_PACK` int(11) NOT NULL,
  `ART_ID_ARTICULO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `PRO_ID_PROVEEDOR` int(11) NOT NULL,
  `PRO_NOMBRE` varchar(45) NOT NULL,
  `PRO_TELEFONO` int(11) NOT NULL,
  `PRO_CORREO` varchar(45) NOT NULL,
  `PRO_DIRECCION` varchar(45) NOT NULL,
  `PRO_ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `USU_ID_USUARIO` int(11) NOT NULL,
  `USU_NOMBRE` varchar(45) NOT NULL,
  `USU_APELLIDO` varchar(45) NOT NULL,
  `USU_USERNAME` varchar(45) DEFAULT NULL,
  `USU_CLAVE` varchar(45) NOT NULL,
  `USU_ESTADO` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `VTA_ID_VENTA` int(11) NOT NULL,
  `CLI_ID_CLIENTE` int(11) NOT NULL,
  `PCK_ID_PACK` int(11) NOT NULL,
  `BAN_ID_BANCO` int(11) NOT NULL,
  `VTA_TOTAL` int(11) NOT NULL,
  `VTA_FECHA_VENTA` date NOT NULL,
  `VTA_FECHA_TRANSFERENCIA` date NOT NULL,
  `VTA_CODIGO_TRANSFERENCIA` int(11) NOT NULL,
  `VTA_NOMBRE_DESTINATARIO` varchar(50) NOT NULL,
  `VTA_APELLIDO_DESTINATARIO` varchar(45) NOT NULL,
  `VTA_DIRECCION_DESTINATARIO` varchar(45) NOT NULL,
  `COM_ID_COMUNA` int(11) NOT NULL,
  `VTA_TELEFONO_DESTINATARIO` int(11) NOT NULL,
  `VTA_FECHA_ENTREGA` date NOT NULL,
  `VTA_HORA_ENTREGA_INICIAL` time NOT NULL,
  `VTA_HORA_ENTREGA_FINAL` time NOT NULL,
  `VTA_SALUDO_TEXTO` varchar(250) DEFAULT NULL,
  `EST_ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`ART_ID_ARTICULO`);

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`BAN_ID_BANCO`);

--
-- Indices de la tabla `canal`
--
ALTER TABLE `canal`
  ADD PRIMARY KEY (`CAN_ID_CANAL`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CAT_ID_CATEGORIA`),
  ADD KEY `fk_Categoria_Articulo1_idx` (`Articulo_ART_ID_ARTICULO`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CLI_ID_CLIENTE`),
  ADD KEY `fk_cliente_canal_idx` (`CAN_ID_CANAL`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`COM_ID`);

--
-- Indices de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  ADD PRIMARY KEY (`EST_ID_ESTADO`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`FAC_ID_FACTURA`),
  ADD KEY `fk_articulo_has_proveedor_proveedor1_idx` (`PRO_ID_PROVEEDOR`);

--
-- Indices de la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  ADD PRIMARY KEY (`DET_ID_DETALLE`),
  ADD KEY `fk_articulo_has_Factura_Factura1_idx` (`FAC_ID_FACTURA`),
  ADD KEY `fk_FacturaDetalle_articulo1_idx` (`ART_ID_ARTICULO`);

--
-- Indices de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD PRIMARY KEY (`ORC_ID_ORDEN`,`Proveedor_PRO_ID_PROVEEDOR`),
  ADD KEY `fk_Orden_Compra_Proveedor1_idx` (`Proveedor_PRO_ID_PROVEEDOR`);

--
-- Indices de la tabla `orden_compra_detalle`
--
ALTER TABLE `orden_compra_detalle`
  ADD PRIMARY KEY (`OCD_ID_DETALLE`,`Orden_Compra_ORC_ID_ORDEN`,`Orden_Compra_Proveedor_PRO_ID_PROVEEDOR`,`Articulo_ART_ID_ARTICULO`),
  ADD KEY `fk_Orden_Compra_Detalle_Orden_Compra1_idx` (`Orden_Compra_ORC_ID_ORDEN`,`Orden_Compra_Proveedor_PRO_ID_PROVEEDOR`),
  ADD KEY `fk_Orden_Compra_Detalle_Articulo1_idx` (`Articulo_ART_ID_ARTICULO`);

--
-- Indices de la tabla `pack`
--
ALTER TABLE `pack`
  ADD PRIMARY KEY (`PCK_ID_PACK`);

--
-- Indices de la tabla `pack_has_articulo`
--
ALTER TABLE `pack_has_articulo`
  ADD PRIMARY KEY (`PCK_ID_PACK`,`ART_ID_ARTICULO`),
  ADD KEY `fk_pack_has_articulo_articulo1_idx` (`ART_ID_ARTICULO`),
  ADD KEY `fk_pack_has_articulo_pack1_idx` (`PCK_ID_PACK`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`PRO_ID_PROVEEDOR`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USU_ID_USUARIO`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`VTA_ID_VENTA`),
  ADD KEY `fk_venta_cliente_idx` (`CLI_ID_CLIENTE`),
  ADD KEY `fk_venta_pack1_idx` (`PCK_ID_PACK`),
  ADD KEY `fk_venta_Bancos1_idx` (`BAN_ID_BANCO`),
  ADD KEY `fk_venta_COMUNA1_idx` (`COM_ID_COMUNA`),
  ADD KEY `fk_Venta_Estado_Venta1_idx` (`EST_ID_ESTADO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `ART_ID_ARTICULO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `BAN_ID_BANCO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `canal`
--
ALTER TABLE `canal`
  MODIFY `CAN_ID_CANAL` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `CAT_ID_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `CLI_ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  MODIFY `EST_ID_ESTADO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `FAC_ID_FACTURA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  MODIFY `DET_ID_DETALLE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  MODIFY `ORC_ID_ORDEN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden_compra_detalle`
--
ALTER TABLE `orden_compra_detalle`
  MODIFY `OCD_ID_DETALLE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pack`
--
ALTER TABLE `pack`
  MODIFY `PCK_ID_PACK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pack_has_articulo`
--
ALTER TABLE `pack_has_articulo`
  MODIFY `PCK_ID_PACK` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `PRO_ID_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `USU_ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `VTA_ID_VENTA` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_Categoria_Articulo1` FOREIGN KEY (`Articulo_ART_ID_ARTICULO`) REFERENCES `dreamgifts`.`articulo` (`ART_ID_ARTICULO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_canal` FOREIGN KEY (`CAN_ID_CANAL`) REFERENCES `dreamgifts`.`canal` (`CAN_ID_CANAL`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_articulo_has_proveedor_proveedor1` FOREIGN KEY (`PRO_ID_PROVEEDOR`) REFERENCES `dreamgifts`.`proveedor` (`PRO_ID_PROVEEDOR`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  ADD CONSTRAINT `fk_FacturaDetalle_articulo1` FOREIGN KEY (`ART_ID_ARTICULO`) REFERENCES `dreamgifts`.`articulo` (`ART_ID_ARTICULO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_articulo_has_Factura_Factura1` FOREIGN KEY (`FAC_ID_FACTURA`) REFERENCES `dreamgifts`.`factura` (`FAC_ID_FACTURA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD CONSTRAINT `fk_Orden_Compra_Proveedor1` FOREIGN KEY (`Proveedor_PRO_ID_PROVEEDOR`) REFERENCES `dreamgifts`.`proveedor` (`PRO_ID_PROVEEDOR`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden_compra_detalle`
--
ALTER TABLE `orden_compra_detalle`
  ADD CONSTRAINT `fk_Orden_Compra_Detalle_Articulo1` FOREIGN KEY (`Articulo_ART_ID_ARTICULO`) REFERENCES `dreamgifts`.`articulo` (`ART_ID_ARTICULO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Orden_Compra_Detalle_Orden_Compra1` FOREIGN KEY (`Orden_Compra_ORC_ID_ORDEN`,`Orden_Compra_Proveedor_PRO_ID_PROVEEDOR`) REFERENCES `dreamgifts`.`orden_compra` (`ORC_ID_ORDEN`, `Proveedor_PRO_ID_PROVEEDOR`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pack_has_articulo`
--
ALTER TABLE `pack_has_articulo`
  ADD CONSTRAINT `fk_pack_has_articulo_articulo1` FOREIGN KEY (`ART_ID_ARTICULO`) REFERENCES `dreamgifts`.`articulo` (`ART_ID_ARTICULO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pack_has_articulo_pack1` FOREIGN KEY (`PCK_ID_PACK`) REFERENCES `dreamgifts`.`pack` (`PCK_ID_PACK`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_Venta_Estado_Venta1` FOREIGN KEY (`EST_ID_ESTADO`) REFERENCES `dreamgifts`.`estado_venta` (`EST_ID_ESTADO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_Bancos1` FOREIGN KEY (`BAN_ID_BANCO`) REFERENCES `dreamgifts`.`bancos` (`BAN_ID_BANCO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_COMUNA1` FOREIGN KEY (`COM_ID_COMUNA`) REFERENCES `dreamgifts`.`comuna` (`COM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`CLI_ID_CLIENTE`) REFERENCES `dreamgifts`.`cliente` (`CLI_ID_CLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_pack1` FOREIGN KEY (`PCK_ID_PACK`) REFERENCES `dreamgifts`.`pack` (`PCK_ID_PACK`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
