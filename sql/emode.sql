/*
 Navicat Premium Data Transfer

 Source Server         : 阿里-mysql
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : 8.153.97.212:3306
 Source Schema         : emode

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 08/01/2025 17:18:00
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
INSERT INTO `auth_permission` VALUES (1, 0, '机构管理', 'org', '', '', 'Directory', 'table', 1, 1);
INSERT INTO `auth_permission` VALUES (2, 0, '课程管理', 'course', '', '', 'Directory', 'documentation', 2, 1);
INSERT INTO `auth_permission` VALUES (3, 0, '售课核销', 'sale', '', '', 'Directory', 'shopping', 3, 1);
INSERT INTO `auth_permission` VALUES (4, 0, '家校一体', 'school', '', '', 'Directory', 'wechat', 4, 1);
INSERT INTO `auth_permission` VALUES (5, 0, '学生端管理', 'student', '', '', 'Directory', 'peoples', 5, 1);
INSERT INTO `auth_permission` VALUES (6, 0, '运营管理', 'operate', '', '', 'Directory', 'dashboard', 6, 1);
INSERT INTO `auth_permission` VALUES (7, 0, '系统管理', 'system', '', '', 'Directory', 'system', 7, 1);
INSERT INTO `auth_permission` VALUES (100, 1, '学生管理', 'stu', '/org/stu/index', 'org:stu:list', 'Menu', NULL, 1, 1);
INSERT INTO `auth_permission` VALUES (101, 1, '家长管理', 'patriarch', '/org/patriarch/index', 'org:patriarch:list', 'Menu', NULL, 2, 1);
INSERT INTO `auth_permission` VALUES (102, 1, '教师管理', 'tea', '/org/tea/index', 'org:tea:list', 'Menu', NULL, 3, 1);
INSERT INTO `auth_permission` VALUES (103, 1, '教室管理', 'room', '/org/room/index', 'org:room:list', 'Menu', NULL, 4, 1);
INSERT INTO `auth_permission` VALUES (104, 1, '校区管理', 'school', '/org/school/index', 'org:school:list', 'Menu', NULL, 5, 1);
INSERT INTO `auth_permission` VALUES (105, 2, '待核销管理', 'class', '/course/class/index', 'course:class:list', 'Menu', NULL, 1, 1);
INSERT INTO `auth_permission` VALUES (106, 2, '班级管理', 'grade', '/course/grade/index', 'course:grade:list', 'Menu', NULL, 2, 1);
INSERT INTO `auth_permission` VALUES (107, 2, '课表管理', 'schedule', '/course/schedule/index', 'course:schedule:list', 'Menu', NULL, 3, 1);
INSERT INTO `auth_permission` VALUES (108, 2, '上课管理', 'up', '/course/up/index', 'course:up:list', 'Menu', NULL, 4, 1);
INSERT INTO `auth_permission` VALUES (109, 2, '缺课管理', 'lack', '/course/lack/index', 'course:lack:list', 'Menu', NULL, 5, 1);
INSERT INTO `auth_permission` VALUES (110, 2, '补课管理', 'repair', '/course/repair/index', 'course:repair:list', 'Menu', NULL, 6, 1);
INSERT INTO `auth_permission` VALUES (111, 3, '商品管理', 'product', '/sale/product/index', 'sale:product:list', 'Menu', NULL, 1, 1);
INSERT INTO `auth_permission` VALUES (112, 3, '订单管理', 'order', '/sale/order/index', 'sale:order:list', 'Menu', NULL, 2, 1);
INSERT INTO `auth_permission` VALUES (113, 3, '线下收款', 'patch', '/sale/patch/index', 'sale:patcht:list', 'Menu', NULL, 3, 1);
INSERT INTO `auth_permission` VALUES (114, 4, '家教老师', NULL, NULL, NULL, 'Menu', NULL, 1, 1);
INSERT INTO `auth_permission` VALUES (115, 4, '家教申请', NULL, NULL, NULL, 'Menu', NULL, 2, 1);
INSERT INTO `auth_permission` VALUES (116, 4, '安心到家', NULL, NULL, NULL, 'Menu', NULL, 3, 1);
INSERT INTO `auth_permission` VALUES (117, 5, '待更新', NULL, NULL, NULL, 'Menu', NULL, 1, 1);
INSERT INTO `auth_permission` VALUES (118, 6, '总账管理', NULL, NULL, NULL, 'Menu', NULL, 1, 1);
INSERT INTO `auth_permission` VALUES (119, 6, '数据报表', NULL, NULL, NULL, 'Menu', NULL, 2, 1);
INSERT INTO `auth_permission` VALUES (120, 6, '海报管理', NULL, NULL, NULL, 'Menu', NULL, 3, 1);
INSERT INTO `auth_permission` VALUES (121, 6, '拉新管理', NULL, NULL, NULL, 'Menu', NULL, 4, 1);
INSERT INTO `auth_permission` VALUES (122, 6, '意见箱管理', NULL, NULL, NULL, 'Menu', NULL, 5, 1);
INSERT INTO `auth_permission` VALUES (123, 7, '用户管理', 'user', '/system/user/index', 'system:user:list', 'Menu', 'people', 1, 1);
INSERT INTO `auth_permission` VALUES (124, 7, '角色管理', 'role', '/system/role/index', 'system:role:list', 'Menu', 'component', 2, 1);
INSERT INTO `auth_permission` VALUES (125, 7, '权限管理', 'auth', '/system/auth/index', 'system:auth:list', 'Menu', 'eye-open', 3, 1);
INSERT INTO `auth_permission` VALUES (126, 7, '参数配置', 'config', '/system/config/index', 'system:config:list', 'Menu', 'swagger', 4, 1);
INSERT INTO `auth_permission` VALUES (127, 7, '文件管理', 'file', '/system/file/index', 'system:file:list', 'Menu', 'upload', 5, 1);
INSERT INTO `auth_permission` VALUES (128, 7, '日志管理', 'log', '', '', 'Menu', 'log', 6, 1);
INSERT INTO `auth_permission` VALUES (129, 7, '站内信', 'notice', '/system/notice/index', 'system:notice:list', 'Menu', 'date', 7, 1);
INSERT INTO `auth_permission` VALUES (200, 128, '登录日志', 'login_log', '/system/login_log/index', 'system:login_log:list', 'Menu', '404', 1, 1);
INSERT INTO `auth_permission` VALUES (201, 128, '操作日志', 'opt_log', '/system/opt_log/index', 'system:opt_log:list', 'Menu', 'bug', 2, 1);
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
INSERT INTO `auth_role` VALUES (1648724665172000, '系统管理人员', 'sys-manager', 1);
INSERT INTO `auth_role` VALUES (1648726439362592, '系统管理人员2', 'sys2', 1);
INSERT INTO `auth_role` VALUES (1648728391811104, '系统管理人员3', 'sys4', 1);
INSERT INTO `auth_role` VALUES (1648732317679648, '系统管理人员5', 'sys5', 1);
INSERT INTO `auth_role` VALUES (1654359553212448, '测试角色1', 'cs01', 1);
INSERT INTO `auth_role` VALUES (1655804744695840, '测试02', 'test02', 1);
INSERT INTO `auth_role` VALUES (1655841279180832, '测试流程', ' test-', 1);

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
INSERT INTO `auth_role_permission` VALUES (1655841732165664, 1655841279180832, 1, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732165696, 1655841279180832, 4, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732165728, 1655841279180832, 6, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732165760, 1655841279180832, 5, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732165792, 1655841279180832, 123, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732165824, 1655841279180832, 125, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732165856, 1655841279180832, 126, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732165888, 1655841279180832, 127, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732165920, 1655841279180832, 128, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732165952, 1655841279180832, 129, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732165984, 1655841279180832, 1003, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166016, 1655841279180832, 1004, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166080, 1655841279180832, 100, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166112, 1655841279180832, 101, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166144, 1655841279180832, 102, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166176, 1655841279180832, 103, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166208, 1655841279180832, 104, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166240, 1655841279180832, 114, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166272, 1655841279180832, 115, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166304, 1655841279180832, 116, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166336, 1655841279180832, 117, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166368, 1655841279180832, 118, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166400, 1655841279180832, 119, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166432, 1655841279180832, 120, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166464, 1655841279180832, 121, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166496, 1655841279180832, 122, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166528, 1655841279180832, 1000, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166560, 1655841279180832, 1001, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166592, 1655841279180832, 1002, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166624, 1655841279180832, 1007, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166656, 1655841279180832, 1008, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166688, 1655841279180832, 1009, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166720, 1655841279180832, 1010, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166752, 1655841279180832, 1011, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166784, 1655841279180832, 1012, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166816, 1655841279180832, 1013, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166848, 1655841279180832, 1014, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166880, 1655841279180832, 1015, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166912, 1655841279180832, 1016, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166944, 1655841279180832, 1017, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732166976, 1655841279180832, 1018, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167008, 1655841279180832, 200, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167040, 1655841279180832, 201, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167072, 1655841279180832, 1025, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167104, 1655841279180832, 1026, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167136, 1655841279180832, 1027, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167168, 1655841279180832, 1021, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167200, 1655841279180832, 1022, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167232, 1655841279180832, 1023, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167264, 1655841279180832, 1024, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167296, 1655841279180832, 124, 1);
INSERT INTO `auth_role_permission` VALUES (1655841732167360, 1655841279180832, 7, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125280, 1648726439362592, 1, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125312, 1648726439362592, 2, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125344, 1648726439362592, 3, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125376, 1648726439362592, 111, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125408, 1648726439362592, 112, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125440, 1648726439362592, 113, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125472, 1648726439362592, 105, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125504, 1648726439362592, 106, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125536, 1648726439362592, 107, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125568, 1648726439362592, 109, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125600, 1648726439362592, 108, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125632, 1648726439362592, 110, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125664, 1648726439362592, 100, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125696, 1648726439362592, 101, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125728, 1648726439362592, 102, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125760, 1648726439362592, 103, 1);
INSERT INTO `auth_role_permission` VALUES (1655949123125792, 1648726439362592, 104, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156679712, 1648728391811104, 123, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156679744, 1648728391811104, 124, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156679776, 1648728391811104, 125, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156679808, 1648728391811104, 126, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156679840, 1648728391811104, 127, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156679872, 1648728391811104, 128, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156679904, 1648728391811104, 129, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156679936, 1648728391811104, 1000, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156679968, 1648728391811104, 1001, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680000, 1648728391811104, 1002, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680032, 1648728391811104, 1003, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680064, 1648728391811104, 1004, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680096, 1648728391811104, 1005, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680128, 1648728391811104, 1006, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680160, 1648728391811104, 1007, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680192, 1648728391811104, 1008, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680224, 1648728391811104, 1009, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680256, 1648728391811104, 1010, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680288, 1648728391811104, 1011, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680320, 1648728391811104, 1012, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680352, 1648728391811104, 1013, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680384, 1648728391811104, 1014, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680416, 1648728391811104, 1015, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680448, 1648728391811104, 1016, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680480, 1648728391811104, 1017, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680512, 1648728391811104, 1018, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680544, 1648728391811104, 200, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680576, 1648728391811104, 201, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680608, 1648728391811104, 1021, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680640, 1648728391811104, 1022, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680672, 1648728391811104, 1023, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680704, 1648728391811104, 1024, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680736, 1648728391811104, 1025, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680768, 1648728391811104, 1026, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680800, 1648728391811104, 1027, 1);
INSERT INTO `auth_role_permission` VALUES (1655949156680832, 1648728391811104, 7, 1);
INSERT INTO `auth_role_permission` VALUES (1655949177651232, 1648732317679648, 1007, 1);
INSERT INTO `auth_role_permission` VALUES (1655949177651264, 1648732317679648, 125, 1);
INSERT INTO `auth_role_permission` VALUES (1655949177651296, 1648732317679648, 7, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213302816, 1654359553212448, 123, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213302848, 1654359553212448, 3, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213302880, 1654359553212448, 4, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213302912, 1654359553212448, 1000, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213302944, 1654359553212448, 1001, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213302976, 1654359553212448, 1002, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213303008, 1654359553212448, 7, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213303040, 1654359553212448, 111, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213303072, 1654359553212448, 112, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213303104, 1654359553212448, 113, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213303136, 1654359553212448, 114, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213303168, 1654359553212448, 115, 1);
INSERT INTO `auth_role_permission` VALUES (1655949213303200, 1654359553212448, 116, 1);
INSERT INTO `auth_role_permission` VALUES (1655949230080032, 1655804744695840, 2, 1);
INSERT INTO `auth_role_permission` VALUES (1655949230080064, 1655804744695840, 105, 1);
INSERT INTO `auth_role_permission` VALUES (1655949230080096, 1655804744695840, 106, 1);
INSERT INTO `auth_role_permission` VALUES (1655949230080128, 1655804744695840, 107, 1);
INSERT INTO `auth_role_permission` VALUES (1655949230080160, 1655804744695840, 108, 1);
INSERT INTO `auth_role_permission` VALUES (1655949230080192, 1655804744695840, 109, 1);
INSERT INTO `auth_role_permission` VALUES (1655949230080224, 1655804744695840, 110, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890400, 1648724665172000, 7, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890432, 1648724665172000, 123, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890464, 1648724665172000, 124, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890496, 1648724665172000, 125, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890528, 1648724665172000, 126, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890560, 1648724665172000, 127, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890592, 1648724665172000, 128, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890624, 1648724665172000, 129, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890656, 1648724665172000, 1000, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890688, 1648724665172000, 1001, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890720, 1648724665172000, 1002, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890752, 1648724665172000, 1003, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890784, 1648724665172000, 1004, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890816, 1648724665172000, 1005, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890848, 1648724665172000, 1006, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890880, 1648724665172000, 1007, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890912, 1648724665172000, 1008, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890944, 1648724665172000, 1009, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104890976, 1648724665172000, 1010, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891008, 1648724665172000, 1011, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891040, 1648724665172000, 1012, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891072, 1648724665172000, 1013, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891104, 1648724665172000, 1014, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891136, 1648724665172000, 1015, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891168, 1648724665172000, 1016, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891200, 1648724665172000, 1017, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891232, 1648724665172000, 1018, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891264, 1648724665172000, 200, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891296, 1648724665172000, 201, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891328, 1648724665172000, 1021, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891360, 1648724665172000, 1022, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891392, 1648724665172000, 1023, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891424, 1648724665172000, 1024, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891456, 1648724665172000, 1025, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891488, 1648724665172000, 1026, 1);
INSERT INTO `auth_role_permission` VALUES (1656000104891520, 1648724665172000, 1027, 1);

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
  `avatar_id` bigint NULL DEFAULT NULL COMMENT '头像id',
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
INSERT INTO `auth_user` VALUES (1, 'admin', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '超级管理员', 'male', 1655621436833824, '15312665707', 'manager', '2024-07-14 01:06:28', NULL, '2024-12-27 23:20:49', 1, 1);
INSERT INTO `auth_user` VALUES (1648725644541984, 'sysUser', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '系统管理测试用户', 'male', 1655837841948704, '15312445781', 'manager', '2024-11-29 13:34:11', 1, '2025-01-07 19:36:53', 1651450646102112, 1);
INSERT INTO `auth_user` VALUES (1651450646102112, 'zhonghanlu', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '仲寒露', 'male', 1655995432435744, '15312665707', 'manager', '2024-12-14 14:30:34', 1, '2025-01-08 17:06:38', 1, 1);
INSERT INTO `auth_user` VALUES (1653877009023008, 'test01', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '测试01', 'female', 1655961462767648, '18301914615', 'manager', '2024-12-27 23:53:34', 1, '2025-01-08 11:59:21', 1, 1);
INSERT INTO `auth_user` VALUES (1654934657302592, 'wangboss', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '小王吧', 'male', 1655995411464224, '18157568583', 'manager', '2025-01-02 19:58:59', 1651450646102112, '2025-01-08 16:29:07', 1651450646102112, 1);
INSERT INTO `auth_user` VALUES (1655621956927520, 'test', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '仲寒露测试', 'male', 1655830109749280, '15312665707', 'manager', '2025-01-06 15:01:09', 1, '2025-01-07 18:53:42', 1651450646102112, 1);

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
INSERT INTO `auth_user_role` VALUES (1655832410325024, 1655804744695840, '测试02', 1655621956927520, 'test', 1);
INSERT INTO `auth_user_role` VALUES (1655837844045856, 1655804744695840, '测试02', 1648725644541984, 'sysUser', 1);
INSERT INTO `auth_user_role` VALUES (1655961469059104, 1654359553212448, '测试角色1', 1653877009023008, 'test01', 1);
INSERT INTO `auth_user_role` VALUES (1655995413561376, 1648726439362592, '系统管理人员2', 1654934657302592, 'wangboss', 1);
INSERT INTO `auth_user_role` VALUES (1655995413561408, 1648728391811104, '系统管理人员3', 1654934657302592, 'wangboss', 1);
INSERT INTO `auth_user_role` VALUES (1655995413561440, 1648732317679648, '系统管理人员5', 1654934657302592, 'wangboss', 1);
INSERT INTO `auth_user_role` VALUES (1655997858840608, 1655841279180832, '测试流程', 1655841207877664, 'zhl', 1);
INSERT INTO `auth_user_role` VALUES (1656000134250528, 1648724665172000, '系统管理人员', 1651450646102112, 'zhonghanlu', 1);

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
  `intention_cur_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '意向时间',
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
INSERT INTO `bm_class_grade` VALUES (1647456745947168, 'python一班', 1646200895832096, '丽丽', 1646195281756192, '东教室', NULL, NULL, NULL, NULL, NULL, '2024-11-22 13:29:53', NULL, '2024-11-22 13:29:53', 1);
INSERT INTO `bm_class_grade` VALUES (1648021840330784, '班级啊啊啊啊', 1646204593111072, '小王啊', 1646195281756192, '西教室', NULL, NULL, NULL, NULL, 1, '2024-11-25 16:20:52', 1, '2024-11-25 16:20:52', -1);
INSERT INTO `bm_class_grade` VALUES (1654935944953888, 'python105班', 1651450646102048, '仲寒露', 1646195281756192, '西教室', 'python', 'long', 'long_saturday_down_two', 'normal', 1654934657302592, '2025-01-02 20:09:13', 1654934657302592, '2025-01-02 20:09:13', 1);
INSERT INTO `bm_class_grade` VALUES (1654935944953952, 'python106班', 1651450646102048, '仲寒露', 1646195281756192, '西教室', 'python', 'long', 'long_saturday_down_one', 'normal', 1654934657302592, '2025-01-02 20:09:13', 1654934657302592, '2025-01-02 20:09:13', 1);
INSERT INTO `bm_class_grade` VALUES (1654935944954080, 'python107班', 1651450646102048, '仲寒露', 1646195281756192, '西教室', 'python', 'long', 'long_saturday_up_one', 'normal', 1654934657302592, '2025-01-02 20:09:13', 1654934657302592, '2025-01-02 20:09:13', 1);
INSERT INTO `bm_class_grade` VALUES (1654935944954336, 'python108班', 1654934657302560, '小王吧', 1646205509566496, '一个教室', 'python', 'long', 'long_saturday_down_one', 'normal', 1654934657302592, '2025-01-02 20:09:13', 1654934657302592, '2025-01-02 20:09:13', 1);

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
INSERT INTO `bm_classroom_intention` VALUES (1652547859251232, 1646195281756192, '西教室', 7, 'short_monday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251264, 1646195281756192, '西教室', 7, 'short_monday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251296, 1646195281756192, '西教室', 7, 'short_monday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251328, 1646195281756192, '西教室', 7, 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251360, 1646195281756192, '西教室', 7, 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251392, 1646195281756192, '西教室', 7, 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251424, 1646195281756192, '西教室', 7, 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251456, 1646195281756192, '西教室', 7, 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251488, 1646195281756192, '西教室', 7, 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251520, 1646195281756192, '西教室', 7, 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251552, 1646195281756192, '西教室', 7, 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251584, 1646195281756192, '西教室', 7, 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251616, 1646195281756192, '西教室', 7, 'short_friday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251648, 1646195281756192, '西教室', 7, 'short_friday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251680, 1646195281756192, '西教室', 7, 'short_friday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251712, 1646195281756192, '西教室', 7, 'long_saturday_up_one', 1654935944954080, 'python107班', NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251744, 1646195281756192, '西教室', 7, 'long_saturday_down_one', 1654935944953952, 'python106班', NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251776, 1646195281756192, '西教室', 7, 'long_saturday_down_two', 1654935944953888, 'python105班', NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251808, 1646195281756192, '西教室', 7, 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251840, 1646195281756192, '西教室', 7, 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251872, 1646195281756192, '西教室', 7, 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251904, 1646205509566496, '一个教室', 5, 'short_monday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251936, 1646205509566496, '一个教室', 5, 'short_monday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859251968, 1646205509566496, '一个教室', 5, 'short_monday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252000, 1646205509566496, '一个教室', 5, 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252032, 1646205509566496, '一个教室', 5, 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252064, 1646205509566496, '一个教室', 5, 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252096, 1646205509566496, '一个教室', 5, 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252128, 1646205509566496, '一个教室', 5, 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252160, 1646205509566496, '一个教室', 5, 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252192, 1646205509566496, '一个教室', 5, 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252224, 1646205509566496, '一个教室', 5, 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252256, 1646205509566496, '一个教室', 5, 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252288, 1646205509566496, '一个教室', 5, 'short_friday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252320, 1646205509566496, '一个教室', 5, 'short_friday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252352, 1646205509566496, '一个教室', 5, 'short_friday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252384, 1646205509566496, '一个教室', 5, 'long_saturday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252416, 1646205509566496, '一个教室', 5, 'long_saturday_down_one', 1654935944954336, 'python108班', NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252448, 1646205509566496, '一个教室', 5, 'long_saturday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252480, 1646205509566496, '一个教室', 5, 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252512, 1646205509566496, '一个教室', 5, 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);
INSERT INTO `bm_classroom_intention` VALUES (1652547859252544, 1646205509566496, '一个教室', 5, 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-20 15:50:25', NULL, '2024-12-20 15:50:25', 1);

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
  `course_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上课状态 待上课 已上课 已结束 已过期',
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
INSERT INTO `bm_course` VALUES (1654938407010368, 'python', '认识进制', 6, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 7, 1646195281756192, '西教室', 1651450646102048, '仲寒露', 1654935944954080, 'python107班', 'class_has_started', 1654934657302592, '2025-01-02 20:28:47', 1654934657302592, '2025-01-02 20:42:29', 1);
INSERT INTO `bm_course` VALUES (1654938407010400, 'python', 'python 环境变量', 6, '2025-01-04 14:00:00', '2025-01-04 16:00:00', 3, 1646195281756192, '西教室', 1651450646102048, '仲寒露', 1654935944953952, 'python106班', 'wait_for_class', 1654934657302592, '2025-01-02 20:28:47', 1654934657302592, '2025-01-02 20:28:47', 1);
INSERT INTO `bm_course` VALUES (1654938407010432, 'python', 'python 分支结构', 6, '2025-01-04 14:00:00', '2025-01-04 16:00:00', 1, 1646205509566496, '一个教室', 1654934657302560, '小王吧', 1654935944954336, 'python108班', 'wait_for_class', 1654934657302592, '2025-01-02 20:28:47', 1654934657302592, '2025-01-02 20:28:47', 1);
INSERT INTO `bm_course` VALUES (1654938407010464, 'python', 'python 循环语句', 6, '2025-01-04 16:30:00', '2025-01-04 18:30:00', 1, 1646195281756192, '西教室', 1651450646102048, '仲寒露', 1654935944953888, 'python105班', 'wait_for_class', 1654934657302592, '2025-01-02 20:28:48', 1654934657302592, '2025-01-02 20:28:48', 1);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程讲义与课堂作业' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_course_notes
-- ----------------------------
INSERT INTO `bm_course_notes` VALUES (1654940348973088, 1654938407010368, 'handouts', 3, 1654934657302592, '2025-01-02 20:44:14', 1654934657302592, '2025-01-02 20:44:14', 1);
INSERT INTO `bm_course_notes` VALUES (1654940348973120, 1654938407010368, 'handouts', 69, 1654934657302592, '2025-01-02 20:44:14', 1654934657302592, '2025-01-02 20:44:14', 1);
INSERT INTO `bm_course_notes` VALUES (1654940348973152, 1654938407010368, 'handouts', 56, 1654934657302592, '2025-01-02 20:44:14', 1654934657302592, '2025-01-02 20:44:14', 1);
INSERT INTO `bm_course_notes` VALUES (1654940348973184, 1654938407010368, 'handouts', 80, 1654934657302592, '2025-01-02 20:44:14', 1654934657302592, '2025-01-02 20:44:14', 1);
INSERT INTO `bm_course_notes` VALUES (1654940348973216, 1654938407010368, 'handouts', 59, 1654934657302592, '2025-01-02 20:44:14', 1654934657302592, '2025-01-02 20:44:14', 1);
INSERT INTO `bm_course_notes` VALUES (1654940348973248, 1654938407010368, 'task', 16, 1654934657302592, '2025-01-02 20:44:14', 1654934657302592, '2025-01-02 20:44:14', 1);
INSERT INTO `bm_course_notes` VALUES (1654940348973280, 1654938407010368, 'task', 30, 1654934657302592, '2025-01-02 20:44:14', 1654934657302592, '2025-01-02 20:44:14', 1);
INSERT INTO `bm_course_notes` VALUES (1654940348973312, 1654938407010368, 'task', 90, 1654934657302592, '2025-01-02 20:44:14', 1654934657302592, '2025-01-02 20:44:14', 1);
INSERT INTO `bm_course_notes` VALUES (1654940348973344, 1654938407010368, 'task', 32, 1654934657302592, '2025-01-02 20:44:14', 1654934657302592, '2025-01-02 20:44:14', 1);
INSERT INTO `bm_course_notes` VALUES (1654940348973376, 1654938407010368, 'task', 30, 1654934657302592, '2025-01-02 20:44:14', 1654934657302592, '2025-01-02 20:44:14', 1);

-- ----------------------------
-- Table structure for bm_course_ration
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_ration`;
CREATE TABLE `bm_course_ration`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课时类型',
  `ratio` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机构课程类型比例表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_course_ration
-- ----------------------------
INSERT INTO `bm_course_ration` VALUES (1, 'cpp', '2');
INSERT INTO `bm_course_ration` VALUES (2, 'python', '1.5');
INSERT INTO `bm_course_ration` VALUES (3, 'scratch', '1');

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
INSERT INTO `bm_course_schedule` VALUES (1647478726197280, '24年11月10-24年11月21日', '2024-11-22 16:32:27', '2024-11-22 16:32:27', NULL, '2024-11-22 16:24:34', NULL, '2024-11-22 16:24:34', -1);
INSERT INTO `bm_course_schedule` VALUES (1654938407010336, '2025第一周课', '2025-01-03 00:00:00', '2025-01-05 23:59:59', 1654934657302592, '2025-01-02 20:28:47', 1654934657302592, '2025-01-02 20:28:47', 1);

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
INSERT INTO `bm_course_schedule_item` VALUES (1654938407010496, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 1654938407010368, '认识进制', 1654938407010336, 0, 1654934657302592, '2025-01-02 20:28:48', 1654934657302592, '2025-01-02 20:28:48', 1);
INSERT INTO `bm_course_schedule_item` VALUES (1654938407010528, '2025-01-04 14:00:00', '2025-01-04 16:00:00', 1654938407010400, 'python 环境变量', 1654938407010336, 0, 1654934657302592, '2025-01-02 20:28:48', 1654934657302592, '2025-01-02 20:28:48', 1);
INSERT INTO `bm_course_schedule_item` VALUES (1654938407010560, '2025-01-04 14:00:00', '2025-01-04 16:00:00', 1654938407010432, 'python 分支结构', 1654938407010336, 0, 1654934657302592, '2025-01-02 20:28:48', 1654934657302592, '2025-01-02 20:28:48', 1);
INSERT INTO `bm_course_schedule_item` VALUES (1654938407010592, '2025-01-04 16:30:00', '2025-01-04 18:30:00', 1654938407010464, 'python 循环语句', 1654938407010336, 0, 1654934657302592, '2025-01-02 20:28:48', 1654934657302592, '2025-01-02 20:28:48', 1);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生上课图片信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_course_stu_pic
-- ----------------------------
INSERT INTO `bm_course_stu_pic` VALUES (1654940267184160, 1654938407010368, 1651474167758881, 1, 1654934657302592, '2025-01-02 20:43:34', 1654934657302592, '2025-01-02 20:43:34', 1);
INSERT INTO `bm_course_stu_pic` VALUES (1654940267184192, 1654938407010368, 1651474167758881, 2, 1654934657302592, '2025-01-02 20:43:34', 1654934657302592, '2025-01-02 20:43:34', 1);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生上课签到表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bm_course_stu_sign
-- ----------------------------
INSERT INTO `bm_course_stu_sign` VALUES (1654940076343328, 1654938407010368, 1651474167758881, 'arrived', 1654934657302592, '2025-01-02 20:42:03', 1654934657302592, '2025-01-02 20:42:03', 1);
INSERT INTO `bm_course_stu_sign` VALUES (1654940076343360, 1654938407010368, 1651474167758882, 'arrived', 1654934657302592, '2025-01-02 20:42:04', 1654934657302592, '2025-01-02 20:42:04', 1);
INSERT INTO `bm_course_stu_sign` VALUES (1654940076343392, 1654938407010368, 1651473914003488, 'arrived', 1654934657302592, '2025-01-02 20:42:04', 1654934657302592, '2025-01-02 20:42:04', 1);
INSERT INTO `bm_course_stu_sign` VALUES (1654940076343424, 1654938407010368, 1651455106744352, 'arrived', 1654934657302592, '2025-01-02 20:42:04', 1654934657302592, '2025-01-02 20:42:04', 1);
INSERT INTO `bm_course_stu_sign` VALUES (1654940076343456, 1654938407010368, 1651473941266464, 'arrived', 1654934657302592, '2025-01-02 20:42:04', 1654934657302592, '2025-01-02 20:42:04', 1);
INSERT INTO `bm_course_stu_sign` VALUES (1654940076343488, 1654938407010368, 1651473997889568, 'arrived', 1654934657302592, '2025-01-02 20:42:04', 1654934657302592, '2025-01-02 20:42:04', 1);
INSERT INTO `bm_course_stu_sign` VALUES (1654940076343520, 1654938407010368, 1651474115330080, 'non_arrived', 1654934657302592, '2025-01-02 20:42:04', 1654934657302592, '2025-01-02 20:42:04', 1);

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
INSERT INTO `bm_stu_class_grade` VALUES (1654935944953920, 1651474071289888, '李哦哦', 'python', 1654935944953888, 'python105班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944953984, 1651473970626592, '仲嘻嘻', 'python', 1654935944953952, 'python106班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944954016, 1651474025152544, '王哈哈', 'python', 1654935944953952, 'python106班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944954048, 1651474046124064, '李哈哈', 'python', 1654935944953952, 'python106班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944954112, 1651474167758881, '啊玩玩1', 'python', 1654935944954080, 'python107班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944954144, 1651474167758882, '啊玩玩2', 'python', 1654935944954080, 'python107班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944954176, 1651455106744352, '王思思', 'python', 1654935944954080, 'python107班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944954208, 1651473914003488, '王丝丝', 'python', 1654935944954080, 'python107班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944954240, 1651473941266464, '仲丝丝', 'python', 1654935944954080, 'python107班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944954272, 1651473997889568, '王嘻嘻', 'python', 1654935944954080, 'python107班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944954304, 1651474115330080, '藏哦哦', 'python', 1654935944954080, 'python107班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);
INSERT INTO `bm_stu_class_grade` VALUES (1654935944954368, 1651474167758880, '齐哦哦', 'python', 1654935944954336, 'python108班', 1654934657302592, '2025-01-02 20:09:14', 1654934657302592, '2025-01-02 20:09:14', 1);

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
  `stu_cur_school_id` bigint NULL DEFAULT NULL COMMENT '学校id',
  `stu_cur_school` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生当前学校',
  `stu_cur_grade_id` bigint NULL DEFAULT NULL COMMENT '年级id',
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
INSERT INTO `bm_student` VALUES (1651455106744352, '王思思', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 15:06:01', 1651450646102112, '2024-12-14 15:06:01', 1);
INSERT INTO `bm_student` VALUES (1651473914003488, '王丝丝', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:35:29', 1651450646102112, '2024-12-14 17:35:29', 1);
INSERT INTO `bm_student` VALUES (1651473941266464, '仲丝丝', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:35:41', 1651450646102112, '2024-12-14 17:35:41', 1);
INSERT INTO `bm_student` VALUES (1651473970626592, '仲嘻嘻', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:35:56', 1651450646102112, '2024-12-14 17:35:56', 1);
INSERT INTO `bm_student` VALUES (1651473997889568, '王嘻嘻', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:36:08', 1651450646102112, '2024-12-14 17:36:08', 1);
INSERT INTO `bm_student` VALUES (1651474025152544, '王哈哈', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:36:21', 1651450646102112, '2024-12-14 17:36:21', 1);
INSERT INTO `bm_student` VALUES (1651474046124064, '李哈哈', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:36:32', 1651450646102112, '2024-12-14 17:36:32', 1);
INSERT INTO `bm_student` VALUES (1651474071289888, '李哦哦', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:36:43', 1651450646102112, '2024-12-14 17:36:43', 1);
INSERT INTO `bm_student` VALUES (1651474115330080, '藏哦哦', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:37:05', 1651450646102112, '2024-12-14 17:37:05', 1);
INSERT INTO `bm_student` VALUES (1651474167758880, '齐哦哦', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:37:30', 1651450646102112, '2024-12-14 17:37:30', 1);

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
INSERT INTO `bm_teacher` VALUES (1654934657302560, 17, '小王吧', 'male', '18157568583', 'f.rmd@qq.com', 1645826375942176, '启智编梦', 1651450646102112, '2025-01-02 19:58:59', 1651450646102112, '2025-01-02 19:58:59', 1);

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
INSERT INTO `bm_teacher_intention` VALUES (1652019051888864, 1651450646102048, '仲寒露', 'short_monday_up_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051888896, 1651450646102048, '仲寒露', 'short_monday_down_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051888928, 1651450646102048, '仲寒露', 'short_monday_down_two', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051888960, 1651450646102048, '仲寒露', 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051888992, 1651450646102048, '仲寒露', 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889024, 1651450646102048, '仲寒露', 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889056, 1651450646102048, '仲寒露', 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889088, 1651450646102048, '仲寒露', 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889120, 1651450646102048, '仲寒露', 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889152, 1651450646102048, '仲寒露', 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889184, 1651450646102048, '仲寒露', 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889216, 1651450646102048, '仲寒露', 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889248, 1651450646102048, '仲寒露', 'short_friday_up_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889280, 1651450646102048, '仲寒露', 'short_friday_down_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889312, 1651450646102048, '仲寒露', 'short_friday_down_two', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889376, 1651450646102048, '仲寒露', 'long_saturday_down_one', 1654935944953952, 'python106班', NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889408, 1651450646102048, '仲寒露', 'long_saturday_down_two', 1654935944953888, 'python105班', NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019051889440, 1651450646102048, '仲寒露', 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-17 17:47:50', NULL, '2024-12-17 17:47:50', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019272089632, 1651450646102048, '仲寒露', 'long_saturday_up_one', 1654935944954080, 'python107班', NULL, '2024-12-17 17:49:36', NULL, '2024-12-17 17:49:36', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019272089664, 1651450646102048, '仲寒露', 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-17 17:49:36', NULL, '2024-12-17 17:49:36', 1);
INSERT INTO `bm_teacher_intention` VALUES (1652019272089696, 1651450646102048, '仲寒露', 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-17 17:49:36', NULL, '2024-12-17 17:49:36', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061152, 1654934657302560, '小王吧', 'short_monday_up_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061184, 1654934657302560, '小王吧', 'short_monday_down_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061216, 1654934657302560, '小王吧', 'short_monday_down_two', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061248, 1654934657302560, '小王吧', 'short_tuesday_up_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061280, 1654934657302560, '小王吧', 'short_tuesday_down_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061312, 1654934657302560, '小王吧', 'short_tuesday_down_two', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061344, 1654934657302560, '小王吧', 'short_wednesday_up_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061376, 1654934657302560, '小王吧', 'short_wednesday_down_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061408, 1654934657302560, '小王吧', 'short_wednesday_down_two', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061440, 1654934657302560, '小王吧', 'short_thursday_up_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061472, 1654934657302560, '小王吧', 'short_thursday_down_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061504, 1654934657302560, '小王吧', 'short_thursday_down_two', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061536, 1654934657302560, '小王吧', 'short_friday_up_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061568, 1654934657302560, '小王吧', 'short_friday_down_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061600, 1654934657302560, '小王吧', 'short_friday_down_two', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061632, 1654934657302560, '小王吧', 'long_saturday_up_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061664, 1654934657302560, '小王吧', 'long_saturday_down_one', 1654935944954336, 'python108班', NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061696, 1654934657302560, '小王吧', 'long_saturday_down_two', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061728, 1654934657302560, '小王吧', 'long_sunday_up_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061760, 1654934657302560, '小王吧', 'long_sunday_down_one', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);
INSERT INTO `bm_teacher_intention` VALUES (1654935645061792, 1654934657302560, '小王吧', 'long_sunday_down_two', NULL, NULL, NULL, '2025-01-02 20:06:51', NULL, '2025-01-02 20:06:51', 1);

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
INSERT INTO `bm_user_teacher` VALUES (1654934657302624, 1654934657302560, 1654934657302592);

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
INSERT INTO `sys_config` VALUES (1654537899212832, '测试', 'test', 'value', 'yes', 'yes', '2024-12-31 15:25:50', 1, '2024-12-31 15:25:50', 1, -1);
INSERT INTO `sys_config` VALUES (1654538108928032, 'test', 'test', 'value', 'yes', 'yes', '2024-12-31 15:27:30', 1, '2024-12-31 15:27:30', 1, -1);
INSERT INTO `sys_config` VALUES (1655643515650080, '测试配置1', 'test1', 'test1', 'yes', 'yes', '2025-01-06 17:52:29', 1, '2025-01-06 17:52:51', 1, 1);

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
INSERT INTO `sys_file` VALUES (1654866378227744, 'logo', 'logo.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-02 10:56:22', 1, '2025-01-02 10:56:22', 1, 1);
INSERT INTO `sys_file` VALUES (1655621436833824, 'wangboss', 'wangboss.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-06 14:57:02', 1, '2025-01-06 14:57:02', 1, 1);
INSERT INTO `sys_file` VALUES (1655633315102752, '1111', '1111.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-06 16:31:26', 1651450646102112, '2025-01-06 16:31:26', 1, 1);
INSERT INTO `sys_file` VALUES (1655837571416096, 'WX20250107-183454@2x', 'WX20250107-183454@2x.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 19:34:42', 1, '2025-01-07 19:34:42', 1, 1);
INSERT INTO `sys_file` VALUES (1655837644816416, '1736249711678', '1736249711678.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 19:35:17', 1, '2025-01-07 19:35:17', 1, 1);
INSERT INTO `sys_file` VALUES (1655837674176544, '1736249728764', '1736249728764.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 19:35:32', 1, '2025-01-07 19:35:32', 1, 1);
INSERT INTO `sys_file` VALUES (1655837699342368, '1736249741477', '1736249741477.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 19:35:44', 1, '2025-01-07 19:35:44', 1, 1);
INSERT INTO `sys_file` VALUES (1655837758062624, 'WX20250107-183511@2x', 'WX20250107-183511@2x.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 19:36:12', 1651450646102112, '2025-01-07 19:36:12', 1651450646102112, 1);
INSERT INTO `sys_file` VALUES (1655837841948704, '1736249806743', '1736249806743.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 19:36:52', 1651450646102112, '2025-01-07 19:36:52', 1651450646102112, 1);
INSERT INTO `sys_file` VALUES (1655840509526048, '1736251080584', '1736251080584.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 19:58:03', 1651450646102112, '2025-01-07 19:58:03', 1651450646102112, 1);
INSERT INTO `sys_file` VALUES (1655840817807392, '1736251225825', '1736251225825.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 20:00:30', 1651450646102112, '2025-01-07 20:00:30', 1651450646102112, 1);
INSERT INTO `sys_file` VALUES (1655854642233376, '1736257813559', '1736257813559.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 21:50:23', 1, '2025-01-07 21:50:23', 1, 1);
INSERT INTO `sys_file` VALUES (1655854700953632, '1736257844193', '1736257844193.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 21:50:51', 1, '2025-01-07 21:50:51', 1, 1);
INSERT INTO `sys_file` VALUES (1655854799519776, '1736257892376', '1736257892376.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 21:51:37', 1, '2025-01-07 21:51:37', 1, 1);
INSERT INTO `sys_file` VALUES (1655854835171360, '1736257910104', '1736257910104.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-07 21:51:55', 1, '2025-01-07 21:51:55', 1, 1);
INSERT INTO `sys_file` VALUES (1655961462767648, 'f46d040b704c11e0578312', 'f46d040b704c11e0578312.jpg', 'image/png', 'pc', 'e-mode-bucket', '2025-01-08 11:59:19', 1, '2025-01-08 11:59:19', 1, 1);
INSERT INTO `sys_file` VALUES (1655961699745824, '1736308867383', '1736308867383.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-08 12:01:11', 1655621956927520, '2025-01-08 12:01:11', 1655621956927520, 1);
INSERT INTO `sys_file` VALUES (1655961771048992, '1736308900039', '1736308900039.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-08 12:01:46', 1, '2025-01-08 12:01:46', 1, 1);
INSERT INTO `sys_file` VALUES (1655962219839520, '1736309116294', '1736309116294.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-08 12:05:19', 1, '2025-01-08 12:05:19', 1, 1);
INSERT INTO `sys_file` VALUES (1655995411464224, '1736324945171', '1736324945171.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-08 16:29:06', 1651450646102112, '2025-01-08 16:29:06', 1651450646102112, 1);
INSERT INTO `sys_file` VALUES (1655995432435744, '1736324952484', '1736324952484.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-08 16:29:17', 1651450646102112, '2025-01-08 16:29:17', 1651450646102112, 1);

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
INSERT INTO `sys_login_opt` VALUES (1655944610054176, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 09:45:23');
INSERT INTO `sys_login_opt` VALUES (1655959361421344, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 11:42:37');
INSERT INTO `sys_login_opt` VALUES (1655959386587168, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 11:42:49');
INSERT INTO `sys_login_opt` VALUES (1655961366298656, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 11:58:33');
INSERT INTO `sys_login_opt` VALUES (1655961385173056, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 11:58:42');
INSERT INTO `sys_login_opt` VALUES (1655961630539808, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 12:00:39');
INSERT INTO `sys_login_opt` VALUES (1655961651511328, 'test', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 12:00:49');
INSERT INTO `sys_login_opt` VALUES (1655961750077504, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 12:01:35');
INSERT INTO `sys_login_opt` VALUES (1655962567966752, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 12:08:06');
INSERT INTO `sys_login_opt` VALUES (1655973938724896, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 13:38:28');
INSERT INTO `sys_login_opt` VALUES (1655974114885696, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 13:39:51');
INSERT INTO `sys_login_opt` VALUES (1655974129565760, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 13:39:58');
INSERT INTO `sys_login_opt` VALUES (1655974129565856, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 13:39:59');
INSERT INTO `sys_login_opt` VALUES (1655974221840416, 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 13:40:42');
INSERT INTO `sys_login_opt` VALUES (1655994903953472, 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 16:25:04');
INSERT INTO `sys_login_opt` VALUES (1655995323383840, 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 16:28:24');
INSERT INTO `sys_login_opt` VALUES (1655995346452512, 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 16:28:36');
INSERT INTO `sys_login_opt` VALUES (1655995497447456, 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 16:29:48');
INSERT INTO `sys_login_opt` VALUES (1655995518418976, 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 16:29:58');
INSERT INTO `sys_login_opt` VALUES (1655998284562464, 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 16:51:56');
INSERT INTO `sys_login_opt` VALUES (1655998307631168, 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 16:52:08');
INSERT INTO `sys_login_opt` VALUES (1656000018907168, 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 17:05:44');
INSERT INTO `sys_login_opt` VALUES (1656000037781568, 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 17:05:52');
INSERT INTO `sys_login_opt` VALUES (1656000146833440, 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 17:06:44');
INSERT INTO `sys_login_opt` VALUES (1656000165707840, 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 17:06:54');
INSERT INTO `sys_login_opt` VALUES (1656000308314144, 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-08 17:08:01');
INSERT INTO `sys_login_opt` VALUES (1656000327188512, 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-08 17:08:10');

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
INSERT INTO `sys_notice` VALUES (1655644979462176, '测试消息', '测试消息内容', 1, 'local', '2025-01-06 18:04:07', 'broadcast', '2025-01-06 18:04:07', 1, '2025-01-06 18:04:07', 1, 1);
INSERT INTO `sys_notice` VALUES (1655977266905120, '测试 独立', '测', 1, 'local', '2025-01-08 14:04:55', 'alone', '2025-01-08 14:04:55', NULL, '2025-01-08 14:04:55', NULL, 1);
INSERT INTO `sys_notice` VALUES (1655977686335584, '测试 独立2', '测试', 1, 'local', '2025-01-08 14:08:15', 'alone', '2025-01-08 14:08:15', NULL, '2025-01-08 14:08:15', NULL, 1);
INSERT INTO `sys_notice` VALUES (1655979080941632, '测试 广播', '烦烦烦', 1, 'local', '2025-01-08 14:19:19', 'broadcast', '2025-01-08 14:19:19', 1, '2025-01-08 14:19:19', 1, 1);

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
INSERT INTO `sys_user_notice` VALUES (1655977266905152, 1655977266905120, 1, '15312665707', '', 'no', '2025-01-08 14:04:55', NULL, '2025-01-08 14:04:55', NULL, 1);
INSERT INTO `sys_user_notice` VALUES (1655977686335616, 1655977686335584, 1, '15312665707', '', 'no', '2025-01-08 14:08:15', NULL, '2025-01-08 14:08:15', NULL, 1);
INSERT INTO `sys_user_notice` VALUES (1655977686335648, 1655977686335584, 1648725644541984, '15312445781', '', 'no', '2025-01-08 14:08:15', NULL, '2025-01-08 14:08:15', NULL, 1);
INSERT INTO `sys_user_notice` VALUES (1655977686335680, 1655977686335584, 1651450646102112, '15312665707', '', 'no', '2025-01-08 14:08:15', NULL, '2025-01-08 14:08:15', NULL, 1);
INSERT INTO `sys_user_notice` VALUES (1655977686335712, 1655977686335584, 1653877009023008, '18301914615', '', 'no', '2025-01-08 14:08:15', NULL, '2025-01-08 14:08:15', NULL, 1);
INSERT INTO `sys_user_notice` VALUES (1655977686335744, 1655977686335584, 1654934657302592, '18157568583', '', 'no', '2025-01-08 14:08:15', NULL, '2025-01-08 14:08:15', NULL, 1);
INSERT INTO `sys_user_notice` VALUES (1655977686335776, 1655977686335584, 1655621956927520, '15312665707', '', 'no', '2025-01-08 14:08:15', NULL, '2025-01-08 14:08:15', NULL, 1);

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
INSERT INTO `sys_user_opt` VALUES (1655944610054208, '4a49af01-f132-4f2a-a161-a664a0d045b1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 09:45:23');
INSERT INTO `sys_user_opt` VALUES (1655944610054240, '2c2cd032-967e-4f18-af46-52c5766c297e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 09:45:23');
INSERT INTO `sys_user_opt` VALUES (1655944610054272, '0ccd9096-429b-4286-a4a8-a11eb9150e18', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 09:45:23');
INSERT INTO `sys_user_opt` VALUES (1655944668774432, 'af9e537c-bac4-4829-b174-65bcbb005ad9', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 09:45:50');
INSERT INTO `sys_user_opt` VALUES (1655944702328864, '0c7aebb3-f2c4-47ca-b38a-e2147f071f39', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 09:46:06');
INSERT INTO `sys_user_opt` VALUES (1655946956767264, 'f3951de3-8b53-4880-9a09-185274fb8f04', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:04:02');
INSERT INTO `sys_user_opt` VALUES (1655946956767296, 'a2795435-7eb7-425c-adcb-19e00efe44c4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1655841279180832', '{roleId=1655841279180832}', 'yes', '2025-01-08 10:04:02');
INSERT INTO `sys_user_opt` VALUES (1655946977738784, 'e0f22bd2-9a45-47cf-b32e-23f54b6814a5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:04:12');
INSERT INTO `sys_user_opt` VALUES (1655946977738816, '8c352338-7c58-42f8-8dba-4e87ce8574f9', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 10:04:12');
INSERT INTO `sys_user_opt` VALUES (1655947090984992, '1b8cc1a3-a7dc-423b-b5c1-3498d655e138', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:05:06');
INSERT INTO `sys_user_opt` VALUES (1655947189551136, 'e2cc4c71-c190-45ca-9592-adc8c5a513b2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:05:52');
INSERT INTO `sys_user_opt` VALUES (1655948250710048, 'f3921cd8-f404-4c43-a00c-b6cf59807183', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:14:18');
INSERT INTO `sys_user_opt` VALUES (1655948250710080, '6332ab25-643d-455d-b83a-154ac4b6e883', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:14:19');
INSERT INTO `sys_user_opt` VALUES (1655948250710112, '4f614fae-9544-4cf6-aaeb-2ea834d52d25', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:14:19');
INSERT INTO `sys_user_opt` VALUES (1655948252807200, 'ec0cf1ff-2e5d-4d24-af2b-ac91869a6a60', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:14:20');
INSERT INTO `sys_user_opt` VALUES (1655948363956256, '799317fe-acb3-494c-8cb9-ff8db4b8ef2d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:15:13');
INSERT INTO `sys_user_opt` VALUES (1655948363956288, 'bd4db203-4538-48c4-bec8-f30432459cbc', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:15:13');
INSERT INTO `sys_user_opt` VALUES (1655948366053408, 'aab63b15-b67d-466d-bd6f-c7316ab7fba7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:15:13');
INSERT INTO `sys_user_opt` VALUES (1655948366053440, '4ec05e6c-5345-48fa-a58a-193fb9d4a17b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:15:14');
INSERT INTO `sys_user_opt` VALUES (1655948372344864, '7d1791d3-3315-4486-923c-d05ef65747d7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:15:16');
INSERT INTO `sys_user_opt` VALUES (1655948372344896, '179e10fd-909e-4500-8f23-452d600579b8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 10:15:16');
INSERT INTO `sys_user_opt` VALUES (1655948485591104, 'e0e8c48f-8401-4e27-bcfc-4556c3bcf5e2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1648724665172000,\"roleName\":\"系统管理人员\",\"roleCode\":\"sys\",\"authPermissionIdList\":[7]}', 'yes', '2025-01-08 10:16:10');
INSERT INTO `sys_user_opt` VALUES (1655948485591136, 'cc7b5054-708a-4054-bb69-c1267b2e5fdd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:16:11');
INSERT INTO `sys_user_opt` VALUES (1655948533825568, 'd4b4b1a3-fcfa-4c32-8c9d-1b88fe465266', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 10:16:33');
INSERT INTO `sys_user_opt` VALUES (1655948533825600, '489bfc51-fb76-4cb6-8827-49fe4c0cf07f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:16:33');
INSERT INTO `sys_user_opt` VALUES (1655948579962912, '27b5466b-9b82-4fd9-8497-e385fd44d8bd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:16:55');
INSERT INTO `sys_user_opt` VALUES (1655948579962944, '668efa70-5038-41b2-9a60-87bb6c4388a3', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:16:55');
INSERT INTO `sys_user_opt` VALUES (1655948579962976, '758faeb5-dc0f-4dc6-90c9-88f43a87d4cd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:16:55');
INSERT INTO `sys_user_opt` VALUES (1655948582060064, '6d3aa2c7-7758-47d7-9403-965651dc6ecf', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:16:56');
INSERT INTO `sys_user_opt` VALUES (1655948586254368, '57b5b9f6-13c1-4676-a22f-807bc98a7a2b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:16:59');
INSERT INTO `sys_user_opt` VALUES (1655948586254400, '377ced3e-6659-4bb9-a00b-7fba0e627c6a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 10:16:59');
INSERT INTO `sys_user_opt` VALUES (1655948611420192, 'ffa85bca-2ac3-40a6-a324-259de15a28c6', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1648724665172000,\"roleName\":\"系统管理人员\",\"roleCode\":\"sys\",\"authPermissionIdList\":[7,123,124,125,126,127,128,129]}', 'yes', '2025-01-08 10:17:10');
INSERT INTO `sys_user_opt` VALUES (1655948611420224, '4990c67a-e1d8-4a63-b6d5-081516f698fb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:17:10');
INSERT INTO `sys_user_opt` VALUES (1655948619808800, '49d540e1-fb31-4052-be15-166d08354f50', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:17:15');
INSERT INTO `sys_user_opt` VALUES (1655948619808832, '9e86b449-b338-443b-a862-103507377749', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 10:17:15');
INSERT INTO `sys_user_opt` VALUES (1655948735152160, 'bfbdcec9-85f8-4ede-a240-7ae004d96ffd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1648724665172000,\"roleName\":\"系统管理人员\",\"roleCode\":\"sys\",\"authPermissionIdList\":[7,123,124,125,126,127,128,129,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,200,201,1021,1022,1023,1024,1025,1026,1027]}', 'yes', '2025-01-08 10:18:09');
INSERT INTO `sys_user_opt` VALUES (1655948735152192, 'a6374248-df32-4a99-8725-b2d3c3ee52a0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:18:09');
INSERT INTO `sys_user_opt` VALUES (1655948739346464, '360fa6cd-ef92-4630-9843-35372f8de87a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:18:11');
INSERT INTO `sys_user_opt` VALUES (1655948739346496, '6df52bfd-e8b0-4971-9892-ca03630d640d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 10:18:11');
INSERT INTO `sys_user_opt` VALUES (1655948795969952, 'e59a10db-f48f-4d33-990c-540d3fa5db03', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1648724665172000,\"roleName\":\"系统管理人员\",\"roleCode\":\"sys\",\"authPermissionIdList\":[7,123,124,125,126,127,128,129,1025,1026,1027,1000]}', 'yes', '2025-01-08 10:18:39');
INSERT INTO `sys_user_opt` VALUES (1655948798066720, '338cad68-d866-4a79-aed4-7ffd5134cdf7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:18:39');
INSERT INTO `sys_user_opt` VALUES (1655948814843936, '28bb5ea5-26ab-4323-a4dc-e6ae88cf9230', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:18:47');
INSERT INTO `sys_user_opt` VALUES (1655948814843968, '71d6eaba-9f14-46b0-861c-431194b99b61', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 10:18:47');
INSERT INTO `sys_user_opt` VALUES (1655948970033184, 'a1f62d6c-5d08-4b01-a128-45b5eee60582', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:20:01');
INSERT INTO `sys_user_opt` VALUES (1655948970033216, 'eb04bb78-0e36-4ad6-9cf0-170be9138de2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:20:01');
INSERT INTO `sys_user_opt` VALUES (1655948970033248, '77a4efbc-34a9-44b1-8195-a0a9e8c39f97', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:20:01');
INSERT INTO `sys_user_opt` VALUES (1655948970033280, 'b902eeb9-d94f-411d-81a5-5c9973ffaf53', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:20:02');
INSERT INTO `sys_user_opt` VALUES (1655948974227488, 'f189f0eb-c2bc-4533-9fde-e637cfe4e091', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 10:20:04');
INSERT INTO `sys_user_opt` VALUES (1655948974227520, 'b5d34792-05c2-4bc9-8e58-99d3fcdd394f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:20:04');
INSERT INTO `sys_user_opt` VALUES (1655949056017568, 'dca87d60-91f7-4dfb-9c58-fff336a9239c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1648724665172000,\"roleName\":\"系统管理人员\",\"roleCode\":\"sys\",\"authPermissionIdList\":[7,123,124,125,126,127,128,129,1000,1025,1026,1027,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,200,1021,1022,201,1023,1024]}', 'yes', '2025-01-08 10:20:43');
INSERT INTO `sys_user_opt` VALUES (1655949058113568, 'd469d2d6-a939-4a7b-9568-48d530287fce', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:20:43');
INSERT INTO `sys_user_opt` VALUES (1655949066502176, '44ed5dac-b830-48b8-a3d0-4b9e6dece841', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:20:48');
INSERT INTO `sys_user_opt` VALUES (1655949068599328, '15a93a03-11ef-457f-b7b3-18408ee55754', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 10:20:48');
INSERT INTO `sys_user_opt` VALUES (1655949085376544, '23da8574-44fe-4f07-86ed-2a2dbd6ded9b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648726439362592', '{roleId=1648726439362592}', 'yes', '2025-01-08 10:20:57');
INSERT INTO `sys_user_opt` VALUES (1655949085376576, '2b831d5f-849b-4d2c-b5c7-4827bbbd4357', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:20:57');
INSERT INTO `sys_user_opt` VALUES (1655949125222432, 'c922ece0-e5a7-47d1-afd2-aeb078335188', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1648726439362592,\"roleName\":\"系统管理人员2\",\"roleCode\":\"sys2\",\"authPermissionIdList\":[1,2,3,111,112,113,105,106,107,109,108,110,100,101,102,103,104]}', 'yes', '2025-01-08 10:21:15');
INSERT INTO `sys_user_opt` VALUES (1655949125222464, '016eeef9-4926-44ef-9e16-01442ff61623', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:21:15');
INSERT INTO `sys_user_opt` VALUES (1655949127319584, 'd4621aa0-9461-41e8-8837-660647ff7ae8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:21:17');
INSERT INTO `sys_user_opt` VALUES (1655949127319616, '795d9d47-330a-4869-8620-d2c8ceb61ceb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648726439362592', '{roleId=1648726439362592}', 'yes', '2025-01-08 10:21:17');
INSERT INTO `sys_user_opt` VALUES (1655949139902496, 'f346ce80-2eb2-4ba7-a954-b90e5b55a8fe', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:21:23');
INSERT INTO `sys_user_opt` VALUES (1655949139902528, '29794418-6eac-4102-b41b-3ff7474177cd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648728391811104', '{roleId=1648728391811104}', 'yes', '2025-01-08 10:21:23');
INSERT INTO `sys_user_opt` VALUES (1655949156680864, 'a5938d5b-2ddb-4aa3-9b12-bbea493d3683', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1648728391811104,\"roleName\":\"系统管理人员3\",\"roleCode\":\"sys4\",\"authPermissionIdList\":[123,124,125,126,127,128,129,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,200,201,1021,1022,1023,1024,1025,1026,1027,7]}', 'yes', '2025-01-08 10:21:30');
INSERT INTO `sys_user_opt` VALUES (1655949156680896, 'e25ae930-a7fd-4332-877b-043ba60a5c9f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:21:31');
INSERT INTO `sys_user_opt` VALUES (1655949162971168, '1dea5dcb-02a4-4c31-841f-3708a82c22ff', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:21:33');
INSERT INTO `sys_user_opt` VALUES (1655949162971200, '7922a2e9-d99b-4519-83d7-a79336b09148', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648732317679648', '{roleId=1648732317679648}', 'yes', '2025-01-08 10:21:33');
INSERT INTO `sys_user_opt` VALUES (1655949177651328, '6d434803-e2a2-49a2-ae23-3afb1d69bc06', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1648732317679648,\"roleName\":\"系统管理人员5\",\"roleCode\":\"sys5\",\"authPermissionIdList\":[1007,125,7]}', 'yes', '2025-01-08 10:21:40');
INSERT INTO `sys_user_opt` VALUES (1655949177651360, '49f11f83-0fc4-441a-9644-da22920dc079', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:21:41');
INSERT INTO `sys_user_opt` VALUES (1655949183942688, '34c8d1ef-e59e-4dc1-973a-ec5726341274', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:21:43');
INSERT INTO `sys_user_opt` VALUES (1655949183942720, '1c14ad51-51f4-49f1-9dde-54d816378c04', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1654359553212448', '{roleId=1654359553212448}', 'yes', '2025-01-08 10:21:43');
INSERT INTO `sys_user_opt` VALUES (1655949213303232, '1823d5e6-6662-42b5-bc99-94a283e8b3bb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1654359553212448,\"roleName\":\"测试角色1\",\"roleCode\":\"cs01\",\"authPermissionIdList\":[123,3,4,1000,1001,1002,7,111,112,113,114,115,116]}', 'yes', '2025-01-08 10:21:58');
INSERT INTO `sys_user_opt` VALUES (1655949215399968, '238c6e36-fa93-4643-929a-b86a0bc985cb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:21:58');
INSERT INTO `sys_user_opt` VALUES (1655949219594272, '432be25c-221c-498c-abd8-9066a3e98d98', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1655804744695840', '{roleId=1655804744695840}', 'yes', '2025-01-08 10:22:01');
INSERT INTO `sys_user_opt` VALUES (1655949219594304, '35bd6f35-85a4-46a2-85c3-852faa5e648e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:22:01');
INSERT INTO `sys_user_opt` VALUES (1655949230080256, '05e50174-ba91-4cc2-ac2e-8fd2f76a8bd3', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1655804744695840,\"roleName\":\"测试02\",\"roleCode\":\"test02\",\"authPermissionIdList\":[2,105,106,107,108,109,110]}', 'yes', '2025-01-08 10:22:06');
INSERT INTO `sys_user_opt` VALUES (1655949232177184, '21260d56-6638-4908-8f2b-cbe8e5f90b3e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 10:22:06');
INSERT INTO `sys_user_opt` VALUES (1655949234274336, '7e8b1507-0939-400d-8714-b04a3cd067cb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:22:08');
INSERT INTO `sys_user_opt` VALUES (1655949234274368, '9315ca9f-b02a-44a0-be40-c8758ae09f77', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1655841279180832', '{roleId=1655841279180832}', 'yes', '2025-01-08 10:22:08');
INSERT INTO `sys_user_opt` VALUES (1655949286703136, '4d0d4a95-9555-459e-b7a8-8ddb132d4be7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:22:33');
INSERT INTO `sys_user_opt` VALUES (1655949290897440, '0d8c411a-de12-4a4c-905b-7d3e8c24d797', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:22:34');
INSERT INTO `sys_user_opt` VALUES (1655949292994592, '88a0a06f-0293-444e-b624-45ddbb117360', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:22:36');
INSERT INTO `sys_user_opt` VALUES (1655949297188896, '46ddc6bc-1cb1-40a6-93ae-aa9510194dc4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:22:37');
INSERT INTO `sys_user_opt` VALUES (1655949305577504, '16306420-4e4a-434c-80b5-565a3da04562', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:22:42');
INSERT INTO `sys_user_opt` VALUES (1655949305577536, 'b408a3f4-4c38-4708-a997-da523d9529d0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:22:42');
INSERT INTO `sys_user_opt` VALUES (1655949318160416, '9fdfe933-4cc9-47fe-8cca-bc9485a7dcb1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:22:48');
INSERT INTO `sys_user_opt` VALUES (1655949318160448, '06657b65-b81f-4f1d-a2d3-fa1119eb0b8e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:22:48');
INSERT INTO `sys_user_opt` VALUES (1655949339131936, 'bb4e5f96-4d51-463b-a329-b3e901a7f938', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:22:58');
INSERT INTO `sys_user_opt` VALUES (1655949339131968, '84ce6268-36be-49e8-82ba-fc89dd25d7bd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:22:58');
INSERT INTO `sys_user_opt` VALUES (1655949339132000, 'b2ce59e2-61d4-4d45-a665-65a156163d0a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:22:58');
INSERT INTO `sys_user_opt` VALUES (1655949343326240, '30d7a783-06a1-49c5-837e-a1da399ebd91', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:22:59');
INSERT INTO `sys_user_opt` VALUES (1655949347520544, 'af9f064a-c781-478f-99e4-3ffd7bb9ebcf', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:23:02');
INSERT INTO `sys_user_opt` VALUES (1655949347520576, 'fa53e1b0-fa75-4592-baaa-4f6754acc2e0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:23:02');
INSERT INTO `sys_user_opt` VALUES (1655949360103456, '1f2f1a2c-6329-47db-94cb-d7ab1e3504a4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":1,\"parentId\":null,\"menuName\":\"机构管理\",\"menuPath\":\"org\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":null,\"sort\":1}', 'yes', '2025-01-08 10:23:08');
INSERT INTO `sys_user_opt` VALUES (1655949362200608, 'a0e89806-cb16-494f-83c8-c21e5eba3dcd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:23:08');
INSERT INTO `sys_user_opt` VALUES (1655949362200640, '85637941-3697-4a83-9787-7fdf1c3addd1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:23:08');
INSERT INTO `sys_user_opt` VALUES (1655949362200672, '714f91de-0126-4bd3-bbc6-20a0d8d68355', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:23:08');
INSERT INTO `sys_user_opt` VALUES (1655949609664544, 'af5382eb-495c-4097-aac9-469eb4e120bd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:25:06');
INSERT INTO `sys_user_opt` VALUES (1655949609664576, '5695fc0e-0895-449f-ba0b-c9adbb84b983', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:25:06');
INSERT INTO `sys_user_opt` VALUES (1655949609664608, 'f06967ae-8526-4c7e-accd-080c4308e1ee', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:25:06');
INSERT INTO `sys_user_opt` VALUES (1655949609664640, 'fa21ebf6-f8e6-4ce7-91cd-426bd70832ca', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:25:07');
INSERT INTO `sys_user_opt` VALUES (1655949615956000, '18f989b4-741c-400a-a5b5-b8ae93b62461', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:25:10');
INSERT INTO `sys_user_opt` VALUES (1655949620150304, 'b07574de-d863-4195-b796-57195ed6956d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:25:11');
INSERT INTO `sys_user_opt` VALUES (1655949624344608, 'db9a95ad-a056-4641-8679-37d5d0509c9e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:25:13');
INSERT INTO `sys_user_opt` VALUES (1655949628538912, 'ff86f878-5f90-4205-b0d1-9533758cf6d6', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:25:16');
INSERT INTO `sys_user_opt` VALUES (1655949628538944, 'b5953ae4-ba72-4580-b0da-d47f4c20523e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:25:16');
INSERT INTO `sys_user_opt` VALUES (1655949632733216, '7d0e3673-b5a8-4c73-b4d9-27cec28b97f5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:25:17');
INSERT INTO `sys_user_opt` VALUES (1655949632733248, '3a6d9dac-f7a6-405a-be88-47b4b250281e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:25:17');
INSERT INTO `sys_user_opt` VALUES (1655949691453472, '5200ab7a-8348-4c73-b006-89fc3814f2fa', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:25:46');
INSERT INTO `sys_user_opt` VALUES (1655949695647776, '619b055e-e455-45ad-866a-e1eedc6184cb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:25:48');
INSERT INTO `sys_user_opt` VALUES (1655949697744928, '7d306b82-fa64-47b7-8eb9-4133e5987ef5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:25:48');
INSERT INTO `sys_user_opt` VALUES (1655949697744960, 'f06ff196-8db5-4598-9892-e1f45ea5afa0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:25:48');
INSERT INTO `sys_user_opt` VALUES (1655949706133536, '87bb918a-ab7d-44d2-ad75-d2db2e141177', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:25:53');
INSERT INTO `sys_user_opt` VALUES (1655949708230688, '98c985e4-2ff2-42a9-84d4-c5d475e0eaf2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:25:53');
INSERT INTO `sys_user_opt` VALUES (1655949779533856, '7efcd7e8-5f37-4c4f-a217-0854a58f7dc7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:26:28');
INSERT INTO `sys_user_opt` VALUES (1655949781631008, 'da8f0e06-8948-4710-908f-d34875fddcb1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1001', '{permissionId=1001}', 'yes', '2025-01-08 10:26:28');
INSERT INTO `sys_user_opt` VALUES (1655950670823456, '2cf52ce9-c600-4e1f-a095-66e7631f5bcb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:33:32');
INSERT INTO `sys_user_opt` VALUES (1655950670823488, '43ad014d-17dc-451e-9455-0948f573e0ec', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:33:32');
INSERT INTO `sys_user_opt` VALUES (1655950670823520, 'e289d454-168b-40a0-9153-26a4ab1bd474', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:33:32');
INSERT INTO `sys_user_opt` VALUES (1655950672920608, '1df27165-3165-4596-8ba0-1085f3300cf2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:33:33');
INSERT INTO `sys_user_opt` VALUES (1655950675017760, '9b31d4af-126d-457a-bba6-89f0834f0fc0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:33:34');
INSERT INTO `sys_user_opt` VALUES (1655950763098144, 'ad8225c4-d2a4-404d-8858-a468cf90f0d7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:34:17');
INSERT INTO `sys_user_opt` VALUES (1655950773583904, 'e0eb966a-b96d-4f77-b468-de4ec157484a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:34:21');
INSERT INTO `sys_user_opt` VALUES (1655950773583936, 'dabdb0ea-ad79-4fd0-a0ad-e357af1c9eac', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:34:21');
INSERT INTO `sys_user_opt` VALUES (1655950773583968, '71cc17d1-fe81-4354-b88c-2a522a131f96', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:34:21');
INSERT INTO `sys_user_opt` VALUES (1655950775681056, 'e1c78944-abca-475a-a065-cd5c482c0834', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:34:22');
INSERT INTO `sys_user_opt` VALUES (1655950800846880, 'a5e43165-96e5-483c-b38b-6c1ae3f5d91f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:34:35');
INSERT INTO `sys_user_opt` VALUES (1655951230763040, '3d03c9ca-bf8d-4401-beba-e0f643df4a82', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:38:00');
INSERT INTO `sys_user_opt` VALUES (1655951232860192, '0d94dcdc-4f2c-410e-a4dd-a725e581f6e2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:38:00');
INSERT INTO `sys_user_opt` VALUES (1655951232860224, '2f84c23c-a667-4b61-91a5-a9f89a7cbc30', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:38:00');
INSERT INTO `sys_user_opt` VALUES (1655951234957344, 'd74dafd0-0dfc-4915-a442-3a53171df03d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:38:02');
INSERT INTO `sys_user_opt` VALUES (1655951253831712, '1771a9cb-82de-4d64-b1a8-a9a8d1e23c94', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:38:10');
INSERT INTO `sys_user_opt` VALUES (1655951253831744, '1570bd17-4673-428a-b140-d687cbb76f37', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:38:10');
INSERT INTO `sys_user_opt` VALUES (1655951413215264, 'a8f260ca-ebd5-454b-8626-6d154ca61316', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":1,\"parentId\":null,\"menuName\":\"机构管理\",\"menuPath\":\"org\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"system\",\"sort\":1}', 'yes', '2025-01-08 10:39:27');
INSERT INTO `sys_user_opt` VALUES (1655951413215296, '8fecc364-ba8b-474c-8fc5-a29e9e61b405', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:39:27');
INSERT INTO `sys_user_opt` VALUES (1655951413215328, '06826cff-b0dc-4e64-b380-a1f39a3393d1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:39:27');
INSERT INTO `sys_user_opt` VALUES (1655951415312416, 'd6ce0e90-cd30-41bd-abae-0e42cce3126a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:39:27');
INSERT INTO `sys_user_opt` VALUES (1655951444672544, '025b5eb5-8f56-4bd2-b6ca-6c99d3efd671', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:39:42');
INSERT INTO `sys_user_opt` VALUES (1655951444672576, '2cb686c0-537b-4726-a885-f063a6e0cb3a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:39:42');
INSERT INTO `sys_user_opt` VALUES (1655951463546912, '90f6dca7-ead5-4bd2-80d2-bf259a0fe588', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":1,\"parentId\":null,\"menuName\":\"机构管理\",\"menuPath\":\"org\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"build\",\"sort\":1}', 'yes', '2025-01-08 10:39:50');
INSERT INTO `sys_user_opt` VALUES (1655951463546944, '65fb69f3-29e8-4ae9-9d7d-abcb1de801d5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:39:51');
INSERT INTO `sys_user_opt` VALUES (1655951463546976, '47b663ab-be02-4682-acdc-8e159fb992fc', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 10:39:51');
INSERT INTO `sys_user_opt` VALUES (1655951463547008, 'aaa4a15f-bb3a-4bda-9f4b-e8a24a04b5c5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:39:51');
INSERT INTO `sys_user_opt` VALUES (1655951469838368, '7df96098-fcad-45d9-a69f-b06ffd137f59', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:39:54');
INSERT INTO `sys_user_opt` VALUES (1655951469838400, '9894c505-f12e-4838-a54d-898795a4c91c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/7', '{permissionId=7}', 'yes', '2025-01-08 10:39:54');
INSERT INTO `sys_user_opt` VALUES (1655951549530144, '31bec3f9-cb1c-418b-84c9-dbae8554d6e5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":7,\"parentId\":null,\"menuName\":\"系统管理\",\"menuPath\":\"system\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"system\",\"sort\":7}', 'yes', '2025-01-08 10:40:32');
INSERT INTO `sys_user_opt` VALUES (1655951551627296, '527a0aad-ab82-49af-ae60-8aa42747d082', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:40:32');
INSERT INTO `sys_user_opt` VALUES (1655951551627328, '34bc9500-347c-4765-977f-aed5a30f599d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/7', '{permissionId=7}', 'yes', '2025-01-08 10:40:32');
INSERT INTO `sys_user_opt` VALUES (1655951551627360, '8c7c0fb7-13d7-46ee-b5cd-9258c93ccda3', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:40:32');
INSERT INTO `sys_user_opt` VALUES (1655951574695968, 'c13778f2-3703-4fc6-b2f0-130085a9bf76', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:40:43');
INSERT INTO `sys_user_opt` VALUES (1655951633416224, '4e2c6228-4186-4ef8-91cf-5c83a09bec6c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:41:12');
INSERT INTO `sys_user_opt` VALUES (1655951645999136, '44d79f29-3dad-4469-a43c-12bfeda3c0f8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:41:18');
INSERT INTO `sys_user_opt` VALUES (1655951645999168, 'd1325d0c-0b53-49d9-ad8a-dc709596e9bb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:41:18');
INSERT INTO `sys_user_opt` VALUES (1655951645999200, '094afabe-1a5f-4b1c-93a3-260a7a688d43', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:41:18');
INSERT INTO `sys_user_opt` VALUES (1655951648096288, '905edead-d215-4fda-a33e-08743cfbc7ea', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:41:18');
INSERT INTO `sys_user_opt` VALUES (1655951826354208, '736a11e3-b990-4703-8e55-f0f3e143e47f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:42:44');
INSERT INTO `sys_user_opt` VALUES (1655951933308960, '5354abb7-cd2f-41a5-9a6f-97204a05845b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:43:35');
INSERT INTO `sys_user_opt` VALUES (1655951935406112, 'c3474a42-ed63-4044-a8f9-808ea9d887fa', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:43:35');
INSERT INTO `sys_user_opt` VALUES (1655951935406144, 'ca672103-88fa-41ce-a278-7d3813daa3bb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:43:35');
INSERT INTO `sys_user_opt` VALUES (1655951937503264, '47a88d1f-39c5-4a03-a8ec-8ee4365f1290', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:43:36');
INSERT INTO `sys_user_opt` VALUES (1655952413556768, '588ab70b-3bec-43f5-94ba-358c29c0ab3b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:47:24');
INSERT INTO `sys_user_opt` VALUES (1655952700866592, '2c0858a3-1b9d-483d-8ce8-c69327e79fd8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:49:40');
INSERT INTO `sys_user_opt` VALUES (1655952700866624, 'f063a835-187f-4e4d-accf-a4fe00532940', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:49:40');
INSERT INTO `sys_user_opt` VALUES (1655952700866656, '67baea84-7b38-4ab6-9bfb-2b492e859cf1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:49:40');
INSERT INTO `sys_user_opt` VALUES (1655952702963744, '3556fe85-1b16-4684-8032-7507535c6bf3', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:49:42');
INSERT INTO `sys_user_opt` VALUES (1655953046896672, '1cbe146d-c918-4ceb-8e99-2ec18079a670', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:52:26');
INSERT INTO `sys_user_opt` VALUES (1655953046896704, '5e38c423-577f-49b6-ad47-bd1a7fb8056d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/128', '{permissionId=128}', 'yes', '2025-01-08 10:52:26');
INSERT INTO `sys_user_opt` VALUES (1655953057382432, 'ee9bff5b-7c59-4b99-b926-30891d1eb4fc', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 10:52:31');
INSERT INTO `sys_user_opt` VALUES (1655953057382464, 'afc477da-b060-482d-a03f-a178ec778e66', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/128', '{permissionId=128}', 'yes', '2025-01-08 10:52:31');
INSERT INTO `sys_user_opt` VALUES (1655953288069152, '4e3b7fe0-18c7-4168-a764-8ed7bd0f969d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:54:21');
INSERT INTO `sys_user_opt` VALUES (1655953290166304, 'efe226a9-5f12-40f3-b9a2-a726c84ac700', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:54:21');
INSERT INTO `sys_user_opt` VALUES (1655953290166336, '842cca6a-ae06-4c3c-9213-1f2b9c630719', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:54:21');
INSERT INTO `sys_user_opt` VALUES (1655953292263456, '51725c43-b3c2-4b86-bd4d-bd6e93b4f7cf', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:54:23');
INSERT INTO `sys_user_opt` VALUES (1655953451647008, '593a3a73-be80-4fe6-a969-1acc61a1ceac', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:55:39');
INSERT INTO `sys_user_opt` VALUES (1655953451647040, 'a0737a31-bda1-481c-a571-1bc6c7d58b18', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:55:39');
INSERT INTO `sys_user_opt` VALUES (1655953451647072, 'f543b67f-8831-4134-9639-4bf3a3ecb1f9', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:55:39');
INSERT INTO `sys_user_opt` VALUES (1655953453744160, 'fe61dd46-c165-4c0f-a3f3-2a502138f267', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:55:40');
INSERT INTO `sys_user_opt` VALUES (1655953795579936, 'a7b84a70-f1b3-4c33-8912-c8acef24a938', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:58:22');
INSERT INTO `sys_user_opt` VALUES (1655953795579968, '4a3d7141-b1e1-4d70-84fa-517bb4d1d328', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:58:22');
INSERT INTO `sys_user_opt` VALUES (1655953795580000, '4d1e93a2-a1c8-4217-b619-e77e23213985', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:58:22');
INSERT INTO `sys_user_opt` VALUES (1655953797677088, '722e32bf-e0e9-4998-b2fc-40290e12ac28', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:58:23');
INSERT INTO `sys_user_opt` VALUES (1655953952866336, '31b5aa69-1a7b-4817-b5ae-39b8cf1d377e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 10:59:37');
INSERT INTO `sys_user_opt` VALUES (1655953952866368, 'b52494b1-4ccd-4fbc-b70b-1d92bd30cb12', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:59:37');
INSERT INTO `sys_user_opt` VALUES (1655953952866400, 'b405f425-574f-453b-becf-1d281fb17341', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 10:59:37');
INSERT INTO `sys_user_opt` VALUES (1655953954963488, '1345ce80-6ae0-4f6d-957c-d351676fe574', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 10:59:38');
INSERT INTO `sys_user_opt` VALUES (1655954347130912, '56b66959-ec00-4b13-8abc-cbf4d3ad3dd4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-08 11:02:45');
INSERT INTO `sys_user_opt` VALUES (1655954349228064, 'd8c421b8-e679-472c-af65-fc1fc6fac865', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 11:02:47');
INSERT INTO `sys_user_opt` VALUES (1655954506514464, 'dfc85c4c-4071-43aa-9788-25f2228296dc', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-08 11:04:02');
INSERT INTO `sys_user_opt` VALUES (1655954510708768, 'd7cf1809-e5da-42e2-b7ca-339bd347f494', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 11:04:04');
INSERT INTO `sys_user_opt` VALUES (1655955116785696, 'e3741799-be65-4509-b096-5aed6ede5216', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:08:53');
INSERT INTO `sys_user_opt` VALUES (1655955118882848, 'd1b41996-e63c-4a52-b133-114bb91f9827', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:08:53');
INSERT INTO `sys_user_opt` VALUES (1655955118882880, 'dbb46cd8-9a77-402b-ab7d-63e725f79154', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:08:53');
INSERT INTO `sys_user_opt` VALUES (1655955118882912, 'bac09361-c53f-4125-934e-fa93c39f3530', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 11:08:54');
INSERT INTO `sys_user_opt` VALUES (1655955737542688, '584aa142-5d89-4cd0-88c9-f9ff038562a2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:13:49');
INSERT INTO `sys_user_opt` VALUES (1655955737542720, 'c8817058-882e-4402-b28b-736d6afd761c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:13:49');
INSERT INTO `sys_user_opt` VALUES (1655955737542752, 'baf013ae-b846-4196-8e42-8127d853adf7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:13:49');
INSERT INTO `sys_user_opt` VALUES (1655955739639840, '13b4fe8f-4848-4bd0-80e1-a2bf1ed3e319', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 11:13:50');
INSERT INTO `sys_user_opt` VALUES (1655955844497440, '8f73fb5a-038c-4527-a18e-6dc233e03308', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:14:39');
INSERT INTO `sys_user_opt` VALUES (1655955844497472, '04b047b2-b153-4dfe-8ca2-d246fc2dfd50', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:14:40');
INSERT INTO `sys_user_opt` VALUES (1655955844497504, 'd9b6ce7d-180a-4d50-a8fd-c30df9e31464', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:14:40');
INSERT INTO `sys_user_opt` VALUES (1655955846594592, 'a1270e1b-c7ae-4202-a0bb-beb59b7906f2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 11:14:40');
INSERT INTO `sys_user_opt` VALUES (1655956802895904, 'eda3bdea-8955-4421-9e38-fca4ba0d46a0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:22:16');
INSERT INTO `sys_user_opt` VALUES (1655956802895936, '1c355bd5-e36a-4e9d-8230-48a7ee86be41', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:22:16');
INSERT INTO `sys_user_opt` VALUES (1655956802895968, 'ac30ee13-5c17-492f-9b16-6c709bb7650e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:22:16');
INSERT INTO `sys_user_opt` VALUES (1655956804993056, 'a5a49c2d-cfc9-4db0-9027-f3da5a307bd3', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 11:22:18');
INSERT INTO `sys_user_opt` VALUES (1655956888879136, '405095a2-9fab-4c4c-a536-c45ea958a7c1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:22:57');
INSERT INTO `sys_user_opt` VALUES (1655956888879168, '03b93b21-306a-471c-825e-64cbf85d636c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:22:58');
INSERT INTO `sys_user_opt` VALUES (1655956888879200, '34f8e647-f17f-493c-a513-847ffc174fff', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:22:58');
INSERT INTO `sys_user_opt` VALUES (1655956890976288, '6637e360-ec43-4f21-af40-c55130e804e5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 11:22:58');
INSERT INTO `sys_user_opt` VALUES (1655957232812064, '8bad9687-4015-45c5-94e5-26e08d4a67ff', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:25:41');
INSERT INTO `sys_user_opt` VALUES (1655957237006368, '868467f9-2569-492d-8c15-da60176f297e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:25:43');
INSERT INTO `sys_user_opt` VALUES (1655957237006400, 'd155af6d-a80b-4e1b-a42b-8a339b8591d7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:25:43');
INSERT INTO `sys_user_opt` VALUES (1655957237006432, '0f56c5ed-1b71-4fa8-af45-59c582d1c665', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:25:43');
INSERT INTO `sys_user_opt` VALUES (1655957237006464, '56ce37cb-6d4e-4267-97af-ae27573a2f0d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:25:44');
INSERT INTO `sys_user_opt` VALUES (1655957360738336, '606bcbc4-6d1e-4cd0-bbbd-a9ead7bd59f1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:26:42');
INSERT INTO `sys_user_opt` VALUES (1655957360738368, '41cc0232-3d2f-4f6a-9103-e65400a24cd0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:26:42');
INSERT INTO `sys_user_opt` VALUES (1655957360738400, 'eaf8c4c1-fa4b-4c86-b3db-3702a41a3652', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:26:42');
INSERT INTO `sys_user_opt` VALUES (1655957362835488, '6cc5a23d-ccae-4ad8-9d4c-c192b226d9d0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:26:44');
INSERT INTO `sys_user_opt` VALUES (1655957367029792, 'b6eba2da-4391-4c92-9b79-145b25addf33', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:26:46');
INSERT INTO `sys_user_opt` VALUES (1655957411069984, '03c656b6-0ccd-4f6f-aa0c-846a4d4158d0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:27:06');
INSERT INTO `sys_user_opt` VALUES (1655957411070016, '7287a11b-8cb3-43d4-b521-447ddd6ad186', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:27:07');
INSERT INTO `sys_user_opt` VALUES (1655957411070048, 'a873ed79-e21e-4186-af06-735407883fea', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:27:07');
INSERT INTO `sys_user_opt` VALUES (1655957413167136, 'c4568c97-2337-44a8-b5c0-82027b9abdda', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:27:07');
INSERT INTO `sys_user_opt` VALUES (1655957417361440, '8ed2c6e7-43ac-4614-899e-1e87d74023c4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:27:09');
INSERT INTO `sys_user_opt` VALUES (1655957417361472, '535f4495-34f0-4b1e-bb27-7d3bed0b3a4c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:27:09');
INSERT INTO `sys_user_opt` VALUES (1655957417361504, 'e69f92c9-82c4-4974-95ae-c906faef4466', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:27:09');
INSERT INTO `sys_user_opt` VALUES (1655957417361536, '1e46e1af-7c16-479b-aff5-699fbdcaed19', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:27:10');
INSERT INTO `sys_user_opt` VALUES (1655957574647840, 'f9a6e086-f643-4a35-b5d1-2a48dbb7c522', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:28:24');
INSERT INTO `sys_user_opt` VALUES (1655957574647872, '4206e2de-da26-431a-bbaf-641f185d1adb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:28:24');
INSERT INTO `sys_user_opt` VALUES (1655957574647904, '8a41a063-675a-4de9-966d-6109b2cf15b6', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:28:24');
INSERT INTO `sys_user_opt` VALUES (1655957576744992, 'faaf307b-75cb-4129-ab91-0fd46fd566ef', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:28:26');
INSERT INTO `sys_user_opt` VALUES (1655957593522208, '4520185e-433e-41fd-800a-f9c36c778a52', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:28:34');
INSERT INTO `sys_user_opt` VALUES (1655957593522240, 'bd43136f-e45e-413a-9def-3f7a8e0c6d25', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:28:34');
INSERT INTO `sys_user_opt` VALUES (1655957595619360, 'bdc969fe-5196-4e7b-96c8-5e8310a85616', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:28:34');
INSERT INTO `sys_user_opt` VALUES (1655957595619392, '7abfee60-59b8-452c-afa5-efb33dfa781f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:28:35');
INSERT INTO `sys_user_opt` VALUES (1655957807431712, '50184d9c-0b8e-44ec-bf3e-cf14e2a4828b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:30:16');
INSERT INTO `sys_user_opt` VALUES (1655957836791840, 'daec2139-59e8-4024-8c13-4a2a2938297b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:30:30');
INSERT INTO `sys_user_opt` VALUES (1655957964718112, '4ff11ce7-1da7-4009-8533-85ae5f49c557', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:31:31');
INSERT INTO `sys_user_opt` VALUES (1655957964718144, '5d9a29b5-fbcf-432c-a013-8442e91351bd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:31:31');
INSERT INTO `sys_user_opt` VALUES (1655957966815264, '2927bca9-bb96-43eb-9b3e-d60f86dfc3e3', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:31:31');
INSERT INTO `sys_user_opt` VALUES (1655957966815296, '34959141-2b3b-4707-9612-f6a6f8eaff29', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:31:32');
INSERT INTO `sys_user_opt` VALUES (1655957975203872, 'e0de92bb-4ef6-4391-b362-82fb388d1bcf', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 11:31:36');
INSERT INTO `sys_user_opt` VALUES (1655957979398176, '9fd4b819-4d57-485e-b86d-576d1c53c6da', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:31:37');
INSERT INTO `sys_user_opt` VALUES (1655958017146912, '4cd28540-d674-4c8a-aa65-c0cf59a69849', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:31:56');
INSERT INTO `sys_user_opt` VALUES (1655958017146944, '6a756fd8-3765-4a87-8d75-06185aca44a2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:31:56');
INSERT INTO `sys_user_opt` VALUES (1655958017146976, '372e45fe-1b65-4586-98b8-969ff6bd4e7d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:31:56');
INSERT INTO `sys_user_opt` VALUES (1655958019244064, '4b98a14f-6649-46d4-8569-47e52458de73', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:31:57');
INSERT INTO `sys_user_opt` VALUES (1655958027632672, '8519c282-249c-492e-b275-1fefa573474d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:32:00');
INSERT INTO `sys_user_opt` VALUES (1655958027632704, 'df63d814-8596-47ad-902e-03e11a7b8bc9', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:32:00');
INSERT INTO `sys_user_opt` VALUES (1655958027632736, '82c7701d-6959-4f94-9597-ad6d83353492', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:32:00');
INSERT INTO `sys_user_opt` VALUES (1655958029729824, '2351a186-3277-41b9-ad57-b54d996758f5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:32:01');
INSERT INTO `sys_user_opt` VALUES (1655958061187104, 'd0992463-c84a-4b9a-9eec-7e8028a389f7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:32:17');
INSERT INTO `sys_user_opt` VALUES (1655958061187136, '660a4ffc-5cd6-4685-8d98-a8fc3681ac5d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:32:17');
INSERT INTO `sys_user_opt` VALUES (1655958061187168, '928311a7-c777-49cf-90e7-bde9fbe08806', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:32:17');
INSERT INTO `sys_user_opt` VALUES (1655958063284256, '3eec3063-0072-4a65-9914-d6f2dfcb1900', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:32:18');
INSERT INTO `sys_user_opt` VALUES (1655958159753248, '0fc63ffc-5a4d-4509-bd0c-1b9ae31732ea', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:33:03');
INSERT INTO `sys_user_opt` VALUES (1655958159753280, 'eee6cd7a-793f-4c4f-8ce5-06d89ff6e0a5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:33:03');
INSERT INTO `sys_user_opt` VALUES (1655958159753312, '5dc24a3a-cbbb-4a42-89bf-bb5a61780be3', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:33:04');
INSERT INTO `sys_user_opt` VALUES (1655958161850400, '35316b9a-1578-4706-9585-931ee560397a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:33:05');
INSERT INTO `sys_user_opt` VALUES (1655958174433312, 'f265c2d0-97d5-4037-a036-0986f70c7fee', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:33:10');
INSERT INTO `sys_user_opt` VALUES (1655958174433344, '5e10a107-b85b-481a-a556-82c9b2706668', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:33:11');
INSERT INTO `sys_user_opt` VALUES (1655958174433376, 'a2af3236-2efe-4e59-ac8f-d03a5690378b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:33:11');
INSERT INTO `sys_user_opt` VALUES (1655958176530464, '7f52aa5a-79e2-438d-817e-64628ec6c6ea', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:33:12');
INSERT INTO `sys_user_opt` VALUES (1655958182821920, '184edc79-a7de-486a-84c3-b0798c498b53', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:33:14');
INSERT INTO `sys_user_opt` VALUES (1655958182821952, '874c262c-807f-4a01-bd2b-c30dac139eb8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:33:14');
INSERT INTO `sys_user_opt` VALUES (1655958182821984, '4ad2f585-2b3f-4258-a799-36feb43a8202', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:33:14');
INSERT INTO `sys_user_opt` VALUES (1655958184919072, 'd4ad4cbc-23fb-4a4b-8cad-e46b4db86238', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:33:16');
INSERT INTO `sys_user_opt` VALUES (1655958317039648, '1b1817d2-11dd-415a-87ef-97dfbd3ff4df', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:34:18');
INSERT INTO `sys_user_opt` VALUES (1655958317039680, '2ec59d7c-cceb-402b-83b5-70b94e1a239b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:34:19');
INSERT INTO `sys_user_opt` VALUES (1655958317039712, 'a8cd8dbc-ea4e-44a5-bb4f-6117db7d9685', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:34:19');
INSERT INTO `sys_user_opt` VALUES (1655958319136800, 'ee1a44f8-3514-4e4b-aa73-84a147f90f13', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:34:20');
INSERT INTO `sys_user_opt` VALUES (1655958849716256, '72f1825d-5462-4957-8e55-520426696e0a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:38:33');
INSERT INTO `sys_user_opt` VALUES (1655958849716288, '72f0420b-58a4-4f04-b781-1b57ed779364', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:38:33');
INSERT INTO `sys_user_opt` VALUES (1655958851813408, 'c33a8bf6-0ba7-47bb-83d8-7af10193c9bd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:38:33');
INSERT INTO `sys_user_opt` VALUES (1655958853910560, '76eb1cdc-4513-4dbc-a9eb-f865641c9b5c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:38:34');
INSERT INTO `sys_user_opt` VALUES (1655958858104864, '8ae88bb7-d090-47b7-9944-f2061f3321b4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:38:37');
INSERT INTO `sys_user_opt` VALUES (1655958860202016, 'b54fc0b8-f28a-44ab-8e60-a50aa4253166', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:38:37');
INSERT INTO `sys_user_opt` VALUES (1655958860202048, '47e931d6-64b9-4920-a2e4-6abd05fe436f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:38:37');
INSERT INTO `sys_user_opt` VALUES (1655958860202080, '0b40cfa8-ce88-4bc3-9f8a-33ec045d3e5c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:38:38');
INSERT INTO `sys_user_opt` VALUES (1655958874882080, '6d06ba23-2ae7-4778-807c-2be77c7f1f89', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:38:45');
INSERT INTO `sys_user_opt` VALUES (1655958874882112, 'e7868ebb-ed45-40a7-868b-0fb9a528b244', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:38:45');
INSERT INTO `sys_user_opt` VALUES (1655958874882144, 'f274f363-a767-4a3f-8ca5-47e9ed30ef16', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:38:45');
INSERT INTO `sys_user_opt` VALUES (1655958876979232, 'b7eeb55b-4322-40ae-976f-3b360b87d539', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:38:46');
INSERT INTO `sys_user_opt` VALUES (1655959017488416, '0bfce5c8-0241-405b-8aa7-c02364747acb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:39:53');
INSERT INTO `sys_user_opt` VALUES (1655959017488448, 'b3638315-da47-42c9-88f6-7dc182c984d2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:39:53');
INSERT INTO `sys_user_opt` VALUES (1655959017488480, '217912a2-524d-4ac1-b21e-9aff2c3c21f1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:39:53');
INSERT INTO `sys_user_opt` VALUES (1655959019585568, 'a8218e60-2eb2-4662-b3eb-5e8fb1c0a8d8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:39:54');
INSERT INTO `sys_user_opt` VALUES (1655959046848544, 'd40f759b-6b7d-4de7-b9bc-80d51bb14a0a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:40:07');
INSERT INTO `sys_user_opt` VALUES (1655959046848576, 'ae39de50-e0be-40a6-aa6f-1474bf136234', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:40:07');
INSERT INTO `sys_user_opt` VALUES (1655959046848608, 'e871c257-4ec5-4d4c-9f27-dabd6f918232', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:40:07');
INSERT INTO `sys_user_opt` VALUES (1655959051042848, '71ad89a5-d082-468c-a01a-735517e0111a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:40:09');
INSERT INTO `sys_user_opt` VALUES (1655959172677664, 'c345bf11-1be8-475a-a6d7-e4a57dea8a57', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:41:07');
INSERT INTO `sys_user_opt` VALUES (1655959172677696, 'aa6122ea-35af-4511-b9a9-9240a536adde', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:41:07');
INSERT INTO `sys_user_opt` VALUES (1655959172677728, '1d782923-4d47-435d-8060-e66e5eeef14d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:41:07');
INSERT INTO `sys_user_opt` VALUES (1655959174774816, 'a6a50bde-8b46-42d6-a5e5-38a9fc5ff29b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:41:08');
INSERT INTO `sys_user_opt` VALUES (1655959325769760, 'ba230654-1b41-4d4d-a17b-a8d0d8c5d88a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:42:20');
INSERT INTO `sys_user_opt` VALUES (1655959325769792, '4816d270-f7cd-48a2-b408-997912f2e302', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:42:20');
INSERT INTO `sys_user_opt` VALUES (1655959327866912, 'fa8b3a56-a5b6-4628-9805-f01efba47414', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:42:20');
INSERT INTO `sys_user_opt` VALUES (1655959327866944, 'b3045f5f-5460-462d-8212-33736ce9e7c6', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:42:21');
INSERT INTO `sys_user_opt` VALUES (1655959386587200, 'c8961cb2-9953-4d84-9882-e33a0c5bed6d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:42:49');
INSERT INTO `sys_user_opt` VALUES (1655959386587232, '59e1a2d5-96f9-40e8-9743-6c39d3ce4145', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:42:49');
INSERT INTO `sys_user_opt` VALUES (1655959388684320, '0a63022d-395b-4265-8e55-94b2687626f4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:42:49');
INSERT INTO `sys_user_opt` VALUES (1655959562747936, '63c30b2a-8f8e-4de0-af87-2e9f0dd43e74', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:44:13');
INSERT INTO `sys_user_opt` VALUES (1655959562747968, '51003c5a-7492-4ccd-a986-e40f066a195e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:44:13');
INSERT INTO `sys_user_opt` VALUES (1655959562748000, '61f8d05e-0ba3-4530-9307-b9d94ff56c8d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:44:13');
INSERT INTO `sys_user_opt` VALUES (1655959573233696, '0a81eee9-7c2b-4cab-af5c-8520a1e70878', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:44:18');
INSERT INTO `sys_user_opt` VALUES (1655959573233728, 'f63f9f42-7645-4e75-b71c-b2fad5c6d175', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:44:18');
INSERT INTO `sys_user_opt` VALUES (1655959573233760, '095b30f8-8c3c-456e-afe4-964edadb3daf', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:44:18');
INSERT INTO `sys_user_opt` VALUES (1655959598399520, 'e38a6501-c314-4ae6-b414-89cc845db138', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:44:29');
INSERT INTO `sys_user_opt` VALUES (1655959598399552, '91808f05-ddea-4a41-acec-9556543dff6d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:44:29');
INSERT INTO `sys_user_opt` VALUES (1655959598399584, '54500a2e-375d-46b8-9e28-a9fedaa5a295', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:44:29');
INSERT INTO `sys_user_opt` VALUES (1655959623565344, 'cf51702e-c78b-4d06-bd33-212210131c65', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:44:42');
INSERT INTO `sys_user_opt` VALUES (1655959623565376, '1ca91e39-aea8-4200-9e12-ee33f54b7c25', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:44:42');
INSERT INTO `sys_user_opt` VALUES (1655959623565408, '47aa9446-7523-4cf8-a8ae-63b954bb0acf', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:44:42');
INSERT INTO `sys_user_opt` VALUES (1655959709548576, '05c9b076-38ec-402d-991b-dab0fc69b81e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:45:22');
INSERT INTO `sys_user_opt` VALUES (1655959709548608, 'cb433a0c-081e-4d1e-a0b1-83614ed536f7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:45:22');
INSERT INTO `sys_user_opt` VALUES (1655959709548640, '1af37548-0ef6-4f57-92ea-a312a72b9aff', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:45:22');
INSERT INTO `sys_user_opt` VALUES (1655959820697632, '875c5a67-5f99-45d1-a7c4-462f2f1f6eab', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:46:16');
INSERT INTO `sys_user_opt` VALUES (1655959820697664, 'bf3bf10c-d9d0-4e05-81f0-e51e492ec3db', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:46:16');
INSERT INTO `sys_user_opt` VALUES (1655959820697696, '771dea50-b5f3-480b-87f2-388f2cc691db', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:46:16');
INSERT INTO `sys_user_opt` VALUES (1655959887806496, '3678618e-b9be-4ef1-824f-88e0bfea4d66', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:46:47');
INSERT INTO `sys_user_opt` VALUES (1655959887806528, '0fe630cb-553a-4892-a7d8-424c50492e80', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:46:47');
INSERT INTO `sys_user_opt` VALUES (1655959887806560, '398d9bbb-372e-4add-b6a1-dc99214eb14b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:46:47');
INSERT INTO `sys_user_opt` VALUES (1655959896195104, '00193166-0453-4c69-83dc-766ecddca6e7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:46:52');
INSERT INTO `sys_user_opt` VALUES (1655959896195136, '9c738760-a20e-4976-8a76-bcebc0c0fe35', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:46:52');
INSERT INTO `sys_user_opt` VALUES (1655959896195168, '6ea5bef4-4e85-4b0f-8c72-984a793f0b00', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:46:52');
INSERT INTO `sys_user_opt` VALUES (1655959936040992, '13f22f1a-d912-468b-bdb5-33a3283549e0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 11:47:10');
INSERT INTO `sys_user_opt` VALUES (1655960189796384, 'e7406fd7-9cc2-45b8-acaf-63e732ee73d0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:49:11');
INSERT INTO `sys_user_opt` VALUES (1655960189796416, 'c898b03e-b628-4b8c-8e29-8a2d084dd885', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:49:11');
INSERT INTO `sys_user_opt` VALUES (1655960189796448, '6a99ca57-83a5-4a78-b084-5459d40cfcb0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:49:11');
INSERT INTO `sys_user_opt` VALUES (1655960191893536, 'df037f04-a894-4c89-8294-d5e1997a1147', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 11:49:13');
INSERT INTO `sys_user_opt` VALUES (1655960456134688, 'a9e7eb6a-1f0f-4abf-a068-d02fd26c0979', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:51:19');
INSERT INTO `sys_user_opt` VALUES (1655960456134720, 'd6463f01-db64-44bb-9d1f-4e32e7fd0c3c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:51:19');
INSERT INTO `sys_user_opt` VALUES (1655960456134752, 'ac4bff9a-a4c9-475e-82a0-1b40ab00c8cb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:51:19');
INSERT INTO `sys_user_opt` VALUES (1655960458231840, '62a1d03f-39af-480a-af4e-0f9e455c0134', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 11:51:20');
INSERT INTO `sys_user_opt` VALUES (1655961385173024, 'b631f59e-c9de-404f-9855-27de391eacc1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 11:58:42');
INSERT INTO `sys_user_opt` VALUES (1655961385173088, '7d33e477-67c4-4442-8bf7-121942fd8c22', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:58:42');
INSERT INTO `sys_user_opt` VALUES (1655961385173120, '943bc1f5-7e7c-40e7-b3b3-7a10afbf611e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 11:58:42');
INSERT INTO `sys_user_opt` VALUES (1655961410338848, 'e01d8a8c-659f-4be8-a1fd-6f4b20bdf6f8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:58:53');
INSERT INTO `sys_user_opt` VALUES (1655961431310368, '63110f96-a75f-4c9c-a4e9-0a5104abcc38', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 11:59:03');
INSERT INTO `sys_user_opt` VALUES (1655961431310400, '46fb89b6-c246-46eb-87b8-603fd0fefc1a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1653877009023008', '{id=1653877009023008}', 'yes', '2025-01-08 11:59:03');
INSERT INTO `sys_user_opt` VALUES (1655961462767680, 'f373e578-d6be-48da-b1af-89830bd91e14', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 11:59:19');
INSERT INTO `sys_user_opt` VALUES (1655961469059136, '6873ad99-4eba-4ac6-8f3e-f2b60720cc30', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1653877009023008,\"username\":\"test01\",\"nickname\":\"测试01\",\"sex\":\"female\",\"avatarId\":1655961462767648,\"phone\":\"18301914615\",\"roleList\":[\"cs01\"]}', 'yes', '2025-01-08 11:59:21');
INSERT INTO `sys_user_opt` VALUES (1655961469059168, '26d2486f-ee49-4850-88ac-2fb189389881', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1653877009023008', '{id=1653877009023008}', 'yes', '2025-01-08 11:59:21');
INSERT INTO `sys_user_opt` VALUES (1655961469059200, '109b4cd9-6100-467d-b25e-904f99a72161', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 11:59:21');
INSERT INTO `sys_user_opt` VALUES (1655961469059232, '015ffb36-0091-49b0-938a-e40e1f3810a0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 11:59:22');
INSERT INTO `sys_user_opt` VALUES (1655961615859744, '1e9d254d-2db4-483e-8fc9-04b41576f07e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 12:00:32');
INSERT INTO `sys_user_opt` VALUES (1655961651511360, 'd06d4145-82cb-448f-bb3f-1e314be76759', 'test', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 12:00:49');
INSERT INTO `sys_user_opt` VALUES (1655961651511392, '23ace0e3-73fd-4118-9594-8b6822a9fcd7', 'test', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 12:00:49');
INSERT INTO `sys_user_opt` VALUES (1655961651511424, '5fb9cf85-e6aa-48bd-8497-6b909f11e896', 'test', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 12:00:49');
INSERT INTO `sys_user_opt` VALUES (1655961689260064, 'ad82f8aa-3fe3-4ee4-9c40-e7eea0480591', 'test', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 12:01:06');
INSERT INTO `sys_user_opt` VALUES (1655961699745856, 'c5afd390-d90c-496d-8c7b-aac53f292a4b', 'test', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 12:01:11');
INSERT INTO `sys_user_opt` VALUES (1655961750077472, '26d37ddd-f29e-4df3-9f31-2a6023b337ee', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 12:01:35');
INSERT INTO `sys_user_opt` VALUES (1655961750077536, '6d5e6d5c-197a-44a0-bb13-ac1465adfe32', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 12:01:35');
INSERT INTO `sys_user_opt` VALUES (1655961750077568, 'a815cc08-f7a5-4878-8d22-ee8a7bd50b7d', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 12:01:35');
INSERT INTO `sys_user_opt` VALUES (1655961758466080, 'ae39fadb-d9c2-4459-80d6-5cd462e7d80a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 12:01:39');
INSERT INTO `sys_user_opt` VALUES (1655961771049024, '7c2bf1f5-de0d-40aa-91fa-e5a1c134820a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 12:01:46');
INSERT INTO `sys_user_opt` VALUES (1655961771049056, '99621789-e44c-41c4-927f-13acecb91eb3', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1,\"username\":null,\"nickname\":null,\"sex\":null,\"avatarId\":1655961771048992,\"phone\":null,\"roleList\":null}', 'no', '2025-01-08 12:01:46');
INSERT INTO `sys_user_opt` VALUES (1655961833963552, '314abd3a-39a1-4dd0-b865-b3a757f85c11', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 12:02:15');
INSERT INTO `sys_user_opt` VALUES (1655961833963584, '2ded65c0-ad24-4206-a219-5339c94190f5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1,\"username\":null,\"nickname\":null,\"sex\":null,\"avatarId\":1655961771048992,\"phone\":null,\"roleList\":null}', 'no', '2025-01-08 12:02:15');
INSERT INTO `sys_user_opt` VALUES (1655962031095840, '7c914ed5-da91-4f6c-99eb-0fbd6e1818a8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 12:03:50');
INSERT INTO `sys_user_opt` VALUES (1655962031095872, 'c16f554f-a687-41d1-b0af-993c55122819', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1,\"username\":null,\"nickname\":null,\"sex\":null,\"avatarId\":1655961771048992,\"phone\":null,\"roleList\":null}', 'no', '2025-01-08 12:03:50');
INSERT INTO `sys_user_opt` VALUES (1655962200965152, 'd62f5b69-e8c8-4db5-9401-fdeed9fae593', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 12:05:11');
INSERT INTO `sys_user_opt` VALUES (1655962209353760, 'a5c17122-c9e1-4605-9a5f-12b49bfa172e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 12:05:15');
INSERT INTO `sys_user_opt` VALUES (1655962209353792, 'f3242bef-9fcc-402a-9bc8-7fc8608c98aa', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 12:05:15');
INSERT INTO `sys_user_opt` VALUES (1655962209353824, '3507d087-6739-4130-bcc6-2908d6cda873', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 12:05:15');
INSERT INTO `sys_user_opt` VALUES (1655962211450912, 'c6ca5343-a7fb-41af-8448-bce6812ae8f4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 12:05:15');
INSERT INTO `sys_user_opt` VALUES (1655962219839552, '78cd9ffd-df80-40ac-89a4-a27414614f9f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 12:05:19');
INSERT INTO `sys_user_opt` VALUES (1655962219839584, '01fb80d6-e3fe-4ab3-9ceb-5f4d93216fa7', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1,\"username\":null,\"nickname\":null,\"sex\":null,\"avatarId\":1655962219839520,\"phone\":null,\"roleList\":null}', 'no', '2025-01-08 12:05:19');
INSERT INTO `sys_user_opt` VALUES (1655973938724928, '1651eab2-4537-4d16-bc05-8db9ba6e72cd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 13:38:28');
INSERT INTO `sys_user_opt` VALUES (1655973938724960, 'd5086b76-c9dc-4253-b356-f9a913455166', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:38:28');
INSERT INTO `sys_user_opt` VALUES (1655973938724992, '2fd123c3-53fa-4a12-a8b9-9a01e8044b19', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:38:28');
INSERT INTO `sys_user_opt` VALUES (1655974112788512, '517ccdef-d63d-4a35-a630-fb0bd69c91cb', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 13:39:51');
INSERT INTO `sys_user_opt` VALUES (1655974112788544, '157504c0-a611-40cd-9509-e6f3dcb08d34', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:39:51');
INSERT INTO `sys_user_opt` VALUES (1655974114885664, 'c14653de-dd4f-4cfc-ba8b-ab47cef2de8a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:39:51');
INSERT INTO `sys_user_opt` VALUES (1655974129565728, '6b5e29f9-c2ab-477a-b8c2-b81fd8c100b2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 13:39:58');
INSERT INTO `sys_user_opt` VALUES (1655974129565792, 'd113a0ec-abd7-4a42-9259-cd7a58281634', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:39:58');
INSERT INTO `sys_user_opt` VALUES (1655974129565824, '3e61fbd9-52d9-4d89-904f-16b00eecb28a', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:39:59');
INSERT INTO `sys_user_opt` VALUES (1655974221840448, '802f33e0-acb3-481b-95a2-1aad158be52b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 13:40:42');
INSERT INTO `sys_user_opt` VALUES (1655974221840480, 'e438b676-5392-48fd-a503-809af5559b70', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:40:42');
INSERT INTO `sys_user_opt` VALUES (1655974221840512, '367f7d81-6110-485b-aad6-b8f018247455', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:40:42');
INSERT INTO `sys_user_opt` VALUES (1655974257492000, 'c4b4a609-3882-415b-b019-91072882eed8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 13:40:59');
INSERT INTO `sys_user_opt` VALUES (1655974261686304, 'c38c0e6b-0acf-4053-9ab3-8cd08967e595', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:41:02');
INSERT INTO `sys_user_opt` VALUES (1655974282657824, 'e51adb7b-123d-4f28-9ba7-3ec7122755ff', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:41:11');
INSERT INTO `sys_user_opt` VALUES (1655974282657856, '7c799066-7370-470e-9cee-7787f628c839', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:41:12');
INSERT INTO `sys_user_opt` VALUES (1655974291046432, 'bec67009-2b1e-4103-accc-140e5b85e537', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:41:15');
INSERT INTO `sys_user_opt` VALUES (1655974641270816, '294fcbc7-6b36-4f9c-b735-c85a5bf9cf40', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 13:44:03');
INSERT INTO `sys_user_opt` VALUES (1655974641270848, '3ba51dfb-64d8-4009-909d-8f3078fab289', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:44:03');
INSERT INTO `sys_user_opt` VALUES (1655974641270880, '498c79ac-b988-4920-b9cd-32217eece5c8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:44:03');
INSERT INTO `sys_user_opt` VALUES (1655974643367968, '7a2c5c0c-ae34-4ae2-ba0b-671fdca121b0', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 13:44:04');
INSERT INTO `sys_user_opt` VALUES (1655974649659424, '14aaaf48-644a-4932-a269-b473a67fe515', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 13:44:06');
INSERT INTO `sys_user_opt` VALUES (1655974649659456, 'f16f7cd9-107b-4beb-8c99-57bcea1c846e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:44:06');
INSERT INTO `sys_user_opt` VALUES (1655974649659488, 'd28c2013-b2c8-4bcf-befd-b4487c299c50', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:44:06');
INSERT INTO `sys_user_opt` VALUES (1655974651756576, '513ab56a-36c9-4811-bb0b-87ed016c7596', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 13:44:07');
INSERT INTO `sys_user_opt` VALUES (1655974651756608, '6eaa6253-3fc5-4aad-b7a4-e2d7360f6311', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:44:08');
INSERT INTO `sys_user_opt` VALUES (1655974670630944, 'e362ad26-d9b2-4844-927f-b5f644f70de3', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:44:17');
INSERT INTO `sys_user_opt` VALUES (1655974683213856, '4438af55-cdb2-43be-9db9-c23d5995082f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:44:23');
INSERT INTO `sys_user_opt` VALUES (1655974689505312, 'd917ebfb-c5c5-4a5d-9ce6-56fd6c3706ae', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:44:26');
INSERT INTO `sys_user_opt` VALUES (1655974695796768, 'c0a5276d-dcf2-436d-b012-cc53f1054ec5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:44:28');
INSERT INTO `sys_user_opt` VALUES (1655975664680992, '1d22af4e-af4e-4c5c-9c71-46e80d49cee9', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 13:52:10');
INSERT INTO `sys_user_opt` VALUES (1655975664681024, 'f47fc38d-7905-4002-b2ef-aa3cb5c04a0f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:52:10');
INSERT INTO `sys_user_opt` VALUES (1655975664681056, '4871554b-0870-4855-a618-64950afe9526', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:52:10');
INSERT INTO `sys_user_opt` VALUES (1655975666778144, '2a49be0a-027d-42e9-b0a1-4a66fc20419b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 13:52:12');
INSERT INTO `sys_user_opt` VALUES (1655975668875296, '60a51de3-a683-4f7f-814d-f557c6ef51ec', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:52:13');
INSERT INTO `sys_user_opt` VALUES (1655975717109792, '9179a8e7-5f58-481f-a8d1-d8550d12cf54', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:52:36');
INSERT INTO `sys_user_opt` VALUES (1655975717109856, '99bdbc8d-e6a5-4c96-bb4f-94cfec88234c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-notice/send', '{\"title\":\"测试 独立\",\"content\":\"测试\",\"noticeType\":\"local\",\"messageStatus\":\"alone\",\"sysSendRequestList\":[]}', 'no', '2025-01-08 13:52:36');
INSERT INTO `sys_user_opt` VALUES (1655975719206944, '50716fb6-7446-4bac-a752-b536b7d5da45', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 13:52:36');
INSERT INTO `sys_user_opt` VALUES (1655975853424672, '8832b0f0-b277-45b1-8bb1-ee368610cea5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 13:53:41');
INSERT INTO `sys_user_opt` VALUES (1655975855521824, 'a5262d7c-7ae0-4f65-a6da-302d6298c5db', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:53:41');
INSERT INTO `sys_user_opt` VALUES (1655975855521856, 'c3b880f4-a13d-43d9-b3f5-cf0ef0b1041b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 13:53:42');
INSERT INTO `sys_user_opt` VALUES (1655975857618976, '0e1b270c-3eb0-442b-b2c0-0e8cc75e749c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 13:53:42');
INSERT INTO `sys_user_opt` VALUES (1655975866007584, 'cdd94a91-2982-43aa-807d-d78fc77f91a2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:53:46');
INSERT INTO `sys_user_opt` VALUES (1655975905853472, '077e5a54-a5d9-4757-b3f1-31fc94747d84', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 13:54:06');
INSERT INTO `sys_user_opt` VALUES (1655975907950624, '4c3f9d3f-1838-4049-bdb5-ef4ae4b94ec4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 13:54:06');
INSERT INTO `sys_user_opt` VALUES (1655976010711104, '45edf3ff-bb6b-4ad5-b9ad-b18eda50c826', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-notice/send', '{\"title\":\"测试 \",\"content\":\"帆帆帆帆\",\"noticeType\":\"local\",\"messageStatus\":\"alone\",\"sysSendRequestList\":[]}', 'no', '2025-01-08 13:54:55');
INSERT INTO `sys_user_opt` VALUES (1655977201893408, '8a7cadd6-befc-49c1-aa66-ff2472b59d89', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 14:04:24');
INSERT INTO `sys_user_opt` VALUES (1655977201893440, 'f53762be-d53e-4096-89c8-659759c7f323', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 14:04:24');
INSERT INTO `sys_user_opt` VALUES (1655977201893472, '0f42f0fb-8005-4765-936e-fd4db6c8a0e1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 14:04:24');
INSERT INTO `sys_user_opt` VALUES (1655977206087712, '77cd76e7-2666-4d5e-ad2b-5aecd4e6847b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:04:25');
INSERT INTO `sys_user_opt` VALUES (1655977210282016, '6df6a9c7-1314-4a2c-9aac-5a4a797da604', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:04:28');
INSERT INTO `sys_user_opt` VALUES (1655977210282048, 'bf5ddb59-059d-42b1-a52c-ec51a2f982ca', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 14:04:28');
INSERT INTO `sys_user_opt` VALUES (1655977243836448, '1cee98f5-a58e-4952-9229-8ef1feb325dc', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 14:04:44');
INSERT INTO `sys_user_opt` VALUES (1655977243836480, '64f9bacb-1f12-43b7-9c3f-ff5da1c2df09', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:04:44');
INSERT INTO `sys_user_opt` VALUES (1655977266905184, 'ac1a6dd6-6102-405c-a590-24519a542759', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-notice/send', '{\"title\":\"测试 独立\",\"content\":\"测\",\"noticeType\":\"local\",\"messageStatus\":\"alone\",\"sysSendRequestList\":[{\"userId\":1,\"phone\":\"15312665707\",\"email\":\"\"}]}', 'yes', '2025-01-08 14:04:55');
INSERT INTO `sys_user_opt` VALUES (1655977269002272, '09715e6a-eb05-4b41-bb61-1e68da96c61f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:04:55');
INSERT INTO `sys_user_opt` VALUES (1655977275293728, 'cecf0600-86f5-4c82-b329-0cc2d444498c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655977266905120', '{noticeId=1655977266905120}', 'yes', '2025-01-08 14:04:58');
INSERT INTO `sys_user_opt` VALUES (1655977474523168, 'c66863ef-5069-4e43-a756-092555a559c3', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:06:34');
INSERT INTO `sys_user_opt` VALUES (1655977493397536, 'dfbddedc-1799-4829-b66a-d29c32a2fcc5', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 14:06:42');
INSERT INTO `sys_user_opt` VALUES (1655977499688992, 'c3e9d800-cf6d-4632-82b8-9c9ebd81453b', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655977266905120', '{noticeId=1655977266905120}', 'yes', '2025-01-08 14:06:45');
INSERT INTO `sys_user_opt` VALUES (1655977631809568, '8d9a8c3c-b29f-4244-bf27-05b0285bcdee', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 14:07:48');
INSERT INTO `sys_user_opt` VALUES (1655977686335520, '9ecf69ba-28de-452a-a436-a49492cd9d27', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 14:08:15');
INSERT INTO `sys_user_opt` VALUES (1655977686335552, '9330f857-5050-4393-9e34-dbd2d5a13e9c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:08:15');
INSERT INTO `sys_user_opt` VALUES (1655977686335808, '11147805-92d9-484a-91ef-d2b1bbfe8086', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-notice/send', '{\"title\":\"测试 独立2\",\"content\":\"测试\",\"noticeType\":\"local\",\"messageStatus\":\"alone\",\"sysSendRequestList\":[{\"userId\":1,\"phone\":\"15312665707\",\"email\":\"\"},{\"userId\":1648725644541984,\"phone\":\"15312445781\",\"email\":\"\"},{\"userId\":1651450646102112,\"phone\":\"15312665707\",\"email\":\"\"},{\"userId\":1653877009023008,\"phone\":\"18301914615\",\"email\":\"\"},{\"userId\":1654934657302592,\"phone\":\"18157568583\",\"email\":\"\"},{\"userId\":1655621956927520,\"phone\":\"15312665707\",\"email\":\"\"}]}', 'yes', '2025-01-08 14:08:15');
INSERT INTO `sys_user_opt` VALUES (1655977688432672, 'e1cbe526-768f-4369-907a-e3aed281a644', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:08:15');
INSERT INTO `sys_user_opt` VALUES (1655977692626976, 'c8a5854d-bc0f-4c56-b6e5-ad2d2b0ff09c', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655977686335584', '{noticeId=1655977686335584}', 'yes', '2025-01-08 14:08:17');
INSERT INTO `sys_user_opt` VALUES (1655978267246624, '9fa50b51-ecae-4d50-963d-67ca3127e9f6', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 14:12:51');
INSERT INTO `sys_user_opt` VALUES (1655978267246656, '6a59fc67-8de0-4d06-b183-d5d8b391d8e2', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 14:12:52');
INSERT INTO `sys_user_opt` VALUES (1655978267246688, '8bf1b8f6-b859-4cde-9dc3-302ba8c5dc92', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 14:12:52');
INSERT INTO `sys_user_opt` VALUES (1655978269343776, '8a72d0b3-a75d-48c0-97ac-4bde6b2dd3a4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:12:53');
INSERT INTO `sys_user_opt` VALUES (1655978273538080, '312209b7-1d2d-4d36-baf0-c829b57cb7d1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 14:12:54');
INSERT INTO `sys_user_opt` VALUES (1655978372104224, '4b2f4032-3f70-486e-ae64-e1e12ad971b9', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 14:13:42');
INSERT INTO `sys_user_opt` VALUES (1655978978181152, '79b91774-28f8-4c5f-b9bb-a3884afed52e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 14:18:31');
INSERT INTO `sys_user_opt` VALUES (1655978978181184, '740e2bad-34be-4029-ae05-8b7cffb30254', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 14:18:31');
INSERT INTO `sys_user_opt` VALUES (1655978978181216, '2ae331e6-c1e1-4bff-a23e-92cb6baa60e4', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 14:18:31');
INSERT INTO `sys_user_opt` VALUES (1655978982375456, '1cd871aa-d931-401e-9288-1b392a3f7445', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:18:32');
INSERT INTO `sys_user_opt` VALUES (1655978984472608, '336037eb-8923-499f-af43-66ce4c4c8f48', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 14:18:33');
INSERT INTO `sys_user_opt` VALUES (1655979057872928, '0971e61b-0857-4c04-95cb-37d12c1f0674', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:19:09');
INSERT INTO `sys_user_opt` VALUES (1655979080941600, 'b002902d-adf0-414a-8af8-ae5ed3a0a3f1', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 14:19:19');
INSERT INTO `sys_user_opt` VALUES (1655979080941664, '57c99e52-32ad-4ebc-b34a-72fcd60cf34e', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-notice/send', '{\"title\":\"测试 广播\",\"content\":\"烦烦烦\",\"noticeType\":\"local\",\"messageStatus\":\"broadcast\",\"sysSendRequestList\":[]}', 'yes', '2025-01-08 14:19:19');
INSERT INTO `sys_user_opt` VALUES (1655979080941696, '8ea02b0b-fbbd-4d78-95f2-50f8d0cad5be', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:19:20');
INSERT INTO `sys_user_opt` VALUES (1655979087233056, 'ea676cdc-6ac7-469a-ac2d-c12eaf67a982', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 14:19:22');
INSERT INTO `sys_user_opt` VALUES (1655979114496032, 'f9e537dd-582e-4bb7-8b6d-6832762bc9c8', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:19:35');
INSERT INTO `sys_user_opt` VALUES (1655979150147616, 'c576804b-cec0-4e8d-ab40-e3d1a7469d25', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 14:19:53');
INSERT INTO `sys_user_opt` VALUES (1655979152244768, 'f0fb35c6-77c4-499f-8c96-3f1d844de81f', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 14:19:53');
INSERT INTO `sys_user_opt` VALUES (1655979152244800, '90fe6fab-fc83-4579-83b3-11623f60f4dd', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 14:19:53');
INSERT INTO `sys_user_opt` VALUES (1655979154341920, '9cca2ceb-c2ef-4097-9788-2d93aa349cdf', 'admin', '117.68.146.221', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 14:19:55');
INSERT INTO `sys_user_opt` VALUES (1655994903953440, '576c664b-c81f-452f-bdd5-c985f253cb5b', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:25:04');
INSERT INTO `sys_user_opt` VALUES (1655994903953504, 'dd8aee91-78dc-416a-bc60-97f392c2d659', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:25:05');
INSERT INTO `sys_user_opt` VALUES (1655994903953536, '0cb75c25-7e40-40d9-8d8a-37c6b77f579e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:25:05');
INSERT INTO `sys_user_opt` VALUES (1655994943799328, '4a09979b-291e-4da4-9651-01a1d67c539a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:25:23');
INSERT INTO `sys_user_opt` VALUES (1655994956382240, '5444e6e2-a49c-49a0-8ee3-f31c59964bfe', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:25:30');
INSERT INTO `sys_user_opt` VALUES (1655994962673696, 'f0fe2d01-7bf9-4bc0-9d6f-9b53034a1d4e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:25:32');
INSERT INTO `sys_user_opt` VALUES (1655994964770848, 'ded3b27b-8379-4dae-bc24-687546f091f9', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:25:34');
INSERT INTO `sys_user_opt` VALUES (1655994981548064, '45dc11fa-530b-4aa4-918c-3694a2aae784', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:25:41');
INSERT INTO `sys_user_opt` VALUES (1655994983645216, '00d2d49b-d0f7-4dea-a287-603348aa9e2d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-08 16:25:43');
INSERT INTO `sys_user_opt` VALUES (1655995002519584, '939be803-6167-47de-90e2-afca94949a61', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:25:51');
INSERT INTO `sys_user_opt` VALUES (1655995010908192, '0cc20c96-9378-45f2-b2b0-f4e014e4fc0e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655977686335584', '{noticeId=1655977686335584}', 'yes', '2025-01-08 16:25:56');
INSERT INTO `sys_user_opt` VALUES (1655995025588256, '305c11f8-542f-407c-98a6-d3a339a58a54', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655977686335584', '{noticeId=1655977686335584}', 'yes', '2025-01-08 16:26:03');
INSERT INTO `sys_user_opt` VALUES (1655995029782560, '17d35fbe-56f5-4562-8569-3c5cde8a26ca', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:26:05');
INSERT INTO `sys_user_opt` VALUES (1655995050754080, 'bb606046-f437-4f49-8d0e-c13486ac868d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:26:15');
INSERT INTO `sys_user_opt` VALUES (1655995052851232, 'd81ec478-4ca8-4488-9ea9-100a20538ff5', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:26:16');
INSERT INTO `sys_user_opt` VALUES (1655995057045536, '8e833e24-cdfc-4527-b628-bfddc18827c3', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:26:17');
INSERT INTO `sys_user_opt` VALUES (1655995059142688, '55d793d1-48d9-4d0f-be9a-5aeebbc4e555', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:26:19');
INSERT INTO `sys_user_opt` VALUES (1655995078017056, '602a6d32-f702-4eb4-b994-41c9a36c2126', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:26:27');
INSERT INTO `sys_user_opt` VALUES (1655995080114208, 'f118f4d4-a63f-4ae1-a4c4-934647e35137', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:26:28');
INSERT INTO `sys_user_opt` VALUES (1655995082211360, '01c56696-10e7-4f6b-bba5-f689cdb1fb7e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:26:29');
INSERT INTO `sys_user_opt` VALUES (1655995084308512, '97eb1e79-859a-477c-8a2c-28d67986cf3e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:26:31');
INSERT INTO `sys_user_opt` VALUES (1655995086405664, '621decd4-8e3e-405e-8354-6eebd6f70b6d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:26:32');
INSERT INTO `sys_user_opt` VALUES (1655995090599968, '397e47ed-5977-4065-84ce-e5ac8f514854', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:26:33');
INSERT INTO `sys_user_opt` VALUES (1655995092697120, '3a2203c3-cbee-4268-80f1-1bed2e42de03', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:26:34');
INSERT INTO `sys_user_opt` VALUES (1655995094794272, 'cc21ac90-bda8-41d3-9be2-3fdc8e94ffe8', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:26:35');
INSERT INTO `sys_user_opt` VALUES (1655995098988576, 'ad0d8a07-4f90-445d-bb80-0b433bb8fe23', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:26:38');
INSERT INTO `sys_user_opt` VALUES (1655995103182880, 'fff3990e-fedf-4045-afd6-5e964078a16e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655979080941632', '{noticeId=1655979080941632}', 'yes', '2025-01-08 16:26:40');
INSERT INTO `sys_user_opt` VALUES (1655995109474336, '3b936ccd-84d5-46a6-9119-6acfd3009ead', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655644979462176', '{noticeId=1655644979462176}', 'yes', '2025-01-08 16:26:42');
INSERT INTO `sys_user_opt` VALUES (1655995115765792, '270f0828-d61d-4b1b-b965-6bbee9b69ea4', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:26:46');
INSERT INTO `sys_user_opt` VALUES (1655995122057248, '1ccae9b7-dd59-4d5e-a86d-38dd19e765d7', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:26:48');
INSERT INTO `sys_user_opt` VALUES (1655995134640160, '52952730-e414-412a-b7ee-d32a5d0734e7', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:26:54');
INSERT INTO `sys_user_opt` VALUES (1655995134640192, 'e4ca461d-2b00-466d-8acb-3f63b3979cab', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/125', '{permissionId=125}', 'yes', '2025-01-08 16:26:54');
INSERT INTO `sys_user_opt` VALUES (1655995140931616, 'ee601aeb-bdad-4b2a-b66f-83ebd352b4fa', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":125,\"parentId\":7,\"menuName\":\"权限管理\",\"menuPath\":\"auth\",\"menuUrl\":\"/system/auth/index\",\"permissions\":\"system:auth:list\",\"menuType\":\"Menu\",\"icon\":\"example\",\"sort\":3}', 'yes', '2025-01-08 16:26:57');
INSERT INTO `sys_user_opt` VALUES (1655995140931648, '187f9e09-d7df-46c2-97b1-b24b7225eaa6', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:26:57');
INSERT INTO `sys_user_opt` VALUES (1655995140931680, '7324bc46-9dbb-4dc2-9d49-cbf4f62f1a38', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/125', '{permissionId=125}', 'yes', '2025-01-08 16:26:57');
INSERT INTO `sys_user_opt` VALUES (1655995140931712, 'ba681313-653a-446b-942f-7f04d03694a5', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:26:58');
INSERT INTO `sys_user_opt` VALUES (1655995149320224, 'b4b7f0fb-1c5d-499c-800f-d2b1e756e90f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:27:01');
INSERT INTO `sys_user_opt` VALUES (1655995149320256, 'e9770b3c-71b0-44e8-a36a-0b3eb632f2fa', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/126', '{permissionId=126}', 'yes', '2025-01-08 16:27:01');
INSERT INTO `sys_user_opt` VALUES (1655995157708832, '3cc2e8dc-271f-49fd-9bde-f150685d7bd4', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":126,\"parentId\":7,\"menuName\":\"参数配置\",\"menuPath\":\"config\",\"menuUrl\":\"/system/config/index\",\"permissions\":\"system:config:list\",\"menuType\":\"Menu\",\"icon\":\"email\",\"sort\":4}', 'yes', '2025-01-08 16:27:05');
INSERT INTO `sys_user_opt` VALUES (1655995157708864, '1c53c407-4c5c-49f8-9738-05ee92db6bdb', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:27:05');
INSERT INTO `sys_user_opt` VALUES (1655995157708896, '199d4a00-f8bd-4d01-a445-9f80db2a2265', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/126', '{permissionId=126}', 'yes', '2025-01-08 16:27:05');
INSERT INTO `sys_user_opt` VALUES (1655995157708928, '40935471-5ed0-484b-91da-a0228c367928', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:27:06');
INSERT INTO `sys_user_opt` VALUES (1655995159805984, '58c1677e-c9d6-43ce-ae26-10b0cf9ce323', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:27:07');
INSERT INTO `sys_user_opt` VALUES (1655995159806016, 'aab20073-aece-49be-a36e-bbc635ff3d84', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/127', '{permissionId=127}', 'yes', '2025-01-08 16:27:07');
INSERT INTO `sys_user_opt` VALUES (1655995168194592, '77ea253e-6830-4e53-96b7-7efc36e22069', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":127,\"parentId\":7,\"menuName\":\"文件管理\",\"menuPath\":\"file\",\"menuUrl\":\"/system/file/index\",\"permissions\":\"system:file:list\",\"menuType\":\"Menu\",\"icon\":\"server\",\"sort\":5}', 'yes', '2025-01-08 16:27:10');
INSERT INTO `sys_user_opt` VALUES (1655995168194624, 'bb5511bf-1f4c-4766-a1b5-ea9f5bb7da96', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:27:11');
INSERT INTO `sys_user_opt` VALUES (1655995168194656, '344f9025-1417-4936-8437-aa75ea83c85d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/127', '{permissionId=127}', 'yes', '2025-01-08 16:27:11');
INSERT INTO `sys_user_opt` VALUES (1655995168194688, '88a4e7ef-daff-4e58-929e-948fd57ceafb', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:27:11');
INSERT INTO `sys_user_opt` VALUES (1655995172388896, 'e46a3223-8aa4-4044-a2a6-6237af9e16f5', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:27:13');
INSERT INTO `sys_user_opt` VALUES (1655995174486048, '14dd4cab-71d3-48b4-9e5b-40f78c653719', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/129', '{permissionId=129}', 'yes', '2025-01-08 16:27:13');
INSERT INTO `sys_user_opt` VALUES (1655995180777504, '35e3dfc3-d47f-40ea-afc8-39f16f3006e0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":129,\"parentId\":7,\"menuName\":\"站内信\",\"menuPath\":\"notice\",\"menuUrl\":\"/system/notice/index\",\"permissions\":\"system:notice:list\",\"menuType\":\"Menu\",\"icon\":\"question\",\"sort\":7}', 'yes', '2025-01-08 16:27:16');
INSERT INTO `sys_user_opt` VALUES (1655995180777536, '5253e8e7-fe24-4a43-9b1f-422e3cacdb6a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:27:16');
INSERT INTO `sys_user_opt` VALUES (1655995180777568, 'c8696cc4-f6f7-483b-bf8a-949260033dd0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/129', '{permissionId=129}', 'yes', '2025-01-08 16:27:16');
INSERT INTO `sys_user_opt` VALUES (1655995180777600, '23584e92-b49d-4aa2-84a2-64d744658056', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:27:17');
INSERT INTO `sys_user_opt` VALUES (1655995184971808, '8d1692ae-2a44-4a81-a718-f622b007143b', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:27:18');
INSERT INTO `sys_user_opt` VALUES (1655995184971840, '6677b6b7-1394-4520-b90d-d6545bef91ac', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:27:18');
INSERT INTO `sys_user_opt` VALUES (1655995184971872, '637e9543-6bd4-49b4-937b-6c9bfa2c534a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:27:18');
INSERT INTO `sys_user_opt` VALUES (1655995184971904, 'b134a26e-f2a7-40c9-bd00-f0d67a5f1e25', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:27:19');
INSERT INTO `sys_user_opt` VALUES (1655995197554720, 'c729effd-1c23-496b-a017-2e1b1ac395fb', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:27:24');
INSERT INTO `sys_user_opt` VALUES (1655995199651872, 'ba7c1d78-b2fd-4266-9c59-ed02017e251b', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:27:25');
INSERT INTO `sys_user_opt` VALUES (1655995203846176, 'beef5d4c-72b6-4d46-8731-57b9ea76e0d8', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:27:27');
INSERT INTO `sys_user_opt` VALUES (1655995205943328, '9c1382a4-cd8c-4523-b1ff-c4004affdc6a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-08 16:27:28');
INSERT INTO `sys_user_opt` VALUES (1655995249983520, 'e00e0781-fd5a-45d7-bd0a-4bd42b25d1d7', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:27:50');
INSERT INTO `sys_user_opt` VALUES (1655995260469280, 'd2ed3fd7-43fc-4332-9f51-ef0612858c5f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1654934657302592', '{id=1654934657302592}', 'yes', '2025-01-08 16:27:54');
INSERT INTO `sys_user_opt` VALUES (1655995260469312, '2ea7f85a-324d-4fd4-8416-2abaca6ffef0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 16:27:54');
INSERT INTO `sys_user_opt` VALUES (1655995281440800, '607eed84-f231-462b-861b-d46715a4d67a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 16:28:05');
INSERT INTO `sys_user_opt` VALUES (1655995289829504, 'cf98ab63-3da3-452b-b5c8-2371185e316c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1654934657302592,\"username\":\"wangboss\",\"nickname\":\"小王吧\",\"sex\":\"male\",\"avatarId\":1655633315102752,\"phone\":\"18157568583\",\"roleList\":[\"sys4\",\"sys2\",\"sys5\"]}', 'yes', '2025-01-08 16:28:09');
INSERT INTO `sys_user_opt` VALUES (1655995289829536, '29300e16-e850-4375-8e88-cbf9487909fb', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 16:28:09');
INSERT INTO `sys_user_opt` VALUES (1655995289829568, '6b29f677-3ba0-44eb-a3ab-d2963c3622cb', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1654934657302592', '{id=1654934657302592}', 'yes', '2025-01-08 16:28:09');
INSERT INTO `sys_user_opt` VALUES (1655995289829600, 'e11977ea-5901-4f0c-9256-26e5375cbd75', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:28:09');
INSERT INTO `sys_user_opt` VALUES (1655995296120864, 'fd8bcaec-940f-4d8b-b9af-3a9000079b57', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 16:28:11');
INSERT INTO `sys_user_opt` VALUES (1655995296120896, '10a91592-43e2-4f54-a6a9-72a286317168', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1654934657302592', '{id=1654934657302592}', 'yes', '2025-01-08 16:28:11');
INSERT INTO `sys_user_opt` VALUES (1655995298218112, '1e680bbf-ce7e-42a0-8a31-0ff9bf0663e1', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1654934657302592,\"username\":\"wangboss\",\"nickname\":\"小王吧\",\"sex\":\"male\",\"avatarId\":1655633315102752,\"phone\":\"18157568583\",\"roleList\":[\"sys4\",\"sys2\",\"sys5\"]}', 'yes', '2025-01-08 16:28:13');
INSERT INTO `sys_user_opt` VALUES (1655995300315168, '85800b3e-a597-4f80-95d9-bcf6b27a0f73', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 16:28:13');
INSERT INTO `sys_user_opt` VALUES (1655995300315200, 'c79e169b-aa2c-4077-802d-0728f429ea06', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1654934657302592', '{id=1654934657302592}', 'yes', '2025-01-08 16:28:13');
INSERT INTO `sys_user_opt` VALUES (1655995300315232, '30bfd21d-263a-4013-96ad-50d84a025652', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:28:13');
INSERT INTO `sys_user_opt` VALUES (1655995306606624, 'e3360ca4-4c7a-4d10-ae9e-e3633019aa66', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:28:17');
INSERT INTO `sys_user_opt` VALUES (1655995317092384, '0bd4035f-ad56-4519-8174-65b24afd71d1', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1,\"username\":null,\"nickname\":\"超级管理员\",\"sex\":\"male\",\"avatarId\":null,\"phone\":\"15312665707\",\"roleList\":null}', 'no', '2025-01-08 16:28:21');
INSERT INTO `sys_user_opt` VALUES (1655995346452544, '716f6aee-3186-446d-b01e-bd38cdb4e81d', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:28:36');
INSERT INTO `sys_user_opt` VALUES (1655995346452576, '2cd61194-f11c-43c4-b55c-38c313fefde1', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:28:36');
INSERT INTO `sys_user_opt` VALUES (1655995346452608, '8d3f78fd-4adc-42cc-8280-432c03abda30', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:28:36');
INSERT INTO `sys_user_opt` VALUES (1655995367424032, 'e481a1af-63a4-43b9-bb13-3c11f445471a', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:28:46');
INSERT INTO `sys_user_opt` VALUES (1655995369521184, 'cfea3e8f-2ca1-4746-8584-71a77f51b691', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:28:47');
INSERT INTO `sys_user_opt` VALUES (1655995371618336, 'b7542efa-9959-42b8-8d6a-05f092edfe2d', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:28:48');
INSERT INTO `sys_user_opt` VALUES (1655995373715488, '2adc415c-5e37-4b59-b8ea-6b02f401a1bd', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-08 16:28:49');
INSERT INTO `sys_user_opt` VALUES (1655995375812640, 'd06943cf-3355-4f6b-a868-e485577e2dff', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 16:28:50');
INSERT INTO `sys_user_opt` VALUES (1655995388395552, 'cf8b2d32-7311-4cf5-8445-4d6ce861ed3a', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:28:55');
INSERT INTO `sys_user_opt` VALUES (1655995392589856, '79175581-7dd9-4625-b982-ad98018352f7', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:28:57');
INSERT INTO `sys_user_opt` VALUES (1655995394687008, 'be12cd55-b51d-4ce3-b5a6-cf24459e7c06', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:28:58');
INSERT INTO `sys_user_opt` VALUES (1655995396784160, 'f7c908dc-47f1-4e2c-9711-84a79e0c9df6', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:28:59');
INSERT INTO `sys_user_opt` VALUES (1655995403075616, 'be74517b-2b9b-4891-89e7-292393e3ea88', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 16:29:03');
INSERT INTO `sys_user_opt` VALUES (1655995403075648, '2ca9c376-d638-444a-b468-06740f3e7137', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1654934657302592', '{id=1654934657302592}', 'yes', '2025-01-08 16:29:03');
INSERT INTO `sys_user_opt` VALUES (1655995411464256, '8b7a31b4-d399-498a-9f97-e8a220e83f1b', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 16:29:06');
INSERT INTO `sys_user_opt` VALUES (1655995413561472, '0f4cc41e-d992-4661-8dca-afd95c7aa57a', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1654934657302592,\"username\":\"wangboss\",\"nickname\":\"小王吧\",\"sex\":\"male\",\"avatarId\":1655995411464224,\"phone\":\"18157568583\",\"roleList\":[\"sys4\",\"sys2\",\"sys5\"]}', 'yes', '2025-01-08 16:29:07');
INSERT INTO `sys_user_opt` VALUES (1655995413561504, 'bd73e963-7b93-4e66-a5ac-a540eb968d37', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 16:29:07');
INSERT INTO `sys_user_opt` VALUES (1655995413561536, '48a47a10-2fc9-4692-b679-41aaf5bfa7a1', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1654934657302592', '{id=1654934657302592}', 'yes', '2025-01-08 16:29:07');
INSERT INTO `sys_user_opt` VALUES (1655995413561568, '4b0780a3-0dc4-4473-8f7d-36b5a871cd73', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:29:08');
INSERT INTO `sys_user_opt` VALUES (1655995419852832, '9a95f828-65ce-4dfc-8169-c8bbdfeaf13d', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:29:11');
INSERT INTO `sys_user_opt` VALUES (1655995432435776, '99ca8d95-10f8-48d9-888f-4dca04bc1aca', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 16:29:17');
INSERT INTO `sys_user_opt` VALUES (1655995432435808, '49f56775-91a4-46eb-8f33-70ee38c8e79a', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1651450646102112,\"username\":null,\"nickname\":null,\"sex\":null,\"avatarId\":1655995432435744,\"phone\":null,\"roleList\":null}', 'yes', '2025-01-08 16:29:17');
INSERT INTO `sys_user_opt` VALUES (1655995432435840, '52aaa25a-5803-428d-9bca-856740e9adf3', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:29:17');
INSERT INTO `sys_user_opt` VALUES (1655995442921504, 'bda70961-ffd1-47a4-a10b-9c836f791daf', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:29:22');
INSERT INTO `sys_user_opt` VALUES (1655995461795872, '43a9e081-ca7f-497a-8d99-c5785013f146', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:29:31');
INSERT INTO `sys_user_opt` VALUES (1655995461795904, '9ae778b8-5952-4707-a994-29f1bb6f016b', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:29:31');
INSERT INTO `sys_user_opt` VALUES (1655995461795936, 'edd85ee2-f1a3-47a1-9bef-0b96da8d85fa', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:29:31');
INSERT INTO `sys_user_opt` VALUES (1655995463893024, '2fa54264-02b2-4d8d-a5a3-521204dbbb81', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:29:31');
INSERT INTO `sys_user_opt` VALUES (1655995468087328, 'bc8dc468-d85d-4c05-8a0d-681808fb6ad2', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:29:34');
INSERT INTO `sys_user_opt` VALUES (1655995476475936, 'df4c2883-66e3-48e9-8bd1-c2e6cc9e7c9c', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:29:37');
INSERT INTO `sys_user_opt` VALUES (1655995478573088, 'f3bdcecc-f38e-4f33-a70c-c9150ccc0e19', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:29:39');
INSERT INTO `sys_user_opt` VALUES (1655995484864544, '046df60a-cba7-4c38-8a34-f626dd4c1b59', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:29:42');
INSERT INTO `sys_user_opt` VALUES (1655995489058848, 'd2fd01b6-b82b-46d1-898b-35c9255e0fbb', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:29:43');
INSERT INTO `sys_user_opt` VALUES (1655995518419008, '63ec8fb2-50b5-4e97-8524-918d2351d075', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:29:58');
INSERT INTO `sys_user_opt` VALUES (1655995518419040, '399b976a-c433-46c3-9477-4e600af8dda4', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:29:58');
INSERT INTO `sys_user_opt` VALUES (1655995518419072, '5f7f5030-c943-451c-a225-df09d5c9eab3', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:29:58');
INSERT INTO `sys_user_opt` VALUES (1655995535196192, 'f58422bb-9a52-4cfe-a59e-fa9661a044ce', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:30:05');
INSERT INTO `sys_user_opt` VALUES (1655995537293344, 'e801c0f4-3235-4f01-ba98-8e4ef8cc8d1f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:30:06');
INSERT INTO `sys_user_opt` VALUES (1655995539390496, 'a85dadd2-82a4-48ba-bee6-16e93b5a82e8', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:30:07');
INSERT INTO `sys_user_opt` VALUES (1655995541487648, '7483f3d0-261c-45dd-9e26-c9e07fd556d0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-08 16:30:08');
INSERT INTO `sys_user_opt` VALUES (1655995543584800, 'eb0da8a3-2845-498f-9be8-6e6f1c8063bf', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 16:30:10');
INSERT INTO `sys_user_opt` VALUES (1655995545681952, '7697d404-77e8-41f7-8da4-db97bc5338da', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:30:11');
INSERT INTO `sys_user_opt` VALUES (1655995549876256, 'cd106647-46e4-4edc-86cd-7a622244cbfe', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:30:12');
INSERT INTO `sys_user_opt` VALUES (1655995549876288, 'f5d02004-94d8-421d-ac1a-cbe9d42bf46f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 16:30:12');
INSERT INTO `sys_user_opt` VALUES (1655995560362016, 'bf57f5a2-0b1f-49f2-9825-47b9b5026aaa', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 16:30:17');
INSERT INTO `sys_user_opt` VALUES (1655995591819296, '35583673-78c8-4803-a69a-c6b55cba728b', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:30:33');
INSERT INTO `sys_user_opt` VALUES (1655995596013600, 'c7841ff9-9d49-4330-b244-8c6c0714420b', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:30:34');
INSERT INTO `sys_user_opt` VALUES (1655995598110752, '850a614a-26f9-406a-8eeb-8a7f8df14581', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-08 16:30:35');
INSERT INTO `sys_user_opt` VALUES (1655995600207904, '23f762d9-6cfb-40ab-8a93-b3d5beebed41', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 16:30:37');
INSERT INTO `sys_user_opt` VALUES (1655996772515872, 'dafbeda1-380b-444b-9059-27951a443306', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:39:56');
INSERT INTO `sys_user_opt` VALUES (1655996772515904, 'ec164899-c9ce-4f80-a952-09458bb7e0d0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:39:56');
INSERT INTO `sys_user_opt` VALUES (1655996772515936, '4fa3c1b0-129e-4b71-bfab-4e97f9efb7d1', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:39:56');
INSERT INTO `sys_user_opt` VALUES (1655996803973152, 'cfdf4003-d4de-4857-b1ce-5927de2e624c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:40:11');
INSERT INTO `sys_user_opt` VALUES (1655996818653216, '6a68b913-fb35-4fde-b5d8-9ca7e4c6180a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:40:17');
INSERT INTO `sys_user_opt` VALUES (1655996818653248, 'af6003c6-42ad-4905-9b7d-dc4c76497572', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 16:40:17');
INSERT INTO `sys_user_opt` VALUES (1655997019979808, 'c7160a02-4170-4dda-96d0-ad551930f63c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:41:54');
INSERT INTO `sys_user_opt` VALUES (1655997019979840, '7d2da191-55b8-4262-8590-778de75fa3e7', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 16:41:54');
INSERT INTO `sys_user_opt` VALUES (1655997038854176, '17271a5f-d16e-4a87-8cbc-65efb2e36680', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:42:03');
INSERT INTO `sys_user_opt` VALUES (1655997038854208, 'c0047ccc-29ea-4fdb-a074-d22b4800a6d1', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/2', '{permissionId=2}', 'yes', '2025-01-08 16:42:03');
INSERT INTO `sys_user_opt` VALUES (1655997099671584, '905bc455-faa7-4c5c-98ff-737745d3e6f5', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":2,\"parentId\":null,\"menuName\":\"课程管理\",\"menuPath\":\"course\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"education\",\"sort\":2}', 'yes', '2025-01-08 16:42:31');
INSERT INTO `sys_user_opt` VALUES (1655997099671616, 'aef3a9dd-7be4-4e21-b6a7-6d13b5ab9564', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:42:31');
INSERT INTO `sys_user_opt` VALUES (1655997099671648, '097b521d-ee05-4f0e-8b45-0fd55012ac4f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/2', '{permissionId=2}', 'yes', '2025-01-08 16:42:32');
INSERT INTO `sys_user_opt` VALUES (1655997099671680, '39efe04f-ed0f-4f6a-b4af-5f3248676749', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:42:32');
INSERT INTO `sys_user_opt` VALUES (1655997105963040, '20b0efdb-9f4f-421a-8bcd-d4041219f06d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:42:35');
INSERT INTO `sys_user_opt` VALUES (1655997105963072, 'b6cf1179-58d0-445b-8375-b1372fe5747c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/3', '{permissionId=3}', 'yes', '2025-01-08 16:42:35');
INSERT INTO `sys_user_opt` VALUES (1655997168877600, 'c80ae0e1-246d-414e-af99-c862229f0649', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":3,\"parentId\":null,\"menuName\":\"售课核销\",\"menuPath\":\"sale\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"shopping\",\"sort\":3}', 'yes', '2025-01-08 16:43:05');
INSERT INTO `sys_user_opt` VALUES (1655997168877632, '187ca98f-a322-4773-a0b0-5ab0356cf6a0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:43:05');
INSERT INTO `sys_user_opt` VALUES (1655997168877664, 'aa613f32-17ae-423a-86cc-0e569bdc7e0d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/3', '{permissionId=3}', 'yes', '2025-01-08 16:43:05');
INSERT INTO `sys_user_opt` VALUES (1655997170974752, 'd5c57db7-007b-4c63-ad86-b7b0bd8ea2be', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:43:05');
INSERT INTO `sys_user_opt` VALUES (1655997219209248, '674ce0b3-6aa0-4127-b127-692b95b5b4be', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:43:29');
INSERT INTO `sys_user_opt` VALUES (1655997219209280, 'ccf56e7e-cf9a-43eb-bb7c-06984a0f89a6', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/4', '{permissionId=4}', 'yes', '2025-01-08 16:43:29');
INSERT INTO `sys_user_opt` VALUES (1655997244375072, '46eefcc4-b858-423e-a2c7-275fb5ae226e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":4,\"parentId\":null,\"menuName\":\"家校一体\",\"menuPath\":\"school\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"wechat\",\"sort\":4}', 'yes', '2025-01-08 16:43:41');
INSERT INTO `sys_user_opt` VALUES (1655997246472224, '6485f683-b68d-4d99-915e-b2cc2940b98c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:43:41');
INSERT INTO `sys_user_opt` VALUES (1655997246472256, '1498b544-4f7e-4f06-81b0-c67f9793e841', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/4', '{permissionId=4}', 'yes', '2025-01-08 16:43:41');
INSERT INTO `sys_user_opt` VALUES (1655997246472288, '0df1716c-fe64-4ee9-8012-9b2c334b6c2d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:43:41');
INSERT INTO `sys_user_opt` VALUES (1655997250666528, '21ecc74c-fcfc-439f-b3bc-42646f1cea02', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:43:43');
INSERT INTO `sys_user_opt` VALUES (1655997250666560, 'c1c0e3b8-b922-4a9b-9109-2eb3fc2d7cb7', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/5', '{permissionId=5}', 'yes', '2025-01-08 16:43:43');
INSERT INTO `sys_user_opt` VALUES (1655997267443744, '83100c2e-919e-4053-8371-c96a42097d42', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":5,\"parentId\":null,\"menuName\":\"学生端管理\",\"menuPath\":\"student\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"people\",\"sort\":5}', 'yes', '2025-01-08 16:43:51');
INSERT INTO `sys_user_opt` VALUES (1655997267443776, '8f0173a7-9b9d-45ac-b804-1b231f93670f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:43:51');
INSERT INTO `sys_user_opt` VALUES (1655997267443808, '74a7de45-f8a5-4798-8d61-2388c694afe5', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/5', '{permissionId=5}', 'yes', '2025-01-08 16:43:51');
INSERT INTO `sys_user_opt` VALUES (1655997267443840, 'a07fce4a-7c9a-4c47-b50b-d392fd37ea22', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:43:52');
INSERT INTO `sys_user_opt` VALUES (1655997271638048, 'fe7a772a-739d-4327-888d-8fc32a8db356', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:43:53');
INSERT INTO `sys_user_opt` VALUES (1655997271638080, 'b739ca19-ce78-44a9-890f-11ce61f7a318', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/6', '{permissionId=6}', 'yes', '2025-01-08 16:43:53');
INSERT INTO `sys_user_opt` VALUES (1655997286318112, 'a1c6fe69-f069-4cf8-8112-2454310ede0f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":6,\"parentId\":null,\"menuName\":\"运营管理\",\"menuPath\":\"operate\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"redis-list\",\"sort\":6}', 'yes', '2025-01-08 16:44:00');
INSERT INTO `sys_user_opt` VALUES (1655997286318144, 'f1bcede5-ae8b-42e4-a766-0c9fde60a8d7', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:44:01');
INSERT INTO `sys_user_opt` VALUES (1655997286318176, '09cf18f3-2802-4847-8e56-4f72e3aff679', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/6', '{permissionId=6}', 'yes', '2025-01-08 16:44:01');
INSERT INTO `sys_user_opt` VALUES (1655997286318208, '3cc98f9e-626b-4cd6-b220-b1691bebb1fa', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:44:01');
INSERT INTO `sys_user_opt` VALUES (1655997290512416, '969e879d-b76d-48ae-a878-8775c39f6ede', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:44:03');
INSERT INTO `sys_user_opt` VALUES (1655997290512448, 'fb393bdc-8817-4b15-97c8-782c06aad26c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:44:03');
INSERT INTO `sys_user_opt` VALUES (1655997290512480, 'e9f0194e-c847-4965-9b64-a4696fa79347', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:44:03');
INSERT INTO `sys_user_opt` VALUES (1655997292609568, '9c29e41c-68a9-45a2-91bf-a3a700c0b6ea', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:44:03');
INSERT INTO `sys_user_opt` VALUES (1655997366009888, 'e4921f31-f316-4f9e-861d-3e29da710807', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:44:38');
INSERT INTO `sys_user_opt` VALUES (1655997368107040, '12e1cc91-09c9-48f6-9b54-ab1527198629', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:44:40');
INSERT INTO `sys_user_opt` VALUES (1655997378592800, 'c45f4f28-35bf-4d6c-b1df-0fe15262802a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:44:44');
INSERT INTO `sys_user_opt` VALUES (1655997391175712, 'eacb3abf-dd81-4ef2-b96c-d5db98c9cb3f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:44:50');
INSERT INTO `sys_user_opt` VALUES (1655997391175744, '5c09e0c0-8c79-4f50-b55a-2b6d585ad603', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/124', '{permissionId=124}', 'yes', '2025-01-08 16:44:50');
INSERT INTO `sys_user_opt` VALUES (1655997412147232, 'b13019f4-0566-4ef2-bdf1-27a0642026cb', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":124,\"parentId\":7,\"menuName\":\"角色管理\",\"menuPath\":\"role\",\"menuUrl\":\"/system/role/index\",\"permissions\":\"system:role:list\",\"menuType\":\"Menu\",\"icon\":\"eye-open\",\"sort\":2}', 'yes', '2025-01-08 16:45:00');
INSERT INTO `sys_user_opt` VALUES (1655997412147264, 'c7366faa-ea08-4e38-980c-431a27c1d84c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:45:00');
INSERT INTO `sys_user_opt` VALUES (1655997412147296, 'ecb3f0f7-3590-4582-8ef4-ec4ce64d5370', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/124', '{permissionId=124}', 'yes', '2025-01-08 16:45:00');
INSERT INTO `sys_user_opt` VALUES (1655997412147328, '16373fda-6124-4931-b46b-623743520d00', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:45:00');
INSERT INTO `sys_user_opt` VALUES (1655997416341536, 'da9cb6f2-0d88-43f2-b1a4-a5a363a80d0b', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:45:02');
INSERT INTO `sys_user_opt` VALUES (1655997416341568, 'cd0a2a87-68ac-4bea-a668-e07e7d7faa84', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:45:02');
INSERT INTO `sys_user_opt` VALUES (1655997416341600, '84ebc29f-5df6-4a91-b90b-862b3176de4e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:45:02');
INSERT INTO `sys_user_opt` VALUES (1655997416341632, '644a029b-2a58-46c1-a979-cec406c46abd', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:45:03');
INSERT INTO `sys_user_opt` VALUES (1655997466673184, '635882b0-832a-4ba8-b176-e5cdc1a2327c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:45:26');
INSERT INTO `sys_user_opt` VALUES (1655997466673216, 'e4a5f80b-b6bf-4544-8cb3-983558f64345', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/124', '{permissionId=124}', 'yes', '2025-01-08 16:45:26');
INSERT INTO `sys_user_opt` VALUES (1655997514907680, '598be2ff-4955-41e3-ace6-9822b6f645d6', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":124,\"parentId\":7,\"menuName\":\"角色管理\",\"menuPath\":\"role\",\"menuUrl\":\"/system/role/index\",\"permissions\":\"system:role:list\",\"menuType\":\"Menu\",\"icon\":\"example\",\"sort\":2}', 'yes', '2025-01-08 16:45:50');
INSERT INTO `sys_user_opt` VALUES (1655997514907712, '414c5bd1-2cfd-4c87-a356-7f7626f1b9a7', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:45:50');
INSERT INTO `sys_user_opt` VALUES (1655997514907744, 'ba0ed666-0f0b-4739-a39d-243fded06c72', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/124', '{permissionId=124}', 'yes', '2025-01-08 16:45:50');
INSERT INTO `sys_user_opt` VALUES (1655997517004832, 'ec890d73-f069-4c7c-9b76-34acbd23af3e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:45:50');
INSERT INTO `sys_user_opt` VALUES (1655997519101984, '5a0038fb-6bb1-47f0-84e3-8394cafc04ae', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:45:51');
INSERT INTO `sys_user_opt` VALUES (1655997519102016, 'f3300f55-b13c-4d4d-aa79-c876e582d951', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/125', '{permissionId=125}', 'yes', '2025-01-08 16:45:51');
INSERT INTO `sys_user_opt` VALUES (1655997544267808, '79d5109c-0e05-4bf9-9a08-bde65f5f8394', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":125,\"parentId\":7,\"menuName\":\"权限管理\",\"menuPath\":\"auth\",\"menuUrl\":\"/system/auth/index\",\"permissions\":\"system:auth:list\",\"menuType\":\"Menu\",\"icon\":\"eye-open\",\"sort\":3}', 'yes', '2025-01-08 16:46:04');
INSERT INTO `sys_user_opt` VALUES (1655997546364960, 'b2b6a955-07a9-4f85-9d4a-743527410301', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:46:04');
INSERT INTO `sys_user_opt` VALUES (1655997546364992, 'cbc2a16c-d8bb-47d4-a70a-c6764f192abd', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/125', '{permissionId=125}', 'yes', '2025-01-08 16:46:04');
INSERT INTO `sys_user_opt` VALUES (1655997546365024, 'be964273-553a-4940-a94e-61dec752186e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:46:04');
INSERT INTO `sys_user_opt` VALUES (1655997554753568, 'c7b074b3-29c6-4b7f-b2fe-7531ca812014', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:46:08');
INSERT INTO `sys_user_opt` VALUES (1655997554753600, '05425e2d-fcba-463c-94ac-60e3b5eaa7cf', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/126', '{permissionId=126}', 'yes', '2025-01-08 16:46:08');
INSERT INTO `sys_user_opt` VALUES (1655997592502304, 'f73ef424-515f-4df5-8176-e683e4a802de', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":126,\"parentId\":7,\"menuName\":\"参数配置\",\"menuPath\":\"config\",\"menuUrl\":\"/system/config/index\",\"permissions\":\"system:config:list\",\"menuType\":\"Menu\",\"icon\":\"swagger\",\"sort\":4}', 'yes', '2025-01-08 16:46:27');
INSERT INTO `sys_user_opt` VALUES (1655997594599456, '590b397e-de23-4172-91f7-86167e280f5d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:46:27');
INSERT INTO `sys_user_opt` VALUES (1655997594599488, '43c72925-d675-4081-8e88-e6c892b3577e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/126', '{permissionId=126}', 'yes', '2025-01-08 16:46:27');
INSERT INTO `sys_user_opt` VALUES (1655997594599520, '3d2ca370-c624-4738-8bb2-00dea7cb5c8d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:46:27');
INSERT INTO `sys_user_opt` VALUES (1655997598793760, '2ca6cb25-4687-475b-983e-034ace398d7e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:46:30');
INSERT INTO `sys_user_opt` VALUES (1655997598793792, 'f6d25cb0-f887-49ef-8b47-c71ad1ec7d4a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/127', '{permissionId=127}', 'yes', '2025-01-08 16:46:30');
INSERT INTO `sys_user_opt` VALUES (1655997611376672, 'e818968e-7331-4413-ba90-2061242d7272', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":127,\"parentId\":7,\"menuName\":\"文件管理\",\"menuPath\":\"file\",\"menuUrl\":\"/system/file/index\",\"permissions\":\"system:file:list\",\"menuType\":\"Menu\",\"icon\":\"upload\",\"sort\":5}', 'yes', '2025-01-08 16:46:35');
INSERT INTO `sys_user_opt` VALUES (1655997611376704, 'f6bbbd09-5f86-4f0f-8ed9-cdb6a9f5374d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:46:35');
INSERT INTO `sys_user_opt` VALUES (1655997611376736, 'b8a2ad42-b6fa-4243-b9de-bdf3744642a2', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/127', '{permissionId=127}', 'yes', '2025-01-08 16:46:36');
INSERT INTO `sys_user_opt` VALUES (1655997611376768, '7b1c95d7-3ddf-44bd-81a3-9ed79379dff9', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:46:36');
INSERT INTO `sys_user_opt` VALUES (1655997640736800, '8fd5d123-a3f3-4ef4-91b8-9bee953c60eb', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:46:49');
INSERT INTO `sys_user_opt` VALUES (1655997640736832, '0e82bb4c-8194-45a5-8d5d-00850de77b7c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/128', '{permissionId=128}', 'yes', '2025-01-08 16:46:50');
INSERT INTO `sys_user_opt` VALUES (1655997655416864, '135db4c9-c32e-45b3-bb04-6dd8b2e67188', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":128,\"parentId\":7,\"menuName\":\"日志管理\",\"menuPath\":\"log\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Menu\",\"icon\":\"log\",\"sort\":6}', 'yes', '2025-01-08 16:46:57');
INSERT INTO `sys_user_opt` VALUES (1655997657514016, '75a028f0-8f84-4539-8d02-96fd6be8dc6c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:46:57');
INSERT INTO `sys_user_opt` VALUES (1655997657514048, 'b6edbff6-e028-43a4-8510-39c267fd8603', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/128', '{permissionId=128}', 'yes', '2025-01-08 16:46:57');
INSERT INTO `sys_user_opt` VALUES (1655997657514080, '044ab844-9829-4293-b13d-6cc556bc044f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:46:57');
INSERT INTO `sys_user_opt` VALUES (1655997663805472, 'ebdd8849-23e0-4468-9a5f-edc77a605555', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:47:01');
INSERT INTO `sys_user_opt` VALUES (1655997663805504, '433135e2-cb0f-4b42-bc56-a5dbc309fff1', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/200', '{permissionId=200}', 'yes', '2025-01-08 16:47:01');
INSERT INTO `sys_user_opt` VALUES (1655997703651360, '9d74478d-8c54-449a-bed0-c2eb59b0632b', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":200,\"parentId\":128,\"menuName\":\"登录日志\",\"menuPath\":\"login_log\",\"menuUrl\":\"/system/login_log/index\",\"permissions\":\"system:login_log:list\",\"menuType\":\"Menu\",\"icon\":\"404\",\"sort\":1}', 'yes', '2025-01-08 16:47:19');
INSERT INTO `sys_user_opt` VALUES (1655997703651392, '0c8f558e-0048-4b98-8d17-1106031f3c97', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:47:19');
INSERT INTO `sys_user_opt` VALUES (1655997703651424, 'e5323700-aad0-493e-ac68-7fbd273d802e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/200', '{permissionId=200}', 'yes', '2025-01-08 16:47:19');
INSERT INTO `sys_user_opt` VALUES (1655997703651456, '7da633ab-36eb-4024-8ec2-31e6805cc8df', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:47:20');
INSERT INTO `sys_user_opt` VALUES (1655997705748512, '250057bd-50be-4854-97dd-46f5175f541b', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:47:21');
INSERT INTO `sys_user_opt` VALUES (1655997707845664, '2cb5d76c-ed09-47d2-a607-70ff717c0754', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/201', '{permissionId=201}', 'yes', '2025-01-08 16:47:21');
INSERT INTO `sys_user_opt` VALUES (1655997714137120, '0d871bed-dbc2-40e3-9c16-be34422b565e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":201,\"parentId\":128,\"menuName\":\"操作日志\",\"menuPath\":\"opt_log\",\"menuUrl\":\"/system/opt_log/index\",\"permissions\":\"system:opt_log:list\",\"menuType\":\"Menu\",\"icon\":\"bug\",\"sort\":2}', 'yes', '2025-01-08 16:47:25');
INSERT INTO `sys_user_opt` VALUES (1655997714137152, 'bace749c-ac14-4059-8676-db2fac65b768', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:47:25');
INSERT INTO `sys_user_opt` VALUES (1655997714137184, '30f0aa30-ea35-4154-95d8-932fb62d3da8', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/201', '{permissionId=201}', 'yes', '2025-01-08 16:47:25');
INSERT INTO `sys_user_opt` VALUES (1655997716234272, 'e6bb1811-4565-49ec-b049-dac08831469a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:47:25');
INSERT INTO `sys_user_opt` VALUES (1655997718331424, 'be40b734-e1ba-47e1-859c-11765dd851dc', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:47:27');
INSERT INTO `sys_user_opt` VALUES (1655997718331456, '30325a3c-a05c-4fc0-9b20-6674af90f23f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/129', '{permissionId=129}', 'yes', '2025-01-08 16:47:27');
INSERT INTO `sys_user_opt` VALUES (1655997722525728, 'd3ecac22-fb41-42d4-8ade-75f09605fdca', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:47:29');
INSERT INTO `sys_user_opt` VALUES (1655997722525760, 'f5e80cfa-cf45-473c-bbf2-3882e7956c36', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/129', '{permissionId=129}', 'yes', '2025-01-08 16:47:29');
INSERT INTO `sys_user_opt` VALUES (1655997739302944, '6dfb35c8-cccd-4e41-a6c7-d15382c7a5c2', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:47:37');
INSERT INTO `sys_user_opt` VALUES (1655997739302976, '31ee60cc-a304-4641-a656-c645263ca1ab', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/129', '{permissionId=129}', 'yes', '2025-01-08 16:47:37');
INSERT INTO `sys_user_opt` VALUES (1655997762371616, 'b265db2c-6874-4507-981c-188f51bf32d0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":129,\"parentId\":7,\"menuName\":\"站内信\",\"menuPath\":\"notice\",\"menuUrl\":\"/system/notice/index\",\"permissions\":\"system:notice:list\",\"menuType\":\"Menu\",\"icon\":\"email\",\"sort\":7}', 'yes', '2025-01-08 16:47:48');
INSERT INTO `sys_user_opt` VALUES (1655997764468768, '386e3b86-83dc-45d5-9968-fa5b183e8354', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:47:48');
INSERT INTO `sys_user_opt` VALUES (1655997764468800, '61725d48-2444-453c-a11b-09776e8070c8', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/129', '{permissionId=129}', 'yes', '2025-01-08 16:47:48');
INSERT INTO `sys_user_opt` VALUES (1655997764468832, 'b4c89220-38e3-4139-8557-7a7c8c0817fb', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:47:48');
INSERT INTO `sys_user_opt` VALUES (1655997768663072, 'b2f1c8cf-5ba1-4dcb-ac00-a68f9a2a3f6d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:47:50');
INSERT INTO `sys_user_opt` VALUES (1655997768663104, 'a3386b11-46a0-47d9-9945-4a8cc780e280', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:47:50');
INSERT INTO `sys_user_opt` VALUES (1655997768663136, '5c923aae-23f4-4bb1-90a1-d8ff62c71513', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:47:50');
INSERT INTO `sys_user_opt` VALUES (1655997768663168, '5870b8dd-7d66-41cf-bf10-741f51b90675', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:47:51');
INSERT INTO `sys_user_opt` VALUES (1655997833674784, '64366b45-2e76-464c-b61c-b25a118c29a6', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:48:21');
INSERT INTO `sys_user_opt` VALUES (1655997837869088, '4ddbe3b8-46a5-424a-b834-accf753c4049', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 16:48:24');
INSERT INTO `sys_user_opt` VALUES (1655997837869120, '6e2c17e4-b66c-4392-870c-d468cabd9539', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1655841207877664', '{id=1655841207877664}', 'yes', '2025-01-08 16:48:24');
INSERT INTO `sys_user_opt` VALUES (1655997856743456, '8cc84b6f-33b5-4f79-992d-357346ed84f0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 16:48:32');
INSERT INTO `sys_user_opt` VALUES (1655997858840640, 'b3e90657-12f8-4188-9797-c8d833b070aa', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1655841207877664,\"username\":\"zhl\",\"nickname\":\"仲寒露\",\"sex\":\"female\",\"avatarId\":1655621436833824,\"phone\":\"15312665707\",\"roleList\":[\" test-\"]}', 'yes', '2025-01-08 16:48:33');
INSERT INTO `sys_user_opt` VALUES (1655997858840672, '45609168-be4f-45d0-ab21-5dd4b4144fa2', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 16:48:33');
INSERT INTO `sys_user_opt` VALUES (1655997858840704, 'dbb3b21e-691d-4088-bc5b-efc6cdd47fbc', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1655841207877664', '{id=1655841207877664}', 'yes', '2025-01-08 16:48:33');
INSERT INTO `sys_user_opt` VALUES (1655997858840736, '3176f568-d49e-47fa-a922-a27afedf46df', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:48:34');
INSERT INTO `sys_user_opt` VALUES (1655997860937760, '75f5ddee-516f-427e-9dcd-da0907730c6e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 16:48:35');
INSERT INTO `sys_user_opt` VALUES (1655997860937792, '55b234c9-bdaf-43d9-b439-47633ab8f574', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1655855212658720', '{id=1655855212658720}', 'yes', '2025-01-08 16:48:35');
INSERT INTO `sys_user_opt` VALUES (1655997884006432, '70a2723b-e95e-4cdb-aa6c-03dad26d1295', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 16:48:46');
INSERT INTO `sys_user_opt` VALUES (1655997886103584, '58419ac2-8cf2-4813-97e1-a4f7bec5a133', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1655855212658720,\"username\":\"zhl·1\",\"nickname\":\"仲寒露\",\"sex\":\"unknown\",\"avatarId\":1655633315102752,\"phone\":\"15312665707\",\"roleList\":[]}', 'yes', '2025-01-08 16:48:47');
INSERT INTO `sys_user_opt` VALUES (1655997886103616, 'de6550b6-7ed3-4397-885b-063874f58895', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 16:48:47');
INSERT INTO `sys_user_opt` VALUES (1655997886103648, '24779427-45a2-4c47-b187-0445f2dc7255', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1655855212658720', '{id=1655855212658720}', 'yes', '2025-01-08 16:48:47');
INSERT INTO `sys_user_opt` VALUES (1655997886103680, '0af9c60f-2363-4041-8a03-23dc272d05b5', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:48:47');
INSERT INTO `sys_user_opt` VALUES (1655998043389984, '990cd6f0-5a1d-44a8-87d0-e9ffe1796ae2', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:50:01');
INSERT INTO `sys_user_opt` VALUES (1655998045487136, 'e649b084-f742-4bdb-9f7f-bef55ada926f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:50:03');
INSERT INTO `sys_user_opt` VALUES (1655998215356448, '0594e81a-a84e-4c9e-91cc-eb0df3a7a799', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:51:24');
INSERT INTO `sys_user_opt` VALUES (1655998221647904, 'a11db310-dba6-43de-9b8c-3af40aa9ee45', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:51:26');
INSERT INTO `sys_user_opt` VALUES (1655998223745056, 'c2587df5-95d5-447d-b4f7-3bade13f7122', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:51:27');
INSERT INTO `sys_user_opt` VALUES (1655998257299488, '0eb67606-e9a5-4479-8b04-0390c95df007', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:51:44');
INSERT INTO `sys_user_opt` VALUES (1655998271979552, 'df2e8fbd-391e-4840-84bf-6f831efa6900', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:51:51');
INSERT INTO `sys_user_opt` VALUES (1655998271979584, '3a185b23-4fab-4cb4-b034-d9cac50524ca', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:51:51');
INSERT INTO `sys_user_opt` VALUES (1655998271979616, 'f5eaf003-ef93-4444-84e0-4470fa1a68aa', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:51:51');
INSERT INTO `sys_user_opt` VALUES (1655998307631136, '94165774-fef2-46fa-ac05-c60a07ea16de', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:52:08');
INSERT INTO `sys_user_opt` VALUES (1655998309728288, 'be448a4e-7b01-4773-8495-cfa065d5b173', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:52:08');
INSERT INTO `sys_user_opt` VALUES (1655998309728320, 'b935b13a-dae0-4c2b-8bdb-6e6a384358d2', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:52:08');
INSERT INTO `sys_user_opt` VALUES (1655998320214048, 'd67bbdbd-8df7-44a2-8155-fa1bd38884a6', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 16:52:13');
INSERT INTO `sys_user_opt` VALUES (1655998766907424, '8c43cba6-0774-4fa5-9e15-618864b9fa63', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 16:55:47');
INSERT INTO `sys_user_opt` VALUES (1655999045828640, '3ee5bbcd-fa06-4ea4-b73b-e7c921a264d3', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:57:59');
INSERT INTO `sys_user_opt` VALUES (1655999056314400, '7557b4c4-78d2-40c6-8a39-df68e297792a', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:58:05');
INSERT INTO `sys_user_opt` VALUES (1655999056314432, '747af5a2-31ef-4e41-8b59-0daa2f8c62fc', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 16:58:05');
INSERT INTO `sys_user_opt` VALUES (1655999070994464, 'bdef2011-94c0-4ad2-bc2a-95f0c4f9e10b', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":1,\"parentId\":null,\"menuName\":\"机构管理\",\"menuPath\":\"org\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"dashboard\",\"sort\":1}', 'yes', '2025-01-08 16:58:11');
INSERT INTO `sys_user_opt` VALUES (1655999070994496, '45866230-d2b1-4118-9474-c1003c810b93', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:58:11');
INSERT INTO `sys_user_opt` VALUES (1655999070994528, '3443dfd5-4703-41ca-9fdc-ec96638d6927', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 16:58:12');
INSERT INTO `sys_user_opt` VALUES (1655999070994560, 'd5f6e4cf-0fa8-498b-920a-8845a9bb63e0', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:58:12');
INSERT INTO `sys_user_opt` VALUES (1655999075188768, '4cd83199-5fd1-4906-89e6-afe4611c673e', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:58:14');
INSERT INTO `sys_user_opt` VALUES (1655999075188800, '5085d586-494b-416a-9329-f88cad14df06', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/2', '{permissionId=2}', 'yes', '2025-01-08 16:58:14');
INSERT INTO `sys_user_opt` VALUES (1655999138103328, '375fee76-c105-4265-a3df-fedefa563554', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":2,\"parentId\":null,\"menuName\":\"课程管理\",\"menuPath\":\"course\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"documentation\",\"sort\":2}', 'yes', '2025-01-08 16:58:44');
INSERT INTO `sys_user_opt` VALUES (1655999140200480, 'cadbeb42-e6e9-46fd-94b1-bada2a877140', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:58:44');
INSERT INTO `sys_user_opt` VALUES (1655999140200512, '2fd609b9-d878-476f-9cc8-81a27e1916ea', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/2', '{permissionId=2}', 'yes', '2025-01-08 16:58:44');
INSERT INTO `sys_user_opt` VALUES (1655999140200544, '49c9ad2a-4e52-462f-8e57-0b0b13f194cb', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:58:44');
INSERT INTO `sys_user_opt` VALUES (1655999148589088, '443409d6-b23f-43d7-9146-8fbedaa75bf6', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:58:48');
INSERT INTO `sys_user_opt` VALUES (1655999148589120, '0b04450e-8cb5-4add-b69a-296018046c37', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/5', '{permissionId=5}', 'yes', '2025-01-08 16:58:48');
INSERT INTO `sys_user_opt` VALUES (1655999169560608, 'e99cb829-b68c-42d9-8012-39f0cc29ac0e', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":5,\"parentId\":null,\"menuName\":\"学生端管理\",\"menuPath\":\"student\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"peoples\",\"sort\":5}', 'yes', '2025-01-08 16:58:59');
INSERT INTO `sys_user_opt` VALUES (1655999171657760, 'a58295e7-686d-46c6-8bfa-f24065e7034a', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:58:59');
INSERT INTO `sys_user_opt` VALUES (1655999171657792, 'dae7eb26-17d8-4280-90c5-129498906cc1', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/5', '{permissionId=5}', 'yes', '2025-01-08 16:58:59');
INSERT INTO `sys_user_opt` VALUES (1655999171657824, '0101c995-b781-40cd-a1ce-55021bdfa8f7', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:58:59');
INSERT INTO `sys_user_opt` VALUES (1655999175852064, '0a199e9f-a850-460e-9b36-5ba6c9eb52d2', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:59:01');
INSERT INTO `sys_user_opt` VALUES (1655999175852096, '9c7a78a4-b844-4f01-b072-5f3a762f5a24', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/6', '{permissionId=6}', 'yes', '2025-01-08 16:59:01');
INSERT INTO `sys_user_opt` VALUES (1655999230378016, '76f56b7d-2ef7-46db-80dd-b1ec60a36b57', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":6,\"parentId\":null,\"menuName\":\"运营管理\",\"menuPath\":\"operate\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"dashboard\",\"sort\":6}', 'yes', '2025-01-08 16:59:27');
INSERT INTO `sys_user_opt` VALUES (1655999230378048, 'c8c0a9ec-0eb9-4ef8-b226-932009b8daff', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:59:27');
INSERT INTO `sys_user_opt` VALUES (1655999230378080, 'af533531-c9f9-414d-a661-c6af11b0550f', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/6', '{permissionId=6}', 'yes', '2025-01-08 16:59:27');
INSERT INTO `sys_user_opt` VALUES (1655999230378112, '9703a265-4dc5-42d9-8b4c-2a04f1ee4cde', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:59:28');
INSERT INTO `sys_user_opt` VALUES (1655999242960928, 'd3b38758-d5e1-4a7f-b3e2-24f40fa5ab2b', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:59:34');
INSERT INTO `sys_user_opt` VALUES (1655999242960960, '241de39a-6ca4-49dc-8b6b-ab4152fbb8a2', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 16:59:34');
INSERT INTO `sys_user_opt` VALUES (1655999255543840, 'ad6f9bf5-2426-4adb-96da-c960d1def7b3', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":1,\"parentId\":null,\"menuName\":\"机构管理\",\"menuPath\":\"org\",\"menuUrl\":\"\",\"permissions\":\"\",\"menuType\":\"Directory\",\"icon\":\"table\",\"sort\":1}', 'yes', '2025-01-08 16:59:40');
INSERT INTO `sys_user_opt` VALUES (1655999255543872, 'dc7ac21f-cc02-413c-8f88-3b9b4c8fbfcb', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 16:59:40');
INSERT INTO `sys_user_opt` VALUES (1655999255543904, 'd3257203-83c6-4d5f-986c-9c05916508f5', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1', '{permissionId=1}', 'yes', '2025-01-08 16:59:40');
INSERT INTO `sys_user_opt` VALUES (1655999255543936, 'ee6dc194-e6f9-43e9-a0ae-b63db479b868', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:59:40');
INSERT INTO `sys_user_opt` VALUES (1655999259738144, 'c4f34707-5757-4aa6-b213-48f214102978', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 16:59:42');
INSERT INTO `sys_user_opt` VALUES (1655999259738176, '403ba6d5-c574-49da-99bf-849b23105427', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:59:42');
INSERT INTO `sys_user_opt` VALUES (1655999259738208, 'afd81e9b-101a-4a7c-b115-6488442593f6', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 16:59:42');
INSERT INTO `sys_user_opt` VALUES (1655999261835296, '9874d843-78a7-476c-bb58-5ededca45285', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 16:59:42');
INSERT INTO `sys_user_opt` VALUES (1655999297486880, 'b923ecb1-02ff-40df-b797-6a2efb4df21b', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:00:00');
INSERT INTO `sys_user_opt` VALUES (1655999299584032, 'dba5071e-b3a6-4653-88b2-3e20ca93f415', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/123', '{permissionId=123}', 'yes', '2025-01-08 17:00:00');
INSERT INTO `sys_user_opt` VALUES (1655999356207136, 'd918fe5c-5f36-4fb5-a867-a0494639523e', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":123,\"parentId\":7,\"menuName\":\"用户管理\",\"menuPath\":\"user\",\"menuUrl\":\"/system/user/index\",\"permissions\":\"system:user:list\",\"menuType\":\"Menu\",\"icon\":\"people\",\"sort\":1}', 'yes', '2025-01-08 17:00:27');
INSERT INTO `sys_user_opt` VALUES (1655999356207168, 'dfd97dd8-7bf8-4f2c-a586-e80348f1d951', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:00:27');
INSERT INTO `sys_user_opt` VALUES (1655999356207200, '64f1c677-f4a8-4a92-bf2c-b0fd06ef2eae', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/123', '{permissionId=123}', 'yes', '2025-01-08 17:00:27');
INSERT INTO `sys_user_opt` VALUES (1655999356207232, '8f82a8c8-6df2-4bc7-9102-c23e71056825', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:00:28');
INSERT INTO `sys_user_opt` VALUES (1655999364595744, '0cdc1a16-7419-46f1-ba10-e2d3b32a08ac', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:00:31');
INSERT INTO `sys_user_opt` VALUES (1655999364595776, 'ab649ff4-849f-4856-ad48-926a88ced1c0', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/124', '{permissionId=124}', 'yes', '2025-01-08 17:00:31');
INSERT INTO `sys_user_opt` VALUES (1655999402344480, '13b77728-9016-4dd6-91dc-9c9e118fa9c8', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":124,\"parentId\":7,\"menuName\":\"角色管理\",\"menuPath\":\"role\",\"menuUrl\":\"/system/role/index\",\"permissions\":\"system:role:list\",\"menuType\":\"Menu\",\"icon\":\"validCode\",\"sort\":2}', 'yes', '2025-01-08 17:00:50');
INSERT INTO `sys_user_opt` VALUES (1655999402344512, '464f4ef6-4fac-4e4b-9832-b0c95766e55c', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:00:50');
INSERT INTO `sys_user_opt` VALUES (1655999402344544, '0e617c3e-6f74-4baf-96fd-eedeefb8d33a', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/124', '{permissionId=124}', 'yes', '2025-01-08 17:00:50');
INSERT INTO `sys_user_opt` VALUES (1655999404441632, '7891b458-a373-4db7-8392-48aa5bc3f573', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:00:50');
INSERT INTO `sys_user_opt` VALUES (1655999417024544, '0a14bb37-5fb6-4dab-a1a5-a7d7fe02ad35', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:00:57');
INSERT INTO `sys_user_opt` VALUES (1655999417024576, 'c0734d89-dadc-4131-9a10-382fa4501801', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/129', '{permissionId=129}', 'yes', '2025-01-08 17:00:57');
INSERT INTO `sys_user_opt` VALUES (1655999580602400, '3452884e-b42f-4bd7-a509-16c7c0c4e432', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":129,\"parentId\":7,\"menuName\":\"站内信\",\"menuPath\":\"notice\",\"menuUrl\":\"/system/notice/index\",\"permissions\":\"system:notice:list\",\"menuType\":\"Menu\",\"icon\":\"date\",\"sort\":7}', 'yes', '2025-01-08 17:02:15');
INSERT INTO `sys_user_opt` VALUES (1655999580602432, 'f7f4a695-179d-4022-8623-de0126812db9', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:02:15');
INSERT INTO `sys_user_opt` VALUES (1655999580602464, '0c90baf2-a08a-4c33-bbe6-8f630b8ba661', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/129', '{permissionId=129}', 'yes', '2025-01-08 17:02:15');
INSERT INTO `sys_user_opt` VALUES (1655999582699552, '764ba70b-2ddc-4739-b8e4-225f0381c4a9', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:02:15');
INSERT INTO `sys_user_opt` VALUES (1655999584796704, '1728012e-f759-4924-96a8-a1d35ccc52a5', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 17:02:16');
INSERT INTO `sys_user_opt` VALUES (1655999584796736, 'a9983442-6fb0-4815-989a-0dcf28a929f3', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 17:02:16');
INSERT INTO `sys_user_opt` VALUES (1655999584796768, 'ca53b28d-8e41-45e6-a414-fc8c2b4b63ce', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 17:02:16');
INSERT INTO `sys_user_opt` VALUES (1655999584796800, 'd1c47db0-2fcf-4659-8148-84c6eb109dcd', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:02:17');
INSERT INTO `sys_user_opt` VALUES (1655999612059680, '45fc6d55-3958-4734-bb57-3461afb85f56', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:02:29');
INSERT INTO `sys_user_opt` VALUES (1655999612059712, '77c57ef3-3013-4839-a175-289cabbf50d3', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/124', '{permissionId=124}', 'yes', '2025-01-08 17:02:29');
INSERT INTO `sys_user_opt` VALUES (1655999800803360, '423370cf-157e-4f8f-b608-9391bdc71cbb', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":124,\"parentId\":7,\"menuName\":\"角色管理\",\"menuPath\":\"role\",\"menuUrl\":\"/system/role/index\",\"permissions\":\"system:role:list\",\"menuType\":\"Menu\",\"icon\":\"component\",\"sort\":2}', 'yes', '2025-01-08 17:03:59');
INSERT INTO `sys_user_opt` VALUES (1655999800803392, 'd174ae8f-c792-4bad-9688-4c0598a479fe', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:03:59');
INSERT INTO `sys_user_opt` VALUES (1655999800803424, '5259c2a6-e177-4a14-9247-25cf6acab066', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/124', '{permissionId=124}', 'yes', '2025-01-08 17:03:59');
INSERT INTO `sys_user_opt` VALUES (1655999800803456, '51016ae4-da07-47bc-bf98-e3430a3ad517', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:04:00');
INSERT INTO `sys_user_opt` VALUES (1655999802900512, '46e5b5ca-5524-46e0-8189-9413ede490ed', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 17:04:01');
INSERT INTO `sys_user_opt` VALUES (1655999802900544, 'd4ecb93c-1295-45b2-a5a2-fbbcbffed01e', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 17:04:01');
INSERT INTO `sys_user_opt` VALUES (1655999802900576, '84ff952e-5cca-4b69-95af-55763070289e', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 17:04:01');
INSERT INTO `sys_user_opt` VALUES (1655999804997664, 'ab0ff2b9-99c1-4227-be37-a4eecd0a63bb', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:04:01');
INSERT INTO `sys_user_opt` VALUES (1656000004227104, 'f2e4f9b1-dd13-4a67-9504-d1a76d9265d0', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 17:05:36');
INSERT INTO `sys_user_opt` VALUES (1656000014712864, 'd1f6fc15-d75a-4d75-b095-830bd798ac99', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 17:05:41');
INSERT INTO `sys_user_opt` VALUES (1656000037781536, 'be375801-028e-4314-9107-d7ac740e298c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 17:05:52');
INSERT INTO `sys_user_opt` VALUES (1656000037781600, '50afcb00-2c69-4ff5-a635-b5cdf2b74f29', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 17:05:52');
INSERT INTO `sys_user_opt` VALUES (1656000037781632, 'db8f839c-a6f6-43b3-96b7-f6205d2d1352', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 17:05:52');
INSERT INTO `sys_user_opt` VALUES (1656000048267296, '9f1a24b9-a7eb-4c9e-8c90-7415d924530c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:05:57');
INSERT INTO `sys_user_opt` VALUES (1656000052461600, '82410b29-4ddf-49f2-8ba2-a7e8faffa423', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 17:06:00');
INSERT INTO `sys_user_opt` VALUES (1656000065044512, '10d0c670-d895-42f4-94f7-519ae7d9be6d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:06:06');
INSERT INTO `sys_user_opt` VALUES (1656000071335968, '7b59ff66-27ac-4f00-ad44-3fba450bbd99', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:06:08');
INSERT INTO `sys_user_opt` VALUES (1656000071336000, '7a315ccb-72c6-470e-8f81-21b6be987f9e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2025-01-08 17:06:08');
INSERT INTO `sys_user_opt` VALUES (1656000104891552, '54bc4cf6-64ec-4721-b474-f626a0ca4c2d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1648724665172000,\"roleName\":\"系统管理人员\",\"roleCode\":\"sys-manager\",\"authPermissionIdList\":[7,123,124,125,126,127,128,129,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,200,201,1021,1022,1023,1024,1025,1026,1027]}', 'yes', '2025-01-08 17:06:24');
INSERT INTO `sys_user_opt` VALUES (1656000104891584, '6cd7d239-3cd3-48d2-b7cc-22d4fe7b10e7', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 17:06:25');
INSERT INTO `sys_user_opt` VALUES (1656000113279008, 'ee10124d-b581-4284-a10e-31dfbe3b95d0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 17:06:28');
INSERT INTO `sys_user_opt` VALUES (1656000121667616, '8ca2bbdd-abb4-458b-90bc-a3b8bf3ff226', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 17:06:33');
INSERT INTO `sys_user_opt` VALUES (1656000121667648, '9c468c9d-768e-4bad-9b5f-72b5da93a642', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1651450646102112', '{id=1651450646102112}', 'yes', '2025-01-08 17:06:33');
INSERT INTO `sys_user_opt` VALUES (1656000134250560, 'b9336fdc-d583-49bd-a3d4-03c593f2bd03', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1651450646102112,\"username\":\"zhonghanlu\",\"nickname\":\"仲寒露\",\"sex\":\"male\",\"avatarId\":1655995432435744,\"phone\":\"15312665707\",\"roleList\":[\"sys-manager\"]}', 'yes', '2025-01-08 17:06:39');
INSERT INTO `sys_user_opt` VALUES (1656000134250592, 'f41bcac1-c0e9-44a6-b0a3-fd9af35a85cb', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 17:06:39');
INSERT INTO `sys_user_opt` VALUES (1656000134250624, '47c7acd1-e232-4e66-8a37-53d5a60f4c49', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1651450646102112', '{id=1651450646102112}', 'yes', '2025-01-08 17:06:39');
INSERT INTO `sys_user_opt` VALUES (1656000134250656, 'aca2d161-6d76-4cb3-a4b2-835d4902bee7', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 17:06:39');
INSERT INTO `sys_user_opt` VALUES (1656000138444832, '9be46cc3-fec6-4f7b-a48a-b89731097498', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-08 17:06:40');
INSERT INTO `sys_user_opt` VALUES (1656000138444864, '57baf81b-2385-45a8-8e0f-08189dcc83b0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1651450646102112', '{id=1651450646102112}', 'yes', '2025-01-08 17:06:41');
INSERT INTO `sys_user_opt` VALUES (1656000165707808, 'c43dc60b-7b30-4943-afe1-bddedfd8b378', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 17:06:54');
INSERT INTO `sys_user_opt` VALUES (1656000165707872, '2d57fec0-d9b2-40fe-a910-49201f38d519', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 17:06:54');
INSERT INTO `sys_user_opt` VALUES (1656000165707904, '1d106791-72bf-4a58-801d-bf8858a4d552', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 17:06:54');
INSERT INTO `sys_user_opt` VALUES (1656000176193568, '43e9da89-1fb0-4fe1-9e4f-1f659db7869c', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 17:06:58');
INSERT INTO `sys_user_opt` VALUES (1656000184582176, '49501e18-e078-4f2b-92e6-49770ca3ac22', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 17:07:02');
INSERT INTO `sys_user_opt` VALUES (1656000190873632, '66fc9c17-ff27-4aa5-a3a8-de0cc5c10d7e', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:07:05');
INSERT INTO `sys_user_opt` VALUES (1656000213942304, '246a1f3f-77b2-4b01-abef-0f313a7912d7', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-08 17:07:16');
INSERT INTO `sys_user_opt` VALUES (1656000220233760, '77daf10c-b1b0-4f0a-b52c-533a2af9c0fa', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:07:19');
INSERT INTO `sys_user_opt` VALUES (1656000228622368, 'bda59205-84ad-42bd-bca6-be3b344ff699', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:07:24');
INSERT INTO `sys_user_opt` VALUES (1656000234913824, 'e69a128a-f31e-48e1-91fd-60bc32f496ee', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:07:27');
INSERT INTO `sys_user_opt` VALUES (1656000266371104, 'eab79cd0-83a5-41df-9015-dbae71bd510e', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 17:07:41');
INSERT INTO `sys_user_opt` VALUES (1656000276856864, '6a5cd21a-e12a-4378-8b0c-f5aad515471d', 'zhonghanlu', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 17:07:46');
INSERT INTO `sys_user_opt` VALUES (1656000327188544, 'fa5d67b7-d74f-4a67-af7b-0e865a4fd00a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-08 17:08:10');
INSERT INTO `sys_user_opt` VALUES (1656000327188576, '82903c02-5e41-40ce-981f-c4546f726a41', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 17:08:10');
INSERT INTO `sys_user_opt` VALUES (1656000327188608, '1a5e0bf0-cde2-4422-980b-b3391429849e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-08 17:08:10');
INSERT INTO `sys_user_opt` VALUES (1656000350257184, 'fad973cd-d958-457e-b681-c3b1ed35c31f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 17:08:21');
INSERT INTO `sys_user_opt` VALUES (1656000352354336, '60a36ab6-6c6b-4b87-bb6e-5484569329a4', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 17:08:22');
INSERT INTO `sys_user_opt` VALUES (1656000354451488, 'd66afb35-af54-472c-b02e-a7d8c5e421b5', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:08:24');
INSERT INTO `sys_user_opt` VALUES (1656000358645792, 'd52f7ecf-de5b-479f-8fe5-6a057c783058', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-08 17:08:26');
INSERT INTO `sys_user_opt` VALUES (1656000360742944, 'b3dfd387-a955-4356-b8ba-ea99b8c4be3e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:08:27');
INSERT INTO `sys_user_opt` VALUES (1656000367034400, '1984475d-6f11-4465-abce-06a7ad9b94a8', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 17:08:30');
INSERT INTO `sys_user_opt` VALUES (1656000373325856, '5854cd7b-c602-4c28-934f-c440eb599b81', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 17:08:32');
INSERT INTO `sys_user_opt` VALUES (1656000555778080, '7f4c6c01-dad0-4fb6-a67a-0caa0e1d708d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 17:09:59');
INSERT INTO `sys_user_opt` VALUES (1656000562069536, 'd02bc739-781a-4c31-8f87-b7fc9b52c1f6', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:10:03');
INSERT INTO `sys_user_opt` VALUES (1656000566263840, 'e6467fe7-577a-4205-b048-31bc161ba8c3', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:10:05');
INSERT INTO `sys_user_opt` VALUES (1656000570458144, '344ebb5b-4d71-4a65-ad08-8a1ceedcde74', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:10:06');
INSERT INTO `sys_user_opt` VALUES (1656000601915456, '9ea2e00d-f38b-449a-9ec1-75c4e56ccfd5', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-08 17:10:22');
INSERT INTO `sys_user_opt` VALUES (1656000601915488, 'ac330fb4-2e5b-49b2-943a-02bbb07f47c4', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:10:22');
INSERT INTO `sys_user_opt` VALUES (1656000608206880, '44497e82-2f77-43cb-bfef-7d8792806a35', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:10:25');
INSERT INTO `sys_user_opt` VALUES (1656000610304032, 'a7f6acfe-dbe9-42a6-bdeb-c6cdc8f8a697', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:10:26');
INSERT INTO `sys_user_opt` VALUES (1656000637567008, 'a83697b8-33fa-4e9a-b187-08efc3d21aee', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/del/1656000601915424', '{id=1656000601915424}', 'yes', '2025-01-08 17:10:39');
INSERT INTO `sys_user_opt` VALUES (1656000639664160, '08c706e8-3762-4aed-8386-be85a49cccea', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:10:39');
INSERT INTO `sys_user_opt` VALUES (1656000673218592, '5f330900-d0dc-4d4b-8efa-b01a6737d0c0', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:10:55');
INSERT INTO `sys_user_opt` VALUES (1656000742424608, 'fcda9dfc-c40d-4092-89ae-ab6a27e12785', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-08 17:11:29');
INSERT INTO `sys_user_opt` VALUES (1656000746618912, '4c242d4e-f25b-43a6-9201-5434227883fa', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-08 17:11:30');
INSERT INTO `sys_user_opt` VALUES (1656000750813216, '86b87fa5-c6b2-470f-b0b2-13c61e2d170f', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-08 17:11:32');
INSERT INTO `sys_user_opt` VALUES (1656000752910368, '96535de1-947f-47b6-af1b-d9be4082d540', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:11:33');
INSERT INTO `sys_user_opt` VALUES (1656000755007520, '0367896a-62a6-4e32-a1c6-ace2b2ba86ca', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-08 17:11:34');
INSERT INTO `sys_user_opt` VALUES (1656000755007552, 'b9aed17f-c93e-4f1c-8937-7768afe6ae18', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-08 17:11:35');
INSERT INTO `sys_user_opt` VALUES (1656000801144864, 'd4219b0d-8072-4e03-a5df-a950042141d1', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-08 17:11:56');
INSERT INTO `sys_user_opt` VALUES (1656000809533472, 'fa61b6b6-24da-46c5-a234-e88c89898c2c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:12:00');
INSERT INTO `sys_user_opt` VALUES (1656000809533504, '7adb801d-2b92-4640-b87c-72164f10c39c', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/123', '{permissionId=123}', 'yes', '2025-01-08 17:12:00');
INSERT INTO `sys_user_opt` VALUES (1656000899711008, '8f733041-d1a0-451b-b904-1bad196fbb4d', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:12:44');
INSERT INTO `sys_user_opt` VALUES (1656000899711040, 'a10eeed8-f20b-43e0-bbc2-ff4cd3b12c9a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/123', '{permissionId=123}', 'yes', '2025-01-08 17:12:44');
INSERT INTO `sys_user_opt` VALUES (1656000973111328, '5ac1fefa-2923-4f0b-80c9-4c34a316cf60', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:13:19');
INSERT INTO `sys_user_opt` VALUES (1656000973111360, 'ae826a8c-7682-4743-bae6-789e3891108a', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/123', '{permissionId=123}', 'yes', '2025-01-08 17:13:19');
INSERT INTO `sys_user_opt` VALUES (1656000996180000, '772a2139-3b59-4d10-8243-22466cd941a1', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-08 17:13:29');
INSERT INTO `sys_user_opt` VALUES (1656000996180032, '267ab433-74f3-4bff-9209-567b3ad50c5e', 'admin', '117.62.168.182', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/123', '{permissionId=123}', 'yes', '2025-01-08 17:13:29');

SET FOREIGN_KEY_CHECKS = 1;
