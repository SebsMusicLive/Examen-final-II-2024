-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2024 a las 17:25:31
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
-- Base de datos: `examen_final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajero`
--

CREATE TABLE `cajero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `tienda_id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cajero`
--

INSERT INTO `cajero` (`id`, `nombre`, `documento`, `tienda_id`, `email`, `token`) VALUES
(1, 'Luis Herrera', '60606060', 1, 'luis.herrera@tienda.com', 'token123'),
(2, 'Elena Díaz', '70707070', 2, 'elena.diaz@tienda.com', 'token456'),
(3, 'Santiago Pérez', '80808080', 1, 'santiago.perez@tienda.com', 'token789'),
(4, 'Claudia López', '90909090', 2, 'claudia.lopez@tienda.com', 'token012'),
(5, 'Natalia Ríos', '10101011', 1, 'natalia.rios@tienda.com', 'token345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `tipo_documento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `documento`, `tipo_documento_id`) VALUES
(1, 'Juan Pérez', '10000001', 1),
(2, 'María Gómez', '10000002', 1),
(3, 'Carlos López', '20000001', 2),
(4, 'Laura Martínez', '10000001', 3),
(5, 'Andrés Gutiérrez', '40000001', 1),
(6, 'Sofía Ramírez', '50000001', 2),
(7, 'Luis Fernández', '60000001', 1),
(8, 'Paula Torres', '70000001', 3),
(9, 'Miguel Vega', '80000001', 2),
(10, 'Camila Sánchez', '90000001', 1),
(11, 'Jorge Rodríguez', '10000003', 2),
(12, 'Lucía Morales', '20000002', 1),
(13, 'Fernando Castillo', '30000002', 3),
(14, 'Valentina Ruiz', '40000002', 1),
(15, 'Sebastián López', '50000002', 2),
(16, 'Isabella Herrera', '60000002', 3),
(17, 'Mateo Vargas', '70000002', 1),
(18, 'Daniela Ríos', '80000002', 2),
(19, 'Diego Peña', '90000002', 3),
(20, 'Sara Muñoz', '10000004', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `tienda_id` int(11) NOT NULL,
  `vendedor_id` int(11) NOT NULL,
  `cajero_id` int(11) NOT NULL,
  `total` decimal(10,2) DEFAULT 0.00,
  `impuestos` decimal(5,2) DEFAULT 0.00,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `observaciones` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `cliente_id`, `tienda_id`, `vendedor_id`, `cajero_id`, `total`, `impuestos`, `fecha`, `observaciones`) VALUES
(1, 1, 1, 1, 1, 7728.00, 368.00, '2024-01-01 05:00:00', 'Ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compra`
--

CREATE TABLE `detalles_compra` (
  `id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descuento` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalles_compra`
--

INSERT INTO `detalles_compra` (`id`, `compra_id`, `producto_id`, `cantidad`, `precio`, `descuento`) VALUES
(1, 1, 1, 2, 1200.00, 10.00),
(2, 1, 2, 1, 2500.00, 0.00),
(3, 1, 3, 10, 300.00, 10.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` bigint(20) NOT NULL,
  `cajero_id` bigint(20) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `impuestos` decimal(38,2) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `tienda_id` varchar(255) DEFAULT NULL,
  `total` decimal(38,2) DEFAULT NULL,
  `vendedor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `tipo_pago_id` int(11) NOT NULL,
  `tarjeta_tipo` varchar(20) DEFAULT NULL CHECK (`tarjeta_tipo` in ('VISA','MASTERCARD')),
  `valor` decimal(10,2) DEFAULT NULL,
  `cuotas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id`, `compra_id`, `tipo_pago_id`, `tarjeta_tipo`, `valor`, `cuotas`) VALUES
(1, 1, 1, 'VISA', 7360.00, 1),
(2, 1, 4, NULL, 368.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tipo_producto_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 0,
  `referencia` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio`, `tipo_producto_id`, `cantidad`, `referencia`) VALUES
(1, 'Smartphone', 'Teléfono inteligente de última generación', 1200.00, 1, 15, 'ELEC001'),
(2, 'Laptop', 'Laptop con procesador de alta velocidad', 2500.00, 1, 10, 'ELEC002'),
(3, 'Smartwatch', 'Reloj inteligente con monitoreo de salud', 300.00, 1, 25, 'ELEC003'),
(4, 'Tablet', 'Tableta con pantalla táctil de 10 pulgadas', 600.00, 1, 20, 'ELEC004'),
(5, 'Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 150.00, 1, 30, 'ELEC005'),
(6, 'Camiseta básica', 'Camiseta de algodón unisex', 15.00, 2, 50, 'ROPA001'),
(7, 'Jeans', 'Pantalón de mezclilla clásico', 40.00, 2, 35, 'ROPA002'),
(8, 'Chaqueta impermeable', 'Chaqueta para lluvia con capucha', 80.00, 2, 20, 'ROPA003'),
(9, 'Vestido de verano', 'Vestido casual con estampado floral', 50.00, 2, 25, 'ROPA004'),
(10, 'Zapatos deportivos', 'Zapatos cómodos para correr', 60.00, 2, 30, 'ROPA005'),
(11, 'Manzana', 'Manzana roja fresca', 0.50, 3, 100, 'COMI001'),
(12, 'Pan integral', 'Pan integral en rodajas', 2.50, 3, 80, 'COMI002'),
(13, 'Leche', 'Leche entera pasteurizada', 1.20, 3, 50, 'COMI003'),
(14, 'Cereal', 'Cereal de avena con miel', 3.00, 3, 40, 'COMI004'),
(15, 'Chocolate', 'Tableta de chocolate oscuro', 2.00, 3, 70, 'COMI005'),
(16, 'Osito de peluche', 'Pelucha suave y abrazable', 25.00, 4, 15, 'JUGU001'),
(17, 'Bloques de construcción', 'Set de bloques para armar estructuras', 30.00, 4, 20, 'JUGU002'),
(18, 'Muñeca', 'Muñeca con accesorios incluidos', 40.00, 4, 10, 'JUGU003'),
(19, 'Carrito de juguete', 'Carro de juguete a escala', 20.00, 4, 25, 'JUGU004'),
(20, 'Juego de mesa', 'Juego de mesa para toda la familia', 35.00, 4, 12, 'JUGU005'),
(21, 'El arte de la guerra', 'Clásico libro de estrategia militar', 12.00, 5, 30, 'LIBR001'),
(22, 'Cien años de soledad', 'Obra maestra de Gabriel García Márquez', 15.00, 5, 20, 'LIBR002'),
(23, 'Harry Potter y la piedra filosofal', 'Primera entrega de la saga de Harry Potter', 18.00, 5, 25, 'LIBR003'),
(24, 'El principito', 'Libro clásico de Antoine de Saint-Exupéry', 10.00, 5, 50, 'LIBR004'),
(25, 'Aprendiendo Python', 'Guía completa para aprender Python', 40.00, 5, 10, 'LIBR005');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `direccion` varchar(500) NOT NULL,
  `uuid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`id`, `nombre`, `direccion`, `uuid`) VALUES
(1, 'ULTRA ALEJANDRIA', 'CALLE 14 N 4-22 CENTRO', '123e4567-e89b-12d3-a456-\r\n426614174000'),
(2, 'LA SUPERBODEGA', 'CARRERA 20 N 12-23', '987e6543-a12b-34d3-c789-426614174001'),
(3, 'LA NEBULOSA COMERCIAL', 'AVENIDA 0 N 17-12', '12345678-1234-5678-1234-\r\n123456789012');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `nombre`) VALUES
(1, 'CC'),
(2, 'CE'),
(3, 'TI'),
(4, 'NIT'),
(5, 'RC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`id`, `nombre`) VALUES
(1, 'PSE'),
(2, 'TARJETA CREDITO'),
(3, 'TARJETA DEBITO'),
(4, 'EFECTIVO'),
(5, 'BITCOIN'),
(6, 'TRANSFERENCIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id`, `nombre`) VALUES
(1, 'DISPOSITIVOS ELECTRÓNICOs'),
(2, 'ROPA'),
(3, 'COMIDA'),
(4, 'JUGUETES'),
(5, 'LIBROS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`id`, `nombre`, `documento`, `email`) VALUES
(1, 'Pedro Sánchez', '10101010', 'pedro.sanchez@empresa.com'),
(2, 'Ana Ramírez', '20202020', 'ana.ramirez@empresa.com'),
(3, 'Javier Torres', '30303030', 'javier.torres@empresa.com'),
(4, 'Luisa Gómez', '40404040', 'luisa.gomez@empresa.com'),
(5, 'Carolina Ruiz', '50505050', 'carolina.ruiz@empresa.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajero`
--
ALTER TABLE `cajero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_documento_id` (`tipo_documento_id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `tienda_id` (`tienda_id`),
  ADD KEY `vendedor_id` (`vendedor_id`),
  ADD KEY `cajero_id` (`cajero_id`);

--
-- Indices de la tabla `detalles_compra`
--
ALTER TABLE `detalles_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_id` (`compra_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_id` (`compra_id`),
  ADD KEY `tipo_pago_id` (`tipo_pago_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_producto_id` (`tipo_producto_id`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajero`
--
ALTER TABLE `cajero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalles_compra`
--
ALTER TABLE `detalles_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajero`
--
ALTER TABLE `cajero`
  ADD CONSTRAINT `cajero_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tienda` (`id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documento` (`id`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`tienda_id`) REFERENCES `tienda` (`id`),
  ADD CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedor` (`id`),
  ADD CONSTRAINT `compra_ibfk_4` FOREIGN KEY (`cajero_id`) REFERENCES `cajero` (`id`);

--
-- Filtros para la tabla `detalles_compra`
--
ALTER TABLE `detalles_compra`
  ADD CONSTRAINT `detalles_compra_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`),
  ADD CONSTRAINT `detalles_compra_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pago` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`tipo_producto_id`) REFERENCES `tipo_producto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
