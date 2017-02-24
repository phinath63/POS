/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : posdb

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-02-24 09:59:36
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for product_mapping
-- ----------------------------
DROP TABLE IF EXISTS `product_mapping`;
CREATE TABLE `product_mapping` (
  `product_map_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `scale_id` int(10) unsigned NOT NULL,
  `map_dependancy_id` int(10) unsigned NOT NULL,
  `scale_quantity` int(11) NOT NULL,
  `scale_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale` (
  `sale_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value_date` date NOT NULL,
  `sale_by` varchar(255) NOT NULL,
  PRIMARY KEY (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sale
-- ----------------------------

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

-- ----------------------------
-- Table structure for scale
-- ----------------------------
DROP TABLE IF EXISTS `scale`;
CREATE TABLE `scale` (
  `scale_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scale_type` varchar(128) NOT NULL,
  PRIMARY KEY (`scale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scale
-- ----------------------------
INSERT INTO `scale` VALUES ('1', 'Box');
INSERT INTO `scale` VALUES ('2', 'Package');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
