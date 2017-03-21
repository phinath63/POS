/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : posdb

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-03-21 18:47:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_code` varchar(20) NOT NULL,
  `product_name` varchar(128) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('3', '001', 'Dashani');
INSERT INTO `product` VALUES ('4', '002', 'Vital');
INSERT INTO `product` VALUES ('5', '003', 'Erotech');
INSERT INTO `product` VALUES ('6', '004', 'Angkor Puro');
INSERT INTO `product` VALUES ('7', '005', 'OISHI');
INSERT INTO `product` VALUES ('8', '006', 'Mentos');
INSERT INTO `product` VALUES ('9', '007', 'Zenya');
INSERT INTO `product` VALUES ('10', '008', 'Coca Cola');
INSERT INTO `product` VALUES ('11', '009', 'Red Bull');
INSERT INTO `product` VALUES ('12', '010', 'Milk');
INSERT INTO `product` VALUES ('13', '011', 'Aquarius');

-- ----------------------------
-- Table structure for product_mapping
-- ----------------------------
DROP TABLE IF EXISTS `product_mapping`;
CREATE TABLE `product_mapping` (
  `product_map_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `scale_id` int(10) unsigned NOT NULL,
  `map_dependancy_id` int(10) unsigned DEFAULT NULL,
  `scale_quantity` int(11) DEFAULT NULL,
  `scale_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_map_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_mapping
-- ----------------------------
INSERT INTO `product_mapping` VALUES ('3', 'P001', '3', '3', '0', '0', '0.25');
INSERT INTO `product_mapping` VALUES ('4', 'P002', '4', '3', '0', '0', '0.20');
INSERT INTO `product_mapping` VALUES ('5', 'P003', '5', '3', '0', '0', '0.30');
INSERT INTO `product_mapping` VALUES ('6', 'P004', '6', '3', '0', '0', '0.22');
INSERT INTO `product_mapping` VALUES ('7', 'P005', '7', '3', '0', '0', '1.50');
INSERT INTO `product_mapping` VALUES ('8', 'P006', '8', '2', '0', '0', '1.00');
INSERT INTO `product_mapping` VALUES ('9', 'P007', '9', '3', '0', '0', '1.25');
INSERT INTO `product_mapping` VALUES ('10', 'P008', '10', '3', '0', '0', '0.80');
INSERT INTO `product_mapping` VALUES ('11', 'P009', '11', '3', '0', '0', '1.00');
INSERT INTO `product_mapping` VALUES ('12', 'P010', '12', '3', '0', '0', '0.55');
INSERT INTO `product_mapping` VALUES ('13', 'P011', '3', '1', '3', '24', '5.00');

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `sale_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value_date` date NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES ('15', '2017-03-21', '1');

-- ----------------------------
-- Table structure for sale_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_detail`;
CREATE TABLE `sale_detail` (
  `sale_id` bigint(20) unsigned NOT NULL,
  `product_mapping_id` bigint(20) unsigned NOT NULL,
  `sale_quantity` int(11) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale_detail
-- ----------------------------
INSERT INTO `sale_detail` VALUES ('15', '3', '2', '0.25');
INSERT INTO `sale_detail` VALUES ('15', '4', '1', '0.20');
INSERT INTO `sale_detail` VALUES ('15', '5', '1', '0.30');
INSERT INTO `sale_detail` VALUES ('15', '6', '1', '0.22');
INSERT INTO `sale_detail` VALUES ('15', '7', '1', '1.50');
INSERT INTO `sale_detail` VALUES ('15', '8', '1', '1.00');
INSERT INTO `sale_detail` VALUES ('15', '9', '1', '1.25');
INSERT INTO `sale_detail` VALUES ('15', '10', '1', '0.80');
INSERT INTO `sale_detail` VALUES ('15', '11', '1', '1.00');
INSERT INTO `sale_detail` VALUES ('15', '12', '1', '0.55');

-- ----------------------------
-- Table structure for scale
-- ----------------------------
DROP TABLE IF EXISTS `scale`;
CREATE TABLE `scale` (
  `scale_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scale_type` varchar(128) NOT NULL,
  PRIMARY KEY (`scale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scale
-- ----------------------------
INSERT INTO `scale` VALUES ('1', 'Box');
INSERT INTO `scale` VALUES ('2', 'Package');
INSERT INTO `scale` VALUES ('3', 'Bottle');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- View structure for product_detail
-- ----------------------------
DROP VIEW IF EXISTS `product_detail`;
CREATE VIEW `product_detail` AS SELECT 
pm.product_map_id,
pm.`code`,
p.product_id,p.product_code,p.product_name,
s.scale_id,s.scale_type,pm.map_dependancy_id,s1.scale_type dependancy_type,
pm.scale_quantity,pm.scale_price
FROM product_mapping pm
LEFT JOIN product p on pm.product_id=p.product_id
LEFT JOIN scale s on pm.scale_id=s.scale_id
LEFT JOIN scale s1 on pm.map_dependancy_id=s1.scale_id ;

-- ----------------------------
-- View structure for sale_report
-- ----------------------------
DROP VIEW IF EXISTS `sale_report`;
CREATE  VIEW `sale_report` AS SELECT s.sale_id,s.value_date,s.user_id,
sd.product_mapping_id,sd.sale_price,sd.sale_quantity,
prd.*
FROM sale s
LEFT JOIN sale_detail sd ON s.sale_id=sd.sale_id
LEFT JOIN product_detail prd on sd.product_mapping_id=prd.product_map_id ;
SET FOREIGN_KEY_CHECKS=1;
