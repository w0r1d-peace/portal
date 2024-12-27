/*
 Navicat Premium Data Transfer

 Source Server         : 113.45.139.88
 Source Server Type    : MySQL
 Source Server Version : 80040
 Source Host           : 113.45.139.88:3306
 Source Schema         : portal

 Target Server Type    : MySQL
 Target Server Version : 80040
 File Encoding         : 65001

 Date: 27/12/2024 17:26:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 't_feedback', '留言反馈', NULL, NULL, 'Feedback', 'crud', 'element-ui', 'com.ruoyi.business', 'business', 'feedback', '留言反馈', 'tangJM.', '0', '/', '{}', 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33', NULL);
INSERT INTO `gen_table` VALUES (2, 't_news_information', '新闻资讯表', NULL, NULL, 'NewsInformation', 'crud', 'element-ui', 'com.ruoyi.business', 'business', 'information', '新闻资讯', 'tangJM.', '0', '/', '{}', 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:09:45', NULL);
INSERT INTO `gen_table` VALUES (3, 't_solution_design', '方案设计表', NULL, NULL, 'SolutionDesign', 'crud', 'element-ui', 'com.ruoyi.business', 'system', 'design', '方案设计', 'tangJM.', '0', '/', '{}', 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21', NULL);
INSERT INTO `gen_table` VALUES (4, 't_product_category', '产品种类表', NULL, NULL, 'ProductCategory', 'crud', 'element-ui', 'com.ruoyi.business', 'business', 'category', '产品种类', 'tangJM.', '0', '/', '{}', 'admin', '2024-12-27 14:13:35', '', '2024-12-27 14:14:05', NULL);
INSERT INTO `gen_table` VALUES (5, 't_product_categort_field', '产品种类字段配置表', NULL, NULL, 'ProductCategortField', 'crud', 'element-ui', 'com.ruoyi.business', 'business', 'field', '产品种类字段配置', 'tangJM.', '0', '/', '{}', 'admin', '2024-12-27 14:31:01', '', '2024-12-27 14:31:55', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '主键', 'bigint(20)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (2, 1, 'name', '姓名', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (3, 1, 'mobile', '手机号码', 'varchar(20)', 'String', 'mobile', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (4, 1, 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (5, 1, 'company', '公司', 'varchar(255)', 'String', 'company', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (6, 1, 'city', '城市', 'varchar(255)', 'String', 'city', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (7, 1, 'demand_scenario', '需求场景', 'varchar(255)', 'String', 'demandScenario', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (8, 1, 'message_content', '留言内容\n', 'text', 'String', 'messageContent', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 8, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (9, 1, 'status', '状态 1.待处理 2.已处理', 'tinyint(1)', 'Integer', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (10, 1, 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (11, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (12, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (13, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (14, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-12-17 17:13:12', '', '2024-12-17 17:13:33');
INSERT INTO `gen_table_column` VALUES (15, 2, 'id', '新闻ID，唯一标识', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (16, 2, 'title', '新闻标题', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (17, 2, 'category', '新闻类别，例如：行业新闻、公司新闻', 'varchar(100)', 'String', 'category', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (18, 2, 'publish_time', '新闻发布时间', 'datetime', 'Date', 'publishTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (19, 2, 'source', '新闻来源，例如：南韩两大半导体厂', 'varchar(255)', 'String', 'source', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (20, 2, 'content', '新闻内容，保存详细描述', 'text', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 6, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (22, 2, 'keywords', '关键词，用于新闻搜索与索引', 'varchar(255)', 'String', 'keywords', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (23, 2, 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (24, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (25, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (26, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (27, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2024-12-18 16:09:23', '', '2024-12-18 16:24:25');
INSERT INTO `gen_table_column` VALUES (28, 2, 'image_file_id', '图片文件ID', 'int(11)', 'Long', 'imageFileId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, '', '2024-12-18 16:24:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, 3, 'id', '新闻ID，唯一标识', 'int(11)', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21');
INSERT INTO `gen_table_column` VALUES (30, 3, 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21');
INSERT INTO `gen_table_column` VALUES (31, 3, 'publish_time', '发布时间', 'datetime', 'Date', 'publishTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21');
INSERT INTO `gen_table_column` VALUES (32, 3, 'content', '内容', 'text', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21');
INSERT INTO `gen_table_column` VALUES (33, 3, 'image_file_id', '图片文件ID', 'int(11)', 'Long', 'imageFileId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21');
INSERT INTO `gen_table_column` VALUES (34, 3, 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21');
INSERT INTO `gen_table_column` VALUES (35, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21');
INSERT INTO `gen_table_column` VALUES (36, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21');
INSERT INTO `gen_table_column` VALUES (37, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21');
INSERT INTO `gen_table_column` VALUES (38, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-12-18 16:45:42', '', '2024-12-18 16:46:21');
INSERT INTO `gen_table_column` VALUES (39, 4, 'id', '主键', 'bigint', 'Long', 'id', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-12-27 14:13:35', '', '2024-12-27 14:14:05');
INSERT INTO `gen_table_column` VALUES (40, 4, 'product_id', '种类ID', 'bigint', 'Long', 'productId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-12-27 14:13:35', '', '2024-12-27 14:14:05');
INSERT INTO `gen_table_column` VALUES (41, 4, 'name', '种类名称', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-12-27 14:13:35', '', '2024-12-27 14:14:05');
INSERT INTO `gen_table_column` VALUES (42, 4, 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2024-12-27 14:13:35', '', '2024-12-27 14:14:05');
INSERT INTO `gen_table_column` VALUES (43, 4, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-12-27 14:13:35', '', '2024-12-27 14:14:05');
INSERT INTO `gen_table_column` VALUES (44, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-12-27 14:13:35', '', '2024-12-27 14:14:05');
INSERT INTO `gen_table_column` VALUES (45, 4, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-12-27 14:13:36', '', '2024-12-27 14:14:05');
INSERT INTO `gen_table_column` VALUES (46, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-12-27 14:13:36', '', '2024-12-27 14:14:05');
INSERT INTO `gen_table_column` VALUES (47, 5, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-12-27 14:31:01', '', '2024-12-27 14:31:55');
INSERT INTO `gen_table_column` VALUES (48, 5, 'product_category_id', '种类ID', 'bigint', 'Long', 'productCategoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-12-27 14:31:02', '', '2024-12-27 14:31:55');
INSERT INTO `gen_table_column` VALUES (49, 5, 'field_name', '字段名称', 'varchar(32)', 'String', 'fieldName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-12-27 14:31:02', '', '2024-12-27 14:31:55');
INSERT INTO `gen_table_column` VALUES (50, 5, 'sort', '排序', 'int', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-12-27 14:31:02', '', '2024-12-27 14:31:55');
INSERT INTO `gen_table_column` VALUES (51, 5, 'is_filter', '是否筛选', 'tinyint(1)', 'Integer', 'isFilter', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-12-27 14:31:02', '', '2024-12-27 14:31:55');
INSERT INTO `gen_table_column` VALUES (52, 5, 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-12-27 14:31:02', '', '2024-12-27 14:31:55');
INSERT INTO `gen_table_column` VALUES (53, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-12-27 14:31:02', '', '2024-12-27 14:31:55');
INSERT INTO `gen_table_column` VALUES (54, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-12-27 14:31:02', '', '2024-12-27 14:31:55');
INSERT INTO `gen_table_column` VALUES (55, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-12-27 14:31:02', '', '2024-12-27 14:31:55');
INSERT INTO `gen_table_column` VALUES (56, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-12-27 14:31:02', '', '2024-12-27 14:31:55');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-12-17 15:53:34', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-12-17 15:53:34', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-12-17 15:53:34', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-12-17 15:53:34', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-12-17 15:53:34', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-12-17 15:53:34', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-12-17 15:53:34', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-12-17 15:54:01');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-17 15:54:04');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-17 17:12:31');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-17 17:46:37');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-12-18 15:34:18');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-18 15:34:21');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '113.116.237.244', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-12-20 02:21:06');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '121.35.1.123', 'XX XX', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2024-12-21 00:50:19');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '121.35.1.123', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-12-21 00:50:22');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '121.35.1.123', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-12-21 01:28:50');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '121.35.1.123', 'XX XX', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2024-12-21 04:45:45');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '121.35.1.123', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-12-21 04:45:49');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '121.35.1.123', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-21 14:10:28');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '121.35.1.123', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-21 17:08:19');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '121.35.1.123', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-21 21:09:43');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '121.35.1.123', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-21 22:16:51');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '121.35.1.123', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-22 00:20:30');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '121.35.1.123', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-22 01:45:40');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '121.35.1.123', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-22 02:30:41');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '121.35.1.123', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-22 04:22:36');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '121.35.0.63', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-22 05:51:18');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '121.35.0.63', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-22 15:06:21');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '121.35.0.63', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-23 02:41:40');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '121.35.0.63', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-23 22:02:29');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '121.35.0.63', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-23 22:34:06');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '121.35.0.63', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-24 00:40:34');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '208.86.32.59', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-25 00:07:09');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '113.90.130.212', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-25 00:37:03');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '208.86.32.59', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-25 00:53:23');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '208.86.32.59', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-25 15:56:12');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '208.86.32.59', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-25 17:03:14');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '113.108.77.60', 'XX XX', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2024-12-25 17:05:01');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '113.108.77.60', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-25 17:05:04');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '160.16.209.77', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-25 17:30:29');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '208.86.32.59', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-25 18:07:01');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '208.86.32.59', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-25 18:08:04');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '208.86.32.59', 'XX XX', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2024-12-25 18:08:05');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '113.90.130.212', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-25 20:38:03');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '27.38.212.162', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-26 15:35:50');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '27.38.212.162', 'XX XX', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2024-12-26 15:44:58');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '27.38.212.162', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-26 15:45:01');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '113.108.77.59', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-26 15:49:24');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '27.38.212.162', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-26 16:33:21');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '113.90.133.56', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-27 01:52:29');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '183.237.225.210', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-27 11:08:53');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-27 11:28:16');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '27.38.212.162', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-27 12:45:59');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-27 13:44:05');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '27.38.212.162', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-27 14:10:43');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2024-12-27 15:08:46');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-12-17 15:53:34', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-12-17 15:53:34', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-12-17 15:53:34', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-12-17 15:53:34', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-12-17 15:53:34', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-12-17 15:53:34', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-12-17 15:53:34', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-12-17 15:53:34', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-12-17 15:53:34', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-12-17 15:53:34', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-12-17 15:53:34', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-12-17 15:53:34', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-12-17 15:53:34', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-12-17 15:53:34', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-12-17 15:53:34', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-12-17 15:53:34', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-12-17 15:53:34', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-12-17 15:53:34', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-12-17 15:53:34', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-12-17 15:53:34', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-12-17 15:53:34', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-12-17 15:53:34', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-12-17 15:53:34', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-12-17 15:53:34', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-12-17 15:53:34', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-12-17 15:53:34', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-12-17 15:53:34', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_feedback\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-17 17:13:12', 107);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"feedback\",\"className\":\"Feedback\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-17 17:13:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-17 17:13:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Mobile\",\"columnComment\":\"手机号码\",\"columnId\":3,\"columnName\":\"mobile\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-17 17:13:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"mobile\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Email\",\"columnComment\":\"邮箱\",\"columnId\":4,\"columnName\":\"email\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-17 17:13:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"email\",\"javaType\":\"String', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-17 17:13:33', 61);
INSERT INTO `sys_oper_log` VALUES (102, '修改网站信息', 2, 'com.ruoyi.web.controller.business.EnterpriseInfoController.edit()', 'POST', 1, 'admin', '研发部门', '/business/info/edit', '127.0.0.1', '内网IP', '{\"address\":\"123 Main St, Anytown USA\",\"businessQq\":\"12345678\",\"contactPerson\":\"John Smith\",\"createBy\":\"admin\",\"createTime\":\"2024-12-17 17:47:42\",\"email\":\"info@abccorp.com\",\"fax\":\"555-9012\",\"icpNumber\":\"ICP12345\",\"id\":6,\"mobile\":\"555-5678\",\"name\":\"ABC Corporation\",\"params\":{},\"phone\":\"555-1234\",\"website\":\"www.abccorp.com\",\"wechat\":\"johnsmith\",\"zipCode\":\"12345\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-17 17:47:42', 20);
INSERT INTO `sys_oper_log` VALUES (103, '修改网站信息', 2, 'com.ruoyi.web.controller.business.EnterpriseInfoController.edit()', 'POST', 1, 'admin', '研发部门', '/business/info/edit', '127.0.0.1', '内网IP', '{\"address\":\"123 Main St, Anytown USA\",\"businessQq\":\"12345678\",\"contactPerson\":\"John Smith\",\"email\":\"info@abccorp.com\",\"fax\":\"555-9012\",\"icpNumber\":\"ICP12345\",\"id\":6,\"mobile\":\"555-5678\",\"name\":\"ABC Corporation222\",\"params\":{},\"phone\":\"555-1234\",\"updateBy\":\"admin\",\"updateTime\":\"2024-12-17 17:48:05\",\"website\":\"www.abccorp.com\",\"wechat\":\"johnsmith\",\"zipCode\":\"12345\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-17 17:48:05', 8);
INSERT INTO `sys_oper_log` VALUES (104, '修改网站信息', 2, 'com.ruoyi.web.controller.business.EnterpriseInfoController.edit()', 'POST', 1, 'admin', '研发部门', '/business/info/edit', '127.0.0.1', '内网IP', '{\"address\":\"123 Main St, Anytown USA\",\"businessQq\":\"12345678\",\"contactPerson\":\"John Smith\",\"email\":\"info@abccorp.com\",\"fax\":\"555-9012\",\"icpNumber\":\"ICP12345\",\"id\":6,\"mobile\":\"555-5678\",\"name\":\"ABC Corporation\",\"params\":{},\"phone\":\"555-1234\",\"updateBy\":\"admin\",\"updateTime\":\"2024-12-17 17:48:14\",\"website\":\"www.abccorp.com\",\"wechat\":\"johnsmith\",\"zipCode\":\"12345\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-17 17:48:14', 7);
INSERT INTO `sys_oper_log` VALUES (105, '新增留言反馈', 1, 'com.ruoyi.web.controller.business.FeedbackController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/feedback/add', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"company\":\"腾讯科技\",\"email\":\"zhangsan@example.com\",\"mobile\":\"13800138000\",\"name\":\"张三\",\"params\":{}}', NULL, 1, '留言内容不能为空', '2024-12-18 15:51:14', 11);
INSERT INTO `sys_oper_log` VALUES (106, '新增留言反馈', 1, 'com.ruoyi.web.controller.business.FeedbackController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/feedback/add', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"company\":\"腾讯科技\",\"createTime\":\"2024-12-18 15:51:26\",\"demandScenario\":\"网站开发\",\"email\":\"zhangsan@example.com\",\"messageContent\":\"希望开发一套企业门户网站\",\"mobile\":\"13800138000\",\"name\":\"张三\",\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\r\n### The error may exist in file [D:\\my project\\portal\\ruoyi-business\\target\\classes\\mapper\\business\\FeedbackMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.FeedbackMapper.insertFeedback-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_feedback          ( name,             mobile,             email,             company,             city,             demand_scenario,             message_content,                                                    create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ? )\r\n### Cause: java.sql.SQLException: Field \'status\' doesn\'t have a default value\n; Field \'status\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'status\' doesn\'t have a default value', '2024-12-18 15:51:26', 74);
INSERT INTO `sys_oper_log` VALUES (107, '新增留言反馈', 1, 'com.ruoyi.web.controller.business.FeedbackController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/feedback/add', '127.0.0.1', '内网IP', '{\"city\":\"北京\",\"company\":\"腾讯科技\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 15:53:19\",\"demandScenario\":\"网站开发\",\"email\":\"zhangsan@example.com\",\"id\":3,\"messageContent\":\"希望开发一套企业门户网站\",\"mobile\":\"13800138000\",\"name\":\"张三\",\"params\":{},\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 15:53:19', 40);
INSERT INTO `sys_oper_log` VALUES (108, '新增留言反馈', 1, 'com.ruoyi.web.controller.business.FeedbackController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/feedback/add', '127.0.0.1', '内网IP', '{\"city\":\"杭州\",\"company\":\"阿里巴巴\",\"email\":\"lisi@example.com\",\"mobile\":\"13900139000\",\"name\":\"李四\",\"params\":{}}', NULL, 1, '留言内容不能为空', '2024-12-18 15:53:31', 1);
INSERT INTO `sys_oper_log` VALUES (109, '新增留言反馈', 1, 'com.ruoyi.web.controller.business.FeedbackController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/feedback/add', '127.0.0.1', '内网IP', '{\"city\":\"杭州\",\"company\":\"阿里巴巴\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 15:53:38\",\"demandScenario\":\"电商平台\",\"email\":\"lisi@example.com\",\"id\":4,\"messageContent\":\"需要搭建一个电商平台，请提供报价\",\"mobile\":\"13900139000\",\"name\":\"李四\",\"params\":{},\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 15:53:38', 6);
INSERT INTO `sys_oper_log` VALUES (110, '新增留言反馈', 1, 'com.ruoyi.web.controller.business.FeedbackController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/feedback/add', '127.0.0.1', '内网IP', '{\"city\":\"上海\",\"company\":\"百度搜索\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 15:53:48\",\"demandScenario\":\"搜索引擎优化\",\"email\":\"wangwu@example.com\",\"id\":5,\"messageContent\":\"优化企业关键词排名，提升流量\",\"mobile\":\"13600136000\",\"name\":\"王五\",\"params\":{},\"status\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 15:53:48', 6);
INSERT INTO `sys_oper_log` VALUES (111, '删除留言反馈', 3, 'com.ruoyi.web.controller.business.FeedbackController.remove()', 'POST', 1, 'admin', '研发部门', '/business/feedback/remove', '127.0.0.1', '内网IP', '{\"idList\":[5]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 15:54:57', 17);
INSERT INTO `sys_oper_log` VALUES (112, '更新状态', 2, 'com.ruoyi.web.controller.business.FeedbackController.updateStatus()', 'POST', 1, 'admin', '研发部门', '/business/feedback/updateStatus', '127.0.0.1', '内网IP', '{\"id\":4,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 15:55:36', 6);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_news_information\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:09:23', 127);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"information\",\"className\":\"NewsInformation\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"新闻ID，唯一标识\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:09:23\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"新闻标题\",\"columnId\":16,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:09:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"新闻类别，例如：行业新闻、公司新闻\",\"columnId\":17,\"columnName\":\"category\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:09:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PublishTime\",\"columnComment\":\"新闻发布时间\",\"columnId\":18,\"columnName\":\"publish_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:09:23\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:09:45', 62);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_news_information\"}', NULL, 0, NULL, '2024-12-18 16:09:49', 232);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/t_news_information', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:24:25', 133);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_news_information\"}', NULL, 0, NULL, '2024-12-18 16:24:27', 284);
INSERT INTO `sys_oper_log` VALUES (118, '新增新闻资讯', 1, 'com.ruoyi.web.controller.business.NewsInformationController.add()', 'POST', 1, 'admin', '研发部门', '/business/information/add', '127.0.0.1', '内网IP', '{\"category\":\"行业新闻\",\"content\":\"南韩两大半导体厂 Samsung与SK Hynix 共同投资2000亿美元，显示韩国厂商在全球记忆体市场所面临的竞争与影响力挑战...\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:26:39\",\"id\":1,\"imageFileId\":\"1\",\"keywords\":\"存储器, 半导体, 全球产业版图, 韩厂, Samsung\",\"params\":{},\"publishTime\":\"2023-08-06\",\"source\":\"南韩两大半导体厂 Samsung与SK Hynix\",\"title\":\"大陆存储器产业崛起将改变全球产业版图 韩厂备感威胁\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:26:39', 48);
INSERT INTO `sys_oper_log` VALUES (119, '新增新闻资讯', 1, 'com.ruoyi.web.controller.business.NewsInformationController.add()', 'POST', 1, 'admin', '研发部门', '/business/information/add', '127.0.0.1', '内网IP', '{\"category\":\"科技分析\",\"content\":\"LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:27:13\",\"id\":2,\"imageFileId\":\"2\",\"keywords\":\"LED电视, OLED电视, 技术差异, 市场趋势, 分析\",\"params\":{},\"publishTime\":\"2023-08-10\",\"source\":\"TechInsights 分析报告\",\"title\":\"LED电视与OLED电视：技术差异与市场趋势分析\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:27:13', 7);
INSERT INTO `sys_oper_log` VALUES (120, '修改新闻资讯', 2, 'com.ruoyi.web.controller.business.NewsInformationController.edit()', 'POST', 1, 'admin', '研发部门', '/business/information/edit', '127.0.0.1', '内网IP', '{\"category\":\"科技分析\",\"content\":\"LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...\",\"id\":2,\"imageFileId\":\"2\",\"keywords\":\"LED电视, OLED电视, 技术差异, 市场趋势, 分析\",\"params\":{},\"publishTime\":\"2023-08-10\",\"source\":\"TechInsights 分析报告\",\"title\":\"LED电视与OLED电视：技术差异与市场趋势分析22\",\"updateBy\":\"admin\",\"updateTime\":\"2024-12-18 16:28:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:28:04', 8);
INSERT INTO `sys_oper_log` VALUES (121, '删除新闻资讯', 3, 'com.ruoyi.web.controller.business.NewsInformationController.remove()', 'POST', 1, 'admin', '研发部门', '/business/information/remove', '127.0.0.1', '内网IP', '{\"idList\":[2]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:28:25', 12);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_solution_design\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:45:42', 114);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_solution_design\"}', NULL, 0, NULL, '2024-12-18 16:45:47', 281);
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"design\",\"className\":\"SolutionDesign\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"新闻ID，唯一标识\",\"columnId\":29,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:45:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":30,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:45:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PublishTime\",\"columnComment\":\"发布时间\",\"columnId\":31,\"columnName\":\"publish_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:45:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"publishTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Content\",\"columnComment\":\"内容\",\"columnId\":32,\"columnName\":\"content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:45:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:46:21', 51);
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_solution_design\"}', NULL, 0, NULL, '2024-12-18 16:46:24', 115);
INSERT INTO `sys_oper_log` VALUES (126, '新增方案设计', 1, 'com.ruoyi.web.controller.business.SolutionDesignController.add()', 'POST', 1, 'admin', '研发部门', '/business/design/add', '127.0.0.1', '内网IP', '{\"content\":\"LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:55:02\",\"id\":3,\"imageFileId\":2,\"params\":{},\"publishTime\":\"2023-08-10\",\"title\":\"LED电视与OLED电视：技术差异与市场趋势分析\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:55:02', 38);
INSERT INTO `sys_oper_log` VALUES (127, '新增方案设计', 1, 'com.ruoyi.web.controller.business.SolutionDesignController.add()', 'POST', 1, 'admin', '研发部门', '/business/design/add', '127.0.0.1', '内网IP', '{\"content\":\"LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...\",\"createBy\":\"admin\",\"createTime\":\"2024-12-18 16:55:08\",\"id\":4,\"imageFileId\":2,\"params\":{},\"publishTime\":\"2023-08-10\",\"title\":\"LED电视与OLED电视：技术差异与市场趋势分析\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:55:08', 7);
INSERT INTO `sys_oper_log` VALUES (128, '编辑方案设计', 2, 'com.ruoyi.web.controller.business.SolutionDesignController.edit()', 'POST', 1, 'admin', '研发部门', '/business/design/edit', '127.0.0.1', '内网IP', '{\"content\":\"LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...\",\"id\":2,\"imageFileId\":2,\"params\":{},\"publishTime\":\"2023-08-10\",\"title\":\"LED电视与OLED电视：技术差异与市场趋势分析22\",\"updateBy\":\"admin\",\"updateTime\":\"2024-12-18 16:55:33\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-12-18 16:55:33', 7);
INSERT INTO `sys_oper_log` VALUES (129, '编辑方案设计', 2, 'com.ruoyi.web.controller.business.SolutionDesignController.edit()', 'POST', 1, 'admin', '研发部门', '/business/design/edit', '127.0.0.1', '内网IP', '{\"content\":\"LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...\",\"id\":2,\"imageFileId\":2,\"params\":{},\"publishTime\":\"2023-08-10\",\"title\":\"LED电视与OLED电视：技术差异与市场趋势分析22\",\"updateBy\":\"admin\",\"updateTime\":\"2024-12-18 16:55:53\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-12-18 16:55:53', 3);
INSERT INTO `sys_oper_log` VALUES (130, '编辑方案设计', 2, 'com.ruoyi.web.controller.business.SolutionDesignController.edit()', 'POST', 1, 'admin', '研发部门', '/business/design/edit', '127.0.0.1', '内网IP', '{\"content\":\"LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...\",\"id\":2,\"imageFileId\":2,\"params\":{},\"publishTime\":\"2023-08-10\",\"title\":\"LED电视与OLED电视：技术差异与市场趋势分析22\",\"updateBy\":\"admin\",\"updateTime\":\"2024-12-18 16:56:32\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-12-18 16:56:36', 6757);
INSERT INTO `sys_oper_log` VALUES (131, '编辑方案设计', 2, 'com.ruoyi.web.controller.business.SolutionDesignController.edit()', 'POST', 1, 'admin', '研发部门', '/business/design/edit', '127.0.0.1', '内网IP', '{\"content\":\"LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...\",\"id\":4,\"imageFileId\":2,\"params\":{},\"publishTime\":\"2023-08-10\",\"title\":\"LED电视与OLED电视：技术差异与市场趋势分析22\",\"updateBy\":\"admin\",\"updateTime\":\"2024-12-18 16:57:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:57:02', 3101);
INSERT INTO `sys_oper_log` VALUES (132, '删除新闻资讯', 3, 'com.ruoyi.web.controller.business.NewsInformationController.remove()', 'POST', 1, 'admin', '研发部门', '/business/information/remove', '127.0.0.1', '内网IP', '{\"idList\":[4]}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-12-18 16:57:16', 14);
INSERT INTO `sys_oper_log` VALUES (133, '删除方案设计', 3, 'com.ruoyi.web.controller.business.SolutionDesignController.remove()', 'POST', 1, 'admin', '研发部门', '/business/design/remove', '127.0.0.1', '内网IP', '{\"idList\":[4]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-18 16:57:40', 6);
INSERT INTO `sys_oper_log` VALUES (134, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '121.35.1.123', 'XX XX', '{\"fieldName\":\"test\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:27:19', 454);
INSERT INTO `sys_oper_log` VALUES (135, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '121.35.1.123', 'XX XX', '{\"fieldName\":\"test\",\"productId\":\"\",\"isFilter\":\"1\",\"id\":\"10\",\"sort\":\"6\"}', NULL, 1, '产品ID不能为空', '2024-12-21 05:28:57', 0);
INSERT INTO `sys_oper_log` VALUES (136, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '121.35.1.123', 'XX XX', '{\"fieldName\":\"test\",\"productId\":\"1\",\"isFilter\":\"1\",\"id\":\"10\",\"sort\":\"7\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:30:47', 10);
INSERT INTO `sys_oper_log` VALUES (137, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '121.35.1.123', 'XX XX', '{\"fieldName\":\"test\",\"productId\":\"1\",\"isFilter\":\"1\",\"id\":\"10\",\"sort\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:33:18', 11);
INSERT INTO `sys_oper_log` VALUES (138, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '121.35.1.123', 'XX XX', '{\"fieldName\":\"test\",\"productId\":\"1\",\"isFilter\":\"1\",\"id\":\"10\",\"sort\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:33:36', 9);
INSERT INTO `sys_oper_log` VALUES (139, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '121.35.1.123', 'XX XX', '{\"fieldName\":\"测试222\",\"productId\":\"1\",\"isFilter\":\"0\",\"sort\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:35:00', 47);
INSERT INTO `sys_oper_log` VALUES (140, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '121.35.1.123', 'XX XX', '{\"fieldName\":\"测试2223\",\"productId\":\"1\",\"isFilter\":\"0\",\"id\":\"11\",\"sort\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:36:02', 9);
INSERT INTO `sys_oper_log` VALUES (141, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '121.35.1.123', 'XX XX', '{\"fieldName\":\"测试22238\",\"productId\":\"1\",\"isFilter\":\"0\",\"id\":\"11\",\"sort\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:36:17', 10);
INSERT INTO `sys_oper_log` VALUES (142, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '121.35.1.123', 'XX XX', '{\"fieldName\":\"测试22231\",\"productId\":\"1\",\"isFilter\":\"0\",\"id\":\"11\",\"sort\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:37:04', 12);
INSERT INTO `sys_oper_log` VALUES (143, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '121.35.1.123', 'XX XX', '{\"fieldName\":\"测试222311\",\"productId\":\"1\",\"isFilter\":\"0\",\"id\":\"11\",\"sort\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:37:13', 12);
INSERT INTO `sys_oper_log` VALUES (144, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '121.35.1.123', 'XX XX', '{\"fieldName\":\"测试2223111\",\"productId\":\"1\",\"isFilter\":\"0\",\"id\":\"11\",\"sort\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:37:51', 10);
INSERT INTO `sys_oper_log` VALUES (145, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '121.35.1.123', 'XX XX', '{\"fieldName\":\"测试222311122\",\"productId\":\"1\",\"isFilter\":\"0\",\"id\":\"11\",\"sort\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:38:43', 11);
INSERT INTO `sys_oper_log` VALUES (146, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '121.35.1.123', 'XX XX', '{\"fieldName\":\"123\",\"productId\":\"10\",\"isFilter\":\"1\",\"sort\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-21 05:41:08', 50);
INSERT INTO `sys_oper_log` VALUES (147, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '121.35.0.63', 'XX XX', '{\"productId\":\"10\",\"column_name_12\":\"测试\",\"isFilter\":\"NaN\",\"modelNumber\":\"测试\",\"isInStock\":\"true\",\"isNew\":\"true\",\"category\":\"测试\",\"packet\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-22 05:24:48', 49);
INSERT INTO `sys_oper_log` VALUES (148, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '121.35.0.63', 'XX XX', '{\"createBy\":\"admin\",\"productId\":\"10\",\"createTime\":\"2024-12-22T05:24:48\",\"isFilter\":\"0\",\"column_name_12\":\"2333333\",\"modelNumber\":\"2333333\",\"isInStock\":\"true\",\"isNew\":\"true\",\"category\":\"2333333\",\"packet\":\"2333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-22 05:25:59', 11);
INSERT INTO `sys_oper_log` VALUES (149, '修改产品型号', 2, 'com.ruoyi.web.controller.business.ProductModelController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/edit', '121.35.0.63', 'XX XX', '{\"createBy\":\"admin\",\"productId\":\"10\",\"createTime\":\"2024-12-22T05:25:59\",\"isFilter\":\"0\",\"column_name_12\":\"2333333\",\"modelNumber\":\"2333333\",\"id\":\"7\",\"isInStock\":\"1\",\"isNew\":\"1\",\"category\":\"2333333\",\"packet\":\"2333333\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-22 05:30:33', 19);
INSERT INTO `sys_oper_log` VALUES (150, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '121.35.0.63', 'XX XX', '{\"createBy\":\"admin\",\"productId\":\"10\",\"createTime\":\"2024-12-22T05:25:59\",\"isFilter\":\"0\",\"column_name_12\":\"sdsdd\",\"modelNumber\":\"sdsdd\",\"isInStock\":\"1\",\"isNew\":\"1\",\"category\":\"sdsdd\",\"packet\":\"sdsdd\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-22 05:31:16', 10);
INSERT INTO `sys_oper_log` VALUES (151, '修改产品型号', 2, 'com.ruoyi.web.controller.business.ProductModelController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/edit', '121.35.0.63', 'XX XX', '{\"createBy\":\"admin\",\"productId\":\"10\",\"createTime\":\"2024-12-22T05:31:16\",\"isFilter\":\"0\",\"column_name_12\":\"sdsdd\",\"modelNumber\":\"sdsdd\",\"id\":\"8\",\"isInStock\":\"true\",\"isNew\":\"false\",\"category\":\"sdsdd\",\"packet\":\"sdsdd\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-22 05:32:16', 12);
INSERT INTO `sys_oper_log` VALUES (152, '修改产品型号', 2, 'com.ruoyi.web.controller.business.ProductModelController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/edit', '121.35.0.63', 'XX XX', '{\"createBy\":\"admin\",\"productId\":\"10\",\"createTime\":\"2024-12-22T05:24:48\",\"isFilter\":\"0\",\"column_name_12\":\"测试23333\",\"modelNumber\":\"测试\",\"id\":\"6\",\"isInStock\":\"true\",\"isNew\":\"true\",\"category\":\"测试\",\"packet\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-22 05:40:43', 13);
INSERT INTO `sys_oper_log` VALUES (153, '修改产品型号', 2, 'com.ruoyi.web.controller.business.ProductModelController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/edit', '121.35.0.63', 'XX XX', '{\"createBy\":\"admin\",\"productId\":\"10\",\"createTime\":\"2024-12-22T05:24:48\",\"isFilter\":\"0\",\"column_name_12\":\"测试23333\",\"modelNumber\":\"测试\",\"id\":\"6\",\"isInStock\":\"true\",\"isNew\":\"true\",\"category\":\"测试\",\"packet\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-23 22:52:19', 27);
INSERT INTO `sys_oper_log` VALUES (154, '修改产品型号', 2, 'com.ruoyi.web.controller.business.ProductModelController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/edit', '121.35.0.63', 'XX XX', '{\"createBy\":\"admin\",\"productId\":\"10\",\"createTime\":\"2024-12-22T05:24:48\",\"isFilter\":\"0\",\"column_name_12\":\"测试23333\",\"modelNumber\":\"测试\",\"id\":\"6\",\"isInStock\":\"true\",\"isNew\":\"true\",\"category\":\"测试\",\"packet\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-23 22:54:21', 14);
INSERT INTO `sys_oper_log` VALUES (155, '新增产品', 1, 'com.ruoyi.web.controller.business.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/add', '208.86.32.59', 'XX XX', '{\"name\":\"存储器\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-25 00:22:54', 19);
INSERT INTO `sys_oper_log` VALUES (156, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '208.86.32.59', 'XX XX', '{\"fieldName\":\"普容ESD静电防护\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-25 00:24:10', 234);
INSERT INTO `sys_oper_log` VALUES (157, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '208.86.32.59', 'XX XX', '{\"fieldName\":\"低电容ESD静电防护\",\"productId\":\"1\",\"isFilter\":\"1\"}', NULL, 1, '排序不能为空', '2024-12-25 00:24:31', 1);
INSERT INTO `sys_oper_log` VALUES (158, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '208.86.32.59', 'XX XX', '{\"fieldName\":\"低电容ESD静电防护\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-25 00:24:34', 52);
INSERT INTO `sys_oper_log` VALUES (159, '新增产品', 1, 'com.ruoyi.web.controller.business.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/add', '208.86.32.59', 'XX XX', '{\"name\":\"    ESD静电保护管\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-25 01:07:30', 9);
INSERT INTO `sys_oper_log` VALUES (160, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '208.86.32.59', 'XX XX', '{\"fieldName\":\"种类\",\"productId\":\"14\",\"isFilter\":\"1\",\"sort\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-25 01:16:56', 47);
INSERT INTO `sys_oper_log` VALUES (161, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '208.86.32.59', 'XX XX', '{\"fieldName\":\"Package\",\"productId\":\"14\",\"isFilter\":\"NaN\"}', NULL, 1, '排序不能为空', '2024-12-25 01:17:18', 0);
INSERT INTO `sys_oper_log` VALUES (162, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '208.86.32.59', 'XX XX', '{\"fieldName\":\"Package\",\"productId\":\"14\",\"isFilter\":\"1\",\"sort\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-25 01:17:23', 57);
INSERT INTO `sys_oper_log` VALUES (163, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '208.86.32.59', 'XX XX', '{\"fieldName\":\"VRWM(V)\",\"productId\":\"14\",\"isFilter\":\"1\",\"sort\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-25 01:17:41', 41);
INSERT INTO `sys_oper_log` VALUES (164, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '113.90.130.212', 'XX XX', '{\"idList[0]\":\"14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-25 20:39:54', 67);
INSERT INTO `sys_oper_log` VALUES (165, '删除产品型号', 3, 'com.ruoyi.web.controller.business.ProductModelController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/model/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:33:36', 38);
INSERT INTO `sys_oper_log` VALUES (166, '删除产品型号', 3, 'com.ruoyi.web.controller.business.ProductModelController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/model/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:00', 11);
INSERT INTO `sys_oper_log` VALUES (167, '删除产品型号', 3, 'com.ruoyi.web.controller.business.ProductModelController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/model/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:02', 11);
INSERT INTO `sys_oper_log` VALUES (168, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:05', 10);
INSERT INTO `sys_oper_log` VALUES (169, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:07', 10);
INSERT INTO `sys_oper_log` VALUES (170, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:08', 11);
INSERT INTO `sys_oper_log` VALUES (171, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:10', 9);
INSERT INTO `sys_oper_log` VALUES (172, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:12', 10);
INSERT INTO `sys_oper_log` VALUES (173, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:14', 10);
INSERT INTO `sys_oper_log` VALUES (174, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"7\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:16', 14);
INSERT INTO `sys_oper_log` VALUES (175, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:17', 10);
INSERT INTO `sys_oper_log` VALUES (176, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:19', 15);
INSERT INTO `sys_oper_log` VALUES (177, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:21', 12);
INSERT INTO `sys_oper_log` VALUES (178, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:23', 11);
INSERT INTO `sys_oper_log` VALUES (179, '删除产品', 3, 'com.ruoyi.web.controller.business.ProductController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:28', 10);
INSERT INTO `sys_oper_log` VALUES (180, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[7]\":\"10\",\"idList[10]\":\"13\",\"idList[6]\":\"9\",\"idList[5]\":\"8\",\"idList[4]\":\"7\",\"idList[3]\":\"6\",\"idList[2]\":\"5\",\"idList[13]\":\"17\",\"idList[1]\":\"4\",\"idList[12]\":\"16\",\"idList[0]\":\"2\",\"idList[11]\":\"15\",\"idList[9]\":\"12\",\"idList[8]\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-26 16:34:36', 837);
INSERT INTO `sys_oper_log` VALUES (181, '新增产品', 1, 'com.ruoyi.web.controller.business.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/add', '113.90.133.56', 'XX XX', '{\"publishTime\":\"2024-12-27\",\"title\":\"测试\",\"category\":\"行业新闻\",\"content\":\"<p>测试</p>\"}', NULL, 1, '产品名称不能为空', '2024-12-27 02:07:34', 23);
INSERT INTO `sys_oper_log` VALUES (182, '新增产品', 1, 'com.ruoyi.web.controller.business.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/add', '113.90.133.56', 'XX XX', '{\"publishTime\":\"2024-12-27\",\"title\":\"测试\",\"category\":\"行业新闻\",\"content\":\"<p>测试</p>\"}', NULL, 1, '产品名称不能为空', '2024-12-27 02:07:44', 0);
INSERT INTO `sys_oper_log` VALUES (183, '修改产品', 2, 'com.ruoyi.web.controller.business.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/edit', '113.90.133.56', 'XX XX', '{\"publishTime\":\"2023-08-06\",\"id\":\"1\",\"title\":\"大陆存储器产业崛起将改变全球产业版图 韩厂备感威胁\",\"category\":\"行业新闻\",\"content\":\"<p>南韩两大半导体厂 Samsung与SK Hynix 共同投资2000亿美元，显示韩国厂商在全球记忆体市场所面临的竞争与影响力挑战...add</p>\"}', NULL, 1, '产品名称不能为空', '2024-12-27 02:08:49', 1);
INSERT INTO `sys_oper_log` VALUES (184, '删除新闻资讯', 3, 'com.ruoyi.web.controller.business.NewsInformationController.remove()', 'POST', 1, 'admin', '研发部门', '/business/information/remove', '113.90.133.56', 'XX XX', '{\"idList[0]\":\"8\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-12-27 02:25:45', 80);
INSERT INTO `sys_oper_log` VALUES (185, '删除新闻资讯', 3, 'com.ruoyi.web.controller.business.NewsInformationController.remove()', 'POST', 1, 'admin', '研发部门', '/business/information/remove', '113.90.133.56', 'XX XX', '{\"idList[0]\":\"7\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-12-27 02:26:22', 5);
INSERT INTO `sys_oper_log` VALUES (186, '删除新闻资讯', 3, 'com.ruoyi.web.controller.business.NewsInformationController.remove()', 'POST', 1, 'admin', '研发部门', '/business/information/remove', '113.90.133.56', 'XX XX', '{\"idList[0]\":\"7\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-12-27 02:27:08', 3);
INSERT INTO `sys_oper_log` VALUES (187, '删除新闻资讯', 3, 'com.ruoyi.web.controller.business.NewsInformationController.remove()', 'POST', 1, 'admin', '研发部门', '/business/information/remove', '113.90.133.56', 'XX XX', '{\"idList[0]\":\"7\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-12-27 02:27:21', 3);
INSERT INTO `sys_oper_log` VALUES (188, '删除留言反馈', 3, 'com.ruoyi.web.controller.business.FeedbackController.remove()', 'POST', 1, 'admin', '研发部门', '/business/feedback/remove', '113.90.133.56', 'XX XX', '{\"idList[0]\":\"7\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 02:28:03', 14);
INSERT INTO `sys_oper_log` VALUES (189, '修改网站信息', 2, 'com.ruoyi.web.controller.business.EnterpriseInfoController.edit()', 'POST', 1, 'admin', '研发部门', '/business/info/edit', '113.90.133.56', 'XX XX', '{\"zipCode\":\"12345\",\"icpNumber\":\"ICP12345\",\"website\":\"www.abccorp.com\",\"address\":\"123 Main St, Anytown USA\",\"mobile\":\"555-5678\",\"wechat\":\"johnsmith测试\",\"contactPerson\":\"John Smith\",\"businessQq\":\"12345678\",\"phone\":\"555-1234\",\"name\":\"ABC Corporation\",\"id\":\"6\",\"fax\":\"555-9012\",\"email\":\"info@abccorp.com\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 02:53:34', 69);
INSERT INTO `sys_oper_log` VALUES (190, '新增产品', 1, 'com.ruoyi.web.controller.business.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/add', '183.237.225.210', 'XX XX', '{\"name\":\"test\",\"catalogue\":\"test\"}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n### The error may exist in URL [jar:file:/home/java/portal/portal.jar!/BOOT-INF/lib/ruoyi-business-3.8.8.jar!/mapper/business/ProductMapper.xml]\n### The error may involve com.ruoyi.business.mapper.ProductMapper.insertProduct-Inline\n### The error occurred while setting parameters\n### SQL: insert into t_product          ( name,             catalogue,                          create_by,             create_time )           values ( ?,                          ?,             ? )\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2024-12-27 11:10:23', 103);
INSERT INTO `sys_oper_log` VALUES (191, '新增产品', 1, 'com.ruoyi.web.controller.business.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/add', '183.237.225.210', 'XX XX', '{\"name\":\"test\",\"catalogue\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:16:30', 171);
INSERT INTO `sys_oper_log` VALUES (192, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 11:30:51\",\"fieldName\":\"种类\",\"id\":18,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:30:52', 248);
INSERT INTO `sys_oper_log` VALUES (193, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 11:31:09\",\"fieldName\":\"VRWM(V)\",\"id\":19,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:31:10', 181);
INSERT INTO `sys_oper_log` VALUES (194, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '127.0.0.1', '内网IP', '{\"idList\":[19]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:32:13', 172);
INSERT INTO `sys_oper_log` VALUES (195, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 11:32:32\",\"fieldName\":\"VBR Min(V)\",\"id\":20,\"isFilter\":0,\"params\":{},\"productId\":1,\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:32:33', 197);
INSERT INTO `sys_oper_log` VALUES (196, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 11:32:51\",\"fieldName\":\"VRWM(V)\",\"id\":21,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:32:52', 181);
INSERT INTO `sys_oper_log` VALUES (197, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 11:33:09\",\"fieldName\":\"Channel\",\"id\":22,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:33:10', 205);
INSERT INTO `sys_oper_log` VALUES (198, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 11:33:20\",\"fieldName\":\"Cj(pF)\",\"id\":23,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:33:21', 214);
INSERT INTO `sys_oper_log` VALUES (199, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 11:33:35\",\"fieldName\":\"IPP(A)\",\"id\":24,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:33:36', 175);
INSERT INTO `sys_oper_log` VALUES (200, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 11:33:51\",\"fieldName\":\"PPP(8/20)\",\"id\":25,\"isFilter\":0,\"params\":{},\"productId\":1,\"sort\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:33:52', 182);
INSERT INTO `sys_oper_log` VALUES (201, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 11:34:02\",\"fieldName\":\"IR(uA)\",\"id\":26,\"isFilter\":0,\"params\":{},\"productId\":1,\"sort\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:34:03', 203);
INSERT INTO `sys_oper_log` VALUES (202, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"modelNumber\":\"TPESD0504S6\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"普容ESD静电防护\",\"column_name_20\":\"7V\",\"column_name_21\":\"5.0V\",\"column_name_22\":\"4-Line+VCC\",\"column_name_23\":\"0.35pF\",\"column_name_24\":\"5A\",\"column_name_25\":\"150W\",\"column_name_26\":\"1uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:40:08', 95);
INSERT INTO `sys_oper_log` VALUES (203, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD923(0402)\",\"modelNumber\":\"ESD3V3U05-923\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"普容ESD静电防护\",\"column_name_20\":\"5.8V\",\"column_name_21\":\"3.3V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"0.5pF\",\"column_name_24\":\"4A\",\"column_name_25\":\"60W\",\"column_name_26\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:43:35', 77);
INSERT INTO `sys_oper_log` VALUES (204, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD923(0402)\",\"modelNumber\":\"ESD12VU35-923\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"普容ESD静电防护\",\"column_name_20\":\"13.3V\",\"column_name_21\":\"12V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"35pF\",\"column_name_24\":\"7A\",\"column_name_25\":\"140W\",\"column_name_26\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:45:32', 75);
INSERT INTO `sys_oper_log` VALUES (205, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD923(0402)\",\"modelNumber\":\"ESD3V3B15G-923\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"普容ESD静电防护\",\"column_name_20\":\"5V\",\"column_name_21\":\"3.3V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"15pF\",\"column_name_24\":\"7A\",\"column_name_25\":\"80W\",\"column_name_26\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:46:17', 67);
INSERT INTO `sys_oper_log` VALUES (206, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD923(0402)\",\"modelNumber\":\"ESD5V0U05-923\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"普容ESD静电防护\",\"column_name_20\":\"6.5V\",\"column_name_21\":\"5.0V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"0.5pF\",\"column_name_24\":\"4.5A\",\"column_name_25\":\"80W\",\"column_name_26\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:46:56', 51);
INSERT INTO `sys_oper_log` VALUES (207, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD923(0402)\",\"modelNumber\":\"ESD5V0U90-923\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"普容ESD静电防护\",\"column_name_20\":\"6V\",\"column_name_21\":\"5.0V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"90pF\",\"column_name_24\":\"10A\",\"column_name_25\":\"140W\",\"column_name_26\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:47:34', 101);
INSERT INTO `sys_oper_log` VALUES (208, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD923(0402)\",\"modelNumber\":\"SOD723\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"普容ESD静电防护\",\"column_name_20\":\"5.6V\",\"column_name_21\":\"5.0V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"15pF\",\"column_name_24\":\"8A\",\"column_name_25\":\"80W\",\"column_name_26\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:48:33', 52);
INSERT INTO `sys_oper_log` VALUES (209, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD723\",\"modelNumber\":\"ESD5V0B15G-723\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"普容ESD静电防护\",\"column_name_20\":\"5.6V\",\"column_name_21\":\"5.0V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"15pF\",\"column_name_24\":\"8A\",\"column_name_25\":\"80W\",\"column_name_26\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:51:24', 89);
INSERT INTO `sys_oper_log` VALUES (210, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD723\",\"modelNumber\":\"TPESD7Z5.0\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"普容ESD静电防护\",\"column_name_20\":\"6V\",\"column_name_21\":\"5.0V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"90pF\",\"column_name_24\":\"10A\",\"column_name_25\":\"150W\",\"column_name_26\":\"0.2uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:52:04', 51);
INSERT INTO `sys_oper_log` VALUES (211, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD723\",\"modelNumber\":\"TPESD7Z12\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"普容ESD静电防护\",\"column_name_20\":\"13.5V\",\"column_name_21\":\"12V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"30pF\",\"column_name_24\":\"5A\",\"column_name_25\":\"150W\",\"column_name_26\":\"0.2uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:52:39', 75);
INSERT INTO `sys_oper_log` VALUES (212, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD523(0603)\",\"modelNumber\":\"TPESD05R4AWT\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"低电容ESD静电防护\",\"column_name_20\":\"6V\",\"column_name_21\":\"5.0V\",\"column_name_22\":\"\",\"column_name_23\":\"0.45pf\",\"column_name_24\":\"3.8A\",\"column_name_25\":\"100W\",\"column_name_26\":\"0.1uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:55:31', 84);
INSERT INTO `sys_oper_log` VALUES (213, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD523(0603)\",\"modelNumber\":\"ESD5V0B03-523\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"低电容ESD静电防护\",\"column_name_20\":\"7.5V\",\"column_name_21\":\"5.0V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"0.35pF\",\"column_name_24\":\"4A\",\"column_name_25\":\"80W\",\"column_name_26\":\"0.2uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:56:16', 49);
INSERT INTO `sys_oper_log` VALUES (214, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD523(0603)\",\"modelNumber\":\"ESD5V0B06-523\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"低电容ESD静电防护\",\"column_name_20\":\"6.5V\",\"column_name_21\":\"5.0V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"0.6pF\",\"column_name_24\":\"2A\",\"column_name_25\":\"600W\",\"column_name_26\":\"0.8uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:56:57', 51);
INSERT INTO `sys_oper_log` VALUES (215, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD323(0805)\",\"modelNumber\":\"TPLC05C\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"低电容ESD静电防护\",\"column_name_20\":\"6V\",\"column_name_21\":\"5.0V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"0.8pF\",\"column_name_24\":\"17A\",\"column_name_25\":\"\",\"column_name_26\":\"0.2uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:58:04', 73);
INSERT INTO `sys_oper_log` VALUES (216, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD323(0805)\",\"modelNumber\":\"TPGC03GU\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_18\":\"低电容ESD静电防护\",\"column_name_20\":\"4V\",\"column_name_21\":\"3.3V\",\"column_name_22\":\"1-Line\",\"column_name_23\":\"1pF\",\"column_name_24\":\"20A\",\"column_name_25\":\"350W\",\"column_name_26\":\"0.2uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 11:58:46', 181);
INSERT INTO `sys_oper_log` VALUES (217, '修改网站信息', 2, 'com.ruoyi.web.controller.business.EnterpriseInfoController.edit()', 'POST', 1, 'admin', '研发部门', '/business/info/edit', '27.38.212.162', 'XX XX', '{\"zipCode\":\"\",\"icpNumber\":\"蜀ICP备2024083269号\",\"website\":\"\",\"address\":\"四川省遂宁市***开发区德泉路1号\",\"mobile\":\"555-5678\",\"wechat\":\"\",\"contactPerson\":\"John Smith\",\"businessQq\":\"\",\"phone\":\"13908090927\",\"name\":\"四川拓电半导体有限公司\",\"id\":\"6\",\"fax\":\"\",\"email\":\"138839639@qq.com\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:47:25', 14);
INSERT INTO `sys_oper_log` VALUES (218, '修改网站信息', 2, 'com.ruoyi.web.controller.business.EnterpriseInfoController.edit()', 'POST', 1, 'admin', '研发部门', '/business/info/edit', '27.38.212.162', 'XX XX', '{\"zipCode\":\"-\",\"icpNumber\":\"蜀ICP备2024083269号\",\"website\":\"www.abccorp.com\",\"address\":\"四川省遂宁市***开发区德泉路1号\",\"mobile\":\"555-5678\",\"wechat\":\"-\",\"contactPerson\":\"-\",\"businessQq\":\"-\",\"phone\":\"13908090927\",\"name\":\"四川拓电半导体有限公司\",\"id\":\"6\",\"fax\":\"\",\"email\":\"138839639@qq.com\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:47:37', 12);
INSERT INTO `sys_oper_log` VALUES (219, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"ESD静电保护\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:50:20', 98);
INSERT INTO `sys_oper_log` VALUES (220, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"27\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:50:45', 52);
INSERT INTO `sys_oper_log` VALUES (221, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:51:30', 44);
INSERT INTO `sys_oper_log` VALUES (222, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:51:31', 56);
INSERT INTO `sys_oper_log` VALUES (223, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:51:33', 38);
INSERT INTO `sys_oper_log` VALUES (224, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:51:35', 42);
INSERT INTO `sys_oper_log` VALUES (225, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:51:37', 46);
INSERT INTO `sys_oper_log` VALUES (226, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:51:39', 57);
INSERT INTO `sys_oper_log` VALUES (227, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:51:41', 45);
INSERT INTO `sys_oper_log` VALUES (228, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:51:43', 49);
INSERT INTO `sys_oper_log` VALUES (229, '删除产品型号', 3, 'com.ruoyi.web.controller.business.ProductModelController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/model/remove', '27.38.212.162', 'XX XX', '{\"idList[7]\":\"18\",\"idList[10]\":\"21\",\"idList[6]\":\"17\",\"idList[5]\":\"16\",\"idList[4]\":\"14\",\"idList[3]\":\"13\",\"idList[2]\":\"12\",\"idList[1]\":\"11\",\"idList[12]\":\"23\",\"idList[0]\":\"10\",\"idList[11]\":\"22\",\"idList[9]\":\"20\",\"idList[8]\":\"19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:52:12', 11);
INSERT INTO `sys_oper_log` VALUES (230, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"种类\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:53:25', 50);
INSERT INTO `sys_oper_log` VALUES (231, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"Package\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:53:37', 47);
INSERT INTO `sys_oper_log` VALUES (232, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"VRWM(V)\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:53:45', 50);
INSERT INTO `sys_oper_log` VALUES (233, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"Channel\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:53:53', 54);
INSERT INTO `sys_oper_log` VALUES (234, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"Cj(pF)\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:53:59', 48);
INSERT INTO `sys_oper_log` VALUES (235, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"IPP(A)\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:54:07', 53);
INSERT INTO `sys_oper_log` VALUES (236, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '27.38.212.162', 'XX XX', '{\"column_name_33\":\"7A\",\"column_name_32\":\"9pF\",\"column_name_31\":\"1-Line\",\"column_name_30\":\"13V\",\"productId\":\"1\",\"isNew\":\"true\",\"packet\":\"DFN0603-2(0201)\",\"isFilter\":\"NaN\",\"column_name_29\":\"DFN0603-2(0201)\",\"modelNumber\":\"ESD12VB7-0201\",\"column_name_28\":\"普容ESD静电防护\",\"isInStock\":\"true\",\"category\":\"ESD静电保护\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:57:44', 25);
INSERT INTO `sys_oper_log` VALUES (237, '删除产品型号', 3, 'com.ruoyi.web.controller.business.ProductModelController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/model/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:59:10', 10);
INSERT INTO `sys_oper_log` VALUES (238, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:59:26', 45);
INSERT INTO `sys_oper_log` VALUES (239, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:59:28', 66);
INSERT INTO `sys_oper_log` VALUES (240, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:59:30', 44);
INSERT INTO `sys_oper_log` VALUES (241, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:59:32', 42);
INSERT INTO `sys_oper_log` VALUES (242, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:59:33', 54);
INSERT INTO `sys_oper_log` VALUES (243, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 12:59:46', 48);
INSERT INTO `sys_oper_log` VALUES (244, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"ESD静电保护\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:00:12', 42);
INSERT INTO `sys_oper_log` VALUES (245, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"高分子\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:00:19', 47);
INSERT INTO `sys_oper_log` VALUES (246, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:01:01', 52);
INSERT INTO `sys_oper_log` VALUES (247, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/field/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:01:03', 59);
INSERT INTO `sys_oper_log` VALUES (248, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '27.38.212.162', 'XX XX', '{\"productId\":\"1\",\"isFilter\":\"NaN\",\"modelNumber\":\"123\",\"category\":\"ESD静电保护\",\"packet\":\"12412\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:01:47', 12);
INSERT INTO `sys_oper_log` VALUES (249, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '27.38.212.162', 'XX XX', '{\"productId\":\"1\",\"isFilter\":\"NaN\",\"modelNumber\":\"12312\",\"category\":\"高分子\",\"packet\":\"124123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:01:57', 10);
INSERT INTO `sys_oper_log` VALUES (250, '删除产品型号', 3, 'com.ruoyi.web.controller.business.ProductModelController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/model/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:03:39', 10);
INSERT INTO `sys_oper_log` VALUES (251, '删除产品型号', 3, 'com.ruoyi.web.controller.business.ProductModelController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/model/remove', '27.38.212.162', 'XX XX', '{\"idList[0]\":\"26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:03:40', 10);
INSERT INTO `sys_oper_log` VALUES (252, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '27.38.212.162', 'XX XX', '{\"productId\":\"1\",\"isFilter\":\"NaN\",\"modelNumber\":\"阿萨德\",\"category\":\"高分子\",\"packet\":\"12312\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:06:47', 13);
INSERT INTO `sys_oper_log` VALUES (253, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"种类\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:08:18', 56);
INSERT INTO `sys_oper_log` VALUES (254, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"Package\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:08:33', 51);
INSERT INTO `sys_oper_log` VALUES (255, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"VRWM(V)\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:08:39', 46);
INSERT INTO `sys_oper_log` VALUES (256, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"Channel\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:08:45', 54);
INSERT INTO `sys_oper_log` VALUES (257, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"Channel\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:08:50', 45);
INSERT INTO `sys_oper_log` VALUES (258, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '27.38.212.162', 'XX XX', '{\"fieldName\":\"IPP(A)\",\"productId\":\"1\",\"isFilter\":\"1\",\"sort\":\"6\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:08:56', 149);
INSERT INTO `sys_oper_log` VALUES (259, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/edit', '27.38.212.162', 'XX XX', '{\"fieldName\":\"Cj(pF)\",\"productId\":\"1\",\"isFilter\":\"1\",\"id\":\"40\",\"sort\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:17:18', 12);
INSERT INTO `sys_oper_log` VALUES (260, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 13:44:31\",\"fieldName\":\"种类\",\"id\":42,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:44:32', 192);
INSERT INTO `sys_oper_log` VALUES (261, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 13:44:58\",\"fieldName\":\"VBR Min(V)\",\"id\":43,\"isFilter\":0,\"params\":{},\"productId\":1,\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:44:59', 201);
INSERT INTO `sys_oper_log` VALUES (262, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 13:45:11\",\"fieldName\":\"VRWM(V)\",\"id\":44,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:45:12', 217);
INSERT INTO `sys_oper_log` VALUES (263, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 13:45:21\",\"fieldName\":\"Channel\",\"id\":45,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:45:22', 210);
INSERT INTO `sys_oper_log` VALUES (264, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 13:45:31\",\"fieldName\":\"Cj(pF)\",\"id\":46,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:45:32', 200);
INSERT INTO `sys_oper_log` VALUES (265, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 13:45:46\",\"fieldName\":\"IPP(A)\",\"id\":47,\"isFilter\":1,\"params\":{},\"productId\":1,\"sort\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:45:47', 189);
INSERT INTO `sys_oper_log` VALUES (266, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 13:46:01\",\"fieldName\":\"PPP(8/20)\",\"id\":48,\"isFilter\":0,\"params\":{},\"productId\":1,\"sort\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:46:02', 194);
INSERT INTO `sys_oper_log` VALUES (267, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 13:46:14\",\"fieldName\":\"IR(uA)\",\"id\":49,\"isFilter\":0,\"params\":{},\"productId\":1,\"sort\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:46:15', 188);
INSERT INTO `sys_oper_log` VALUES (268, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD923(0402)\",\"modelNumber\":\"ESD12VU35-923\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_42\":\"普容ESD静电防护\",\"column_name_43\":\"13.3V\",\"column_name_44\":\"12V\",\"column_name_45\":\"1-Line\",\"column_name_46\":\"35pF\",\"column_name_47\":\"7A\",\"column_name_48\":\"140W\",\"column_name_49\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:48:52', 97);
INSERT INTO `sys_oper_log` VALUES (269, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD923(0402)\",\"modelNumber\":\"ESD3V3B15G-923\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_42\":\"普容ESD静电防护\",\"column_name_43\":\"5V\",\"column_name_44\":\"3.3V\",\"column_name_45\":\"1-Line\",\"column_name_46\":\"15pF\",\"column_name_47\":\"7A\",\"column_name_48\":\"80W\",\"column_name_49\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:49:31', 63);
INSERT INTO `sys_oper_log` VALUES (270, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":\"1\",\"category\":\"ESD静电保护\",\"packet\":\"SOD923(0402)\",\"modelNumber\":\"ESD5V0U90-923\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_42\":\"普容ESD静电防护\",\"column_name_43\":\"6V\",\"column_name_44\":\"5.0V\",\"column_name_45\":\"1-Line\",\"column_name_46\":\"90pF\",\"column_name_47\":\"10A\",\"column_name_48\":\"140W\",\"column_name_49\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 13:53:20', 73);
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_product_category\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 14:13:36', 592);
INSERT INTO `sys_oper_log` VALUES (272, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"ProductCategory\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":39,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-12-27 14:13:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductId\",\"columnComment\":\"种类ID\",\"columnId\":40,\"columnName\":\"product_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-12-27 14:13:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"种类名称\",\"columnId\":41,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-27 14:13:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DelFlag\",\"columnComment\":\"删除标志（0代表存在 1代表删除）\",\"columnId\":42,\"columnName\":\"del_flag\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-27 14:13:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"delFlag\",\"javaType\":\"String\",\"list\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 14:14:05', 506);
INSERT INTO `sys_oper_log` VALUES (273, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_product_category\"}', NULL, 0, NULL, '2024-12-27 14:14:09', 293);
INSERT INTO `sys_oper_log` VALUES (274, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_product_categort_field\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 14:31:02', 627);
INSERT INTO `sys_oper_log` VALUES (275, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_product_categort_field\"}', NULL, 0, NULL, '2024-12-27 14:31:10', 125);
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"field\",\"className\":\"ProductCategortField\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":47,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-12-27 14:31:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductCategoryId\",\"columnComment\":\"种类ID\",\"columnId\":48,\"columnName\":\"product_category_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-12-27 14:31:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productCategoryId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FieldName\",\"columnComment\":\"字段名称\",\"columnId\":49,\"columnName\":\"field_name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-12-27 14:31:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"fieldName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sort\",\"columnComment\":\"排序\",\"columnId\":50,\"columnName\":\"sort\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-12-27 14:31:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 14:31:55', 547);
INSERT INTO `sys_oper_log` VALUES (277, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_product_categort_field\"}', NULL, 0, NULL, '2024-12-27 14:32:00', 108);
INSERT INTO `sys_oper_log` VALUES (278, '新增产品种类', 1, 'com.ruoyi.web.controller.business.ProductCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/business/product/category/add', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-12-27 15:20:14\",\"name\":\"ESD静电保护\",\"params\":{},\"productId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\my project\\portal\\ruoyi-business\\target\\classes\\mapper\\business\\ProductCategoryMapper.xml]\r\n### The error may involve com.ruoyi.business.mapper.ProductCategoryMapper.insertProductCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_product_category          ( product_id,             name,                                       create_time )           values ( ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2024-12-27 15:20:15', 132);
INSERT INTO `sys_oper_log` VALUES (279, '新增产品种类', 1, 'com.ruoyi.web.controller.business.ProductCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/business/product/category/add', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-12-27 15:20:35\",\"name\":\"ESD静电保护\",\"params\":{},\"productId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 15:20:36', 53);
INSERT INTO `sys_oper_log` VALUES (280, '新增产品种类', 1, 'com.ruoyi.web.controller.business.ProductCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/business/product/category/add', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-12-27 15:21:52\",\"name\":\"高分子\",\"params\":{},\"productId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 15:21:53', 77);
INSERT INTO `sys_oper_log` VALUES (281, '新增产品种类', 1, 'com.ruoyi.web.controller.business.ProductCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/business/product/category/add', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-12-27 15:21:55\",\"name\":\"高分子2\",\"params\":{},\"productId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 15:21:56', 51);
INSERT INTO `sys_oper_log` VALUES (282, '产品种类', 2, 'com.ruoyi.web.controller.business.ProductCategoryController.edit()', 'POST', 1, 'admin', '研发部门', '/business/product/category/edit', '127.0.0.1', '内网IP', '{\"id\":2,\"name\":\"高分子\",\"params\":{},\"updateTime\":\"2024-12-27 15:22:20\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 15:22:21', 58);
INSERT INTO `sys_oper_log` VALUES (283, '产品种类', 3, 'com.ruoyi.web.controller.business.ProductCategoryController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/category/remove', '127.0.0.1', '内网IP', '{\"idList\":[2]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 15:23:36', 83);
INSERT INTO `sys_oper_log` VALUES (284, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 15:46:23\",\"fieldName\":\"IR(uA)\",\"id\":50,\"isFilter\":0,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 15:46:24', 266);
INSERT INTO `sys_oper_log` VALUES (285, '修改产品字段配置', 2, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/edit', '127.0.0.1', '内网IP', '{\"fieldName\":\"IR(uA)2\",\"id\":50,\"isFilter\":0,\"params\":{},\"sort\":8,\"updateBy\":\"admin\",\"updateTime\":\"2024-12-27 15:52:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 15:52:44', 80);
INSERT INTO `sys_oper_log` VALUES (286, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 15:52:54\",\"fieldName\":\"IR(uA)\",\"id\":51,\"isFilter\":0,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 15:52:55', 179);
INSERT INTO `sys_oper_log` VALUES (287, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/remove', '127.0.0.1', '内网IP', '{\"idList\":[51]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 15:53:25', 139);
INSERT INTO `sys_oper_log` VALUES (288, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:42:36\",\"fieldName\":\"种类\",\"id\":52,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:42:38', 392);
INSERT INTO `sys_oper_log` VALUES (289, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:42:59\",\"fieldName\":\"VBR Min(V)\",\"id\":53,\"isFilter\":0,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:43:01', 193);
INSERT INTO `sys_oper_log` VALUES (290, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:43:14\",\"fieldName\":\"VRWM(V)\",\"id\":54,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:43:15', 202);
INSERT INTO `sys_oper_log` VALUES (291, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:43:25\",\"fieldName\":\"Channel\",\"id\":55,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:43:26', 199);
INSERT INTO `sys_oper_log` VALUES (292, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:43:35\",\"fieldName\":\"Cj(pF)\",\"id\":56,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:43:37', 198);
INSERT INTO `sys_oper_log` VALUES (293, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:43:47\",\"fieldName\":\"IPP(A)\",\"id\":57,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:43:48', 202);
INSERT INTO `sys_oper_log` VALUES (294, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:44:02\",\"fieldName\":\"PPP(8/20)\",\"id\":58,\"isFilter\":0,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:44:03', 248);
INSERT INTO `sys_oper_log` VALUES (295, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:44:15\",\"fieldName\":\"IR(uA)\",\"id\":59,\"isFilter\":0,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:44:17', 204);
INSERT INTO `sys_oper_log` VALUES (296, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:45:11\",\"fieldName\":\"VRWM(V)\",\"id\":60,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:45:12', 201);
INSERT INTO `sys_oper_log` VALUES (297, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:45:24\",\"fieldName\":\"Package\",\"id\":61,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:45:25', 205);
INSERT INTO `sys_oper_log` VALUES (298, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:45:40\",\"fieldName\":\"Vt\",\"id\":62,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:45:42', 416);
INSERT INTO `sys_oper_log` VALUES (299, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:45:51\",\"fieldName\":\"Vc(V)\",\"id\":63,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:45:52', 207);
INSERT INTO `sys_oper_log` VALUES (300, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:46:05\",\"fieldName\":\"Ir(uA)\",\"id\":64,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:46:07', 208);
INSERT INTO `sys_oper_log` VALUES (301, '新增产品字段配置', 1, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/add', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-12-27 16:46:16\",\"fieldName\":\"Cj(pF)\",\"id\":65,\"isFilter\":1,\"params\":{},\"productCategoryId\":1,\"productId\":1,\"sort\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:46:18', 210);
INSERT INTO `sys_oper_log` VALUES (302, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/remove', '127.0.0.1', '内网IP', '{\"idList\":[61]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:46:59', 178);
INSERT INTO `sys_oper_log` VALUES (303, '删除产品字段配置', 3, 'com.ruoyi.web.controller.business.ProductCategoryFieldController.remove()', 'POST', 1, 'admin', '研发部门', '/business/product/category/field/remove', '127.0.0.1', '内网IP', '{\"idList\":[60]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 16:50:40', 176);
INSERT INTO `sys_oper_log` VALUES (304, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":1,\"productCategoryId\":1,\"packet\":\"DFN0603-2(0201)\",\"modelNumber\":\"TPESD03B7AZ\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_52\":\"普容ESD静电防护\",\"column_name_53\":\"3.6V\",\"column_name_54\":\"3.3V\",\"column_name_55\":\"1-Line\",\"column_name_56\":\"20pF\",\"column_name_57\":\"8A\",\"column_name_58\":\"80W\",\"column_name_59\":\"0.1uA\"}', NULL, 1, 'PreparedStatementCallback; bad SQL grammar [INSERT INTO t_product_model(`product_id`, `model_number`, `category`, `packet`, `pdf_file_id`, `is_in_stock`, `is_new`, `del_flag`, `create_by`, `create_time` , column_name_52, column_name_53, column_name_54, column_name_55, column_name_56, column_name_57, column_name_58, column_name_59) VALUES (?, ?, ?, ?, ?, ?, ?, \'0\', ?, NOW() , ?, ?, ?, ?, ?, ?, ?, ?)]; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'category\' in \'field list\'', '2024-12-27 16:52:53', 95);
INSERT INTO `sys_oper_log` VALUES (305, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":1,\"productCategoryId\":1,\"packet\":\"DFN0603-2(0201)\",\"modelNumber\":\"TPESD03B7AZ\",\"pdf_file_id\":1,\"isInStock\":0,\"isNew\":0,\"column_name_52\":\"普容ESD静电防护\",\"column_name_53\":\"3.6V\",\"column_name_54\":\"3.3V\",\"column_name_55\":\"1-Line\",\"column_name_56\":\"20pF\",\"column_name_57\":\"8A\",\"column_name_58\":\"80W\",\"column_name_59\":\"0.1uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 17:00:16', 190);
INSERT INTO `sys_oper_log` VALUES (306, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":1,\"productCategoryId\":1,\"packet\":\"DFN0603-2(0201)\",\"modelNumber\":\"TPESD12B6AZ\",\"pdfFileId\":1,\"isInStock\":0,\"isNew\":0,\"column_name_52\":\"普容ESD静电防护\",\"column_name_53\":\"13V\",\"column_name_54\":\"12V\",\"column_name_55\":\"1-Line\",\"column_name_56\":\"13pF\",\"column_name_57\":\"8A\",\"column_name_58\":\"240W\",\"column_name_59\":\"0.1uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 17:02:06', 77);
INSERT INTO `sys_oper_log` VALUES (307, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":1,\"productCategoryId\":1,\"packet\":\"DFN0603-2(0201)\",\"modelNumber\":\"ESD5V0U04-0201\",\"pdfFileId\":1,\"isInStock\":0,\"isNew\":0,\"column_name_52\":\"普容ESD静电防护\",\"column_name_53\":\"6.5V\",\"column_name_54\":\"5.0V\",\"column_name_55\":\"1-Line\",\"column_name_56\":\"0.3pF\",\"column_name_57\":\"3A\",\"column_name_58\":\"70W\",\"column_name_59\":\"0.08uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 17:03:00', 54);
INSERT INTO `sys_oper_log` VALUES (308, '新增产品型号', 1, 'com.ruoyi.web.controller.business.ProductModelController.addSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/add', '127.0.0.1', '内网IP', '{\"productId\":1,\"productCategoryId\":1,\"packet\":\"DFN0603-2(0201)\",\"modelNumber\":\"TPESD05B8AZ\",\"pdfFileId\":1,\"isInStock\":0,\"isNew\":0,\"column_name_52\":\"普容ESD静电防护\",\"column_name_53\":\"5.5V\",\"column_name_54\":\"5.0V\",\"column_name_55\":\"1-Line\",\"column_name_56\":\"15pF\",\"column_name_57\":\"8A\",\"column_name_58\":\"100W\",\"column_name_59\":\"0.1uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 17:03:55', 54);
INSERT INTO `sys_oper_log` VALUES (309, '修改产品型号', 2, 'com.ruoyi.web.controller.business.ProductModelController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/edit', '127.0.0.1', '内网IP', '{\"id\":34,\"packet\":\"DFN0603-2(0201)\",\"modelNumber\":\"TPESD05B8AZ\",\"pdfFileId\":1,\"isInStock\":0,\"isNew\":0,\"column_name_52\":\"普容ESD静电防护\",\"column_name_53\":\"5.5V\",\"column_name_54\":\"5.0V\",\"column_name_55\":\"1-Line\",\"column_name_56\":\"15pF\",\"column_name_57\":\"8A\",\"column_name_58\":\"100W\",\"column_name_59\":\"0.1uA\"}', NULL, 1, 'PreparedStatementCallback; SQL [UPDATE t_product_model SET model_number=?, product_category_id=?, packet=?, pdf_file_id=?, is_in_stock=?, is_new=?, update_by=?, update_time=NOW() , column_name_52=?, column_name_53=?, column_name_54=?, column_name_55=?, column_name_56=?, column_name_57=?, column_name_58=?, column_name_59=?, column_name_62=?, column_name_63=?, column_name_64=?, column_name_65=? WHERE id=?]; Column \'product_category_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'product_category_id\' cannot be null', '2024-12-27 17:05:06', 151);
INSERT INTO `sys_oper_log` VALUES (310, '修改产品型号', 2, 'com.ruoyi.web.controller.business.ProductModelController.editSave()', 'POST', 1, 'admin', '研发部门', '/business/product/model/edit', '127.0.0.1', '内网IP', '{\"id\":34,\"packet\":\"DFN0603-2(0201)\",\"modelNumber\":\"TPESD05B8AZ\",\"pdfFileId\":1,\"isInStock\":0,\"isNew\":0,\"column_name_52\":\"普容ESD静电防护\",\"column_name_53\":\"5.5V\",\"column_name_54\":\"5.0V\",\"column_name_55\":\"1-Line\",\"column_name_56\":\"15pF\",\"column_name_57\":\"8A\",\"column_name_58\":\"100W\",\"column_name_59\":\"0.1uA\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-12-27 17:09:20', 135);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-12-17 15:53:34', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-12-17 15:53:34', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-12-17 15:53:34', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-12-27 15:08:46', 'admin', '2024-12-17 15:53:34', '', '2024-12-27 15:08:46', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-12-17 15:53:34', 'admin', '2024-12-17 15:53:34', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(0) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for t_enterprise_info
-- ----------------------------
DROP TABLE IF EXISTS `t_enterprise_info`;
CREATE TABLE `t_enterprise_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位名称',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '单位地址',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `fax` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传真',
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `business_qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务QQ',
  `wechat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `zip_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `icp_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站备案号',
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站地址',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站信息\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_enterprise_info
-- ----------------------------
INSERT INTO `t_enterprise_info` VALUES (6, '四川拓电半导体有限公司', '四川省遂宁市***开发区德泉路1号', '13908090927', '555-5678', '138839639@qq.com', '', '-', '-', '-', '-', '蜀ICP备2024083269号', 'www.abccorp.com', NULL, '0', 'admin', '2024-12-17 17:47:42', 'admin', '2024-12-27 12:47:38');

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `demand_scenario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '需求场景',
  `message_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言内容\n',
  `status` tinyint(1) NOT NULL COMMENT '状态 1.待处理 2.已处理',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '留言反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES (3, '张三', '13800138000', 'zhangsan@example.com', '腾讯科技', '北京', '网站开发', '希望开发一套企业门户网站', 1, '0', 'admin', '2024-12-18 15:53:19', '', NULL);
INSERT INTO `t_feedback` VALUES (4, '李四', '13900139000', 'lisi@example.com', '阿里巴巴', '杭州', '电商平台', '需要搭建一个电商平台，请提供报价', 2, '0', 'admin', '2024-12-18 15:53:39', '', NULL);
INSERT INTO `t_feedback` VALUES (5, '王五', '13600136000', 'wangwu@example.com', '百度搜索', '上海', '搜索引擎优化', '优化企业关键词排名，提升流量', 1, '1', 'admin', '2024-12-18 15:53:49', 'admin', '2024-12-18 15:54:57');
INSERT INTO `t_feedback` VALUES (6, '张三', '13800138000', 'zhangsan@example.com', '腾讯科技', '北京', '网站开发', '希望开发一套企业门户网站', 1, '0', '', '2024-12-21 10:33:17', '', NULL);
INSERT INTO `t_feedback` VALUES (7, 'sad ', '123', '124', '124', '124', '124', '12312', 1, '1', '', '2024-12-23 13:41:56', 'admin', '2024-12-27 02:28:03');
INSERT INTO `t_feedback` VALUES (8, '124', '124', '1243', '12412', '412', '213', '124', 1, '0', '', '2024-12-23 13:44:39', '', NULL);
INSERT INTO `t_feedback` VALUES (9, '测试', '13588888888', 'test@qq.com', NULL, NULL, NULL, '11111', 1, '0', '', '2024-12-23 21:29:58', '', NULL);

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件路径',
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件扩展名',
  `size` bigint(0) NULL DEFAULT NULL COMMENT '文件大小',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型 1.pdf',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uuid`(`uuid`) USING BTREE COMMENT 'uuid索引'
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_file
-- ----------------------------
INSERT INTO `t_file` VALUES (1, '59b610bbd00e480e98b9916f9bfe2c9e', '0da31e897427ef1f1f8bc3875131021c.png', '/home/java/portal/file/59b610bbd00e480e98b9916f9bfe2c9e.png', 'png', 186131, NULL, '0', 'admin', '2024-12-23 22:50:51', '', NULL);
INSERT INTO `t_file` VALUES (2, 'b31cc1a797bc4b70a31c48e67ccf8f10', '0da31e897427ef1f1f8bc3875131021c.png', '/home/java/portal/file/b31cc1a797bc4b70a31c48e67ccf8f10.png', 'png', 186131, NULL, '0', 'admin', '2024-12-23 22:53:53', '', NULL);
INSERT INTO `t_file` VALUES (3, '6f7264aee9e34a14bc36865ad1934f42', '0da31e897427ef1f1f8bc3875131021c.png', '/home/java/portal/file/6f7264aee9e34a14bc36865ad1934f42.png', 'png', 186131, NULL, '0', 'admin', '2024-12-23 22:54:20', '', NULL);

-- ----------------------------
-- Table structure for t_news_information
-- ----------------------------
DROP TABLE IF EXISTS `t_news_information`;
CREATE TABLE `t_news_information`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '新闻ID，唯一标识',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '新闻标题',
  `category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新闻类别，例如：行业新闻、公司新闻',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '新闻发布时间',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新闻来源，例如：南韩两大半导体厂',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '新闻内容',
  `image_file_id` int(0) NULL DEFAULT NULL COMMENT '图片文件ID',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词，用于新闻搜索与索引',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category`(`category`) USING BTREE COMMENT '类别索引'
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '新闻资讯表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_news_information
-- ----------------------------
INSERT INTO `t_news_information` VALUES (1, '大陆存储器产业崛起将改变全球产业版图 韩厂备感威胁', '行业新闻', '2023-08-06 00:00:00', '南韩两大半导体厂 Samsung与SK Hynix', '南韩两大半导体厂 Samsung与SK Hynix 共同投资2000亿美元，显示韩国厂商在全球记忆体市场所面临的竞争与影响力挑战...', 1, '存储器, 半导体, 全球产业版图, 韩厂, Samsung', '0', 'admin', '2024-12-18 16:26:40', '', NULL);
INSERT INTO `t_news_information` VALUES (2, 'LED电视与OLED电视：技术差异与市场趋势分析22', '科技分析', '2023-08-10 00:00:00', 'TechInsights 分析报告', 'LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...', 2, 'LED电视, OLED电视, 技术差异, 市场趋势, 分析', '1', 'admin', '2024-12-18 16:27:14', 'admin', '2024-12-18 16:28:25');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `catalogue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品目录',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (1, 'ESD静电保护管', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (2, '场效运营（MOS管）', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (3, '电源管理', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (4, '气体放电管', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (5, '瞬态抑制二极管', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (6, '通用二三级管', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (7, '运算放大器及比较器', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (8, '开关芯片及接口芯片', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (9, '74逻辑', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (10, '电机驱动', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (11, '存储器', NULL, '0', '', NULL, '', NULL);
INSERT INTO `t_product` VALUES (12, 'ESD静电保护管222', NULL, '0', '', '2024-12-05 16:25:36', '', '2024-12-05 16:39:41');
INSERT INTO `t_product` VALUES (13, '存储器', NULL, '0', 'admin', '2024-12-25 00:22:54', '', NULL);

-- ----------------------------
-- Table structure for t_product_category
-- ----------------------------
DROP TABLE IF EXISTS `t_product_category`;
CREATE TABLE `t_product_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` bigint(0) NOT NULL COMMENT '种类ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '种类名称',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_id`(`product_id`) USING BTREE COMMENT '产品ID索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品种类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product_category
-- ----------------------------
INSERT INTO `t_product_category` VALUES (1, 1, 'ESD静电保护', '0', '', '2024-12-27 15:20:36', '', NULL);
INSERT INTO `t_product_category` VALUES (2, 1, '高分子', '0', '', '2024-12-27 15:21:52', 'admin', '2024-12-27 15:23:36');

-- ----------------------------
-- Table structure for t_product_category_field
-- ----------------------------
DROP TABLE IF EXISTS `t_product_category_field`;
CREATE TABLE `t_product_category_field`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` bigint(0) NOT NULL COMMENT '产品ID',
  `product_category_id` bigint(0) NOT NULL COMMENT '产品种类ID',
  `field_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名称',
  `sort` int(0) NOT NULL COMMENT '排序',
  `is_filter` tinyint(1) NOT NULL COMMENT '是否筛选',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_id`(`product_id`) USING BTREE COMMENT '产品ID索引',
  INDEX `idx_product_category_id`(`product_category_id`) USING BTREE COMMENT '产品种类ID索引'
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品种类字段配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product_category_field
-- ----------------------------
INSERT INTO `t_product_category_field` VALUES (52, 1, 1, '种类', 1, 1, '0', 'admin', '2024-12-27 16:42:37', '', NULL);
INSERT INTO `t_product_category_field` VALUES (53, 1, 1, 'VBR Min(V)', 2, 0, '0', 'admin', '2024-12-27 16:43:00', '', NULL);
INSERT INTO `t_product_category_field` VALUES (54, 1, 1, 'VRWM(V)', 3, 1, '0', 'admin', '2024-12-27 16:43:14', '', NULL);
INSERT INTO `t_product_category_field` VALUES (55, 1, 1, 'Channel', 4, 1, '0', 'admin', '2024-12-27 16:43:25', '', NULL);
INSERT INTO `t_product_category_field` VALUES (56, 1, 1, 'Cj(pF)', 5, 1, '0', 'admin', '2024-12-27 16:43:36', '', NULL);
INSERT INTO `t_product_category_field` VALUES (57, 1, 1, 'IPP(A)', 6, 1, '0', 'admin', '2024-12-27 16:43:47', '', NULL);
INSERT INTO `t_product_category_field` VALUES (58, 1, 1, 'PPP(8/20)', 7, 0, '0', 'admin', '2024-12-27 16:44:02', '', NULL);
INSERT INTO `t_product_category_field` VALUES (59, 1, 1, 'IR(uA)', 8, 0, '0', 'admin', '2024-12-27 16:44:16', '', NULL);
INSERT INTO `t_product_category_field` VALUES (60, 1, 1, 'VRWM(V)', 1, 1, '1', 'admin', '2024-12-27 16:45:11', 'admin', '2024-12-27 16:50:40');
INSERT INTO `t_product_category_field` VALUES (61, 1, 2, 'Package', 2, 1, '1', 'admin', '2024-12-27 16:45:25', 'admin', '2024-12-27 16:46:59');
INSERT INTO `t_product_category_field` VALUES (62, 1, 2, 'Vt', 3, 1, '0', 'admin', '2024-12-27 16:45:41', '', NULL);
INSERT INTO `t_product_category_field` VALUES (63, 1, 2, 'Vc(V)', 4, 1, '0', 'admin', '2024-12-27 16:45:52', '', NULL);
INSERT INTO `t_product_category_field` VALUES (64, 1, 2, 'Ir(uA)', 5, 1, '0', 'admin', '2024-12-27 16:46:06', '', NULL);
INSERT INTO `t_product_category_field` VALUES (65, 1, 2, 'Cj(pF)', 6, 1, '0', 'admin', '2024-12-27 16:46:17', '', NULL);

-- ----------------------------
-- Table structure for t_product_model
-- ----------------------------
DROP TABLE IF EXISTS `t_product_model`;
CREATE TABLE `t_product_model`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` bigint(0) NOT NULL COMMENT '产品ID',
  `product_category_id` bigint(0) NOT NULL COMMENT '产品种类ID',
  `packet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Package',
  `model_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '型号编号',
  `pdf_file_id` int(0) NULL DEFAULT NULL COMMENT 'pdf文件ID',
  `is_in_stock` tinyint(1) NULL DEFAULT NULL COMMENT '是否有库存，布尔值，1 表示有库存',
  `is_new` tinyint(1) NULL DEFAULT NULL COMMENT '是否为新品，布尔值，1 表示新品',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `column_name_52` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '种类',
  `column_name_53` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'VBR Min(V)',
  `column_name_54` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'VRWM(V)',
  `column_name_55` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Channel',
  `column_name_56` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Cj(pF)',
  `column_name_57` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IPP(A)',
  `column_name_58` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'PPP(8/20)',
  `column_name_59` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IR(uA)',
  `column_name_62` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Vt',
  `column_name_63` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Vc(V)',
  `column_name_64` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Ir(uA)',
  `column_name_65` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Cj(pF)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_id`(`product_id`) USING BTREE COMMENT '产品ID索引',
  INDEX `idx_model_number`(`model_number`) USING BTREE COMMENT '型号索引',
  INDEX `idx_product_category_id`(`product_category_id`) USING BTREE COMMENT '产品种类ID索引'
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品型号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_product_model
-- ----------------------------
INSERT INTO `t_product_model` VALUES (31, 1, 1, 'DFN0603-2(0201)', 'TPESD03B7AZ', 1, 0, 0, '0', 'admin', '2024-12-27 17:00:16', '', NULL, '普容ESD静电防护', '3.6V', '3.3V', '1-Line', '20pF', '8A', '80W', '0.1uA', NULL, NULL, NULL, NULL);
INSERT INTO `t_product_model` VALUES (32, 1, 1, 'DFN0603-2(0201)', 'TPESD12B6AZ', 1, 0, 0, '0', 'admin', '2024-12-27 17:02:06', '', NULL, '普容ESD静电防护', '13V', '12V', '1-Line', '13pF', '8A', '240W', '0.1uA', NULL, NULL, NULL, NULL);
INSERT INTO `t_product_model` VALUES (33, 1, 1, 'DFN0603-2(0201)', 'ESD5V0U04-0201', 1, 0, 0, '0', 'admin', '2024-12-27 17:03:00', '', NULL, '普容ESD静电防护', '6.5V', '5.0V', '1-Line', '0.3pF', '3A', '70W', '0.08uA', NULL, NULL, NULL, NULL);
INSERT INTO `t_product_model` VALUES (34, 1, 1, 'DFN0603-2(0201)', 'TPESD05B8AZ', 1, 0, 0, '0', 'admin', '2024-12-27 17:03:55', 'admin', '2024-12-27 17:09:20', '普容ESD静电防护', '5.5V', '5.0V', '1-Line', '15pF', '8A', '100W', '0.1uA', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_solution_design
-- ----------------------------
DROP TABLE IF EXISTS `t_solution_design`;
CREATE TABLE `t_solution_design`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '新闻ID，唯一标识',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `image_file_id` int(0) NULL DEFAULT NULL COMMENT '图片文件ID',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '方案设计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_solution_design
-- ----------------------------
INSERT INTO `t_solution_design` VALUES (3, 'LED电视与OLED电视：技术差异与市场趋势分析', '2023-08-10 00:00:00', 'LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...', 2, '0', 'admin', '2024-12-18 16:55:03', '', NULL);
INSERT INTO `t_solution_design` VALUES (4, 'LED电视与OLED电视：技术差异与市场趋势分析22', '2023-08-10 00:00:00', 'LED与OLED技术的差异不仅在于显示效果，更在于生产成本和市场定位，未来两者将在不同市场细分中共存发展...', 2, '1', 'admin', '2024-12-18 16:55:09', 'admin', '2024-12-18 16:57:40');

SET FOREIGN_KEY_CHECKS = 1;
