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

 Date: 03/12/2024 17:28:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_enterprise_info
-- ----------------------------
DROP TABLE IF EXISTS `t_enterprise_info`;
CREATE TABLE `t_enterprise_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位名称',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位地址',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `fax` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传真',
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人',
  `business_qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务QQ',
  `wechat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微信号',
  `zip_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮编',
  `icp_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站备案号',
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站地址',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站信息\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_enterprise_info
-- ----------------------------
INSERT INTO `t_enterprise_info` VALUES (1, 'ABC Corporation', '123 Main St, Anytown USA', '555-1234', '555-5678', 'info@abccorp.com', '555-9012', 'John Smith', '12345678', 'johnsmith', '12345', 'ICP12345', 'www.abccorp.com', 'Leading technology company', '0', '', NULL, '', NULL);
INSERT INTO `t_enterprise_info` VALUES (2, 'XYZ Inc', '456 Oak Rd, Someplace CA', '555-2222', '555-3333', 'contact@xyzinc.com', '555-4444', 'Jane Doe', '87654321', 'janedoe', '54321', 'ICP54321', 'www.xyzinc.com', 'Expanding manufacturing business', '0', '', NULL, '', NULL);
INSERT INTO `t_enterprise_info` VALUES (3, 'Green Solutions LLC', '789 Pine Ave, Othertown OR', '555-5555', '555-6666', 'office@greensolutions.com', '555-7777', 'Michael Johnson', '13579086', 'michaelj', '67890', 'ICP67890', 'www.greensolutions.com', 'Sustainable energy consultants', '0', '', NULL, '', NULL);
INSERT INTO `t_enterprise_info` VALUES (4, 'Blue Sky Enterprises', '321 Maple Blvd, Somewhere WA', '555-8888', '555-9999', 'info@blueskyenterprises.com', '555-0000', 'Emily Davis', '24680135', 'emilyd', '98765', 'ICP98765', 'www.blueskyenterprises.com', 'Growing software company', '0', '', NULL, '', NULL);
INSERT INTO `t_enterprise_info` VALUES (5, 'Acme Manufacturing', '159 Cedar St, Anyplace TX', '555-1111', '555-2222', 'contact@acmemanufacturing.com', '555-3333', 'David Lee', '57913842', 'davidlee', '11223', 'ICP11223', 'www.acmemanufacturing.com', 'Established industrial manufacturer', '0', '', NULL, '', NULL);

SET FOREIGN_KEY_CHECKS = 1;
