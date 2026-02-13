-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2025 a las 19:32:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shop_inventory`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`customerID`, `fullName`, `email`, `mobile`, `phone2`, `address`, `address2`, `city`, `district`, `status`, `createdOn`) VALUES
(1, 'Ana Martínez', 'ana.martinez@gmail.com', 2147483647, NULL, 'Calle 12 #8-14', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(2, 'Carlos Gómez', 'carlosg@hotmail.com', 2147483647, 2147483647, 'Cra 7 #14-22', NULL, 'Dosquebradas', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(3, 'Laura Ríos', 'laura.rios@yahoo.com', 2147483647, NULL, 'Av. Ferrocarril 102', 'Apt 3B', 'Pereira', 'Risaralda', 'Inactive', '2025-05-01 15:59:15'),
(4, 'José Rodríguez', 'jose.r@gmail.com', 2147483647, NULL, 'Calle 23 #9-87', NULL, 'Santa Rosa', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(5, 'María García', 'mariag@gmail.com', 2147483647, NULL, 'Barrio La Playa', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(6, 'Felipe Torres', 'ftorres@gmail.com', 2147483647, 2147483647, 'Cra 6 #18-21', NULL, 'La Virginia', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(7, 'Juliana López', 'juliana.lopez@outlook.com', 2147483647, NULL, 'Calle 45 #16-32', 'Casa 2', 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(8, 'Santiago Díaz', 'santi.diaz@gmail.com', 2147483647, NULL, 'Av. Circunvalar', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(9, 'Lucía Mejía', 'lucia.mj@gmail.com', 2147483647, NULL, 'Barrio San Nicolás', NULL, 'Dosquebradas', 'Risaralda', 'Inactive', '2025-05-01 15:59:15'),
(10, 'Camilo Vargas', 'cvargas@gmail.com', 2147483647, NULL, 'Cra 2 #10-56', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(11, 'Andrea Sánchez', 'andrea_s@hotmail.com', 2147483647, NULL, 'Calle 33 #15-45', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(12, 'Miguel Ángel', 'miguel.angel@gmail.com', 2147483647, NULL, 'Av. 30 de Agosto', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(13, 'Natalia Ruiz', 'natalia.ruiz@gmail.com', 2147483647, NULL, 'Barrio Cuba', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(14, 'Pedro Castaño', 'pcastano@gmail.com', 2147483647, NULL, 'Calle 10 #5-77', NULL, 'Santa Rosa', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(15, 'Verónica Quintero', 'vero.q@hotmail.com', 2147483647, NULL, 'Cra 3 #12-11', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `productID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `unitPrice` float NOT NULL DEFAULT 0,
  `imageURL` varchar(255) NOT NULL DEFAULT 'imageNotAvailable.jpg',
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`productID`, `itemNumber`, `itemName`, `discount`, `stock`, `unitPrice`, `imageURL`, `status`, `description`) VALUES
(1, 'PR001', 'Arroz Diana 5kg', 5, 37, 22000, 'arroz.jpg', 'Active', 'Arroz blanco tipo I'),
(2, 'PR002', 'Aceite Premier 1L', 0, 30, 9500, 'aceite.jpg', 'Active', 'Aceite vegetal para cocina'),
(3, 'PR003', 'Leche Alpina 1L', 2, 50, 3900, 'leche.jpg', 'Active', 'Leche entera pasteurizada'),
(4, 'PR004', 'Pan Tajado Bimbo', 0, 25, 4800, 'pan.jpg', 'Active', 'Pan blanco tajado'),
(5, 'PR005', 'Huevos AA 30 und', 0, 15, 13500, 'huevos.jpg', 'Active', 'Huevos frescos AA'),
(6, 'PR006', 'Café Sello Rojo 500g', 0, 10, 11800, 'cafe.jpg', 'Active', 'Café molido colombiano'),
(7, 'PR007', 'Azúcar Incauca 1kg', 0, 20, 3600, 'azucar.jpg', 'Active', 'Azúcar refinada'),
(8, 'PR008', 'Sal Refisal 500g', 0, 35, 1900, 'sal.jpg', 'Active', 'Sal refinada con yodo'),
(9, 'PR009', 'Jabón Rey 300g', 0, 40, 1200, 'jabon.jpg', 'Active', 'Jabón azul tradicional'),
(10, 'PR010', 'Detergente Ariel 1kg', 10, 22, 8900, 'ariel.jpg', 'Active', 'Detergente en polvo'),
(11, 'PR011', 'Coca-Cola 2L', 0, 50, 5900, 'cocacola.jpg', 'Active', 'Bebida gaseosa'),
(12, 'PR012', 'Atún Van Camp\'s 160g', 0, 30, 5400, 'atun.jpg', 'Active', 'Atún en agua'),
(13, 'PR013', 'Margarina Rama 250g', 0, 20, 3000, 'margarina.jpg', 'Active', 'Margarina untar'),
(14, 'PR014', 'Harina Pan 1kg', 0, 12, 4600, 'harina.jpg', 'Active', 'Harina de maíz precocida'),
(15, 'PR015', 'Papel Higiénico x4', 0, 25, 7200, 'papel.jpg', 'Active', 'Papel doble hoja'),
(58, 'pr11111', 'Jota', 1, 222, 3000, 'imageNotAvailable.jpg', 'Active', ''),
(59, 'PR111111', 'ASDAD', 0, 12131, 233, 'imageNotAvailable.jpg', 'Active', 'ASDWW'),
(60, 'PR0098', 'Aceite Margarita', 5, 40, 5000, '1748304100_aceite.jpg', 'Active', 'hola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase`
--

CREATE TABLE `purchase` (
  `purchaseID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `purchaseDate` date NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `unitPrice` float NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `vendorName` varchar(255) NOT NULL DEFAULT 'Test Vendor',
  `vendorID` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `purchase`
--

INSERT INTO `purchase` (`purchaseID`, `itemNumber`, `purchaseDate`, `itemName`, `unitPrice`, `quantity`, `vendorName`, `vendorID`, `description`) VALUES
(2, 'A001', '2025-04-01', 'Arroz Diana 5kg', 17000, 100, 'Distribuidora Alimentos S.A.', 2, 'Compra mensual de arroz'),
(3, 'A002', '2025-04-02', 'Frijol Rojo 1kg', 4300, 80, 'Leguminosas del Valle', 3, 'Reposición de frijoles'),
(4, 'A003', '2025-04-03', 'Aceite Premier 1L', 8200, 60, 'Aceites y Grasas S.A.', 4, 'Compra de aceite vegetal'),
(5, 'A004', '2025-04-04', 'Azúcar Incauca 2kg', 6800, 90, 'Azucarera Nacional', 5, 'Compra de azúcar refinada'),
(6, 'A005', '2025-04-05', 'Sal Refisal 1kg', 2400, 120, 'Salinas de Colombia', 6, 'Compra de sal yodada'),
(7, 'A006', '2025-04-06', 'Café Águila Roja 500g', 9200, 70, 'Cafés de Colombia S.A.', 7, 'Compra de café molido'),
(8, 'A007', '2025-04-07', 'Leche Alquería 1L', 3400, 150, 'Lácteos Nacionales', 8, 'Compra de leche entera'),
(9, 'A008', '2025-04-08', 'Huevos Kikes 12un', 5800, 100, 'Avícolas Unidas', 9, 'Compra de huevos frescos'),
(10, 'A009', '2025-04-09', 'Pan Bimbo Blanco', 4300, 80, 'Panificadora Bimbo', 10, 'Compra de pan de molde'),
(11, 'A010', '2025-04-10', 'Jabón Rey 300g', 1900, 90, 'Productos de Aseo S.A.', 11, 'Compra de jabón multiusos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale`
--

CREATE TABLE `sale` (
  `saleID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `customerID` int(11) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `saleDate` date NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `unitPrice` float(10,0) NOT NULL DEFAULT 0,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sale`
--

INSERT INTO `sale` (`saleID`, `itemNumber`, `customerID`, `customerName`, `itemName`, `saleDate`, `discount`, `quantity`, `unitPrice`, `description`) VALUES
(1, 'P001', 1, 'Andrés López', 'Arroz Diana 500g', '2025-04-15', 0, 2, 3200, 'Venta en caja 2 unidades'),
(2, 'P002', 2, 'María Gómez', 'Aceite Premier 1L', '2025-04-16', 0.05, 1, 9000, 'Descuento aplicado por promoción'),
(3, 'P003', 3, 'Carlos Rueda', 'Papel Higiénico Familia x4', '2025-04-16', 0, 1, 6000, 'Cliente frecuente'),
(4, 'P004', 4, 'Luisa Pérez', 'Huevos AA x12', '2025-04-17', 0, 1, 8200, 'Venta normal'),
(5, 'P005', 5, 'Javier Castaño', 'Leche Alpina 1L', '2025-04-17', 0, 3, 3800, 'Compra por unidad'),
(6, 'P006', 6, 'Diana Ríos', 'Pan Bimbo Blanco', '2025-04-18', 0.1, 1, 4600, '10% por día sin IVA'),
(7, 'P007', 7, 'Natalia Zapata', 'Jabón Rey Barra', '2025-04-18', 0, 4, 1200, 'Limpieza básica'),
(8, 'P008', 8, 'José Martínez', 'Café Águila Roja 250g', '2025-04-19', 0, 1, 9500, 'Promoción de café'),
(9, 'P009', 9, 'Laura Rodríguez', 'Galletas Festival', '2025-04-19', 0, 2, 2900, 'Snacks'),
(10, 'P010', 10, 'Camila Torres', 'Atún Van Camps 170g', '2025-04-20', 0, 3, 5200, 'Enlatados'),
(11, 'P011', 11, 'Felipe Rivera', 'Sal Refisal 500g', '2025-04-20', 0, 1, 1200, 'Compra rápida'),
(12, 'P012', 12, 'Lorena Castillo', 'Detergente Ariel 1kg', '2025-04-21', 0.05, 2, 10500, 'Descuento 5% fidelización'),
(13, 'P013', 13, 'Manuel Salazar', 'Chocolate Corona', '2025-04-21', 0, 1, 4800, 'Consumo hogar'),
(14, 'P014', 14, 'Verónica Díaz', 'Harina PAN 1kg', '2025-04-22', 0, 2, 4100, 'Preparaciones en casa'),
(15, 'P015', 15, 'Santiago Vélez', 'Frijol Rojo 500g', '2025-04-22', 0, 2, 3900, 'Compra básica'),
(109, 'PR001', 2, 'Carlos Gómez', 'Arroz Diana 5kg', '2023-09-21', 5, 0, 22000, 'Hola'),
(110, 'PR001', 2, 'Carlos Gómez', 'Arroz Diana 5kg', '2023-09-21', 5, 3, 22000, 'Hola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`userID`, `fullName`, `username`, `password`, `status`) VALUES
(1, 'Lina Castaño', 'lina1', '73acd9a5972130b75066c82595a1fae3', 'Active'),
(2, 'Carlos Pérez', 'cperez', '5f4dcc3b5aa765d61d8327deb882cf99', 'Active'),
(3, 'Sandra Gómez', 'sgomez', 'e99a18c428cb38d5f260853678922e03', 'Active'),
(4, 'Luis Ramírez', 'lramirez', '7c6a180b36896a0a8c02787eeafb0e4c', 'Active'),
(5, 'Ana Torres', 'atorres', '25d55ad283aa400af464c76d713c07ad', 'Active'),
(6, 'Jorge Morales', 'jmorales', '6cb75f652a9b52798eb6cf2201057c73', 'Active'),
(7, 'Diana Ruiz', 'druiz', '8f14e45fceea167a5a36dedd4bea2543', 'Active'),
(8, 'Esteban Soto', 'esoto', '45c48cce2e2d7fbdea1afc51c7c6ad26', 'Active'),
(9, 'Paola Mejía', 'pmejia', '5f4dcc3b5aa765d61d8327deb882cf99', 'Active'),
(10, 'Julio Herrera', 'jherrera', 'e99a18c428cb38d5f260853678922e03', 'Active'),
(11, 'Natalia Rivera', 'nrivera', '7c6a180b36896a0a8c02787eeafb0e4c', 'Active'),
(12, 'Camilo Salazar', 'csalazar', '25d55ad283aa400af464c76d713c07ad', 'Active'),
(13, 'Verónica Díaz', 'vdiaz', '6cb75f652a9b52798eb6cf2201057c73', 'Active'),
(14, 'Jhon Arias', 'jarias', '8f14e45fceea167a5a36dedd4bea2543', 'Active'),
(15, 'Tatiana Rojas', 'trojas', '45c48cce2e2d7fbdea1afc51c7c6ad26', 'Active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendor`
--

CREATE TABLE `vendor` (
  `vendorID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `phone2` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `district` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `createdOn` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `vendor`
--

INSERT INTO `vendor` (`vendorID`, `fullName`, `email`, `mobile`, `phone2`, `address`, `address2`, `city`, `district`, `status`, `createdOn`) VALUES
(1, 'Distribuidora Mayorista El Sur', 'contacto@elsur.com', 2147483647, NULL, 'Zona Industrial', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(2, 'Alimentos y Bebidas S.A.S.', 'ventas@absa.com', 2147483647, NULL, 'Cra 11 #20-55', NULL, 'Manizales', 'Caldas', 'Active', '2025-05-01 15:59:15'),
(3, 'Frutas La Granja', 'lagranja@frutas.com', 2147483647, NULL, 'Km 2 Vía Armenia', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(4, 'Lácteos del Norte', 'contacto@lacteosnorte.com', 2147483647, NULL, 'Zona Industrial Norte', NULL, 'Dosquebradas', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(5, 'Abarrotes El Valle', 'elvalle@abastos.com', 2147483647, NULL, 'Cra 4 #25-32', NULL, 'Cali', 'Valle', 'Active', '2025-05-01 15:59:15'),
(6, 'Cárnicos Don Mario', 'donmario@carnes.com', 2147483647, NULL, 'Calle 21 #14-45', NULL, 'Cartago', 'Valle', 'Active', '2025-05-01 15:59:15'),
(7, 'Panadería Integral', 'integral@panes.com', 2147483647, NULL, 'Av. 30 de Agosto', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(8, 'Verduras Express', 'verduras@express.com', 2147483647, NULL, 'Barrio Cuba', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(9, 'Granos y Cereales', 'granos@cereal.com', 2147483647, NULL, 'Cra 12 #8-88', NULL, 'Santa Rosa', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(10, 'Súper Licores', 'ventas@licores.com', 2147483647, NULL, 'Cra 3 #17-34', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(11, 'Aguas Naturales', 'aguas@naturales.com', 2147483647, NULL, 'Zona Franca', NULL, 'Cartago', 'Valle', 'Active', '2025-05-01 15:59:15'),
(12, 'Productos El Campo', 'campo@productos.com', 2147483647, NULL, 'Cra 2 #19-12', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(13, 'Café Especial', 'especial@cafe.com', 2147483647, NULL, 'Zona Cafetera', NULL, 'Santa Rosa', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(14, 'Empacados La Mesa', 'mesa@empacados.com', 2147483647, NULL, 'Km 5 vía Cerritos', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15'),
(15, 'Supermercado Aliado', 'aliado@super.com', 2147483647, NULL, 'Cra 9 #10-10', NULL, 'Pereira', 'Risaralda', 'Active', '2025-05-01 15:59:15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `itemNumber` (`itemNumber`);

--
-- Indices de la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchaseID`),
  ADD UNIQUE KEY `vendorID` (`vendorID`);

--
-- Indices de la tabla `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`saleID`),
  ADD KEY `itemNumber` (`itemNumber`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indices de la tabla `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendorID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `sale`
--
ALTER TABLE `sale`
  MODIFY `saleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`purchaseID`) REFERENCES `item` (`productID`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`vendorID`) REFERENCES `vendor` (`vendorID`);

--
-- Filtros para la tabla `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `fk_sale_customer` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sale_customer_01` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
