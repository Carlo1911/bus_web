/*
 Navicat Premium Data Transfer

 Source Server         : Andimar QA
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : db_andimar

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 02/03/2022 10:38:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
INSERT INTO `auth_group` VALUES (1, 'Vendedor');
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
INSERT INTO `auth_group_permissions` VALUES (9, 1, 85);
INSERT INTO `auth_group_permissions` VALUES (10, 1, 86);
INSERT INTO `auth_group_permissions` VALUES (11, 1, 88);
INSERT INTO `auth_group_permissions` VALUES (2, 1, 97);
INSERT INTO `auth_group_permissions` VALUES (3, 1, 98);
INSERT INTO `auth_group_permissions` VALUES (4, 1, 99);
INSERT INTO `auth_group_permissions` VALUES (5, 1, 100);
INSERT INTO `auth_group_permissions` VALUES (6, 1, 117);
INSERT INTO `auth_group_permissions` VALUES (7, 1, 118);
INSERT INTO `auth_group_permissions` VALUES (8, 1, 119);
INSERT INTO `auth_group_permissions` VALUES (1, 1, 128);
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add Rol', 6, 'add_role');
INSERT INTO `auth_permission` VALUES (22, 'Can change Rol', 6, 'change_role');
INSERT INTO `auth_permission` VALUES (23, 'Can delete Rol', 6, 'delete_role');
INSERT INTO `auth_permission` VALUES (24, 'Can view Rol', 6, 'view_role');
INSERT INTO `auth_permission` VALUES (25, 'Can add user', 7, 'add_customuser');
INSERT INTO `auth_permission` VALUES (26, 'Can change user', 7, 'change_customuser');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user', 7, 'delete_customuser');
INSERT INTO `auth_permission` VALUES (28, 'Can view user', 7, 'view_customuser');
INSERT INTO `auth_permission` VALUES (29, 'Can add Prestación de bus', 8, 'add_benefit');
INSERT INTO `auth_permission` VALUES (30, 'Can change Prestación de bus', 8, 'change_benefit');
INSERT INTO `auth_permission` VALUES (31, 'Can delete Prestación de bus', 8, 'delete_benefit');
INSERT INTO `auth_permission` VALUES (32, 'Can view Prestación de bus', 8, 'view_benefit');
INSERT INTO `auth_permission` VALUES (33, 'Can add Bus', 9, 'add_bus');
INSERT INTO `auth_permission` VALUES (34, 'Can change Bus', 9, 'change_bus');
INSERT INTO `auth_permission` VALUES (35, 'Can delete Bus', 9, 'delete_bus');
INSERT INTO `auth_permission` VALUES (36, 'Can view Bus', 9, 'view_bus');
INSERT INTO `auth_permission` VALUES (37, 'Can add Tipo de asiento', 10, 'add_seattype');
INSERT INTO `auth_permission` VALUES (38, 'Can change Tipo de asiento', 10, 'change_seattype');
INSERT INTO `auth_permission` VALUES (39, 'Can delete Tipo de asiento', 10, 'delete_seattype');
INSERT INTO `auth_permission` VALUES (40, 'Can view Tipo de asiento', 10, 'view_seattype');
INSERT INTO `auth_permission` VALUES (41, 'Can add Disposición en bus', 11, 'add_layout');
INSERT INTO `auth_permission` VALUES (42, 'Can change Disposición en bus', 11, 'change_layout');
INSERT INTO `auth_permission` VALUES (43, 'Can delete Disposición en bus', 11, 'delete_layout');
INSERT INTO `auth_permission` VALUES (44, 'Can view Disposición en bus', 11, 'view_layout');
INSERT INTO `auth_permission` VALUES (45, 'Can add Piso', 12, 'add_floor');
INSERT INTO `auth_permission` VALUES (46, 'Can change Piso', 12, 'change_floor');
INSERT INTO `auth_permission` VALUES (47, 'Can delete Piso', 12, 'delete_floor');
INSERT INTO `auth_permission` VALUES (48, 'Can view Piso', 12, 'view_floor');
INSERT INTO `auth_permission` VALUES (49, 'Can add Componente', 13, 'add_component');
INSERT INTO `auth_permission` VALUES (50, 'Can change Componente', 13, 'change_component');
INSERT INTO `auth_permission` VALUES (51, 'Can delete Componente', 13, 'delete_component');
INSERT INTO `auth_permission` VALUES (52, 'Can view Componente', 13, 'view_component');
INSERT INTO `auth_permission` VALUES (53, 'Can add Asiento', 14, 'add_seat');
INSERT INTO `auth_permission` VALUES (54, 'Can change Asiento', 14, 'change_seat');
INSERT INTO `auth_permission` VALUES (55, 'Can delete Asiento', 14, 'delete_seat');
INSERT INTO `auth_permission` VALUES (56, 'Can view Asiento', 14, 'view_seat');
INSERT INTO `auth_permission` VALUES (57, 'Can add Motivo', 15, 'add_motive');
INSERT INTO `auth_permission` VALUES (58, 'Can change Motivo', 15, 'change_motive');
INSERT INTO `auth_permission` VALUES (59, 'Can delete Motivo', 15, 'delete_motive');
INSERT INTO `auth_permission` VALUES (60, 'Can view Motivo', 15, 'view_motive');
INSERT INTO `auth_permission` VALUES (61, 'Can add Personal', 16, 'add_personal');
INSERT INTO `auth_permission` VALUES (62, 'Can change Personal', 16, 'change_personal');
INSERT INTO `auth_permission` VALUES (63, 'Can delete Personal', 16, 'delete_personal');
INSERT INTO `auth_permission` VALUES (64, 'Can view Personal', 16, 'view_personal');
INSERT INTO `auth_permission` VALUES (65, 'Can add Cargo', 17, 'add_position');
INSERT INTO `auth_permission` VALUES (66, 'Can change Cargo', 17, 'change_position');
INSERT INTO `auth_permission` VALUES (67, 'Can delete Cargo', 17, 'delete_position');
INSERT INTO `auth_permission` VALUES (68, 'Can view Cargo', 17, 'view_position');
INSERT INTO `auth_permission` VALUES (69, 'Can add personal position', 18, 'add_personalposition');
INSERT INTO `auth_permission` VALUES (70, 'Can change personal position', 18, 'change_personalposition');
INSERT INTO `auth_permission` VALUES (71, 'Can delete personal position', 18, 'delete_personalposition');
INSERT INTO `auth_permission` VALUES (72, 'Can view personal position', 18, 'view_personalposition');
INSERT INTO `auth_permission` VALUES (73, 'Can add personal motive', 19, 'add_personalmotive');
INSERT INTO `auth_permission` VALUES (74, 'Can change personal motive', 19, 'change_personalmotive');
INSERT INTO `auth_permission` VALUES (75, 'Can delete personal motive', 19, 'delete_personalmotive');
INSERT INTO `auth_permission` VALUES (76, 'Can view personal motive', 19, 'view_personalmotive');
INSERT INTO `auth_permission` VALUES (77, 'Can add Comisión', 20, 'add_commission');
INSERT INTO `auth_permission` VALUES (78, 'Can change Comisión', 20, 'change_commission');
INSERT INTO `auth_permission` VALUES (79, 'Can delete Comisión', 20, 'delete_commission');
INSERT INTO `auth_permission` VALUES (80, 'Can view Comisión', 20, 'view_commission');
INSERT INTO `auth_permission` VALUES (81, 'Can add Región', 21, 'add_region');
INSERT INTO `auth_permission` VALUES (82, 'Can change Región', 21, 'change_region');
INSERT INTO `auth_permission` VALUES (83, 'Can delete Región', 21, 'delete_region');
INSERT INTO `auth_permission` VALUES (84, 'Can view Región', 21, 'view_region');
INSERT INTO `auth_permission` VALUES (85, 'Can add Tarifa', 22, 'add_routestretchrate');
INSERT INTO `auth_permission` VALUES (86, 'Can change Tarifa', 22, 'change_routestretchrate');
INSERT INTO `auth_permission` VALUES (87, 'Can delete Tarifa', 22, 'delete_routestretchrate');
INSERT INTO `auth_permission` VALUES (88, 'Can view Tarifa', 22, 'view_routestretchrate');
INSERT INTO `auth_permission` VALUES (89, 'Can add Venta', 23, 'add_sale');
INSERT INTO `auth_permission` VALUES (90, 'Can change Venta', 23, 'change_sale');
INSERT INTO `auth_permission` VALUES (91, 'Can delete Venta', 23, 'delete_sale');
INSERT INTO `auth_permission` VALUES (92, 'Can view Venta', 23, 'view_sale');
INSERT INTO `auth_permission` VALUES (93, 'Can add Servicio', 24, 'add_service');
INSERT INTO `auth_permission` VALUES (94, 'Can change Servicio', 24, 'change_service');
INSERT INTO `auth_permission` VALUES (95, 'Can delete Servicio', 24, 'delete_service');
INSERT INTO `auth_permission` VALUES (96, 'Can view Servicio', 24, 'view_service');
INSERT INTO `auth_permission` VALUES (97, 'Can add Tipo de tarifa', 25, 'add_ratetype');
INSERT INTO `auth_permission` VALUES (98, 'Can change Tipo de tarifa', 25, 'change_ratetype');
INSERT INTO `auth_permission` VALUES (99, 'Can delete Tipo de tarifa', 25, 'delete_ratetype');
INSERT INTO `auth_permission` VALUES (100, 'Can view Tipo de tarifa', 25, 'view_ratetype');
INSERT INTO `auth_permission` VALUES (101, 'Can add Boleto', 26, 'add_ticket');
INSERT INTO `auth_permission` VALUES (102, 'Can change Boleto', 26, 'change_ticket');
INSERT INTO `auth_permission` VALUES (103, 'Can delete Boleto', 26, 'delete_ticket');
INSERT INTO `auth_permission` VALUES (104, 'Can view Boleto', 26, 'view_ticket');
INSERT INTO `auth_permission` VALUES (105, 'Can add Tramo', 27, 'add_masterroutestretch');
INSERT INTO `auth_permission` VALUES (106, 'Can change Tramo', 27, 'change_masterroutestretch');
INSERT INTO `auth_permission` VALUES (107, 'Can delete Tramo', 27, 'delete_masterroutestretch');
INSERT INTO `auth_permission` VALUES (108, 'Can view Tramo', 27, 'view_masterroutestretch');
INSERT INTO `auth_permission` VALUES (109, 'Can add route stretch', 28, 'add_routestretch');
INSERT INTO `auth_permission` VALUES (110, 'Can change route stretch', 28, 'change_routestretch');
INSERT INTO `auth_permission` VALUES (111, 'Can delete route stretch', 28, 'delete_routestretch');
INSERT INTO `auth_permission` VALUES (112, 'Can view route stretch', 28, 'view_routestretch');
INSERT INTO `auth_permission` VALUES (113, 'Can add master route stretch rate', 29, 'add_masterroutestretchrate');
INSERT INTO `auth_permission` VALUES (114, 'Can change master route stretch rate', 29, 'change_masterroutestretchrate');
INSERT INTO `auth_permission` VALUES (115, 'Can delete master route stretch rate', 29, 'delete_masterroutestretchrate');
INSERT INTO `auth_permission` VALUES (116, 'Can view master route stretch rate', 29, 'view_masterroutestretchrate');
INSERT INTO `auth_permission` VALUES (117, 'Can add Pasajeo', 30, 'add_passenger');
INSERT INTO `auth_permission` VALUES (118, 'Can change Pasajeo', 30, 'change_passenger');
INSERT INTO `auth_permission` VALUES (119, 'Can delete Pasajeo', 30, 'delete_passenger');
INSERT INTO `auth_permission` VALUES (120, 'Can view Pasajeo', 30, 'view_passenger');
INSERT INTO `auth_permission` VALUES (121, 'Can add Ruta maestra', 31, 'add_masterroute');
INSERT INTO `auth_permission` VALUES (122, 'Can change Ruta maestra', 31, 'change_masterroute');
INSERT INTO `auth_permission` VALUES (123, 'Can delete Ruta maestra', 31, 'delete_masterroute');
INSERT INTO `auth_permission` VALUES (124, 'Can view Ruta maestra', 31, 'view_masterroute');
INSERT INTO `auth_permission` VALUES (125, 'Can add Ruta', 32, 'add_route');
INSERT INTO `auth_permission` VALUES (126, 'Can change Ruta', 32, 'change_route');
INSERT INTO `auth_permission` VALUES (127, 'Can delete Ruta', 32, 'delete_route');
INSERT INTO `auth_permission` VALUES (128, 'Can view Ruta', 32, 'view_route');
INSERT INTO `auth_permission` VALUES (129, 'Can add Ciudad', 33, 'add_city');
INSERT INTO `auth_permission` VALUES (130, 'Can change Ciudad', 33, 'change_city');
INSERT INTO `auth_permission` VALUES (131, 'Can delete Ciudad', 33, 'delete_city');
INSERT INTO `auth_permission` VALUES (132, 'Can view Ciudad', 33, 'view_city');
INSERT INTO `auth_permission` VALUES (133, 'Can add Sucursal', 34, 'add_branch');
INSERT INTO `auth_permission` VALUES (134, 'Can change Sucursal', 34, 'change_branch');
INSERT INTO `auth_permission` VALUES (135, 'Can delete Sucursal', 34, 'delete_branch');
INSERT INTO `auth_permission` VALUES (136, 'Can view Sucursal', 34, 'view_branch');
INSERT INTO `auth_permission` VALUES (137, 'Can add Parada de bus', 35, 'add_busstop');
INSERT INTO `auth_permission` VALUES (138, 'Can change Parada de bus', 35, 'change_busstop');
INSERT INTO `auth_permission` VALUES (139, 'Can delete Parada de bus', 35, 'delete_busstop');
INSERT INTO `auth_permission` VALUES (140, 'Can view Parada de bus', 35, 'view_busstop');
INSERT INTO `auth_permission` VALUES (141, 'Can add Caja', 36, 'add_cashregister');
INSERT INTO `auth_permission` VALUES (142, 'Can change Caja', 36, 'change_cashregister');
INSERT INTO `auth_permission` VALUES (143, 'Can delete Caja', 36, 'delete_cashregister');
INSERT INTO `auth_permission` VALUES (144, 'Can view Caja', 36, 'view_cashregister');
INSERT INTO `auth_permission` VALUES (145, 'Can add Log de comisión', 37, 'add_commissionlog');
INSERT INTO `auth_permission` VALUES (146, 'Can change Log de comisión', 37, 'change_commissionlog');
INSERT INTO `auth_permission` VALUES (147, 'Can delete Log de comisión', 37, 'delete_commissionlog');
INSERT INTO `auth_permission` VALUES (148, 'Can view Log de comisión', 37, 'view_commissionlog');
INSERT INTO `auth_permission` VALUES (149, 'Can add Mapa de ruta maestra', 38, 'add_masterroutemap');
INSERT INTO `auth_permission` VALUES (150, 'Can change Mapa de ruta maestra', 38, 'change_masterroutemap');
INSERT INTO `auth_permission` VALUES (151, 'Can delete Mapa de ruta maestra', 38, 'delete_masterroutemap');
INSERT INTO `auth_permission` VALUES (152, 'Can view Mapa de ruta maestra', 38, 'view_masterroutemap');
INSERT INTO `auth_permission` VALUES (153, 'Can add Mapa de ruta', 39, 'add_routemap');
INSERT INTO `auth_permission` VALUES (154, 'Can change Mapa de ruta', 39, 'change_routemap');
INSERT INTO `auth_permission` VALUES (155, 'Can delete Mapa de ruta', 39, 'delete_routemap');
INSERT INTO `auth_permission` VALUES (156, 'Can view Mapa de ruta', 39, 'view_routemap');
INSERT INTO `auth_permission` VALUES (157, 'Can add Nacionalidad del pasajero', 40, 'add_passengernationality');
INSERT INTO `auth_permission` VALUES (158, 'Can change Nacionalidad del pasajero', 40, 'change_passengernationality');
INSERT INTO `auth_permission` VALUES (159, 'Can delete Nacionalidad del pasajero', 40, 'delete_passengernationality');
INSERT INTO `auth_permission` VALUES (160, 'Can view Nacionalidad del pasajero', 40, 'view_passengernationality');
INSERT INTO `auth_permission` VALUES (161, 'Can add Reserva de asientos', 41, 'add_reservedseats');
INSERT INTO `auth_permission` VALUES (162, 'Can change Reserva de asientos', 41, 'change_reservedseats');
INSERT INTO `auth_permission` VALUES (163, 'Can delete Reserva de asientos', 41, 'delete_reservedseats');
INSERT INTO `auth_permission` VALUES (164, 'Can view Reserva de asientos', 41, 'view_reservedseats');
INSERT INTO `auth_permission` VALUES (165, 'Can add Asiento reservado', 42, 'add_reservedseat');
INSERT INTO `auth_permission` VALUES (166, 'Can change Asiento reservado', 42, 'change_reservedseat');
INSERT INTO `auth_permission` VALUES (167, 'Can delete Asiento reservado', 42, 'delete_reservedseat');
INSERT INTO `auth_permission` VALUES (168, 'Can view Asiento reservado', 42, 'view_reservedseat');
INSERT INTO `auth_permission` VALUES (169, 'Can add printer', 43, 'add_printer');
INSERT INTO `auth_permission` VALUES (170, 'Can change printer', 43, 'change_printer');
INSERT INTO `auth_permission` VALUES (171, 'Can delete printer', 43, 'delete_printer');
INSERT INTO `auth_permission` VALUES (172, 'Can view printer', 43, 'view_printer');
INSERT INTO `auth_permission` VALUES (173, 'Can add Movimiento de caja', 44, 'add_cashregistermovement');
INSERT INTO `auth_permission` VALUES (174, 'Can change Movimiento de caja', 44, 'change_cashregistermovement');
INSERT INTO `auth_permission` VALUES (175, 'Can delete Movimiento de caja', 44, 'delete_cashregistermovement');
INSERT INTO `auth_permission` VALUES (176, 'Can view Movimiento de caja', 44, 'view_cashregistermovement');
INSERT INTO `auth_permission` VALUES (177, 'Can add Operación de caja', 45, 'add_cashregisteroperation');
INSERT INTO `auth_permission` VALUES (178, 'Can change Operación de caja', 45, 'change_cashregisteroperation');
INSERT INTO `auth_permission` VALUES (179, 'Can delete Operación de caja', 45, 'delete_cashregisteroperation');
INSERT INTO `auth_permission` VALUES (180, 'Can view Operación de caja', 45, 'view_cashregisteroperation');
COMMIT;

-- ----------------------------
-- Table structure for core_cashregister
-- ----------------------------
DROP TABLE IF EXISTS `core_cashregister`;
CREATE TABLE `core_cashregister` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` varchar(9) NOT NULL,
  `created` datetime(6) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `cashier_id` bigint(20) NOT NULL,
  `total_prints` int(11) NOT NULL,
  `printer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_cashregister_branch_id_b5f8b045_fk_locations_branch_id` (`branch_id`),
  KEY `core_cashregister_cashier_id_2d509ab7_fk_crew_personal_user_id` (`cashier_id`),
  KEY `core_cashregister_printer_id_563cee6e_fk_core_printer_id` (`printer_id`),
  CONSTRAINT `core_cashregister_branch_id_b5f8b045_fk_locations_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `locations_branch` (`id`),
  CONSTRAINT `core_cashregister_cashier_id_2d509ab7_fk_crew_personal_user_id` FOREIGN KEY (`cashier_id`) REFERENCES `crew_personal` (`user_id`),
  CONSTRAINT `core_cashregister_printer_id_563cee6e_fk_core_printer_id` FOREIGN KEY (`printer_id`) REFERENCES `core_printer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_cashregister
-- ----------------------------
BEGIN;
INSERT INTO `core_cashregister` VALUES (1, 'CR-IC-TSB01-01', 'pending', '2022-02-24 17:17:02.000000', 8, 52, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for core_cashregistermovement
-- ----------------------------
DROP TABLE IF EXISTS `core_cashregistermovement`;
CREATE TABLE `core_cashregistermovement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(9) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `cash_register_id` bigint(20) NOT NULL,
  `voucher` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_cashregistermov_cash_register_id_787cd534_fk_core_cash` (`cash_register_id`),
  CONSTRAINT `core_cashregistermov_cash_register_id_787cd534_fk_core_cash` FOREIGN KEY (`cash_register_id`) REFERENCES `core_cashregister` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_cashregistermovement
-- ----------------------------
BEGIN;
INSERT INTO `core_cashregistermovement` VALUES (1, 'open', 5.00, '2022-02-25 18:12:01.571610', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (2, 'open', 5.00, '2022-02-25 18:24:01.955773', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (3, 'open', 3.00, '2022-02-25 18:25:07.316649', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (4, 'open', 3.00, '2022-02-25 18:27:05.614899', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (5, 'open', 5.00, '2022-02-25 18:28:58.205133', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (6, 'open', 6.00, '2022-02-25 18:34:18.712641', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (7, 'open', 10.00, '2022-02-25 18:35:15.766883', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (8, 'pending', NULL, '2022-02-25 18:57:09.941707', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (9, 'open', 2.00, '2022-02-25 18:57:17.768697', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (10, 'pending', NULL, '2022-02-28 12:04:53.851962', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (11, 'open', 30000000.00, '2022-02-28 12:05:04.686871', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (12, 'open', 30000000.00, '2022-02-28 12:27:57.694185', 1, NULL);
INSERT INTO `core_cashregistermovement` VALUES (13, 'pending', NULL, '2022-02-28 12:28:12.830269', 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for core_cashregisteroperation
-- ----------------------------
DROP TABLE IF EXISTS `core_cashregisteroperation`;
CREATE TABLE `core_cashregisteroperation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_type` varchar(4) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `cash_register_id` bigint(20) NOT NULL,
  `sale_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_cashregisterope_cash_register_id_656fcb0c_fk_core_cash` (`cash_register_id`),
  KEY `core_cashregisteroperation_sale_id_6119fbbd_fk_core_sale_id` (`sale_id`),
  CONSTRAINT `core_cashregisterope_cash_register_id_656fcb0c_fk_core_cash` FOREIGN KEY (`cash_register_id`) REFERENCES `core_cashregister` (`id`),
  CONSTRAINT `core_cashregisteroperation_sale_id_6119fbbd_fk_core_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `core_sale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_cashregisteroperation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for core_masterroute
-- ----------------------------
DROP TABLE IF EXISTS `core_masterroute`;
CREATE TABLE `core_masterroute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_masterroute
-- ----------------------------
BEGIN;
INSERT INTO `core_masterroute` VALUES (1, '', 'ANF - TEMUCO - VALD', 1);
INSERT INTO `core_masterroute` VALUES (2, '', 'COP-OVA-SCL', 1);
INSERT INTO `core_masterroute` VALUES (3, '', 'Pichilemu - Santiago', 1);
INSERT INTO `core_masterroute` VALUES (4, '', 'Santiago - Pichilemu', 1);
INSERT INTO `core_masterroute` VALUES (5, '', 'Santiago - Valdivia', 1);
INSERT INTO `core_masterroute` VALUES (6, '', 'SCL-OVA-COP', 1);
INSERT INTO `core_masterroute` VALUES (7, '', 'VALD- TCO- ANF', 1);
INSERT INTO `core_masterroute` VALUES (8, '', 'Valdivia  - Santiago', 1);
INSERT INTO `core_masterroute` VALUES (9, '001', 'prueba01 - prueba2', 1);
INSERT INTO `core_masterroute` VALUES (10, 'string', 'string', 1);
INSERT INTO `core_masterroute` VALUES (11, 'string', 'string', 1);
INSERT INTO `core_masterroute` VALUES (12, 'string', 'string', 1);
COMMIT;

-- ----------------------------
-- Table structure for core_masterroutemap
-- ----------------------------
DROP TABLE IF EXISTS `core_masterroutemap`;
CREATE TABLE `core_masterroutemap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `bus_stop_id` bigint(20) NOT NULL,
  `master_route_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique bus stop in master route` (`master_route_id`,`bus_stop_id`),
  KEY `core_masterroutemap_bus_stop_id_8bf21d3d_fk_locations_busstop_id` (`bus_stop_id`),
  CONSTRAINT `core_masterroutemap_bus_stop_id_8bf21d3d_fk_locations_busstop_id` FOREIGN KEY (`bus_stop_id`) REFERENCES `locations_busstop` (`id`),
  CONSTRAINT `core_masterroutemap_master_route_id_1b70d59e_fk_core_mast` FOREIGN KEY (`master_route_id`) REFERENCES `core_masterroute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_masterroutemap
-- ----------------------------
BEGIN;
INSERT INTO `core_masterroutemap` VALUES (1, 1, 1, 1, 1);
INSERT INTO `core_masterroutemap` VALUES (2, 2, 1, 7, 1);
INSERT INTO `core_masterroutemap` VALUES (3, 3, 1, 11, 1);
INSERT INTO `core_masterroutemap` VALUES (4, 4, 1, 20, 1);
INSERT INTO `core_masterroutemap` VALUES (5, 5, 1, 22, 1);
INSERT INTO `core_masterroutemap` VALUES (6, 6, 1, 51, 1);
INSERT INTO `core_masterroutemap` VALUES (7, 7, 1, 52, 1);
INSERT INTO `core_masterroutemap` VALUES (8, 8, 1, 60, 1);
INSERT INTO `core_masterroutemap` VALUES (9, 9, 1, 70, 1);
INSERT INTO `core_masterroutemap` VALUES (10, 10, 1, 88, 1);
INSERT INTO `core_masterroutemap` VALUES (11, 11, 1, 77, 1);
INSERT INTO `core_masterroutemap` VALUES (12, 12, 1, 68, 1);
INSERT INTO `core_masterroutemap` VALUES (13, 13, 1, 109, 1);
INSERT INTO `core_masterroutemap` VALUES (14, 14, 1, 69, 1);
INSERT INTO `core_masterroutemap` VALUES (15, 15, 1, 118, 1);
INSERT INTO `core_masterroutemap` VALUES (16, 1, 1, 1, 2);
INSERT INTO `core_masterroutemap` VALUES (17, 2, 1, 7, 2);
INSERT INTO `core_masterroutemap` VALUES (18, 3, 1, 11, 2);
INSERT INTO `core_masterroutemap` VALUES (19, 4, 1, 20, 2);
INSERT INTO `core_masterroutemap` VALUES (20, 5, 1, 40, 2);
INSERT INTO `core_masterroutemap` VALUES (21, 6, 1, 51, 2);
INSERT INTO `core_masterroutemap` VALUES (22, 1, 1, 68, 3);
INSERT INTO `core_masterroutemap` VALUES (23, 2, 1, 67, 3);
INSERT INTO `core_masterroutemap` VALUES (24, 3, 1, 51, 3);
INSERT INTO `core_masterroutemap` VALUES (25, 1, 1, 51, 4);
INSERT INTO `core_masterroutemap` VALUES (26, 2, 1, 67, 4);
INSERT INTO `core_masterroutemap` VALUES (27, 3, 1, 68, 4);
INSERT INTO `core_masterroutemap` VALUES (28, 1, 1, 51, 5);
INSERT INTO `core_masterroutemap` VALUES (29, 2, 1, 52, 5);
INSERT INTO `core_masterroutemap` VALUES (30, 3, 1, 60, 5);
INSERT INTO `core_masterroutemap` VALUES (31, 4, 1, 87, 5);
INSERT INTO `core_masterroutemap` VALUES (32, 5, 1, 108, 5);
INSERT INTO `core_masterroutemap` VALUES (33, 6, 1, 118, 5);
INSERT INTO `core_masterroutemap` VALUES (34, 1, 1, 51, 6);
INSERT INTO `core_masterroutemap` VALUES (35, 2, 1, 40, 6);
INSERT INTO `core_masterroutemap` VALUES (36, 3, 1, 20, 6);
INSERT INTO `core_masterroutemap` VALUES (37, 4, 1, 7, 6);
INSERT INTO `core_masterroutemap` VALUES (38, 5, 1, 1, 6);
INSERT INTO `core_masterroutemap` VALUES (39, 1, 1, 118, 7);
INSERT INTO `core_masterroutemap` VALUES (40, 2, 1, 69, 7);
INSERT INTO `core_masterroutemap` VALUES (41, 3, 1, 109, 7);
INSERT INTO `core_masterroutemap` VALUES (42, 4, 1, 68, 7);
INSERT INTO `core_masterroutemap` VALUES (43, 5, 1, 77, 7);
INSERT INTO `core_masterroutemap` VALUES (44, 6, 1, 88, 7);
INSERT INTO `core_masterroutemap` VALUES (45, 7, 1, 70, 7);
INSERT INTO `core_masterroutemap` VALUES (46, 8, 1, 60, 7);
INSERT INTO `core_masterroutemap` VALUES (47, 9, 1, 52, 7);
INSERT INTO `core_masterroutemap` VALUES (48, 10, 1, 51, 7);
INSERT INTO `core_masterroutemap` VALUES (49, 11, 1, 22, 7);
INSERT INTO `core_masterroutemap` VALUES (50, 12, 1, 20, 7);
INSERT INTO `core_masterroutemap` VALUES (51, 13, 1, 11, 7);
INSERT INTO `core_masterroutemap` VALUES (52, 14, 1, 7, 7);
INSERT INTO `core_masterroutemap` VALUES (53, 15, 1, 1, 7);
INSERT INTO `core_masterroutemap` VALUES (54, 1, 1, 118, 8);
INSERT INTO `core_masterroutemap` VALUES (55, 2, 1, 109, 8);
INSERT INTO `core_masterroutemap` VALUES (56, 3, 1, 51, 8);
INSERT INTO `core_masterroutemap` VALUES (57, 4, 1, 52, 8);
INSERT INTO `core_masterroutemap` VALUES (58, 1, 1, 8, 9);
INSERT INTO `core_masterroutemap` VALUES (59, 2, 1, 11, 9);
COMMIT;

-- ----------------------------
-- Table structure for core_masterroutestretch
-- ----------------------------
DROP TABLE IF EXISTS `core_masterroutestretch`;
CREATE TABLE `core_masterroutestretch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `duration` time(6) DEFAULT NULL,
  `distance` decimal(7,3) DEFAULT NULL,
  `end_bus_stop_id` bigint(20) NOT NULL,
  `master_route_id` bigint(20) NOT NULL,
  `start_bus_stop_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_masterroutestre_end_bus_stop_id_a687e258_fk_locations` (`end_bus_stop_id`),
  KEY `core_masterroutestre_master_route_id_db5b2204_fk_core_mast` (`master_route_id`),
  KEY `core_masterroutestre_start_bus_stop_id_bfdcc509_fk_locations` (`start_bus_stop_id`),
  CONSTRAINT `core_masterroutestre_end_bus_stop_id_a687e258_fk_locations` FOREIGN KEY (`end_bus_stop_id`) REFERENCES `locations_busstop` (`id`),
  CONSTRAINT `core_masterroutestre_master_route_id_db5b2204_fk_core_mast` FOREIGN KEY (`master_route_id`) REFERENCES `core_masterroute` (`id`),
  CONSTRAINT `core_masterroutestre_start_bus_stop_id_bfdcc509_fk_locations` FOREIGN KEY (`start_bus_stop_id`) REFERENCES `locations_busstop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_masterroutestretch
-- ----------------------------
BEGIN;
INSERT INTO `core_masterroutestretch` VALUES (1, 1, '00:00:00.000000', 0.000, 7, 1, 1);
INSERT INTO `core_masterroutestretch` VALUES (2, 2, '00:00:00.000000', 0.000, 11, 1, 7);
INSERT INTO `core_masterroutestretch` VALUES (3, 3, '00:00:00.000000', 0.000, 20, 1, 11);
INSERT INTO `core_masterroutestretch` VALUES (4, 4, '00:00:00.000000', 0.000, 22, 1, 20);
INSERT INTO `core_masterroutestretch` VALUES (5, 5, '00:00:00.000000', 0.000, 51, 1, 22);
INSERT INTO `core_masterroutestretch` VALUES (6, 6, '00:00:00.000000', 0.000, 52, 1, 51);
INSERT INTO `core_masterroutestretch` VALUES (7, 7, '00:00:00.000000', 0.000, 60, 1, 52);
INSERT INTO `core_masterroutestretch` VALUES (8, 8, '00:00:00.000000', 0.000, 70, 1, 60);
INSERT INTO `core_masterroutestretch` VALUES (9, 9, '00:00:00.000000', 0.000, 88, 1, 70);
INSERT INTO `core_masterroutestretch` VALUES (10, 10, '00:00:00.000000', 0.000, 77, 1, 88);
INSERT INTO `core_masterroutestretch` VALUES (11, 11, '00:00:00.000000', 0.000, 68, 1, 77);
INSERT INTO `core_masterroutestretch` VALUES (12, 12, '00:00:00.000000', 0.000, 109, 1, 68);
INSERT INTO `core_masterroutestretch` VALUES (13, 13, '00:00:00.000000', 0.000, 69, 1, 109);
INSERT INTO `core_masterroutestretch` VALUES (14, 14, '00:00:00.000000', 0.000, 118, 1, 69);
INSERT INTO `core_masterroutestretch` VALUES (15, 1, '00:00:00.000000', 0.000, 7, 2, 1);
INSERT INTO `core_masterroutestretch` VALUES (16, 2, '00:00:00.000000', 0.000, 11, 2, 7);
INSERT INTO `core_masterroutestretch` VALUES (17, 3, '00:00:00.000000', 0.000, 20, 2, 11);
INSERT INTO `core_masterroutestretch` VALUES (18, 4, '00:00:00.000000', 0.000, 40, 2, 20);
INSERT INTO `core_masterroutestretch` VALUES (19, 5, '00:00:00.000000', 0.000, 51, 2, 40);
INSERT INTO `core_masterroutestretch` VALUES (20, 1, '00:00:00.000000', 0.000, 67, 3, 68);
INSERT INTO `core_masterroutestretch` VALUES (21, 2, '00:00:00.000000', 0.000, 51, 3, 67);
INSERT INTO `core_masterroutestretch` VALUES (22, 1, '00:00:00.000000', 0.000, 67, 4, 51);
INSERT INTO `core_masterroutestretch` VALUES (23, 2, '00:00:00.000000', 0.000, 68, 4, 67);
INSERT INTO `core_masterroutestretch` VALUES (24, 1, '00:00:00.000000', 0.000, 52, 5, 51);
INSERT INTO `core_masterroutestretch` VALUES (25, 2, '00:00:00.000000', 0.000, 60, 5, 52);
INSERT INTO `core_masterroutestretch` VALUES (26, 3, '00:00:00.000000', 0.000, 87, 5, 60);
INSERT INTO `core_masterroutestretch` VALUES (27, 4, '00:00:00.000000', 0.000, 108, 5, 87);
INSERT INTO `core_masterroutestretch` VALUES (28, 5, '00:00:00.000000', 0.000, 118, 5, 108);
INSERT INTO `core_masterroutestretch` VALUES (29, 1, '00:00:00.000000', 0.000, 40, 6, 51);
INSERT INTO `core_masterroutestretch` VALUES (30, 2, '00:00:00.000000', 0.000, 20, 6, 40);
INSERT INTO `core_masterroutestretch` VALUES (31, 3, '00:00:00.000000', 0.000, 7, 6, 20);
INSERT INTO `core_masterroutestretch` VALUES (32, 4, '00:00:00.000000', 0.000, 1, 6, 7);
INSERT INTO `core_masterroutestretch` VALUES (33, 1, '00:00:00.000000', 0.000, 69, 7, 118);
INSERT INTO `core_masterroutestretch` VALUES (34, 2, '00:00:00.000000', 0.000, 109, 7, 69);
INSERT INTO `core_masterroutestretch` VALUES (35, 3, '00:00:00.000000', 0.000, 68, 7, 109);
INSERT INTO `core_masterroutestretch` VALUES (36, 4, '00:00:00.000000', 0.000, 77, 7, 68);
INSERT INTO `core_masterroutestretch` VALUES (37, 5, '00:00:00.000000', 0.000, 88, 7, 77);
INSERT INTO `core_masterroutestretch` VALUES (38, 6, '00:00:00.000000', 0.000, 70, 7, 88);
INSERT INTO `core_masterroutestretch` VALUES (39, 7, '00:00:00.000000', 0.000, 60, 7, 70);
INSERT INTO `core_masterroutestretch` VALUES (40, 8, '00:00:00.000000', 0.000, 52, 7, 60);
INSERT INTO `core_masterroutestretch` VALUES (41, 9, '00:00:00.000000', 0.000, 51, 7, 52);
INSERT INTO `core_masterroutestretch` VALUES (42, 10, '00:00:00.000000', 0.000, 22, 7, 51);
INSERT INTO `core_masterroutestretch` VALUES (43, 11, '00:00:00.000000', 0.000, 20, 7, 22);
INSERT INTO `core_masterroutestretch` VALUES (44, 12, '00:00:00.000000', 0.000, 11, 7, 20);
INSERT INTO `core_masterroutestretch` VALUES (45, 13, '00:00:00.000000', 0.000, 7, 7, 11);
INSERT INTO `core_masterroutestretch` VALUES (46, 14, '00:00:00.000000', 0.000, 1, 7, 7);
INSERT INTO `core_masterroutestretch` VALUES (47, 1, '00:00:00.000000', 0.000, 109, 8, 118);
INSERT INTO `core_masterroutestretch` VALUES (48, 2, '00:00:00.000000', 0.000, 51, 8, 109);
INSERT INTO `core_masterroutestretch` VALUES (49, 3, '00:00:00.000000', 0.000, 52, 8, 51);
INSERT INTO `core_masterroutestretch` VALUES (50, 0, '12:00:00.000000', 10.000, 16, 9, 8);
COMMIT;

-- ----------------------------
-- Table structure for core_masterroutestretchrate
-- ----------------------------
DROP TABLE IF EXISTS `core_masterroutestretchrate`;
CREATE TABLE `core_masterroutestretchrate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) DEFAULT NULL,
  `master_route_stretch_id` bigint(20) NOT NULL,
  `seat_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_masterroutestre_master_route_stretch_4eccbe29_fk_core_mast` (`master_route_stretch_id`),
  KEY `core_masterroutestre_seat_type_id_e168f844_fk_transport` (`seat_type_id`),
  CONSTRAINT `core_masterroutestre_master_route_stretch_4eccbe29_fk_core_mast` FOREIGN KEY (`master_route_stretch_id`) REFERENCES `core_masterroutestretch` (`id`),
  CONSTRAINT `core_masterroutestre_seat_type_id_e168f844_fk_transport` FOREIGN KEY (`seat_type_id`) REFERENCES `transportation_seattype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_masterroutestretchrate
-- ----------------------------
BEGIN;
INSERT INTO `core_masterroutestretchrate` VALUES (1, 500.00, 1, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (2, 500.00, 1, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (3, 500.00, 2, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (4, 500.00, 2, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (5, 500.00, 3, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (6, 500.00, 3, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (7, 500.00, 4, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (8, 500.00, 4, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (9, 500.00, 5, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (10, 500.00, 5, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (11, 500.00, 6, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (12, 500.00, 6, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (13, 500.00, 7, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (14, 500.00, 7, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (15, 500.00, 8, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (16, 500.00, 8, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (17, 500.00, 9, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (18, 500.00, 9, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (19, 500.00, 10, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (20, 500.00, 10, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (21, 500.00, 11, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (22, 500.00, 11, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (23, 500.00, 12, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (24, 500.00, 12, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (25, 500.00, 13, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (26, 500.00, 13, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (27, 500.00, 14, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (28, 500.00, 14, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (29, 500.00, 15, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (30, 500.00, 15, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (31, 500.00, 16, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (32, 500.00, 16, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (33, 500.00, 17, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (34, 500.00, 17, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (35, 500.00, 18, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (36, 500.00, 18, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (37, 500.00, 19, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (38, 500.00, 19, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (39, 500.00, 20, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (40, 500.00, 20, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (41, 500.00, 21, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (42, 500.00, 21, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (43, 500.00, 22, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (44, 500.00, 22, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (45, 500.00, 23, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (46, 500.00, 23, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (47, 500.00, 24, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (48, 500.00, 24, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (49, 500.00, 25, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (50, 500.00, 25, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (51, 500.00, 26, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (52, 500.00, 26, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (53, 500.00, 27, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (54, 500.00, 27, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (55, 500.00, 28, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (56, 500.00, 28, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (57, 500.00, 29, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (58, 500.00, 29, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (59, 500.00, 30, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (60, 500.00, 30, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (61, 500.00, 31, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (62, 500.00, 31, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (63, 500.00, 32, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (64, 500.00, 32, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (65, 500.00, 33, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (66, 500.00, 33, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (67, 500.00, 34, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (68, 500.00, 34, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (69, 500.00, 35, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (70, 500.00, 35, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (71, 500.00, 36, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (72, 500.00, 36, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (73, 500.00, 37, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (74, 500.00, 37, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (75, 500.00, 38, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (76, 500.00, 38, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (77, 500.00, 39, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (78, 500.00, 39, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (79, 500.00, 40, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (80, 500.00, 40, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (81, 500.00, 41, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (82, 500.00, 41, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (83, 500.00, 42, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (84, 500.00, 42, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (85, 500.00, 43, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (86, 500.00, 43, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (87, 500.00, 44, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (88, 500.00, 44, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (89, 500.00, 45, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (90, 500.00, 45, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (91, 500.00, 46, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (92, 500.00, 46, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (93, 500.00, 47, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (94, 500.00, 47, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (95, 500.00, 48, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (96, 500.00, 48, 2);
INSERT INTO `core_masterroutestretchrate` VALUES (97, 500.00, 49, 1);
INSERT INTO `core_masterroutestretchrate` VALUES (98, 500.00, 49, 2);
COMMIT;

-- ----------------------------
-- Table structure for core_passenger
-- ----------------------------
DROP TABLE IF EXISTS `core_passenger`;
CREATE TABLE `core_passenger` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `document_number` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `document_type` varchar(5) NOT NULL,
  `nationality_id` bigint(20) DEFAULT NULL,
  `date_of_birth` datetime(6) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `passenger_type` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_passenger_nationality_id_778ebf08_fk_core_pass` (`nationality_id`),
  CONSTRAINT `core_passenger_nationality_id_778ebf08_fk_core_pass` FOREIGN KEY (`nationality_id`) REFERENCES `core_passengernationality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_passenger
-- ----------------------------
BEGIN;
INSERT INTO `core_passenger` VALUES (1, 'Ignacio', 'Figueroa', '19186509-k', 'jfigueroa@linets.cl', '+56951386005', 'RUT', NULL, '1995-02-07 12:36:17.396000', 'M', 'adult');
INSERT INTO `core_passenger` VALUES (2, 'Ignacio', 'Figueroa', '19.186.509-k', 'ignacio.f.zuniga@gmail.com', '45345435', 'RUT', NULL, '1995-10-10 10:11:26.000000', 'M', 'adult');
INSERT INTO `core_passenger` VALUES (3, 'Israel', 'Castro', '18.695.756-3', 'a@a.com', '9898', 'RUT', NULL, '2022-02-08 14:18:20.000000', 'M', 'child');
COMMIT;

-- ----------------------------
-- Table structure for core_passengernationality
-- ----------------------------
DROP TABLE IF EXISTS `core_passengernationality`;
CREATE TABLE `core_passengernationality` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_passengernationality
-- ----------------------------
BEGIN;
INSERT INTO `core_passengernationality` VALUES (1, 'CHI', 'Chile');
INSERT INTO `core_passengernationality` VALUES (2, 'ARG', 'Argentina');
INSERT INTO `core_passengernationality` VALUES (3, 'BOL', 'Bolivia');
INSERT INTO `core_passengernationality` VALUES (4, 'PER', 'Peru');
INSERT INTO `core_passengernationality` VALUES (5, 'COL', 'Colombia');
INSERT INTO `core_passengernationality` VALUES (6, 'BRA', 'BRASIL');
INSERT INTO `core_passengernationality` VALUES (7, 'PAR', 'Paraguay');
INSERT INTO `core_passengernationality` VALUES (8, 'BRA', 'BRASIL');
INSERT INTO `core_passengernationality` VALUES (9, 'ECU', 'Ecuador');
INSERT INTO `core_passengernationality` VALUES (10, 'MEX', 'Mexico');
INSERT INTO `core_passengernationality` VALUES (11, 'VEN', 'Venezuela');
INSERT INTO `core_passengernationality` VALUES (12, 'OTR', 'Otro');
INSERT INTO `core_passengernationality` VALUES (13, 'MEX', 'Mexico');
INSERT INTO `core_passengernationality` VALUES (14, 'VEN', 'Venezuela');
INSERT INTO `core_passengernationality` VALUES (15, 'OTR', 'Otro');
COMMIT;

-- ----------------------------
-- Table structure for core_printer
-- ----------------------------
DROP TABLE IF EXISTS `core_printer`;
CREATE TABLE `core_printer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `total_prints` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_printer
-- ----------------------------
BEGIN;
INSERT INTO `core_printer` VALUES (1, 'impresora test icastro vendedor', 1000);
COMMIT;

-- ----------------------------
-- Table structure for core_ratetype
-- ----------------------------
DROP TABLE IF EXISTS `core_ratetype`;
CREATE TABLE `core_ratetype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `time_start` time(6) NOT NULL,
  `time_end` time(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_ratetype
-- ----------------------------
BEGIN;
INSERT INTO `core_ratetype` VALUES (1, 'Nocturnas', '00:36:14.000000', '06:00:00.000000');
INSERT INTO `core_ratetype` VALUES (2, 'Diurno', '06:00:00.000000', '18:00:00.000000');
COMMIT;

-- ----------------------------
-- Table structure for core_reservedseat
-- ----------------------------
DROP TABLE IF EXISTS `core_reservedseat`;
CREATE TABLE `core_reservedseat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_taken` tinyint(1) NOT NULL,
  `reserve_id` bigint(20) NOT NULL,
  `seat_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_reservedseat_reserve_id_43cb3143_fk_core_reservedseats_id` (`reserve_id`),
  KEY `core_reservedseat_seat_id_165336f2_fk_transport` (`seat_id`),
  CONSTRAINT `core_reservedseat_reserve_id_43cb3143_fk_core_reservedseats_id` FOREIGN KEY (`reserve_id`) REFERENCES `core_reservedseats` (`id`),
  CONSTRAINT `core_reservedseat_seat_id_165336f2_fk_transport` FOREIGN KEY (`seat_id`) REFERENCES `transportation_seat` (`component_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_reservedseat
-- ----------------------------
BEGIN;
INSERT INTO `core_reservedseat` VALUES (1, 1, 10, 53);
INSERT INTO `core_reservedseat` VALUES (2, 1, 11, 5);
INSERT INTO `core_reservedseat` VALUES (3, 1, 12, 10);
INSERT INTO `core_reservedseat` VALUES (4, 1, 13, 1);
INSERT INTO `core_reservedseat` VALUES (5, 1, 14, 2);
INSERT INTO `core_reservedseat` VALUES (7, 1, 16, 9);
INSERT INTO `core_reservedseat` VALUES (9, 1, 18, 10);
INSERT INTO `core_reservedseat` VALUES (10, 1, 19, 5);
INSERT INTO `core_reservedseat` VALUES (14, 1, 23, 53);
INSERT INTO `core_reservedseat` VALUES (15, 1, 24, 56);
INSERT INTO `core_reservedseat` VALUES (16, 1, 25, 1);
INSERT INTO `core_reservedseat` VALUES (17, 1, 25, 5);
INSERT INTO `core_reservedseat` VALUES (18, 1, 26, 53);
INSERT INTO `core_reservedseat` VALUES (19, 1, 27, 56);
INSERT INTO `core_reservedseat` VALUES (20, 1, 29, 53);
INSERT INTO `core_reservedseat` VALUES (21, 1, 29, 57);
INSERT INTO `core_reservedseat` VALUES (22, 1, 30, 56);
INSERT INTO `core_reservedseat` VALUES (23, 1, 30, 55);
INSERT INTO `core_reservedseat` VALUES (24, 1, 30, 9);
INSERT INTO `core_reservedseat` VALUES (25, 1, 31, 53);
INSERT INTO `core_reservedseat` VALUES (26, 1, 32, 56);
INSERT INTO `core_reservedseat` VALUES (27, 1, 33, 53);
INSERT INTO `core_reservedseat` VALUES (28, 1, 34, 54);
INSERT INTO `core_reservedseat` VALUES (29, 1, 35, 57);
INSERT INTO `core_reservedseat` VALUES (30, 1, 36, 59);
INSERT INTO `core_reservedseat` VALUES (31, 1, 37, 60);
INSERT INTO `core_reservedseat` VALUES (32, 1, 38, 56);
INSERT INTO `core_reservedseat` VALUES (33, 1, 39, 53);
INSERT INTO `core_reservedseat` VALUES (34, 1, 40, 53);
INSERT INTO `core_reservedseat` VALUES (35, 1, 41, 53);
INSERT INTO `core_reservedseat` VALUES (36, 1, 41, 54);
INSERT INTO `core_reservedseat` VALUES (37, 1, 42, 53);
INSERT INTO `core_reservedseat` VALUES (38, 1, 42, 54);
INSERT INTO `core_reservedseat` VALUES (39, 1, 42, 64);
INSERT INTO `core_reservedseat` VALUES (40, 1, 43, 2);
INSERT INTO `core_reservedseat` VALUES (41, 1, 44, 56);
INSERT INTO `core_reservedseat` VALUES (42, 1, 45, 56);
INSERT INTO `core_reservedseat` VALUES (43, 1, 46, 53);
INSERT INTO `core_reservedseat` VALUES (44, 1, 47, 56);
INSERT INTO `core_reservedseat` VALUES (45, 1, 48, 53);
INSERT INTO `core_reservedseat` VALUES (46, 1, 49, 52);
INSERT INTO `core_reservedseat` VALUES (47, 1, 50, 56);
INSERT INTO `core_reservedseat` VALUES (48, 1, 51, 56);
INSERT INTO `core_reservedseat` VALUES (49, 1, 52, 53);
INSERT INTO `core_reservedseat` VALUES (50, 1, 53, 56);
INSERT INTO `core_reservedseat` VALUES (51, 1, 54, 53);
INSERT INTO `core_reservedseat` VALUES (52, 1, 55, 56);
INSERT INTO `core_reservedseat` VALUES (53, 1, 56, 53);
INSERT INTO `core_reservedseat` VALUES (54, 1, 57, 54);
INSERT INTO `core_reservedseat` VALUES (55, 1, 58, 56);
INSERT INTO `core_reservedseat` VALUES (56, 1, 59, 56);
INSERT INTO `core_reservedseat` VALUES (57, 1, 60, 53);
INSERT INTO `core_reservedseat` VALUES (58, 1, 61, 54);
INSERT INTO `core_reservedseat` VALUES (59, 1, 62, 57);
INSERT INTO `core_reservedseat` VALUES (60, 1, 63, 53);
INSERT INTO `core_reservedseat` VALUES (61, 1, 64, 53);
INSERT INTO `core_reservedseat` VALUES (62, 1, 65, 53);
INSERT INTO `core_reservedseat` VALUES (63, 1, 66, 56);
INSERT INTO `core_reservedseat` VALUES (64, 1, 67, 56);
INSERT INTO `core_reservedseat` VALUES (65, 1, 68, 56);
INSERT INTO `core_reservedseat` VALUES (66, 1, 69, 53);
INSERT INTO `core_reservedseat` VALUES (67, 1, 70, 56);
INSERT INTO `core_reservedseat` VALUES (68, 1, 71, 59);
INSERT INTO `core_reservedseat` VALUES (69, 1, 72, 53);
INSERT INTO `core_reservedseat` VALUES (70, 1, 74, 56);
INSERT INTO `core_reservedseat` VALUES (71, 1, 75, 53);
INSERT INTO `core_reservedseat` VALUES (72, 1, 76, 56);
INSERT INTO `core_reservedseat` VALUES (73, 1, 77, 53);
INSERT INTO `core_reservedseat` VALUES (74, 1, 79, 53);
INSERT INTO `core_reservedseat` VALUES (75, 1, 79, 61);
INSERT INTO `core_reservedseat` VALUES (76, 1, 80, 56);
INSERT INTO `core_reservedseat` VALUES (77, 1, 80, 54);
INSERT INTO `core_reservedseat` VALUES (78, 1, 81, 57);
INSERT INTO `core_reservedseat` VALUES (79, 1, 82, 58);
INSERT INTO `core_reservedseat` VALUES (80, 1, 83, 53);
INSERT INTO `core_reservedseat` VALUES (81, 1, 84, 56);
INSERT INTO `core_reservedseat` VALUES (82, 1, 85, 56);
INSERT INTO `core_reservedseat` VALUES (83, 1, 86, 53);
INSERT INTO `core_reservedseat` VALUES (84, 1, 87, 54);
INSERT INTO `core_reservedseat` VALUES (85, 1, 88, 56);
INSERT INTO `core_reservedseat` VALUES (86, 1, 89, 53);
INSERT INTO `core_reservedseat` VALUES (87, 1, 90, 56);
INSERT INTO `core_reservedseat` VALUES (88, 1, 91, 56);
INSERT INTO `core_reservedseat` VALUES (89, 1, 92, 53);
INSERT INTO `core_reservedseat` VALUES (90, 1, 93, 56);
INSERT INTO `core_reservedseat` VALUES (91, 1, 93, 5);
INSERT INTO `core_reservedseat` VALUES (92, 1, 94, 3);
INSERT INTO `core_reservedseat` VALUES (93, 1, 94, 4);
INSERT INTO `core_reservedseat` VALUES (94, 1, 95, 56);
INSERT INTO `core_reservedseat` VALUES (95, 1, 95, 55);
INSERT INTO `core_reservedseat` VALUES (96, 1, 96, 53);
INSERT INTO `core_reservedseat` VALUES (97, 1, 96, 58);
INSERT INTO `core_reservedseat` VALUES (98, 1, 97, 54);
INSERT INTO `core_reservedseat` VALUES (99, 1, 97, 57);
INSERT INTO `core_reservedseat` VALUES (100, 1, 98, 59);
INSERT INTO `core_reservedseat` VALUES (101, 1, 99, 56);
INSERT INTO `core_reservedseat` VALUES (102, 1, 100, 53);
INSERT INTO `core_reservedseat` VALUES (103, 1, 101, 56);
INSERT INTO `core_reservedseat` VALUES (104, 1, 102, 53);
INSERT INTO `core_reservedseat` VALUES (105, 1, 103, 60);
INSERT INTO `core_reservedseat` VALUES (106, 1, 104, 56);
INSERT INTO `core_reservedseat` VALUES (107, 1, 105, 54);
INSERT INTO `core_reservedseat` VALUES (108, 1, 106, 57);
INSERT INTO `core_reservedseat` VALUES (109, 1, 107, 59);
INSERT INTO `core_reservedseat` VALUES (110, 1, 108, 53);
INSERT INTO `core_reservedseat` VALUES (111, 1, 108, 60);
INSERT INTO `core_reservedseat` VALUES (112, 1, 109, 56);
INSERT INTO `core_reservedseat` VALUES (113, 1, 110, 56);
INSERT INTO `core_reservedseat` VALUES (114, 1, 111, 56);
INSERT INTO `core_reservedseat` VALUES (115, 1, 112, 56);
INSERT INTO `core_reservedseat` VALUES (116, 1, 113, 1);
INSERT INTO `core_reservedseat` VALUES (117, 1, 114, 1);
INSERT INTO `core_reservedseat` VALUES (118, 1, 115, 1);
INSERT INTO `core_reservedseat` VALUES (119, 1, 116, 56);
INSERT INTO `core_reservedseat` VALUES (120, 1, 117, 1);
INSERT INTO `core_reservedseat` VALUES (121, 1, 118, 1);
INSERT INTO `core_reservedseat` VALUES (122, 1, 119, 2);
INSERT INTO `core_reservedseat` VALUES (123, 1, 120, 5);
INSERT INTO `core_reservedseat` VALUES (124, 1, 121, 57);
INSERT INTO `core_reservedseat` VALUES (125, 1, 122, 5);
INSERT INTO `core_reservedseat` VALUES (126, 1, 123, 56);
INSERT INTO `core_reservedseat` VALUES (127, 1, 124, 1);
INSERT INTO `core_reservedseat` VALUES (128, 1, 125, 56);
INSERT INTO `core_reservedseat` VALUES (129, 1, 126, 56);
INSERT INTO `core_reservedseat` VALUES (130, 1, 127, 56);
INSERT INTO `core_reservedseat` VALUES (131, 1, 128, 57);
INSERT INTO `core_reservedseat` VALUES (132, 1, 129, 56);
INSERT INTO `core_reservedseat` VALUES (133, 1, 130, 53);
INSERT INTO `core_reservedseat` VALUES (134, 1, 130, 59);
INSERT INTO `core_reservedseat` VALUES (135, 1, 131, 57);
INSERT INTO `core_reservedseat` VALUES (136, 1, 132, 58);
COMMIT;

-- ----------------------------
-- Table structure for core_reservedseats
-- ----------------------------
DROP TABLE IF EXISTS `core_reservedseats`;
CREATE TABLE `core_reservedseats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session` varchar(255) NOT NULL,
  `platform` varchar(8) NOT NULL,
  `current_datetime` datetime(6) NOT NULL,
  `service_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_reservedseats_service_id_6252f939_fk_core_service_id` (`service_id`),
  CONSTRAINT `core_reservedseats_service_id_6252f939_fk_core_service_id` FOREIGN KEY (`service_id`) REFERENCES `core_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_reservedseats
-- ----------------------------
BEGIN;
INSERT INTO `core_reservedseats` VALUES (10, 'string', 'web', '2022-01-11 14:09:49.637794', 35);
INSERT INTO `core_reservedseats` VALUES (11, 'a1a1a1a1a1', 'web', '2022-01-12 09:01:51.051948', 35);
INSERT INTO `core_reservedseats` VALUES (12, 'a1a1a1a1a1', 'web', '2022-01-12 10:08:56.017939', 35);
INSERT INTO `core_reservedseats` VALUES (13, 'a1a1a1a1a1', 'web', '2022-01-12 12:08:03.411223', 35);
INSERT INTO `core_reservedseats` VALUES (14, 'a1a1a1a1a1', 'web', '2022-01-12 12:21:31.935199', 35);
INSERT INTO `core_reservedseats` VALUES (16, 'a1a1a1a1a1', 'web', '2022-01-12 14:09:00.810834', 35);
INSERT INTO `core_reservedseats` VALUES (18, 'a1a1a1a1a1', 'web', '2022-01-12 14:13:06.212577', 35);
INSERT INTO `core_reservedseats` VALUES (19, 'session-example-string', 'web', '2022-01-12 14:37:45.857656', 35);
INSERT INTO `core_reservedseats` VALUES (23, 'session-example-string', 'web', '2022-01-13 10:05:04.681964', 35);
INSERT INTO `core_reservedseats` VALUES (24, 'session-example-string', 'web', '2022-01-13 10:05:29.486047', 35);
INSERT INTO `core_reservedseats` VALUES (25, 'session-example-string', 'web', '2022-01-13 10:06:13.719097', 35);
INSERT INTO `core_reservedseats` VALUES (26, 'session-example-string', 'web', '2022-01-13 16:17:59.590451', 35);
INSERT INTO `core_reservedseats` VALUES (27, 'session-example-string', 'web', '2022-01-13 16:18:16.807392', 35);
INSERT INTO `core_reservedseats` VALUES (29, 'session-example-string', 'web', '2022-01-14 10:01:05.171769', 35);
INSERT INTO `core_reservedseats` VALUES (30, 'session-example-string', 'web', '2022-01-14 11:24:35.758086', 35);
INSERT INTO `core_reservedseats` VALUES (31, 'session-example-string', 'web', '2022-01-14 11:26:51.891082', 35);
INSERT INTO `core_reservedseats` VALUES (32, 'session-example-string', 'web', '2022-01-14 14:02:32.283306', 35);
INSERT INTO `core_reservedseats` VALUES (33, 'session-example-string', 'web', '2022-01-14 14:06:23.027588', 35);
INSERT INTO `core_reservedseats` VALUES (34, 'session-example-string', 'web', '2022-01-14 14:08:05.373338', 35);
INSERT INTO `core_reservedseats` VALUES (35, 'session-example-string', 'web', '2022-01-14 14:09:04.665847', 35);
INSERT INTO `core_reservedseats` VALUES (36, 'session-example-string', 'web', '2022-01-14 14:10:40.343102', 35);
INSERT INTO `core_reservedseats` VALUES (37, 'session-example-string', 'web', '2022-01-14 14:11:22.343536', 35);
INSERT INTO `core_reservedseats` VALUES (38, 'session-example-string', 'web', '2022-01-14 14:17:39.060431', 35);
INSERT INTO `core_reservedseats` VALUES (39, 'session-example-string', 'web', '2022-01-14 14:20:18.978790', 35);
INSERT INTO `core_reservedseats` VALUES (40, 'session-example-string', 'web', '2022-01-27 18:01:31.232027', 35);
INSERT INTO `core_reservedseats` VALUES (41, 'session-example-string', 'web', '2022-01-28 11:05:43.858091', 35);
INSERT INTO `core_reservedseats` VALUES (42, 'session-example-string', 'web', '2022-01-28 11:17:01.415794', 35);
INSERT INTO `core_reservedseats` VALUES (43, 'session-example-string', 'web', '2022-02-02 13:37:10.736659', 279);
INSERT INTO `core_reservedseats` VALUES (44, 'session-example-string', 'web', '2022-02-04 12:57:28.349275', 279);
INSERT INTO `core_reservedseats` VALUES (45, 'session-example-string', 'web', '2022-02-07 09:57:34.892881', 279);
INSERT INTO `core_reservedseats` VALUES (46, 'session-example-string', 'web', '2022-02-07 10:00:25.895610', 279);
INSERT INTO `core_reservedseats` VALUES (47, 'session-example-string', 'web', '2022-02-07 10:40:29.638950', 279);
INSERT INTO `core_reservedseats` VALUES (48, 'session-example-string', 'web', '2022-02-07 10:45:08.972463', 279);
INSERT INTO `core_reservedseats` VALUES (49, 'session-example-string', 'web', '2022-02-07 10:51:06.569483', 279);
INSERT INTO `core_reservedseats` VALUES (50, 'session-example-string', 'web', '2022-02-07 14:22:41.268742', 279);
INSERT INTO `core_reservedseats` VALUES (51, 'session-example-string', 'web', '2022-02-07 14:41:55.945243', 279);
INSERT INTO `core_reservedseats` VALUES (52, 'session-example-string', 'web', '2022-02-07 14:51:16.017417', 279);
INSERT INTO `core_reservedseats` VALUES (53, 'session-example-string', 'web', '2022-02-07 14:55:25.691179', 279);
INSERT INTO `core_reservedseats` VALUES (54, 'session-example-string', 'web', '2022-02-07 15:31:18.051316', 279);
INSERT INTO `core_reservedseats` VALUES (55, 'session-example-string', 'web', '2022-02-07 18:07:36.535346', 279);
INSERT INTO `core_reservedseats` VALUES (56, 'session-example-string', 'web', '2022-02-07 18:11:59.984098', 279);
INSERT INTO `core_reservedseats` VALUES (57, 'session-example-string', 'web', '2022-02-07 18:14:02.883780', 279);
INSERT INTO `core_reservedseats` VALUES (58, 'session-example-string', 'web', '2022-02-07 18:30:12.734488', 279);
INSERT INTO `core_reservedseats` VALUES (59, 'session-example-string', 'web', '2022-02-08 10:32:40.717510', 279);
INSERT INTO `core_reservedseats` VALUES (60, 'session-example-string', 'web', '2022-02-08 10:33:33.623488', 279);
INSERT INTO `core_reservedseats` VALUES (61, 'session-example-string', 'web', '2022-02-08 10:34:33.652701', 279);
INSERT INTO `core_reservedseats` VALUES (62, 'session-example-string', 'web', '2022-02-08 10:37:08.709194', 279);
INSERT INTO `core_reservedseats` VALUES (63, 'session-example-string', 'web', '2022-02-08 11:29:48.412165', 279);
INSERT INTO `core_reservedseats` VALUES (64, 'session-example-string', 'web', '2022-02-08 13:00:51.835269', 279);
INSERT INTO `core_reservedseats` VALUES (65, 'session-example-string', 'web', '2022-02-08 14:55:06.707521', 279);
INSERT INTO `core_reservedseats` VALUES (66, 'session-example-string', 'web', '2022-02-08 15:09:00.893846', 279);
INSERT INTO `core_reservedseats` VALUES (67, 'session-example-string', 'web', '2022-02-08 16:04:51.919113', 279);
INSERT INTO `core_reservedseats` VALUES (68, 'session-example-string', 'web', '2022-02-09 11:00:13.655669', 279);
INSERT INTO `core_reservedseats` VALUES (69, 'session-example-string', 'web', '2022-02-09 11:06:57.514505', 279);
INSERT INTO `core_reservedseats` VALUES (70, 'session-example-string', 'web', '2022-02-09 11:10:49.429860', 279);
INSERT INTO `core_reservedseats` VALUES (71, 'session-example-string', 'web', '2022-02-09 11:13:13.926003', 279);
INSERT INTO `core_reservedseats` VALUES (72, 'session-example-string', 'web', '2022-02-09 11:19:59.937608', 279);
INSERT INTO `core_reservedseats` VALUES (74, 'session-example-string', 'web', '2022-02-09 12:33:47.149470', 279);
INSERT INTO `core_reservedseats` VALUES (75, 'session-example-string', 'web', '2022-02-09 12:35:56.770324', 279);
INSERT INTO `core_reservedseats` VALUES (76, 'session-example-string', 'web', '2022-02-09 13:01:27.335604', 279);
INSERT INTO `core_reservedseats` VALUES (77, 'session-example-string', 'web', '2022-02-09 13:03:59.742750', 279);
INSERT INTO `core_reservedseats` VALUES (79, 'session-example-string', 'web', '2022-02-09 15:14:26.475793', 279);
INSERT INTO `core_reservedseats` VALUES (80, 'session-example-string', 'web', '2022-02-09 15:22:20.164855', 279);
INSERT INTO `core_reservedseats` VALUES (81, 'session-example-string', 'web', '2022-02-09 15:35:35.150188', 279);
INSERT INTO `core_reservedseats` VALUES (82, 'session-example-string', 'web', '2022-02-09 15:41:39.512803', 279);
INSERT INTO `core_reservedseats` VALUES (83, 'session-example-string', 'web', '2022-02-10 17:32:53.510793', 279);
INSERT INTO `core_reservedseats` VALUES (84, 'session-example-string', 'web', '2022-02-10 17:34:26.314065', 279);
INSERT INTO `core_reservedseats` VALUES (85, 'session-example-string', 'web', '2022-02-14 16:00:55.980511', 279);
INSERT INTO `core_reservedseats` VALUES (86, 'session-example-string', 'web', '2022-02-14 16:02:20.556294', 279);
INSERT INTO `core_reservedseats` VALUES (87, 'session-example-string', 'web', '2022-02-14 16:09:10.551677', 279);
INSERT INTO `core_reservedseats` VALUES (88, 'session-example-string', 'web', '2022-02-14 16:13:35.132794', 279);
INSERT INTO `core_reservedseats` VALUES (89, 'session-example-string', 'web', '2022-02-14 16:14:53.449097', 279);
INSERT INTO `core_reservedseats` VALUES (90, 'session-example-string', 'web', '2022-02-16 14:34:03.061104', 279);
INSERT INTO `core_reservedseats` VALUES (91, 'session-example-string', 'web', '2022-02-16 14:37:35.867312', 279);
INSERT INTO `core_reservedseats` VALUES (92, 'session-example-string', 'web', '2022-02-17 14:13:43.095114', 279);
INSERT INTO `core_reservedseats` VALUES (93, 'session-example-string', 'web', '2022-02-18 11:40:06.063472', 279);
INSERT INTO `core_reservedseats` VALUES (94, 'session-example-string', 'web', '2022-02-18 12:22:14.925164', 218);
INSERT INTO `core_reservedseats` VALUES (95, 'session-example-string', 'web', '2022-02-21 11:13:25.370330', 279);
INSERT INTO `core_reservedseats` VALUES (96, 'session-example-string', 'web', '2022-02-21 11:15:30.257426', 279);
INSERT INTO `core_reservedseats` VALUES (97, 'session-example-string', 'web', '2022-02-21 11:17:45.475370', 279);
INSERT INTO `core_reservedseats` VALUES (98, 'session-example-string', 'web', '2022-02-21 11:19:36.572019', 279);
INSERT INTO `core_reservedseats` VALUES (99, 'session-example-string', 'web', '2022-02-21 11:24:42.483602', 279);
INSERT INTO `core_reservedseats` VALUES (100, 'session-example-string', 'web', '2022-02-22 12:01:53.333503', 35);
INSERT INTO `core_reservedseats` VALUES (101, 'session-example-string', 'web', '2022-02-22 15:26:14.285537', 61);
INSERT INTO `core_reservedseats` VALUES (102, 'session-example-string', 'web', '2022-02-22 15:30:28.661818', 35);
INSERT INTO `core_reservedseats` VALUES (103, 'session-example-string', 'web', '2022-02-23 14:09:31.721821', 279);
INSERT INTO `core_reservedseats` VALUES (104, 'session-example-string', 'web', '2022-02-23 14:11:12.474987', 62);
INSERT INTO `core_reservedseats` VALUES (105, 'session-example-string', 'web', '2022-02-23 14:16:54.611310', 35);
INSERT INTO `core_reservedseats` VALUES (106, 'session-example-string', 'web', '2022-02-23 14:16:54.739581', 923);
INSERT INTO `core_reservedseats` VALUES (107, 'session-example-string', 'web', '2022-02-23 14:17:20.466250', 923);
INSERT INTO `core_reservedseats` VALUES (108, 'session-example-string', 'web', '2022-02-23 14:25:47.788858', 923);
INSERT INTO `core_reservedseats` VALUES (109, 'session-example-string', 'web', '2022-02-23 14:35:37.366472', 279);
INSERT INTO `core_reservedseats` VALUES (110, 'session-example-string', 'web', '2022-02-23 14:58:01.587977', 62);
INSERT INTO `core_reservedseats` VALUES (111, 'session-example-string', 'web', '2022-02-24 10:19:29.670867', 923);
INSERT INTO `core_reservedseats` VALUES (112, 'session-example-string', 'web', '2022-02-24 12:53:28.019799', 923);
INSERT INTO `core_reservedseats` VALUES (113, 'session-example-string', 'web', '2022-02-28 17:37:30.224260', 218);
INSERT INTO `core_reservedseats` VALUES (114, 'session-example-string', 'web', '2022-02-28 17:57:33.883358', 218);
INSERT INTO `core_reservedseats` VALUES (115, 'session-example-string', 'web', '2022-02-28 17:59:57.976297', 401);
INSERT INTO `core_reservedseats` VALUES (116, 'session-example-string', 'web', '2022-03-01 10:27:37.595173', 923);
INSERT INTO `core_reservedseats` VALUES (117, 'session-example-string', 'web', '2022-03-01 10:30:11.820077', 218);
INSERT INTO `core_reservedseats` VALUES (118, 'session-example-string', 'web', '2022-03-01 13:20:40.027359', 218);
INSERT INTO `core_reservedseats` VALUES (119, 'session-example-string', 'web', '2022-03-01 13:30:01.931431', 401);
INSERT INTO `core_reservedseats` VALUES (120, 'session-example-string', 'web', '2022-03-01 14:06:45.659372', 218);
INSERT INTO `core_reservedseats` VALUES (121, 'session-example-string', 'web', '2022-03-01 14:12:17.002121', 923);
INSERT INTO `core_reservedseats` VALUES (122, 'session-example-string', 'web', '2022-03-01 14:13:22.548063', 401);
INSERT INTO `core_reservedseats` VALUES (123, 'session-example-string', 'web', '2022-03-01 14:15:03.050370', 923);
INSERT INTO `core_reservedseats` VALUES (124, 'session-example-string', 'web', '2022-03-01 14:29:08.529762', 401);
INSERT INTO `core_reservedseats` VALUES (125, 'session-example-string', 'web', '2022-03-01 16:49:19.869054', 923);
INSERT INTO `core_reservedseats` VALUES (126, 'session-example-string', 'web', '2022-03-01 17:08:34.552725', 493);
INSERT INTO `core_reservedseats` VALUES (127, 'session-example-string', 'web', '2022-03-02 11:17:52.742279', 923);
INSERT INTO `core_reservedseats` VALUES (128, 'session-example-string', 'web', '2022-03-02 11:24:56.183586', 923);
INSERT INTO `core_reservedseats` VALUES (129, 'session-example-string', 'web', '2022-03-02 11:43:20.058881', 279);
INSERT INTO `core_reservedseats` VALUES (130, 'session-example-string', 'web', '2022-03-02 11:50:56.803379', 923);
INSERT INTO `core_reservedseats` VALUES (131, 'session-example-string', 'web', '2022-03-02 11:58:10.366514', 923);
INSERT INTO `core_reservedseats` VALUES (132, 'session-example-string', 'web', '2022-03-02 11:59:09.960787', 923);
COMMIT;

-- ----------------------------
-- Table structure for core_route
-- ----------------------------
DROP TABLE IF EXISTS `core_route`;
CREATE TABLE `core_route` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `master_route_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_route_master_route_id_567f5b82_fk_core_masterroute_id` (`master_route_id`),
  CONSTRAINT `core_route_master_route_id_567f5b82_fk_core_masterroute_id` FOREIGN KEY (`master_route_id`) REFERENCES `core_masterroute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_route
-- ----------------------------
BEGIN;
INSERT INTO `core_route` VALUES (1, '01', 'Antofagasta --> Santiago', 1, 4);
INSERT INTO `core_route` VALUES (3, '001', 'Rancagua --> Copiapo', 1, 9);
INSERT INTO `core_route` VALUES (4, 'sda', 'Santiago --> Antofagasta', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for core_routemap
-- ----------------------------
DROP TABLE IF EXISTS `core_routemap`;
CREATE TABLE `core_routemap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `bus_stop_id` bigint(20) NOT NULL,
  `route_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique bus stop in route` (`route_id`,`bus_stop_id`),
  KEY `core_routemap_bus_stop_id_dae2da21_fk_locations_busstop_id` (`bus_stop_id`),
  CONSTRAINT `core_routemap_bus_stop_id_dae2da21_fk_locations_busstop_id` FOREIGN KEY (`bus_stop_id`) REFERENCES `locations_busstop` (`id`),
  CONSTRAINT `core_routemap_route_id_e6509321_fk_core_route_id` FOREIGN KEY (`route_id`) REFERENCES `core_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_routemap
-- ----------------------------
BEGIN;
INSERT INTO `core_routemap` VALUES (1, 0, 1, 5, 1);
INSERT INTO `core_routemap` VALUES (2, 0, 1, 20, 1);
INSERT INTO `core_routemap` VALUES (3, 0, 1, 1, 1);
INSERT INTO `core_routemap` VALUES (4, 0, 1, 53, 1);
INSERT INTO `core_routemap` VALUES (7, 0, 1, 63, 3);
INSERT INTO `core_routemap` VALUES (9, 0, 1, 8, 3);
INSERT INTO `core_routemap` VALUES (10, 0, 1, 51, 4);
INSERT INTO `core_routemap` VALUES (11, 0, 1, 1, 4);
COMMIT;

-- ----------------------------
-- Table structure for core_routestretch
-- ----------------------------
DROP TABLE IF EXISTS `core_routestretch`;
CREATE TABLE `core_routestretch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `master_route_stretch_id` bigint(20) NOT NULL,
  `route_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_routestretch_master_route_stretch_50f30622_fk_core_mast` (`master_route_stretch_id`),
  KEY `core_routestretch_route_id_b85f4b3f_fk_core_route_id` (`route_id`),
  CONSTRAINT `core_routestretch_master_route_stretch_50f30622_fk_core_mast` FOREIGN KEY (`master_route_stretch_id`) REFERENCES `core_masterroutestretch` (`id`),
  CONSTRAINT `core_routestretch_route_id_b85f4b3f_fk_core_route_id` FOREIGN KEY (`route_id`) REFERENCES `core_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_routestretch
-- ----------------------------
BEGIN;
INSERT INTO `core_routestretch` VALUES (2, 1, 15, 1);
COMMIT;

-- ----------------------------
-- Table structure for core_routestretchrate
-- ----------------------------
DROP TABLE IF EXISTS `core_routestretchrate`;
CREATE TABLE `core_routestretchrate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) DEFAULT NULL,
  `rate_type_id` bigint(20) NOT NULL,
  `route_stretch_id` bigint(20) NOT NULL,
  `seat_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_routestretchrate_rate_type_id_d7594c6e_fk_core_ratetype_id` (`rate_type_id`),
  KEY `core_routestretchrat_route_stretch_id_26d9ef0f_fk_core_rout` (`route_stretch_id`),
  KEY `core_routestretchrat_seat_type_id_538c0c13_fk_transport` (`seat_type_id`),
  CONSTRAINT `core_routestretchrat_route_stretch_id_26d9ef0f_fk_core_rout` FOREIGN KEY (`route_stretch_id`) REFERENCES `core_routestretch` (`id`),
  CONSTRAINT `core_routestretchrat_seat_type_id_538c0c13_fk_transport` FOREIGN KEY (`seat_type_id`) REFERENCES `transportation_seattype` (`id`),
  CONSTRAINT `core_routestretchrate_rate_type_id_d7594c6e_fk_core_ratetype_id` FOREIGN KEY (`rate_type_id`) REFERENCES `core_ratetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_routestretchrate
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for core_sale
-- ----------------------------
DROP TABLE IF EXISTS `core_sale`;
CREATE TABLE `core_sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `status` varchar(9) NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `cash_register_id` bigint(20) DEFAULT NULL,
  `buy_order` varchar(200) DEFAULT NULL,
  `cash_payment_type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_sale_cash_register_id_5f5056a9_fk_core_cashregister_id` (`cash_register_id`),
  KEY `core_sale_seller_id_c1146cb2_fk_crew_personal_user_id` (`seller_id`),
  CONSTRAINT `core_sale_cash_register_id_5f5056a9_fk_core_cashregister_id` FOREIGN KEY (`cash_register_id`) REFERENCES `core_cashregister` (`id`),
  CONSTRAINT `core_sale_seller_id_c1146cb2_fk_crew_personal_user_id` FOREIGN KEY (`seller_id`) REFERENCES `crew_personal` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_sale
-- ----------------------------
BEGIN;
INSERT INTO `core_sale` VALUES (1, '2022-02-11 16:55:12.916659', NULL, '2022-02-11 16:55:12.916277', 0, 'paid', NULL, NULL, 'c23e4c0dea86fd6879e12cdd6a', NULL);
INSERT INTO `core_sale` VALUES (2, '2022-02-11 17:49:48.360743', NULL, '2022-02-11 17:49:48.360292', 0, 'paid', NULL, NULL, 'cf562adb770d91000006a07732', NULL);
INSERT INTO `core_sale` VALUES (3, '2022-02-14 16:05:09.585602', NULL, '2022-02-14 16:05:09.585329', 0, 'paid', NULL, NULL, 'f8f0b9a101e556d0595492fc2c', NULL);
INSERT INTO `core_sale` VALUES (4, '2022-02-14 16:13:56.730320', NULL, '2022-02-14 16:13:56.730139', 0, 'pending', NULL, NULL, '7c7ed4e44e4f0085b48fa81e4e', NULL);
INSERT INTO `core_sale` VALUES (5, '2022-02-14 16:15:06.529882', NULL, '2022-02-14 16:15:06.529601', 0, 'pending', NULL, NULL, 'b496bae758be02b9580800843b', NULL);
INSERT INTO `core_sale` VALUES (6, '2022-02-17 14:13:56.102340', NULL, '2022-02-17 14:13:56.102057', 0, 'pending', NULL, NULL, '83714c28769e10bdaff517b3aa', NULL);
INSERT INTO `core_sale` VALUES (7, '2022-02-18 11:40:43.478381', NULL, '2022-02-18 11:40:43.478106', 0, 'pending', NULL, NULL, '81cacd922e909db3b353ef4c12', NULL);
INSERT INTO `core_sale` VALUES (8, '2022-02-21 11:14:20.086519', NULL, '2022-02-21 11:14:20.086262', 0, 'pending', NULL, NULL, '40c94a4d5834d4d13d23d0fe73', NULL);
INSERT INTO `core_sale` VALUES (9, '2022-02-21 11:16:25.301726', NULL, '2022-02-21 11:16:25.301547', 0, 'pending', NULL, NULL, '0f940f54888678920d7b490c13', NULL);
INSERT INTO `core_sale` VALUES (10, '2022-02-21 11:19:02.413142', NULL, '2022-02-21 11:19:02.412879', 0, 'pending', NULL, NULL, 'f033f8fdeaf9372b6ebb4490f1', NULL);
INSERT INTO `core_sale` VALUES (11, '2022-02-21 11:24:58.728070', NULL, '2022-02-21 11:24:58.727860', 0, 'pending', NULL, NULL, '36051208708f776cec2bbbe35d', NULL);
INSERT INTO `core_sale` VALUES (12, '2022-02-22 12:11:47.444397', NULL, '2022-02-22 12:11:47.444123', 0, 'pending', NULL, NULL, 'a1cc8aea441215f11e45948aa0', NULL);
INSERT INTO `core_sale` VALUES (13, '2022-03-01 13:28:06.824525', NULL, '2022-03-01 13:28:06.823973', 0, 'pending', NULL, NULL, '6185755b828bc99b927e52ae80', NULL);
INSERT INTO `core_sale` VALUES (14, '2022-03-01 14:13:45.378898', NULL, '2022-03-01 14:13:45.378609', 0, 'pending', NULL, NULL, '7338f6f0e53de5353db7931518', NULL);
INSERT INTO `core_sale` VALUES (15, '2022-03-01 16:49:31.536676', NULL, '2022-03-01 16:49:31.536450', 0, 'pending', NULL, NULL, '0965d1d127a3519b2483e95a6f', NULL);
INSERT INTO `core_sale` VALUES (16, '2022-03-01 17:08:53.397639', NULL, '2022-03-01 17:08:53.397455', 0, 'pending', NULL, NULL, 'f692326a77002d1414be38c945', NULL);
INSERT INTO `core_sale` VALUES (17, '2022-03-02 11:18:06.919060', NULL, '2022-03-02 11:18:06.918849', 0, 'pending', NULL, NULL, 'ee74bc98469cc38e60735ca5e2', NULL);
COMMIT;

-- ----------------------------
-- Table structure for core_sale_tickets
-- ----------------------------
DROP TABLE IF EXISTS `core_sale_tickets`;
CREATE TABLE `core_sale_tickets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) NOT NULL,
  `ticket_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_sale_tickets_sale_id_ticket_id_313f1bf1_uniq` (`sale_id`,`ticket_id`),
  KEY `core_sale_tickets_ticket_id_cc7f71bd_fk_core_ticket_id` (`ticket_id`),
  CONSTRAINT `core_sale_tickets_sale_id_f9790ff7_fk_core_sale_id` FOREIGN KEY (`sale_id`) REFERENCES `core_sale` (`id`),
  CONSTRAINT `core_sale_tickets_ticket_id_cc7f71bd_fk_core_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `core_ticket` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_sale_tickets
-- ----------------------------
BEGIN;
INSERT INTO `core_sale_tickets` VALUES (1, 1, 1);
INSERT INTO `core_sale_tickets` VALUES (2, 2, 2);
INSERT INTO `core_sale_tickets` VALUES (3, 3, 3);
INSERT INTO `core_sale_tickets` VALUES (4, 4, 4);
INSERT INTO `core_sale_tickets` VALUES (5, 5, 5);
INSERT INTO `core_sale_tickets` VALUES (6, 6, 6);
INSERT INTO `core_sale_tickets` VALUES (7, 7, 7);
INSERT INTO `core_sale_tickets` VALUES (8, 7, 8);
INSERT INTO `core_sale_tickets` VALUES (9, 8, 9);
INSERT INTO `core_sale_tickets` VALUES (10, 8, 10);
INSERT INTO `core_sale_tickets` VALUES (11, 9, 11);
INSERT INTO `core_sale_tickets` VALUES (12, 9, 12);
INSERT INTO `core_sale_tickets` VALUES (13, 10, 13);
INSERT INTO `core_sale_tickets` VALUES (14, 10, 14);
INSERT INTO `core_sale_tickets` VALUES (15, 11, 15);
INSERT INTO `core_sale_tickets` VALUES (16, 12, 16);
INSERT INTO `core_sale_tickets` VALUES (17, 13, 17);
INSERT INTO `core_sale_tickets` VALUES (18, 14, 18);
INSERT INTO `core_sale_tickets` VALUES (19, 15, 19);
INSERT INTO `core_sale_tickets` VALUES (20, 16, 20);
INSERT INTO `core_sale_tickets` VALUES (21, 17, 21);
COMMIT;

-- ----------------------------
-- Table structure for core_service
-- ----------------------------
DROP TABLE IF EXISTS `core_service`;
CREATE TABLE `core_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(9) NOT NULL,
  `datetime_publish` datetime(6) DEFAULT NULL,
  `datetime_from` datetime(6) NOT NULL,
  `datetime_to` datetime(6) NOT NULL,
  `service_type` varchar(9) NOT NULL,
  `bus_id` bigint(20) DEFAULT NULL,
  `route_id` bigint(20) NOT NULL,
  `renovation_months` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_service_bus_id_c0473aac_fk_transportation_bus_id` (`bus_id`),
  KEY `core_service_route_id_85a5515a_fk_core_route_id` (`route_id`),
  KEY `core_service_parent_id_72597d3d_fk_core_service_id` (`parent_id`),
  CONSTRAINT `core_service_bus_id_c0473aac_fk_transportation_bus_id` FOREIGN KEY (`bus_id`) REFERENCES `transportation_bus` (`id`),
  CONSTRAINT `core_service_parent_id_72597d3d_fk_core_service_id` FOREIGN KEY (`parent_id`) REFERENCES `core_service` (`id`),
  CONSTRAINT `core_service_route_id_85a5515a_fk_core_route_id` FOREIGN KEY (`route_id`) REFERENCES `core_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1075 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_service
-- ----------------------------
BEGIN;
INSERT INTO `core_service` VALUES (35, '85d', 'Antofagasta - Santiago', 'active', '2021-12-30 11:15:00.000000', '2021-12-27 20:34:00.000000', '2022-03-27 20:34:00.000000', 'short', 43, 1, NULL, NULL);
INSERT INTO `core_service` VALUES (61, NULL, 'TEST DATETIME (por defecto)', 'active', '2022-01-10 16:31:00.000000', '2022-01-10 20:30:00.000000', '2022-04-10 20:30:00.000000', 'short', 43, 1, NULL, NULL);
INSERT INTO `core_service` VALUES (62, NULL, 'TEST DATETIME (por defecto)2', 'active', NULL, '2022-01-20 16:30:00.000000', '2022-02-28 16:30:00.000000', 'short', 43, 1, NULL, NULL);
INSERT INTO `core_service` VALUES (63, '', 'Test sprint 4', 'active', '2022-01-13 13:48:00.000000', '2023-04-13 13:40:00.000000', '2023-09-13 13:40:00.000000', 'large', 45, 3, NULL, NULL);
INSERT INTO `core_service` VALUES (218, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-13 13:50:00.000000', 'large', 45, 1, NULL, NULL);
INSERT INTO `core_service` VALUES (219, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-17 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (220, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-24 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (221, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-31 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (222, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-07 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (223, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-14 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (224, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-21 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (225, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-28 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (226, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-07 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (227, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-19 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (228, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-26 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (229, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-02 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (230, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-09 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (231, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-16 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (232, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-23 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (233, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-02 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (234, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-09 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (235, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-21 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (236, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-28 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (237, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-04 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (238, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-11 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (239, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-18 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (240, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-25 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (241, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-04 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (242, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-11 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (243, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-16 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (244, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-23 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (245, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-30 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (246, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-06 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (247, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-13 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (248, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-20 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (249, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-27 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (250, '', 'Test sprint 4.1', 'active', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-06 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (251, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-13 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (252, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-14 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (253, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-15 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (254, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-18 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (255, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-20 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (256, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-22 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (257, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-25 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (258, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-27 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (259, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-01-29 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (260, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-01 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (261, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-03 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (262, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-05 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (263, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-08 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (264, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-10 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (265, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-12 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (266, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-15 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (267, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-17 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (268, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-19 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (269, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-22 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (270, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-24 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (271, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-02-26 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (272, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-01 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (273, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-03 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (274, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-05 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (275, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-08 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (276, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-10 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (277, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-12 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (278, '', 'Test sprint 4.1', 'disabled', '2022-01-13 13:55:00.000000', '2022-01-13 13:50:00.000000', '2022-03-13 13:50:00.000000', 'large', 45, 1, NULL, 218);
INSERT INTO `core_service` VALUES (279, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-13 17:43:00.000000', 'short', 43, 3, NULL, NULL);
INSERT INTO `core_service` VALUES (280, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-17 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (281, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-24 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (282, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-31 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (283, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-07 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (284, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-14 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (285, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-21 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (286, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-28 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (287, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-07 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (288, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-14 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (289, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-21 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (290, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-28 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (291, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-04 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (292, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-11 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (293, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-18 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (294, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-25 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (295, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-02 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (296, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-09 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (297, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-19 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (298, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-26 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (299, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-02 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (300, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-09 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (301, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-16 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (302, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-23 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (303, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-02 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (304, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-09 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (305, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-16 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (306, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-23 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (307, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-30 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (308, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-06 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (309, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-13 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (310, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-20 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (311, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-27 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (312, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-04 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (313, '', 'Test sprint 4 recarga', 'active', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-11 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (314, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-13 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (315, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-14 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (316, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-15 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (317, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-16 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (318, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-18 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (319, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-20 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (320, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-21 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (321, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-22 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (322, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-23 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (323, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-25 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (324, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-27 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (325, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-28 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (326, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-29 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (327, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-01-30 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (328, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-01 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (329, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-03 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (330, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-04 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (331, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-05 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (332, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-06 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (333, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-08 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (334, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-10 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (335, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-11 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (336, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-12 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (337, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-13 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (338, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-15 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (339, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-17 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (340, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-18 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (341, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-19 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (342, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-20 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (343, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-22 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (344, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-24 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (345, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-25 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (346, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-26 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (347, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-02-27 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (348, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-01 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (349, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-03 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (350, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-04 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (351, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-05 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (352, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-06 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (353, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-08 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (354, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-10 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (355, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-11 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (356, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-12 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (357, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-13 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (358, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-15 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (359, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-17 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (360, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-18 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (361, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-19 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (362, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-20 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (363, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-22 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (364, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-24 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (365, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-25 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (366, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-26 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (367, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-27 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (368, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-29 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (369, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-03-31 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (370, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-01 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (371, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-02 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (372, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-03 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (373, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-05 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (374, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-07 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (375, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-08 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (376, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-09 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (377, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-10 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (378, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-12 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (379, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-14 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (380, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-15 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (381, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-16 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (382, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-17 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (383, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-19 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (384, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-21 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (385, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-22 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (386, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-23 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (387, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-24 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (388, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-26 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (389, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-28 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (390, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-29 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (391, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-04-30 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (392, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-01 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (393, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-03 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (394, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-05 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (395, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-06 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (396, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-07 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (397, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-08 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (398, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-10 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (399, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-12 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (400, '', 'Test sprint 4 recarga', 'disabled', '2022-01-28 17:43:00.000000', '2022-01-13 17:43:00.000000', '2022-05-13 17:43:00.000000', 'short', 43, 3, NULL, 279);
INSERT INTO `core_service` VALUES (401, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-14 11:18:00.000000', 'large', 45, 1, NULL, NULL);
INSERT INTO `core_service` VALUES (402, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-17 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (403, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-24 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (404, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-31 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (405, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-07 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (406, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-14 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (407, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-21 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (408, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-28 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (409, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-07 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (410, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-14 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (411, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-21 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (412, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-28 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (413, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-04 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (414, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-11 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (415, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-21 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (416, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-28 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (417, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-04 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (418, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-11 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (419, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-18 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (420, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-25 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (421, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-04 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (422, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-11 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (423, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-18 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (424, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-25 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (425, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-01 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (426, '', 'Test sprint 4 final', 'active', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-08 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (427, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-14 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (428, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-15 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (429, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-16 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (430, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-18 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (431, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-19 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (432, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-20 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (433, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-22 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (434, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-23 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (435, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-25 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (436, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-26 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (437, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-27 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (438, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-29 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (439, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-01-30 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (440, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-01 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (441, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-02 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (442, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-03 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (443, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-05 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (444, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-06 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (445, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-08 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (446, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-09 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (447, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-10 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (448, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-12 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (449, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-13 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (450, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-15 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (451, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-16 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (452, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-17 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (453, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-19 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (454, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-20 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (455, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-22 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (456, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-23 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (457, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-24 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (458, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-26 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (459, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-02-27 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (460, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-01 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (461, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-02 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (462, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-03 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (463, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-05 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (464, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-06 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (465, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-08 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (466, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-09 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (467, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-10 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (468, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-12 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (469, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-13 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (470, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-15 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (471, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-16 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (472, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-17 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (473, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-19 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (474, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-20 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (475, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-22 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (476, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-23 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (477, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-24 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (478, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-26 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (479, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-27 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (480, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-29 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (481, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-30 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (482, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-03-31 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (483, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-02 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (484, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-03 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (485, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-05 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (486, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-06 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (487, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-07 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (488, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-09 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (489, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-10 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (490, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-12 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (491, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-13 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (492, '', 'Test sprint 4 final', 'disabled', '2022-01-14 11:19:00.000000', '2022-01-14 11:18:00.000000', '2022-04-14 11:18:00.000000', 'large', 45, 1, NULL, 401);
INSERT INTO `core_service` VALUES (493, '', 'asdfg', 'disabled', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-19 12:00:00.000000', 'short', 43, 1, NULL, NULL);
INSERT INTO `core_service` VALUES (494, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-24 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (495, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-31 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (496, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-07 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (497, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-14 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (498, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-21 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (499, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-28 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (500, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-07 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (501, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-14 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (502, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-21 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (503, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-28 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (504, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-04 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (505, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-11 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (506, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-18 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (507, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-25 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (508, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-01 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (509, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-08 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (510, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-15 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (511, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-22 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (512, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-01 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (513, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-08 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (514, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-15 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (515, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-22 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (516, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-29 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (517, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-05 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (518, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-12 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (519, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-26 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (520, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-02 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (521, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-09 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (522, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-16 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (523, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-23 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (524, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-02 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (525, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-09 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (526, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-16 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (527, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-23 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (528, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-30 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (529, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-06 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (530, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-13 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (531, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-27 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (532, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-03 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (533, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-10 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (534, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-17 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (535, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-24 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (536, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-03 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (537, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-10 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (538, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-17 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (539, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-24 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (540, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-31 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (541, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-07 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (542, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-14 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (543, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-28 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (544, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-04 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (545, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-11 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (546, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-18 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (547, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-25 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (548, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-04 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (549, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-11 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (550, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-18 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (551, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-25 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (552, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-01 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (553, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-08 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (554, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-15 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (555, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-29 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (556, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-05 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (557, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-12 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (558, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-19 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (559, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-26 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (560, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-05 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (561, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-12 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (562, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-19 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (563, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-26 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (564, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-02 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (565, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-09 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (566, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-16 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (567, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-23 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (568, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-30 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (569, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-06 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (570, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-13 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (571, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-20 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (572, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-02-27 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (573, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-06 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (574, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-13 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (575, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-20 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (576, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-03-27 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (577, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-03 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (578, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-10 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (579, '', 'asdfg', 'active', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-17 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (580, '', 'asdfg', 'disabled', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-19 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (581, '', 'asdfg', 'disabled', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-20 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (582, '', 'asdfg', 'disabled', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-21 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (583, '', 'asdfg', 'disabled', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-01-22 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (584, '', 'asdfg', 'disabled', '2022-01-19 00:00:00.000000', '2022-01-19 12:00:00.000000', '2022-04-19 12:00:00.000000', 'short', 43, 1, NULL, 493);
INSERT INTO `core_service` VALUES (585, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-25 17:00:00.000000', 'large', 43, 1, NULL, NULL);
INSERT INTO `core_service` VALUES (586, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-07-25 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (587, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-07-26 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (588, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-07-27 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (589, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-07-28 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (590, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-07-29 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (591, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-07-30 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (592, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-07-31 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (593, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-01 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (594, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-02 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (595, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-03 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (596, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-04 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (597, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-05 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (598, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-06 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (599, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-07 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (600, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-08 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (601, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-09 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (602, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-10 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (603, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-11 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (604, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-12 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (605, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-13 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (606, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-14 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (607, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-15 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (608, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-16 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (609, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-17 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (610, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-18 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (611, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-19 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (612, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-20 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (613, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-21 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (614, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-22 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (615, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-23 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (616, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-24 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (617, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-25 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (618, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-26 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (619, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-27 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (620, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-28 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (621, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-29 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (622, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-30 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (623, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-08-31 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (624, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-01 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (625, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-02 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (626, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-03 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (627, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-04 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (628, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-05 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (629, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-06 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (630, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-07 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (631, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-08 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (632, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-09 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (633, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-10 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (634, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-11 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (635, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-12 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (636, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-13 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (637, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-14 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (638, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-15 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (639, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-16 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (640, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-17 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (641, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-18 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (642, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-19 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (643, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-20 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (644, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-21 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (645, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-22 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (646, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-23 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (647, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-24 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (648, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-25 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (649, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-26 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (650, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-27 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (651, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-28 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (652, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-29 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (653, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-09-30 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (654, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-01 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (655, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-02 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (656, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-03 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (657, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-04 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (658, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-05 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (659, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-06 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (660, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-07 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (661, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-08 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (662, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-09 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (663, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-10 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (664, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-11 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (665, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-12 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (666, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-13 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (667, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-14 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (668, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-15 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (669, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-16 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (670, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-17 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (671, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-18 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (672, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-19 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (673, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-20 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (674, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-21 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (675, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-22 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (676, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-23 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (677, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-24 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (678, '', 'SAN VICENTE DE TAGUATAGUA', 'disabled', '2022-01-19 17:02:00.000000', '2022-07-25 17:00:00.000000', '2022-10-25 17:00:00.000000', 'large', 43, 1, NULL, 585);
INSERT INTO `core_service` VALUES (679, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-27 16:26:00.000000', 'large', 43, 1, NULL, NULL);
INSERT INTO `core_service` VALUES (680, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-01-31 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (681, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-07 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (682, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-14 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (683, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-21 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (684, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-28 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (685, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-07 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (686, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-14 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (687, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-21 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (688, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-28 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (689, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-04 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (690, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-11 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (691, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-18 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (692, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-25 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (693, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-02 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (694, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-09 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (695, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-16 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (696, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-23 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (697, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-02 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (698, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-09 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (699, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-16 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (700, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-23 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (701, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-30 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (702, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-06 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (703, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-13 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (704, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-20 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (705, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-04 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (706, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-11 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (707, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-18 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (708, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-25 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (709, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-04 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (710, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-11 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (711, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-18 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (712, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-25 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (713, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-01 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (714, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-08 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (715, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-15 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (716, '', 'CIC', 'active', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-22 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (717, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (718, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-01-28 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (719, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-01-29 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (720, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-01-30 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (721, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-01 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (722, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-03 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (723, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-05 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (724, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-06 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (725, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-08 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (726, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-10 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (727, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-12 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (728, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-13 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (729, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-15 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (730, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-17 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (731, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-19 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (732, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-20 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (733, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-22 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (734, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-24 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (735, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-26 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (736, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-02-27 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (737, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-01 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (738, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-03 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (739, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-05 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (740, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-06 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (741, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-08 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (742, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-10 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (743, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-12 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (744, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-13 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (745, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-15 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (746, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-17 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (747, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-19 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (748, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-20 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (749, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-22 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (750, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-24 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (751, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-26 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (752, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-27 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (753, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-29 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (754, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-03-31 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (755, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-02 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (756, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-03 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (757, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-05 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (758, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-07 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (759, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-09 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (760, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-10 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (761, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-12 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (762, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-14 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (763, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-16 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (764, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-17 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (765, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-19 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (766, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-21 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (767, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-23 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (768, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-24 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (769, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-26 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (770, '', 'CIC', 'disabled', '2022-01-27 16:26:00.000000', '2022-01-27 16:26:00.000000', '2022-04-27 16:26:00.000000', 'large', 43, 1, NULL, 679);
INSERT INTO `core_service` VALUES (771, '', 'aasdasd', 'disabled', '2022-02-17 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, NULL);
INSERT INTO `core_service` VALUES (772, '', 'aasdasd', 'active', '2022-02-21 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (773, '', 'aasdasd', 'active', '2022-02-28 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (774, '', 'aasdasd', 'active', '2022-03-07 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (775, '', 'aasdasd', 'active', '2022-03-14 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (776, '', 'aasdasd', 'active', '2022-03-21 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (777, '', 'aasdasd', 'active', '2022-03-28 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (778, '', 'aasdasd', 'active', '2022-04-04 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (779, '', 'aasdasd', 'active', '2022-04-11 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (780, '', 'aasdasd', 'active', '2022-04-18 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (781, '', 'aasdasd', 'active', '2022-04-25 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (782, '', 'aasdasd', 'active', '2022-05-02 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (783, '', 'aasdasd', 'active', '2022-05-09 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (784, '', 'aasdasd', 'active', '2022-05-16 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (785, '', 'aasdasd', 'active', '2022-05-23 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (786, '', 'aasdasd', 'active', '2022-05-30 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (787, '', 'aasdasd', 'active', '2022-06-06 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (788, '', 'aasdasd', 'active', '2022-06-13 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (789, '', 'aasdasd', 'active', '2022-06-20 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (790, '', 'aasdasd', 'active', '2022-06-27 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (791, '', 'aasdasd', 'active', '2022-07-04 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (792, '', 'aasdasd', 'active', '2022-07-11 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (793, '', 'aasdasd', 'active', '2022-02-23 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (794, '', 'aasdasd', 'active', '2022-03-02 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (795, '', 'aasdasd', 'active', '2022-03-09 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (796, '', 'aasdasd', 'active', '2022-03-16 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (797, '', 'aasdasd', 'active', '2022-03-23 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (798, '', 'aasdasd', 'active', '2022-03-30 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (799, '', 'aasdasd', 'active', '2022-04-06 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (800, '', 'aasdasd', 'active', '2022-04-13 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (801, '', 'aasdasd', 'active', '2022-04-20 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (802, '', 'aasdasd', 'active', '2022-04-27 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (803, '', 'aasdasd', 'active', '2022-05-04 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (804, '', 'aasdasd', 'active', '2022-05-11 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (805, '', 'aasdasd', 'active', '2022-05-18 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (806, '', 'aasdasd', 'active', '2022-05-25 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (807, '', 'aasdasd', 'active', '2022-06-01 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (808, '', 'aasdasd', 'active', '2022-06-08 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (809, '', 'aasdasd', 'active', '2022-06-15 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (810, '', 'aasdasd', 'active', '2022-06-22 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (811, '', 'aasdasd', 'active', '2022-06-29 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (812, '', 'aasdasd', 'active', '2022-07-06 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (813, '', 'aasdasd', 'active', '2022-07-13 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (814, '', 'aasdasd', 'active', '2022-02-20 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (815, '', 'aasdasd', 'active', '2022-02-27 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (816, '', 'aasdasd', 'active', '2022-03-06 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (817, '', 'aasdasd', 'active', '2022-03-13 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (818, '', 'aasdasd', 'active', '2022-03-20 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (819, '', 'aasdasd', 'active', '2022-03-27 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (820, '', 'aasdasd', 'active', '2022-04-03 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (821, '', 'aasdasd', 'active', '2022-04-10 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (822, '', 'aasdasd', 'active', '2022-04-17 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (823, '', 'aasdasd', 'active', '2022-04-24 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (824, '', 'aasdasd', 'active', '2022-05-01 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (825, '', 'aasdasd', 'active', '2022-05-08 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (826, '', 'aasdasd', 'active', '2022-05-15 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (827, '', 'aasdasd', 'active', '2022-05-22 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (828, '', 'aasdasd', 'active', '2022-05-29 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (829, '', 'aasdasd', 'active', '2022-06-05 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (830, '', 'aasdasd', 'active', '2022-06-12 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (831, '', 'aasdasd', 'active', '2022-06-19 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (832, '', 'aasdasd', 'active', '2022-06-26 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (833, '', 'aasdasd', 'active', '2022-07-03 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (834, '', 'aasdasd', 'active', '2022-07-10 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (835, '', 'aasdasd', 'disabled', '2022-02-17 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (836, '', 'aasdasd', 'disabled', '2022-02-18 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (837, '', 'aasdasd', 'disabled', '2022-02-19 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (838, '', 'aasdasd', 'disabled', '2022-02-22 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (839, '', 'aasdasd', 'disabled', '2022-02-24 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (840, '', 'aasdasd', 'disabled', '2022-02-25 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (841, '', 'aasdasd', 'disabled', '2022-02-26 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (842, '', 'aasdasd', 'disabled', '2022-03-01 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (843, '', 'aasdasd', 'disabled', '2022-03-03 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (844, '', 'aasdasd', 'disabled', '2022-03-04 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (845, '', 'aasdasd', 'disabled', '2022-03-05 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (846, '', 'aasdasd', 'disabled', '2022-03-08 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (847, '', 'aasdasd', 'disabled', '2022-03-10 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (848, '', 'aasdasd', 'disabled', '2022-03-11 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (849, '', 'aasdasd', 'disabled', '2022-03-12 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (850, '', 'aasdasd', 'disabled', '2022-03-15 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (851, '', 'aasdasd', 'disabled', '2022-03-17 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (852, '', 'aasdasd', 'disabled', '2022-03-18 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (853, '', 'aasdasd', 'disabled', '2022-03-19 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (854, '', 'aasdasd', 'disabled', '2022-03-22 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (855, '', 'aasdasd', 'disabled', '2022-03-24 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (856, '', 'aasdasd', 'disabled', '2022-03-25 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (857, '', 'aasdasd', 'disabled', '2022-03-26 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (858, '', 'aasdasd', 'disabled', '2022-03-29 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (859, '', 'aasdasd', 'disabled', '2022-03-31 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (860, '', 'aasdasd', 'disabled', '2022-04-01 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (861, '', 'aasdasd', 'disabled', '2022-04-02 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (862, '', 'aasdasd', 'disabled', '2022-04-05 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (863, '', 'aasdasd', 'disabled', '2022-04-07 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (864, '', 'aasdasd', 'disabled', '2022-04-08 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (865, '', 'aasdasd', 'disabled', '2022-04-09 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (866, '', 'aasdasd', 'disabled', '2022-04-12 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (867, '', 'aasdasd', 'disabled', '2022-04-14 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (868, '', 'aasdasd', 'disabled', '2022-04-15 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (869, '', 'aasdasd', 'disabled', '2022-04-16 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (870, '', 'aasdasd', 'disabled', '2022-04-19 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (871, '', 'aasdasd', 'disabled', '2022-04-21 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (872, '', 'aasdasd', 'disabled', '2022-04-22 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (873, '', 'aasdasd', 'disabled', '2022-04-23 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (874, '', 'aasdasd', 'disabled', '2022-04-26 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (875, '', 'aasdasd', 'disabled', '2022-04-28 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (876, '', 'aasdasd', 'disabled', '2022-04-29 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (877, '', 'aasdasd', 'disabled', '2022-04-30 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (878, '', 'aasdasd', 'disabled', '2022-05-03 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (879, '', 'aasdasd', 'disabled', '2022-05-05 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (880, '', 'aasdasd', 'disabled', '2022-05-06 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (881, '', 'aasdasd', 'disabled', '2022-05-07 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (882, '', 'aasdasd', 'disabled', '2022-05-10 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (883, '', 'aasdasd', 'disabled', '2022-05-12 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (884, '', 'aasdasd', 'disabled', '2022-05-13 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (885, '', 'aasdasd', 'disabled', '2022-05-14 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (886, '', 'aasdasd', 'disabled', '2022-05-17 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (887, '', 'aasdasd', 'disabled', '2022-05-19 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (888, '', 'aasdasd', 'disabled', '2022-05-20 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (889, '', 'aasdasd', 'disabled', '2022-05-21 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (890, '', 'aasdasd', 'disabled', '2022-05-24 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (891, '', 'aasdasd', 'disabled', '2022-05-26 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (892, '', 'aasdasd', 'disabled', '2022-05-27 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (893, '', 'aasdasd', 'disabled', '2022-05-28 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (894, '', 'aasdasd', 'disabled', '2022-05-31 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (895, '', 'aasdasd', 'disabled', '2022-06-02 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (896, '', 'aasdasd', 'disabled', '2022-06-03 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (897, '', 'aasdasd', 'disabled', '2022-06-04 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (898, '', 'aasdasd', 'disabled', '2022-06-07 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (899, '', 'aasdasd', 'disabled', '2022-06-09 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (900, '', 'aasdasd', 'disabled', '2022-06-10 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (901, '', 'aasdasd', 'disabled', '2022-06-11 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (902, '', 'aasdasd', 'disabled', '2022-06-14 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (903, '', 'aasdasd', 'disabled', '2022-06-16 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (904, '', 'aasdasd', 'disabled', '2022-06-17 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (905, '', 'aasdasd', 'disabled', '2022-06-18 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (906, '', 'aasdasd', 'disabled', '2022-06-21 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (907, '', 'aasdasd', 'disabled', '2022-06-23 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (908, '', 'aasdasd', 'disabled', '2022-06-24 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (909, '', 'aasdasd', 'disabled', '2022-06-25 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (910, '', 'aasdasd', 'disabled', '2022-06-28 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (911, '', 'aasdasd', 'disabled', '2022-06-30 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (912, '', 'aasdasd', 'disabled', '2022-07-01 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (913, '', 'aasdasd', 'disabled', '2022-07-02 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (914, '', 'aasdasd', 'disabled', '2022-07-05 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (915, '', 'aasdasd', 'disabled', '2022-07-07 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (916, '', 'aasdasd', 'disabled', '2022-07-08 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (917, '', 'aasdasd', 'disabled', '2022-07-09 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (918, '', 'aasdasd', 'disabled', '2022-07-12 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (919, '', 'aasdasd', 'disabled', '2022-07-14 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (920, '', 'aasdasd', 'disabled', '2022-07-15 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (921, '', 'aasdasd', 'disabled', '2022-07-16 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (922, '', 'aasdasd', 'disabled', '2022-07-17 13:21:00.000000', '2022-02-17 13:21:00.000000', '2022-07-17 13:21:00.000000', 'large', 43, 1, NULL, 771);
INSERT INTO `core_service` VALUES (923, '', 'Santiago - Antofagasta', 'disabled', '2022-02-01 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, NULL);
INSERT INTO `core_service` VALUES (924, '', 'Santiago - Antofagasta', 'active', '2022-02-07 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (925, '', 'Santiago - Antofagasta', 'active', '2022-02-14 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (926, '', 'Santiago - Antofagasta', 'active', '2022-02-21 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (927, '', 'Santiago - Antofagasta', 'active', '2022-02-28 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (928, '', 'Santiago - Antofagasta', 'active', '2022-03-07 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (929, '', 'Santiago - Antofagasta', 'active', '2022-03-14 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (930, '', 'Santiago - Antofagasta', 'active', '2022-03-21 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (931, '', 'Santiago - Antofagasta', 'active', '2022-03-28 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (932, '', 'Santiago - Antofagasta', 'active', '2022-04-04 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (933, '', 'Santiago - Antofagasta', 'active', '2022-04-11 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (934, '', 'Santiago - Antofagasta', 'active', '2022-04-18 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (935, '', 'Santiago - Antofagasta', 'active', '2022-04-25 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (936, '', 'Santiago - Antofagasta', 'active', '2022-05-02 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (937, '', 'Santiago - Antofagasta', 'active', '2022-05-09 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (938, '', 'Santiago - Antofagasta', 'active', '2022-05-16 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (939, '', 'Santiago - Antofagasta', 'active', '2022-05-23 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (940, '', 'Santiago - Antofagasta', 'active', '2022-05-30 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (941, '', 'Santiago - Antofagasta', 'active', '2022-06-06 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (942, '', 'Santiago - Antofagasta', 'active', '2022-06-13 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (943, '', 'Santiago - Antofagasta', 'active', '2022-06-20 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (944, '', 'Santiago - Antofagasta', 'active', '2022-06-27 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (945, '', 'Santiago - Antofagasta', 'active', '2022-02-09 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (946, '', 'Santiago - Antofagasta', 'active', '2022-02-16 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (947, '', 'Santiago - Antofagasta', 'active', '2022-02-23 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (948, '', 'Santiago - Antofagasta', 'active', '2022-03-02 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (949, '', 'Santiago - Antofagasta', 'active', '2022-03-09 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (950, '', 'Santiago - Antofagasta', 'active', '2022-03-16 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (951, '', 'Santiago - Antofagasta', 'active', '2022-03-23 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (952, '', 'Santiago - Antofagasta', 'active', '2022-03-30 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (953, '', 'Santiago - Antofagasta', 'active', '2022-04-06 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (954, '', 'Santiago - Antofagasta', 'active', '2022-04-13 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (955, '', 'Santiago - Antofagasta', 'active', '2022-04-20 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (956, '', 'Santiago - Antofagasta', 'active', '2022-04-27 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (957, '', 'Santiago - Antofagasta', 'active', '2022-05-04 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (958, '', 'Santiago - Antofagasta', 'active', '2022-05-11 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (959, '', 'Santiago - Antofagasta', 'active', '2022-05-18 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (960, '', 'Santiago - Antofagasta', 'active', '2022-05-25 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (961, '', 'Santiago - Antofagasta', 'active', '2022-06-01 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (962, '', 'Santiago - Antofagasta', 'active', '2022-06-08 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (963, '', 'Santiago - Antofagasta', 'active', '2022-06-15 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (964, '', 'Santiago - Antofagasta', 'active', '2022-06-22 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (965, '', 'Santiago - Antofagasta', 'active', '2022-06-29 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (966, '', 'Santiago - Antofagasta', 'active', '2022-02-08 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (967, '', 'Santiago - Antofagasta', 'active', '2022-02-15 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (968, '', 'Santiago - Antofagasta', 'active', '2022-02-22 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (969, '', 'Santiago - Antofagasta', 'active', '2022-03-01 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (970, '', 'Santiago - Antofagasta', 'active', '2022-03-08 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (971, '', 'Santiago - Antofagasta', 'active', '2022-03-15 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (972, '', 'Santiago - Antofagasta', 'active', '2022-03-22 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (973, '', 'Santiago - Antofagasta', 'active', '2022-03-29 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (974, '', 'Santiago - Antofagasta', 'active', '2022-04-05 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (975, '', 'Santiago - Antofagasta', 'active', '2022-04-12 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (976, '', 'Santiago - Antofagasta', 'active', '2022-04-19 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (977, '', 'Santiago - Antofagasta', 'active', '2022-04-26 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (978, '', 'Santiago - Antofagasta', 'active', '2022-05-03 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (979, '', 'Santiago - Antofagasta', 'active', '2022-05-10 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (980, '', 'Santiago - Antofagasta', 'active', '2022-05-17 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (981, '', 'Santiago - Antofagasta', 'active', '2022-05-24 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (982, '', 'Santiago - Antofagasta', 'active', '2022-05-31 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (983, '', 'Santiago - Antofagasta', 'active', '2022-06-07 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (984, '', 'Santiago - Antofagasta', 'active', '2022-06-14 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (985, '', 'Santiago - Antofagasta', 'active', '2022-06-21 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (986, '', 'Santiago - Antofagasta', 'active', '2022-06-28 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (987, '', 'Santiago - Antofagasta', 'active', '2022-02-11 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (988, '', 'Santiago - Antofagasta', 'active', '2022-02-18 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (989, '', 'Santiago - Antofagasta', 'active', '2022-02-25 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (990, '', 'Santiago - Antofagasta', 'active', '2022-03-04 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (991, '', 'Santiago - Antofagasta', 'active', '2022-03-11 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (992, '', 'Santiago - Antofagasta', 'active', '2022-03-18 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (993, '', 'Santiago - Antofagasta', 'active', '2022-03-25 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (994, '', 'Santiago - Antofagasta', 'active', '2022-04-01 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (995, '', 'Santiago - Antofagasta', 'active', '2022-04-08 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (996, '', 'Santiago - Antofagasta', 'active', '2022-04-15 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (997, '', 'Santiago - Antofagasta', 'active', '2022-04-22 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (998, '', 'Santiago - Antofagasta', 'active', '2022-04-29 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (999, '', 'Santiago - Antofagasta', 'active', '2022-05-06 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1000, '', 'Santiago - Antofagasta', 'active', '2022-05-13 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1001, '', 'Santiago - Antofagasta', 'active', '2022-05-20 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1002, '', 'Santiago - Antofagasta', 'active', '2022-05-27 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1003, '', 'Santiago - Antofagasta', 'active', '2022-06-03 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1004, '', 'Santiago - Antofagasta', 'active', '2022-06-10 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1005, '', 'Santiago - Antofagasta', 'active', '2022-06-17 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1006, '', 'Santiago - Antofagasta', 'active', '2022-06-24 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1007, '', 'Santiago - Antofagasta', 'active', '2022-02-12 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1008, '', 'Santiago - Antofagasta', 'active', '2022-02-19 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1009, '', 'Santiago - Antofagasta', 'active', '2022-02-26 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1010, '', 'Santiago - Antofagasta', 'active', '2022-03-05 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1011, '', 'Santiago - Antofagasta', 'active', '2022-03-12 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1012, '', 'Santiago - Antofagasta', 'active', '2022-03-19 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1013, '', 'Santiago - Antofagasta', 'active', '2022-03-26 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1014, '', 'Santiago - Antofagasta', 'active', '2022-04-02 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1015, '', 'Santiago - Antofagasta', 'active', '2022-04-09 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1016, '', 'Santiago - Antofagasta', 'active', '2022-04-16 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1017, '', 'Santiago - Antofagasta', 'active', '2022-04-23 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1018, '', 'Santiago - Antofagasta', 'active', '2022-04-30 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1019, '', 'Santiago - Antofagasta', 'active', '2022-05-07 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1020, '', 'Santiago - Antofagasta', 'active', '2022-05-14 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1021, '', 'Santiago - Antofagasta', 'active', '2022-05-21 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1022, '', 'Santiago - Antofagasta', 'active', '2022-05-28 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1023, '', 'Santiago - Antofagasta', 'active', '2022-06-04 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1024, '', 'Santiago - Antofagasta', 'active', '2022-06-11 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1025, '', 'Santiago - Antofagasta', 'active', '2022-06-18 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1026, '', 'Santiago - Antofagasta', 'active', '2022-06-25 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1027, '', 'Santiago - Antofagasta', 'active', '2022-02-06 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1028, '', 'Santiago - Antofagasta', 'active', '2022-02-13 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1029, '', 'Santiago - Antofagasta', 'active', '2022-02-20 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1030, '', 'Santiago - Antofagasta', 'active', '2022-02-27 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1031, '', 'Santiago - Antofagasta', 'active', '2022-03-06 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1032, '', 'Santiago - Antofagasta', 'active', '2022-03-13 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1033, '', 'Santiago - Antofagasta', 'active', '2022-03-20 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1034, '', 'Santiago - Antofagasta', 'active', '2022-03-27 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1035, '', 'Santiago - Antofagasta', 'active', '2022-04-03 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1036, '', 'Santiago - Antofagasta', 'active', '2022-04-10 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1037, '', 'Santiago - Antofagasta', 'active', '2022-04-17 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1038, '', 'Santiago - Antofagasta', 'active', '2022-04-24 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1039, '', 'Santiago - Antofagasta', 'active', '2022-05-01 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1040, '', 'Santiago - Antofagasta', 'active', '2022-05-08 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1041, '', 'Santiago - Antofagasta', 'active', '2022-05-15 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1042, '', 'Santiago - Antofagasta', 'active', '2022-05-22 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1043, '', 'Santiago - Antofagasta', 'active', '2022-05-29 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1044, '', 'Santiago - Antofagasta', 'active', '2022-06-05 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1045, '', 'Santiago - Antofagasta', 'active', '2022-06-12 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1046, '', 'Santiago - Antofagasta', 'active', '2022-06-19 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1047, '', 'Santiago - Antofagasta', 'active', '2022-06-26 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1048, '', 'Santiago - Antofagasta', 'active', '2022-02-10 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1049, '', 'Santiago - Antofagasta', 'active', '2022-02-17 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1050, '', 'Santiago - Antofagasta', 'active', '2022-02-24 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1051, '', 'Santiago - Antofagasta', 'active', '2022-03-03 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1052, '', 'Santiago - Antofagasta', 'active', '2022-03-10 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1053, '', 'Santiago - Antofagasta', 'active', '2022-03-17 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1054, '', 'Santiago - Antofagasta', 'active', '2022-03-24 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1055, '', 'Santiago - Antofagasta', 'active', '2022-03-31 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1056, '', 'Santiago - Antofagasta', 'active', '2022-04-07 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1057, '', 'Santiago - Antofagasta', 'active', '2022-04-14 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1058, '', 'Santiago - Antofagasta', 'active', '2022-04-21 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1059, '', 'Santiago - Antofagasta', 'active', '2022-04-28 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1060, '', 'Santiago - Antofagasta', 'active', '2022-05-05 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1061, '', 'Santiago - Antofagasta', 'active', '2022-05-12 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1062, '', 'Santiago - Antofagasta', 'active', '2022-05-19 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1063, '', 'Santiago - Antofagasta', 'active', '2022-05-26 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1064, '', 'Santiago - Antofagasta', 'active', '2022-06-02 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1065, '', 'Santiago - Antofagasta', 'active', '2022-06-09 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1066, '', 'Santiago - Antofagasta', 'active', '2022-06-16 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1067, '', 'Santiago - Antofagasta', 'active', '2022-06-23 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1068, '', 'Santiago - Antofagasta', 'active', '2022-06-30 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1069, '', 'Santiago - Antofagasta', 'disabled', '2022-02-01 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1070, '', 'Santiago - Antofagasta', 'disabled', '2022-02-02 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1071, '', 'Santiago - Antofagasta', 'disabled', '2022-02-03 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1072, '', 'Santiago - Antofagasta', 'disabled', '2022-02-04 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1073, '', 'Santiago - Antofagasta', 'disabled', '2022-02-05 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
INSERT INTO `core_service` VALUES (1074, '', 'Santiago - Antofagasta', 'disabled', '2022-07-01 14:15:00.000000', '2022-02-01 14:15:00.000000', '2022-07-01 14:15:00.000000', 'large', 43, 4, NULL, 923);
COMMIT;

-- ----------------------------
-- Table structure for core_service_assistants
-- ----------------------------
DROP TABLE IF EXISTS `core_service_assistants`;
CREATE TABLE `core_service_assistants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) NOT NULL,
  `personal_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_service_assistants_service_id_personal_id_5ba6fb8d_uniq` (`service_id`,`personal_id`),
  KEY `core_service_assista_personal_id_7792b7de_fk_crew_pers` (`personal_id`),
  CONSTRAINT `core_service_assista_personal_id_7792b7de_fk_crew_pers` FOREIGN KEY (`personal_id`) REFERENCES `crew_personal` (`user_id`),
  CONSTRAINT `core_service_assistants_service_id_7fdf78ff_fk_core_service_id` FOREIGN KEY (`service_id`) REFERENCES `core_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1341 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_service_assistants
-- ----------------------------
BEGIN;
INSERT INTO `core_service_assistants` VALUES (21, 35, 52);
INSERT INTO `core_service_assistants` VALUES (22, 35, 54);
INSERT INTO `core_service_assistants` VALUES (53, 61, 52);
INSERT INTO `core_service_assistants` VALUES (54, 62, 40);
INSERT INTO `core_service_assistants` VALUES (55, 63, 49);
INSERT INTO `core_service_assistants` VALUES (210, 218, 51);
INSERT INTO `core_service_assistants` VALUES (211, 219, 51);
INSERT INTO `core_service_assistants` VALUES (212, 220, 51);
INSERT INTO `core_service_assistants` VALUES (213, 221, 51);
INSERT INTO `core_service_assistants` VALUES (214, 222, 51);
INSERT INTO `core_service_assistants` VALUES (215, 223, 51);
INSERT INTO `core_service_assistants` VALUES (216, 224, 51);
INSERT INTO `core_service_assistants` VALUES (217, 225, 51);
INSERT INTO `core_service_assistants` VALUES (218, 226, 51);
INSERT INTO `core_service_assistants` VALUES (219, 227, 51);
INSERT INTO `core_service_assistants` VALUES (220, 228, 51);
INSERT INTO `core_service_assistants` VALUES (221, 229, 51);
INSERT INTO `core_service_assistants` VALUES (222, 230, 51);
INSERT INTO `core_service_assistants` VALUES (223, 231, 51);
INSERT INTO `core_service_assistants` VALUES (224, 232, 51);
INSERT INTO `core_service_assistants` VALUES (225, 233, 51);
INSERT INTO `core_service_assistants` VALUES (226, 234, 51);
INSERT INTO `core_service_assistants` VALUES (227, 235, 51);
INSERT INTO `core_service_assistants` VALUES (228, 236, 51);
INSERT INTO `core_service_assistants` VALUES (229, 237, 51);
INSERT INTO `core_service_assistants` VALUES (230, 238, 51);
INSERT INTO `core_service_assistants` VALUES (231, 239, 51);
INSERT INTO `core_service_assistants` VALUES (232, 240, 51);
INSERT INTO `core_service_assistants` VALUES (233, 241, 51);
INSERT INTO `core_service_assistants` VALUES (234, 242, 51);
INSERT INTO `core_service_assistants` VALUES (235, 243, 51);
INSERT INTO `core_service_assistants` VALUES (236, 244, 51);
INSERT INTO `core_service_assistants` VALUES (237, 245, 51);
INSERT INTO `core_service_assistants` VALUES (238, 246, 51);
INSERT INTO `core_service_assistants` VALUES (239, 247, 51);
INSERT INTO `core_service_assistants` VALUES (240, 248, 51);
INSERT INTO `core_service_assistants` VALUES (241, 249, 51);
INSERT INTO `core_service_assistants` VALUES (242, 250, 51);
INSERT INTO `core_service_assistants` VALUES (243, 251, 51);
INSERT INTO `core_service_assistants` VALUES (244, 252, 51);
INSERT INTO `core_service_assistants` VALUES (245, 253, 51);
INSERT INTO `core_service_assistants` VALUES (246, 254, 51);
INSERT INTO `core_service_assistants` VALUES (247, 255, 51);
INSERT INTO `core_service_assistants` VALUES (248, 256, 51);
INSERT INTO `core_service_assistants` VALUES (249, 257, 51);
INSERT INTO `core_service_assistants` VALUES (250, 258, 51);
INSERT INTO `core_service_assistants` VALUES (251, 259, 51);
INSERT INTO `core_service_assistants` VALUES (252, 260, 51);
INSERT INTO `core_service_assistants` VALUES (253, 261, 51);
INSERT INTO `core_service_assistants` VALUES (254, 262, 51);
INSERT INTO `core_service_assistants` VALUES (255, 263, 51);
INSERT INTO `core_service_assistants` VALUES (256, 264, 51);
INSERT INTO `core_service_assistants` VALUES (257, 265, 51);
INSERT INTO `core_service_assistants` VALUES (258, 266, 51);
INSERT INTO `core_service_assistants` VALUES (259, 267, 51);
INSERT INTO `core_service_assistants` VALUES (260, 268, 51);
INSERT INTO `core_service_assistants` VALUES (261, 269, 51);
INSERT INTO `core_service_assistants` VALUES (262, 270, 51);
INSERT INTO `core_service_assistants` VALUES (263, 271, 51);
INSERT INTO `core_service_assistants` VALUES (264, 272, 51);
INSERT INTO `core_service_assistants` VALUES (265, 273, 51);
INSERT INTO `core_service_assistants` VALUES (266, 274, 51);
INSERT INTO `core_service_assistants` VALUES (267, 275, 51);
INSERT INTO `core_service_assistants` VALUES (268, 276, 51);
INSERT INTO `core_service_assistants` VALUES (269, 277, 51);
INSERT INTO `core_service_assistants` VALUES (270, 278, 51);
INSERT INTO `core_service_assistants` VALUES (271, 279, 52);
INSERT INTO `core_service_assistants` VALUES (272, 279, 56);
INSERT INTO `core_service_assistants` VALUES (273, 280, 52);
INSERT INTO `core_service_assistants` VALUES (274, 280, 56);
INSERT INTO `core_service_assistants` VALUES (275, 281, 52);
INSERT INTO `core_service_assistants` VALUES (276, 281, 56);
INSERT INTO `core_service_assistants` VALUES (277, 282, 52);
INSERT INTO `core_service_assistants` VALUES (278, 282, 56);
INSERT INTO `core_service_assistants` VALUES (279, 283, 52);
INSERT INTO `core_service_assistants` VALUES (280, 283, 56);
INSERT INTO `core_service_assistants` VALUES (281, 284, 52);
INSERT INTO `core_service_assistants` VALUES (282, 284, 56);
INSERT INTO `core_service_assistants` VALUES (283, 285, 52);
INSERT INTO `core_service_assistants` VALUES (284, 285, 56);
INSERT INTO `core_service_assistants` VALUES (285, 286, 52);
INSERT INTO `core_service_assistants` VALUES (286, 286, 56);
INSERT INTO `core_service_assistants` VALUES (287, 287, 52);
INSERT INTO `core_service_assistants` VALUES (288, 287, 56);
INSERT INTO `core_service_assistants` VALUES (289, 288, 52);
INSERT INTO `core_service_assistants` VALUES (290, 288, 56);
INSERT INTO `core_service_assistants` VALUES (291, 289, 52);
INSERT INTO `core_service_assistants` VALUES (292, 289, 56);
INSERT INTO `core_service_assistants` VALUES (293, 290, 52);
INSERT INTO `core_service_assistants` VALUES (294, 290, 56);
INSERT INTO `core_service_assistants` VALUES (295, 291, 52);
INSERT INTO `core_service_assistants` VALUES (296, 291, 56);
INSERT INTO `core_service_assistants` VALUES (297, 292, 52);
INSERT INTO `core_service_assistants` VALUES (298, 292, 56);
INSERT INTO `core_service_assistants` VALUES (299, 293, 52);
INSERT INTO `core_service_assistants` VALUES (300, 293, 56);
INSERT INTO `core_service_assistants` VALUES (301, 294, 52);
INSERT INTO `core_service_assistants` VALUES (302, 294, 56);
INSERT INTO `core_service_assistants` VALUES (303, 295, 52);
INSERT INTO `core_service_assistants` VALUES (304, 295, 56);
INSERT INTO `core_service_assistants` VALUES (305, 296, 52);
INSERT INTO `core_service_assistants` VALUES (306, 296, 56);
INSERT INTO `core_service_assistants` VALUES (307, 297, 52);
INSERT INTO `core_service_assistants` VALUES (308, 297, 56);
INSERT INTO `core_service_assistants` VALUES (309, 298, 52);
INSERT INTO `core_service_assistants` VALUES (310, 298, 56);
INSERT INTO `core_service_assistants` VALUES (311, 299, 52);
INSERT INTO `core_service_assistants` VALUES (312, 299, 56);
INSERT INTO `core_service_assistants` VALUES (313, 300, 52);
INSERT INTO `core_service_assistants` VALUES (314, 300, 56);
INSERT INTO `core_service_assistants` VALUES (315, 301, 52);
INSERT INTO `core_service_assistants` VALUES (316, 301, 56);
INSERT INTO `core_service_assistants` VALUES (317, 302, 52);
INSERT INTO `core_service_assistants` VALUES (318, 302, 56);
INSERT INTO `core_service_assistants` VALUES (319, 303, 52);
INSERT INTO `core_service_assistants` VALUES (320, 303, 56);
INSERT INTO `core_service_assistants` VALUES (321, 304, 52);
INSERT INTO `core_service_assistants` VALUES (322, 304, 56);
INSERT INTO `core_service_assistants` VALUES (323, 305, 52);
INSERT INTO `core_service_assistants` VALUES (324, 305, 56);
INSERT INTO `core_service_assistants` VALUES (325, 306, 52);
INSERT INTO `core_service_assistants` VALUES (326, 306, 56);
INSERT INTO `core_service_assistants` VALUES (327, 307, 52);
INSERT INTO `core_service_assistants` VALUES (328, 307, 56);
INSERT INTO `core_service_assistants` VALUES (329, 308, 52);
INSERT INTO `core_service_assistants` VALUES (330, 308, 56);
INSERT INTO `core_service_assistants` VALUES (331, 309, 52);
INSERT INTO `core_service_assistants` VALUES (332, 309, 56);
INSERT INTO `core_service_assistants` VALUES (333, 310, 52);
INSERT INTO `core_service_assistants` VALUES (334, 310, 56);
INSERT INTO `core_service_assistants` VALUES (335, 311, 52);
INSERT INTO `core_service_assistants` VALUES (336, 311, 56);
INSERT INTO `core_service_assistants` VALUES (337, 312, 52);
INSERT INTO `core_service_assistants` VALUES (338, 312, 56);
INSERT INTO `core_service_assistants` VALUES (339, 313, 52);
INSERT INTO `core_service_assistants` VALUES (340, 313, 56);
INSERT INTO `core_service_assistants` VALUES (341, 314, 52);
INSERT INTO `core_service_assistants` VALUES (342, 314, 56);
INSERT INTO `core_service_assistants` VALUES (343, 315, 52);
INSERT INTO `core_service_assistants` VALUES (344, 315, 56);
INSERT INTO `core_service_assistants` VALUES (345, 316, 52);
INSERT INTO `core_service_assistants` VALUES (346, 316, 56);
INSERT INTO `core_service_assistants` VALUES (347, 317, 52);
INSERT INTO `core_service_assistants` VALUES (348, 317, 56);
INSERT INTO `core_service_assistants` VALUES (349, 318, 52);
INSERT INTO `core_service_assistants` VALUES (350, 318, 56);
INSERT INTO `core_service_assistants` VALUES (351, 319, 52);
INSERT INTO `core_service_assistants` VALUES (352, 319, 56);
INSERT INTO `core_service_assistants` VALUES (353, 320, 52);
INSERT INTO `core_service_assistants` VALUES (354, 320, 56);
INSERT INTO `core_service_assistants` VALUES (355, 321, 52);
INSERT INTO `core_service_assistants` VALUES (356, 321, 56);
INSERT INTO `core_service_assistants` VALUES (357, 322, 52);
INSERT INTO `core_service_assistants` VALUES (358, 322, 56);
INSERT INTO `core_service_assistants` VALUES (359, 323, 52);
INSERT INTO `core_service_assistants` VALUES (360, 323, 56);
INSERT INTO `core_service_assistants` VALUES (361, 324, 52);
INSERT INTO `core_service_assistants` VALUES (362, 324, 56);
INSERT INTO `core_service_assistants` VALUES (363, 325, 52);
INSERT INTO `core_service_assistants` VALUES (364, 325, 56);
INSERT INTO `core_service_assistants` VALUES (365, 326, 52);
INSERT INTO `core_service_assistants` VALUES (366, 326, 56);
INSERT INTO `core_service_assistants` VALUES (367, 327, 52);
INSERT INTO `core_service_assistants` VALUES (368, 327, 56);
INSERT INTO `core_service_assistants` VALUES (369, 328, 52);
INSERT INTO `core_service_assistants` VALUES (370, 328, 56);
INSERT INTO `core_service_assistants` VALUES (371, 329, 52);
INSERT INTO `core_service_assistants` VALUES (372, 329, 56);
INSERT INTO `core_service_assistants` VALUES (373, 330, 52);
INSERT INTO `core_service_assistants` VALUES (374, 330, 56);
INSERT INTO `core_service_assistants` VALUES (375, 331, 52);
INSERT INTO `core_service_assistants` VALUES (376, 331, 56);
INSERT INTO `core_service_assistants` VALUES (377, 332, 52);
INSERT INTO `core_service_assistants` VALUES (378, 332, 56);
INSERT INTO `core_service_assistants` VALUES (379, 333, 52);
INSERT INTO `core_service_assistants` VALUES (380, 333, 56);
INSERT INTO `core_service_assistants` VALUES (381, 334, 52);
INSERT INTO `core_service_assistants` VALUES (382, 334, 56);
INSERT INTO `core_service_assistants` VALUES (383, 335, 52);
INSERT INTO `core_service_assistants` VALUES (384, 335, 56);
INSERT INTO `core_service_assistants` VALUES (385, 336, 52);
INSERT INTO `core_service_assistants` VALUES (386, 336, 56);
INSERT INTO `core_service_assistants` VALUES (387, 337, 52);
INSERT INTO `core_service_assistants` VALUES (388, 337, 56);
INSERT INTO `core_service_assistants` VALUES (389, 338, 52);
INSERT INTO `core_service_assistants` VALUES (390, 338, 56);
INSERT INTO `core_service_assistants` VALUES (391, 339, 52);
INSERT INTO `core_service_assistants` VALUES (392, 339, 56);
INSERT INTO `core_service_assistants` VALUES (393, 340, 52);
INSERT INTO `core_service_assistants` VALUES (394, 340, 56);
INSERT INTO `core_service_assistants` VALUES (395, 341, 52);
INSERT INTO `core_service_assistants` VALUES (396, 341, 56);
INSERT INTO `core_service_assistants` VALUES (397, 342, 52);
INSERT INTO `core_service_assistants` VALUES (398, 342, 56);
INSERT INTO `core_service_assistants` VALUES (399, 343, 52);
INSERT INTO `core_service_assistants` VALUES (400, 343, 56);
INSERT INTO `core_service_assistants` VALUES (401, 344, 52);
INSERT INTO `core_service_assistants` VALUES (402, 344, 56);
INSERT INTO `core_service_assistants` VALUES (403, 345, 52);
INSERT INTO `core_service_assistants` VALUES (404, 345, 56);
INSERT INTO `core_service_assistants` VALUES (405, 346, 52);
INSERT INTO `core_service_assistants` VALUES (406, 346, 56);
INSERT INTO `core_service_assistants` VALUES (407, 347, 52);
INSERT INTO `core_service_assistants` VALUES (408, 347, 56);
INSERT INTO `core_service_assistants` VALUES (409, 348, 52);
INSERT INTO `core_service_assistants` VALUES (410, 348, 56);
INSERT INTO `core_service_assistants` VALUES (411, 349, 52);
INSERT INTO `core_service_assistants` VALUES (412, 349, 56);
INSERT INTO `core_service_assistants` VALUES (413, 350, 52);
INSERT INTO `core_service_assistants` VALUES (414, 350, 56);
INSERT INTO `core_service_assistants` VALUES (415, 351, 52);
INSERT INTO `core_service_assistants` VALUES (416, 351, 56);
INSERT INTO `core_service_assistants` VALUES (417, 352, 52);
INSERT INTO `core_service_assistants` VALUES (418, 352, 56);
INSERT INTO `core_service_assistants` VALUES (419, 353, 52);
INSERT INTO `core_service_assistants` VALUES (420, 353, 56);
INSERT INTO `core_service_assistants` VALUES (421, 354, 52);
INSERT INTO `core_service_assistants` VALUES (422, 354, 56);
INSERT INTO `core_service_assistants` VALUES (423, 355, 52);
INSERT INTO `core_service_assistants` VALUES (424, 355, 56);
INSERT INTO `core_service_assistants` VALUES (425, 356, 52);
INSERT INTO `core_service_assistants` VALUES (426, 356, 56);
INSERT INTO `core_service_assistants` VALUES (427, 357, 52);
INSERT INTO `core_service_assistants` VALUES (428, 357, 56);
INSERT INTO `core_service_assistants` VALUES (429, 358, 52);
INSERT INTO `core_service_assistants` VALUES (430, 358, 56);
INSERT INTO `core_service_assistants` VALUES (431, 359, 52);
INSERT INTO `core_service_assistants` VALUES (432, 359, 56);
INSERT INTO `core_service_assistants` VALUES (433, 360, 52);
INSERT INTO `core_service_assistants` VALUES (434, 360, 56);
INSERT INTO `core_service_assistants` VALUES (435, 361, 52);
INSERT INTO `core_service_assistants` VALUES (436, 361, 56);
INSERT INTO `core_service_assistants` VALUES (437, 362, 52);
INSERT INTO `core_service_assistants` VALUES (438, 362, 56);
INSERT INTO `core_service_assistants` VALUES (439, 363, 52);
INSERT INTO `core_service_assistants` VALUES (440, 363, 56);
INSERT INTO `core_service_assistants` VALUES (441, 364, 52);
INSERT INTO `core_service_assistants` VALUES (442, 364, 56);
INSERT INTO `core_service_assistants` VALUES (443, 365, 52);
INSERT INTO `core_service_assistants` VALUES (444, 365, 56);
INSERT INTO `core_service_assistants` VALUES (445, 366, 52);
INSERT INTO `core_service_assistants` VALUES (446, 366, 56);
INSERT INTO `core_service_assistants` VALUES (447, 367, 52);
INSERT INTO `core_service_assistants` VALUES (448, 367, 56);
INSERT INTO `core_service_assistants` VALUES (449, 368, 52);
INSERT INTO `core_service_assistants` VALUES (450, 368, 56);
INSERT INTO `core_service_assistants` VALUES (451, 369, 52);
INSERT INTO `core_service_assistants` VALUES (452, 369, 56);
INSERT INTO `core_service_assistants` VALUES (453, 370, 52);
INSERT INTO `core_service_assistants` VALUES (454, 370, 56);
INSERT INTO `core_service_assistants` VALUES (455, 371, 52);
INSERT INTO `core_service_assistants` VALUES (456, 371, 56);
INSERT INTO `core_service_assistants` VALUES (457, 372, 52);
INSERT INTO `core_service_assistants` VALUES (458, 372, 56);
INSERT INTO `core_service_assistants` VALUES (459, 373, 52);
INSERT INTO `core_service_assistants` VALUES (460, 373, 56);
INSERT INTO `core_service_assistants` VALUES (461, 374, 52);
INSERT INTO `core_service_assistants` VALUES (462, 374, 56);
INSERT INTO `core_service_assistants` VALUES (463, 375, 52);
INSERT INTO `core_service_assistants` VALUES (464, 375, 56);
INSERT INTO `core_service_assistants` VALUES (465, 376, 52);
INSERT INTO `core_service_assistants` VALUES (466, 376, 56);
INSERT INTO `core_service_assistants` VALUES (467, 377, 52);
INSERT INTO `core_service_assistants` VALUES (468, 377, 56);
INSERT INTO `core_service_assistants` VALUES (469, 378, 52);
INSERT INTO `core_service_assistants` VALUES (470, 378, 56);
INSERT INTO `core_service_assistants` VALUES (471, 379, 52);
INSERT INTO `core_service_assistants` VALUES (472, 379, 56);
INSERT INTO `core_service_assistants` VALUES (473, 380, 52);
INSERT INTO `core_service_assistants` VALUES (474, 380, 56);
INSERT INTO `core_service_assistants` VALUES (475, 381, 52);
INSERT INTO `core_service_assistants` VALUES (476, 381, 56);
INSERT INTO `core_service_assistants` VALUES (477, 382, 52);
INSERT INTO `core_service_assistants` VALUES (478, 382, 56);
INSERT INTO `core_service_assistants` VALUES (479, 383, 52);
INSERT INTO `core_service_assistants` VALUES (480, 383, 56);
INSERT INTO `core_service_assistants` VALUES (481, 384, 52);
INSERT INTO `core_service_assistants` VALUES (482, 384, 56);
INSERT INTO `core_service_assistants` VALUES (483, 385, 52);
INSERT INTO `core_service_assistants` VALUES (484, 385, 56);
INSERT INTO `core_service_assistants` VALUES (485, 386, 52);
INSERT INTO `core_service_assistants` VALUES (486, 386, 56);
INSERT INTO `core_service_assistants` VALUES (487, 387, 52);
INSERT INTO `core_service_assistants` VALUES (488, 387, 56);
INSERT INTO `core_service_assistants` VALUES (489, 388, 52);
INSERT INTO `core_service_assistants` VALUES (490, 388, 56);
INSERT INTO `core_service_assistants` VALUES (491, 389, 52);
INSERT INTO `core_service_assistants` VALUES (492, 389, 56);
INSERT INTO `core_service_assistants` VALUES (493, 390, 52);
INSERT INTO `core_service_assistants` VALUES (494, 390, 56);
INSERT INTO `core_service_assistants` VALUES (495, 391, 52);
INSERT INTO `core_service_assistants` VALUES (496, 391, 56);
INSERT INTO `core_service_assistants` VALUES (497, 392, 52);
INSERT INTO `core_service_assistants` VALUES (498, 392, 56);
INSERT INTO `core_service_assistants` VALUES (499, 393, 52);
INSERT INTO `core_service_assistants` VALUES (500, 393, 56);
INSERT INTO `core_service_assistants` VALUES (501, 394, 52);
INSERT INTO `core_service_assistants` VALUES (502, 394, 56);
INSERT INTO `core_service_assistants` VALUES (503, 395, 52);
INSERT INTO `core_service_assistants` VALUES (504, 395, 56);
INSERT INTO `core_service_assistants` VALUES (505, 396, 52);
INSERT INTO `core_service_assistants` VALUES (506, 396, 56);
INSERT INTO `core_service_assistants` VALUES (507, 397, 52);
INSERT INTO `core_service_assistants` VALUES (508, 397, 56);
INSERT INTO `core_service_assistants` VALUES (509, 398, 52);
INSERT INTO `core_service_assistants` VALUES (510, 398, 56);
INSERT INTO `core_service_assistants` VALUES (511, 399, 52);
INSERT INTO `core_service_assistants` VALUES (512, 399, 56);
INSERT INTO `core_service_assistants` VALUES (513, 400, 52);
INSERT INTO `core_service_assistants` VALUES (514, 400, 56);
INSERT INTO `core_service_assistants` VALUES (515, 401, 52);
INSERT INTO `core_service_assistants` VALUES (516, 402, 52);
INSERT INTO `core_service_assistants` VALUES (517, 403, 52);
INSERT INTO `core_service_assistants` VALUES (518, 404, 52);
INSERT INTO `core_service_assistants` VALUES (519, 405, 52);
INSERT INTO `core_service_assistants` VALUES (520, 406, 52);
INSERT INTO `core_service_assistants` VALUES (521, 407, 52);
INSERT INTO `core_service_assistants` VALUES (522, 408, 52);
INSERT INTO `core_service_assistants` VALUES (523, 409, 52);
INSERT INTO `core_service_assistants` VALUES (524, 410, 52);
INSERT INTO `core_service_assistants` VALUES (525, 411, 52);
INSERT INTO `core_service_assistants` VALUES (526, 412, 52);
INSERT INTO `core_service_assistants` VALUES (527, 413, 52);
INSERT INTO `core_service_assistants` VALUES (528, 414, 52);
INSERT INTO `core_service_assistants` VALUES (529, 415, 52);
INSERT INTO `core_service_assistants` VALUES (530, 416, 52);
INSERT INTO `core_service_assistants` VALUES (531, 417, 52);
INSERT INTO `core_service_assistants` VALUES (532, 418, 52);
INSERT INTO `core_service_assistants` VALUES (533, 419, 52);
INSERT INTO `core_service_assistants` VALUES (534, 420, 52);
INSERT INTO `core_service_assistants` VALUES (535, 421, 52);
INSERT INTO `core_service_assistants` VALUES (536, 422, 52);
INSERT INTO `core_service_assistants` VALUES (537, 423, 52);
INSERT INTO `core_service_assistants` VALUES (538, 424, 52);
INSERT INTO `core_service_assistants` VALUES (539, 425, 52);
INSERT INTO `core_service_assistants` VALUES (540, 426, 52);
INSERT INTO `core_service_assistants` VALUES (541, 427, 52);
INSERT INTO `core_service_assistants` VALUES (542, 428, 52);
INSERT INTO `core_service_assistants` VALUES (543, 429, 52);
INSERT INTO `core_service_assistants` VALUES (544, 430, 52);
INSERT INTO `core_service_assistants` VALUES (545, 431, 52);
INSERT INTO `core_service_assistants` VALUES (546, 432, 52);
INSERT INTO `core_service_assistants` VALUES (547, 433, 52);
INSERT INTO `core_service_assistants` VALUES (548, 434, 52);
INSERT INTO `core_service_assistants` VALUES (549, 435, 52);
INSERT INTO `core_service_assistants` VALUES (550, 436, 52);
INSERT INTO `core_service_assistants` VALUES (551, 437, 52);
INSERT INTO `core_service_assistants` VALUES (552, 438, 52);
INSERT INTO `core_service_assistants` VALUES (553, 439, 52);
INSERT INTO `core_service_assistants` VALUES (554, 440, 52);
INSERT INTO `core_service_assistants` VALUES (555, 441, 52);
INSERT INTO `core_service_assistants` VALUES (556, 442, 52);
INSERT INTO `core_service_assistants` VALUES (557, 443, 52);
INSERT INTO `core_service_assistants` VALUES (558, 444, 52);
INSERT INTO `core_service_assistants` VALUES (559, 445, 52);
INSERT INTO `core_service_assistants` VALUES (560, 446, 52);
INSERT INTO `core_service_assistants` VALUES (561, 447, 52);
INSERT INTO `core_service_assistants` VALUES (562, 448, 52);
INSERT INTO `core_service_assistants` VALUES (563, 449, 52);
INSERT INTO `core_service_assistants` VALUES (564, 450, 52);
INSERT INTO `core_service_assistants` VALUES (565, 451, 52);
INSERT INTO `core_service_assistants` VALUES (566, 452, 52);
INSERT INTO `core_service_assistants` VALUES (567, 453, 52);
INSERT INTO `core_service_assistants` VALUES (568, 454, 52);
INSERT INTO `core_service_assistants` VALUES (569, 455, 52);
INSERT INTO `core_service_assistants` VALUES (570, 456, 52);
INSERT INTO `core_service_assistants` VALUES (571, 457, 52);
INSERT INTO `core_service_assistants` VALUES (572, 458, 52);
INSERT INTO `core_service_assistants` VALUES (573, 459, 52);
INSERT INTO `core_service_assistants` VALUES (574, 460, 52);
INSERT INTO `core_service_assistants` VALUES (575, 461, 52);
INSERT INTO `core_service_assistants` VALUES (576, 462, 52);
INSERT INTO `core_service_assistants` VALUES (577, 463, 52);
INSERT INTO `core_service_assistants` VALUES (578, 464, 52);
INSERT INTO `core_service_assistants` VALUES (579, 465, 52);
INSERT INTO `core_service_assistants` VALUES (580, 466, 52);
INSERT INTO `core_service_assistants` VALUES (581, 467, 52);
INSERT INTO `core_service_assistants` VALUES (582, 468, 52);
INSERT INTO `core_service_assistants` VALUES (583, 469, 52);
INSERT INTO `core_service_assistants` VALUES (584, 470, 52);
INSERT INTO `core_service_assistants` VALUES (585, 471, 52);
INSERT INTO `core_service_assistants` VALUES (586, 472, 52);
INSERT INTO `core_service_assistants` VALUES (587, 473, 52);
INSERT INTO `core_service_assistants` VALUES (588, 474, 52);
INSERT INTO `core_service_assistants` VALUES (589, 475, 52);
INSERT INTO `core_service_assistants` VALUES (590, 476, 52);
INSERT INTO `core_service_assistants` VALUES (591, 477, 52);
INSERT INTO `core_service_assistants` VALUES (592, 478, 52);
INSERT INTO `core_service_assistants` VALUES (593, 479, 52);
INSERT INTO `core_service_assistants` VALUES (594, 480, 52);
INSERT INTO `core_service_assistants` VALUES (595, 481, 52);
INSERT INTO `core_service_assistants` VALUES (596, 482, 52);
INSERT INTO `core_service_assistants` VALUES (597, 483, 52);
INSERT INTO `core_service_assistants` VALUES (598, 484, 52);
INSERT INTO `core_service_assistants` VALUES (599, 485, 52);
INSERT INTO `core_service_assistants` VALUES (600, 486, 52);
INSERT INTO `core_service_assistants` VALUES (601, 487, 52);
INSERT INTO `core_service_assistants` VALUES (602, 488, 52);
INSERT INTO `core_service_assistants` VALUES (603, 489, 52);
INSERT INTO `core_service_assistants` VALUES (604, 490, 52);
INSERT INTO `core_service_assistants` VALUES (605, 491, 52);
INSERT INTO `core_service_assistants` VALUES (606, 492, 52);
INSERT INTO `core_service_assistants` VALUES (607, 493, 52);
INSERT INTO `core_service_assistants` VALUES (608, 494, 52);
INSERT INTO `core_service_assistants` VALUES (609, 495, 52);
INSERT INTO `core_service_assistants` VALUES (610, 496, 52);
INSERT INTO `core_service_assistants` VALUES (611, 497, 52);
INSERT INTO `core_service_assistants` VALUES (612, 498, 52);
INSERT INTO `core_service_assistants` VALUES (613, 499, 52);
INSERT INTO `core_service_assistants` VALUES (614, 500, 52);
INSERT INTO `core_service_assistants` VALUES (615, 501, 52);
INSERT INTO `core_service_assistants` VALUES (616, 502, 52);
INSERT INTO `core_service_assistants` VALUES (617, 503, 52);
INSERT INTO `core_service_assistants` VALUES (618, 504, 52);
INSERT INTO `core_service_assistants` VALUES (619, 505, 52);
INSERT INTO `core_service_assistants` VALUES (620, 506, 52);
INSERT INTO `core_service_assistants` VALUES (621, 507, 52);
INSERT INTO `core_service_assistants` VALUES (622, 508, 52);
INSERT INTO `core_service_assistants` VALUES (623, 509, 52);
INSERT INTO `core_service_assistants` VALUES (624, 510, 52);
INSERT INTO `core_service_assistants` VALUES (625, 511, 52);
INSERT INTO `core_service_assistants` VALUES (626, 512, 52);
INSERT INTO `core_service_assistants` VALUES (627, 513, 52);
INSERT INTO `core_service_assistants` VALUES (628, 514, 52);
INSERT INTO `core_service_assistants` VALUES (629, 515, 52);
INSERT INTO `core_service_assistants` VALUES (630, 516, 52);
INSERT INTO `core_service_assistants` VALUES (631, 517, 52);
INSERT INTO `core_service_assistants` VALUES (632, 518, 52);
INSERT INTO `core_service_assistants` VALUES (633, 519, 52);
INSERT INTO `core_service_assistants` VALUES (634, 520, 52);
INSERT INTO `core_service_assistants` VALUES (635, 521, 52);
INSERT INTO `core_service_assistants` VALUES (636, 522, 52);
INSERT INTO `core_service_assistants` VALUES (637, 523, 52);
INSERT INTO `core_service_assistants` VALUES (638, 524, 52);
INSERT INTO `core_service_assistants` VALUES (639, 525, 52);
INSERT INTO `core_service_assistants` VALUES (640, 526, 52);
INSERT INTO `core_service_assistants` VALUES (641, 527, 52);
INSERT INTO `core_service_assistants` VALUES (642, 528, 52);
INSERT INTO `core_service_assistants` VALUES (643, 529, 52);
INSERT INTO `core_service_assistants` VALUES (644, 530, 52);
INSERT INTO `core_service_assistants` VALUES (645, 531, 52);
INSERT INTO `core_service_assistants` VALUES (646, 532, 52);
INSERT INTO `core_service_assistants` VALUES (647, 533, 52);
INSERT INTO `core_service_assistants` VALUES (648, 534, 52);
INSERT INTO `core_service_assistants` VALUES (649, 535, 52);
INSERT INTO `core_service_assistants` VALUES (650, 536, 52);
INSERT INTO `core_service_assistants` VALUES (651, 537, 52);
INSERT INTO `core_service_assistants` VALUES (652, 538, 52);
INSERT INTO `core_service_assistants` VALUES (653, 539, 52);
INSERT INTO `core_service_assistants` VALUES (654, 540, 52);
INSERT INTO `core_service_assistants` VALUES (655, 541, 52);
INSERT INTO `core_service_assistants` VALUES (656, 542, 52);
INSERT INTO `core_service_assistants` VALUES (657, 543, 52);
INSERT INTO `core_service_assistants` VALUES (658, 544, 52);
INSERT INTO `core_service_assistants` VALUES (659, 545, 52);
INSERT INTO `core_service_assistants` VALUES (660, 546, 52);
INSERT INTO `core_service_assistants` VALUES (661, 547, 52);
INSERT INTO `core_service_assistants` VALUES (662, 548, 52);
INSERT INTO `core_service_assistants` VALUES (663, 549, 52);
INSERT INTO `core_service_assistants` VALUES (664, 550, 52);
INSERT INTO `core_service_assistants` VALUES (665, 551, 52);
INSERT INTO `core_service_assistants` VALUES (666, 552, 52);
INSERT INTO `core_service_assistants` VALUES (667, 553, 52);
INSERT INTO `core_service_assistants` VALUES (668, 554, 52);
INSERT INTO `core_service_assistants` VALUES (669, 555, 52);
INSERT INTO `core_service_assistants` VALUES (670, 556, 52);
INSERT INTO `core_service_assistants` VALUES (671, 557, 52);
INSERT INTO `core_service_assistants` VALUES (672, 558, 52);
INSERT INTO `core_service_assistants` VALUES (673, 559, 52);
INSERT INTO `core_service_assistants` VALUES (674, 560, 52);
INSERT INTO `core_service_assistants` VALUES (675, 561, 52);
INSERT INTO `core_service_assistants` VALUES (676, 562, 52);
INSERT INTO `core_service_assistants` VALUES (677, 563, 52);
INSERT INTO `core_service_assistants` VALUES (678, 564, 52);
INSERT INTO `core_service_assistants` VALUES (679, 565, 52);
INSERT INTO `core_service_assistants` VALUES (680, 566, 52);
INSERT INTO `core_service_assistants` VALUES (681, 567, 52);
INSERT INTO `core_service_assistants` VALUES (682, 568, 52);
INSERT INTO `core_service_assistants` VALUES (683, 569, 52);
INSERT INTO `core_service_assistants` VALUES (684, 570, 52);
INSERT INTO `core_service_assistants` VALUES (685, 571, 52);
INSERT INTO `core_service_assistants` VALUES (686, 572, 52);
INSERT INTO `core_service_assistants` VALUES (687, 573, 52);
INSERT INTO `core_service_assistants` VALUES (688, 574, 52);
INSERT INTO `core_service_assistants` VALUES (689, 575, 52);
INSERT INTO `core_service_assistants` VALUES (690, 576, 52);
INSERT INTO `core_service_assistants` VALUES (691, 577, 52);
INSERT INTO `core_service_assistants` VALUES (692, 578, 52);
INSERT INTO `core_service_assistants` VALUES (693, 579, 52);
INSERT INTO `core_service_assistants` VALUES (694, 580, 52);
INSERT INTO `core_service_assistants` VALUES (695, 581, 52);
INSERT INTO `core_service_assistants` VALUES (696, 582, 52);
INSERT INTO `core_service_assistants` VALUES (697, 583, 52);
INSERT INTO `core_service_assistants` VALUES (698, 584, 52);
INSERT INTO `core_service_assistants` VALUES (699, 585, 49);
INSERT INTO `core_service_assistants` VALUES (700, 586, 49);
INSERT INTO `core_service_assistants` VALUES (701, 587, 49);
INSERT INTO `core_service_assistants` VALUES (702, 588, 49);
INSERT INTO `core_service_assistants` VALUES (703, 589, 49);
INSERT INTO `core_service_assistants` VALUES (704, 590, 49);
INSERT INTO `core_service_assistants` VALUES (705, 591, 49);
INSERT INTO `core_service_assistants` VALUES (706, 592, 49);
INSERT INTO `core_service_assistants` VALUES (707, 593, 49);
INSERT INTO `core_service_assistants` VALUES (708, 594, 49);
INSERT INTO `core_service_assistants` VALUES (709, 595, 49);
INSERT INTO `core_service_assistants` VALUES (710, 596, 49);
INSERT INTO `core_service_assistants` VALUES (711, 597, 49);
INSERT INTO `core_service_assistants` VALUES (712, 598, 49);
INSERT INTO `core_service_assistants` VALUES (713, 599, 49);
INSERT INTO `core_service_assistants` VALUES (714, 600, 49);
INSERT INTO `core_service_assistants` VALUES (715, 601, 49);
INSERT INTO `core_service_assistants` VALUES (716, 602, 49);
INSERT INTO `core_service_assistants` VALUES (717, 603, 49);
INSERT INTO `core_service_assistants` VALUES (718, 604, 49);
INSERT INTO `core_service_assistants` VALUES (719, 605, 49);
INSERT INTO `core_service_assistants` VALUES (720, 606, 49);
INSERT INTO `core_service_assistants` VALUES (721, 607, 49);
INSERT INTO `core_service_assistants` VALUES (722, 608, 49);
INSERT INTO `core_service_assistants` VALUES (723, 609, 49);
INSERT INTO `core_service_assistants` VALUES (724, 610, 49);
INSERT INTO `core_service_assistants` VALUES (725, 611, 49);
INSERT INTO `core_service_assistants` VALUES (726, 612, 49);
INSERT INTO `core_service_assistants` VALUES (727, 613, 49);
INSERT INTO `core_service_assistants` VALUES (728, 614, 49);
INSERT INTO `core_service_assistants` VALUES (729, 615, 49);
INSERT INTO `core_service_assistants` VALUES (730, 616, 49);
INSERT INTO `core_service_assistants` VALUES (731, 617, 49);
INSERT INTO `core_service_assistants` VALUES (732, 618, 49);
INSERT INTO `core_service_assistants` VALUES (733, 619, 49);
INSERT INTO `core_service_assistants` VALUES (734, 620, 49);
INSERT INTO `core_service_assistants` VALUES (735, 621, 49);
INSERT INTO `core_service_assistants` VALUES (736, 622, 49);
INSERT INTO `core_service_assistants` VALUES (737, 623, 49);
INSERT INTO `core_service_assistants` VALUES (738, 624, 49);
INSERT INTO `core_service_assistants` VALUES (739, 625, 49);
INSERT INTO `core_service_assistants` VALUES (740, 626, 49);
INSERT INTO `core_service_assistants` VALUES (741, 627, 49);
INSERT INTO `core_service_assistants` VALUES (742, 628, 49);
INSERT INTO `core_service_assistants` VALUES (743, 629, 49);
INSERT INTO `core_service_assistants` VALUES (744, 630, 49);
INSERT INTO `core_service_assistants` VALUES (745, 631, 49);
INSERT INTO `core_service_assistants` VALUES (746, 632, 49);
INSERT INTO `core_service_assistants` VALUES (747, 633, 49);
INSERT INTO `core_service_assistants` VALUES (748, 634, 49);
INSERT INTO `core_service_assistants` VALUES (749, 635, 49);
INSERT INTO `core_service_assistants` VALUES (750, 636, 49);
INSERT INTO `core_service_assistants` VALUES (751, 637, 49);
INSERT INTO `core_service_assistants` VALUES (752, 638, 49);
INSERT INTO `core_service_assistants` VALUES (753, 639, 49);
INSERT INTO `core_service_assistants` VALUES (754, 640, 49);
INSERT INTO `core_service_assistants` VALUES (755, 641, 49);
INSERT INTO `core_service_assistants` VALUES (756, 642, 49);
INSERT INTO `core_service_assistants` VALUES (757, 643, 49);
INSERT INTO `core_service_assistants` VALUES (758, 644, 49);
INSERT INTO `core_service_assistants` VALUES (759, 645, 49);
INSERT INTO `core_service_assistants` VALUES (760, 646, 49);
INSERT INTO `core_service_assistants` VALUES (761, 647, 49);
INSERT INTO `core_service_assistants` VALUES (762, 648, 49);
INSERT INTO `core_service_assistants` VALUES (763, 649, 49);
INSERT INTO `core_service_assistants` VALUES (764, 650, 49);
INSERT INTO `core_service_assistants` VALUES (765, 651, 49);
INSERT INTO `core_service_assistants` VALUES (766, 652, 49);
INSERT INTO `core_service_assistants` VALUES (767, 653, 49);
INSERT INTO `core_service_assistants` VALUES (768, 654, 49);
INSERT INTO `core_service_assistants` VALUES (769, 655, 49);
INSERT INTO `core_service_assistants` VALUES (770, 656, 49);
INSERT INTO `core_service_assistants` VALUES (771, 657, 49);
INSERT INTO `core_service_assistants` VALUES (772, 658, 49);
INSERT INTO `core_service_assistants` VALUES (773, 659, 49);
INSERT INTO `core_service_assistants` VALUES (774, 660, 49);
INSERT INTO `core_service_assistants` VALUES (775, 661, 49);
INSERT INTO `core_service_assistants` VALUES (776, 662, 49);
INSERT INTO `core_service_assistants` VALUES (777, 663, 49);
INSERT INTO `core_service_assistants` VALUES (778, 664, 49);
INSERT INTO `core_service_assistants` VALUES (779, 665, 49);
INSERT INTO `core_service_assistants` VALUES (780, 666, 49);
INSERT INTO `core_service_assistants` VALUES (781, 667, 49);
INSERT INTO `core_service_assistants` VALUES (782, 668, 49);
INSERT INTO `core_service_assistants` VALUES (783, 669, 49);
INSERT INTO `core_service_assistants` VALUES (784, 670, 49);
INSERT INTO `core_service_assistants` VALUES (785, 671, 49);
INSERT INTO `core_service_assistants` VALUES (786, 672, 49);
INSERT INTO `core_service_assistants` VALUES (787, 673, 49);
INSERT INTO `core_service_assistants` VALUES (788, 674, 49);
INSERT INTO `core_service_assistants` VALUES (789, 675, 49);
INSERT INTO `core_service_assistants` VALUES (790, 676, 49);
INSERT INTO `core_service_assistants` VALUES (791, 677, 49);
INSERT INTO `core_service_assistants` VALUES (792, 678, 49);
INSERT INTO `core_service_assistants` VALUES (793, 679, 40);
INSERT INTO `core_service_assistants` VALUES (794, 680, 40);
INSERT INTO `core_service_assistants` VALUES (795, 681, 40);
INSERT INTO `core_service_assistants` VALUES (796, 682, 40);
INSERT INTO `core_service_assistants` VALUES (797, 683, 40);
INSERT INTO `core_service_assistants` VALUES (798, 684, 40);
INSERT INTO `core_service_assistants` VALUES (799, 685, 40);
INSERT INTO `core_service_assistants` VALUES (800, 686, 40);
INSERT INTO `core_service_assistants` VALUES (801, 687, 40);
INSERT INTO `core_service_assistants` VALUES (802, 688, 40);
INSERT INTO `core_service_assistants` VALUES (803, 689, 40);
INSERT INTO `core_service_assistants` VALUES (804, 690, 40);
INSERT INTO `core_service_assistants` VALUES (805, 691, 40);
INSERT INTO `core_service_assistants` VALUES (806, 692, 40);
INSERT INTO `core_service_assistants` VALUES (807, 693, 40);
INSERT INTO `core_service_assistants` VALUES (808, 694, 40);
INSERT INTO `core_service_assistants` VALUES (809, 695, 40);
INSERT INTO `core_service_assistants` VALUES (810, 696, 40);
INSERT INTO `core_service_assistants` VALUES (811, 697, 40);
INSERT INTO `core_service_assistants` VALUES (812, 698, 40);
INSERT INTO `core_service_assistants` VALUES (813, 699, 40);
INSERT INTO `core_service_assistants` VALUES (814, 700, 40);
INSERT INTO `core_service_assistants` VALUES (815, 701, 40);
INSERT INTO `core_service_assistants` VALUES (816, 702, 40);
INSERT INTO `core_service_assistants` VALUES (817, 703, 40);
INSERT INTO `core_service_assistants` VALUES (818, 704, 40);
INSERT INTO `core_service_assistants` VALUES (819, 705, 40);
INSERT INTO `core_service_assistants` VALUES (820, 706, 40);
INSERT INTO `core_service_assistants` VALUES (821, 707, 40);
INSERT INTO `core_service_assistants` VALUES (822, 708, 40);
INSERT INTO `core_service_assistants` VALUES (823, 709, 40);
INSERT INTO `core_service_assistants` VALUES (824, 710, 40);
INSERT INTO `core_service_assistants` VALUES (825, 711, 40);
INSERT INTO `core_service_assistants` VALUES (826, 712, 40);
INSERT INTO `core_service_assistants` VALUES (827, 713, 40);
INSERT INTO `core_service_assistants` VALUES (828, 714, 40);
INSERT INTO `core_service_assistants` VALUES (829, 715, 40);
INSERT INTO `core_service_assistants` VALUES (830, 716, 40);
INSERT INTO `core_service_assistants` VALUES (831, 717, 40);
INSERT INTO `core_service_assistants` VALUES (832, 718, 40);
INSERT INTO `core_service_assistants` VALUES (833, 719, 40);
INSERT INTO `core_service_assistants` VALUES (834, 720, 40);
INSERT INTO `core_service_assistants` VALUES (835, 721, 40);
INSERT INTO `core_service_assistants` VALUES (836, 722, 40);
INSERT INTO `core_service_assistants` VALUES (837, 723, 40);
INSERT INTO `core_service_assistants` VALUES (838, 724, 40);
INSERT INTO `core_service_assistants` VALUES (839, 725, 40);
INSERT INTO `core_service_assistants` VALUES (840, 726, 40);
INSERT INTO `core_service_assistants` VALUES (841, 727, 40);
INSERT INTO `core_service_assistants` VALUES (842, 728, 40);
INSERT INTO `core_service_assistants` VALUES (843, 729, 40);
INSERT INTO `core_service_assistants` VALUES (844, 730, 40);
INSERT INTO `core_service_assistants` VALUES (845, 731, 40);
INSERT INTO `core_service_assistants` VALUES (846, 732, 40);
INSERT INTO `core_service_assistants` VALUES (847, 733, 40);
INSERT INTO `core_service_assistants` VALUES (848, 734, 40);
INSERT INTO `core_service_assistants` VALUES (849, 735, 40);
INSERT INTO `core_service_assistants` VALUES (850, 736, 40);
INSERT INTO `core_service_assistants` VALUES (851, 737, 40);
INSERT INTO `core_service_assistants` VALUES (852, 738, 40);
INSERT INTO `core_service_assistants` VALUES (853, 739, 40);
INSERT INTO `core_service_assistants` VALUES (854, 740, 40);
INSERT INTO `core_service_assistants` VALUES (855, 741, 40);
INSERT INTO `core_service_assistants` VALUES (856, 742, 40);
INSERT INTO `core_service_assistants` VALUES (857, 743, 40);
INSERT INTO `core_service_assistants` VALUES (858, 744, 40);
INSERT INTO `core_service_assistants` VALUES (859, 745, 40);
INSERT INTO `core_service_assistants` VALUES (860, 746, 40);
INSERT INTO `core_service_assistants` VALUES (861, 747, 40);
INSERT INTO `core_service_assistants` VALUES (862, 748, 40);
INSERT INTO `core_service_assistants` VALUES (863, 749, 40);
INSERT INTO `core_service_assistants` VALUES (864, 750, 40);
INSERT INTO `core_service_assistants` VALUES (865, 751, 40);
INSERT INTO `core_service_assistants` VALUES (866, 752, 40);
INSERT INTO `core_service_assistants` VALUES (867, 753, 40);
INSERT INTO `core_service_assistants` VALUES (868, 754, 40);
INSERT INTO `core_service_assistants` VALUES (869, 755, 40);
INSERT INTO `core_service_assistants` VALUES (870, 756, 40);
INSERT INTO `core_service_assistants` VALUES (871, 757, 40);
INSERT INTO `core_service_assistants` VALUES (872, 758, 40);
INSERT INTO `core_service_assistants` VALUES (873, 759, 40);
INSERT INTO `core_service_assistants` VALUES (874, 760, 40);
INSERT INTO `core_service_assistants` VALUES (875, 761, 40);
INSERT INTO `core_service_assistants` VALUES (876, 762, 40);
INSERT INTO `core_service_assistants` VALUES (877, 763, 40);
INSERT INTO `core_service_assistants` VALUES (878, 764, 40);
INSERT INTO `core_service_assistants` VALUES (879, 765, 40);
INSERT INTO `core_service_assistants` VALUES (880, 766, 40);
INSERT INTO `core_service_assistants` VALUES (881, 767, 40);
INSERT INTO `core_service_assistants` VALUES (882, 768, 40);
INSERT INTO `core_service_assistants` VALUES (883, 769, 40);
INSERT INTO `core_service_assistants` VALUES (884, 770, 40);
INSERT INTO `core_service_assistants` VALUES (885, 771, 50);
INSERT INTO `core_service_assistants` VALUES (886, 771, 54);
INSERT INTO `core_service_assistants` VALUES (887, 772, 50);
INSERT INTO `core_service_assistants` VALUES (888, 772, 54);
INSERT INTO `core_service_assistants` VALUES (889, 773, 50);
INSERT INTO `core_service_assistants` VALUES (890, 773, 54);
INSERT INTO `core_service_assistants` VALUES (891, 774, 50);
INSERT INTO `core_service_assistants` VALUES (892, 774, 54);
INSERT INTO `core_service_assistants` VALUES (893, 775, 50);
INSERT INTO `core_service_assistants` VALUES (894, 775, 54);
INSERT INTO `core_service_assistants` VALUES (895, 776, 50);
INSERT INTO `core_service_assistants` VALUES (896, 776, 54);
INSERT INTO `core_service_assistants` VALUES (897, 777, 50);
INSERT INTO `core_service_assistants` VALUES (898, 777, 54);
INSERT INTO `core_service_assistants` VALUES (899, 778, 50);
INSERT INTO `core_service_assistants` VALUES (900, 778, 54);
INSERT INTO `core_service_assistants` VALUES (901, 779, 50);
INSERT INTO `core_service_assistants` VALUES (902, 779, 54);
INSERT INTO `core_service_assistants` VALUES (903, 780, 50);
INSERT INTO `core_service_assistants` VALUES (904, 780, 54);
INSERT INTO `core_service_assistants` VALUES (905, 781, 50);
INSERT INTO `core_service_assistants` VALUES (906, 781, 54);
INSERT INTO `core_service_assistants` VALUES (907, 782, 50);
INSERT INTO `core_service_assistants` VALUES (908, 782, 54);
INSERT INTO `core_service_assistants` VALUES (909, 783, 50);
INSERT INTO `core_service_assistants` VALUES (910, 783, 54);
INSERT INTO `core_service_assistants` VALUES (911, 784, 50);
INSERT INTO `core_service_assistants` VALUES (912, 784, 54);
INSERT INTO `core_service_assistants` VALUES (913, 785, 50);
INSERT INTO `core_service_assistants` VALUES (914, 785, 54);
INSERT INTO `core_service_assistants` VALUES (915, 786, 50);
INSERT INTO `core_service_assistants` VALUES (916, 786, 54);
INSERT INTO `core_service_assistants` VALUES (917, 787, 50);
INSERT INTO `core_service_assistants` VALUES (918, 787, 54);
INSERT INTO `core_service_assistants` VALUES (919, 788, 50);
INSERT INTO `core_service_assistants` VALUES (920, 788, 54);
INSERT INTO `core_service_assistants` VALUES (921, 789, 50);
INSERT INTO `core_service_assistants` VALUES (922, 789, 54);
INSERT INTO `core_service_assistants` VALUES (923, 790, 50);
INSERT INTO `core_service_assistants` VALUES (924, 790, 54);
INSERT INTO `core_service_assistants` VALUES (925, 791, 50);
INSERT INTO `core_service_assistants` VALUES (926, 791, 54);
INSERT INTO `core_service_assistants` VALUES (927, 792, 50);
INSERT INTO `core_service_assistants` VALUES (928, 792, 54);
INSERT INTO `core_service_assistants` VALUES (929, 793, 50);
INSERT INTO `core_service_assistants` VALUES (930, 793, 54);
INSERT INTO `core_service_assistants` VALUES (931, 794, 50);
INSERT INTO `core_service_assistants` VALUES (932, 794, 54);
INSERT INTO `core_service_assistants` VALUES (933, 795, 50);
INSERT INTO `core_service_assistants` VALUES (934, 795, 54);
INSERT INTO `core_service_assistants` VALUES (935, 796, 50);
INSERT INTO `core_service_assistants` VALUES (936, 796, 54);
INSERT INTO `core_service_assistants` VALUES (937, 797, 50);
INSERT INTO `core_service_assistants` VALUES (938, 797, 54);
INSERT INTO `core_service_assistants` VALUES (939, 798, 50);
INSERT INTO `core_service_assistants` VALUES (940, 798, 54);
INSERT INTO `core_service_assistants` VALUES (941, 799, 50);
INSERT INTO `core_service_assistants` VALUES (942, 799, 54);
INSERT INTO `core_service_assistants` VALUES (943, 800, 50);
INSERT INTO `core_service_assistants` VALUES (944, 800, 54);
INSERT INTO `core_service_assistants` VALUES (945, 801, 50);
INSERT INTO `core_service_assistants` VALUES (946, 801, 54);
INSERT INTO `core_service_assistants` VALUES (947, 802, 50);
INSERT INTO `core_service_assistants` VALUES (948, 802, 54);
INSERT INTO `core_service_assistants` VALUES (949, 803, 50);
INSERT INTO `core_service_assistants` VALUES (950, 803, 54);
INSERT INTO `core_service_assistants` VALUES (951, 804, 50);
INSERT INTO `core_service_assistants` VALUES (952, 804, 54);
INSERT INTO `core_service_assistants` VALUES (953, 805, 50);
INSERT INTO `core_service_assistants` VALUES (954, 805, 54);
INSERT INTO `core_service_assistants` VALUES (955, 806, 50);
INSERT INTO `core_service_assistants` VALUES (956, 806, 54);
INSERT INTO `core_service_assistants` VALUES (957, 807, 50);
INSERT INTO `core_service_assistants` VALUES (958, 807, 54);
INSERT INTO `core_service_assistants` VALUES (959, 808, 50);
INSERT INTO `core_service_assistants` VALUES (960, 808, 54);
INSERT INTO `core_service_assistants` VALUES (961, 809, 50);
INSERT INTO `core_service_assistants` VALUES (962, 809, 54);
INSERT INTO `core_service_assistants` VALUES (963, 810, 50);
INSERT INTO `core_service_assistants` VALUES (964, 810, 54);
INSERT INTO `core_service_assistants` VALUES (965, 811, 50);
INSERT INTO `core_service_assistants` VALUES (966, 811, 54);
INSERT INTO `core_service_assistants` VALUES (967, 812, 50);
INSERT INTO `core_service_assistants` VALUES (968, 812, 54);
INSERT INTO `core_service_assistants` VALUES (969, 813, 50);
INSERT INTO `core_service_assistants` VALUES (970, 813, 54);
INSERT INTO `core_service_assistants` VALUES (971, 814, 50);
INSERT INTO `core_service_assistants` VALUES (972, 814, 54);
INSERT INTO `core_service_assistants` VALUES (973, 815, 50);
INSERT INTO `core_service_assistants` VALUES (974, 815, 54);
INSERT INTO `core_service_assistants` VALUES (975, 816, 50);
INSERT INTO `core_service_assistants` VALUES (976, 816, 54);
INSERT INTO `core_service_assistants` VALUES (977, 817, 50);
INSERT INTO `core_service_assistants` VALUES (978, 817, 54);
INSERT INTO `core_service_assistants` VALUES (979, 818, 50);
INSERT INTO `core_service_assistants` VALUES (980, 818, 54);
INSERT INTO `core_service_assistants` VALUES (981, 819, 50);
INSERT INTO `core_service_assistants` VALUES (982, 819, 54);
INSERT INTO `core_service_assistants` VALUES (983, 820, 50);
INSERT INTO `core_service_assistants` VALUES (984, 820, 54);
INSERT INTO `core_service_assistants` VALUES (985, 821, 50);
INSERT INTO `core_service_assistants` VALUES (986, 821, 54);
INSERT INTO `core_service_assistants` VALUES (987, 822, 50);
INSERT INTO `core_service_assistants` VALUES (988, 822, 54);
INSERT INTO `core_service_assistants` VALUES (989, 823, 50);
INSERT INTO `core_service_assistants` VALUES (990, 823, 54);
INSERT INTO `core_service_assistants` VALUES (991, 824, 50);
INSERT INTO `core_service_assistants` VALUES (992, 824, 54);
INSERT INTO `core_service_assistants` VALUES (993, 825, 50);
INSERT INTO `core_service_assistants` VALUES (994, 825, 54);
INSERT INTO `core_service_assistants` VALUES (995, 826, 50);
INSERT INTO `core_service_assistants` VALUES (996, 826, 54);
INSERT INTO `core_service_assistants` VALUES (997, 827, 50);
INSERT INTO `core_service_assistants` VALUES (998, 827, 54);
INSERT INTO `core_service_assistants` VALUES (999, 828, 50);
INSERT INTO `core_service_assistants` VALUES (1000, 828, 54);
INSERT INTO `core_service_assistants` VALUES (1001, 829, 50);
INSERT INTO `core_service_assistants` VALUES (1002, 829, 54);
INSERT INTO `core_service_assistants` VALUES (1003, 830, 50);
INSERT INTO `core_service_assistants` VALUES (1004, 830, 54);
INSERT INTO `core_service_assistants` VALUES (1005, 831, 50);
INSERT INTO `core_service_assistants` VALUES (1006, 831, 54);
INSERT INTO `core_service_assistants` VALUES (1007, 832, 50);
INSERT INTO `core_service_assistants` VALUES (1008, 832, 54);
INSERT INTO `core_service_assistants` VALUES (1009, 833, 50);
INSERT INTO `core_service_assistants` VALUES (1010, 833, 54);
INSERT INTO `core_service_assistants` VALUES (1011, 834, 50);
INSERT INTO `core_service_assistants` VALUES (1012, 834, 54);
INSERT INTO `core_service_assistants` VALUES (1013, 835, 50);
INSERT INTO `core_service_assistants` VALUES (1014, 835, 54);
INSERT INTO `core_service_assistants` VALUES (1015, 836, 50);
INSERT INTO `core_service_assistants` VALUES (1016, 836, 54);
INSERT INTO `core_service_assistants` VALUES (1017, 837, 50);
INSERT INTO `core_service_assistants` VALUES (1018, 837, 54);
INSERT INTO `core_service_assistants` VALUES (1019, 838, 50);
INSERT INTO `core_service_assistants` VALUES (1020, 838, 54);
INSERT INTO `core_service_assistants` VALUES (1021, 839, 50);
INSERT INTO `core_service_assistants` VALUES (1022, 839, 54);
INSERT INTO `core_service_assistants` VALUES (1023, 840, 50);
INSERT INTO `core_service_assistants` VALUES (1024, 840, 54);
INSERT INTO `core_service_assistants` VALUES (1025, 841, 50);
INSERT INTO `core_service_assistants` VALUES (1026, 841, 54);
INSERT INTO `core_service_assistants` VALUES (1027, 842, 50);
INSERT INTO `core_service_assistants` VALUES (1028, 842, 54);
INSERT INTO `core_service_assistants` VALUES (1029, 843, 50);
INSERT INTO `core_service_assistants` VALUES (1030, 843, 54);
INSERT INTO `core_service_assistants` VALUES (1031, 844, 50);
INSERT INTO `core_service_assistants` VALUES (1032, 844, 54);
INSERT INTO `core_service_assistants` VALUES (1033, 845, 50);
INSERT INTO `core_service_assistants` VALUES (1034, 845, 54);
INSERT INTO `core_service_assistants` VALUES (1035, 846, 50);
INSERT INTO `core_service_assistants` VALUES (1036, 846, 54);
INSERT INTO `core_service_assistants` VALUES (1037, 847, 50);
INSERT INTO `core_service_assistants` VALUES (1038, 847, 54);
INSERT INTO `core_service_assistants` VALUES (1039, 848, 50);
INSERT INTO `core_service_assistants` VALUES (1040, 848, 54);
INSERT INTO `core_service_assistants` VALUES (1041, 849, 50);
INSERT INTO `core_service_assistants` VALUES (1042, 849, 54);
INSERT INTO `core_service_assistants` VALUES (1043, 850, 50);
INSERT INTO `core_service_assistants` VALUES (1044, 850, 54);
INSERT INTO `core_service_assistants` VALUES (1045, 851, 50);
INSERT INTO `core_service_assistants` VALUES (1046, 851, 54);
INSERT INTO `core_service_assistants` VALUES (1047, 852, 50);
INSERT INTO `core_service_assistants` VALUES (1048, 852, 54);
INSERT INTO `core_service_assistants` VALUES (1049, 853, 50);
INSERT INTO `core_service_assistants` VALUES (1050, 853, 54);
INSERT INTO `core_service_assistants` VALUES (1051, 854, 50);
INSERT INTO `core_service_assistants` VALUES (1052, 854, 54);
INSERT INTO `core_service_assistants` VALUES (1053, 855, 50);
INSERT INTO `core_service_assistants` VALUES (1054, 855, 54);
INSERT INTO `core_service_assistants` VALUES (1055, 856, 50);
INSERT INTO `core_service_assistants` VALUES (1056, 856, 54);
INSERT INTO `core_service_assistants` VALUES (1057, 857, 50);
INSERT INTO `core_service_assistants` VALUES (1058, 857, 54);
INSERT INTO `core_service_assistants` VALUES (1059, 858, 50);
INSERT INTO `core_service_assistants` VALUES (1060, 858, 54);
INSERT INTO `core_service_assistants` VALUES (1061, 859, 50);
INSERT INTO `core_service_assistants` VALUES (1062, 859, 54);
INSERT INTO `core_service_assistants` VALUES (1063, 860, 50);
INSERT INTO `core_service_assistants` VALUES (1064, 860, 54);
INSERT INTO `core_service_assistants` VALUES (1065, 861, 50);
INSERT INTO `core_service_assistants` VALUES (1066, 861, 54);
INSERT INTO `core_service_assistants` VALUES (1067, 862, 50);
INSERT INTO `core_service_assistants` VALUES (1068, 862, 54);
INSERT INTO `core_service_assistants` VALUES (1069, 863, 50);
INSERT INTO `core_service_assistants` VALUES (1070, 863, 54);
INSERT INTO `core_service_assistants` VALUES (1071, 864, 50);
INSERT INTO `core_service_assistants` VALUES (1072, 864, 54);
INSERT INTO `core_service_assistants` VALUES (1073, 865, 50);
INSERT INTO `core_service_assistants` VALUES (1074, 865, 54);
INSERT INTO `core_service_assistants` VALUES (1075, 866, 50);
INSERT INTO `core_service_assistants` VALUES (1076, 866, 54);
INSERT INTO `core_service_assistants` VALUES (1077, 867, 50);
INSERT INTO `core_service_assistants` VALUES (1078, 867, 54);
INSERT INTO `core_service_assistants` VALUES (1079, 868, 50);
INSERT INTO `core_service_assistants` VALUES (1080, 868, 54);
INSERT INTO `core_service_assistants` VALUES (1081, 869, 50);
INSERT INTO `core_service_assistants` VALUES (1082, 869, 54);
INSERT INTO `core_service_assistants` VALUES (1083, 870, 50);
INSERT INTO `core_service_assistants` VALUES (1084, 870, 54);
INSERT INTO `core_service_assistants` VALUES (1085, 871, 50);
INSERT INTO `core_service_assistants` VALUES (1086, 871, 54);
INSERT INTO `core_service_assistants` VALUES (1087, 872, 50);
INSERT INTO `core_service_assistants` VALUES (1088, 872, 54);
INSERT INTO `core_service_assistants` VALUES (1089, 873, 50);
INSERT INTO `core_service_assistants` VALUES (1090, 873, 54);
INSERT INTO `core_service_assistants` VALUES (1091, 874, 50);
INSERT INTO `core_service_assistants` VALUES (1092, 874, 54);
INSERT INTO `core_service_assistants` VALUES (1093, 875, 50);
INSERT INTO `core_service_assistants` VALUES (1094, 875, 54);
INSERT INTO `core_service_assistants` VALUES (1095, 876, 50);
INSERT INTO `core_service_assistants` VALUES (1096, 876, 54);
INSERT INTO `core_service_assistants` VALUES (1097, 877, 50);
INSERT INTO `core_service_assistants` VALUES (1098, 877, 54);
INSERT INTO `core_service_assistants` VALUES (1099, 878, 50);
INSERT INTO `core_service_assistants` VALUES (1100, 878, 54);
INSERT INTO `core_service_assistants` VALUES (1101, 879, 50);
INSERT INTO `core_service_assistants` VALUES (1102, 879, 54);
INSERT INTO `core_service_assistants` VALUES (1103, 880, 50);
INSERT INTO `core_service_assistants` VALUES (1104, 880, 54);
INSERT INTO `core_service_assistants` VALUES (1105, 881, 50);
INSERT INTO `core_service_assistants` VALUES (1106, 881, 54);
INSERT INTO `core_service_assistants` VALUES (1107, 882, 50);
INSERT INTO `core_service_assistants` VALUES (1108, 882, 54);
INSERT INTO `core_service_assistants` VALUES (1109, 883, 50);
INSERT INTO `core_service_assistants` VALUES (1110, 883, 54);
INSERT INTO `core_service_assistants` VALUES (1111, 884, 50);
INSERT INTO `core_service_assistants` VALUES (1112, 884, 54);
INSERT INTO `core_service_assistants` VALUES (1113, 885, 50);
INSERT INTO `core_service_assistants` VALUES (1114, 885, 54);
INSERT INTO `core_service_assistants` VALUES (1115, 886, 50);
INSERT INTO `core_service_assistants` VALUES (1116, 886, 54);
INSERT INTO `core_service_assistants` VALUES (1117, 887, 50);
INSERT INTO `core_service_assistants` VALUES (1118, 887, 54);
INSERT INTO `core_service_assistants` VALUES (1119, 888, 50);
INSERT INTO `core_service_assistants` VALUES (1120, 888, 54);
INSERT INTO `core_service_assistants` VALUES (1121, 889, 50);
INSERT INTO `core_service_assistants` VALUES (1122, 889, 54);
INSERT INTO `core_service_assistants` VALUES (1123, 890, 50);
INSERT INTO `core_service_assistants` VALUES (1124, 890, 54);
INSERT INTO `core_service_assistants` VALUES (1125, 891, 50);
INSERT INTO `core_service_assistants` VALUES (1126, 891, 54);
INSERT INTO `core_service_assistants` VALUES (1127, 892, 50);
INSERT INTO `core_service_assistants` VALUES (1128, 892, 54);
INSERT INTO `core_service_assistants` VALUES (1129, 893, 50);
INSERT INTO `core_service_assistants` VALUES (1130, 893, 54);
INSERT INTO `core_service_assistants` VALUES (1131, 894, 50);
INSERT INTO `core_service_assistants` VALUES (1132, 894, 54);
INSERT INTO `core_service_assistants` VALUES (1133, 895, 50);
INSERT INTO `core_service_assistants` VALUES (1134, 895, 54);
INSERT INTO `core_service_assistants` VALUES (1135, 896, 50);
INSERT INTO `core_service_assistants` VALUES (1136, 896, 54);
INSERT INTO `core_service_assistants` VALUES (1137, 897, 50);
INSERT INTO `core_service_assistants` VALUES (1138, 897, 54);
INSERT INTO `core_service_assistants` VALUES (1139, 898, 50);
INSERT INTO `core_service_assistants` VALUES (1140, 898, 54);
INSERT INTO `core_service_assistants` VALUES (1141, 899, 50);
INSERT INTO `core_service_assistants` VALUES (1142, 899, 54);
INSERT INTO `core_service_assistants` VALUES (1143, 900, 50);
INSERT INTO `core_service_assistants` VALUES (1144, 900, 54);
INSERT INTO `core_service_assistants` VALUES (1145, 901, 50);
INSERT INTO `core_service_assistants` VALUES (1146, 901, 54);
INSERT INTO `core_service_assistants` VALUES (1147, 902, 50);
INSERT INTO `core_service_assistants` VALUES (1148, 902, 54);
INSERT INTO `core_service_assistants` VALUES (1149, 903, 50);
INSERT INTO `core_service_assistants` VALUES (1150, 903, 54);
INSERT INTO `core_service_assistants` VALUES (1151, 904, 50);
INSERT INTO `core_service_assistants` VALUES (1152, 904, 54);
INSERT INTO `core_service_assistants` VALUES (1153, 905, 50);
INSERT INTO `core_service_assistants` VALUES (1154, 905, 54);
INSERT INTO `core_service_assistants` VALUES (1155, 906, 50);
INSERT INTO `core_service_assistants` VALUES (1156, 906, 54);
INSERT INTO `core_service_assistants` VALUES (1157, 907, 50);
INSERT INTO `core_service_assistants` VALUES (1158, 907, 54);
INSERT INTO `core_service_assistants` VALUES (1159, 908, 50);
INSERT INTO `core_service_assistants` VALUES (1160, 908, 54);
INSERT INTO `core_service_assistants` VALUES (1161, 909, 50);
INSERT INTO `core_service_assistants` VALUES (1162, 909, 54);
INSERT INTO `core_service_assistants` VALUES (1163, 910, 50);
INSERT INTO `core_service_assistants` VALUES (1164, 910, 54);
INSERT INTO `core_service_assistants` VALUES (1165, 911, 50);
INSERT INTO `core_service_assistants` VALUES (1166, 911, 54);
INSERT INTO `core_service_assistants` VALUES (1167, 912, 50);
INSERT INTO `core_service_assistants` VALUES (1168, 912, 54);
INSERT INTO `core_service_assistants` VALUES (1169, 913, 50);
INSERT INTO `core_service_assistants` VALUES (1170, 913, 54);
INSERT INTO `core_service_assistants` VALUES (1171, 914, 50);
INSERT INTO `core_service_assistants` VALUES (1172, 914, 54);
INSERT INTO `core_service_assistants` VALUES (1173, 915, 50);
INSERT INTO `core_service_assistants` VALUES (1174, 915, 54);
INSERT INTO `core_service_assistants` VALUES (1175, 916, 50);
INSERT INTO `core_service_assistants` VALUES (1176, 916, 54);
INSERT INTO `core_service_assistants` VALUES (1177, 917, 50);
INSERT INTO `core_service_assistants` VALUES (1178, 917, 54);
INSERT INTO `core_service_assistants` VALUES (1179, 918, 50);
INSERT INTO `core_service_assistants` VALUES (1180, 918, 54);
INSERT INTO `core_service_assistants` VALUES (1181, 919, 50);
INSERT INTO `core_service_assistants` VALUES (1182, 919, 54);
INSERT INTO `core_service_assistants` VALUES (1183, 920, 50);
INSERT INTO `core_service_assistants` VALUES (1184, 920, 54);
INSERT INTO `core_service_assistants` VALUES (1185, 921, 50);
INSERT INTO `core_service_assistants` VALUES (1186, 921, 54);
INSERT INTO `core_service_assistants` VALUES (1187, 922, 50);
INSERT INTO `core_service_assistants` VALUES (1188, 922, 54);
INSERT INTO `core_service_assistants` VALUES (1189, 923, 52);
INSERT INTO `core_service_assistants` VALUES (1190, 924, 52);
INSERT INTO `core_service_assistants` VALUES (1191, 925, 52);
INSERT INTO `core_service_assistants` VALUES (1192, 926, 52);
INSERT INTO `core_service_assistants` VALUES (1193, 927, 52);
INSERT INTO `core_service_assistants` VALUES (1194, 928, 52);
INSERT INTO `core_service_assistants` VALUES (1195, 929, 52);
INSERT INTO `core_service_assistants` VALUES (1196, 930, 52);
INSERT INTO `core_service_assistants` VALUES (1197, 931, 52);
INSERT INTO `core_service_assistants` VALUES (1198, 932, 52);
INSERT INTO `core_service_assistants` VALUES (1199, 933, 52);
INSERT INTO `core_service_assistants` VALUES (1200, 934, 52);
INSERT INTO `core_service_assistants` VALUES (1201, 935, 52);
INSERT INTO `core_service_assistants` VALUES (1202, 936, 52);
INSERT INTO `core_service_assistants` VALUES (1203, 937, 52);
INSERT INTO `core_service_assistants` VALUES (1204, 938, 52);
INSERT INTO `core_service_assistants` VALUES (1205, 939, 52);
INSERT INTO `core_service_assistants` VALUES (1206, 940, 52);
INSERT INTO `core_service_assistants` VALUES (1207, 941, 52);
INSERT INTO `core_service_assistants` VALUES (1208, 942, 52);
INSERT INTO `core_service_assistants` VALUES (1209, 943, 52);
INSERT INTO `core_service_assistants` VALUES (1210, 944, 52);
INSERT INTO `core_service_assistants` VALUES (1211, 945, 52);
INSERT INTO `core_service_assistants` VALUES (1212, 946, 52);
INSERT INTO `core_service_assistants` VALUES (1213, 947, 52);
INSERT INTO `core_service_assistants` VALUES (1214, 948, 52);
INSERT INTO `core_service_assistants` VALUES (1215, 949, 52);
INSERT INTO `core_service_assistants` VALUES (1216, 950, 52);
INSERT INTO `core_service_assistants` VALUES (1217, 951, 52);
INSERT INTO `core_service_assistants` VALUES (1218, 952, 52);
INSERT INTO `core_service_assistants` VALUES (1219, 953, 52);
INSERT INTO `core_service_assistants` VALUES (1220, 954, 52);
INSERT INTO `core_service_assistants` VALUES (1221, 955, 52);
INSERT INTO `core_service_assistants` VALUES (1222, 956, 52);
INSERT INTO `core_service_assistants` VALUES (1223, 957, 52);
INSERT INTO `core_service_assistants` VALUES (1224, 958, 52);
INSERT INTO `core_service_assistants` VALUES (1225, 959, 52);
INSERT INTO `core_service_assistants` VALUES (1226, 960, 52);
INSERT INTO `core_service_assistants` VALUES (1227, 961, 52);
INSERT INTO `core_service_assistants` VALUES (1228, 962, 52);
INSERT INTO `core_service_assistants` VALUES (1229, 963, 52);
INSERT INTO `core_service_assistants` VALUES (1230, 964, 52);
INSERT INTO `core_service_assistants` VALUES (1231, 965, 52);
INSERT INTO `core_service_assistants` VALUES (1232, 966, 52);
INSERT INTO `core_service_assistants` VALUES (1233, 967, 52);
INSERT INTO `core_service_assistants` VALUES (1234, 968, 52);
INSERT INTO `core_service_assistants` VALUES (1235, 969, 52);
INSERT INTO `core_service_assistants` VALUES (1236, 970, 52);
INSERT INTO `core_service_assistants` VALUES (1237, 971, 52);
INSERT INTO `core_service_assistants` VALUES (1238, 972, 52);
INSERT INTO `core_service_assistants` VALUES (1239, 973, 52);
INSERT INTO `core_service_assistants` VALUES (1240, 974, 52);
INSERT INTO `core_service_assistants` VALUES (1241, 975, 52);
INSERT INTO `core_service_assistants` VALUES (1242, 976, 52);
INSERT INTO `core_service_assistants` VALUES (1243, 977, 52);
INSERT INTO `core_service_assistants` VALUES (1244, 978, 52);
INSERT INTO `core_service_assistants` VALUES (1245, 979, 52);
INSERT INTO `core_service_assistants` VALUES (1246, 980, 52);
INSERT INTO `core_service_assistants` VALUES (1247, 981, 52);
INSERT INTO `core_service_assistants` VALUES (1248, 982, 52);
INSERT INTO `core_service_assistants` VALUES (1249, 983, 52);
INSERT INTO `core_service_assistants` VALUES (1250, 984, 52);
INSERT INTO `core_service_assistants` VALUES (1251, 985, 52);
INSERT INTO `core_service_assistants` VALUES (1252, 986, 52);
INSERT INTO `core_service_assistants` VALUES (1253, 987, 52);
INSERT INTO `core_service_assistants` VALUES (1254, 988, 52);
INSERT INTO `core_service_assistants` VALUES (1255, 989, 52);
INSERT INTO `core_service_assistants` VALUES (1256, 990, 52);
INSERT INTO `core_service_assistants` VALUES (1257, 991, 52);
INSERT INTO `core_service_assistants` VALUES (1258, 992, 52);
INSERT INTO `core_service_assistants` VALUES (1259, 993, 52);
INSERT INTO `core_service_assistants` VALUES (1260, 994, 52);
INSERT INTO `core_service_assistants` VALUES (1261, 995, 52);
INSERT INTO `core_service_assistants` VALUES (1262, 996, 52);
INSERT INTO `core_service_assistants` VALUES (1263, 997, 52);
INSERT INTO `core_service_assistants` VALUES (1264, 998, 52);
INSERT INTO `core_service_assistants` VALUES (1265, 999, 52);
INSERT INTO `core_service_assistants` VALUES (1266, 1000, 52);
INSERT INTO `core_service_assistants` VALUES (1267, 1001, 52);
INSERT INTO `core_service_assistants` VALUES (1268, 1002, 52);
INSERT INTO `core_service_assistants` VALUES (1269, 1003, 52);
INSERT INTO `core_service_assistants` VALUES (1270, 1004, 52);
INSERT INTO `core_service_assistants` VALUES (1271, 1005, 52);
INSERT INTO `core_service_assistants` VALUES (1272, 1006, 52);
INSERT INTO `core_service_assistants` VALUES (1273, 1007, 52);
INSERT INTO `core_service_assistants` VALUES (1274, 1008, 52);
INSERT INTO `core_service_assistants` VALUES (1275, 1009, 52);
INSERT INTO `core_service_assistants` VALUES (1276, 1010, 52);
INSERT INTO `core_service_assistants` VALUES (1277, 1011, 52);
INSERT INTO `core_service_assistants` VALUES (1278, 1012, 52);
INSERT INTO `core_service_assistants` VALUES (1279, 1013, 52);
INSERT INTO `core_service_assistants` VALUES (1280, 1014, 52);
INSERT INTO `core_service_assistants` VALUES (1281, 1015, 52);
INSERT INTO `core_service_assistants` VALUES (1282, 1016, 52);
INSERT INTO `core_service_assistants` VALUES (1283, 1017, 52);
INSERT INTO `core_service_assistants` VALUES (1284, 1018, 52);
INSERT INTO `core_service_assistants` VALUES (1285, 1019, 52);
INSERT INTO `core_service_assistants` VALUES (1286, 1020, 52);
INSERT INTO `core_service_assistants` VALUES (1287, 1021, 52);
INSERT INTO `core_service_assistants` VALUES (1288, 1022, 52);
INSERT INTO `core_service_assistants` VALUES (1289, 1023, 52);
INSERT INTO `core_service_assistants` VALUES (1290, 1024, 52);
INSERT INTO `core_service_assistants` VALUES (1291, 1025, 52);
INSERT INTO `core_service_assistants` VALUES (1292, 1026, 52);
INSERT INTO `core_service_assistants` VALUES (1293, 1027, 52);
INSERT INTO `core_service_assistants` VALUES (1294, 1028, 52);
INSERT INTO `core_service_assistants` VALUES (1295, 1029, 52);
INSERT INTO `core_service_assistants` VALUES (1296, 1030, 52);
INSERT INTO `core_service_assistants` VALUES (1297, 1031, 52);
INSERT INTO `core_service_assistants` VALUES (1298, 1032, 52);
INSERT INTO `core_service_assistants` VALUES (1299, 1033, 52);
INSERT INTO `core_service_assistants` VALUES (1300, 1034, 52);
INSERT INTO `core_service_assistants` VALUES (1301, 1035, 52);
INSERT INTO `core_service_assistants` VALUES (1302, 1036, 52);
INSERT INTO `core_service_assistants` VALUES (1303, 1037, 52);
INSERT INTO `core_service_assistants` VALUES (1304, 1038, 52);
INSERT INTO `core_service_assistants` VALUES (1305, 1039, 52);
INSERT INTO `core_service_assistants` VALUES (1306, 1040, 52);
INSERT INTO `core_service_assistants` VALUES (1307, 1041, 52);
INSERT INTO `core_service_assistants` VALUES (1308, 1042, 52);
INSERT INTO `core_service_assistants` VALUES (1309, 1043, 52);
INSERT INTO `core_service_assistants` VALUES (1310, 1044, 52);
INSERT INTO `core_service_assistants` VALUES (1311, 1045, 52);
INSERT INTO `core_service_assistants` VALUES (1312, 1046, 52);
INSERT INTO `core_service_assistants` VALUES (1313, 1047, 52);
INSERT INTO `core_service_assistants` VALUES (1314, 1048, 52);
INSERT INTO `core_service_assistants` VALUES (1315, 1049, 52);
INSERT INTO `core_service_assistants` VALUES (1316, 1050, 52);
INSERT INTO `core_service_assistants` VALUES (1317, 1051, 52);
INSERT INTO `core_service_assistants` VALUES (1318, 1052, 52);
INSERT INTO `core_service_assistants` VALUES (1319, 1053, 52);
INSERT INTO `core_service_assistants` VALUES (1320, 1054, 52);
INSERT INTO `core_service_assistants` VALUES (1321, 1055, 52);
INSERT INTO `core_service_assistants` VALUES (1322, 1056, 52);
INSERT INTO `core_service_assistants` VALUES (1323, 1057, 52);
INSERT INTO `core_service_assistants` VALUES (1324, 1058, 52);
INSERT INTO `core_service_assistants` VALUES (1325, 1059, 52);
INSERT INTO `core_service_assistants` VALUES (1326, 1060, 52);
INSERT INTO `core_service_assistants` VALUES (1327, 1061, 52);
INSERT INTO `core_service_assistants` VALUES (1328, 1062, 52);
INSERT INTO `core_service_assistants` VALUES (1329, 1063, 52);
INSERT INTO `core_service_assistants` VALUES (1330, 1064, 52);
INSERT INTO `core_service_assistants` VALUES (1331, 1065, 52);
INSERT INTO `core_service_assistants` VALUES (1332, 1066, 52);
INSERT INTO `core_service_assistants` VALUES (1333, 1067, 52);
INSERT INTO `core_service_assistants` VALUES (1334, 1068, 52);
INSERT INTO `core_service_assistants` VALUES (1335, 1069, 52);
INSERT INTO `core_service_assistants` VALUES (1336, 1070, 52);
INSERT INTO `core_service_assistants` VALUES (1337, 1071, 52);
INSERT INTO `core_service_assistants` VALUES (1338, 1072, 52);
INSERT INTO `core_service_assistants` VALUES (1339, 1073, 52);
INSERT INTO `core_service_assistants` VALUES (1340, 1074, 52);
COMMIT;

-- ----------------------------
-- Table structure for core_service_drivers
-- ----------------------------
DROP TABLE IF EXISTS `core_service_drivers`;
CREATE TABLE `core_service_drivers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) NOT NULL,
  `personal_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_service_drivers_service_id_personal_id_a5c8889c_uniq` (`service_id`,`personal_id`),
  KEY `core_service_drivers_personal_id_30587fe0_fk_crew_pers` (`personal_id`),
  CONSTRAINT `core_service_drivers_personal_id_30587fe0_fk_crew_pers` FOREIGN KEY (`personal_id`) REFERENCES `crew_personal` (`user_id`),
  CONSTRAINT `core_service_drivers_service_id_50f1e635_fk_core_service_id` FOREIGN KEY (`service_id`) REFERENCES `core_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2990 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_service_drivers
-- ----------------------------
BEGIN;
INSERT INTO `core_service_drivers` VALUES (59, 35, 40);
INSERT INTO `core_service_drivers` VALUES (60, 35, 49);
INSERT INTO `core_service_drivers` VALUES (61, 35, 50);
INSERT INTO `core_service_drivers` VALUES (132, 61, 40);
INSERT INTO `core_service_drivers` VALUES (133, 61, 49);
INSERT INTO `core_service_drivers` VALUES (134, 61, 50);
INSERT INTO `core_service_drivers` VALUES (135, 62, 40);
INSERT INTO `core_service_drivers` VALUES (136, 62, 49);
INSERT INTO `core_service_drivers` VALUES (137, 62, 50);
INSERT INTO `core_service_drivers` VALUES (139, 63, 51);
INSERT INTO `core_service_drivers` VALUES (140, 63, 52);
INSERT INTO `core_service_drivers` VALUES (138, 63, 58);
INSERT INTO `core_service_drivers` VALUES (605, 218, 50);
INSERT INTO `core_service_drivers` VALUES (604, 218, 55);
INSERT INTO `core_service_drivers` VALUES (603, 218, 56);
INSERT INTO `core_service_drivers` VALUES (608, 219, 50);
INSERT INTO `core_service_drivers` VALUES (607, 219, 55);
INSERT INTO `core_service_drivers` VALUES (606, 219, 56);
INSERT INTO `core_service_drivers` VALUES (611, 220, 50);
INSERT INTO `core_service_drivers` VALUES (610, 220, 55);
INSERT INTO `core_service_drivers` VALUES (609, 220, 56);
INSERT INTO `core_service_drivers` VALUES (614, 221, 50);
INSERT INTO `core_service_drivers` VALUES (613, 221, 55);
INSERT INTO `core_service_drivers` VALUES (612, 221, 56);
INSERT INTO `core_service_drivers` VALUES (617, 222, 50);
INSERT INTO `core_service_drivers` VALUES (616, 222, 55);
INSERT INTO `core_service_drivers` VALUES (615, 222, 56);
INSERT INTO `core_service_drivers` VALUES (620, 223, 50);
INSERT INTO `core_service_drivers` VALUES (619, 223, 55);
INSERT INTO `core_service_drivers` VALUES (618, 223, 56);
INSERT INTO `core_service_drivers` VALUES (623, 224, 50);
INSERT INTO `core_service_drivers` VALUES (622, 224, 55);
INSERT INTO `core_service_drivers` VALUES (621, 224, 56);
INSERT INTO `core_service_drivers` VALUES (626, 225, 50);
INSERT INTO `core_service_drivers` VALUES (625, 225, 55);
INSERT INTO `core_service_drivers` VALUES (624, 225, 56);
INSERT INTO `core_service_drivers` VALUES (629, 226, 50);
INSERT INTO `core_service_drivers` VALUES (628, 226, 55);
INSERT INTO `core_service_drivers` VALUES (627, 226, 56);
INSERT INTO `core_service_drivers` VALUES (632, 227, 50);
INSERT INTO `core_service_drivers` VALUES (631, 227, 55);
INSERT INTO `core_service_drivers` VALUES (630, 227, 56);
INSERT INTO `core_service_drivers` VALUES (635, 228, 50);
INSERT INTO `core_service_drivers` VALUES (634, 228, 55);
INSERT INTO `core_service_drivers` VALUES (633, 228, 56);
INSERT INTO `core_service_drivers` VALUES (638, 229, 50);
INSERT INTO `core_service_drivers` VALUES (637, 229, 55);
INSERT INTO `core_service_drivers` VALUES (636, 229, 56);
INSERT INTO `core_service_drivers` VALUES (641, 230, 50);
INSERT INTO `core_service_drivers` VALUES (640, 230, 55);
INSERT INTO `core_service_drivers` VALUES (639, 230, 56);
INSERT INTO `core_service_drivers` VALUES (644, 231, 50);
INSERT INTO `core_service_drivers` VALUES (643, 231, 55);
INSERT INTO `core_service_drivers` VALUES (642, 231, 56);
INSERT INTO `core_service_drivers` VALUES (647, 232, 50);
INSERT INTO `core_service_drivers` VALUES (646, 232, 55);
INSERT INTO `core_service_drivers` VALUES (645, 232, 56);
INSERT INTO `core_service_drivers` VALUES (650, 233, 50);
INSERT INTO `core_service_drivers` VALUES (649, 233, 55);
INSERT INTO `core_service_drivers` VALUES (648, 233, 56);
INSERT INTO `core_service_drivers` VALUES (653, 234, 50);
INSERT INTO `core_service_drivers` VALUES (652, 234, 55);
INSERT INTO `core_service_drivers` VALUES (651, 234, 56);
INSERT INTO `core_service_drivers` VALUES (656, 235, 50);
INSERT INTO `core_service_drivers` VALUES (655, 235, 55);
INSERT INTO `core_service_drivers` VALUES (654, 235, 56);
INSERT INTO `core_service_drivers` VALUES (659, 236, 50);
INSERT INTO `core_service_drivers` VALUES (658, 236, 55);
INSERT INTO `core_service_drivers` VALUES (657, 236, 56);
INSERT INTO `core_service_drivers` VALUES (662, 237, 50);
INSERT INTO `core_service_drivers` VALUES (661, 237, 55);
INSERT INTO `core_service_drivers` VALUES (660, 237, 56);
INSERT INTO `core_service_drivers` VALUES (665, 238, 50);
INSERT INTO `core_service_drivers` VALUES (664, 238, 55);
INSERT INTO `core_service_drivers` VALUES (663, 238, 56);
INSERT INTO `core_service_drivers` VALUES (668, 239, 50);
INSERT INTO `core_service_drivers` VALUES (667, 239, 55);
INSERT INTO `core_service_drivers` VALUES (666, 239, 56);
INSERT INTO `core_service_drivers` VALUES (671, 240, 50);
INSERT INTO `core_service_drivers` VALUES (670, 240, 55);
INSERT INTO `core_service_drivers` VALUES (669, 240, 56);
INSERT INTO `core_service_drivers` VALUES (674, 241, 50);
INSERT INTO `core_service_drivers` VALUES (673, 241, 55);
INSERT INTO `core_service_drivers` VALUES (672, 241, 56);
INSERT INTO `core_service_drivers` VALUES (677, 242, 50);
INSERT INTO `core_service_drivers` VALUES (676, 242, 55);
INSERT INTO `core_service_drivers` VALUES (675, 242, 56);
INSERT INTO `core_service_drivers` VALUES (680, 243, 50);
INSERT INTO `core_service_drivers` VALUES (679, 243, 55);
INSERT INTO `core_service_drivers` VALUES (678, 243, 56);
INSERT INTO `core_service_drivers` VALUES (683, 244, 50);
INSERT INTO `core_service_drivers` VALUES (682, 244, 55);
INSERT INTO `core_service_drivers` VALUES (681, 244, 56);
INSERT INTO `core_service_drivers` VALUES (686, 245, 50);
INSERT INTO `core_service_drivers` VALUES (685, 245, 55);
INSERT INTO `core_service_drivers` VALUES (684, 245, 56);
INSERT INTO `core_service_drivers` VALUES (689, 246, 50);
INSERT INTO `core_service_drivers` VALUES (688, 246, 55);
INSERT INTO `core_service_drivers` VALUES (687, 246, 56);
INSERT INTO `core_service_drivers` VALUES (692, 247, 50);
INSERT INTO `core_service_drivers` VALUES (691, 247, 55);
INSERT INTO `core_service_drivers` VALUES (690, 247, 56);
INSERT INTO `core_service_drivers` VALUES (695, 248, 50);
INSERT INTO `core_service_drivers` VALUES (694, 248, 55);
INSERT INTO `core_service_drivers` VALUES (693, 248, 56);
INSERT INTO `core_service_drivers` VALUES (698, 249, 50);
INSERT INTO `core_service_drivers` VALUES (697, 249, 55);
INSERT INTO `core_service_drivers` VALUES (696, 249, 56);
INSERT INTO `core_service_drivers` VALUES (701, 250, 50);
INSERT INTO `core_service_drivers` VALUES (700, 250, 55);
INSERT INTO `core_service_drivers` VALUES (699, 250, 56);
INSERT INTO `core_service_drivers` VALUES (704, 251, 50);
INSERT INTO `core_service_drivers` VALUES (703, 251, 55);
INSERT INTO `core_service_drivers` VALUES (702, 251, 56);
INSERT INTO `core_service_drivers` VALUES (707, 252, 50);
INSERT INTO `core_service_drivers` VALUES (706, 252, 55);
INSERT INTO `core_service_drivers` VALUES (705, 252, 56);
INSERT INTO `core_service_drivers` VALUES (710, 253, 50);
INSERT INTO `core_service_drivers` VALUES (709, 253, 55);
INSERT INTO `core_service_drivers` VALUES (708, 253, 56);
INSERT INTO `core_service_drivers` VALUES (713, 254, 50);
INSERT INTO `core_service_drivers` VALUES (712, 254, 55);
INSERT INTO `core_service_drivers` VALUES (711, 254, 56);
INSERT INTO `core_service_drivers` VALUES (716, 255, 50);
INSERT INTO `core_service_drivers` VALUES (715, 255, 55);
INSERT INTO `core_service_drivers` VALUES (714, 255, 56);
INSERT INTO `core_service_drivers` VALUES (719, 256, 50);
INSERT INTO `core_service_drivers` VALUES (718, 256, 55);
INSERT INTO `core_service_drivers` VALUES (717, 256, 56);
INSERT INTO `core_service_drivers` VALUES (722, 257, 50);
INSERT INTO `core_service_drivers` VALUES (721, 257, 55);
INSERT INTO `core_service_drivers` VALUES (720, 257, 56);
INSERT INTO `core_service_drivers` VALUES (725, 258, 50);
INSERT INTO `core_service_drivers` VALUES (724, 258, 55);
INSERT INTO `core_service_drivers` VALUES (723, 258, 56);
INSERT INTO `core_service_drivers` VALUES (728, 259, 50);
INSERT INTO `core_service_drivers` VALUES (727, 259, 55);
INSERT INTO `core_service_drivers` VALUES (726, 259, 56);
INSERT INTO `core_service_drivers` VALUES (731, 260, 50);
INSERT INTO `core_service_drivers` VALUES (730, 260, 55);
INSERT INTO `core_service_drivers` VALUES (729, 260, 56);
INSERT INTO `core_service_drivers` VALUES (734, 261, 50);
INSERT INTO `core_service_drivers` VALUES (733, 261, 55);
INSERT INTO `core_service_drivers` VALUES (732, 261, 56);
INSERT INTO `core_service_drivers` VALUES (737, 262, 50);
INSERT INTO `core_service_drivers` VALUES (736, 262, 55);
INSERT INTO `core_service_drivers` VALUES (735, 262, 56);
INSERT INTO `core_service_drivers` VALUES (740, 263, 50);
INSERT INTO `core_service_drivers` VALUES (739, 263, 55);
INSERT INTO `core_service_drivers` VALUES (738, 263, 56);
INSERT INTO `core_service_drivers` VALUES (743, 264, 50);
INSERT INTO `core_service_drivers` VALUES (742, 264, 55);
INSERT INTO `core_service_drivers` VALUES (741, 264, 56);
INSERT INTO `core_service_drivers` VALUES (746, 265, 50);
INSERT INTO `core_service_drivers` VALUES (745, 265, 55);
INSERT INTO `core_service_drivers` VALUES (744, 265, 56);
INSERT INTO `core_service_drivers` VALUES (749, 266, 50);
INSERT INTO `core_service_drivers` VALUES (748, 266, 55);
INSERT INTO `core_service_drivers` VALUES (747, 266, 56);
INSERT INTO `core_service_drivers` VALUES (752, 267, 50);
INSERT INTO `core_service_drivers` VALUES (751, 267, 55);
INSERT INTO `core_service_drivers` VALUES (750, 267, 56);
INSERT INTO `core_service_drivers` VALUES (755, 268, 50);
INSERT INTO `core_service_drivers` VALUES (754, 268, 55);
INSERT INTO `core_service_drivers` VALUES (753, 268, 56);
INSERT INTO `core_service_drivers` VALUES (758, 269, 50);
INSERT INTO `core_service_drivers` VALUES (757, 269, 55);
INSERT INTO `core_service_drivers` VALUES (756, 269, 56);
INSERT INTO `core_service_drivers` VALUES (761, 270, 50);
INSERT INTO `core_service_drivers` VALUES (760, 270, 55);
INSERT INTO `core_service_drivers` VALUES (759, 270, 56);
INSERT INTO `core_service_drivers` VALUES (764, 271, 50);
INSERT INTO `core_service_drivers` VALUES (763, 271, 55);
INSERT INTO `core_service_drivers` VALUES (762, 271, 56);
INSERT INTO `core_service_drivers` VALUES (767, 272, 50);
INSERT INTO `core_service_drivers` VALUES (766, 272, 55);
INSERT INTO `core_service_drivers` VALUES (765, 272, 56);
INSERT INTO `core_service_drivers` VALUES (770, 273, 50);
INSERT INTO `core_service_drivers` VALUES (769, 273, 55);
INSERT INTO `core_service_drivers` VALUES (768, 273, 56);
INSERT INTO `core_service_drivers` VALUES (773, 274, 50);
INSERT INTO `core_service_drivers` VALUES (772, 274, 55);
INSERT INTO `core_service_drivers` VALUES (771, 274, 56);
INSERT INTO `core_service_drivers` VALUES (776, 275, 50);
INSERT INTO `core_service_drivers` VALUES (775, 275, 55);
INSERT INTO `core_service_drivers` VALUES (774, 275, 56);
INSERT INTO `core_service_drivers` VALUES (779, 276, 50);
INSERT INTO `core_service_drivers` VALUES (778, 276, 55);
INSERT INTO `core_service_drivers` VALUES (777, 276, 56);
INSERT INTO `core_service_drivers` VALUES (782, 277, 50);
INSERT INTO `core_service_drivers` VALUES (781, 277, 55);
INSERT INTO `core_service_drivers` VALUES (780, 277, 56);
INSERT INTO `core_service_drivers` VALUES (785, 278, 50);
INSERT INTO `core_service_drivers` VALUES (784, 278, 55);
INSERT INTO `core_service_drivers` VALUES (783, 278, 56);
INSERT INTO `core_service_drivers` VALUES (787, 279, 51);
INSERT INTO `core_service_drivers` VALUES (786, 279, 52);
INSERT INTO `core_service_drivers` VALUES (788, 279, 55);
INSERT INTO `core_service_drivers` VALUES (790, 280, 51);
INSERT INTO `core_service_drivers` VALUES (789, 280, 52);
INSERT INTO `core_service_drivers` VALUES (791, 280, 55);
INSERT INTO `core_service_drivers` VALUES (793, 281, 51);
INSERT INTO `core_service_drivers` VALUES (792, 281, 52);
INSERT INTO `core_service_drivers` VALUES (794, 281, 55);
INSERT INTO `core_service_drivers` VALUES (796, 282, 51);
INSERT INTO `core_service_drivers` VALUES (795, 282, 52);
INSERT INTO `core_service_drivers` VALUES (797, 282, 55);
INSERT INTO `core_service_drivers` VALUES (799, 283, 51);
INSERT INTO `core_service_drivers` VALUES (798, 283, 52);
INSERT INTO `core_service_drivers` VALUES (800, 283, 55);
INSERT INTO `core_service_drivers` VALUES (802, 284, 51);
INSERT INTO `core_service_drivers` VALUES (801, 284, 52);
INSERT INTO `core_service_drivers` VALUES (803, 284, 55);
INSERT INTO `core_service_drivers` VALUES (805, 285, 51);
INSERT INTO `core_service_drivers` VALUES (804, 285, 52);
INSERT INTO `core_service_drivers` VALUES (806, 285, 55);
INSERT INTO `core_service_drivers` VALUES (808, 286, 51);
INSERT INTO `core_service_drivers` VALUES (807, 286, 52);
INSERT INTO `core_service_drivers` VALUES (809, 286, 55);
INSERT INTO `core_service_drivers` VALUES (811, 287, 51);
INSERT INTO `core_service_drivers` VALUES (810, 287, 52);
INSERT INTO `core_service_drivers` VALUES (812, 287, 55);
INSERT INTO `core_service_drivers` VALUES (814, 288, 51);
INSERT INTO `core_service_drivers` VALUES (813, 288, 52);
INSERT INTO `core_service_drivers` VALUES (815, 288, 55);
INSERT INTO `core_service_drivers` VALUES (817, 289, 51);
INSERT INTO `core_service_drivers` VALUES (816, 289, 52);
INSERT INTO `core_service_drivers` VALUES (818, 289, 55);
INSERT INTO `core_service_drivers` VALUES (820, 290, 51);
INSERT INTO `core_service_drivers` VALUES (819, 290, 52);
INSERT INTO `core_service_drivers` VALUES (821, 290, 55);
INSERT INTO `core_service_drivers` VALUES (823, 291, 51);
INSERT INTO `core_service_drivers` VALUES (822, 291, 52);
INSERT INTO `core_service_drivers` VALUES (824, 291, 55);
INSERT INTO `core_service_drivers` VALUES (826, 292, 51);
INSERT INTO `core_service_drivers` VALUES (825, 292, 52);
INSERT INTO `core_service_drivers` VALUES (827, 292, 55);
INSERT INTO `core_service_drivers` VALUES (829, 293, 51);
INSERT INTO `core_service_drivers` VALUES (828, 293, 52);
INSERT INTO `core_service_drivers` VALUES (830, 293, 55);
INSERT INTO `core_service_drivers` VALUES (832, 294, 51);
INSERT INTO `core_service_drivers` VALUES (831, 294, 52);
INSERT INTO `core_service_drivers` VALUES (833, 294, 55);
INSERT INTO `core_service_drivers` VALUES (835, 295, 51);
INSERT INTO `core_service_drivers` VALUES (834, 295, 52);
INSERT INTO `core_service_drivers` VALUES (836, 295, 55);
INSERT INTO `core_service_drivers` VALUES (838, 296, 51);
INSERT INTO `core_service_drivers` VALUES (837, 296, 52);
INSERT INTO `core_service_drivers` VALUES (839, 296, 55);
INSERT INTO `core_service_drivers` VALUES (841, 297, 51);
INSERT INTO `core_service_drivers` VALUES (840, 297, 52);
INSERT INTO `core_service_drivers` VALUES (842, 297, 55);
INSERT INTO `core_service_drivers` VALUES (844, 298, 51);
INSERT INTO `core_service_drivers` VALUES (843, 298, 52);
INSERT INTO `core_service_drivers` VALUES (845, 298, 55);
INSERT INTO `core_service_drivers` VALUES (847, 299, 51);
INSERT INTO `core_service_drivers` VALUES (846, 299, 52);
INSERT INTO `core_service_drivers` VALUES (848, 299, 55);
INSERT INTO `core_service_drivers` VALUES (850, 300, 51);
INSERT INTO `core_service_drivers` VALUES (849, 300, 52);
INSERT INTO `core_service_drivers` VALUES (851, 300, 55);
INSERT INTO `core_service_drivers` VALUES (853, 301, 51);
INSERT INTO `core_service_drivers` VALUES (852, 301, 52);
INSERT INTO `core_service_drivers` VALUES (854, 301, 55);
INSERT INTO `core_service_drivers` VALUES (856, 302, 51);
INSERT INTO `core_service_drivers` VALUES (855, 302, 52);
INSERT INTO `core_service_drivers` VALUES (857, 302, 55);
INSERT INTO `core_service_drivers` VALUES (859, 303, 51);
INSERT INTO `core_service_drivers` VALUES (858, 303, 52);
INSERT INTO `core_service_drivers` VALUES (860, 303, 55);
INSERT INTO `core_service_drivers` VALUES (862, 304, 51);
INSERT INTO `core_service_drivers` VALUES (861, 304, 52);
INSERT INTO `core_service_drivers` VALUES (863, 304, 55);
INSERT INTO `core_service_drivers` VALUES (865, 305, 51);
INSERT INTO `core_service_drivers` VALUES (864, 305, 52);
INSERT INTO `core_service_drivers` VALUES (866, 305, 55);
INSERT INTO `core_service_drivers` VALUES (868, 306, 51);
INSERT INTO `core_service_drivers` VALUES (867, 306, 52);
INSERT INTO `core_service_drivers` VALUES (869, 306, 55);
INSERT INTO `core_service_drivers` VALUES (871, 307, 51);
INSERT INTO `core_service_drivers` VALUES (870, 307, 52);
INSERT INTO `core_service_drivers` VALUES (872, 307, 55);
INSERT INTO `core_service_drivers` VALUES (874, 308, 51);
INSERT INTO `core_service_drivers` VALUES (873, 308, 52);
INSERT INTO `core_service_drivers` VALUES (875, 308, 55);
INSERT INTO `core_service_drivers` VALUES (877, 309, 51);
INSERT INTO `core_service_drivers` VALUES (876, 309, 52);
INSERT INTO `core_service_drivers` VALUES (878, 309, 55);
INSERT INTO `core_service_drivers` VALUES (880, 310, 51);
INSERT INTO `core_service_drivers` VALUES (879, 310, 52);
INSERT INTO `core_service_drivers` VALUES (881, 310, 55);
INSERT INTO `core_service_drivers` VALUES (883, 311, 51);
INSERT INTO `core_service_drivers` VALUES (882, 311, 52);
INSERT INTO `core_service_drivers` VALUES (884, 311, 55);
INSERT INTO `core_service_drivers` VALUES (886, 312, 51);
INSERT INTO `core_service_drivers` VALUES (885, 312, 52);
INSERT INTO `core_service_drivers` VALUES (887, 312, 55);
INSERT INTO `core_service_drivers` VALUES (889, 313, 51);
INSERT INTO `core_service_drivers` VALUES (888, 313, 52);
INSERT INTO `core_service_drivers` VALUES (890, 313, 55);
INSERT INTO `core_service_drivers` VALUES (892, 314, 51);
INSERT INTO `core_service_drivers` VALUES (891, 314, 52);
INSERT INTO `core_service_drivers` VALUES (893, 314, 55);
INSERT INTO `core_service_drivers` VALUES (895, 315, 51);
INSERT INTO `core_service_drivers` VALUES (894, 315, 52);
INSERT INTO `core_service_drivers` VALUES (896, 315, 55);
INSERT INTO `core_service_drivers` VALUES (898, 316, 51);
INSERT INTO `core_service_drivers` VALUES (897, 316, 52);
INSERT INTO `core_service_drivers` VALUES (899, 316, 55);
INSERT INTO `core_service_drivers` VALUES (901, 317, 51);
INSERT INTO `core_service_drivers` VALUES (900, 317, 52);
INSERT INTO `core_service_drivers` VALUES (902, 317, 55);
INSERT INTO `core_service_drivers` VALUES (904, 318, 51);
INSERT INTO `core_service_drivers` VALUES (903, 318, 52);
INSERT INTO `core_service_drivers` VALUES (905, 318, 55);
INSERT INTO `core_service_drivers` VALUES (907, 319, 51);
INSERT INTO `core_service_drivers` VALUES (906, 319, 52);
INSERT INTO `core_service_drivers` VALUES (908, 319, 55);
INSERT INTO `core_service_drivers` VALUES (910, 320, 51);
INSERT INTO `core_service_drivers` VALUES (909, 320, 52);
INSERT INTO `core_service_drivers` VALUES (911, 320, 55);
INSERT INTO `core_service_drivers` VALUES (913, 321, 51);
INSERT INTO `core_service_drivers` VALUES (912, 321, 52);
INSERT INTO `core_service_drivers` VALUES (914, 321, 55);
INSERT INTO `core_service_drivers` VALUES (916, 322, 51);
INSERT INTO `core_service_drivers` VALUES (915, 322, 52);
INSERT INTO `core_service_drivers` VALUES (917, 322, 55);
INSERT INTO `core_service_drivers` VALUES (919, 323, 51);
INSERT INTO `core_service_drivers` VALUES (918, 323, 52);
INSERT INTO `core_service_drivers` VALUES (920, 323, 55);
INSERT INTO `core_service_drivers` VALUES (922, 324, 51);
INSERT INTO `core_service_drivers` VALUES (921, 324, 52);
INSERT INTO `core_service_drivers` VALUES (923, 324, 55);
INSERT INTO `core_service_drivers` VALUES (925, 325, 51);
INSERT INTO `core_service_drivers` VALUES (924, 325, 52);
INSERT INTO `core_service_drivers` VALUES (926, 325, 55);
INSERT INTO `core_service_drivers` VALUES (928, 326, 51);
INSERT INTO `core_service_drivers` VALUES (927, 326, 52);
INSERT INTO `core_service_drivers` VALUES (929, 326, 55);
INSERT INTO `core_service_drivers` VALUES (931, 327, 51);
INSERT INTO `core_service_drivers` VALUES (930, 327, 52);
INSERT INTO `core_service_drivers` VALUES (932, 327, 55);
INSERT INTO `core_service_drivers` VALUES (934, 328, 51);
INSERT INTO `core_service_drivers` VALUES (933, 328, 52);
INSERT INTO `core_service_drivers` VALUES (935, 328, 55);
INSERT INTO `core_service_drivers` VALUES (937, 329, 51);
INSERT INTO `core_service_drivers` VALUES (936, 329, 52);
INSERT INTO `core_service_drivers` VALUES (938, 329, 55);
INSERT INTO `core_service_drivers` VALUES (940, 330, 51);
INSERT INTO `core_service_drivers` VALUES (939, 330, 52);
INSERT INTO `core_service_drivers` VALUES (941, 330, 55);
INSERT INTO `core_service_drivers` VALUES (943, 331, 51);
INSERT INTO `core_service_drivers` VALUES (942, 331, 52);
INSERT INTO `core_service_drivers` VALUES (944, 331, 55);
INSERT INTO `core_service_drivers` VALUES (946, 332, 51);
INSERT INTO `core_service_drivers` VALUES (945, 332, 52);
INSERT INTO `core_service_drivers` VALUES (947, 332, 55);
INSERT INTO `core_service_drivers` VALUES (949, 333, 51);
INSERT INTO `core_service_drivers` VALUES (948, 333, 52);
INSERT INTO `core_service_drivers` VALUES (950, 333, 55);
INSERT INTO `core_service_drivers` VALUES (952, 334, 51);
INSERT INTO `core_service_drivers` VALUES (951, 334, 52);
INSERT INTO `core_service_drivers` VALUES (953, 334, 55);
INSERT INTO `core_service_drivers` VALUES (955, 335, 51);
INSERT INTO `core_service_drivers` VALUES (954, 335, 52);
INSERT INTO `core_service_drivers` VALUES (956, 335, 55);
INSERT INTO `core_service_drivers` VALUES (958, 336, 51);
INSERT INTO `core_service_drivers` VALUES (957, 336, 52);
INSERT INTO `core_service_drivers` VALUES (959, 336, 55);
INSERT INTO `core_service_drivers` VALUES (961, 337, 51);
INSERT INTO `core_service_drivers` VALUES (960, 337, 52);
INSERT INTO `core_service_drivers` VALUES (962, 337, 55);
INSERT INTO `core_service_drivers` VALUES (964, 338, 51);
INSERT INTO `core_service_drivers` VALUES (963, 338, 52);
INSERT INTO `core_service_drivers` VALUES (965, 338, 55);
INSERT INTO `core_service_drivers` VALUES (967, 339, 51);
INSERT INTO `core_service_drivers` VALUES (966, 339, 52);
INSERT INTO `core_service_drivers` VALUES (968, 339, 55);
INSERT INTO `core_service_drivers` VALUES (970, 340, 51);
INSERT INTO `core_service_drivers` VALUES (969, 340, 52);
INSERT INTO `core_service_drivers` VALUES (971, 340, 55);
INSERT INTO `core_service_drivers` VALUES (973, 341, 51);
INSERT INTO `core_service_drivers` VALUES (972, 341, 52);
INSERT INTO `core_service_drivers` VALUES (974, 341, 55);
INSERT INTO `core_service_drivers` VALUES (976, 342, 51);
INSERT INTO `core_service_drivers` VALUES (975, 342, 52);
INSERT INTO `core_service_drivers` VALUES (977, 342, 55);
INSERT INTO `core_service_drivers` VALUES (979, 343, 51);
INSERT INTO `core_service_drivers` VALUES (978, 343, 52);
INSERT INTO `core_service_drivers` VALUES (980, 343, 55);
INSERT INTO `core_service_drivers` VALUES (982, 344, 51);
INSERT INTO `core_service_drivers` VALUES (981, 344, 52);
INSERT INTO `core_service_drivers` VALUES (983, 344, 55);
INSERT INTO `core_service_drivers` VALUES (985, 345, 51);
INSERT INTO `core_service_drivers` VALUES (984, 345, 52);
INSERT INTO `core_service_drivers` VALUES (986, 345, 55);
INSERT INTO `core_service_drivers` VALUES (988, 346, 51);
INSERT INTO `core_service_drivers` VALUES (987, 346, 52);
INSERT INTO `core_service_drivers` VALUES (989, 346, 55);
INSERT INTO `core_service_drivers` VALUES (991, 347, 51);
INSERT INTO `core_service_drivers` VALUES (990, 347, 52);
INSERT INTO `core_service_drivers` VALUES (992, 347, 55);
INSERT INTO `core_service_drivers` VALUES (994, 348, 51);
INSERT INTO `core_service_drivers` VALUES (993, 348, 52);
INSERT INTO `core_service_drivers` VALUES (995, 348, 55);
INSERT INTO `core_service_drivers` VALUES (997, 349, 51);
INSERT INTO `core_service_drivers` VALUES (996, 349, 52);
INSERT INTO `core_service_drivers` VALUES (998, 349, 55);
INSERT INTO `core_service_drivers` VALUES (1000, 350, 51);
INSERT INTO `core_service_drivers` VALUES (999, 350, 52);
INSERT INTO `core_service_drivers` VALUES (1001, 350, 55);
INSERT INTO `core_service_drivers` VALUES (1003, 351, 51);
INSERT INTO `core_service_drivers` VALUES (1002, 351, 52);
INSERT INTO `core_service_drivers` VALUES (1004, 351, 55);
INSERT INTO `core_service_drivers` VALUES (1006, 352, 51);
INSERT INTO `core_service_drivers` VALUES (1005, 352, 52);
INSERT INTO `core_service_drivers` VALUES (1007, 352, 55);
INSERT INTO `core_service_drivers` VALUES (1009, 353, 51);
INSERT INTO `core_service_drivers` VALUES (1008, 353, 52);
INSERT INTO `core_service_drivers` VALUES (1010, 353, 55);
INSERT INTO `core_service_drivers` VALUES (1012, 354, 51);
INSERT INTO `core_service_drivers` VALUES (1011, 354, 52);
INSERT INTO `core_service_drivers` VALUES (1013, 354, 55);
INSERT INTO `core_service_drivers` VALUES (1015, 355, 51);
INSERT INTO `core_service_drivers` VALUES (1014, 355, 52);
INSERT INTO `core_service_drivers` VALUES (1016, 355, 55);
INSERT INTO `core_service_drivers` VALUES (1018, 356, 51);
INSERT INTO `core_service_drivers` VALUES (1017, 356, 52);
INSERT INTO `core_service_drivers` VALUES (1019, 356, 55);
INSERT INTO `core_service_drivers` VALUES (1021, 357, 51);
INSERT INTO `core_service_drivers` VALUES (1020, 357, 52);
INSERT INTO `core_service_drivers` VALUES (1022, 357, 55);
INSERT INTO `core_service_drivers` VALUES (1024, 358, 51);
INSERT INTO `core_service_drivers` VALUES (1023, 358, 52);
INSERT INTO `core_service_drivers` VALUES (1025, 358, 55);
INSERT INTO `core_service_drivers` VALUES (1027, 359, 51);
INSERT INTO `core_service_drivers` VALUES (1026, 359, 52);
INSERT INTO `core_service_drivers` VALUES (1028, 359, 55);
INSERT INTO `core_service_drivers` VALUES (1030, 360, 51);
INSERT INTO `core_service_drivers` VALUES (1029, 360, 52);
INSERT INTO `core_service_drivers` VALUES (1031, 360, 55);
INSERT INTO `core_service_drivers` VALUES (1033, 361, 51);
INSERT INTO `core_service_drivers` VALUES (1032, 361, 52);
INSERT INTO `core_service_drivers` VALUES (1034, 361, 55);
INSERT INTO `core_service_drivers` VALUES (1036, 362, 51);
INSERT INTO `core_service_drivers` VALUES (1035, 362, 52);
INSERT INTO `core_service_drivers` VALUES (1037, 362, 55);
INSERT INTO `core_service_drivers` VALUES (1039, 363, 51);
INSERT INTO `core_service_drivers` VALUES (1038, 363, 52);
INSERT INTO `core_service_drivers` VALUES (1040, 363, 55);
INSERT INTO `core_service_drivers` VALUES (1042, 364, 51);
INSERT INTO `core_service_drivers` VALUES (1041, 364, 52);
INSERT INTO `core_service_drivers` VALUES (1043, 364, 55);
INSERT INTO `core_service_drivers` VALUES (1045, 365, 51);
INSERT INTO `core_service_drivers` VALUES (1044, 365, 52);
INSERT INTO `core_service_drivers` VALUES (1046, 365, 55);
INSERT INTO `core_service_drivers` VALUES (1048, 366, 51);
INSERT INTO `core_service_drivers` VALUES (1047, 366, 52);
INSERT INTO `core_service_drivers` VALUES (1049, 366, 55);
INSERT INTO `core_service_drivers` VALUES (1051, 367, 51);
INSERT INTO `core_service_drivers` VALUES (1050, 367, 52);
INSERT INTO `core_service_drivers` VALUES (1052, 367, 55);
INSERT INTO `core_service_drivers` VALUES (1054, 368, 51);
INSERT INTO `core_service_drivers` VALUES (1053, 368, 52);
INSERT INTO `core_service_drivers` VALUES (1055, 368, 55);
INSERT INTO `core_service_drivers` VALUES (1057, 369, 51);
INSERT INTO `core_service_drivers` VALUES (1056, 369, 52);
INSERT INTO `core_service_drivers` VALUES (1058, 369, 55);
INSERT INTO `core_service_drivers` VALUES (1060, 370, 51);
INSERT INTO `core_service_drivers` VALUES (1059, 370, 52);
INSERT INTO `core_service_drivers` VALUES (1061, 370, 55);
INSERT INTO `core_service_drivers` VALUES (1063, 371, 51);
INSERT INTO `core_service_drivers` VALUES (1062, 371, 52);
INSERT INTO `core_service_drivers` VALUES (1064, 371, 55);
INSERT INTO `core_service_drivers` VALUES (1066, 372, 51);
INSERT INTO `core_service_drivers` VALUES (1065, 372, 52);
INSERT INTO `core_service_drivers` VALUES (1067, 372, 55);
INSERT INTO `core_service_drivers` VALUES (1069, 373, 51);
INSERT INTO `core_service_drivers` VALUES (1068, 373, 52);
INSERT INTO `core_service_drivers` VALUES (1070, 373, 55);
INSERT INTO `core_service_drivers` VALUES (1072, 374, 51);
INSERT INTO `core_service_drivers` VALUES (1071, 374, 52);
INSERT INTO `core_service_drivers` VALUES (1073, 374, 55);
INSERT INTO `core_service_drivers` VALUES (1075, 375, 51);
INSERT INTO `core_service_drivers` VALUES (1074, 375, 52);
INSERT INTO `core_service_drivers` VALUES (1076, 375, 55);
INSERT INTO `core_service_drivers` VALUES (1078, 376, 51);
INSERT INTO `core_service_drivers` VALUES (1077, 376, 52);
INSERT INTO `core_service_drivers` VALUES (1079, 376, 55);
INSERT INTO `core_service_drivers` VALUES (1081, 377, 51);
INSERT INTO `core_service_drivers` VALUES (1080, 377, 52);
INSERT INTO `core_service_drivers` VALUES (1082, 377, 55);
INSERT INTO `core_service_drivers` VALUES (1084, 378, 51);
INSERT INTO `core_service_drivers` VALUES (1083, 378, 52);
INSERT INTO `core_service_drivers` VALUES (1085, 378, 55);
INSERT INTO `core_service_drivers` VALUES (1087, 379, 51);
INSERT INTO `core_service_drivers` VALUES (1086, 379, 52);
INSERT INTO `core_service_drivers` VALUES (1088, 379, 55);
INSERT INTO `core_service_drivers` VALUES (1090, 380, 51);
INSERT INTO `core_service_drivers` VALUES (1089, 380, 52);
INSERT INTO `core_service_drivers` VALUES (1091, 380, 55);
INSERT INTO `core_service_drivers` VALUES (1093, 381, 51);
INSERT INTO `core_service_drivers` VALUES (1092, 381, 52);
INSERT INTO `core_service_drivers` VALUES (1094, 381, 55);
INSERT INTO `core_service_drivers` VALUES (1096, 382, 51);
INSERT INTO `core_service_drivers` VALUES (1095, 382, 52);
INSERT INTO `core_service_drivers` VALUES (1097, 382, 55);
INSERT INTO `core_service_drivers` VALUES (1099, 383, 51);
INSERT INTO `core_service_drivers` VALUES (1098, 383, 52);
INSERT INTO `core_service_drivers` VALUES (1100, 383, 55);
INSERT INTO `core_service_drivers` VALUES (1102, 384, 51);
INSERT INTO `core_service_drivers` VALUES (1101, 384, 52);
INSERT INTO `core_service_drivers` VALUES (1103, 384, 55);
INSERT INTO `core_service_drivers` VALUES (1105, 385, 51);
INSERT INTO `core_service_drivers` VALUES (1104, 385, 52);
INSERT INTO `core_service_drivers` VALUES (1106, 385, 55);
INSERT INTO `core_service_drivers` VALUES (1108, 386, 51);
INSERT INTO `core_service_drivers` VALUES (1107, 386, 52);
INSERT INTO `core_service_drivers` VALUES (1109, 386, 55);
INSERT INTO `core_service_drivers` VALUES (1111, 387, 51);
INSERT INTO `core_service_drivers` VALUES (1110, 387, 52);
INSERT INTO `core_service_drivers` VALUES (1112, 387, 55);
INSERT INTO `core_service_drivers` VALUES (1114, 388, 51);
INSERT INTO `core_service_drivers` VALUES (1113, 388, 52);
INSERT INTO `core_service_drivers` VALUES (1115, 388, 55);
INSERT INTO `core_service_drivers` VALUES (1117, 389, 51);
INSERT INTO `core_service_drivers` VALUES (1116, 389, 52);
INSERT INTO `core_service_drivers` VALUES (1118, 389, 55);
INSERT INTO `core_service_drivers` VALUES (1120, 390, 51);
INSERT INTO `core_service_drivers` VALUES (1119, 390, 52);
INSERT INTO `core_service_drivers` VALUES (1121, 390, 55);
INSERT INTO `core_service_drivers` VALUES (1123, 391, 51);
INSERT INTO `core_service_drivers` VALUES (1122, 391, 52);
INSERT INTO `core_service_drivers` VALUES (1124, 391, 55);
INSERT INTO `core_service_drivers` VALUES (1126, 392, 51);
INSERT INTO `core_service_drivers` VALUES (1125, 392, 52);
INSERT INTO `core_service_drivers` VALUES (1127, 392, 55);
INSERT INTO `core_service_drivers` VALUES (1129, 393, 51);
INSERT INTO `core_service_drivers` VALUES (1128, 393, 52);
INSERT INTO `core_service_drivers` VALUES (1130, 393, 55);
INSERT INTO `core_service_drivers` VALUES (1132, 394, 51);
INSERT INTO `core_service_drivers` VALUES (1131, 394, 52);
INSERT INTO `core_service_drivers` VALUES (1133, 394, 55);
INSERT INTO `core_service_drivers` VALUES (1135, 395, 51);
INSERT INTO `core_service_drivers` VALUES (1134, 395, 52);
INSERT INTO `core_service_drivers` VALUES (1136, 395, 55);
INSERT INTO `core_service_drivers` VALUES (1138, 396, 51);
INSERT INTO `core_service_drivers` VALUES (1137, 396, 52);
INSERT INTO `core_service_drivers` VALUES (1139, 396, 55);
INSERT INTO `core_service_drivers` VALUES (1141, 397, 51);
INSERT INTO `core_service_drivers` VALUES (1140, 397, 52);
INSERT INTO `core_service_drivers` VALUES (1142, 397, 55);
INSERT INTO `core_service_drivers` VALUES (1144, 398, 51);
INSERT INTO `core_service_drivers` VALUES (1143, 398, 52);
INSERT INTO `core_service_drivers` VALUES (1145, 398, 55);
INSERT INTO `core_service_drivers` VALUES (1147, 399, 51);
INSERT INTO `core_service_drivers` VALUES (1146, 399, 52);
INSERT INTO `core_service_drivers` VALUES (1148, 399, 55);
INSERT INTO `core_service_drivers` VALUES (1150, 400, 51);
INSERT INTO `core_service_drivers` VALUES (1149, 400, 52);
INSERT INTO `core_service_drivers` VALUES (1151, 400, 55);
INSERT INTO `core_service_drivers` VALUES (1152, 401, 40);
INSERT INTO `core_service_drivers` VALUES (1153, 401, 49);
INSERT INTO `core_service_drivers` VALUES (1154, 401, 51);
INSERT INTO `core_service_drivers` VALUES (1155, 402, 40);
INSERT INTO `core_service_drivers` VALUES (1156, 402, 49);
INSERT INTO `core_service_drivers` VALUES (1157, 402, 51);
INSERT INTO `core_service_drivers` VALUES (1158, 403, 40);
INSERT INTO `core_service_drivers` VALUES (1159, 403, 49);
INSERT INTO `core_service_drivers` VALUES (1160, 403, 51);
INSERT INTO `core_service_drivers` VALUES (1161, 404, 40);
INSERT INTO `core_service_drivers` VALUES (1162, 404, 49);
INSERT INTO `core_service_drivers` VALUES (1163, 404, 51);
INSERT INTO `core_service_drivers` VALUES (1164, 405, 40);
INSERT INTO `core_service_drivers` VALUES (1165, 405, 49);
INSERT INTO `core_service_drivers` VALUES (1166, 405, 51);
INSERT INTO `core_service_drivers` VALUES (1167, 406, 40);
INSERT INTO `core_service_drivers` VALUES (1168, 406, 49);
INSERT INTO `core_service_drivers` VALUES (1169, 406, 51);
INSERT INTO `core_service_drivers` VALUES (1170, 407, 40);
INSERT INTO `core_service_drivers` VALUES (1171, 407, 49);
INSERT INTO `core_service_drivers` VALUES (1172, 407, 51);
INSERT INTO `core_service_drivers` VALUES (1173, 408, 40);
INSERT INTO `core_service_drivers` VALUES (1174, 408, 49);
INSERT INTO `core_service_drivers` VALUES (1175, 408, 51);
INSERT INTO `core_service_drivers` VALUES (1176, 409, 40);
INSERT INTO `core_service_drivers` VALUES (1177, 409, 49);
INSERT INTO `core_service_drivers` VALUES (1178, 409, 51);
INSERT INTO `core_service_drivers` VALUES (1179, 410, 40);
INSERT INTO `core_service_drivers` VALUES (1180, 410, 49);
INSERT INTO `core_service_drivers` VALUES (1181, 410, 51);
INSERT INTO `core_service_drivers` VALUES (1182, 411, 40);
INSERT INTO `core_service_drivers` VALUES (1183, 411, 49);
INSERT INTO `core_service_drivers` VALUES (1184, 411, 51);
INSERT INTO `core_service_drivers` VALUES (1185, 412, 40);
INSERT INTO `core_service_drivers` VALUES (1186, 412, 49);
INSERT INTO `core_service_drivers` VALUES (1187, 412, 51);
INSERT INTO `core_service_drivers` VALUES (1188, 413, 40);
INSERT INTO `core_service_drivers` VALUES (1189, 413, 49);
INSERT INTO `core_service_drivers` VALUES (1190, 413, 51);
INSERT INTO `core_service_drivers` VALUES (1191, 414, 40);
INSERT INTO `core_service_drivers` VALUES (1192, 414, 49);
INSERT INTO `core_service_drivers` VALUES (1193, 414, 51);
INSERT INTO `core_service_drivers` VALUES (1194, 415, 40);
INSERT INTO `core_service_drivers` VALUES (1195, 415, 49);
INSERT INTO `core_service_drivers` VALUES (1196, 415, 51);
INSERT INTO `core_service_drivers` VALUES (1197, 416, 40);
INSERT INTO `core_service_drivers` VALUES (1198, 416, 49);
INSERT INTO `core_service_drivers` VALUES (1199, 416, 51);
INSERT INTO `core_service_drivers` VALUES (1200, 417, 40);
INSERT INTO `core_service_drivers` VALUES (1201, 417, 49);
INSERT INTO `core_service_drivers` VALUES (1202, 417, 51);
INSERT INTO `core_service_drivers` VALUES (1203, 418, 40);
INSERT INTO `core_service_drivers` VALUES (1204, 418, 49);
INSERT INTO `core_service_drivers` VALUES (1205, 418, 51);
INSERT INTO `core_service_drivers` VALUES (1206, 419, 40);
INSERT INTO `core_service_drivers` VALUES (1207, 419, 49);
INSERT INTO `core_service_drivers` VALUES (1208, 419, 51);
INSERT INTO `core_service_drivers` VALUES (1209, 420, 40);
INSERT INTO `core_service_drivers` VALUES (1210, 420, 49);
INSERT INTO `core_service_drivers` VALUES (1211, 420, 51);
INSERT INTO `core_service_drivers` VALUES (1212, 421, 40);
INSERT INTO `core_service_drivers` VALUES (1213, 421, 49);
INSERT INTO `core_service_drivers` VALUES (1214, 421, 51);
INSERT INTO `core_service_drivers` VALUES (1215, 422, 40);
INSERT INTO `core_service_drivers` VALUES (1216, 422, 49);
INSERT INTO `core_service_drivers` VALUES (1217, 422, 51);
INSERT INTO `core_service_drivers` VALUES (1218, 423, 40);
INSERT INTO `core_service_drivers` VALUES (1219, 423, 49);
INSERT INTO `core_service_drivers` VALUES (1220, 423, 51);
INSERT INTO `core_service_drivers` VALUES (1221, 424, 40);
INSERT INTO `core_service_drivers` VALUES (1222, 424, 49);
INSERT INTO `core_service_drivers` VALUES (1223, 424, 51);
INSERT INTO `core_service_drivers` VALUES (1224, 425, 40);
INSERT INTO `core_service_drivers` VALUES (1225, 425, 49);
INSERT INTO `core_service_drivers` VALUES (1226, 425, 51);
INSERT INTO `core_service_drivers` VALUES (1227, 426, 40);
INSERT INTO `core_service_drivers` VALUES (1228, 426, 49);
INSERT INTO `core_service_drivers` VALUES (1229, 426, 51);
INSERT INTO `core_service_drivers` VALUES (1230, 427, 40);
INSERT INTO `core_service_drivers` VALUES (1231, 427, 49);
INSERT INTO `core_service_drivers` VALUES (1232, 427, 51);
INSERT INTO `core_service_drivers` VALUES (1233, 428, 40);
INSERT INTO `core_service_drivers` VALUES (1234, 428, 49);
INSERT INTO `core_service_drivers` VALUES (1235, 428, 51);
INSERT INTO `core_service_drivers` VALUES (1236, 429, 40);
INSERT INTO `core_service_drivers` VALUES (1237, 429, 49);
INSERT INTO `core_service_drivers` VALUES (1238, 429, 51);
INSERT INTO `core_service_drivers` VALUES (1239, 430, 40);
INSERT INTO `core_service_drivers` VALUES (1240, 430, 49);
INSERT INTO `core_service_drivers` VALUES (1241, 430, 51);
INSERT INTO `core_service_drivers` VALUES (1242, 431, 40);
INSERT INTO `core_service_drivers` VALUES (1243, 431, 49);
INSERT INTO `core_service_drivers` VALUES (1244, 431, 51);
INSERT INTO `core_service_drivers` VALUES (1245, 432, 40);
INSERT INTO `core_service_drivers` VALUES (1246, 432, 49);
INSERT INTO `core_service_drivers` VALUES (1247, 432, 51);
INSERT INTO `core_service_drivers` VALUES (1248, 433, 40);
INSERT INTO `core_service_drivers` VALUES (1249, 433, 49);
INSERT INTO `core_service_drivers` VALUES (1250, 433, 51);
INSERT INTO `core_service_drivers` VALUES (1251, 434, 40);
INSERT INTO `core_service_drivers` VALUES (1252, 434, 49);
INSERT INTO `core_service_drivers` VALUES (1253, 434, 51);
INSERT INTO `core_service_drivers` VALUES (1254, 435, 40);
INSERT INTO `core_service_drivers` VALUES (1255, 435, 49);
INSERT INTO `core_service_drivers` VALUES (1256, 435, 51);
INSERT INTO `core_service_drivers` VALUES (1257, 436, 40);
INSERT INTO `core_service_drivers` VALUES (1258, 436, 49);
INSERT INTO `core_service_drivers` VALUES (1259, 436, 51);
INSERT INTO `core_service_drivers` VALUES (1260, 437, 40);
INSERT INTO `core_service_drivers` VALUES (1261, 437, 49);
INSERT INTO `core_service_drivers` VALUES (1262, 437, 51);
INSERT INTO `core_service_drivers` VALUES (1263, 438, 40);
INSERT INTO `core_service_drivers` VALUES (1264, 438, 49);
INSERT INTO `core_service_drivers` VALUES (1265, 438, 51);
INSERT INTO `core_service_drivers` VALUES (1266, 439, 40);
INSERT INTO `core_service_drivers` VALUES (1267, 439, 49);
INSERT INTO `core_service_drivers` VALUES (1268, 439, 51);
INSERT INTO `core_service_drivers` VALUES (1269, 440, 40);
INSERT INTO `core_service_drivers` VALUES (1270, 440, 49);
INSERT INTO `core_service_drivers` VALUES (1271, 440, 51);
INSERT INTO `core_service_drivers` VALUES (1272, 441, 40);
INSERT INTO `core_service_drivers` VALUES (1273, 441, 49);
INSERT INTO `core_service_drivers` VALUES (1274, 441, 51);
INSERT INTO `core_service_drivers` VALUES (1275, 442, 40);
INSERT INTO `core_service_drivers` VALUES (1276, 442, 49);
INSERT INTO `core_service_drivers` VALUES (1277, 442, 51);
INSERT INTO `core_service_drivers` VALUES (1278, 443, 40);
INSERT INTO `core_service_drivers` VALUES (1279, 443, 49);
INSERT INTO `core_service_drivers` VALUES (1280, 443, 51);
INSERT INTO `core_service_drivers` VALUES (1281, 444, 40);
INSERT INTO `core_service_drivers` VALUES (1282, 444, 49);
INSERT INTO `core_service_drivers` VALUES (1283, 444, 51);
INSERT INTO `core_service_drivers` VALUES (1284, 445, 40);
INSERT INTO `core_service_drivers` VALUES (1285, 445, 49);
INSERT INTO `core_service_drivers` VALUES (1286, 445, 51);
INSERT INTO `core_service_drivers` VALUES (1287, 446, 40);
INSERT INTO `core_service_drivers` VALUES (1288, 446, 49);
INSERT INTO `core_service_drivers` VALUES (1289, 446, 51);
INSERT INTO `core_service_drivers` VALUES (1290, 447, 40);
INSERT INTO `core_service_drivers` VALUES (1291, 447, 49);
INSERT INTO `core_service_drivers` VALUES (1292, 447, 51);
INSERT INTO `core_service_drivers` VALUES (1293, 448, 40);
INSERT INTO `core_service_drivers` VALUES (1294, 448, 49);
INSERT INTO `core_service_drivers` VALUES (1295, 448, 51);
INSERT INTO `core_service_drivers` VALUES (1296, 449, 40);
INSERT INTO `core_service_drivers` VALUES (1297, 449, 49);
INSERT INTO `core_service_drivers` VALUES (1298, 449, 51);
INSERT INTO `core_service_drivers` VALUES (1299, 450, 40);
INSERT INTO `core_service_drivers` VALUES (1300, 450, 49);
INSERT INTO `core_service_drivers` VALUES (1301, 450, 51);
INSERT INTO `core_service_drivers` VALUES (1302, 451, 40);
INSERT INTO `core_service_drivers` VALUES (1303, 451, 49);
INSERT INTO `core_service_drivers` VALUES (1304, 451, 51);
INSERT INTO `core_service_drivers` VALUES (1305, 452, 40);
INSERT INTO `core_service_drivers` VALUES (1306, 452, 49);
INSERT INTO `core_service_drivers` VALUES (1307, 452, 51);
INSERT INTO `core_service_drivers` VALUES (1308, 453, 40);
INSERT INTO `core_service_drivers` VALUES (1309, 453, 49);
INSERT INTO `core_service_drivers` VALUES (1310, 453, 51);
INSERT INTO `core_service_drivers` VALUES (1311, 454, 40);
INSERT INTO `core_service_drivers` VALUES (1312, 454, 49);
INSERT INTO `core_service_drivers` VALUES (1313, 454, 51);
INSERT INTO `core_service_drivers` VALUES (1314, 455, 40);
INSERT INTO `core_service_drivers` VALUES (1315, 455, 49);
INSERT INTO `core_service_drivers` VALUES (1316, 455, 51);
INSERT INTO `core_service_drivers` VALUES (1317, 456, 40);
INSERT INTO `core_service_drivers` VALUES (1318, 456, 49);
INSERT INTO `core_service_drivers` VALUES (1319, 456, 51);
INSERT INTO `core_service_drivers` VALUES (1320, 457, 40);
INSERT INTO `core_service_drivers` VALUES (1321, 457, 49);
INSERT INTO `core_service_drivers` VALUES (1322, 457, 51);
INSERT INTO `core_service_drivers` VALUES (1323, 458, 40);
INSERT INTO `core_service_drivers` VALUES (1324, 458, 49);
INSERT INTO `core_service_drivers` VALUES (1325, 458, 51);
INSERT INTO `core_service_drivers` VALUES (1326, 459, 40);
INSERT INTO `core_service_drivers` VALUES (1327, 459, 49);
INSERT INTO `core_service_drivers` VALUES (1328, 459, 51);
INSERT INTO `core_service_drivers` VALUES (1329, 460, 40);
INSERT INTO `core_service_drivers` VALUES (1330, 460, 49);
INSERT INTO `core_service_drivers` VALUES (1331, 460, 51);
INSERT INTO `core_service_drivers` VALUES (1332, 461, 40);
INSERT INTO `core_service_drivers` VALUES (1333, 461, 49);
INSERT INTO `core_service_drivers` VALUES (1334, 461, 51);
INSERT INTO `core_service_drivers` VALUES (1335, 462, 40);
INSERT INTO `core_service_drivers` VALUES (1336, 462, 49);
INSERT INTO `core_service_drivers` VALUES (1337, 462, 51);
INSERT INTO `core_service_drivers` VALUES (1338, 463, 40);
INSERT INTO `core_service_drivers` VALUES (1339, 463, 49);
INSERT INTO `core_service_drivers` VALUES (1340, 463, 51);
INSERT INTO `core_service_drivers` VALUES (1341, 464, 40);
INSERT INTO `core_service_drivers` VALUES (1342, 464, 49);
INSERT INTO `core_service_drivers` VALUES (1343, 464, 51);
INSERT INTO `core_service_drivers` VALUES (1344, 465, 40);
INSERT INTO `core_service_drivers` VALUES (1345, 465, 49);
INSERT INTO `core_service_drivers` VALUES (1346, 465, 51);
INSERT INTO `core_service_drivers` VALUES (1347, 466, 40);
INSERT INTO `core_service_drivers` VALUES (1348, 466, 49);
INSERT INTO `core_service_drivers` VALUES (1349, 466, 51);
INSERT INTO `core_service_drivers` VALUES (1350, 467, 40);
INSERT INTO `core_service_drivers` VALUES (1351, 467, 49);
INSERT INTO `core_service_drivers` VALUES (1352, 467, 51);
INSERT INTO `core_service_drivers` VALUES (1353, 468, 40);
INSERT INTO `core_service_drivers` VALUES (1354, 468, 49);
INSERT INTO `core_service_drivers` VALUES (1355, 468, 51);
INSERT INTO `core_service_drivers` VALUES (1356, 469, 40);
INSERT INTO `core_service_drivers` VALUES (1357, 469, 49);
INSERT INTO `core_service_drivers` VALUES (1358, 469, 51);
INSERT INTO `core_service_drivers` VALUES (1359, 470, 40);
INSERT INTO `core_service_drivers` VALUES (1360, 470, 49);
INSERT INTO `core_service_drivers` VALUES (1361, 470, 51);
INSERT INTO `core_service_drivers` VALUES (1362, 471, 40);
INSERT INTO `core_service_drivers` VALUES (1363, 471, 49);
INSERT INTO `core_service_drivers` VALUES (1364, 471, 51);
INSERT INTO `core_service_drivers` VALUES (1365, 472, 40);
INSERT INTO `core_service_drivers` VALUES (1366, 472, 49);
INSERT INTO `core_service_drivers` VALUES (1367, 472, 51);
INSERT INTO `core_service_drivers` VALUES (1368, 473, 40);
INSERT INTO `core_service_drivers` VALUES (1369, 473, 49);
INSERT INTO `core_service_drivers` VALUES (1370, 473, 51);
INSERT INTO `core_service_drivers` VALUES (1371, 474, 40);
INSERT INTO `core_service_drivers` VALUES (1372, 474, 49);
INSERT INTO `core_service_drivers` VALUES (1373, 474, 51);
INSERT INTO `core_service_drivers` VALUES (1374, 475, 40);
INSERT INTO `core_service_drivers` VALUES (1375, 475, 49);
INSERT INTO `core_service_drivers` VALUES (1376, 475, 51);
INSERT INTO `core_service_drivers` VALUES (1377, 476, 40);
INSERT INTO `core_service_drivers` VALUES (1378, 476, 49);
INSERT INTO `core_service_drivers` VALUES (1379, 476, 51);
INSERT INTO `core_service_drivers` VALUES (1380, 477, 40);
INSERT INTO `core_service_drivers` VALUES (1381, 477, 49);
INSERT INTO `core_service_drivers` VALUES (1382, 477, 51);
INSERT INTO `core_service_drivers` VALUES (1383, 478, 40);
INSERT INTO `core_service_drivers` VALUES (1384, 478, 49);
INSERT INTO `core_service_drivers` VALUES (1385, 478, 51);
INSERT INTO `core_service_drivers` VALUES (1386, 479, 40);
INSERT INTO `core_service_drivers` VALUES (1387, 479, 49);
INSERT INTO `core_service_drivers` VALUES (1388, 479, 51);
INSERT INTO `core_service_drivers` VALUES (1389, 480, 40);
INSERT INTO `core_service_drivers` VALUES (1390, 480, 49);
INSERT INTO `core_service_drivers` VALUES (1391, 480, 51);
INSERT INTO `core_service_drivers` VALUES (1392, 481, 40);
INSERT INTO `core_service_drivers` VALUES (1393, 481, 49);
INSERT INTO `core_service_drivers` VALUES (1394, 481, 51);
INSERT INTO `core_service_drivers` VALUES (1395, 482, 40);
INSERT INTO `core_service_drivers` VALUES (1396, 482, 49);
INSERT INTO `core_service_drivers` VALUES (1397, 482, 51);
INSERT INTO `core_service_drivers` VALUES (1398, 483, 40);
INSERT INTO `core_service_drivers` VALUES (1399, 483, 49);
INSERT INTO `core_service_drivers` VALUES (1400, 483, 51);
INSERT INTO `core_service_drivers` VALUES (1401, 484, 40);
INSERT INTO `core_service_drivers` VALUES (1402, 484, 49);
INSERT INTO `core_service_drivers` VALUES (1403, 484, 51);
INSERT INTO `core_service_drivers` VALUES (1404, 485, 40);
INSERT INTO `core_service_drivers` VALUES (1405, 485, 49);
INSERT INTO `core_service_drivers` VALUES (1406, 485, 51);
INSERT INTO `core_service_drivers` VALUES (1407, 486, 40);
INSERT INTO `core_service_drivers` VALUES (1408, 486, 49);
INSERT INTO `core_service_drivers` VALUES (1409, 486, 51);
INSERT INTO `core_service_drivers` VALUES (1410, 487, 40);
INSERT INTO `core_service_drivers` VALUES (1411, 487, 49);
INSERT INTO `core_service_drivers` VALUES (1412, 487, 51);
INSERT INTO `core_service_drivers` VALUES (1413, 488, 40);
INSERT INTO `core_service_drivers` VALUES (1414, 488, 49);
INSERT INTO `core_service_drivers` VALUES (1415, 488, 51);
INSERT INTO `core_service_drivers` VALUES (1416, 489, 40);
INSERT INTO `core_service_drivers` VALUES (1417, 489, 49);
INSERT INTO `core_service_drivers` VALUES (1418, 489, 51);
INSERT INTO `core_service_drivers` VALUES (1419, 490, 40);
INSERT INTO `core_service_drivers` VALUES (1420, 490, 49);
INSERT INTO `core_service_drivers` VALUES (1421, 490, 51);
INSERT INTO `core_service_drivers` VALUES (1422, 491, 40);
INSERT INTO `core_service_drivers` VALUES (1423, 491, 49);
INSERT INTO `core_service_drivers` VALUES (1424, 491, 51);
INSERT INTO `core_service_drivers` VALUES (1425, 492, 40);
INSERT INTO `core_service_drivers` VALUES (1426, 492, 49);
INSERT INTO `core_service_drivers` VALUES (1427, 492, 51);
INSERT INTO `core_service_drivers` VALUES (1428, 493, 40);
INSERT INTO `core_service_drivers` VALUES (1429, 494, 40);
INSERT INTO `core_service_drivers` VALUES (1430, 495, 40);
INSERT INTO `core_service_drivers` VALUES (1431, 496, 40);
INSERT INTO `core_service_drivers` VALUES (1432, 497, 40);
INSERT INTO `core_service_drivers` VALUES (1433, 498, 40);
INSERT INTO `core_service_drivers` VALUES (1434, 499, 40);
INSERT INTO `core_service_drivers` VALUES (1435, 500, 40);
INSERT INTO `core_service_drivers` VALUES (1436, 501, 40);
INSERT INTO `core_service_drivers` VALUES (1437, 502, 40);
INSERT INTO `core_service_drivers` VALUES (1438, 503, 40);
INSERT INTO `core_service_drivers` VALUES (1439, 504, 40);
INSERT INTO `core_service_drivers` VALUES (1440, 505, 40);
INSERT INTO `core_service_drivers` VALUES (1441, 506, 40);
INSERT INTO `core_service_drivers` VALUES (1442, 507, 40);
INSERT INTO `core_service_drivers` VALUES (1443, 508, 40);
INSERT INTO `core_service_drivers` VALUES (1444, 509, 40);
INSERT INTO `core_service_drivers` VALUES (1445, 510, 40);
INSERT INTO `core_service_drivers` VALUES (1446, 511, 40);
INSERT INTO `core_service_drivers` VALUES (1447, 512, 40);
INSERT INTO `core_service_drivers` VALUES (1448, 513, 40);
INSERT INTO `core_service_drivers` VALUES (1449, 514, 40);
INSERT INTO `core_service_drivers` VALUES (1450, 515, 40);
INSERT INTO `core_service_drivers` VALUES (1451, 516, 40);
INSERT INTO `core_service_drivers` VALUES (1452, 517, 40);
INSERT INTO `core_service_drivers` VALUES (1453, 518, 40);
INSERT INTO `core_service_drivers` VALUES (1454, 519, 40);
INSERT INTO `core_service_drivers` VALUES (1455, 520, 40);
INSERT INTO `core_service_drivers` VALUES (1456, 521, 40);
INSERT INTO `core_service_drivers` VALUES (1457, 522, 40);
INSERT INTO `core_service_drivers` VALUES (1458, 523, 40);
INSERT INTO `core_service_drivers` VALUES (1459, 524, 40);
INSERT INTO `core_service_drivers` VALUES (1460, 525, 40);
INSERT INTO `core_service_drivers` VALUES (1461, 526, 40);
INSERT INTO `core_service_drivers` VALUES (1462, 527, 40);
INSERT INTO `core_service_drivers` VALUES (1463, 528, 40);
INSERT INTO `core_service_drivers` VALUES (1464, 529, 40);
INSERT INTO `core_service_drivers` VALUES (1465, 530, 40);
INSERT INTO `core_service_drivers` VALUES (1466, 531, 40);
INSERT INTO `core_service_drivers` VALUES (1467, 532, 40);
INSERT INTO `core_service_drivers` VALUES (1468, 533, 40);
INSERT INTO `core_service_drivers` VALUES (1469, 534, 40);
INSERT INTO `core_service_drivers` VALUES (1470, 535, 40);
INSERT INTO `core_service_drivers` VALUES (1471, 536, 40);
INSERT INTO `core_service_drivers` VALUES (1472, 537, 40);
INSERT INTO `core_service_drivers` VALUES (1473, 538, 40);
INSERT INTO `core_service_drivers` VALUES (1474, 539, 40);
INSERT INTO `core_service_drivers` VALUES (1475, 540, 40);
INSERT INTO `core_service_drivers` VALUES (1476, 541, 40);
INSERT INTO `core_service_drivers` VALUES (1477, 542, 40);
INSERT INTO `core_service_drivers` VALUES (1478, 543, 40);
INSERT INTO `core_service_drivers` VALUES (1479, 544, 40);
INSERT INTO `core_service_drivers` VALUES (1480, 545, 40);
INSERT INTO `core_service_drivers` VALUES (1481, 546, 40);
INSERT INTO `core_service_drivers` VALUES (1482, 547, 40);
INSERT INTO `core_service_drivers` VALUES (1483, 548, 40);
INSERT INTO `core_service_drivers` VALUES (1484, 549, 40);
INSERT INTO `core_service_drivers` VALUES (1485, 550, 40);
INSERT INTO `core_service_drivers` VALUES (1486, 551, 40);
INSERT INTO `core_service_drivers` VALUES (1487, 552, 40);
INSERT INTO `core_service_drivers` VALUES (1488, 553, 40);
INSERT INTO `core_service_drivers` VALUES (1489, 554, 40);
INSERT INTO `core_service_drivers` VALUES (1490, 555, 40);
INSERT INTO `core_service_drivers` VALUES (1491, 556, 40);
INSERT INTO `core_service_drivers` VALUES (1492, 557, 40);
INSERT INTO `core_service_drivers` VALUES (1493, 558, 40);
INSERT INTO `core_service_drivers` VALUES (1494, 559, 40);
INSERT INTO `core_service_drivers` VALUES (1495, 560, 40);
INSERT INTO `core_service_drivers` VALUES (1496, 561, 40);
INSERT INTO `core_service_drivers` VALUES (1497, 562, 40);
INSERT INTO `core_service_drivers` VALUES (1498, 563, 40);
INSERT INTO `core_service_drivers` VALUES (1499, 564, 40);
INSERT INTO `core_service_drivers` VALUES (1500, 565, 40);
INSERT INTO `core_service_drivers` VALUES (1501, 566, 40);
INSERT INTO `core_service_drivers` VALUES (1502, 567, 40);
INSERT INTO `core_service_drivers` VALUES (1503, 568, 40);
INSERT INTO `core_service_drivers` VALUES (1504, 569, 40);
INSERT INTO `core_service_drivers` VALUES (1505, 570, 40);
INSERT INTO `core_service_drivers` VALUES (1506, 571, 40);
INSERT INTO `core_service_drivers` VALUES (1507, 572, 40);
INSERT INTO `core_service_drivers` VALUES (1508, 573, 40);
INSERT INTO `core_service_drivers` VALUES (1509, 574, 40);
INSERT INTO `core_service_drivers` VALUES (1510, 575, 40);
INSERT INTO `core_service_drivers` VALUES (1511, 576, 40);
INSERT INTO `core_service_drivers` VALUES (1512, 577, 40);
INSERT INTO `core_service_drivers` VALUES (1513, 578, 40);
INSERT INTO `core_service_drivers` VALUES (1514, 579, 40);
INSERT INTO `core_service_drivers` VALUES (1515, 580, 40);
INSERT INTO `core_service_drivers` VALUES (1516, 581, 40);
INSERT INTO `core_service_drivers` VALUES (1517, 582, 40);
INSERT INTO `core_service_drivers` VALUES (1518, 583, 40);
INSERT INTO `core_service_drivers` VALUES (1519, 584, 40);
INSERT INTO `core_service_drivers` VALUES (1520, 585, 40);
INSERT INTO `core_service_drivers` VALUES (1521, 585, 49);
INSERT INTO `core_service_drivers` VALUES (1522, 585, 50);
INSERT INTO `core_service_drivers` VALUES (1523, 586, 40);
INSERT INTO `core_service_drivers` VALUES (1524, 586, 49);
INSERT INTO `core_service_drivers` VALUES (1525, 586, 50);
INSERT INTO `core_service_drivers` VALUES (1526, 587, 40);
INSERT INTO `core_service_drivers` VALUES (1527, 587, 49);
INSERT INTO `core_service_drivers` VALUES (1528, 587, 50);
INSERT INTO `core_service_drivers` VALUES (1529, 588, 40);
INSERT INTO `core_service_drivers` VALUES (1530, 588, 49);
INSERT INTO `core_service_drivers` VALUES (1531, 588, 50);
INSERT INTO `core_service_drivers` VALUES (1532, 589, 40);
INSERT INTO `core_service_drivers` VALUES (1533, 589, 49);
INSERT INTO `core_service_drivers` VALUES (1534, 589, 50);
INSERT INTO `core_service_drivers` VALUES (1535, 590, 40);
INSERT INTO `core_service_drivers` VALUES (1536, 590, 49);
INSERT INTO `core_service_drivers` VALUES (1537, 590, 50);
INSERT INTO `core_service_drivers` VALUES (1538, 591, 40);
INSERT INTO `core_service_drivers` VALUES (1539, 591, 49);
INSERT INTO `core_service_drivers` VALUES (1540, 591, 50);
INSERT INTO `core_service_drivers` VALUES (1541, 592, 40);
INSERT INTO `core_service_drivers` VALUES (1542, 592, 49);
INSERT INTO `core_service_drivers` VALUES (1543, 592, 50);
INSERT INTO `core_service_drivers` VALUES (1544, 593, 40);
INSERT INTO `core_service_drivers` VALUES (1545, 593, 49);
INSERT INTO `core_service_drivers` VALUES (1546, 593, 50);
INSERT INTO `core_service_drivers` VALUES (1547, 594, 40);
INSERT INTO `core_service_drivers` VALUES (1548, 594, 49);
INSERT INTO `core_service_drivers` VALUES (1549, 594, 50);
INSERT INTO `core_service_drivers` VALUES (1550, 595, 40);
INSERT INTO `core_service_drivers` VALUES (1551, 595, 49);
INSERT INTO `core_service_drivers` VALUES (1552, 595, 50);
INSERT INTO `core_service_drivers` VALUES (1553, 596, 40);
INSERT INTO `core_service_drivers` VALUES (1554, 596, 49);
INSERT INTO `core_service_drivers` VALUES (1555, 596, 50);
INSERT INTO `core_service_drivers` VALUES (1556, 597, 40);
INSERT INTO `core_service_drivers` VALUES (1557, 597, 49);
INSERT INTO `core_service_drivers` VALUES (1558, 597, 50);
INSERT INTO `core_service_drivers` VALUES (1559, 598, 40);
INSERT INTO `core_service_drivers` VALUES (1560, 598, 49);
INSERT INTO `core_service_drivers` VALUES (1561, 598, 50);
INSERT INTO `core_service_drivers` VALUES (1562, 599, 40);
INSERT INTO `core_service_drivers` VALUES (1563, 599, 49);
INSERT INTO `core_service_drivers` VALUES (1564, 599, 50);
INSERT INTO `core_service_drivers` VALUES (1565, 600, 40);
INSERT INTO `core_service_drivers` VALUES (1566, 600, 49);
INSERT INTO `core_service_drivers` VALUES (1567, 600, 50);
INSERT INTO `core_service_drivers` VALUES (1568, 601, 40);
INSERT INTO `core_service_drivers` VALUES (1569, 601, 49);
INSERT INTO `core_service_drivers` VALUES (1570, 601, 50);
INSERT INTO `core_service_drivers` VALUES (1571, 602, 40);
INSERT INTO `core_service_drivers` VALUES (1572, 602, 49);
INSERT INTO `core_service_drivers` VALUES (1573, 602, 50);
INSERT INTO `core_service_drivers` VALUES (1574, 603, 40);
INSERT INTO `core_service_drivers` VALUES (1575, 603, 49);
INSERT INTO `core_service_drivers` VALUES (1576, 603, 50);
INSERT INTO `core_service_drivers` VALUES (1577, 604, 40);
INSERT INTO `core_service_drivers` VALUES (1578, 604, 49);
INSERT INTO `core_service_drivers` VALUES (1579, 604, 50);
INSERT INTO `core_service_drivers` VALUES (1580, 605, 40);
INSERT INTO `core_service_drivers` VALUES (1581, 605, 49);
INSERT INTO `core_service_drivers` VALUES (1582, 605, 50);
INSERT INTO `core_service_drivers` VALUES (1583, 606, 40);
INSERT INTO `core_service_drivers` VALUES (1584, 606, 49);
INSERT INTO `core_service_drivers` VALUES (1585, 606, 50);
INSERT INTO `core_service_drivers` VALUES (1586, 607, 40);
INSERT INTO `core_service_drivers` VALUES (1587, 607, 49);
INSERT INTO `core_service_drivers` VALUES (1588, 607, 50);
INSERT INTO `core_service_drivers` VALUES (1589, 608, 40);
INSERT INTO `core_service_drivers` VALUES (1590, 608, 49);
INSERT INTO `core_service_drivers` VALUES (1591, 608, 50);
INSERT INTO `core_service_drivers` VALUES (1592, 609, 40);
INSERT INTO `core_service_drivers` VALUES (1593, 609, 49);
INSERT INTO `core_service_drivers` VALUES (1594, 609, 50);
INSERT INTO `core_service_drivers` VALUES (1595, 610, 40);
INSERT INTO `core_service_drivers` VALUES (1596, 610, 49);
INSERT INTO `core_service_drivers` VALUES (1597, 610, 50);
INSERT INTO `core_service_drivers` VALUES (1598, 611, 40);
INSERT INTO `core_service_drivers` VALUES (1599, 611, 49);
INSERT INTO `core_service_drivers` VALUES (1600, 611, 50);
INSERT INTO `core_service_drivers` VALUES (1601, 612, 40);
INSERT INTO `core_service_drivers` VALUES (1602, 612, 49);
INSERT INTO `core_service_drivers` VALUES (1603, 612, 50);
INSERT INTO `core_service_drivers` VALUES (1604, 613, 40);
INSERT INTO `core_service_drivers` VALUES (1605, 613, 49);
INSERT INTO `core_service_drivers` VALUES (1606, 613, 50);
INSERT INTO `core_service_drivers` VALUES (1607, 614, 40);
INSERT INTO `core_service_drivers` VALUES (1608, 614, 49);
INSERT INTO `core_service_drivers` VALUES (1609, 614, 50);
INSERT INTO `core_service_drivers` VALUES (1610, 615, 40);
INSERT INTO `core_service_drivers` VALUES (1611, 615, 49);
INSERT INTO `core_service_drivers` VALUES (1612, 615, 50);
INSERT INTO `core_service_drivers` VALUES (1613, 616, 40);
INSERT INTO `core_service_drivers` VALUES (1614, 616, 49);
INSERT INTO `core_service_drivers` VALUES (1615, 616, 50);
INSERT INTO `core_service_drivers` VALUES (1616, 617, 40);
INSERT INTO `core_service_drivers` VALUES (1617, 617, 49);
INSERT INTO `core_service_drivers` VALUES (1618, 617, 50);
INSERT INTO `core_service_drivers` VALUES (1619, 618, 40);
INSERT INTO `core_service_drivers` VALUES (1620, 618, 49);
INSERT INTO `core_service_drivers` VALUES (1621, 618, 50);
INSERT INTO `core_service_drivers` VALUES (1622, 619, 40);
INSERT INTO `core_service_drivers` VALUES (1623, 619, 49);
INSERT INTO `core_service_drivers` VALUES (1624, 619, 50);
INSERT INTO `core_service_drivers` VALUES (1625, 620, 40);
INSERT INTO `core_service_drivers` VALUES (1626, 620, 49);
INSERT INTO `core_service_drivers` VALUES (1627, 620, 50);
INSERT INTO `core_service_drivers` VALUES (1628, 621, 40);
INSERT INTO `core_service_drivers` VALUES (1629, 621, 49);
INSERT INTO `core_service_drivers` VALUES (1630, 621, 50);
INSERT INTO `core_service_drivers` VALUES (1631, 622, 40);
INSERT INTO `core_service_drivers` VALUES (1632, 622, 49);
INSERT INTO `core_service_drivers` VALUES (1633, 622, 50);
INSERT INTO `core_service_drivers` VALUES (1634, 623, 40);
INSERT INTO `core_service_drivers` VALUES (1635, 623, 49);
INSERT INTO `core_service_drivers` VALUES (1636, 623, 50);
INSERT INTO `core_service_drivers` VALUES (1637, 624, 40);
INSERT INTO `core_service_drivers` VALUES (1638, 624, 49);
INSERT INTO `core_service_drivers` VALUES (1639, 624, 50);
INSERT INTO `core_service_drivers` VALUES (1640, 625, 40);
INSERT INTO `core_service_drivers` VALUES (1641, 625, 49);
INSERT INTO `core_service_drivers` VALUES (1642, 625, 50);
INSERT INTO `core_service_drivers` VALUES (1643, 626, 40);
INSERT INTO `core_service_drivers` VALUES (1644, 626, 49);
INSERT INTO `core_service_drivers` VALUES (1645, 626, 50);
INSERT INTO `core_service_drivers` VALUES (1646, 627, 40);
INSERT INTO `core_service_drivers` VALUES (1647, 627, 49);
INSERT INTO `core_service_drivers` VALUES (1648, 627, 50);
INSERT INTO `core_service_drivers` VALUES (1649, 628, 40);
INSERT INTO `core_service_drivers` VALUES (1650, 628, 49);
INSERT INTO `core_service_drivers` VALUES (1651, 628, 50);
INSERT INTO `core_service_drivers` VALUES (1652, 629, 40);
INSERT INTO `core_service_drivers` VALUES (1653, 629, 49);
INSERT INTO `core_service_drivers` VALUES (1654, 629, 50);
INSERT INTO `core_service_drivers` VALUES (1655, 630, 40);
INSERT INTO `core_service_drivers` VALUES (1656, 630, 49);
INSERT INTO `core_service_drivers` VALUES (1657, 630, 50);
INSERT INTO `core_service_drivers` VALUES (1658, 631, 40);
INSERT INTO `core_service_drivers` VALUES (1659, 631, 49);
INSERT INTO `core_service_drivers` VALUES (1660, 631, 50);
INSERT INTO `core_service_drivers` VALUES (1661, 632, 40);
INSERT INTO `core_service_drivers` VALUES (1662, 632, 49);
INSERT INTO `core_service_drivers` VALUES (1663, 632, 50);
INSERT INTO `core_service_drivers` VALUES (1664, 633, 40);
INSERT INTO `core_service_drivers` VALUES (1665, 633, 49);
INSERT INTO `core_service_drivers` VALUES (1666, 633, 50);
INSERT INTO `core_service_drivers` VALUES (1667, 634, 40);
INSERT INTO `core_service_drivers` VALUES (1668, 634, 49);
INSERT INTO `core_service_drivers` VALUES (1669, 634, 50);
INSERT INTO `core_service_drivers` VALUES (1670, 635, 40);
INSERT INTO `core_service_drivers` VALUES (1671, 635, 49);
INSERT INTO `core_service_drivers` VALUES (1672, 635, 50);
INSERT INTO `core_service_drivers` VALUES (1673, 636, 40);
INSERT INTO `core_service_drivers` VALUES (1674, 636, 49);
INSERT INTO `core_service_drivers` VALUES (1675, 636, 50);
INSERT INTO `core_service_drivers` VALUES (1676, 637, 40);
INSERT INTO `core_service_drivers` VALUES (1677, 637, 49);
INSERT INTO `core_service_drivers` VALUES (1678, 637, 50);
INSERT INTO `core_service_drivers` VALUES (1679, 638, 40);
INSERT INTO `core_service_drivers` VALUES (1680, 638, 49);
INSERT INTO `core_service_drivers` VALUES (1681, 638, 50);
INSERT INTO `core_service_drivers` VALUES (1682, 639, 40);
INSERT INTO `core_service_drivers` VALUES (1683, 639, 49);
INSERT INTO `core_service_drivers` VALUES (1684, 639, 50);
INSERT INTO `core_service_drivers` VALUES (1685, 640, 40);
INSERT INTO `core_service_drivers` VALUES (1686, 640, 49);
INSERT INTO `core_service_drivers` VALUES (1687, 640, 50);
INSERT INTO `core_service_drivers` VALUES (1688, 641, 40);
INSERT INTO `core_service_drivers` VALUES (1689, 641, 49);
INSERT INTO `core_service_drivers` VALUES (1690, 641, 50);
INSERT INTO `core_service_drivers` VALUES (1691, 642, 40);
INSERT INTO `core_service_drivers` VALUES (1692, 642, 49);
INSERT INTO `core_service_drivers` VALUES (1693, 642, 50);
INSERT INTO `core_service_drivers` VALUES (1694, 643, 40);
INSERT INTO `core_service_drivers` VALUES (1695, 643, 49);
INSERT INTO `core_service_drivers` VALUES (1696, 643, 50);
INSERT INTO `core_service_drivers` VALUES (1697, 644, 40);
INSERT INTO `core_service_drivers` VALUES (1698, 644, 49);
INSERT INTO `core_service_drivers` VALUES (1699, 644, 50);
INSERT INTO `core_service_drivers` VALUES (1700, 645, 40);
INSERT INTO `core_service_drivers` VALUES (1701, 645, 49);
INSERT INTO `core_service_drivers` VALUES (1702, 645, 50);
INSERT INTO `core_service_drivers` VALUES (1703, 646, 40);
INSERT INTO `core_service_drivers` VALUES (1704, 646, 49);
INSERT INTO `core_service_drivers` VALUES (1705, 646, 50);
INSERT INTO `core_service_drivers` VALUES (1706, 647, 40);
INSERT INTO `core_service_drivers` VALUES (1707, 647, 49);
INSERT INTO `core_service_drivers` VALUES (1708, 647, 50);
INSERT INTO `core_service_drivers` VALUES (1709, 648, 40);
INSERT INTO `core_service_drivers` VALUES (1710, 648, 49);
INSERT INTO `core_service_drivers` VALUES (1711, 648, 50);
INSERT INTO `core_service_drivers` VALUES (1712, 649, 40);
INSERT INTO `core_service_drivers` VALUES (1713, 649, 49);
INSERT INTO `core_service_drivers` VALUES (1714, 649, 50);
INSERT INTO `core_service_drivers` VALUES (1715, 650, 40);
INSERT INTO `core_service_drivers` VALUES (1716, 650, 49);
INSERT INTO `core_service_drivers` VALUES (1717, 650, 50);
INSERT INTO `core_service_drivers` VALUES (1718, 651, 40);
INSERT INTO `core_service_drivers` VALUES (1719, 651, 49);
INSERT INTO `core_service_drivers` VALUES (1720, 651, 50);
INSERT INTO `core_service_drivers` VALUES (1721, 652, 40);
INSERT INTO `core_service_drivers` VALUES (1722, 652, 49);
INSERT INTO `core_service_drivers` VALUES (1723, 652, 50);
INSERT INTO `core_service_drivers` VALUES (1724, 653, 40);
INSERT INTO `core_service_drivers` VALUES (1725, 653, 49);
INSERT INTO `core_service_drivers` VALUES (1726, 653, 50);
INSERT INTO `core_service_drivers` VALUES (1727, 654, 40);
INSERT INTO `core_service_drivers` VALUES (1728, 654, 49);
INSERT INTO `core_service_drivers` VALUES (1729, 654, 50);
INSERT INTO `core_service_drivers` VALUES (1730, 655, 40);
INSERT INTO `core_service_drivers` VALUES (1731, 655, 49);
INSERT INTO `core_service_drivers` VALUES (1732, 655, 50);
INSERT INTO `core_service_drivers` VALUES (1733, 656, 40);
INSERT INTO `core_service_drivers` VALUES (1734, 656, 49);
INSERT INTO `core_service_drivers` VALUES (1735, 656, 50);
INSERT INTO `core_service_drivers` VALUES (1736, 657, 40);
INSERT INTO `core_service_drivers` VALUES (1737, 657, 49);
INSERT INTO `core_service_drivers` VALUES (1738, 657, 50);
INSERT INTO `core_service_drivers` VALUES (1739, 658, 40);
INSERT INTO `core_service_drivers` VALUES (1740, 658, 49);
INSERT INTO `core_service_drivers` VALUES (1741, 658, 50);
INSERT INTO `core_service_drivers` VALUES (1742, 659, 40);
INSERT INTO `core_service_drivers` VALUES (1743, 659, 49);
INSERT INTO `core_service_drivers` VALUES (1744, 659, 50);
INSERT INTO `core_service_drivers` VALUES (1745, 660, 40);
INSERT INTO `core_service_drivers` VALUES (1746, 660, 49);
INSERT INTO `core_service_drivers` VALUES (1747, 660, 50);
INSERT INTO `core_service_drivers` VALUES (1748, 661, 40);
INSERT INTO `core_service_drivers` VALUES (1749, 661, 49);
INSERT INTO `core_service_drivers` VALUES (1750, 661, 50);
INSERT INTO `core_service_drivers` VALUES (1751, 662, 40);
INSERT INTO `core_service_drivers` VALUES (1752, 662, 49);
INSERT INTO `core_service_drivers` VALUES (1753, 662, 50);
INSERT INTO `core_service_drivers` VALUES (1754, 663, 40);
INSERT INTO `core_service_drivers` VALUES (1755, 663, 49);
INSERT INTO `core_service_drivers` VALUES (1756, 663, 50);
INSERT INTO `core_service_drivers` VALUES (1757, 664, 40);
INSERT INTO `core_service_drivers` VALUES (1758, 664, 49);
INSERT INTO `core_service_drivers` VALUES (1759, 664, 50);
INSERT INTO `core_service_drivers` VALUES (1760, 665, 40);
INSERT INTO `core_service_drivers` VALUES (1761, 665, 49);
INSERT INTO `core_service_drivers` VALUES (1762, 665, 50);
INSERT INTO `core_service_drivers` VALUES (1763, 666, 40);
INSERT INTO `core_service_drivers` VALUES (1764, 666, 49);
INSERT INTO `core_service_drivers` VALUES (1765, 666, 50);
INSERT INTO `core_service_drivers` VALUES (1766, 667, 40);
INSERT INTO `core_service_drivers` VALUES (1767, 667, 49);
INSERT INTO `core_service_drivers` VALUES (1768, 667, 50);
INSERT INTO `core_service_drivers` VALUES (1769, 668, 40);
INSERT INTO `core_service_drivers` VALUES (1770, 668, 49);
INSERT INTO `core_service_drivers` VALUES (1771, 668, 50);
INSERT INTO `core_service_drivers` VALUES (1772, 669, 40);
INSERT INTO `core_service_drivers` VALUES (1773, 669, 49);
INSERT INTO `core_service_drivers` VALUES (1774, 669, 50);
INSERT INTO `core_service_drivers` VALUES (1775, 670, 40);
INSERT INTO `core_service_drivers` VALUES (1776, 670, 49);
INSERT INTO `core_service_drivers` VALUES (1777, 670, 50);
INSERT INTO `core_service_drivers` VALUES (1778, 671, 40);
INSERT INTO `core_service_drivers` VALUES (1779, 671, 49);
INSERT INTO `core_service_drivers` VALUES (1780, 671, 50);
INSERT INTO `core_service_drivers` VALUES (1781, 672, 40);
INSERT INTO `core_service_drivers` VALUES (1782, 672, 49);
INSERT INTO `core_service_drivers` VALUES (1783, 672, 50);
INSERT INTO `core_service_drivers` VALUES (1784, 673, 40);
INSERT INTO `core_service_drivers` VALUES (1785, 673, 49);
INSERT INTO `core_service_drivers` VALUES (1786, 673, 50);
INSERT INTO `core_service_drivers` VALUES (1787, 674, 40);
INSERT INTO `core_service_drivers` VALUES (1788, 674, 49);
INSERT INTO `core_service_drivers` VALUES (1789, 674, 50);
INSERT INTO `core_service_drivers` VALUES (1790, 675, 40);
INSERT INTO `core_service_drivers` VALUES (1791, 675, 49);
INSERT INTO `core_service_drivers` VALUES (1792, 675, 50);
INSERT INTO `core_service_drivers` VALUES (1793, 676, 40);
INSERT INTO `core_service_drivers` VALUES (1794, 676, 49);
INSERT INTO `core_service_drivers` VALUES (1795, 676, 50);
INSERT INTO `core_service_drivers` VALUES (1796, 677, 40);
INSERT INTO `core_service_drivers` VALUES (1797, 677, 49);
INSERT INTO `core_service_drivers` VALUES (1798, 677, 50);
INSERT INTO `core_service_drivers` VALUES (1799, 678, 40);
INSERT INTO `core_service_drivers` VALUES (1800, 678, 49);
INSERT INTO `core_service_drivers` VALUES (1801, 678, 50);
INSERT INTO `core_service_drivers` VALUES (1802, 679, 40);
INSERT INTO `core_service_drivers` VALUES (1803, 679, 49);
INSERT INTO `core_service_drivers` VALUES (1804, 679, 50);
INSERT INTO `core_service_drivers` VALUES (1805, 680, 40);
INSERT INTO `core_service_drivers` VALUES (1806, 680, 49);
INSERT INTO `core_service_drivers` VALUES (1807, 680, 50);
INSERT INTO `core_service_drivers` VALUES (1808, 681, 40);
INSERT INTO `core_service_drivers` VALUES (1809, 681, 49);
INSERT INTO `core_service_drivers` VALUES (1810, 681, 50);
INSERT INTO `core_service_drivers` VALUES (1811, 682, 40);
INSERT INTO `core_service_drivers` VALUES (1812, 682, 49);
INSERT INTO `core_service_drivers` VALUES (1813, 682, 50);
INSERT INTO `core_service_drivers` VALUES (1814, 683, 40);
INSERT INTO `core_service_drivers` VALUES (1815, 683, 49);
INSERT INTO `core_service_drivers` VALUES (1816, 683, 50);
INSERT INTO `core_service_drivers` VALUES (1817, 684, 40);
INSERT INTO `core_service_drivers` VALUES (1818, 684, 49);
INSERT INTO `core_service_drivers` VALUES (1819, 684, 50);
INSERT INTO `core_service_drivers` VALUES (1820, 685, 40);
INSERT INTO `core_service_drivers` VALUES (1821, 685, 49);
INSERT INTO `core_service_drivers` VALUES (1822, 685, 50);
INSERT INTO `core_service_drivers` VALUES (1823, 686, 40);
INSERT INTO `core_service_drivers` VALUES (1824, 686, 49);
INSERT INTO `core_service_drivers` VALUES (1825, 686, 50);
INSERT INTO `core_service_drivers` VALUES (1826, 687, 40);
INSERT INTO `core_service_drivers` VALUES (1827, 687, 49);
INSERT INTO `core_service_drivers` VALUES (1828, 687, 50);
INSERT INTO `core_service_drivers` VALUES (1829, 688, 40);
INSERT INTO `core_service_drivers` VALUES (1830, 688, 49);
INSERT INTO `core_service_drivers` VALUES (1831, 688, 50);
INSERT INTO `core_service_drivers` VALUES (1832, 689, 40);
INSERT INTO `core_service_drivers` VALUES (1833, 689, 49);
INSERT INTO `core_service_drivers` VALUES (1834, 689, 50);
INSERT INTO `core_service_drivers` VALUES (1835, 690, 40);
INSERT INTO `core_service_drivers` VALUES (1836, 690, 49);
INSERT INTO `core_service_drivers` VALUES (1837, 690, 50);
INSERT INTO `core_service_drivers` VALUES (1838, 691, 40);
INSERT INTO `core_service_drivers` VALUES (1839, 691, 49);
INSERT INTO `core_service_drivers` VALUES (1840, 691, 50);
INSERT INTO `core_service_drivers` VALUES (1841, 692, 40);
INSERT INTO `core_service_drivers` VALUES (1842, 692, 49);
INSERT INTO `core_service_drivers` VALUES (1843, 692, 50);
INSERT INTO `core_service_drivers` VALUES (1844, 693, 40);
INSERT INTO `core_service_drivers` VALUES (1845, 693, 49);
INSERT INTO `core_service_drivers` VALUES (1846, 693, 50);
INSERT INTO `core_service_drivers` VALUES (1847, 694, 40);
INSERT INTO `core_service_drivers` VALUES (1848, 694, 49);
INSERT INTO `core_service_drivers` VALUES (1849, 694, 50);
INSERT INTO `core_service_drivers` VALUES (1850, 695, 40);
INSERT INTO `core_service_drivers` VALUES (1851, 695, 49);
INSERT INTO `core_service_drivers` VALUES (1852, 695, 50);
INSERT INTO `core_service_drivers` VALUES (1853, 696, 40);
INSERT INTO `core_service_drivers` VALUES (1854, 696, 49);
INSERT INTO `core_service_drivers` VALUES (1855, 696, 50);
INSERT INTO `core_service_drivers` VALUES (1856, 697, 40);
INSERT INTO `core_service_drivers` VALUES (1857, 697, 49);
INSERT INTO `core_service_drivers` VALUES (1858, 697, 50);
INSERT INTO `core_service_drivers` VALUES (1859, 698, 40);
INSERT INTO `core_service_drivers` VALUES (1860, 698, 49);
INSERT INTO `core_service_drivers` VALUES (1861, 698, 50);
INSERT INTO `core_service_drivers` VALUES (1862, 699, 40);
INSERT INTO `core_service_drivers` VALUES (1863, 699, 49);
INSERT INTO `core_service_drivers` VALUES (1864, 699, 50);
INSERT INTO `core_service_drivers` VALUES (1865, 700, 40);
INSERT INTO `core_service_drivers` VALUES (1866, 700, 49);
INSERT INTO `core_service_drivers` VALUES (1867, 700, 50);
INSERT INTO `core_service_drivers` VALUES (1868, 701, 40);
INSERT INTO `core_service_drivers` VALUES (1869, 701, 49);
INSERT INTO `core_service_drivers` VALUES (1870, 701, 50);
INSERT INTO `core_service_drivers` VALUES (1871, 702, 40);
INSERT INTO `core_service_drivers` VALUES (1872, 702, 49);
INSERT INTO `core_service_drivers` VALUES (1873, 702, 50);
INSERT INTO `core_service_drivers` VALUES (1874, 703, 40);
INSERT INTO `core_service_drivers` VALUES (1875, 703, 49);
INSERT INTO `core_service_drivers` VALUES (1876, 703, 50);
INSERT INTO `core_service_drivers` VALUES (1877, 704, 40);
INSERT INTO `core_service_drivers` VALUES (1878, 704, 49);
INSERT INTO `core_service_drivers` VALUES (1879, 704, 50);
INSERT INTO `core_service_drivers` VALUES (1880, 705, 40);
INSERT INTO `core_service_drivers` VALUES (1881, 705, 49);
INSERT INTO `core_service_drivers` VALUES (1882, 705, 50);
INSERT INTO `core_service_drivers` VALUES (1883, 706, 40);
INSERT INTO `core_service_drivers` VALUES (1884, 706, 49);
INSERT INTO `core_service_drivers` VALUES (1885, 706, 50);
INSERT INTO `core_service_drivers` VALUES (1886, 707, 40);
INSERT INTO `core_service_drivers` VALUES (1887, 707, 49);
INSERT INTO `core_service_drivers` VALUES (1888, 707, 50);
INSERT INTO `core_service_drivers` VALUES (1889, 708, 40);
INSERT INTO `core_service_drivers` VALUES (1890, 708, 49);
INSERT INTO `core_service_drivers` VALUES (1891, 708, 50);
INSERT INTO `core_service_drivers` VALUES (1892, 709, 40);
INSERT INTO `core_service_drivers` VALUES (1893, 709, 49);
INSERT INTO `core_service_drivers` VALUES (1894, 709, 50);
INSERT INTO `core_service_drivers` VALUES (1895, 710, 40);
INSERT INTO `core_service_drivers` VALUES (1896, 710, 49);
INSERT INTO `core_service_drivers` VALUES (1897, 710, 50);
INSERT INTO `core_service_drivers` VALUES (1898, 711, 40);
INSERT INTO `core_service_drivers` VALUES (1899, 711, 49);
INSERT INTO `core_service_drivers` VALUES (1900, 711, 50);
INSERT INTO `core_service_drivers` VALUES (1901, 712, 40);
INSERT INTO `core_service_drivers` VALUES (1902, 712, 49);
INSERT INTO `core_service_drivers` VALUES (1903, 712, 50);
INSERT INTO `core_service_drivers` VALUES (1904, 713, 40);
INSERT INTO `core_service_drivers` VALUES (1905, 713, 49);
INSERT INTO `core_service_drivers` VALUES (1906, 713, 50);
INSERT INTO `core_service_drivers` VALUES (1907, 714, 40);
INSERT INTO `core_service_drivers` VALUES (1908, 714, 49);
INSERT INTO `core_service_drivers` VALUES (1909, 714, 50);
INSERT INTO `core_service_drivers` VALUES (1910, 715, 40);
INSERT INTO `core_service_drivers` VALUES (1911, 715, 49);
INSERT INTO `core_service_drivers` VALUES (1912, 715, 50);
INSERT INTO `core_service_drivers` VALUES (1913, 716, 40);
INSERT INTO `core_service_drivers` VALUES (1914, 716, 49);
INSERT INTO `core_service_drivers` VALUES (1915, 716, 50);
INSERT INTO `core_service_drivers` VALUES (1916, 717, 40);
INSERT INTO `core_service_drivers` VALUES (1917, 717, 49);
INSERT INTO `core_service_drivers` VALUES (1918, 717, 50);
INSERT INTO `core_service_drivers` VALUES (1919, 718, 40);
INSERT INTO `core_service_drivers` VALUES (1920, 718, 49);
INSERT INTO `core_service_drivers` VALUES (1921, 718, 50);
INSERT INTO `core_service_drivers` VALUES (1922, 719, 40);
INSERT INTO `core_service_drivers` VALUES (1923, 719, 49);
INSERT INTO `core_service_drivers` VALUES (1924, 719, 50);
INSERT INTO `core_service_drivers` VALUES (1925, 720, 40);
INSERT INTO `core_service_drivers` VALUES (1926, 720, 49);
INSERT INTO `core_service_drivers` VALUES (1927, 720, 50);
INSERT INTO `core_service_drivers` VALUES (1928, 721, 40);
INSERT INTO `core_service_drivers` VALUES (1929, 721, 49);
INSERT INTO `core_service_drivers` VALUES (1930, 721, 50);
INSERT INTO `core_service_drivers` VALUES (1931, 722, 40);
INSERT INTO `core_service_drivers` VALUES (1932, 722, 49);
INSERT INTO `core_service_drivers` VALUES (1933, 722, 50);
INSERT INTO `core_service_drivers` VALUES (1934, 723, 40);
INSERT INTO `core_service_drivers` VALUES (1935, 723, 49);
INSERT INTO `core_service_drivers` VALUES (1936, 723, 50);
INSERT INTO `core_service_drivers` VALUES (1937, 724, 40);
INSERT INTO `core_service_drivers` VALUES (1938, 724, 49);
INSERT INTO `core_service_drivers` VALUES (1939, 724, 50);
INSERT INTO `core_service_drivers` VALUES (1940, 725, 40);
INSERT INTO `core_service_drivers` VALUES (1941, 725, 49);
INSERT INTO `core_service_drivers` VALUES (1942, 725, 50);
INSERT INTO `core_service_drivers` VALUES (1943, 726, 40);
INSERT INTO `core_service_drivers` VALUES (1944, 726, 49);
INSERT INTO `core_service_drivers` VALUES (1945, 726, 50);
INSERT INTO `core_service_drivers` VALUES (1946, 727, 40);
INSERT INTO `core_service_drivers` VALUES (1947, 727, 49);
INSERT INTO `core_service_drivers` VALUES (1948, 727, 50);
INSERT INTO `core_service_drivers` VALUES (1949, 728, 40);
INSERT INTO `core_service_drivers` VALUES (1950, 728, 49);
INSERT INTO `core_service_drivers` VALUES (1951, 728, 50);
INSERT INTO `core_service_drivers` VALUES (1952, 729, 40);
INSERT INTO `core_service_drivers` VALUES (1953, 729, 49);
INSERT INTO `core_service_drivers` VALUES (1954, 729, 50);
INSERT INTO `core_service_drivers` VALUES (1955, 730, 40);
INSERT INTO `core_service_drivers` VALUES (1956, 730, 49);
INSERT INTO `core_service_drivers` VALUES (1957, 730, 50);
INSERT INTO `core_service_drivers` VALUES (1958, 731, 40);
INSERT INTO `core_service_drivers` VALUES (1959, 731, 49);
INSERT INTO `core_service_drivers` VALUES (1960, 731, 50);
INSERT INTO `core_service_drivers` VALUES (1961, 732, 40);
INSERT INTO `core_service_drivers` VALUES (1962, 732, 49);
INSERT INTO `core_service_drivers` VALUES (1963, 732, 50);
INSERT INTO `core_service_drivers` VALUES (1964, 733, 40);
INSERT INTO `core_service_drivers` VALUES (1965, 733, 49);
INSERT INTO `core_service_drivers` VALUES (1966, 733, 50);
INSERT INTO `core_service_drivers` VALUES (1967, 734, 40);
INSERT INTO `core_service_drivers` VALUES (1968, 734, 49);
INSERT INTO `core_service_drivers` VALUES (1969, 734, 50);
INSERT INTO `core_service_drivers` VALUES (1970, 735, 40);
INSERT INTO `core_service_drivers` VALUES (1971, 735, 49);
INSERT INTO `core_service_drivers` VALUES (1972, 735, 50);
INSERT INTO `core_service_drivers` VALUES (1973, 736, 40);
INSERT INTO `core_service_drivers` VALUES (1974, 736, 49);
INSERT INTO `core_service_drivers` VALUES (1975, 736, 50);
INSERT INTO `core_service_drivers` VALUES (1976, 737, 40);
INSERT INTO `core_service_drivers` VALUES (1977, 737, 49);
INSERT INTO `core_service_drivers` VALUES (1978, 737, 50);
INSERT INTO `core_service_drivers` VALUES (1979, 738, 40);
INSERT INTO `core_service_drivers` VALUES (1980, 738, 49);
INSERT INTO `core_service_drivers` VALUES (1981, 738, 50);
INSERT INTO `core_service_drivers` VALUES (1982, 739, 40);
INSERT INTO `core_service_drivers` VALUES (1983, 739, 49);
INSERT INTO `core_service_drivers` VALUES (1984, 739, 50);
INSERT INTO `core_service_drivers` VALUES (1985, 740, 40);
INSERT INTO `core_service_drivers` VALUES (1986, 740, 49);
INSERT INTO `core_service_drivers` VALUES (1987, 740, 50);
INSERT INTO `core_service_drivers` VALUES (1988, 741, 40);
INSERT INTO `core_service_drivers` VALUES (1989, 741, 49);
INSERT INTO `core_service_drivers` VALUES (1990, 741, 50);
INSERT INTO `core_service_drivers` VALUES (1991, 742, 40);
INSERT INTO `core_service_drivers` VALUES (1992, 742, 49);
INSERT INTO `core_service_drivers` VALUES (1993, 742, 50);
INSERT INTO `core_service_drivers` VALUES (1994, 743, 40);
INSERT INTO `core_service_drivers` VALUES (1995, 743, 49);
INSERT INTO `core_service_drivers` VALUES (1996, 743, 50);
INSERT INTO `core_service_drivers` VALUES (1997, 744, 40);
INSERT INTO `core_service_drivers` VALUES (1998, 744, 49);
INSERT INTO `core_service_drivers` VALUES (1999, 744, 50);
INSERT INTO `core_service_drivers` VALUES (2000, 745, 40);
INSERT INTO `core_service_drivers` VALUES (2001, 745, 49);
INSERT INTO `core_service_drivers` VALUES (2002, 745, 50);
INSERT INTO `core_service_drivers` VALUES (2003, 746, 40);
INSERT INTO `core_service_drivers` VALUES (2004, 746, 49);
INSERT INTO `core_service_drivers` VALUES (2005, 746, 50);
INSERT INTO `core_service_drivers` VALUES (2006, 747, 40);
INSERT INTO `core_service_drivers` VALUES (2007, 747, 49);
INSERT INTO `core_service_drivers` VALUES (2008, 747, 50);
INSERT INTO `core_service_drivers` VALUES (2009, 748, 40);
INSERT INTO `core_service_drivers` VALUES (2010, 748, 49);
INSERT INTO `core_service_drivers` VALUES (2011, 748, 50);
INSERT INTO `core_service_drivers` VALUES (2012, 749, 40);
INSERT INTO `core_service_drivers` VALUES (2013, 749, 49);
INSERT INTO `core_service_drivers` VALUES (2014, 749, 50);
INSERT INTO `core_service_drivers` VALUES (2015, 750, 40);
INSERT INTO `core_service_drivers` VALUES (2016, 750, 49);
INSERT INTO `core_service_drivers` VALUES (2017, 750, 50);
INSERT INTO `core_service_drivers` VALUES (2018, 751, 40);
INSERT INTO `core_service_drivers` VALUES (2019, 751, 49);
INSERT INTO `core_service_drivers` VALUES (2020, 751, 50);
INSERT INTO `core_service_drivers` VALUES (2021, 752, 40);
INSERT INTO `core_service_drivers` VALUES (2022, 752, 49);
INSERT INTO `core_service_drivers` VALUES (2023, 752, 50);
INSERT INTO `core_service_drivers` VALUES (2024, 753, 40);
INSERT INTO `core_service_drivers` VALUES (2025, 753, 49);
INSERT INTO `core_service_drivers` VALUES (2026, 753, 50);
INSERT INTO `core_service_drivers` VALUES (2027, 754, 40);
INSERT INTO `core_service_drivers` VALUES (2028, 754, 49);
INSERT INTO `core_service_drivers` VALUES (2029, 754, 50);
INSERT INTO `core_service_drivers` VALUES (2030, 755, 40);
INSERT INTO `core_service_drivers` VALUES (2031, 755, 49);
INSERT INTO `core_service_drivers` VALUES (2032, 755, 50);
INSERT INTO `core_service_drivers` VALUES (2033, 756, 40);
INSERT INTO `core_service_drivers` VALUES (2034, 756, 49);
INSERT INTO `core_service_drivers` VALUES (2035, 756, 50);
INSERT INTO `core_service_drivers` VALUES (2036, 757, 40);
INSERT INTO `core_service_drivers` VALUES (2037, 757, 49);
INSERT INTO `core_service_drivers` VALUES (2038, 757, 50);
INSERT INTO `core_service_drivers` VALUES (2039, 758, 40);
INSERT INTO `core_service_drivers` VALUES (2040, 758, 49);
INSERT INTO `core_service_drivers` VALUES (2041, 758, 50);
INSERT INTO `core_service_drivers` VALUES (2042, 759, 40);
INSERT INTO `core_service_drivers` VALUES (2043, 759, 49);
INSERT INTO `core_service_drivers` VALUES (2044, 759, 50);
INSERT INTO `core_service_drivers` VALUES (2045, 760, 40);
INSERT INTO `core_service_drivers` VALUES (2046, 760, 49);
INSERT INTO `core_service_drivers` VALUES (2047, 760, 50);
INSERT INTO `core_service_drivers` VALUES (2048, 761, 40);
INSERT INTO `core_service_drivers` VALUES (2049, 761, 49);
INSERT INTO `core_service_drivers` VALUES (2050, 761, 50);
INSERT INTO `core_service_drivers` VALUES (2051, 762, 40);
INSERT INTO `core_service_drivers` VALUES (2052, 762, 49);
INSERT INTO `core_service_drivers` VALUES (2053, 762, 50);
INSERT INTO `core_service_drivers` VALUES (2054, 763, 40);
INSERT INTO `core_service_drivers` VALUES (2055, 763, 49);
INSERT INTO `core_service_drivers` VALUES (2056, 763, 50);
INSERT INTO `core_service_drivers` VALUES (2057, 764, 40);
INSERT INTO `core_service_drivers` VALUES (2058, 764, 49);
INSERT INTO `core_service_drivers` VALUES (2059, 764, 50);
INSERT INTO `core_service_drivers` VALUES (2060, 765, 40);
INSERT INTO `core_service_drivers` VALUES (2061, 765, 49);
INSERT INTO `core_service_drivers` VALUES (2062, 765, 50);
INSERT INTO `core_service_drivers` VALUES (2063, 766, 40);
INSERT INTO `core_service_drivers` VALUES (2064, 766, 49);
INSERT INTO `core_service_drivers` VALUES (2065, 766, 50);
INSERT INTO `core_service_drivers` VALUES (2066, 767, 40);
INSERT INTO `core_service_drivers` VALUES (2067, 767, 49);
INSERT INTO `core_service_drivers` VALUES (2068, 767, 50);
INSERT INTO `core_service_drivers` VALUES (2069, 768, 40);
INSERT INTO `core_service_drivers` VALUES (2070, 768, 49);
INSERT INTO `core_service_drivers` VALUES (2071, 768, 50);
INSERT INTO `core_service_drivers` VALUES (2072, 769, 40);
INSERT INTO `core_service_drivers` VALUES (2073, 769, 49);
INSERT INTO `core_service_drivers` VALUES (2074, 769, 50);
INSERT INTO `core_service_drivers` VALUES (2075, 770, 40);
INSERT INTO `core_service_drivers` VALUES (2076, 770, 49);
INSERT INTO `core_service_drivers` VALUES (2077, 770, 50);
INSERT INTO `core_service_drivers` VALUES (2078, 771, 49);
INSERT INTO `core_service_drivers` VALUES (2079, 771, 51);
INSERT INTO `core_service_drivers` VALUES (2080, 771, 55);
INSERT INTO `core_service_drivers` VALUES (2081, 772, 49);
INSERT INTO `core_service_drivers` VALUES (2082, 772, 51);
INSERT INTO `core_service_drivers` VALUES (2083, 772, 55);
INSERT INTO `core_service_drivers` VALUES (2084, 773, 49);
INSERT INTO `core_service_drivers` VALUES (2085, 773, 51);
INSERT INTO `core_service_drivers` VALUES (2086, 773, 55);
INSERT INTO `core_service_drivers` VALUES (2087, 774, 49);
INSERT INTO `core_service_drivers` VALUES (2088, 774, 51);
INSERT INTO `core_service_drivers` VALUES (2089, 774, 55);
INSERT INTO `core_service_drivers` VALUES (2090, 775, 49);
INSERT INTO `core_service_drivers` VALUES (2091, 775, 51);
INSERT INTO `core_service_drivers` VALUES (2092, 775, 55);
INSERT INTO `core_service_drivers` VALUES (2093, 776, 49);
INSERT INTO `core_service_drivers` VALUES (2094, 776, 51);
INSERT INTO `core_service_drivers` VALUES (2095, 776, 55);
INSERT INTO `core_service_drivers` VALUES (2096, 777, 49);
INSERT INTO `core_service_drivers` VALUES (2097, 777, 51);
INSERT INTO `core_service_drivers` VALUES (2098, 777, 55);
INSERT INTO `core_service_drivers` VALUES (2099, 778, 49);
INSERT INTO `core_service_drivers` VALUES (2100, 778, 51);
INSERT INTO `core_service_drivers` VALUES (2101, 778, 55);
INSERT INTO `core_service_drivers` VALUES (2102, 779, 49);
INSERT INTO `core_service_drivers` VALUES (2103, 779, 51);
INSERT INTO `core_service_drivers` VALUES (2104, 779, 55);
INSERT INTO `core_service_drivers` VALUES (2105, 780, 49);
INSERT INTO `core_service_drivers` VALUES (2106, 780, 51);
INSERT INTO `core_service_drivers` VALUES (2107, 780, 55);
INSERT INTO `core_service_drivers` VALUES (2108, 781, 49);
INSERT INTO `core_service_drivers` VALUES (2109, 781, 51);
INSERT INTO `core_service_drivers` VALUES (2110, 781, 55);
INSERT INTO `core_service_drivers` VALUES (2111, 782, 49);
INSERT INTO `core_service_drivers` VALUES (2112, 782, 51);
INSERT INTO `core_service_drivers` VALUES (2113, 782, 55);
INSERT INTO `core_service_drivers` VALUES (2114, 783, 49);
INSERT INTO `core_service_drivers` VALUES (2115, 783, 51);
INSERT INTO `core_service_drivers` VALUES (2116, 783, 55);
INSERT INTO `core_service_drivers` VALUES (2117, 784, 49);
INSERT INTO `core_service_drivers` VALUES (2118, 784, 51);
INSERT INTO `core_service_drivers` VALUES (2119, 784, 55);
INSERT INTO `core_service_drivers` VALUES (2120, 785, 49);
INSERT INTO `core_service_drivers` VALUES (2121, 785, 51);
INSERT INTO `core_service_drivers` VALUES (2122, 785, 55);
INSERT INTO `core_service_drivers` VALUES (2123, 786, 49);
INSERT INTO `core_service_drivers` VALUES (2124, 786, 51);
INSERT INTO `core_service_drivers` VALUES (2125, 786, 55);
INSERT INTO `core_service_drivers` VALUES (2126, 787, 49);
INSERT INTO `core_service_drivers` VALUES (2127, 787, 51);
INSERT INTO `core_service_drivers` VALUES (2128, 787, 55);
INSERT INTO `core_service_drivers` VALUES (2129, 788, 49);
INSERT INTO `core_service_drivers` VALUES (2130, 788, 51);
INSERT INTO `core_service_drivers` VALUES (2131, 788, 55);
INSERT INTO `core_service_drivers` VALUES (2132, 789, 49);
INSERT INTO `core_service_drivers` VALUES (2133, 789, 51);
INSERT INTO `core_service_drivers` VALUES (2134, 789, 55);
INSERT INTO `core_service_drivers` VALUES (2135, 790, 49);
INSERT INTO `core_service_drivers` VALUES (2136, 790, 51);
INSERT INTO `core_service_drivers` VALUES (2137, 790, 55);
INSERT INTO `core_service_drivers` VALUES (2138, 791, 49);
INSERT INTO `core_service_drivers` VALUES (2139, 791, 51);
INSERT INTO `core_service_drivers` VALUES (2140, 791, 55);
INSERT INTO `core_service_drivers` VALUES (2141, 792, 49);
INSERT INTO `core_service_drivers` VALUES (2142, 792, 51);
INSERT INTO `core_service_drivers` VALUES (2143, 792, 55);
INSERT INTO `core_service_drivers` VALUES (2144, 793, 49);
INSERT INTO `core_service_drivers` VALUES (2145, 793, 51);
INSERT INTO `core_service_drivers` VALUES (2146, 793, 55);
INSERT INTO `core_service_drivers` VALUES (2147, 794, 49);
INSERT INTO `core_service_drivers` VALUES (2148, 794, 51);
INSERT INTO `core_service_drivers` VALUES (2149, 794, 55);
INSERT INTO `core_service_drivers` VALUES (2150, 795, 49);
INSERT INTO `core_service_drivers` VALUES (2151, 795, 51);
INSERT INTO `core_service_drivers` VALUES (2152, 795, 55);
INSERT INTO `core_service_drivers` VALUES (2153, 796, 49);
INSERT INTO `core_service_drivers` VALUES (2154, 796, 51);
INSERT INTO `core_service_drivers` VALUES (2155, 796, 55);
INSERT INTO `core_service_drivers` VALUES (2156, 797, 49);
INSERT INTO `core_service_drivers` VALUES (2157, 797, 51);
INSERT INTO `core_service_drivers` VALUES (2158, 797, 55);
INSERT INTO `core_service_drivers` VALUES (2159, 798, 49);
INSERT INTO `core_service_drivers` VALUES (2160, 798, 51);
INSERT INTO `core_service_drivers` VALUES (2161, 798, 55);
INSERT INTO `core_service_drivers` VALUES (2162, 799, 49);
INSERT INTO `core_service_drivers` VALUES (2163, 799, 51);
INSERT INTO `core_service_drivers` VALUES (2164, 799, 55);
INSERT INTO `core_service_drivers` VALUES (2165, 800, 49);
INSERT INTO `core_service_drivers` VALUES (2166, 800, 51);
INSERT INTO `core_service_drivers` VALUES (2167, 800, 55);
INSERT INTO `core_service_drivers` VALUES (2168, 801, 49);
INSERT INTO `core_service_drivers` VALUES (2169, 801, 51);
INSERT INTO `core_service_drivers` VALUES (2170, 801, 55);
INSERT INTO `core_service_drivers` VALUES (2171, 802, 49);
INSERT INTO `core_service_drivers` VALUES (2172, 802, 51);
INSERT INTO `core_service_drivers` VALUES (2173, 802, 55);
INSERT INTO `core_service_drivers` VALUES (2174, 803, 49);
INSERT INTO `core_service_drivers` VALUES (2175, 803, 51);
INSERT INTO `core_service_drivers` VALUES (2176, 803, 55);
INSERT INTO `core_service_drivers` VALUES (2177, 804, 49);
INSERT INTO `core_service_drivers` VALUES (2178, 804, 51);
INSERT INTO `core_service_drivers` VALUES (2179, 804, 55);
INSERT INTO `core_service_drivers` VALUES (2180, 805, 49);
INSERT INTO `core_service_drivers` VALUES (2181, 805, 51);
INSERT INTO `core_service_drivers` VALUES (2182, 805, 55);
INSERT INTO `core_service_drivers` VALUES (2183, 806, 49);
INSERT INTO `core_service_drivers` VALUES (2184, 806, 51);
INSERT INTO `core_service_drivers` VALUES (2185, 806, 55);
INSERT INTO `core_service_drivers` VALUES (2186, 807, 49);
INSERT INTO `core_service_drivers` VALUES (2187, 807, 51);
INSERT INTO `core_service_drivers` VALUES (2188, 807, 55);
INSERT INTO `core_service_drivers` VALUES (2189, 808, 49);
INSERT INTO `core_service_drivers` VALUES (2190, 808, 51);
INSERT INTO `core_service_drivers` VALUES (2191, 808, 55);
INSERT INTO `core_service_drivers` VALUES (2192, 809, 49);
INSERT INTO `core_service_drivers` VALUES (2193, 809, 51);
INSERT INTO `core_service_drivers` VALUES (2194, 809, 55);
INSERT INTO `core_service_drivers` VALUES (2195, 810, 49);
INSERT INTO `core_service_drivers` VALUES (2196, 810, 51);
INSERT INTO `core_service_drivers` VALUES (2197, 810, 55);
INSERT INTO `core_service_drivers` VALUES (2198, 811, 49);
INSERT INTO `core_service_drivers` VALUES (2199, 811, 51);
INSERT INTO `core_service_drivers` VALUES (2200, 811, 55);
INSERT INTO `core_service_drivers` VALUES (2201, 812, 49);
INSERT INTO `core_service_drivers` VALUES (2202, 812, 51);
INSERT INTO `core_service_drivers` VALUES (2203, 812, 55);
INSERT INTO `core_service_drivers` VALUES (2204, 813, 49);
INSERT INTO `core_service_drivers` VALUES (2205, 813, 51);
INSERT INTO `core_service_drivers` VALUES (2206, 813, 55);
INSERT INTO `core_service_drivers` VALUES (2207, 814, 49);
INSERT INTO `core_service_drivers` VALUES (2208, 814, 51);
INSERT INTO `core_service_drivers` VALUES (2209, 814, 55);
INSERT INTO `core_service_drivers` VALUES (2210, 815, 49);
INSERT INTO `core_service_drivers` VALUES (2211, 815, 51);
INSERT INTO `core_service_drivers` VALUES (2212, 815, 55);
INSERT INTO `core_service_drivers` VALUES (2213, 816, 49);
INSERT INTO `core_service_drivers` VALUES (2214, 816, 51);
INSERT INTO `core_service_drivers` VALUES (2215, 816, 55);
INSERT INTO `core_service_drivers` VALUES (2216, 817, 49);
INSERT INTO `core_service_drivers` VALUES (2217, 817, 51);
INSERT INTO `core_service_drivers` VALUES (2218, 817, 55);
INSERT INTO `core_service_drivers` VALUES (2219, 818, 49);
INSERT INTO `core_service_drivers` VALUES (2220, 818, 51);
INSERT INTO `core_service_drivers` VALUES (2221, 818, 55);
INSERT INTO `core_service_drivers` VALUES (2222, 819, 49);
INSERT INTO `core_service_drivers` VALUES (2223, 819, 51);
INSERT INTO `core_service_drivers` VALUES (2224, 819, 55);
INSERT INTO `core_service_drivers` VALUES (2225, 820, 49);
INSERT INTO `core_service_drivers` VALUES (2226, 820, 51);
INSERT INTO `core_service_drivers` VALUES (2227, 820, 55);
INSERT INTO `core_service_drivers` VALUES (2228, 821, 49);
INSERT INTO `core_service_drivers` VALUES (2229, 821, 51);
INSERT INTO `core_service_drivers` VALUES (2230, 821, 55);
INSERT INTO `core_service_drivers` VALUES (2231, 822, 49);
INSERT INTO `core_service_drivers` VALUES (2232, 822, 51);
INSERT INTO `core_service_drivers` VALUES (2233, 822, 55);
INSERT INTO `core_service_drivers` VALUES (2234, 823, 49);
INSERT INTO `core_service_drivers` VALUES (2235, 823, 51);
INSERT INTO `core_service_drivers` VALUES (2236, 823, 55);
INSERT INTO `core_service_drivers` VALUES (2237, 824, 49);
INSERT INTO `core_service_drivers` VALUES (2238, 824, 51);
INSERT INTO `core_service_drivers` VALUES (2239, 824, 55);
INSERT INTO `core_service_drivers` VALUES (2240, 825, 49);
INSERT INTO `core_service_drivers` VALUES (2241, 825, 51);
INSERT INTO `core_service_drivers` VALUES (2242, 825, 55);
INSERT INTO `core_service_drivers` VALUES (2243, 826, 49);
INSERT INTO `core_service_drivers` VALUES (2244, 826, 51);
INSERT INTO `core_service_drivers` VALUES (2245, 826, 55);
INSERT INTO `core_service_drivers` VALUES (2246, 827, 49);
INSERT INTO `core_service_drivers` VALUES (2247, 827, 51);
INSERT INTO `core_service_drivers` VALUES (2248, 827, 55);
INSERT INTO `core_service_drivers` VALUES (2249, 828, 49);
INSERT INTO `core_service_drivers` VALUES (2250, 828, 51);
INSERT INTO `core_service_drivers` VALUES (2251, 828, 55);
INSERT INTO `core_service_drivers` VALUES (2252, 829, 49);
INSERT INTO `core_service_drivers` VALUES (2253, 829, 51);
INSERT INTO `core_service_drivers` VALUES (2254, 829, 55);
INSERT INTO `core_service_drivers` VALUES (2255, 830, 49);
INSERT INTO `core_service_drivers` VALUES (2256, 830, 51);
INSERT INTO `core_service_drivers` VALUES (2257, 830, 55);
INSERT INTO `core_service_drivers` VALUES (2258, 831, 49);
INSERT INTO `core_service_drivers` VALUES (2259, 831, 51);
INSERT INTO `core_service_drivers` VALUES (2260, 831, 55);
INSERT INTO `core_service_drivers` VALUES (2261, 832, 49);
INSERT INTO `core_service_drivers` VALUES (2262, 832, 51);
INSERT INTO `core_service_drivers` VALUES (2263, 832, 55);
INSERT INTO `core_service_drivers` VALUES (2264, 833, 49);
INSERT INTO `core_service_drivers` VALUES (2265, 833, 51);
INSERT INTO `core_service_drivers` VALUES (2266, 833, 55);
INSERT INTO `core_service_drivers` VALUES (2267, 834, 49);
INSERT INTO `core_service_drivers` VALUES (2268, 834, 51);
INSERT INTO `core_service_drivers` VALUES (2269, 834, 55);
INSERT INTO `core_service_drivers` VALUES (2270, 835, 49);
INSERT INTO `core_service_drivers` VALUES (2271, 835, 51);
INSERT INTO `core_service_drivers` VALUES (2272, 835, 55);
INSERT INTO `core_service_drivers` VALUES (2273, 836, 49);
INSERT INTO `core_service_drivers` VALUES (2274, 836, 51);
INSERT INTO `core_service_drivers` VALUES (2275, 836, 55);
INSERT INTO `core_service_drivers` VALUES (2276, 837, 49);
INSERT INTO `core_service_drivers` VALUES (2277, 837, 51);
INSERT INTO `core_service_drivers` VALUES (2278, 837, 55);
INSERT INTO `core_service_drivers` VALUES (2279, 838, 49);
INSERT INTO `core_service_drivers` VALUES (2280, 838, 51);
INSERT INTO `core_service_drivers` VALUES (2281, 838, 55);
INSERT INTO `core_service_drivers` VALUES (2282, 839, 49);
INSERT INTO `core_service_drivers` VALUES (2283, 839, 51);
INSERT INTO `core_service_drivers` VALUES (2284, 839, 55);
INSERT INTO `core_service_drivers` VALUES (2285, 840, 49);
INSERT INTO `core_service_drivers` VALUES (2286, 840, 51);
INSERT INTO `core_service_drivers` VALUES (2287, 840, 55);
INSERT INTO `core_service_drivers` VALUES (2288, 841, 49);
INSERT INTO `core_service_drivers` VALUES (2289, 841, 51);
INSERT INTO `core_service_drivers` VALUES (2290, 841, 55);
INSERT INTO `core_service_drivers` VALUES (2291, 842, 49);
INSERT INTO `core_service_drivers` VALUES (2292, 842, 51);
INSERT INTO `core_service_drivers` VALUES (2293, 842, 55);
INSERT INTO `core_service_drivers` VALUES (2294, 843, 49);
INSERT INTO `core_service_drivers` VALUES (2295, 843, 51);
INSERT INTO `core_service_drivers` VALUES (2296, 843, 55);
INSERT INTO `core_service_drivers` VALUES (2297, 844, 49);
INSERT INTO `core_service_drivers` VALUES (2298, 844, 51);
INSERT INTO `core_service_drivers` VALUES (2299, 844, 55);
INSERT INTO `core_service_drivers` VALUES (2300, 845, 49);
INSERT INTO `core_service_drivers` VALUES (2301, 845, 51);
INSERT INTO `core_service_drivers` VALUES (2302, 845, 55);
INSERT INTO `core_service_drivers` VALUES (2303, 846, 49);
INSERT INTO `core_service_drivers` VALUES (2304, 846, 51);
INSERT INTO `core_service_drivers` VALUES (2305, 846, 55);
INSERT INTO `core_service_drivers` VALUES (2306, 847, 49);
INSERT INTO `core_service_drivers` VALUES (2307, 847, 51);
INSERT INTO `core_service_drivers` VALUES (2308, 847, 55);
INSERT INTO `core_service_drivers` VALUES (2309, 848, 49);
INSERT INTO `core_service_drivers` VALUES (2310, 848, 51);
INSERT INTO `core_service_drivers` VALUES (2311, 848, 55);
INSERT INTO `core_service_drivers` VALUES (2312, 849, 49);
INSERT INTO `core_service_drivers` VALUES (2313, 849, 51);
INSERT INTO `core_service_drivers` VALUES (2314, 849, 55);
INSERT INTO `core_service_drivers` VALUES (2315, 850, 49);
INSERT INTO `core_service_drivers` VALUES (2316, 850, 51);
INSERT INTO `core_service_drivers` VALUES (2317, 850, 55);
INSERT INTO `core_service_drivers` VALUES (2318, 851, 49);
INSERT INTO `core_service_drivers` VALUES (2319, 851, 51);
INSERT INTO `core_service_drivers` VALUES (2320, 851, 55);
INSERT INTO `core_service_drivers` VALUES (2321, 852, 49);
INSERT INTO `core_service_drivers` VALUES (2322, 852, 51);
INSERT INTO `core_service_drivers` VALUES (2323, 852, 55);
INSERT INTO `core_service_drivers` VALUES (2324, 853, 49);
INSERT INTO `core_service_drivers` VALUES (2325, 853, 51);
INSERT INTO `core_service_drivers` VALUES (2326, 853, 55);
INSERT INTO `core_service_drivers` VALUES (2327, 854, 49);
INSERT INTO `core_service_drivers` VALUES (2328, 854, 51);
INSERT INTO `core_service_drivers` VALUES (2329, 854, 55);
INSERT INTO `core_service_drivers` VALUES (2330, 855, 49);
INSERT INTO `core_service_drivers` VALUES (2331, 855, 51);
INSERT INTO `core_service_drivers` VALUES (2332, 855, 55);
INSERT INTO `core_service_drivers` VALUES (2333, 856, 49);
INSERT INTO `core_service_drivers` VALUES (2334, 856, 51);
INSERT INTO `core_service_drivers` VALUES (2335, 856, 55);
INSERT INTO `core_service_drivers` VALUES (2336, 857, 49);
INSERT INTO `core_service_drivers` VALUES (2337, 857, 51);
INSERT INTO `core_service_drivers` VALUES (2338, 857, 55);
INSERT INTO `core_service_drivers` VALUES (2339, 858, 49);
INSERT INTO `core_service_drivers` VALUES (2340, 858, 51);
INSERT INTO `core_service_drivers` VALUES (2341, 858, 55);
INSERT INTO `core_service_drivers` VALUES (2342, 859, 49);
INSERT INTO `core_service_drivers` VALUES (2343, 859, 51);
INSERT INTO `core_service_drivers` VALUES (2344, 859, 55);
INSERT INTO `core_service_drivers` VALUES (2345, 860, 49);
INSERT INTO `core_service_drivers` VALUES (2346, 860, 51);
INSERT INTO `core_service_drivers` VALUES (2347, 860, 55);
INSERT INTO `core_service_drivers` VALUES (2348, 861, 49);
INSERT INTO `core_service_drivers` VALUES (2349, 861, 51);
INSERT INTO `core_service_drivers` VALUES (2350, 861, 55);
INSERT INTO `core_service_drivers` VALUES (2351, 862, 49);
INSERT INTO `core_service_drivers` VALUES (2352, 862, 51);
INSERT INTO `core_service_drivers` VALUES (2353, 862, 55);
INSERT INTO `core_service_drivers` VALUES (2354, 863, 49);
INSERT INTO `core_service_drivers` VALUES (2355, 863, 51);
INSERT INTO `core_service_drivers` VALUES (2356, 863, 55);
INSERT INTO `core_service_drivers` VALUES (2357, 864, 49);
INSERT INTO `core_service_drivers` VALUES (2358, 864, 51);
INSERT INTO `core_service_drivers` VALUES (2359, 864, 55);
INSERT INTO `core_service_drivers` VALUES (2360, 865, 49);
INSERT INTO `core_service_drivers` VALUES (2361, 865, 51);
INSERT INTO `core_service_drivers` VALUES (2362, 865, 55);
INSERT INTO `core_service_drivers` VALUES (2363, 866, 49);
INSERT INTO `core_service_drivers` VALUES (2364, 866, 51);
INSERT INTO `core_service_drivers` VALUES (2365, 866, 55);
INSERT INTO `core_service_drivers` VALUES (2366, 867, 49);
INSERT INTO `core_service_drivers` VALUES (2367, 867, 51);
INSERT INTO `core_service_drivers` VALUES (2368, 867, 55);
INSERT INTO `core_service_drivers` VALUES (2369, 868, 49);
INSERT INTO `core_service_drivers` VALUES (2370, 868, 51);
INSERT INTO `core_service_drivers` VALUES (2371, 868, 55);
INSERT INTO `core_service_drivers` VALUES (2372, 869, 49);
INSERT INTO `core_service_drivers` VALUES (2373, 869, 51);
INSERT INTO `core_service_drivers` VALUES (2374, 869, 55);
INSERT INTO `core_service_drivers` VALUES (2375, 870, 49);
INSERT INTO `core_service_drivers` VALUES (2376, 870, 51);
INSERT INTO `core_service_drivers` VALUES (2377, 870, 55);
INSERT INTO `core_service_drivers` VALUES (2378, 871, 49);
INSERT INTO `core_service_drivers` VALUES (2379, 871, 51);
INSERT INTO `core_service_drivers` VALUES (2380, 871, 55);
INSERT INTO `core_service_drivers` VALUES (2381, 872, 49);
INSERT INTO `core_service_drivers` VALUES (2382, 872, 51);
INSERT INTO `core_service_drivers` VALUES (2383, 872, 55);
INSERT INTO `core_service_drivers` VALUES (2384, 873, 49);
INSERT INTO `core_service_drivers` VALUES (2385, 873, 51);
INSERT INTO `core_service_drivers` VALUES (2386, 873, 55);
INSERT INTO `core_service_drivers` VALUES (2387, 874, 49);
INSERT INTO `core_service_drivers` VALUES (2388, 874, 51);
INSERT INTO `core_service_drivers` VALUES (2389, 874, 55);
INSERT INTO `core_service_drivers` VALUES (2390, 875, 49);
INSERT INTO `core_service_drivers` VALUES (2391, 875, 51);
INSERT INTO `core_service_drivers` VALUES (2392, 875, 55);
INSERT INTO `core_service_drivers` VALUES (2393, 876, 49);
INSERT INTO `core_service_drivers` VALUES (2394, 876, 51);
INSERT INTO `core_service_drivers` VALUES (2395, 876, 55);
INSERT INTO `core_service_drivers` VALUES (2396, 877, 49);
INSERT INTO `core_service_drivers` VALUES (2397, 877, 51);
INSERT INTO `core_service_drivers` VALUES (2398, 877, 55);
INSERT INTO `core_service_drivers` VALUES (2399, 878, 49);
INSERT INTO `core_service_drivers` VALUES (2400, 878, 51);
INSERT INTO `core_service_drivers` VALUES (2401, 878, 55);
INSERT INTO `core_service_drivers` VALUES (2402, 879, 49);
INSERT INTO `core_service_drivers` VALUES (2403, 879, 51);
INSERT INTO `core_service_drivers` VALUES (2404, 879, 55);
INSERT INTO `core_service_drivers` VALUES (2405, 880, 49);
INSERT INTO `core_service_drivers` VALUES (2406, 880, 51);
INSERT INTO `core_service_drivers` VALUES (2407, 880, 55);
INSERT INTO `core_service_drivers` VALUES (2408, 881, 49);
INSERT INTO `core_service_drivers` VALUES (2409, 881, 51);
INSERT INTO `core_service_drivers` VALUES (2410, 881, 55);
INSERT INTO `core_service_drivers` VALUES (2411, 882, 49);
INSERT INTO `core_service_drivers` VALUES (2412, 882, 51);
INSERT INTO `core_service_drivers` VALUES (2413, 882, 55);
INSERT INTO `core_service_drivers` VALUES (2414, 883, 49);
INSERT INTO `core_service_drivers` VALUES (2415, 883, 51);
INSERT INTO `core_service_drivers` VALUES (2416, 883, 55);
INSERT INTO `core_service_drivers` VALUES (2417, 884, 49);
INSERT INTO `core_service_drivers` VALUES (2418, 884, 51);
INSERT INTO `core_service_drivers` VALUES (2419, 884, 55);
INSERT INTO `core_service_drivers` VALUES (2420, 885, 49);
INSERT INTO `core_service_drivers` VALUES (2421, 885, 51);
INSERT INTO `core_service_drivers` VALUES (2422, 885, 55);
INSERT INTO `core_service_drivers` VALUES (2423, 886, 49);
INSERT INTO `core_service_drivers` VALUES (2424, 886, 51);
INSERT INTO `core_service_drivers` VALUES (2425, 886, 55);
INSERT INTO `core_service_drivers` VALUES (2426, 887, 49);
INSERT INTO `core_service_drivers` VALUES (2427, 887, 51);
INSERT INTO `core_service_drivers` VALUES (2428, 887, 55);
INSERT INTO `core_service_drivers` VALUES (2429, 888, 49);
INSERT INTO `core_service_drivers` VALUES (2430, 888, 51);
INSERT INTO `core_service_drivers` VALUES (2431, 888, 55);
INSERT INTO `core_service_drivers` VALUES (2432, 889, 49);
INSERT INTO `core_service_drivers` VALUES (2433, 889, 51);
INSERT INTO `core_service_drivers` VALUES (2434, 889, 55);
INSERT INTO `core_service_drivers` VALUES (2435, 890, 49);
INSERT INTO `core_service_drivers` VALUES (2436, 890, 51);
INSERT INTO `core_service_drivers` VALUES (2437, 890, 55);
INSERT INTO `core_service_drivers` VALUES (2438, 891, 49);
INSERT INTO `core_service_drivers` VALUES (2439, 891, 51);
INSERT INTO `core_service_drivers` VALUES (2440, 891, 55);
INSERT INTO `core_service_drivers` VALUES (2441, 892, 49);
INSERT INTO `core_service_drivers` VALUES (2442, 892, 51);
INSERT INTO `core_service_drivers` VALUES (2443, 892, 55);
INSERT INTO `core_service_drivers` VALUES (2444, 893, 49);
INSERT INTO `core_service_drivers` VALUES (2445, 893, 51);
INSERT INTO `core_service_drivers` VALUES (2446, 893, 55);
INSERT INTO `core_service_drivers` VALUES (2447, 894, 49);
INSERT INTO `core_service_drivers` VALUES (2448, 894, 51);
INSERT INTO `core_service_drivers` VALUES (2449, 894, 55);
INSERT INTO `core_service_drivers` VALUES (2450, 895, 49);
INSERT INTO `core_service_drivers` VALUES (2451, 895, 51);
INSERT INTO `core_service_drivers` VALUES (2452, 895, 55);
INSERT INTO `core_service_drivers` VALUES (2453, 896, 49);
INSERT INTO `core_service_drivers` VALUES (2454, 896, 51);
INSERT INTO `core_service_drivers` VALUES (2455, 896, 55);
INSERT INTO `core_service_drivers` VALUES (2456, 897, 49);
INSERT INTO `core_service_drivers` VALUES (2457, 897, 51);
INSERT INTO `core_service_drivers` VALUES (2458, 897, 55);
INSERT INTO `core_service_drivers` VALUES (2459, 898, 49);
INSERT INTO `core_service_drivers` VALUES (2460, 898, 51);
INSERT INTO `core_service_drivers` VALUES (2461, 898, 55);
INSERT INTO `core_service_drivers` VALUES (2462, 899, 49);
INSERT INTO `core_service_drivers` VALUES (2463, 899, 51);
INSERT INTO `core_service_drivers` VALUES (2464, 899, 55);
INSERT INTO `core_service_drivers` VALUES (2465, 900, 49);
INSERT INTO `core_service_drivers` VALUES (2466, 900, 51);
INSERT INTO `core_service_drivers` VALUES (2467, 900, 55);
INSERT INTO `core_service_drivers` VALUES (2468, 901, 49);
INSERT INTO `core_service_drivers` VALUES (2469, 901, 51);
INSERT INTO `core_service_drivers` VALUES (2470, 901, 55);
INSERT INTO `core_service_drivers` VALUES (2471, 902, 49);
INSERT INTO `core_service_drivers` VALUES (2472, 902, 51);
INSERT INTO `core_service_drivers` VALUES (2473, 902, 55);
INSERT INTO `core_service_drivers` VALUES (2474, 903, 49);
INSERT INTO `core_service_drivers` VALUES (2475, 903, 51);
INSERT INTO `core_service_drivers` VALUES (2476, 903, 55);
INSERT INTO `core_service_drivers` VALUES (2477, 904, 49);
INSERT INTO `core_service_drivers` VALUES (2478, 904, 51);
INSERT INTO `core_service_drivers` VALUES (2479, 904, 55);
INSERT INTO `core_service_drivers` VALUES (2480, 905, 49);
INSERT INTO `core_service_drivers` VALUES (2481, 905, 51);
INSERT INTO `core_service_drivers` VALUES (2482, 905, 55);
INSERT INTO `core_service_drivers` VALUES (2483, 906, 49);
INSERT INTO `core_service_drivers` VALUES (2484, 906, 51);
INSERT INTO `core_service_drivers` VALUES (2485, 906, 55);
INSERT INTO `core_service_drivers` VALUES (2486, 907, 49);
INSERT INTO `core_service_drivers` VALUES (2487, 907, 51);
INSERT INTO `core_service_drivers` VALUES (2488, 907, 55);
INSERT INTO `core_service_drivers` VALUES (2489, 908, 49);
INSERT INTO `core_service_drivers` VALUES (2490, 908, 51);
INSERT INTO `core_service_drivers` VALUES (2491, 908, 55);
INSERT INTO `core_service_drivers` VALUES (2492, 909, 49);
INSERT INTO `core_service_drivers` VALUES (2493, 909, 51);
INSERT INTO `core_service_drivers` VALUES (2494, 909, 55);
INSERT INTO `core_service_drivers` VALUES (2495, 910, 49);
INSERT INTO `core_service_drivers` VALUES (2496, 910, 51);
INSERT INTO `core_service_drivers` VALUES (2497, 910, 55);
INSERT INTO `core_service_drivers` VALUES (2498, 911, 49);
INSERT INTO `core_service_drivers` VALUES (2499, 911, 51);
INSERT INTO `core_service_drivers` VALUES (2500, 911, 55);
INSERT INTO `core_service_drivers` VALUES (2501, 912, 49);
INSERT INTO `core_service_drivers` VALUES (2502, 912, 51);
INSERT INTO `core_service_drivers` VALUES (2503, 912, 55);
INSERT INTO `core_service_drivers` VALUES (2504, 913, 49);
INSERT INTO `core_service_drivers` VALUES (2505, 913, 51);
INSERT INTO `core_service_drivers` VALUES (2506, 913, 55);
INSERT INTO `core_service_drivers` VALUES (2507, 914, 49);
INSERT INTO `core_service_drivers` VALUES (2508, 914, 51);
INSERT INTO `core_service_drivers` VALUES (2509, 914, 55);
INSERT INTO `core_service_drivers` VALUES (2510, 915, 49);
INSERT INTO `core_service_drivers` VALUES (2511, 915, 51);
INSERT INTO `core_service_drivers` VALUES (2512, 915, 55);
INSERT INTO `core_service_drivers` VALUES (2513, 916, 49);
INSERT INTO `core_service_drivers` VALUES (2514, 916, 51);
INSERT INTO `core_service_drivers` VALUES (2515, 916, 55);
INSERT INTO `core_service_drivers` VALUES (2516, 917, 49);
INSERT INTO `core_service_drivers` VALUES (2517, 917, 51);
INSERT INTO `core_service_drivers` VALUES (2518, 917, 55);
INSERT INTO `core_service_drivers` VALUES (2519, 918, 49);
INSERT INTO `core_service_drivers` VALUES (2520, 918, 51);
INSERT INTO `core_service_drivers` VALUES (2521, 918, 55);
INSERT INTO `core_service_drivers` VALUES (2522, 919, 49);
INSERT INTO `core_service_drivers` VALUES (2523, 919, 51);
INSERT INTO `core_service_drivers` VALUES (2524, 919, 55);
INSERT INTO `core_service_drivers` VALUES (2525, 920, 49);
INSERT INTO `core_service_drivers` VALUES (2526, 920, 51);
INSERT INTO `core_service_drivers` VALUES (2527, 920, 55);
INSERT INTO `core_service_drivers` VALUES (2528, 921, 49);
INSERT INTO `core_service_drivers` VALUES (2529, 921, 51);
INSERT INTO `core_service_drivers` VALUES (2530, 921, 55);
INSERT INTO `core_service_drivers` VALUES (2531, 922, 49);
INSERT INTO `core_service_drivers` VALUES (2532, 922, 51);
INSERT INTO `core_service_drivers` VALUES (2533, 922, 55);
INSERT INTO `core_service_drivers` VALUES (2534, 923, 49);
INSERT INTO `core_service_drivers` VALUES (2535, 923, 51);
INSERT INTO `core_service_drivers` VALUES (2536, 923, 54);
INSERT INTO `core_service_drivers` VALUES (2537, 924, 49);
INSERT INTO `core_service_drivers` VALUES (2538, 924, 51);
INSERT INTO `core_service_drivers` VALUES (2539, 924, 54);
INSERT INTO `core_service_drivers` VALUES (2540, 925, 49);
INSERT INTO `core_service_drivers` VALUES (2541, 925, 51);
INSERT INTO `core_service_drivers` VALUES (2542, 925, 54);
INSERT INTO `core_service_drivers` VALUES (2543, 926, 49);
INSERT INTO `core_service_drivers` VALUES (2544, 926, 51);
INSERT INTO `core_service_drivers` VALUES (2545, 926, 54);
INSERT INTO `core_service_drivers` VALUES (2546, 927, 49);
INSERT INTO `core_service_drivers` VALUES (2547, 927, 51);
INSERT INTO `core_service_drivers` VALUES (2548, 927, 54);
INSERT INTO `core_service_drivers` VALUES (2549, 928, 49);
INSERT INTO `core_service_drivers` VALUES (2550, 928, 51);
INSERT INTO `core_service_drivers` VALUES (2551, 928, 54);
INSERT INTO `core_service_drivers` VALUES (2552, 929, 49);
INSERT INTO `core_service_drivers` VALUES (2553, 929, 51);
INSERT INTO `core_service_drivers` VALUES (2554, 929, 54);
INSERT INTO `core_service_drivers` VALUES (2555, 930, 49);
INSERT INTO `core_service_drivers` VALUES (2556, 930, 51);
INSERT INTO `core_service_drivers` VALUES (2557, 930, 54);
INSERT INTO `core_service_drivers` VALUES (2558, 931, 49);
INSERT INTO `core_service_drivers` VALUES (2559, 931, 51);
INSERT INTO `core_service_drivers` VALUES (2560, 931, 54);
INSERT INTO `core_service_drivers` VALUES (2561, 932, 49);
INSERT INTO `core_service_drivers` VALUES (2562, 932, 51);
INSERT INTO `core_service_drivers` VALUES (2563, 932, 54);
INSERT INTO `core_service_drivers` VALUES (2564, 933, 49);
INSERT INTO `core_service_drivers` VALUES (2565, 933, 51);
INSERT INTO `core_service_drivers` VALUES (2566, 933, 54);
INSERT INTO `core_service_drivers` VALUES (2567, 934, 49);
INSERT INTO `core_service_drivers` VALUES (2568, 934, 51);
INSERT INTO `core_service_drivers` VALUES (2569, 934, 54);
INSERT INTO `core_service_drivers` VALUES (2570, 935, 49);
INSERT INTO `core_service_drivers` VALUES (2571, 935, 51);
INSERT INTO `core_service_drivers` VALUES (2572, 935, 54);
INSERT INTO `core_service_drivers` VALUES (2573, 936, 49);
INSERT INTO `core_service_drivers` VALUES (2574, 936, 51);
INSERT INTO `core_service_drivers` VALUES (2575, 936, 54);
INSERT INTO `core_service_drivers` VALUES (2576, 937, 49);
INSERT INTO `core_service_drivers` VALUES (2577, 937, 51);
INSERT INTO `core_service_drivers` VALUES (2578, 937, 54);
INSERT INTO `core_service_drivers` VALUES (2579, 938, 49);
INSERT INTO `core_service_drivers` VALUES (2580, 938, 51);
INSERT INTO `core_service_drivers` VALUES (2581, 938, 54);
INSERT INTO `core_service_drivers` VALUES (2582, 939, 49);
INSERT INTO `core_service_drivers` VALUES (2583, 939, 51);
INSERT INTO `core_service_drivers` VALUES (2584, 939, 54);
INSERT INTO `core_service_drivers` VALUES (2585, 940, 49);
INSERT INTO `core_service_drivers` VALUES (2586, 940, 51);
INSERT INTO `core_service_drivers` VALUES (2587, 940, 54);
INSERT INTO `core_service_drivers` VALUES (2588, 941, 49);
INSERT INTO `core_service_drivers` VALUES (2589, 941, 51);
INSERT INTO `core_service_drivers` VALUES (2590, 941, 54);
INSERT INTO `core_service_drivers` VALUES (2591, 942, 49);
INSERT INTO `core_service_drivers` VALUES (2592, 942, 51);
INSERT INTO `core_service_drivers` VALUES (2593, 942, 54);
INSERT INTO `core_service_drivers` VALUES (2594, 943, 49);
INSERT INTO `core_service_drivers` VALUES (2595, 943, 51);
INSERT INTO `core_service_drivers` VALUES (2596, 943, 54);
INSERT INTO `core_service_drivers` VALUES (2597, 944, 49);
INSERT INTO `core_service_drivers` VALUES (2598, 944, 51);
INSERT INTO `core_service_drivers` VALUES (2599, 944, 54);
INSERT INTO `core_service_drivers` VALUES (2600, 945, 49);
INSERT INTO `core_service_drivers` VALUES (2601, 945, 51);
INSERT INTO `core_service_drivers` VALUES (2602, 945, 54);
INSERT INTO `core_service_drivers` VALUES (2603, 946, 49);
INSERT INTO `core_service_drivers` VALUES (2604, 946, 51);
INSERT INTO `core_service_drivers` VALUES (2605, 946, 54);
INSERT INTO `core_service_drivers` VALUES (2606, 947, 49);
INSERT INTO `core_service_drivers` VALUES (2607, 947, 51);
INSERT INTO `core_service_drivers` VALUES (2608, 947, 54);
INSERT INTO `core_service_drivers` VALUES (2609, 948, 49);
INSERT INTO `core_service_drivers` VALUES (2610, 948, 51);
INSERT INTO `core_service_drivers` VALUES (2611, 948, 54);
INSERT INTO `core_service_drivers` VALUES (2612, 949, 49);
INSERT INTO `core_service_drivers` VALUES (2613, 949, 51);
INSERT INTO `core_service_drivers` VALUES (2614, 949, 54);
INSERT INTO `core_service_drivers` VALUES (2615, 950, 49);
INSERT INTO `core_service_drivers` VALUES (2616, 950, 51);
INSERT INTO `core_service_drivers` VALUES (2617, 950, 54);
INSERT INTO `core_service_drivers` VALUES (2618, 951, 49);
INSERT INTO `core_service_drivers` VALUES (2619, 951, 51);
INSERT INTO `core_service_drivers` VALUES (2620, 951, 54);
INSERT INTO `core_service_drivers` VALUES (2621, 952, 49);
INSERT INTO `core_service_drivers` VALUES (2622, 952, 51);
INSERT INTO `core_service_drivers` VALUES (2623, 952, 54);
INSERT INTO `core_service_drivers` VALUES (2624, 953, 49);
INSERT INTO `core_service_drivers` VALUES (2625, 953, 51);
INSERT INTO `core_service_drivers` VALUES (2626, 953, 54);
INSERT INTO `core_service_drivers` VALUES (2627, 954, 49);
INSERT INTO `core_service_drivers` VALUES (2628, 954, 51);
INSERT INTO `core_service_drivers` VALUES (2629, 954, 54);
INSERT INTO `core_service_drivers` VALUES (2630, 955, 49);
INSERT INTO `core_service_drivers` VALUES (2631, 955, 51);
INSERT INTO `core_service_drivers` VALUES (2632, 955, 54);
INSERT INTO `core_service_drivers` VALUES (2633, 956, 49);
INSERT INTO `core_service_drivers` VALUES (2634, 956, 51);
INSERT INTO `core_service_drivers` VALUES (2635, 956, 54);
INSERT INTO `core_service_drivers` VALUES (2636, 957, 49);
INSERT INTO `core_service_drivers` VALUES (2637, 957, 51);
INSERT INTO `core_service_drivers` VALUES (2638, 957, 54);
INSERT INTO `core_service_drivers` VALUES (2639, 958, 49);
INSERT INTO `core_service_drivers` VALUES (2640, 958, 51);
INSERT INTO `core_service_drivers` VALUES (2641, 958, 54);
INSERT INTO `core_service_drivers` VALUES (2642, 959, 49);
INSERT INTO `core_service_drivers` VALUES (2643, 959, 51);
INSERT INTO `core_service_drivers` VALUES (2644, 959, 54);
INSERT INTO `core_service_drivers` VALUES (2645, 960, 49);
INSERT INTO `core_service_drivers` VALUES (2646, 960, 51);
INSERT INTO `core_service_drivers` VALUES (2647, 960, 54);
INSERT INTO `core_service_drivers` VALUES (2648, 961, 49);
INSERT INTO `core_service_drivers` VALUES (2649, 961, 51);
INSERT INTO `core_service_drivers` VALUES (2650, 961, 54);
INSERT INTO `core_service_drivers` VALUES (2651, 962, 49);
INSERT INTO `core_service_drivers` VALUES (2652, 962, 51);
INSERT INTO `core_service_drivers` VALUES (2653, 962, 54);
INSERT INTO `core_service_drivers` VALUES (2654, 963, 49);
INSERT INTO `core_service_drivers` VALUES (2655, 963, 51);
INSERT INTO `core_service_drivers` VALUES (2656, 963, 54);
INSERT INTO `core_service_drivers` VALUES (2657, 964, 49);
INSERT INTO `core_service_drivers` VALUES (2658, 964, 51);
INSERT INTO `core_service_drivers` VALUES (2659, 964, 54);
INSERT INTO `core_service_drivers` VALUES (2660, 965, 49);
INSERT INTO `core_service_drivers` VALUES (2661, 965, 51);
INSERT INTO `core_service_drivers` VALUES (2662, 965, 54);
INSERT INTO `core_service_drivers` VALUES (2663, 966, 49);
INSERT INTO `core_service_drivers` VALUES (2664, 966, 51);
INSERT INTO `core_service_drivers` VALUES (2665, 966, 54);
INSERT INTO `core_service_drivers` VALUES (2666, 967, 49);
INSERT INTO `core_service_drivers` VALUES (2667, 967, 51);
INSERT INTO `core_service_drivers` VALUES (2668, 967, 54);
INSERT INTO `core_service_drivers` VALUES (2669, 968, 49);
INSERT INTO `core_service_drivers` VALUES (2670, 968, 51);
INSERT INTO `core_service_drivers` VALUES (2671, 968, 54);
INSERT INTO `core_service_drivers` VALUES (2672, 969, 49);
INSERT INTO `core_service_drivers` VALUES (2673, 969, 51);
INSERT INTO `core_service_drivers` VALUES (2674, 969, 54);
INSERT INTO `core_service_drivers` VALUES (2675, 970, 49);
INSERT INTO `core_service_drivers` VALUES (2676, 970, 51);
INSERT INTO `core_service_drivers` VALUES (2677, 970, 54);
INSERT INTO `core_service_drivers` VALUES (2678, 971, 49);
INSERT INTO `core_service_drivers` VALUES (2679, 971, 51);
INSERT INTO `core_service_drivers` VALUES (2680, 971, 54);
INSERT INTO `core_service_drivers` VALUES (2681, 972, 49);
INSERT INTO `core_service_drivers` VALUES (2682, 972, 51);
INSERT INTO `core_service_drivers` VALUES (2683, 972, 54);
INSERT INTO `core_service_drivers` VALUES (2684, 973, 49);
INSERT INTO `core_service_drivers` VALUES (2685, 973, 51);
INSERT INTO `core_service_drivers` VALUES (2686, 973, 54);
INSERT INTO `core_service_drivers` VALUES (2687, 974, 49);
INSERT INTO `core_service_drivers` VALUES (2688, 974, 51);
INSERT INTO `core_service_drivers` VALUES (2689, 974, 54);
INSERT INTO `core_service_drivers` VALUES (2690, 975, 49);
INSERT INTO `core_service_drivers` VALUES (2691, 975, 51);
INSERT INTO `core_service_drivers` VALUES (2692, 975, 54);
INSERT INTO `core_service_drivers` VALUES (2693, 976, 49);
INSERT INTO `core_service_drivers` VALUES (2694, 976, 51);
INSERT INTO `core_service_drivers` VALUES (2695, 976, 54);
INSERT INTO `core_service_drivers` VALUES (2696, 977, 49);
INSERT INTO `core_service_drivers` VALUES (2697, 977, 51);
INSERT INTO `core_service_drivers` VALUES (2698, 977, 54);
INSERT INTO `core_service_drivers` VALUES (2699, 978, 49);
INSERT INTO `core_service_drivers` VALUES (2700, 978, 51);
INSERT INTO `core_service_drivers` VALUES (2701, 978, 54);
INSERT INTO `core_service_drivers` VALUES (2702, 979, 49);
INSERT INTO `core_service_drivers` VALUES (2703, 979, 51);
INSERT INTO `core_service_drivers` VALUES (2704, 979, 54);
INSERT INTO `core_service_drivers` VALUES (2705, 980, 49);
INSERT INTO `core_service_drivers` VALUES (2706, 980, 51);
INSERT INTO `core_service_drivers` VALUES (2707, 980, 54);
INSERT INTO `core_service_drivers` VALUES (2708, 981, 49);
INSERT INTO `core_service_drivers` VALUES (2709, 981, 51);
INSERT INTO `core_service_drivers` VALUES (2710, 981, 54);
INSERT INTO `core_service_drivers` VALUES (2711, 982, 49);
INSERT INTO `core_service_drivers` VALUES (2712, 982, 51);
INSERT INTO `core_service_drivers` VALUES (2713, 982, 54);
INSERT INTO `core_service_drivers` VALUES (2714, 983, 49);
INSERT INTO `core_service_drivers` VALUES (2715, 983, 51);
INSERT INTO `core_service_drivers` VALUES (2716, 983, 54);
INSERT INTO `core_service_drivers` VALUES (2717, 984, 49);
INSERT INTO `core_service_drivers` VALUES (2718, 984, 51);
INSERT INTO `core_service_drivers` VALUES (2719, 984, 54);
INSERT INTO `core_service_drivers` VALUES (2720, 985, 49);
INSERT INTO `core_service_drivers` VALUES (2721, 985, 51);
INSERT INTO `core_service_drivers` VALUES (2722, 985, 54);
INSERT INTO `core_service_drivers` VALUES (2723, 986, 49);
INSERT INTO `core_service_drivers` VALUES (2724, 986, 51);
INSERT INTO `core_service_drivers` VALUES (2725, 986, 54);
INSERT INTO `core_service_drivers` VALUES (2726, 987, 49);
INSERT INTO `core_service_drivers` VALUES (2727, 987, 51);
INSERT INTO `core_service_drivers` VALUES (2728, 987, 54);
INSERT INTO `core_service_drivers` VALUES (2729, 988, 49);
INSERT INTO `core_service_drivers` VALUES (2730, 988, 51);
INSERT INTO `core_service_drivers` VALUES (2731, 988, 54);
INSERT INTO `core_service_drivers` VALUES (2732, 989, 49);
INSERT INTO `core_service_drivers` VALUES (2733, 989, 51);
INSERT INTO `core_service_drivers` VALUES (2734, 989, 54);
INSERT INTO `core_service_drivers` VALUES (2735, 990, 49);
INSERT INTO `core_service_drivers` VALUES (2736, 990, 51);
INSERT INTO `core_service_drivers` VALUES (2737, 990, 54);
INSERT INTO `core_service_drivers` VALUES (2738, 991, 49);
INSERT INTO `core_service_drivers` VALUES (2739, 991, 51);
INSERT INTO `core_service_drivers` VALUES (2740, 991, 54);
INSERT INTO `core_service_drivers` VALUES (2741, 992, 49);
INSERT INTO `core_service_drivers` VALUES (2742, 992, 51);
INSERT INTO `core_service_drivers` VALUES (2743, 992, 54);
INSERT INTO `core_service_drivers` VALUES (2744, 993, 49);
INSERT INTO `core_service_drivers` VALUES (2745, 993, 51);
INSERT INTO `core_service_drivers` VALUES (2746, 993, 54);
INSERT INTO `core_service_drivers` VALUES (2747, 994, 49);
INSERT INTO `core_service_drivers` VALUES (2748, 994, 51);
INSERT INTO `core_service_drivers` VALUES (2749, 994, 54);
INSERT INTO `core_service_drivers` VALUES (2750, 995, 49);
INSERT INTO `core_service_drivers` VALUES (2751, 995, 51);
INSERT INTO `core_service_drivers` VALUES (2752, 995, 54);
INSERT INTO `core_service_drivers` VALUES (2753, 996, 49);
INSERT INTO `core_service_drivers` VALUES (2754, 996, 51);
INSERT INTO `core_service_drivers` VALUES (2755, 996, 54);
INSERT INTO `core_service_drivers` VALUES (2756, 997, 49);
INSERT INTO `core_service_drivers` VALUES (2757, 997, 51);
INSERT INTO `core_service_drivers` VALUES (2758, 997, 54);
INSERT INTO `core_service_drivers` VALUES (2759, 998, 49);
INSERT INTO `core_service_drivers` VALUES (2760, 998, 51);
INSERT INTO `core_service_drivers` VALUES (2761, 998, 54);
INSERT INTO `core_service_drivers` VALUES (2762, 999, 49);
INSERT INTO `core_service_drivers` VALUES (2763, 999, 51);
INSERT INTO `core_service_drivers` VALUES (2764, 999, 54);
INSERT INTO `core_service_drivers` VALUES (2765, 1000, 49);
INSERT INTO `core_service_drivers` VALUES (2766, 1000, 51);
INSERT INTO `core_service_drivers` VALUES (2767, 1000, 54);
INSERT INTO `core_service_drivers` VALUES (2768, 1001, 49);
INSERT INTO `core_service_drivers` VALUES (2769, 1001, 51);
INSERT INTO `core_service_drivers` VALUES (2770, 1001, 54);
INSERT INTO `core_service_drivers` VALUES (2771, 1002, 49);
INSERT INTO `core_service_drivers` VALUES (2772, 1002, 51);
INSERT INTO `core_service_drivers` VALUES (2773, 1002, 54);
INSERT INTO `core_service_drivers` VALUES (2774, 1003, 49);
INSERT INTO `core_service_drivers` VALUES (2775, 1003, 51);
INSERT INTO `core_service_drivers` VALUES (2776, 1003, 54);
INSERT INTO `core_service_drivers` VALUES (2777, 1004, 49);
INSERT INTO `core_service_drivers` VALUES (2778, 1004, 51);
INSERT INTO `core_service_drivers` VALUES (2779, 1004, 54);
INSERT INTO `core_service_drivers` VALUES (2780, 1005, 49);
INSERT INTO `core_service_drivers` VALUES (2781, 1005, 51);
INSERT INTO `core_service_drivers` VALUES (2782, 1005, 54);
INSERT INTO `core_service_drivers` VALUES (2783, 1006, 49);
INSERT INTO `core_service_drivers` VALUES (2784, 1006, 51);
INSERT INTO `core_service_drivers` VALUES (2785, 1006, 54);
INSERT INTO `core_service_drivers` VALUES (2786, 1007, 49);
INSERT INTO `core_service_drivers` VALUES (2787, 1007, 51);
INSERT INTO `core_service_drivers` VALUES (2788, 1007, 54);
INSERT INTO `core_service_drivers` VALUES (2789, 1008, 49);
INSERT INTO `core_service_drivers` VALUES (2790, 1008, 51);
INSERT INTO `core_service_drivers` VALUES (2791, 1008, 54);
INSERT INTO `core_service_drivers` VALUES (2792, 1009, 49);
INSERT INTO `core_service_drivers` VALUES (2793, 1009, 51);
INSERT INTO `core_service_drivers` VALUES (2794, 1009, 54);
INSERT INTO `core_service_drivers` VALUES (2795, 1010, 49);
INSERT INTO `core_service_drivers` VALUES (2796, 1010, 51);
INSERT INTO `core_service_drivers` VALUES (2797, 1010, 54);
INSERT INTO `core_service_drivers` VALUES (2798, 1011, 49);
INSERT INTO `core_service_drivers` VALUES (2799, 1011, 51);
INSERT INTO `core_service_drivers` VALUES (2800, 1011, 54);
INSERT INTO `core_service_drivers` VALUES (2801, 1012, 49);
INSERT INTO `core_service_drivers` VALUES (2802, 1012, 51);
INSERT INTO `core_service_drivers` VALUES (2803, 1012, 54);
INSERT INTO `core_service_drivers` VALUES (2804, 1013, 49);
INSERT INTO `core_service_drivers` VALUES (2805, 1013, 51);
INSERT INTO `core_service_drivers` VALUES (2806, 1013, 54);
INSERT INTO `core_service_drivers` VALUES (2807, 1014, 49);
INSERT INTO `core_service_drivers` VALUES (2808, 1014, 51);
INSERT INTO `core_service_drivers` VALUES (2809, 1014, 54);
INSERT INTO `core_service_drivers` VALUES (2810, 1015, 49);
INSERT INTO `core_service_drivers` VALUES (2811, 1015, 51);
INSERT INTO `core_service_drivers` VALUES (2812, 1015, 54);
INSERT INTO `core_service_drivers` VALUES (2813, 1016, 49);
INSERT INTO `core_service_drivers` VALUES (2814, 1016, 51);
INSERT INTO `core_service_drivers` VALUES (2815, 1016, 54);
INSERT INTO `core_service_drivers` VALUES (2816, 1017, 49);
INSERT INTO `core_service_drivers` VALUES (2817, 1017, 51);
INSERT INTO `core_service_drivers` VALUES (2818, 1017, 54);
INSERT INTO `core_service_drivers` VALUES (2819, 1018, 49);
INSERT INTO `core_service_drivers` VALUES (2820, 1018, 51);
INSERT INTO `core_service_drivers` VALUES (2821, 1018, 54);
INSERT INTO `core_service_drivers` VALUES (2822, 1019, 49);
INSERT INTO `core_service_drivers` VALUES (2823, 1019, 51);
INSERT INTO `core_service_drivers` VALUES (2824, 1019, 54);
INSERT INTO `core_service_drivers` VALUES (2825, 1020, 49);
INSERT INTO `core_service_drivers` VALUES (2826, 1020, 51);
INSERT INTO `core_service_drivers` VALUES (2827, 1020, 54);
INSERT INTO `core_service_drivers` VALUES (2828, 1021, 49);
INSERT INTO `core_service_drivers` VALUES (2829, 1021, 51);
INSERT INTO `core_service_drivers` VALUES (2830, 1021, 54);
INSERT INTO `core_service_drivers` VALUES (2831, 1022, 49);
INSERT INTO `core_service_drivers` VALUES (2832, 1022, 51);
INSERT INTO `core_service_drivers` VALUES (2833, 1022, 54);
INSERT INTO `core_service_drivers` VALUES (2834, 1023, 49);
INSERT INTO `core_service_drivers` VALUES (2835, 1023, 51);
INSERT INTO `core_service_drivers` VALUES (2836, 1023, 54);
INSERT INTO `core_service_drivers` VALUES (2837, 1024, 49);
INSERT INTO `core_service_drivers` VALUES (2838, 1024, 51);
INSERT INTO `core_service_drivers` VALUES (2839, 1024, 54);
INSERT INTO `core_service_drivers` VALUES (2840, 1025, 49);
INSERT INTO `core_service_drivers` VALUES (2841, 1025, 51);
INSERT INTO `core_service_drivers` VALUES (2842, 1025, 54);
INSERT INTO `core_service_drivers` VALUES (2843, 1026, 49);
INSERT INTO `core_service_drivers` VALUES (2844, 1026, 51);
INSERT INTO `core_service_drivers` VALUES (2845, 1026, 54);
INSERT INTO `core_service_drivers` VALUES (2846, 1027, 49);
INSERT INTO `core_service_drivers` VALUES (2847, 1027, 51);
INSERT INTO `core_service_drivers` VALUES (2848, 1027, 54);
INSERT INTO `core_service_drivers` VALUES (2849, 1028, 49);
INSERT INTO `core_service_drivers` VALUES (2850, 1028, 51);
INSERT INTO `core_service_drivers` VALUES (2851, 1028, 54);
INSERT INTO `core_service_drivers` VALUES (2852, 1029, 49);
INSERT INTO `core_service_drivers` VALUES (2853, 1029, 51);
INSERT INTO `core_service_drivers` VALUES (2854, 1029, 54);
INSERT INTO `core_service_drivers` VALUES (2855, 1030, 49);
INSERT INTO `core_service_drivers` VALUES (2856, 1030, 51);
INSERT INTO `core_service_drivers` VALUES (2857, 1030, 54);
INSERT INTO `core_service_drivers` VALUES (2858, 1031, 49);
INSERT INTO `core_service_drivers` VALUES (2859, 1031, 51);
INSERT INTO `core_service_drivers` VALUES (2860, 1031, 54);
INSERT INTO `core_service_drivers` VALUES (2861, 1032, 49);
INSERT INTO `core_service_drivers` VALUES (2862, 1032, 51);
INSERT INTO `core_service_drivers` VALUES (2863, 1032, 54);
INSERT INTO `core_service_drivers` VALUES (2864, 1033, 49);
INSERT INTO `core_service_drivers` VALUES (2865, 1033, 51);
INSERT INTO `core_service_drivers` VALUES (2866, 1033, 54);
INSERT INTO `core_service_drivers` VALUES (2867, 1034, 49);
INSERT INTO `core_service_drivers` VALUES (2868, 1034, 51);
INSERT INTO `core_service_drivers` VALUES (2869, 1034, 54);
INSERT INTO `core_service_drivers` VALUES (2870, 1035, 49);
INSERT INTO `core_service_drivers` VALUES (2871, 1035, 51);
INSERT INTO `core_service_drivers` VALUES (2872, 1035, 54);
INSERT INTO `core_service_drivers` VALUES (2873, 1036, 49);
INSERT INTO `core_service_drivers` VALUES (2874, 1036, 51);
INSERT INTO `core_service_drivers` VALUES (2875, 1036, 54);
INSERT INTO `core_service_drivers` VALUES (2876, 1037, 49);
INSERT INTO `core_service_drivers` VALUES (2877, 1037, 51);
INSERT INTO `core_service_drivers` VALUES (2878, 1037, 54);
INSERT INTO `core_service_drivers` VALUES (2879, 1038, 49);
INSERT INTO `core_service_drivers` VALUES (2880, 1038, 51);
INSERT INTO `core_service_drivers` VALUES (2881, 1038, 54);
INSERT INTO `core_service_drivers` VALUES (2882, 1039, 49);
INSERT INTO `core_service_drivers` VALUES (2883, 1039, 51);
INSERT INTO `core_service_drivers` VALUES (2884, 1039, 54);
INSERT INTO `core_service_drivers` VALUES (2885, 1040, 49);
INSERT INTO `core_service_drivers` VALUES (2886, 1040, 51);
INSERT INTO `core_service_drivers` VALUES (2887, 1040, 54);
INSERT INTO `core_service_drivers` VALUES (2888, 1041, 49);
INSERT INTO `core_service_drivers` VALUES (2889, 1041, 51);
INSERT INTO `core_service_drivers` VALUES (2890, 1041, 54);
INSERT INTO `core_service_drivers` VALUES (2891, 1042, 49);
INSERT INTO `core_service_drivers` VALUES (2892, 1042, 51);
INSERT INTO `core_service_drivers` VALUES (2893, 1042, 54);
INSERT INTO `core_service_drivers` VALUES (2894, 1043, 49);
INSERT INTO `core_service_drivers` VALUES (2895, 1043, 51);
INSERT INTO `core_service_drivers` VALUES (2896, 1043, 54);
INSERT INTO `core_service_drivers` VALUES (2897, 1044, 49);
INSERT INTO `core_service_drivers` VALUES (2898, 1044, 51);
INSERT INTO `core_service_drivers` VALUES (2899, 1044, 54);
INSERT INTO `core_service_drivers` VALUES (2900, 1045, 49);
INSERT INTO `core_service_drivers` VALUES (2901, 1045, 51);
INSERT INTO `core_service_drivers` VALUES (2902, 1045, 54);
INSERT INTO `core_service_drivers` VALUES (2903, 1046, 49);
INSERT INTO `core_service_drivers` VALUES (2904, 1046, 51);
INSERT INTO `core_service_drivers` VALUES (2905, 1046, 54);
INSERT INTO `core_service_drivers` VALUES (2906, 1047, 49);
INSERT INTO `core_service_drivers` VALUES (2907, 1047, 51);
INSERT INTO `core_service_drivers` VALUES (2908, 1047, 54);
INSERT INTO `core_service_drivers` VALUES (2909, 1048, 49);
INSERT INTO `core_service_drivers` VALUES (2910, 1048, 51);
INSERT INTO `core_service_drivers` VALUES (2911, 1048, 54);
INSERT INTO `core_service_drivers` VALUES (2912, 1049, 49);
INSERT INTO `core_service_drivers` VALUES (2913, 1049, 51);
INSERT INTO `core_service_drivers` VALUES (2914, 1049, 54);
INSERT INTO `core_service_drivers` VALUES (2915, 1050, 49);
INSERT INTO `core_service_drivers` VALUES (2916, 1050, 51);
INSERT INTO `core_service_drivers` VALUES (2917, 1050, 54);
INSERT INTO `core_service_drivers` VALUES (2918, 1051, 49);
INSERT INTO `core_service_drivers` VALUES (2919, 1051, 51);
INSERT INTO `core_service_drivers` VALUES (2920, 1051, 54);
INSERT INTO `core_service_drivers` VALUES (2921, 1052, 49);
INSERT INTO `core_service_drivers` VALUES (2922, 1052, 51);
INSERT INTO `core_service_drivers` VALUES (2923, 1052, 54);
INSERT INTO `core_service_drivers` VALUES (2924, 1053, 49);
INSERT INTO `core_service_drivers` VALUES (2925, 1053, 51);
INSERT INTO `core_service_drivers` VALUES (2926, 1053, 54);
INSERT INTO `core_service_drivers` VALUES (2927, 1054, 49);
INSERT INTO `core_service_drivers` VALUES (2928, 1054, 51);
INSERT INTO `core_service_drivers` VALUES (2929, 1054, 54);
INSERT INTO `core_service_drivers` VALUES (2930, 1055, 49);
INSERT INTO `core_service_drivers` VALUES (2931, 1055, 51);
INSERT INTO `core_service_drivers` VALUES (2932, 1055, 54);
INSERT INTO `core_service_drivers` VALUES (2933, 1056, 49);
INSERT INTO `core_service_drivers` VALUES (2934, 1056, 51);
INSERT INTO `core_service_drivers` VALUES (2935, 1056, 54);
INSERT INTO `core_service_drivers` VALUES (2936, 1057, 49);
INSERT INTO `core_service_drivers` VALUES (2937, 1057, 51);
INSERT INTO `core_service_drivers` VALUES (2938, 1057, 54);
INSERT INTO `core_service_drivers` VALUES (2939, 1058, 49);
INSERT INTO `core_service_drivers` VALUES (2940, 1058, 51);
INSERT INTO `core_service_drivers` VALUES (2941, 1058, 54);
INSERT INTO `core_service_drivers` VALUES (2942, 1059, 49);
INSERT INTO `core_service_drivers` VALUES (2943, 1059, 51);
INSERT INTO `core_service_drivers` VALUES (2944, 1059, 54);
INSERT INTO `core_service_drivers` VALUES (2945, 1060, 49);
INSERT INTO `core_service_drivers` VALUES (2946, 1060, 51);
INSERT INTO `core_service_drivers` VALUES (2947, 1060, 54);
INSERT INTO `core_service_drivers` VALUES (2948, 1061, 49);
INSERT INTO `core_service_drivers` VALUES (2949, 1061, 51);
INSERT INTO `core_service_drivers` VALUES (2950, 1061, 54);
INSERT INTO `core_service_drivers` VALUES (2951, 1062, 49);
INSERT INTO `core_service_drivers` VALUES (2952, 1062, 51);
INSERT INTO `core_service_drivers` VALUES (2953, 1062, 54);
INSERT INTO `core_service_drivers` VALUES (2954, 1063, 49);
INSERT INTO `core_service_drivers` VALUES (2955, 1063, 51);
INSERT INTO `core_service_drivers` VALUES (2956, 1063, 54);
INSERT INTO `core_service_drivers` VALUES (2957, 1064, 49);
INSERT INTO `core_service_drivers` VALUES (2958, 1064, 51);
INSERT INTO `core_service_drivers` VALUES (2959, 1064, 54);
INSERT INTO `core_service_drivers` VALUES (2960, 1065, 49);
INSERT INTO `core_service_drivers` VALUES (2961, 1065, 51);
INSERT INTO `core_service_drivers` VALUES (2962, 1065, 54);
INSERT INTO `core_service_drivers` VALUES (2963, 1066, 49);
INSERT INTO `core_service_drivers` VALUES (2964, 1066, 51);
INSERT INTO `core_service_drivers` VALUES (2965, 1066, 54);
INSERT INTO `core_service_drivers` VALUES (2966, 1067, 49);
INSERT INTO `core_service_drivers` VALUES (2967, 1067, 51);
INSERT INTO `core_service_drivers` VALUES (2968, 1067, 54);
INSERT INTO `core_service_drivers` VALUES (2969, 1068, 49);
INSERT INTO `core_service_drivers` VALUES (2970, 1068, 51);
INSERT INTO `core_service_drivers` VALUES (2971, 1068, 54);
INSERT INTO `core_service_drivers` VALUES (2972, 1069, 49);
INSERT INTO `core_service_drivers` VALUES (2973, 1069, 51);
INSERT INTO `core_service_drivers` VALUES (2974, 1069, 54);
INSERT INTO `core_service_drivers` VALUES (2975, 1070, 49);
INSERT INTO `core_service_drivers` VALUES (2976, 1070, 51);
INSERT INTO `core_service_drivers` VALUES (2977, 1070, 54);
INSERT INTO `core_service_drivers` VALUES (2978, 1071, 49);
INSERT INTO `core_service_drivers` VALUES (2979, 1071, 51);
INSERT INTO `core_service_drivers` VALUES (2980, 1071, 54);
INSERT INTO `core_service_drivers` VALUES (2981, 1072, 49);
INSERT INTO `core_service_drivers` VALUES (2982, 1072, 51);
INSERT INTO `core_service_drivers` VALUES (2983, 1072, 54);
INSERT INTO `core_service_drivers` VALUES (2984, 1073, 49);
INSERT INTO `core_service_drivers` VALUES (2985, 1073, 51);
INSERT INTO `core_service_drivers` VALUES (2986, 1073, 54);
INSERT INTO `core_service_drivers` VALUES (2987, 1074, 49);
INSERT INTO `core_service_drivers` VALUES (2988, 1074, 51);
INSERT INTO `core_service_drivers` VALUES (2989, 1074, 54);
COMMIT;

-- ----------------------------
-- Table structure for core_ticket
-- ----------------------------
DROP TABLE IF EXISTS `core_ticket`;
CREATE TABLE `core_ticket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_type` varchar(9) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `passenger_id` bigint(20) NOT NULL,
  `service_id` bigint(20) NOT NULL,
  `seat_id` bigint(20) NOT NULL,
  `reserved_time` datetime(6) NOT NULL,
  `one_way_parent_id` bigint(20) DEFAULT NULL,
  `ticket_source` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `one_way_parent_id` (`one_way_parent_id`),
  KEY `core_ticket_passenger_id_2986ab84_fk_core_passenger_id` (`passenger_id`),
  KEY `core_ticket_service_id_6f014ed0_fk_core_service_id` (`service_id`),
  KEY `core_ticket_seat_id_95556df0_fk_transport` (`seat_id`),
  CONSTRAINT `core_ticket_one_way_parent_id_410e3edd_fk_core_ticket_id` FOREIGN KEY (`one_way_parent_id`) REFERENCES `core_ticket` (`id`),
  CONSTRAINT `core_ticket_passenger_id_2986ab84_fk_core_passenger_id` FOREIGN KEY (`passenger_id`) REFERENCES `core_passenger` (`id`),
  CONSTRAINT `core_ticket_seat_id_95556df0_fk_transport` FOREIGN KEY (`seat_id`) REFERENCES `transportation_seat` (`component_ptr_id`),
  CONSTRAINT `core_ticket_service_id_6f014ed0_fk_core_service_id` FOREIGN KEY (`service_id`) REFERENCES `core_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of core_ticket
-- ----------------------------
BEGIN;
INSERT INTO `core_ticket` VALUES (1, 'one_way', 15990.00, 1, 1, 63, 1, '2022-02-07 12:36:17.396000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (2, 'one_way', 15990.00, 1, 1, 63, 1, '2022-02-07 12:36:17.396000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (3, 'one_way', 15990.00, 1, 1, 63, 1, '2022-02-07 12:36:17.396000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (4, 'one_way', 15990.00, 1, 2, 279, 56, '2022-02-14 19:13:55.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (5, 'one_way', 15990.00, 1, 2, 279, 53, '2022-02-14 19:15:05.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (6, 'one_way', 15990.00, 1, 2, 279, 53, '2022-02-17 17:13:55.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (7, 'one_way', 15990.00, 1, 2, 279, 56, '2022-02-18 14:40:42.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (8, 'one_way', 15990.00, 1, 3, 279, 5, '2022-02-18 14:40:42.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (9, 'one_way', 15990.00, 1, 2, 279, 56, '2022-02-21 14:14:18.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (10, 'one_way', 15990.00, 1, 3, 279, 55, '2022-02-21 14:14:18.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (11, 'one_way', 15990.00, 1, 2, 279, 53, '2022-02-21 14:16:24.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (12, 'one_way', 15990.00, 1, 3, 279, 58, '2022-02-21 14:16:24.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (13, 'one_way', 15990.00, 1, 2, 279, 54, '2022-02-21 14:19:01.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (14, 'one_way', 15990.00, 1, 3, 279, 57, '2022-02-21 14:19:01.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (15, 'one_way', 15990.00, 1, 2, 279, 56, '2022-02-21 14:24:57.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (16, 'one_way', 15990.00, 1, 2, 35, 53, '2022-02-22 15:11:46.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (17, 'one_way', 15990.00, 1, 2, 218, 1, '2022-03-01 16:28:05.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (18, 'one_way', 15990.00, 1, 2, 401, 5, '2022-03-01 17:13:44.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (19, 'one_way', 15990.00, 1, 2, 923, 56, '2022-03-01 19:49:30.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (20, 'one_way', 15990.00, 1, 2, 493, 56, '2022-03-01 20:08:52.000000', NULL, 'web');
INSERT INTO `core_ticket` VALUES (21, 'one_way', 15990.00, 1, 2, 923, 56, '2022-03-02 14:18:05.000000', NULL, 'web');
COMMIT;

-- ----------------------------
-- Table structure for crew_commission
-- ----------------------------
DROP TABLE IF EXISTS `crew_commission`;
CREATE TABLE `crew_commission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `status` int(11) NOT NULL,
  `personal_id` bigint(20) NOT NULL,
  `route_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `crew_commission_route_id_07490770_fk_core_route_id` (`route_id`),
  KEY `crew_commission_personal_id_1b5adc65` (`personal_id`),
  CONSTRAINT `crew_commission_route_id_07490770_fk_core_route_id` FOREIGN KEY (`route_id`) REFERENCES `core_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of crew_commission
-- ----------------------------
BEGIN;
INSERT INTO `crew_commission` VALUES (55, '2021-12-28 01:31:14.273486', '2021-12-28 01:31:14.273510', 5.00, '2021-12-01', '2021-12-31', 2, 56, 1);
INSERT INTO `crew_commission` VALUES (57, '2021-12-28 01:46:09.176969', '2021-12-28 01:46:09.176993', 4.00, '2021-12-01', '2021-12-31', 2, 51, 3);
INSERT INTO `crew_commission` VALUES (58, '2022-01-04 18:02:08.727368', '2022-01-04 18:02:08.727394', 7.00, '2022-01-04', '2022-01-31', 2, 52, 1);
INSERT INTO `crew_commission` VALUES (59, '2022-01-05 10:08:32.538845', '2022-01-05 10:08:32.538869', 5.00, '2022-01-05', '2022-01-31', 2, 51, 3);
INSERT INTO `crew_commission` VALUES (60, '2022-01-12 10:38:12.430365', '2022-01-12 10:38:12.430391', 4.00, '2022-01-12', '2022-01-31', 2, 50, 1);
INSERT INTO `crew_commission` VALUES (61, '2022-01-13 13:45:27.188200', '2022-01-13 13:45:27.188233', 10.00, '2022-01-13', '2022-03-31', 2, 58, 1);
INSERT INTO `crew_commission` VALUES (62, '2022-01-14 11:17:43.732480', '2022-01-14 11:17:43.732511', 4.00, '2022-01-14', '2022-01-31', 1, 60, 1);
INSERT INTO `crew_commission` VALUES (63, '2022-02-16 18:34:27.476205', '2022-02-16 18:34:27.476229', 4.00, '2022-02-01', '2022-02-28', 2, 56, 3);
COMMIT;

-- ----------------------------
-- Table structure for crew_commissionlog
-- ----------------------------
DROP TABLE IF EXISTS `crew_commissionlog`;
CREATE TABLE `crew_commissionlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `date` date NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `commission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `crew_commissionlog_commission_id_816d4ea3_fk_crew_commission_id` (`commission_id`),
  CONSTRAINT `crew_commissionlog_commission_id_816d4ea3_fk_crew_commission_id` FOREIGN KEY (`commission_id`) REFERENCES `crew_commission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of crew_commissionlog
-- ----------------------------
BEGIN;
INSERT INTO `crew_commissionlog` VALUES (1, '2021-12-28 01:42:29.075703', '2021-12-28 01:42:29.075728', '2021-12-28', 5.00, '2021-12-01', '2021-12-31', 55);
INSERT INTO `crew_commissionlog` VALUES (3, '2021-12-28 01:47:02.194505', '2021-12-28 01:47:02.194530', '2021-12-28', 5.00, '2021-12-01', '2021-12-31', 57);
INSERT INTO `crew_commissionlog` VALUES (4, '2021-12-28 01:47:43.556589', '2021-12-28 01:47:43.556613', '2021-12-28', 5.00, '2021-12-01', '2021-12-31', 57);
INSERT INTO `crew_commissionlog` VALUES (5, '2021-12-28 01:49:33.915960', '2021-12-28 01:49:33.915983', '2021-12-28', 4.00, '2022-01-01', '2022-01-31', 57);
COMMIT;

-- ----------------------------
-- Table structure for crew_motive
-- ----------------------------
DROP TABLE IF EXISTS `crew_motive`;
CREATE TABLE `crew_motive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of crew_motive
-- ----------------------------
BEGIN;
INSERT INTO `crew_motive` VALUES (1, 'Vacaciones');
INSERT INTO `crew_motive` VALUES (2, 'Permiso Administrativo');
INSERT INTO `crew_motive` VALUES (3, 'Desvinculación');
INSERT INTO `crew_motive` VALUES (4, 'Licencia Médica');
INSERT INTO `crew_motive` VALUES (5, 'Descanso');
INSERT INTO `crew_motive` VALUES (6, 'permiso');
INSERT INTO `crew_motive` VALUES (7, 'vacaciones');
COMMIT;

-- ----------------------------
-- Table structure for crew_personal
-- ----------------------------
DROP TABLE IF EXISTS `crew_personal`;
CREATE TABLE `crew_personal` (
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `contract_type` varchar(10) NOT NULL,
  `contract_date` date DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `crew_personal_branch_id_e936ca16_fk_locations_branch_id` (`branch_id`),
  CONSTRAINT `crew_personal_branch_id_e936ca16_fk_locations_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `locations_branch` (`id`),
  CONSTRAINT `crew_personal_user_id_5495d07a_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of crew_personal
-- ----------------------------
BEGIN;
INSERT INTO `crew_personal` VALUES ('2021-11-22 17:31:01.680997', '2022-01-13 13:43:50.964083', 40, 2, '5x2', '2021-11-22', NULL);
INSERT INTO `crew_personal` VALUES ('2021-12-01 14:13:13.916802', '2021-12-02 11:30:12.004878', 49, 1, '5x2', '2021-12-01', NULL);
INSERT INTO `crew_personal` VALUES ('2021-12-01 19:12:16.135711', '2021-12-01 19:12:16.135736', 50, 2, '5x2', '2010-02-01', NULL);
INSERT INTO `crew_personal` VALUES ('2021-12-02 10:14:35.992166', '2021-12-02 10:14:35.992187', 51, 2, '10x4', '2021-12-02', NULL);
INSERT INTO `crew_personal` VALUES ('2021-12-02 11:33:11.752671', '2022-02-24 16:24:08.835436', 52, 2, '10x4', '2021-12-02', 8);
INSERT INTO `crew_personal` VALUES ('2021-12-15 11:22:18.299079', '2021-12-15 11:22:18.302787', 54, 1, '5x2', '2018-04-09', NULL);
INSERT INTO `crew_personal` VALUES ('2021-12-15 11:23:35.193472', '2021-12-15 11:23:35.193507', 55, 1, '5x2', '2018-04-09', NULL);
INSERT INTO `crew_personal` VALUES ('2021-12-23 09:20:55.285622', '2022-01-18 15:25:35.763841', 56, 1, '9x3', '2022-01-18', NULL);
INSERT INTO `crew_personal` VALUES ('2022-01-13 13:43:26.883040', '2022-01-13 13:43:26.883137', 58, 2, '5x2', '2022-01-13', NULL);
INSERT INTO `crew_personal` VALUES ('2022-01-14 11:16:56.021969', '2022-01-14 11:16:56.021994', 60, 2, '5x2', '2022-01-14', NULL);
INSERT INTO `crew_personal` VALUES ('2022-02-23 10:15:30.799037', '2022-02-23 10:15:30.799059', 61, 2, '5x2', '2022-02-23', 1);
COMMIT;

-- ----------------------------
-- Table structure for crew_personalmotive
-- ----------------------------
DROP TABLE IF EXISTS `crew_personalmotive`;
CREATE TABLE `crew_personalmotive` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `motive_id` bigint(20) NOT NULL,
  `personal_id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `manage_personal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crew_personalmotive_motive_id_ba415e2c_fk_crew_motive_id` (`motive_id`),
  KEY `crew_personalmotive_personal_id_42ec419c_fk_crew_pers` (`personal_id`),
  CONSTRAINT `crew_personalmotive_motive_id_ba415e2c_fk_crew_motive_id` FOREIGN KEY (`motive_id`) REFERENCES `crew_motive` (`id`),
  CONSTRAINT `crew_personalmotive_personal_id_42ec419c_fk_crew_pers` FOREIGN KEY (`personal_id`) REFERENCES `crew_personal` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of crew_personalmotive
-- ----------------------------
BEGIN;
INSERT INTO `crew_personalmotive` VALUES (1, '2018-09-13', '2019-06-06', 1, 54, '2021-12-15 11:22:18.307250', 'Lorem irure labore');
INSERT INTO `crew_personalmotive` VALUES (2, '2018-09-13', '2019-06-06', 1, 55, '2021-12-15 11:23:35.197029', 'Lorem irure labore');
COMMIT;

-- ----------------------------
-- Table structure for crew_personalposition
-- ----------------------------
DROP TABLE IF EXISTS `crew_personalposition`;
CREATE TABLE `crew_personalposition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `personal_id` bigint(20) NOT NULL,
  `position_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `crew_personalpositio_personal_id_f4a2f7d9_fk_crew_pers` (`personal_id`),
  KEY `crew_personalposition_position_id_c1c794ff_fk_crew_position_id` (`position_id`),
  CONSTRAINT `crew_personalpositio_personal_id_f4a2f7d9_fk_crew_pers` FOREIGN KEY (`personal_id`) REFERENCES `crew_personal` (`user_id`),
  CONSTRAINT `crew_personalposition_position_id_c1c794ff_fk_crew_position_id` FOREIGN KEY (`position_id`) REFERENCES `crew_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of crew_personalposition
-- ----------------------------
BEGIN;
INSERT INTO `crew_personalposition` VALUES (76, 2, 50, 1);
INSERT INTO `crew_personalposition` VALUES (77, 2, 50, 2);
INSERT INTO `crew_personalposition` VALUES (78, 2, 51, 2);
INSERT INTO `crew_personalposition` VALUES (79, 2, 49, 2);
INSERT INTO `crew_personalposition` VALUES (81, 2, 54, 1);
INSERT INTO `crew_personalposition` VALUES (82, 2, 55, 1);
INSERT INTO `crew_personalposition` VALUES (86, 2, 58, 2);
INSERT INTO `crew_personalposition` VALUES (87, 2, 58, 3);
INSERT INTO `crew_personalposition` VALUES (88, 2, 40, 1);
INSERT INTO `crew_personalposition` VALUES (90, 2, 60, 3);
INSERT INTO `crew_personalposition` VALUES (93, 2, 56, 2);
INSERT INTO `crew_personalposition` VALUES (94, 2, 52, 1);
INSERT INTO `crew_personalposition` VALUES (95, 2, 52, 2);
COMMIT;

-- ----------------------------
-- Table structure for crew_position
-- ----------------------------
DROP TABLE IF EXISTS `crew_position`;
CREATE TABLE `crew_position` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `description` varchar(70) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crew_position_description_c0393ffa_uniq` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of crew_position
-- ----------------------------
BEGIN;
INSERT INTO `crew_position` VALUES (1, '2021-11-12 10:38:24.830000', '2021-11-12 10:38:24.830000', 'Auxiliar');
INSERT INTO `crew_position` VALUES (2, '2021-11-12 10:38:38.313000', '2021-11-12 10:38:38.313000', 'Chofer de Ruta');
INSERT INTO `crew_position` VALUES (3, '2021-12-28 01:21:45.866226', '2021-12-28 01:21:45.866251', 'Contador');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2021-11-12 12:49:33.922314', '2', 'Israel Castro', 1, '[{\"added\": {}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (2, '2021-11-12 12:54:47.502132', '1', 'Ignacio Figueroa', 1, '[{\"added\": {}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (3, '2021-11-12 15:42:39.579872', '1', 'a', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (4, '2021-11-12 17:26:10.865649', '2', 'b', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (5, '2021-11-12 17:27:43.348530', '3', 'dgfg', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (6, '2021-11-16 12:47:51.151943', '1', 'Ignacio Figueroa', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (7, '2021-11-16 12:50:05.606527', '1', 'Ignacio Figueroa', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (8, '2021-11-18 17:35:23.726650', '26', '123123', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (9, '2021-11-18 17:35:23.731003', '8', 'andre4', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (10, '2021-11-18 17:35:23.731880', '11', 'andre5', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (11, '2021-11-18 17:35:23.732422', '34', 'Icastro5', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (12, '2021-11-18 17:35:23.732914', '14', 'icastroLinets1', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (13, '2021-11-18 17:35:23.733395', '28', 'ifigueroa', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (14, '2021-11-18 17:35:23.733856', '32', 'israel3', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (15, '2021-11-18 17:35:23.734312', '19', 'sdfsdfsdf', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (16, '2021-11-18 17:35:54.483804', '22', 'aaaa', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (17, '2021-11-19 15:13:55.772110', '35', 'Rosemary Montevilla', 2, '[{\"changed\": {\"fields\": [\"Estado\", \"Tipo de contrato\", \"Fecha de contrataci\\u00f3n\"]}}]', 16, 4);
INSERT INTO `django_admin_log` VALUES (18, '2021-11-19 15:48:27.808380', '5', 'Descanso', 1, '[{\"added\": {}}]', 15, 4);
INSERT INTO `django_admin_log` VALUES (19, '2021-11-19 17:39:27.291583', '33', 'Maria Helena Gomez2', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 16, 4);
INSERT INTO `django_admin_log` VALUES (20, '2021-11-19 17:42:03.488410', '1', 'uno', 1, '[{\"added\": {}}]', 10, 4);
INSERT INTO `django_admin_log` VALUES (21, '2021-11-19 17:42:09.604930', '2', '2', 1, '[{\"added\": {}}]', 10, 4);
INSERT INTO `django_admin_log` VALUES (22, '2021-11-22 13:58:16.546587', '33', 'Maria Helena Gomez2', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (23, '2021-11-23 12:20:37.769039', '39', 'asdsad asdsad', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (24, '2021-11-23 12:20:37.769889', '37', 'xcxc sdsd', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (25, '2021-11-23 12:20:37.770386', '36', 'Carlos1 El', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (26, '2021-11-23 12:20:37.770862', '33', 'Maria Helena Gomez2', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (27, '2021-11-24 11:37:37.509097', '1', 'Commission object (1)', 1, '[{\"added\": {}}]', 20, 2);
INSERT INTO `django_admin_log` VALUES (28, '2021-11-24 11:47:42.664489', '2', 'Commission object (2)', 1, '[{\"added\": {}}]', 20, 2);
INSERT INTO `django_admin_log` VALUES (29, '2021-11-26 12:16:06.172881', '14', 'Commission object (14)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (30, '2021-11-26 12:16:06.177106', '13', 'Commission object (13)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (31, '2021-11-26 12:16:06.177687', '12', 'Commission object (12)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (32, '2021-11-26 12:16:06.178333', '11', 'Commission object (11)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (33, '2021-11-26 12:16:06.181632', '10', 'Commission object (10)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (34, '2021-11-26 12:16:06.182093', '9', 'Commission object (9)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (35, '2021-11-26 12:16:06.182534', '8', 'Commission object (8)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (36, '2021-11-26 12:16:06.182993', '7', 'Commission object (7)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (37, '2021-11-26 12:16:06.183443', '6', 'Commission object (6)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (38, '2021-11-26 12:16:06.183907', '5', 'Commission object (5)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (39, '2021-11-26 12:16:06.184331', '2', 'Commission object (2)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (40, '2021-11-26 12:16:06.184746', '1', 'Commission object (1)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (41, '2021-11-26 14:16:45.237090', '19', 'Commission object (19)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (42, '2021-11-26 14:16:45.237735', '18', 'Commission object (18)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (43, '2021-11-26 14:16:45.238242', '17', 'Commission object (17)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (44, '2021-11-26 14:16:45.238762', '16', 'Commission object (16)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (45, '2021-11-26 14:16:45.239235', '15', 'Commission object (15)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (46, '2021-11-26 14:34:19.521363', '23', 'Commission object (23)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (47, '2021-11-26 14:34:19.522050', '22', 'Commission object (22)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (48, '2021-11-26 14:34:19.527471', '21', 'Commission object (21)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (49, '2021-11-26 14:34:19.528057', '20', 'Commission object (20)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (50, '2021-11-26 14:38:48.983830', '31', 'Commission object (31)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (51, '2021-11-26 14:38:48.984474', '30', 'Commission object (30)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (52, '2021-11-26 14:38:48.985022', '29', 'Commission object (29)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (53, '2021-11-26 14:38:48.985496', '28', 'Commission object (28)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (54, '2021-11-26 14:38:48.986173', '27', 'Commission object (27)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (55, '2021-11-26 14:38:48.991148', '26', 'Commission object (26)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (56, '2021-11-26 14:38:48.991646', '25', 'Commission object (25)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (57, '2021-11-26 14:38:48.992117', '24', 'Commission object (24)', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (58, '2021-11-29 12:44:51.340889', '1', 'Metropolitana', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (59, '2021-11-29 12:44:54.178298', '1', 'Santiago', 1, '[{\"added\": {}}]', 33, 1);
INSERT INTO `django_admin_log` VALUES (60, '2021-11-30 12:06:42.570712', '1', 'Vendedor', 1, '[{\"added\": {}}]', 6, 2);
INSERT INTO `django_admin_log` VALUES (61, '2021-11-30 13:02:42.410307', '45', 'gemerias', 1, '[{\"added\": {}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (62, '2021-11-30 13:02:54.750306', '45', ' ', 1, '[{\"added\": {}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (63, '2021-11-30 13:03:42.035404', '45', ' ', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (64, '2021-11-30 13:03:58.746197', '45', ' ', 1, '[{\"added\": {}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (65, '2021-11-30 13:08:50.723367', '45', ' ', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (66, '2021-11-30 13:10:51.214196', '45', 'gemerias', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Apellido Materno\", \"Sexo\", \"Email address\", \"RUT\", \"N\\u00famero de celular\", \"N\\u00famero de casa\", \"Direcci\\u00f3n\", \"N\\u00famero de trabajo\", \"Direcci\\u00f3n de trabajo\", \"Roles\", \"Last login\", \"Date joined\"]}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (67, '2021-11-30 13:10:54.572535', '45', 'elchavo del8', 1, '[{\"added\": {}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (68, '2021-11-30 17:24:02.248448', '47', 'cristian sepúlveda', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (69, '2021-11-30 17:24:02.249427', '46', 'jorge Gomez', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (70, '2021-11-30 17:24:02.250430', '45', 'elchavo del8', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (71, '2021-11-30 17:24:02.259305', '44', 'israel33 castro33', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (72, '2021-11-30 17:24:02.262613', '42', 'israel castro ortega', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (73, '2021-11-30 17:24:02.264129', '41', 'israel castro ortega', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (74, '2021-11-30 17:24:02.266367', '38', 'israel1 castro1', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (75, '2021-11-30 17:24:02.267268', '35', 'Rosemary Montevilla', 3, '', 16, 2);
INSERT INTO `django_admin_log` VALUES (76, '2021-12-01 14:11:58.159761', '41', 'israel11', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (77, '2021-12-01 14:11:58.160479', '42', 'israel111', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (78, '2021-12-01 14:11:58.161033', '38', 'israel2', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (79, '2021-12-01 14:11:58.161577', '44', 'israel333', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (80, '2021-12-01 14:11:58.181195', '48', 'israelitodel8', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (81, '2021-12-01 14:12:36.999371', '5', 'andre3', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (82, '2021-12-01 14:12:37.000534', '39', 'asdasd', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (83, '2021-12-01 14:12:37.001115', '36', 'ElAmigo', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (84, '2021-12-01 14:12:37.001912', '45', 'gemerias', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (85, '2021-12-01 14:12:37.002903', '30', 'Icastro1', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (86, '2021-12-01 14:12:37.003958', '12', 'icastroLinets', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (87, '2021-12-01 14:12:37.004680', '31', 'ifigueroa1', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (88, '2021-12-01 14:12:37.005155', '46', 'Jorgito', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (89, '2021-12-01 14:12:37.005855', '43', 'Lcastro', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (90, '2021-12-01 14:12:37.024424', '37', 'zxczxc', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (91, '2021-12-01 14:12:52.436254', '33', 'Mgomez', 3, '', 7, 1);
INSERT INTO `django_admin_log` VALUES (92, '2021-12-02 11:15:38.050618', '42', 'Comisión de Alfredo Cancino', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (93, '2021-12-02 11:15:38.051744', '41', 'Comisión de Ignacio Figueroa', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (94, '2021-12-02 11:15:48.016830', '40', 'Comisión de Cristian Sepulveda', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (95, '2021-12-02 11:16:03.174670', '44', 'Comisión de Ignacio Figueroa', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (96, '2021-12-02 11:16:03.175317', '43', 'Comisión de Alfredo Cancino', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (97, '2021-12-02 11:17:14.715602', '46', 'Comisión de Ignacio Figueroa', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (98, '2021-12-02 11:17:14.716373', '45', 'Comisión de Alfredo Cancino', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (99, '2021-12-02 11:17:31.608073', '48', 'Comisión de Ignacio Figueroa', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (100, '2021-12-02 11:17:31.613049', '47', 'Comisión de Alfredo Cancino', 3, '', 20, 1);
INSERT INTO `django_admin_log` VALUES (101, '2021-12-02 14:11:47.360883', '1', 'ignacio', 2, '[{\"changed\": {\"fields\": [\"Sexo\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (102, '2021-12-02 17:11:28.659425', '1', 'ignacio', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (103, '2021-12-02 17:19:06.751382', '1', 'ignacio', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (104, '2021-12-02 17:20:14.443354', '1', 'ignacio', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (105, '2021-12-02 17:40:39.409530', '1', 'ignacio', 2, '[{\"changed\": {\"fields\": [\"Sexo\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (106, '2021-12-02 17:41:11.057606', '1', 'ignacio', 2, '[{\"changed\": {\"fields\": [\"Sexo\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (107, '2021-12-03 12:16:04.797123', '2', 'israel', 2, '[{\"changed\": {\"fields\": [\"Sexo\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (108, '2021-12-03 12:16:54.328417', '2', 'israel', 2, '[{\"changed\": {\"fields\": [\"Sexo\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (109, '2021-12-03 12:17:30.975307', '2', 'israel', 2, '[{\"changed\": {\"fields\": [\"Sexo\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (110, '2021-12-03 17:27:25.204780', '52', 'Comisión de Sara Sarabia', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (111, '2021-12-03 17:27:25.205374', '51', 'Comisión de Ignacio Figueroa', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (112, '2021-12-03 17:27:25.205859', '50', 'Comisión de Alfredo Cancino', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (113, '2021-12-03 17:27:25.206294', '49', 'Comisión de israel castro', 3, '', 20, 2);
INSERT INTO `django_admin_log` VALUES (114, '2021-12-10 10:46:43.749338', '152', 'Normal None', 1, '[{\"added\": {}}]', 14, 53);
INSERT INTO `django_admin_log` VALUES (115, '2021-12-10 10:59:48.850889', '152', 'Normal None', 3, '', 14, 53);
INSERT INTO `django_admin_log` VALUES (116, '2021-12-10 12:14:16.769827', '153', 'Normal None', 1, '[{\"added\": {}}]', 14, 53);
INSERT INTO `django_admin_log` VALUES (117, '2021-12-10 12:27:13.253717', '154', 'Escalera', 1, '[{\"added\": {}}]', 13, 53);
INSERT INTO `django_admin_log` VALUES (118, '2021-12-13 13:57:47.408355', '1', 'rutaTest', 1, '[{\"added\": {}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (119, '2021-12-13 13:58:55.880317', '1', 'Service object (1)', 1, '[{\"added\": {}}]', 24, 2);
INSERT INTO `django_admin_log` VALUES (120, '2021-12-13 14:00:23.598135', '2', 'Service object (2)', 1, '[{\"added\": {}}]', 24, 2);
INSERT INTO `django_admin_log` VALUES (121, '2021-12-14 22:55:03.725606', '3', 'Service object (3)', 1, '[{\"added\": {}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (122, '2021-12-14 23:18:27.740437', '4', 'Service object (4)', 1, '[{\"added\": {}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (123, '2021-12-15 15:21:52.724836', '1', 'rutaTest', 2, '[{\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (1)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (2)\"}}]', 32, 1);
INSERT INTO `django_admin_log` VALUES (124, '2021-12-15 23:07:17.765670', '3', 'RouteMap object (3)', 1, '[{\"added\": {}}]', 39, 1);
INSERT INTO `django_admin_log` VALUES (125, '2021-12-15 23:35:34.418979', '4', 'RouteMap object (4)', 1, '[{\"added\": {}}]', 39, 1);
INSERT INTO `django_admin_log` VALUES (126, '2021-12-16 18:04:57.360599', '6', 'Service object (6)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (127, '2021-12-16 18:04:57.361319', '5', 'Service object (5)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (128, '2021-12-16 18:04:57.361929', '2', 'Service object (2)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (129, '2021-12-17 10:04:57.708936', '9', 'Service object (9)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (130, '2021-12-17 10:04:57.710521', '8', 'Service object (8)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (131, '2021-12-17 10:04:57.711086', '7', 'Service object (7)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (132, '2021-12-17 10:04:57.711625', '1', 'Service object (1)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (133, '2021-12-17 10:17:26.155859', '13', 'Pichilemu', 1, '[{\"added\": {}}]', 33, 1);
INSERT INTO `django_admin_log` VALUES (134, '2021-12-17 10:52:39.397279', '11', 'Service object (11)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (135, '2021-12-20 17:18:04.766108', '14', 'Service object (14)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (136, '2021-12-20 17:18:04.766769', '13', 'Service object (13)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (137, '2021-12-20 17:18:04.767292', '12', 'Service object (12)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (138, '2021-12-20 17:18:04.767767', '10', 'Service object (10)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (139, '2021-12-21 12:20:23.474285', '2', '01Prueba', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (5)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (6)\"}}, {\"added\": {\"name\": \"Tramo de ruta\", \"object\": \"RouteStretch object (1)\"}}]', 32, 4);
INSERT INTO `django_admin_log` VALUES (140, '2021-12-21 12:27:25.863845', '2', '01Prueba', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 32, 4);
INSERT INTO `django_admin_log` VALUES (141, '2021-12-21 12:31:49.648793', '1', 'RutaTest', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 32, 4);
INSERT INTO `django_admin_log` VALUES (142, '2021-12-21 12:50:26.103498', '20', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (143, '2021-12-21 12:50:26.104114', '19', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (144, '2021-12-21 12:50:26.104816', '18', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (145, '2021-12-21 12:50:26.109612', '17', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (146, '2021-12-21 12:50:26.110139', '16', 'Test2', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (147, '2021-12-21 12:50:26.110642', '15', 'TEST', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (148, '2021-12-21 15:51:21.011744', '9', 'prueba01', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta maestra\", \"object\": \"MasterRouteMap object (58)\"}}, {\"added\": {\"name\": \"Mapa de ruta maestra\", \"object\": \"MasterRouteMap object (59)\"}}, {\"added\": {\"name\": \"Tramo de ruta maestra\", \"object\": \"[prueba01] El Palomar - Punta Colorada\"}}]', 31, 4);
INSERT INTO `django_admin_log` VALUES (149, '2021-12-21 16:01:40.145358', '9', 'prueba01 - prueba2', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 31, 4);
INSERT INTO `django_admin_log` VALUES (150, '2021-12-21 16:05:53.272347', '3', '02Prueba', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (7)\"}}]', 32, 4);
INSERT INTO `django_admin_log` VALUES (151, '2021-12-21 16:22:37.555253', '2', '01Prueba', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 32, 4);
INSERT INTO `django_admin_log` VALUES (152, '2021-12-21 16:37:48.489974', '23', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (153, '2021-12-21 16:37:48.490592', '22', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (154, '2021-12-21 16:37:48.491132', '4', 'RGA - ATFA', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (155, '2021-12-21 16:37:48.491602', '3', 'SCL - TCO', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (156, '2021-12-22 10:29:52.089691', '43', 'Andimar', 2, '[{\"changed\": {\"fields\": [\"Disposici\\u00f3n\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (157, '2021-12-23 13:06:03.793895', '29', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (158, '2021-12-23 13:06:03.794914', '28', 'Test2', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (159, '2021-12-23 13:06:03.795601', '26', 'TEST', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (160, '2021-12-23 13:06:03.796249', '25', 'TEST DATETIME (por defecto)2', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (161, '2021-12-23 13:06:03.796895', '24', 'TEST DATETIME (por defecto)', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (162, '2021-12-23 13:06:03.797636', '21', 'TEST', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (163, '2021-12-27 18:04:50.956571', '155', 'Asiento conductor 001', 1, '[{\"added\": {}}]', 14, 4);
INSERT INTO `django_admin_log` VALUES (164, '2021-12-27 18:37:01.375215', '4', 'Asiento chofer', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 10, 4);
INSERT INTO `django_admin_log` VALUES (165, '2021-12-27 19:35:56.304222', '1', 'Mixto 60 Asientos', 2, '[{\"changed\": {\"fields\": [\"Descripci\\u00f3n\"]}}]', 11, 4);
INSERT INTO `django_admin_log` VALUES (166, '2021-12-27 19:37:48.251613', '4', '01Prueba', 1, '[{\"added\": {}}]', 11, 4);
INSERT INTO `django_admin_log` VALUES (167, '2021-12-27 19:52:17.291784', '4', '01Prueba', 3, '', 11, 4);
INSERT INTO `django_admin_log` VALUES (168, '2021-12-27 20:21:32.184989', '7', '[Bus Cama 43] Piso 2', 1, '[{\"added\": {}}]', 12, 4);
INSERT INTO `django_admin_log` VALUES (169, '2021-12-27 23:44:18.092556', '8', 'RouteMap object (8)', 1, '[{\"added\": {}}]', 39, 4);
INSERT INTO `django_admin_log` VALUES (170, '2021-12-27 23:46:29.473678', '8', 'RouteMap object (8)', 3, '', 39, 4);
INSERT INTO `django_admin_log` VALUES (171, '2021-12-27 23:55:09.698059', '60', 'MasterRouteMap object (60)', 1, '[{\"added\": {}}]', 38, 4);
INSERT INTO `django_admin_log` VALUES (172, '2021-12-27 23:55:27.784558', '61', 'MasterRouteMap object (61)', 1, '[{\"added\": {}}]', 38, 4);
INSERT INTO `django_admin_log` VALUES (173, '2021-12-27 23:55:50.277658', '61', 'MasterRouteMap object (61)', 3, '', 38, 4);
INSERT INTO `django_admin_log` VALUES (174, '2021-12-27 23:55:50.278261', '60', 'MasterRouteMap object (60)', 3, '', 38, 4);
INSERT INTO `django_admin_log` VALUES (175, '2021-12-28 00:31:48.741036', '35', 'CIC', 2, '[{\"changed\": {\"fields\": [\"C\\u00f3digo\", \"Estado\"]}}]', 24, 4);
INSERT INTO `django_admin_log` VALUES (176, '2021-12-28 00:36:34.621945', '1', 'TT1', 1, '[{\"added\": {}}]', 25, 4);
INSERT INTO `django_admin_log` VALUES (177, '2021-12-28 00:37:47.293096', '1', 'Nocturnas', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 25, 4);
INSERT INTO `django_admin_log` VALUES (178, '2021-12-28 00:38:20.940448', '2', 'Dia', 1, '[{\"added\": {}}]', 25, 4);
INSERT INTO `django_admin_log` VALUES (179, '2021-12-28 00:39:09.876841', '1', 'RouteStretchRate object (1)', 1, '[{\"added\": {}}]', 22, 4);
INSERT INTO `django_admin_log` VALUES (180, '2021-12-28 00:42:09.639469', '2', 'RouteStretch object (2)', 1, '[{\"added\": {}}]', 28, 4);
INSERT INTO `django_admin_log` VALUES (181, '2021-12-28 00:55:32.308640', '2', 'Diurno', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 25, 4);
INSERT INTO `django_admin_log` VALUES (182, '2021-12-28 00:55:52.983318', '1', 'Nocturnas', 2, '[{\"changed\": {\"fields\": [\"Hora de fin\"]}}]', 25, 4);
INSERT INTO `django_admin_log` VALUES (183, '2021-12-28 01:21:45.866826', '3', 'Contador', 1, '[{\"added\": {}}]', 17, 4);
INSERT INTO `django_admin_log` VALUES (184, '2021-12-28 01:22:08.958204', '2', 'Conductor', 2, '[{\"changed\": {\"fields\": [\"Descripci\\u00f3n\"]}}]', 17, 4);
INSERT INTO `django_admin_log` VALUES (185, '2021-12-28 01:24:50.328872', '4', 'Vendedor', 1, '[{\"added\": {}}]', 17, 4);
INSERT INTO `django_admin_log` VALUES (186, '2021-12-28 01:25:39.357764', '4', 'Vendedor', 3, '', 17, 4);
INSERT INTO `django_admin_log` VALUES (187, '2021-12-28 01:31:14.275403', '55', 'Comisión de Ross             223dsffs', 1, '[{\"added\": {}}]', 20, 4);
INSERT INTO `django_admin_log` VALUES (188, '2021-12-28 01:36:48.341555', '56', 'Comisión de Ross             223dsffs', 1, '[{\"added\": {}}]', 20, 4);
INSERT INTO `django_admin_log` VALUES (189, '2021-12-28 01:42:29.076561', '1', 'CommissionLog object (1)', 1, '[{\"added\": {}}]', 37, 4);
INSERT INTO `django_admin_log` VALUES (190, '2021-12-28 01:43:54.759375', '2', 'CommissionLog object (2)', 1, '[{\"added\": {}}]', 37, 4);
INSERT INTO `django_admin_log` VALUES (191, '2021-12-28 01:46:09.178933', '57', 'Comisión de Alfredo             Cancino', 1, '[{\"added\": {}}]', 20, 4);
INSERT INTO `django_admin_log` VALUES (192, '2021-12-28 01:47:02.195443', '3', 'CommissionLog object (3)', 1, '[{\"added\": {}}]', 37, 4);
INSERT INTO `django_admin_log` VALUES (193, '2021-12-28 01:47:43.557523', '4', 'CommissionLog object (4)', 1, '[{\"added\": {}}]', 37, 4);
INSERT INTO `django_admin_log` VALUES (194, '2021-12-28 01:49:33.916891', '5', 'CommissionLog object (5)', 1, '[{\"added\": {}}]', 37, 4);
INSERT INTO `django_admin_log` VALUES (195, '2021-12-28 01:57:43.831451', '6', 'permiso', 1, '[{\"added\": {}}]', 15, 4);
INSERT INTO `django_admin_log` VALUES (196, '2021-12-28 01:58:03.619500', '7', 'vacaciones', 1, '[{\"added\": {}}]', 15, 4);
INSERT INTO `django_admin_log` VALUES (197, '2021-12-28 02:31:34.026891', '156', 'Televisión', 1, '[{\"added\": {}}]', 13, 4);
INSERT INTO `django_admin_log` VALUES (198, '2021-12-28 02:31:56.596935', '156', 'Televisión', 3, '', 13, 4);
INSERT INTO `django_admin_log` VALUES (199, '2021-12-28 02:36:39.591168', '5', 'cama 42', 1, '[{\"added\": {}}]', 11, 4);
INSERT INTO `django_admin_log` VALUES (200, '2021-12-28 02:42:08.911309', '1', 'prestacion1', 1, '[{\"added\": {}}]', 8, 4);
INSERT INTO `django_admin_log` VALUES (201, '2021-12-28 02:42:36.950665', '1', 'prestacion1', 3, '', 8, 4);
INSERT INTO `django_admin_log` VALUES (202, '2021-12-28 02:44:30.776823', '4', 'Asiento conductor', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 10, 4);
INSERT INTO `django_admin_log` VALUES (203, '2021-12-28 02:53:25.566256', '14', 'Santiago', 1, '[{\"added\": {}}]', 33, 4);
INSERT INTO `django_admin_log` VALUES (204, '2021-12-28 02:55:09.494414', '15', 'Santiago', 1, '[{\"added\": {}}]', 33, 4);
INSERT INTO `django_admin_log` VALUES (205, '2021-12-28 02:55:41.311896', '15', 'Santiago', 3, '', 33, 4);
INSERT INTO `django_admin_log` VALUES (206, '2021-12-28 02:55:41.312498', '14', 'Santiago', 3, '', 33, 4);
INSERT INTO `django_admin_log` VALUES (207, '2021-12-28 08:25:41.412315', '1', 'Antofagastas', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 21, 4);
INSERT INTO `django_admin_log` VALUES (208, '2021-12-28 08:25:51.053369', '1', 'Antofagasta', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 21, 4);
INSERT INTO `django_admin_log` VALUES (209, '2021-12-28 08:25:56.978119', '1', 'Antofagastas', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 33, 4);
INSERT INTO `django_admin_log` VALUES (210, '2021-12-28 08:26:12.417306', '1', 'Antofagasta', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 33, 4);
INSERT INTO `django_admin_log` VALUES (211, '2021-12-28 08:29:20.851332', '16', '01Prueba', 1, '[{\"added\": {}}]', 33, 4);
INSERT INTO `django_admin_log` VALUES (212, '2021-12-28 08:31:06.270467', '17', '02Prueba', 1, '[{\"added\": {}}]', 33, 4);
INSERT INTO `django_admin_log` VALUES (213, '2021-12-28 08:31:46.499021', '17', '02Prueba', 2, '[{\"changed\": {\"fields\": [\"C\\u00f3digo\"]}}]', 33, 4);
INSERT INTO `django_admin_log` VALUES (214, '2021-12-28 08:32:26.636291', '16', '01Pruebas', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 33, 4);
INSERT INTO `django_admin_log` VALUES (215, '2021-12-28 08:33:14.565332', '17', '02Prueba', 3, '', 33, 4);
INSERT INTO `django_admin_log` VALUES (216, '2021-12-28 08:33:14.565960', '16', '01Pruebas', 3, '', 33, 4);
INSERT INTO `django_admin_log` VALUES (217, '2021-12-28 08:33:58.434813', '3', 'Vallenar', 2, '[]', 33, 4);
INSERT INTO `django_admin_log` VALUES (218, '2021-12-28 08:38:14.548440', '130', '02Prueba', 1, '[{\"added\": {}}]', 35, 4);
INSERT INTO `django_admin_log` VALUES (219, '2021-12-28 08:50:43.208079', '130', '02Prueba', 2, '[{\"changed\": {\"fields\": [\"C\\u00f3digo\"]}}]', 35, 4);
INSERT INTO `django_admin_log` VALUES (220, '2021-12-28 08:51:06.835964', '130', '02Prueba', 3, '', 35, 4);
INSERT INTO `django_admin_log` VALUES (221, '2021-12-28 09:03:02.406746', '9', '01Prueba', 1, '[{\"added\": {}}]', 21, 4);
INSERT INTO `django_admin_log` VALUES (222, '2021-12-28 09:35:58.254111', '34', 'TEST', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (223, '2021-12-28 09:35:58.254959', '33', 'Test3', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (224, '2021-12-28 09:35:58.255620', '32', 'Test2', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (225, '2021-12-28 09:35:58.256177', '31', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (226, '2021-12-28 09:35:58.256900', '30', 'TEST', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (227, '2021-12-28 09:35:58.257453', '27', 'Iquique', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (228, '2021-12-28 12:20:22.280088', '44', '01Prueba', 2, '[{\"changed\": {\"fields\": [\"Disposici\\u00f3n\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (229, '2021-12-28 17:06:09.699653', '3', '02Prueba', 2, '[{\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (9)\"}}]', 32, 1);
INSERT INTO `django_admin_log` VALUES (230, '2021-12-28 17:29:31.034491', '43', 'Andimar', 2, '[{\"changed\": {\"fields\": [\"Disposici\\u00f3n\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (231, '2021-12-30 09:57:54.486254', '3', 'Rancagua --> Copiapo', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (232, '2021-12-30 09:58:19.696029', '2', 'Curicó --> Antofagasta', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (233, '2021-12-30 09:58:53.148485', '1', 'Antofagasta --> Santiago', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (234, '2021-12-30 10:01:07.515701', '4', 'CIC', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (10)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (11)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (12)\"}}, {\"added\": {\"name\": \"Tramo de ruta\", \"object\": \"RouteStretch object (3)\"}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (235, '2021-12-30 10:01:19.737182', '4', 'Copiapo --> Santiago', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (236, '2021-12-30 10:04:13.955140', '37', 'Copiapo/Santiago', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (237, '2021-12-30 10:04:26.243336', '36', 'Rancagua/Copiapo', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (238, '2021-12-30 10:04:39.622975', '35', 'Antofagasta-Santiago', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (239, '2021-12-30 10:04:50.610313', '36', 'Rancagua - Copiapo', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (240, '2021-12-30 10:04:58.072617', '37', 'Copiapo - Santiago', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (241, '2021-12-30 10:05:04.184905', '35', 'Antofagasta - Santiago', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (242, '2021-12-30 10:13:00.995075', '5', 'Test2', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (13)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (14)\"}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (243, '2021-12-30 10:13:18.195436', '5', 'Santiago --> Valdivia', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (244, '2021-12-30 10:13:46.258370', '38', 'Curico - Antofagasta', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (245, '2021-12-30 10:18:42.691311', '6', 'TEST', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (15)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (16)\"}}, {\"added\": {\"name\": \"Tramo de ruta\", \"object\": \"RouteStretch object (4)\"}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (246, '2021-12-30 10:19:03.368919', '6', 'Santiago --> Rancagua', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (247, '2021-12-30 10:21:01.593638', '40', 'Santiago - Rancagua', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (248, '2021-12-30 10:21:57.930963', '7', 'test', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (17)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (18)\"}}, {\"added\": {\"name\": \"Tramo de ruta\", \"object\": \"RouteStretch object (5)\"}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (249, '2021-12-30 10:22:11.288091', '7', 'Antofagasta --> La Serena', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (250, '2021-12-30 10:29:05.928888', '8', 'ssss', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (19)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (20)\"}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (251, '2021-12-30 10:29:19.651329', '8', 'Santiago --> Rancagua', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 32, 2);
INSERT INTO `django_admin_log` VALUES (252, '2021-12-30 10:30:40.604389', '6', 'Santiago --> Rancagua', 3, '', 32, 2);
INSERT INTO `django_admin_log` VALUES (253, '2022-01-03 16:33:40.974714', '57', 'test', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (254, '2022-01-03 17:52:59.580217', '9', 'Rancagua --> Santiago', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (21)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (22)\"}}]', 32, 1);
INSERT INTO `django_admin_log` VALUES (255, '2022-01-03 17:53:53.083390', '45', 'Rancagua - Santiago', 1, '[{\"added\": {}}]', 24, 1);
INSERT INTO `django_admin_log` VALUES (256, '2022-01-03 17:59:27.220009', '9', 'Rancagua --> Santiago', 2, '[{\"changed\": {\"fields\": [\"Ruta maestra\"]}}, {\"changed\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (21)\", \"fields\": [\"Paradas\"]}}, {\"changed\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (22)\", \"fields\": [\"Paradas\"]}}, {\"added\": {\"name\": \"Tramo de ruta\", \"object\": \"RouteStretch object (6)\"}}]', 32, 1);
INSERT INTO `django_admin_log` VALUES (257, '2022-01-03 17:59:31.664061', '45', 'Rancagua - Santiago', 2, '[]', 24, 1);
INSERT INTO `django_admin_log` VALUES (258, '2022-01-07 09:54:22.560496', '49', 'TEST4', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (259, '2022-01-07 09:54:22.564254', '48', 'CIC2', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (260, '2022-01-07 09:54:22.565164', '47', 'TEST1', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (261, '2022-01-07 09:54:22.576991', '46', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (262, '2022-01-10 11:12:30.547538', '55', 'asdsad', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (263, '2022-01-10 11:12:30.551421', '54', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (264, '2022-01-10 11:12:30.551981', '53', 'TEST3', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (265, '2022-01-10 11:12:30.552560', '52', 'CIC2', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (266, '2022-01-10 11:12:30.553050', '51', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (267, '2022-01-10 11:12:30.553532', '50', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (268, '2022-01-10 16:30:56.237026', '58', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (269, '2022-01-10 16:30:56.237687', '57', 'CIC', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (270, '2022-01-10 16:30:56.238198', '60', 'CIC22', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (271, '2022-01-10 16:30:56.238676', '59', 'CIC43', 3, '', 24, 2);
INSERT INTO `django_admin_log` VALUES (272, '2022-01-11 13:41:23.829293', '62', 'TEST DATETIME (por defecto)2', 2, '[{\"changed\": {\"fields\": [\"Estado de servicio\"]}}]', 24, 53);
INSERT INTO `django_admin_log` VALUES (273, '2022-01-11 13:41:28.720419', '61', 'TEST DATETIME (por defecto)', 2, '[{\"changed\": {\"fields\": [\"Estado de servicio\"]}}]', 24, 53);
INSERT INTO `django_admin_log` VALUES (274, '2022-01-11 13:41:32.944001', '56', 'Antofagasta --> Santiago', 2, '[{\"changed\": {\"fields\": [\"Estado de servicio\"]}}]', 24, 53);
INSERT INTO `django_admin_log` VALUES (275, '2022-01-11 13:41:36.902914', '36', 'Rancagua - Copiapo', 2, '[{\"changed\": {\"fields\": [\"Estado de servicio\"]}}]', 24, 53);
INSERT INTO `django_admin_log` VALUES (276, '2022-01-11 13:41:40.997691', '35', 'Antofagasta - Santiago', 2, '[{\"changed\": {\"fields\": [\"Estado de servicio\"]}}]', 24, 53);
INSERT INTO `django_admin_log` VALUES (277, '2022-01-13 13:53:34.825383', '217', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (278, '2022-01-13 13:53:34.826315', '216', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (279, '2022-01-13 13:53:34.826958', '215', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (280, '2022-01-13 13:53:34.827445', '214', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (281, '2022-01-13 13:53:34.827912', '213', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (282, '2022-01-13 13:53:34.828359', '212', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (283, '2022-01-13 13:53:34.828943', '211', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (284, '2022-01-13 13:53:34.829508', '210', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (285, '2022-01-13 13:53:34.830256', '209', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (286, '2022-01-13 13:53:34.834246', '208', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (287, '2022-01-13 13:53:34.834806', '207', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (288, '2022-01-13 13:53:34.835270', '206', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (289, '2022-01-13 13:53:34.835709', '205', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (290, '2022-01-13 13:53:34.836144', '204', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (291, '2022-01-13 13:53:34.836907', '203', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (292, '2022-01-13 13:53:34.837393', '202', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (293, '2022-01-13 13:53:34.837851', '201', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (294, '2022-01-13 13:53:34.838286', '200', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (295, '2022-01-13 13:53:34.838851', '199', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (296, '2022-01-13 13:53:34.839463', '198', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (297, '2022-01-13 13:53:34.840210', '197', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (298, '2022-01-13 13:53:34.840730', '196', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (299, '2022-01-13 13:53:34.841182', '195', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (300, '2022-01-13 13:53:34.841637', '194', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (301, '2022-01-13 13:53:34.842125', '193', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (302, '2022-01-13 13:53:34.842624', '192', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (303, '2022-01-13 13:53:34.843097', '191', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (304, '2022-01-13 13:53:34.843535', '190', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (305, '2022-01-13 13:53:34.843999', '189', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (306, '2022-01-13 13:53:34.844449', '188', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (307, '2022-01-13 13:53:34.844892', '187', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (308, '2022-01-13 13:53:34.845336', '186', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (309, '2022-01-13 13:53:34.845781', '185', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (310, '2022-01-13 13:53:34.846235', '184', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (311, '2022-01-13 13:53:34.846767', '183', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (312, '2022-01-13 13:53:34.847215', '182', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (313, '2022-01-13 13:53:34.847776', '181', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (314, '2022-01-13 13:53:34.848221', '180', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (315, '2022-01-13 13:53:34.848909', '179', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (316, '2022-01-13 13:53:34.849641', '178', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (317, '2022-01-13 13:53:34.850095', '177', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (318, '2022-01-13 13:53:34.850607', '176', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (319, '2022-01-13 13:53:34.851130', '175', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (320, '2022-01-13 13:53:34.851568', '174', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (321, '2022-01-13 13:53:34.851999', '173', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (322, '2022-01-13 13:53:34.852450', '172', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (323, '2022-01-13 13:53:34.852895', '171', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (324, '2022-01-13 13:53:34.853339', '170', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (325, '2022-01-13 13:53:34.853781', '169', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (326, '2022-01-13 13:53:34.854220', '168', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (327, '2022-01-13 13:53:34.854665', '167', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (328, '2022-01-13 13:53:34.855133', '166', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (329, '2022-01-13 13:53:34.855581', '165', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (330, '2022-01-13 13:53:34.856082', '164', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (331, '2022-01-13 13:53:34.856540', '163', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (332, '2022-01-13 13:53:34.856983', '162', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (333, '2022-01-13 13:53:34.857465', '161', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (334, '2022-01-13 13:53:34.857913', '160', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (335, '2022-01-13 13:53:34.858378', '159', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (336, '2022-01-13 13:53:34.858933', '158', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (337, '2022-01-13 13:53:34.859369', '157', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (338, '2022-01-13 13:53:34.859851', '156', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (339, '2022-01-13 13:53:34.860307', '155', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (340, '2022-01-13 13:53:34.861026', '154', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (341, '2022-01-13 13:53:34.861474', '153', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (342, '2022-01-13 13:53:34.863217', '152', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (343, '2022-01-13 13:53:34.863844', '151', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (344, '2022-01-13 13:53:34.864623', '150', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (345, '2022-01-13 13:53:34.865349', '149', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (346, '2022-01-13 13:53:34.866079', '148', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (347, '2022-01-13 13:53:34.866734', '147', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (348, '2022-01-13 13:53:34.867361', '146', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (349, '2022-01-13 13:53:34.867971', '145', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (350, '2022-01-13 13:53:34.868563', '144', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (351, '2022-01-13 13:53:34.869164', '143', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (352, '2022-01-13 13:53:34.869850', '142', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (353, '2022-01-13 13:53:34.870298', '141', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (354, '2022-01-13 13:53:34.870740', '140', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (355, '2022-01-13 13:53:34.871171', '139', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (356, '2022-01-13 13:53:34.871619', '138', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (357, '2022-01-13 13:53:34.872043', '137', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (358, '2022-01-13 13:53:34.872557', '136', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (359, '2022-01-13 13:53:34.872993', '135', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (360, '2022-01-13 13:53:34.873480', '134', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (361, '2022-01-13 13:53:34.873906', '133', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (362, '2022-01-13 13:53:34.874320', '132', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (363, '2022-01-13 13:53:34.874760', '131', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (364, '2022-01-13 13:53:34.875185', '130', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (365, '2022-01-13 13:53:34.875600', '129', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (366, '2022-01-13 13:53:34.876034', '128', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (367, '2022-01-13 13:53:34.876467', '127', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (368, '2022-01-13 13:53:34.876886', '126', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (369, '2022-01-13 13:53:34.877349', '125', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (370, '2022-01-13 13:53:34.877778', '124', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (371, '2022-01-13 13:53:34.878198', '123', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (372, '2022-01-13 13:53:34.878616', '122', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (373, '2022-01-13 13:53:34.879184', '121', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (374, '2022-01-13 13:53:34.879595', '120', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (375, '2022-01-13 13:53:34.880003', '119', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (376, '2022-01-13 13:53:34.880412', '118', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (377, '2022-01-13 13:53:53.112609', '117', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (378, '2022-01-13 13:53:53.113338', '116', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (379, '2022-01-13 13:53:53.113915', '115', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (380, '2022-01-13 13:53:53.114368', '114', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (381, '2022-01-13 13:53:53.114869', '113', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (382, '2022-01-13 13:53:53.115368', '112', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (383, '2022-01-13 13:53:53.115822', '111', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (384, '2022-01-13 13:53:53.116306', '110', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (385, '2022-01-13 13:53:53.116783', '109', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (386, '2022-01-13 13:53:53.117246', '108', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (387, '2022-01-13 13:53:53.117728', '107', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (388, '2022-01-13 13:53:53.118240', '106', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (389, '2022-01-13 13:53:53.118720', '105', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (390, '2022-01-13 13:53:53.119191', '104', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (391, '2022-01-13 13:53:53.119647', '103', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (392, '2022-01-13 13:53:53.120102', '102', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (393, '2022-01-13 13:53:53.120626', '101', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (394, '2022-01-13 13:53:53.121120', '100', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (395, '2022-01-13 13:53:53.121583', '99', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (396, '2022-01-13 13:53:53.122021', '98', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (397, '2022-01-13 13:53:53.122460', '97', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (398, '2022-01-13 13:53:53.122918', '96', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (399, '2022-01-13 13:53:53.123350', '95', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (400, '2022-01-13 13:53:53.123785', '94', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (401, '2022-01-13 13:53:53.124279', '93', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (402, '2022-01-13 13:53:53.124721', '92', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (403, '2022-01-13 13:53:53.125157', '91', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (404, '2022-01-13 13:53:53.125590', '90', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (405, '2022-01-13 13:53:53.126022', '89', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (406, '2022-01-13 13:53:53.126486', '88', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (407, '2022-01-13 13:53:53.126949', '87', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (408, '2022-01-13 13:53:53.127393', '86', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (409, '2022-01-13 13:53:53.127844', '85', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (410, '2022-01-13 13:53:53.128276', '84', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (411, '2022-01-13 13:53:53.128706', '83', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (412, '2022-01-13 13:53:53.129138', '82', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (413, '2022-01-13 13:53:53.129596', '81', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (414, '2022-01-13 13:53:53.130028', '80', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (415, '2022-01-13 13:53:53.130464', '79', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (416, '2022-01-13 13:53:53.130914', '78', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (417, '2022-01-13 13:53:53.131374', '77', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (418, '2022-01-13 13:53:53.132366', '76', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (419, '2022-01-13 13:53:53.132838', '75', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (420, '2022-01-13 13:53:53.133312', '74', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (421, '2022-01-13 13:53:53.133758', '73', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (422, '2022-01-13 13:53:53.134284', '72', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (423, '2022-01-13 13:53:53.134759', '71', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (424, '2022-01-13 13:53:53.135207', '70', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (425, '2022-01-13 13:53:53.135650', '69', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (426, '2022-01-13 13:53:53.136094', '68', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (427, '2022-01-13 13:53:53.136548', '67', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (428, '2022-01-13 13:53:53.136991', '66', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (429, '2022-01-13 13:53:53.137433', '65', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (430, '2022-01-13 13:53:53.137929', '64', 'Test sprint 4', 3, '', 24, 1);
INSERT INTO `django_admin_log` VALUES (431, '2022-01-14 11:17:41.896327', '59', 'asd asd', 3, '', 16, 1);
INSERT INTO `django_admin_log` VALUES (432, '2022-02-14 15:57:58.998453', '2', 'israel', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 7, 53);
INSERT INTO `django_admin_log` VALUES (433, '2022-02-14 15:59:53.343621', '52', 'icastro', 2, '[{\"changed\": {\"fields\": [\"Roles\"]}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (434, '2022-02-14 16:09:30.359449', '52', 'icastro', 2, '[]', 7, 2);
INSERT INTO `django_admin_log` VALUES (435, '2022-02-14 16:09:31.904363', '52', 'israel castro', 2, '[]', 16, 2);
INSERT INTO `django_admin_log` VALUES (436, '2022-02-14 16:17:55.294798', '2', 'israel', 2, '[{\"changed\": {\"fields\": [\"Apellido Materno\", \"Roles\", \"User permissions\"]}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (437, '2022-02-23 10:13:37.499718', '61', 'rosemary', 1, '[{\"added\": {}}]', 7, 53);
INSERT INTO `django_admin_log` VALUES (438, '2022-02-23 10:14:57.344859', '61', 'rosemary', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Apellido Materno\", \"Sexo\", \"Email address\", \"RUT\", \"N\\u00famero de celular\", \"Staff status\", \"Roles\"]}}]', 7, 53);
INSERT INTO `django_admin_log` VALUES (439, '2022-02-23 10:15:30.799804', '61', 'RoseMary Montevilla', 1, '[{\"added\": {}}]', 16, 53);
INSERT INTO `django_admin_log` VALUES (440, '2022-02-23 10:15:53.121556', '61', 'rosemary', 2, '[{\"changed\": {\"fields\": [\"RUT\"]}}]', 7, 53);
INSERT INTO `django_admin_log` VALUES (441, '2022-02-23 14:14:38.573072', '4', 'Santiago --> Antofagasta', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (10)\"}}, {\"added\": {\"name\": \"Mapa de ruta\", \"object\": \"RouteMap object (11)\"}}]', 32, 1);
INSERT INTO `django_admin_log` VALUES (442, '2022-02-24 16:22:28.230644', '52', 'israel castro', 2, '[{\"changed\": {\"fields\": [\"Branch\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (443, '2022-02-24 16:23:01.430983', '52', 'israel castro', 2, '[]', 16, 2);
INSERT INTO `django_admin_log` VALUES (444, '2022-02-24 16:24:08.836489', '52', 'israel castro', 2, '[]', 16, 2);
INSERT INTO `django_admin_log` VALUES (445, '2022-02-24 17:07:55.121187', '52', 'icastro', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (446, '2022-02-24 17:18:04.777076', '1', 'impresora test icastro vendedor', 1, '[{\"added\": {}}]', 43, 2);
INSERT INTO `django_admin_log` VALUES (447, '2022-02-24 17:18:21.326789', '1', 'impresora test icastro vendedor', 2, '[{\"changed\": {\"fields\": [\"Total de impresiones\"]}}]', 43, 2);
INSERT INTO `django_admin_log` VALUES (448, '2022-02-24 17:18:24.582905', '1', 'Caja 1', 1, '[{\"added\": {}}]', 36, 2);
INSERT INTO `django_admin_log` VALUES (449, '2022-02-24 17:20:11.367630', '1', 'Caja 1', 2, '[{\"changed\": {\"fields\": [\"Sucursal\"]}}]', 36, 2);
INSERT INTO `django_admin_log` VALUES (450, '2022-02-25 18:22:24.233329', '1', 'Caja 1', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 36, 2);
INSERT INTO `django_admin_log` VALUES (451, '2022-02-25 18:24:54.340503', '1', 'Caja 1', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 36, 2);
INSERT INTO `django_admin_log` VALUES (452, '2022-02-25 18:26:48.648804', '1', 'Caja 1', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 36, 2);
INSERT INTO `django_admin_log` VALUES (453, '2022-02-25 18:26:55.053006', '1', 'Caja 1', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 36, 2);
INSERT INTO `django_admin_log` VALUES (454, '2022-02-25 18:28:40.931152', '1', 'Caja 1', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 36, 2);
INSERT INTO `django_admin_log` VALUES (455, '2022-02-25 18:31:06.070735', '1', 'Caja 1', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 36, 2);
INSERT INTO `django_admin_log` VALUES (456, '2022-02-25 18:34:48.006975', '1', 'Caja 1', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 36, 2);
INSERT INTO `django_admin_log` VALUES (457, '2022-02-28 12:27:36.614455', '1', 'Caja 1', 2, '[{\"changed\": {\"fields\": [\"Estado\"]}}]', 36, 2);
INSERT INTO `django_admin_log` VALUES (458, '2022-02-28 17:09:11.388213', '1', 'Caja 1', 2, '[{\"changed\": {\"fields\": [\"Nombre\"]}}]', 36, 2);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (36, 'core', 'cashregister');
INSERT INTO `django_content_type` VALUES (44, 'core', 'cashregistermovement');
INSERT INTO `django_content_type` VALUES (45, 'core', 'cashregisteroperation');
INSERT INTO `django_content_type` VALUES (31, 'core', 'masterroute');
INSERT INTO `django_content_type` VALUES (38, 'core', 'masterroutemap');
INSERT INTO `django_content_type` VALUES (27, 'core', 'masterroutestretch');
INSERT INTO `django_content_type` VALUES (29, 'core', 'masterroutestretchrate');
INSERT INTO `django_content_type` VALUES (30, 'core', 'passenger');
INSERT INTO `django_content_type` VALUES (40, 'core', 'passengernationality');
INSERT INTO `django_content_type` VALUES (43, 'core', 'printer');
INSERT INTO `django_content_type` VALUES (25, 'core', 'ratetype');
INSERT INTO `django_content_type` VALUES (42, 'core', 'reservedseat');
INSERT INTO `django_content_type` VALUES (41, 'core', 'reservedseats');
INSERT INTO `django_content_type` VALUES (32, 'core', 'route');
INSERT INTO `django_content_type` VALUES (39, 'core', 'routemap');
INSERT INTO `django_content_type` VALUES (28, 'core', 'routestretch');
INSERT INTO `django_content_type` VALUES (22, 'core', 'routestretchrate');
INSERT INTO `django_content_type` VALUES (23, 'core', 'sale');
INSERT INTO `django_content_type` VALUES (24, 'core', 'service');
INSERT INTO `django_content_type` VALUES (26, 'core', 'ticket');
INSERT INTO `django_content_type` VALUES (20, 'crew', 'commission');
INSERT INTO `django_content_type` VALUES (37, 'crew', 'commissionlog');
INSERT INTO `django_content_type` VALUES (15, 'crew', 'motive');
INSERT INTO `django_content_type` VALUES (16, 'crew', 'personal');
INSERT INTO `django_content_type` VALUES (19, 'crew', 'personalmotive');
INSERT INTO `django_content_type` VALUES (18, 'crew', 'personalposition');
INSERT INTO `django_content_type` VALUES (17, 'crew', 'position');
INSERT INTO `django_content_type` VALUES (34, 'locations', 'branch');
INSERT INTO `django_content_type` VALUES (35, 'locations', 'busstop');
INSERT INTO `django_content_type` VALUES (33, 'locations', 'city');
INSERT INTO `django_content_type` VALUES (21, 'locations', 'region');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'transportation', 'benefit');
INSERT INTO `django_content_type` VALUES (9, 'transportation', 'bus');
INSERT INTO `django_content_type` VALUES (13, 'transportation', 'component');
INSERT INTO `django_content_type` VALUES (12, 'transportation', 'floor');
INSERT INTO `django_content_type` VALUES (11, 'transportation', 'layout');
INSERT INTO `django_content_type` VALUES (14, 'transportation', 'seat');
INSERT INTO `django_content_type` VALUES (10, 'transportation', 'seattype');
INSERT INTO `django_content_type` VALUES (7, 'users', 'customuser');
INSERT INTO `django_content_type` VALUES (6, 'users', 'role');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-11-12 12:28:10.493071');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2021-11-12 12:28:10.583649');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2021-11-12 12:28:10.858612');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2021-11-12 12:28:10.882808');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2021-11-12 12:28:10.899036');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2021-11-12 12:28:10.919050');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2021-11-12 12:28:10.929812');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2021-11-12 12:28:10.934540');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2021-11-12 12:28:10.944445');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2021-11-12 12:28:10.955058');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2021-11-12 12:28:10.965635');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2021-11-12 12:28:10.985924');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2021-11-12 12:28:10.998424');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2021-11-12 12:28:11.009371');
INSERT INTO `django_migrations` VALUES (15, 'users', '0001_initial', '2021-11-12 12:28:11.390337');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2021-11-12 12:28:11.532225');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2021-11-12 12:28:11.546408');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2021-11-12 12:28:11.560702');
INSERT INTO `django_migrations` VALUES (19, 'crew', '0001_initial', '2021-11-12 12:28:11.587086');
INSERT INTO `django_migrations` VALUES (20, 'crew', '0002_initial', '2021-11-12 12:28:12.151224');
INSERT INTO `django_migrations` VALUES (21, 'crew', '0003_alter_position_description', '2021-11-12 12:28:12.218809');
INSERT INTO `django_migrations` VALUES (22, 'crew', '0004_auto_20211111_2256', '2021-11-12 12:28:12.308426');
INSERT INTO `django_migrations` VALUES (23, 'sessions', '0001_initial', '2021-11-12 12:28:12.363071');
INSERT INTO `django_migrations` VALUES (24, 'transportation', '0001_initial', '2021-11-12 12:28:13.172774');
INSERT INTO `django_migrations` VALUES (25, 'users', '0002_auto_20211110_1358', '2021-11-12 12:28:13.416922');
INSERT INTO `django_migrations` VALUES (26, 'crew', '0005_alter_personalmotive_date_from', '2021-11-15 09:59:32.252262');
INSERT INTO `django_migrations` VALUES (27, 'crew', '0006_commission', '2021-11-16 13:50:58.639483');
INSERT INTO `django_migrations` VALUES (28, 'crew', '0007_auto_20211117_1115', '2021-11-18 08:36:32.477534');
INSERT INTO `django_migrations` VALUES (29, 'locations', '0001_initial', '2021-11-25 09:30:36.265225');
INSERT INTO `django_migrations` VALUES (30, 'locations', '0002_branch_busstop_city', '2021-11-25 17:46:05.599541');
INSERT INTO `django_migrations` VALUES (31, 'core', '0001_initial', '2021-11-25 17:46:07.371266');
INSERT INTO `django_migrations` VALUES (32, 'crew', '0008_alter_commission_personal', '2021-11-25 17:46:07.402146');
INSERT INTO `django_migrations` VALUES (33, 'transportation', '0002_auto_20211129_1553', '2021-11-29 15:56:46.256040');
INSERT INTO `django_migrations` VALUES (34, 'locations', '0003_auto_20211129_1553', '2021-11-29 15:56:46.492660');
INSERT INTO `django_migrations` VALUES (35, 'core', '0002_auto_20211129_1553', '2021-11-29 15:56:47.183786');
INSERT INTO `django_migrations` VALUES (36, 'crew', '0009_commissionlog', '2021-12-01 05:25:28.243551');
INSERT INTO `django_migrations` VALUES (37, 'crew', '0010_alter_commission_personal', '2021-12-01 05:26:42.495050');
INSERT INTO `django_migrations` VALUES (38, 'crew', '0011_alter_commissionlog_date', '2021-12-01 05:26:42.516121');
INSERT INTO `django_migrations` VALUES (39, 'core', '0003_auto_20211202_0918', '2021-12-02 11:14:06.567754');
INSERT INTO `django_migrations` VALUES (40, 'core', '0004_alter_masterroutestretchrate_master_route_stretch', '2021-12-02 14:37:41.553189');
INSERT INTO `django_migrations` VALUES (41, 'core', '0005_masterroutemap', '2021-12-10 10:11:54.406611');
INSERT INTO `django_migrations` VALUES (42, 'core', '0006_masterroutemap_unique bus stop in master route', '2021-12-10 10:11:54.428735');
INSERT INTO `django_migrations` VALUES (43, 'crew', '0012_alter_personal_contract_type', '2021-12-13 10:43:24.343770');
INSERT INTO `django_migrations` VALUES (44, 'crew', '0013_alter_personal_contract_type', '2021-12-13 10:52:40.087806');
INSERT INTO `django_migrations` VALUES (45, 'core', '0007_remove_masterroutestretch_city', '2021-12-13 17:58:27.888734');
INSERT INTO `django_migrations` VALUES (46, 'core', '0008_ticket_reserved_time', '2021-12-14 13:27:45.489096');
INSERT INTO `django_migrations` VALUES (47, 'core', '0009_auto_20211214_2209', '2021-12-14 22:29:08.539590');
INSERT INTO `django_migrations` VALUES (48, 'core', '0010_alter_routemap_route', '2021-12-15 13:38:02.252514');
INSERT INTO `django_migrations` VALUES (49, 'crew', '0014_auto_20211215_1721', '2021-12-21 10:34:26.228461');
INSERT INTO `django_migrations` VALUES (50, 'core', '0011_auto_20211221_0735', '2021-12-21 10:34:26.568350');
INSERT INTO `django_migrations` VALUES (51, 'locations', '0004_city_priority', '2021-12-22 10:28:53.812371');
INSERT INTO `django_migrations` VALUES (52, 'transportation', '0003_alter_floor_layout', '2021-12-22 10:28:53.847043');
INSERT INTO `django_migrations` VALUES (53, 'transportation', '0004_rename_floor_component_floors', '2021-12-23 04:41:41.440525');
INSERT INTO `django_migrations` VALUES (54, 'core', '0012_auto_20211223_1720', '2021-12-23 17:45:09.691358');
INSERT INTO `django_migrations` VALUES (55, 'transportation', '0005_auto_20211228_1122', '2021-12-28 11:30:15.092396');
INSERT INTO `django_migrations` VALUES (56, 'core', '0013_auto_20220105_1710', '2022-01-11 11:21:58.123000');
INSERT INTO `django_migrations` VALUES (57, 'core', '0014_reservedseat_reservedseats', '2022-01-11 11:21:58.415668');
INSERT INTO `django_migrations` VALUES (58, 'core', '0015_auto_20220110_0958', '2022-01-11 11:21:58.497300');
INSERT INTO `django_migrations` VALUES (59, 'core', '0016_auto_20220110_1733', '2022-01-11 11:21:58.586543');
INSERT INTO `django_migrations` VALUES (60, 'core', '0017_alter_service_status', '2022-01-11 11:21:58.704078');
INSERT INTO `django_migrations` VALUES (61, 'users', '0003_alter_customuser_document_number', '2022-01-21 10:13:17.172042');
INSERT INTO `django_migrations` VALUES (62, 'core', '0018_auto_20220206_1838', '2022-02-07 10:51:58.796527');
INSERT INTO `django_migrations` VALUES (63, 'core', '0019_auto_20220211_1332', '2022-02-11 16:42:28.515344');
INSERT INTO `django_migrations` VALUES (64, 'transportation', '0006_alter_component_polymorphic_ctype', '2022-02-11 16:42:28.558035');
INSERT INTO `django_migrations` VALUES (65, 'core', '0020_sale_cash_payment_type', '2022-02-15 17:52:26.387961');
INSERT INTO `django_migrations` VALUES (66, 'core', '0021_alter_sale_cash_register', '2022-02-16 15:09:33.515402');
INSERT INTO `django_migrations` VALUES (67, 'core', '0022_alter_cashregister_status_cashregistermovement', '2022-02-16 15:09:33.646248');
INSERT INTO `django_migrations` VALUES (68, 'core', '0023_remove_cashregister_amount', '2022-02-16 15:09:33.703985');
INSERT INTO `django_migrations` VALUES (69, 'core', '0024_alter_service_status', '2022-02-17 13:13:58.224510');
INSERT INTO `django_migrations` VALUES (70, 'core', '0025_alter_cashregistermovement_amount', '2022-02-18 10:43:40.520739');
INSERT INTO `django_migrations` VALUES (71, 'crew', '0015_personal_branch', '2022-02-18 10:43:40.605638');
INSERT INTO `django_migrations` VALUES (72, 'core', '0026_alter_routestretch_route', '2022-02-24 12:16:08.566389');
INSERT INTO `django_migrations` VALUES (73, 'core', '0027_alter_printer_total_prints', '2022-02-25 17:16:53.167118');
INSERT INTO `django_migrations` VALUES (74, 'core', '0028_cashregisteroperation', '2022-02-28 10:06:32.174240');
INSERT INTO `django_migrations` VALUES (75, 'core', '0029_cashregisteroperation_description', '2022-02-28 10:06:32.222545');
INSERT INTO `django_migrations` VALUES (76, 'core', '0030_alter_ticket_passenger_alter_ticket_seat_and_more', '2022-02-28 10:06:32.435120');
INSERT INTO `django_migrations` VALUES (77, 'core', '0031_cashregistermovement_voucher', '2022-02-28 10:57:37.380811');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for locations_branch
-- ----------------------------
DROP TABLE IF EXISTS `locations_branch`;
CREATE TABLE `locations_branch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` varchar(15) DEFAULT NULL,
  `longitude` varchar(15) DEFAULT NULL,
  `city_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_branch_city_id_5cee9f14_fk_locations_city_id` (`city_id`),
  CONSTRAINT `locations_branch_city_id_5cee9f14_fk_locations_city_id` FOREIGN KEY (`city_id`) REFERENCES `locations_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of locations_branch
-- ----------------------------
BEGIN;
INSERT INTO `locations_branch` VALUES (1, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Antofagasta - Oficina 13B', '-23.5930135', '-70.3901624', 1);
INSERT INTO `locations_branch` VALUES (2, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Andimar Copiapó', '-23.5930135', '-70.3901624', 2);
INSERT INTO `locations_branch` VALUES (3, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Copiapó', '0', '0', 2);
INSERT INTO `locations_branch` VALUES (4, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Vallenar - Oficina 09', '-28.572346', '-70.766121', 3);
INSERT INTO `locations_branch` VALUES (5, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal La Serena - Oficina 02', '-29.910459', '-71.256912', 4);
INSERT INTO `locations_branch` VALUES (6, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal La Serena', '-29.910459', '-71.256912', 4);
INSERT INTO `locations_branch` VALUES (7, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Ovalle', '-30.6067816', '-71.1969041', 5);
INSERT INTO `locations_branch` VALUES (8, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal San Borja - Oficina 37B', '-33.4538439', '-70.6799818', 6);
INSERT INTO `locations_branch` VALUES (9, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal San Borja - Oficina 49B', '-33.4538439', '-70.6799818', 6);
INSERT INTO `locations_branch` VALUES (10, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal San Borja - Oficina 65', '-33.4538439', '-70.6799818', 6);
INSERT INTO `locations_branch` VALUES (11, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Sur - Oficina 20-21', '-33.4541655', '-70.6883814', 6);
INSERT INTO `locations_branch` VALUES (12, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Sur - Oficina 132', '-33.4541655', '-70.6883814', 6);
INSERT INTO `locations_branch` VALUES (13, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Sur - Oficina 147-148', '-33.4541655', '-70.6883814', 7);
INSERT INTO `locations_branch` VALUES (14, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal O\'Higgins - Oficina 06', '34.1676306', '-70.7279278', 7);
INSERT INTO `locations_branch` VALUES (15, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal San Fernando - Oficina 11', '-34.5856528', '-70.982475', 8);
INSERT INTO `locations_branch` VALUES (16, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal San Fernando', '-34.5856528', '-70.982475', 8);
INSERT INTO `locations_branch` VALUES (17, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Santa Cruz', '-34.6416985', '-71.3714212', 9);
INSERT INTO `locations_branch` VALUES (18, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Curicó - Oficina 12', '-34.9846917', '-71.2454917', 10);
INSERT INTO `locations_branch` VALUES (19, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Curicó', '-34.9846917', '-71.2454917', 10);
INSERT INTO `locations_branch` VALUES (20, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Rodoviario Temuco - Oficina 25', '-38.7159194', '-72.5681528', 11);
INSERT INTO `locations_branch` VALUES (21, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Terminal Valdivia - Oficina 127', '-39.815341', '-73.23552', 12);
COMMIT;

-- ----------------------------
-- Table structure for locations_busstop
-- ----------------------------
DROP TABLE IF EXISTS `locations_busstop`;
CREATE TABLE `locations_busstop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` varchar(15) DEFAULT NULL,
  `longitude` varchar(15) DEFAULT NULL,
  `stop_type` varchar(9) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_busstop_city_id_545af10f_fk_locations_city_id` (`city_id`),
  CONSTRAINT `locations_busstop_city_id_545af10f_fk_locations_city_id` FOREIGN KEY (`city_id`) REFERENCES `locations_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of locations_busstop
-- ----------------------------
BEGIN;
INSERT INTO `locations_busstop` VALUES (1, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Antofagasta', NULL, NULL, 'terminal', 1);
INSERT INTO `locations_busstop` VALUES (2, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'La Negra (Control)', NULL, NULL, 'stop', 1);
INSERT INTO `locations_busstop` VALUES (3, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Cruce Tal Tal', NULL, NULL, 'stop', 1);
INSERT INTO `locations_busstop` VALUES (4, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Cruce Chañaral', NULL, NULL, 'stop', 1);
INSERT INTO `locations_busstop` VALUES (5, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Caldera', NULL, NULL, 'stop', 1);
INSERT INTO `locations_busstop` VALUES (6, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Andimar Copiapó', NULL, NULL, 'terminal', 2);
INSERT INTO `locations_busstop` VALUES (7, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Copiapó', NULL, NULL, 'terminal', 2);
INSERT INTO `locations_busstop` VALUES (8, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'El Palomar', NULL, NULL, 'stop', 2);
INSERT INTO `locations_busstop` VALUES (9, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Nantoco', NULL, NULL, 'stop', 2);
INSERT INTO `locations_busstop` VALUES (10, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'SubEstación Cardones', NULL, NULL, 'stop', 2);
INSERT INTO `locations_busstop` VALUES (11, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Vallenar', NULL, NULL, 'terminal', 3);
INSERT INTO `locations_busstop` VALUES (12, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Domeiko', NULL, NULL, 'stop', 3);
INSERT INTO `locations_busstop` VALUES (13, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Cachiyuyo', NULL, NULL, 'stop', 3);
INSERT INTO `locations_busstop` VALUES (14, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'La Silla (La Campana)', NULL, NULL, 'stop', 3);
INSERT INTO `locations_busstop` VALUES (15, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Incahuasi', NULL, NULL, 'stop', 3);
INSERT INTO `locations_busstop` VALUES (16, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Punta Colorada', NULL, NULL, 'stop', 3);
INSERT INTO `locations_busstop` VALUES (17, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'El Trapiche', NULL, NULL, 'stop', 3);
INSERT INTO `locations_busstop` VALUES (18, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'La Higuiera', NULL, NULL, 'stop', 3);
INSERT INTO `locations_busstop` VALUES (19, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Caleta de Horno', NULL, NULL, 'stop', 3);
INSERT INTO `locations_busstop` VALUES (20, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'La Serena', NULL, NULL, 'terminal', 4);
INSERT INTO `locations_busstop` VALUES (21, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'KM45', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (22, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Coquimbo (Santa Isabel)', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (23, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Totoralillo', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (24, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Tongoy (Tambillo)', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (25, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Cruce Tongoy', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (26, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Quebrada Seca', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (27, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Cerrillos', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (28, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Socos', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (29, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'El Teniente', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (30, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Canela', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (31, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Mincha Norte', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (32, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Huentelauquén', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (33, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Los Vilos', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (34, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Quilimary', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (35, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Pichidangui', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (36, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Los Molles', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (37, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Guaquén', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (38, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'La Ballena', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (39, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Longotoma', NULL, NULL, 'stop', 4);
INSERT INTO `locations_busstop` VALUES (40, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Ovalle', NULL, NULL, 'terminal', 5);
INSERT INTO `locations_busstop` VALUES (41, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Pullally', NULL, NULL, 'stop', 5);
INSERT INTO `locations_busstop` VALUES (42, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'La Calera (Soporaval)', NULL, NULL, 'stop', 5);
INSERT INTO `locations_busstop` VALUES (43, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Hijuelas', NULL, NULL, 'stop', 5);
INSERT INTO `locations_busstop` VALUES (44, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Peaje Las Vegas', NULL, NULL, 'stop', 5);
INSERT INTO `locations_busstop` VALUES (45, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Cruce Llay Llay', NULL, NULL, 'stop', 5);
INSERT INTO `locations_busstop` VALUES (46, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Montenegro', NULL, NULL, 'stop', 5);
INSERT INTO `locations_busstop` VALUES (47, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Rungue (Norte)', NULL, NULL, 'stop', 5);
INSERT INTO `locations_busstop` VALUES (48, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Polpaico', NULL, NULL, 'stop', 5);
INSERT INTO `locations_busstop` VALUES (49, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'El Manzano', NULL, NULL, 'stop', 5);
INSERT INTO `locations_busstop` VALUES (50, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Lampa (Peaje)', NULL, NULL, 'stop', 5);
INSERT INTO `locations_busstop` VALUES (51, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Santiago - San Borja', NULL, NULL, 'terminal', 6);
INSERT INTO `locations_busstop` VALUES (52, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Sur', NULL, NULL, 'terminal', 6);
INSERT INTO `locations_busstop` VALUES (53, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Colón', NULL, NULL, 'stop', 6);
INSERT INTO `locations_busstop` VALUES (54, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Buin', NULL, NULL, 'stop', 6);
INSERT INTO `locations_busstop` VALUES (55, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Paine', NULL, NULL, 'stop', 6);
INSERT INTO `locations_busstop` VALUES (56, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Champa', NULL, NULL, 'stop', 6);
INSERT INTO `locations_busstop` VALUES (57, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Control Angostura', NULL, NULL, 'stop', 6);
INSERT INTO `locations_busstop` VALUES (58, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Monticello Grand Casino', NULL, NULL, 'stop', 6);
INSERT INTO `locations_busstop` VALUES (59, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Pasarela Monticello', NULL, NULL, 'stop', 6);
INSERT INTO `locations_busstop` VALUES (60, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Rancagua - O\'Higgins', NULL, NULL, 'terminal', 7);
INSERT INTO `locations_busstop` VALUES (61, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Los Lagartos', NULL, NULL, 'stop', 7);
INSERT INTO `locations_busstop` VALUES (62, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'San Francisco de Mostazal', NULL, NULL, 'stop', 7);
INSERT INTO `locations_busstop` VALUES (63, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Codegua', NULL, NULL, 'stop', 7);
INSERT INTO `locations_busstop` VALUES (64, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Graneros', NULL, NULL, 'stop', 7);
INSERT INTO `locations_busstop` VALUES (65, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Shopping', NULL, NULL, 'stop', 7);
INSERT INTO `locations_busstop` VALUES (66, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Los Alpes', NULL, NULL, 'stop', 7);
INSERT INTO `locations_busstop` VALUES (67, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Litueche', NULL, NULL, 'stop', 7);
INSERT INTO `locations_busstop` VALUES (68, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Pichilemu', NULL, NULL, 'terminal', 7);
INSERT INTO `locations_busstop` VALUES (69, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Pucón', NULL, NULL, 'terminal', 7);
INSERT INTO `locations_busstop` VALUES (70, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'San Fernando', NULL, NULL, 'terminal', 8);
INSERT INTO `locations_busstop` VALUES (71, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Gultro', NULL, NULL, 'stop', 8);
INSERT INTO `locations_busstop` VALUES (72, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Los Lirios', NULL, NULL, 'stop', 8);
INSERT INTO `locations_busstop` VALUES (73, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Requinoa', NULL, NULL, 'stop', 8);
INSERT INTO `locations_busstop` VALUES (74, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Rosario', NULL, NULL, 'stop', 8);
INSERT INTO `locations_busstop` VALUES (75, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Rengo', NULL, NULL, 'stop', 8);
INSERT INTO `locations_busstop` VALUES (76, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Pelequén', NULL, NULL, 'stop', 8);
INSERT INTO `locations_busstop` VALUES (77, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Santa Cruz', NULL, NULL, 'terminal', 9);
INSERT INTO `locations_busstop` VALUES (78, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Manantiales', NULL, NULL, 'stop', 9);
INSERT INTO `locations_busstop` VALUES (79, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Placilla', NULL, NULL, 'stop', 9);
INSERT INTO `locations_busstop` VALUES (80, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Nancagua 2da (feria)', NULL, NULL, 'stop', 9);
INSERT INTO `locations_busstop` VALUES (81, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Nancagua principal', NULL, NULL, 'stop', 9);
INSERT INTO `locations_busstop` VALUES (82, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Cunaco', NULL, NULL, 'stop', 9);
INSERT INTO `locations_busstop` VALUES (83, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'San gregorio', NULL, NULL, 'stop', 9);
INSERT INTO `locations_busstop` VALUES (84, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Paniahue', NULL, NULL, 'stop', 9);
INSERT INTO `locations_busstop` VALUES (85, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Hospital', NULL, NULL, 'stop', 9);
INSERT INTO `locations_busstop` VALUES (86, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Gonzalo Bulnes', NULL, NULL, 'stop', 9);
INSERT INTO `locations_busstop` VALUES (87, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Dónde Silva', NULL, NULL, 'stop', 9);
INSERT INTO `locations_busstop` VALUES (88, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Curicó', NULL, NULL, 'terminal', 10);
INSERT INTO `locations_busstop` VALUES (89, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Maggi', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (90, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Tinguiririca', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (91, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Chimbarongo', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (92, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Quinta', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (93, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'La Montaña', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (94, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Teno', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (95, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Sarmiento', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (96, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Romeral', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (97, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Soler', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (98, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Aguas Negras (Cruce)', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (99, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Paradero 10', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (100, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Paradero 9', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (101, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Paradero 7', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (102, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Paradero 6', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (103, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Merino/Alameda', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (104, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Paradero 5', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (105, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Paradero 1', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (106, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Mall', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (107, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Santa Marta', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (108, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Yungay', NULL, NULL, 'stop', 10);
INSERT INTO `locations_busstop` VALUES (109, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Temuco', NULL, NULL, 'terminal', 11);
INSERT INTO `locations_busstop` VALUES (110, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Victoria', NULL, NULL, 'stop', 11);
INSERT INTO `locations_busstop` VALUES (111, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Púa (Peaje)', NULL, NULL, 'stop', 11);
INSERT INTO `locations_busstop` VALUES (112, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Galvarino', NULL, NULL, 'stop', 11);
INSERT INTO `locations_busstop` VALUES (113, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Perquenco', NULL, NULL, 'stop', 11);
INSERT INTO `locations_busstop` VALUES (114, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Lautaro', NULL, NULL, 'stop', 11);
INSERT INTO `locations_busstop` VALUES (115, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Pillanlebún', NULL, NULL, 'stop', 11);
INSERT INTO `locations_busstop` VALUES (116, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Cajón', NULL, NULL, 'stop', 11);
INSERT INTO `locations_busstop` VALUES (117, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Collipulli', NULL, NULL, 'stop', 11);
INSERT INTO `locations_busstop` VALUES (118, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Valdivia', NULL, NULL, 'terminal', 12);
INSERT INTO `locations_busstop` VALUES (119, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Freire', NULL, NULL, 'stop', 12);
INSERT INTO `locations_busstop` VALUES (120, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Lanco', NULL, NULL, 'stop', 12);
INSERT INTO `locations_busstop` VALUES (121, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Pitrufquen', NULL, NULL, 'stop', 12);
INSERT INTO `locations_busstop` VALUES (122, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Ciruelos', NULL, NULL, 'stop', 12);
INSERT INTO `locations_busstop` VALUES (123, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Rotonda Mariquina', NULL, NULL, 'stop', 12);
INSERT INTO `locations_busstop` VALUES (124, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Aeropuerto Pichoy', NULL, NULL, 'stop', 12);
INSERT INTO `locations_busstop` VALUES (125, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Villa Callumapu', NULL, NULL, 'stop', 12);
INSERT INTO `locations_busstop` VALUES (126, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'El Arenal', NULL, NULL, 'stop', 12);
INSERT INTO `locations_busstop` VALUES (127, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Copec Rocura', NULL, NULL, 'stop', 12);
INSERT INTO `locations_busstop` VALUES (128, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'El Parque', NULL, NULL, 'stop', 12);
INSERT INTO `locations_busstop` VALUES (129, '2021-12-07 12:16:21.000000', '2021-12-07 12:16:21.000000', '', 'Guata Amarilla', NULL, NULL, 'stop', 12);
COMMIT;

-- ----------------------------
-- Table structure for locations_city
-- ----------------------------
DROP TABLE IF EXISTS `locations_city`;
CREATE TABLE `locations_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `region_id` bigint(20) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_city_region_id_785206de_fk_locations_region_id` (`region_id`),
  CONSTRAINT `locations_city_region_id_785206de_fk_locations_region_id` FOREIGN KEY (`region_id`) REFERENCES `locations_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of locations_city
-- ----------------------------
BEGIN;
INSERT INTO `locations_city` VALUES (1, '', 'Antofagasta', 1, 0);
INSERT INTO `locations_city` VALUES (2, '', 'Copiapo', 2, 0);
INSERT INTO `locations_city` VALUES (3, '', 'Vallenar', 2, 0);
INSERT INTO `locations_city` VALUES (4, '', 'La Serena', 3, 0);
INSERT INTO `locations_city` VALUES (5, '', 'Ovalle', 3, 0);
INSERT INTO `locations_city` VALUES (6, '', 'Santiago', 4, 0);
INSERT INTO `locations_city` VALUES (7, '', 'Rancagua', 5, 0);
INSERT INTO `locations_city` VALUES (8, '', 'San Fernando', 5, 0);
INSERT INTO `locations_city` VALUES (9, '', 'Santa Cruz', 5, 0);
INSERT INTO `locations_city` VALUES (10, '', 'Curicó', 6, 0);
INSERT INTO `locations_city` VALUES (11, '', 'Temuco', 7, 0);
INSERT INTO `locations_city` VALUES (12, '', 'Valdivia', 8, 0);
INSERT INTO `locations_city` VALUES (13, NULL, 'Pichilemu', 5, 0);
COMMIT;

-- ----------------------------
-- Table structure for locations_region
-- ----------------------------
DROP TABLE IF EXISTS `locations_region`;
CREATE TABLE `locations_region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `iso_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of locations_region
-- ----------------------------
BEGIN;
INSERT INTO `locations_region` VALUES (1, '', 'Antofagasta', 'CL-AN');
INSERT INTO `locations_region` VALUES (2, '', 'Atacama', 'CL-AT');
INSERT INTO `locations_region` VALUES (3, '', 'Coquimbo', 'CL-CO');
INSERT INTO `locations_region` VALUES (4, '', 'Metropolitana de Santiago', 'CL-RM');
INSERT INTO `locations_region` VALUES (5, '', 'Libertador General Bernardo O\'Higgins', 'CL-LI');
INSERT INTO `locations_region` VALUES (6, '', 'Maule', 'CL-ML');
INSERT INTO `locations_region` VALUES (7, '', 'Araucanía', 'CL-AR');
INSERT INTO `locations_region` VALUES (8, '', 'Los Rios', 'CL-LR');
INSERT INTO `locations_region` VALUES (9, '002n', '01Prueba', NULL);
COMMIT;

-- ----------------------------
-- Table structure for transportation_benefit
-- ----------------------------
DROP TABLE IF EXISTS `transportation_benefit`;
CREATE TABLE `transportation_benefit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transportation_benefit
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for transportation_bus
-- ----------------------------
DROP TABLE IF EXISTS `transportation_bus`;
CREATE TABLE `transportation_bus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `code` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `vehicle_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `kilometers` int(11) DEFAULT NULL,
  `motor_serial_number` varchar(50) DEFAULT NULL,
  `chassis_serial_number` varchar(50) DEFAULT NULL,
  `color` varchar(60) DEFAULT NULL,
  `year` smallint(5) unsigned DEFAULT NULL,
  `insurance_policy` varchar(50) DEFAULT NULL,
  `insurance_policy_end_date` date DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `layout_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transportation_bus_layout_id_ce6d66f4_fk_transport` (`layout_id`),
  CONSTRAINT `transportation_bus_layout_id_ce6d66f4_fk_transport` FOREIGN KEY (`layout_id`) REFERENCES `transportation_layout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transportation_bus
-- ----------------------------
BEGIN;
INSERT INTO `transportation_bus` VALUES (43, '2021-11-22 17:48:03.621047', '2021-12-28 17:29:31.007295', '123abc', 'Andimar', 1, 1, 'abcd34', 10, '1234', '1234', 'rojo', 2019, '1234', '2021-11-22', 'porshe', '911gtr3', 'Cristian', 1);
INSERT INTO `transportation_bus` VALUES (45, '2022-01-13 13:20:15.957560', '2022-01-13 13:20:15.957597', 'ABC-123', 'BusTest', 1, 1, 'ABC-123', 30, 'ABC-123-ABC-123', 'ABC-123-ABC-123', 'rojo', 2020, '1234', '2024-01-31', 'Ferrari', 'Chileno', 'Cristian', NULL);
INSERT INTO `transportation_bus` VALUES (75, '2022-01-18 14:22:23.011685', '2022-01-18 14:22:23.011712', '003', '01Prueba', 3, 1, 'prueba003', 170000, '12458736', 'asdf12345asdf', 'azul', 2020, NULL, '2023-07-31', 'mazda', 'bus0032020', 'Isra', NULL);
COMMIT;

-- ----------------------------
-- Table structure for transportation_bus_services
-- ----------------------------
DROP TABLE IF EXISTS `transportation_bus_services`;
CREATE TABLE `transportation_bus_services` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bus_id` bigint(20) NOT NULL,
  `benefit_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transportation_bus_services_bus_id_benefit_id_eb93e299_uniq` (`bus_id`,`benefit_id`),
  KEY `transportation_bus_s_benefit_id_f8644550_fk_transport` (`benefit_id`),
  CONSTRAINT `transportation_bus_s_benefit_id_f8644550_fk_transport` FOREIGN KEY (`benefit_id`) REFERENCES `transportation_benefit` (`id`),
  CONSTRAINT `transportation_bus_s_bus_id_9d745fe5_fk_transport` FOREIGN KEY (`bus_id`) REFERENCES `transportation_bus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transportation_bus_services
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for transportation_component
-- ----------------------------
DROP TABLE IF EXISTS `transportation_component`;
CREATE TABLE `transportation_component` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `position_x` smallint(5) unsigned NOT NULL,
  `position_y` smallint(5) unsigned NOT NULL,
  `width` smallint(5) unsigned NOT NULL,
  `length` smallint(5) unsigned NOT NULL,
  `kind` varchar(10) NOT NULL,
  `polymorphic_ctype_id` int(11) DEFAULT NULL,
  `floors_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transportation_compo_polymorphic_ctype_id_6cd7ef04_fk_django_co` (`polymorphic_ctype_id`),
  KEY `transportation_compo_floors_id_a97b421c_fk_transport` (`floors_id`),
  CONSTRAINT `transportation_compo_floors_id_a97b421c_fk_transport` FOREIGN KEY (`floors_id`) REFERENCES `transportation_floor` (`id`),
  CONSTRAINT `transportation_compo_polymorphic_ctype_id_6cd7ef04_fk_django_co` FOREIGN KEY (`polymorphic_ctype_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transportation_component
-- ----------------------------
BEGIN;
INSERT INTO `transportation_component` VALUES (1, 0, 0, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (2, 1, 0, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (3, 4, 0, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (4, 5, 0, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (5, 0, 2, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (6, 1, 2, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (7, 4, 2, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (8, 5, 2, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (9, 0, 4, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (10, 1, 4, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (11, 4, 4, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (12, 5, 4, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (13, 0, 6, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (14, 1, 6, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (15, 4, 6, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (16, 5, 6, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (17, 0, 8, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (18, 1, 8, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (19, 4, 8, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (20, 5, 8, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (21, 0, 10, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (22, 1, 10, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (23, 4, 10, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (24, 5, 10, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (25, 0, 12, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (26, 1, 12, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (27, 4, 12, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (28, 5, 12, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (29, 0, 14, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (30, 1, 14, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (31, 4, 14, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (32, 5, 14, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (33, 0, 16, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (34, 1, 16, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (35, 4, 16, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (36, 5, 16, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (37, 0, 18, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (38, 1, 18, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (39, 4, 18, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (40, 5, 18, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (41, 0, 20, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (42, 1, 20, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (43, 4, 20, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (44, 5, 20, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (45, 0, 22, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (46, 1, 22, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (47, 4, 22, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (48, 5, 22, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (49, 0, 24, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (50, 1, 24, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (51, 4, 22, 2, 1, 'seat', 14, 2);
INSERT INTO `transportation_component` VALUES (52, 5, 22, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (53, 0, 0, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (54, 1, 0, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (55, 5, 0, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (56, 0, 2, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (57, 1, 2, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (58, 5, 2, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (59, 0, 4, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (60, 1, 4, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (61, 1, 6, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (62, 5, 6, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (63, 0, 6, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (64, 5, 6, 2, 1, 'seat', 14, 1);
INSERT INTO `transportation_component` VALUES (65, 0, 0, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (66, 1, 0, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (67, 5, 0, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (68, 0, 2, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (69, 1, 2, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (70, 5, 2, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (71, 0, 4, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (72, 1, 4, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (73, 5, 4, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (74, 0, 6, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (75, 1, 6, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (76, 5, 6, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (77, 0, 8, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (78, 1, 8, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (79, 5, 8, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (80, 0, 10, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (81, 1, 10, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (82, 5, 10, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (83, 0, 12, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (84, 1, 12, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (85, 5, 12, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (86, 0, 14, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (87, 1, 14, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (88, 5, 14, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (89, 0, 16, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (90, 1, 16, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (91, 5, 16, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (92, 0, 18, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (93, 1, 18, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (94, 5, 18, 2, 1, 'seat', 14, 4);
INSERT INTO `transportation_component` VALUES (95, 0, 0, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (96, 1, 0, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (97, 5, 0, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (98, 0, 2, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (99, 1, 2, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (100, 5, 2, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (101, 0, 4, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (102, 1, 4, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (103, 5, 4, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (104, 0, 6, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (105, 1, 6, 2, 1, 'seat', 14, 3);
INSERT INTO `transportation_component` VALUES (106, 5, 6, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (107, 0, 0, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (108, 1, 0, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (109, 5, 0, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (110, 5, 2, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (111, 5, 4, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (112, 0, 2, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (113, 1, 2, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (114, 0, 4, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (115, 1, 4, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (116, 0, 6, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (117, 1, 6, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (118, 5, 6, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (119, 0, 8, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (120, 1, 8, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (121, 5, 8, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (122, 0, 10, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (123, 1, 10, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (124, 5, 10, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (125, 0, 12, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (126, 1, 12, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (127, 5, 12, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (128, 0, 14, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (129, 1, 14, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (130, 5, 14, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (131, 0, 16, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (132, 1, 16, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (133, 5, 16, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (134, 0, 18, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (135, 1, 18, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (136, 5, 18, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (137, 0, 20, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (138, 1, 20, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (139, 5, 20, 2, 1, 'seat', 14, 6);
INSERT INTO `transportation_component` VALUES (140, 0, 0, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (141, 1, 0, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (142, 5, 0, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (143, 0, 2, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (144, 1, 2, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (145, 5, 2, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (146, 0, 4, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (147, 1, 4, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (148, 5, 4, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (149, 0, 6, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (150, 1, 6, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (151, 5, 6, 2, 1, 'seat', 14, 5);
INSERT INTO `transportation_component` VALUES (155, 1, 1, 1, 1, 'seat', 14, NULL);
COMMIT;

-- ----------------------------
-- Table structure for transportation_floor
-- ----------------------------
DROP TABLE IF EXISTS `transportation_floor`;
CREATE TABLE `transportation_floor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` smallint(5) unsigned NOT NULL,
  `length` smallint(5) unsigned NOT NULL,
  `width` smallint(5) unsigned NOT NULL,
  `seats` smallint(5) unsigned NOT NULL,
  `layout_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transportation_floor_layout_id_643be067_fk_transport` (`layout_id`),
  CONSTRAINT `transportation_floor_layout_id_643be067_fk_transport` FOREIGN KEY (`layout_id`) REFERENCES `transportation_layout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transportation_floor
-- ----------------------------
BEGIN;
INSERT INTO `transportation_floor` VALUES (1, 1, 0, 0, 12, 1);
INSERT INTO `transportation_floor` VALUES (2, 2, 0, 0, 48, 1);
INSERT INTO `transportation_floor` VALUES (3, 1, 0, 0, 12, 2);
INSERT INTO `transportation_floor` VALUES (4, 2, 0, 0, 31, 2);
INSERT INTO `transportation_floor` VALUES (5, 1, 0, 0, 12, 3);
INSERT INTO `transportation_floor` VALUES (6, 2, 0, 0, 30, 3);
INSERT INTO `transportation_floor` VALUES (7, 2, 2, 4, 36, 3);
COMMIT;

-- ----------------------------
-- Table structure for transportation_layout
-- ----------------------------
DROP TABLE IF EXISTS `transportation_layout`;
CREATE TABLE `transportation_layout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `name` varchar(40) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transportation_layout
-- ----------------------------
BEGIN;
INSERT INTO `transportation_layout` VALUES (1, '2021-11-10 09:52:26.000000', '2021-11-10 09:52:35.000000', 'Mixto 60 Asientos', '2+2, Mixto,Activo, Video (60 Asientos.) ');
INSERT INTO `transportation_layout` VALUES (2, '2021-11-10 09:52:26.000000', '2021-11-10 09:52:35.000000', 'Cama 42', '2+1, Salon Cama,Activo, Video (42 Asientos.) ');
INSERT INTO `transportation_layout` VALUES (3, '2021-11-10 09:52:26.000000', '2021-11-10 09:52:35.000000', 'Bus Cama 43', '2+2, Salon Cama,Activo, Video (43 Asientos.)');
INSERT INTO `transportation_layout` VALUES (5, '2021-12-28 02:36:39.590360', '2021-12-28 02:36:39.590384', 'cama 42', 'asdfgadasfa');
COMMIT;

-- ----------------------------
-- Table structure for transportation_seat
-- ----------------------------
DROP TABLE IF EXISTS `transportation_seat`;
CREATE TABLE `transportation_seat` (
  `component_ptr_id` bigint(20) NOT NULL,
  `seat_kind_id` bigint(20) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`component_ptr_id`),
  KEY `transportation_seat_seat_kind_id_5278f33d_fk_transport` (`seat_kind_id`),
  CONSTRAINT `transportation_seat_component_ptr_id_760d51e5_fk_transport` FOREIGN KEY (`component_ptr_id`) REFERENCES `transportation_component` (`id`),
  CONSTRAINT `transportation_seat_seat_kind_id_5278f33d_fk_transport` FOREIGN KEY (`seat_kind_id`) REFERENCES `transportation_seattype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transportation_seat
-- ----------------------------
BEGIN;
INSERT INTO `transportation_seat` VALUES (1, 1, '1');
INSERT INTO `transportation_seat` VALUES (2, 1, '2');
INSERT INTO `transportation_seat` VALUES (3, 1, '3');
INSERT INTO `transportation_seat` VALUES (4, 1, '4');
INSERT INTO `transportation_seat` VALUES (5, 1, '5');
INSERT INTO `transportation_seat` VALUES (6, 1, '6');
INSERT INTO `transportation_seat` VALUES (7, 1, '7');
INSERT INTO `transportation_seat` VALUES (8, 1, '8');
INSERT INTO `transportation_seat` VALUES (9, 1, '9');
INSERT INTO `transportation_seat` VALUES (10, 1, '10');
INSERT INTO `transportation_seat` VALUES (11, 1, '11');
INSERT INTO `transportation_seat` VALUES (12, 1, '12');
INSERT INTO `transportation_seat` VALUES (13, 1, '13');
INSERT INTO `transportation_seat` VALUES (14, 1, '14');
INSERT INTO `transportation_seat` VALUES (15, 1, '15');
INSERT INTO `transportation_seat` VALUES (16, 1, '16');
INSERT INTO `transportation_seat` VALUES (17, 1, '17');
INSERT INTO `transportation_seat` VALUES (18, 1, '18');
INSERT INTO `transportation_seat` VALUES (19, 1, '19');
INSERT INTO `transportation_seat` VALUES (20, 1, '20');
INSERT INTO `transportation_seat` VALUES (21, 1, '21');
INSERT INTO `transportation_seat` VALUES (22, 1, '22');
INSERT INTO `transportation_seat` VALUES (23, 1, '23');
INSERT INTO `transportation_seat` VALUES (24, 1, '24');
INSERT INTO `transportation_seat` VALUES (25, 1, '25');
INSERT INTO `transportation_seat` VALUES (26, 1, '26');
INSERT INTO `transportation_seat` VALUES (27, 1, '27');
INSERT INTO `transportation_seat` VALUES (28, 1, '28');
INSERT INTO `transportation_seat` VALUES (29, 1, '29');
INSERT INTO `transportation_seat` VALUES (30, 1, '30');
INSERT INTO `transportation_seat` VALUES (31, 1, '31');
INSERT INTO `transportation_seat` VALUES (32, 1, '32');
INSERT INTO `transportation_seat` VALUES (33, 1, '33');
INSERT INTO `transportation_seat` VALUES (34, 1, '34');
INSERT INTO `transportation_seat` VALUES (35, 1, '35');
INSERT INTO `transportation_seat` VALUES (36, 1, '36');
INSERT INTO `transportation_seat` VALUES (37, 1, '37');
INSERT INTO `transportation_seat` VALUES (38, 1, '38');
INSERT INTO `transportation_seat` VALUES (39, 1, '39');
INSERT INTO `transportation_seat` VALUES (40, 1, '40');
INSERT INTO `transportation_seat` VALUES (41, 1, '41');
INSERT INTO `transportation_seat` VALUES (42, 1, '42');
INSERT INTO `transportation_seat` VALUES (43, 1, '43');
INSERT INTO `transportation_seat` VALUES (44, 1, '44');
INSERT INTO `transportation_seat` VALUES (45, 1, '45');
INSERT INTO `transportation_seat` VALUES (46, 1, '46');
INSERT INTO `transportation_seat` VALUES (47, 1, '47');
INSERT INTO `transportation_seat` VALUES (48, 1, '48');
INSERT INTO `transportation_seat` VALUES (49, 1, '49');
INSERT INTO `transportation_seat` VALUES (50, 1, '50');
INSERT INTO `transportation_seat` VALUES (51, 1, '51');
INSERT INTO `transportation_seat` VALUES (52, 1, '52');
INSERT INTO `transportation_seat` VALUES (53, 1, '53');
INSERT INTO `transportation_seat` VALUES (54, 1, '54');
INSERT INTO `transportation_seat` VALUES (55, 1, '55');
INSERT INTO `transportation_seat` VALUES (56, 1, '56');
INSERT INTO `transportation_seat` VALUES (57, 1, '57');
INSERT INTO `transportation_seat` VALUES (58, 1, '58');
INSERT INTO `transportation_seat` VALUES (59, 1, '59');
INSERT INTO `transportation_seat` VALUES (60, 1, '60');
INSERT INTO `transportation_seat` VALUES (61, 1, '61');
INSERT INTO `transportation_seat` VALUES (62, 1, '62');
INSERT INTO `transportation_seat` VALUES (63, 1, '63');
INSERT INTO `transportation_seat` VALUES (64, 1, '64');
INSERT INTO `transportation_seat` VALUES (65, 1, '1');
INSERT INTO `transportation_seat` VALUES (66, 1, '2');
INSERT INTO `transportation_seat` VALUES (67, 1, '3');
INSERT INTO `transportation_seat` VALUES (68, 1, '4');
INSERT INTO `transportation_seat` VALUES (69, 1, '5');
INSERT INTO `transportation_seat` VALUES (70, 1, '6');
INSERT INTO `transportation_seat` VALUES (71, 1, '7');
INSERT INTO `transportation_seat` VALUES (72, 1, '8');
INSERT INTO `transportation_seat` VALUES (73, 1, '9');
INSERT INTO `transportation_seat` VALUES (74, 1, '10');
INSERT INTO `transportation_seat` VALUES (75, 1, '11');
INSERT INTO `transportation_seat` VALUES (76, 1, '12');
INSERT INTO `transportation_seat` VALUES (77, 1, '13');
INSERT INTO `transportation_seat` VALUES (78, 1, '14');
INSERT INTO `transportation_seat` VALUES (79, 1, '15');
INSERT INTO `transportation_seat` VALUES (80, 1, '16');
INSERT INTO `transportation_seat` VALUES (81, 1, '17');
INSERT INTO `transportation_seat` VALUES (82, 1, '18');
INSERT INTO `transportation_seat` VALUES (83, 1, '19');
INSERT INTO `transportation_seat` VALUES (84, 1, '20');
INSERT INTO `transportation_seat` VALUES (85, 1, '21');
INSERT INTO `transportation_seat` VALUES (86, 1, '22');
INSERT INTO `transportation_seat` VALUES (87, 1, '23');
INSERT INTO `transportation_seat` VALUES (88, 1, '24');
INSERT INTO `transportation_seat` VALUES (89, 1, '25');
INSERT INTO `transportation_seat` VALUES (90, 1, '26');
INSERT INTO `transportation_seat` VALUES (91, 1, '27');
INSERT INTO `transportation_seat` VALUES (92, 1, '28');
INSERT INTO `transportation_seat` VALUES (93, 1, '29');
INSERT INTO `transportation_seat` VALUES (94, 1, '30');
INSERT INTO `transportation_seat` VALUES (95, 1, '31');
INSERT INTO `transportation_seat` VALUES (96, 1, '32');
INSERT INTO `transportation_seat` VALUES (97, 1, '33');
INSERT INTO `transportation_seat` VALUES (98, 1, '34');
INSERT INTO `transportation_seat` VALUES (99, 1, '35');
INSERT INTO `transportation_seat` VALUES (100, 1, '36');
INSERT INTO `transportation_seat` VALUES (101, 1, '37');
INSERT INTO `transportation_seat` VALUES (102, 1, '38');
INSERT INTO `transportation_seat` VALUES (103, 1, '39');
INSERT INTO `transportation_seat` VALUES (104, 1, '40');
INSERT INTO `transportation_seat` VALUES (105, 1, '41');
INSERT INTO `transportation_seat` VALUES (106, 1, '42');
INSERT INTO `transportation_seat` VALUES (107, 1, '1');
INSERT INTO `transportation_seat` VALUES (108, 1, '2');
INSERT INTO `transportation_seat` VALUES (109, 1, '3');
INSERT INTO `transportation_seat` VALUES (110, 1, '4');
INSERT INTO `transportation_seat` VALUES (111, 1, '5');
INSERT INTO `transportation_seat` VALUES (112, 1, '6');
INSERT INTO `transportation_seat` VALUES (113, 1, '7');
INSERT INTO `transportation_seat` VALUES (114, 1, '8');
INSERT INTO `transportation_seat` VALUES (115, 1, '9');
INSERT INTO `transportation_seat` VALUES (116, 1, '10');
INSERT INTO `transportation_seat` VALUES (117, 1, '11');
INSERT INTO `transportation_seat` VALUES (118, 1, '12');
INSERT INTO `transportation_seat` VALUES (119, 1, '13');
INSERT INTO `transportation_seat` VALUES (120, 1, '14');
INSERT INTO `transportation_seat` VALUES (121, 1, '15');
INSERT INTO `transportation_seat` VALUES (122, 1, '16');
INSERT INTO `transportation_seat` VALUES (123, 1, '17');
INSERT INTO `transportation_seat` VALUES (124, 1, '18');
INSERT INTO `transportation_seat` VALUES (125, 1, '19');
INSERT INTO `transportation_seat` VALUES (126, 1, '20');
INSERT INTO `transportation_seat` VALUES (127, 1, '21');
INSERT INTO `transportation_seat` VALUES (128, 1, '22');
INSERT INTO `transportation_seat` VALUES (129, 1, '23');
INSERT INTO `transportation_seat` VALUES (130, 1, '24');
INSERT INTO `transportation_seat` VALUES (131, 1, '25');
INSERT INTO `transportation_seat` VALUES (132, 1, '26');
INSERT INTO `transportation_seat` VALUES (133, 1, '27');
INSERT INTO `transportation_seat` VALUES (134, 1, '28');
INSERT INTO `transportation_seat` VALUES (135, 1, '29');
INSERT INTO `transportation_seat` VALUES (136, 1, '30');
INSERT INTO `transportation_seat` VALUES (137, 1, '31');
INSERT INTO `transportation_seat` VALUES (138, 1, '32');
INSERT INTO `transportation_seat` VALUES (139, 1, '33');
INSERT INTO `transportation_seat` VALUES (140, 1, '1');
INSERT INTO `transportation_seat` VALUES (141, 1, '2');
INSERT INTO `transportation_seat` VALUES (142, 1, '3');
INSERT INTO `transportation_seat` VALUES (143, 1, '4');
INSERT INTO `transportation_seat` VALUES (144, 1, '5');
INSERT INTO `transportation_seat` VALUES (145, 1, '6');
INSERT INTO `transportation_seat` VALUES (146, 1, '7');
INSERT INTO `transportation_seat` VALUES (147, 1, '8');
INSERT INTO `transportation_seat` VALUES (148, 1, '9');
INSERT INTO `transportation_seat` VALUES (149, 1, '10');
INSERT INTO `transportation_seat` VALUES (150, 1, '11');
INSERT INTO `transportation_seat` VALUES (151, 1, '12');
INSERT INTO `transportation_seat` VALUES (155, 4, '001');
COMMIT;

-- ----------------------------
-- Table structure for transportation_seattype
-- ----------------------------
DROP TABLE IF EXISTS `transportation_seattype`;
CREATE TABLE `transportation_seattype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transportation_seattype
-- ----------------------------
BEGIN;
INSERT INTO `transportation_seattype` VALUES (1, 'Normal');
INSERT INTO `transportation_seattype` VALUES (2, 'Semi cama');
INSERT INTO `transportation_seattype` VALUES (3, 'Cama');
INSERT INTO `transportation_seattype` VALUES (4, 'Asiento conductor');
INSERT INTO `transportation_seattype` VALUES (5, 'Asiento para personas con capacidades diferentes');
COMMIT;

-- ----------------------------
-- Table structure for users_customuser
-- ----------------------------
DROP TABLE IF EXISTS `users_customuser`;
CREATE TABLE `users_customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `maternal_last_name` varchar(70) NOT NULL,
  `document_number` varchar(12) NOT NULL,
  `cellphone` varchar(15) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `sex` varchar(1) NOT NULL,
  `work_address` varchar(120) DEFAULT NULL,
  `work_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users_customuser
-- ----------------------------
BEGIN;
INSERT INTO `users_customuser` VALUES (1, 'pbkdf2_sha256$320000$L6w0qMbal16r0lqEHke4uH$rPEy3Cg0U0oxZaugvVgSM+hArToUanQZRE/eBv+VLto=', '2022-02-28 14:57:33.443292', 1, 'ignacio', 'Ignacio', 'Figueroa', 'jfigueroa@linets.cl', 1, 1, '2021-11-12 12:29:28.000000', 'Figueroa', '123123123', '123123123', NULL, '', NULL, 'M', NULL, NULL);
INSERT INTO `users_customuser` VALUES (2, 'pbkdf2_sha256$320000$tMdMeD9AC1CuCoNAOLudbD$O2HnrNL7Bd1L+pAATgLsOYdxfRbF8N6HKOtxUxpwi9g=', '2022-02-14 15:58:54.000000', 1, 'israel', 'Israel', 'Castro', 'israel@linets.cl', 1, 1, '2021-11-12 12:30:21.000000', 'Ortega', '124124124', '124124124', NULL, '', NULL, 'M', NULL, NULL);
INSERT INTO `users_customuser` VALUES (3, 'pbkdf2_sha256$260000$hzbhhsXfbTQzklJBOmwPpi$GoL6HMFyZf/yPxAB7y0uLo4qUsBGtZik/4Af+Gx1y/4=', NULL, 1, 'margaret', 'Margaret', 'Comene', 'margaret@linets.cl', 1, 1, '2021-11-12 12:31:31.165582', 'Comene', '125125125', '125125125', NULL, '', NULL, '', NULL, NULL);
INSERT INTO `users_customuser` VALUES (4, 'pbkdf2_sha256$320000$yDXPvUEhEKMwZhYdGYz4AD$Kqd3AqtgtNEu+f6Ey9j2hPbp0bzgfhijah4xUjmnUTY=', '2021-12-26 23:18:23.359295', 1, 'admin', 'Admin', 'Admin', 'admin@linets.cl', 1, 1, '2021-11-12 12:33:05.811597', 'Admin', '122122122', '122122122', NULL, '', NULL, '', NULL, NULL);
INSERT INTO `users_customuser` VALUES (35, 'pbkdf2_sha256$260000$uWVripF3laMgb4GuF4TnGn$V0URRGBRFY1h25ptY48pqChUIZQG3jX/tkAlXFcl+KQ=', NULL, 1, 'rmontevilla', 'Rosemary', 'Montevilla', '1234@gmail.com', 1, 1, '2021-11-18 12:23:27.406506', 'Tancara', '3721161', '987322068', '987322068', '', 'string', 'F', 'string', 'string');
INSERT INTO `users_customuser` VALUES (40, 'pbkdf2_sha256$260000$NPzM0I7xSmQHOW6hRY5578$ubOqV6DjCaj+46rp3xbazPv1At0nWCv5ifPgmGMDTJw=', NULL, 1, 'Csepulveda', 'Cristian', 'Sepulveda', 'elmaildelcris@gmail.com', 1, 1, '2021-11-22 17:31:01.473211', 'Valenzuela', '13.082.622-9', '987322068', '987322068', '', 'string', 'M', 'string', 'string');
INSERT INTO `users_customuser` VALUES (47, 'pbkdf2_sha256$260000$BchbZnkf2lh4NaUzgHLqWx$mLBuxoRyz64vtfrhl0zohQAmcvV80hdJR19b4j93Cvc=', NULL, 1, 'cris', 'cristian', 'sepúlveda', 'cserv@gmail.com', 1, 1, '2021-11-30 14:35:40.244466', 'val', '130826229', '987654342', '29866542', '', 'string', 'M', 'string', 'string');
INSERT INTO `users_customuser` VALUES (49, 'pbkdf2_sha256$260000$uaNgsFkg65kcxAEp2W2eJ0$KPQ7jN817o2H2aJ1LHw8GFYjdqXBgWG7LUl4TjAJ/ko=', NULL, 1, 'Jfigueroa', 'Ignacio', 'Figueroa', 'Jfigueroa@linets.cl', 1, 1, '2021-12-01 14:13:13.748440', 'zuñiga', '19.186.509-k', '987322068', '987322068', '', 'string', 'M', 'string', 'string');
INSERT INTO `users_customuser` VALUES (50, 'pbkdf2_sha256$260000$saGVxqvojF8ExqNM5r4BHZ$0g9un4maQuDmE34UdeZPjKjKJG/1h6PaqV7rF3NnkDI=', NULL, 1, 'SSarabia', 'Sara', 'Sarabia', '1234566@andimar.cl', 1, 1, '2021-12-01 19:12:15.816357', 'Caceres', '5.697.913-1', '987322068', '987322068', '', 'string', 'F', 'string', 'string');
INSERT INTO `users_customuser` VALUES (51, 'pbkdf2_sha256$260000$G7Sn9PNLzipyEAGqQEYmEV$PpXxZooua+RG72VvUbhQrVhxPSeoLURCZn6z/5NUHsQ=', NULL, 1, 'Acancino', 'Alfredo', 'Cancino', 'Acancino@andimar.cl', 1, 1, '2021-12-02 10:14:35.802326', 'Vargas', '19.238.278-5', '987322068', '987322068', '', 'string', 'M', 'string', 'string');
INSERT INTO `users_customuser` VALUES (52, 'pbkdf2_sha256$320000$2411cPeVEbpw8GKdPzJO4l$ts4LBknA1APE/ZHZqOmAqWL82dzvsvbtYEH32dIqYaI=', NULL, 1, 'icastro', 'israel', 'castro', 'icastro@linets.cl', 1, 1, '2021-12-02 11:33:11.000000', 'ortega', '18.695.756-3', '987322068', '987322068', '', 'string', 'M', 'string', 'string');
INSERT INTO `users_customuser` VALUES (53, 'pbkdf2_sha256$260000$EECQPTgyHeYjqyYGCY7DIM$ahkS3F4o22y2LUNs5F+x93AMBJDH9Az3CgK6WaA5P4M=', '2022-02-07 10:37:56.483745', 1, 'carlo', 'Carlo', 'Alva', 'candre@linets.cl', 1, 1, '2021-12-10 10:17:32.896606', 'Cohello', '71313909', '987199629', NULL, '', NULL, '', NULL, NULL);
INSERT INTO `users_customuser` VALUES (54, 'pbkdf2_sha256$260000$mNjAnxBQJ2IpjjJzmGCw1O$NrS344rtaCvxwJh8sBjeTVQJMYdOSIJ50evR4M1uXgE=', NULL, 1, 'ea', 'mollit ad dolore', 'ex adipisicing', 'NZSNqaKODuR-ANO@fzldounscsimuycpdzvhcmcxpotunp.ys', 1, 1, '2021-12-15 11:22:17.963933', 'dolor labore dol', 'consequat', '999999', 'labore', '', 'pariatur mollit', 'M', 'cupidatat culpa et cillum in', 'ut');
INSERT INTO `users_customuser` VALUES (55, 'pbkdf2_sha256$260000$PzGW9W886M6igUCHTDvUOg$8Y/yTdmONjIk6QHNiGmq1+vk2LZEWoBz2K2VqWwC2EE=', NULL, 1, 'DICE', 'mollit ad dolore', 'ex adipisicing', 'a@a.com', 1, 1, '2021-12-15 11:23:34.933176', 'dolor labore dol', 'qqqqqqq', '999999', 'labore', '', 'pariatur mollit', 'M', 'cupidatat culpa et cillum in', 'ut');
INSERT INTO `users_customuser` VALUES (56, 'pbkdf2_sha256$260000$wIh9bTLApekI8C9MItDgV2$N0UPuBI/Tnz0s7Qg5C+xzeLZqYnSQUnPGrTik/bZRKI=', NULL, 1, 'Ross', 'Ross', '223dsffs', 'rmontevilla@linets.cl', 1, 1, '2021-12-23 09:20:55.052614', '123Montevilla', '11.111.111-1', '2344444rdddd', '234fds', '', 'string', 'F', 'string', 'string');
INSERT INTO `users_customuser` VALUES (57, 'pbkdf2_sha256$260000$WqUW7JGT4sQmkBKt9ESe5N$AHpKiyw5WESZecgu1Id9HtjF21frAdstIkK7z+Z+um0=', NULL, 0, 'test', '', '', '', 0, 1, '2022-01-03 16:33:40.760189', '', '', '', NULL, '', NULL, '', NULL, NULL);
INSERT INTO `users_customuser` VALUES (58, 'pbkdf2_sha256$260000$tUMlGDwc7swNZdsAKi3Y9y$I8RteVJbqXPXPUqgjE12o3Kl1zVVQmn3ro2sMAbh8No=', NULL, 1, 'JPerez', 'Juan Pablo', 'Perez', 'JPerez@linets.cl', 1, 1, '2022-01-13 13:43:26.687207', 'Gonzalez', '1.497.064-9', '987322068', '987322068', '', 'string', 'F', 'string', 'string');
INSERT INTO `users_customuser` VALUES (60, 'pbkdf2_sha256$260000$lnjGuJPCb82AVNGf6fdy7e$48r3qIHSoyKMWHrlnMM4O+ZeOfgWIy0BycjfAUw29wo=', NULL, 1, 'Pcavieres', 'Paula', 'Cavieres', 'Pcavieres@linets.cl', 1, 1, '2022-01-14 11:16:55.816902', 'perez', '18.396.234-5', '987322068', '987322068', '', 'string', 'F', 'string', 'string');
INSERT INTO `users_customuser` VALUES (61, 'pbkdf2_sha256$320000$rSoyRTgWoLuIiAjDEFdRrO$SOMDsuI7ywg308rxhbZAzlAy827EG5LYldq7uMGQ3XE=', NULL, 0, 'rosemary', 'RoseMary', 'Montevilla', 'rosemary@linets.cl', 1, 1, '2022-02-23 10:13:37.000000', 'Montevilla', '5.697.913-2', '987199629', NULL, '', NULL, 'F', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for users_customuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_customuser_groups`;
CREATE TABLE `users_customuser_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users_customuser_groups
-- ----------------------------
BEGIN;
INSERT INTO `users_customuser_groups` VALUES (20, 2, 1);
INSERT INTO `users_customuser_groups` VALUES (16, 40, 1);
INSERT INTO `users_customuser_groups` VALUES (6, 49, 1);
INSERT INTO `users_customuser_groups` VALUES (7, 50, 1);
INSERT INTO `users_customuser_groups` VALUES (8, 51, 1);
INSERT INTO `users_customuser_groups` VALUES (19, 52, 1);
INSERT INTO `users_customuser_groups` VALUES (11, 54, 1);
INSERT INTO `users_customuser_groups` VALUES (12, 55, 1);
INSERT INTO `users_customuser_groups` VALUES (14, 56, 1);
INSERT INTO `users_customuser_groups` VALUES (15, 58, 1);
INSERT INTO `users_customuser_groups` VALUES (18, 60, 1);
INSERT INTO `users_customuser_groups` VALUES (21, 61, 1);
COMMIT;

-- ----------------------------
-- Table structure for users_customuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_customuser_user_permissions`;
CREATE TABLE `users_customuser_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users_customuser_user_permissions
-- ----------------------------
BEGIN;
INSERT INTO `users_customuser_user_permissions` VALUES (86, 2, 1);
INSERT INTO `users_customuser_user_permissions` VALUES (18, 35, 1);
INSERT INTO `users_customuser_user_permissions` VALUES (63, 40, 1);
INSERT INTO `users_customuser_user_permissions` VALUES (72, 47, 1);
INSERT INTO `users_customuser_user_permissions` VALUES (77, 49, 1);
INSERT INTO `users_customuser_user_permissions` VALUES (82, 52, 1);
INSERT INTO `users_customuser_user_permissions` VALUES (78, 54, 1);
INSERT INTO `users_customuser_user_permissions` VALUES (80, 55, 1);
INSERT INTO `users_customuser_user_permissions` VALUES (84, 56, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
