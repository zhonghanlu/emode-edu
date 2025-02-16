/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : 127.0.0.1:3306
 Source Schema         : emode

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 16/02/2025 14:20:40
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
  `menu_path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单path',
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
INSERT INTO `auth_role` (`id`, `role_name`, `role_code`, `del_flag`) VALUES (1655807403884576, '测试修改角色', 'test-update', 1);
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
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884608, 1655807403884576, 7, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884640, 1655807403884576, 123, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884672, 1655807403884576, 124, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884704, 1655807403884576, 125, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884736, 1655807403884576, 126, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884768, 1655807403884576, 127, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884800, 1655807403884576, 128, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884832, 1655807403884576, 129, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884864, 1655807403884576, 1000, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884896, 1655807403884576, 1001, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884928, 1655807403884576, 1002, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884960, 1655807403884576, 1003, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403884992, 1655807403884576, 1004, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885024, 1655807403884576, 1005, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885056, 1655807403884576, 1006, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885088, 1655807403884576, 1007, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885120, 1655807403884576, 1008, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885152, 1655807403884576, 1009, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885184, 1655807403884576, 1010, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885216, 1655807403884576, 1011, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885248, 1655807403884576, 1012, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885280, 1655807403884576, 1013, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885312, 1655807403884576, 1014, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885344, 1655807403884576, 1015, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885376, 1655807403884576, 1016, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885408, 1655807403884576, 1017, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885440, 1655807403884576, 1018, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885472, 1655807403884576, 200, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885504, 1655807403884576, 201, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885536, 1655807403884576, 1025, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885568, 1655807403884576, 1026, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885600, 1655807403884576, 1027, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885632, 1655807403884576, 1021, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885664, 1655807403884576, 1022, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885696, 1655807403884576, 1023, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807403885728, 1655807403884576, 1024, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988384, 1655807403884576, 7, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988416, 1655807403884576, 123, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988448, 1655807403884576, 124, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988480, 1655807403884576, 125, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988512, 1655807403884576, 126, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988544, 1655807403884576, 127, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988576, 1655807403884576, 128, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988608, 1655807403884576, 129, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988640, 1655807403884576, 1000, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988672, 1655807403884576, 1001, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988704, 1655807403884576, 1002, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988736, 1655807403884576, 1003, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988768, 1655807403884576, 1004, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988800, 1655807403884576, 1005, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988832, 1655807403884576, 1006, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988864, 1655807403884576, 1007, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988896, 1655807403884576, 1008, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988928, 1655807403884576, 1009, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988960, 1655807403884576, 1010, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621988992, 1655807403884576, 1011, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989024, 1655807403884576, 1012, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989056, 1655807403884576, 1013, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989088, 1655807403884576, 1014, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989120, 1655807403884576, 1015, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989152, 1655807403884576, 1016, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989184, 1655807403884576, 1017, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989216, 1655807403884576, 1018, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989248, 1655807403884576, 200, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989280, 1655807403884576, 201, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989312, 1655807403884576, 1025, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989344, 1655807403884576, 1026, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989376, 1655807403884576, 1027, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989408, 1655807403884576, 1021, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989440, 1655807403884576, 1022, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989472, 1655807403884576, 1023, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989504, 1655807403884576, 1024, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807621989536, 1655807403884576, 3, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194400, 1655807403884576, 7, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194432, 1655807403884576, 123, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194464, 1655807403884576, 124, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194496, 1655807403884576, 125, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194528, 1655807403884576, 126, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194560, 1655807403884576, 127, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194592, 1655807403884576, 128, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194624, 1655807403884576, 129, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194656, 1655807403884576, 1000, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194688, 1655807403884576, 1001, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194720, 1655807403884576, 1002, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194752, 1655807403884576, 1003, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194784, 1655807403884576, 1004, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194816, 1655807403884576, 1005, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194848, 1655807403884576, 1006, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194880, 1655807403884576, 1007, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194912, 1655807403884576, 1008, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194944, 1655807403884576, 1009, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691194976, 1655807403884576, 1010, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195008, 1655807403884576, 1011, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195040, 1655807403884576, 1012, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195072, 1655807403884576, 1013, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195104, 1655807403884576, 1014, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195136, 1655807403884576, 1015, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195168, 1655807403884576, 1016, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195200, 1655807403884576, 1017, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195232, 1655807403884576, 1018, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195264, 1655807403884576, 200, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195296, 1655807403884576, 201, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195328, 1655807403884576, 1025, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195360, 1655807403884576, 1026, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195392, 1655807403884576, 1027, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195424, 1655807403884576, 1021, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195456, 1655807403884576, 1022, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195488, 1655807403884576, 1023, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195520, 1655807403884576, 1024, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807691195552, 1655807403884576, 3, -1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343488, 1655807403884576, 7, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343520, 1655807403884576, 3, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343552, 1655807403884576, 123, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343584, 1655807403884576, 124, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343616, 1655807403884576, 125, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343648, 1655807403884576, 126, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343680, 1655807403884576, 127, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343712, 1655807403884576, 128, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343744, 1655807403884576, 129, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343776, 1655807403884576, 1000, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343808, 1655807403884576, 1001, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343840, 1655807403884576, 1002, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343872, 1655807403884576, 1003, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343904, 1655807403884576, 1004, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343936, 1655807403884576, 1005, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802343968, 1655807403884576, 1006, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344000, 1655807403884576, 1007, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344032, 1655807403884576, 1008, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344064, 1655807403884576, 1009, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344096, 1655807403884576, 1010, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344128, 1655807403884576, 1011, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344160, 1655807403884576, 1012, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344192, 1655807403884576, 1013, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344224, 1655807403884576, 1014, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344256, 1655807403884576, 1015, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344288, 1655807403884576, 1016, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344320, 1655807403884576, 1017, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344352, 1655807403884576, 1018, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344384, 1655807403884576, 200, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344416, 1655807403884576, 201, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344448, 1655807403884576, 1025, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344480, 1655807403884576, 1026, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344512, 1655807403884576, 1027, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344544, 1655807403884576, 1021, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344576, 1655807403884576, 1022, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344608, 1655807403884576, 1023, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344640, 1655807403884576, 1024, 1);
INSERT INTO `auth_role_permission` (`id`, `role_id`, `permission_id`, `del_flag`) VALUES (1655807802344672, 1655807403884576, 2, 1);
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
  `avatar_id` bigint DEFAULT NULL COMMENT '头像id',
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
INSERT INTO `auth_user` (`id`, `username`, `password`, `nickname`, `sex`, `avatar_id`, `phone`, `user_type`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, 'admin', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '超级管理员', 'male', 2, '15312665707', 'manager', '2024-07-14 01:06:28', NULL, '2024-07-17 21:42:06', 1623626795188256, 1);
INSERT INTO `auth_user` (`id`, `username`, `password`, `nickname`, `sex`, `avatar_id`, `phone`, `user_type`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1648725644541984, 'sysUser', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '系统管理测试用户', 'male', 4, '153126666666', 'manager', '2024-11-29 13:34:11', 1, '2024-11-29 13:34:11', 1648725644541984, 1);
INSERT INTO `auth_user` (`id`, `username`, `password`, `nickname`, `sex`, `avatar_id`, `phone`, `user_type`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1651450646102112, 'zhonghanlu', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '仲寒露', 'male', 0, '15312665707', 'manager', '2024-12-14 14:30:34', 1, '2025-01-07 15:35:13', 1651450646102112, 1);
INSERT INTO `auth_user` (`id`, `username`, `password`, `nickname`, `sex`, `avatar_id`, `phone`, `user_type`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1653278597185600, 'wang', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '王总', 'male', 0, '15312447575', 'manager', '2024-12-24 16:37:50', 1651450646102112, '2024-12-24 16:37:50', 1651450646102112, 1);
INSERT INTO `auth_user` (`id`, `username`, `password`, `nickname`, `sex`, `avatar_id`, `phone`, `user_type`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1662514857246784, '1541244574', '207cf410532f92a47dee245ce9b11ff71f578ebd763eb3bbea44ebd043d018fb', '测试删除', 'male', 1, '1541244574', 'manager', '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, 1);
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
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1651451306704928, 1648728391811104, '系统管理人员3', 1651450646102112, 'zhonhanlu', -1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1655807437439008, 1648728391811104, '系统管理人员3', 1651450646102112, 'zhonghanlu', 1);
INSERT INTO `auth_user_role` (`id`, `role_id`, `role_name`, `user_id`, `username`, `del_flag`) VALUES (1655807437439040, 1655807403884576, '测试修改角色', 1651450646102112, 'zhonghanlu', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_class_grade
-- ----------------------------
DROP TABLE IF EXISTS `bm_class_grade`;
CREATE TABLE `bm_class_grade` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `tea_id` bigint DEFAULT NULL COMMENT '教师 id',
  `tea_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师名称',
  `classroom_id` bigint DEFAULT NULL COMMENT '教室 id',
  `classroom_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室名',
  `cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型',
  `class_grade_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级类型 长期 体验',
  `intention_cur_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '意向上课时间',
  `class_grade_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级状态',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='班级数据表';

-- ----------------------------
-- Records of bm_class_grade
-- ----------------------------
BEGIN;
INSERT INTO `bm_class_grade` (`id`, `class_grade_name`, `tea_id`, `tea_name`, `classroom_id`, `classroom_name`, `cur_type`, `class_grade_type`, `intention_cur_time`, `class_grade_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286624, 'python82班', 1651450646102048, '仲寒露', 1646195281756192, '西教室', 'python', 'long', 'long_saturday_down_one', 'normal', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_class_grade` (`id`, `class_grade_name`, `tea_id`, `tea_name`, `classroom_id`, `classroom_name`, `cur_type`, `class_grade_type`, `intention_cur_time`, `class_grade_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286752, 'python83班', 1651450646102048, '仲寒露', 1646195281756192, '西教室', 'python', 'long', 'long_saturday_down_two', 'normal', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_class_grade` (`id`, `class_grade_name`, `tea_id`, `tea_name`, `classroom_id`, `classroom_name`, `cur_type`, `class_grade_type`, `intention_cur_time`, `class_grade_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286816, 'python84班', 1651450646102048, '仲寒露', 1646195281756192, '西教室', 'python', 'long', 'long_saturday_up_one', 'normal', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_class_grade` (`id`, `class_grade_name`, `tea_id`, `tea_name`, `classroom_id`, `classroom_name`, `cur_type`, `class_grade_type`, `intention_cur_time`, `class_grade_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098287008, 'python85班', 1653278597185568, '王总', 1646205509566496, '一个教室', 'python', 'long', 'long_saturday_up_one', 'normal', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_class_hour_convert
-- ----------------------------
DROP TABLE IF EXISTS `bm_class_hour_convert`;
CREATE TABLE `bm_class_hour_convert` (
  `id` bigint NOT NULL COMMENT '主键id',
  `stu_id` bigint DEFAULT NULL COMMENT '学生id',
  `from_id` bigint DEFAULT NULL COMMENT 'fromid',
  `from_class_hour` bigint DEFAULT NULL COMMENT 'from课时',
  `from_cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'from类型',
  `to_id` bigint DEFAULT NULL COMMENT 'toid',
  `to_class_hour` bigint DEFAULT NULL COMMENT 'to课时',
  `to_cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'to类型',
  `modify_time` datetime DEFAULT NULL COMMENT '操作时间',
  `modify_by` bigint DEFAULT NULL COMMENT '操作人',
  `modify_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='课时转换记录表';

-- ----------------------------
-- Records of bm_class_hour_convert
-- ----------------------------
BEGIN;
INSERT INTO `bm_class_hour_convert` (`id`, `stu_id`, `from_id`, `from_class_hour`, `from_cur_type`, `to_id`, `to_class_hour`, `to_cur_type`, `modify_time`, `modify_by`, `modify_name`) VALUES (1656164773265472, 1651474167758880, 1651475843383391, 875000, 'cpp', 1656164773265440, 1750000, 'scratch', '2025-01-09 14:55:04', 1651450646102112, 'zhonghanlu');
INSERT INTO `bm_class_hour_convert` (`id`, `stu_id`, `from_id`, `from_class_hour`, `from_cur_type`, `to_id`, `to_class_hour`, `to_cur_type`, `modify_time`, `modify_by`, `modify_name`) VALUES (1656164819402784, 1651474167758880, 1656164773265440, 1750000, 'scratch', 1651475843383391, 875000, 'cpp', '2025-01-09 14:55:26', 1651450646102112, 'zhonghanlu');
INSERT INTO `bm_class_hour_convert` (`id`, `stu_id`, `from_id`, `from_class_hour`, `from_cur_type`, `to_id`, `to_class_hour`, `to_cur_type`, `modify_time`, `modify_by`, `modify_name`) VALUES (1656164848762912, 1651474167758880, 1651475843383391, 875000, 'cpp', 1656164773265440, 1750000, 'scratch', '2025-01-09 14:55:41', 1651450646102112, 'zhonghanlu');
INSERT INTO `bm_class_hour_convert` (`id`, `stu_id`, `from_id`, `from_class_hour`, `from_cur_type`, `to_id`, `to_class_hour`, `to_cur_type`, `modify_time`, `modify_by`, `modify_name`) VALUES (1656164884414496, 1651474167758880, 1656164773265440, 1750000, 'scratch', 1651475843383392, 1166700, 'python', '2025-01-09 14:55:57', 1651450646102112, 'zhonghanlu');
INSERT INTO `bm_class_hour_convert` (`id`, `stu_id`, `from_id`, `from_class_hour`, `from_cur_type`, `to_id`, `to_class_hour`, `to_cur_type`, `modify_time`, `modify_by`, `modify_name`) VALUES (1656164915871776, 1651474167758880, 1651475843383392, 1166700, 'python', 1651475843383391, 876000, 'cpp', '2025-01-09 14:56:12', 1651450646102112, 'zhonghanlu');
INSERT INTO `bm_class_hour_convert` (`id`, `stu_id`, `from_id`, `from_class_hour`, `from_cur_type`, `to_id`, `to_class_hour`, `to_cur_type`, `modify_time`, `modify_by`, `modify_name`) VALUES (1662159727624256, 1651473941266464, 1651475612696672, 480000, 'python', 1662159727624224, 360000, 'cpp', '2025-02-11 16:58:42', 1651450646102112, 'zhonghanlu');
INSERT INTO `bm_class_hour_convert` (`id`, `stu_id`, `from_id`, `from_class_hour`, `from_cur_type`, `to_id`, `to_class_hour`, `to_cur_type`, `modify_time`, `modify_by`, `modify_name`) VALUES (1662159801024544, 1651473941266464, 1662159727624224, 360000, 'cpp', 1651475612696672, 480000, 'python', '2025-02-11 16:59:16', 1651450646102112, 'zhonghanlu');
COMMIT;

-- ----------------------------
-- Table structure for bm_classroom
-- ----------------------------
DROP TABLE IF EXISTS `bm_classroom`;
CREATE TABLE `bm_classroom` (
  `id` bigint NOT NULL COMMENT '主键id',
  `room_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室名称',
  `room_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室状态',
  `room_size` int DEFAULT NULL COMMENT '教室空间（最大容纳人数）',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='教室表';

-- ----------------------------
-- Records of bm_classroom
-- ----------------------------
BEGIN;
INSERT INTO `bm_classroom` (`id`, `room_name`, `room_status`, `room_size`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1646195281756192, '西教室', 'enable', 7, NULL, '2024-11-15 14:24:40', 1, '2024-11-15 15:49:31', 1);
INSERT INTO `bm_classroom` (`id`, `room_name`, `room_status`, `room_size`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1646205509566496, '一个教室', 'enable', 6, 1, '2024-11-15 15:45:57', 1651450646102112, '2025-02-13 16:16:02', 1);
INSERT INTO `bm_classroom` (`id`, `room_name`, `room_status`, `room_size`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209504, '西北教室', 'enable', 10, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', -1);
COMMIT;

-- ----------------------------
-- Table structure for bm_classroom_intention
-- ----------------------------
DROP TABLE IF EXISTS `bm_classroom_intention`;
CREATE TABLE `bm_classroom_intention` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `classroom_id` bigint DEFAULT NULL COMMENT '教室 id',
  `classroom_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室名称',
  `room_size` int DEFAULT NULL COMMENT '房间大小',
  `intention_cur_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '意向上课时间',
  `class_grade_id` bigint DEFAULT NULL COMMENT '班级 id',
  `class_grade_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `create_by` bigint DEFAULT NULL COMMENT '创建人 id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人 id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='教室与意向时间关系表';

-- ----------------------------
-- Records of bm_classroom_intention
-- ----------------------------
BEGIN;
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123360, 1646195281756192, '西教室', 7, 'short_monday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123392, 1646195281756192, '西教室', 7, 'short_monday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123424, 1646195281756192, '西教室', 7, 'short_monday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123456, 1646195281756192, '西教室', 7, 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123488, 1646195281756192, '西教室', 7, 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123520, 1646195281756192, '西教室', 7, 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123552, 1646195281756192, '西教室', 7, 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123584, 1646195281756192, '西教室', 7, 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123616, 1646195281756192, '西教室', 7, 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123648, 1646195281756192, '西教室', 7, 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123680, 1646195281756192, '西教室', 7, 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123712, 1646195281756192, '西教室', 7, 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123744, 1646195281756192, '西教室', 7, 'short_friday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123776, 1646195281756192, '西教室', 7, 'short_friday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123808, 1646195281756192, '西教室', 7, 'short_friday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123840, 1646195281756192, '西教室', 7, 'long_saturday_up_one', 1654906098286816, 'python84班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123872, 1646195281756192, '西教室', 7, 'long_saturday_down_one', 1654906098286624, 'python82班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123904, 1646195281756192, '西教室', 7, 'long_saturday_down_two', 1654906098286752, 'python83班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123936, 1646195281756192, '西教室', 7, 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209123968, 1646195281756192, '西教室', 7, 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124000, 1646195281756192, '西教室', 7, 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124032, 1646205509566496, '一个教室', 5, 'short_monday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124064, 1646205509566496, '一个教室', 5, 'short_monday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124096, 1646205509566496, '一个教室', 5, 'short_monday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124128, 1646205509566496, '一个教室', 5, 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124160, 1646205509566496, '一个教室', 5, 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124192, 1646205509566496, '一个教室', 5, 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124224, 1646205509566496, '一个教室', 5, 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124256, 1646205509566496, '一个教室', 5, 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124288, 1646205509566496, '一个教室', 5, 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124320, 1646205509566496, '一个教室', 5, 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124352, 1646205509566496, '一个教室', 5, 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124384, 1646205509566496, '一个教室', 5, 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124416, 1646205509566496, '一个教室', 5, 'short_friday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124448, 1646205509566496, '一个教室', 5, 'short_friday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124480, 1646205509566496, '一个教室', 5, 'short_friday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124512, 1646205509566496, '一个教室', 5, 'long_saturday_up_one', 1654906098287008, 'python85班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124544, 1646205509566496, '一个教室', 5, 'long_saturday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124576, 1646205509566496, '一个教室', 5, 'long_saturday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124608, 1646205509566496, '一个教室', 5, 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124640, 1646205509566496, '一个教室', 5, 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812209124672, 1646205509566496, '一个教室', 5, 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209536, 1662516799209504, '西北教室', 10, 'short_monday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209568, 1662516799209504, '西北教室', 10, 'short_monday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209600, 1662516799209504, '西北教室', 10, 'short_monday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209632, 1662516799209504, '西北教室', 10, 'short_tuesday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209664, 1662516799209504, '西北教室', 10, 'short_tuesday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209696, 1662516799209504, '西北教室', 10, 'short_tuesday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209728, 1662516799209504, '西北教室', 10, 'short_wednesday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209760, 1662516799209504, '西北教室', 10, 'short_wednesday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209792, 1662516799209504, '西北教室', 10, 'short_wednesday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209824, 1662516799209504, '西北教室', 10, 'short_thursday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209856, 1662516799209504, '西北教室', 10, 'short_thursday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209888, 1662516799209504, '西北教室', 10, 'short_thursday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209920, 1662516799209504, '西北教室', 10, 'short_friday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209952, 1662516799209504, '西北教室', 10, 'short_friday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799209984, 1662516799209504, '西北教室', 10, 'short_friday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799210016, 1662516799209504, '西北教室', 10, 'long_saturday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799210048, 1662516799209504, '西北教室', 10, 'long_saturday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799210080, 1662516799209504, '西北教室', 10, 'long_saturday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799210112, 1662516799209504, '西北教室', 10, 'long_sunday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799210144, 1662516799209504, '西北教室', 10, 'long_sunday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
INSERT INTO `bm_classroom_intention` (`id`, `classroom_id`, `classroom_name`, `room_size`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662516799210176, 1662516799209504, '西北教室', 10, 'long_sunday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:16:27', 1651450646102112, '2025-02-13 16:16:27', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_course
-- ----------------------------
DROP TABLE IF EXISTS `bm_course`;
CREATE TABLE `bm_course` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `course_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型',
  `course_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `week_one` int DEFAULT NULL COMMENT '周几',
  `course_start_time` datetime DEFAULT NULL COMMENT '课程开始时间',
  `course_end_time` datetime DEFAULT NULL COMMENT '课程结束时间',
  `class_person_size` int DEFAULT NULL COMMENT '班级人数',
  `class_room_id` bigint DEFAULT NULL COMMENT '教室 id',
  `class_room_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教室名称',
  `tea_id` bigint DEFAULT NULL COMMENT '教师 id',
  `tea_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师名称',
  `class_grade_id` bigint DEFAULT NULL COMMENT '班级 id',
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `course_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程状态 待上课 已上课 已结束 已过期',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='课程表';

-- ----------------------------
-- Records of bm_course
-- ----------------------------
BEGIN;
INSERT INTO `bm_course` (`id`, `course_type`, `course_name`, `week_one`, `course_start_time`, `course_end_time`, `class_person_size`, `class_room_id`, `class_room_name`, `tea_id`, `tea_name`, `class_grade_id`, `class_grade_name`, `course_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654909233528896, 'python', '认识计算机', 6, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 5, 1646195281756192, '西教室', 1651450646102048, '仲寒露', 1654906098286816, 'python84班', 'class_has_end', 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-02-15 18:10:12', 1);
INSERT INTO `bm_course` (`id`, `course_type`, `course_name`, `week_one`, `course_start_time`, `course_end_time`, `class_person_size`, `class_room_id`, `class_room_name`, `tea_id`, `tea_name`, `class_grade_id`, `class_grade_name`, `course_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654909233529088, 'python', 'python环境变量', 6, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 3, 1646205509566496, '一个教室', 1653278597185568, '王总', 1654906098287008, 'python85班', 'wait_for_class', 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
INSERT INTO `bm_course` (`id`, `course_type`, `course_name`, `week_one`, `course_start_time`, `course_end_time`, `class_person_size`, `class_room_id`, `class_room_name`, `tea_id`, `tea_name`, `class_grade_id`, `class_grade_name`, `course_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654909233529216, 'python', 'python分支结构', 6, '2025-01-04 14:00:00', '2025-01-04 16:00:00', 3, 1646195281756192, '西教室', 1651450646102048, '仲寒露', 1654906098286624, 'python82班', 'class_has_started', 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-02-14 17:28:00', 1);
INSERT INTO `bm_course` (`id`, `course_type`, `course_name`, `week_one`, `course_start_time`, `course_end_time`, `class_person_size`, `class_room_id`, `class_room_name`, `tea_id`, `tea_name`, `class_grade_id`, `class_grade_name`, `course_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654909233529344, 'python', 'python循环语句', 6, '2025-01-04 16:30:00', '2025-01-04 18:30:00', 1, 1646195281756192, '西教室', 1651450646102048, '仲寒露', 1654906098286752, 'python83班', 'wait_for_class', 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_course_notes
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_notes`;
CREATE TABLE `bm_course_notes` (
  `id` bigint NOT NULL COMMENT '主键id',
  `course_id` bigint DEFAULT NULL COMMENT '课程id',
  `file_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件类型：讲义；作业',
  `file_id` bigint DEFAULT NULL COMMENT '文件id',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='课程讲义与课堂作业';

-- ----------------------------
-- Records of bm_course_notes
-- ----------------------------
BEGIN;
INSERT INTO `bm_course_notes` (`id`, `course_id`, `file_type`, `file_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662892896157728, 1654909233528896, 'handouts', 1, 1651450646102112, '2025-02-15 18:05:24', 1651450646102112, '2025-02-15 18:05:24', 1);
INSERT INTO `bm_course_notes` (`id`, `course_id`, `file_type`, `file_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662892896157760, 1654909233528896, 'task', 2, 1651450646102112, '2025-02-15 18:05:24', 1651450646102112, '2025-02-15 18:05:24', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_course_ration
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_ration`;
CREATE TABLE `bm_course_ration` (
  `id` bigint NOT NULL COMMENT '主键id',
  `cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课时类型',
  `ratio` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='机构课程类型比例表';

-- ----------------------------
-- Records of bm_course_ration
-- ----------------------------
BEGIN;
INSERT INTO `bm_course_ration` (`id`, `cur_type`, `ratio`) VALUES (1, 'cpp', '2');
INSERT INTO `bm_course_ration` (`id`, `cur_type`, `ratio`) VALUES (2, 'python', '1.5');
INSERT INTO `bm_course_ration` (`id`, `cur_type`, `ratio`) VALUES (3, 'scratch', '1');
COMMIT;

-- ----------------------------
-- Table structure for bm_course_schedule
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_schedule`;
CREATE TABLE `bm_course_schedule` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `cur_schedule_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课表名称',
  `cur_schedule_star_time` datetime DEFAULT NULL COMMENT '课表开始时间',
  `cur_schedule_end_time` datetime DEFAULT NULL COMMENT '课表结束时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='课表主表';

-- ----------------------------
-- Records of bm_course_schedule
-- ----------------------------
BEGIN;
INSERT INTO `bm_course_schedule` (`id`, `cur_schedule_name`, `cur_schedule_star_time`, `cur_schedule_end_time`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654909233528864, '元旦第一周', '2025-01-03 00:00:00', '2025-01-05 00:00:00', 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
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
  `cur_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `cur_schedule_id` bigint DEFAULT NULL COMMENT '课表主体 id',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='课表内容主体表';

-- ----------------------------
-- Records of bm_course_schedule_item
-- ----------------------------
BEGIN;
INSERT INTO `bm_course_schedule_item` (`id`, `range_start_time`, `range_end_time`, `cur_id`, `cur_name`, `cur_schedule_id`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654909235626016, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 1654909233528896, '认识计算机', 1654909233528864, 0, 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
INSERT INTO `bm_course_schedule_item` (`id`, `range_start_time`, `range_end_time`, `cur_id`, `cur_name`, `cur_schedule_id`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654909235626048, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 1654909233529088, 'python环境变量', 1654909233528864, 0, 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
INSERT INTO `bm_course_schedule_item` (`id`, `range_start_time`, `range_end_time`, `cur_id`, `cur_name`, `cur_schedule_id`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654909235626080, '2025-01-04 14:00:00', '2025-01-04 16:00:00', 1654909233529216, 'python分支结构', 1654909233528864, 0, 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
INSERT INTO `bm_course_schedule_item` (`id`, `range_start_time`, `range_end_time`, `cur_id`, `cur_name`, `cur_schedule_id`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654909235626112, '2025-01-04 16:30:00', '2025-01-04 18:30:00', 1654909233529344, 'python循环语句', 1654909233528864, 0, 1651450646102112, '2025-01-02 16:36:57', 1651450646102112, '2025-01-02 16:36:57', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_course_stu_pic
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_stu_pic`;
CREATE TABLE `bm_course_stu_pic` (
  `id` bigint NOT NULL COMMENT '主键id',
  `course_id` bigint DEFAULT NULL COMMENT '课程id',
  `stu_id` bigint DEFAULT NULL COMMENT '学生id',
  `pic_id` bigint DEFAULT NULL COMMENT '图片id',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='学生上课图片信息';

-- ----------------------------
-- Records of bm_course_stu_pic
-- ----------------------------
BEGIN;
INSERT INTO `bm_course_stu_pic` (`id`, `course_id`, `stu_id`, `pic_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662886925565984, 1654909233528896, 1651455106744352, 1, 1651450646102112, '2025-02-15 17:17:57', 1651450646102112, '2025-02-15 17:17:57', 1);
INSERT INTO `bm_course_stu_pic` (`id`, `course_id`, `stu_id`, `pic_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662886961217568, 1654909233528896, 1651455106744352, 1, 1651450646102112, '2025-02-15 17:18:13', 1651450646102112, '2025-02-15 17:18:13', 1);
INSERT INTO `bm_course_stu_pic` (`id`, `course_id`, `stu_id`, `pic_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662886961217600, 1654909233528896, 1651455106744352, 1, 1651450646102112, '2025-02-15 17:18:14', 1651450646102112, '2025-02-15 17:18:14', 1);
INSERT INTO `bm_course_stu_pic` (`id`, `course_id`, `stu_id`, `pic_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662887189807136, 1654909233528896, 1651455106744352, 2, 1651450646102112, '2025-02-15 17:20:03', 1651450646102112, '2025-02-15 17:20:03', 1);
INSERT INTO `bm_course_stu_pic` (`id`, `course_id`, `stu_id`, `pic_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662890232774688, 1654909233528896, 1651473997889568, 2, 1651450646102112, '2025-02-15 17:44:13', 1651450646102112, '2025-02-15 17:44:13', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_course_stu_sign
-- ----------------------------
DROP TABLE IF EXISTS `bm_course_stu_sign`;
CREATE TABLE `bm_course_stu_sign` (
  `id` bigint NOT NULL COMMENT '主键id',
  `course_id` bigint DEFAULT NULL COMMENT '课程id',
  `stu_id` bigint DEFAULT NULL COMMENT '学生id',
  `sign_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '签到状态',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='学生上课签到表';

-- ----------------------------
-- Records of bm_course_stu_sign
-- ----------------------------
BEGIN;
INSERT INTO `bm_course_stu_sign` (`id`, `course_id`, `stu_id`, `sign_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662884690001952, 1654909233528896, 1651455106744352, 'arrived', 1651450646102112, '2025-02-15 17:00:11', 1651450646102112, '2025-02-15 17:00:11', 1);
INSERT INTO `bm_course_stu_sign` (`id`, `course_id`, `stu_id`, `sign_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662884690001984, 1654909233528896, 1651473914003488, 'arrived', 1651450646102112, '2025-02-15 17:00:11', 1651450646102112, '2025-02-15 17:00:11', 1);
INSERT INTO `bm_course_stu_sign` (`id`, `course_id`, `stu_id`, `sign_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662884690002016, 1654909233528896, 1651473941266464, 'arrived', 1651450646102112, '2025-02-15 17:00:11', 1651450646102112, '2025-02-15 17:00:11', 1);
INSERT INTO `bm_course_stu_sign` (`id`, `course_id`, `stu_id`, `sign_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662884690002048, 1654909233528896, 1651473997889568, 'arrived', 1651450646102112, '2025-02-15 17:00:11', 1651450646102112, '2025-02-15 17:00:11', 1);
INSERT INTO `bm_course_stu_sign` (`id`, `course_id`, `stu_id`, `sign_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662884690002080, 1654909233528896, 1651474115330080, 'non_arrived', 1651450646102112, '2025-02-15 17:00:11', 1651450646102112, '2025-02-15 17:00:11', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_handler_class
-- ----------------------------
DROP TABLE IF EXISTS `bm_handler_class`;
CREATE TABLE `bm_handler_class` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `stu_id` bigint DEFAULT NULL COMMENT '学生 id',
  `stu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `intention_cur_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '意向上课时间',
  `consume_time` datetime DEFAULT NULL COMMENT '核销时间',
  `cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型',
  `product_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型 长期 体验',
  `handler_class_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分班状态：待分班、已分班',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='待分班数据表';

-- ----------------------------
-- Records of bm_handler_class
-- ----------------------------
BEGIN;
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1, 1651474167758881, '啊玩玩1', 'long_saturday_up_one', '2024-12-20 16:08:09', 'cpp', 'long', 'handler_class_ed', NULL, NULL, 1651450646102112, '2025-02-13 17:09:49', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (2, 1651474167758882, '啊玩玩2', 'long_saturday_up_one', '2024-12-20 16:09:07', 'python', 'long', 'handler_class_ed', NULL, NULL, NULL, NULL, 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651460565631136, 1651455106744352, '王思思', 'long_saturday_up_one', '2024-12-14 15:49:23', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 15:49:23', 1651450646102112, '2024-12-14 15:49:23', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475497353376, 1651473914003488, '王丝丝', 'long_saturday_up_one', '2024-12-14 17:48:04', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:48:04', 1651450646102112, '2024-12-14 17:48:04', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475612696736, 1651473941266464, '仲丝丝', 'long_saturday_up_one', '2024-12-14 17:48:59', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:48:59', 1651450646102112, '2024-12-14 17:48:59', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475673514144, 1651473970626592, '仲嘻嘻', 'long_saturday_down_one', '2024-12-14 17:49:27', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:49:27', 1651450646102112, '2024-12-14 17:49:27', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475698679968, 1651473997889568, '王嘻嘻', 'long_saturday_up_one', '2024-12-14 17:49:40', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:49:40', 1651450646102112, '2024-12-14 17:49:40', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475728040032, 1651474025152544, '王哈哈', 'long_saturday_down_one', '2024-12-14 17:49:53', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:49:53', 1651450646102112, '2024-12-14 17:49:53', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475755303072, 1651474046124064, '李哈哈', 'long_saturday_down_one', '2024-12-14 17:50:06', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:50:06', 1651450646102112, '2024-12-14 17:50:06', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475793051808, 1651474071289888, '李哦哦', 'long_saturday_down_two', '2024-12-14 17:50:24', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:50:24', 1651450646102112, '2024-12-14 17:50:24', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475816120480, 1651474115330080, '藏哦哦', 'long_saturday_up_one', '2024-12-14 17:50:36', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:50:36', 1651450646102112, '2024-12-14 17:50:36', 1);
INSERT INTO `bm_handler_class` (`id`, `stu_id`, `stu_name`, `intention_cur_time`, `consume_time`, `cur_type`, `product_type`, `handler_class_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651475843383456, 1651474167758880, '齐哦哦', 'long_saturday_up_one', '2024-12-14 17:50:48', 'python', 'long', 'handler_class_ed', 1651450646102112, '2024-12-14 17:50:48', 1651450646102112, '2024-12-14 17:50:48', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_handler_class_order_relation
-- ----------------------------
DROP TABLE IF EXISTS `bm_handler_class_order_relation`;
CREATE TABLE `bm_handler_class_order_relation` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `handler_class_id` bigint DEFAULT NULL COMMENT '核销人（待分班）id',
  `order_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单类型：补单 普通订单',
  `cur_order_id` bigint DEFAULT NULL COMMENT '课程订单 id',
  `cur_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='待分班与课程订单关联表';

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
  `idea_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '意见类型',
  `idea_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '意见内容',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='意见箱表';

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
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型',
  `cur_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `cur_id` bigint DEFAULT NULL COMMENT '课程 id',
  `week_one` int DEFAULT NULL COMMENT '周几',
  `lack_start_time` datetime DEFAULT NULL COMMENT '缺课开始时间',
  `lack_end_time` datetime DEFAULT NULL COMMENT '缺课结束时间',
  `stu_id` bigint DEFAULT NULL COMMENT '学生姓名 id',
  `stu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `lack_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态（未补课，已补课）',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='缺课数据表';

-- ----------------------------
-- Records of bm_lack_course
-- ----------------------------
BEGIN;
INSERT INTO `bm_lack_course` (`id`, `class_grade_id`, `class_grade_name`, `cur_type`, `cur_name`, `cur_id`, `week_one`, `lack_start_time`, `lack_end_time`, `stu_id`, `stu_name`, `lack_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1647483771944992, 1647456745947168, 'python一班', 'python', 'scratch一班2次课', 1647459832954912, 6, '2024-11-22 17:10:32', '2024-11-22 17:10:32', 1646206692360224, '宁宁', 'yes', NULL, '2024-11-22 17:04:40', NULL, '2024-11-22 17:04:40', -1);
INSERT INTO `bm_lack_course` (`id`, `class_grade_id`, `class_grade_name`, `cur_type`, `cur_name`, `cur_id`, `week_one`, `lack_start_time`, `lack_end_time`, `stu_id`, `stu_name`, `lack_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1655073929166880, 1654906098286816, 'python84班', 'python', '认识计算机', 1654909233528896, 6, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 1651455106744352, '王思思', 'no', 1651450646102112, '2025-01-03 14:25:50', 1651450646102112, '2025-01-03 14:25:50', 1);
INSERT INTO `bm_lack_course` (`id`, `class_grade_id`, `class_grade_name`, `cur_type`, `cur_name`, `cur_id`, `week_one`, `lack_start_time`, `lack_end_time`, `stu_id`, `stu_name`, `lack_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662893500137504, 1654906098286816, 'python84班', 'python', '认识计算机', 1654909233528896, 6, '2025-01-04 10:00:00', '2025-01-04 12:00:00', 1651474115330080, '藏哦哦', 'no', 1651450646102112, '2025-02-15 18:10:12', 1651450646102112, '2025-02-15 18:10:12', 1);
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
  `order_product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单商品名称',
  `order_consume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单核销人',
  `order_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单状态',
  `order_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单人手机号',
  `order_consumed_id` bigint DEFAULT NULL COMMENT '被核销人（此处指学生）',
  `order_consumed_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='订单表';

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
  `org_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构状态yes no 是否地图注册',
  `org_head_a` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构负责人 A',
  `org_head_b` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '机构负责人B',
  `org_business_license_id` bigint DEFAULT NULL COMMENT '机构营业执照',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1未删除，-1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='机构表';

-- ----------------------------
-- Records of bm_org
-- ----------------------------
BEGIN;
INSERT INTO `bm_org` (`id`, `org_name`, `org_address`, `org_longitude`, `org_latitude`, `org_described`, `org_status`, `org_head_a`, `org_head_b`, `org_business_license_id`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1645826375942176, '启智编梦', '江苏省徐州市睢宁县', '11111', '22222', '是俩位怀揣着梦想的少年打造的少儿编程机构', 'yes', '仲寒露', '王斯亮', 1, '2024-11-13 13:32:52', NULL, '2025-02-13 16:34:23', 1651450646102112, 1);
INSERT INTO `bm_org` (`id`, `org_name`, `org_address`, `org_longitude`, `org_latitude`, `org_described`, `org_status`, `org_head_a`, `org_head_b`, `org_business_license_id`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1645831847411744, '测试机构', '111', '1', '1', '1', 'no', '1', '1', 2, '2024-11-13 14:16:22', 1, '2024-11-13 14:16:22', 1651450646102112, -1);
INSERT INTO `bm_org` (`id`, `org_name`, `org_address`, `org_longitude`, `org_latitude`, `org_described`, `org_status`, `org_head_a`, `org_head_b`, `org_business_license_id`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1646203615838240, '极客晨星', '江苏省徐州市睢宁县中央大街', '11111.1111', '22222.2222', '我是一个机构我有很大的实力', 'no', '王', '嘿嘿', 3, '2024-11-15 15:30:54', 1, '2024-11-15 15:30:54', 1, 1);
INSERT INTO `bm_org` (`id`, `org_name`, `org_address`, `org_longitude`, `org_latitude`, `org_described`, `org_status`, `org_head_a`, `org_head_b`, `org_business_license_id`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1662519135436832, '测试删除', '12321', '111', '111', '111', 'yes', '111', '11', 1111, '2025-02-13 16:35:01', 1651450646102112, '2025-02-13 16:35:01', 1651450646102112, 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_pat_stu_relation
-- ----------------------------
DROP TABLE IF EXISTS `bm_pat_stu_relation`;
CREATE TABLE `bm_pat_stu_relation` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `patriarch_id` bigint DEFAULT NULL COMMENT '家长 id',
  `patriarch_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家长姓名',
  `student_id` bigint DEFAULT NULL COMMENT '学生 id',
  `student_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='家长和学生关联信息表';

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
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662161352917056, 1651452290269216, '宁小小', 1662161352917024, '测试删除', 1651450646102112, '2025-02-11 17:11:37', 1651450646102112, '2025-02-11 17:11:37', -1);
INSERT INTO `bm_pat_stu_relation` (`id`, `patriarch_id`, `patriarch_name`, `student_id`, `student_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662161355014208, 1651452290269216, '宁小小', 1662161355014176, '测试删除', 1651450646102112, '2025-02-11 17:11:38', 1651450646102112, '2025-02-11 17:11:38', 1);
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
  `patch_product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补单商品名称',
  `patch_consume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补单核销人',
  `patch_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补单人手机号',
  `patch_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补单状态',
  `patch_handler_id` bigint DEFAULT NULL COMMENT '补单操作人id',
  `patch_handler_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补单操作人姓名',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='补单（便于线下收款）';

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
  `pat_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家长姓名',
  `pat_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家长手机号',
  `pat_wx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家长微信',
  `pat_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家长地址',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='家长表';

-- ----------------------------
-- Records of bm_patriarch
-- ----------------------------
BEGIN;
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651452290269216, 1, '宁小小', '1531266570', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 14:43:37', 1651450646102112, '2025-02-11 17:39:31', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473515544608, 0, '宁大大', '15312665708', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:19', 1651450646102112, '2024-12-14 17:32:19', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473549099040, 0, '仲小小', '15312665702', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:35', 1651450646102112, '2024-12-14 17:32:35', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473563779104, 0, '仲大大', '15311665702', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:41', 1651450646102112, '2024-12-14 17:32:41', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473580556320, 0, '王大大', '15331665702', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:49', 1651450646102112, '2024-12-14 17:32:49', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473593139232, 0, '王小小', '15331665402', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:32:56', 1651450646102112, '2024-12-14 17:32:56', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473653956640, 0, '李小小', '13331665402', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:25', 1651450646102112, '2024-12-14 17:33:25', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473666539552, 0, '李大大', '13335665402', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:31', 1651450646102112, '2024-12-14 17:33:31', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473704288288, 0, '张大大', '13335665452', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:48', 1651450646102112, '2024-12-14 17:33:48', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473718968352, 0, '张小小', '13335645452', '15312665707', '江苏生徐州市沛县', 1651450646102112, '2024-12-14 17:33:56', 1651450646102112, '2024-12-14 17:33:56', 1);
INSERT INTO `bm_patriarch` (`id`, `pat_avatar_id`, `pat_name`, `pat_phone`, `pat_wx`, `pat_address`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662165534638112, 1, '测试删除', '15312665454', '111122222', '江苏省南京市浦口区', 1651450646102112, '2025-02-11 17:44:50', 1651450646102112, '2025-02-11 17:44:50', -1);
COMMIT;

-- ----------------------------
-- Table structure for bm_poster
-- ----------------------------
DROP TABLE IF EXISTS `bm_poster`;
CREATE TABLE `bm_poster` (
  `id` bigint NOT NULL COMMENT '主键id',
  `poster_file_id` bigint DEFAULT NULL COMMENT '图片id',
  `poster_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片地址',
  `poster_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '（线下首页推荐海报）（线下运营宣传）（小程序首页）（小程序课程）（家校一体推广）',
  `poster_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '海报状态、使用、未使用',
  `poster_opt_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '绘画人',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='海报统一管理表';

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
  `product_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程首页展示图片',
  `product_url_id` bigint DEFAULT NULL COMMENT '课程首页展示图片id',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程名称',
  `product_hour` int DEFAULT NULL COMMENT '课程课时',
  `product_price` int DEFAULT NULL COMMENT '商品价格',
  `product_reduced_price` int DEFAULT NULL COMMENT '优惠后价格',
  `recommend_age` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '推荐年龄',
  `course_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '课程详细介绍，默认写死',
  `product_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '体验 长期 课程类型',
  `course_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程语言类型',
  `class_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授课类型，线上、线下....',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程状态',
  `class_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程授课区间（周末、暑假）',
  `show_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上下架状态',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='课程商品表';

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
  `source_patriarch_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '拉新人姓名',
  `invitation_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邀请码',
  `new_patriarch_id` bigint DEFAULT NULL COMMENT '被拉新人id',
  `new_patriarch_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '被拉新人姓名',
  `reward` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '奖励',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '原因',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='拉新统一汇总表';

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
  `repair_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补课名称',
  `cur_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型',
  `week_one` int DEFAULT NULL COMMENT '周几',
  `repair_start_time` datetime DEFAULT NULL COMMENT '补课开始时间',
  `repair_end_time` datetime DEFAULT NULL COMMENT '补课结束时间',
  `repair_status` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '补课状态 yes no',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='补课数据表';

-- ----------------------------
-- Records of bm_repair_course
-- ----------------------------
BEGIN;
INSERT INTO `bm_repair_course` (`id`, `repair_name`, `cur_type`, `week_one`, `repair_start_time`, `repair_end_time`, `repair_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1647485726490656, 'cpp2补', 'cpp', 7, '2024-11-22 17:23:15', '2024-11-22 17:23:15', 'yes', NULL, '2024-11-22 17:20:12', NULL, '2024-11-22 17:23:15', 1);
INSERT INTO `bm_repair_course` (`id`, `repair_name`, `cur_type`, `week_one`, `repair_start_time`, `repair_end_time`, `repair_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1663025299849248, '补课 1', 'python', 4, '2025-02-01 00:00:00', '2025-02-02 00:00:00', 'yes', 1651450646102112, '2025-02-16 11:37:39', 1651450646102112, '2025-02-16 11:37:39', -1);
INSERT INTO `bm_repair_course` (`id`, `repair_name`, `cur_type`, `week_one`, `repair_start_time`, `repair_end_time`, `repair_status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1663025306140704, '补课 2', 'python', 4, '2025-02-01 00:00:00', '2025-02-02 00:00:00', 'yes', 1651450646102112, '2025-02-16 11:37:42', 1651450646102112, '2025-02-16 11:40:31', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_repair_relation_file
-- ----------------------------
DROP TABLE IF EXISTS `bm_repair_relation_file`;
CREATE TABLE `bm_repair_relation_file` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `repair_id` bigint DEFAULT NULL COMMENT '补课 id',
  `file_id` bigint DEFAULT NULL COMMENT '文件 id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='补课关联的文件信息';

-- ----------------------------
-- Records of bm_repair_relation_file
-- ----------------------------
BEGIN;
INSERT INTO `bm_repair_relation_file` (`id`, `repair_id`, `file_id`) VALUES (1663025702502432, 1663025306140704, 1);
INSERT INTO `bm_repair_relation_file` (`id`, `repair_id`, `file_id`) VALUES (1663025702502464, 1663025306140704, 2);
COMMIT;

-- ----------------------------
-- Table structure for bm_repair_relation_lack
-- ----------------------------
DROP TABLE IF EXISTS `bm_repair_relation_lack`;
CREATE TABLE `bm_repair_relation_lack` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `repair_id` bigint DEFAULT NULL COMMENT '补课 id',
  `lack_id` bigint DEFAULT NULL COMMENT '缺课 id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='补课关联缺课数据';

-- ----------------------------
-- Records of bm_repair_relation_lack
-- ----------------------------
BEGIN;
INSERT INTO `bm_repair_relation_lack` (`id`, `repair_id`, `lack_id`) VALUES (1663025299849280, 1663025299849248, 1655073929166880);
INSERT INTO `bm_repair_relation_lack` (`id`, `repair_id`, `lack_id`) VALUES (1663025306140736, 1663025306140704, 1655073929166880);
COMMIT;

-- ----------------------------
-- Table structure for bm_stu_class_grade
-- ----------------------------
DROP TABLE IF EXISTS `bm_stu_class_grade`;
CREATE TABLE `bm_stu_class_grade` (
  `id` bigint NOT NULL COMMENT '主键id',
  `stu_id` bigint DEFAULT NULL COMMENT '学生id',
  `stu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `course_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课程类型',
  `class_grade_id` bigint DEFAULT NULL COMMENT '班级id',
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `create_by` bigint DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='学生和班级关系';

-- ----------------------------
-- Records of bm_stu_class_grade
-- ----------------------------
BEGIN;
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286656, 1651473970626592, '仲嘻嘻', NULL, NULL, NULL, 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286688, 1651474025152544, '王哈哈', 'python', 1654906098286624, 'python82班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286720, 1651474046124064, '李哈哈', 'python', 1654906098286624, 'python82班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286784, 1651474071289888, '李哦哦', 'python', 1654906098286752, 'python83班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286848, 1651455106744352, '王思思', 'python', 1654906098286816, 'python84班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286880, 1651473914003488, '王丝丝', 'python', 1654906098286816, 'python84班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286912, 1651473941266464, '仲丝丝', 'python', 1654906098286816, 'python84班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286944, 1651473997889568, '王嘻嘻', 'python', 1654906098286816, 'python84班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098286976, 1651474115330080, '藏哦哦', 'python', 1654906098286816, 'python84班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098287040, 1651474167758882, '啊玩玩2', 'python', 1654906098287008, 'python85班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098287072, 1651474167758881, '啊玩玩1', 'python', 1654906098287008, 'python85班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
INSERT INTO `bm_stu_class_grade` (`id`, `stu_id`, `stu_name`, `course_type`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1654906098287104, 1651474167758880, '齐哦哦', 'python', 1654906098287008, 'python85班', 1651450646102112, '2025-01-02 16:12:02', 1651450646102112, '2025-01-02 16:12:02', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_stu_class_hour
-- ----------------------------
DROP TABLE IF EXISTS `bm_stu_class_hour`;
CREATE TABLE `bm_stu_class_hour` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `class_hour_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '课时类型',
  `class_hour` bigint DEFAULT NULL COMMENT '课时默认乘 100 计算逻辑',
  `stu_id` bigint DEFAULT NULL COMMENT '学生 id',
  `stu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='学生与课时关系';

-- ----------------------------
-- Records of bm_stu_class_hour
-- ----------------------------
BEGIN;
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651460565631072, 'python', 480000, 1651455106744352, '王思思');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475497353312, 'python', 460000, 1651473914003488, '王丝丝');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475612696672, 'python', 460000, 1651473941266464, '仲丝丝');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475673514080, 'python', 500000, 1651473970626592, '仲嘻嘻');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475698679904, 'python', 460000, 1651473997889568, '王嘻嘻');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475728039968, 'python', 500000, 1651474025152544, '王哈哈');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475755303008, 'python', 500000, 1651474046124064, '李哈哈');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475793051744, 'python', 500000, 1651474071289888, '李哦哦');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475816120416, 'python', 480000, 1651474115330080, '藏哦哦');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475843383391, 'cpp', 876000, 1651474167758880, '齐哦哦');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1651475843383392, 'python', 0, 1651474167758880, '齐哦哦');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1656164773265440, 'scratch', 0, 1651474167758880, '齐哦哦');
INSERT INTO `bm_stu_class_hour` (`id`, `class_hour_type`, `class_hour`, `stu_id`, `stu_name`) VALUES (1662159727624224, 'cpp', 0, 1651473941266464, '仲丝丝');
COMMIT;

-- ----------------------------
-- Table structure for bm_student
-- ----------------------------
DROP TABLE IF EXISTS `bm_student`;
CREATE TABLE `bm_student` (
  `id` bigint NOT NULL COMMENT '主键id',
  `stu_avatar_id` bigint DEFAULT NULL COMMENT '学生头像id',
  `stu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生姓名',
  `stu_sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生性别',
  `stu_birth` datetime DEFAULT NULL COMMENT '学生生日（出生日期）',
  `stu_cur_school_id` bigint DEFAULT NULL COMMENT '学校id',
  `stu_cur_school` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生当前学校',
  `stu_cur_grade_id` bigint DEFAULT NULL COMMENT '年级id',
  `stu_cur_grade` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生当前年级',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识-1已删除 1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='学生表';

-- ----------------------------
-- Records of bm_student
-- ----------------------------
BEGIN;
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651455106744352, 1, '王思思', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 15:06:01', 1651450646102112, '2024-12-14 15:06:01', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473914003488, 1, '王丝丝', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:35:29', 1651450646102112, '2024-12-14 17:35:29', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473941266464, 2, '仲丝丝', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:35:41', 1651450646102112, '2025-02-11 16:56:51', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473970626592, 1, '仲嘻嘻', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:35:56', 1651450646102112, '2024-12-14 17:35:56', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651473997889568, 1, '王嘻嘻', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:36:08', 1651450646102112, '2024-12-14 17:36:08', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474025152544, 1, '王哈哈', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:36:21', 1651450646102112, '2024-12-14 17:36:21', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474046124064, 1, '李哈哈', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:36:32', 1651450646102112, '2024-12-14 17:36:32', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474071289888, 1, '李哦哦', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:36:43', 1651450646102112, '2024-12-14 17:36:43', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474115330080, 1, '藏哦哦', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:37:05', 1651450646102112, '2024-12-14 17:37:05', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651474167758880, 1, '齐哦哦', 'male', '2010-10-12 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2024-12-14 17:37:30', 1651450646102112, '2024-12-14 17:37:30', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662161055121440, 1, '测试删除', 'male', '2008-10-10 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2025-02-11 17:09:15', 1651450646102112, '2025-02-11 17:09:15', -1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662161061412896, 1, '测试删除', 'male', '2008-10-10 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2025-02-11 17:09:17', 1651450646102112, '2025-02-11 17:09:17', -1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662161352917024, 1, '测试删除', 'male', '2008-10-10 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2025-02-11 17:11:37', 1651450646102112, '2025-02-11 17:11:37', -1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662161355014176, 1, '测试删除', 'male', '2008-10-10 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2025-02-11 17:11:38', 1651450646102112, '2025-02-11 17:11:38', 1);
INSERT INTO `bm_student` (`id`, `stu_avatar_id`, `stu_name`, `stu_sex`, `stu_birth`, `stu_cur_school_id`, `stu_cur_school`, `stu_cur_grade_id`, `stu_cur_grade`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662161359208480, 1, '测试删除', 'male', '2008-10-10 00:00:00', 6, '睢宁县实验小学', 100, '一年级', 1651450646102112, '2025-02-11 17:11:39', 1651450646102112, '2025-02-11 17:11:39', -1);
COMMIT;

-- ----------------------------
-- Table structure for bm_student_constant
-- ----------------------------
DROP TABLE IF EXISTS `bm_student_constant`;
CREATE TABLE `bm_student_constant` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型school 学校  grade 年级 ',
  `constant_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'key 值',
  `constant_value` int DEFAULT NULL COMMENT '计算值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='学生学校与年级常量数据表';

-- ----------------------------
-- Records of bm_student_constant
-- ----------------------------
BEGIN;
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (1, 'school', '睢宁县宁海小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (2, 'school', '睢宁县第五实验小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (3, 'school', '睢宁县第四实验小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (4, 'school', '睢宁县第三实验小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (5, 'school', '睢宁县第二实验小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (6, 'school', '睢宁县实验小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (7, 'school', '睢宁县东城区实验学校', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (8, 'school', '睢宁县城西实验小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (9, 'school', '睢宁县南门实验小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (10, 'school', '睢宁县新城区实验小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (11, 'school', '睢宁县高铁商务区实验小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (12, 'school', '睢宁县五里堂小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (13, 'school', '睢宁县八里小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (14, 'school', '睢宁县菁华小学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (15, 'school', '睢宁县第二中学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (16, 'school', '睢宁县南门实验学校（初中部）', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (17, 'school', '睢宁县城西实验学校（初中部）', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (18, 'school', '睢宁县新城区初级中学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (19, 'school', '睢宁县第一中学附属中学（北睢中初中）', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (20, 'school', '睢宁县附中（南睢中初中）', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (21, 'school', '睢宁县田家炳中学（初中部）', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (22, 'school', '睢宁县高铁商务区学校（初中部）', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (23, 'school', '睢宁县东城区实验学校（初中部）', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (24, 'school', '睢宁县人民路实验学校（初中部）', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (25, 'school', '睢宁县菁华（初中，高中）', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (26, 'school', '睢宁县文华（初中，高中）', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (27, 'school', '睢宁县新世纪中学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (28, 'school', '睢宁县宁海中学', 0);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (100, 'grade', '一年级', 1);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (101, 'grade', '二年级', 2);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (102, 'grade', '三年级', 3);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (103, 'grade', '四年级', 4);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (104, 'grade', '五年级', 5);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (105, 'grade', '六年级', 6);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (106, 'grade', '初一', 7);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (107, 'grade', '初二', 8);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (108, 'grade', '初三', 9);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (109, 'grade', '高一', 10);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (110, 'grade', '高二', 11);
INSERT INTO `bm_student_constant` (`id`, `type`, `constant_key`, `constant_value`) VALUES (111, 'grade', '高三', 12);
COMMIT;

-- ----------------------------
-- Table structure for bm_teacher
-- ----------------------------
DROP TABLE IF EXISTS `bm_teacher`;
CREATE TABLE `bm_teacher` (
  `id` bigint NOT NULL COMMENT '主键id',
  `tea_avatar_id` bigint DEFAULT NULL COMMENT '教师头像',
  `tea_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师名称',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师性别',
  `tea_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师手机号',
  `tea_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师邮箱',
  `tea_org_id` bigint DEFAULT NULL COMMENT '归属机构id',
  `tea_org_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '归属机构名称',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='老师表';

-- ----------------------------
-- Records of bm_teacher
-- ----------------------------
BEGIN;
INSERT INTO `bm_teacher` (`id`, `tea_avatar_id`, `tea_name`, `sex`, `tea_phone`, `tea_email`, `tea_org_id`, `tea_org_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1651450646102048, 1, '仲寒露', 'male', 'zhonhanlu', '1420865757@qq.com', 1645826375942176, '启智编梦', 1, '2024-12-14 14:30:34', 1651450646102112, '2025-02-13 15:58:09', 1);
INSERT INTO `bm_teacher` (`id`, `tea_avatar_id`, `tea_name`, `sex`, `tea_phone`, `tea_email`, `tea_org_id`, `tea_org_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653278597185568, 0, '王总', 'male', '15312447575', '147258963@163.com', 1645826375942176, '启智编梦', 1651450646102112, '2024-12-24 16:37:49', 1651450646102112, '2024-12-24 16:37:49', 1);
INSERT INTO `bm_teacher` (`id`, `tea_avatar_id`, `tea_name`, `sex`, `tea_phone`, `tea_email`, `tea_org_id`, `tea_org_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514857246752, 1, '测试删除', 'male', '1541244574', '123123@164.com', 1645826375942176, '启智编梦', 1651450646102112, '2025-02-13 16:01:01', 1651450646102112, '2025-02-13 16:01:01', -1);
COMMIT;

-- ----------------------------
-- Table structure for bm_teacher_intention
-- ----------------------------
DROP TABLE IF EXISTS `bm_teacher_intention`;
CREATE TABLE `bm_teacher_intention` (
  `id` bigint NOT NULL COMMENT '主键 id',
  `teacher_id` bigint DEFAULT NULL COMMENT '教师主键 id',
  `teacher_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '教师名称',
  `intention_cur_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '意向时间',
  `class_grade_id` bigint DEFAULT NULL COMMENT '班级 id',
  `class_grade_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '班级名称',
  `create_by` bigint DEFAULT NULL COMMENT '创建人 id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人 id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='教师意向时间关联表';

-- ----------------------------
-- Records of bm_teacher_intention
-- ----------------------------
BEGIN;
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220512, 1651450646102048, '仲寒露', 'short_monday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220544, 1651450646102048, '仲寒露', 'short_monday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220576, 1651450646102048, '仲寒露', 'short_monday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220608, 1651450646102048, '仲寒露', 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220640, 1651450646102048, '仲寒露', 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220672, 1651450646102048, '仲寒露', 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220704, 1651450646102048, '仲寒露', 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220736, 1651450646102048, '仲寒露', 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220768, 1651450646102048, '仲寒露', 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220800, 1651450646102048, '仲寒露', 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220832, 1651450646102048, '仲寒露', 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220864, 1651450646102048, '仲寒露', 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220896, 1651450646102048, '仲寒露', 'short_friday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220928, 1651450646102048, '仲寒露', 'short_friday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220960, 1651450646102048, '仲寒露', 'short_friday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211220992, 1651450646102048, '仲寒露', 'long_saturday_up_one', 1654906098286816, 'python84班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221024, 1651450646102048, '仲寒露', 'long_saturday_down_one', 1654906098286624, 'python82班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221056, 1651450646102048, '仲寒露', 'long_saturday_down_two', 1654906098286752, 'python83班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221088, 1651450646102048, '仲寒露', 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221120, 1651450646102048, '仲寒露', 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221152, 1651450646102048, '仲寒露', 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221184, 1653278597185568, '王总', 'short_monday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221216, 1653278597185568, '王总', 'short_monday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221248, 1653278597185568, '王总', 'short_monday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221280, 1653278597185568, '王总', 'short_tuesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221312, 1653278597185568, '王总', 'short_tuesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221344, 1653278597185568, '王总', 'short_tuesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221376, 1653278597185568, '王总', 'short_wednesday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221408, 1653278597185568, '王总', 'short_wednesday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221440, 1653278597185568, '王总', 'short_wednesday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221472, 1653278597185568, '王总', 'short_thursday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221504, 1653278597185568, '王总', 'short_thursday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221536, 1653278597185568, '王总', 'short_thursday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221568, 1653278597185568, '王总', 'short_friday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221600, 1653278597185568, '王总', 'short_friday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221632, 1653278597185568, '王总', 'short_friday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221664, 1653278597185568, '王总', 'long_saturday_up_one', 1654906098287008, 'python85班', NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221696, 1653278597185568, '王总', 'long_saturday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221728, 1653278597185568, '王总', 'long_saturday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221760, 1653278597185568, '王总', 'long_sunday_up_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221792, 1653278597185568, '王总', 'long_sunday_down_one', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1653812211221824, 1653278597185568, '王总', 'long_sunday_down_two', NULL, NULL, NULL, '2024-12-27 15:18:35', NULL, '2024-12-27 15:18:35', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441088, 1662514857246752, '测试删除', 'short_monday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441120, 1662514857246752, '测试删除', 'short_monday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441152, 1662514857246752, '测试删除', 'short_monday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441184, 1662514857246752, '测试删除', 'short_tuesday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441216, 1662514857246752, '测试删除', 'short_tuesday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441248, 1662514857246752, '测试删除', 'short_tuesday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441280, 1662514857246752, '测试删除', 'short_wednesday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441312, 1662514857246752, '测试删除', 'short_wednesday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441344, 1662514857246752, '测试删除', 'short_wednesday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441376, 1662514857246752, '测试删除', 'short_thursday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441408, 1662514857246752, '测试删除', 'short_thursday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441440, 1662514857246752, '测试删除', 'short_thursday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441472, 1662514857246752, '测试删除', 'short_friday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441504, 1662514857246752, '测试删除', 'short_friday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441536, 1662514857246752, '测试删除', 'short_friday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441568, 1662514857246752, '测试删除', 'long_saturday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441600, 1662514857246752, '测试删除', 'long_saturday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441632, 1662514857246752, '测试删除', 'long_saturday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441664, 1662514857246752, '测试删除', 'long_sunday_up_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441696, 1662514857246752, '测试删除', 'long_sunday_down_one', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
INSERT INTO `bm_teacher_intention` (`id`, `teacher_id`, `teacher_name`, `intention_cur_time`, `class_grade_id`, `class_grade_name`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES (1662514861441728, 1662514857246752, '测试删除', 'long_sunday_down_two', NULL, NULL, 1651450646102112, '2025-02-13 16:01:02', 1651450646102112, '2025-02-13 16:01:02', 1);
COMMIT;

-- ----------------------------
-- Table structure for bm_tutor_apply
-- ----------------------------
DROP TABLE IF EXISTS `bm_tutor_apply`;
CREATE TABLE `bm_tutor_apply` (
  `id` bigint DEFAULT NULL COMMENT '主键 id',
  `apply_stu_id` bigint DEFAULT NULL COMMENT '申请人 id',
  `apply_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请人姓名',
  `apply_subject` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请科目',
  `apply_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请时间',
  `apply_tutor_id` bigint DEFAULT NULL COMMENT '申请家教老师 id',
  `apply_tutor_tea_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请家教老师姓名',
  `expend_class_hour` int DEFAULT NULL COMMENT '消耗课时',
  `apply_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请地址',
  `apply_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请状态',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='家教申请';

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
  `tea_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家教老师名称',
  `give_class_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授课范围 python 、 c++等',
  `leisure_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '空闲时间',
  `tutor_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '教师详细介绍',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 1 -1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='家教老师';

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='教师与系统账户关联关系表';

-- ----------------------------
-- Records of bm_user_teacher
-- ----------------------------
BEGIN;
INSERT INTO `bm_user_teacher` (`id`, `tea_id`, `user_id`) VALUES (1651450646102144, 1651450646102048, 1651450646102112);
INSERT INTO `bm_user_teacher` (`id`, `tea_id`, `user_id`) VALUES (1653278599282720, 1653278597185568, 1653278597185600);
INSERT INTO `bm_user_teacher` (`id`, `tea_id`, `user_id`) VALUES (1662514861441056, 1662514857246752, 1662514857246784);
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
INSERT INTO `sys_config` (`id`, `config_name`, `config_key`, `config_value`, `config_status`, `show_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1648563337560096, '初始化密码', 'init_password', '123456', 'no', 'yes', '2024-11-28 16:04:17', 1, '2025-01-06 13:25:10', 1651450646102112, 1);
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
INSERT INTO `sys_file` (`id`, `file_name`, `file_url`, `file_type`, `file_device_by`, `bucket_name`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1, '111', '111.png', 'image/png', 'pc', 'e-mode-bucket', '2025-02-11 16:51:56', 1, '2025-02-11 16:52:04', 1, 1);
INSERT INTO `sys_file` (`id`, `file_name`, `file_url`, `file_type`, `file_device_by`, `bucket_name`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (2, '222', '22.96', 'image/png', 'pc', 'e-mode-bucket', '2025-02-15 17:39:48', 1, '2025-02-15 17:39:51', 1, 1);
INSERT INTO `sys_file` (`id`, `file_name`, `file_url`, `file_type`, `file_device_by`, `bucket_name`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1648559998894112, 'logo', 'logo.png', 'image/png', 'pc', 'e-mode-bucket', '2024-11-28 15:37:45', 1, '2024-11-28 15:37:45', 1, -1);
INSERT INTO `sys_file` (`id`, `file_name`, `file_url`, `file_type`, `file_device_by`, `bucket_name`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1648745905127456, 'logo', 'logo.png', 'image/png', 'pc', 'e-mode-bucket', '2024-11-29 16:15:13', 1648725644541984, '2024-11-29 16:15:13', 1648725644541984, -1);
INSERT INTO `sys_file` (`id`, `file_name`, `file_url`, `file_type`, `file_device_by`, `bucket_name`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1655088057679904, 'logo', 'logo.png', 'image/png', 'pc', 'e-mode-bucket', '2025-01-03 16:18:06', 1651450646102112, '2025-01-03 16:18:06', 1651450646102112, 1);
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
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1652416936149024, 'zhonghanlu', '192.168.0.106', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-19 22:29:56');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1652510511071264, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-20 10:53:37');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1652547896999968, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-20 15:50:44');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653124320198688, 'zhonghanlu', '192.168.0.107', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 20:11:44');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653124351655968, 'zhonghanlu', '192.168.0.107', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 20:11:58');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653132345999392, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:15:31');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653132402622496, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:15:57');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653133025476640, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:20:55');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653133084196896, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:21:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653133163888672, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:22:00');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653133249871904, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:22:42');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653133663010848, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:25:58');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653134185201696, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:30:08');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653134982119456, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:36:27');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653135086977056, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:37:17');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653135307178016, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:39:03');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653135709831200, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-23 21:42:14');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653135766454304, 'admin', '223.215.143.66', '中国|安徽省|淮南市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-23 21:42:42');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653235544752160, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 10:55:40');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653235616055328, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-12-24 10:56:14');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653236136149024, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-24 11:00:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653236178092064, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 11:00:41');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653257831186496, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-12-24 13:52:46');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653257873129504, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'no', 'login', 'ACCOUNT_PASSWORD_ERROR', '2024-12-24 13:53:07');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653257921364000, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 13:53:30');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653257921364096, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-12-24 13:53:30');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653258309337120, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 13:56:34');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653258309337216, 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2024-12-24 13:56:35');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653267723452448, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 15:11:23');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653267769589792, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-24 15:11:46');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653619784941600, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-26 13:49:20');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1653810485264416, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-27 15:04:52');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1654363940454432, 'zhonghanlu', '172.19.0.1', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2024-12-30 16:23:20');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1654891187535904, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-02 14:13:31');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655072920436768, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-03 14:17:49');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655579984527392, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-06 09:27:36');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655773180461088, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-07 11:02:58');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655794399445024, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-07 13:51:37');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655807328387104, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-07 15:34:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655807443730464, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-07 15:35:17');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655807447924768, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-07 15:35:19');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655817075949600, 'admin', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-07 16:51:49');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655817088532512, 'admin', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-07 16:51:56');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655817187098656, 'admin', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-07 16:52:43');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1655817193390112, 'admin', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'logout', 'LOGOUT_SUCCESS', '2025-01-07 16:52:46');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1656158299357216, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-09 14:03:38');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1656158381146144, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-09 14:04:16');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1656886682189856, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-01-13 14:32:18');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1661563064811552, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-08 09:56:50');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1661563071103008, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-08 09:56:54');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1661563073200160, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-08 09:56:55');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1661563075297312, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-08 09:56:55');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1661593217663008, 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-08 13:56:29');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1661953705508896, 'zhonghanlu', '192.168.0.24', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-10 13:41:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1662142585503776, 'zhonghanlu', '192.168.0.18', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-11 14:42:27');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1662318614151200, 'zhonghanlu', '192.168.0.18', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-12 14:01:24');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1662512976101408, 'zhonghanlu', '192.168.0.18', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-13 15:46:04');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1662675712999456, 'zhonghanlu', '192.168.0.18', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-14 13:19:22');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1662868917321760, 'zhonghanlu', '192.168.0.105', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-15 14:54:49');
INSERT INTO `sys_login_opt` (`id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `status`, `opt_type`, `opt_msg`, `opt_time`) VALUES (1663022659534880, 'zhonghanlu', '192.168.0.111', '0|内网IP|内网IP', 'Chrome 13', 'Mac OS X', 'yes', 'login', 'LOGIN_SUCCESS', '2025-02-16 11:16:39');
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
INSERT INTO `sys_notice` (`id`, `title`, `content`, `send_id`, `notice_type`, `send_time`, `message_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1655609394987040, '测试详情', '测试详情', 1651450646102112, 'local', '2025-01-06 13:21:19', 'alone', '2025-01-06 13:21:19', NULL, '2025-01-06 13:21:19', NULL, 1);
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
INSERT INTO `sys_user_notice` (`id`, `notice_id`, `user_id`, `phone`, `email`, `read_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1655609394987072, 1655609394987040, 1, '', '', 'no', '2025-01-06 13:21:19', NULL, '2025-01-06 13:21:19', NULL, 1);
INSERT INTO `sys_user_notice` (`id`, `notice_id`, `user_id`, `phone`, `email`, `read_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1655609394987104, 1655609394987040, 1653278597185600, '', '', 'no', '2025-01-06 13:21:19', NULL, '2025-01-06 13:21:19', NULL, 1);
INSERT INTO `sys_user_notice` (`id`, `notice_id`, `user_id`, `phone`, `email`, `read_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1655609394987136, 1655609394987040, 1651450646102112, '', '', 'no', '2025-01-06 13:21:19', NULL, '2025-01-06 13:21:19', NULL, 1);
INSERT INTO `sys_user_notice` (`id`, `notice_id`, `user_id`, `phone`, `email`, `read_status`, `create_time`, `create_by`, `update_time`, `update_by`, `del_flag`) VALUES (1655609394987168, 1655609394987040, 1648725644541984, '', '', 'no', '2025-01-06 13:21:19', NULL, '2025-01-06 13:21:19', NULL, 1);
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
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653242582794272, '2205eb69-40eb-4427-8465-e781b7b94273', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 11:51:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653242637320224, '6e353e7c-020d-4d24-bc14-509c3668cf92', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 11:52:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653253244715040, 'a0db417b-77d4-432e-b956-54d64c194422', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:16:19');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653255912292384, '5b3e412b-7d45-4a99-8106-ff2413bf44e1', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:37:32');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653256036024352, '77daaf5a-f5e5-403e-be0b-daf55c888f6e', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:38:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653256990228512, '82c9d8c6-433a-46f8-9cc6-745bec8f0a84', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:46:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653257346744352, '89007560-97aa-4d00-9160-44895dc140d5', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:48:56');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653257392881696, '58fc45d7-6315-4132-adce-f932c420a635', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:49:17');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653257453699104, '5e9eb13d-8883-4e9b-89d8-2aa0c2b9ed10', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:49:47');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653257829089312, '837b2050-c711-481e-8e4e-afd28140d630', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:52:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653257831186464, '8a581c42-f294-4be3-984f-06d991d173d7', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-12-24 13:52:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653257921364032, '1e74a278-884b-4afe-9ea0-0aa5b5d3e52c', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:53:30');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653257921364064, 'edc6fc24-e9e7-4483-b351-802bdc4ce528', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-12-24 13:53:30');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653258309337152, '3440b75e-2e31-47c8-b1d7-03650d2a24e6', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2024-12-24 13:56:34');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1653258309337184, '25100042-f356-4176-ba86-56d27502af42', 'admin', '117.68.128.38', '中国|安徽省|合肥市|电信', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2024-12-24 13:56:34');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1654891202215968, 'b1d98836-28c0-4faa-9a2b-a1c89084340f', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-02 14:13:39');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1654891250450464, '78dc66d6-9985-4498-9712-961698063ccc', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-02 14:14:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1654891315462176, '0aadebab-4222-42d6-9d65-0586547ffca2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-02 14:14:32');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1654891319656480, '2e5d3a1a-85ae-4345-9017-62adf6002bd7', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-02 14:14:35');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655087971696672, '3e95da53-bb4e-4299-9a09-25a44059c94b', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'no', '2025-01-03 16:17:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655088057679936, '4187c452-cf73-4b9f-83b8-b0d4c8f523b9', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-single-mf-business', '', 'yes', '2025-01-03 16:18:07');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655088068165664, '8ae32554-54c9-48ac-a792-5afa220738d2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-03 16:18:12');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655088235937824, 'e69d6bd9-7910-408b-a20d-faa5a94f3863', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-file/upload-mf', '', 'yes', '2025-01-03 16:19:32');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655580257157152, 'ef34aa4e-57af-4a4d-b790-18c09444b1bc', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 09:29:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655580427026464, 'a6649c26-66ac-497d-8e3b-750cbf9c9d6d', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 09:31:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655580718530592, '0a641b75-5551-45c1-8b04-81565893272c', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 09:33:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655581345579040, 'a280b63a-b25c-4dfb-abf3-624aafde80a1', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 09:38:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655581848895520, '6bc4c831-4782-4a0a-bef1-135ad95e2b3e', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 09:42:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655582364794912, 'cf42f8de-e9fe-4576-9d86-9d0c1b572828', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 09:46:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655582880694304, 'df4b2448-e528-431e-8963-0816cabd707d', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 09:50:36');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655583360942112, '92f185d1-6989-4d61-9fd0-6949cba0f47c', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 09:54:25');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585508425760, 'b443f775-5718-48e1-837c-74e97af556da', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:11:29');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585810415648, '2c66f973-0913-4778-a97a-78c16ef21275', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:13:54');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585919467552, '3b69ca6d-efc8-4edc-bd24-3ad0f3e2338b', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:14:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585929953312, '4c4838bf-9c3c-42ef-84ca-4241e7086bfe', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:14:51');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585953021984, 'f7f5364c-2895-4352-933b-c3f901b9be5a', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:15:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585967702048, '98733934-34c3-4b0f-aa73-3b1196ea9342', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:15:09');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585986576416, '5a453faa-4c7c-469c-b16c-66b93e4ed3e0', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:15:17');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585986576448, 'fdeb70e0-95b4-4925-80e6-d012daa77c02', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:15:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585986576480, '1c19841e-461f-416e-8aa9-78d03feeb1a7', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:15:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585988673568, 'bf2cecad-3c1f-409c-a1ab-c760c98bf591', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:15:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585988673600, 'c03e2ad7-c889-43ce-9999-2a0e1c173ba9', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:15:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585988673632, '774fd8ce-88f0-4c9a-a56e-3f9180317a3b', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:15:19');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585988673664, '97d85d26-cf4a-4e15-9f17-fd3c34bed0a2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:15:19');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655585990770720, 'b4d2ea58-b1d5-4707-9a23-e4ca75543bda', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:15:19');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588207460384, 'fcc23544-c236-4d6a-8946-767e763f2cd7', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:32:56');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588220043296, '7b810f7d-58f9-43a5-93cd-bdfc481bc1f1', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:33:03');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588222140448, '6867138f-d1be-4856-b644-7305dba62499', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:33:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588224237600, 'c4a1a34f-f818-4b61-82de-08e291de3012', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:33:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588238917664, 'b5531dc7-12a4-46ac-a4a1-2e22ef644da9', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:33:11');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588247306272, '65ea9c88-2c27-45a6-a601-7b1a3186ea69', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:33:15');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588270374944, '6f97be99-45c6-4839-990c-8208a17b1eba', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:33:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588278763552, 'e308253d-98a9-444e-b290-6583b36b89f9', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:33:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588282957856, '9af43a07-db1b-4a60-bf1a-180bd36f8b10', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:33:33');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588326998048, 'b6b9cedc-cb7c-4cd1-b357-1361b23d4c7a', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:33:54');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588496867360, '2256fa46-3990-436c-a956-90f6aefe78bb', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:35:14');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655588597530656, '90d3ef84-621a-47ef-b75a-cd8bd18d5bbc', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-06 10:36:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655590921175072, '94ae07bc-17d7-4915-817e-1f401876d864', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/page', '{}', 'yes', '2025-01-06 10:54:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655590942146592, '25da963b-cc3f-46df-bf19-0ec1b8e9ed3c', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1000', '{permissionId=1000}', 'no', '2025-01-06 10:54:40');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655591216873504, '95893fc6-7fa5-4123-b5d7-19ff28ab8683', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1000', '{permissionId=1000}', 'no', '2025-01-06 10:56:52');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655592217215008, '8ff06c3e-425f-4c55-ab5f-3c157c6394f2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1000', '{permissionId=1000}', 'yes', '2025-01-06 11:04:48');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655592697462816, '4677a431-e40e-4bf7-9e10-bc6c7e730f6e', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":1000,\"parentId\":123,\"menuName\":\"用户查询11\",\"menuPath\":null,\"menuUrl\":null,\"permissions\":\"system:user:query\",\"menuType\":\"Button\",\"icon\":\"#11\",\"sort\":1}', 'yes', '2025-01-06 11:08:37');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655592703754272, 'dcea751b-cfe2-4e70-8813-0c6f770e9725', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1000', '{permissionId=1000}', 'yes', '2025-01-06 11:08:40');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655592716337184, '1939e045-b018-47a7-8468-a5c808c925fd', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-permission/update', '{\"id\":1000,\"parentId\":123,\"menuName\":\"用户查询\",\"menuPath\":null,\"menuUrl\":null,\"permissions\":\"system:user:query\",\"menuType\":\"Button\",\"icon\":\"#\",\"sort\":1}', 'yes', '2025-01-06 11:08:47');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655592724725792, '407bd631-a195-45b8-8b8f-56c1295c4671', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/detail/1000', '{permissionId=1000}', 'yes', '2025-01-06 11:08:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593397911584, '2962b137-c874-4ff6-b1a8-ce0405f6b3bd', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/detail/1', '{configId=1}', 'yes', '2025-01-06 11:14:11');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593406300192, '919091b8-8e55-4887-92bb-33c0826ab780', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 11:14:15');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593416785952, 'f3af997d-18b0-4451-a8d1-641e7592d656', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/detail/1648563337560096', '{configId=1648563337560096}', 'yes', '2025-01-06 11:14:20');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593773301792, '205ffad2-7ffe-429f-803c-08ce3604fab6', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:10');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593781690400, '87c09c70-32ef-4d5b-a153-4532d96084db', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:15');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593787981856, '036707b4-fcf2-4890-a6c1-8ca87c2656ce', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593800564768, '8161c527-b071-4004-8fe6-a9a4656027de', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:24');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593804759072, '638c138f-a0d2-44c7-a8b3-b178b1441f5f', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:26');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593815244832, 'b21e756b-84df-4fa5-8227-f24a9aaddeb4', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:30');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593815244864, '2919a3c3-d801-48a0-8eee-80eeb138dbe9', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593817341984, '96a6b40b-aeae-4c00-a7cd-3704e08cdd97', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593832022048, 'a47650f7-709a-4f43-8767-2c8e75790c85', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:38');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593842507808, '61898270-e0e2-452a-8e84-b164c6b67560', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593848799264, 'add6dab3-64a9-486c-a2bd-9137d9257747', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:46');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593857187872, 'ded25b73-1c5b-437b-aeab-fa44c643a8d9', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:51');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655593859285024, 'c8514a83-e54c-4f06-8c49-4a055f098279', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-file/page', '{}', 'yes', '2025-01-06 11:17:51');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655594547150880, 'b73f6c02-8710-4c76-9c8c-670fd99e4e70', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-06 11:23:20');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655594572316704, 'a60e4cf5-a4dd-418a-b47e-91bfb458e46f', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1651450646102112', '{id=1651450646102112}', 'yes', '2025-01-06 11:23:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655608864407584, 'db005a5f-905f-49df-b673-2de9d1beb9c3', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-06 13:17:06');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655608887476256, '160092a0-d9b9-469c-9b12-c0114c6c010e', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1642022425329696', '{noticeId=1642022425329696}', 'yes', '2025-01-06 13:17:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609092997152, '9d3ce5f9-d99e-4698-90af-174f04758e09', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1642022425329696', '{noticeId=1642022425329696}', 'no', '2025-01-06 13:18:56');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609250283552, 'd15cf4b1-4970-4858-ac66-02fab5fd31dc', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1642022425329696', '{noticeId=1642022425329696}', 'yes', '2025-01-06 13:20:11');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609394987200, '1af03674-5058-4871-96fa-89e04950bf49', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-notice/send', '{\"title\":\"测试详情\",\"content\":\"测试详情\",\"noticeType\":\"local\",\"messageStatus\":\"alone\",\"sysSendRequestList\":[{\"userId\":1,\"phone\":\"\",\"email\":\"\"},{\"userId\":1653278597185600,\"phone\":\"\",\"email\":\"\"},{\"userId\":1651450646102112,\"phone\":\"\",\"email\":\"\"},{\"userId\":1648725644541984,\"phone\":\"\",\"email\":\"\"}]}', 'yes', '2025-01-06 13:21:19');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609401278496, 'aeaff860-a964-4cfc-8cc7-2e48db6c7801', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/page', '{}', 'yes', '2025-01-06 13:21:23');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609418055712, '92c9d0f8-dde3-4bf9-a737-8eef00ee2b2a', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/last-broad', '{}', 'yes', '2025-01-06 13:21:31');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609426444320, '9b4993b3-959a-4d6a-9038-644beaad93b2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655609394987040', '{noticeId=1655609394987040}', 'yes', '2025-01-06 13:21:35');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609455804448, '2920b8d2-4e8f-4e1c-ae8d-6dfaa2e30105', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655609394987040', '{noticeId=1655609394987040}', 'yes', '2025-01-06 13:21:49');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609629868064, 'eebaf021-d6f5-4a6d-b3b8-fe7ff146188d', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655609394987040', '{noticeId=1655609394987040}', 'yes', '2025-01-06 13:23:11');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609713754144, '865d7f6f-bf46-4006-979c-efc4777ea5cf', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655609394987040', '{noticeId=1655609394987040}', 'yes', '2025-01-06 13:23:52');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609747308576, '31e16aef-0598-4f2d-9d6f-e36a42eaa5f6', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-notice/detail/1655609394987040', '{noticeId=1655609394987040}', 'yes', '2025-01-06 13:24:07');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609818611744, '3cda2094-366a-4909-8545-9b7f3f3b4e77', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:24:42');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609833291808, 'b74f5c2e-61b4-431d-94c4-107ba0d765b2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/detail/1648563337560096', '{configId=1648563337560096}', 'yes', '2025-01-06 13:24:48');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609879429152, '7b95664d-5a5e-4c18-be42-a9967e5fe9a9', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-config/update', '{\"id\":1648563337560096,\"configName\":\"初始化密码\",\"configKey\":\"init_password\",\"configValue\":\"123456\",\"configStatus\":\"no\"}', 'yes', '2025-01-06 13:25:10');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609883623456, '5c4055ac-1308-4e66-83d5-b6dbb37a999b', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:25:13');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609892012064, '3f510233-6cfe-40c2-8061-bd350ed46676', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:25:17');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609894109216, '043b56c6-94ec-4cc1-894a-52093e6d98c1', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:25:17');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609894109248, '9b0adca0-a549-4823-b3c6-2b0f9a9aa55d', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:25:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609894109280, '6d07152f-e4ea-41b9-b3c2-374595e2744d', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:25:18');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609900400672, '37bd5a4b-6087-447c-a62f-b4ade4cc08bd', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:25:21');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655609906692128, 'dbeb08ce-f7ca-407e-841b-a6f09fc7dd9d', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:25:23');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655610061881376, 'a3b91a0a-b1cb-4602-886e-65d696b366f4', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:26:37');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655610068172832, '3d32e8bd-7d88-4f8f-9539-5e8c7e168073', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:26:40');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655610072367136, '59117189-61bd-4a9c-818a-383e8a30362a', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:26:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655610078658592, 'd0bc5b77-af44-4a1d-8bbf-538482385bdf', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-config/page', '{}', 'yes', '2025-01-06 13:26:45');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807328387136, '43c7fa8c-f2a1-4217-b978-1af1f61a04a0', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-07 15:34:22');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807328387168, 'a3dc4eb3-252c-4b0b-a49c-697c221c8863', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-07 15:34:22');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807328387200, '57a5512e-3feb-4793-a431-bccec96e64a2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-07 15:34:22');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807343067168, '61c88f4d-ec81-41fb-a79e-0d6b600eaec2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-07 15:34:29');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807349358624, '23333c34-1151-4ad3-ac7f-69aeea620056', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-07 15:34:32');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807355650080, 'cd21efe6-3b91-4535-9522-1ebb36f3e4e0', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1651450646102112', '{id=1651450646102112}', 'yes', '2025-01-07 15:34:34');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807361941536, '00625891-ef16-4084-be1a-2b5b50aa11d9', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-07 15:34:38');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807361941568, '837412bf-06a5-42fe-87d6-e6f772019e70', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1651450646102112', '{id=1651450646102112}', 'yes', '2025-01-07 15:34:38');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807368232992, '1ded4d4e-29b8-4281-8088-e27ec66f62de', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-07 15:34:41');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807372427296, 'ab5bfc6a-393e-4852-854b-8dcfab135219', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-07 15:34:42');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807403885760, '15f78f16-fca9-48b7-b906-c993d55ce22b', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/add', '{\"roleName\":\"测试修改角色\",\"roleCode\":\"test-update\",\"authPermissionIdList\":[7,123,124,125,126,127,128,129,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,200,201,1025,1026,1027,1021,1022,1023,1024]}', 'yes', '2025-01-07 15:34:58');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807403885792, '80ee3d52-3ea5-4bca-b96c-4681ec62218a', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-07 15:34:58');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807412273184, 'da94018c-c025-4ff6-b6f4-68c8e36d6cc2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-07 15:35:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807416467488, 'b95b5df6-7384-427f-9e72-bc8dacc9e7d9', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-07 15:35:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807416467520, '3d2b0331-f544-4e5e-b301-b2125383cd7b', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1651450646102112', '{id=1651450646102112}', 'yes', '2025-01-07 15:35:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807437439072, '69171eda-b717-495b-a3c4-991ac7773e91', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-user/update', '{\"id\":1651450646102112,\"username\":\"zhonghanlu\",\"nickname\":\"仲寒露\",\"sex\":\"male\",\"avatar\":0,\"phone\":\"15312665707\",\"roleList\":[\"sys4\",\"test-update\"]}', 'yes', '2025-01-07 15:35:13');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807437439104, '5ace215b-1034-41a2-b56f-eaef84db6a45', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-07 15:35:13');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807437439136, '9f8ca00a-ab24-41ed-8e6a-b9d5a0e048d3', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1651450646102112', '{id=1651450646102112}', 'yes', '2025-01-07 15:35:13');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807437439168, '408c4fb1-b8a1-4b97-b138-8a530ff07727', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-07 15:35:13');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807447924800, 'f2a4980d-f91f-4e75-98b4-42b6a041394c', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-07 15:35:19');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807447924832, 'ffa65703-c5db-43b0-ac95-ccc860c8780d', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-07 15:35:19');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807447924864, '776d883f-e779-4efe-bd5c-52d6ad8eb48b', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-07 15:35:19');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807464701984, '37c6c4ad-9ace-4d1e-a4b3-68a71214c466', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-07 15:35:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807464702016, '5db6a9fd-d305-4145-b3c9-4581c3a35aa3', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-07 15:35:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807464702048, '07033ca6-2773-41b8-a0e8-394b36f02947', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-07 15:35:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807508742176, '27e0403f-0fac-4b08-80b1-a865408401ca', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-01-07 15:35:47');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807569559584, 'fc6f2b5d-c2ed-4ea7-8e20-e12e1472c0a0', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-07 15:36:16');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807569559616, 'e44beac0-ee6e-4ded-a9ae-d1687a55625c', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1651450646102112', '{id=1651450646102112}', 'yes', '2025-01-07 15:36:16');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807577948192, '9a1024e9-9f4f-4fec-a934-5feab58c7124', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/all', '{}', 'yes', '2025-01-07 15:36:21');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807577948224, '6bbb4ccd-d852-4e56-b063-23f3b71aa4bb', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/user-detail-type/1651450646102112', '{id=1651450646102112}', 'yes', '2025-01-07 15:36:21');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807582142496, 'ec7ff013-8328-4be1-977c-b124128a9b81', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-07 15:36:23');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807590531104, '15c03712-1d91-468c-a1f9-db3d75ca85f2', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-07 15:36:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807590531136, 'ba82966d-114b-4b8c-929c-35db381f8f06', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1655807403884576', '{roleId=1655807403884576}', 'yes', '2025-01-07 15:36:27');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807628279840, 'c7c61430-58b5-4ab5-a483-a3bcd768ec89', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-07 15:36:44');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807670222880, '782f53a7-7e55-429e-9433-33d2f6656360', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1655807403884576,\"roleName\":\"测试修改角色\",\"roleCode\":\"test-update\",\"authPermissionIdList\":[7,123,124,125,126,127,128,129,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,200,201,1025,1026,1027,1021,1022,1023,1024,3]}', 'yes', '2025-01-07 15:37:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807695388704, '075d5663-5390-4f30-b190-2576ab66a774', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1655807403884576,\"roleName\":\"测试修改角色\",\"roleCode\":\"test-update\",\"authPermissionIdList\":[7,123,124,125,126,127,128,129,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,200,201,1025,1026,1027,1021,1022,1023,1024,3]}', 'yes', '2025-01-07 15:37:16');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807695388736, '60c7f484-c2a2-4cff-bc02-a7f2d4bfede8', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-07 15:37:16');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807697485856, '5524449b-2972-4d7c-b7da-8ca62a075c1c', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-07 15:37:17');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807789760544, '14c7b0ec-d8e1-43b6-84e8-662a0009669e', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-07 15:38:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807791857696, '6d577799-d46f-4422-9996-557e7f10e1bb', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-07 15:38:02');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807793954848, '3f1524db-eb43-4dbc-8206-b5a88174b011', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-permission/all', '{}', 'yes', '2025-01-07 15:38:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807793954880, '2b31f2e6-2712-4d5e-942e-a2e4ff271e95', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/detail/1655807403884576', '{roleId=1655807403884576}', 'yes', '2025-01-07 15:38:04');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807802343456, 'ae18c65b-f098-446e-a3e9-cdd6d938d899', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-07 15:38:08');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807802344704, '621e4d27-4ff2-4fd2-84d0-a076097324ec', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'POST', '/sys-role/update', '{\"id\":1655807403884576,\"roleName\":\"测试修改角色\",\"roleCode\":\"test-update\",\"authPermissionIdList\":[7,3,123,124,125,126,127,128,129,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,200,201,1025,1026,1027,1021,1022,1023,1024,2]}', 'yes', '2025-01-07 15:38:08');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655807804440608, '0ded3dff-5c6e-4eb8-a556-0f212cdff77b', 'zhonghanlu', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-role/page', '{}', 'yes', '2025-01-07 15:38:08');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655817075949632, '95532da4-eac1-4564-8b86-079a5a21639d', 'admin', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-07 16:51:49');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655817075949664, '4c8f3e56-72d7-4cf9-a44c-61672219668d', 'admin', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-07 16:51:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655817075949696, '35f03a00-0772-480f-ae69-27436a298036', 'admin', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-07 16:51:50');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655817187098688, 'cba8f10c-ad28-4600-bedc-5f71aa15401a', 'admin', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-base', '{}', 'yes', '2025-01-07 16:52:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655817187098720, '9b6c237e-4afa-4e8d-98fb-c7815c8ac24a', 'admin', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-07 16:52:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1655817187098752, 'f5afc1b9-9286-491d-97be-1208a78087b5', 'admin', '192.168.0.67', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-auth/user-detail-router', '{}', 'yes', '2025-01-07 16:52:43');
INSERT INTO `sys_user_opt` (`id`, `request_id`, `username`, `opt_ip`, `opt_address`, `browser`, `system_os`, `opt_method`, `opt_url`, `opt_body`, `opt_status`, `opt_time`) VALUES (1662515264094240, 'c2ecca76-ebe5-4223-b23e-0a5649101f26', 'zhonghanlu', '192.168.0.18', '0|内网IP|内网IP', 'Chrome 13', 'Windows 10', 'GET', '/sys-user/page', '{}', 'yes', '2025-02-13 16:04:14');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
