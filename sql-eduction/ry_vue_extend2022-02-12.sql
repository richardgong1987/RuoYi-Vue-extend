/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : ry_vue_extend

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 13/02/2022 23:38:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_members_manageclasses
-- ----------------------------
DROP TABLE IF EXISTS `edu_members_manageclasses`;
CREATE TABLE `edu_members_manageclasses` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '班级名称',
  `school_id` bigint NOT NULL DEFAULT '0' COMMENT '所属学校',
  `students_num` int NOT NULL DEFAULT '0' COMMENT '学生数量',
  `headteacher` bigint NOT NULL DEFAULT '0' COMMENT '班主任',
  `phone` varchar(16) NOT NULL DEFAULT '' COMMENT '电话',
  `committee` varchar(500) NOT NULL DEFAULT '' COMMENT '班委成员',
  `class_representative` varchar(500) NOT NULL DEFAULT '' COMMENT '课代表',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级管理';

-- ----------------------------
-- Records of edu_members_manageclasses
-- ----------------------------
BEGIN;
INSERT INTO `edu_members_manageclasses` VALUES (1, '计算机1班', 1, 100, 0, '', '', '', '2022-02-12 10:59:59', '2022-02-12 10:59:58', '', '');
COMMIT;

-- ----------------------------
-- Table structure for edu_members_managemembers
-- ----------------------------
DROP TABLE IF EXISTS `edu_members_managemembers`;
CREATE TABLE `edu_members_managemembers` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '会员姓名',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `type` int NOT NULL DEFAULT '0' COMMENT '注册类型',
  `school_id` bigint NOT NULL DEFAULT '0' COMMENT '所属学校',
  `class_id` bigint NOT NULL DEFAULT '0' COMMENT '所属班级',
  `vip_time` datetime DEFAULT NULL COMMENT 'VIP时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员管理';

-- ----------------------------
-- Records of edu_members_managemembers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for edu_members_manageschools
-- ----------------------------
DROP TABLE IF EXISTS `edu_members_manageschools`;
CREATE TABLE `edu_members_manageschools` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '学校名称',
  `type` int NOT NULL DEFAULT '0' COMMENT '学校类型',
  `all_classes_num` int NOT NULL DEFAULT '0' COMMENT '班级数量',
  `principal_name` varchar(50) NOT NULL DEFAULT '' COMMENT '校长姓名',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学校管理';

-- ----------------------------
-- Records of edu_members_manageschools
-- ----------------------------
BEGIN;
INSERT INTO `edu_members_manageschools` VALUES (1, '清华大学', 0, 100, '龚一', '', '2022-02-12 10:55:32', '2022-02-12 10:55:31', '', '');
COMMIT;

-- ----------------------------
-- Table structure for edu_members_managestudents
-- ----------------------------
DROP TABLE IF EXISTS `edu_members_managestudents`;
CREATE TABLE `edu_members_managestudents` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '学生姓名',
  `school_id` bigint NOT NULL DEFAULT '0' COMMENT '所属学校',
  `class_id` bigint NOT NULL DEFAULT '0' COMMENT '所属班级',
  `is_vip` char(1) NOT NULL DEFAULT 'N' COMMENT '是否vip(Y是 N否)',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学生管理';

-- ----------------------------
-- Records of edu_members_managestudents
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for edu_teacher_infos
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher_infos`;
CREATE TABLE `edu_teacher_infos` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `type` int NOT NULL DEFAULT '0' COMMENT '类型',
  `school_id` bigint NOT NULL DEFAULT '0' COMMENT '所属学校',
  `class_id` bigint NOT NULL DEFAULT '0' COMMENT '所属班级',
  `classes_nums` int NOT NULL DEFAULT '0' COMMENT '班级数量',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `birthday` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生日',
  `entry_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入职时间',
  `education` int NOT NULL DEFAULT '0' COMMENT '学历',
  `graduate_school` varchar(100) NOT NULL DEFAULT '' COMMENT '毕业院校',
  `certificate_botained` varchar(500) NOT NULL DEFAULT '' COMMENT '所获证书',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=941892032807309313 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='老师信息';

-- ----------------------------
-- Records of edu_teacher_infos
-- ----------------------------
BEGIN;
INSERT INTO `edu_teacher_infos` VALUES (941892032807309312, '龚汉金', 0, 1, 1, 1, '', '2022-02-09 00:00:00', '2022-02-16 00:00:00', 5, '北大', '', '2022-02-12 11:02:40', '2022-02-12 11:02:40', '', '');
COMMIT;

-- ----------------------------
-- Table structure for file_store_mapping
-- ----------------------------
DROP TABLE IF EXISTS `file_store_mapping`;
CREATE TABLE `file_store_mapping` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL DEFAULT '1' COMMENT '所属用户',
  `menu_id` bigint NOT NULL DEFAULT '0' COMMENT '所属目录',
  `name` varchar(500) NOT NULL COMMENT '文件名称',
  `url` varchar(600) NOT NULL COMMENT '文件URL',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件关系';

-- ----------------------------
-- Records of file_store_mapping
-- ----------------------------
BEGIN;
INSERT INTO `file_store_mapping` VALUES (2013, 1, 2000, '1.jpg', 'http://localhost:9000/education/2022/02/13/90b21198-cb32-45f4-93e5-28539b789bc8/1.jpg', 0, 'admin', '2022-02-13 17:50:59', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for file_store_menu
-- ----------------------------
DROP TABLE IF EXISTS `file_store_menu`;
CREATE TABLE `file_store_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of file_store_menu
-- ----------------------------
BEGIN;
INSERT INTO `file_store_menu` VALUES (2000, '测试', 0, 0, '', NULL, NULL, 1, 0, 'M', '0', '0', '', '#', 'admin', '2022-02-11 17:32:30', 'admin', '2022-02-13 17:50:58', '');
INSERT INTO `file_store_menu` VALUES (2001, '测试2', 2000, 0, '', NULL, NULL, 1, 0, 'M', '0', '0', NULL, '#', 'admin', '2022-02-11 19:57:57', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (4, 'file_store_menu', '菜单权限表', NULL, NULL, 'FileStoreMenu', 'crud', 'com.ruoyi.file', 'material', 'fileDrive', '菜单权限', 'ruoyi', '0', '/', '{}', 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59', NULL);
INSERT INTO `gen_table` VALUES (5, 'file_store_mapping', '文件关系', NULL, NULL, 'FileStoreMapping', 'crud', 'com.ruoyi.file', 'file', 'mapping', '文件关系', 'ruoyi', '0', '/', NULL, 'admin', '2022-02-11 22:58:56', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (30, '4', 'menu_id', '菜单ID', 'bigint', 'Long', 'menuId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (31, '4', 'menu_name', '菜单名称', 'varchar(50)', 'String', 'menuName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (32, '4', 'parent_id', '父菜单ID', 'bigint', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (33, '4', 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (34, '4', 'path', '路由地址', 'varchar(200)', 'String', 'path', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (35, '4', 'component', '组件路径', 'varchar(255)', 'String', 'component', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (36, '4', 'query', '路由参数', 'varchar(255)', 'String', 'query', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (37, '4', 'is_frame', '是否为外链（0是 1否）', 'int', 'Long', 'isFrame', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (38, '4', 'is_cache', '是否缓存（0缓存 1不缓存）', 'int', 'Long', 'isCache', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (39, '4', 'menu_type', '菜单类型（M目录 C菜单 F按钮）', 'char(1)', 'String', 'menuType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 10, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (40, '4', 'visible', '菜单状态（0显示 1隐藏）', 'char(1)', 'String', 'visible', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (41, '4', 'status', '菜单状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 12, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (42, '4', 'perms', '权限标识', 'varchar(100)', 'String', 'perms', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (43, '4', 'icon', '菜单图标', 'varchar(100)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (44, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (45, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (46, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (47, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (48, '4', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2022-02-11 09:06:41', '', '2022-02-11 09:12:59');
INSERT INTO `gen_table_column` VALUES (49, '5', 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-02-11 22:58:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '5', 'user_id', '所属用户', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-02-11 22:58:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '5', 'menu_id', '所属目录', 'bigint', 'Long', 'menuId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-02-11 22:58:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '5', 'name', '文件名称', 'varchar(500)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'textarea', '', 4, 'admin', '2022-02-11 22:58:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, '5', 'url', '文件URL', 'varchar(600)', 'String', 'url', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2022-02-11 22:58:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, '5', 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-02-11 22:58:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-02-11 22:58:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-02-11 22:58:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-02-11 22:58:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2022-02-11 22:58:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, '5', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2022-02-11 22:58:56', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-01-08 16:34:04', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-01-08 16:34:04', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-01-08 16:34:04', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'false', 'Y', 'admin', '2022-01-08 16:34:04', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-01-08 16:34:04', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '停用状态');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '登录状态列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-01-08 16:34:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-01-08 16:34:05', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-01-08 16:34:05', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-08 20:11:13');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2022-01-08 20:56:41');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-08 20:56:46');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-08 22:45:03');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-08 23:48:38');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:17:14');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:17:21');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:17:25');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:17:32');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '1', '验证码错误', '2022-01-09 13:17:36');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:18:02');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:19:39');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:20:04');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:20:17');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:21:38');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:22:11');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:28:57');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:31:12');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:31:13');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:31:16');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:31:28');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:32:18');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:33:09');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:33:51');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:36:13');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-01-09 13:37:41');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-07 23:17:53');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-11 08:44:10');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-11 10:07:54');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-11 17:22:56');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-11 19:46:05');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-11 22:05:45');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-12 10:54:43');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-12 12:49:53');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '退出成功', '2022-02-12 12:51:43');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-12 12:52:36');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-12 20:26:03');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-12 22:46:03');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-13 00:03:09');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-13 11:39:07');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-13 12:26:20');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-13 15:51:21');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-13 19:39:59');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2022-02-13 21:01:38');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3046 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-01-08 16:34:04', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-01-08 16:34:04', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-01-08 16:34:04', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-01-08 16:34:04', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-01-08 16:34:04', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-01-08 16:34:04', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-01-08 16:34:04', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-01-08 16:34:04', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-01-08 16:34:04', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-01-08 16:34:04', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-01-08 16:34:04', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-01-08 16:34:04', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-01-08 16:34:04', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-01-08 16:34:04', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-01-08 16:34:04', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-01-08 16:34:04', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-01-08 16:34:04', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-01-08 16:34:04', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-01-08 16:34:04', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-01-08 16:34:04', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-01-08 16:34:04', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-01-08 16:34:04', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3000, '会员管理', 0, 10, 'peoples', '', NULL, 1, 0, 'M', '0', '0', '', 'product', 'admin', '2022-02-13 12:26:12', '', NULL, '会员管理-目录');
INSERT INTO `sys_menu` VALUES (3001, '学校管理', 3000, 1, 'managementSchools', 'peoples/managementSchools/index', '', 1, 0, 'C', '0', '0', 'peoples:managementSchools:list', 'product-list', 'admin', '2022-02-13 12:26:12', '', NULL, '学校管理-菜单');
INSERT INTO `sys_menu` VALUES (3002, '查询', 3001, 1, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:query', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学校管理-查询-按钮');
INSERT INTO `sys_menu` VALUES (3003, '添加', 3001, 2, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:add', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学校管理-添加-按钮');
INSERT INTO `sys_menu` VALUES (3004, '编辑', 3001, 3, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:edit', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学校管理-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3005, '删除', 3001, 4, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:remove', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学校管理-删除-按钮');
INSERT INTO `sys_menu` VALUES (3006, '导入', 3001, 5, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:import', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学校管理-导入-按钮');
INSERT INTO `sys_menu` VALUES (3007, '导出', 3001, 6, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementSchools:export', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学校管理-导出-按钮');
INSERT INTO `sys_menu` VALUES (3008, '班级管理', 3000, 2, 'managementClasses', 'peoples/managementClasses/index', '', 1, 0, 'C', '0', '0', 'peoples:managementClasses:list', 'product-list', 'admin', '2022-02-13 12:26:12', '', NULL, '班级管理-菜单');
INSERT INTO `sys_menu` VALUES (3009, '查询', 3008, 1, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:query', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '班级管理-查询-按钮');
INSERT INTO `sys_menu` VALUES (3010, '添加', 3008, 2, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:add', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '班级管理-添加-按钮');
INSERT INTO `sys_menu` VALUES (3011, '编辑', 3008, 3, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:edit', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '班级管理-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3012, '删除', 3008, 4, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:remove', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '班级管理-删除-按钮');
INSERT INTO `sys_menu` VALUES (3013, '导入', 3008, 5, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:import', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '班级管理-导入-按钮');
INSERT INTO `sys_menu` VALUES (3014, '导出', 3008, 6, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementClasses:export', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '班级管理-导出-按钮');
INSERT INTO `sys_menu` VALUES (3015, '学生管理', 3000, 3, 'managementStudents', 'peoples/managementStudents/index', '', 1, 0, 'C', '0', '0', 'peoples:managementStudents:list', 'product-list', 'admin', '2022-02-13 12:26:12', '', NULL, '学生管理-菜单');
INSERT INTO `sys_menu` VALUES (3016, '查询', 3015, 1, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:query', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学生管理-查询-按钮');
INSERT INTO `sys_menu` VALUES (3017, '添加', 3015, 2, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:add', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学生管理-添加-按钮');
INSERT INTO `sys_menu` VALUES (3018, '编辑', 3015, 3, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:edit', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学生管理-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3019, '删除', 3015, 4, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:remove', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学生管理-删除-按钮');
INSERT INTO `sys_menu` VALUES (3020, '导入', 3015, 5, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:import', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学生管理-导入-按钮');
INSERT INTO `sys_menu` VALUES (3021, '导出', 3015, 6, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementStudents:export', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '学生管理-导出-按钮');
INSERT INTO `sys_menu` VALUES (3022, '会员管理', 3000, 4, 'managementMemberships', 'peoples/managementMemberships/index', '', 1, 0, 'C', '0', '0', 'peoples:managementMemberships:list', 'product-list', 'admin', '2022-02-13 12:26:12', '', NULL, '会员管理-菜单');
INSERT INTO `sys_menu` VALUES (3023, '查询', 3022, 1, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:query', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '会员管理-查询-按钮');
INSERT INTO `sys_menu` VALUES (3024, '添加', 3022, 2, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:add', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '会员管理-添加-按钮');
INSERT INTO `sys_menu` VALUES (3025, '编辑', 3022, 3, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:edit', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '会员管理-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3026, '删除', 3022, 4, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:remove', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '会员管理-删除-按钮');
INSERT INTO `sys_menu` VALUES (3027, '导入', 3022, 5, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:import', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '会员管理-导入-按钮');
INSERT INTO `sys_menu` VALUES (3028, '导出', 3022, 6, '', '', '', 1, 0, 'F', '0', '0', 'peoples:managementMemberships:export', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '会员管理-导出-按钮');
INSERT INTO `sys_menu` VALUES (3029, '资料管理', 0, 20, 'material', '', NULL, 1, 0, 'M', '0', '0', '', 'upload', 'admin', '2022-02-13 12:26:12', '', NULL, '资料管理-目录');
INSERT INTO `sys_menu` VALUES (3030, '文件管理', 3029, 1, 'fileDrive', 'material/fileDrive/index', '', 1, 0, 'C', '0', '0', 'material:fileDrive:list', 'dengji', 'admin', '2022-02-13 12:26:12', '', NULL, '文件管理-菜单');
INSERT INTO `sys_menu` VALUES (3031, '文件夹管理', 3029, 2, 'folder', 'material/folder/index', '', 1, 0, 'C', '0', '0', 'material:folder:list', 'dengji', 'admin', '2022-02-13 12:26:12', '', NULL, '文件夹管理-菜单');
INSERT INTO `sys_menu` VALUES (3032, '查询', 3030, 1, '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:query', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '文件管理-查询-按钮');
INSERT INTO `sys_menu` VALUES (3033, '添加', 3030, 2, '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:add', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '文件管理-添加-按钮');
INSERT INTO `sys_menu` VALUES (3034, '编辑', 3030, 3, '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:edit', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '文件管理-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3035, '删除', 3030, 4, '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:remove', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '文件管理-删除-按钮');
INSERT INTO `sys_menu` VALUES (3036, '导入', 3030, 5, '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:import', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '文件管理-导入-按钮');
INSERT INTO `sys_menu` VALUES (3037, '导出', 3030, 6, '', '', '', 1, 0, 'F', '0', '0', 'material:fileDrive:export', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '文件管理-导出-按钮');
INSERT INTO `sys_menu` VALUES (3038, '老师管理', 0, 30, 'teachers', '', NULL, 1, 0, 'M', '0', '0', '', 'example', 'admin', '2022-02-13 12:26:12', '', NULL, '老师管理-目录');
INSERT INTO `sys_menu` VALUES (3039, '老师信息', 3038, 1, 'teacherInfos', 'teachers/teacherInfos/index', '', 1, 0, 'C', '0', '0', 'teachers:teacherInfos:list', 'article', 'admin', '2022-02-13 12:26:12', '', NULL, '老师信息-菜单');
INSERT INTO `sys_menu` VALUES (3040, '查询', 3039, 1, '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:query', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '老师信息-查询-按钮');
INSERT INTO `sys_menu` VALUES (3041, '添加', 3039, 2, '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:add', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '老师信息-添加-按钮');
INSERT INTO `sys_menu` VALUES (3042, '编辑', 3039, 3, '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:edit', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '老师信息-编辑-按钮');
INSERT INTO `sys_menu` VALUES (3043, '删除', 3039, 4, '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:remove', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '老师信息-删除-按钮');
INSERT INTO `sys_menu` VALUES (3044, '导入', 3039, 5, '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:import', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '老师信息-导入-按钮');
INSERT INTO `sys_menu` VALUES (3045, '导出', 3039, 6, '', '', '', 1, 0, 'F', '0', '0', 'teachers:teacherInfos:export', '#', 'admin', '2022-02-13 12:26:12', '', NULL, '老师信息-导出-按钮');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-01-08 16:34:05', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-01-08 16:34:05', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_job_log', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-08 20:14:38');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-08 20:45:55');
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_notice', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-08 20:46:00');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"NoticeId\",\"usableColumn\":false,\"columnId\":9,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"noticeId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"公告ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1641645960000,\"tableId\":2,\"pk\":true,\"columnName\":\"notice_id\"},{\"capJavaField\":\"NoticeTitle\",\"usableColumn\":false,\"columnId\":10,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"noticeTitle\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公告标题\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1641645960000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"notice_title\"},{\"capJavaField\":\"NoticeType\",\"usableColumn\":false,\"columnId\":11,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"noticeType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"公告类型（1通知 2公告）\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1641645960000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"notice_type\"},{\"capJavaField\":\"NoticeContent\",\"usableColumn\":false,\"columnId\":12,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"noticeContent\",\"htmlType\":\"editor\",\"edit\":true,\"query\":true,\"columnComment\":\"公告内容\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-08 20:46:45');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-01-08 20:46:49');
INSERT INTO `sys_oper_log` VALUES (105, '直接插入项目代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCodewrite()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCodewrite', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-08 20:49:29');
INSERT INTO `sys_oper_log` VALUES (106, '直接插入项目代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCodewrite()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCodewrite', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-08 20:52:41');
INSERT INTO `sys_oper_log` VALUES (107, '直接插入项目代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCodewrite()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCodewrite', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-08 20:53:16');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-09 13:42:31');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'file_file', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-09 13:42:38');
INSERT INTO `sys_oper_log` VALUES (110, '直接插入项目代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCodewrite()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCodewrite', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-09 13:42:41');
INSERT INTO `sys_oper_log` VALUES (111, '直接插入项目代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCodewrite()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCodewrite', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-09 13:44:17');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 09:06:22');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'file_store_menu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 09:06:41');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"MenuId\",\"usableColumn\":false,\"columnId\":30,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"menuId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"菜单ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1644541601000,\"tableId\":4,\"pk\":true,\"columnName\":\"menu_id\"},{\"capJavaField\":\"MenuName\",\"usableColumn\":false,\"columnId\":31,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"menuName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"菜单名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1644541601000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"menu_name\"},{\"capJavaField\":\"ParentId\",\"usableColumn\":true,\"columnId\":32,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父菜单ID\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1644541601000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"parent_id\"},{\"capJavaField\":\"OrderNum\",\"usableColumn\":true,\"columnId\":33,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderNum\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"显示顺序\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 09:12:59');
INSERT INTO `sys_oper_log` VALUES (115, '直接插入项目代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCodewrite()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCodewrite', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 09:13:13');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.ruoyi.file.controller.FileStoreMenuController.add()', 'POST', 1, 'admin', NULL, '/material/fileDrive', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":0,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":1,\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 17:32:30');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.file.controller.FileStoreMenuController.edit()', 'PUT', 1, 'admin', NULL, '/material/fileDrive', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":0,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1644571950000,\"updateBy\":\"admin\",\"isFrame\":1,\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 19:57:40');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.ruoyi.file.controller.FileStoreMenuController.add()', 'POST', 1, 'admin', NULL, '/material/fileDrive', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":0,\"menuName\":\"测试2\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":1,\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 19:57:57');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.file.controller.FileStoreMenuController.edit()', 'PUT', 1, 'admin', NULL, '/material/fileDrive', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":0,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1644571950000,\"updateBy\":\"admin\",\"isFrame\":1,\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 22:42:23');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.file.controller.FileStoreMenuController.edit()', 'PUT', 1, 'admin', NULL, '/material/fileDrive', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":0,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1644571950000,\"updateBy\":\"admin\",\"isFrame\":1,\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 22:47:56');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'file_store_mapping', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 22:58:56');
INSERT INTO `sys_oper_log` VALUES (122, '直接插入项目代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCodewrite()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCodewrite', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 22:59:28');
INSERT INTO `sys_oper_log` VALUES (123, '直接插入项目代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCodewrite()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCodewrite', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 23:02:20');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.file.controller.FileStoreMenuController.edit()', 'PUT', 1, 'admin', NULL, '/material/fileDrive', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":0,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1644571950000,\"updateBy\":\"admin\",\"isFrame\":1,\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 23:22:26');
INSERT INTO `sys_oper_log` VALUES (125, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/11/74983f91-c4c6-40a7-8367-498c9f45c35a/Snipaste_2022-02-09_10-09-47.png\",\"createTime\":1644592969217,\"name\":\"Snipaste_2022-02-09_10-09-47.png\",\"menuId\":2000,\"id\":2000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 23:22:49');
INSERT INTO `sys_oper_log` VALUES (126, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/11/e0ce7fff-2bfd-4e0e-8104-670e0c3bcc27/Snipaste_2022-02-08_20-30-58.png\",\"createTime\":1644593464834,\"name\":\"Snipaste_2022-02-08_20-30-58.png\",\"menuId\":2000,\"id\":2001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 23:31:04');
INSERT INTO `sys_oper_log` VALUES (127, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/11/c3299296-209d-487d-a30c-766d7e333b9f/Snipaste_2022-02-11_14-48-54.png\",\"createTime\":1644593464895,\"name\":\"Snipaste_2022-02-11_14-48-54.png\",\"menuId\":2000,\"id\":2002}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 23:31:04');
INSERT INTO `sys_oper_log` VALUES (128, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2002', '127.0.0.1', '内网IP', '{ids=2002}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 23:31:55');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.file.controller.FileStoreMenuController.edit()', 'PUT', 1, 'admin', NULL, '/material/fileDrive', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":0,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1644571950000,\"updateBy\":\"admin\",\"isFrame\":1,\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 23:33:31');
INSERT INTO `sys_oper_log` VALUES (130, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/11/8450578c-5b63-447b-ac12-c4e47c3406dd/Snipaste_2022-02-11_14-49-40.png\",\"createTime\":1644593611566,\"name\":\"Snipaste_2022-02-11_14-49-40.png\",\"menuId\":2000,\"id\":2003}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-11 23:33:31');
INSERT INTO `sys_oper_log` VALUES (131, '学校管理', 1, 'com.ruoyi.educationadmin.controller.EduMembersManageschoolsController.add()', 'POST', 1, 'admin', NULL, '/peoples/managementSchools', '127.0.0.1', '内网IP', '{\"principalName\":\"龚一\",\"allClassesNum\":100,\"params\":{},\"type\":0,\"createTime\":1644634531626,\"name\":\"清华大学\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 10:55:31');
INSERT INTO `sys_oper_log` VALUES (132, '班级管理', 1, 'com.ruoyi.educationadmin.controller.EduMembersManageclassesController.add()', 'POST', 1, 'admin', NULL, '/peoples/managementClasses', '127.0.0.1', '内网IP', '{\"committee\":\"\",\"params\":{},\"studentsNum\":100,\"createTime\":1644634798561,\"schoolId\":1,\"name\":\"计算机1班\",\"id\":1,\"classRepresentative\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 10:59:58');
INSERT INTO `sys_oper_log` VALUES (133, '老师信息', 1, 'com.ruoyi.educationadmin.controller.EduTeacherInfosController.add()', 'POST', 1, 'admin', NULL, '/teachers/teacherInfos', '127.0.0.1', '内网IP', '{\"birthday\":1644336000000,\"graduateSchool\":\"北大\",\"education\":5,\"params\":{},\"classId\":1,\"classesNums\":1,\"entryTime\":1644940800000,\"createTime\":1644634960129,\"schoolId\":1,\"name\":\"龚汉金\",\"id\":941892032807309312}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 11:02:40');
INSERT INTO `sys_oper_log` VALUES (134, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2001', '127.0.0.1', '内网IP', '{ids=2001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 20:26:20');
INSERT INTO `sys_oper_log` VALUES (135, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2003', '127.0.0.1', '内网IP', '{ids=2003}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 20:26:22');
INSERT INTO `sys_oper_log` VALUES (136, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2000', '127.0.0.1', '内网IP', '{ids=2000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 20:26:24');
INSERT INTO `sys_oper_log` VALUES (137, '目录管理', 2, 'com.ruoyi.file.controller.FileStoreMenuController.edit()', 'PUT', 1, 'admin', NULL, '/material/fileDrive', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":0,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1644571950000,\"updateBy\":\"admin\",\"isFrame\":1,\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 20:26:34');
INSERT INTO `sys_oper_log` VALUES (138, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"createBy\":\"admin\",\"createTime\":1644668794102,\"menuId\":2000}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n### The error may exist in file [/Users/richard/IdeaProjects/RuoYi-Vue-extend/ruoyi-file/target/classes/mapper/file/FileStoreMappingMapper.xml]\n### The error may involve com.ruoyi.file.mapper.FileStoreMappingMapper.insertFileStoreMapping-Inline\n### The error occurred while setting parameters\n### SQL: insert into file_store_mapping          ( user_id,             menu_id,                                                    create_by,             create_time )           values ( ?,             ?,                                                    ?,             ? )\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '2022-02-12 20:26:34');
INSERT INTO `sys_oper_log` VALUES (139, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"createBy\":\"admin\",\"createTime\":1644668818470,\"menuId\":2000}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n### The error may exist in file [/Users/richard/IdeaProjects/RuoYi-Vue-extend/ruoyi-file/target/classes/mapper/file/FileStoreMappingMapper.xml]\n### The error may involve com.ruoyi.file.mapper.FileStoreMappingMapper.insertFileStoreMapping-Inline\n### The error occurred while setting parameters\n### SQL: insert into file_store_mapping          ( user_id,             menu_id,                                                    create_by,             create_time )           values ( ?,             ?,                                                    ?,             ? )\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '2022-02-12 20:26:58');
INSERT INTO `sys_oper_log` VALUES (140, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"createBy\":\"admin\",\"createTime\":1644669038263,\"menuId\":2000}', NULL, 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n### The error may exist in file [/Users/richard/IdeaProjects/RuoYi-Vue-extend/ruoyi-file/target/classes/mapper/file/FileStoreMappingMapper.xml]\n### The error may involve com.ruoyi.file.mapper.FileStoreMappingMapper.insertFileStoreMapping-Inline\n### The error occurred while setting parameters\n### SQL: insert into file_store_mapping          ( user_id,             menu_id,                                                    create_by,             create_time )           values ( ?,             ?,                                                    ?,             ? )\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '2022-02-12 20:30:38');
INSERT INTO `sys_oper_log` VALUES (141, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/12/aef2e684-91a8-48fa-a406-35e065cea1fb/1.jpg\",\"createBy\":\"admin\",\"createTime\":1644669198876,\"name\":\"1.jpg\",\"menuId\":2000,\"id\":2004}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 20:33:18');
INSERT INTO `sys_oper_log` VALUES (142, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2004', '127.0.0.1', '内网IP', '{ids=2004}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 20:33:42');
INSERT INTO `sys_oper_log` VALUES (143, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/12/93762326-c223-4822-9798-6742c78a8e75/1.jpg\",\"createBy\":\"admin\",\"createTime\":1644669498941,\"name\":\"1.jpg\",\"menuId\":2000,\"id\":2005}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 20:38:18');
INSERT INTO `sys_oper_log` VALUES (144, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2005', '127.0.0.1', '内网IP', '{ids=2005}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 20:39:26');
INSERT INTO `sys_oper_log` VALUES (145, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/12/09fe83a5-da60-4c08-96db-0275a938e587/1.jpg\",\"createBy\":\"admin\",\"createTime\":1644669639446,\"name\":\"1.jpg\",\"menuId\":2000,\"id\":2006}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 20:40:39');
INSERT INTO `sys_oper_log` VALUES (146, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2006', '127.0.0.1', '内网IP', '{ids=2006}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 22:47:27');
INSERT INTO `sys_oper_log` VALUES (147, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/12/b9e9f18b-3366-4d31-87ab-39dd23d9ba16/1.jpg\",\"createBy\":\"admin\",\"createTime\":1644677272032,\"name\":\"1.jpg\",\"menuId\":2000,\"id\":2007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 22:47:52');
INSERT INTO `sys_oper_log` VALUES (148, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2007', '127.0.0.1', '内网IP', '{ids=2007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 22:48:30');
INSERT INTO `sys_oper_log` VALUES (149, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/12/04765c7c-8a33-4c8a-bf82-122e8803dc05/1.jpg\",\"createBy\":\"admin\",\"createTime\":1644677374378,\"name\":\"1.jpg\",\"menuId\":2000,\"id\":2008}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 22:49:34');
INSERT INTO `sys_oper_log` VALUES (150, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/12/2bc65407-2eac-41ae-835a-d906095c046a/2.jpg\",\"createBy\":\"admin\",\"createTime\":1644677443502,\"name\":\"2.jpg\",\"menuId\":2000,\"id\":2009}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 22:50:43');
INSERT INTO `sys_oper_log` VALUES (151, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/12/0ce9965f-0ce4-4bc5-81be-5b84074e1c89/3.jpg\",\"createBy\":\"admin\",\"createTime\":1644677567767,\"name\":\"3.jpg\",\"menuId\":2000,\"id\":2010}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 22:52:47');
INSERT INTO `sys_oper_log` VALUES (152, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2010', '127.0.0.1', '内网IP', '{ids=2010}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 22:57:18');
INSERT INTO `sys_oper_log` VALUES (153, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2008', '127.0.0.1', '内网IP', '{ids=2008}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 23:01:50');
INSERT INTO `sys_oper_log` VALUES (154, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2009', '127.0.0.1', '内网IP', '{ids=2009}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 23:02:03');
INSERT INTO `sys_oper_log` VALUES (155, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/12/1855d2de-0019-42fb-bc09-d769cb5170f8/5.jpg\",\"createBy\":\"admin\",\"createTime\":1644678143893,\"name\":\"5.jpg\",\"menuId\":2000,\"id\":2011}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 23:02:23');
INSERT INTO `sys_oper_log` VALUES (156, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2011', '127.0.0.1', '内网IP', '{ids=2011}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-12 23:02:43');
INSERT INTO `sys_oper_log` VALUES (157, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/13/0cd024a8-0e62-474b-8bc0-3b1c25f604c1/1.jpg\",\"createBy\":\"admin\",\"createTime\":1644681806434,\"name\":\"1.jpg\",\"menuId\":2000,\"id\":2012}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-13 00:03:26');
INSERT INTO `sys_oper_log` VALUES (158, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.remove()', 'DELETE', 1, 'admin', NULL, '/file/mapping/2012', '127.0.0.1', '内网IP', '{ids=2012}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-13 00:04:02');
INSERT INTO `sys_oper_log` VALUES (159, '目录管理', 2, 'com.ruoyi.file.controller.FileStoreMenuController.edit()', 'PUT', 1, 'admin', NULL, '/material/fileDrive', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":0,\"menuName\":\"测试\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1644571950000,\"updateBy\":\"admin\",\"isFrame\":1,\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-13 17:50:58');
INSERT INTO `sys_oper_log` VALUES (160, '文件关系', 1, 'com.ruoyi.file.controller.FileStoreMappingController.add()', 'POST', 1, 'admin', NULL, '/file/mapping', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":1,\"url\":\"http://localhost:9000/education/2022/02/13/90b21198-cb32-45f4-93e5-28539b789bc8/1.jpg\",\"createBy\":\"admin\",\"createTime\":1644745858581,\"name\":\"1.jpg\",\"menuId\":2000,\"id\":2013}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-02-13 17:50:58');
INSERT INTO `sys_oper_log` VALUES (161, '文件关系', 3, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2022-02-13 19:45:43');
INSERT INTO `sys_oper_log` VALUES (162, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2022-02-13 19:47:56');
INSERT INTO `sys_oper_log` VALUES (163, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2022-02-13 19:48:12');
INSERT INTO `sys_oper_log` VALUES (164, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{}]}', 0, NULL, '2022-02-13 19:48:44');
INSERT INTO `sys_oper_log` VALUES (165, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{}]}', 0, NULL, '2022-02-13 19:49:00');
INSERT INTO `sys_oper_log` VALUES (166, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{}]}', 0, NULL, '2022-02-13 19:49:46');
INSERT INTO `sys_oper_log` VALUES (167, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{},{}]}', 0, NULL, '2022-02-13 19:51:56');
INSERT INTO `sys_oper_log` VALUES (168, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{},{}]}', 0, NULL, '2022-02-13 19:52:03');
INSERT INTO `sys_oper_log` VALUES (169, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{},{}]}', 0, NULL, '2022-02-13 19:54:17');
INSERT INTO `sys_oper_log` VALUES (170, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{},{}]}', 0, NULL, '2022-02-13 19:54:40');
INSERT INTO `sys_oper_log` VALUES (171, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{},{}]}', 0, NULL, '2022-02-13 20:02:53');
INSERT INTO `sys_oper_log` VALUES (172, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{}]}', 0, NULL, '2022-02-13 20:11:51');
INSERT INTO `sys_oper_log` VALUES (173, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{}]}', 0, NULL, '2022-02-13 20:14:04');
INSERT INTO `sys_oper_log` VALUES (174, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{}]}', 0, NULL, '2022-02-13 20:17:19');
INSERT INTO `sys_oper_log` VALUES (175, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"deleteMarker\":false,\"dir\":true,\"latest\":false}]}', 0, NULL, '2022-02-13 20:19:56');
INSERT INTO `sys_oper_log` VALUES (176, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"deleteMarker\":false,\"dir\":true,\"latest\":false}]}', 0, NULL, '2022-02-13 20:20:07');
INSERT INTO `sys_oper_log` VALUES (177, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"deleteMarker\":false,\"dir\":true,\"latest\":false}]}', 0, NULL, '2022-02-13 20:23:34');
INSERT INTO `sys_oper_log` VALUES (178, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"deleteMarker\":false,\"dir\":true,\"latest\":false}]}', 0, NULL, '2022-02-13 20:24:06');
INSERT INTO `sys_oper_log` VALUES (179, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"deleteMarker\":false,\"dir\":true,\"latest\":false}]}', 0, NULL, '2022-02-13 20:24:11');
INSERT INTO `sys_oper_log` VALUES (180, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"deleteMarker\":false,\"dir\":true,\"latest\":false}]}', 0, NULL, '2022-02-13 20:29:58');
INSERT INTO `sys_oper_log` VALUES (181, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 20:31:34');
INSERT INTO `sys_oper_log` VALUES (182, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:01:43');
INSERT INTO `sys_oper_log` VALUES (183, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:02:28');
INSERT INTO `sys_oper_log` VALUES (184, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:02:28');
INSERT INTO `sys_oper_log` VALUES (185, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:08:41');
INSERT INTO `sys_oper_log` VALUES (186, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:08:58');
INSERT INTO `sys_oper_log` VALUES (187, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:11:07');
INSERT INTO `sys_oper_log` VALUES (188, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:11:44');
INSERT INTO `sys_oper_log` VALUES (189, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:12:32');
INSERT INTO `sys_oper_log` VALUES (190, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:13:21');
INSERT INTO `sys_oper_log` VALUES (191, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:13:26');
INSERT INTO `sys_oper_log` VALUES (192, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:13:33');
INSERT INTO `sys_oper_log` VALUES (193, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:15:12');
INSERT INTO `sys_oper_log` VALUES (194, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2022-02-13 21:15:23');
INSERT INTO `sys_oper_log` VALUES (195, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:15:30');
INSERT INTO `sys_oper_log` VALUES (196, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:16:14');
INSERT INTO `sys_oper_log` VALUES (197, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2022-02-13 21:16:30');
INSERT INTO `sys_oper_log` VALUES (198, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:17:17');
INSERT INTO `sys_oper_log` VALUES (199, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:17:26');
INSERT INTO `sys_oper_log` VALUES (200, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:17:32');
INSERT INTO `sys_oper_log` VALUES (201, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:17:36');
INSERT INTO `sys_oper_log` VALUES (202, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2022-02-13 21:18:09');
INSERT INTO `sys_oper_log` VALUES (203, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:19:03');
INSERT INTO `sys_oper_log` VALUES (204, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:19:10');
INSERT INTO `sys_oper_log` VALUES (205, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:20:21');
INSERT INTO `sys_oper_log` VALUES (206, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:20:24');
INSERT INTO `sys_oper_log` VALUES (207, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:21:47');
INSERT INTO `sys_oper_log` VALUES (208, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:24:25');
INSERT INTO `sys_oper_log` VALUES (209, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:24:29');
INSERT INTO `sys_oper_log` VALUES (210, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Object name contains unsupported characters.', '2022-02-13 21:24:38');
INSERT INTO `sys_oper_log` VALUES (211, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Object name contains unsupported characters.', '2022-02-13 21:24:46');
INSERT INTO `sys_oper_log` VALUES (212, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Object name contains unsupported characters.', '2022-02-13 21:26:23');
INSERT INTO `sys_oper_log` VALUES (213, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:27:26');
INSERT INTO `sys_oper_log` VALUES (214, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:27:30');
INSERT INTO `sys_oper_log` VALUES (215, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 21:27:40');
INSERT INTO `sys_oper_log` VALUES (216, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:28:13');
INSERT INTO `sys_oper_log` VALUES (217, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:41:19');
INSERT INTO `sys_oper_log` VALUES (218, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:41:46');
INSERT INTO `sys_oper_log` VALUES (219, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:42:22');
INSERT INTO `sys_oper_log` VALUES (220, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 21:42:25');
INSERT INTO `sys_oper_log` VALUES (221, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:44:30');
INSERT INTO `sys_oper_log` VALUES (222, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:45:24');
INSERT INTO `sys_oper_log` VALUES (223, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:46:10');
INSERT INTO `sys_oper_log` VALUES (224, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:46:29');
INSERT INTO `sys_oper_log` VALUES (225, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:47:18');
INSERT INTO `sys_oper_log` VALUES (226, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:47:21');
INSERT INTO `sys_oper_log` VALUES (227, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 21:47:22');
INSERT INTO `sys_oper_log` VALUES (228, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:47:37');
INSERT INTO `sys_oper_log` VALUES (229, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:49:40');
INSERT INTO `sys_oper_log` VALUES (230, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:49:42');
INSERT INTO `sys_oper_log` VALUES (231, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:50:12');
INSERT INTO `sys_oper_log` VALUES (232, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:50:13');
INSERT INTO `sys_oper_log` VALUES (233, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 21:50:15');
INSERT INTO `sys_oper_log` VALUES (234, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:50:52');
INSERT INTO `sys_oper_log` VALUES (235, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:51:18');
INSERT INTO `sys_oper_log` VALUES (236, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:51:35');
INSERT INTO `sys_oper_log` VALUES (237, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:51:48');
INSERT INTO `sys_oper_log` VALUES (238, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:51:49');
INSERT INTO `sys_oper_log` VALUES (239, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 21:51:52');
INSERT INTO `sys_oper_log` VALUES (240, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:53:50');
INSERT INTO `sys_oper_log` VALUES (241, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:53:53');
INSERT INTO `sys_oper_log` VALUES (242, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:54:05');
INSERT INTO `sys_oper_log` VALUES (243, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/002A Frog Food.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/10.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/10.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/11.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/11.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/12.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/12.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/13.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/13.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/14.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/14.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/15.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/15.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/16.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/16.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/17.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/17.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/18.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food', 0, NULL, '2022-02-13 21:54:08');
INSERT INTO `sys_oper_log` VALUES (244, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:54:59');
INSERT INTO `sys_oper_log` VALUES (245, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:55:09');
INSERT INTO `sys_oper_log` VALUES (246, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:57:48');
INSERT INTO `sys_oper_log` VALUES (247, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:57:57');
INSERT INTO `sys_oper_log` VALUES (248, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:59:23');
INSERT INTO `sys_oper_log` VALUES (249, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:59:51');
INSERT INTO `sys_oper_log` VALUES (250, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 21:59:52');
INSERT INTO `sys_oper_log` VALUES (251, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:00:11');
INSERT INTO `sys_oper_log` VALUES (252, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:00:13');
INSERT INTO `sys_oper_log` VALUES (253, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:00:28');
INSERT INTO `sys_oper_log` VALUES (254, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:01:00');
INSERT INTO `sys_oper_log` VALUES (255, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:01:01');
INSERT INTO `sys_oper_log` VALUES (256, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:03:25');
INSERT INTO `sys_oper_log` VALUES (257, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:03:38');
INSERT INTO `sys_oper_log` VALUES (258, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:03:40');
INSERT INTO `sys_oper_log` VALUES (259, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:04:38');
INSERT INTO `sys_oper_log` VALUES (260, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:04:40');
INSERT INTO `sys_oper_log` VALUES (261, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 22:04:41');
INSERT INTO `sys_oper_log` VALUES (262, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:06:14');
INSERT INTO `sys_oper_log` VALUES (263, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:10:47');
INSERT INTO `sys_oper_log` VALUES (264, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:10:49');
INSERT INTO `sys_oper_log` VALUES (265, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 22:10:54');
INSERT INTO `sys_oper_log` VALUES (266, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:11:14');
INSERT INTO `sys_oper_log` VALUES (267, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:11:16');
INSERT INTO `sys_oper_log` VALUES (268, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 22:11:19');
INSERT INTO `sys_oper_log` VALUES (269, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:12:42');
INSERT INTO `sys_oper_log` VALUES (270, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:12:43');
INSERT INTO `sys_oper_log` VALUES (271, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[]}', 0, NULL, '2022-02-13 22:12:46');
INSERT INTO `sys_oper_log` VALUES (272, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:13:01');
INSERT INTO `sys_oper_log` VALUES (273, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:13:17');
INSERT INTO `sys_oper_log` VALUES (274, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:13:19');
INSERT INTO `sys_oper_log` VALUES (275, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 22:13:21');
INSERT INTO `sys_oper_log` VALUES (276, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:13:22');
INSERT INTO `sys_oper_log` VALUES (277, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:13:24');
INSERT INTO `sys_oper_log` VALUES (278, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:13:25');
INSERT INTO `sys_oper_log` VALUES (279, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:13:26');
INSERT INTO `sys_oper_log` VALUES (280, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/002A Frog Food.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/10.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/10.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/11.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/11.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/12.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/12.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/13.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/13.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/14.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/14.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/15.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/15.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/16.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/16.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/17.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/17.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/18.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food', 0, NULL, '2022-02-13 22:13:28');
INSERT INTO `sys_oper_log` VALUES (281, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:13:30');
INSERT INTO `sys_oper_log` VALUES (282, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:14:44');
INSERT INTO `sys_oper_log` VALUES (283, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:14:45');
INSERT INTO `sys_oper_log` VALUES (284, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:14:47');
INSERT INTO `sys_oper_log` VALUES (285, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:14:48');
INSERT INTO `sys_oper_log` VALUES (286, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 22:14:49');
INSERT INTO `sys_oper_log` VALUES (287, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:14:50');
INSERT INTO `sys_oper_log` VALUES (288, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:14:53');
INSERT INTO `sys_oper_log` VALUES (289, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:14:58');
INSERT INTO `sys_oper_log` VALUES (290, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:14:59');
INSERT INTO `sys_oper_log` VALUES (291, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:02');
INSERT INTO `sys_oper_log` VALUES (292, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:35');
INSERT INTO `sys_oper_log` VALUES (293, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:36');
INSERT INTO `sys_oper_log` VALUES (294, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:37');
INSERT INTO `sys_oper_log` VALUES (295, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:38');
INSERT INTO `sys_oper_log` VALUES (296, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 22:15:39');
INSERT INTO `sys_oper_log` VALUES (297, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:40');
INSERT INTO `sys_oper_log` VALUES (298, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:41');
INSERT INTO `sys_oper_log` VALUES (299, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/002A Frog Food.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/10.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/10.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/11.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/11.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/12.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/12.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/13.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/13.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/14.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/14.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/15.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/15.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/16.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/16.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/17.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/17.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/18.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food', 0, NULL, '2022-02-13 22:15:43');
INSERT INTO `sys_oper_log` VALUES (300, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:44');
INSERT INTO `sys_oper_log` VALUES (301, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:45');
INSERT INTO `sys_oper_log` VALUES (302, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:50');
INSERT INTO `sys_oper_log` VALUES (303, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:52');
INSERT INTO `sys_oper_log` VALUES (304, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:53');
INSERT INTO `sys_oper_log` VALUES (305, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:55');
INSERT INTO `sys_oper_log` VALUES (306, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:15:56');
INSERT INTO `sys_oper_log` VALUES (307, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:16:03');
INSERT INTO `sys_oper_log` VALUES (308, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:16:04');
INSERT INTO `sys_oper_log` VALUES (309, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/WakingUp/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/WakingUp/AFrogFood/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:16:05');
INSERT INTO `sys_oper_log` VALUES (310, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:16:06');
INSERT INTO `sys_oper_log` VALUES (311, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:16:07');
INSERT INTO `sys_oper_log` VALUES (312, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 22:16:08');
INSERT INTO `sys_oper_log` VALUES (313, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:16:09');
INSERT INTO `sys_oper_log` VALUES (314, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:16:19');
INSERT INTO `sys_oper_log` VALUES (315, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:17:26');
INSERT INTO `sys_oper_log` VALUES (316, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:17:30');
INSERT INTO `sys_oper_log` VALUES (317, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:17:31');
INSERT INTO `sys_oper_log` VALUES (318, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/002A Frog Food.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/10.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/10.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/11.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/11.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/12.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/12.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/13.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/13.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/14.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/14.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/15.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/15.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/16.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/16.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/17.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/17.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/18.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food', 0, NULL, '2022-02-13 22:17:33');
INSERT INTO `sys_oper_log` VALUES (319, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:17:34');
INSERT INTO `sys_oper_log` VALUES (320, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:17:44');
INSERT INTO `sys_oper_log` VALUES (321, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:17:45');
INSERT INTO `sys_oper_log` VALUES (322, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:17:47');
INSERT INTO `sys_oper_log` VALUES (323, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:17:49');
INSERT INTO `sys_oper_log` VALUES (324, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/001A Waking Up.xls\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/1.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/2.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/3.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/4.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/5.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/6.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/7.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/8.mp3\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.jpg\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/9.mp3\",\"isDir\":false}]}', 0, NULL, '2022-02-13 22:17:50');
INSERT INTO `sys_oper_log` VALUES (325, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:18:14');
INSERT INTO `sys_oper_log` VALUES (326, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:27:46');
INSERT INTO `sys_oper_log` VALUES (327, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:28:45');
INSERT INTO `sys_oper_log` VALUES (328, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/HeinemannG1-JPG/001A Waking Up/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/002A Frog Food/\",\"isDir\":true},{\"objectName\":\"1/HeinemannG1-JPG/003A The New Puppy/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:28:48');
INSERT INTO `sys_oper_log` VALUES (329, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:28:49');
INSERT INTO `sys_oper_log` VALUES (330, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/WakingUp/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/WakingUp/AFrogFood/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:28:50');
INSERT INTO `sys_oper_log` VALUES (331, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/WakingUp/AFrogFood/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/WakingUp/AFrogFood/BFrogFood/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:28:51');
INSERT INTO `sys_oper_log` VALUES (332, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/WakingUp/AFrogFood/BFrogFood/1.jpg\",\"isDir\":false}]}', 0, NULL, '2022-02-13 22:28:52');
INSERT INTO `sys_oper_log` VALUES (333, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/WakingUp/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/WakingUp/AFrogFood/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:28:54');
INSERT INTO `sys_oper_log` VALUES (334, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:28:54');
INSERT INTO `sys_oper_log` VALUES (335, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/WakingUp/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/WakingUp/AFrogFood/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:28:56');
INSERT INTO `sys_oper_log` VALUES (336, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/WakingUp/AFrogFood/.DS_Store\",\"isDir\":false},{\"objectName\":\"1/WakingUp/AFrogFood/BFrogFood/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:28:56');
INSERT INTO `sys_oper_log` VALUES (337, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/WakingUp/AFrogFood/BFrogFood/1.jpg\",\"isDir\":false}]}', 0, NULL, '2022-02-13 22:28:57');
INSERT INTO `sys_oper_log` VALUES (338, '文件关系', 0, 'com.ruoyi.file.controller.FileStoreMappingController.listObjects()', 'GET', 1, 'admin', NULL, '/file/mapping/listObjects', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":[{\"objectName\":\"1/HeinemannG1-JPG/\",\"isDir\":true},{\"objectName\":\"1/WakingUp/\",\"isDir\":true}]}', 0, NULL, '2022-02-13 22:29:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-01-08 16:34:04', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-01-08 16:34:04', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-01-08 16:34:04', '', NULL, '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-02-13 21:01:38', 'admin', '2022-01-08 16:34:04', '', '2022-02-13 21:01:38', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-01-08 16:34:04', 'admin', '2022-01-08 16:34:04', '', NULL, '测试员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
