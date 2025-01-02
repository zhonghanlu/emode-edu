/*
 Navicat Premium Data Transfer

 Source Server         : mysql8.3
 Source Server Type    : MySQL
 Source Server Version : 80300 (8.3.0)
 Source Host           : localhost:3307
 Source Schema         : emode

 Target Server Type    : MySQL
 Target Server Version : 80300 (8.3.0)
 File Encoding         : 65001

 Date: 02/01/2025 17:28:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '上级ID，一级菜单为0',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `menu_path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单path',
  `menu_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `permissions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:list,sys:user:save)',
  `menu_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型：目录、按钮、菜单',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识1未删除-1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统权限详细记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 0, '机构管理', 'org', '', '', 'Directory', NULL, 1, 1);
INSERT INTO `auth_permission` VALUES (2, 0, '课程管理', 'course', '', '', 'Directory', NULL, 2, 1);
INSERT INTO `auth_permission` VALUES (3, 0, '售课核销', 'sale', '', '', 'Directory', NULL, 3, 1);
INSERT INTO `auth_permission` VALUES (4, 0, '家校一体', 'school', '', '', 'Directory', NULL, 4, 1);
INSERT INTO `auth_permission` VALUES (5, 0, '学生端管理', 'student', '', '', 'Directory', NULL, 5, 1);
INSERT INTO `auth_permission` VALUES (6, 0, '运营管理', 'operate', '', '', 'Directory', NULL, 6, 1);
INSERT INTO `auth_permission` VALUES (7, 0, '系统管理', 'system', '', '', 'Directory', NULL, 7, 1);
INSERT INTO `auth_permission` VALUES (100, 1, '学生管理', 'stu', '/org/stu/index', 'org:stu:list', 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` VALUES (101, 1, '家长管理', 'patriarch', '/org/patriarch/index', 'org:patriarch:list', 'Menu', NULL, 2, -1);
INSERT INTO `auth_permission` VALUES (102, 1, '教师管理', 'tea', '/org/tea/index', 'org:tea:list', 'Menu', NULL, 3, -1);
INSERT INTO `auth_permission` VALUES (103, 1, '教室管理', 'room', '/org/room/index', 'org:room:list', 'Menu', NULL, 4, -1);
INSERT INTO `auth_permission` VALUES (104, 1, '校区管理', 'school', '/org/school/index', 'org:school:list', 'Menu', NULL, 5, -1);
INSERT INTO `auth_permission` VALUES (105, 2, '待核销管理', 'class', '/course/class/index', 'course:class:list', 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` VALUES (106, 2, '班级管理', 'grade', '/course/grade/index', 'course:grade:list', 'Menu', NULL, 2, -1);
INSERT INTO `auth_permission` VALUES (107, 2, '课表管理', 'schedule', '/course/schedule/index', 'course:schedule:list', 'Menu', NULL, 3, -1);
INSERT INTO `auth_permission` VALUES (108, 2, '上课管理', 'up', '/course/up/index', 'course:up:list', 'Menu', NULL, 4, -1);
INSERT INTO `auth_permission` VALUES (109, 2, '缺课管理', 'lack', '/course/lack/index', 'course:lack:list', 'Menu', NULL, 5, -1);
INSERT INTO `auth_permission` VALUES (110, 2, '补课管理', 'repair', '/course/repair/index', 'course:repair:list', 'Menu', NULL, 6, -1);
INSERT INTO `auth_permission` VALUES (111, 3, '商品管理', 'product', '/sale/product/index', 'sale:product:list', 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` VALUES (112, 3, '订单管理', 'order', '/sale/order/index', 'sale:order:list', 'Menu', NULL, 2, -1);
INSERT INTO `auth_permission` VALUES (113, 3, '线下收款', 'patch', '/sale/patch/index', 'sale:patcht:list', 'Menu', NULL, 3, -1);
INSERT INTO `auth_permission` VALUES (114, 4, '家教老师', NULL, NULL, NULL, 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` VALUES (115, 4, '家教申请', NULL, NULL, NULL, 'Menu', NULL, 2, -1);
INSERT INTO `auth_permission` VALUES (116, 4, '安心到家', NULL, NULL, NULL, 'Menu', NULL, 3, -1);
INSERT INTO `auth_permission` VALUES (117, 5, '待更新', NULL, NULL, NULL, 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` VALUES (118, 6, '总账管理', NULL, NULL, NULL, 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` VALUES (119, 6, '数据报表', NULL, NULL, NULL, 'Menu', NULL, 2, -1);
INSERT INTO `auth_permission` VALUES (120, 6, '海报管理', NULL, NULL, NULL, 'Menu', NULL, 3, -1);
INSERT INTO `auth_permission` VALUES (121, 6, '拉新管理', NULL, NULL, NULL, 'Menu', NULL, 4, -1);
INSERT INTO `auth_permission` VALUES (122, 6, '意见箱管理', NULL, NULL, NULL, 'Menu', NULL, 5, -1);
INSERT INTO `auth_permission` VALUES (123, 7, '用户管理', 'user', '/system/user/index', 'system:user:list', 'Menu', NULL, 1, 1);
INSERT INTO `auth_permission` VALUES (124, 7, '角色管理', 'role', '/system/role/index', 'system:role:list', 'Menu', NULL, 2, 1);
INSERT INTO `auth_permission` VALUES (125, 7, '权限管理', 'auth', '/system/auth/index', 'system:auth:list', 'Menu', NULL, 3, 1);
INSERT INTO `auth_permission` VALUES (126, 7, '参数配置', 'config', '/system/config/index', 'system:config:list', 'Menu', NULL, 4, 1);
INSERT INTO `auth_permission` VALUES (127, 7, '文件管理', 'file', '/system/file/index', 'system:file:list', 'Menu', NULL, 5, 1);
INSERT INTO `auth_permission` VALUES (128, 7, '日志管理', 'log', '', '', 'Menu', NULL, 6, 1);
INSERT INTO `auth_permission` VALUES (129, 7, '站内信', 'notice', '/system/notice/index', 'system:notice:list', 'Menu', NULL, 7, 1);
INSERT INTO `auth_permission` VALUES (200, 128, '登录日志', 'login_log', '/system/login_log/index', 'system:login_log:list', 'Menu', NULL, 1, 1);
INSERT INTO `auth_permission` VALUES (201, 128, '操作日志', 'opt_log', '/system/opt_log/index', 'system:opt_log:list', 'Menu', NULL, 2, 1);
INSERT INTO `auth_permission` VALUES (1000, 123, '用户查询', NULL, NULL, 'system:user:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` VALUES (1001, 123, '用户新增', NULL, NULL, 'system:user:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` VALUES (1002, 123, '用户修改', NULL, NULL, 'system:user:edit', 'Button', '#', 3, 1);
INSERT INTO `auth_permission` VALUES (1003, 124, '角色查询', NULL, NULL, 'system:role:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` VALUES (1004, 124, '角色新增', NULL, NULL, 'system:role:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` VALUES (1005, 124, '角色修改', NULL, NULL, 'system:role:edit', 'Button', '#', 3, 1);
INSERT INTO `auth_permission` VALUES (1006, 124, '角色删除', NULL, NULL, 'system:role:remove', 'Button', '#', 4, 1);
INSERT INTO `auth_permission` VALUES (1007, 125, '权限查询', NULL, NULL, 'system:auth:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` VALUES (1008, 125, '权限新增', NULL, NULL, 'system:auth:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` VALUES (1009, 125, '权限修改', NULL, NULL, 'system:auth:edit', 'Button', '#', 3, 1);
INSERT INTO `auth_permission` VALUES (1010, 125, '权限删除', NULL, NULL, 'system:auth:remove', 'Button', '#', 4, 1);
INSERT INTO `auth_permission` VALUES (1011, 126, '参数查询', NULL, NULL, 'system:config:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` VALUES (1012, 126, '参数新增', NULL, NULL, 'system:config:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` VALUES (1013, 126, '参数修改', NULL, NULL, 'system:config:edit', 'Button', '#', 3, 1);
INSERT INTO `auth_permission` VALUES (1014, 126, '参数删除', NULL, NULL, 'system:config:remove', 'Button', '#', 4, 1);
INSERT INTO `auth_permission` VALUES (1015, 127, '文件查询', NULL, NULL, 'system:file:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` VALUES (1016, 127, '文件新增', NULL, NULL, 'system:file:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` VALUES (1017, 127, '文件预览', NULL, NULL, 'system:file:detail', 'Button', '#', 3, 1);
INSERT INTO `auth_permission` VALUES (1018, 127, '文件删除', NULL, NULL, 'system:file:remove', 'Button', '#', 4, 1);
INSERT INTO `auth_permission` VALUES (1021, 200, '登录日志查询', NULL, NULL, 'system:login_log:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` VALUES (1022, 200, '登录日志查看', NULL, NULL, 'system:login_log:detail', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` VALUES (1023, 201, '操作日志查询', NULL, NULL, 'system:opt_log:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` VALUES (1024, 201, '操作日志查看', NULL, NULL, 'system:opt_log:detail', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` VALUES (1025, 129, '站内信查询', NULL, NULL, 'system:notice:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` VALUES (1026, 129, '站内信发送', NULL, NULL, 'system:notice:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` VALUES (1027, 129, '站内信查看', NULL, NULL, 'system:notice:detail', 'Button', '#', 3, 1);

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色码值',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识1未删除-1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES (1648724665172000, '系统管理人员', 'sys', 1);
INSERT INTO `auth_role` VALUES (1648726439362592, '系统管理人员2', 'sys2', 1);
INSERT INTO `auth_role` VALUES (1648728391811104, '系统管理人员3', 'sys4', 1);
INSERT INTO `auth_role` VALUES (1648732317679648, '系统管理人员5', 'sys5', 1);

-- ----------------------------
-- Table structure for auth_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_permission`;
CREATE TABLE `auth_role_permission`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` bigint NULL DEFAULT NULL COMMENT '权限详情id',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识1未删除-1已经删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE COMMENT '关联'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_role_permission
-- ----------------------------
INSERT INTO `auth_role_permission` VALUES (1648724665172032, 1648724665172000, 7, 1);
INSERT INTO `auth_role_permission` VALUES (1648726439362624, 1648726439362592, 1, 1);
INSERT INTO `auth_role_permission` VALUES (1648726439362656, 1648726439362592, 2, 1);
INSERT INTO `auth_role_permission` VALUES (1648726439362688, 1648726439362592, 3, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908256, 1648728391811104, 123, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908288, 1648728391811104, 124, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908320, 1648728391811104, 125, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908352, 1648728391811104, 126, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908384, 1648728391811104, 127, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908416, 1648728391811104, 128, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908448, 1648728391811104, 129, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908480, 1648728391811104, 200, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908512, 1648728391811104, 201, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908544, 1648728391811104, 1000, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908576, 1648728391811104, 1001, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908608, 1648728391811104, 1002, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908640, 1648728391811104, 1003, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908672, 1648728391811104, 1004, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908704, 1648728391811104, 1005, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908736, 1648728391811104, 1006, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908768, 1648728391811104, 1007, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908800, 1648728391811104, 1008, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908832, 1648728391811104, 1009, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908864, 1648728391811104, 1010, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908896, 1648728391811104, 1011, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908928, 1648728391811104, 1012, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908960, 1648728391811104, 1013, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393908992, 1648728391811104, 1014, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909024, 1648728391811104, 1015, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909056, 1648728391811104, 1016, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909088, 1648728391811104, 1017, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909120, 1648728391811104, 1018, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909152, 1648728391811104, 1021, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909184, 1648728391811104, 1022, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909216, 1648728391811104, 1023, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909248, 1648728391811104, 1024, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909280, 1648728391811104, 1025, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909312, 1648728391811104, 1026, 1);
INSERT INTO `auth_role_permission` VALUES (1648728393909344, 1648728391811104, 1027, 1);
INSERT INTO `auth_role_permission` VALUES (1648732317679680, 1648732317679648, 1007, 1);

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` bigint NOT NULL COMMENT '用户表主键',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别 male：男 female：女',
  `avatar` bigint NULL DEFAULT NULL COMMENT '头像id',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户类型，pc mini manager',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '删除标识1未删除-1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'admin', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '超级管理员', 'male', 2, '15312665707', 'manager', '2024-07-14 01:06:28', NULL, '2024-07-17 21:42:06', 1623626795188256, 1);
INSERT INTO `auth_user` VALUES (1648725644541984, 'sysUser', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '系统管理测试用户', 'male', 4, '153126666666', 'manager', '2024-11-29 13:34:11', 1, '2024-11-29 13:34:11', 1648725644541984, 1);
INSERT INTO `auth_user` VALUES (1651450646102112, 'zhonghanlu', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '仲寒露', 'male', 0, 'zhonhanlu', 'manager', '2024-12-14 14:30:34', 1, '2024-12-14 14:30:34', 1, 1);
INSERT INTO `auth_user` VALUES (1653278597185600, 'wang', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '王总', 'male', 0, '15312447575', 'manager', '2024-12-24 16:37:50', 1651450646102112, '2024-12-24 16:37:50', 1651450646102112, 1);

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色id',
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识1未删除 -1 已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE COMMENT '关联'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES (1648725961211936, 1648724665172000, '系统管理人员', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` VALUES (1648726504374304, 1648724665172000, '系统管理人员', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` VALUES (1648726504374336, 1648726439362592, '系统管理人员2', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` VALUES (1648728528125984, 1648724665172000, '系统管理人员', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` VALUES (1648728528126016, 1648726439362592, '系统管理人员2', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` VALUES (1648728528126048, 1648728391811104, '系统管理人员3', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` VALUES (1648729373278240, 1648724665172000, '系统管理人员', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` VALUES (1648729373278272, 1648726439362592, '系统管理人员2', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` VALUES (1648732351234080, 1648724665172000, '系统管理人员', 1648725644541984, 'sysUser', 1);
INSERT INTO `auth_user_role` VALUES (1648732351234112, 1648726439362592, '系统管理人员2', 1648725644541984, 'sysUser', 1);
INSERT INTO `auth_user_role` VALUES (1648732351234144, 1648732317679648, '系统管理人员5', 1648725644541984, 'sysUser', 1);
INSERT INTO `auth_user_role` VALUES (1651451306704928, 1648728391811104, '系统管理人员3', 1651450646102112, 'zhonhanlu', 1);

-- ----------------------------
-- Table structure for bm_class_grade
-- ----------------------------
DROP TABLE IF EXISTS `bm_class_grade`;
CREATE TABLE `bm_class_grade`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `tea_id` bigint NULL DEFAULT NULL COMMENT '教师 id',
  `tea_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师名称',
  `classroom_id` bigint NULL DEFAULT NULL COMMENT '教室 id',
  `classroom_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教室名',
  `cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `class_grade_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级类型 长期 体验',
  `intention_cur_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '意向上课时间',
  `class_grade_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级状态',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班级数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_class_grade
-- ----------------------------
INSERT INTO `bm_class_grade` VALUES (1654906098286624, 'python82班', 1651450646102048, '仲寒露', 1646195281756192, '西教室', 'python', 'long', 'long_saturday_down_one', 'normal', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_class_grade` VALUES (1654906098286752, 'python83班', 1651450646102048, '仲寒露', 1646195281756192, '西教室', 'python', 'long', 'long_saturday_down_two', 'normal', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_class_grade` VALUES (1654906098286816, 'python84班', 1651450646102048, '仲寒露', 1646195281756192, '西教室', 'python', 'long', 'long_saturday_up_one', 'normal', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_class_grade` VALUES (1654906098287008, 'python85班', 1653278597185568, '王总', 1646205509566496, '一个教室', 'python', 'long', 'long_saturday_up_one', 'normal', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);

-- ----------------------------
-- Table structure for bm_classroom
-- ----------------------------
DROP TABLE IF EXISTS `bm_classroom`;
CREATE TABLE `bm_classroom`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `room_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教室名称',
  `room_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教室状态',
  `room_size` int NULL DEFAULT NULL COMMENT '教室空间（最大容纳人数）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教室表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_classroom
-- ----------------------------
INSERT INTO `bm_classroom` VALUES (1646195281756192, '西教室', 'enable', 7, NULL, '2024-11-15 14:24:40', 1, '2024-11-15 15:49:31', 1);
INSERT INTO `bm_classroom` VALUES (1646205509566496, '一个教室', 'enable', 5, 1, '2024-11-15 15:45:57', 1, '2024-11-15 15:45:57', 1);

-- ----------------------------
-- Table structure for bm_classroom_intention
-- ----------------------------
DROP TABLE IF EXISTS `bm_classroom_intention`;
CREATE TABLE `bm_classroom_intention`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `classroom_id` bigint NULL DEFAULT NULL COMMENT '教室 id',
  `classroom_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教室名称',
  `room_size` int NULL DEFAULT NULL COMMENT '房间大小',
  `intention_cur_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '意向上课时间',
  `class_grade_id` bigint NULL DEFAULT NULL COMMENT '班级 id',
  `class_grade_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人 id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人 id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教室与意向时间关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_classroom_intention
-- ----------------------------
INSERT INTO `bm_classroom_intention` VALUES (1653812209123360, 1646195281756192, '西教室', 7, 'short_monday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123392, 1646195281756192, '西教室', 7, 'short_monday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123424, 1646195281756192, '西教室', 7, 'short_monday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123456, 1646195281756192, '西教室', 7, 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123488, 1646195281756192, '西教室', 7, 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123520, 1646195281756192, '西教室', 7, 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123552, 1646195281756192, '西教室', 7, 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123584, 1646195281756192, '西教室', 7, 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123616, 1646195281756192, '西教室', 7, 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123648, 1646195281756192, '西教室', 7, 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123680, 1646195281756192, '西教室', 7, 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123712, 1646195281756192, '西教室', 7, 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123744, 1646195281756192, '西教室', 7, 'short_friday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123776, 1646195281756192, '西教室', 7, 'short_friday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123808, 1646195281756192, '西教室', 7, 'short_friday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123840, 1646195281756192, '西教室', 7, 'long_saturday_up_one', 1654906098286816, 'python84班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123872, 1646195281756192, '西教室', 7, 'long_saturday_down_one', 1654906098286624, 'python82班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123904, 1646195281756192, '西教室', 7, 'long_saturday_down_two', 1654906098286752, 'python83班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123936, 1646195281756192, '西教室', 7, 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209123968, 1646195281756192, '西教室', 7, 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124000, 1646195281756192, '西教室', 7, 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124032, 1646205509566496, '一个教室', 5, 'short_monday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124064, 1646205509566496, '一个教室', 5, 'short_monday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124096, 1646205509566496, '一个教室', 5, 'short_monday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124128, 1646205509566496, '一个教室', 5, 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124160, 1646205509566496, '一个教室', 5, 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124192, 1646205509566496, '一个教室', 5, 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124224, 1646205509566496, '一个教室', 5, 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124256, 1646205509566496, '一个教室', 5, 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124288, 1646205509566496, '一个教室', 5, 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124320, 1646205509566496, '一个教室', 5, 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124352, 1646205509566496, '一个教室', 5, 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124384, 1646205509566496, '一个教室', 5, 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124416, 1646205509566496, '一个教室', 5, 'short_friday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124448, 1646205509566496, '一个教室', 5, 'short_friday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124480, 1646205509566496, '一个教室', 5, 'short_friday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124512, 1646205509566496, '一个教室', 5, 'long_saturday_up_one', 1654906098287008, 'python85班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124544, 1646205509566496, '一个教室', 5, 'long_saturday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124576, 1646205509566496, '一个教室', 5, 'long_saturday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124608, 1646205509566496, '一个教室', 5, 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124640, 1646205509566496, '一个教室', 5, 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` VALUES (1653812209124672, 1646205509566496, '一个教室', 5, 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);

-- ----------------------------
-- Table structure for bm_course
-- ----------------------------
DROP TABLE IF EXISTS `bm_course`;
CREATE TABLE `bm_course`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `course_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `course_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `week_one` int NULL DEFAULT NULL COMMENT '周几',
  `course_start_time` datetime NULL DEFAULT NULL COMMENT '课程开始时间',
  `course_end_time` datetime NULL DEFAULT NULL COMMENT '课程结束时间',
  `class_person_size` int NULL DEFAULT NULL COMMENT '班级人数',
  `class_room_id` bigint NULL DEFAULT NULL COMMENT '教室 id',
  `class_room_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教室名称',
  `tea_id` bigint NULL DEFAULT NULL COMMENT '教师 id',
  `tea_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师名称',
  `class_grade_id` bigint NULL DEFAULT NULL COMMENT '班级 id',
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `course_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程状态 待上课 已上课 已结束 已过期',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_course
-- ----------------------------
INSERT INTO `bm_course` VALUES (1654909233528896, 'python', '认识计算机', 6, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 5, 1646195281756192, '西教室', 1651450646102048, '仲寒露', 1654906098286816, 'python84班', 'wait_for_class', 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
INSERT INTO `bm_course` VALUES (1654909233529088, 'python', 'python环境变量', 6, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 3, 1646205509566496, '一个教室', 1653278597185568, '王总', 1654906098287008, 'python85班', 'wait_for_class', 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
INSERT INTO `bm_course` VALUES (1654909233529216, 'python', 'python分支结构', 6, '2025-01-04 14:00:00', '2025-01-04 16:00:00', 3, 1646195281756192, '西教室', 1651450646102048, '仲寒露', 1654906098286624, 'python82班', 'wait_for_class', 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
INSERT INTO `bm_course` VALUES (1654909233529344, 'python', 'python循环语句', 6, '2025-01-04 16:30:00', '2025-01-04 18:30:00', 1, 1646195281756192, '西教室', 1651450646102048, '仲寒露', 1654906098286752, 'python83班', 'wait_for_class', 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);

-- ----------------------------
-- Table structure for bm_course_notes
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_notes`;
CREATE TABLE `bm_course_notes`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `course_id` bigint NULL DEFAULT NULL COMMENT '课程id',
  `file_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型：讲义；作业',
  `file_id` bigint NULL DEFAULT NULL COMMENT '文件id',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程讲义与课堂作业' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bm_course_notes
-- ----------------------------
INSERT INTO `bm_course_notes` VALUES (1654914711289888, 1654909233528896, 'handouts', 1, 1651450646102112, '2025-01-02 17:20:28', 1651450646102112, '2025-01-02 17:20:28', 1);
INSERT INTO `bm_course_notes` VALUES (1654914711289920, 1654909233528896, 'handouts', 2, 1651450646102112, '2025-01-02 17:20:28', 1651450646102112, '2025-01-02 17:20:28', 1);
INSERT INTO `bm_course_notes` VALUES (1654914711289952, 1654909233528896, 'task', 1, 1651450646102112, '2025-01-02 17:20:28', 1651450646102112, '2025-01-02 17:20:28', 1);
INSERT INTO `bm_course_notes` VALUES (1654914711289984, 1654909233528896, 'task', 2, 1651450646102112, '2025-01-02 17:20:28', 1651450646102112, '2025-01-02 17:20:28', 1);

-- ----------------------------
-- Table structure for bm_course_schedule
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_schedule`;
CREATE TABLE `bm_course_schedule`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `cur_schedule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课表名称',
  `cur_schedule_star_time` datetime NULL DEFAULT NULL COMMENT '课表开始时间',
  `cur_schedule_end_time` datetime NULL DEFAULT NULL COMMENT '课表结束时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课表主表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_course_schedule
-- ----------------------------
INSERT INTO `bm_course_schedule` VALUES (1654909233528864, '元旦第一周', '2025-01-03 00:00:00', '2025-01-05 00:00:00', 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);

-- ----------------------------
-- Table structure for bm_course_schedule_item
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_schedule_item`;
CREATE TABLE `bm_course_schedule_item`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `range_start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `range_end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `cur_id` bigint NULL DEFAULT NULL COMMENT '课程 id',
  `cur_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `cur_schedule_id` bigint NULL DEFAULT NULL COMMENT '课表主体 id',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课表内容主体表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_course_schedule_item
-- ----------------------------
INSERT INTO `bm_course_schedule_item` VALUES (1654909235626016, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 1654909233528896, '认识计算机', 1654909233528864, 0, 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
INSERT INTO `bm_course_schedule_item` VALUES (1654909235626048, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 1654909233529088, 'python环境变量', 1654909233528864, 0, 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
INSERT INTO `bm_course_schedule_item` VALUES (1654909235626080, '2025-01-04 14:00:00', '2025-01-04 16:00:00', 1654909233529216, 'python分支结构', 1654909233528864, 0, 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
INSERT INTO `bm_course_schedule_item` VALUES (1654909235626112, '2025-01-04 16:30:00', '2025-01-04 18:30:00', 1654909233529344, 'python循环语句', 1654909233528864, 0, 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);

-- ----------------------------
-- Table structure for bm_course_stu_pic
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_stu_pic`;
CREATE TABLE `bm_course_stu_pic`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `course_id` bigint NULL DEFAULT NULL COMMENT '课程id',
  `stu_id` bigint NULL DEFAULT NULL COMMENT '学生id',
  `pic_id` bigint NULL DEFAULT NULL COMMENT '图片id',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生上课图片信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bm_course_stu_pic
-- ----------------------------
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015200, 1654909233528896, 1651455106744352, 1, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015232, 1654909233528896, 1651455106744352, 2, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015264, 1654909233528896, 1651455106744352, 3, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015296, 1654909233528896, 1651473914003488, 1, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015328, 1654909233528896, 1651473914003488, 2, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015360, 1654909233528896, 1651473914003488, 3, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015392, 1654909233528896, 1651473941266464, 1, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015424, 1654909233528896, 1651473941266464, 2, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015456, 1654909233528896, 1651473941266464, 3, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015488, 1654909233528896, 1651473997889568, 1, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015520, 1654909233528896, 1651473997889568, 2, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015552, 1654909233528896, 1651473997889568, 3, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015584, 1654909233528896, 1651474115330080, 1, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015616, 1654909233528896, 1651474115330080, 2, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914619015648, 1654909233528896, 1651474115330080, 3, 1651450646102112, '2025-01-02 17:19:44', 1651450646102112, '2025-01-02 17:19:44', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209504, 1654909233528896, 1651455106744352, 1, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209536, 1654909233528896, 1651455106744352, 2, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209568, 1654909233528896, 1651455106744352, 3, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209600, 1654909233528896, 1651473914003488, 1, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209632, 1654909233528896, 1651473914003488, 2, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209664, 1654909233528896, 1651473914003488, 3, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209696, 1654909233528896, 1651473941266464, 1, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209728, 1654909233528896, 1651473941266464, 2, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209760, 1654909233528896, 1651473941266464, 3, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209792, 1654909233528896, 1651473997889568, 1, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209824, 1654909233528896, 1651473997889568, 2, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209856, 1654909233528896, 1651473997889568, 3, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209888, 1654909233528896, 1651474115330080, 1, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209920, 1654909233528896, 1651474115330080, 2, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914623209952, 1654909233528896, 1651474115330080, 3, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306656, 1654909233528896, 1651455106744352, 1, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306688, 1654909233528896, 1651455106744352, 2, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306720, 1654909233528896, 1651455106744352, 3, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306752, 1654909233528896, 1651473914003488, 1, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306784, 1654909233528896, 1651473914003488, 2, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306816, 1654909233528896, 1651473914003488, 3, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306848, 1654909233528896, 1651473941266464, 1, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306880, 1654909233528896, 1651473941266464, 2, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306912, 1654909233528896, 1651473941266464, 3, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306944, 1654909233528896, 1651473997889568, 1, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625306976, 1654909233528896, 1651473997889568, 2, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625307008, 1654909233528896, 1651473997889568, 3, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625307040, 1654909233528896, 1651474115330080, 1, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625307072, 1654909233528896, 1651474115330080, 2, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654914625307104, 1654909233528896, 1651474115330080, 3, 1651450646102112, '2025-01-02 17:19:47', 1651450646102112, '2025-01-02 17:19:47', 1);

-- ----------------------------
-- Table structure for bm_course_stu_sign
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_stu_sign`;
CREATE TABLE `bm_course_stu_sign`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `course_id` bigint NULL DEFAULT NULL COMMENT '课程id',
  `stu_id` bigint NULL DEFAULT NULL COMMENT '学生id',
  `sign_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到状态',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生上课签到表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bm_course_stu_sign
-- ----------------------------
INSERT INTO `bm_course_stu_sign` VALUES (1654914306539552, 1654909233528896, 1651455106744352, 'non_arrived', 1651450646102112, '2025-01-02 17:17:15', 1651450646102112, '2025-01-02 17:17:15', 1);
INSERT INTO `bm_course_stu_sign` VALUES (1654914306539584, 1654909233528896, 1651473914003488, 'arrived', 1651450646102112, '2025-01-02 17:17:15', 1651450646102112, '2025-01-02 17:17:15', 1);
INSERT INTO `bm_course_stu_sign` VALUES (1654914306539616, 1654909233528896, 1651473941266464, 'arrived', 1651450646102112, '2025-01-02 17:17:15', 1651450646102112, '2025-01-02 17:17:15', 1);
INSERT INTO `bm_course_stu_sign` VALUES (1654914306539648, 1654909233528896, 1651473997889568, 'arrived', 1651450646102112, '2025-01-02 17:17:15', 1651450646102112, '2025-01-02 17:17:15', 1);
INSERT INTO `bm_course_stu_sign` VALUES (1654914306539680, 1654909233528896, 1651474115330080, 'arrived', 1651450646102112, '2025-01-02 17:17:15', 1651450646102112, '2025-01-02 17:17:15', 1);

-- ----------------------------
-- Table structure for bm_handler_class
-- ----------------------------
DROP TABLE IF EXISTS `bm_handler_class`;
CREATE TABLE `bm_handler_class`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `stu_id` bigint NULL DEFAULT NULL COMMENT '学生 id',
  `stu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `intention_cur_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '意向上课时间',
  `consume_time` datetime NULL DEFAULT NULL COMMENT '核销时间',
  `cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `product_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型 长期 体验',
  `handler_class_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分班状态：待分班、已分班',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待分班数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_handler_class
-- ----------------------------
INSERT INTO `bm_handler_class` VALUES (1, 1651474167758881, '啊玩玩1', 'long_saturday_up_one', '2024-12-20 16:08:09', 'python', 'long', 'handler_class_ed', NULL, NULL, NULL, NULL, 1);
INSERT INTO `bm_handler_class` VALUES (2, 1651474167758882, '啊玩玩2', 'long_saturday_up_one', '2024-12-20 16:09:07', 'python', 'long', 'handler_class_ed', NULL, NULL, NULL, NULL, 1);
INSERT INTO `bm_handler_class` VALUES (1651460565631136, 1651455106744352, '王思思', 'long_saturday_up_one', '2024-12-14 15:49:23', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 15:49:23', 1651450646102112, '2024-12-14 15:49:23', 1);
INSERT INTO `bm_handler_class` VALUES (1651475497353376, 1651473914003488, '王丝丝', 'long_saturday_up_one', '2024-12-14 17:48:04', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:48:04', 1651450646102112, '2024-12-14 17:48:04', 1);
INSERT INTO `bm_handler_class` VALUES (1651475612696736, 1651473941266464, '仲丝丝', 'long_saturday_up_one', '2024-12-14 17:48:59', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:48:59', 1651450646102112, '2024-12-14 17:48:59', 1);
INSERT INTO `bm_handler_class` VALUES (1651475673514144, 1651473970626592, '仲嘻嘻', 'long_saturday_down_one', '2024-12-14 17:49:27', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:49:27', 1651450646102112, '2024-12-14 17:49:27', 1);
INSERT INTO `bm_handler_class` VALUES (1651475698679968, 1651473997889568, '王嘻嘻', 'long_saturday_up_one', '2024-12-14 17:49:40', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:49:40', 1651450646102112, '2024-12-14 17:49:40', 1);
INSERT INTO `bm_handler_class` VALUES (1651475728040032, 1651474025152544, '王哈哈', 'long_saturday_down_one', '2024-12-14 17:49:53', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:49:53', 1651450646102112, '2024-12-14 17:49:53', 1);
INSERT INTO `bm_handler_class` VALUES (1651475755303072, 1651474046124064, '李哈哈', 'long_saturday_down_one', '2024-12-14 17:50:06', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:50:06', 1651450646102112, '2024-12-14 17:50:06', 1);
INSERT INTO `bm_handler_class` VALUES (1651475793051808, 1651474071289888, '李哦哦', 'long_saturday_down_two', '2024-12-14 17:50:24', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:50:24', 1651450646102112, '2024-12-14 17:50:24', 1);
INSERT INTO `bm_handler_class` VALUES (1651475816120480, 1651474115330080, '藏哦哦', 'long_saturday_up_one', '2024-12-14 17:50:36', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:50:36', 1651450646102112, '2024-12-14 17:50:36', 1);
INSERT INTO `bm_handler_class` VALUES (1651475843383456, 1651474167758880, '齐哦哦', 'long_saturday_up_one', '2024-12-14 17:50:48', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:50:48', 1651450646102112, '2024-12-14 17:50:48', 1);

-- ----------------------------
-- Table structure for bm_handler_class_order_relation
-- ----------------------------
DROP TABLE IF EXISTS `bm_handler_class_order_relation`;
CREATE TABLE `bm_handler_class_order_relation`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `handler_class_id` bigint NULL DEFAULT NULL COMMENT '核销人（待分班）id',
  `order_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型：补单 普通订单',
  `cur_order_id` bigint NULL DEFAULT NULL COMMENT '课程订单 id',
  `cur_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '待分班与课程订单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_handler_class_order_relation
-- ----------------------------

-- ----------------------------
-- Table structure for bm_idea
-- ----------------------------
DROP TABLE IF EXISTS `bm_idea`;
CREATE TABLE `bm_idea`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `idea_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '意见类型',
  `idea_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '意见内容',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意见箱表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_idea
-- ----------------------------
INSERT INTO `bm_idea` VALUES (1650593535885344, 'course', '这个软件做得太好了！！！', NULL, NULL, '2024-12-09 20:58:51', '2024-12-09 20:58:51', -1);

-- ----------------------------
-- Table structure for bm_lack_course
-- ----------------------------
DROP TABLE IF EXISTS `bm_lack_course`;
CREATE TABLE `bm_lack_course`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `class_grade_id` bigint NULL DEFAULT NULL COMMENT '班级id',
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `cur_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `cur_id` bigint NULL DEFAULT NULL COMMENT '课程 id',
  `week_one` int NULL DEFAULT NULL COMMENT '周几',
  `lack_start_time` datetime NULL DEFAULT NULL COMMENT '缺课开始时间',
  `lack_end_time` datetime NULL DEFAULT NULL COMMENT '缺课结束时间',
  `stu_id` bigint NULL DEFAULT NULL COMMENT '学生姓名 id',
  `stu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `lack_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（未补课，已补课）',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '缺课数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_lack_course
-- ----------------------------
INSERT INTO `bm_lack_course` VALUES (1647483771944992, 1647456745947168, 'python一班', 'python', 'scratch一班2次课', 1647459832954912, 6, '2024-11-22 17:10:32', '2024-11-22 17:10:32', 1646206692360224, '宁宁', 'yes', NULL, '2024-11-22 17:04:40', NULL, '2024-11-22 17:04:40', -1);

-- ----------------------------
-- Table structure for bm_order
-- ----------------------------
DROP TABLE IF EXISTS `bm_order`;
CREATE TABLE `bm_order`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `order_create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `order_price` int NULL DEFAULT NULL COMMENT '订单总金额',
  `order_reduced_price` int NULL DEFAULT NULL COMMENT '订单优惠价格',
  `order_actual_price` int NULL DEFAULT NULL COMMENT '订单实际支付价格',
  `order_product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单商品名称',
  `order_consume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单核销人',
  `order_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `order_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单人手机号',
  `order_consumed_id` bigint NULL DEFAULT NULL COMMENT '被核销人（此处指学生）',
  `order_consumed_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_order
-- ----------------------------
INSERT INTO `bm_order` VALUES (1649505279672352, '2024-12-03 20:50:10', 49999900, 45999900, 45999900, 'python50次课，python30次课', '小明', 'consume_paid', '15312665707', 1, '小王', NULL, '2024-12-03 20:50:10', NULL, '2024-12-03 20:52:30', 1);

-- ----------------------------
-- Table structure for bm_org
-- ----------------------------
DROP TABLE IF EXISTS `bm_org`;
CREATE TABLE `bm_org`  (
  `id` bigint NOT NULL COMMENT '机构id',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `org_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构地址',
  `org_longitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构经度',
  `org_latitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构纬度',
  `org_described` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '机构描述',
  `org_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构状态yes no 是否地图注册',
  `org_head_a` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构负责人 A',
  `org_head_b` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构负责人B',
  `org_business_license` bigint NULL DEFAULT NULL COMMENT '机构营业执照',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1未删除，-1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_org
-- ----------------------------
INSERT INTO `bm_org` VALUES (1645826375942176, '启智编梦', '江苏省徐州市睢宁县', '11111', '22222', '是俩位怀揣着梦想的少年打造的少儿编程机构', 'yes', '仲寒露', '王斯亮', 2, '2024-11-13 13:32:52', NULL, '2024-11-13 13:43:11', NULL, 1);
INSERT INTO `bm_org` VALUES (1645831847411744, '测试机构', '111', '1', '1', '1', 'no', '1', '1', 2, '2024-11-13 14:16:22', 1, '2024-11-13 14:16:22', 1, 1);
INSERT INTO `bm_org` VALUES (1646203615838240, '极客晨星', '江苏省徐州市睢宁县中央大街', '11111.1111', '22222.2222', '我是一个机构我有很大的实力', 'no', '王', '嘿嘿', 3, '2024-11-15 15:30:54', 1, '2024-11-15 15:30:54', 1, 1);

-- ----------------------------
-- Table structure for bm_pat_stu_relation
-- ----------------------------
DROP TABLE IF EXISTS `bm_pat_stu_relation`;
CREATE TABLE `bm_pat_stu_relation`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `patriarch_id` bigint NULL DEFAULT NULL COMMENT '家长 id',
  `patriarch_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家长姓名',
  `student_id` bigint NULL DEFAULT NULL COMMENT '学生 id',
  `student_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '家长和学生关联信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_pat_stu_relation
-- ----------------------------
INSERT INTO `bm_pat_stu_relation` VALUES (1651455106744384, 1651452290269216, '宁小小', 1651455106744352, '王思思', 1651450646102112, '2024-12-14 15:06:01', 1651450646102112, '2024-12-14 15:06:01', 1);
INSERT INTO `bm_pat_stu_relation` VALUES (1651473916100640, 1651473515544608, '宁大大', 1651473914003488, '王丝丝', 1651450646102112, '2024-12-14 17:35:29', 1651450646102112, '2024-12-14 17:35:29', 1);
INSERT INTO `bm_pat_stu_relation` VALUES (1651473941266496, 1651473549099040, '仲小小', 1651473941266464, '仲丝丝', 1651450646102112, '2024-12-14 17:35:41', 1651450646102112, '2024-12-14 17:35:41', 1);
INSERT INTO `bm_pat_stu_relation` VALUES (1651473970626624, 1651473563779104, '仲大大', 1651473970626592, '仲嘻嘻', 1651450646102112, '2024-12-14 17:35:56', 1651450646102112, '2024-12-14 17:35:56', 1);
INSERT INTO `bm_pat_stu_relation` VALUES (1651473997889600, 1651473580556320, '王大大', 1651473997889568, '王嘻嘻', 1651450646102112, '2024-12-14 17:36:08', 1651450646102112, '2024-12-14 17:36:08', 1);
INSERT INTO `bm_pat_stu_relation` VALUES (1651474025152576, 1651473593139232, '王小小', 1651474025152544, '王哈哈', 1651450646102112, '2024-12-14 17:36:21', 1651450646102112, '2024-12-14 17:36:21', 1);
INSERT INTO `bm_pat_stu_relation` VALUES (1651474046124096, 1651473653956640, '李小小', 1651474046124064, '李哈哈', 1651450646102112, '2024-12-14 17:36:32', 1651450646102112, '2024-12-14 17:36:32', 1);
INSERT INTO `bm_pat_stu_relation` VALUES (1651474071289920, 1651473666539552, '李大大', 1651474071289888, '李哦哦', 1651450646102112, '2024-12-14 17:36:43', 1651450646102112, '2024-12-14 17:36:43', 1);
INSERT INTO `bm_pat_stu_relation` VALUES (1651474115330112, 1651473704288288, '张大大', 1651474115330080, '藏哦哦', 1651450646102112, '2024-12-14 17:37:05', 1651450646102112, '2024-12-14 17:37:05', 1);
INSERT INTO `bm_pat_stu_relation` VALUES (1651474167758912, 1651473718968352, '张小小', 1651474167758880, '齐哦哦', 1651450646102112, '2024-12-14 17:37:30', 1651450646102112, '2024-12-14 17:37:30', 1);

-- ----------------------------
-- Table structure for bm_patch_order
-- ----------------------------
DROP TABLE IF EXISTS `bm_patch_order`;
CREATE TABLE `bm_patch_order`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `patch_create_time` datetime NULL DEFAULT NULL COMMENT '补单时间',
  `patch_price` int NULL DEFAULT NULL COMMENT '补单总计价格',
  `patch_reduced_price` int NULL DEFAULT NULL COMMENT '补单优惠价格',
  `patch_actual_price` int NULL DEFAULT NULL COMMENT '补单实际价格',
  `patch_product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单商品名称',
  `patch_consume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单核销人',
  `patch_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单人手机号',
  `patch_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单状态',
  `patch_handler_id` bigint NULL DEFAULT NULL COMMENT '补单操作人id',
  `patch_handler_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单操作人姓名',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '补单（便于线下收款）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_patch_order
-- ----------------------------
INSERT INTO `bm_patch_order` VALUES (1651460565631040, '2024-12-14 15:49:23', 49990000, 4000000, 45990000, 'python课程 50 课时', '王思思', '1531266570', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 15:49:23', 1651450646102112, '2024-12-14 15:49:23', 1);
INSERT INTO `bm_patch_order` VALUES (1651475497353280, '2024-12-14 17:48:04', 49990000, 4000000, 45990000, 'python课程 50 课时', '王丝丝', '15312665708', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:48:04', 1651450646102112, '2024-12-14 17:48:04', 1);
INSERT INTO `bm_patch_order` VALUES (1651475612696640, '2024-12-14 17:48:59', 49990000, 4000000, 45990000, 'python课程 50 课时', '仲丝丝', '15312665702', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:48:59', 1651450646102112, '2024-12-14 17:48:59', 1);
INSERT INTO `bm_patch_order` VALUES (1651475673514048, '2024-12-14 17:49:27', 49990000, 4000000, 45990000, 'python课程 50 课时', '仲嘻嘻', '15311665702', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:49:27', 1651450646102112, '2024-12-14 17:49:27', 1);
INSERT INTO `bm_patch_order` VALUES (1651475698679872, '2024-12-14 17:49:40', 49990000, 4000000, 45990000, 'python课程 50 课时', '王嘻嘻', '15331665702', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:49:40', 1651450646102112, '2024-12-14 17:49:40', 1);
INSERT INTO `bm_patch_order` VALUES (1651475725942848, '2024-12-14 17:49:53', 49990000, 4000000, 45990000, 'python课程 50 课时', '王哈哈', '15331665402', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:49:53', 1651450646102112, '2024-12-14 17:49:53', 1);
INSERT INTO `bm_patch_order` VALUES (1651475755302976, '2024-12-14 17:50:06', 49990000, 4000000, 45990000, 'python课程 50 课时', '李哈哈', '13331665402', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:50:06', 1651450646102112, '2024-12-14 17:50:06', 1);
INSERT INTO `bm_patch_order` VALUES (1651475793051712, '2024-12-14 17:50:24', 49990000, 4000000, 45990000, 'python课程 50 课时', '李哦哦', '13335665402', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:50:24', 1651450646102112, '2024-12-14 17:50:24', 1);
INSERT INTO `bm_patch_order` VALUES (1651475816120384, '2024-12-14 17:50:36', 49990000, 4000000, 45990000, 'python课程 50 课时', '藏哦哦', '13335665452', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:50:36', 1651450646102112, '2024-12-14 17:50:36', 1);
INSERT INTO `bm_patch_order` VALUES (1651475843383360, '2024-12-14 17:50:48', 49990000, 4000000, 45990000, 'python课程 50 课时', '齐哦哦', '13335645452', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:50:48', 1651450646102112, '2024-12-14 17:50:48', 1);

-- ----------------------------
-- Table structure for bm_patriarch
-- ----------------------------
DROP TABLE IF EXISTS `bm_patriarch`;
CREATE TABLE `bm_patriarch`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `pat_avatar_id` bigint NULL DEFAULT NULL COMMENT '家长头像',
  `pat_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家长姓名',
  `pat_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家长手机号',
  `pat_wx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家长微信',
  `pat_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家长地址',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '家长表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_patriarch
-- ----------------------------
INSERT INTO `bm_patriarch` VALUES (1651452290269216, 0, '宁小小', '1531266570', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 14:43:37', 1651450646102112, '2024-12-14 14:43:37', 1);
INSERT INTO `bm_patriarch` VALUES (1651473515544608, 0, '宁大大', '15312665708', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:19', 1651450646102112, '2024-12-14 17:32:19', 1);
INSERT INTO `bm_patriarch` VALUES (1651473549099040, 0, '仲小小', '15312665702', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:35', 1651450646102112, '2024-12-14 17:32:35', 1);
INSERT INTO `bm_patriarch` VALUES (1651473563779104, 0, '仲大大', '15311665702', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:41', 1651450646102112, '2024-12-14 17:32:41', 1);
INSERT INTO `bm_patriarch` VALUES (1651473580556320, 0, '王大大', '15331665702', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:49', 1651450646102112, '2024-12-14 17:32:49', 1);
INSERT INTO `bm_patriarch` VALUES (1651473593139232, 0, '王小小', '15331665402', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:56', 1651450646102112, '2024-12-14 17:32:56', 1);
INSERT INTO `bm_patriarch` VALUES (1651473653956640, 0, '李小小', '13331665402', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:25', 1651450646102112, '2024-12-14 17:33:25', 1);
INSERT INTO `bm_patriarch` VALUES (1651473666539552, 0, '李大大', '13335665402', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:31', 1651450646102112, '2024-12-14 17:33:31', 1);
INSERT INTO `bm_patriarch` VALUES (1651473704288288, 0, '张大大', '13335665452', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:48', 1651450646102112, '2024-12-14 17:33:48', 1);
INSERT INTO `bm_patriarch` VALUES (1651473718968352, 0, '张小小', '13335645452', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:56', 1651450646102112, '2024-12-14 17:33:56', 1);

-- ----------------------------
-- Table structure for bm_poster
-- ----------------------------
DROP TABLE IF EXISTS `bm_poster`;
CREATE TABLE `bm_poster`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `poster_file_id` bigint NULL DEFAULT NULL COMMENT '图片id',
  `poster_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `poster_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '（线下首页推荐海报）（线下运营宣传）（小程序首页）（小程序课程）（家校一体推广）',
  `poster_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '海报状态、使用、未使用',
  `poster_opt_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '绘画人',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '海报统一管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_poster
-- ----------------------------
INSERT INTO `bm_poster` VALUES (1650594223751200, 1, '1.jpg', 'offline_recommended', 'yes', '小李', NULL, '2024-12-09 21:04:20', NULL, '2024-12-09 21:04:20', -1);

-- ----------------------------
-- Table structure for bm_product
-- ----------------------------
DROP TABLE IF EXISTS `bm_product`;
CREATE TABLE `bm_product`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `product_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程首页展示图片',
  `product_url_id` bigint NULL DEFAULT NULL COMMENT '课程首页展示图片id',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `product_hour` int NULL DEFAULT NULL COMMENT '课程课时',
  `product_price` int NULL DEFAULT NULL COMMENT '商品价格',
  `product_reduced_price` int NULL DEFAULT NULL COMMENT '优惠后价格',
  `recommend_age` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐年龄',
  `course_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课程详细介绍，默认写死',
  `product_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体验 长期 课程类型',
  `course_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程语言类型',
  `class_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授课类型，线上、线下....',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程状态',
  `class_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程授课区间（周末、暑假）',
  `show_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上下架状态',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_product
-- ----------------------------
INSERT INTO `bm_product` VALUES (1651457789001760, '', 0, 'python课程 50 课时', 500000, 49990000, 45990000, '9-18 岁', '第一章--有趣的二进制', 'long', 'python', 'offline', 'start', '2024-12-01 - 2024-12-31', 'listing', 1651450646102112, '2024-12-14 15:27:20', 1651450646102112, '2024-12-14 15:27:20', 1);

-- ----------------------------
-- Table structure for bm_pull_new
-- ----------------------------
DROP TABLE IF EXISTS `bm_pull_new`;
CREATE TABLE `bm_pull_new`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `source_patriarch_id` bigint NULL DEFAULT NULL COMMENT '拉新人id',
  `source_patriarch_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拉新人姓名',
  `invitation_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `new_patriarch_id` bigint NULL DEFAULT NULL COMMENT '被拉新人id',
  `new_patriarch_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被拉新人姓名',
  `reward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖励',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原因',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拉新统一汇总表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_pull_new
-- ----------------------------
INSERT INTO `bm_pull_new` VALUES (1650594901131296, 1, '张三', '11122', 2, '李四', '100', '没有原因', NULL, '2024-12-09 21:09:43', NULL, '2024-12-09 21:09:43', -1);

-- ----------------------------
-- Table structure for bm_repair_course
-- ----------------------------
DROP TABLE IF EXISTS `bm_repair_course`;
CREATE TABLE `bm_repair_course`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `repair_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补课名称',
  `cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `week_one` int NULL DEFAULT NULL COMMENT '周几',
  `repair_start_time` datetime NULL DEFAULT NULL COMMENT '补课开始时间',
  `repair_end_time` datetime NULL DEFAULT NULL COMMENT '补课结束时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '补课数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_repair_course
-- ----------------------------
INSERT INTO `bm_repair_course` VALUES (1647485726490656, 'cpp2补', 'cpp', 7, '2024-11-22 17:23:15', '2024-11-22 17:23:15', NULL, '2024-11-22 17:20:12', NULL, '2024-11-22 17:23:15', 1);

-- ----------------------------
-- Table structure for bm_stu_class_grade
-- ----------------------------
DROP TABLE IF EXISTS `bm_stu_class_grade`;
CREATE TABLE `bm_stu_class_grade`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `stu_id` bigint NULL DEFAULT NULL COMMENT '学生id',
  `stu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `course_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `class_grade_id` bigint NULL DEFAULT NULL COMMENT '班级id',
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生和班级关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_stu_class_grade
-- ----------------------------
INSERT INTO `bm_stu_class_grade` VALUES (1654906098286656, 1651473970626592, '仲嘻嘻', 'python', 1654906098286624, 'python82班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098286688, 1651474025152544, '王哈哈', 'python', 1654906098286624, 'python82班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098286720, 1651474046124064, '李哈哈', 'python', 1654906098286624, 'python82班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098286784, 1651474071289888, '李哦哦', 'python', 1654906098286752, 'python83班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098286848, 1651455106744352, '王思思', 'python', 1654906098286816, 'python84班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098286880, 1651473914003488, '王丝丝', 'python', 1654906098286816, 'python84班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098286912, 1651473941266464, '仲丝丝', 'python', 1654906098286816, 'python84班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098286944, 1651473997889568, '王嘻嘻', 'python', 1654906098286816, 'python84班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098286976, 1651474115330080, '藏哦哦', 'python', 1654906098286816, 'python84班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098287040, 1651474167758882, '啊玩玩2', 'python', 1654906098287008, 'python85班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098287072, 1651474167758881, '啊玩玩1', 'python', 1654906098287008, 'python85班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654906098287104, 1651474167758880, '齐哦哦', 'python', 1654906098287008, 'python85班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);

-- ----------------------------
-- Table structure for bm_stu_class_hour
-- ----------------------------
DROP TABLE IF EXISTS `bm_stu_class_hour`;
CREATE TABLE `bm_stu_class_hour`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `class_hour_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课时类型',
  `class_hour` bigint NULL DEFAULT NULL COMMENT '课时默认乘 100 计算逻辑',
  `stu_id` bigint NULL DEFAULT NULL COMMENT '学生 id',
  `stu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生与课时关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_stu_class_hour
-- ----------------------------
INSERT INTO `bm_stu_class_hour` VALUES (1651460565631072, 'python', 500000, 1651455106744352, '王思思');
INSERT INTO `bm_stu_class_hour` VALUES (1651475497353312, 'python', 500000, 1651473914003488, '王丝丝');
INSERT INTO `bm_stu_class_hour` VALUES (1651475612696672, 'python', 500000, 1651473941266464, '仲丝丝');
INSERT INTO `bm_stu_class_hour` VALUES (1651475673514080, 'python', 500000, 1651473970626592, '仲嘻嘻');
INSERT INTO `bm_stu_class_hour` VALUES (1651475698679904, 'python', 500000, 1651473997889568, '王嘻嘻');
INSERT INTO `bm_stu_class_hour` VALUES (1651475728039968, 'python', 500000, 1651474025152544, '王哈哈');
INSERT INTO `bm_stu_class_hour` VALUES (1651475755303008, 'python', 500000, 1651474046124064, '李哈哈');
INSERT INTO `bm_stu_class_hour` VALUES (1651475793051744, 'python', 500000, 1651474071289888, '李哦哦');
INSERT INTO `bm_stu_class_hour` VALUES (1651475816120416, 'python', 500000, 1651474115330080, '藏哦哦');
INSERT INTO `bm_stu_class_hour` VALUES (1651475843383392, 'python', 500000, 1651474167758880, '齐哦哦');

-- ----------------------------
-- Table structure for bm_student
-- ----------------------------
DROP TABLE IF EXISTS `bm_student`;
CREATE TABLE `bm_student`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `stu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `stu_sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生性别',
  `stu_birth` datetime NULL DEFAULT NULL COMMENT '学生生日（出生日期）',
  `stu_cur_school` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生当前学校',
  `stu_cur_grade` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生当前年级',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识-1已删除 1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_student
-- ----------------------------
INSERT INTO `bm_student` VALUES (1651455106744352, '王思思', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 15:06:01', 1651450646102112, '2024-12-14 15:06:01', 1);
INSERT INTO `bm_student` VALUES (1651473914003488, '王丝丝', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:35:29', 1651450646102112, '2024-12-14 17:35:29', 1);
INSERT INTO `bm_student` VALUES (1651473941266464, '仲丝丝', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:35:41', 1651450646102112, '2024-12-14 17:35:41', 1);
INSERT INTO `bm_student` VALUES (1651473970626592, '仲嘻嘻', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:35:56', 1651450646102112, '2024-12-14 17:35:56', 1);
INSERT INTO `bm_student` VALUES (1651473997889568, '王嘻嘻', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:36:08', 1651450646102112, '2024-12-14 17:36:08', 1);
INSERT INTO `bm_student` VALUES (1651474025152544, '王哈哈', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:36:21', 1651450646102112, '2024-12-14 17:36:21', 1);
INSERT INTO `bm_student` VALUES (1651474046124064, '李哈哈', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:36:32', 1651450646102112, '2024-12-14 17:36:32', 1);
INSERT INTO `bm_student` VALUES (1651474071289888, '李哦哦', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:36:43', 1651450646102112, '2024-12-14 17:36:43', 1);
INSERT INTO `bm_student` VALUES (1651474115330080, '藏哦哦', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:37:05', 1651450646102112, '2024-12-14 17:37:05', 1);
INSERT INTO `bm_student` VALUES (1651474167758880, '齐哦哦', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:37:30', 1651450646102112, '2024-12-14 17:37:30', 1);

-- ----------------------------
-- Table structure for bm_student_constant
-- ----------------------------
DROP TABLE IF EXISTS `bm_student_constant`;
CREATE TABLE `bm_student_constant`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型school 学校  grade 年级 ',
  `constant_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key 值',
  `constant_value` int NULL DEFAULT NULL COMMENT '计算值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生学校与年级常量数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_student_constant
-- ----------------------------
INSERT INTO `bm_student_constant` VALUES (1, 'school', '睢宁县宁海小学', 0);
INSERT INTO `bm_student_constant` VALUES (2, 'school', '睢宁县第五实验小学', 0);
INSERT INTO `bm_student_constant` VALUES (3, 'school', '睢宁县第四实验小学', 0);
INSERT INTO `bm_student_constant` VALUES (4, 'school', '睢宁县第三实验小学', 0);
INSERT INTO `bm_student_constant` VALUES (5, 'school', '睢宁县第二实验小学', 0);
INSERT INTO `bm_student_constant` VALUES (6, 'school', '睢宁县实验小学', 0);
INSERT INTO `bm_student_constant` VALUES (7, 'school', '睢宁县东城区实验学校', 0);
INSERT INTO `bm_student_constant` VALUES (8, 'school', '睢宁县城西实验小学', 0);
INSERT INTO `bm_student_constant` VALUES (9, 'school', '睢宁县南门实验小学', 0);
INSERT INTO `bm_student_constant` VALUES (10, 'school', '睢宁县新城区实验小学', 0);
INSERT INTO `bm_student_constant` VALUES (11, 'school', '睢宁县高铁商务区实验小学', 0);
INSERT INTO `bm_student_constant` VALUES (12, 'school', '睢宁县五里堂小学', 0);
INSERT INTO `bm_student_constant` VALUES (13, 'school', '睢宁县八里小学', 0);
INSERT INTO `bm_student_constant` VALUES (14, 'school', '睢宁县菁华小学', 0);
INSERT INTO `bm_student_constant` VALUES (15, 'school', '睢宁县第二中学', 0);
INSERT INTO `bm_student_constant` VALUES (16, 'school', '睢宁县南门实验学校（初中部）', 0);
INSERT INTO `bm_student_constant` VALUES (17, 'school', '睢宁县城西实验学校（初中部）', 0);
INSERT INTO `bm_student_constant` VALUES (18, 'school', '睢宁县新城区初级中学', 0);
INSERT INTO `bm_student_constant` VALUES (19, 'school', '睢宁县第一中学附属中学（北睢中初中）', 0);
INSERT INTO `bm_student_constant` VALUES (20, 'school', '睢宁县附中（南睢中初中）', 0);
INSERT INTO `bm_student_constant` VALUES (21, 'school', '睢宁县田家炳中学（初中部）', 0);
INSERT INTO `bm_student_constant` VALUES (22, 'school', '睢宁县高铁商务区学校（初中部）', 0);
INSERT INTO `bm_student_constant` VALUES (23, 'school', '睢宁县东城区实验学校（初中部）', 0);
INSERT INTO `bm_student_constant` VALUES (24, 'school', '睢宁县人民路实验学校（初中部）', 0);
INSERT INTO `bm_student_constant` VALUES (25, 'school', '睢宁县菁华（初中，高中）', 0);
INSERT INTO `bm_student_constant` VALUES (26, 'school', '睢宁县文华（初中，高中）', 0);
INSERT INTO `bm_student_constant` VALUES (27, 'school', '睢宁县新世纪中学', 0);
INSERT INTO `bm_student_constant` VALUES (28, 'school', '睢宁县宁海中学', 0);
INSERT INTO `bm_student_constant` VALUES (100, 'grade', '一年级', 1);
INSERT INTO `bm_student_constant` VALUES (101, 'grade', '二年级', 2);
INSERT INTO `bm_student_constant` VALUES (102, 'grade', '三年级', 3);
INSERT INTO `bm_student_constant` VALUES (103, 'grade', '四年级', 4);
INSERT INTO `bm_student_constant` VALUES (104, 'grade', '五年级', 5);
INSERT INTO `bm_student_constant` VALUES (105, 'grade', '六年级', 6);
INSERT INTO `bm_student_constant` VALUES (106, 'grade', '初一', 7);
INSERT INTO `bm_student_constant` VALUES (107, 'grade', '初二', 8);
INSERT INTO `bm_student_constant` VALUES (108, 'grade', '初三', 9);
INSERT INTO `bm_student_constant` VALUES (109, 'grade', '高一', 10);
INSERT INTO `bm_student_constant` VALUES (110, 'grade', '高二', 11);
INSERT INTO `bm_student_constant` VALUES (111, 'grade', '高三', 12);

-- ----------------------------
-- Table structure for bm_teacher
-- ----------------------------
DROP TABLE IF EXISTS `bm_teacher`;
CREATE TABLE `bm_teacher`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `tea_avatar_id` bigint NULL DEFAULT NULL COMMENT '教师头像',
  `tea_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师名称',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师性别',
  `tea_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师手机号',
  `tea_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师邮箱',
  `tea_org_id` bigint NULL DEFAULT NULL COMMENT '归属机构id',
  `tea_org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属机构名称',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_teacher
-- ----------------------------
INSERT INTO `bm_teacher` VALUES (1651450646102048, 0, '仲寒露', 'male', 'zhonhanlu', '1420865757@qq.com', 1645826375942176, '启智编梦', 1, '2024-12-14 14:30:34', 1, '2024-12-14 14:30:34', 1);
INSERT INTO `bm_teacher` VALUES (1653278597185568, 0, '王总', 'male', '15312447575', '147258963@163.com', 1645826375942176, '启智编梦', 1651450646102112, '2024-12-24 16:37:49', 1651450646102112, '2024-12-24 16:37:49', 1);

-- ----------------------------
-- Table structure for bm_teacher_intention
-- ----------------------------
DROP TABLE IF EXISTS `bm_teacher_intention`;
CREATE TABLE `bm_teacher_intention`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `teacher_id` bigint NULL DEFAULT NULL COMMENT '教师主键 id',
  `teacher_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师名称',
  `intention_cur_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '意向时间',
  `class_grade_id` bigint NULL DEFAULT NULL COMMENT '班级 id',
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班级名称',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人 id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人 id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教师意向时间关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_teacher_intention
-- ----------------------------
INSERT INTO `bm_teacher_intention` VALUES (1653812211220512, 1651450646102048, '仲寒露', 'short_monday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220544, 1651450646102048, '仲寒露', 'short_monday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220576, 1651450646102048, '仲寒露', 'short_monday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220608, 1651450646102048, '仲寒露', 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220640, 1651450646102048, '仲寒露', 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220672, 1651450646102048, '仲寒露', 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220704, 1651450646102048, '仲寒露', 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220736, 1651450646102048, '仲寒露', 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220768, 1651450646102048, '仲寒露', 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220800, 1651450646102048, '仲寒露', 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220832, 1651450646102048, '仲寒露', 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220864, 1651450646102048, '仲寒露', 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220896, 1651450646102048, '仲寒露', 'short_friday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220928, 1651450646102048, '仲寒露', 'short_friday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220960, 1651450646102048, '仲寒露', 'short_friday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211220992, 1651450646102048, '仲寒露', 'long_saturday_up_one', 1654906098286816, 'python84班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221024, 1651450646102048, '仲寒露', 'long_saturday_down_one', 1654906098286624, 'python82班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221056, 1651450646102048, '仲寒露', 'long_saturday_down_two', 1654906098286752, 'python83班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221088, 1651450646102048, '仲寒露', 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221120, 1651450646102048, '仲寒露', 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221152, 1651450646102048, '仲寒露', 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221184, 1653278597185568, '王总', 'short_monday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221216, 1653278597185568, '王总', 'short_monday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221248, 1653278597185568, '王总', 'short_monday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221280, 1653278597185568, '王总', 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221312, 1653278597185568, '王总', 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221344, 1653278597185568, '王总', 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221376, 1653278597185568, '王总', 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221408, 1653278597185568, '王总', 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221440, 1653278597185568, '王总', 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221472, 1653278597185568, '王总', 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221504, 1653278597185568, '王总', 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221536, 1653278597185568, '王总', 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221568, 1653278597185568, '王总', 'short_friday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221600, 1653278597185568, '王总', 'short_friday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221632, 1653278597185568, '王总', 'short_friday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221664, 1653278597185568, '王总', 'long_saturday_up_one', 1654906098287008, 'python85班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221696, 1653278597185568, '王总', 'long_saturday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221728, 1653278597185568, '王总', 'long_saturday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221760, 1653278597185568, '王总', 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221792, 1653278597185568, '王总', 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` VALUES (1653812211221824, 1653278597185568, '王总', 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);

-- ----------------------------
-- Table structure for bm_tutor_apply
-- ----------------------------
DROP TABLE IF EXISTS `bm_tutor_apply`;
CREATE TABLE `bm_tutor_apply`  (
  `id` bigint NULL DEFAULT NULL COMMENT '主键 id',
  `apply_stu_id` bigint NULL DEFAULT NULL COMMENT '申请人 id',
  `apply_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `apply_subject` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科目',
  `apply_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请时间',
  `apply_tutor_id` bigint NULL DEFAULT NULL COMMENT '申请家教老师 id',
  `apply_tutor_tea_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请家教老师姓名',
  `expend_class_hour` int NULL DEFAULT NULL COMMENT '消耗课时',
  `apply_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请地址',
  `apply_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请状态',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '家教申请' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_tutor_apply
-- ----------------------------
INSERT INTO `bm_tutor_apply` VALUES (1649822910119968, 1, '张三', 'python', '2020-02-02 -- 2024-01-01', 1646200895832096, '丽丽', 4, '江苏省南京市嘻嘻', 'apply_end', NULL, '2024-12-05 14:54:28', NULL, '2024-12-05 14:54:28', 1);

-- ----------------------------
-- Table structure for bm_tutor_teacher
-- ----------------------------
DROP TABLE IF EXISTS `bm_tutor_teacher`;
CREATE TABLE `bm_tutor_teacher`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `tea_id` bigint NULL DEFAULT NULL COMMENT '教师 id',
  `tea_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家教老师名称',
  `give_class_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授课范围 python 、 c++等',
  `leisure_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '空闲时间',
  `tutor_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '教师详细介绍',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '家教老师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_tutor_teacher
-- ----------------------------
INSERT INTO `bm_tutor_teacher` VALUES (1649823549751328, 1, '李四', '[SCRATCH]', '2024-02-02 -- 2024-02-02', '滴滴滴滴滴滴滴滴', NULL, '2024-12-05 14:59:33', NULL, '2024-12-05 14:59:33', 1);

-- ----------------------------
-- Table structure for bm_user_teacher
-- ----------------------------
DROP TABLE IF EXISTS `bm_user_teacher`;
CREATE TABLE `bm_user_teacher`  (
  `id` bigint NOT NULL COMMENT '主键 id',
  `tea_id` bigint NULL DEFAULT NULL COMMENT '教师 id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '账户 id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教师与系统账户关联关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_user_teacher
-- ----------------------------
INSERT INTO `bm_user_teacher` VALUES (1651450646102144, 1651450646102048, 1651450646102112);
INSERT INTO `bm_user_teacher` VALUES (1653278599282720, 1653278597185568, 1653278597185600);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置key',
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置实际值',
  `config_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 yes no',
  `show_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否展示 yes no',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '删除标识 1未删除，-1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全局参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1648563337560096, '初始化密码', 'init_password', '123456', 'yes', 'yes', '2024-11-28 16:04:17', 1, '2024-11-28 16:04:17', 1, 1);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `file_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件存储路径',
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件存储类型枚举值',
  `file_device_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件存储端',
  `bucket_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '桶名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人id',
  `del_flag` tinyint(1) NULL DEFAULT 1 COMMENT '删除标识1未删除，-1已删除 默认值1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (1648559998894112, 'logo', 'logo.png', 'image/png', 'pc', 'e-mode-bucket', '2024-11-28 15:37:45', 1, '2024-11-28 15:37:45', 1, -1);
INSERT INTO `sys_file` VALUES (1648745905127456, 'logo', 'logo.png', 'image/png', 'pc', 'e-mode-bucket', '2024-11-29 16:15:13', 1648725644541984, '2024-11-29 16:15:13', 1648725644541984, -1);

-- ----------------------------
-- Table structure for sys_login_opt
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_opt`;
CREATE TABLE `sys_login_opt`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户名',
  `opt_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作ip',
  `opt_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作地址',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `system_os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作是否成功',
  `opt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作类型，登入，登出',
  `opt_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作结果消息',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统登入登出信息记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_opt
-- ----------------------------
INSERT INTO `sys_login_opt` VALUES (1652416936149024, 'zhonghanlu', '192.168.0.106', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-19 22:29:56');
INSERT INTO `sys_login_opt` VALUES (1652510511071264, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-20 10:53:37');
INSERT INTO `sys_login_opt` VALUES (1652547896999968, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-20 15:50:44');
INSERT INTO `sys_login_opt` VALUES (1653124320198688, 'zhonghanlu', '192.168.0.107', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 20:11:44');
INSERT INTO `sys_login_opt` VALUES (1653124351655968, 'zhonghanlu', '192.168.0.107', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 20:11:58');
INSERT INTO `sys_login_opt` VALUES (1653132345999392, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:15:31');
INSERT INTO `sys_login_opt` VALUES (1653132402622496, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:15:57');
INSERT INTO `sys_login_opt` VALUES (1653133025476640, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:20:55');
INSERT INTO `sys_login_opt` VALUES (1653133084196896, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:21:22');
INSERT INTO `sys_login_opt` VALUES (1653133163888672, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:22:00');
INSERT INTO `sys_login_opt` VALUES (1653133249871904, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:22:42');
INSERT INTO `sys_login_opt` VALUES (1653133663010848, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:25:58');
INSERT INTO `sys_login_opt` VALUES (1653134185201696, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:30:08');
INSERT INTO `sys_login_opt` VALUES (1653134982119456, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:36:27');
INSERT INTO `sys_login_opt` VALUES (1653135086977056, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:37:17');
INSERT INTO `sys_login_opt` VALUES (1653135307178016, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:39:03');
INSERT INTO `sys_login_opt` VALUES (1653135709831200, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:42:14');
INSERT INTO `sys_login_opt` VALUES (1653135766454304, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:42:42');
INSERT INTO `sys_login_opt` VALUES (1653235544752160, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 10:55:40');
INSERT INTO `sys_login_opt` VALUES (1653235616055328, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-12-24 10:56:14');
INSERT INTO `sys_login_opt` VALUES (1653236136149024, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-24 11:00:22');
INSERT INTO `sys_login_opt` VALUES (1653236178092064, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 11:00:41');
INSERT INTO `sys_login_opt` VALUES (1653257831186496, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-12-24 13:52:46');
INSERT INTO `sys_login_opt` VALUES (1653257873129504, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-24 13:53:07');
INSERT INTO `sys_login_opt` VALUES (1653257921364000, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 13:53:30');
INSERT INTO `sys_login_opt` VALUES (1653257921364096, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-12-24 13:53:30');
INSERT INTO `sys_login_opt` VALUES (1653258309337120, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 13:56:34');
INSERT INTO `sys_login_opt` VALUES (1653258309337216, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-12-24 13:56:35');
INSERT INTO `sys_login_opt` VALUES (1653267723452448, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 15:11:23');
INSERT INTO `sys_login_opt` VALUES (1653267769589792, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 15:11:46');
INSERT INTO `sys_login_opt` VALUES (1653619784941600, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-26 13:49:20');
INSERT INTO `sys_login_opt` VALUES (1653810485264416, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-27 15:04:52');
INSERT INTO `sys_login_opt` VALUES (1654363940454432, 'zhonghanlu', '172.19.0.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-30 16:23:20');
INSERT INTO `sys_login_opt` VALUES (1654891187535904, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-02 14:13:31');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息标头',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息的内容',
  `send_id` bigint NULL DEFAULT NULL COMMENT '消息发送者的id',
  `notice_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息的类型',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `message_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息状态',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识1未删除 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站内信表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1642022033162272, '测试广播', '我是内容', 1641852256124960, 'local', '2024-10-23 13:38:40', 'broadcast', '2024-10-23 13:38:40', 1641852256124960, '2024-10-23 13:38:40', 1641852256124960, 1);
INSERT INTO `sys_notice` VALUES (1642022043648032, '测试广播2', '我是内容', 1641852256124960, 'local', '2024-10-23 13:38:46', 'broadcast', '2024-10-23 13:38:46', 1641852256124960, '2024-10-23 13:38:46', 1641852256124960, 1);
INSERT INTO `sys_notice` VALUES (1642022425329696, '测试广播2', '我是内容', 1641852256124960, 'local', '2024-10-23 13:41:48', 'alone', '2024-10-23 13:41:48', NULL, '2024-10-23 13:41:48', NULL, 1);

-- ----------------------------
-- Table structure for sys_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_notice`;
CREATE TABLE `sys_user_notice`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `notice_id` bigint NULL DEFAULT NULL COMMENT '通知消息id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id，用于站内消息通知',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用于手机号短信通知',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用于邮箱通知',
  `read_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否已读 yes no',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识1未删除 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息用户关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_notice
-- ----------------------------
INSERT INTO `sys_user_notice` VALUES (1642022425329728, 1642022425329696, 1, '', '', 'no', '2024-10-23 13:41:48', NULL, '2024-10-23 13:41:48', NULL, 1);

-- ----------------------------
-- Table structure for sys_user_opt
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_opt`;
CREATE TABLE `sys_user_opt`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `request_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作唯一id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户名',
  `opt_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作ip',
  `opt_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作地址',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `system_os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `opt_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'get post',
  `opt_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `opt_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `opt_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求状态，yes成功，no失败',
  `opt_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_opt
-- ----------------------------
INSERT INTO `sys_user_opt` VALUES (1653242582794272, '2205eb69-40eb-4427-8465-e781b7b94273', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 11:51:36');
INSERT INTO `sys_user_opt` VALUES (1653242637320224, '6e353e7c-020d-4d24-bc14-509c3668cf92', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 11:52:02');
INSERT INTO `sys_user_opt` VALUES (1653253244715040, 'a0db417b-77d4-432e-b956-54d64c194422', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:16:19');
INSERT INTO `sys_user_opt` VALUES (1653255912292384, '5b3e412b-7d45-4a99-8106-ff2413bf44e1', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:37:32');
INSERT INTO `sys_user_opt` VALUES (1653256036024352, '77daaf5a-f5e5-403e-be0b-daf55c888f6e', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:38:31');
INSERT INTO `sys_user_opt` VALUES (1653256990228512, '82c9d8c6-433a-46f8-9cc6-745bec8f0a84', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:46:06');
INSERT INTO `sys_user_opt` VALUES (1653257346744352, '89007560-97aa-4d00-9160-44895dc140d5', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:48:56');
INSERT INTO `sys_user_opt` VALUES (1653257392881696, '58fc45d7-6315-4132-adce-f932c420a635', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:49:17');
INSERT INTO `sys_user_opt` VALUES (1653257453699104, '5e9eb13d-8883-4e9b-89d8-2aa0c2b9ed10', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:49:47');
INSERT INTO `sys_user_opt` VALUES (1653257829089312, '837b2050-c711-481e-8e4e-afd28140d630', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:52:46');
INSERT INTO `sys_user_opt` VALUES (1653257831186464, '8a581c42-f294-4be3-984f-06d991d173d7', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-12-24 13:52:46');
INSERT INTO `sys_user_opt` VALUES (1653257921364032, '1e74a278-884b-4afe-9ea0-0aa5b5d3e52c', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:53:30');
INSERT INTO `sys_user_opt` VALUES (1653257921364064, 'edc6fc24-e9e7-4483-b351-802bdc4ce528', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-12-24 13:53:30');
INSERT INTO `sys_user_opt` VALUES (1653258309337152, '3440b75e-2e31-47c8-b1d7-03650d2a24e6', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:56:34');
INSERT INTO `sys_user_opt` VALUES (1653258309337184, '25100042-f356-4176-ba86-56d27502af42', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-12-24 13:56:34');
INSERT INTO `sys_user_opt` VALUES (1654891202215968, 'b1d98836-28c0-4faa-9a2b-a1c89084340f', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-02 14:13:39');
INSERT INTO `sys_user_opt` VALUES (1654891250450464, '78dc66d6-9985-4498-9712-961698063ccc', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-02 14:14:02');
INSERT INTO `sys_user_opt` VALUES (1654891315462176, '0aadebab-4222-42d6-9d65-0586547ffca2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-02 14:14:32');
INSERT INTO `sys_user_opt` VALUES (1654891319656480, '2e5d3a1a-85ae-4345-9017-62adf6002bd7', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-02 14:14:35');

SET FOREIGN_KEY_CHECKS = 1;
