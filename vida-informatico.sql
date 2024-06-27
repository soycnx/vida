-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla ci4-vidainformatico.cajas
CREATE TABLE IF NOT EXISTS `cajas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caja` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ci4-vidainformatico.cajas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
INSERT INTO `cajas` (`id`, `caja`, `estado`) VALUES
	(1, 'CAJA GENERAL', 1);
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.caja_cierre
CREATE TABLE IF NOT EXISTS `caja_cierre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_caja` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `monto_inicial` decimal(10,2) NOT NULL,
  `monto_fin` decimal(10,2) DEFAULT NULL,
  `total_ventas` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ci4-vidainformatico.caja_cierre: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `caja_cierre` DISABLE KEYS */;
INSERT INTO `caja_cierre` (`id`, `id_caja`, `id_usuario`, `fecha_inicio`, `fecha_fin`, `monto_inicial`, `monto_fin`, `total_ventas`, `status`) VALUES
	(1, 1, 1, '2022-02-24 02:31:56', '2022-02-25 10:44:34', 50.00, 3050.00, 1, 0),
	(2, 1, 1, '2022-02-25 10:53:53', '2023-05-08 08:48:40', 0.00, 12600.00, 2, 0),
	(3, 1, 1, '2023-05-08 08:48:45', NULL, 300.00, NULL, 0, 1);
/*!40000 ALTER TABLE `caja_cierre` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `idcat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcat`),
  UNIQUE KEY `categoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ci4-vidainformatico.categorias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`idcat`, `categoria`, `estado`) VALUES
	(1, 'FRUTAS', 1),
	(2, 'aadad', 0);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `estado` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ci4-vidainformatico.clientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `nombre`, `telefono`, `direccion`, `correo`, `estado`) VALUES
	(1, 'PUBLICO EN GENERAL', '979897797', 'CALLE AV. SIN NUMERO', 'publico@gmail.com', 1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.compras
CREATE TABLE IF NOT EXISTS `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ci4-vidainformatico.compras: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` (`id`, `total`, `id_usuario`, `estado`, `fecha`) VALUES
	(1, 36000.00, 1, 1, '2022-02-25 11:37:47'),
	(2, 45000.00, 1, 0, '2024-06-21 22:45:08');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.configuracion
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `mensaje` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ci4-vidainformatico.configuracion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` (`id`, `ruc`, `nombre`, `telefono`, `direccion`, `correo`, `mensaje`) VALUES
	(1, '123456789', 'Vida Informático', '925491523', 'Lima - Perú', 'angelSIFUENTES@gmail.com', 'Gracias por su preferencia @angel');
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.detalle_compra
CREATE TABLE IF NOT EXISTS `detalle_compra` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ci4-vidainformatico.detalle_compra: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` (`id_detalle`, `id_producto`, `precio`, `cantidad`, `id_compra`) VALUES
	(1, 1, 2000.00, 18, 1),
	(2, 2, 500.00, 50, 2),
	(3, 1, 2000.00, 10, 2);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.detalle_permisos
CREATE TABLE IF NOT EXISTS `detalle_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ci4-vidainformatico.detalle_permisos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_permisos` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ci4-vidainformatico.detalle_venta: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` (`id_detalle`, `id_producto`, `precio`, `cantidad`, `id_venta`) VALUES
	(1, 1, 3000.00, 1, 1),
	(2, 1, 3000.00, 3, 2),
	(3, 2, 600.00, 1, 2),
	(4, 1, 3000.00, 1, 3);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.marcas
CREATE TABLE IF NOT EXISTS `marcas` (
  `idmarca` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmarca`),
  UNIQUE KEY `marca` (`marca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ci4-vidainformatico.marcas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` (`idmarca`, `marca`, `estado`) VALUES
	(1, 'LENOVO', 1),
	(2, 'XXX', 1);
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.medidas
CREATE TABLE IF NOT EXISTS `medidas` (
  `idmedida` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `medida` varchar(100) NOT NULL,
  `nombre_corto` varchar(10) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmedida`),
  UNIQUE KEY `medida` (`medida`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ci4-vidainformatico.medidas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `medidas` DISABLE KEYS */;
INSERT INTO `medidas` (`idmedida`, `medida`, `nombre_corto`, `estado`) VALUES
	(1, 'GRAMOS', 'GR', 1);
/*!40000 ALTER TABLE `medidas` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ci4-vidainformatico.permisos: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` (`id`, `nombre`) VALUES
	(1, 'usuarios'),
	(2, 'cajas'),
	(3, 'clientes'),
	(4, 'productos'),
	(5, 'marcas'),
	(6, 'configuracion'),
	(7, 'medidas'),
	(8, 'categorias'),
	(9, 'nueva_compra'),
	(10, 'compras'),
	(11, 'nueva_venta'),
	(12, 'ventas');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `stock_minimo` int(11) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `id_marca` int(10) unsigned NOT NULL,
  `id_medida` int(10) unsigned NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `productos_id_marca_foreign` (`id_marca`),
  KEY `productos_id_medida_foreign` (`id_medida`),
  KEY `productos_id_categoria_foreign` (`id_categoria`),
  CONSTRAINT `productos_id_categoria_foreign` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`idcat`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productos_id_marca_foreign` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`idmarca`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productos_id_medida_foreign` FOREIGN KEY (`id_medida`) REFERENCES `medidas` (`idmedida`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ci4-vidainformatico.productos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `codigo`, `descripcion`, `precio_compra`, `precio_venta`, `stock_minimo`, `stock`, `id_marca`, `id_medida`, `id_categoria`, `imagen`, `estado`) VALUES
	(1, '7977987', 'LAPTOP CORE I7', 2000.00, 3000.00, 25, 13, 1, 1, 1, 'default.jpg', 1),
	(2, '798798', 'IMPRESORA TERMICA', 500.00, 600.00, 12, -1, 1, 1, 1, 'default.jpg', 1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.temp_compras
CREATE TABLE IF NOT EXISTS `temp_compras` (
  `id_temp` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_temp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ci4-vidainformatico.temp_compras: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `temp_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_compras` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.temp_ventas
CREATE TABLE IF NOT EXISTS `temp_ventas` (
  `id_temp` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_temp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ci4-vidainformatico.temp_ventas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `temp_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_ventas` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `clave` varchar(150) NOT NULL,
  `id_caja` int(10) unsigned NOT NULL,
  `estado` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `usuarios_id_caja_foreign` (`id_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla ci4-vidainformatico.usuarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `usuario`, `nombre`, `correo`, `clave`, `id_caja`, `estado`) VALUES
	(1, 'admin', 'Vida Informatico', 'admin@angelsifuentes.com', '$2y$10$BQmRb980sMqq7z0bCSQ8Jexq2VbVWqxDoaGhjTlbi7NZcSxE1qz/O', 1, 1),
	(2, 'alejo', 'Alejo', 'alejo@admin.com', '$2y$10$g.tJrXKDDP.g0I2q.TOIfu.DACJtkXZpQo8Wl9CcnSlYISgJREFU6', 1, 1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla ci4-vidainformatico.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` int(11) NOT NULL DEFAULT '1',
  `caja` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla ci4-vidainformatico.ventas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`id`, `total`, `id_usuario`, `id_cliente`, `fecha`, `estado`, `caja`) VALUES
	(1, 3000.00, 1, 1, '2023-05-08 22:48:40', 1, 0),
	(2, 9600.00, 1, 1, '2023-05-08 22:48:40', 1, 0),
	(3, 3000.00, 1, 1, '2024-06-21 22:37:58', 1, 1);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
