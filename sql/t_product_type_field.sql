/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : portal

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 04/12/2024 17:54:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_product_type_field
-- ----------------------------
DROP TABLE IF EXISTS `t_product_type_field`;
CREATE TABLE `t_product_type_field`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_type_id` int(11) NOT NULL COMMENT '产品类型ID',
  `field_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名称',
  `field_alias` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段别名',
  `sort` int(5) NOT NULL COMMENT '排序',
  `is_filter` tinyint(1) NOT NULL COMMENT '是否筛选',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
