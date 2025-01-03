/*
 Navicat Premium Dump SQL

 Source Server         : A启智编梦-mysql
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : 124.220.79.217:3306
 Source Schema         : emode

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 16/12/2024 20:25:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` bigint NOT NULL COMMENT '主键id',
  `parent_id` bigint DEFAULT NULL COMMENT '上级ID，一级菜单为0',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `menu_path` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单path',
  `menu_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单URL',
  `permissions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:list,sys:user:save)',
  `menu_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型：目录、按钮、菜单',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `sort` int DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识1未删除-1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统权限详细记录表';

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1, 0, '机构管理', 'org', '', '', 'Directory', NULL, 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (2, 0, '课程管理', 'course', '', '', 'Directory', NULL, 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (3, 0, '售课核销', 'sale', '', '', 'Directory', NULL, 3, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (4, 0, '家校一体', 'school', '', '', 'Directory', NULL, 4, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (5, 0, '学生端管理', 'student', '', '', 'Directory', NULL, 5, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (6, 0, '运营管理', 'operate', '', '', 'Directory', NULL, 6, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (7, 0, '系统管理', 'system', '', '', 'Directory', NULL, 7, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (100, 1, '学生管理', 'stu', '/org/stu/index', 'org:stu:list', 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (101, 1, '家长管理', 'patriarch', '/org/patriarch/index', 'org:patriarch:list', 'Menu', NULL, 2, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (102, 1, '教师管理', 'tea', '/org/tea/index', 'org:tea:list', 'Menu', NULL, 3, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (103, 1, '教室管理', 'room', '/org/room/index', 'org:room:list', 'Menu', NULL, 4, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (104, 1, '校区管理', 'school', '/org/school/index', 'org:school:list', 'Menu', NULL, 5, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (105, 2, '待核销管理', 'class', '/course/class/index', 'course:class:list', 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (106, 2, '班级管理', 'grade', '/course/grade/index', 'course:grade:list', 'Menu', NULL, 2, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (107, 2, '课表管理', 'schedule', '/course/schedule/index', 'course:schedule:list', 'Menu', NULL, 3, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (108, 2, '上课管理', 'up', '/course/up/index', 'course:up:list', 'Menu', NULL, 4, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (109, 2, '缺课管理', 'lack', '/course/lack/index', 'course:lack:list', 'Menu', NULL, 5, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (110, 2, '补课管理', 'repair', '/course/repair/index', 'course:repair:list', 'Menu', NULL, 6, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (111, 3, '商品管理', 'product', '/sale/product/index', 'sale:product:list', 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (112, 3, '订单管理', 'order', '/sale/order/index', 'sale:order:list', 'Menu', NULL, 2, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (113, 3, '线下收款', 'patch', '/sale/patch/index', 'sale:patcht:list', 'Menu', NULL, 3, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (114, 4, '家教老师', NULL, NULL, NULL, 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (115, 4, '家教申请', NULL, NULL, NULL, 'Menu', NULL, 2, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (116, 4, '安心到家', NULL, NULL, NULL, 'Menu', NULL, 3, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (117, 5, '待更新', NULL, NULL, NULL, 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (118, 6, '总账管理', NULL, NULL, NULL, 'Menu', NULL, 1, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (119, 6, '数据报表', NULL, NULL, NULL, 'Menu', NULL, 2, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (120, 6, '海报管理', NULL, NULL, NULL, 'Menu', NULL, 3, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (121, 6, '拉新管理', NULL, NULL, NULL, 'Menu', NULL, 4, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (122, 6, '意见箱管理', NULL, NULL, NULL, 'Menu', NULL, 5, -1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (123, 7, '用户管理', 'user', '/system/user/index', 'system:user:list', 'Menu', NULL, 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (124, 7, '角色管理', 'role', '/system/role/index', 'system:role:list', 'Menu', NULL, 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (125, 7, '权限管理', 'auth', '/system/auth/index', 'system:auth:list', 'Menu', NULL, 3, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (126, 7, '参数配置', 'config', '/system/config/index', 'system:config:list', 'Menu', NULL, 4, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (127, 7, '文件管理', 'file', '/system/file/index', 'system:file:list', 'Menu', NULL, 5, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (128, 7, '日志管理', 'log', '', '', 'Menu', NULL, 6, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (129, 7, '站内信', 'notice', '/system/notice/index', 'system:notice:list', 'Menu', NULL, 7, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (200, 128, '登录日志', 'login_log', '/system/login_log/index', 'system:login_log:list', 'Menu', NULL, 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (201, 128, '操作日志', 'opt_log', '/system/opt_log/index', 'system:opt_log:list', 'Menu', NULL, 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1000, 123, '用户查询', NULL, NULL, 'system:user:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1001, 123, '用户新增', NULL, NULL, 'system:user:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1002, 123, '用户修改', NULL, NULL, 'system:user:edit', 'Button', '#', 3, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1003, 124, '角色查询', NULL, NULL, 'system:role:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1004, 124, '角色新增', NULL, NULL, 'system:role:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1005, 124, '角色修改', NULL, NULL, 'system:role:edit', 'Button', '#', 3, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1006, 124, '角色删除', NULL, NULL, 'system:role:remove', 'Button', '#', 4, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1007, 125, '权限查询', NULL, NULL, 'system:auth:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1008, 125, '权限新增', NULL, NULL, 'system:auth:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1009, 125, '权限修改', NULL, NULL, 'system:auth:edit', 'Button', '#', 3, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1010, 125, '权限删除', NULL, NULL, 'system:auth:remove', 'Button', '#', 4, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1011, 126, '参数查询', NULL, NULL, 'system:config:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1012, 126, '参数新增', NULL, NULL, 'system:config:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1013, 126, '参数修改', NULL, NULL, 'system:config:edit', 'Button', '#', 3, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1014, 126, '参数删除', NULL, NULL, 'system:config:remove', 'Button', '#', 4, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1015, 127, '文件查询', NULL, NULL, 'system:file:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1016, 127, '文件新增', NULL, NULL, 'system:file:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1017, 127, '文件预览', NULL, NULL, 'system:file:detail', 'Button', '#', 3, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1018, 127, '文件删除', NULL, NULL, 'system:file:remove', 'Button', '#', 4, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1021, 200, '登录日志查询', NULL, NULL, 'system:login_log:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1022, 200, '登录日志查看', NULL, NULL, 'system:login_log:detail', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1023, 201, '操作日志查询', NULL, NULL, 'system:opt_log:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1024, 201, '操作日志查看', NULL, NULL, 'system:opt_log:detail', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1025, 129, '站内信查询', NULL, NULL, 'system:notice:query', 'Button', '#', 1, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1026, 129, '站内信发送', NULL, NULL, 'system:notice:add', 'Button', '#', 2, 1);
INSERT INTO `auth_permission` (`id`, `parent_id`, `menu_name`, `menu_path`, `menu_url`, `permissions`, `menu_type`, `icon`, `sort`, `del_flag`) VALUES (1027, 129, '站内信查看', NULL, NULL, 'system:notice:detail', 'Button', '#', 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `id` bigint NOT NULL COMMENT '主键id',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名',
  `role_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色码值',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识1未删除-1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of auth_role
-- ----------------------------
BEGIN;
INSERT INTO `auth_role` (`id`, `role_name`, `role_code`, `del_flag`) VALUES (1648724665172000, '系统管理人员', 'sys', 1);
INSERT INTO `auth_role` (`id`, `role_name`, `role_code`, `del_flag`) VALUES (1648726439362592, '系统管理人员2', 'sys2', 1);
INSERT INTO `auth_role` (`id`, `role_name`, `role_code`, `del_flag`) VALUES (1648728391811104, '系统管理人员3', 'sys4', 1);
INSERT INTO `auth_role` (`id`, `role_name`, `role_code`, `del_flag`) VALUES (1648732317679648, '系统管理人员5', 'sys5', 1);
COMMIT;

-- ----------------------------
-- Table structure for auth_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_permission`;
CREATE TABLE `auth_role_permission` (
  `id` bigint NOT NULL COMMENT '主键id',
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `permission_id` bigint DEFAULT NULL COMMENT '权限详情id',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识1未删除-1已经删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_role_id` (`role_id`) USING BTREE COMMENT '关联'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色权限关联表';

-- ----------------------------
-- Records of auth_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648724665172032, 1648724665172000, 7, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648726439362624, 1648726439362592, 1, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648726439362656, 1648726439362592, 2, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648726439362688, 1648726439362592, 3, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908256, 1648728391811104, 123, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908288, 1648728391811104, 124, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908320, 1648728391811104, 125, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908352, 1648728391811104, 126, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908384, 1648728391811104, 127, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908416, 1648728391811104, 128, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908448, 1648728391811104, 129, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908480, 1648728391811104, 200, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908512, 1648728391811104, 201, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908544, 1648728391811104, 1000, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908576, 1648728391811104, 1001, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908608, 1648728391811104, 1002, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908640, 1648728391811104, 1003, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908672, 1648728391811104, 1004, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908704, 1648728391811104, 1005, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908736, 1648728391811104, 1006, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908768, 1648728391811104, 1007, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908800, 1648728391811104, 1008, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908832, 1648728391811104, 1009, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908864, 1648728391811104, 1010, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908896, 1648728391811104, 1011, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908928, 1648728391811104, 1012, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908960, 1648728391811104, 1013, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393908992, 1648728391811104, 1014, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909024, 1648728391811104, 1015, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909056, 1648728391811104, 1016, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909088, 1648728391811104, 1017, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909120, 1648728391811104, 1018, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909152, 1648728391811104, 1021, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909184, 1648728391811104, 1022, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909216, 1648728391811104, 1023, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909248, 1648728391811104, 1024, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909280, 1648728391811104, 1025, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909312, 1648728391811104, 1026, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648728393909344, 1648728391811104, 1027, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1648732317679680, 1648732317679648, 1007, 1);
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` bigint NOT NULL COMMENT '用户表主键',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别 male：男 female：女',
  `avatar` bigint DEFAULT NULL COMMENT '头像id',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户类型，pc mini manager',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` tinyint(1) DEFAULT '1' COMMENT '删除标识1未删除-1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统用户表';

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` (`id`, `username`, `password`, `nickname`, `sex`, `avatar`, `phone`, `user_type`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, 'admin', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '超级管理员', 'male', 2, '15312665707', 'manager', '2024-07-14 01:06:28', NULL, '2024-07-17 21:42:06', 1623626795188256, 1);
INSERT INTO `auth_user` (`id`, `username`, `password`, `nickname`, `sex`, `avatar`, `phone`, `user_type`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1648725644541984, 'sysUser', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '系统管理测试用户', 'male', 4, '153126666666', 'manager', '2024-11-29 13:34:11', 1, '2024-11-29 13:34:11', 1648725644541984, 1);
INSERT INTO `auth_user` (`id`, `username`, `password`, `nickname`, `sex`, `avatar`, `phone`, `user_type`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1651450646102112, 'zhonghanlu', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '仲寒露', 'male', 0, 'zhonhanlu', 'manager', '2024-12-14 14:30:34', 1, '2024-12-14 14:30:34', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role` (
  `id` bigint NOT NULL COMMENT '主键id',
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识1未删除 -1 已删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE COMMENT '关联'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色关联表';

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
BEGIN;
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648725961211936, 1648724665172000, '系统管理人员', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648726504374304, 1648724665172000, '系统管理人员', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648726504374336, 1648726439362592, '系统管理人员2', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648728528125984, 1648724665172000, '系统管理人员', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648728528126016, 1648726439362592, '系统管理人员2', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648728528126048, 1648728391811104, '系统管理人员3', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648729373278240, 1648724665172000, '系统管理人员', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648729373278272, 1648726439362592, '系统管理人员2', 1648725644541984, 'sysUser', -1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648732351234080, 1648724665172000, '系统管理人员', 1648725644541984, 'sysUser', 1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648732351234112, 1648726439362592, '系统管理人员2', 1648725644541984, 'sysUser', 1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1648732351234144, 1648732317679648, '系统管理人员5', 1648725644541984, 'sysUser', 1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1651451306704928, 1648728391811104, '系统管理人员3', 1651450646102112, 'zhonhanlu', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_class_grade
-- ----------------------------
DROP TABLE IF EXISTS `bm_class_grade`;
CREATE TABLE `bm_class_grade` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `class_grade_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `tea_id` bigint DEFAULT NULL COMMENT '教师 id',
  `tea_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师名称',
  `classroom_id` bigint DEFAULT NULL COMMENT '教室 id',
  `classroom_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室名',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='班级数据表';

-- ----------------------------
-- Records of bm_class_grade
-- ----------------------------
BEGIN;
INSERT INTO `bm_class_grade` (`id`, `class_grade_name`, `tea_id`, `tea_name`, `classroom_id`, `classroom_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1647456745947168, 'python一班', 1646200895832096, '丽丽', 1646195281756192, '东教室', NULL, '2024-11-22 13:29:53', NULL, '2024-11-22 13:29:53', 1);
INSERT INTO `bm_class_grade` (`id`, `class_grade_name`, `tea_id`, `tea_name`, `classroom_id`, `classroom_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1648021840330784, '班级啊啊啊啊', 1646204593111072, '小王啊', 1646195281756192, '西教室', 1, '2024-11-25 16:20:52', 1, '2024-11-25 16:20:52', -1);
COMMIT;

-- ----------------------------
-- Table structure for bm_classroom
-- ----------------------------
DROP TABLE IF EXISTS `bm_classroom`;
CREATE TABLE `bm_classroom` (
  `id` bigint NOT NULL COMMENT '主键id',
  `room_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室名称',
  `room_status` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室状态',
  `room_size` int DEFAULT NULL COMMENT '教室空间（最大容纳人数）',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='教室表';

-- ----------------------------
-- Records of bm_classroom
-- ----------------------------
BEGIN;
INSERT INTO `bm_classroom` (`id`, `room_name`, `room_status`, `room_size`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1646195281756192, '西教室', 'enable', 22, NULL, '2024-11-15 14:24:40', 1, '2024-11-15 15:49:31', 1);
INSERT INTO `bm_classroom` (`id`, `room_name`, `room_status`, `room_size`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1646205509566496, '一个教室', 'enable', 0, 1, '2024-11-15 15:45:57', 1, '2024-11-15 15:45:57', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_classroom_intention
-- ----------------------------
DROP TABLE IF EXISTS `bm_classroom_intention`;
CREATE TABLE `bm_classroom_intention` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `classroom_id` bigint DEFAULT NULL COMMENT '教室 id',
  `classroom_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室名称',
  `intention_cur_time` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '意向上课时间',
  `class_grade_id` bigint DEFAULT NULL COMMENT '班级 id',
  `class_grade_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `create_by` bigint DEFAULT NULL COMMENT '创建人 id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人 id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='教室与意向时间关系表';

-- ----------------------------
-- Records of bm_classroom_intention
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bm_course
-- ----------------------------
DROP TABLE IF EXISTS `bm_course`;
CREATE TABLE `bm_course` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `course_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型',
  `course_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `week_one` int DEFAULT NULL COMMENT '周几',
  `course_start_time` datetime DEFAULT NULL COMMENT '课程开始时间',
  `course_end_time` datetime DEFAULT NULL COMMENT '课程结束时间',
  `class_person_size` int DEFAULT NULL COMMENT '班级人数',
  `class_room_id` bigint DEFAULT NULL COMMENT '教室 id',
  `class_room_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室名称',
  `tea_id` bigint DEFAULT NULL COMMENT '教师 id',
  `tea_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师名称',
  `class_grade_id` bigint DEFAULT NULL COMMENT '班级 id',
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程表';

-- ----------------------------
-- Records of bm_course
-- ----------------------------
BEGIN;
INSERT INTO `bm_course` (`id`, `course_type`, `course_name`, `week_one`, `course_start_time`, `course_end_time`, `class_person_size`, `class_room_id`, `class_room_name`, `tea_id`, `tea_name`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1647459832954912, 'scratch', 'scratch一班2次课', 7, '2024-11-22 13:59:29', '2024-11-22 13:59:29', 6, 1646195281756192, '西教室', 1646200895832096, '丽丽', 1647456745947168, 'python一班', NULL, '2024-11-22 13:54:26', NULL, '2024-11-22 13:54:26', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_course_schedule
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_schedule`;
CREATE TABLE `bm_course_schedule` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `cur_schedule_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课表名称',
  `cur_schedule_star_time` datetime DEFAULT NULL COMMENT '课表开始时间',
  `cur_schedule_end_time` datetime DEFAULT NULL COMMENT '课表结束时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课表主表';

-- ----------------------------
-- Records of bm_course_schedule
-- ----------------------------
BEGIN;
INSERT INTO `bm_course_schedule` (`id`, `cur_schedule_name`, `cur_schedule_star_time`, `cur_schedule_end_time`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1647478726197280, '24年11月10-24年11月21日', '2024-11-22 16:32:27', '2024-11-22 16:32:27', NULL, '2024-11-22 16:24:34', NULL, '2024-11-22 16:24:34', -1);
COMMIT;

-- ----------------------------
-- Table structure for bm_course_schedule_item
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_schedule_item`;
CREATE TABLE `bm_course_schedule_item` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `range_start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `range_end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `cur_id` bigint DEFAULT NULL COMMENT '课程 id',
  `cur_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `cur_schedule_id` bigint DEFAULT NULL COMMENT '课表主体 id',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课表内容主体表';

-- ----------------------------
-- Records of bm_course_schedule_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bm_handler_class
-- ----------------------------
DROP TABLE IF EXISTS `bm_handler_class`;
CREATE TABLE `bm_handler_class` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `stu_id` bigint DEFAULT NULL COMMENT '学生 id',
  `stu_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `intention_cur_time` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '意向上课时间',
  `consume_time` datetime DEFAULT NULL COMMENT '核销时间',
  `cur_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='待分班数据表';

-- ----------------------------
-- Records of bm_handler_class
-- ----------------------------
BEGIN;
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651460565631136, 1651455106744352, '王思思', 'saturday_up_one', '2024-12-14 15:49:23', 'python', 1651450646102112, '2024-12-14 15:49:23', 1651450646102112, '2024-12-14 15:49:23', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475497353376, 1651473914003488, '王丝丝', 'saturday_up_one', '2024-12-14 17:48:04', 'python', 1651450646102112, '2024-12-14 17:48:04', 1651450646102112, '2024-12-14 17:48:04', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475612696736, 1651473941266464, '仲丝丝', 'saturday_up_one', '2024-12-14 17:48:59', 'python', 1651450646102112, '2024-12-14 17:48:59', 1651450646102112, '2024-12-14 17:48:59', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475673514144, 1651473970626592, '仲嘻嘻', 'saturday_down_one', '2024-12-14 17:49:27', 'python', 1651450646102112, '2024-12-14 17:49:27', 1651450646102112, '2024-12-14 17:49:27', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475698679968, 1651473997889568, '王嘻嘻', 'saturday_up_one', '2024-12-14 17:49:40', 'python', 1651450646102112, '2024-12-14 17:49:40', 1651450646102112, '2024-12-14 17:49:40', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475728040032, 1651474025152544, '王哈哈', 'saturday_down_one', '2024-12-14 17:49:53', 'python', 1651450646102112, '2024-12-14 17:49:53', 1651450646102112, '2024-12-14 17:49:53', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475755303072, 1651474046124064, '李哈哈', 'saturday_down_one', '2024-12-14 17:50:06', 'python', 1651450646102112, '2024-12-14 17:50:06', 1651450646102112, '2024-12-14 17:50:06', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475793051808, 1651474071289888, '李哦哦', 'saturday_up_one', '2024-12-14 17:50:24', 'python', 1651450646102112, '2024-12-14 17:50:24', 1651450646102112, '2024-12-14 17:50:24', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475816120480, 1651474115330080, '藏哦哦', 'saturday_up_one', '2024-12-14 17:50:36', 'python', 1651450646102112, '2024-12-14 17:50:36', 1651450646102112, '2024-12-14 17:50:36', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475843383456, 1651474167758880, '齐哦哦', 'saturday_up_one', '2024-12-14 17:50:48', 'python', 1651450646102112, '2024-12-14 17:50:48', 1651450646102112, '2024-12-14 17:50:48', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_handler_class_order_relation
-- ----------------------------
DROP TABLE IF EXISTS `bm_handler_class_order_relation`;
CREATE TABLE `bm_handler_class_order_relation` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `handler_class_id` bigint DEFAULT NULL COMMENT '核销人（待分班）id',
  `cur_order_id` bigint DEFAULT NULL COMMENT '课程订单 id',
  `cur_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='待分班与课程订单关联表';

-- ----------------------------
-- Records of bm_handler_class_order_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bm_idea
-- ----------------------------
DROP TABLE IF EXISTS `bm_idea`;
CREATE TABLE `bm_idea` (
  `id` bigint NOT NULL COMMENT '主键id',
  `idea_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '意见类型',
  `idea_content` text COLLATE utf8mb4_general_ci COMMENT '意见内容',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='意见箱表';

-- ----------------------------
-- Records of bm_idea
-- ----------------------------
BEGIN;
INSERT INTO `bm_idea` (`id`, `idea_type`, `idea_content`, `create_by`, `update_by`, `create_time`, `update_time`, `del_flag`) VALUES (1650593535885344, 'course', '这个软件做得太好了！！！', NULL, NULL, '2024-12-09 20:58:51', '2024-12-09 20:58:51', -1);
COMMIT;

-- ----------------------------
-- Table structure for bm_lack_course
-- ----------------------------
DROP TABLE IF EXISTS `bm_lack_course`;
CREATE TABLE `bm_lack_course` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `class_grade_id` bigint DEFAULT NULL COMMENT '班级id',
  `class_grade_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `cur_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型',
  `cur_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `cur_id` bigint DEFAULT NULL COMMENT '课程 id',
  `week_one` int DEFAULT NULL COMMENT '周几',
  `lack_start_time` datetime DEFAULT NULL COMMENT '缺课开始时间',
  `lack_end_time` datetime DEFAULT NULL COMMENT '缺课结束时间',
  `stu_id` bigint DEFAULT NULL COMMENT '学生姓名 id',
  `stu_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `lack_status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态（未补课，已补课）',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='缺课数据表';

-- ----------------------------
-- Records of bm_lack_course
-- ----------------------------
BEGIN;
INSERT INTO `bm_lack_course` (`id`, `class_grade_id`, `class_grade_name`, `cur_type`, `cur_name`, `cur_id`, `week_one`, `lack_start_time`, `lack_end_time`, `stu_id`, `stu_name`, `lack_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1647483771944992, 1647456745947168, 'python一班', 'python', 'scratch一班2次课', 1647459832954912, 6, '2024-11-22 17:10:32', '2024-11-22 17:10:32', 1646206692360224, '宁宁', 'yes', NULL, '2024-11-22 17:04:40', NULL, '2024-11-22 17:04:40', -1);
COMMIT;

-- ----------------------------
-- Table structure for bm_order
-- ----------------------------
DROP TABLE IF EXISTS `bm_order`;
CREATE TABLE `bm_order` (
  `id` bigint NOT NULL COMMENT '主键id',
  `order_create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `order_price` int DEFAULT NULL COMMENT '订单总金额',
  `order_reduced_price` int DEFAULT NULL COMMENT '订单优惠价格',
  `order_actual_price` int DEFAULT NULL COMMENT '订单实际支付价格',
  `order_product_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单商品名称',
  `order_consume` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单核销人',
  `order_status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单状态',
  `order_phone` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单人手机号',
  `order_consumed_id` bigint DEFAULT NULL COMMENT '被核销人（此处指学生）',
  `order_consumed_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单表';

-- ----------------------------
-- Records of bm_order
-- ----------------------------
BEGIN;
INSERT INTO `bm_order` (`id`, `order_create_time`, `order_price`, `order_reduced_price`, `order_actual_price`, `order_product_name`, `order_consume`, `order_status`, `order_phone`, `order_consumed_id`, `order_consumed_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1649505279672352, '2024-12-03 20:50:10', 49999900, 45999900, 45999900, 'python50次课，python30次课', '小明', 'consume_paid', '15312665707', 1, '小王', NULL, '2024-12-03 20:50:10', NULL, '2024-12-03 20:52:30', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_org
-- ----------------------------
DROP TABLE IF EXISTS `bm_org`;
CREATE TABLE `bm_org` (
  `id` bigint NOT NULL COMMENT '机构id',
  `org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构名称',
  `org_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构地址',
  `org_longitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构经度',
  `org_latitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构纬度',
  `org_described` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '机构描述',
  `org_status` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构状态yes no 是否地图注册',
  `org_head_a` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构负责人 A',
  `org_head_b` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构负责人B',
  `org_business_license` bigint DEFAULT NULL COMMENT '机构营业执照',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1未删除，-1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='机构表';

-- ----------------------------
-- Records of bm_org
-- ----------------------------
BEGIN;
INSERT INTO `bm_org` (`id`, `org_name`, `org_address`, `org_longitude`, `org_latitude`, `org_described`, `org_status`, `org_head_a`, `org_head_b`, `org_business_license`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1645826375942176, '启智编梦', '江苏省徐州市睢宁县', '11111', '22222', '是俩位怀揣着梦想的少年打造的少儿编程机构', 'yes', '仲寒露', '王斯亮', 2, '2024-11-13 13:32:52', NULL, '2024-11-13 13:43:11', NULL, 1);
INSERT INTO `bm_org` (`id`, `org_name`, `org_address`, `org_longitude`, `org_latitude`, `org_described`, `org_status`, `org_head_a`, `org_head_b`, `org_business_license`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1645831847411744, '测试机构', '111', '1', '1', '1', 'no', '1', '1', 2, '2024-11-13 14:16:22', 1, '2024-11-13 14:16:22', 1, 1);
INSERT INTO `bm_org` (`id`, `org_name`, `org_address`, `org_longitude`, `org_latitude`, `org_described`, `org_status`, `org_head_a`, `org_head_b`, `org_business_license`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1646203615838240, '极客晨星', '江苏省徐州市睢宁县中央大街', '11111.1111', '22222.2222', '我是一个机构我有很大的实力', 'no', '王', '嘿嘿', 3, '2024-11-15 15:30:54', 1, '2024-11-15 15:30:54', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_pat_stu_relation
-- ----------------------------
DROP TABLE IF EXISTS `bm_pat_stu_relation`;
CREATE TABLE `bm_pat_stu_relation` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `patriarch_id` bigint DEFAULT NULL COMMENT '家长 id',
  `patriarch_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家长姓名',
  `student_id` bigint DEFAULT NULL COMMENT '学生 id',
  `student_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='家长和学生关联信息表';

-- ----------------------------
-- Records of bm_pat_stu_relation
-- ----------------------------
BEGIN;
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651455106744384, 1651452290269216, '宁小小', 1651455106744352, '王思思', 1651450646102112, '2024-12-14 15:06:01', 1651450646102112, '2024-12-14 15:06:01', 1);
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473916100640, 1651473515544608, '宁大大', 1651473914003488, '王丝丝', 1651450646102112, '2024-12-14 17:35:29', 1651450646102112, '2024-12-14 17:35:29', 1);
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473941266496, 1651473549099040, '仲小小', 1651473941266464, '仲丝丝', 1651450646102112, '2024-12-14 17:35:41', 1651450646102112, '2024-12-14 17:35:41', 1);
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473970626624, 1651473563779104, '仲大大', 1651473970626592, '仲嘻嘻', 1651450646102112, '2024-12-14 17:35:56', 1651450646102112, '2024-12-14 17:35:56', 1);
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473997889600, 1651473580556320, '王大大', 1651473997889568, '王嘻嘻', 1651450646102112, '2024-12-14 17:36:08', 1651450646102112, '2024-12-14 17:36:08', 1);
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474025152576, 1651473593139232, '王小小', 1651474025152544, '王哈哈', 1651450646102112, '2024-12-14 17:36:21', 1651450646102112, '2024-12-14 17:36:21', 1);
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474046124096, 1651473653956640, '李小小', 1651474046124064, '李哈哈', 1651450646102112, '2024-12-14 17:36:32', 1651450646102112, '2024-12-14 17:36:32', 1);
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474071289920, 1651473666539552, '李大大', 1651474071289888, '李哦哦', 1651450646102112, '2024-12-14 17:36:43', 1651450646102112, '2024-12-14 17:36:43', 1);
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474115330112, 1651473704288288, '张大大', 1651474115330080, '藏哦哦', 1651450646102112, '2024-12-14 17:37:05', 1651450646102112, '2024-12-14 17:37:05', 1);
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474167758912, 1651473718968352, '张小小', 1651474167758880, '齐哦哦', 1651450646102112, '2024-12-14 17:37:30', 1651450646102112, '2024-12-14 17:37:30', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_patch_order
-- ----------------------------
DROP TABLE IF EXISTS `bm_patch_order`;
CREATE TABLE `bm_patch_order` (
  `id` bigint NOT NULL COMMENT '主键id',
  `patch_create_time` datetime DEFAULT NULL COMMENT '补单时间',
  `patch_price` int DEFAULT NULL COMMENT '补单总计价格',
  `patch_reduced_price` int DEFAULT NULL COMMENT '补单优惠价格',
  `patch_actual_price` int DEFAULT NULL COMMENT '补单实际价格',
  `patch_product_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补单商品名称',
  `patch_consume` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补单核销人',
  `patch_phone` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补单人手机号',
  `patch_status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补单状态',
  `patch_handler_id` bigint DEFAULT NULL COMMENT '补单操作人id',
  `patch_handler_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补单操作人姓名',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='补单（便于线下收款）';

-- ----------------------------
-- Records of bm_patch_order
-- ----------------------------
BEGIN;
INSERT INTO `bm_patch_order` (`id`, `patch_create_time`, `patch_price`, `patch_reduced_price`, `patch_actual_price`, `patch_product_name`, `patch_consume`, `patch_phone`, `patch_status`, `patch_handler_id`, `patch_handler_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651460565631040, '2024-12-14 15:49:23', 49990000, 4000000, 45990000, 'python课程 50 课时', '王思思', '1531266570', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 15:49:23', 1651450646102112, '2024-12-14 15:49:23', 1);
INSERT INTO `bm_patch_order` (`id`, `patch_create_time`, `patch_price`, `patch_reduced_price`, `patch_actual_price`, `patch_product_name`, `patch_consume`, `patch_phone`, `patch_status`, `patch_handler_id`, `patch_handler_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475497353280, '2024-12-14 17:48:04', 49990000, 4000000, 45990000, 'python课程 50 课时', '王丝丝', '15312665708', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:48:04', 1651450646102112, '2024-12-14 17:48:04', 1);
INSERT INTO `bm_patch_order` (`id`, `patch_create_time`, `patch_price`, `patch_reduced_price`, `patch_actual_price`, `patch_product_name`, `patch_consume`, `patch_phone`, `patch_status`, `patch_handler_id`, `patch_handler_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475612696640, '2024-12-14 17:48:59', 49990000, 4000000, 45990000, 'python课程 50 课时', '仲丝丝', '15312665702', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:48:59', 1651450646102112, '2024-12-14 17:48:59', 1);
INSERT INTO `bm_patch_order` (`id`, `patch_create_time`, `patch_price`, `patch_reduced_price`, `patch_actual_price`, `patch_product_name`, `patch_consume`, `patch_phone`, `patch_status`, `patch_handler_id`, `patch_handler_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475673514048, '2024-12-14 17:49:27', 49990000, 4000000, 45990000, 'python课程 50 课时', '仲嘻嘻', '15311665702', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:49:27', 1651450646102112, '2024-12-14 17:49:27', 1);
INSERT INTO `bm_patch_order` (`id`, `patch_create_time`, `patch_price`, `patch_reduced_price`, `patch_actual_price`, `patch_product_name`, `patch_consume`, `patch_phone`, `patch_status`, `patch_handler_id`, `patch_handler_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475698679872, '2024-12-14 17:49:40', 49990000, 4000000, 45990000, 'python课程 50 课时', '王嘻嘻', '15331665702', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:49:40', 1651450646102112, '2024-12-14 17:49:40', 1);
INSERT INTO `bm_patch_order` (`id`, `patch_create_time`, `patch_price`, `patch_reduced_price`, `patch_actual_price`, `patch_product_name`, `patch_consume`, `patch_phone`, `patch_status`, `patch_handler_id`, `patch_handler_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475725942848, '2024-12-14 17:49:53', 49990000, 4000000, 45990000, 'python课程 50 课时', '王哈哈', '15331665402', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:49:53', 1651450646102112, '2024-12-14 17:49:53', 1);
INSERT INTO `bm_patch_order` (`id`, `patch_create_time`, `patch_price`, `patch_reduced_price`, `patch_actual_price`, `patch_product_name`, `patch_consume`, `patch_phone`, `patch_status`, `patch_handler_id`, `patch_handler_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475755302976, '2024-12-14 17:50:06', 49990000, 4000000, 45990000, 'python课程 50 课时', '李哈哈', '13331665402', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:50:06', 1651450646102112, '2024-12-14 17:50:06', 1);
INSERT INTO `bm_patch_order` (`id`, `patch_create_time`, `patch_price`, `patch_reduced_price`, `patch_actual_price`, `patch_product_name`, `patch_consume`, `patch_phone`, `patch_status`, `patch_handler_id`, `patch_handler_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475793051712, '2024-12-14 17:50:24', 49990000, 4000000, 45990000, 'python课程 50 课时', '李哦哦', '13335665402', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:50:24', 1651450646102112, '2024-12-14 17:50:24', 1);
INSERT INTO `bm_patch_order` (`id`, `patch_create_time`, `patch_price`, `patch_reduced_price`, `patch_actual_price`, `patch_product_name`, `patch_consume`, `patch_phone`, `patch_status`, `patch_handler_id`, `patch_handler_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475816120384, '2024-12-14 17:50:36', 49990000, 4000000, 45990000, 'python课程 50 课时', '藏哦哦', '13335665452', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:50:36', 1651450646102112, '2024-12-14 17:50:36', 1);
INSERT INTO `bm_patch_order` (`id`, `patch_create_time`, `patch_price`, `patch_reduced_price`, `patch_actual_price`, `patch_product_name`, `patch_consume`, `patch_phone`, `patch_status`, `patch_handler_id`, `patch_handler_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475843383360, '2024-12-14 17:50:48', 49990000, 4000000, 45990000, 'python课程 50 课时', '齐哦哦', '13335645452', 'consume_paid', 1651450646102112, 'zhonghanlu', 1651450646102112, '2024-12-14 17:50:48', 1651450646102112, '2024-12-14 17:50:48', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_patriarch
-- ----------------------------
DROP TABLE IF EXISTS `bm_patriarch`;
CREATE TABLE `bm_patriarch` (
  `id` bigint NOT NULL COMMENT '主键id',
  `pat_avatar_id` bigint DEFAULT NULL COMMENT '家长头像',
  `pat_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家长姓名',
  `pat_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家长手机号',
  `pat_wx` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家长微信',
  `pat_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家长地址',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='家长表';

-- ----------------------------
-- Records of bm_patriarch
-- ----------------------------
BEGIN;
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651452290269216, 0, '宁小小', '1531266570', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 14:43:37', 1651450646102112, '2024-12-14 14:43:37', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473515544608, 0, '宁大大', '15312665708', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:19', 1651450646102112, '2024-12-14 17:32:19', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473549099040, 0, '仲小小', '15312665702', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:35', 1651450646102112, '2024-12-14 17:32:35', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473563779104, 0, '仲大大', '15311665702', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:41', 1651450646102112, '2024-12-14 17:32:41', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473580556320, 0, '王大大', '15331665702', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:49', 1651450646102112, '2024-12-14 17:32:49', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473593139232, 0, '王小小', '15331665402', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:56', 1651450646102112, '2024-12-14 17:32:56', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473653956640, 0, '李小小', '13331665402', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:25', 1651450646102112, '2024-12-14 17:33:25', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473666539552, 0, '李大大', '13335665402', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:31', 1651450646102112, '2024-12-14 17:33:31', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473704288288, 0, '张大大', '13335665452', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:48', 1651450646102112, '2024-12-14 17:33:48', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473718968352, 0, '张小小', '13335645452', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:56', 1651450646102112, '2024-12-14 17:33:56', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_poster
-- ----------------------------
DROP TABLE IF EXISTS `bm_poster`;
CREATE TABLE `bm_poster` (
  `id` bigint NOT NULL COMMENT '主键id',
  `poster_file_id` bigint DEFAULT NULL COMMENT '图片id',
  `poster_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片地址',
  `poster_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '（线下首页推荐海报）（线下运营宣传）（小程序首页）（小程序课程）（家校一体推广）',
  `poster_status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '海报状态、使用、未使用',
  `poster_opt_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '绘画人',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='海报统一管理表';

-- ----------------------------
-- Records of bm_poster
-- ----------------------------
BEGIN;
INSERT INTO `bm_poster` (`id`, `poster_file_id`, `poster_url`, `poster_type`, `poster_status`, `poster_opt_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1650594223751200, 1, '1.jpg', 'offline_recommended', 'yes', '小李', NULL, '2024-12-09 21:04:20', NULL, '2024-12-09 21:04:20', -1);
COMMIT;

-- ----------------------------
-- Table structure for bm_product
-- ----------------------------
DROP TABLE IF EXISTS `bm_product`;
CREATE TABLE `bm_product` (
  `id` bigint NOT NULL COMMENT '主键id',
  `product_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程首页展示图片',
  `product_url_id` bigint DEFAULT NULL COMMENT '课程首页展示图片id',
  `product_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `product_hour` int DEFAULT NULL COMMENT '课程课时',
  `product_price` int DEFAULT NULL COMMENT '商品价格',
  `product_reduced_price` int DEFAULT NULL COMMENT '优惠后价格',
  `recommend_age` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '推荐年龄',
  `course_detail` text COLLATE utf8mb4_general_ci COMMENT '课程详细介绍，默认写死',
  `product_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '体验 长期 课程类型',
  `course_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程语言类型',
  `class_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授课类型，线上、线下....',
  `status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程状态',
  `class_time` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程授课区间（周末、暑假）',
  `show_status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上下架状态',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程商品表';

-- ----------------------------
-- Records of bm_product
-- ----------------------------
BEGIN;
INSERT INTO `bm_product` (`id`, `product_url`, `product_url_id`, `product_name`, `product_hour`, `product_price`, `product_reduced_price`, `recommend_age`, `course_detail`, `product_type`, `course_type`, `class_type`, `status`, `class_time`, `show_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651457789001760, '', 0, 'python课程 50 课时', 500000, 49990000, 45990000, '9-18 岁', '第一章--有趣的二进制', 'long', 'python', 'offline', 'start', '2024-12-01 - 2024-12-31', 'listing', 1651450646102112, '2024-12-14 15:27:20', 1651450646102112, '2024-12-14 15:27:20', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_pull_new
-- ----------------------------
DROP TABLE IF EXISTS `bm_pull_new`;
CREATE TABLE `bm_pull_new` (
  `id` bigint NOT NULL COMMENT '主键id',
  `source_patriarch_id` bigint DEFAULT NULL COMMENT '拉新人id',
  `source_patriarch_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '拉新人姓名',
  `invitation_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邀请码',
  `new_patriarch_id` bigint DEFAULT NULL COMMENT '被拉新人id',
  `new_patriarch_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '被拉新人姓名',
  `reward` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '奖励',
  `reason` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '原因',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='拉新统一汇总表';

-- ----------------------------
-- Records of bm_pull_new
-- ----------------------------
BEGIN;
INSERT INTO `bm_pull_new` (`id`, `source_patriarch_id`, `source_patriarch_name`, `invitation_code`, `new_patriarch_id`, `new_patriarch_name`, `reward`, `reason`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1650594901131296, 1, '张三', '11122', 2, '李四', '100', '没有原因', NULL, '2024-12-09 21:09:43', NULL, '2024-12-09 21:09:43', -1);
COMMIT;

-- ----------------------------
-- Table structure for bm_repair_course
-- ----------------------------
DROP TABLE IF EXISTS `bm_repair_course`;
CREATE TABLE `bm_repair_course` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `repair_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补课名称',
  `cur_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型',
  `week_one` int DEFAULT NULL COMMENT '周几',
  `repair_start_time` datetime DEFAULT NULL COMMENT '补课开始时间',
  `repair_end_time` datetime DEFAULT NULL COMMENT '补课结束时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='补课数据表';

-- ----------------------------
-- Records of bm_repair_course
-- ----------------------------
BEGIN;
INSERT INTO `bm_repair_course` (`id`, `repair_name`, `cur_type`, `week_one`, `repair_start_time`, `repair_end_time`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1647485726490656, 'cpp2补', 'cpp', 7, '2024-11-22 17:23:15', '2024-11-22 17:23:15', NULL, '2024-11-22 17:20:12', NULL, '2024-11-22 17:23:15', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_stu_class_hour
-- ----------------------------
DROP TABLE IF EXISTS `bm_stu_class_hour`;
CREATE TABLE `bm_stu_class_hour` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `class_hour_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课时类型',
  `class_hour` bigint DEFAULT NULL COMMENT '课时默认乘 100 计算逻辑',
  `stu_id` bigint DEFAULT NULL COMMENT '学生 id',
  `stu_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='学生与课时关系';

-- ----------------------------
-- Records of bm_stu_class_hour
-- ----------------------------
BEGIN;
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651460565631072, 'python', 500000, 1651455106744352, '王思思');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475497353312, 'python', 500000, 1651473914003488, '王丝丝');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475612696672, 'python', 500000, 1651473941266464, '仲丝丝');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475673514080, 'python', 500000, 1651473970626592, '仲嘻嘻');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475698679904, 'python', 500000, 1651473997889568, '王嘻嘻');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475728039968, 'python', 500000, 1651474025152544, '王哈哈');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475755303008, 'python', 500000, 1651474046124064, '李哈哈');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475793051744, 'python', 500000, 1651474071289888, '李哦哦');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475816120416, 'python', 500000, 1651474115330080, '藏哦哦');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475843383392, 'python', 500000, 1651474167758880, '齐哦哦');
COMMIT;

-- ----------------------------
-- Table structure for bm_student
-- ----------------------------
DROP TABLE IF EXISTS `bm_student`;
CREATE TABLE `bm_student` (
  `id` bigint NOT NULL COMMENT '主键id',
  `stu_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `stu_sex` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生性别',
  `stu_birth` datetime DEFAULT NULL COMMENT '学生生日（出生日期）',
  `stu_cur_school` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生当前学校',
  `stu_cur_grade` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生当前年级',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识-1已删除 1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='学生表';

-- ----------------------------
-- Records of bm_student
-- ----------------------------
BEGIN;
INSERT INTO `bm_student` (`id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651455106744352, '王思思', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 15:06:01', 1651450646102112, '2024-12-14 15:06:01', 1);
INSERT INTO `bm_student` (`id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473914003488, '王丝丝', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:35:29', 1651450646102112, '2024-12-14 17:35:29', 1);
INSERT INTO `bm_student` (`id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473941266464, '仲丝丝', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:35:41', 1651450646102112, '2024-12-14 17:35:41', 1);
INSERT INTO `bm_student` (`id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473970626592, '仲嘻嘻', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:35:56', 1651450646102112, '2024-12-14 17:35:56', 1);
INSERT INTO `bm_student` (`id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473997889568, '王嘻嘻', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:36:08', 1651450646102112, '2024-12-14 17:36:08', 1);
INSERT INTO `bm_student` (`id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474025152544, '王哈哈', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:36:21', 1651450646102112, '2024-12-14 17:36:21', 1);
INSERT INTO `bm_student` (`id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474046124064, '李哈哈', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:36:32', 1651450646102112, '2024-12-14 17:36:32', 1);
INSERT INTO `bm_student` (`id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474071289888, '李哦哦', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:36:43', 1651450646102112, '2024-12-14 17:36:43', 1);
INSERT INTO `bm_student` (`id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474115330080, '藏哦哦', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:37:05', 1651450646102112, '2024-12-14 17:37:05', 1);
INSERT INTO `bm_student` (`id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474167758880, '齐哦哦', 'male', '2010-10-12 00:00:00', '睢宁县实验小学', '一年级', 1651450646102112, '2024-12-14 17:37:30', 1651450646102112, '2024-12-14 17:37:30', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_student_constant
-- ----------------------------
DROP TABLE IF EXISTS `bm_student_constant`;
CREATE TABLE `bm_student_constant` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型school 学校  grade 年级 ',
  `constant_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'key 值',
  `constant_value` int DEFAULT NULL COMMENT '计算值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='学生学校与年级常量数据表';

-- ----------------------------
-- Records of bm_student_constant
-- ----------------------------
BEGIN;
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (1, 'school', '睢宁县实验小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (2, 'grade', '一年级', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_teacher
-- ----------------------------
DROP TABLE IF EXISTS `bm_teacher`;
CREATE TABLE `bm_teacher` (
  `id` bigint NOT NULL COMMENT '主键id',
  `tea_avatar_id` bigint DEFAULT NULL COMMENT '教师头像',
  `tea_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师名称',
  `sex` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师性别',
  `tea_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师手机号',
  `tea_email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师邮箱',
  `tea_org_id` bigint DEFAULT NULL COMMENT '归属机构id',
  `tea_org_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属机构名称',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='老师表';

-- ----------------------------
-- Records of bm_teacher
-- ----------------------------
BEGIN;
INSERT INTO `bm_teacher` (`id`, `tea_avatar_id`, `tea_name`, `sex`, `tea_phone`, `tea_email`, `tea_org_id`, `tea_org_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651450646102048, 0, '仲寒露', 'male', 'zhonhanlu', '1420865757@qq.com', 1645826375942176, '启智编梦', 1, '2024-12-14 14:30:34', 1, '2024-12-14 14:30:34', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_teacher_intention
-- ----------------------------
DROP TABLE IF EXISTS `bm_teacher_intention`;
CREATE TABLE `bm_teacher_intention` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `teacher_id` bigint DEFAULT NULL COMMENT '教师主键 id',
  `teacher_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师名称',
  `intention_cur_time` datetime DEFAULT NULL COMMENT '意向时间',
  `class_grade_id` int DEFAULT NULL COMMENT '班级 id',
  `class_grade_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `create_by` bigint DEFAULT NULL COMMENT '创建人 id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人 id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='教师意向时间关联表';

-- ----------------------------
-- Records of bm_teacher_intention
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bm_tutor_apply
-- ----------------------------
DROP TABLE IF EXISTS `bm_tutor_apply`;
CREATE TABLE `bm_tutor_apply` (
  `id` bigint DEFAULT NULL COMMENT '主键 id',
  `apply_stu_id` bigint DEFAULT NULL COMMENT '申请人 id',
  `apply_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请人姓名',
  `apply_subject` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请科目',
  `apply_time` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请时间',
  `apply_tutor_id` bigint DEFAULT NULL COMMENT '申请家教老师 id',
  `apply_tutor_tea_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请家教老师姓名',
  `expend_class_hour` int DEFAULT NULL COMMENT '消耗课时',
  `apply_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请地址',
  `apply_status` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请状态',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='家教申请';

-- ----------------------------
-- Records of bm_tutor_apply
-- ----------------------------
BEGIN;
INSERT INTO `bm_tutor_apply` (`id`, `apply_stu_id`, `apply_name`, `apply_subject`, `apply_time`, `apply_tutor_id`, `apply_tutor_tea_name`, `expend_class_hour`, `apply_address`, `apply_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1649822910119968, 1, '张三', 'python', '2020-02-02 -- 2024-01-01', 1646200895832096, '丽丽', 4, '江苏省南京市嘻嘻', 'apply_end', NULL, '2024-12-05 14:54:28', NULL, '2024-12-05 14:54:28', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_tutor_teacher
-- ----------------------------
DROP TABLE IF EXISTS `bm_tutor_teacher`;
CREATE TABLE `bm_tutor_teacher` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `tea_id` bigint DEFAULT NULL COMMENT '教师 id',
  `tea_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家教老师名称',
  `give_class_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授课范围 python 、 c++等',
  `leisure_time` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '空闲时间',
  `tutor_detail` text COLLATE utf8mb4_general_ci COMMENT '教师详细介绍',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='家教老师';

-- ----------------------------
-- Records of bm_tutor_teacher
-- ----------------------------
BEGIN;
INSERT INTO `bm_tutor_teacher` (`id`, `tea_id`, `tea_name`, `give_class_type`, `leisure_time`, `tutor_detail`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1649823549751328, 1, '李四', '[SCRATCH]', '2024-02-02 -- 2024-02-02', '滴滴滴滴滴滴滴滴', NULL, '2024-12-05 14:59:33', NULL, '2024-12-05 14:59:33', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_user_teacher
-- ----------------------------
DROP TABLE IF EXISTS `bm_user_teacher`;
CREATE TABLE `bm_user_teacher` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `tea_id` bigint DEFAULT NULL COMMENT '教师 id',
  `user_id` bigint DEFAULT NULL COMMENT '账户 id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='教师与系统账户关联关系表';

-- ----------------------------
-- Records of bm_user_teacher
-- ----------------------------
BEGIN;
INSERT INTO `bm_user_teacher` (`id`, `tea_id`, `user_id`) VALUES (1651450646102144, 1651450646102048, 1651450646102080);
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint NOT NULL COMMENT '主键id',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置key',
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配置实际值',
  `config_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态 yes no',
  `show_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否展示 yes no',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` tinyint(1) DEFAULT '1' COMMENT '删除标识 1未删除，-1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='全局参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`id`, `config_name`, `config_key`, `config_value`, `config_status`, `show_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1648563337560096, '初始化密码', 'init_password', '123456', 'yes', 'yes', '2024-11-28 16:04:17', 1, '2024-11-28 16:04:17', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint NOT NULL COMMENT '主键id',
  `file_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件名',
  `file_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件存储路径',
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件存储类型枚举值',
  `file_device_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件存储端',
  `bucket_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '桶名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `del_flag` tinyint(1) DEFAULT '1' COMMENT '删除标识1未删除，-1已删除 默认值1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统文件表';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` (`id`, `file_name`, `file_url`, `file_type`, `file_device_by`, `bucket_name`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1648559998894112, 'logo', 'logo.png', 'image/png', 'pc', 'e-mode-bucket', '2024-11-28 15:37:45', 1, '2024-11-28 15:37:45', 1, -1);
INSERT INTO `sys_file` (`id`, `file_name`, `file_url`, `file_type`, `file_device_by`, `bucket_name`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1648745905127456, 'logo', 'logo.png', 'image/png', 'pc', 'e-mode-bucket', '2024-11-29 16:15:13', 1648725644541984, '2024-11-29 16:15:13', 1648725644541984, -1);
COMMIT;

-- ----------------------------
-- Table structure for sys_login_opt
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_opt`;
CREATE TABLE `sys_login_opt` (
  `id` bigint NOT NULL COMMENT '主键id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户账户名',
  `opt_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作ip',
  `opt_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作地址',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浏览器类型',
  `system_os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作是否成功',
  `opt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作类型，登入，登出',
  `opt_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作结果消息',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统登入登出信息记录';

-- ----------------------------
-- Records of sys_login_opt
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643350451028000, 'admin', '36.113.145.171', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-30 21:35:59');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643350455222304, 'admin', '36.113.145.171', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-30 21:36:01');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643350484582432, 'admin', '36.113.145.171', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-30 21:36:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643350522331168, 'admin', '36.113.145.171', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-30 21:36:33');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643350612508704, 'admin', '36.113.145.171', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-30 21:37:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643351013064736, 'admin', '36.113.145.171', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-30 21:40:28');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643351107436576, 'admin', '36.113.145.171', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-30 21:41:12');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643351216488480, 'admin', '36.113.145.171', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-30 21:42:05');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643351738679328, 'admin', '36.113.145.171', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-30 21:46:14');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643442543263776, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 09:47:53');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643442560040992, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 09:48:00');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643443300335648, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 09:53:53');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643443384221728, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 09:54:34');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643443604422688, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 09:56:19');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643443864469536, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 09:58:23');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643443984007200, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 09:59:20');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643444030144544, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 09:59:42');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643444076281888, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 10:00:03');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643444105642016, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 10:00:17');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643444155973664, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 10:00:42');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643444443283488, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 10:02:58');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643444669775904, 'admin', '222.94.216.243', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-10-31 10:04:46');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801087049760, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:17:20');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801108021280, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:17:30');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801477120032, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:20:25');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801508577312, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:20:41');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801512771616, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:20:42');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801512771648, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:20:43');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801512771680, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:20:43');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801514868768, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:20:43');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801514868800, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:20:43');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801527451680, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:20:49');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801602949152, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:21:25');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801712001056, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:22:17');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801827344416, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:23:13');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801860898848, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:23:28');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801911230496, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:23:52');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1643801936396320, 'admin', '36.113.45.96', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-02 09:24:04');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644256454246432, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:36:15');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644256921911328, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:39:59');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257093877792, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:41:21');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257320370208, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:43:08');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257330855968, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:43:13');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257337147424, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:43:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257351827488, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:43:24');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257385381920, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:43:40');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257404256288, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:43:48');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257425227808, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:43:58');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257431519264, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:44:02');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257486045216, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:44:28');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257488142368, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:44:29');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257488142400, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:44:29');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257490239520, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:44:29');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257490239552, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:44:29');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257519599648, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:44:43');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257624457248, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:45:34');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257632845856, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:45:38');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257678983200, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:46:00');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257731412000, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:46:24');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257804812320, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:46:59');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644257915961376, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:47:53');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258259894304, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:50:36');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258343780384, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:51:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258368946208, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:51:29');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258675130400, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:53:55');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258731753504, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:54:21');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258769502240, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:54:40');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258803056672, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:54:55');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258805153824, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:54:56');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258805153856, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:54:56');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258805153888, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:54:57');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258834513952, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:55:11');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258836611104, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:55:11');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258836611136, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:55:11');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258836611168, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:55:12');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644258903719968, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:55:44');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644259272818720, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:58:40');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644259339927584, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:59:12');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644259390259232, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 21:59:36');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644259444785184, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:00:02');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644259524476960, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:00:39');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644259860021280, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:03:20');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644259904061472, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:03:40');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644259990044704, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:04:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644260002627616, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:04:28');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644260086513696, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:05:07');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644260487069728, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:08:19');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644260633870368, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:09:29');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644260648550432, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:09:35');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644260751310880, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:10:25');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644260837294112, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:11:05');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644261112021024, 'admin', '112.80.74.220', '中国|江苏省|南京市|联通', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-04 22:13:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644440288493600, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 21:57:14');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644440324145184, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 21:57:31');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644440370282528, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 21:57:53');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644440378671136, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 21:57:57');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644440519180320, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 21:59:05');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644441670516768, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:08:14');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644441683099680, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:08:19');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644442545029152, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:15:10');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644442603749408, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:15:39');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644442945585184, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:18:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644442964459552, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:18:30');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644443031568416, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:19:03');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644443075608608, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:19:23');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644443193049120, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:20:19');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644443220312096, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:20:32');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644443381792800, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:21:50');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644443495039008, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:22:44');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644443522301984, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:22:57');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644443654422560, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 22:23:59');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644454402326560, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:49:25');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644454482018336, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:50:03');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644454494601248, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:50:08');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644454517669920, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:50:19');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644454614138912, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:51:05');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644454651887648, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:51:24');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644454922420256, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:53:32');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644454976946208, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:53:58');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644455079706656, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:54:48');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644455304101920, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:56:35');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644455459291168, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:57:48');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644455572537376, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:58:43');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644455713046560, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-05 23:59:50');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644456308637728, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-06 00:04:33');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644456912617504, 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-06 00:09:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644626159075360, 'admin', '36.113.124.153', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-06 22:34:24');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644805532680224, 'admin', '49.91.34.15', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-07 22:19:57');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644890985332768, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 09:39:04');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644891083898912, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 09:39:51');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644891272642592, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-08 09:41:21');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644891329265728, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 09:41:47');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644891339751456, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-08 09:41:52');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644891362820128, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 09:42:04');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644897308246048, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-08 10:29:19');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644897310343200, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 10:29:20');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644903954120736, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-08 11:22:08');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644903958315040, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 11:22:10');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644904319025184, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-08 11:25:01');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644904321122336, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 11:25:02');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644905900277792, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-08 11:37:36');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644905904472128, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 11:37:37');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644906175004704, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-08 11:39:46');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644906181296160, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 11:39:49');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644906762207264, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-08 11:44:26');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644906764304448, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 11:44:27');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644906848190496, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-08 11:45:08');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644906852384800, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 11:45:10');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644907085168672, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-08 11:47:01');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1644907089362976, 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-08 11:47:02');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645527674388512, 'admin', '49.91.147.2', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-11 21:59:00');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645707947671584, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-12 21:51:41');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645708744589344, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-12 21:58:02');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645708746686496, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-12 21:58:03');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645708786532384, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-12 21:58:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645708790726720, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-12 21:58:23');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645708843155488, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-12 21:58:49');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645708847349824, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-12 21:58:50');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645709149339680, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-12 22:01:14');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645709151436832, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-12 22:01:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645831776108576, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 12', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 14:15:48');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645887765872672, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 21:40:46');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645888191594528, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 21:44:08');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645888193691680, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 21:44:10');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645889638629408, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 21:55:38');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645889640726592, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 21:55:40');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645890991292448, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 22:06:24');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645890995486752, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 22:06:25');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645891022749728, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 22:06:39');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645891026944032, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 22:06:40');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645891381362720, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 22:09:30');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645891383459872, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 22:09:31');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645891505094688, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 22:10:29');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645891507191840, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 22:10:30');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645891660283936, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 22:11:43');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645891664478240, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 22:11:44');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645892115365920, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 22:15:20');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645892117463104, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 22:15:21');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645892320886816, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 22:16:57');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645892329275456, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 22:17:01');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645892375412768, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 22:17:23');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645892385898560, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 22:17:28');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645892608196640, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-13 22:19:15');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1645892612390944, 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-13 22:19:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646203588575264, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 12', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-15 15:30:42');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646392692965408, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-16 16:33:34');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646393137561632, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-16 16:37:05');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646393164824608, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-16 16:37:18');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646393171116064, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-16 16:37:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646393508757536, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-16 16:40:02');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646393512951840, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-16 16:40:04');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646393705889824, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-16 16:41:37');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646393712181280, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-16 16:41:40');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646393789775904, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-16 16:42:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646393796067360, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-16 16:42:20');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646425721012256, 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-16 20:56:03');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646794949787680, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-18 21:50:24');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646795524407328, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-18 21:54:58');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646795752996896, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-18 21:56:47');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646795763482656, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-18 21:56:53');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646795937546272, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-18 21:58:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646795966906400, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-18 21:58:30');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646796275187744, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-18 22:00:57');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646796279382048, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-18 22:00:59');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646796591857696, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-18 22:03:28');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646796600246304, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-18 22:03:32');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646796818350112, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-18 22:05:15');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646796822544416, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-18 22:05:18');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1646973333536800, 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-19 21:28:04');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648021529952288, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-25 16:18:23');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648021534146592, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-25 16:18:26');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648021536243744, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-25 16:18:26');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648021538340896, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-25 16:18:27');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648336404742176, 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-27 10:00:48');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648385767505952, 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-27 16:33:05');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648514270494752, 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-28 09:34:21');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648543035031584, 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-28 13:22:56');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648698742276128, 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 10:00:23');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648723782271008, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 13:19:23');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648725998960672, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 13:37:00');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648728060461088, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 13:53:24');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648728538611744, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 13:57:12');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648728561680416, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 13:57:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648729385861152, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-29 14:03:55');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648729396346912, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 14:04:00');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648729778028576, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-29 14:07:02');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648729801097248, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 14:07:13');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648731483013152, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-29 14:20:35');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648731491401760, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 14:20:40');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648731602550816, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-29 14:21:33');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648731617230880, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 14:21:39');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648731690631200, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-29 14:22:15');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648731755642912, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 14:22:45');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648731883569184, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 14:23:46');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648732013592608, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 14:24:48');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648732164587552, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-29 14:26:00');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648732179267616, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 14:26:07');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648732214919200, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-11-29 14:26:24');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648732227502112, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 14:26:30');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648732368011296, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 14:27:38');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648738435072032, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 15:15:51');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648745567485984, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-11-29 16:12:32');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648745569583136, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-11-29 16:12:32');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648745575874592, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 16:12:35');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648745670246432, 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 16:13:20');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648746968383520, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 16:23:39');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648748333629472, 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 16:34:30');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648750026031136, 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 16:47:57');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1648750128791584, 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-11-29 16:48:47');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1649824644464672, 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-05 15:08:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1651449884835872, 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-14 14:24:30');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1651449920487456, 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-14 14:24:48');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1651449922584608, 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-14 14:24:48');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1651450077773856, 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-14 14:26:02');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1651450516078624, 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-14 14:29:31');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1651451900198944, 'zhonghanlu', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-14 14:40:31');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1651805442277408, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-16 13:30:13');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1651805591175200, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-16 13:31:25');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` bigint NOT NULL COMMENT '主键id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '消息标头',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '消息的内容',
  `send_id` bigint DEFAULT NULL COMMENT '消息发送者的id',
  `notice_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '消息的类型',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `message_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '消息状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识1未删除 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='站内信表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`id`, `title`, `content`, `send_id`, `notice_type`, `send_time`, `message_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1642022033162272, '测试广播', '我是内容', 1641852256124960, 'local', '2024-10-23 13:38:40', 'broadcast', '2024-10-23 13:38:40', 1641852256124960, '2024-10-23 13:38:40', 1641852256124960, 1);
INSERT INTO `sys_notice` (`id`, `title`, `content`, `send_id`, `notice_type`, `send_time`, `message_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1642022043648032, '测试广播2', '我是内容', 1641852256124960, 'local', '2024-10-23 13:38:46', 'broadcast', '2024-10-23 13:38:46', 1641852256124960, '2024-10-23 13:38:46', 1641852256124960, 1);
INSERT INTO `sys_notice` (`id`, `title`, `content`, `send_id`, `notice_type`, `send_time`, `message_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1642022425329696, '测试广播2', '我是内容', 1641852256124960, 'local', '2024-10-23 13:41:48', 'alone', '2024-10-23 13:41:48', NULL, '2024-10-23 13:41:48', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_notice`;
CREATE TABLE `sys_user_notice` (
  `id` bigint NOT NULL COMMENT '主键id',
  `notice_id` bigint DEFAULT NULL COMMENT '通知消息id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id，用于站内消息通知',
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用于手机号短信通知',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用于邮箱通知',
  `read_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否已读 yes no',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识1未删除 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='消息用户关联表';

-- ----------------------------
-- Records of sys_user_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_notice` (`id`, `notice_id`, `user_id`, `phone`, `email`, `read_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1642022425329728, 1642022425329696, 1, '', '', 'no', '2024-10-23 13:41:48', NULL, '2024-10-23 13:41:48', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_opt
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_opt`;
CREATE TABLE `sys_user_opt` (
  `id` bigint NOT NULL COMMENT '主键id',
  `request_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作唯一id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户账户名',
  `opt_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作ip',
  `opt_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作地址',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '浏览器类型',
  `system_os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作系统',
  `opt_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'get post',
  `opt_url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求地址',
  `opt_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数',
  `opt_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求状态，yes成功，no失败',
  `opt_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户操作日志记录';

-- ----------------------------
-- Records of sys_user_opt
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644454614138944, 'cd455c5e-7422-41a2-97a2-1ecb1c702884', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-05 23:51:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644454651887680, '89ef7edf-96d0-4e66-b393-29ad24d8202c', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-05 23:51:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644454922420288, '4a5b6462-465b-41c0-860e-28c18feadbd6', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-05 23:53:32');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644454976946240, 'd1578087-27c0-4f6b-98ba-2206847307dc', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-05 23:53:58');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644455079706688, '64822ff1-247b-4969-b8e6-3b09602d1ee2', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-05 23:54:48');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644455304101952, 'bb47a03b-3d8c-4819-a9af-c112020d6695', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-05 23:56:35');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644455459291200, 'daa5f676-5a43-4b6c-96b1-9d254260becf', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-05 23:57:48');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644455572537408, '701ca42e-8fc4-497b-ad54-3f61ccbebda2', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-05 23:58:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644455713046592, '62de7705-9aa0-4536-a7dd-5edb9b035240', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-05 23:59:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644456308637760, '59a2729c-8cbb-4331-87c3-f654bec7af89', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-06 00:04:33');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644456912617536, '8e514543-6020-4467-b64b-1115e34004fa', 'admin', '36.113.162.14', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-06 00:09:22');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644626159075392, 'ccbb111f-4065-46f3-9c0c-012182ea3e06', 'admin', '36.113.124.153', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-06 22:34:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644805532680256, 'ac9e63c0-6670-45d5-87df-0ba6cec1a6e1', 'admin', '49.91.34.15', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-07 22:19:57');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644890985332800, '8aa68986-c1d2-47da-a396-17f7eda1c875', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 09:39:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644891083898944, '8ff6fc58-72d0-448b-8e2b-9fd528a4cc16', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 09:39:51');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644891329265696, '42a0cdb7-20d0-4a65-bb31-079845f544df', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 09:41:47');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644891362820160, 'ab54d657-76ba-47f0-ae19-8d6b7e261304', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 09:42:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644897310343232, '8c9b0f43-f2cb-40e7-8eac-e0e4cc81a240', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 10:29:20');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644903958315072, 'd23e6718-3c7a-4020-918b-9696c687bc37', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 11:22:10');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644904321122368, '7defeb9a-6630-45fe-a68c-bda61ecd05d8', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 11:25:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644904327413792, 'd10ff663-048c-45f4-b032-1ce633aae79a', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-08 11:25:05');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644905904472096, '198e2ea8-a77b-49f1-8688-4e31fd140f04', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 11:37:37');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644905908666400, '075c62ac-66e7-408c-ba30-2a7b21c5b383', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-08 11:37:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644906181296192, 'c165aa5e-360e-4eef-b365-5f767b672977', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 11:39:49');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644906189684768, '75c852c0-bdbc-4318-8870-95e5ae84560c', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-08 11:39:53');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644906764304416, '21aeb1c1-be4d-4e6e-806b-a940e0251492', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 11:44:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644906768498720, '1522d05f-0255-4517-9f55-e7d488209685', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-08 11:44:29');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644906850287648, '909695f8-a6ed-42fe-9dc8-20571d008912', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 11:45:09');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644906854481952, 'eecfc1ff-40c0-4e2a-a9b0-ded84d2168a9', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-08 11:45:11');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644907089363008, 'e6ad95d6-0f68-43a9-b830-8598a151e3f8', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-08 11:47:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644907093557280, '0ee0c114-083a-458e-8a90-1ee51fba4b69', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-08 11:47:05');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644907158568992, '576d8cb5-840d-4654-816d-956119a9b888', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-08 11:47:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644907169054752, 'aeafdb30-3cf3-43ad-a713-13f13a52f2de', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-08 11:47:41');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644907204706336, '38020d83-c1f4-475e-8479-da56e663f835', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-08 11:47:57');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1644907204706368, '17a3cc18-781e-4c5f-b02d-de1f07dc6712', 'admin', '114.222.204.142', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-08 11:47:57');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645527674388544, '5325c3b8-a95c-47f7-b484-2fb9fe679995', 'admin', '49.91.147.2', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-11 21:59:01');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645528857182240, '8f4193d4-b885-4ba0-ba23-221d3e9b6db2', 'admin', '49.91.147.2', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-11 22:08:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645707947671616, '2d93f773-1ab6-4738-9e29-6e6f34f1ac15', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-12 21:51:41');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645707953963040, 'bd8da945-846b-491a-abcf-57db0e207fd9', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:51:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708616663072, 'e2a9b6ac-bc34-4fe2-87ae-3acdc4dfc530', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:57:00');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708639731744, '9c22d412-a0f8-4fc0-82d2-4cf5d6f0dcb1', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:57:11');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708662800416, '36138963-d06b-42e7-8fb1-592eedd0d113', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:57:23');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708681674784, 'e10b1e40-ee73-4cbf-95e0-5c3a025ad218', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:57:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708692160544, '33563d75-6bae-4582-918d-210a2b588ea6', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:57:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708702646304, 'a68fc367-88dd-40b2-b534-46ffbbda6873', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:57:41');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708702646336, 'e4f24582-9561-4f9c-ab55-9b60e9cf2ddb', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:57:42');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708746686528, '720ca238-0f08-4ce6-8be4-b261f804d3d9', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-12 21:58:03');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708752977952, '331696e5-784c-42ca-a367-f599f851d6c1', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:58:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708763463712, '06b8a085-dddd-4e4a-a6ab-efeb52007f46', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:58:10');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708790726688, 'b72906b9-6aaf-429e-8cf0-ed54eb2bc236', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-12 21:58:23');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708794920992, '4b28d595-c159-48b9-a95e-fa74288348b1', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:58:25');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708847349792, '46b7c8da-dd9c-4845-bfc6-d3f33b8cc12f', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-12 21:58:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708853641248, '6ee4e906-760e-4164-9206-f30204483643', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:58:54');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708937527328, '700cbd42-f6ab-4608-adc5-65f43a21324b', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:59:33');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708948013088, 'a85ac9c5-63f9-4f56-a01d-1c3391ee3bec', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:59:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708964790304, '72e3d15f-77e5-4370-a742-c00d3efa7811', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:59:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645708983664672, 'f573b2d4-dcb9-4162-b06d-c94c96d29a1f', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 21:59:55');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709008830496, 'dd0545bd-d7f3-436e-876c-2376ce15fc56', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:00:07');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709023510560, 'c36202a8-3eea-4993-9cbd-db8ed9b6272d', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:00:15');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709044482080, '95456ff4-4df7-4146-94c2-35f9d0b4cb00', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:00:25');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709113688096, '19ab962f-c057-4e0e-b969-d3bb8433325c', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:00:57');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709115785248, '5255c62a-0f04-4e72-af81-dba0e544ad12', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:00:58');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709128368160, '2229fcb3-b2ce-46fc-818d-150045b82d38', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:01:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709151436864, '47efa2d6-c597-41c0-a464-a7402f1912c3', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-12 22:01:16');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709168214048, '92405355-87b1-460c-9439-c4c66d1bd6c2', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:01:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709203865632, '2cbabdda-e010-4eef-867d-6b1e796bb144', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:01:40');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709220642848, 'bd690215-a1ec-47ee-89f5-7e75da52ebfc', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:01:49');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709266780192, 'd4c62ad8-9d09-4e93-9d31-f3f9bb941754', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:02:11');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709277265952, '45482748-d57f-49cc-9fe8-d9e38a8c10eb', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:02:16');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709344374816, '5f378daa-4983-460b-844b-8265775f5c38', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:02:47');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709369540640, 'e3c972e5-ab2f-40c7-b7e8-9d66d6e84ba9', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:03:00');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709388415008, 'ae68b432-1031-4146-9d81-4dbae9cf4033', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:03:08');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709415677984, '67ec5a64-15fa-4ba7-b72a-498251bd6eab', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:03:22');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709499564064, '6d9c8c29-0b4f-4065-85c5-18cc40a92762', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:04:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709518438432, '634324c9-636a-4679-a88c-7a09fad3f279', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:04:10');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709539409952, 'e54d8ef1-43a7-4be6-a288-9e48f37b60e2', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:04:20');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709543604256, 'd36cc1c1-4b8a-44d5-ae5f-8d9e568eb0a7', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:04:23');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645709551992864, 'b34ac80d-4de0-46ab-8435-8de31510b2d5', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:04:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645710478934048, 'fc3af3e5-6a17-466f-8c94-73423e41c682', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:11:48');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645711806431264, '20b38de9-8654-4ea3-8747-116d05dfd5f7', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:22:21');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645711808528416, 'a7cebcd8-b054-4681-8e1a-02a0c4a4285b', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-12 22:22:23');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645887765872704, '2c1a7144-dd60-4380-ac7e-6d2641a59144', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 21:40:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645887772164128, '38e5cebd-fb0c-4938-95cf-eeabdd331813', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 21:40:49');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645887778455584, '71217268-8756-41be-aa64-79af68a094d3', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 21:40:52');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645887788941344, '875622b9-9ec7-4afe-9744-4619b299263e', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 21:40:57');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645888193691712, '768047c4-676f-4f1c-a645-04f009444415', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 21:44:10');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645889640726560, '8b84bf82-a18b-453d-bb2b-bcdd8bfdb906', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 21:55:40');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645889644920864, 'cd05631d-3fc7-4f3c-b759-6132c66eb493', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 21:55:42');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645890995486784, '932efe98-daae-4534-ab58-5026b237901a', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 22:06:25');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645890999681056, 'e13eb48f-f47c-4b0f-ac0d-a6ac55008f87', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:06:28');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891026944064, '5899175e-e959-4871-bbe2-16c0bf5dc63e', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 22:06:40');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891029041184, '1fe4421a-5f56-467b-b9d1-fa11e60c9d41', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:06:42');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891383459904, 'bf5f31f0-dc49-4e6d-8786-eacef110401e', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 22:09:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891389751328, '778cb445-f294-4d30-931b-ddca224bdfca', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:09:34');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891396042784, '061bf36a-f644-4dd3-9a13-348aaddf5532', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:09:37');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891400237088, '911cfce8-c918-4707-8256-a87d5295f3c1', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:09:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891406528544, '367a0f3c-ad77-44a5-bd48-ffaad8efcd85', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:09:41');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891410722848, 'beb52d4e-a46f-4612-9b94-f864574d13a6', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:09:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891507191872, '0d62ab84-7a5f-4d3f-b538-41bd3f2babff', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 22:10:30');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891517677600, 'd4a79bc6-b543-4059-ba2a-38855f39e6a2', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:10:34');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891523969056, '52bda453-9848-49cc-8483-33d8332391f6', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:10:37');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891528163360, 'd0c2fb79-8041-4380-a499-0579384896d5', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:10:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891534454816, '059a6c6d-47d0-4f0e-9436-fe6c51cb3723', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:10:42');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891547037728, '2548777c-9321-4ceb-bd01-ad1f88c47207', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:10:48');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891664478272, 'c33dcae2-97c4-4238-8654-df68a7d22674', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 22:11:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891670769696, '75bf75a1-ed03-43f8-ba80-a5339bccf879', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:11:47');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891698032672, '7ccd7510-cf46-47a7-8f67-bbaeb3bd8028', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:12:00');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891702226976, 'e6d13a6e-42ad-4fd8-b0d4-90c858a15a3d', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:12:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645891706421280, '5755f7c1-1009-4b46-8664-aea17d1294c2', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:12:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645892117463072, '59a2b5c4-74ac-4f60-912b-4a2cff55bb29', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 22:15:21');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645892329275424, '74fba283-30d3-457a-9d55-16e1e6d952bb', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 22:17:01');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645892385898528, 'aee72858-2a2f-4749-be4c-30ac6b4e74ac', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 22:17:28');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645892612390976, '723a9960-03ab-421f-bbf8-9e408229a9cc', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-13 22:19:16');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1645892618682400, '0d1353b6-5727-4b86-9596-11cc83ab20ec', 'admin', '36.113.163.70', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-13 22:19:20');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646392692965440, '11352ef4-bc4e-41cf-9c8b-874bc120e802', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-16 16:33:34');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646392701354016, '932c7d9c-07a3-428c-813c-df8dcc498838', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-16 16:33:37');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646393137561664, '92a2ef64-7672-47d1-92d6-dd7e5127f84f', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-16 16:37:05');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646393152241696, 'c8505d0f-5014-42e4-8dc6-165a1af6dbca', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-16 16:37:12');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646393171116096, 'cddb0416-c009-4ab7-bb43-3fe340a576ae', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-16 16:37:22');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646393171116128, 'eaf89d1b-aa14-4bbb-bbe4-a263ff1b80af', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-16 16:37:22');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646393512951872, '33c71021-0d48-498c-bf58-d14ac230b119', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-16 16:40:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646393536020512, '0acfe2ce-8f1f-48d4-b6a8-8a2e3db2b888', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-16 16:40:15');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646393712181312, '6cca02a2-30d2-43e4-a1f6-8a9d0c3e19a1', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-16 16:41:40');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646393737347104, '180c890a-7567-46c0-8f32-3d328922aa1a', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-16 16:41:51');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646393796067392, '8e9f8c74-5c2a-4d8e-bb12-b57a7593c2b7', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-16 16:42:20');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646425721012288, '0a1b3dd9-5dd0-4a67-9041-7fafde9d7f3c', 'admin', '49.91.34.40', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-16 20:56:03');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646794949787712, '90f1b5cf-8999-40bc-9967-072629d31e9f', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-18 21:50:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646795524407360, 'fa6f749d-b1f7-487b-86bc-23cf5acdd732', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-18 21:54:58');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646795553767456, 'c4d338d6-5416-400b-baf6-f29da3f4a00a', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 21:55:13');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646795763482688, 'cb59982b-d400-413c-99f9-dc3170f460e7', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-18 21:56:53');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646795966906432, '0b0ff123-2db1-40a2-a68a-beb7dbd6d7a5', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-18 21:58:30');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796279382080, 'd51fd489-5821-4334-bd58-ae23476f85b0', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-18 22:00:59');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796600246336, '1aa7cb86-838e-4478-9d04-56b2cd87fd7f', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-18 22:03:32');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796633800736, 'e8866050-ae08-4cf5-b37a-045c89bfe0f0', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:03:48');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796658966560, '92025c93-8f2e-4fb5-b289-f2038136b27a', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:03:59');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796822544448, '523fcefa-5156-4832-9fb6-43eacd46e8ec', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-18 22:05:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796854001696, '088b2c0b-eda1-4b45-9a2a-c028371645e0', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:05:33');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796864487456, '222894e6-9c21-4a74-a279-3a36945ac163', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:05:38');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796866584608, '685523fe-0795-42dc-a80f-25e59ab5e4cd', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:05:38');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796866584640, '9b13caa5-78dd-4c1c-b651-e76e5dc97149', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:05:38');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796866584672, '13f42aca-0f85-45e2-ae21-06a94461b080', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:05:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796866584704, '5b72cbf3-52b5-49ca-b6e5-05f4fbdc1175', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:05:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796868681760, 'fc2e2ea8-88f4-40ef-b296-acebecdc68c3', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:05:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796872876064, 'c59993e3-0bdc-4975-9ad4-bc8b00da0029', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:05:42');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646796874973216, '12f028bc-79b1-4a94-a06c-30d4ff48b4e5', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:05:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646798999388192, '2ef3a952-2b31-4170-988f-15c60b2610d3', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:22:35');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646799269920800, 'fc93991a-9fe8-49ff-b916-72365621cc31', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:24:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646799282503712, '9aa37dbb-0b42-476a-94b4-1dfd4f238324', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:24:51');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646799299280928, '20bda52d-1f80-4dc9-a129-f4402f13e0e5', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-18 22:24:58');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646973333536832, 'a1ecb2d1-8f52-4fa3-bc3f-8d609b7d323d', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-19 21:28:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646973341925408, 'cc9d00d2-246e-43ab-8d71-0e02ed5e2f11', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-19 21:28:09');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1646973352411168, '85e743eb-05dd-4904-b181-adbd6395b5bf', 'admin', '36.113.144.37', '中国|江苏省|南京市|电信', 'Firefox 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-19 21:28:13');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648336438296608, 'f1a1b70d-71fc-43b5-a561-0816809641c0', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-27 10:01:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648339303006240, 'ef41aaa3-3df8-4469-a6ac-cc35d325f2da', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2024-11-27 10:23:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648385807351840, '85060b77-d212-44b4-b6a8-44db8d39af4e', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2024-11-27 16:33:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648386119827488, 'e301fb46-8971-4754-b698-c2440920849b', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1641998456979488', '{roleId=1641998456979488}', 'yes', '2024-11-27 16:35:54');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648386807693344, '525f36c4-b7b9-45e1-8a70-95f4c2eed3db', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-27 16:41:22');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648389269749792, '776760c8-e5c5-4879-a684-17306666342b', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-27 17:00:55');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648389334761504, 'd7594f3a-2862-4556-acbc-9c797d1a2577', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2024-11-27 17:01:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648389368315936, '0bd737dd-eff5-44c6-b4c9-bb7cac4c9473', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/del/1642035767410720', '{id=1642035767410720}', 'no', '2024-11-27 17:01:42');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648390349783072, 'b0225c5a-9fa0-4b2f-9d10-09709dcdca48', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-27 17:09:30');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648390362365984, '6db4bf05-768c-4c1a-a7b5-f3239ab34494', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2024-11-27 17:09:37');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648390381240352, 'cb114b2c-c982-4349-93fb-28f4b1b6a485', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/last-broad', '{}', 'yes', '2024-11-27 17:09:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648390429474848, '1ee5598b-004b-4e5f-a99e-cab59a0d149c', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-27 17:10:08');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648390448349216, '75da1762-da89-493c-8756-7a96a6a54c8f', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-router', '{}', 'yes', '2024-11-27 17:10:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648390620315680, '8b616128-0932-40a9-84c8-ebdc37299b6a', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-27 17:11:40');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648393447276576, '4b991336-ebc6-44e1-b4dc-2e0a34c6a3e7', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-27 17:34:07');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514295660576, '42fd227a-6cf4-4c58-91c2-f5fbf6839032', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-28 09:34:32');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514301952032, 'bd9803c7-fa05-4d98-8033-75bce2077f46', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-28 09:34:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514312437792, '864436ea-52c5-4e75-a6c8-f80b0cad82cf', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-28 09:34:41');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514314534944, '244e6e0c-b288-409b-a12d-4ae94756c406', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:41');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514316632096, 'cfed6fbe-f41d-4ad6-a9c7-f5db83108ab2', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-28 09:34:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514316632128, '158bc087-f187-4f08-93ea-bd503f4bd8ad', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514318729248, 'e8e8f37f-3750-4e02-a16b-16b324f3c05b', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514318729280, '6d5936d9-dffe-4834-93c8-82683fb45722', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514318729312, '07819c57-046b-46cc-83ce-bd1b3551fd5a', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514318729344, '9e69acbe-8323-4b4d-987f-68d9f887f0e2', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-28 09:34:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514318729376, '8484ead0-5f6a-4e8e-9646-f0074ff7da8e', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514320826400, '3f2e1870-5be2-46dd-9ee3-649055eb0505', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514320826432, '72e3509e-5dd8-4456-b59e-7984fc5691cc', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514320826464, '16d08bc4-fda7-492a-a1d1-ff62a1157144', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514320826496, 'e2f66844-9bcc-4fb7-b7b2-93aa6420343e', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514320826528, 'a3195c99-11f2-4611-9f9c-8fbbb8d03a25', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-28 09:34:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514322923552, '7cf62a0b-57f3-438f-8420-2dad3ab90878', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514322923584, '09eb14d2-0340-4c73-8559-7767ab694ccb', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514322923616, '6c853eda-8c8b-44e7-849c-5459f69c4340', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514322923648, 'f4ed8319-702f-49ba-8263-0d34a0f319dd', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514322923680, 'a3f18c06-0582-4996-a714-55dea656f7e8', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 09:34:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514322923712, '55c322a9-160c-4d9f-b074-2970ea9468bb', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-28 09:34:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514427781152, '268a3136-9d34-4146-9a3f-5339bb54732c', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-28 09:35:35');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514593456160, '7dc632a5-8831-4d75-83ff-bdfac25ac6ab', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-28 09:36:55');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648514603941920, '0d892188-cc0e-422d-b8ad-c453d002bc19', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-28 09:37:00');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648516755619872, '12e4ed50-63e5-4c72-b0dc-e0ab6a1d9d66', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 09:54:05');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648520660516896, 'f741d57f-8605-45a9-9a1a-204e1a68576b', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2024-11-28 10:25:08');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648522210312224, '2b8d86c2-0739-473c-9a08-222511ba1204', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 10:37:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648526761132064, '778701c9-b938-4f3f-adbd-bf3a4d069ad5', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2024-11-28 11:13:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648543053905952, 'e5312f16-08a7-416b-84be-2319e40b62c4', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2024-11-28 13:23:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648556825903136, '304eea5c-99c9-40c1-9e1f-250bef7c9595', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2024-11-28 15:12:32');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648559998894144, '1c3c28ed-a478-474a-b8a2-a05730b4bf36', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2024-11-28 15:37:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648560013574176, '3612fc67-e09b-40a0-b605-14fae784e70f', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2024-11-28 15:37:52');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648560103751712, 'b5fb0630-bf61-4900-9dc2-15437ce05c4f', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/del/1648559998894112', '{id=1648559998894112}', 'yes', '2024-11-28 15:38:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648560110043168, '449bb321-b252-4eab-9347-4441a392c3c9', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2024-11-28 15:38:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561244602400, 'c2228ca5-2e93-4171-b556-340653ba21f8', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:47:40');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561255088160, 'ea2c1b78-79a1-4c67-b7de-06c21800ac6b', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626812083863584', 'yes', '2024-11-28 15:47:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561259282464, 'fdb0884b-c017-4efa-8e2f-4e656ce7b451', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626812083863584', 'no', '2024-11-28 15:47:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561276059680, '18754060-9506-4125-839b-08e4f50be75f', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:47:55');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561286545440, 'b843ef3c-4e28-45b8-a57a-a125e0ae1ddd', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626945854898208', 'yes', '2024-11-28 15:47:59');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561288642592, '6e2fd20c-d72b-4f6c-9158-952c84ef1e4f', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626945854898208', 'no', '2024-11-28 15:48:00');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561290739744, '68425892-f963-483b-a6ac-4191bcb3eabc', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626945854898208', 'no', '2024-11-28 15:48:01');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561290739776, '326244e1-09bf-4860-8718-406920fe2688', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626945854898208', 'no', '2024-11-28 15:48:01');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561290739808, 'b9179f5d-bb54-4ca0-8227-a299aafedfc7', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626945854898208', 'no', '2024-11-28 15:48:01');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561290739840, 'ef6a22de-bfbb-46f4-9f71-5e5d952d2d68', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626945854898208', 'no', '2024-11-28 15:48:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561290739872, 'a3ca8222-35bf-4e30-bf3c-a37097166966', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626945854898208', 'no', '2024-11-28 15:48:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561290739904, 'ae69e61c-0bac-4175-8a4c-59b372d8c5b7', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626945854898208', 'no', '2024-11-28 15:48:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561292836896, 'ecff484a-39cd-4e1e-911e-c6301be81dd9', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/del', '1626945854898208', 'no', '2024-11-28 15:48:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561368334368, '7f5e7bb3-a68a-4fce-97a1-f8c11755cbd0', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:48:38');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561466900512, '588d62c2-7bbe-4f17-a660-d30152820d48', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:49:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561468997664, '76a7771b-c27f-4473-9aa5-c1628af5966e', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:49:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561468997696, 'd679ee3f-c1b7-4a76-a9ec-6fedee712ba3', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:49:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561468997728, 'c37fb7c4-5c09-4b23-b967-3d24d11d8b84', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:49:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561468997760, '8800a49f-3444-4b06-a274-a9065a3e9949', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:49:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561468997792, '6a5726f6-3820-4d05-8497-54df5a99d069', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:49:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561471094816, '57d0ab95-ed92-41e6-bd19-3db3518d6572', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:49:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648561494163488, '874391fe-3825-4331-b88a-f17bea4a999f', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 15:49:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563337560128, 'ac7f0d08-720a-499f-ba1f-f4c6b8594d55', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/add', '{\"configName\":\"初始化密码\",\"configKey\":\"init_password\",\"configValue\":\"123456\",\"configStatus\":\"yes\"}', 'yes', '2024-11-28 16:04:17');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563358531616, 'c6e5c3c6-b585-4749-bae8-30776809f690', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/add', '{\"configName\":\"初始化密码\",\"configKey\":\"init_password\",\"configValue\":\"123456\",\"configStatus\":\"yes\"}', 'no', '2024-11-28 16:04:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563360628768, 'a855aae5-dc11-45e3-8963-b9f35b78d031', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/add', '{\"configName\":\"初始化密码\",\"configKey\":\"init_password\",\"configValue\":\"123456\",\"configStatus\":\"yes\"}', 'no', '2024-11-28 16:04:29');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563360628800, 'd6d1d2a1-5031-4efe-abe7-46f06d83f062', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/add', '{\"configName\":\"初始化密码\",\"configKey\":\"init_password\",\"configValue\":\"123456\",\"configStatus\":\"yes\"}', 'no', '2024-11-28 16:04:29');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563360628832, '82d991bb-03a6-448f-935d-5d3b341cbddf', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/add', '{\"configName\":\"初始化密码\",\"configKey\":\"init_password\",\"configValue\":\"123456\",\"configStatus\":\"yes\"}', 'no', '2024-11-28 16:04:29');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563362725920, 'f20f173b-bb62-4548-a150-b227f061d0d1', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/add', '{\"configName\":\"初始化密码\",\"configKey\":\"init_password\",\"configValue\":\"123456\",\"configStatus\":\"yes\"}', 'no', '2024-11-28 16:04:29');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563362725952, 'e519cda6-620b-4391-a543-98b40a0f9314', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/add', '{\"configName\":\"初始化密码\",\"configKey\":\"init_password\",\"configValue\":\"123456\",\"configStatus\":\"yes\"}', 'no', '2024-11-28 16:04:29');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563362725984, 'cf5b26a3-b985-4705-8fdb-0a99c3069b13', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/add', '{\"configName\":\"初始化密码\",\"configKey\":\"init_password\",\"configValue\":\"123456\",\"configStatus\":\"yes\"}', 'no', '2024-11-28 16:04:29');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563375308832, 'efeeb03d-574b-4171-94f6-0d04da841b1c', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 16:04:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563383697440, 'c016f938-6f4c-4e75-b9cb-d5338761c05e', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 16:04:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563392086048, '1e3bfdf0-a9be-4431-998a-be62c816ceda', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 16:04:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563406766112, 'abcfc808-014b-4a8a-8cc7-89e19cd08c36', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 16:04:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563410960416, '04816ab3-19fb-466d-9c0d-9bef67a8a008', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 16:04:52');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563419349024, '58001b9a-1f32-4629-ba50-ec52f2e62535', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 16:04:56');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563423543328, '8a6836de-cd88-432c-94d8-5527953a79b0', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 16:04:58');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563427737632, '2a24de3a-ded4-45f2-9c44-3f92c68183f7', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2024-11-28 16:05:00');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563589218336, '30eeca9e-07e6-4c0c-8757-fb87e7befd17', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-28 16:06:17');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563589218368, 'b3ee54e3-6c04-4f72-a8e3-7dab51a8070f', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 16:06:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563591315488, '5d201e5d-3726-40d1-9c8f-a050f8a26aab', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 16:06:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563591315520, 'd326e2eb-d1ba-4377-a3e4-8c7553372a0c', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-28 16:06:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563591315552, '926b9147-dd11-4909-997c-9857f088284e', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 16:06:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563591315584, '3f4cc4a3-391d-45a1-85b8-acc169429813', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 16:06:19');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563593412640, '421a2fe6-11fe-4a0c-98a9-0ea0aecb64c5', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'no', '2024-11-28 16:06:19');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648563593412672, '8a79ac54-0420-4e2b-99de-786f4b46b278', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-28 16:06:20');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648699421753376, '2c4470e2-a6bf-407b-9c59-8ee8cf87e527', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2024-11-29 10:05:47');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648700040413216, '3e2c8678-ae41-4a08-b528-db27468ae00f', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2024-11-29 10:10:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648701109960736, '4dc50738-a692-4d7f-9b19-f1b64002f567', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 10:19:12');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648711409074208, '9edd142d-f6ff-413b-b751-ca0b194c48c8', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 11:41:03');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648722452676640, 'bb096f4b-6807-4cd5-adbf-276724298601', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 13:08:49');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648723935363104, '8b7ae5dd-0462-41a7-b397-4a7d4c32feba', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 13:20:37');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724048609312, '17d12d19-ca27-46c7-9f2c-c82c8dec2024', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 13:21:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724184924192, '13161f20-231a-4c9f-b70c-aa6138e4e616', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2024-11-29 13:22:35');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724231061536, 'c593b313-f6d9-45d1-b02c-b83a1f6902b5', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 13:22:58');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724665172064, '3662fcab-7f46-4270-a630-dde25c992c0f', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/add', '{\"roleName\":\"系统管理人员\",\"roleCode\":\"sys\",\"authPermissionIdList\":[7]}', 'yes', '2024-11-29 13:26:25');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724688240672, '89fa12f0-7c11-4018-90e7-83577e778b34', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2024-11-29 13:26:35');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724698726432, 'd6a17ebb-2fd0-444f-b979-47465675c122', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2024-11-29 13:26:41');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724759543840, '64ba545a-2130-4d1c-b20a-f070c7a0c376', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:27:10');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724853915680, 'e5b54c01-b3c1-4af4-98ba-1747db2f50b6', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:27:54');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724853915712, '4016985d-f865-4185-a8d4-37520ab2a3eb', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:27:55');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724856012832, '39399dfb-47dd-4c1a-9d16-fda2720adf92', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:27:55');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724856012864, '9cc13676-2e85-4dc5-9f0c-94fc29d21262', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:27:55');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724856012896, '70bd71d3-b355-43d0-839e-39962bf3c035', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:27:56');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648724856012928, 'ef079eba-eaac-4429-a24c-b257ba0bde5b', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:27:56');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725388689440, '5deedb8e-b321-4e58-8071-d7905fae6f1c', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:32:09');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725474672672, '0b2f4f4c-ecb4-4f59-8b3b-bc3e3c14af9b', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:32:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725548072992, '3e6baf27-b0e7-4b33-b7e9-5e0ebb8cee9d', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:33:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725644542016, 'c48b7428-96d5-4b7d-acee-c3ac2aa60336', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/add', '{\"username\":\"sysUser\",\"password\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\",\"nickname\":\"系统管理测试用户\",\"sex\":\"male\",\"avatar\":4,\"phone\":\"153126666666\",\"userType\":\"manager\"}', 'yes', '2024-11-29 13:34:11');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725648736288, 'dca39179-14d1-4619-ac00-5d7397ae0d95', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/add', '{\"username\":\"sysUser\",\"password\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\",\"nickname\":\"系统管理测试用户\",\"sex\":\"male\",\"avatar\":4,\"phone\":\"153126666666\",\"userType\":\"manager\"}', 'no', '2024-11-29 13:34:14');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725688582176, 'bfaa6172-3864-4cd1-ba16-044ce1e4e890', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:34:33');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725717942304, 'ce030bea-37c5-496c-9927-ecab85ccc57f', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:34:47');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725736816672, 'e5afa616-c35e-4581-805e-b091fdb9ac7c', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-router', '{}', 'yes', '2024-11-29 13:34:56');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725921366048, '4dceb9a4-8b45-463a-a7e1-7fc2af315e10', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 13:36:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725944434720, '9dacedd9-97f9-40a8-bb17-3266154178f8', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2024-11-29 13:36:35');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648725961211968, 'f60b0a83-c1b5-4b13-ad6f-b53921854bf7', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/user-role-relation', '{\"id\":1648725644541984,\"roleIdList\":[1648724665172000]}', 'yes', '2024-11-29 13:36:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726013640736, '14c6d527-0edd-402c-bdbf-7459b57d96ef', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:37:08');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726068166688, '527c0c49-480c-4716-aaf8-bc646e9b9ca1', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-router', '{}', 'yes', '2024-11-29 13:37:34');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726204481568, '9ac12d2f-9f71-407b-81ef-6244f7b50b99', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-router', '{}', 'yes', '2024-11-29 13:38:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726403711008, '88016f20-669c-44c0-be07-b8ea219a480d', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 13:40:14');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726439362720, 'e7f29c6f-5dff-46c5-b073-0a52368e8864', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/add', '{\"roleName\":\"系统管理人员2\",\"roleCode\":\"sys2\",\"authPermissionIdList\":[1,2,3]}', 'yes', '2024-11-29 13:40:30');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726443556896, '832da637-bb35-40a4-aff5-e0c4f1846838', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/add', '{\"roleName\":\"系统管理人员2\",\"roleCode\":\"sys2\",\"authPermissionIdList\":[1,2,3]}', 'no', '2024-11-29 13:40:33');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726456139808, 'eba434a8-983c-4718-9f3a-d33a9acf8504', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2024-11-29 13:40:38');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726470819872, '508a307d-c58d-4d0c-8217-d3b82efea5e7', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648726439362592', '{roleId=1648726439362592}', 'yes', '2024-11-29 13:40:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726504374368, 'd39fd204-ac0c-434d-9669-50090cbfe6cc', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/user-role-relation', '{\"id\":1648725644541984,\"roleIdList\":[1648724665172000,1648726439362592]}', 'yes', '2024-11-29 13:41:01');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726510665760, 'a991208d-8602-4f4c-ad71-a8fda6856426', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:41:05');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726527442976, '903dcbca-df27-45e9-ab24-92f85e35f72e', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:41:12');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726533734432, '05767a1e-e391-429d-9e0b-6a902f60c60a', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-router', '{}', 'yes', '2024-11-29 13:41:15');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726556803104, '3a2679d2-3467-439c-b0cf-0b1b5e3cd3ea', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:41:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726558900256, '5b4914c6-2abd-4978-81b2-2756ded25e48', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:41:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726558900288, '23ddb49c-c1c2-48a1-bcd6-f53efa6ed6a5', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:41:28');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726558900320, '21a4c9ce-8eff-444a-9b05-baecb113cd19', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:41:28');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726579871776, '18a4a7cd-5514-4f83-9ab9-cfd304411f97', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:41:38');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648726892347424, 'b46c40b4-61c6-49f4-a4f1-6ed5adfd7c27', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:44:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728075141152, '09bc0179-acff-4f8a-9333-949268498e84', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:53:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728085626912, 'c4519941-b426-4367-a548-c15084a8ee33', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-router', '{}', 'yes', '2024-11-29 13:53:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728127569952, '414bef36-7087-42fe-bd08-9e403d5943b3', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 13:53:56');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728393909376, '94da72ba-4883-498b-a2a2-0b845f31a0ea', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/add', '{\"roleName\":\"系统管理人员3\",\"roleCode\":\"sys4\",\"authPermissionIdList\":[123,124,125,126,127,128,129,200,201,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1021,1022,1023,1024,1025,1026,1027]}', 'yes', '2024-11-29 13:56:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728402296864, '115d2b22-f8f2-436e-9093-bd19004cd624', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2024-11-29 13:56:07');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728412782624, 'c6d4e522-c60c-42a3-bd76-a9ee03edb43f', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648728391811104', '{roleId=1648728391811104}', 'yes', '2024-11-29 13:56:12');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728528126080, '0502788c-76d0-4039-9b1e-b0f2033c1d98', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/user-role-relation', '{\"id\":1648725644541984,\"roleIdList\":[1648724665172000,1648726439362592,1648728391811104]}', 'yes', '2024-11-29 13:57:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728574263328, '096c8158-7bf9-4438-8234-4d8c4fb00a8f', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-base', '{}', 'yes', '2024-11-29 13:57:29');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728595234848, '8926a258-b0eb-4d51-9ab7-f88f52b025a1', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-router', '{}', 'yes', '2024-11-29 13:57:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728926584864, 'cff68f80-729f-49cf-885b-e3a18f0d46fa', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 14:00:17');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648728960139296, '2a13ac89-f2e2-4331-af50-97883bb7e5cf', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:00:33');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648729312460832, 'c5821c9e-678c-46f2-9fb0-669b09f977b6', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2024-11-29 14:03:20');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648729373278304, 'cb69a963-6952-4aac-9c30-34ad932fc288', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/user-role-relation', '{\"id\":1648725644541984,\"roleIdList\":[1648724665172000,1648726439362592]}', 'yes', '2024-11-29 14:03:49');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648729406832672, '7333ae36-fe87-43d7-8a52-131b46ad7b77', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:04:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648729415221280, '660b591d-2053-40b9-8546-3c510ef887d8', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-11-29 14:04:09');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648729431998496, 'c1137e9d-071c-4595-97b7-d6c32bf557cf', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 14:04:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648729671073824, 'dac47233-558c-489e-9d54-e75b8e741392', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2024-11-29 14:06:12');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648729815777312, '009bcda8-d5dd-4f16-9c95-fb253e721115', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:07:21');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648729824165920, '6c567ecb-b496-4bce-97ef-4d96d8924b17', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-11-29 14:07:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648729884983328, 'fbc26527-3d60-4633-8fa6-803dca2ff885', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:07:53');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648731474624544, '89582264-7ac1-4f6e-8a2e-b41ba152ccbb', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:20:32');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648731501887520, '4fda08a9-bd67-41fe-a132-ed67b42509d6', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:20:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648731522859040, '54155ecb-8945-4636-b561-12ccfc4bdfdc', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:20:55');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648731623522336, '4d1966b8-95f6-443b-948b-6bc5b9025a20', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:21:42');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732021981216, '4acd92b3-c9ca-47c4-ab13-8c7e8c5ba20c', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:24:52');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732047147040, 'e9496ba0-61cc-412a-878d-70a9418c8af6', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 14:25:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732183461920, 'b66c8605-2223-4b12-a296-2f4c56d52a8f', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:26:10');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732200239136, '53c0ccd1-198d-486d-8416-504f55686c41', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 14:26:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732244279328, 'c2c30f94-73e0-4d6c-b4a3-8458ae7a3efd', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:26:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732317679712, '3945c745-5e39-405d-b4a7-bea4e29ee97c', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/add', '{\"roleName\":\"系统管理人员5\",\"roleCode\":\"sys5\",\"authPermissionIdList\":[1007]}', 'yes', '2024-11-29 14:27:14');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732323971104, '0c61b53f-e60a-4aaa-ad60-eaca925fb34c', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2024-11-29 14:27:17');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732351234176, '586256cd-4141-4288-98f8-b17c6d46bf51', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/user-role-relation', '{\"id\":1648725644541984,\"roleIdList\":[1648724665172000,1648726439362592,1648732317679648]}', 'yes', '2024-11-29 14:27:30');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732378497056, 'bddbe40f-ca86-4b6c-999f-8937dd96022a', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 14:27:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732386885664, 'a577499d-c5d7-4376-8179-3ce613d2fdad', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-11-29 14:27:47');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648732416245792, 'b03a7d4f-9d38-4768-bbaf-0b18cb5101d7', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2024-11-29 14:28:01');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648735247400992, 'edb02624-5f74-455c-b82f-4b0ae13d8e48', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 14:50:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648736715407392, 'f433aad0-879a-46e3-9cd4-c8ef16bfaae6', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1648728391811104', '{roleId=1648728391811104}', 'yes', '2024-11-29 15:02:10');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648737271152672, 'e560cbea-5d48-4d17-8358-fda7e08e9034', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1641852256124960/base', '{id=1641852256124960, type=base}', 'no', '2024-11-29 15:06:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648737283735584, '43014a0f-da55-4e18-a23c-3d9318ec7c11', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2024-11-29 15:06:42');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648737306804256, '63e9df7e-cbee-40d6-af8a-134e7a68e715', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1648725644541984/base', '{id=1648725644541984, type=base}', 'yes', '2024-11-29 15:06:52');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648737315192864, '52b6ca92-e5dd-46f9-880e-c3a04de29b77', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1648725644541984/role', '{id=1648725644541984, type=role}', 'yes', '2024-11-29 15:06:56');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648737325678624, '758565c7-6cba-4ed3-95b2-a06872bc6fdd', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1648725644541984/all', '{id=1648725644541984, type=all}', 'yes', '2024-11-29 15:07:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648737355038752, '058b521e-7fa6-4bb7-a9f9-4f046ef74d0f', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1648725644541984/all', '{id=1648725644541984, type=all}', 'yes', '2024-11-29 15:07:15');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648740530126880, '32c0d9de-ae54-4663-90e4-d65856ac1727', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2024-11-29 15:32:30');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648740676927520, '50b96ac0-0f1b-4b4d-9403-03897defb405', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2024-11-29 15:33:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648740693704736, '47247b5e-a42c-4e9b-bc1f-dd2f65e983e1', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2024-11-29 15:33:47');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648741022957600, '15767e09-6a51-44ba-b80d-6a7af26dd00e', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 15:36:25');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745011740704, '6d36253f-c404-4bd3-9ff2-178815b9ecc2', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":0,\"oldPassword\":\"\",\"newPassword\":\"\",\"verifyPassword\":\"\"}', 'no', '2024-11-29 16:08:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745087238176, 'c9b5f276-bb18-4423-a5de-4ed6c063c373', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 16:08:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745120792608, 'd34b2412-e4ba-4039-bc26-7f4aed683b38', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:08:58');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745208872992, 'e522faae-ae01-4bc0-b819-d7679d8f8120', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:09:41');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745426976800, 'b943ac6d-3f39-447e-8a1a-601c885c6d17', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:11:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745429073952, 'f4c78bd6-198c-441b-9bea-e8070824dd13', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:11:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745431171104, '89f3a221-12db-417a-8e0c-735690ad5772', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:11:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745431171136, '3f9472e7-6ccd-4421-af67-3418e7ea1913', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:11:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745431171168, '72b5c013-dfd0-4541-b7f4-490391da4a8f', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:11:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745433268256, '8e5ea303-70f2-45cc-afdb-c3e73504f0e5', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:11:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745433268288, 'bd656221-68aa-424e-af9f-c101198f23d8', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:11:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745433268320, 'f03704b2-3667-498d-bfca-f2cd7b8f045d', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:11:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745433268352, '858cf646-4fbf-4a4f-94d0-1e4be214333b', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"1\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:11:28');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745468919840, 'a4e8e6eb-6550-4bda-9d85-18db98832909', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:11:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745502474272, '0b9cd6fe-2b62-4efd-874f-6af5754861f6', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\",\"newPassword\":\"1\",\"verifyPassword\":\"1\"}', 'no', '2024-11-29 16:12:00');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745527640096, '2f1d81ec-517f-4132-b9b0-1e7504bc0fc4', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\",\"newPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\",\"verifyPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\"}', 'no', '2024-11-29 16:12:13');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745529737248, '288afbbc-e17e-4321-8787-4d32b36e7928', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\",\"newPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\",\"verifyPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\"}', 'no', '2024-11-29 16:12:14');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745548611616, 'b2eddeb1-d4dd-45c7-b926-bf08d43430ea', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\",\"newPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\",\"verifyPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\"}', 'yes', '2024-11-29 16:12:23');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745552805920, 'feba060e-5c2e-4317-a371-84839f321e50', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\",\"newPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\",\"verifyPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\"}', 'no', '2024-11-29 16:12:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745557000224, 'c690add1-0949-44d5-ae5d-b4a13b769652', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\",\"newPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\",\"verifyPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\"}', 'no', '2024-11-29 16:12:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745557000256, 'fc7c7637-8096-44dd-b89c-9846fc01906b', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\",\"newPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\",\"verifyPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\"}', 'no', '2024-11-29 16:12:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745647177760, 'c3cccc2e-c5f0-4484-9592-fa8d77101941', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update-password', '{\"id\":1648725644541984,\"oldPassword\":\"fa35a7f935a1da11fd5fcce7c3d4b8627227cd9e4eb623a48df59366c070eefba976e9a3c68de27f390eb21a2d67737a84b0f04177fa11eafc4e6c1d2604a3fb49ccf8844b5b1be1c5dcd56ece7b5ddbfe5eb9858a76c81e8cc30ff82f4c60e8cc2af829495fa3\",\"newPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\",\"verifyPassword\":\"574da0e6fc0e9903835c149fda037f9976351b71430b6cb881d8eb5bc2d40d454cf7aa934ae4ccc9e7f5b7ea71de8adac5b501548fea28308328a8ef38b5c3f9ac8ef076400d2d101bba241d7d17a70750b74a1d9df727ced0edc30ea15ceb40d7bb4da991a8\"}', 'yes', '2024-11-29 16:13:10');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745905127488, '411ab29b-6f2c-41da-8aef-83ec6946b71c', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2024-11-29 16:15:13');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648745924001824, 'f6a54a34-adb8-42e6-b58c-a94ab3369554', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2024-11-29 16:15:21');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648746609770528, '3db519a7-ca64-43ee-b686-dd6daaeb3ef6', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/del/1648745905127456', '{id=1648745905127456}', 'yes', '2024-11-29 16:20:49');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648746687365152, 'be12637b-0bb4-4467-8911-e98e62e2652b', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 16:21:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648746750279712, '1eba4fca-6b42-46c1-8655-434692f23611', 'sysUser', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1', '{id=1}', 'yes', '2024-11-29 16:21:56');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648746989355040, '9b4c6ace-e67e-4466-8e1b-a076ec1e866f', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1', '{id=1}', 'yes', '2024-11-29 16:23:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648747062755360, 'caef63ba-b119-4014-9d3c-9b168a3caf04', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1', '{id=1}', 'yes', '2024-11-29 16:24:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648747136155680, '3e47e851-25bd-43e4-8463-66b5167cb22b', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1', '{id=1}', 'yes', '2024-11-29 16:24:59');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648747276664864, 'c678693b-a629-46b9-acbd-c307ab79b3ca', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1', '{id=1}', 'yes', '2024-11-29 16:26:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648748358795296, 'bce9ca53-fb52-4731-9e75-1621d9f70408', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 16:34:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648748509790240, '2e0cc712-9d71-4c31-8f8d-56dd13e99301', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 16:35:54');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648748516081696, 'db192042-1264-43bc-aeec-266b1c193ea5', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-11-29 16:35:57');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648748555927584, 'f1d380c0-2161-463b-8f0a-bd03c40f787a', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2024-11-29 16:36:17');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648748639813664, 'b3d73407-d903-4f7d-8c4a-2be2cd500b8b', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-mf', '', 'yes', '2024-11-29 16:36:57');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648748706922528, '3f41c9ba-6924-4fd7-934d-eea1f8cd767a', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-29 16:37:28');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648748950192160, 'f4dc05a5-7a37-4def-81b8-af89583cf89b', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 16:39:25');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648748966969376, '4d7afd87-dc14-437e-ba39-1800fcb6af09', 'admin', '192.168.56.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-29 16:39:32');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648749753401376, '534fd858-9664-4380-b8c9-3819632ceb8b', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 16:45:48');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648749759692832, 'f8229354-39ae-449f-8066-2f826807a6d2', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 16:45:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648749759692864, 'dbb9e872-351b-4ebe-bf4b-00b689bea188', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 16:45:51');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648749761789984, '13ed5db5-6303-4d95-9d19-803deff4e5af', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 16:45:51');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648749761790016, '00ef861d-ddbc-478b-9d67-25280e9876d4', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 16:45:51');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648749761790048, '418c707a-9ca5-4fe4-a503-0fe2a3395b71', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 16:45:52');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648749761790080, '18055c87-2ae6-4064-b0bc-f986b6d515e1', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/captcha-enable', '{}', 'yes', '2024-11-29 16:45:52');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648749774372896, 'e7b10d67-d0a9-489e-9f89-c2f7cfa5328a', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-29 16:45:57');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648749776470048, '36d247f4-0ced-492d-9ad7-f95572f24531', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-captcha/captcha-image', '{}', 'yes', '2024-11-29 16:45:58');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648750153957408, 'e3839213-7566-4e91-aea1-f25818eda872', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-11-29 16:48:59');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1648750160248864, 'be25d2a8-bcb5-4c2c-8bff-31e26c5174d1', 'admin', '180.102.170.68', '中国|江苏省|南京市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-11-29 16:49:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1651450140688416, '4999163e-a2b8-4754-9768-65b425998fde', 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-12-14 14:26:33');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1651451109572640, 'd8dbc676-c989-44da-a02d-79de4be2dabc', 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'GET', '/sys-user/page', '{}', 'yes', '2024-12-14 14:34:15');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1651451153612832, '1670443b-80d9-4e9c-b35b-f94350cfd8c2', 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'GET', '/sys-role/page', '{}', 'yes', '2024-12-14 14:34:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1651451174584352, 'fc0c4bf4-0346-4de6-b052-55a7807add7d', 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'GET', '/sys-role/detail/1648724665172000', '{roleId=1648724665172000}', 'yes', '2024-12-14 14:34:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1651451203944480, '5984868c-92f1-4ccb-b8c7-0d160d5a6e58', 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'GET', '/sys-role/detail/1648726439362592', '{roleId=1648726439362592}', 'yes', '2024-12-14 14:35:00');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1651451222818848, 'bd93d799-8568-45b5-8e03-68e816d06376', 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'GET', '/sys-role/detail/1648728391811104', '{roleId=1648728391811104}', 'yes', '2024-12-14 14:35:08');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1651451260567584, '124cd498-c841-4f5d-b0a3-cb8474eebe7c', 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'GET', '/sys-permission/page', '{}', 'yes', '2024-12-14 14:35:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1651451306704960, '125e67ec-7a53-4a43-a27f-ba684110bf9e', 'admin', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'POST', '/sys-user/user-role-relation', '{\"id\":1651450646102112,\"roleIdList\":[1648728391811104]}', 'yes', '2024-12-14 14:35:49');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1651451937947680, '537aac47-600c-44ef-b7f0-b8b9901283be', 'zhonghanlu', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-14 14:40:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1651451956822048, '092c362e-02fb-488d-96f3-dc9824716f24', 'zhonghanlu', '192.168.0.104', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-12-14 14:40:58');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
