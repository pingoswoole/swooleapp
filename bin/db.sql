/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.0.168
 Source Server Type    : MySQL
 Source Server Version : 100508
 Source Host           : 192.168.0.168:3306
 Source Schema         : swooleapp

 Target Server Type    : MySQL
 Target Server Version : 100508
 File Encoding         : 65001

 Date: 07/03/2021 20:30:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ab_test
-- ----------------------------
DROP TABLE IF EXISTS `ab_test`;
CREATE TABLE `ab_test`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'AB压力测试表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ab_test
-- ----------------------------
INSERT INTO `ab_test` VALUES (1, '\'1=1\' or insert into', 1611561543);
INSERT INTO `ab_test` VALUES (2, '\'1=1\' or insert into', 1611561558);
INSERT INTO `ab_test` VALUES (3, '\'1=1\' or insert into', 1611561558);
INSERT INTO `ab_test` VALUES (4, '\'1=1\' or insert into', 1611561559);
INSERT INTO `ab_test` VALUES (5, '\'1=1\' or insert into', 1611561603);
INSERT INTO `ab_test` VALUES (6, '\'1=1\' or insert into', 1611561603);
INSERT INTO `ab_test` VALUES (7, '\'1=1\' or insert into', 1611561606);
INSERT INTO `ab_test` VALUES (8, '\'1=1\' or insert into', 1611561606);
INSERT INTO `ab_test` VALUES (9, '\'1=1\' or insert into', 1611561607);
INSERT INTO `ab_test` VALUES (10, '\'1=1\' or insert into', 1611561817);
INSERT INTO `ab_test` VALUES (11, '\'1=1\' or insert into', 1611561818);
INSERT INTO `ab_test` VALUES (12, '\'1=1\' or insert into', 1611561818);
INSERT INTO `ab_test` VALUES (13, '\'1=1\' or insert into', 1611561819);
INSERT INTO `ab_test` VALUES (14, '\'1=1\' or insert into', 1611561842);
INSERT INTO `ab_test` VALUES (15, '\'1=1\' or insert into', 1611561843);
INSERT INTO `ab_test` VALUES (16, '\'1=1\' or insert into', 1611561843);
INSERT INTO `ab_test` VALUES (17, '\'1=1\' or insert into', 1611561843);
INSERT INTO `ab_test` VALUES (18, '\'1=1\' or insert into', 1611562021);
INSERT INTO `ab_test` VALUES (19, '\'1=1\' or insert into', 1611562022);
INSERT INTO `ab_test` VALUES (20, '\'1=1\' or insert into', 1611562022);
INSERT INTO `ab_test` VALUES (21, '\'1=1\' or insert into', 1611562023);
INSERT INTO `ab_test` VALUES (22, '\'1=1\' or insert into', 1611562033);
INSERT INTO `ab_test` VALUES (23, '\'1=1\' or insert into', 1611562046);
INSERT INTO `ab_test` VALUES (24, '\'1=1\' or insert into', 1611562070);
INSERT INTO `ab_test` VALUES (34, '\'1=1\' or insert into', 1611562182);
INSERT INTO `ab_test` VALUES (35, '\'1=1\' or insert into', 1611562848);
INSERT INTO `ab_test` VALUES (36, '\'1=1\' or insert into', 1611562857);
INSERT INTO `ab_test` VALUES (37, '\'1=1\' or insert into', 1611562858);
INSERT INTO `ab_test` VALUES (38, '\'1=1\' or insert into', 1611562935);
INSERT INTO `ab_test` VALUES (39, '\'1=1\' or insert into', 1611562937);
INSERT INTO `ab_test` VALUES (40, '\'1=1\' or insert into', 1612432307);
INSERT INTO `ab_test` VALUES (41, '\'1=1\' or insert into', 1612432310);
INSERT INTO `ab_test` VALUES (42, '\'1=1\' or insert into', 1612432365);
INSERT INTO `ab_test` VALUES (43, 'bbx', 1610285306);
INSERT INTO `ab_test` VALUES (44, 'bbx', 1610285306);

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作url',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '信息',
  `uid` int UNSIGNED NULL DEFAULT 0 COMMENT '操作人',
  `created_at` int NOT NULL DEFAULT 0,
  `updated_at` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 62699 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_login_log`;
CREATE TABLE `admin_login_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录人',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '是否登录 1 登录成功，0失败',
  `created_at` int NOT NULL DEFAULT 0,
  `updated_at` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组名',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简单描述',
  `rules_checked` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'layui 树形选中的checked',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '权限列表 所有打勾的',
  `pid` int UNSIGNED NULL DEFAULT 0 COMMENT '上级部门',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  `updated_at` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组名' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, '超级管理员', '网站建设者', '5,6,7,8,9,10,11,12,17,13,14,15,16,19,21,26,27,29,30', '1,2,5,6,7,8,3,9,10,11,12,17,4,13,14,15,16,19,20,21,26,27,28,29,30', 0, '2020-11-05 14:04:54', 1605536215);
INSERT INTO `admin_role` VALUES (2, '测试', '测试小角色', '9,10,11,12,17,13,14,15,16,19,29,40,41,42,47,48,49,52,53,54', '1,3,9,10,11,12,17,4,13,14,15,16,19,28,29,38,39,40,41,42,47,48,49,52,53,54', 0, '2020-11-05 14:04:54', 1610250368);

-- ----------------------------
-- Table structure for admin_rule
-- ----------------------------
DROP TABLE IF EXISTS `admin_rule`;
CREATE TABLE `admin_rule`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '权限鉴权节点',
  `href` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单url',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'fa-file-text',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 启用; 0 禁用',
  `is_menu` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否菜单',
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级ID',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `node`(`node`) USING BTREE,
  INDEX `status_node`(`status`, `node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限点和菜单列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_rule
-- ----------------------------
INSERT INTO `admin_rule` VALUES (1, '系统管理', 'auth', '', 'fa-home', 1, 1, 0, 0, 4294967295, 1610243495);
INSERT INTO `admin_rule` VALUES (2, '管理员', 'auth.auth', '/backadmin/auth/user/index', 'fa-group', 1, 1, 1, 0, 2147483647, 1605606090);
INSERT INTO `admin_rule` VALUES (3, '角色管理', 'auth.role', '/backadmin/auth/role/index', 'fa-leaf', 1, 1, 1, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (4, '权限管理', 'auth.rule', '/backadmin/auth/rule/index', 'fa-shield', 1, 1, 1, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (5, '查看管理列表', 'auth.auth.view', '/backadmin/auth/get_all', 'fa-home', 1, 0, 2, 0, 2147483647, 1610242813);
INSERT INTO `admin_rule` VALUES (6, '添加管理员', 'auth.auth.add', '/backadmin/auth/addget', 'fa-home', 1, 0, 2, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (7, '设置管理员', 'auth.auth.set', '/backadmin/auth/set/{id:\\d+}', 'fa-home', 1, 0, 2, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (8, '删除管理员', 'auth.auth.del', '/backadmin/auth/del/{id:\\d+}', 'fa-home', 1, 0, 2, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (9, '查看角色', 'auth.role.view', '/backadmin/role/get_all', 'fa-home', 1, 0, 3, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (10, '增加角色', 'auth.role.add', NULL, 'fa-home', 1, 0, 3, 0, 2147483647, 1610779555);
INSERT INTO `admin_rule` VALUES (11, '修改角色', 'auth.role.set', '/backadmin/role/set/{id:\\d+}', 'fa-home', 1, 0, 3, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (12, '删除角色', 'auth.role.del', '/backadmin/role/del/{id:\\d+}', 'fa-home', 1, 0, 3, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (13, '查看权限', 'auth.rule.view', '/backadmin/rule/get_all', 'fa-home', 1, 0, 4, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (14, '增加根权限', 'auth.rule.addroot', '/backadmin/rule/addget&&/backadmin/rule/add', 'fa-home', 1, 0, 4, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (15, '修改权限', 'auth.rule.set', '/backadmin/rule/set/{id:\\d+}', 'fa-home', 1, 0, 4, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (16, '删除权限', 'auth.rule.del', '/backadmin/rule/del/{id:\\d+}', 'fa-home', 1, 0, 4, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (17, '变更权限', 'auth.role.rule', '/backadmin/rule/editget/{id:\\d+}&&/backadmin/rule/edit/{id:\\d+}', 'fa-home', 1, 0, 3, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (19, '登录日志', 'index.login.log', '/backadmin/login_log', 'fa-home', 1, 0, 1, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (20, '配置数据', 'data', NULL, 'fa-home', 1, 1, 0, 0, 1604890768, 1605607108);
INSERT INTO `admin_rule` VALUES (21, '常规配置', 'data.setting', '/backadmin/setting/common/index', 'fa-gears', 1, 1, 20, 0, 1604968802, 1605607120);
INSERT INTO `admin_rule` VALUES (26, '数据库', 'data.database', '/backadmin/setting/database/viewAll', 'fa-database', 1, 1, 20, 0, 1605097315, 1605607127);
INSERT INTO `admin_rule` VALUES (27, '文件管理', 'data.filesystem', '/backadmin/setting/file_manager/viewAll', 'fa-folder-o', 1, 1, 20, 0, 1605097457, 1605607136);
INSERT INTO `admin_rule` VALUES (28, '用户中心', 'member', 'member.index', 'fa-home', 1, 1, 0, 0, 1605097635, 1610261632);
INSERT INTO `admin_rule` VALUES (29, '用户列表', 'member.index', '/backadmin/member/member/viewAll', 'fa-user-circle-o', 1, 1, 28, 0, 1605098083, 1605098083);
INSERT INTO `admin_rule` VALUES (30, '资产收支', 'resource', '/backadmin/member/member_asset_log/viewAll', 'fa-money', 1, 1, 28, 0, 1605098154, 1605098154);
INSERT INTO `admin_rule` VALUES (32, '编辑管理员', 'auth.auth.set', '/backadmin/auth/editget/{id:\\d+}&&/backadmin/auth/edit/{id:\\d+}', 'fa-home', 1, 0, 2, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (33, '修改密码', 'auth.auth.pwd', '/backadmin/auth/pwdget&&/backadmin/auth/pwd', 'fa-home', 1, 0, 2, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (34, '变更权限', 'auth.role.edit_userule', '/backadmin/role/edit_ruleget/{id:\\d+}&&/backadmin/role/edit_rule/{id:\\d+}', 'fa-home', 1, 0, 3, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (35, '编辑角色', 'auth.role.edit_rule', '/backadmin/role/editget/{id:\\d+}&&/backadmin/role/edit/{id:\\d+}', 'fa-home', 1, 0, 3, 0, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (36, '增加子权限', 'auth.rule.addnode', '/backadmin/rule/addget/{id:\\d+}&&/backadmin/rule/add/{id:\\d+}', 'fa-home', 1, 0, 4, 0, 2147483647, 1605606100);
INSERT INTO `admin_rule` VALUES (38, '产品中心', 'auth.rule.addnode', '', 'fa-home', 1, 1, 0, 0, 2147483647, 1605606100);
INSERT INTO `admin_rule` VALUES (39, '在线商城', 'product.onlineshop', '', 'fa-home', 1, 1, 38, 10, 2147483647, 1605606100);
INSERT INTO `admin_rule` VALUES (40, '分类管理', 'product.onlineshop.category', '/backadmin/product/onlineshop_category/viewAll', 'fa-file-text', 1, 1, 39, 0, 0, 0);
INSERT INTO `admin_rule` VALUES (41, '商品管理', 'product.onlineshop.goods', '/backadmin/product/onlineshop_goods/viewAll', 'fa-file-text', 1, 1, 39, 0, 0, 0);
INSERT INTO `admin_rule` VALUES (42, '订单管理', 'product.onlineshop.order', '/backadmin/product/onlineshop_order/viewAll', 'fa-file-text', 1, 1, 39, 0, 0, 0);
INSERT INTO `admin_rule` VALUES (47, '提现管理', 'product.withdraw', '/backadmin/product/withdraw/viewAll', 'fa-file-text', 1, 1, 38, 16, 0, 1610780904);
INSERT INTO `admin_rule` VALUES (48, '建议反馈', 'product.suggest', '/backadmin/product/suggestion/viewAll', 'fa-file-text', 1, 1, 38, 20, 0, 0);
INSERT INTO `admin_rule` VALUES (49, '支付记录', 'product.payment.log', '/backadmin/product/payment_log/viewAll', 'fa-file-text', 1, 1, 38, 20, 0, 1610780827);
INSERT INTO `admin_rule` VALUES (50, '银行卡', 'member.bankcard', '/backadmin/member/member_bank_card/viewAll', 'fa-file-text', 1, 1, 28, 0, 0, 0);
INSERT INTO `admin_rule` VALUES (51, '收货地址', 'member.address', '/backadmin/member/member_address/viewAll', 'fa-file-text', 1, 1, 28, 0, 0, 0);
INSERT INTO `admin_rule` VALUES (52, '消息推送', 'product.message_push', '/backadmin/product/message_push/viewAll', 'fa-file-text', 1, 1, 38, 16, 0, 1610780899);
INSERT INTO `admin_rule` VALUES (53, '常见问题', 'product.faq', '/backadmin/product/faq/viewAll', 'fa-file-text', 1, 1, 38, 15, 0, 1610780895);
INSERT INTO `admin_rule` VALUES (54, '幻灯片', 'product.swiper_slider', '/backadmin/product/swiper_slider/viewAll', 'fa-file-text', 1, 1, 38, 16, 0, 1610780890);
INSERT INTO `admin_rule` VALUES (55, '实名认证', 'member.realnameauth', '/backadmin/member/member_realnameauth/viewAll', 'fa-file-text', 1, 1, 28, 0, 1610261669, 1610273179);
INSERT INTO `admin_rule` VALUES (56, '短视频', 'product.video', '', 'fa-file-text', 1, 1, 38, 0, 1610771308, 1610771482);
INSERT INTO `admin_rule` VALUES (57, '视频管理', 'product.video.viewAll', '/backadmin/product/video_data/viewAll', 'fa-file-text', 1, 1, 56, 0, 1610771469, 1610782550);
INSERT INTO `admin_rule` VALUES (58, '视频分类', 'product.video.category', '/backadmin/product/video_category/viewAll', 'fa-file-text', 1, 1, 56, 0, 1610771547, 1610771552);
INSERT INTO `admin_rule` VALUES (59, '视频标签', 'product.video.tag', '/backadmin/product/video_tag/viewAll', 'fa-file-text', 1, 1, 56, 0, 1610778937, 1610779148);
INSERT INTO `admin_rule` VALUES (60, '视频分区', 'product.video.area', '/backadmin/product/video_area/viewAll', 'fa-file-text', 1, 1, 56, 0, 1610778993, 1610779148);
INSERT INTO `admin_rule` VALUES (61, '视频广告', 'product.video.ad', '/backadmin/product/video_ad/viewAll', 'fa-file-text', 1, 1, 56, 0, 1610779030, 1610779149);
INSERT INTO `admin_rule` VALUES (62, '社区论坛', 'product.forum', '', 'fa-file-text', 1, 1, 38, 0, 1610779177, 1610779181);
INSERT INTO `admin_rule` VALUES (63, '文章分类', 'product.forum.category', '/backadmin/product/forum_category/viewAll', 'fa-file-text', 1, 1, 62, 0, 1610779223, 1610779298);
INSERT INTO `admin_rule` VALUES (64, '文章管理', 'product.forum.article', '/backadmin/product/forum_article/viewAll', 'fa-file-text', 1, 1, 62, 0, 1610779265, 1610779298);
INSERT INTO `admin_rule` VALUES (65, '论坛广告', 'product.forum.ad', '/backadmin/product/forum_ad/viewAll', 'fa-file-text', 1, 1, 62, 0, 1610779295, 1610779299);
INSERT INTO `admin_rule` VALUES (66, '每日签到', 'product.daily_sign', '/backadmin/product/daily_sign/viewAll', 'fa-file-text', 1, 1, 38, 15, 1610779357, 1610780857);
INSERT INTO `admin_rule` VALUES (67, '通讯聊天', 'product.chat', '', 'fa-file-text', 1, 1, 38, 0, 1610781007, 1610781089);
INSERT INTO `admin_rule` VALUES (68, '聊天记录', 'product.chat.message', '/backadmin/product/chat_message/viewAll', 'fa-file-text', 1, 1, 67, 0, 1610781075, 1610781089);
INSERT INTO `admin_rule` VALUES (69, '发卡管理', 'product.faka', '', 'fa-file-text', 1, 1, 38, 0, 1610781199, 1610781354);
INSERT INTO `admin_rule` VALUES (70, '卡包管理', 'product.faka.list', '/backadmin/product/faka/viewAll', 'fa-file-text', 1, 1, 69, 0, 1610781248, 1612515237);
INSERT INTO `admin_rule` VALUES (71, '核销记录', 'product.faka.log', '/backadmin/product/faka_log/viewAll', 'fa-file-text', 1, 0, 69, 0, 1610781350, 1612514953);

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `pwd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `encry` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密串',
  `role_id` int UNSIGNED NOT NULL COMMENT '组id',
  `display_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '显示用户名',
  `logined_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最近登陆时间',
  `created_at` int NULL DEFAULT 0,
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态 0 启用 1禁用 ',
  `deleted` tinyint(1) NULL DEFAULT 0,
  `updated_at` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'manager', 'f36a3b477d8ec52454a005a79611a08f', 'XK.?}<', 1, 'jmz', '2021-01-10 08:28:26', 2147483647, 1, 0, 1610285306);
INSERT INTO `admin_user` VALUES (7, 'random_str', '80aed66d8dd962e1ee1838f8aaff863b', 'R(p77L', 1, 'random_strrandom_str', NULL, 0, 1, 1, 1605541416);
INSERT INTO `admin_user` VALUES (8, 'admin_user', 'eeb7eb34e2b64c367bed1ae791739654', 'HQf>J8', 2, 'admin_user2', '2021-01-09 09:37:44', 1604874460, 1, 0, 1610203064);
INSERT INTO `admin_user` VALUES (13, 'test1234568', 'test1234568', '_pv$cD', 2, 'test1234568', NULL, 1605051895, 1, 1, 1605601190);

-- ----------------------------
-- Table structure for common_setting
-- ----------------------------
DROP TABLE IF EXISTS `common_setting`;
CREATE TABLE `common_setting`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `set_key` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `set_value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` int NULL DEFAULT 0,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `set_key_2`(`set_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of common_setting
-- ----------------------------
INSERT INTO `common_setting` VALUES (5, 'storage', '{\"set_key\":\"storage\",\"provider\":\"2\",\"local_base_uri\":\"http:\\/\\/localhost\",\"qiniu_access_key\":\"\",\"qiniu_access_key_secret\":\"\",\"qiniu_base_uri\":\"\",\"qiniu_bucket\":\"\",\"aliyun_access_key\":\"LTAI4GAWQaZaSMK43eHeDUSw\",\"aliyun_access_key_secret\":\"qUY9E7xraqz5HSBorHrcwKClxEsNEy\",\"aliyun_base_uri\":\"https:\\/\\/oss.bhy521qm.com\",\"aliyun_bucket\":\"chatdou\",\"aliyun_endpoint\":\"oss-cn-hongkong.aliyuncs.com\"}', 1607936858, 1610717838);
INSERT INTO `common_setting` VALUES (6, 'web', '{\"set_key\":\"web\",\"title\":\"Q\\u77ed\\u89c6\\u9891\\u804a\\u5929\",\"logo\":\"https:\\/\\/oss.bhy521qm.com\\/common\\/886d1e7ace0650f74132cfa9eab68fcf.png\",\"file\":\"\",\"aboutus\":\"<p style=\\\"margin-top: 0px; margin-bottom: 20px; word-break: break-all; overflow-wrap: break-word; color: rgb(102, 102, 102); line-height: 1.7; width: 796px; font-family: tahoma, arial, \\\" microsoft=\\\"\\\" yahei\\\",=\\\"\\\" \\\"hiragino=\\\"\\\" sans=\\\"\\\" gb\\\",=\\\"\\\" u5b8bu4f53,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;\\\"=\\\"\\\">\\u4eac\\u4e1c\\u4e8e2004\\u5e74\\u6b63\\u5f0f\\u6d89\\u8db3\\u7535\\u5546\\u9886\\u57df\\uff0c2019\\u5e74\\uff0c\\u4eac\\u4e1c\\u96c6\\u56e2\\u5e02\\u573a\\u4ea4\\u6613\\u989d\\u8d85\\u8fc72\\u4e07\\u4ebf\\u5143*\\u30022020\\u5e748\\u6708\\uff0c\\u4eac\\u4e1c\\u96c6\\u56e2\\u7b2c\\u4e94\\u6b21\\u5165\\u699c\\u300a\\u8d22\\u5bcc\\u300b\\u5168\\u7403500\\u5f3a\\uff0c\\u4f4d\\u5217\\u7b2c102\\u4f4d\\uff0c\\u4f4d\\u5c45\\u4e2d\\u56fd\\u96f6\\u552e\\u53ca\\u4e92\\u8054\\u7f51\\u884c\\u4e1a\\u7b2c\\u4e00\\u3001\\u5168\\u7403\\u4e92\\u8054\\u7f51\\u884c\\u4e1a\\u7b2c\\u4e09\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 20px; word-break: break-all; overflow-wrap: break-word; color: rgb(102, 102, 102); line-height: 1.7; width: 796px; font-family: tahoma, arial, \\\" microsoft=\\\"\\\" yahei\\\",=\\\"\\\" \\\"hiragino=\\\"\\\" sans=\\\"\\\" gb\\\",=\\\"\\\" u5b8bu4f53,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;\\\"=\\\"\\\">2014\\u5e745\\u6708\\uff0c\\u4eac\\u4e1c\\u96c6\\u56e2\\u5728\\u7f8e\\u56fd\\u7eb3\\u65af\\u8fbe\\u514b\\u8bc1\\u5238\\u4ea4\\u6613\\u6240\\u6b63\\u5f0f\\u6302\\u724c\\u4e0a\\u5e02\\uff0c\\u662f\\u4e2d\\u56fd\\u7b2c\\u4e00\\u4e2a\\u6210\\u529f\\u8d74\\u7f8e\\u4e0a\\u5e02\\u7684\\u5927\\u578b\\u7efc\\u5408\\u578b\\u7535\\u5546\\u5e73\\u53f0\\u30022015\\u5e747\\u6708\\uff0c\\u4eac\\u4e1c\\u51ed\\u501f\\u9ad8\\u6210\\u957f\\u6027\\u5165\\u9009\\u7eb3\\u65af\\u8fbe\\u514b100\\u6307\\u6570\\u548c\\u7eb3\\u65af\\u8fbe\\u514b100\\u5e73\\u5747\\u52a0\\u6743\\u6307\\u6570\\u30022020\\u5e746\\u6708\\uff0c\\u4eac\\u4e1c\\u96c6\\u56e2\\u6b63\\u5f0f\\u5728\\u9999\\u6e2f\\u8054\\u4ea4\\u6240\\u4e8c\\u6b21\\u4e0a\\u5e02\\uff0c\\u52df\\u96c6\\u8d44\\u91d1\\u7ea6345.58\\u4ebf\\u6e2f\\u5143\\uff0c\\u7528\\u4e8e\\u6295\\u8d44\\u4ee5\\u4f9b\\u5e94\\u94fe\\u4e3a\\u57fa\\u7840\\u7684\\u5173\\u952e\\u6280\\u672f\\u521b\\u65b0\\uff0c\\u4ee5\\u8fdb\\u4e00\\u6b65\\u63d0\\u5347\\u7528\\u6237\\u4f53\\u9a8c\\u53ca\\u63d0\\u9ad8\\u8fd0\\u8425\\u6548\\u7387\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 20px; word-break: break-all; overflow-wrap: break-word; color: rgb(102, 102, 102); line-height: 1.7; width: 796px; font-family: tahoma, arial, \\\" microsoft=\\\"\\\" yahei\\\",=\\\"\\\" \\\"hiragino=\\\"\\\" sans=\\\"\\\" gb\\\",=\\\"\\\" u5b8bu4f53,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;\\\"=\\\"\\\">2019\\u5e74\\u5168\\u5e74\\uff0c\\u4eac\\u4e1c\\u96c6\\u56e2\\u51c0\\u6536\\u5165\\u8fbe5769\\u4ebf\\u5143\\uff0c\\u5f52\\u5c5e\\u4e8e\\u666e\\u901a\\u80a1\\u80a1\\u4e1c\\u7684\\u51c0\\u5229\\u6da6\\u8fbe122\\u4ebf\\u5143\\uff0c\\u521b\\u5386\\u53f2\\u6700\\u9ad8\\u7eaa\\u5f55\\uff1b\\u7814\\u53d1\\u6295\\u5165\\u8fbe179\\u4ebf\\u5143\\uff0c\\u8dc3\\u5347\\u4e3a\\u4e2d\\u56fd\\u4f01\\u4e1a\\u4e2d\\u5bf9\\u6280\\u672f\\u6295\\u5165\\u6700\\u591a\\u7684\\u516c\\u53f8\\u4e4b\\u4e00\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 20px; word-break: break-all; overflow-wrap: break-word; color: rgb(102, 102, 102); line-height: 1.7; width: 796px; font-family: tahoma, arial, \\\" microsoft=\\\"\\\" yahei\\\",=\\\"\\\" \\\"hiragino=\\\"\\\" sans=\\\"\\\" gb\\\",=\\\"\\\" u5b8bu4f53,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;\\\"=\\\"\\\">\\u4eac\\u4e1c\\u96c6\\u56e2\\u5b9a\\u4f4d\\u4e8e\\u201c\\u4ee5\\u4f9b\\u5e94\\u94fe\\u4e3a\\u57fa\\u7840\\u7684\\u6280\\u672f\\u4e0e\\u670d\\u52a1\\u4f01\\u4e1a\\u201d\\uff0c\\u76ee\\u524d\\u4e1a\\u52a1\\u5df2\\u6d89\\u53ca\\u96f6\\u552e\\u3001\\u6570\\u5b57\\u79d1\\u6280\\u3001\\u7269\\u6d41\\u3001\\u6280\\u672f\\u670d\\u52a1\\u3001\\u5065\\u5eb7\\u3001\\u4fdd\\u9669\\u3001\\u4ea7\\u53d1\\u3001\\u667a\\u8054\\u4e91\\u548c\\u6d77\\u5916\\u7b49\\u9886\\u57df\\uff0c\\u5176\\u4e2d\\u6838\\u5fc3\\u4e1a\\u52a1\\u4e3a\\u96f6\\u552e\\u3001\\u6570\\u5b57\\u79d1\\u6280\\u3001\\u7269\\u6d41\\u3001\\u6280\\u672f\\u670d\\u52a1\\u56db\\u5927\\u677f\\u5757\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; word-break: break-all; overflow-wrap: break-word; color: rgb(102, 102, 102); line-height: 1.7; width: 796px; font-family: tahoma, arial, \\\" microsoft=\\\"\\\" yahei\\\",=\\\"\\\" \\\"hiragino=\\\"\\\" sans=\\\"\\\" gb\\\",=\\\"\\\" u5b8bu4f53,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;\\\"=\\\"\\\">\\u4eac\\u4e1c\\u96c6\\u56e2\\u5949\\u884c\\u5ba2\\u6237\\u4e3a\\u5148\\u3001\\u8bda\\u4fe1\\u3001\\u534f\\u4f5c\\u3001\\u611f\\u6069\\u3001\\u62fc\\u640f\\u3001\\u62c5\\u5f53\\u7684\\u4ef7\\u503c\\u89c2\\uff0c\\u4ee5\\u201c\\u6280\\u672f\\u4e3a\\u672c\\uff0c\\u81f4\\u529b\\u4e8e\\u66f4\\u9ad8\\u6548\\u548c\\u53ef\\u6301\\u7eed\\u7684\\u4e16\\u754c\\u201d\\u4e3a\\u4f7f\\u547d\\uff0c\\u76ee\\u6807\\u662f\\u6210\\u4e3a\\u5168\\u7403\\u6700\\u503c\\u5f97\\u4fe1\\u8d56\\u7684\\u4f01\\u4e1a\\u3002<\\/p>\",\"protocol\":\"<p><span style=\\\"background-color: rgb(255, 255, 255);\\\">\\u6b22\\u8fce\\u9605\\u8bfb\\u300aAPP\\u7528\\u6237\\u670d\\u52a1\\u534f\\u8bae\\u300b(\\u4ee5\\u4e0b\\u7b80\\u79f0\\u201c\\u672c\\u534f\\u8bae\\u201d)\\u3002\\u672c\\u534f\\u8bae\\u9610\\u8ff0\\u4e4b\\u6761\\u6b3e\\u548c\\u6761\\u4ef6\\u9002\\u7528\\u4e8e\\u60a8\\uff08\\u4ee5\\u4e0b\\u7b80\\u79f0\\u201c\\u7528\\u6237\\u201d\\uff09\\u4f7f\\u7528APP\\u7684\\u5404\\u79cd\\u4ea7\\u54c1\\u548c\\u670d\\u52a1\\u3002<br><br>1. \\u670d\\u52a1\\u534f\\u8bae\\u7684\\u786e\\u8ba4<br><br>1.1 XX\\u516c\\u53f8\\u53ca\\u76f8\\u5173\\u5173\\u8054\\u4f01\\u4e1a\\uff08\\u4ee5\\u4e0b\\u5408\\u79f0\\u201c\\u5e73\\u53f0\\u201d\\uff09\\u540c\\u610f\\u6309\\u7167\\u672c\\u534f\\u8bae\\u7684\\u89c4\\u5b9a\\u53ca\\u5176\\u4e0d\\u65f6\\u53d1\\u5e03\\u7684\\u64cd\\u4f5c\\u89c4\\u5219\\u63d0\\u4f9b\\u57fa\\u4e8e\\u4e92\\u8054\\u7f51\\u79fb\\u52a8\\u7f51\\u7684\\u73e0\\u5b9dV\\u8bfeAPP\\u3001\\u5e73\\u53f0\\u5b98\\u65b9\\u7f51\\u7ad9\\u7b49\\u76f8\\u5173\\u670d\\u52a1\\uff08\\u4ee5\\u4e0b\\u7b80\\u79f0\\u201c\\u5e73\\u53f0\\u670d\\u52a1\\u201d\\uff09\\u3002<br><br>1.2 \\u5e73\\u53f0\\u670d\\u52a1\\u4f7f\\u7528\\u4eba\\uff08\\u4ee5\\u4e0b\\u7b80\\u79f0\\u201c\\u7528\\u6237\\u201d\\uff09\\u5e94\\u5f53\\u57fa\\u4e8e\\u4e86\\u89e3\\u672c\\u534f\\u8bae\\u5168\\u90e8\\u5185\\u5bb9\\u3001\\u5728\\u72ec\\u7acb\\u601d\\u8003\\u7684\\u57fa\\u7840\\u4e0a\\u8ba4\\u53ef\\u3001\\u540c\\u610f\\u672c\\u534f\\u8bae\\u7684\\u5168\\u90e8\\u6761\\u6b3e\\u5e76\\u6309\\u7167\\u9875\\u9762\\u4e0a\\u7684\\u63d0\\u793a\\u5b8c\\u6210\\u5168\\u90e8\\u7684\\u6ce8\\u518c\\u7a0b\\u5e8f\\uff0c\\u7528\\u6237\\u7684\\u6ce8\\u518c\\u3001\\u767b\\u5f55\\u3001\\u4f7f\\u7528\\u7b49\\u884c\\u4e3a\\u5c06\\u89c6\\u4e3a\\u5b8c\\u5168\\u63a5\\u53d7\\u672c\\u534f\\u8bae\\u53ca\\u5b98\\u65b9\\u516c\\u793a\\u7684\\u5404\\u9879\\u89c4\\u5219\\u3001\\u89c4\\u8303\\u3002<br><br>1.3 \\u5b98\\u65b9\\u4eab\\u6709\\u5bf9\\u5e73\\u53f0APP\\u3001\\u5e73\\u53f0\\u5b98\\u65b9\\u7f51\\u7ad9\\u4e0a\\u4e00\\u5207\\u6d3b\\u52a8\\u7684\\u76d1\\u7763\\u3001\\u63d0\\u793a\\u3001\\u68c0\\u67e5\\u3001\\u7ea0\\u6b63\\u7b49\\u6743\\u5229\\u3002<br><br>2. \\u670d\\u52a1\\u5185\\u5bb9<br><br>2.1 \\u5e73\\u53f0\\u670d\\u52a1\\u7684\\u5177\\u4f53\\u5185\\u5bb9\\u7531\\u5b98\\u65b9\\u6839\\u636e\\u5b9e\\u9645\\u60c5\\u51b5\\u63d0\\u4f9b\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u6388\\u6743\\u7528\\u6237\\u901a\\u8fc7\\u5176\\u5e10\\u53f7\\u4e0a\\u4f20\\u3001\\u641c\\u7d22\\u5e76\\u5411\\u4e92\\u76f8\\u5173\\u8054\\u7684\\u7528\\u6237\\u63a8\\u9001\\u76f8\\u5173\\u4fe1\\u606f\\u3001\\u6388\\u6743\\u7528\\u6237\\u5bf9\\u5176\\u8fdb\\u884c\\u6536\\u5f55\\u3001\\u5206\\u4eab\\u7b49\\uff0c\\u5b98\\u65b9\\u6709\\u6743\\u5bf9\\u5176\\u63d0\\u4f9b\\u7684\\u670d\\u52a1\\u6216\\u4ea7\\u54c1\\u5f62\\u6001\\u8fdb\\u884c\\u5347\\u7ea7\\u6216\\u5176\\u4ed6\\u8c03\\u6574\\uff0c\\u5747\\u4ee5APP\\\\\\u7f51\\u7ad9\\u5185\\u5bb9\\u66f4\\u65b0\\u7684\\u65b9\\u5f0f\\u901a\\u77e5\\u7528\\u6237\\uff0c\\u4e0d\\u5355\\u72ec\\u901a\\u77e5\\u7528\\u6237\\u3002<br><br>2.2 \\u5b98\\u65b9\\u63d0\\u4f9b\\u7684\\u5e73\\u53f0\\u670d\\u52a1\\u4e2d\\u53ef\\u80fd\\u5305\\u62ec\\u5e7f\\u544a\\uff0c\\u7528\\u6237\\u540c\\u610f\\u5728\\u4f7f\\u7528\\u8fc7\\u7a0b\\u4e2d\\u663e\\u793a\\u5e73\\u53f0\\u548c\\u7b2c\\u4e09\\u65b9\\u4f9b\\u5e94\\u5546\\u3001\\u5408\\u4f5c\\u4f19\\u4f34\\u63d0\\u4f9b\\u7684\\u5e7f\\u544a\\u3002<br><br>2.3 \\u5b98\\u65b9\\u4ec5\\u63d0\\u4f9b\\u4e0e\\u5e73\\u53f0\\u670d\\u52a1\\u76f8\\u5173\\u7684\\u6280\\u672f\\u670d\\u52a1\\u7b49\\uff0c\\u9664\\u6b64\\u4e4b\\u5916\\u4e0e\\u76f8\\u5173\\u7f51\\u7edc\\u670d\\u52a1\\u6709\\u5173\\u7684\\u8bbe\\u5907\\uff08\\u5982\\u4e2a\\u4eba\\u7535\\u8111\\u3001\\u624b\\u673a\\u3001\\u53ca\\u5176\\u4ed6\\u4e0e\\u63a5\\u5165\\u4e92\\u8054\\u7f51\\u6216\\u79fb\\u52a8\\u7f51\\u6709\\u5173\\u7684\\u88c5\\u7f6e\\uff09\\u53ca\\u6240\\u9700\\u8d39\\u7528\\uff08\\u5982\\u4e3a\\u63a5\\u5165\\u4e92\\u8054\\u7f51\\u800c\\u652f\\u4ed8\\u7684\\u7535\\u8bdd\\u8d39\\u53ca\\u4e0a\\u7f51\\u8d39\\u3001\\u4e3a\\u4f7f\\u7528\\u79fb\\u52a8\\u7f51\\u800c\\u652f\\u4ed8\\u7684\\u624b\\u673a\\u8d39\\uff09\\u5747\\u5e94\\u7531\\u7528\\u6237\\u81ea\\u884c\\u8d1f\\u62c5\\u3002<br><br>3. \\u670d\\u52a1\\u53d8\\u66f4\\u3001\\u4e2d\\u65ad\\u6216\\u7ec8\\u6b62<br><br>3.1 \\u9274\\u4e8e\\u7f51\\u7edc\\u670d\\u52a1\\u7684\\u7279\\u6b8a\\u6027\\uff08\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u4e0d\\u53ef\\u6297\\u529b\\u3001\\u7f51\\u7edc\\u7a33\\u5b9a\\u6027\\u3001\\u7cfb\\u7edf\\u7a33\\u5b9a\\u6027\\u3001\\u6280\\u672f\\u6545\\u969c\\u3001\\u7528\\u6237\\u6240\\u5728\\u4f4d\\u7f6e\\u3001\\u7528\\u6237\\u5173\\u673a\\u3001\\u7528\\u6237\\u624b\\u673a\\u75c5\\u6bd2\\u6216\\u6076\\u610f\\u7684\\u7f51\\u7edc\\u653b\\u51fb\\u884c\\u4e3a\\u53ca\\u5176\\u4ed6\\u4efb\\u4f55\\u6280\\u672f\\u3001\\u4e92\\u8054\\u7f51\\u7edc\\u3001\\u901a\\u4fe1\\u7ebf\\u8def\\u3001\\u5185\\u5bb9\\u4fb5\\u6743\\u7b49\\u539f\\u56e0\\uff09\\uff0c\\u7528\\u6237\\u540c\\u610f\\uff0c\\u5b98\\u65b9\\u6709\\u6743\\u968f\\u65f6\\u4e2d\\u65ad\\u6216\\u7ec8\\u6b62\\u90e8\\u5206\\u6216\\u5168\\u90e8\\u5e73\\u53f0\\u670d\\u52a1\\uff0c\\u5b98\\u65b9\\u5c06\\u5c3d\\u53ef\\u80fd\\u53ca\\u65f6\\u4ee5\\u5408\\u7406\\u65b9\\u5f0f\\u901a\\u77e5\\u7528\\u6237\\uff0c\\u5e76\\u5c3d\\u53ef\\u80fd\\u5728\\u7b2c\\u4e00\\u65f6\\u95f4\\u5bf9\\u6b64\\u8fdb\\u884c\\u4fee\\u590d\\u3002\\u4f46\\u5bf9\\u56e0\\u6b64\\u5bfc\\u81f4\\u7528\\u6237\\u4e0d\\u80fd\\u53d1\\u9001\\u548c\\u63a5\\u53d7\\u9605\\u8bfb\\u4fe1\\u606f\\u3001\\u6216\\u63a5\\u53d1\\u9519\\u4fe1\\u606f\\uff0c\\u5b98\\u65b9\\u4e0d\\u627f\\u62c5\\u4efb\\u4f55\\u8d23\\u4efb\\uff0c\\u7528\\u6237\\u987b\\u627f\\u62c5\\u4ee5\\u4e0a\\u98ce\\u9669\\u3002<br><br>3.2 \\u7528\\u6237\\u7406\\u89e3\\uff0c\\u5b98\\u65b9\\u9700\\u8981\\u5b9a\\u671f\\u6216\\u4e0d\\u5b9a\\u671f\\u5730\\u5bf9\\u63d0\\u4f9b\\u5e73\\u53f0\\u670d\\u52a1\\u7684\\u5e73\\u53f0\\u6216\\u76f8\\u5173\\u8bbe\\u5907\\u8fdb\\u884c\\u68c0\\u4fee\\u548c\\u7ef4\\u62a4\\uff0c\\u5982\\u56e0\\u6b64\\u7c7b\\u60c5\\u51b5\\u800c\\u9020\\u6210\\u670d\\u52a1\\u5728\\u5408\\u7406\\u671f\\u95f4\\u5185\\u7684\\u4e2d\\u65ad\\uff0c\\u5b98\\u65b9\\u5c06\\u5c3d\\u53ef\\u80fd\\u4e8b\\u5148\\u901a\\u77e5\\uff0c\\u4f46\\u65e0\\u9700\\u4e3a\\u6b64\\u627f\\u62c5\\u4efb\\u4f55\\u8d23\\u4efb\\u3002<br><br>3.3 \\u7528\\u6237\\u63d0\\u4f9b\\u7684\\u4e2a\\u4eba\\u8d44\\u6599\\u4e0d\\u771f\\u5b9e\\u3001\\u7528\\u6237\\u8fdd\\u53cd\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u56fd\\u5bb6\\u653f\\u7b56\\u6216\\u672c\\u534f\\u8bae\\u89c4\\u5b9a\\u7684\\u4f7f\\u7528\\u89c4\\u5219\\uff0c\\u5b98\\u65b9\\u6709\\u6743\\u968f\\u65f6\\u4e2d\\u65ad\\u6216\\u7ec8\\u6b62\\u5411\\u7528\\u6237\\u63d0\\u4f9b\\u672c\\u534f\\u8bae\\u9879\\u4e0b\\u7684\\u5e73\\u53f0\\u670d\\u52a1\\uff0c\\u800c\\u65e0\\u9700\\u5bf9\\u7528\\u6237\\u6216\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u627f\\u62c5\\u4efb\\u4f55\\u8d23\\u4efb\\u3002<br><br>4. \\u4f7f\\u7528\\u89c4\\u5219<br><br>4.1 \\u7528\\u6237\\u5728\\u7533\\u8bf7\\u6ce8\\u518c\\u5e73\\u53f0\\u670d\\u52a1\\u65f6\\uff0c\\u5fc5\\u987b\\u5411\\u5b98\\u65b9\\u63d0\\u4f9b\\u51c6\\u786e\\u7684\\u4e3b\\u4f53\\u8d44\\u6599\\uff08\\u7528\\u6237\\u4e3a\\u4e2a\\u4eba\\u65f6\\uff0c\\u5305\\u62ec\\u59d3\\u540d\\u3001\\u6027\\u522b\\u3001\\u51fa\\u751f\\u5e74\\u6708\\u3001\\u7535\\u8bdd\\u3001\\u90ae\\u7bb1\\u7b49\\uff1b\\u7528\\u6237\\u4e3a\\u5355\\u4f4d\\u65f6\\uff0c\\u5305\\u62ec\\u540d\\u79f0\\u3001\\u6ce8\\u518c\\u5730\\u5740\\u3001\\u6ce8\\u518c\\u53f7\\u7b49\\uff09\\uff0c\\u5982\\u4e3b\\u4f53\\u8d44\\u6599\\u6709\\u4efb\\u4f55\\u53d8\\u52a8\\uff0c\\u5fc5\\u987b\\u53ca\\u65f6\\u66f4\\u65b0\\u3002\\u56e0\\u7528\\u6237\\u63d0\\u4f9b\\u8d44\\u6599\\u7684\\u771f\\u5b9e\\u6027\\u95ee\\u9898\\u5bfc\\u81f4\\u534f\\u8bae\\u53cc\\u65b9\\u6216\\u7b2c\\u4e09\\u65b9\\u7684\\u4efb\\u4f55\\u635f\\u5931\\u5747\\u7531\\u7528\\u6237\\u627f\\u62c5\\u3002<br><br>4.2 \\u7528\\u6237\\u6ce8\\u518c\\u6210\\u529f\\u540e\\uff0c\\u5c06\\u83b7\\u5f97\\u4e00\\u4e2a\\u5e73\\u53f0\\u5e10\\u53f7\\u53ca\\u7531\\u7528\\u6237\\u8bbe\\u7f6e\\u7684\\u5bc6\\u7801\\uff0c\\u8be5\\u7528\\u6237\\u5e10\\u53f7\\u548c\\u5bc6\\u7801\\u7531\\u7528\\u6237\\u8d1f\\u8d23\\u4fdd\\u7ba1\\uff1b\\u7528\\u6237\\u5e94\\u5f53\\u5bf9\\u8be5\\u7528\\u6237\\u5e10\\u53f7\\u6240\\u6709\\u884c\\u4e3a\\u8d1f\\u76f8\\u5173\\u6cd5\\u5f8b\\u8d23\\u4efb\\u3002<br><br>\\u7528\\u6237\\u5728\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u8fc7\\u7a0b\\u4e2d\\uff0c\\u5fc5\\u987b\\u9075\\u5faa\\u4ee5\\u4e0b\\u539f\\u5219:<br><br>(1) \\u9075\\u5b88\\u4e2d\\u56fd\\u6709\\u5173\\u7684\\u6cd5\\u5f8b\\u548c\\u6cd5\\u89c4\\uff1b<br><br>(2) \\u4e0d\\u5f97\\u4e3a\\u4efb\\u4f55\\u975e\\u6cd5\\u76ee\\u7684\\u800c\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\uff1b<br><br>(3) \\u9075\\u5b88\\u6240\\u6709\\u4e0e\\u7f51\\u7edc\\u670d\\u52a1\\u6709\\u5173\\u7684\\u7f51\\u7edc\\u534f\\u8bae\\u3001\\u89c4\\u5b9a\\u548c\\u7a0b\\u5e8f\\uff1b<br><br>(4) \\u4e0d\\u5f97\\u5229\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u7cfb\\u7edf\\u8fdb\\u884c\\u4efb\\u4f55\\u53ef\\u80fd\\u5bf9\\u4e92\\u8054\\u7f51\\u7684\\u6b63\\u5e38\\u8fd0\\u8f6c\\u9020\\u6210\\u4e0d\\u5229\\u5f71\\u54cd\\u7684\\u884c\\u4e3a\\uff1b<br><br>(5) \\u4e0d\\u5f97\\u5229\\u7528\\u5e73\\u53f0\\u7f51\\u7edc\\u670d\\u52a1\\u7cfb\\u7edf\\u8fdb\\u884c\\u4efb\\u4f55\\u4e0d\\u5229\\u4e8e\\u5b98\\u65b9\\u7684\\u884c\\u4e3a\\u3002<br><br>4.3 \\u7528\\u6237\\u4e0d\\u5f97\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u5236\\u4f5c\\u3001\\u4e0a\\u4f20\\u3001\\u53d1\\u9001\\u3001\\u4f20\\u64ad\\u654f\\u611f\\u4fe1\\u606f\\u548c\\u8fdd\\u53cd\\u56fd\\u5bb6\\u6cd5\\u5f8b\\u5236\\u5ea6\\u7684\\u4fe1\\u606f\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u4e0b\\u5217\\u4fe1\\u606f:<br><br>(1) \\u53cd\\u5bf9\\u5baa\\u6cd5\\u6240\\u786e\\u5b9a\\u7684\\u57fa\\u672c\\u539f\\u5219\\u7684\\uff1b<br><br>(2) \\u5371\\u5bb3\\u56fd\\u5bb6\\u5b89\\u5168\\uff0c\\u6cc4\\u9732\\u56fd\\u5bb6\\u79d8\\u5bc6\\uff0c\\u98a0\\u8986\\u56fd\\u5bb6\\u653f\\u6743\\uff0c\\u7834\\u574f\\u56fd\\u5bb6\\u7edf\\u4e00\\u7684\\uff1b<br><br>(3) \\u635f\\u5bb3\\u56fd\\u5bb6\\u8363\\u8a89\\u548c\\u5229\\u76ca\\u7684\\uff1b<br><br>(4) \\u717d\\u52a8\\u6c11\\u65cf\\u4ec7\\u6068\\u3001\\u6c11\\u65cf\\u6b67\\u89c6\\uff0c\\u7834\\u574f\\u6c11\\u65cf\\u56e2\\u7ed3\\u7684\\uff1b<br><br>(5) \\u7834\\u574f\\u56fd\\u5bb6\\u5b97\\u6559\\u653f\\u7b56\\uff0c\\u5ba3\\u626c\\u90aa\\u6559\\u548c\\u5c01\\u5efa\\u8ff7\\u4fe1\\u7684\\uff1b<br><br>(6) \\u6563\\u5e03\\u8c23\\u8a00\\uff0c\\u6270\\u4e71\\u793e\\u4f1a\\u79e9\\u5e8f\\uff0c\\u7834\\u574f\\u793e\\u4f1a\\u7a33\\u5b9a\\u7684\\uff1b<br><br>(7) \\u6563\\u5e03\\u6deb\\u79fd\\u3001\\u8272\\u60c5\\u3001\\u8d4c\\u535a\\u3001\\u66b4\\u529b\\u3001\\u51f6\\u6740\\u3001\\u6050\\u6016\\u6216\\u8005\\u6559\\u5506\\u72af\\u7f6a\\u7684\\uff1b<br><br>(8) \\u4fae\\u8fb1\\u6216\\u8005\\u8bfd\\u8c24\\u4ed6\\u4eba\\uff0c\\u4fb5\\u5bb3\\u4ed6\\u4eba\\u5408\\u6cd5\\u6743\\u76ca\\u7684\\uff1b<br><br>(9) \\u542b\\u6709\\u6cd5\\u5f8b\\u3001\\u884c\\u653f\\u6cd5\\u89c4\\u7981\\u6b62\\u7684\\u5176\\u4ed6\\u5185\\u5bb9\\u7684\\u3002<br><br>4.4 \\u7528\\u6237\\u540c\\u610f\\u5728\\u4efb\\u4f55\\u60c5\\u51b5\\u4e0b\\u4e0d\\u4f7f\\u7528\\u5176\\u4ed6\\u7528\\u6237\\u7684\\u5e10\\u53f7\\u6216\\u5bc6\\u7801\\u3002\\u5728\\u60a8\\u6000\\u7591\\u4ed6\\u4eba\\u5728\\u4f7f\\u7528\\u60a8\\u7684\\u5e10\\u53f7\\u6216\\u5bc6\\u7801\\u65f6\\uff0c\\u60a8\\u540c\\u610f\\u7acb\\u5373\\u901a\\u77e5\\u5b98\\u65b9\\u3002<br><br>4.5 \\u7528\\u6237\\u6709\\u6743\\u66f4\\u6539\\u3001\\u5220\\u9664\\u5728\\u5e73\\u53f0\\u670d\\u52a1\\u4e2d\\u7684\\u4e2a\\u4eba\\u8d44\\u6599\\u3001\\u6ce8\\u518c\\u4fe1\\u606f\\u53ca\\u4f20\\u9001\\u5185\\u5bb9\\u7b49\\uff0c\\u4f46\\u5220\\u9664\\u6709\\u5173\\u4fe1\\u606f\\u7684\\u540c\\u65f6\\u4e5f\\u4f1a\\u5220\\u9664\\u4efb\\u4f55\\u60a8\\u50a8\\u5b58\\u5728\\u7cfb\\u7edf\\u4e2d\\u7684\\u6587\\u5b57\\u548c\\u56fe\\u7247\\u3002\\u7528\\u6237\\u9700\\u627f\\u62c5\\u8be5\\u98ce\\u9669\\u3002<br><br>4.6 \\u5982\\u56e0\\u7528\\u6237\\u8fdd\\u53cd\\u672c\\u534f\\u8bae\\u4e2d\\u7684\\u4efb\\u4f55\\u6761\\u6b3e\\uff0c\\u5b98\\u65b9\\u6709\\u6743\\u4f9d\\u636e\\u672c\\u534f\\u8bae\\u7ec8\\u6b62\\u5bf9\\u8fdd\\u7ea6\\u7528\\u6237\\u5e73\\u53f0\\u5e10\\u53f7\\u63d0\\u4f9b\\u670d\\u52a1\\u3002<br><br>4.7 \\u5982\\u7528\\u6237\\u6ce8\\u518c\\u5e73\\u53f0\\u5e10\\u53f7\\u540e\\u957f\\u671f\\u4e0d\\u767b\\u5f55\\u8be5\\u5e10\\u53f7\\uff0c\\u5b98\\u65b9\\u6709\\u6743\\u56de\\u6536\\u8be5\\u5e10\\u53f7\\uff0c\\u4ee5\\u514d\\u9020\\u6210\\u8d44\\u6e90\\u6d6a\\u8d39\\uff0c\\u7531\\u6b64\\u5e26\\u6765\\u95ee\\u9898\\u5747\\u7531\\u7528\\u6237\\u81ea\\u884c\\u627f\\u62c5\\u3002<br><br>5. \\u77e5\\u8bc6\\u4ea7\\u6743<br><br>5.1 \\u5b98\\u65b9\\u63d0\\u4f9b\\u5e73\\u53f0\\u670d\\u52a1\\u4e2d\\u6240\\u5305\\u542b\\u7684\\u4efb\\u4f55\\u6587\\u672c\\u3001\\u56fe\\u7247\\u3001\\u6807\\u8bc6\\u3001\\u97f3\\u9891\\u3001\\u89c6\\u9891\\u8d44\\u6599\\u5747\\u53d7\\u8457\\u4f5c\\u6743\\u3001\\u5546\\u6807\\u6743\\u3001\\u4e13\\u5229\\u6743\\u53ca\\u5176\\u4ed6\\u8d22\\u4ea7\\u6743\\u6cd5\\u5f8b\\u7684\\u4fdd\\u62a4\\u3002<br><br>5.2 \\u672a\\u7ecf\\u76f8\\u5173\\u6743\\u5229\\u4eba\\u548c\\u5b98\\u65b9\\u7684\\u540c\\u610f\\uff0c\\u4e0a\\u8ff0\\u8d44\\u6599\\u5747\\u4e0d\\u5f97\\u4ee5\\u4efb\\u4f55\\u65b9\\u5f0f\\u88ab\\u5c55\\u793a\\u4e8e\\u5176\\u4ed6\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u5e73\\u53f0\\u6216\\u88ab\\u7528\\u4e8e\\u5176\\u4ed6\\u4efb\\u4f55\\u5546\\u4e1a\\u76ee\\u7684\\uff1b\\u7528\\u6237\\u4e0d\\u5f97\\u64c5\\u81ea\\u590d\\u5236\\u3001\\u4fee\\u6539\\u3001\\u7f16\\u7e82\\u4e0a\\u8ff0\\u5185\\u5bb9\\u3001\\u6216\\u521b\\u9020\\u4e0e\\u5185\\u5bb9\\u6709\\u5173\\u7684\\u884d\\u751f\\u4ea7\\u54c1\\u3002<br><br>6. \\u9690\\u79c1\\u4fdd\\u62a4<br><br>6.1 \\u672c\\u534f\\u8bae\\u6240\\u6307\\u7684\\u201c\\u9690\\u79c1\\u201d\\u5305\\u62ec\\u300a\\u7535\\u4fe1\\u548c\\u4e92\\u8054\\u7f51\\u7528\\u6237\\u4e2a\\u4eba\\u4fe1\\u606f\\u4fdd\\u62a4\\u89c4\\u5b9a\\u300b\\u7b2c4\\u6761\\u89c4\\u5b9a\\u7684\\u7528\\u6237\\u4e2a\\u4eba\\u4fe1\\u606f\\u7684\\u5185\\u5bb9\\u4ee5\\u53ca\\u672a\\u6765\\u4e0d\\u65f6\\u5236\\u5b9a\\u6216\\u4fee\\u8ba2\\u7684\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u4e2d\\u660e\\u786e\\u89c4\\u5b9a\\u7684\\u9690\\u79c1\\u5e94\\u5305\\u62ec\\u7684\\u5185\\u5bb9\\u3002<br><br>6.2 \\u4fdd\\u62a4\\u7528\\u6237\\u9690\\u79c1\\u548c\\u4e2a\\u4eba\\u6570\\u636e\\u662f\\u5b98\\u65b9\\u7684\\u4e00\\u9879\\u57fa\\u672c\\u5236\\u5ea6\\uff0c\\u5b98\\u65b9\\u5c06\\u91c7\\u53d6\\u5404\\u79cd\\u5236\\u5ea6\\u3001\\u5b89\\u5168\\u6280\\u672f\\u548c\\u7a0b\\u5e8f\\u7b49\\u63aa\\u65bd\\u6765\\u4fdd\\u62a4\\u7528\\u6237\\u9690\\u79c1\\u548c\\u4e2a\\u4eba\\u6570\\u636e\\u4e0d\\u88ab\\u672a\\u7ecf\\u6388\\u6743\\u7684\\u8bbf\\u95ee\\u3001\\u4f7f\\u7528\\u6216\\u6cc4\\u6f0f\\uff0c\\u5e76\\u4fdd\\u8bc1\\u4e0d\\u4f1a\\u5c06\\u5355\\u4e2a\\u7528\\u6237\\u7684\\u6ce8\\u518c\\u8d44\\u6599\\u53ca\\u7528\\u6237\\u5728\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u65f6\\u5b58\\u50a8\\u5728\\u5b98\\u65b9\\u7684\\u975e\\u516c\\u5f00\\u5185\\u5bb9\\u5411\\u9664\\u5408\\u4f5c\\u5355\\u4f4d\\u4ee5\\u5916\\u7684\\u7b2c\\u4e09\\u65b9\\u516c\\u5f00\\u6216\\u7528\\u4e8e\\u4efb\\u4f55\\u975e\\u6cd5\\u7684\\u7528\\u9014\\uff0c\\u4f46\\u4e0b\\u5217\\u60c5\\u51b5\\u9664\\u5916\\uff1a<br><br>(1) \\u4e8b\\u5148\\u83b7\\u5f97\\u7528\\u6237\\u7684\\u660e\\u786e\\u6388\\u6743\\uff1b<br><br>(2) \\u6839\\u636e\\u6709\\u5173\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u7684\\u8981\\u6c42\\uff1b<br><br>(3) \\u6309\\u7167\\u76f8\\u5173\\u653f\\u5e9c\\u4e3b\\u7ba1\\u90e8\\u95e8\\u7684\\u8981\\u6c42\\uff1b<br><br>(4) \\u4e3a\\u7ef4\\u62a4\\u793e\\u4f1a\\u516c\\u4f17\\u7684\\u5229\\u76ca\\uff1b<br><br>(5) \\u7528\\u6237\\u4fb5\\u5bb3\\u672c\\u534f\\u8bae\\u9879\\u4e0b\\u5b98\\u65b9\\u7684\\u5408\\u6cd5\\u6743\\u76ca\\u7684\\u60c5\\u51b5\\u4e0b\\u800c\\u4e3a\\u7ef4\\u62a4\\u5b98\\u65b9\\u7684\\u5408\\u6cd5\\u6743\\u76ca\\u6240\\u5fc5\\u987b\\u3002<br><br>6.3 \\u7528\\u6237\\u5728\\u6ce8\\u518c\\u5e73\\u53f0APP\\u5e10\\u53f7\\u6216\\u4f7f\\u7528\\u5e73\\u53f0APP\\u670d\\u52a1\\u7684\\u8fc7\\u7a0b\\u4e2d\\uff0c\\u9700\\u8981\\u63d0\\u4f9b\\u4e00\\u4e9b\\u5fc5\\u8981\\u7684\\u4fe1\\u606f\\uff0c\\u4f8b\\u5982\\uff1a\\u59d3\\u540d\\u3001\\u7535\\u8bdd\\u3001\\u90ae\\u7bb1\\u3001\\u6027\\u522b\\u3001\\u51fa\\u751f\\u5e74\\u6708\\u3001\\u540d\\u79f0\\u3001\\u6ce8\\u518c\\u5730\\u5740\\u3001\\u6ce8\\u518c\\u53f7\\u7b49\\u3002\\u4e3a\\u5411\\u7528\\u6237\\u63d0\\u4f9b\\u5e10\\u53f7\\u6ce8\\u518c\\u670d\\u52a1\\u6216\\u8fdb\\u884c\\u7528\\u6237\\u8eab\\u4efd\\u8bc6\\u522b\\uff0c\\u9700\\u8981\\u7528\\u6237\\u586b\\u5199\\u624b\\u673a\\u53f7\\u7801\\uff1b\\u90e8\\u5206\\u529f\\u80fd\\u9700\\u8981\\u7528\\u6237\\u6388\\u6743\\u4f7f\\u7528\\u7528\\u6237\\u7684\\u76f8\\u673a\\u6216\\u76f8\\u518c\\uff1b\\u90e8\\u5206\\u529f\\u80fd\\u9700\\u8981\\u7528\\u6237\\u6388\\u6743\\u8bbf\\u95ee\\u7528\\u6237\\u7684\\u624b\\u673a\\u901a\\u8baf\\u5f55\\u7b49\\u3002\\u82e5\\u7528\\u6237\\u4e0d\\u6388\\u6743\\u6216\\u63d0\\u4f9b\\u7684\\u4fe1\\u606f\\u4e0d\\u5b8c\\u6574\\uff0c\\u5219\\u65e0\\u6cd5\\u4f7f\\u7528\\u672c\\u670d\\u52a1\\u6216\\u5728\\u4f7f\\u7528\\u8fc7\\u7a0b\\u4e2d\\u53d7\\u5230\\u9650\\u5236\\u3002\\u7528\\u6237\\u6388\\u6743\\u63d0\\u4f9b\\u7684\\u4fe1\\u606f\\uff0c\\u5b98\\u65b9\\u627f\\u8bfa\\u5c06\\u91c7\\u53d6\\u63aa\\u65bd\\u4fdd\\u62a4\\u7528\\u6237\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u5b89\\u5168\\u3002<br><br>6.4 \\u4e3a\\u4e86\\u5411\\u7528\\u6237\\u63d0\\u4f9b\\u66f4\\u597d\\u7684\\u7528\\u6237\\u4f53\\u9a8c\\u548c\\u63d0\\u9ad8\\u5e73\\u53f0APP\\u7684\\u670d\\u52a1\\u8d28\\u91cf\\uff0c\\u5b98\\u65b9\\u5c06\\u53ef\\u80fd\\u4f1a\\u6536\\u96c6\\u4f7f\\u7528\\u6216\\u5411\\u7b2c\\u4e09\\u65b9\\u63d0\\u4f9b\\u7528\\u6237\\u7684\\u975e\\u4e2a\\u4eba\\u9690\\u79c1\\u4fe1\\u606f\\u3002\\u5b98\\u65b9\\u5c06\\u5bf9\\u8be5\\u7b2c\\u4e09\\u65b9\\u4f7f\\u7528\\u7528\\u6237\\u4e2a\\u4eba\\u6570\\u636e\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u76d1\\u7763\\u548c\\u7ba1\\u7406\\uff0c\\u5c3d\\u4e00\\u5207\\u53ef\\u80fd\\u52aa\\u529b\\u4fdd\\u62a4\\u7528\\u6237\\u4e2a\\u4eba\\u4fe1\\u606f\\u7684\\u5b89\\u5168\\u3002<br><br>7. \\u514d\\u8d23\\u58f0\\u660e<br><br>7.1 \\u7528\\u6237\\u5728\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u7684\\u8fc7\\u7a0b\\u4e2d\\u5e94\\u9075\\u5b88\\u56fd\\u5bb6\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u53ca\\u653f\\u7b56\\u89c4\\u5b9a\\uff0c\\u5bf9\\u5176\\u6240\\u5236\\u4f5c\\u3001\\u4e0a\\u4f20\\u3001\\u53d1\\u9001\\u3001\\u4f20\\u64ad\\u7684\\u4fe1\\u606f\\u548c\\u5185\\u5bb9\\u627f\\u62c5\\u4efb\\u4f55\\u6cd5\\u5f8b\\u8d23\\u4efb\\uff0c\\u4e0e\\u5b98\\u65b9\\u65e0\\u5173\\u3002<br><br>7.2 \\u5e73\\u53f0APP\\u5728\\u5176\\u9875\\u9762\\u4e0a\\u5411\\u7528\\u6237\\u663e\\u793a\\u3001\\u63a8\\u9001\\u7684\\u4efb\\u4f55\\u4fe1\\u606f\\u548c\\u5185\\u5bb9\\u5982\\u7cfb\\u5b98\\u65b9\\u5229\\u7528\\u6280\\u672f\\u624b\\u6bb5\\u6839\\u636e\\u7528\\u6237\\u6307\\u4ee4\\u4ece\\u4e92\\u8054\\u7f51\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u7f51\\u7ad9\\u641c\\u7d22\\u3001\\u5b9a\\u4f4d\\u3001\\u5339\\u914d\\u540e\\u63a8\\u8350\\u7ed9\\u7528\\u6237\\u800c\\u975e\\u5b98\\u65b9\\u5355\\u65b9\\u5236\\u4f5c\\u7684\\uff0c\\u5219\\u8be5\\u663e\\u793a\\u3001\\u63a8\\u9001\\u7684\\u4fe1\\u606f\\u548c\\u5185\\u5bb9\\u5e76\\u4e0d\\u4ee3\\u8868\\u5b98\\u65b9\\u53ca\\u5e73\\u53f0APP\\u7684\\u89c2\\u70b9\\uff0c\\u5b98\\u65b9\\u5e76\\u4e0d\\u5bf9\\u4e0a\\u8ff0\\u4fe1\\u606f\\u7684\\u51c6\\u786e\\u6027\\u548c\\u6b63\\u786e\\u6027\\u8d1f\\u8d23\\u3002<br><br>7.3\\u5b98\\u65b9\\u63d0\\u4f9b\\u5e73\\u53f0APP\\u670d\\u52a1\\u4e2d\\u6240\\u5305\\u542b\\u7684\\u4efb\\u4f55\\u6587\\u672c\\u3001\\u56fe\\u7247\\u3001\\u6807\\u8bc6\\u3001\\u97f3\\u9891\\u3001\\u89c6\\u9891\\u8d44\\u6599\\u5747\\u4e3a\\u6559\\u5b66\\u7528\\u9014\\uff0c\\u4e0d\\u6d89\\u53ca\\u4efb\\u4f55\\u5b9e\\u4f53\\u7269\\u54c1\\u7684\\u5546\\u4e1a\\u6d3b\\u52a8\\u3002<br><br>7.4\\u5e73\\u53f0APP\\u5728\\u5176\\u9875\\u9762\\u4e0a\\u5411\\u7528\\u6237\\u663e\\u793a\\u3001\\u63a8\\u9001\\u7684\\u4efb\\u4f55\\u4fe1\\u606f\\u548c\\u5185\\u5bb9\\u5982\\u5b58\\u5728\\u4fb5\\u6743\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u77e5\\u8bc6\\u4ea7\\u6743\\u7684\\u5acc\\u7591\\uff0c\\u6743\\u5229\\u4eba\\u548c\\u76f8\\u5173\\u5229\\u5bb3\\u5173\\u7cfb\\u4eba\\u5e94\\u5f53\\u5411\\u5b98\\u65b9\\u53d1\\u51fa\\u6743\\u5229\\u901a\\u77e5\\uff0c\\u5b98\\u65b9\\u7ecf\\u8fc7\\u6838\\u5b9e\\u540e\\u6839\\u636e\\u6709\\u5173\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u6709\\u6743\\u91c7\\u53d6\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u65ad\\u5f00\\u8be5\\u4fb5\\u6743\\u5185\\u5bb9\\u7684\\u94fe\\u63a5\\u6216\\u5220\\u9664\\u5e76\\u505c\\u6b62\\u4f20\\u8f93\\u8be5\\u4fb5\\u6743\\u5185\\u5bb9\\uff0c\\u4f46\\u5b98\\u65b9\\u5e76\\u4e0d\\u5bf9\\u8be5\\u4fb5\\u6743\\u5185\\u5bb9\\u627f\\u62c5\\u6cd5\\u5f8b\\u8d23\\u4efb\\u3002<br><br>7.5\\u7528\\u6237\\u8fdd\\u53cd\\u672c\\u534f\\u8bae\\u7684\\u89c4\\u5b9a\\uff0c\\u5bfc\\u81f4\\u6216\\u4ea7\\u751f\\u7684\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u4e3b\\u5f20\\u7684\\u4efb\\u4f55\\u7d22\\u8d54\\u3001\\u8981\\u6c42\\u6216\\u635f\\u5931\\uff0c\\u5305\\u62ec\\u5408\\u7406\\u7684\\u5f8b\\u5e08\\u8d39\\uff0c\\u7528\\u6237\\u540c\\u610f\\u8d54\\u507f\\u5b98\\u65b9\\uff0c\\u4f7f\\u4e4b\\u514d\\u53d7\\u635f\\u5bb3\\u3002<br><br>8. \\u5176\\u4ed6\\u6761\\u6b3e<br><br>8.1 \\u5b98\\u65b9\\u6709\\u6743\\u968f\\u65f6\\u4fee\\u6539\\u672c\\u534f\\u8bae\\u7684\\u4efb\\u4f55\\u6761\\u6b3e\\uff0c\\u4e00\\u65e6\\u672c\\u534f\\u8bae\\u7684\\u5185\\u5bb9\\u53d1\\u751f\\u53d8\\u52a8\\uff0c\\u5b98\\u65b9\\u5c06\\u4f1a\\u5728\\u5e73\\u53f0APP\\u5e73\\u53f0\\u4e2d\\u516c\\u5e03\\u4fee\\u6539\\u540e\\u7684\\u534f\\u8bae\\u5185\\u5bb9\\u6216\\u901a\\u8fc7\\u5176\\u4ed6\\u9002\\u5f53\\u65b9\\u5f0f\\u5411\\u7528\\u6237\\u516c\\u5e03\\u4fee\\u6539\\u5185\\u5bb9\\u3002\\u7528\\u6237\\u4e0d\\u540c\\u610f\\u4e0a\\u8ff0\\u4fee\\u6539\\u5185\\u5bb9\\uff0c\\u6709\\u6743\\u9009\\u62e9\\u505c\\u6b62\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\uff0c\\u4f46\\u7528\\u6237\\u7ee7\\u7eed\\u4f7f\\u7528\\uff0c\\u5219\\u89c6\\u4e3a\\u63a5\\u53d7\\u5b98\\u65b9\\u5bf9\\u672c\\u534f\\u8bae\\u76f8\\u5173\\u6761\\u6b3e\\u7684\\u4fee\\u6539\\u3002<br><br>8.2 \\u672c\\u300a\\u534f\\u8bae\\u300b\\u6240\\u5b9a\\u7684\\u4efb\\u4f55\\u6761\\u6b3e\\u65e0\\u8bba\\u56e0\\u4f55\\u79cd\\u539f\\u56e0\\u90e8\\u5206\\u6216\\u5168\\u90e8\\u65e0\\u6548\\u6216\\u4e0d\\u5177\\u6709\\u6267\\u884c\\u529b\\uff0c\\u672c\\u534f\\u8bae\\u7684\\u5176\\u4f59\\u6761\\u6b3e\\u4ecd\\u5e94\\u6709\\u6548\\u5e76\\u5177\\u5907\\u7ea6\\u675f\\u529b\\u3002<br><br>8.3 \\u672c\\u534f\\u8bae\\u7684\\u8ba2\\u7acb\\u3001\\u6267\\u884c\\u548c\\u89e3\\u91ca\\u53ca\\u7ea0\\u7eb7\\u7684\\u89e3\\u51b3\\u5747\\u5e94\\u9002\\u7528\\u4e2d\\u534e\\u4eba\\u6c11\\u5171\\u548c\\u56fd\\u6cd5\\u5f8b\\u5e76\\u53d7\\u4e2d\\u534e\\u4eba\\u6c11\\u5171\\u548c\\u56fd\\u6cd5\\u9662\\u7ba1\\u8f96\\u3002\\u5982\\u53cc\\u65b9\\u5c31\\u672c\\u534f\\u8bae\\u5185\\u5bb9\\u6216\\u6267\\u884c\\u53d1\\u751f\\u4efb\\u4f55\\u7ea0\\u7eb7\\u6216\\u4e89\\u8bae\\uff0c\\u9996\\u5148\\u5e94\\u53cb\\u597d\\u534f\\u5546\\u89e3\\u51b3\\uff0c\\u534f\\u5546\\u4e0d\\u6210\\u7684\\uff0c\\u4efb\\u4f55\\u4e00\\u65b9\\u5747\\u53ef\\u5411\\u5b98\\u65b9\\u6240\\u5728\\u5730\\u7684\\u6709\\u7ba1\\u8f96\\u6743\\u7684\\u4eba\\u6c11\\u6cd5\\u9662\\u63d0\\u8d77\\u8bc9\\u8bbc\\u3002<br><br>8.4 \\u672c\\u534f\\u8bae\\u7684\\u7248\\u6743\\u5f52\\u5b98\\u65b9\\u6240\\u6709\\uff0c\\u672c\\u534f\\u8bae\\u5404\\u9879\\u6761\\u6b3e\\u5185\\u5bb9\\u7684\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u53ca\\u4fee\\u6539\\u6743\\u5f52\\u5b98\\u65b9\\u6240\\u6709\\u3002<\\/span><\\/p>\",\"privacy\":\"<p>\\u672c\\u5e94\\u7528\\u975e\\u5e38\\u91cd\\u89c6\\u7528\\u6237\\u9690\\u79c1\\u653f\\u7b56\\u5e76\\u4e25\\u683c\\u9075\\u5b88\\u76f8\\u5173\\u7684\\u6cd5\\u5f8b\\u89c4\\u5b9a\\u3002\\u8bf7\\u60a8\\u4ed4\\u7ec6\\u9605\\u8bfb\\u300a\\u9690\\u79c1\\u653f\\u7b56\\u300b\\u540e\\u518d\\u7ee7\\u7eed\\u4f7f\\u7528\\u3002\\u5982\\u679c\\u60a8\\u7ee7\\u7eed\\u4f7f\\u7528\\u6211\\u4eec\\u7684\\u670d\\u52a1\\uff0c\\u8868\\u793a\\u60a8\\u5df2\\u7ecf\\u5145\\u5206\\u9605\\u8bfb\\u548c\\u7406\\u89e3\\u6211\\u4eec\\u534f\\u8bae\\u7684\\u5168\\u90e8\\u5185\\u5bb9\\u3002<\\/p><p>\\u672capp\\u5c0a\\u91cd\\u5e76\\u4fdd\\u62a4\\u6240\\u6709\\u4f7f\\u7528\\u670d\\u52a1\\u7528\\u6237\\u7684\\u4e2a\\u4eba\\u9690\\u79c1\\u6743\\u3002\\u4e3a\\u4e86\\u7ed9\\u60a8\\u63d0\\u4f9b\\u66f4\\u51c6\\u786e\\u3001\\u66f4\\u4f18\\u8d28\\u7684\\u670d\\u52a1\\uff0c\\u672c\\u5e94\\u7528\\u4f1a\\u6309\\u7167\\u672c\\u9690\\u79c1\\u6743\\u653f\\u7b56\\u7684\\u89c4\\u5b9a\\u4f7f\\u7528\\u548c\\u62ab\\u9732\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u3002\\u9664\\u672c\\u9690\\u79c1\\u6743\\u653f\\u7b56\\u53e6\\u6709\\u89c4\\u5b9a\\u5916\\uff0c\\u5728\\u672a\\u5f81\\u5f97\\u60a8\\u4e8b\\u5148\\u8bb8\\u53ef\\u7684\\u60c5\\u51b5\\u4e0b\\uff0c\\u672c\\u5e94\\u7528\\u4e0d\\u4f1a\\u5c06\\u8fd9\\u4e9b\\u4fe1\\u606f\\u5bf9\\u5916\\u62ab\\u9732\\u6216\\u5411\\u7b2c\\u4e09\\u65b9\\u63d0\\u4f9b\\u3002\\u672c\\u5e94\\u7528\\u4f1a\\u4e0d\\u65f6\\u66f4\\u65b0\\u672c\\u9690\\u79c1\\u6743\\u653f\\u7b56\\u3002&nbsp;\\u60a8\\u5728\\u540c\\u610f\\u672c\\u5e94\\u7528\\u670d\\u52a1\\u4f7f\\u7528\\u534f\\u8bae\\u4e4b\\u65f6\\uff0c\\u5373\\u89c6\\u4e3a\\u60a8\\u5df2\\u7ecf\\u540c\\u610f\\u672c\\u9690\\u79c1\\u6743\\u653f\\u7b56\\u5168\\u90e8\\u5185\\u5bb9\\u3002<\\/p><p><b>1.&nbsp;<\\/b>\\u9002\\u7528\\u8303\\u56f4<\\/p><p>(a)&nbsp;\\u5728\\u60a8\\u6ce8\\u518c\\u672c\\u5e94\\u7528app\\u5e10\\u53f7\\u65f6\\uff0c\\u60a8\\u6839\\u636eapp\\u8981\\u6c42\\u63d0\\u4f9b\\u7684\\u4e2a\\u4eba\\u6ce8\\u518c\\u4fe1\\u606f\\uff1b<\\/p><p>(b)&nbsp;\\u5728\\u60a8\\u4f7f\\u7528\\u672c\\u5e94\\u7528\\u7f51\\u7edc\\u670d\\u52a1\\uff0c\\u6216\\u8bbf\\u95ee\\u672c\\u5e94\\u7528\\u5e73\\u53f0\\u7f51\\u9875\\u65f6\\uff0c\\u672c\\u5e94\\u7528\\u81ea\\u52a8\\u63a5\\u6536\\u5e76\\u8bb0\\u5f55\\u7684\\u60a8\\u7684\\u6d4f\\u89c8\\u5668\\u548c\\u8ba1\\u7b97\\u673a\\u4e0a\\u7684\\u4fe1\\u606f\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u60a8\\u7684IP\\u5730\\u5740\\u3001\\u6d4f\\u89c8\\u5668\\u7684\\u7c7b\\u578b\\u3001\\u4f7f\\u7528\\u7684\\u8bed\\u8a00\\u3001\\u8bbf\\u95ee\\u65e5\\u671f\\u548c\\u65f6\\u95f4\\u3001\\u8f6f\\u786c\\u4ef6\\u7279\\u5f81\\u4fe1\\u606f\\u53ca\\u60a8\\u9700\\u6c42\\u7684\\u7f51\\u9875\\u8bb0\\u5f55\\u7b49\\u6570\\u636e\\uff1b<\\/p><p>(c)&nbsp;\\u672c\\u5e94\\u7528\\u901a\\u8fc7\\u5408\\u6cd5\\u9014\\u5f84\\u4ece\\u5546\\u4e1a\\u4f19\\u4f34\\u5904\\u53d6\\u5f97\\u7684\\u7528\\u6237\\u4e2a\\u4eba\\u6570\\u636e\\u3002<\\/p><p>(d)\\u672c\\u5e94\\u7528\\u4e25\\u7981\\u7528\\u6237\\u53d1\\u5e03\\u4e0d\\u826f\\u4fe1\\u606f\\uff0c\\u5982\\u88f8\\u9732\\u3001\\u8272\\u60c5\\u548c\\u4eb5\\u6e0e\\u5185\\u5bb9\\uff0c\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u6211\\u4eec\\u4f1a\\u8fdb\\u884c\\u5ba1\\u6838\\uff0c\\u4e00\\u7ecf\\u53d1\\u73b0\\u4e0d\\u826f\\u4fe1\\u606f\\uff0c\\u4f1a\\u7981\\u7528\\u8be5\\u7528\\u6237\\u7684\\u6240\\u6709\\u6743\\u9650\\uff0c\\u4e88\\u4ee5\\u5c01\\u53f7\\u5904\\u7406\\u3002<\\/p><p><b>2.&nbsp;<\\/b>\\u4fe1\\u606f\\u4f7f\\u7528<\\/p><p>(a)\\u672c\\u5e94\\u7528\\u4e0d\\u4f1a\\u5411\\u4efb\\u4f55\\u65e0\\u5173\\u7b2c\\u4e09\\u65b9\\u63d0\\u4f9b\\u3001\\u51fa\\u552e\\u3001\\u51fa\\u79df\\u3001\\u5206\\u4eab\\u6216\\u4ea4\\u6613\\u60a8\\u7684\\u4e2a\\u4eba\\u767b\\u5f55\\u4fe1\\u606f\\u3002\\u5982\\u679c\\u6211\\u4eec\\u5b58\\u50a8\\u53d1\\u751f\\u7ef4\\u4fee\\u6216\\u5347\\u7ea7\\uff0c\\u6211\\u4eec\\u4f1a\\u4e8b\\u5148\\u53d1\\u51fa\\u63a8\\u9001\\u6d88\\u606f\\u6765\\u901a\\u77e5\\u60a8\\uff0c\\u8bf7\\u60a8\\u63d0\\u524d\\u5141\\u8bb8\\u672c\\u5e94\\u7528\\u6d88\\u606f\\u901a\\u77e5\\u3002<\\/p><p>(b)&nbsp;\\u672c\\u5e94\\u7528\\u4ea6\\u4e0d\\u5141\\u8bb8\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u4ee5\\u4efb\\u4f55\\u624b\\u6bb5\\u6536\\u96c6\\u3001\\u7f16\\u8f91\\u3001\\u51fa\\u552e\\u6216\\u8005\\u65e0\\u507f\\u4f20\\u64ad\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u3002\\u4efb\\u4f55\\u672c\\u5e94\\u7528\\u5e73\\u53f0\\u7528\\u6237\\u5982\\u4ece\\u4e8b\\u4e0a\\u8ff0\\u6d3b\\u52a8\\uff0c\\u4e00\\u7ecf\\u53d1\\u73b0\\uff0c\\u672c\\u5e94\\u7528\\u6709\\u6743\\u7acb\\u5373\\u7ec8\\u6b62\\u4e0e\\u8be5\\u7528\\u6237\\u7684\\u670d\\u52a1\\u534f\\u8bae\\u3002<\\/p><p>(c)&nbsp;\\u4e3a\\u670d\\u52a1\\u7528\\u6237\\u7684\\u76ee\\u7684\\uff0c\\u672c\\u5e94\\u7528\\u53ef\\u80fd\\u901a\\u8fc7\\u4f7f\\u7528\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u5411\\u60a8\\u63d0\\u4f9b\\u60a8\\u611f\\u5174\\u8da3\\u7684\\u4fe1\\u606f\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u5411\\u60a8\\u53d1\\u51fa\\u4ea7\\u54c1\\u548c\\u670d\\u52a1\\u4fe1\\u606f\\uff0c\\u6216\\u8005\\u4e0e\\u672c\\u5e94\\u7528\\u5408\\u4f5c\\u4f19\\u4f34\\u5171\\u4eab\\u4fe1\\u606f\\u4ee5\\u4fbf\\u4ed6\\u4eec\\u5411\\u60a8\\u53d1\\u9001\\u6709\\u5173\\u5176\\u4ea7\\u54c1\\u548c\\u670d\\u52a1\\u7684\\u4fe1\\u606f\\uff08\\u540e\\u8005\\u9700\\u8981\\u60a8\\u7684\\u4e8b\\u5148\\u540c\\u610f\\uff09\\u3002<\\/p><p><b>3.&nbsp;<\\/b>\\u4fe1\\u606f\\u62ab\\u9732<\\/p><p>\\u5728\\u5982\\u4e0b\\u60c5\\u51b5\\u4e0b\\uff0c\\u672c\\u5e94\\u7528\\u5c06\\u4f9d\\u636e\\u60a8\\u7684\\u4e2a\\u4eba\\u610f\\u613f\\u6216\\u6cd5\\u5f8b\\u7684\\u89c4\\u5b9a\\u5168\\u90e8\\u6216\\u90e8\\u5206\\u7684\\u62ab\\u9732\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff1a<\\/p><p>(a)&nbsp;\\u672a\\u7ecf\\u60a8\\u4e8b\\u5148\\u540c\\u610f\\uff0c\\u6211\\u4eec\\u4e0d\\u4f1a\\u5411\\u7b2c\\u4e09\\u65b9\\u62ab\\u9732\\uff1b<\\/p><p>(b)\\u4e3a\\u63d0\\u4f9b\\u60a8\\u6240\\u8981\\u6c42\\u7684\\u4ea7\\u54c1\\u548c\\u670d\\u52a1\\uff0c\\u800c\\u5fc5\\u987b\\u548c\\u7b2c\\u4e09\\u65b9\\u5206\\u4eab\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff1b<\\/p><p>(c)&nbsp;\\u6839\\u636e\\u6cd5\\u5f8b\\u7684\\u6709\\u5173\\u89c4\\u5b9a\\uff0c\\u6216\\u8005\\u884c\\u653f\\u6216\\u53f8\\u6cd5\\u673a\\u6784\\u7684\\u8981\\u6c42\\uff0c\\u5411\\u7b2c\\u4e09\\u65b9\\u6216\\u8005\\u884c\\u653f\\u3001\\u53f8\\u6cd5\\u673a\\u6784\\u62ab\\u9732\\uff1b<\\/p><p>(d)&nbsp;\\u5982\\u60a8\\u51fa\\u73b0\\u8fdd\\u53cd\\u4e2d\\u56fd\\u6709\\u5173\\u6cd5\\u5f8b\\u3001\\u6cd5\\u89c4\\u6216\\u8005\\u672c\\u5e94\\u7528\\u670d\\u52a1\\u534f\\u8bae\\u6216\\u76f8\\u5173\\u89c4\\u5219\\u7684\\u60c5\\u51b5\\uff0c\\u9700\\u8981\\u5411\\u7b2c\\u4e09\\u65b9\\u62ab\\u9732\\uff1b<\\/p><p>(e)&nbsp;\\u5982\\u60a8\\u662f\\u9002\\u683c\\u7684\\u77e5\\u8bc6\\u4ea7\\u6743\\u6295\\u8bc9\\u4eba\\u5e76\\u5df2\\u63d0\\u8d77\\u6295\\u8bc9\\uff0c\\u5e94\\u88ab\\u6295\\u8bc9\\u4eba\\u8981\\u6c42\\uff0c\\u5411\\u88ab\\u6295\\u8bc9\\u4eba\\u62ab\\u9732\\uff0c\\u4ee5\\u4fbf\\u53cc\\u65b9\\u5904\\u7406\\u53ef\\u80fd\\u7684\\u6743\\u5229\\u7ea0\\u7eb7\\uff1b<\\/p><p><b>4.&nbsp;<\\/b>\\u4fe1\\u606f\\u5b58\\u50a8\\u548c\\u4ea4\\u6362<\\/p><p>\\u672c\\u5e94\\u7528\\u6536\\u96c6\\u7684\\u6709\\u5173\\u60a8\\u7684\\u4fe1\\u606f\\u548c\\u8d44\\u6599\\u5c06\\u4fdd\\u5b58\\u5728\\u672c\\u5e94\\u7528\\u53ca\\uff08\\u6216\\uff09\\u5176\\u5173\\u8054\\u516c\\u53f8\\u7684\\u670d\\u52a1\\u5668\\u4e0a\\uff0c\\u8fd9\\u4e9b\\u4fe1\\u606f\\u548c\\u8d44\\u6599\\u53ef\\u80fd\\u4f20\\u9001\\u81f3\\u60a8\\u6240\\u5728\\u56fd\\u5bb6\\u3001\\u5730\\u533a\\u6216\\u672c\\u5e94\\u7528\\u6536\\u96c6\\u4fe1\\u606f\\u548c\\u8d44\\u6599\\u6240\\u5728\\u5730\\u7684\\u5883\\u5916\\u5e76\\u5728\\u5883\\u5916\\u88ab\\u8bbf\\u95ee\\u3001\\u5b58\\u50a8\\u548c\\u5c55\\u793a\\u3002<\\/p><p><b>5. Cookie<\\/b>\\u7684\\u4f7f\\u7528<\\/p><p>(a)&nbsp;\\u5728\\u60a8\\u672a\\u62d2\\u7edd\\u63a5\\u53d7cookies\\u7684\\u60c5\\u51b5\\u4e0b\\uff0c\\u672c\\u5e94\\u7528\\u4f1a\\u5728\\u60a8\\u7684\\u8ba1\\u7b97\\u673a\\u4e0a\\u8bbe\\u5b9a\\u6216\\u53d6\\u7528cookies&nbsp;\\uff0c\\u4ee5\\u4fbf\\u60a8\\u80fd\\u767b\\u5f55\\u6216\\u4f7f\\u7528\\u4f9d\\u8d56\\u4e8ecookies\\u7684\\u672c\\u5e94\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u6216\\u529f\\u80fd\\u3002\\u672c\\u5e94\\u7528\\u4f7f\\u7528cookies\\u53ef\\u4e3a\\u60a8\\u63d0\\u4f9b\\u66f4\\u52a0\\u5468\\u5230\\u7684\\u4e2a\\u6027\\u5316\\u670d\\u52a1\\uff0c\\u5305\\u62ec\\u63a8\\u5e7f\\u670d\\u52a1\\u3002<\\/p><p>(b)&nbsp;\\u60a8\\u6709\\u6743\\u9009\\u62e9\\u63a5\\u53d7\\u6216\\u62d2\\u7edd\\u63a5\\u53d7cookies\\u3002\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u4fee\\u6539\\u6d4f\\u89c8\\u5668\\u8bbe\\u7f6e\\u7684\\u65b9\\u5f0f\\u62d2\\u7edd\\u63a5\\u53d7cookies\\u3002\\u4f46\\u5982\\u679c\\u60a8\\u9009\\u62e9\\u62d2\\u7edd\\u63a5\\u53d7cookies\\uff0c\\u5219\\u60a8\\u53ef\\u80fd\\u65e0\\u6cd5\\u767b\\u5f55\\u6216\\u4f7f\\u7528\\u4f9d\\u8d56\\u4e8ecookies\\u7684\\u672c\\u5e94\\u7528\\u7f51\\u7edc\\u670d\\u52a1\\u6216\\u529f\\u80fd\\u3002<\\/p><p>(c)&nbsp;\\u901a\\u8fc7\\u672c\\u5e94\\u7528\\u6240\\u8bbecookies\\u6240\\u53d6\\u5f97\\u7684\\u6709\\u5173\\u4fe1\\u606f\\uff0c\\u5c06\\u9002\\u7528\\u672c\\u653f\\u7b56\\u3002<\\/p><p><b>6.<\\/b>\\u672c\\u9690\\u79c1\\u653f\\u7b56\\u7684\\u66f4\\u6539<\\/p><p>(a)\\u5982\\u679c\\u51b3\\u5b9a\\u66f4\\u6539\\u9690\\u79c1\\u653f\\u7b56\\uff0c\\u6211\\u4eec\\u4f1a\\u5728\\u672c\\u653f\\u7b56\\u4e2d\\u3001\\u672c\\u516c\\u53f8\\u7f51\\u7ad9\\u4e2d\\u4ee5\\u53ca\\u6211\\u4eec\\u8ba4\\u4e3a\\u9002\\u5f53\\u7684\\u4f4d\\u7f6e\\u53d1\\u5e03\\u8fd9\\u4e9b\\u66f4\\u6539\\uff0c\\u4ee5\\u4fbf\\u60a8\\u4e86\\u89e3\\u6211\\u4eec\\u5982\\u4f55\\u6536\\u96c6\\u3001\\u4f7f\\u7528\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u54ea\\u4e9b\\u4eba\\u53ef\\u4ee5\\u8bbf\\u95ee\\u8fd9\\u4e9b\\u4fe1\\u606f\\uff0c\\u4ee5\\u53ca\\u5728\\u4ec0\\u4e48\\u60c5\\u51b5\\u4e0b\\u6211\\u4eec\\u4f1a\\u900f\\u9732\\u8fd9\\u4e9b\\u4fe1\\u606f\\u3002<\\/p><p>(b)\\u672c\\u516c\\u53f8\\u4fdd\\u7559\\u968f\\u65f6\\u4fee\\u6539\\u672c\\u653f\\u7b56\\u7684\\u6743\\u5229\\uff0c\\u56e0\\u6b64\\u8bf7\\u7ecf\\u5e38\\u67e5\\u770b\\u3002\\u5982\\u5bf9\\u672c\\u653f\\u7b56\\u4f5c\\u51fa\\u91cd\\u5927\\u66f4\\u6539\\uff0c\\u672c\\u516c\\u53f8\\u4f1a\\u901a\\u8fc7\\u7f51\\u7ad9\\u901a\\u77e5\\u7684\\u5f62\\u5f0f\\u544a\\u77e5\\u3002<\\/p><p>\\u65b9\\u62ab\\u9732\\u81ea\\u5df1\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u5982\\u8054\\u7edc\\u65b9\\u5f0f\\u6216\\u8005\\u90ae\\u653f\\u5730\\u5740\\u3002\\u8bf7\\u60a8\\u59a5\\u5584\\u4fdd\\u62a4\\u81ea\\u5df1\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u4ec5\\u5728\\u5fc5\\u8981\\u7684\\u60c5\\u5f62\\u4e0b\\u5411\\u4ed6\\u4eba\\u63d0\\u4f9b\\u3002\\u5982\\u60a8\\u53d1\\u73b0\\u81ea\\u5df1\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u6cc4\\u5bc6\\uff0c\\u5c24\\u5176\\u662f\\u672c\\u5e94\\u7528\\u7528\\u6237\\u540d\\u53ca\\u5bc6\\u7801\\u53d1\\u751f\\u6cc4\\u9732\\uff0c\\u8bf7\\u60a8\\u7acb\\u5373\\u8054\\u7edc\\u672c\\u5e94\\u7528\\u5ba2\\u670d\\uff0c\\u4ee5\\u4fbf\\u672c\\u5e94\\u7528\\u91c7\\u53d6\\u76f8\\u5e94\\u63aa\\u65bd\\u3002<\\/p><p>\\u611f\\u8c22\\u60a8\\u82b1\\u65f6\\u95f4\\u4e86\\u89e3\\u6211\\u4eec\\u7684\\u9690\\u79c1\\u653f\\u7b56\\uff01\\u6211\\u4eec\\u5c06\\u5c3d\\u5168\\u529b\\u4fdd\\u62a4\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u548c\\u5408\\u6cd5\\u6743\\u76ca\\uff0c\\u518d\\u6b21\\u611f\\u8c22\\u60a8\\u7684\\u4fe1\\u4efb\\uff01<\\/p><p><br>&nbsp;<\\/p>\"}', 1607936978, 1610718445);
INSERT INTO `common_setting` VALUES (7, 'app', '{\"set_key\":\"app\",\"version\":\"1.0.1\",\"content\":\"1\\u3001\\u529f\\u80fd\\u65b0\\u589e\\n2\\u3001bug\\u4fee\\u590d\\n3\\u3001\\u6027\\u80fd\\u63d0\\u5347\",\"file\":\"\",\"bg\":\"https:\\/\\/oss.bhy521qm.com\\/common\\/f003e443a514c19d6fb2762fa2d60d81.png\",\"fenfa_url\":\"https:\\/\\/qq.com\",\"android_url\":\"https:\\/\\/dev.mi.com\\/console\\/\",\"ios_url\":\"https:\\/\\/baidu.com\"}', 1607948086, 1612504553);
INSERT INTO `common_setting` VALUES (8, 'contact', '{\"set_key\":\"contact\",\"qrcode\":\"\\/storage\\/589737cad2f20383c78c3a3af32eedd8.png\",\"file\":\"\",\"phone\":\"1111111111111\",\"qq\":\"222222222222\",\"worktime\":\"\\u4e0a\\u53489:00-12:00 \\u4e0b\\u534814:00-18:00\"}', 1607948784, 1610717812);
INSERT INTO `common_setting` VALUES (9, 'sms', '{\"set_key\":\"sms\",\"sign_name\":\"\\u804a\\u5929\",\"code_tpl\":\"10002\",\"notice_tpl\":\"1003\"}', 1607949453, 1612580086);
INSERT INTO `common_setting` VALUES (10, 'payment', '{\"set_key\":\"payment\",\"faka_vip_url\":\"https:\\/\\/www.fakaqu.com\\/paylinks\\/G4GKVCXOQG7IV4PP67\",\"faka_svip_url\":\"https:\\/\\/www.fakaqu.com\\/paylinks\\/65UCXJB1ISQGS11D67\",\"faka_intro\":\"<h1><font color=\\\"#4d80bf\\\"><span style=\\\"background-color: rgb(139, 170, 74);\\\"><b id=\\\"oiz6q\\\" style=\\\"\\\">\\u70b9\\u51fb\\u94fe\\u63a5\\u8d2d\\u4e70\\u53d1\\u5361\\uff0c\\u83b7\\u53d6\\u7684\\u5361\\u5bc6 \\u5230\\u4f1a\\u5458\\u4e2d\\u5fc3\\u5347\\u7ea7<\\/b><\\/span><span style=\\\"background-color: rgb(194, 79, 74);\\\"><\\/span><\\/font><\\/h1><div><img src=\\\"https:\\/\\/oss.bhy521qm.com\\/common\\/661f31a8f1a6b12d2cdffc0f2de573fc.png\\\" style=\\\"max-width:100%;\\\"><font color=\\\"#4d80bf\\\"><span style=\\\"background-color: rgb(139, 170, 74);\\\"><b style=\\\"\\\"><br><\\/b><\\/span><\\/font><\\/div>\",\"notify_url\":\"\\/pay\\/notify\",\"alipay_app_id\":\"2021002115698315\",\"alipay_private_key\":\"MIIEowIBAAKCAQEAiH7Sxb2jE127vPJ9nI\\/8B5jlGv2n67tLZ2DxCx1kpfrMWvb6gULHCzmQ3NLezboUS+cSl1UoZL14vbWwBglJKVX2RqFVxOsALpoQ\\/X3aQBMk53zZbP\\/e0Pce9PJXkJMXJfD+PkTvTioG0ejjnU0N0n8AEccg\\/ULcvTK7tDiJTFtcbCqqkKq81OmMpXGT2vv3OTWn\",\"ali_public_key\":\"MIIBIjANB\",\"wechat_appid\":\"66\",\"wechat_app_id\":\"\",\"wechat_miniapp_id\":\"99\",\"wechat_mchid\":\"\",\"wechat_key\":\"\"}', 1607949483, 1614262320);
INSERT INTO `common_setting` VALUES (11, 'distribution', '{\"set_key\":\"distribution\",\"upgrade_agent_fee\":\"399\",\"upgrade_agent_getcoupon_no\":\"100\",\"upgrade_agent_getcoupon_goodstitle\":\"\\u7a7a\\u8c03\\u683c\\u529b\",\"upgrade_agent_getcoupon_goodsid\":\"6\",\"agent_active_agent\":\"8\",\"upgrade_operator_need_agent\":\"2\",\"upgrade_operator_need_vip\":\"2\",\"operator_getvip_toagent\":\"20\",\"operator_indirect_toagent\":\"2\",\"vip_des\":\"<p>1.\\u7f34\\u7eb3\\u4f1a\\u5458\\u8d39150\\uff0c\\u9009\\u62e9\\u8981\\u8d60\\u9001\\u7684\\u5546\\u54c1,\\u5373\\u53ef\\u6210\\u4e3a\\u4f1a\\u5458<\\/p><p>&nbsp;2.\\u9009\\u62e9\\u8d60\\u9001\\u5546\\u54c1\\uff0c\\u652f\\u4ed8\\u90ae\\u8d39\\u5373\\u53ef<\\/p>\",\"agent_desc\":\"<p>1.\\u8d60\\u9001100\\u5f20\\u4f18\\u60e0\\u5361\\u53ef\\u5206\\u4eab&nbsp;<\\/p><p>2.\\u4f18\\u60e0\\u5361\\u5206\\u4eab\\u51fa\\u53bb\\u6fc0\\u6d3b\\u4f1a\\u5458\\u540e\\u8fd4\\u73b020\\u5143\\u6536\\u76ca&nbsp;<\\/p><p>3.\\u624b\\u4e0b\\u4f1a\\u5458\\u664b\\u7ea7\\u4e3a\\u4ee3\\u7406\\u5546\\u8fd4\\u73b099\\u5143\\u6536\\u76ca&nbsp;<\\/p><p>4.\\u624b\\u4e0b\\u7d2f\\u8ba1\\u4ee3\\u7406\\u554660\\u4e2a+\\u6fc0\\u6d3b\\u4f1a\\u54581000\\u5f20\\u81ea\\u52a8\\u5347\\u7ea7\\u4e3a \\u4ee3\\u7406\\u5546<\\/p><p>&nbsp;5.\\u7535\\u5b50\\u4f18\\u60e0\\u5361\\u6bcf\\u5f20\\u96f6\\u552e20\\u5143 \\uff08\\u7ecf\\u9500\\u5546\\u4e8c\\u6b21\\u8d2d\\u5361\\u6bcf\\u5f203\\u5143\\uff1b\\u8fd0\\u8425\\u5546\\u6bcf\\u5f202\\u5143\\uff09<\\/p>\"}', 1608930537, 0);
INSERT INTO `common_setting` VALUES (12, 'privilege', '{\"set_key\":\"privilege\",\"vip_price\":\"100\",\"svip_price\":\"200\",\"sign_score\":\"10\",\"publish_article_need_realname\":\"on\",\"publish_article_member\":{\"vip\":\"on\",\"svip\":\"on\"},\"publish_video_need_realname\":\"on\",\"publish_video_member\":{\"vip\":\"on\"}}', 1610721466, 1614601331);
INSERT INTO `common_setting` VALUES (13, 'chatting', '{\"set_key\":\"chatting\",\"visitor_chat_num\":\"5\",\"sys_filter\":{\"mobile\":\"on\",\"number\":\"on\",\"link\":\"on\"},\"chat_view_profile\":{\"vip\":\"on\",\"svip\":\"on\"},\"custom_filter\":\"\\u7f8e\\u5973|\\u53fc|\\u5728\\u5417\"}', 1610721889, 1614605009);

-- ----------------------------
-- Table structure for common_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `common_uploadfile`;
CREATE TABLE `common_uploadfile`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `storage` enum('local','qiniu','aliyun','tencent','baidu','huawei','amazon') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'local' COMMENT '存储位置',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `size` int UNSIGNED NULL DEFAULT 0 COMMENT '文件大小【字节】',
  `types` enum('image','video','audio','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'image' COMMENT '文件分类',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储文件路径名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '全路径weburl',
  `deleted_at` int UNSIGNED NULL DEFAULT 0 COMMENT '删除时间',
  `created_at` int UNSIGNED NULL DEFAULT 0,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `storage`(`storage`) USING BTREE,
  INDEX `type`(`types`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 277 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '上传文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of common_uploadfile
-- ----------------------------
INSERT INTO `common_uploadfile` VALUES (1, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/9f5c86f9b0af781522a55d3ae03971a4.jpg', NULL, 0, 0, 0);
INSERT INTO `common_uploadfile` VALUES (2, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/8aa8b96e20724ad315ffeb4eaf1f8241.jpg', NULL, 0, 0, 0);
INSERT INTO `common_uploadfile` VALUES (3, 'local', '1528817466_5670.jpg', 209660, 'image', '/storage/638d1a0ebe4372394cb15153c997646f.jpg', NULL, 0, 0, 0);
INSERT INTO `common_uploadfile` VALUES (4, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/52c6ab5fde6278167f777ffc7eec77c4.png', NULL, 0, 0, 0);
INSERT INTO `common_uploadfile` VALUES (5, 'local', 'u=1702635598,903841984&fm=26&gp=0.jpg', 17253, 'image', '/storage/fb9578c84f30a97fd464213f4d796993.jpg', NULL, 0, 1607947842, 0);
INSERT INTO `common_uploadfile` VALUES (6, 'local', '__UNI__5750FF3.wgt', 1849529, 'file', '/storage/b8e1dc2f76b795d6ede42525e3513ede.wgt', NULL, 0, 1607947996, 0);
INSERT INTO `common_uploadfile` VALUES (7, 'local', '__UNI__5750FF3.wgt', 1849529, 'file', '/storage/5c939a6910f32264879e3b801835a920.wgt', NULL, 0, 1607948341, 0);
INSERT INTO `common_uploadfile` VALUES (8, 'local', '__UNI__5750FF3.wgt', 1849529, 'file', '/storage/1a67489b29c54eddc429ff945a2749bd.wgt', NULL, 0, 1607948395, 0);
INSERT INTO `common_uploadfile` VALUES (9, 'local', '__UNI__5750FF3.wgt', 1849529, 'file', '/storage/1c80030de6613404ca260f77a7f6d182.wgt', NULL, 0, 1607948423, 0);
INSERT INTO `common_uploadfile` VALUES (10, 'local', 'u=1631915055,2225974863&fm=26&gp=0.png', 45840, 'image', '/storage/4cb26688d6e247e77dfbb8c368be019c.png', NULL, 0, 1607948782, 0);
INSERT INTO `common_uploadfile` VALUES (11, 'local', '微信截图_20201107110039.png', 129137, 'image', '/storage/0a34ddd5fe60e7a4819a49f6f5f3ccd4.png', NULL, 0, 1607948801, 0);
INSERT INTO `common_uploadfile` VALUES (12, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/b8009312f81e57138be4f0fc5e873034.jpg', NULL, 0, 1607948856, 0);
INSERT INTO `common_uploadfile` VALUES (13, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/e501c16d5dca4961a8bb7d77500be5e2.jpg', NULL, 0, 1607949028, 0);
INSERT INTO `common_uploadfile` VALUES (14, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/83c0386c8a8de33594de25180e6cb03d.gif', NULL, 0, 1607949059, 0);
INSERT INTO `common_uploadfile` VALUES (15, 'local', 'u=1194864275,2577414869&fm=26&gp=0.jpg', 20292, 'image', '/storage/99234e32f3fe440181bb1bf1ab76c683.jpg', NULL, 0, 1607949096, 0);
INSERT INTO `common_uploadfile` VALUES (16, 'local', '图片2.png', 6021, 'image', '/storage/13d70d0289571ab364d376ff468222ad.png', NULL, 0, 1607981050, 0);
INSERT INTO `common_uploadfile` VALUES (17, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/8172ffc3d998bff7647bd2fb05c464af.jpg', NULL, 0, 1607983538, 0);
INSERT INTO `common_uploadfile` VALUES (18, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/2f30abd9976c7e50f9878a755ae7acc7.jpg', NULL, 0, 1607983538, 0);
INSERT INTO `common_uploadfile` VALUES (19, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/fe69b626cc4190f4bc51dcbeb2147b56.jpg', NULL, 0, 1607983830, 0);
INSERT INTO `common_uploadfile` VALUES (20, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/3f5f1b6bb7b643bd4c74ced3ceb33a76.jpg', NULL, 0, 1607983830, 0);
INSERT INTO `common_uploadfile` VALUES (21, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/3255fe9cb366f8ca9d78e170123c18d3.jpg', NULL, 0, 1607983849, 0);
INSERT INTO `common_uploadfile` VALUES (22, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/6f57c33d3eb842c2941c2f0310b0daa1.gif', NULL, 0, 1607983849, 0);
INSERT INTO `common_uploadfile` VALUES (23, 'local', '20181218092471_OhNJXA.gif', 51986, 'image', '/storage/3e74bdc0fa15786706dc62515cd9d619.gif', NULL, 0, 1607983849, 0);
INSERT INTO `common_uploadfile` VALUES (24, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/83eea08ad9e4a86e6ae159538861183d.jpg', NULL, 0, 1607985588, 0);
INSERT INTO `common_uploadfile` VALUES (25, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/070f2f871a33f5bfc359f8b55a12a57e.jpg', NULL, 0, 1607985588, 0);
INSERT INTO `common_uploadfile` VALUES (26, 'local', '微信截图_20201107110039.png', 129137, 'image', '/storage/a162f117632d2b6c1252a1d8ef2820c6.png', NULL, 0, 1607985588, 0);
INSERT INTO `common_uploadfile` VALUES (27, 'local', '微信截图_20201107110039.png', 129137, 'image', '/storage/70cb998d803d02ccfe8c51adb27548d1.png', NULL, 0, 1607985813, 0);
INSERT INTO `common_uploadfile` VALUES (28, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/16528e9db603e2b810706b9685f19c3a.jpg', NULL, 0, 1607985813, 0);
INSERT INTO `common_uploadfile` VALUES (29, 'local', '微信截图_20201009074823.png', 372608, 'image', '/storage/20ce992a2bff034653fdc99b020e966d.png', NULL, 0, 1607985813, 0);
INSERT INTO `common_uploadfile` VALUES (30, 'local', '微信截图_20201123121454.png', 44908, 'image', '/storage/0e3895534d7f6aa3998e4b6fead9f039.png', NULL, 0, 1607985813, 0);
INSERT INTO `common_uploadfile` VALUES (31, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/506218f70fbf4f4390d8d2e54c6d01cf.jpg', NULL, 0, 1607985884, 0);
INSERT INTO `common_uploadfile` VALUES (32, 'local', '20181218092471_OhNJXA.gif', 51986, 'image', '/storage/5e9106870b1e9743cb1a9591e09dca09.gif', NULL, 0, 1607985884, 0);
INSERT INTO `common_uploadfile` VALUES (33, 'local', '1528817466_5670.jpg', 209660, 'image', '/storage/77a17f42f52aa879dda1698a18fc325a.jpg', NULL, 0, 1607985949, 0);
INSERT INTO `common_uploadfile` VALUES (34, 'local', '20160118098075_zbWLFv.gif', 797593, 'image', '/storage/e8b17132768d1590b0f4a633814807e0.gif', NULL, 0, 1607985949, 0);
INSERT INTO `common_uploadfile` VALUES (35, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/782b463a16fe5e0f151299a157e63bb9.jpg', NULL, 0, 1607986052, 0);
INSERT INTO `common_uploadfile` VALUES (36, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/2db66b8a49f3c4ee783f894039ce1c6b.jpg', NULL, 0, 1607986052, 0);
INSERT INTO `common_uploadfile` VALUES (37, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/b3e4252bd60bbcb4345f6b969d78a02a.gif', NULL, 0, 1607986057, 0);
INSERT INTO `common_uploadfile` VALUES (38, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/9ef11a96fd1bdc76680199571e4d372d.jpg', NULL, 0, 1607986159, 0);
INSERT INTO `common_uploadfile` VALUES (39, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/20aeded00b559f8ca285e9fb3c216195.jpg', NULL, 0, 1607986159, 0);
INSERT INTO `common_uploadfile` VALUES (40, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/ec04636e8f9e154d5da81117b6e59dc6.gif', NULL, 0, 1607986191, 0);
INSERT INTO `common_uploadfile` VALUES (41, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/35588c291f5638f07e29a56004d983c4.gif', NULL, 0, 1607986191, 0);
INSERT INTO `common_uploadfile` VALUES (42, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/d585e818c3cc088be010bc0c7b28ba2c.jpg', NULL, 0, 1607987202, 0);
INSERT INTO `common_uploadfile` VALUES (43, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/93e2ff651171eab8e17a41d411981fe7.jpg', NULL, 0, 1607987202, 0);
INSERT INTO `common_uploadfile` VALUES (44, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/81f174715cfcb7ee8c240ce336d2ec13.jpg', NULL, 0, 1607987228, 0);
INSERT INTO `common_uploadfile` VALUES (45, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/1ad49c8d7486d852e136c0a14bf00171.gif', NULL, 0, 1607987283, 0);
INSERT INTO `common_uploadfile` VALUES (46, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/3e4e9eb3514c6e2249aa4a84b6bfd4cd.jpg', NULL, 0, 1607987398, 0);
INSERT INTO `common_uploadfile` VALUES (47, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/1560d49436d26f373f4deb2d177a6d87.jpg', NULL, 0, 1607987398, 0);
INSERT INTO `common_uploadfile` VALUES (48, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/5b2209e656fe20572e4049bded40ed77.png', NULL, 0, 1607987548, 0);
INSERT INTO `common_uploadfile` VALUES (49, 'local', '微信截图_20201107110039.png', 129137, 'image', '/storage/8a2db3e744301b2461c1d07535ff6b2b.png', NULL, 0, 1607987548, 0);
INSERT INTO `common_uploadfile` VALUES (50, 'local', '微信截图_20201123121454.png', 44908, 'image', '/storage/3afc3c7f958f40910aabcfec915c79ca.png', NULL, 0, 1607987548, 0);
INSERT INTO `common_uploadfile` VALUES (51, 'local', '微信截图_20201009074823.png', 372608, 'image', '/storage/6455a41aa3a3a6878796c39d938c2006.png', NULL, 0, 1607987548, 0);
INSERT INTO `common_uploadfile` VALUES (52, 'local', 'u=3980478273,3337613300&fm=26&gp=0.jpg', 23489, 'image', '/storage/a78c944ddccd57d4dfe4248379fdfa1e.jpg', NULL, 0, 1607987559, 0);
INSERT INTO `common_uploadfile` VALUES (53, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/7c4f37789f7175719c1762abd734972d.jpg', NULL, 0, 1607987645, 0);
INSERT INTO `common_uploadfile` VALUES (54, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/a159261d8801bed309ed4c4a9108170d.png', NULL, 0, 1607987681, 0);
INSERT INTO `common_uploadfile` VALUES (55, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/0ff940ad5e1aeb1afa106a90994d78ff.jpg', NULL, 0, 1607987688, 0);
INSERT INTO `common_uploadfile` VALUES (56, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/77c4bc51d470666ed797ecb23acb894c.gif', NULL, 0, 1607987688, 0);
INSERT INTO `common_uploadfile` VALUES (57, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/4a27e35cec910dcec70799d8fcdfbd09.jpg', NULL, 0, 1607987688, 0);
INSERT INTO `common_uploadfile` VALUES (58, 'local', '图片5.png', 9863, 'image', '/storage/c78ac1c71a2174923b426c7e35d3d6ea.png', NULL, 0, 1608003831, 0);
INSERT INTO `common_uploadfile` VALUES (59, 'local', '微信图片_20201116110818.png', 7725, 'image', '/storage/0a1351b9fcae358d48c206b9bc4ecfad.png', NULL, 0, 1608004125, 0);
INSERT INTO `common_uploadfile` VALUES (60, 'local', '微信图片_20201116110844.png', 7210, 'image', '/storage/5bc8d31da64608b938c5eae7442a38b5.png', NULL, 0, 1608004125, 0);
INSERT INTO `common_uploadfile` VALUES (61, 'local', '微信图片_20201201223038.jpg', 27567, 'image', '/storage/c1b68a74d19c58ca6d59ba9e7c08207b.jpg', NULL, 0, 1608004125, 0);
INSERT INTO `common_uploadfile` VALUES (62, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/efff1ff451be8679cd4c6b025de6dc96.png', NULL, 0, 1608004151, 0);
INSERT INTO `common_uploadfile` VALUES (63, 'local', '微信截图_20201107110039.png', 129137, 'image', '/storage/05964bfc458e49174f8e203512e9759d.png', NULL, 0, 1608004165, 0);
INSERT INTO `common_uploadfile` VALUES (64, 'local', '图片1.png', 3951, 'image', '/storage/67cad9d4bc5c46d67bb3bcdc9507453c.png', NULL, 0, 1608086957, 0);
INSERT INTO `common_uploadfile` VALUES (65, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/17313554212531eb717a104dcb198ac3.png', NULL, 0, 1608088833, 0);
INSERT INTO `common_uploadfile` VALUES (66, 'local', '微信截图_20201123121454.png', 44908, 'image', '/storage/11a9ac7b11f15440a576888e4646e3d6.png', NULL, 0, 1608088845, 0);
INSERT INTO `common_uploadfile` VALUES (67, 'local', '图片3.png', 6965, 'image', '/storage/6b2807e32bf1be1670a229fbee9da03c.png', NULL, 0, 1608089019, 0);
INSERT INTO `common_uploadfile` VALUES (68, 'local', '微信截图_20201123121454.png', 44908, 'image', '/storage/c1cb7208513d2e4a99009468db78beda.png', NULL, 0, 1608089086, 0);
INSERT INTO `common_uploadfile` VALUES (69, 'local', '微信截图_20201123121454.png', 44908, 'image', '/storage/17a8efd32214828a1d9f56ed01d1d642.png', NULL, 0, 1608089272, 0);
INSERT INTO `common_uploadfile` VALUES (70, 'local', '微信截图_20201009074823.png', 372608, 'image', '/storage/dcd5c23cedb63764c26bdb77adb4be94.png', NULL, 0, 1608096964, 0);
INSERT INTO `common_uploadfile` VALUES (71, 'local', 'u=1702635598,903841984&fm=26&gp=0.jpg', 17253, 'image', '/storage/8875a0a87042014cc6d91d5db1bd7d59.jpg', NULL, 0, 1608098261, 0);
INSERT INTO `common_uploadfile` VALUES (72, 'local', '图片6.png', 2519, 'image', '/storage/48a5a407343efb60cbdc1a9763e0ddf3.png', NULL, 0, 1608098372, 0);
INSERT INTO `common_uploadfile` VALUES (73, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/e269ab472fed4de92dd1740f9b1dc105.jpg', NULL, 0, 1608475554, 0);
INSERT INTO `common_uploadfile` VALUES (74, 'local', '微信截图_20200717144057.png', 209543, 'image', '/storage/5d6adf2861809de6a2d1b530b8954f71.png', NULL, 0, 1608475598, 0);
INSERT INTO `common_uploadfile` VALUES (75, 'local', 'QQ图片20200727182645.jpg', 218713, 'image', '/storage/6fccc645195bc00b314bd0a631875d5a.jpg', NULL, 0, 1608476141, 0);
INSERT INTO `common_uploadfile` VALUES (76, 'local', '1080.png', 245032, 'image', '/storage/cc53f9f2b0545756f3883945f44801e7.png', NULL, 0, 1608603185, 0);
INSERT INTO `common_uploadfile` VALUES (77, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/6be62ecc0295411d62860f4ebdbcdebd.jpg', NULL, 0, 1608603232, 0);
INSERT INTO `common_uploadfile` VALUES (78, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/ce6fac0b1dbb621a6fe860306a82b463.jpg', NULL, 0, 1608603408, 0);
INSERT INTO `common_uploadfile` VALUES (79, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/821787b8697ebdbf834ed3758dd45c9e.jpg', NULL, 0, 1608603459, 0);
INSERT INTO `common_uploadfile` VALUES (80, 'local', '1608603649065_wx_camera_1608548116239.jpg', 93875, 'image', '/storage/b0d665975fb65c7147e9b8ad96ca481e.jpg', NULL, 0, 1608603648, 0);
INSERT INTO `common_uploadfile` VALUES (81, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/29ea9cf04f556099c36ba7aaf1928e88.jpg', NULL, 0, 1608729594, 0);
INSERT INTO `common_uploadfile` VALUES (82, 'local', 'u=1194864275,2577414869&fm=26&gp=0.jpg', 20292, 'image', '/storage/c6c6533eaaf18f4651211827bdcb81b5.jpg', NULL, 0, 1608730173, 0);
INSERT INTO `common_uploadfile` VALUES (83, 'local', 'u=2001382863,1289112909&fm=26&gp=0.jpg', 19083, 'image', '/storage/53b3d9b79f075c3ae3dfd88f7996042b.jpg', NULL, 0, 1608730299, 0);
INSERT INTO `common_uploadfile` VALUES (84, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/1f80fc2c86c1313396fe9e6814425be3.jpg', NULL, 0, 1608787773, 0);
INSERT INTO `common_uploadfile` VALUES (85, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/1d687f053d8e72a4e239aee13af0797e.png', NULL, 0, 1608848561, 0);
INSERT INTO `common_uploadfile` VALUES (86, 'local', '图片1.png', 3951, 'image', '/storage/d17e267465fe28a0d8d9430e609d0683.png', NULL, 0, 1608868830, 0);
INSERT INTO `common_uploadfile` VALUES (87, 'local', '微信截图_20200717144057.png', 209543, 'image', '/storage/963b6620578d84d1719714ac6f8e557a.png', NULL, 0, 1608882511, 0);
INSERT INTO `common_uploadfile` VALUES (88, 'local', 'u=2328087454,401762545&fm=26&gp=0.jpg', 42527, 'image', '/storage/d73d2f80fefba381933d8a8671f33654.jpg', NULL, 0, 1608882511, 0);
INSERT INTO `common_uploadfile` VALUES (89, 'local', '微信截图_20200717144057.png', 209543, 'image', '/storage/f4931f035d9004273eb89c4a439939c0.png', NULL, 0, 1608889007, 0);
INSERT INTO `common_uploadfile` VALUES (90, 'local', 'u=2328087454,401762545&fm=26&gp=0.jpg', 42527, 'image', '/storage/80b0a19f6321bc1a7bb2386ab28a6b9c.jpg', NULL, 0, 1608889230, 0);
INSERT INTO `common_uploadfile` VALUES (91, 'local', 'QQ图片20200727182645.jpg', 218713, 'image', '/storage/8e4e21840278719a0ae2d3e8fc096674.jpg', NULL, 0, 1608889243, 0);
INSERT INTO `common_uploadfile` VALUES (92, 'local', 'u=2001382863,1289112909&fm=26&gp=0.jpg', 19083, 'image', '/storage/a6537b9a5e0b1d22af1557836a4bb1d4.jpg', NULL, 0, 1608891898, 0);
INSERT INTO `common_uploadfile` VALUES (93, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/ee8ad37dbf14d22ca0ca13564ba9eb2e.jpg', NULL, 0, 1608929161, 0);
INSERT INTO `common_uploadfile` VALUES (94, 'local', '__UNI__E133A89.wgt', 1079594, 'file', '/storage/6e07b9bc778481cac5b15435f9d23e16.wgt', NULL, 0, 1609121355, 0);
INSERT INTO `common_uploadfile` VALUES (95, 'local', '微信截图_20201228111324.png', 203182, 'image', '/storage/a481ca183c538238ee37deb26940b064.png', NULL, 0, 1609125260, 0);
INSERT INTO `common_uploadfile` VALUES (96, 'local', '微信截图_20201228111338.png', 764465, 'image', '/storage/5dc6850a856ad1215253d820714c8bc8.png', NULL, 0, 1609125265, 0);
INSERT INTO `common_uploadfile` VALUES (97, 'local', '微信截图_20201228111354.png', 847700, 'image', '/storage/6d7f1274bc2b767ed53322e351047e4b.png', NULL, 0, 1609125265, 0);
INSERT INTO `common_uploadfile` VALUES (98, 'local', '微信截图_20201228111354.png', 847700, 'image', '/storage/68bdb18cbdcd69fb2e97b106b93f8683.png', NULL, 0, 1609125273, 0);
INSERT INTO `common_uploadfile` VALUES (99, 'local', '微信截图_20201228111541.png', 276786, 'image', '/storage/41aefde6184a8e19d767a87967840ba0.png', NULL, 0, 1609125382, 0);
INSERT INTO `common_uploadfile` VALUES (100, 'local', '微信截图_20201228111531.png', 424374, 'image', '/storage/da65f64c7fbde38fd2e15b47eb203608.png', NULL, 0, 1609125388, 0);
INSERT INTO `common_uploadfile` VALUES (101, 'local', '微信截图_20201228111531.png', 424374, 'image', '/storage/4656a22af4809b7c23c7aab92b4b630b.png', NULL, 0, 1609125397, 0);
INSERT INTO `common_uploadfile` VALUES (102, 'local', '微信截图_20201228112518.png', 243320, 'image', '/storage/acd4782aedd7c18ce4da44385ab2d0ae.png', NULL, 0, 1609125950, 0);
INSERT INTO `common_uploadfile` VALUES (103, 'local', '微信截图_20201228112507.png', 742760, 'image', '/storage/ef1ffc28386e8ccd21e821a1cceb2ce6.png', NULL, 0, 1609125964, 0);
INSERT INTO `common_uploadfile` VALUES (104, 'local', '微信截图_20201228112658.png', 855688, 'image', '/storage/900746ed2667b62e22ff253085580b71.png', NULL, 0, 1609126038, 0);
INSERT INTO `common_uploadfile` VALUES (105, 'local', '微信截图_20201228112946.png', 329089, 'image', '/storage/32c902a5d4fbe5d3632b816a1631c417.png', NULL, 0, 1609126213, 0);
INSERT INTO `common_uploadfile` VALUES (106, 'local', '微信截图_20201228113112.png', 1618627, 'image', '/storage/768a29e91069bb7dfe0e50be120f261d.png', NULL, 0, 1609126293, 0);
INSERT INTO `common_uploadfile` VALUES (107, 'local', '微信截图_20201228113120.png', 1003939, 'image', '/storage/469975be3885c376d64143ecae4dfdba.png', NULL, 0, 1609126304, 0);
INSERT INTO `common_uploadfile` VALUES (108, 'local', '微信截图_20201228113317.png', 291545, 'image', '/storage/17c27bd705d77e5232aeb45102a8c2e7.png', NULL, 0, 1609205518, 0);
INSERT INTO `common_uploadfile` VALUES (109, 'local', '微信图片_20201227180536.png', 18251, 'image', '/storage/d6d87469b786a371b44714bbdf551636.png', NULL, 0, 1609260443, 0);
INSERT INTO `common_uploadfile` VALUES (110, 'local', '微信图片_20201226111413.png', 67904, 'image', '/storage/a66765511f00f499c128d60ddb5cece8.png', NULL, 0, 1609260456, 0);
INSERT INTO `common_uploadfile` VALUES (111, 'local', '微信截图_20201009074823.png', 372608, 'image', '/storage/98d392722f7fd9b0d0111b1b6933d390.png', NULL, 0, 1609329765, 0);
INSERT INTO `common_uploadfile` VALUES (112, 'local', '微信截图_20200717144057.png', 209543, 'image', '/storage/84eebd320ef9eefad16c11dbe239eaaa.png', NULL, 0, 1609335927, 0);
INSERT INTO `common_uploadfile` VALUES (113, 'local', '微信图片_20201227180536.png', 18251, 'image', '/storage/1f555afbac9bec2c31df469e4a70486c.png', NULL, 0, 1609381692, 0);
INSERT INTO `common_uploadfile` VALUES (114, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/571ab3eb8fdba9b65de04630e0a39c8e.jpg', NULL, 0, 1610260155, 0);
INSERT INTO `common_uploadfile` VALUES (115, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/8cfb96eca6b462571771fddffd687fb0.jpg', NULL, 0, 1610260166, 0);
INSERT INTO `common_uploadfile` VALUES (116, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/18f4b9ae62db441808c24805e77e62af.jpg', NULL, 0, 1610280695, 0);
INSERT INTO `common_uploadfile` VALUES (117, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/f7d85f8e7e78076a37facf2107c5d250.gif', NULL, 0, 1610280794, 0);
INSERT INTO `common_uploadfile` VALUES (118, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/90d2196bfcc2e8c814cbd6a990d1199b.gif', NULL, 0, 1610280815, 0);
INSERT INTO `common_uploadfile` VALUES (119, 'local', 'QQ图片20200727182645.jpg', 218713, 'image', '/storage/712084d91db50c4bf716a9164ebe2d49.jpg', NULL, 0, 1610280905, 0);
INSERT INTO `common_uploadfile` VALUES (120, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/72b9b35b0d49a64a705deccf96b52243.jpg', NULL, 0, 1610280938, 0);
INSERT INTO `common_uploadfile` VALUES (121, 'local', '微信截图_20200717144057.png', 209543, 'image', '/storage/f9e44da995cdb9948d67b508d41165c8.png', NULL, 0, 1610280975, 0);
INSERT INTO `common_uploadfile` VALUES (122, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/280f12b60545e1b1bb5f0e9de5630ea0.jpg', 'https://oss.bhy521qm.com/common/280f12b60545e1b1bb5f0e9de5630ea0.jpg', 0, 1610717268, 0);
INSERT INTO `common_uploadfile` VALUES (123, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/ff4658084b38ce5e3cfa78d0be2344d3.jpg', 'https://oss.bhy521qm.com/common/ff4658084b38ce5e3cfa78d0be2344d3.jpg', 0, 1610717328, 0);
INSERT INTO `common_uploadfile` VALUES (124, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/common/39cd1c12f3299195f6c088549008ce3c.jpg', 'https://oss.bhy521qm.com/common/39cd1c12f3299195f6c088549008ce3c.jpg', 0, 1610717341, 0);
INSERT INTO `common_uploadfile` VALUES (125, 'aliyun', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/29136b08cd4dd67287f9d6e69036c550.jpg', 'https://oss.bhy521qm.com/common/29136b08cd4dd67287f9d6e69036c550.jpg', 0, 1610717767, 0);
INSERT INTO `common_uploadfile` VALUES (126, 'aliyun', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/common/0f77a109d2d68495684bfbb88497c8d4.png', 'https://oss.bhy521qm.com/common/0f77a109d2d68495684bfbb88497c8d4.png', 0, 1610717793, 0);
INSERT INTO `common_uploadfile` VALUES (127, 'local', '图片1.png', 3951, 'image', '/storage/589737cad2f20383c78c3a3af32eedd8.png', '/storage/589737cad2f20383c78c3a3af32eedd8.png', 0, 1610717811, 0);
INSERT INTO `common_uploadfile` VALUES (128, 'aliyun', '微信图片_20201226111413.png', 67904, 'image', '/common/886d1e7ace0650f74132cfa9eab68fcf.png', 'https://oss.bhy521qm.com/common/886d1e7ace0650f74132cfa9eab68fcf.png', 0, 1610717932, 0);
INSERT INTO `common_uploadfile` VALUES (129, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/54dd54475914dc5e16cbbafd72c286ad.mp4', 'https://oss.bhy521qm.com/common/54dd54475914dc5e16cbbafd72c286ad.mp4', 0, 1610718210, 0);
INSERT INTO `common_uploadfile` VALUES (130, 'aliyun', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/c46b8ad2ea5034595ffa027ba862e36a.jpg', 'https://oss.bhy521qm.com/common/c46b8ad2ea5034595ffa027ba862e36a.jpg', 0, 1610800610, 0);
INSERT INTO `common_uploadfile` VALUES (131, 'aliyun', 'u=3980478273,3337613300&fm=26&gp=0.jpg', 23489, 'image', '/common/d46e6d0c343f4551dc9de6d720763546.jpg', 'https://oss.bhy521qm.com/common/d46e6d0c343f4551dc9de6d720763546.jpg', 0, 1610800616, 0);
INSERT INTO `common_uploadfile` VALUES (132, 'aliyun', 'u=2328087454,401762545&fm=26&gp=0.jpg', 42527, 'image', '/common/6347eae79c3fa34c752dc25aed42e794.jpg', 'https://oss.bhy521qm.com/common/6347eae79c3fa34c752dc25aed42e794.jpg', 0, 1610800616, 0);
INSERT INTO `common_uploadfile` VALUES (133, 'aliyun', '20161010070989_OTysRj.jpg', 22550, 'image', '/common/1f83b3766e56655c2b4b30a49d48f715.jpg', 'https://oss.bhy521qm.com/common/1f83b3766e56655c2b4b30a49d48f715.jpg', 0, 1610800682, 0);
INSERT INTO `common_uploadfile` VALUES (134, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/fabf6ab2299c00285b22ebaa63fd458e.mp4', 'https://oss.bhy521qm.com/common/fabf6ab2299c00285b22ebaa63fd458e.mp4', 0, 1610800821, 0);
INSERT INTO `common_uploadfile` VALUES (135, 'aliyun', 'bg5.jpg', 319808, 'image', '/common/a90a994225ad1f4766a669b12350fc63.jpg', 'https://oss.bhy521qm.com/common/a90a994225ad1f4766a669b12350fc63.jpg', 0, 1610801077, 0);
INSERT INTO `common_uploadfile` VALUES (136, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/22930a17b04845f2b14630220c82a478.mp4', 'https://oss.bhy521qm.com/common/22930a17b04845f2b14630220c82a478.mp4', 0, 1610801089, 0);
INSERT INTO `common_uploadfile` VALUES (137, 'aliyun', 'f3d3572c11dfa9ec6b706dfb5134f005938fc1ee.png', 1066011, 'image', '/common/c7ab7e39fb22ccd2c1f0c2c297e29df1.png', 'https://oss.bhy521qm.com/common/c7ab7e39fb22ccd2c1f0c2c297e29df1.png', 0, 1610801210, 0);
INSERT INTO `common_uploadfile` VALUES (138, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/f84568765c50a5d048d66f0f7aae5555.mp4', 'https://oss.bhy521qm.com/common/f84568765c50a5d048d66f0f7aae5555.mp4', 0, 1610801220, 0);
INSERT INTO `common_uploadfile` VALUES (139, 'aliyun', '20150527145958_ABcyz.thumb.700_0.png', 1279407, 'image', '/common/485c109cff0d8498bc91bafbd0b6f596.png', 'https://oss.bhy521qm.com/common/485c109cff0d8498bc91bafbd0b6f596.png', 0, 1610801669, 0);
INSERT INTO `common_uploadfile` VALUES (140, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/5c9649e7b95308734c8e2ba3e5dd1c5f.mp4', 'https://oss.bhy521qm.com/common/5c9649e7b95308734c8e2ba3e5dd1c5f.mp4', 0, 1610801680, 0);
INSERT INTO `common_uploadfile` VALUES (141, 'aliyun', '微信截图_20201009074823.png', 372608, 'image', '/common/0fb2169a72eb78aaa61cd44771a290cb.png', 'https://oss.bhy521qm.com/common/0fb2169a72eb78aaa61cd44771a290cb.png', 0, 1610803461, 0);
INSERT INTO `common_uploadfile` VALUES (142, 'aliyun', 'mbg3.jpg', 111034, 'image', '/common/93a96fb761993d3d0b91fa6ce392fff9.jpg', 'https://oss.bhy521qm.com/common/93a96fb761993d3d0b91fa6ce392fff9.jpg', 0, 1610803475, 0);
INSERT INTO `common_uploadfile` VALUES (143, 'aliyun', 'mbg4.jpg', 307882, 'image', '/common/9abbbb235de00a5930d42a87663254dc.jpg', 'https://oss.bhy521qm.com/common/9abbbb235de00a5930d42a87663254dc.jpg', 0, 1610803476, 0);
INSERT INTO `common_uploadfile` VALUES (144, 'aliyun', '02bOOOPICe0_1024.jpg', 159249, 'image', '/common/d80b8b7e9b0d78686f8c220785a417d6.jpg', 'https://oss.bhy521qm.com/common/d80b8b7e9b0d78686f8c220785a417d6.jpg', 0, 1610805573, 0);
INSERT INTO `common_uploadfile` VALUES (145, 'aliyun', 'baec01f46c837119a460c8269d0c4d29.mp4', 3263212, 'video', '/common/bec98baa3d09834d1a110aa5c2d8fa9a.mp4', 'https://oss.bhy521qm.com/common/bec98baa3d09834d1a110aa5c2d8fa9a.mp4', 0, 1610805601, 0);
INSERT INTO `common_uploadfile` VALUES (146, 'aliyun', 'a46cad009abae898470e4ff6c1a95e32.jpg', 6423, 'image', '/common/217b308dfdb671065b2751920add05fe.jpg', 'https://oss.bhy521qm.com/common/217b308dfdb671065b2751920add05fe.jpg', 0, 1610805639, 0);
INSERT INTO `common_uploadfile` VALUES (147, 'aliyun', 'a46cad009abae898470e4ff6c1a95e32.mp4', 3573930, 'video', '/common/7cc3d774ef909e50fdff6ab88d020bfd.mp4', 'https://oss.bhy521qm.com/common/7cc3d774ef909e50fdff6ab88d020bfd.mp4', 0, 1610805647, 0);
INSERT INTO `common_uploadfile` VALUES (148, 'aliyun', 'u=2328087454,401762545&fm=26&gp=0.jpg', 42527, 'image', '/common/c9a1fc7b7c572c2b992f631f2efb5b96.jpg', 'https://oss.bhy521qm.com/common/c9a1fc7b7c572c2b992f631f2efb5b96.jpg', 0, 1610889461, 0);
INSERT INTO `common_uploadfile` VALUES (149, 'aliyun', '微信截图_20200717144057.png', 209543, 'image', '/common/1913bbae9ff1a1fd4312dabe15276fe6.png', 'https://oss.bhy521qm.com/common/1913bbae9ff1a1fd4312dabe15276fe6.png', 0, 1610889478, 0);
INSERT INTO `common_uploadfile` VALUES (150, 'aliyun', 'u=2001382863,1289112909&fm=26&gp=0.jpg', 19083, 'image', '/common/398c832041f121f59d6438fab83361da.jpg', 'https://oss.bhy521qm.com/common/398c832041f121f59d6438fab83361da.jpg', 0, 1610889846, 0);
INSERT INTO `common_uploadfile` VALUES (151, 'aliyun', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/common/6f5209f4d0bdfe9b39b27fa0d3fcca72.png', 'https://oss.bhy521qm.com/common/6f5209f4d0bdfe9b39b27fa0d3fcca72.png', 0, 1610889893, 0);
INSERT INTO `common_uploadfile` VALUES (152, 'aliyun', '图片2.png', 6021, 'image', '/common/7f8f78542659f207415d650b9526dbc1.png', 'https://oss.bhy521qm.com/common/7f8f78542659f207415d650b9526dbc1.png', 0, 1610889934, 0);
INSERT INTO `common_uploadfile` VALUES (153, 'aliyun', 'u=2001382863,1289112909&fm=26&gp=0.jpg', 19083, 'image', '/common/085eea1a3c4792f56e346f6fc3867994.jpg', 'https://oss.bhy521qm.com/common/085eea1a3c4792f56e346f6fc3867994.jpg', 0, 1610890011, 0);
INSERT INTO `common_uploadfile` VALUES (154, 'aliyun', '1528817466_5670.jpg', 209660, 'image', '/common/c2cc0df8b9001929d91b485f2f87ffbe.jpg', 'https://oss.bhy521qm.com/common/c2cc0df8b9001929d91b485f2f87ffbe.jpg', 0, 1610891444, 0);
INSERT INTO `common_uploadfile` VALUES (155, 'aliyun', 'u=3980478273,3337613300&fm=26&gp=0.jpg', 23489, 'image', '/common/af8e34626846d79a2681595b67ccce3b.jpg', 'https://oss.bhy521qm.com/common/af8e34626846d79a2681595b67ccce3b.jpg', 0, 1610891509, 0);
INSERT INTO `common_uploadfile` VALUES (156, 'aliyun', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/3a5d4c5fc25da6669748c7dd17262371.jpg', 'https://oss.bhy521qm.com/common/3a5d4c5fc25da6669748c7dd17262371.jpg', 0, 1610891607, 0);
INSERT INTO `common_uploadfile` VALUES (157, 'aliyun', '20181218092471_OhNJXA.gif', 51986, 'image', '/common/bc1614d1ddae4d7ebf8cbb967635ad23.gif', 'https://oss.bhy521qm.com/common/bc1614d1ddae4d7ebf8cbb967635ad23.gif', 0, 1610892168, 0);
INSERT INTO `common_uploadfile` VALUES (158, 'aliyun', 'QQ图片20200727182645.jpg', 218713, 'image', '/common/ac43906eb2a54bd7099abadc926e9d00.jpg', 'https://oss.bhy521qm.com/common/ac43906eb2a54bd7099abadc926e9d00.jpg', 0, 1610892258, 0);
INSERT INTO `common_uploadfile` VALUES (159, 'aliyun', '图片6.png', 2519, 'image', '/common/0d8568cd68de0a77ae7675fb5e543275.png', 'https://oss.bhy521qm.com/common/0d8568cd68de0a77ae7675fb5e543275.png', 0, 1610932526, 0);
INSERT INTO `common_uploadfile` VALUES (160, 'aliyun', '微信截图_20201123121454.png', 44908, 'image', '/common/962d84308b5a8b01e32724b7c80ab28a.png', 'https://oss.bhy521qm.com/common/962d84308b5a8b01e32724b7c80ab28a.png', 0, 1610932889, 0);
INSERT INTO `common_uploadfile` VALUES (161, 'aliyun', '微信图片_20201116110844.png', 7210, 'image', '/common/f820d45da94ce5798440a4bb59378813.png', 'https://oss.bhy521qm.com/common/f820d45da94ce5798440a4bb59378813.png', 0, 1610932898, 0);
INSERT INTO `common_uploadfile` VALUES (162, 'aliyun', '微信图片_20201116110818.png', 7725, 'image', '/common/dd97bba90de7f49a5a2ef167cd49b717.png', 'https://oss.bhy521qm.com/common/dd97bba90de7f49a5a2ef167cd49b717.png', 0, 1610933018, 0);
INSERT INTO `common_uploadfile` VALUES (163, 'aliyun', 'u=1194864275,2577414869&fm=26&gp=0.jpg', 20292, 'image', '/common/bbf0be5122bdf2aa83e30bc960cdccd3.jpg', 'https://oss.bhy521qm.com/common/bbf0be5122bdf2aa83e30bc960cdccd3.jpg', 0, 1610933028, 0);
INSERT INTO `common_uploadfile` VALUES (164, 'aliyun', '微信截图_20200717144057.png', 209543, 'image', '/common/0a36985bf7265433d1fd59c389d19f82.png', 'https://oss.bhy521qm.com/common/0a36985bf7265433d1fd59c389d19f82.png', 0, 1610939941, 0);
INSERT INTO `common_uploadfile` VALUES (165, 'aliyun', '图片7.png', 6413, 'image', '/common/d5cc33ef778b2841eef77fdb7bfb31bb.png', 'https://oss.bhy521qm.com/common/d5cc33ef778b2841eef77fdb7bfb31bb.png', 0, 1610939990, 0);
INSERT INTO `common_uploadfile` VALUES (166, 'aliyun', '微信截图_20201009074823.png', 372608, 'image', '/common/6d4975a9e0dcd0b90e5631aeb5c246a2.png', 'https://oss.bhy521qm.com/common/6d4975a9e0dcd0b90e5631aeb5c246a2.png', 0, 1610940369, 0);
INSERT INTO `common_uploadfile` VALUES (167, 'aliyun', '图片1.png', 3951, 'image', '/common/c91bc4b733b72f4e797a881c0fc09d2c.png', 'https://oss.bhy521qm.com/common/c91bc4b733b72f4e797a881c0fc09d2c.png', 0, 1610975987, 0);
INSERT INTO `common_uploadfile` VALUES (168, 'aliyun', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/af5e704ec563289102c4c17ab5b8eb48.jpg', 'https://oss.bhy521qm.com/common/af5e704ec563289102c4c17ab5b8eb48.jpg', 0, 1612017447, 0);
INSERT INTO `common_uploadfile` VALUES (169, 'aliyun', '1528817466_5670.jpg', 209660, 'image', '/common/43b8871a62b6476eeefe234e3a8683e3.jpg', 'https://oss.bhy521qm.com/common/43b8871a62b6476eeefe234e3a8683e3.jpg', 0, 1612018143, 0);
INSERT INTO `common_uploadfile` VALUES (170, 'aliyun', '20161010070989_OTysRj.jpg', 22550, 'image', '/common/6be0d8235b22417f6c0b1407afed793d.jpg', 'https://oss.bhy521qm.com/common/6be0d8235b22417f6c0b1407afed793d.jpg', 0, 1612018318, 0);
INSERT INTO `common_uploadfile` VALUES (171, 'aliyun', 'wx_camera_1574607392726.jpg', 158541, 'image', '/common/447fc666f49bcbf71a2250a4ed6261f1.jpg', 'https://oss.bhy521qm.com/common/447fc666f49bcbf71a2250a4ed6261f1.jpg', 0, 1612082341, 0);
INSERT INTO `common_uploadfile` VALUES (172, 'aliyun', '1612085030512.mp3', 22568, 'file', '/common/278ec08683f5758ae453ea75ec5ab200.mp3', 'https://oss.bhy521qm.com/common/278ec08683f5758ae453ea75ec5ab200.mp3', 0, 1612085033, 0);
INSERT INTO `common_uploadfile` VALUES (173, 'aliyun', '1612085053897.mp3', 17135, 'file', '/common/b1444b8de66e31be9c099430ab1c420b.mp3', 'https://oss.bhy521qm.com/common/b1444b8de66e31be9c099430ab1c420b.mp3', 0, 1612085056, 0);
INSERT INTO `common_uploadfile` VALUES (174, 'aliyun', '1612085055292.mp3', 5432, 'file', '/common/69fb85a6251f1650936e270f303d14a6.mp3', 'https://oss.bhy521qm.com/common/69fb85a6251f1650936e270f303d14a6.mp3', 0, 1612085056, 0);
INSERT INTO `common_uploadfile` VALUES (175, 'aliyun', '1612085055977.mp3', 7104, 'file', '/common/ba4d09b17366b49a081efd451ad609cc.mp3', 'https://oss.bhy521qm.com/common/ba4d09b17366b49a081efd451ad609cc.mp3', 0, 1612085057, 0);
INSERT INTO `common_uploadfile` VALUES (176, 'aliyun', '1612085056931.mp3', 10030, 'file', '/common/88c77293f5f14f2bea4ff6566d082750.mp3', 'https://oss.bhy521qm.com/common/88c77293f5f14f2bea4ff6566d082750.mp3', 0, 1612085058, 0);
INSERT INTO `common_uploadfile` VALUES (177, 'aliyun', '1612085058157.mp3', 0, 'file', '/common/ab33f4ecd7ba5c736ec1c0bee1766f15.mp3', 'https://oss.bhy521qm.com/common/ab33f4ecd7ba5c736ec1c0bee1766f15.mp3', 0, 1612085059, 0);
INSERT INTO `common_uploadfile` VALUES (178, 'aliyun', '1612085058393.mp3', 15587, 'file', '/common/2ff1da43a666d73d74027e614afedbb6.mp3', 'https://oss.bhy521qm.com/common/2ff1da43a666d73d74027e614afedbb6.mp3', 0, 1612085060, 0);
INSERT INTO `common_uploadfile` VALUES (179, 'aliyun', '1612085060939.mp3', 11340, 'file', '/common/a1e4421a62a2f93714d506c45050dbbe.mp3', 'https://oss.bhy521qm.com/common/a1e4421a62a2f93714d506c45050dbbe.mp3', 0, 1612085062, 0);
INSERT INTO `common_uploadfile` VALUES (180, 'aliyun', '1612085061702.mp3', 867, 'file', '/common/39f6c8af757ac8ce5dbe7c4b23a9b420.mp3', 'https://oss.bhy521qm.com/common/39f6c8af757ac8ce5dbe7c4b23a9b420.mp3', 0, 1612085062, 0);
INSERT INTO `common_uploadfile` VALUES (181, 'aliyun', '1612085061890.mp3', 9319, 'file', '/common/51a1634f2e7e6e9559f381f9ea8e5ea7.mp3', 'https://oss.bhy521qm.com/common/51a1634f2e7e6e9559f381f9ea8e5ea7.mp3', 0, 1612085063, 0);
INSERT INTO `common_uploadfile` VALUES (182, 'aliyun', '1612085063011.mp3', 2556, 'file', '/common/38ca8cdb3a21654bfa4dce46b432170d.mp3', 'https://oss.bhy521qm.com/common/38ca8cdb3a21654bfa4dce46b432170d.mp3', 0, 1612085064, 0);
INSERT INTO `common_uploadfile` VALUES (183, 'aliyun', '1612085063248.mp3', 0, 'file', '/common/deb0cae22ebf38d7a3e8ec929e75719c.mp3', 'https://oss.bhy521qm.com/common/deb0cae22ebf38d7a3e8ec929e75719c.mp3', 0, 1612085064, 0);
INSERT INTO `common_uploadfile` VALUES (184, 'aliyun', '1612085063343.mp3', 10914, 'file', '/common/7902081986252db5695e4063ab49a08f.mp3', 'https://oss.bhy521qm.com/common/7902081986252db5695e4063ab49a08f.mp3', 0, 1612085065, 0);
INSERT INTO `common_uploadfile` VALUES (185, 'aliyun', '1612085065392.mp3', 15702, 'file', '/common/d7326be7d92aa9d1eca49d2f0e01d55f.mp3', 'https://oss.bhy521qm.com/common/d7326be7d92aa9d1eca49d2f0e01d55f.mp3', 0, 1612085067, 0);
INSERT INTO `common_uploadfile` VALUES (186, 'aliyun', '1612085282702.mp3', 23596, 'file', '/common/fa6c448322deae02fbbe4b797ddf5683.mp3', 'https://oss.bhy521qm.com/common/fa6c448322deae02fbbe4b797ddf5683.mp3', 0, 1612085285, 0);
INSERT INTO `common_uploadfile` VALUES (187, 'aliyun', '1612085289674.mp3', 1699, 'file', '/common/1a32e2d82c5e6d8f4516198d0ae014ac.mp3', 'https://oss.bhy521qm.com/common/1a32e2d82c5e6d8f4516198d0ae014ac.mp3', 0, 1612085290, 0);
INSERT INTO `common_uploadfile` VALUES (188, 'aliyun', '1612085290013.mp3', 10638, 'file', '/common/ffb19be3f420126bfb1453fff3858304.mp3', 'https://oss.bhy521qm.com/common/ffb19be3f420126bfb1453fff3858304.mp3', 0, 1612085291, 0);
INSERT INTO `common_uploadfile` VALUES (189, 'aliyun', '1612085304993.mp3', 22193, 'file', '/common/d61c7bff3730d754eced7524801e73cf.mp3', 'https://oss.bhy521qm.com/common/d61c7bff3730d754eced7524801e73cf.mp3', 0, 1612085307, 0);
INSERT INTO `common_uploadfile` VALUES (190, 'aliyun', '1612085460568.mp3', 20810, 'file', '/common/03c4bd4f832946ff97336b05052939e5.mp3', 'https://oss.bhy521qm.com/common/03c4bd4f832946ff97336b05052939e5.mp3', 0, 1612085462, 0);
INSERT INTO `common_uploadfile` VALUES (191, 'aliyun', '1612085659285.mp3', 27166, 'file', '/common/ed4d5f43bec4575fe349238c5ae6419f.mp3', 'https://oss.bhy521qm.com/common/ed4d5f43bec4575fe349238c5ae6419f.mp3', 0, 1612085662, 0);
INSERT INTO `common_uploadfile` VALUES (192, 'aliyun', '1612085770244.mp3', 23822, 'file', '/common/b3309a961df434d4b760b7af0448c022.mp3', 'https://oss.bhy521qm.com/common/b3309a961df434d4b760b7af0448c022.mp3', 0, 1612085772, 0);
INSERT INTO `common_uploadfile` VALUES (193, 'aliyun', '1612085782906.mp3', 31763, 'file', '/common/6bf8630c13451944e7c31903d97028a8.mp3', 'https://oss.bhy521qm.com/common/6bf8630c13451944e7c31903d97028a8.mp3', 0, 1612085786, 0);
INSERT INTO `common_uploadfile` VALUES (194, 'aliyun', '1612086220267_1612086204170.jpg', 83882, 'image', '/common/c82ac061fb752d107ad23f19a38485e3.jpg', 'https://oss.bhy521qm.com/common/c82ac061fb752d107ad23f19a38485e3.jpg', 0, 1612086221, 0);
INSERT INTO `common_uploadfile` VALUES (195, 'aliyun', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/296afef10c47574489b8c432558c6339.jpg', 'https://oss.bhy521qm.com/common/296afef10c47574489b8c432558c6339.jpg', 0, 1612316048, 0);
INSERT INTO `common_uploadfile` VALUES (196, 'aliyun', 'u=1194864275,2577414869&fm=26&gp=0.jpg', 20292, 'image', '/common/2cdd8f13ad248c20ddcfc95c41d93b63.jpg', 'https://oss.bhy521qm.com/common/2cdd8f13ad248c20ddcfc95c41d93b63.jpg', 0, 1612345860, 0);
INSERT INTO `common_uploadfile` VALUES (197, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/17d67eed988a5edd93efe0537292a2df.mp4', 'https://oss.bhy521qm.com/common/17d67eed988a5edd93efe0537292a2df.mp4', 0, 1612405474, 0);
INSERT INTO `common_uploadfile` VALUES (198, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/7b978261825f0e01336254c936d832c1.mp4', 'https://oss.bhy521qm.com/common/7b978261825f0e01336254c936d832c1.mp4', 0, 1612405533, 0);
INSERT INTO `common_uploadfile` VALUES (199, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/85d3c47b72104426cdcd6838754a5f87.mp4', 'https://oss.bhy521qm.com/common/85d3c47b72104426cdcd6838754a5f87.mp4', 0, 1612405698, 0);
INSERT INTO `common_uploadfile` VALUES (200, 'aliyun', 'tdt.mp4', 9107756, 'video', '/common/0efda66c4eb1269d460c4b70225703a2.mp4', 'https://oss.bhy521qm.com/common/0efda66c4eb1269d460c4b70225703a2.mp4', 0, 1612406618, 0);
INSERT INTO `common_uploadfile` VALUES (201, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/9d0c1e78d9827a854d007602fb1a43ca.mp4', 'https://oss.bhy521qm.com/common/9d0c1e78d9827a854d007602fb1a43ca.mp4', 0, 1612406657, 0);
INSERT INTO `common_uploadfile` VALUES (202, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/05f3cb4f48dfadea354efe01ce3bdbc5.mp4', 'https://oss.bhy521qm.com/common/05f3cb4f48dfadea354efe01ce3bdbc5.mp4', 0, 1612406833, 0);
INSERT INTO `common_uploadfile` VALUES (203, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/5badfd8496a0fe4271a0255ae9d3ba5e.mp4', 'https://oss.bhy521qm.com/common/5badfd8496a0fe4271a0255ae9d3ba5e.mp4', 0, 1612432906, 0);
INSERT INTO `common_uploadfile` VALUES (204, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/91f976866305da7a3a146b82d21706e3.mp4', 'https://oss.bhy521qm.com/common/91f976866305da7a3a146b82d21706e3.mp4', 0, 1612432996, 0);
INSERT INTO `common_uploadfile` VALUES (205, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/7b423070f26422595bb238f5da044c4f.mp4', 'https://oss.bhy521qm.com/common/7b423070f26422595bb238f5da044c4f.mp4', 0, 1612433182, 0);
INSERT INTO `common_uploadfile` VALUES (206, 'aliyun', 'wx_camera_1611674327834.mp4', 2242918, 'video', '/common/2e4b46d858c1cd4292c5755aa2c96825.mp4', 'https://oss.bhy521qm.com/common/2e4b46d858c1cd4292c5755aa2c96825.mp4', 0, 1612436586, 0);
INSERT INTO `common_uploadfile` VALUES (207, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/3f845a4cf2b179beddc29cd2aff99cbd.mp4', 'https://oss.bhy521qm.com/common/3f845a4cf2b179beddc29cd2aff99cbd.mp4', 0, 1612437227, 0);
INSERT INTO `common_uploadfile` VALUES (208, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/cbfdfdc8e74dadd58bea6a1d2ca74009.mp4', 'https://oss.bhy521qm.com/common/cbfdfdc8e74dadd58bea6a1d2ca74009.mp4', 0, 1612437292, 0);
INSERT INTO `common_uploadfile` VALUES (209, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/0d6aa5b06a249317b110d7290a49af36.mp4', 'https://oss.bhy521qm.com/common/0d6aa5b06a249317b110d7290a49af36.mp4', 0, 1612437453, 0);
INSERT INTO `common_uploadfile` VALUES (210, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/700f9d5ea0d8d909988b4e12d78f8536.mp4', 'https://oss.bhy521qm.com/common/700f9d5ea0d8d909988b4e12d78f8536.mp4', 0, 1612437567, 0);
INSERT INTO `common_uploadfile` VALUES (211, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/51dbe87a14e740c78c8c424bffbce5f4.mp4', 'https://oss.bhy521qm.com/common/51dbe87a14e740c78c8c424bffbce5f4.mp4', 0, 1612437573, 0);
INSERT INTO `common_uploadfile` VALUES (212, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/8f2625779432ac800a42cc640b146131.mp4', 'https://oss.bhy521qm.com/common/8f2625779432ac800a42cc640b146131.mp4', 0, 1612439502, 0);
INSERT INTO `common_uploadfile` VALUES (213, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/6291ae3c967afd7b946abf76e73416a0.mp4', 'https://oss.bhy521qm.com/common/6291ae3c967afd7b946abf76e73416a0.mp4', 0, 1612439548, 0);
INSERT INTO `common_uploadfile` VALUES (214, 'aliyun', '1528817466_5670.jpg', 209660, 'image', '/common/2d2d897d57e8ed65acba7844f85f6c1c.jpg', 'https://oss.bhy521qm.com/common/2d2d897d57e8ed65acba7844f85f6c1c.jpg', 0, 1612439632, 0);
INSERT INTO `common_uploadfile` VALUES (215, 'aliyun', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/bf5326c1d97e72861160ec283ea2775b.jpg', 'https://oss.bhy521qm.com/common/bf5326c1d97e72861160ec283ea2775b.jpg', 0, 1612439658, 0);
INSERT INTO `common_uploadfile` VALUES (216, 'aliyun', '3bc431db00c2ed0840944b3e1aff9876.mp4', 6538333, 'video', '/common/6c6263d71cd22216dbff92b61fd12ddf.mp4', 'https://oss.bhy521qm.com/common/6c6263d71cd22216dbff92b61fd12ddf.mp4', 0, 1612439744, 0);
INSERT INTO `common_uploadfile` VALUES (217, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/c64f398594ff3a4ce487028c2d52d6d7.mp4', 'https://oss.bhy521qm.com/common/c64f398594ff3a4ce487028c2d52d6d7.mp4', 0, 1612439997, 0);
INSERT INTO `common_uploadfile` VALUES (218, 'aliyun', 'renzhengfei.mp4', 1957023, 'video', '/common/f3dae4eae047cccbbebf6446a0f16a7d.mp4', 'https://oss.bhy521qm.com/common/f3dae4eae047cccbbebf6446a0f16a7d.mp4', 0, 1612440033, 0);
INSERT INTO `common_uploadfile` VALUES (219, 'aliyun', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/c4751da46a5dce1911ebccd991964f86.jpg', 'https://oss.bhy521qm.com/common/c4751da46a5dce1911ebccd991964f86.jpg', 0, 1612441238, 0);
INSERT INTO `common_uploadfile` VALUES (220, 'aliyun', '图片6.png', 2519, 'image', '/common/20b44cefbee9776e19860005c2d8edaf.png', 'https://oss.bhy521qm.com/common/20b44cefbee9776e19860005c2d8edaf.png', 0, 1612441245, 0);
INSERT INTO `common_uploadfile` VALUES (221, 'aliyun', 'u=2001382863,1289112909&fm=26&gp=0.jpg', 19083, 'image', '/common/7cd4e3833a2baf08492708b9b0e887ec.jpg', 'https://oss.bhy521qm.com/common/7cd4e3833a2baf08492708b9b0e887ec.jpg', 0, 1612441245, 0);
INSERT INTO `common_uploadfile` VALUES (222, 'aliyun', 'hdImg_4a37435d7d1f22ff86ae1415646dff931612421722262.jpg', 102712, 'image', '/common/c9dd3ffdde1654bca55ed45835099135.jpg', 'https://oss.bhy521qm.com/common/c9dd3ffdde1654bca55ed45835099135.jpg', 0, 1612442658, 0);
INSERT INTO `common_uploadfile` VALUES (223, 'aliyun', '1612442665834_wx_camera_1612256749056.jpg', 211168, 'image', '/common/80a550edecf730042e1ecfe3c9cb4f15.jpg', 'https://oss.bhy521qm.com/common/80a550edecf730042e1ecfe3c9cb4f15.jpg', 0, 1612442666, 0);
INSERT INTO `common_uploadfile` VALUES (224, 'aliyun', '21-43-28-028.jpg', 21411, 'image', '/common/0cdbbe797897902a95ab0c9dd25418cb.jpg', 'https://oss.bhy521qm.com/common/0cdbbe797897902a95ab0c9dd25418cb.jpg', 0, 1612442668, 0);
INSERT INTO `common_uploadfile` VALUES (225, 'aliyun', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/10c91e1a4a49ecec3bfff9258ec4ef8a.jpg', 'https://oss.bhy521qm.com/common/10c91e1a4a49ecec3bfff9258ec4ef8a.jpg', 0, 1612492798, 0);
INSERT INTO `common_uploadfile` VALUES (226, 'aliyun', '图片6.png', 2519, 'image', '/common/ceada5f0c038aa2f99062d3e77b98861.png', 'https://oss.bhy521qm.com/common/ceada5f0c038aa2f99062d3e77b98861.png', 0, 1612492805, 0);
INSERT INTO `common_uploadfile` VALUES (227, 'aliyun', '图片2.png', 6021, 'image', '/common/b023b7d427248fa23ce52eb517bade72.png', 'https://oss.bhy521qm.com/common/b023b7d427248fa23ce52eb517bade72.png', 0, 1612492805, 0);
INSERT INTO `common_uploadfile` VALUES (228, 'aliyun', '微信截图_20201009074823.png', 372608, 'image', '/common/55131690e71d50b94164c93adbcfece4.png', 'https://oss.bhy521qm.com/common/55131690e71d50b94164c93adbcfece4.png', 0, 1612492806, 0);
INSERT INTO `common_uploadfile` VALUES (229, 'aliyun', 'u=3241659229,3202296598&fm=26&gp=0.jpg', 23712, 'image', '/common/82a77e5c48fc6ed647f5564997d86664.jpg', 'https://oss.bhy521qm.com/common/82a77e5c48fc6ed647f5564997d86664.jpg', 0, 1612492840, 0);
INSERT INTO `common_uploadfile` VALUES (230, 'aliyun', '20161010070989_OTysRj.jpg', 22550, 'image', '/common/45bc9b5f21e2e32b73aaf6ba3bc87222.jpg', 'https://oss.bhy521qm.com/common/45bc9b5f21e2e32b73aaf6ba3bc87222.jpg', 0, 1612492848, 0);
INSERT INTO `common_uploadfile` VALUES (231, 'aliyun', '20150527145958_ABcyz.thumb.700_0.png', 1279407, 'image', '/common/f003e443a514c19d6fb2762fa2d60d81.png', 'https://oss.bhy521qm.com/common/f003e443a514c19d6fb2762fa2d60d81.png', 0, 1612504551, 0);
INSERT INTO `common_uploadfile` VALUES (232, 'aliyun', '图片7.png', 6413, 'image', '/common/8855b0a98309583cc24d12e87f6c80ab.png', 'https://oss.bhy521qm.com/common/8855b0a98309583cc24d12e87f6c80ab.png', 0, 1612578707, 0);
INSERT INTO `common_uploadfile` VALUES (233, 'aliyun', '1614073164003.mp3', 25494, 'file', '/common/bff8322d17968c828f9e6bb67848883a.mp3', 'https://oss.bhy521qm.com/common/bff8322d17968c828f9e6bb67848883a.mp3', 0, 1614073168, 0);
INSERT INTO `common_uploadfile` VALUES (234, 'aliyun', '1614154319004.mp3', 26245, 'file', '/common/f7d07d7f73c6da8eadf76cfd3278cef0.mp3', 'https://oss.bhy521qm.com/common/f7d07d7f73c6da8eadf76cfd3278cef0.mp3', 0, 1614154323, 0);
INSERT INTO `common_uploadfile` VALUES (235, 'aliyun', '1614154326072.mp3', 44972, 'file', '/common/1368721f4f60db7f6ba0232f0427dd6b.mp3', 'https://oss.bhy521qm.com/common/1368721f4f60db7f6ba0232f0427dd6b.mp3', 0, 1614154331, 0);
INSERT INTO `common_uploadfile` VALUES (236, 'aliyun', '1614154363967.mp3', 87204, 'file', '/common/f8c418d80d0f46df2a0df829be1d1e9a.mp3', 'https://oss.bhy521qm.com/common/f8c418d80d0f46df2a0df829be1d1e9a.mp3', 0, 1614154371, 0);
INSERT INTO `common_uploadfile` VALUES (237, 'aliyun', '1614154536897.mp3', 15935, 'file', '/common/c67ed301aef1a6b12b481ab8dbc9cb41.mp3', 'https://oss.bhy521qm.com/common/c67ed301aef1a6b12b481ab8dbc9cb41.mp3', 0, 1614154540, 0);
INSERT INTO `common_uploadfile` VALUES (238, 'aliyun', '1614154579198.mp3', 30142, 'file', '/common/8b429ba8d7e9d33c7b798387dda660cb.mp3', 'https://oss.bhy521qm.com/common/8b429ba8d7e9d33c7b798387dda660cb.mp3', 0, 1614154583, 0);
INSERT INTO `common_uploadfile` VALUES (239, 'aliyun', '1614154584479.mp3', 44634, 'file', '/common/ec6f3ffbba37425ee548a791ed5b15c8.mp3', 'https://oss.bhy521qm.com/common/ec6f3ffbba37425ee548a791ed5b15c8.mp3', 0, 1614154589, 0);
INSERT INTO `common_uploadfile` VALUES (240, 'aliyun', '1614154601096.mp3', 19766, 'file', '/common/a7dad952e94f33d061cbc06485694c7d.mp3', 'https://oss.bhy521qm.com/common/a7dad952e94f33d061cbc06485694c7d.mp3', 0, 1614154605, 0);
INSERT INTO `common_uploadfile` VALUES (241, 'aliyun', '1614154665249.mp3', 20972, 'file', '/common/d2eb42aa7c15eeb070981072bce2d432.mp3', 'https://oss.bhy521qm.com/common/d2eb42aa7c15eeb070981072bce2d432.mp3', 0, 1614154668, 0);
INSERT INTO `common_uploadfile` VALUES (242, 'aliyun', '1614154692959.mp3', 21706, 'file', '/common/e1c99341cab7eea7ff5702f812ac333d.mp3', 'https://oss.bhy521qm.com/common/e1c99341cab7eea7ff5702f812ac333d.mp3', 0, 1614154697, 0);
INSERT INTO `common_uploadfile` VALUES (243, 'aliyun', '1614154710903.mp3', 20479, 'file', '/common/28448f5b8c0756b8af7c5c959ccad64c.mp3', 'https://oss.bhy521qm.com/common/28448f5b8c0756b8af7c5c959ccad64c.mp3', 0, 1614154714, 0);
INSERT INTO `common_uploadfile` VALUES (244, 'aliyun', '1614154716003.mp3', 27166, 'file', '/common/d907205803b57f201337dff5755e5afe.mp3', 'https://oss.bhy521qm.com/common/d907205803b57f201337dff5755e5afe.mp3', 0, 1614154720, 0);
INSERT INTO `common_uploadfile` VALUES (245, 'aliyun', '1614154737434.mp3', 140015, 'file', '/common/1d695a42f8021737bcd3a29dbbeaf3f2.mp3', 'https://oss.bhy521qm.com/common/1d695a42f8021737bcd3a29dbbeaf3f2.mp3', 0, 1614154749, 0);
INSERT INTO `common_uploadfile` VALUES (246, 'aliyun', '1614170116250.mp3', 8358, 'file', '/common/b129001f7308c98269cd5f86ed454529.mp3', 'https://oss.bhy521qm.com/common/b129001f7308c98269cd5f86ed454529.mp3', 0, 1614170121, 0);
INSERT INTO `common_uploadfile` VALUES (247, 'aliyun', '1614170120172.mp3', 28838, 'file', '/common/5568d492b3b28830f4e3950f65a467c4.mp3', 'https://oss.bhy521qm.com/common/5568d492b3b28830f4e3950f65a467c4.mp3', 0, 1614170124, 0);
INSERT INTO `common_uploadfile` VALUES (248, 'aliyun', '2ec1054274c59eee349f9435f8b7570d.jpg', 70492, 'image', '/common/bb1a66e881be5033df8a3ae7b5e45f9a.jpg', 'https://oss.bhy521qm.com/common/bb1a66e881be5033df8a3ae7b5e45f9a.jpg', 0, 1614170530, 0);
INSERT INTO `common_uploadfile` VALUES (249, 'aliyun', 'a32710fa17810b37a3958bda676c559b.jpg', 45827, 'image', '/common/1647288324d9686c1c383564424c2d86.jpg', 'https://oss.bhy521qm.com/common/1647288324d9686c1c383564424c2d86.jpg', 0, 1614170547, 0);
INSERT INTO `common_uploadfile` VALUES (250, 'aliyun', 'wx_camera_1614061706710.jpg', 204319, 'image', '/common/02f893fccabf178dcce3242965d9a6c6.jpg', 'https://oss.bhy521qm.com/common/02f893fccabf178dcce3242965d9a6c6.jpg', 0, 1614170548, 0);
INSERT INTO `common_uploadfile` VALUES (251, 'aliyun', '8n.png', 13372, 'image', '/common/f66224a9a4da0a96b3cdae46d2047915.png', 'https://oss.bhy521qm.com/common/f66224a9a4da0a96b3cdae46d2047915.png', 0, 1614223877, 0);
INSERT INTO `common_uploadfile` VALUES (252, 'aliyun', 'c7106c5b6c5844f06c57da7d75f3a7ec.jpg', 56599, 'image', '/common/85278ac4dc6448007e7960e81230182f.jpg', 'https://oss.bhy521qm.com/common/85278ac4dc6448007e7960e81230182f.jpg', 0, 1614226560, 0);
INSERT INTO `common_uploadfile` VALUES (253, 'aliyun', '2ec1054274c59eee349f9435f8b7570d.jpg', 70492, 'image', '/common/f54d4f783473ff6960cb83da38367ed8.jpg', 'https://oss.bhy521qm.com/common/f54d4f783473ff6960cb83da38367ed8.jpg', 0, 1614226560, 0);
INSERT INTO `common_uploadfile` VALUES (254, 'aliyun', '12-37-55-055.jpg', 31779, 'image', '/common/54864799e1c4804c45f41066ff96d2c0.jpg', 'https://oss.bhy521qm.com/common/54864799e1c4804c45f41066ff96d2c0.jpg', 0, 1614226590, 0);
INSERT INTO `common_uploadfile` VALUES (255, 'aliyun', '2ec1054274c59eee349f9435f8b7570d.jpg', 70492, 'image', '/common/3acc0a0922825f7b6dbad0690542c10e.jpg', 'https://oss.bhy521qm.com/common/3acc0a0922825f7b6dbad0690542c10e.jpg', 0, 1614226590, 0);
INSERT INTO `common_uploadfile` VALUES (256, 'aliyun', '8n.png', 13372, 'image', '/common/365f7857883705bb66f4216daa0ac818.png', 'https://oss.bhy521qm.com/common/365f7857883705bb66f4216daa0ac818.png', 0, 1614226596, 0);
INSERT INTO `common_uploadfile` VALUES (257, 'aliyun', '8n.png', 13372, 'image', '/common/876a7fc95ce19b5115a1a07d41c769ed.png', 'https://oss.bhy521qm.com/common/876a7fc95ce19b5115a1a07d41c769ed.png', 0, 1614226655, 0);
INSERT INTO `common_uploadfile` VALUES (258, 'aliyun', '8n.png', 13372, 'image', '/common/d64a0c76d56e30986ee744ba2c0934d1.png', 'https://oss.bhy521qm.com/common/d64a0c76d56e30986ee744ba2c0934d1.png', 0, 1614226722, 0);
INSERT INTO `common_uploadfile` VALUES (259, 'aliyun', '2ec1054274c59eee349f9435f8b7570d.jpg', 70492, 'image', '/common/9eb2b5878ebe8b4842edd52ea8623dd9.jpg', 'https://oss.bhy521qm.com/common/9eb2b5878ebe8b4842edd52ea8623dd9.jpg', 0, 1614226731, 0);
INSERT INTO `common_uploadfile` VALUES (260, 'aliyun', '12-37-20-020.jpg', 23784, 'image', '/common/28af04a57f57e503815e4094390ba40b.jpg', 'https://oss.bhy521qm.com/common/28af04a57f57e503815e4094390ba40b.jpg', 0, 1614226731, 0);
INSERT INTO `common_uploadfile` VALUES (261, 'aliyun', '1614235695714.mp3', 18807, 'file', '/common/2752f4d925645e1819cd042279bf9e32.mp3', 'https://oss.bhy521qm.com/common/2752f4d925645e1819cd042279bf9e32.mp3', 0, 1614235700, 0);
INSERT INTO `common_uploadfile` VALUES (262, 'aliyun', 'c7106c5b6c5844f06c57da7d75f3a7ec.jpg', 56599, 'image', '/common/8ab56ccb80c424c0cef8e14ab68c717b.jpg', 'https://oss.bhy521qm.com/common/8ab56ccb80c424c0cef8e14ab68c717b.jpg', 0, 1614261215, 0);
INSERT INTO `common_uploadfile` VALUES (263, 'aliyun', '微信截图_20210225221017.png', 356399, 'image', '/common/57f467814e96d5629c85db30abae5fc9.png', 'https://oss.bhy521qm.com/common/57f467814e96d5629c85db30abae5fc9.png', 0, 1614262233, 0);
INSERT INTO `common_uploadfile` VALUES (264, 'aliyun', '微信截图_20210225221118.png', 132684, 'image', '/common/661f31a8f1a6b12d2cdffc0f2de573fc.png', 'https://oss.bhy521qm.com/common/661f31a8f1a6b12d2cdffc0f2de573fc.png', 0, 1614262318, 0);
INSERT INTO `common_uploadfile` VALUES (265, 'aliyun', '5n.png', 13085, 'image', '/common/6397592317809e5d02119b9498886f4f.png', 'https://oss.bhy521qm.com/common/6397592317809e5d02119b9498886f4f.png', 0, 1614345091, 0);
INSERT INTO `common_uploadfile` VALUES (266, 'aliyun', '12-37-55-055.jpg', 31779, 'image', '/common/8c8884a3e991426f93c8a1dc684c0556.jpg', 'https://oss.bhy521qm.com/common/8c8884a3e991426f93c8a1dc684c0556.jpg', 0, 1614345145, 0);
INSERT INTO `common_uploadfile` VALUES (267, 'aliyun', '1614345167820.mp3', 92368, 'file', '/common/c4b52c04d68c92ef01d2049845343523.mp3', 'https://oss.bhy521qm.com/common/c4b52c04d68c92ef01d2049845343523.mp3', 0, 1614345179, 0);
INSERT INTO `common_uploadfile` VALUES (268, 'aliyun', 'sdf6678678.jpg', 78478, 'image', '/common/22943d44ebedb3b23bb27a70e9a08800.jpg', 'https://oss.bhy521qm.com/common/22943d44ebedb3b23bb27a70e9a08800.jpg', 0, 1614349154, 0);
INSERT INTO `common_uploadfile` VALUES (269, 'aliyun', 'd924385dbf2546b0952874358f2db939!1080x1920.jpeg', 475013, 'image', '/common/4fa07ca62ecae4ba6a8430d9191e7c8d.jpeg', 'https://oss.bhy521qm.com/common/4fa07ca62ecae4ba6a8430d9191e7c8d.jpeg', 0, 1614484128, 0);
INSERT INTO `common_uploadfile` VALUES (270, 'aliyun', '5n.png', 13085, 'image', '/common/3cc0979713cf2e20e79428a5c2b61f3a.png', 'https://oss.bhy521qm.com/common/3cc0979713cf2e20e79428a5c2b61f3a.png', 0, 1614487219, 0);
INSERT INTO `common_uploadfile` VALUES (271, 'aliyun', '20200915191902_94857.jpg', 247014, 'image', '/common/31d2f7bf78ab1be88c554296970dbd06.jpg', 'https://oss.bhy521qm.com/common/31d2f7bf78ab1be88c554296970dbd06.jpg', 0, 1614487223, 0);
INSERT INTO `common_uploadfile` VALUES (272, 'aliyun', '20200823094950_ledoi_wps图片.png', 1525008, 'image', '/common/3d15fd1b7ef96b51fb5d90702fcd2eb7.png', 'https://oss.bhy521qm.com/common/3d15fd1b7ef96b51fb5d90702fcd2eb7.png', 0, 1614487226, 0);
INSERT INTO `common_uploadfile` VALUES (273, 'aliyun', 'fae2579157a9fcd4dc3d428009656c10.mp4', 435787, 'video', '/common/0b790a0117e1697818011897c6750f32.mp4', 'https://oss.bhy521qm.com/common/0b790a0117e1697818011897c6750f32.mp4', 0, 1614487775, 0);
INSERT INTO `common_uploadfile` VALUES (274, 'aliyun', '30990570698dbfd461723111a922117b.mp4', 2454776, 'video', '/common/1b65832570f374e2c1b921969c7d86c6.mp4', 'https://oss.bhy521qm.com/common/1b65832570f374e2c1b921969c7d86c6.mp4', 0, 1614488522, 0);
INSERT INTO `common_uploadfile` VALUES (275, 'aliyun', '微信截图_20210225221017.png', 356399, 'image', '/common/b34d1cef9387fdc9677951b9cb896fcf.png', 'https://oss.bhy521qm.com/common/b34d1cef9387fdc9677951b9cb896fcf.png', 0, 1614605840, 0);
INSERT INTO `common_uploadfile` VALUES (276, 'aliyun', '微信截图_20210225221017.png', 356399, 'image', '/common/49d0cebb074c3a3a63539d58bbbb9138.png', 'https://oss.bhy521qm.com/common/49d0cebb074c3a3a63539d58bbbb9138.png', 0, 1614605852, 0);

-- ----------------------------
-- Table structure for faq_article
-- ----------------------------
DROP TABLE IF EXISTS `faq_article`;
CREATE TABLE `faq_article`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `state` tinyint(1) NULL DEFAULT 0,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '常见问题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faq_article
-- ----------------------------
INSERT INTO `faq_article` VALUES (1, 'Google 如何保护我的隐私权并确保我的信息安全？', '我们知道安全和隐私权对您而言非常重要，其实这两者对我们来说也同样重要。我们为您提供强有力的安全保障，让您相信您的信息既安全，又可在您需要时供您随时访问，这是我们工作的重中之重。\n\n我们一直在不遗余力地保证高度安全性、保护用户隐私，以及用更可行有效地方式为用户提供服务。我们每年都会在安全方面投入数亿美元的资金，并聘请数据安全领域的世界知名专家来确保用户信息的安全。此外，我们还致力于开发像 Google 信息中心、两步验证及广告设置等用来保护隐私和安全的易用工具。用户与 Google 分享的信息，完全掌控在用户自己手中。\n\n您可通过访问 Google 安全中心，详细了解在线安全（包括如何确保自己和家人的上网安全）。\n\n详细了解我们如何保障您个人信息的私密性和安全性，以及如何让您自主控制自己的个人信息。', 0, 15555555, 0);
INSERT INTO `faq_article` VALUES (3, '如何从Google的搜索结果中移除有关我的信息？', 'Google 搜索结果显示的是网络上公开提供的内容。搜索引擎无法直接从网站中删除内容，因此删除 Google 的搜索结果并不会将内容从网络中删除。如果您要删除网络上的某些内容，您应该与发布该内容的网站的网站站长联系，让他/她执行相应的操作。如果相关内容已经删除且 Google 注意到了这一更新，该信息就不会再出现在 Google 的搜索结果中了。如果您急需删除某些内容，也可以访问我们的帮助页面以获取详细信息。', 0, 1608783353, 0);
INSERT INTO `faq_article` VALUES (4, '在我点击Google搜索结果时，我的搜索查询会被发送到相关网站吗？', '有些情况下会。在您点击了 Google 搜索中的搜索结果后，网络浏览器可能还会将搜索结果页的网址作为引荐来源网址发送给目标网页。搜索结果页的网址有时可能会包含您输入的搜索查询字词。如果您使用的是 SSL 搜索功能（Google 的加密搜索功能），那么在大多数情况下，发送的引荐来源网址中将不会包含您的搜索字词。不过也有一些例外情况，例如，如果您使用的是某些不太常用的浏览器，可能就不是这样。如需关于 SSL 搜索功能的更多信息，请点击此处。可以通过 Google Analytics（分析）或应用编程接口 (API) 查看引荐来源网址中包含的搜索查询字词或信息。此外，广告主可能还会收到致使用户点击广告的确切关键字的相关信息。', 0, 1608783368, 1610280519);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int UNSIGNED NULL DEFAULT 0 COMMENT '推荐上级ID',
  `union_id` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '唯一ID',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `pwd` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加密串',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sign_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `gender` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '性别【0：未知，1：男，2：女】',
  `grade` tinyint NULL DEFAULT 0 COMMENT '等级【0：非会员，1：VIP，2：SVIP】',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `wechat` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `qq` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `wallpaper` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '照片墙纸',
  `is_realname` tinyint(1) NULL DEFAULT 0 COMMENT '是否实名',
  `is_kefu` tinyint(1) NULL DEFAULT 0 COMMENT '是否客服',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态【1：正常，-1：禁用】',
  `created_at` int UNSIGNED NOT NULL,
  `updated_at` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `grade`(`grade`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `unionid`(`union_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 0, '0', 'asfas', '2342342', NULL, '188899999', 'nnnn', NULL, 1, 2, NULL, NULL, NULL, NULL, 0, 0, 1, 0, NULL);
INSERT INTO `member` VALUES (2, 0, '0', '15566555555', '6acb0405d85bc94e0b3d8e8abf6e2785', 'sXKMCt', '15566555555', NULL, NULL, 0, 0, 'https://oss.bhy521qm.com/common/962d84308b5a8b01e32724b7c80ab28a.png', NULL, NULL, NULL, 0, 0, 1, 1608456108, NULL);
INSERT INTO `member` VALUES (3, 0, '0', '13888888888', '92d96c8010f821673530d07c37418c4a', 'g1DGlp', '13888888888', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 1608495360, NULL);
INSERT INTO `member` VALUES (4, 0, '0', '13890000099', '479eb0210372f48eb27890936e15bc36', 'mAgMV9', '13890000099', NULL, NULL, 0, 3, NULL, NULL, NULL, NULL, 0, 0, 1, 1608495551, NULL);
INSERT INTO `member` VALUES (5, 4, '0', '18888888888', 'c4f0e77f59372ee8eb8b7743b064e626', 'gcME2b', '18888888888', 'Lucy', '涂抹无聊', 2, 0, 'https://oss.bhy521qm.com/common/8ab56ccb80c424c0cef8e14ab68c717b.jpg', '880', '', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/9eb2b5878ebe8b4842edd52ea8623dd9.jpg\"]', 1, 0, 1, 1608535998, 1614495107);
INSERT INTO `member` VALUES (6, 4, '0', '17777777777', 'df571c226f4379499f939cddcf870b06', 'X07Oi8', '17777777777', '1239999', '阿斯顿发射点', 1, 2, 'https://oss.bhy521qm.com/common/af5e704ec563289102c4c17ab5b8eb48.jpg', 'asdfas2323', '1112', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/d64a0c76d56e30986ee744ba2c0934d1.png\"]', 0, 0, 1, 1608538945, 1614252471);
INSERT INTO `member` VALUES (7, 6, '0', '17777777771', '8c887354a7d45ad9ba6c66ac638e2b8c', 'XT7FCc', '17777777771', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, 0, 0, 1, 1608539026, NULL);
INSERT INTO `member` VALUES (8, 6, '0', '17777777772', 'c0c923b8bb0918a8bbb3e7b825b0ef64', '4BUYA1', '17777777772', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 1, 1608539069, NULL);
INSERT INTO `member` VALUES (9, 6, '0', '17777777773', 'cb5febbc9301493fb91cf745174cc1e5', 'CsYVc5', '17777777773', NULL, NULL, 0, 2, NULL, NULL, NULL, NULL, 0, 0, 1, 1608539160, NULL);
INSERT INTO `member` VALUES (10, 6, '0', '19999999999', 'df571c226f4379499f939cddcf870b06', 'X07Oi8', '19999999999', '奥尼尔', NULL, 2, 2, 'http://192.168.0.168:9501//storage/b0d665975fb65c7147e9b8ad96ca481e.jpg', NULL, NULL, NULL, 0, 0, 1, 1608603604, 1609409403);
INSERT INTO `member` VALUES (13, 6, '0', '13688978888', '7301acb05bb49b208cdb8db81ed8da04', '69oWdP', '13688978888', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 1608869757, NULL);
INSERT INTO `member` VALUES (14, 6, '0', '18888888008', 'e60e430ff5f7eb65d4921b4aa0c722eb', 'zcv5wL', '18888888008', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 1608869926, NULL);
INSERT INTO `member` VALUES (15, 6, '0', '18888888881', '70a1bcb9383c0c75dc7f7c4dec54e3e0', 'Xs3jeR', '18888888881', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 1608870894, NULL);
INSERT INTO `member` VALUES (16, 6, '0', '18888888882', 'e32d00a73c913e18dceba8c3489f6108', 'pzOsJj', '18888888882', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 1608870957, NULL);
INSERT INTO `member` VALUES (17, 6, '0', '18888888883', '6165b4845b1d02bdf5056183a7b928a7', '1pIOz9', '18888888883', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 1608870987, NULL);
INSERT INTO `member` VALUES (18, 6, '0', '15555555551', '9777dace115652fff0fd36fb4405b48e', 'MMZqRp', '15555555551', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 1608871057, NULL);
INSERT INTO `member` VALUES (19, 6, '0', '15555555554', 'fae991268f1bdda17b4eb69deaa1699f', 'gPFsYd', '15555555554', NULL, NULL, 0, 0, 'https://img2.woyaogexing.com/2021/02/03/c5b1c717bba041348287dc997f9802fa!400x400.jpeg', NULL, NULL, NULL, 0, 1, 1, 1608871084, NULL);
INSERT INTO `member` VALUES (20, 6, '0', '18989898988', '9cb49ee8f7df887fe5d954fb7f90385c', '2sbxMi', '18989898988', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 1608871714, NULL);
INSERT INTO `member` VALUES (21, 6, '0', '17777777774', 'e500dfb41117782d0d8d274e811bd9b9', 'dT9Erh', '17777777774', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 1, 1609279475, 1609280175);
INSERT INTO `member` VALUES (22, 6, '0', '16666666666', 'a5b793e33dd3c4481f8d75c4a6293dd1', 'wntPsW', '16666666666', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 1, 1609280922, 1609280985);
INSERT INTO `member` VALUES (23, 0, '666666', '18888888886', 'e07e954e3b35454a6aa78261ef888cf2', 'FK7Ttq', '18888888886', '安抚', NULL, 0, 2, 'https://oss.bhy521qm.com/common/962d84308b5a8b01e32724b7c80ab28a.png', NULL, NULL, NULL, 0, 0, 1, 1609338953, 1609381875);
INSERT INTO `member` VALUES (25, 0, 'D35545', '19999999991', '43d6bc455c48a09fccab7662dce79d0d', '7plhMi', '19999999991', '收到的', NULL, 0, 0, 'https://oss.bhy521qm.com/common/8855b0a98309583cc24d12e87f6c80ab.png', NULL, NULL, NULL, 0, 0, 1, 1609689115, 1614343659);
INSERT INTO `member` VALUES (34, 0, 'D35543', '13710318844', '5c09ff1f5d6c54483c44b91db427728b', 'DvFRv2', '13710318844', '用户D35543', '家伙很懒，什么都没留下。', 0, 0, 'https://oss.bhy521qm.com/common/6397592317809e5d02119b9498886f4f.png', '', '', NULL, 1, 0, 1, 1614342411, 1614605692);
INSERT INTO `member` VALUES (35, 0, 'BA37M638', '17777777778', 'ca87b897349e7614e55617989db4ab17', 'omgVMmqX', '17777777778', '17777777778', '2222', 0, 1, 'https://oss.bhy521qm.com/common/49d0cebb074c3a3a63539d58bbbb9138.png', '', '', NULL, 0, 0, 1, 1614605813, 1614605984);

-- ----------------------------
-- Table structure for member_asset
-- ----------------------------
DROP TABLE IF EXISTS `member_asset`;
CREATE TABLE `member_asset`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` int UNSIGNED NOT NULL,
  `balance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  `score` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '积分',
  `usable_commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '可提佣金',
  `commission` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '佣金',
  `created_at` int UNSIGNED NULL DEFAULT 0,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户资产表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_asset
-- ----------------------------
INSERT INTO `member_asset` VALUES (1, 6, 0.00, 5364.00, 0.00, 203.10, 1608538945, 1609409403);
INSERT INTO `member_asset` VALUES (2, 5, 0.00, 0.00, 0.00, 481.60, 1608539026, 1609279332);
INSERT INTO `member_asset` VALUES (3, 4, 0.00, 0.00, 0.00, 1414.20, 1608539069, 1609409403);
INSERT INTO `member_asset` VALUES (4, 9, 0.00, 0.00, 0.00, 0.00, 1608539160, 0);
INSERT INTO `member_asset` VALUES (5, 10, 0.00, 1838.00, 0.00, 0.00, 1608603604, 0);
INSERT INTO `member_asset` VALUES (8, 13, 0.00, 0.00, 0.00, 0.00, 1608869757, 0);
INSERT INTO `member_asset` VALUES (9, 14, 0.00, 0.00, 0.00, 0.00, 1608869926, 0);
INSERT INTO `member_asset` VALUES (10, 15, 0.00, 0.00, 0.00, 0.00, 1608870894, 0);
INSERT INTO `member_asset` VALUES (11, 16, 0.00, 0.00, 0.00, 0.00, 1608870957, 0);
INSERT INTO `member_asset` VALUES (12, 17, 0.00, 0.00, 0.00, 0.00, 1608870987, 0);
INSERT INTO `member_asset` VALUES (13, 18, 0.00, 0.00, 0.00, 0.00, 1608871057, 0);
INSERT INTO `member_asset` VALUES (14, 19, 0.00, 0.00, 0.00, 0.00, 1608871084, 0);
INSERT INTO `member_asset` VALUES (15, 20, 0.00, 0.00, 0.00, 0.00, 1608871714, 0);
INSERT INTO `member_asset` VALUES (16, 21, 0.00, 0.00, 0.00, 0.00, 1609279475, 0);
INSERT INTO `member_asset` VALUES (17, 22, 0.00, 0.00, 0.00, 0.00, 1609280922, 0);
INSERT INTO `member_asset` VALUES (18, 23, 0.00, 0.00, 0.00, 0.00, 1609338953, 0);
INSERT INTO `member_asset` VALUES (20, 25, 0.00, 0.00, 0.00, 0.00, 1609689115, 0);
INSERT INTO `member_asset` VALUES (21, 32, 0.00, 0.00, 0.00, 0.00, 1614341784, 0);
INSERT INTO `member_asset` VALUES (22, 34, 0.00, 0.00, 0.00, 0.00, 1614342411, 0);
INSERT INTO `member_asset` VALUES (23, 35, 0.00, 0.00, 0.00, 0.00, 1614605813, 0);

-- ----------------------------
-- Table structure for member_asset_log
-- ----------------------------
DROP TABLE IF EXISTS `member_asset_log`;
CREATE TABLE `member_asset_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` int UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `flow` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '0：支出，1：收入',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '变化数字',
  `from_type` enum('active','upgrade','shopping','withdraw','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'other' COMMENT '来源类型',
  `asset_type` enum('score','balance','commission','usdt','btc','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'balance' COMMENT '资产类型',
  `remark` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_withdraw` tinyint(1) NULL DEFAULT 0 COMMENT '是否可提现，计算资产表的可提现资产字段',
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `flow`(`flow`) USING BTREE,
  INDEX `from_type`(`from_type`) USING BTREE,
  INDEX `asset_type`(`asset_type`) USING BTREE,
  INDEX `is_withdraw`(`is_withdraw`) USING BTREE,
  INDEX `created_at`(`created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资产变化记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_asset_log
-- ----------------------------
INSERT INTO `member_asset_log` VALUES (1, 6, 'sadfsaf', 1, 123.00, 'active', 'balance', NULL, 0, 17777122, 0);
INSERT INTO `member_asset_log` VALUES (2, 6, 'asfsadf', 0, 2222.00, 'upgrade', 'commission', 'asdfsadf', 0, 1555555885, 0);
INSERT INTO `member_asset_log` VALUES (3, 6, '佣金提现', 0, 13.00, 'withdraw', 'commission', NULL, 0, 1609166132, 0);
INSERT INTO `member_asset_log` VALUES (4, 6, '提现驳回', 1, 12.00, 'withdraw', 'commission', NULL, 0, 1609173283, 0);
INSERT INTO `member_asset_log` VALUES (5, 5, '1级购卡', 1, 5.00, 'other', 'commission', NULL, 0, 1609204046, 0);
INSERT INTO `member_asset_log` VALUES (6, 5, '1级购卡', 1, 6.00, 'other', 'commission', NULL, 0, 1609204394, 0);
INSERT INTO `member_asset_log` VALUES (7, 5, '1级购卡', 1, 5.00, 'other', 'commission', NULL, 0, 1609204653, 0);
INSERT INTO `member_asset_log` VALUES (8, 5, '1级购卡', 1, 51.06, 'other', 'commission', NULL, 0, 1609204821, 0);
INSERT INTO `member_asset_log` VALUES (9, 4, '2级购卡', 1, 10.12, 'other', 'commission', NULL, 0, 1609205027, 0);
INSERT INTO `member_asset_log` VALUES (10, 5, '激活会员', 1, 0.15, 'other', 'commission', NULL, 0, 1609248531, 0);
INSERT INTO `member_asset_log` VALUES (11, 4, '代理商激活会员', 1, 3.45, 'other', 'commission', NULL, 0, 1609248531, 0);
INSERT INTO `member_asset_log` VALUES (18, 5, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609253296, 0);
INSERT INTO `member_asset_log` VALUES (19, 4, '代理商激活会员', 1, 103.50, 'other', 'commission', NULL, 0, 1609253296, 0);
INSERT INTO `member_asset_log` VALUES (22, 5, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609254142, 0);
INSERT INTO `member_asset_log` VALUES (23, 5, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609254472, 0);
INSERT INTO `member_asset_log` VALUES (24, 5, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609254746, 0);
INSERT INTO `member_asset_log` VALUES (25, 5, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609255416, 0);
INSERT INTO `member_asset_log` VALUES (26, 4, '代理商激活会员', 1, 103.50, 'other', 'commission', NULL, 0, 1609255416, 0);
INSERT INTO `member_asset_log` VALUES (27, 5, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609255652, 0);
INSERT INTO `member_asset_log` VALUES (28, 5, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609255997, 0);
INSERT INTO `member_asset_log` VALUES (29, 5, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609256618, 0);
INSERT INTO `member_asset_log` VALUES (30, 4, '代理商激活会员', 1, 103.50, 'other', 'commission', NULL, 0, 1609256618, 0);
INSERT INTO `member_asset_log` VALUES (31, 4, '2级购卡', 1, 612.72, 'other', 'commission', NULL, 0, 1609256769, 0);
INSERT INTO `member_asset_log` VALUES (32, 5, '会员升级代理商', 1, 351.12, 'other', 'commission', NULL, 0, 1609262219, 0);
INSERT INTO `member_asset_log` VALUES (33, 4, '2级购卡', 1, 306.36, 'other', 'commission', NULL, 0, 1609277926, 0);
INSERT INTO `member_asset_log` VALUES (34, 4, '2级购卡', 1, 92.00, 'other', 'commission', NULL, 0, 1609277933, 0);
INSERT INTO `member_asset_log` VALUES (35, 4, '2级购卡', 1, 46.00, 'other', 'commission', NULL, 0, 1609278215, 0);
INSERT INTO `member_asset_log` VALUES (36, 5, '会员升级代理商', 1, 31.92, 'other', 'commission', NULL, 0, 1609279332, 0);
INSERT INTO `member_asset_log` VALUES (37, 6, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609279726, 0);
INSERT INTO `member_asset_log` VALUES (38, 6, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609279929, 0);
INSERT INTO `member_asset_log` VALUES (39, 6, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609279993, 0);
INSERT INTO `member_asset_log` VALUES (40, 6, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609280180, 0);
INSERT INTO `member_asset_log` VALUES (41, 4, '2级购卡', 1, 138.00, 'other', 'commission', NULL, 0, 1609280885, 0);
INSERT INTO `member_asset_log` VALUES (42, 6, '激活会员', 1, 4.50, 'other', 'commission', NULL, 0, 1609280990, 0);
INSERT INTO `member_asset_log` VALUES (43, 6, '会员升级代理商', 1, 8.00, 'upgrade', 'commission', NULL, 0, 1609409403, 0);
INSERT INTO `member_asset_log` VALUES (44, 4, '间接升级代理商', 1, 2.00, 'upgrade', 'commission', NULL, 0, 1609409403, 0);
INSERT INTO `member_asset_log` VALUES (45, 10, '购物赠送积分', 1, 1838.00, 'shopping', 'score', NULL, 0, 1609410626, 0);
INSERT INTO `member_asset_log` VALUES (46, 6, '购物赠送积分', 1, 1838.00, 'shopping', 'score', NULL, 0, 1609419921, 0);
INSERT INTO `member_asset_log` VALUES (47, 6, '购物赠送积分', 1, 1838.00, 'shopping', 'score', NULL, 0, 1609420017, 0);
INSERT INTO `member_asset_log` VALUES (48, 6, '购物赠送积分', 1, 1688.00, 'shopping', 'score', NULL, 0, 1609682943, 0);

-- ----------------------------
-- Table structure for member_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `member_bank_card`;
CREATE TABLE `member_bank_card`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` int UNSIGNED NOT NULL,
  `bank_type` enum('ICBC','CCB','HSBC','BC','ABC','BC','CMB','CITIC','CEB','HB','CIB') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户银行卡表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_bank_card
-- ----------------------------
INSERT INTO `member_bank_card` VALUES (1, 6, 'ICBC', '湖北指揮', 'sadfbbb', '5555577777', 11212, 1608826951);
INSERT INTO `member_bank_card` VALUES (2, 6, 'ABC', '阿斯顿发斯蒂芬asdfsadf', '阿斯蒂芬', '15675675675', 232323, 1608826923);
INSERT INTO `member_bank_card` VALUES (4, 6, 'HSBC', '暗示法萨芬', '碍事法师', '12123123', 123123, 0);
INSERT INTO `member_bank_card` VALUES (5, 6, 'BC', '阿斯顿发斯蒂芬', '阿斯顿发斯蒂芬', '32423423', 234234, 0);
INSERT INTO `member_bank_card` VALUES (6, 6, 'ICBC', 'asfsadfasd', 'asdfsadf', '112121111222', 1608826821, 0);
INSERT INTO `member_bank_card` VALUES (7, 11, 'ABC', '湖南支行', '张小龙', '6665656565666666', 1608868797, 1608868802);

-- ----------------------------
-- Table structure for member_realnameauth
-- ----------------------------
DROP TABLE IF EXISTS `member_realnameauth`;
CREATE TABLE `member_realnameauth`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` int UNSIGNED NULL DEFAULT 0,
  `real_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `cred_type` tinyint(1) NULL DEFAULT 1 COMMENT '证件类型（1：身份证 ，2：护照，3：学生证）',
  `cred_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hand_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手持身份证照片',
  `state` tinyint(1) NULL DEFAULT 0 COMMENT '状态（0：未认证，1：认证通过，-1：认证失败）',
  `thirty_data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '第三方认证数据',
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户实名认证表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_realnameauth
-- ----------------------------
INSERT INTO `member_realnameauth` VALUES (1, 25, 'safsad', 1, 'safx12313123', NULL, 0, '', 1599999999, 0);
INSERT INTO `member_realnameauth` VALUES (2, 34, '阿发66', 1, '23423423423423423488', 'https://oss.bhy521qm.com/common/22943d44ebedb3b23bb27a70e9a08800.jpg', 1, '', 1614349177, 1614481719);
INSERT INTO `member_realnameauth` VALUES (3, 5, '张小1', 1, '55555555555555555555', 'https://oss.bhy521qm.com/common/4fa07ca62ecae4ba6a8430d9191e7c8d.jpeg', 1, '', 1614484131, 1614484292);

-- ----------------------------
-- Table structure for member_shopaddress
-- ----------------------------
DROP TABLE IF EXISTS `member_shopaddress`;
CREATE TABLE `member_shopaddress`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` int UNSIGNED NOT NULL,
  `contact_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `house_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门牌号',
  `is_default` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `isdefault`(`is_default`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收货地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_shopaddress
-- ----------------------------
INSERT INTO `member_shopaddress` VALUES (2, 6, '阿士大夫撒地方', '15555888888', NULL, '南港大街17号', '232323', 0, 155555, 1608825702);
INSERT INTO `member_shopaddress` VALUES (3, 7, 'asdfasdf', '15555577777', NULL, '广东省佛山市南海区南海大道北88', '23223', 0, 1608808036, 1608810482);
INSERT INTO `member_shopaddress` VALUES (4, 6, '大撒旦發生', '17777777777', NULL, '广东省佛山市南海区南新三路2号', 'asdfasdfadf', 0, 1608811030, 1608812157);
INSERT INTO `member_shopaddress` VALUES (7, 21, '刘小姐', '18888888888', NULL, '云南省大连市', '121号', 1, 1609279713, 0);
INSERT INTO `member_shopaddress` VALUES (8, 22, '撒网无', '15555555555', NULL, '少时诵诗书所所', '暗示法撒旦法大', 1, 1609280978, 0);
INSERT INTO `member_shopaddress` VALUES (9, 23, '1555555555', '15555555555', NULL, '阿士大夫撒发斯蒂芬', 'asfsa', 1, 1609394375, 0);
INSERT INTO `member_shopaddress` VALUES (10, 6, 'asdfasdfas', '15555555555', '上海市', 'sadfasdfasdf', NULL, 1, 1609682799, 1609682834);

-- ----------------------------
-- Table structure for member_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `member_withdraw`;
CREATE TABLE `member_withdraw`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` int UNSIGNED NOT NULL,
  `money` decimal(10, 2) UNSIGNED NULL DEFAULT NULL,
  `bank_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0：待审核，1：审核通过，-1：拒绝',
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '申请提现表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_withdraw
-- ----------------------------
INSERT INTO `member_withdraw` VALUES (1, 1, 1999.00, '{\"bank_name\":\"\\u62db\\u5546\\u94f6\\u884c\",\"bank_username\":\"\\u5f20\\u5c0f\\u9f99\",\"bank_no\":\"66666666\"}\r\n', 1, 166666666, 1608106740);
INSERT INTO `member_withdraw` VALUES (3, 6, 12.00, '{\"bank_type\":\"ICBC\",\"bank_name\":\"\\u6e56\\u5317\\u6307\\u63ee\",\"bank_username\":\"sadfbbb\",\"bank_no\":\"5555577777\"}', -1, 1609159790, 1609173283);
INSERT INTO `member_withdraw` VALUES (4, 6, 13.00, '{\"bank_type\":\"ICBC\",\"bank_name\":\"\\u6e56\\u5317\\u6307\\u63ee\",\"bank_username\":\"sadfbbb\",\"bank_no\":\"5555577777\"}', 1, 1609166132, 1609173353);

-- ----------------------------
-- Table structure for message_push
-- ----------------------------
DROP TABLE IF EXISTS `message_push`;
CREATE TABLE `message_push`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息推送表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message_push
-- ----------------------------
INSERT INTO `message_push` VALUES (4, '刊登蔡英文“穿龙袍”封面被民进党“抹红”', '最新一期《亚洲周刊》以台当局领导人蔡英文为封面，专题报道“台湾民选独裁幕后”。台湾“中时新闻网”12月25日报道称，民进党发言人颜若芳对此声称，“这个媒体过去就有很大争议，立场亲共，专为北京政府喉舌…毫无评论的价值”云云。', 1608879160);
INSERT INTO `message_push` VALUES (5, '社科院：中国银行业利润畸高 可向实体让利近万亿元', '中国金融行业是 “高盈利、高薪酬、高纳税”三高行业，高薪酬和高纳税的支撑是高盈利。金融业的高盈利主要来自银行，银行的高盈利背后有合理的成分，也有不合理的成分。不合理成分主要是住房抵押贷款利率缺乏竞争，以及地方政府融资平台主导的基础设施建设过度依赖银行信贷。', 1608879323);
INSERT INTO `message_push` VALUES (6, '广汽本田/东风本田召回百万辆缺陷汽车', '召回2019年1月3日至2019年11月9日期间生产的部分国产哥瑞(GREIZ)、竞瑞(GIENIA)、杰德(JADE)、思域(CIVIC)、享域(ENVIX)、INSPIRE、炫威(XR-V)、思威(CR-V)、优威(UR-V)、艾力绅(ELYSION)系列汽车，共计552026辆。', 1608879355);
INSERT INTO `message_push` VALUES (7, '马斯克：SpaceX星链互联网业务或在合适时机上市', '特斯拉股票21日被纳入标准普尔500指数(S&P 500)，其股价今年迄今已飙升7倍。彭博亿万富翁指数显示，今年马斯克的净资产增加了1322亿美元，达到1597亿美元，令其成为世界上第二大富豪。', 1608879378);
INSERT INTO `message_push` VALUES (8, 'tesasfsadf', 'asfasdf', 1609406642);
INSERT INTO `message_push` VALUES (9, 'tesasfsadf', 'asfasdf', 1609406691);
INSERT INTO `message_push` VALUES (10, 'sdafasf', 'safsaf', 1609406698);
INSERT INTO `message_push` VALUES (11, 'asfsadf', 'asdfasdf', 1609406750);
INSERT INTO `message_push` VALUES (12, 'c测试', '撒大声地发送', 1609437985);
INSERT INTO `message_push` VALUES (14, 'as\'f发按时', '所发生的范德萨sa', 1609438260);
INSERT INTO `message_push` VALUES (15, '23234234', '23423423423', 1609438358);
INSERT INTO `message_push` VALUES (19, 'bbbb', 'bbadsfasdfas', 1610280429);

-- ----------------------------
-- Table structure for online_shop_category
-- ----------------------------
DROP TABLE IF EXISTS `online_shop_category`;
CREATE TABLE `online_shop_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int UNSIGNED NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thumb_id` int NOT NULL DEFAULT 0,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `thumbid`(`thumb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_shop_category
-- ----------------------------
INSERT INTO `online_shop_category` VALUES (4, 0, '电器', 0, 1607969652, 0);
INSERT INTO `online_shop_category` VALUES (5, 0, '数码', 0, 1607978844, 0);
INSERT INTO `online_shop_category` VALUES (6, 0, '服装', 0, 1607978852, 0);

-- ----------------------------
-- Table structure for online_shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `online_shop_goods`;
CREATE TABLE `online_shop_goods`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `short_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短标题',
  `cate_id` int UNSIGNED NULL DEFAULT 0 COMMENT '分类',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情描述',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `morepic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '多图',
  `is_recommend` tinyint(1) NULL DEFAULT 0 COMMENT '推荐商品',
  `is_hot` tinyint(1) NULL DEFAULT 0 COMMENT '热门商品',
  `stock` int NULL DEFAULT 0 COMMENT '库存',
  `state` tinyint(1) NULL DEFAULT 0 COMMENT '状态【0：未上架，1：上架】',
  `deleted_at` int UNSIGNED NULL DEFAULT 0,
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cateid`(`cate_id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_shop_goods
-- ----------------------------
INSERT INTO `online_shop_goods` VALUES (2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 5, 108.00, '<p>&nbsp;<img src=\"http://192.168.0.168:9501/storage/68bdb18cbdcd69fb2e97b106b93f8683.png\" style=\"max-width: 100%;\"></p>', 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', '[\"http:\\/\\/192.168.0.168:9501\\/storage\\/5dc6850a856ad1215253d820714c8bc8.png\",\"http:\\/\\/192.168.0.168:9501\\/storage\\/6d7f1274bc2b767ed53322e351047e4b.png\"]', 0, 0, 0, 1, 0, 1607987561, 1609125274);
INSERT INTO `online_shop_goods` VALUES (3, '净水壶滤芯 新升级标准版三代滤芯12枚', '三代滤芯12枚', 4, 101.00, '<p>&nbsp;<img src=\"http://192.168.0.168:9501/storage/ef1ffc28386e8ccd21e821a1cceb2ce6.png\" style=\"max-width: 100%;\"></p>', 'http://192.168.0.168:9501/storage/acd4782aedd7c18ce4da44385ab2d0ae.png', '[\"http:\\/\\/192.168.0.168:9501\\/\\/storage\\/0a1351b9fcae358d48c206b9bc4ecfad.png\",\"http:\\/\\/192.168.0.168:9501\\/\\/storage\\/5bc8d31da64608b938c5eae7442a38b5.png\"]', 1, 0, 0, 1, 0, 1607987656, 1609125966);
INSERT INTO `online_shop_goods` VALUES (4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 4, 500.00, '<p>按时发发安抚阿斯蒂芬</p><p><br></p><p><img src=\"http://192.168.0.168:9501/storage/17c27bd705d77e5232aeb45102a8c2e7.png\" style=\"max-width:100%;\"><br></p>', 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', '[\"http:\\/\\/192.168.0.168:9501\\/\\/storage\\/d73d2f80fefba381933d8a8671f33654.jpg\",\"http:\\/\\/192.168.0.168:9501\\/\\/storage\\/963b6620578d84d1719714ac6f8e557a.png\"]', 0, 0, 0, 1, 0, 1607987693, 1609329802);
INSERT INTO `online_shop_goods` VALUES (5, '净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', '过滤器1283', 4, 1688.00, '<p>&nbsp;<img src=\"http://192.168.0.168:9501/storage/4656a22af4809b7c23c7aab92b4b630b.png\" style=\"max-width: 100%;\"></p>', 'http://192.168.0.168:9501/storage/41aefde6184a8e19d767a87967840ba0.png', '[\"http:\\/\\/192.168.0.168:9501\\/storage\\/da65f64c7fbde38fd2e15b47eb203608.png\"]', 1, 1, 0, 1, 0, 1608003740, 1609125398);
INSERT INTO `online_shop_goods` VALUES (6, 'd啊沙發沙發案説法發生', '啊書法大賽', 4, 2222.00, '<p>阿斯蒂芬撒旦發順豐</p>', 'http://192.168.0.168:9501/storage/98d392722f7fd9b0d0111b1b6933d390.png', 'null', 0, 0, 0, 1, 0, 1609329770, 0);

-- ----------------------------
-- Table structure for online_shop_goods_resource
-- ----------------------------
DROP TABLE IF EXISTS `online_shop_goods_resource`;
CREATE TABLE `online_shop_goods_resource`  (
  `id` int NOT NULL,
  `goods_id` int UNSIGNED NOT NULL,
  `types` enum('thumb','carousel') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'thumb' COMMENT '缩略图、轮播图',
  `file_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodsid`(`goods_id`) USING BTREE,
  INDEX `filesid`(`file_id`) USING BTREE,
  INDEX `types`(`types`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品资源素材表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_shop_goods_resource
-- ----------------------------

-- ----------------------------
-- Table structure for online_shop_order
-- ----------------------------
DROP TABLE IF EXISTS `online_shop_order`;
CREATE TABLE `online_shop_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ordersn` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total_fee` decimal(10, 2) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单标题',
  `mid` int UNSIGNED NULL DEFAULT NULL,
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `express` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递信息',
  `total` int NULL DEFAULT 1 COMMENT '数量',
  `remark` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '状态【0：未付款，1：待发货，2：待收货，3：已完成，4：售后】',
  `deleted_at` int UNSIGNED NULL DEFAULT 0,
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `ordersn`(`ordersn`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_shop_order
-- ----------------------------
INSERT INTO `online_shop_order` VALUES (2, 'ZH202012292122396468072981', 155.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 1, 0, 1609248159, 1609248159);
INSERT INTO `online_shop_order` VALUES (3, 'ZH202012292124206667491830', 155.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 1, 0, 1609248260, 1609248260);
INSERT INTO `online_shop_order` VALUES (4, 'ZH202012292126466969787979', 5257.00, '水杯男透明随手杯大容量户外运动旅行,净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 5, '', 1, 0, 1609248406, 1609248406);
INSERT INTO `online_shop_order` VALUES (5, 'ZH202012292128516456410850', 155.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 1, 0, 1609248531, 1609248531);
INSERT INTO `online_shop_order` VALUES (8, 'ZH202012292230286967590962', 301.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 3, 'sadfasdf啊手動閥手動閥搜索', 1, 0, 1609252228, 1609252228);
INSERT INTO `online_shop_order` VALUES (9, 'ZH202012292232456049029769', 371.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 3, '', 1, 0, 1609252365, 1609252365);
INSERT INTO `online_shop_order` VALUES (10, 'ZH202012292234376359061510', 188.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 1, 0, 1609252477, 1609252477);
INSERT INTO `online_shop_order` VALUES (11, 'ZH202012292236036046082215', 301.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 3, '', 1, 0, 1609252563, 1609252563);
INSERT INTO `online_shop_order` VALUES (12, 'ZH202012292239396394846812', 371.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 3, '', 1, 0, 1609252779, 1609252779);
INSERT INTO `online_shop_order` VALUES (13, 'ZH202012292246126038790077', 296.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 2, '', 1, 0, 1609253172, 1609253172);
INSERT INTO `online_shop_order` VALUES (14, 'ZH202012292248166039408685', 263.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 2, '', 1, 0, 1609253296, 1609253296);
INSERT INTO `online_shop_order` VALUES (15, 'ZH202012292252506171077834', 409.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 4, '', 1, 0, 1609253570, 1609253570);
INSERT INTO `online_shop_order` VALUES (16, 'ZH202012292259456097937626', 263.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 2, '', 1, 0, 1609253985, 1609253985);
INSERT INTO `online_shop_order` VALUES (17, 'ZH202012292302226189337359', 263.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 2, '', 1, 0, 1609254142, 1609254142);
INSERT INTO `online_shop_order` VALUES (18, 'ZH202012292307526790063205', 263.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 2, '', 1, 0, 1609254472, 1609254472);
INSERT INTO `online_shop_order` VALUES (19, 'ZH202012292312266786406422', 263.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 2, '', 1, 0, 1609254746, 1609254746);
INSERT INTO `online_shop_order` VALUES (20, 'ZH202012292323366218000211', 263.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916,水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 2, '', 1, 0, 1609255416, 1609255416);
INSERT INTO `online_shop_order` VALUES (21, 'ZH202012292327326360271898', 155.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 1, 0, 1609255652, 1609255652);
INSERT INTO `online_shop_order` VALUES (22, 'ZH202012292333176885114727', 155.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 1, 0, 1609255997, 1609255997);
INSERT INTO `online_shop_order` VALUES (23, 'ZH202012292343336567870019', 155.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 1, 0, 1609256613, 1609256613);
INSERT INTO `online_shop_order` VALUES (24, 'ZH202012292344286575358415', 188.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 3, 0, 1609256668, 1609419393);
INSERT INTO `online_shop_order` VALUES (25, 'ZH202012292344386974964632', 188.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 1, 0, 1609256678, 1609256678);
INSERT INTO `online_shop_order` VALUES (26, 'ZH202012292344406604920292', 188.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 1, 0, 1609256680, 1609256680);
INSERT INTO `online_shop_order` VALUES (27, 'ZH202012292344426968531850', 188.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 3, 0, 1609256682, 1609256682);
INSERT INTO `online_shop_order` VALUES (28, 'ZH202012292344456378757882', 188.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":2,\"mid\":6,\"contact_name\":\"\\u963f\\u58eb\\u5927\\u592b\\u6492\\u5730\\u65b9\",\"mobile\":\"15555888888\",\"', NULL, 1, '', 1, 0, 1609256685, 1609256685);
INSERT INTO `online_shop_order` VALUES (29, 'ZH2020123006084121951408569', 188.00, '水杯男透明随手杯大容量户外运动旅行', 21, '{\"id\":7,\"mid\":21,\"contact_name\":\"\\u5218\\u5c0f\\u59d0\",\"mobile\":\"18888888888\",\"address\":\"\\u4e91\\u5357\\', NULL, 1, '', 1, 0, 1609279721, 1609279721);
INSERT INTO `online_shop_order` VALUES (30, 'ZH2020123006120421073118877', 188.00, '水杯男透明随手杯大容量户外运动旅行', 21, '{\"id\":7,\"mid\":21,\"contact_name\":\"\\u5218\\u5c0f\\u59d0\",\"mobile\":\"18888888888\",\"address\":\"\\u4e91\\u5357\\', NULL, 1, '', 1, 0, 1609279924, 1609279924);
INSERT INTO `online_shop_order` VALUES (31, 'ZH2020123006130821936571067', 188.00, '水杯男透明随手杯大容量户外运动旅行', 21, '{\"id\":7,\"mid\":21,\"contact_name\":\"\\u5218\\u5c0f\\u59d0\",\"mobile\":\"18888888888\",\"address\":\"\\u4e91\\u5357\\', NULL, 1, '', 1, 0, 1609279988, 1609279988);
INSERT INTO `online_shop_order` VALUES (32, 'ZH2020123006161521409654400', 188.00, '水杯男透明随手杯大容量户外运动旅行', 21, '{\"id\":7,\"mid\":21,\"contact_name\":\"\\u5218\\u5c0f\\u59d0\",\"mobile\":\"18888888888\",\"address\":\"\\u4e91\\u5357\\', NULL, 1, '', 1, 0, 1609280175, 1609280175);
INSERT INTO `online_shop_order` VALUES (33, 'ZH2020123006294522258890483', 38.00, '水杯男透明随手杯大容量户外运动旅行', 22, '{\"id\":8,\"mid\":22,\"contact_name\":\"\\u6492\\u7f51\\u65e0\",\"mobile\":\"15555555555\",\"address\":\"\\u5c11\\u65f6\\', NULL, 1, '', 1, 0, 1609280985, 1609280985);
INSERT INTO `online_shop_order` VALUES (43, 'ZH2020123113594123213876069', 258.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', 23, '{\"id\":9,\"mid\":23,\"contact_name\":\"1555555555\",\"mobile\":\"15555555555\",\"address\":\"\\u963f\\u58eb\\u5927\\u5', NULL, 1, '', 0, 0, 1609394381, 0);
INSERT INTO `online_shop_order` VALUES (48, 'ZH2020123114152224651678260', 108.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', 24, '{\"id\":9,\"mid\":23,\"contact_name\":\"1555555555\",\"mobile\":\"15555555555\",\"address\":\"\\u963f\\u58eb\\u5927\\u5', NULL, 1, '', 1, 0, 1609395322, 1609395322);
INSERT INTO `online_shop_order` VALUES (49, 'ZH202012311758396159868392', 150.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":4,\"mid\":6,\"contact_name\":\"\\u5927\\u6492\\u65e6\\u767c\\u751f\",\"mobile\":\"17777777777\",\"address\":\"\\u', NULL, 1, '', 1, 0, 1609408719, 1609408719);
INSERT INTO `online_shop_order` VALUES (50, 'ZH2020123118302610289910173', 1838.00, '净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', 10, '{\"id\":4,\"mid\":6,\"contact_name\":\"\\u5927\\u6492\\u65e6\\u767c\\u751f\",\"mobile\":\"17777777777\",\"address\":\"\\u', NULL, 1, '', 0, 0, 1609410626, 0);
INSERT INTO `online_shop_order` VALUES (51, 'ZH202012312105216274795457', 1838.00, '净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', 6, '{\"id\":4,\"mid\":6,\"contact_name\":\"\\u5927\\u6492\\u65e6\\u767c\\u751f\",\"mobile\":\"17777777777\",\"address\":\"\\u5e7f\\u4e1c\\u7701\\u4f5b\\u5c71\\u5e02\\u5357\\u6d77\\u533a\\u5357\\u65b0\\u4e09\\u8def2\\u53f7\",\"house_number\":', NULL, 1, '', 1, 0, 1609419921, 0);
INSERT INTO `online_shop_order` VALUES (52, 'ZH202012312106576654840018', 1838.00, '净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', 6, '{\"id\":4,\"mid\":6,\"contact_name\":\"\\u5927\\u6492\\u65e6\\u767c\\u751f\",\"mobile\":\"17777777777\",\"address\":\"\\u5e7f\\u4e1c\\u7701\\u4f5b\\u5c71\\u5e02\\u5357\\u6d77\\u533a\\u5357\\u65b0\\u4e09\\u8def2\\u53f7\",\"house_number\":\"asdfasdfadf\",\"is_default\":1,\"created_at\":1608811030,\"updated_at\":1608812157}', '中通快递 1000000000001122', 1, 'asfasfasfa11111', 2, 0, 1609420017, 0);
INSERT INTO `online_shop_order` VALUES (53, 'ZH202101032209036397130379', 1688.00, '净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', 6, '{\"id\":10,\"mid\":6,\"contact_name\":\"asdfasdfas\",\"mobile\":\"15555555555\",\"province\":\"\\u4e0a\\u6d77\\u5e02\",\"address\":\"sadfasdfasdf\",\"house_number\":null,\"is_default\":1,\"created_at\":1609682799,\"updated_at\":1609682834}', NULL, 1, '', 0, 0, 1609682943, 0);
INSERT INTO `online_shop_order` VALUES (55, 'ZH202101032316026045720319', 358.00, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', 6, '{\"id\":10,\"mid\":6,\"contact_name\":\"asdfasdfas\",\"mobile\":\"15555555555\",\"province\":\"\\u4e0a\\u6d77\\u5e02\",\"address\":\"sadfasdfasdf\",\"house_number\":null,\"is_default\":1,\"created_at\":1609682799,\"updated_at\":1609682834}', NULL, 1, '', 0, 0, 1609686962, 0);
INSERT INTO `online_shop_order` VALUES (57, 'ZH202101032318376933214538', 750.00, '水杯男透明随手杯大容量户外运动旅行', 6, '{\"id\":10,\"mid\":6,\"contact_name\":\"asdfasdfas\",\"mobile\":\"15555555555\",\"province\":\"\\u4e0a\\u6d77\\u5e02\",\"address\":\"sadfasdfasdf\",\"house_number\":null,\"is_default\":1,\"created_at\":1609682799,\"updated_at\":1609682834}', NULL, 1, '', 1, 0, 1609687117, 0);

-- ----------------------------
-- Table structure for online_shop_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `online_shop_order_goods`;
CREATE TABLE `online_shop_order_goods`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NULL DEFAULT NULL,
  `goods_id` int UNSIGNED NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `short_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL,
  `thumb` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `quantity` int UNSIGNED NULL DEFAULT 1,
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderid`(`order_id`) USING BTREE,
  INDEX `goodsid`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of online_shop_order_goods
-- ----------------------------
INSERT INTO `online_shop_order_goods` VALUES (3, 2, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609248159);
INSERT INTO `online_shop_order_goods` VALUES (4, 3, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609248260);
INSERT INTO `online_shop_order_goods` VALUES (5, 4, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 2, 1609248406);
INSERT INTO `online_shop_order_goods` VALUES (6, 4, 5, '净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', '过滤器1283', 1688.00, 'http://192.168.0.168:9501/storage/41aefde6184a8e19d767a87967840ba0.png', 3, 1609248406);
INSERT INTO `online_shop_order_goods` VALUES (7, 5, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609248531);
INSERT INTO `online_shop_order_goods` VALUES (12, 8, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609252228);
INSERT INTO `online_shop_order_goods` VALUES (13, 8, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 2, 1609252228);
INSERT INTO `online_shop_order_goods` VALUES (14, 9, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 2, 1609252365);
INSERT INTO `online_shop_order_goods` VALUES (15, 9, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609252365);
INSERT INTO `online_shop_order_goods` VALUES (16, 10, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609252477);
INSERT INTO `online_shop_order_goods` VALUES (17, 11, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609252563);
INSERT INTO `online_shop_order_goods` VALUES (18, 11, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 2, 1609252563);
INSERT INTO `online_shop_order_goods` VALUES (19, 12, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 2, 1609252779);
INSERT INTO `online_shop_order_goods` VALUES (20, 12, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609252779);
INSERT INTO `online_shop_order_goods` VALUES (21, 13, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609253172);
INSERT INTO `online_shop_order_goods` VALUES (22, 13, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609253172);
INSERT INTO `online_shop_order_goods` VALUES (23, 14, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609253296);
INSERT INTO `online_shop_order_goods` VALUES (24, 14, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609253296);
INSERT INTO `online_shop_order_goods` VALUES (25, 15, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 2, 1609253570);
INSERT INTO `online_shop_order_goods` VALUES (26, 15, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 2, 1609253570);
INSERT INTO `online_shop_order_goods` VALUES (27, 16, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609253985);
INSERT INTO `online_shop_order_goods` VALUES (28, 16, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609253985);
INSERT INTO `online_shop_order_goods` VALUES (29, 17, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609254142);
INSERT INTO `online_shop_order_goods` VALUES (30, 17, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609254142);
INSERT INTO `online_shop_order_goods` VALUES (31, 18, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609254472);
INSERT INTO `online_shop_order_goods` VALUES (32, 18, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609254472);
INSERT INTO `online_shop_order_goods` VALUES (33, 19, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609254746);
INSERT INTO `online_shop_order_goods` VALUES (34, 19, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609254746);
INSERT INTO `online_shop_order_goods` VALUES (35, 20, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609255416);
INSERT INTO `online_shop_order_goods` VALUES (36, 20, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609255416);
INSERT INTO `online_shop_order_goods` VALUES (37, 21, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609255652);
INSERT INTO `online_shop_order_goods` VALUES (38, 22, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609255997);
INSERT INTO `online_shop_order_goods` VALUES (39, 23, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609256613);
INSERT INTO `online_shop_order_goods` VALUES (40, 24, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609256668);
INSERT INTO `online_shop_order_goods` VALUES (41, 25, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609256678);
INSERT INTO `online_shop_order_goods` VALUES (42, 26, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609256680);
INSERT INTO `online_shop_order_goods` VALUES (43, 27, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609256682);
INSERT INTO `online_shop_order_goods` VALUES (44, 28, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609256685);
INSERT INTO `online_shop_order_goods` VALUES (45, 29, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609279721);
INSERT INTO `online_shop_order_goods` VALUES (46, 30, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609279924);
INSERT INTO `online_shop_order_goods` VALUES (47, 31, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609279988);
INSERT INTO `online_shop_order_goods` VALUES (48, 32, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609280175);
INSERT INTO `online_shop_order_goods` VALUES (49, 33, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 38.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609280985);
INSERT INTO `online_shop_order_goods` VALUES (59, 43, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609394381);
INSERT INTO `online_shop_order_goods` VALUES (64, 48, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609395322);
INSERT INTO `online_shop_order_goods` VALUES (65, 49, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 500.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609408719);
INSERT INTO `online_shop_order_goods` VALUES (66, 50, 5, '净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', '过滤器1283', 1688.00, 'http://192.168.0.168:9501/storage/41aefde6184a8e19d767a87967840ba0.png', 1, 1609410626);
INSERT INTO `online_shop_order_goods` VALUES (67, 51, 5, '净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', '过滤器1283', 1688.00, 'http://192.168.0.168:9501/storage/41aefde6184a8e19d767a87967840ba0.png', 1, 1609419921);
INSERT INTO `online_shop_order_goods` VALUES (68, 52, 5, '净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', '过滤器1283', 1688.00, 'http://192.168.0.168:9501/storage/41aefde6184a8e19d767a87967840ba0.png', 1, 1609420017);
INSERT INTO `online_shop_order_goods` VALUES (69, 53, 5, '净水器家用厨房超滤直饮厨下式净水机自来水前置过滤器1283', '过滤器1283', 1688.00, 'http://192.168.0.168:9501/storage/41aefde6184a8e19d767a87967840ba0.png', 1, 1609682943);
INSERT INTO `online_shop_order_goods` VALUES (71, 55, 2, '家用直饮RO反渗透 600G无桶大通量纯水机KRL3916', '无桶大通量纯水机KRL3916', 108.00, 'http://192.168.0.168:9501/storage/a481ca183c538238ee37deb26940b064.png', 1, 1609686962);
INSERT INTO `online_shop_order_goods` VALUES (73, 57, 4, '水杯男透明随手杯大容量户外运动旅行', '学生水杯子', 500.00, 'http://192.168.0.168:9501/storage/900746ed2667b62e22ff253085580b71.png', 1, 1609687117);

-- ----------------------------
-- Table structure for payment_log
-- ----------------------------
DROP TABLE IF EXISTS `payment_log`;
CREATE TABLE `payment_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `provider` enum('alipay','wechat','union','offline','assets','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'alipay' COMMENT '支付方式【支付宝、微信、银联，线下，钱包】',
  `ordersn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台唯一订单号',
  `out_trade_no` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存方第三方平台订单号',
  `total_fee` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '总价【人民币】',
  `callback` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付成功回调业务类带命名空间，类必须有run方法',
  `order_id` int UNSIGNED NULL DEFAULT 0 COMMENT '关联业务表ID',
  `user_id` int UNSIGNED NULL DEFAULT 0 COMMENT '关联用户表示ID',
  `extra` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '额外自定义参数，支付宝biz_content 微信attach',
  `notify_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通知数据',
  `state` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否执行回调',
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `provider`(`provider`) USING BTREE,
  INDEX `ordersn`(`ordersn`) USING BTREE,
  INDEX `outtradeno`(`out_trade_no`) USING BTREE,
  INDEX `orderid`(`order_id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_log
-- ----------------------------
INSERT INTO `payment_log` VALUES (18, 'alipay', 'ZH202012290702246597509914', 'ZH202012290702246597509914', 666.00, '\\App\\Logic\\App\\PayNotifyLogic', 22, 0, 'coupon', NULL, 0, 1609196544, 0);
INSERT INTO `payment_log` VALUES (19, 'alipay', 'ZH202012290702486760399870', 'ZH202012290702486760399870', 200.00, '\\App\\Logic\\App\\PayNotifyLogic', 23, 0, 'coupon', NULL, 0, 1609196568, 0);
INSERT INTO `payment_log` VALUES (20, 'alipay', 'ZH202012290703286607324119', 'ZH202012290703286607324119', 200.00, '\\App\\Logic\\App\\PayNotifyLogic', 24, 0, 'coupon', NULL, 0, 1609196608, 0);
INSERT INTO `payment_log` VALUES (21, 'offline', 'ZH202012290705206374624963', 'ZH202012290705206374624963', 666.00, '\\App\\Logic\\App\\PayNotifyLogic', 25, 0, 'coupon', NULL, 1, 1609196720, 1609196720);
INSERT INTO `payment_log` VALUES (22, 'offline', 'ZH202012290707236329929196', 'ZH202012290707236329929196', 200.00, '\\App\\Logic\\App\\PayNotifyLogic', 26, 0, 'coupon', NULL, 1, 1609196843, 1609196843);
INSERT INTO `payment_log` VALUES (23, 'offline', 'ZH202012290707336625252925', 'ZH202012290707336625252925', 666.00, '\\App\\Logic\\App\\PayNotifyLogic', 27, 0, 'coupon', NULL, 1, 1609196853, 1609196853);
INSERT INTO `payment_log` VALUES (24, 'offline', 'ZH202012290709146504858307', 'ZH202012290709146504858307', 666.00, '\\App\\Logic\\App\\PayNotifyLogic', 28, 0, 'coupon', NULL, 1, 1609196954, 1609196954);
INSERT INTO `payment_log` VALUES (25, 'offline', 'ZH202012290709316189490550', 'ZH202012290709316189490550', 200.00, '\\App\\Logic\\App\\PayNotifyLogic', 29, 0, 'coupon', NULL, 1, 1609196971, 1609196971);
INSERT INTO `payment_log` VALUES (26, 'offline', 'ZH202012290709446536587676', 'ZH202012290709446536587676', 666.00, '\\App\\Logic\\App\\PayNotifyLogic', 30, 0, 'coupon', NULL, 1, 1609196984, 1609196984);
INSERT INTO `payment_log` VALUES (27, 'offline', 'ZH202012290713026274496966', 'ZH202012290713026274496966', 666.00, '\\App\\Logic\\App\\PayNotifyLogic', 31, 0, 'coupon', NULL, 1, 1609197182, 1609197182);
INSERT INTO `payment_log` VALUES (28, 'offline', 'ZH202012290713316170878937', 'ZH202012290713316170878937', 200.00, '\\App\\Logic\\App\\PayNotifyLogic', 32, 0, 'coupon', NULL, 1, 1609197211, 1609197211);
INSERT INTO `payment_log` VALUES (29, 'offline', 'ZH202012290715376070564523', 'ZH202012290715376070564523', 111.00, '\\App\\Logic\\App\\PayNotifyLogic', 33, 0, 'coupon', NULL, 1, 1609197337, 1609197337);
INSERT INTO `payment_log` VALUES (30, 'offline', 'ZH202012290906486724060264', 'ZH202012290906486724060264', 666.00, '\\App\\Logic\\App\\PayNotifyLogic', 34, 0, 'coupon', NULL, 1, 1609204008, 1609204008);
INSERT INTO `payment_log` VALUES (31, 'offline', 'ZH202012290907266735927666', 'ZH202012290907266735927666', 300.00, '\\App\\Logic\\App\\PayNotifyLogic', 35, 0, 'coupon', NULL, 1, 1609204046, 1609204046);
INSERT INTO `payment_log` VALUES (32, 'offline', 'ZH202012290913146071032686', 'ZH202012290913146071032686', 300.00, '\\App\\Logic\\App\\PayNotifyLogic', 36, 0, 'coupon', NULL, 1, 1609204394, 1609204394);
INSERT INTO `payment_log` VALUES (33, 'offline', 'ZH202012290917326998327603', 'ZH202012290917326998327603', 222.00, '\\App\\Logic\\App\\PayNotifyLogic', 37, 0, 'coupon', NULL, 1, 1609204653, 1609204653);
INSERT INTO `payment_log` VALUES (34, 'offline', 'ZH202012290920216330832327', 'ZH202012290920216330832327', 222.00, '\\App\\Logic\\App\\PayNotifyLogic', 38, 0, 'coupon', NULL, 1, 1609204821, 1609204821);
INSERT INTO `payment_log` VALUES (35, 'offline', 'ZH202012290923266234698174', 'ZH202012290923266234698174', 333.00, '\\App\\Logic\\App\\PayNotifyLogic', 39, 0, 'coupon', NULL, 1, 1609205006, 1609205006);
INSERT INTO `payment_log` VALUES (36, 'offline', 'ZH202012290923476337208084', 'ZH202012290923476337208084', 44.00, '\\App\\Logic\\App\\PayNotifyLogic', 40, 0, 'coupon', NULL, 1, 1609205027, 1609205027);
INSERT INTO `payment_log` VALUES (37, 'alipay', 'ZH202012292111176910829694', 'ZH202012292111176910829694', 371.00, '\\App\\Logic\\App\\PayNotifyLogic', 1, 0, 'onlineshop', NULL, 0, 1609247477, 0);
INSERT INTO `payment_log` VALUES (38, 'offline', 'ZH202012292122396468072981', 'ZH202012292122396468072981', 155.00, '\\App\\Logic\\App\\PayNotifyLogic', 2, 0, 'onlineshop', NULL, 1, 1609248159, 1609248159);
INSERT INTO `payment_log` VALUES (39, 'offline', 'ZH202012292124206667491830', 'ZH202012292124206667491830', 155.00, '\\App\\Logic\\App\\PayNotifyLogic', 3, 0, 'onlineshop', NULL, 1, 1609248260, 1609248260);
INSERT INTO `payment_log` VALUES (40, 'offline', 'ZH202012292126466969787979', 'ZH202012292126466969787979', 5257.00, '\\App\\Logic\\App\\PayNotifyLogic', 4, 0, 'onlineshop', NULL, 1, 1609248406, 1609248406);
INSERT INTO `payment_log` VALUES (41, 'offline', 'ZH202012292128516456410850', 'ZH202012292128516456410850', 155.00, '\\App\\Logic\\App\\PayNotifyLogic', 5, 0, 'onlineshop', NULL, 1, 1609248531, 1609248531);
INSERT INTO `payment_log` VALUES (44, 'offline', 'ZH202012292230286967590962', 'ZH202012292230286967590962', 301.00, '\\App\\Logic\\App\\PayNotifyLogic', 8, 0, 'onlineshop', NULL, 1, 1609252228, 1609252228);
INSERT INTO `payment_log` VALUES (45, 'offline', 'ZH202012292232456049029769', 'ZH202012292232456049029769', 371.00, '\\App\\Logic\\App\\PayNotifyLogic', 9, 0, 'onlineshop', NULL, 1, 1609252365, 1609252365);
INSERT INTO `payment_log` VALUES (46, 'offline', 'ZH202012292234376359061510', 'ZH202012292234376359061510', 188.00, '\\App\\Logic\\App\\PayNotifyLogic', 10, 0, 'onlineshop', NULL, 1, 1609252477, 1609252477);
INSERT INTO `payment_log` VALUES (47, 'offline', 'ZH202012292236036046082215', 'ZH202012292236036046082215', 301.00, '\\App\\Logic\\App\\PayNotifyLogic', 11, 0, 'onlineshop', NULL, 1, 1609252563, 1609252563);
INSERT INTO `payment_log` VALUES (48, 'offline', 'ZH202012292239396394846812', 'ZH202012292239396394846812', 371.00, '\\App\\Logic\\App\\PayNotifyLogic', 12, 0, 'onlineshop', NULL, 1, 1609252779, 1609252779);
INSERT INTO `payment_log` VALUES (49, 'offline', 'ZH202012292246126038790077', 'ZH202012292246126038790077', 296.00, '\\App\\Logic\\App\\PayNotifyLogic', 13, 0, 'onlineshop', NULL, 1, 1609253172, 1609253172);
INSERT INTO `payment_log` VALUES (50, 'offline', 'ZH202012292248166039408685', 'ZH202012292248166039408685', 263.00, '\\App\\Logic\\App\\PayNotifyLogic', 14, 0, 'onlineshop', NULL, 1, 1609253296, 1609253296);
INSERT INTO `payment_log` VALUES (51, 'offline', 'ZH202012292252506171077834', 'ZH202012292252506171077834', 409.00, '\\App\\Logic\\App\\PayNotifyLogic', 15, 0, 'onlineshop', NULL, 1, 1609253570, 1609253570);
INSERT INTO `payment_log` VALUES (52, 'offline', 'ZH202012292259456097937626', 'ZH202012292259456097937626', 263.00, '\\App\\Logic\\App\\PayNotifyLogic', 16, 0, 'onlineshop', NULL, 1, 1609253985, 1609253985);
INSERT INTO `payment_log` VALUES (53, 'offline', 'ZH202012292302226189337359', 'ZH202012292302226189337359', 263.00, '\\App\\Logic\\App\\PayNotifyLogic', 17, 0, 'onlineshop', NULL, 1, 1609254142, 1609254142);
INSERT INTO `payment_log` VALUES (54, 'offline', 'ZH202012292307526790063205', 'ZH202012292307526790063205', 263.00, '\\App\\Logic\\App\\PayNotifyLogic', 18, 0, 'onlineshop', NULL, 1, 1609254472, 1609254472);
INSERT INTO `payment_log` VALUES (55, 'offline', 'ZH202012292312266786406422', 'ZH202012292312266786406422', 263.00, '\\App\\Logic\\App\\PayNotifyLogic', 19, 0, 'onlineshop', NULL, 1, 1609254746, 1609254746);
INSERT INTO `payment_log` VALUES (56, 'offline', 'ZH202012292323366218000211', 'ZH202012292323366218000211', 263.00, '\\App\\Logic\\App\\PayNotifyLogic', 20, 0, 'onlineshop', NULL, 1, 1609255416, 1609255416);
INSERT INTO `payment_log` VALUES (57, 'offline', 'ZH202012292327326360271898', 'ZH202012292327326360271898', 155.00, '\\App\\Logic\\App\\PayNotifyLogic', 21, 0, 'onlineshop', NULL, 1, 1609255652, 1609255652);
INSERT INTO `payment_log` VALUES (58, 'offline', 'ZH202012292333176885114727', 'ZH202012292333176885114727', 155.00, '\\App\\Logic\\App\\PayNotifyLogic', 22, 0, 'onlineshop', NULL, 1, 1609255997, 1609255997);
INSERT INTO `payment_log` VALUES (59, 'offline', 'ZH202012292343336567870019', 'ZH202012292343336567870019', 155.00, '\\App\\Logic\\App\\PayNotifyLogic', 23, 0, 'onlineshop', NULL, 1, 1609256613, 1609256613);
INSERT INTO `payment_log` VALUES (60, 'offline', 'ZH202012292344286575358415', 'ZH202012292344286575358415', 188.00, '\\App\\Logic\\App\\PayNotifyLogic', 24, 0, 'onlineshop', NULL, 1, 1609256668, 1609256668);
INSERT INTO `payment_log` VALUES (61, 'offline', 'ZH202012292344386974964632', 'ZH202012292344386974964632', 188.00, '\\App\\Logic\\App\\PayNotifyLogic', 25, 0, 'onlineshop', NULL, 1, 1609256678, 1609256678);
INSERT INTO `payment_log` VALUES (62, 'offline', 'ZH202012292344406604920292', 'ZH202012292344406604920292', 188.00, '\\App\\Logic\\App\\PayNotifyLogic', 26, 0, 'onlineshop', NULL, 1, 1609256680, 1609256680);
INSERT INTO `payment_log` VALUES (63, 'offline', 'ZH202012292344426968531850', 'ZH202012292344426968531850', 188.00, '\\App\\Logic\\App\\PayNotifyLogic', 27, 0, 'onlineshop', NULL, 1, 1609256682, 1609256682);
INSERT INTO `payment_log` VALUES (64, 'offline', 'ZH202012292344456378757882', 'ZH202012292344456378757882', 188.00, '\\App\\Logic\\App\\PayNotifyLogic', 28, 0, 'onlineshop', NULL, 1, 1609256685, 1609256685);
INSERT INTO `payment_log` VALUES (65, 'offline', 'ZH202012292346096561846172', 'ZH202012292346096561846172', 2664.00, '\\App\\Logic\\App\\PayNotifyLogic', 41, 0, 'coupon', NULL, 1, 1609256769, 1609256769);
INSERT INTO `payment_log` VALUES (66, NULL, 'ZH202012300115466865907353', 'ZH202012300115466865907353', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609262146, 0);
INSERT INTO `payment_log` VALUES (67, 'offline', 'ZH202012300116596100812048', 'ZH202012300116596100812048', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 1, 1609262219, 1609262219);
INSERT INTO `payment_log` VALUES (68, 'offline', 'ZH202012300538376514839967', 'ZH202012300538376514839967', 0.00, '\\App\\Logic\\App\\PayNotifyLogic', 42, 0, 'coupon', NULL, 1, 1609277917, 1609277917);
INSERT INTO `payment_log` VALUES (69, 'offline', 'ZH202012300538466822736572', 'ZH202012300538466822736572', 1332.00, '\\App\\Logic\\App\\PayNotifyLogic', 43, 0, 'coupon', NULL, 1, 1609277926, 1609277926);
INSERT INTO `payment_log` VALUES (70, 'offline', 'ZH202012300538536311953070', 'ZH202012300538536311953070', 400.00, '\\App\\Logic\\App\\PayNotifyLogic', 44, 0, 'coupon', NULL, 1, 1609277933, 1609277933);
INSERT INTO `payment_log` VALUES (71, 'offline', 'ZH202012300543356552145320', 'ZH202012300543356552145320', 200.00, '\\App\\Logic\\App\\PayNotifyLogic', 45, 0, 'coupon', NULL, 1, 1609278215, 1609278215);
INSERT INTO `payment_log` VALUES (72, 'offline', 'ZH202012300602126064882715', 'ZH202012300602126064882715', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 1, 1609279332, 1609279332);
INSERT INTO `payment_log` VALUES (73, 'offline', 'ZH2020123006084121951408569', 'ZH2020123006084121951408569', 188.00, '\\App\\Logic\\App\\PayNotifyLogic', 29, 0, 'onlineshop', NULL, 1, 1609279721, 1609279721);
INSERT INTO `payment_log` VALUES (74, 'offline', 'ZH2020123006120421073118877', 'ZH2020123006120421073118877', 188.00, '\\App\\Logic\\App\\PayNotifyLogic', 30, 0, 'onlineshop', NULL, 1, 1609279924, 1609279924);
INSERT INTO `payment_log` VALUES (75, 'offline', 'ZH2020123006130821936571067', 'ZH2020123006130821936571067', 188.00, '\\App\\Logic\\App\\PayNotifyLogic', 31, 0, 'onlineshop', NULL, 1, 1609279988, 1609279988);
INSERT INTO `payment_log` VALUES (76, 'offline', 'ZH2020123006161521409654400', 'ZH2020123006161521409654400', 188.00, '\\App\\Logic\\App\\PayNotifyLogic', 32, 0, 'onlineshop', NULL, 1, 1609280175, 1609280175);
INSERT INTO `payment_log` VALUES (77, 'offline', 'ZH202012300628056542652868', 'ZH202012300628056542652868', 600.00, '\\App\\Logic\\App\\PayNotifyLogic', 46, 0, 'coupon', NULL, 1, 1609280885, 1609280885);
INSERT INTO `payment_log` VALUES (78, 'offline', 'ZH2020123006294522258890483', 'ZH2020123006294522258890483', 38.00, '\\App\\Logic\\App\\PayNotifyLogic', 33, 0, 'onlineshop', NULL, 1, 1609280985, 1609280985);
INSERT INTO `payment_log` VALUES (88, 'offline', 'ZH2020123113594123213876069', 'ZH2020123113594123213876069', 258.00, '\\App\\Logic\\App\\PayNotifyLogic', 43, 0, 'onlineshop', NULL, 0, 1609394381, 0);
INSERT INTO `payment_log` VALUES (93, 'offline', 'ZH2020123114152224651678260', 'ZH2020123114152224651678260', 108.00, '\\App\\Logic\\App\\PayNotifyLogic', 48, 0, 'onlineshop', NULL, 1, 1609395322, 1609395322);
INSERT INTO `payment_log` VALUES (94, 'offline', 'ZH202012311758396159868392', 'ZH202012311758396159868392', 150.00, '\\App\\Logic\\App\\PayNotifyLogic', 49, 0, 'onlineshop', NULL, 1, 1609408719, 1609408719);
INSERT INTO `payment_log` VALUES (95, 'offline', 'ZH2020123118044110088787577', 'ZH2020123118044110088787577', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 1, 1609409081, 1609409081);
INSERT INTO `payment_log` VALUES (96, 'offline', 'ZH2020123118054410250979789', 'ZH2020123118054410250979789', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 1, 1609409144, 1609409144);
INSERT INTO `payment_log` VALUES (97, 'offline', 'ZH2020123118072410620458359', 'ZH2020123118072410620458359', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 1, 1609409244, 1609409244);
INSERT INTO `payment_log` VALUES (98, 'offline', 'ZH2020123118081910089421932', 'ZH2020123118081910089421932', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 1, 1609409299, 1609409299);
INSERT INTO `payment_log` VALUES (99, 'offline', 'ZH2020123118091210826966760', 'ZH2020123118091210826966760', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 1, 1609409352, 1609409352);
INSERT INTO `payment_log` VALUES (100, 'offline', 'ZH2020123118100310550485835', 'ZH2020123118100310550485835', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 1, 1609409403, 1609409403);
INSERT INTO `payment_log` VALUES (101, 'offline', 'ZH2020123118302610289910173', 'ZH2020123118302610289910173', 1838.00, '\\App\\Logic\\App\\PayNotifyLogic', 50, 0, 'onlineshop', NULL, 0, 1609410626, 0);
INSERT INTO `payment_log` VALUES (102, 'offline', 'ZH202012312105216274795457', 'ZH202012312105216274795457', 1838.00, '\\App\\Logic\\App\\PayNotifyLogic', 51, 0, 'onlineshop', NULL, 0, 1609419921, 0);
INSERT INTO `payment_log` VALUES (103, 'offline', 'ZH202012312106576654840018', 'ZH202012312106576654840018', 1838.00, '\\App\\Logic\\App\\PayNotifyLogic', 52, 0, 'onlineshop', NULL, 0, 1609420017, 0);
INSERT INTO `payment_log` VALUES (104, 'offline', 'ZH202101032209036397130379', 'ZH202101032209036397130379', 1688.00, '\\App\\Logic\\App\\PayNotifyLogic', 53, 0, 'onlineshop', NULL, 0, 1609682943, 0);
INSERT INTO `payment_log` VALUES (105, NULL, 'ZH202101032254136830663032', 'ZH202101032254136830663032', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609685653, 0);
INSERT INTO `payment_log` VALUES (106, NULL, 'ZH202101032257336767235283', 'ZH202101032257336767235283', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609685853, 0);
INSERT INTO `payment_log` VALUES (107, NULL, 'ZH202101032259446205072457', 'ZH202101032259446205072457', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609685984, 0);
INSERT INTO `payment_log` VALUES (108, NULL, 'ZH202101032300186841138124', 'ZH202101032300186841138124', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609686018, 0);
INSERT INTO `payment_log` VALUES (109, NULL, 'ZH202101032302536487175657', 'ZH202101032302536487175657', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609686173, 0);
INSERT INTO `payment_log` VALUES (110, NULL, 'ZH202101032303546327729924', 'ZH202101032303546327729924', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609686234, 0);
INSERT INTO `payment_log` VALUES (111, 'alipay', 'ZH202101032305106697784148', 'ZH202101032305106697784148', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609686310, 0);
INSERT INTO `payment_log` VALUES (112, 'alipay', 'ZH202101032305246144628289', 'ZH202101032305246144628289', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609686324, 0);
INSERT INTO `payment_log` VALUES (113, 'alipay', 'ZH202101032308546251606649', 'ZH202101032308546251606649', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609686534, 0);
INSERT INTO `payment_log` VALUES (114, 'offline', 'ZH202101032311356853144859', 'ZH202101032311356853144859', 200.00, '\\App\\Logic\\App\\PayNotifyLogic', 53, 0, 'coupon', NULL, 1, 1609686695, 1609686695);
INSERT INTO `payment_log` VALUES (115, 'offline', 'ZH202101032312246054028989', 'ZH202101032312246054028989', 200.00, '\\App\\Logic\\App\\PayNotifyLogic', 54, 0, 'coupon', NULL, 1, 1609686744, 1609686744);
INSERT INTO `payment_log` VALUES (116, 'alipay', 'ZH202101032314496331606610', 'ZH202101032314496331606610', 200.00, '\\App\\Logic\\App\\PayNotifyLogic', 55, 0, 'coupon', NULL, 0, 1609686889, 0);
INSERT INTO `payment_log` VALUES (117, 'alipay', 'ZH202101032315026621395196', 'ZH202101032315026621395196', 1332.00, '\\App\\Logic\\App\\PayNotifyLogic', 56, 0, 'coupon', NULL, 0, 1609686902, 0);
INSERT INTO `payment_log` VALUES (119, 'alipay', 'ZH202101032316026045720319', 'ZH202101032316026045720319', 358.00, '\\App\\Logic\\App\\PayNotifyLogic', 55, 0, 'onlineshop', NULL, 0, 1609686962, 0);
INSERT INTO `payment_log` VALUES (121, 'alipay', 'ZH202101032318376933214538', 'ZH202101032318376933214538', 750.00, '\\App\\Logic\\App\\PayNotifyLogic', 57, 0, 'onlineshop', NULL, 0, 1609687117, 0);
INSERT INTO `payment_log` VALUES (122, 'alipay', 'ZH2021010323521325876588797', 'ZH2021010323521325876588797', 399.00, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', NULL, 0, 1609689133, 0);
INSERT INTO `payment_log` VALUES (123, 'alipay', 'ZH2021010411443751266601544', 'ZH2021010411443751266601544', 0.01, '\\App\\Logic\\App\\PayNotifyLogic', 0, 0, 'upgrade_agent', '{\"gmt_create\":\"2021-01-04 11:44:44\",\"charset\":\"utf-8\",\"seller_email\":\"feichengshangmao@163.com\",\"subject\":\"\\u4ee3\\u7406\\u5546\\u6743\\u9650\\u5347\\u7ea7\",\"sign\":\"d1LQVXLKqfaOeFNQkRI7CagUm10I1pYXkn1gi5dmfMzsNceKxU8qg1obB\\/ILfAQPdW7wHw5kk4KmVSaq2EG22dOQXpjnVSWMLx54txQi8Xqx9RHcX8lbM1hAtSqO2d7DE+gX3DwsdEjxtGlVWnop2IwqNqwgvDt0YTH5ZXLmq3i+Hp+HCZ1dWRIwoEzIEEx9lCIU0\\/PRutLNVh63Crs5fScrKAc6ftEnsX+NdXNx2BarulAKmS4+WIirhZqUGR5E5YTNQCRZHAdZfiKULKiEJqS1crId8eQUaXXjiz4kFCPlckX4RsUYGFsgDJeTTgVhDxlmiWgvjttEpQSEA6l3AA==\",\"buyer_id\":\"2088012847141439\",\"invoice_amount\":\"0.01\",\"notify_id\":\"2021010400222114444041431451457139\",\"fund_bill_list\":\"[{\\\"amount\\\":\\\"0.01\\\",\\\"fundChannel\\\":\\\"PCREDIT\\\"}]\",\"notify_type\":\"trade_status_sync\",\"trade_status\":\"TRADE_SUCCESS\",\"receipt_amount\":\"0.01\",\"app_id\":\"2021002115698315\",\"buyer_pay_amount\":\"0.01\",\"sign_type\":\"RSA2\",\"seller_id\":\"2088041247553621\",\"gmt_payment\":\"2021-01-04 11:44:44\",\"notify_time\":\"2021-01-04 11:58:38\",\"version\":\"1.0\",\"out_trade_no\":\"ZH2021010411443751266601544\",\"total_amount\":\"0.01\",\"trade_no\":\"2021010422001441431403478309\",\"auth_app_id\":\"2021002115698315\",\"buyer_logon_id\":\"152****2550\",\"point_amount\":\"0.00\",\"total_money\":0.01}', 1, 1609689345, 1609703816);

-- ----------------------------
-- Table structure for product_chat_friend
-- ----------------------------
DROP TABLE IF EXISTS `product_chat_friend`;
CREATE TABLE `product_chat_friend`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` int UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `friend_mid` int NULL DEFAULT NULL COMMENT '好友ID',
  `state` tinyint(1) NULL DEFAULT 0 COMMENT '状态：1：正常，0：待添加，-1：删除，-2：拉黑',
  `created_at` int NULL DEFAULT 0 COMMENT '添加時間',
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `fmid`(`friend_mid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天好友表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_chat_friend
-- ----------------------------
INSERT INTO `product_chat_friend` VALUES (1, 6, 10, 0, 1666666669, 0);
INSERT INTO `product_chat_friend` VALUES (2, 6, 5, 1, 1747483647, 0);
INSERT INTO `product_chat_friend` VALUES (4, 23, 6, 1, 1612320773, 1612322871);
INSERT INTO `product_chat_friend` VALUES (9, 6, 23, 1, 1612322871, 0);
INSERT INTO `product_chat_friend` VALUES (13, 25, 34, 1, 1614344543, 1614344620);
INSERT INTO `product_chat_friend` VALUES (14, 34, 25, 1, 1614344620, 0);
INSERT INTO `product_chat_friend` VALUES (15, 6, 25, 0, 1614345005, 0);
INSERT INTO `product_chat_friend` VALUES (16, 6, 34, 1, 1614345041, 1614345047);
INSERT INTO `product_chat_friend` VALUES (17, 34, 6, 1, 1614345047, 0);

-- ----------------------------
-- Table structure for product_chat_message
-- ----------------------------
DROP TABLE IF EXISTS `product_chat_message`;
CREATE TABLE `product_chat_message`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `from_mid` int UNSIGNED NULL DEFAULT NULL COMMENT '发送人',
  `to_mid` int UNSIGNED NULL DEFAULT NULL COMMENT '接收人',
  `msg_type` enum('text','img','video','voice','location') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'text' COMMENT '内容类型',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文本消息内容',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '音频、视频、图片资源路径',
  `gps_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '定位信息',
  `is_broadcast` tinyint(1) NULL DEFAULT 0 COMMENT '接收者是否广播收到',
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `frommid`(`from_mid`) USING BTREE,
  INDEX `tomid`(`to_mid`) USING BTREE,
  INDEX `isbroadcast`(`is_broadcast`) USING BTREE,
  INDEX `msgtype`(`msg_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 297 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天内容表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_chat_message
-- ----------------------------
INSERT INTO `product_chat_message` VALUES (81, 6, 57, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNljI.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNljI.gif\"></div>', '', '', 1, 1612016319, 0);
INSERT INTO `product_chat_message` VALUES (82, 6, 57, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"></div>', '', '', 1, 1612016324, 0);
INSERT INTO `product_chat_message` VALUES (83, 5, 54, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"></div>', '', '', 1, 1612016332, 0);
INSERT INTO `product_chat_message` VALUES (84, 6, 57, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/AbNwgs.gif\"><img src=\"/static/img/emoji/AbNwgs.gif\"></div>', '', '', 1, 1612016395, 0);
INSERT INTO `product_chat_message` VALUES (85, 6, 57, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"file:///static/img/emoji/AbNsbV.gif\"><img src=\"file:///static/img/emoji/AbNsbV.gif\"><img src=\"file:///static/img/emoji/AbNsbV.gif\"></div>', '', '', 1, 1612016418, 0);
INSERT INTO `product_chat_message` VALUES (86, 5, 54, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/105.gif\"><img src=\"/static/img/emoji/114.gif\"><img src=\"/static/img/emoji/113.gif\"></div>', '', '', 1, 1612016537, 0);
INSERT INTO `product_chat_message` VALUES (87, 5, 54, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/112.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"></div>', '', '', 1, 1612016560, 0);
INSERT INTO `product_chat_message` VALUES (88, 6, 57, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发生</div>', '', '', 1, 1612016564, 0);
INSERT INTO `product_chat_message` VALUES (89, 5, 54, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯蒂芬</div>', '', '', 1, 1612016597, 0);
INSERT INTO `product_chat_message` VALUES (90, 5, 54, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">我叼</div>', '', '', 1, 1612016609, 0);
INSERT INTO `product_chat_message` VALUES (91, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2323</div>', '', '', 1, 1612019623, 0);
INSERT INTO `product_chat_message` VALUES (92, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发生</div>', '', '', 1, 1612019647, 0);
INSERT INTO `product_chat_message` VALUES (93, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯蒂芬</div>', '', '', 1, 1612019659, 0);
INSERT INTO `product_chat_message` VALUES (94, 5, 2, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">大师傅</div>', '', '', 1, 1612019701, 0);
INSERT INTO `product_chat_message` VALUES (95, 6, 12, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯蒂芬</div>', '', '', 1, 1612019706, 0);
INSERT INTO `product_chat_message` VALUES (96, 6, 12, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发</div>', '', '', 1, 1612019709, 0);
INSERT INTO `product_chat_message` VALUES (97, 6, 12, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">1111</div>', '', '', 1, 1612019712, 0);
INSERT INTO `product_chat_message` VALUES (98, 6, 12, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">哈哈</div>', '', '', 1, 1612019717, 0);
INSERT INTO `product_chat_message` VALUES (99, 6, 12, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">北京市东城区正义路与东交民巷交汇处西南侧 </div>', '', '', 1, 1612019735, 0);
INSERT INTO `product_chat_message` VALUES (100, 6, 15, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发送到</div>', '', '', 1, 1612019846, 0);
INSERT INTO `product_chat_message` VALUES (101, 6, 15, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">叼毛2</div>', '', '', 1, 1612019853, 0);
INSERT INTO `product_chat_message` VALUES (102, 5, 2, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发斯蒂芬</div>', '', '', 1, 1612019876, 0);
INSERT INTO `product_chat_message` VALUES (103, 5, 2, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/110.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/115.gif\"></div>', '', '', 1, 1612019880, 0);
INSERT INTO `product_chat_message` VALUES (104, 6, 15, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2222</div>', '', '', 1, 1612019893, 0);
INSERT INTO `product_chat_message` VALUES (105, 6, 15, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2223</div>', '', '', 1, 1612019912, 0);
INSERT INTO `product_chat_message` VALUES (106, 6, 15, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发送到</div>', '', '', 1, 1612020520, 0);
INSERT INTO `product_chat_message` VALUES (107, 5, 20, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">23423</div>', '', '', 1, 1612020535, 0);
INSERT INTO `product_chat_message` VALUES (108, 5, 20, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发送到</div>', '', '', 1, 1612020539, 0);
INSERT INTO `product_chat_message` VALUES (109, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">发达水电费</div>', '', '', 1, 1612020892, 0);
INSERT INTO `product_chat_message` VALUES (110, 6, 2, 'location', '北京市东城区前门东大街9号', '', '[116.404762,39.901279]', 1, 1612021039, 0);
INSERT INTO `product_chat_message` VALUES (111, 5, 9, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯蒂芬</div>', '', '\"\"', 1, 1612064587, 0);
INSERT INTO `product_chat_message` VALUES (112, 6, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发大水</div>', '', '\"\"', 1, 1612064594, 0);
INSERT INTO `product_chat_message` VALUES (113, 6, 6, 'location', '北京市东城区华风宾馆1层', '', '[116.407402,39.901443]', 1, 1612064600, 0);
INSERT INTO `product_chat_message` VALUES (114, 5, 9, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2323</div>', '', '\"\"', 1, 1612064826, 0);
INSERT INTO `product_chat_message` VALUES (115, 6, 6, 'location', '北京市东城区东交民巷甲23', '', '[116.407639,39.902702]', 1, 1612064846, 0);
INSERT INTO `product_chat_message` VALUES (116, 6, 6, 'location', '北京市西城区阜成门内大街325附近', '', '[116.358431,39.923922]', 1, 1612064906, 0);
INSERT INTO `product_chat_message` VALUES (117, 5, 30, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">大沙发上</div>', '', '\"\"', 1, 1612082253, 0);
INSERT INTO `product_chat_message` VALUES (118, 6, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/114.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/112.gif\"><img src=\"/static/img/emoji/111.gif\"></div>', '', '\"\"', 1, 1612082260, 0);
INSERT INTO `product_chat_message` VALUES (119, 6, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/105.gif\"><img src=\"/static/img/emoji/105.gif\"></div>', '', '\"\"', 1, 1612082266, 0);
INSERT INTO `product_chat_message` VALUES (120, 6, 6, 'location', '广东省佛山市南海区大沥镇沙溪大道', '', '[113.20028528630208,23.129103671848533]', 1, 1612082279, 0);
INSERT INTO `product_chat_message` VALUES (121, 6, 6, 'location', '广东省佛山市南海区桂城街道礌岗公园-千灯湖活水公园', '', '[113.14775020033062,23.046843889802833]', 1, 1612082312, 0);
INSERT INTO `product_chat_message` VALUES (122, 6, 6, '', '', 'https://oss.bhy521qm.com/common/447fc666f49bcbf71a2250a4ed6261f1.jpg', '\"\"', 1, 1612082341, 0);
INSERT INTO `product_chat_message` VALUES (123, 5, 30, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">萨法</div>', '', '\"\"', 1, 1612082354, 0);
INSERT INTO `product_chat_message` VALUES (124, 5, 30, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">哈哈\n</div>', '', '\"\"', 1, 1612082360, 0);
INSERT INTO `product_chat_message` VALUES (125, 6, 6, '', '', '_doc/uniapp_temp_1612082222352/recorder/1612082373207.mp3', '\"\"', 1, 1612082375, 0);
INSERT INTO `product_chat_message` VALUES (126, 5, 1, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">5555</div>', '', '\"\"', 1, 1612084899, 0);
INSERT INTO `product_chat_message` VALUES (127, 5, 1, '', '', 'https://oss.bhy521qm.com/common/278ec08683f5758ae453ea75ec5ab200.mp3', '\"\"', 1, 1612085033, 0);
INSERT INTO `product_chat_message` VALUES (128, 5, 1, '', '', 'https://oss.bhy521qm.com/common/b1444b8de66e31be9c099430ab1c420b.mp3', '\"\"', 1, 1612085056, 0);
INSERT INTO `product_chat_message` VALUES (129, 5, 1, '', '', 'https://oss.bhy521qm.com/common/69fb85a6251f1650936e270f303d14a6.mp3', '\"\"', 1, 1612085056, 0);
INSERT INTO `product_chat_message` VALUES (130, 5, 1, '', '', 'https://oss.bhy521qm.com/common/ba4d09b17366b49a081efd451ad609cc.mp3', '\"\"', 1, 1612085057, 0);
INSERT INTO `product_chat_message` VALUES (131, 5, 1, '', '', 'https://oss.bhy521qm.com/common/88c77293f5f14f2bea4ff6566d082750.mp3', '\"\"', 1, 1612085058, 0);
INSERT INTO `product_chat_message` VALUES (132, 5, 1, '', '', 'https://oss.bhy521qm.com/common/ab33f4ecd7ba5c736ec1c0bee1766f15.mp3', '\"\"', 1, 1612085059, 0);
INSERT INTO `product_chat_message` VALUES (133, 5, 1, '', '', 'https://oss.bhy521qm.com/common/2ff1da43a666d73d74027e614afedbb6.mp3', '\"\"', 1, 1612085060, 0);
INSERT INTO `product_chat_message` VALUES (134, 5, 1, '', '', 'https://oss.bhy521qm.com/common/a1e4421a62a2f93714d506c45050dbbe.mp3', '\"\"', 1, 1612085062, 0);
INSERT INTO `product_chat_message` VALUES (135, 5, 1, '', '', 'https://oss.bhy521qm.com/common/39f6c8af757ac8ce5dbe7c4b23a9b420.mp3', '\"\"', 1, 1612085062, 0);
INSERT INTO `product_chat_message` VALUES (136, 5, 1, '', '', 'https://oss.bhy521qm.com/common/51a1634f2e7e6e9559f381f9ea8e5ea7.mp3', '\"\"', 1, 1612085063, 0);
INSERT INTO `product_chat_message` VALUES (137, 5, 1, '', '', 'https://oss.bhy521qm.com/common/38ca8cdb3a21654bfa4dce46b432170d.mp3', '\"\"', 1, 1612085064, 0);
INSERT INTO `product_chat_message` VALUES (138, 5, 1, '', '', 'https://oss.bhy521qm.com/common/deb0cae22ebf38d7a3e8ec929e75719c.mp3', '\"\"', 1, 1612085064, 0);
INSERT INTO `product_chat_message` VALUES (139, 5, 1, '', '', 'https://oss.bhy521qm.com/common/7902081986252db5695e4063ab49a08f.mp3', '\"\"', 1, 1612085065, 0);
INSERT INTO `product_chat_message` VALUES (140, 5, 1, '', '', 'https://oss.bhy521qm.com/common/d7326be7d92aa9d1eca49d2f0e01d55f.mp3', '\"\"', 1, 1612085067, 0);
INSERT INTO `product_chat_message` VALUES (141, 6, 18, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">222</div>', '', '\"\"', 1, 1612085276, 0);
INSERT INTO `product_chat_message` VALUES (142, 5, 1, '', '', 'https://oss.bhy521qm.com/common/fa6c448322deae02fbbe4b797ddf5683.mp3', '\"\"', 1, 1612085285, 0);
INSERT INTO `product_chat_message` VALUES (143, 5, 1, '', '', 'https://oss.bhy521qm.com/common/1a32e2d82c5e6d8f4516198d0ae014ac.mp3', '\"\"', 1, 1612085290, 0);
INSERT INTO `product_chat_message` VALUES (144, 5, 1, '', '', 'https://oss.bhy521qm.com/common/ffb19be3f420126bfb1453fff3858304.mp3', '\"\"', 1, 1612085291, 0);
INSERT INTO `product_chat_message` VALUES (145, 6, 18, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2323</div>', '', '\"\"', 1, 1612085301, 0);
INSERT INTO `product_chat_message` VALUES (146, 5, 1, '', '', 'https://oss.bhy521qm.com/common/d61c7bff3730d754eced7524801e73cf.mp3', '\"\"', 1, 1612085307, 0);
INSERT INTO `product_chat_message` VALUES (147, 6, 18, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">232</div>', '', '\"\"', 1, 1612085457, 0);
INSERT INTO `product_chat_message` VALUES (148, 5, 1, 'voice', '', 'https://oss.bhy521qm.com/common/03c4bd4f832946ff97336b05052939e5.mp3', '\"\"', 1, 1612085463, 0);
INSERT INTO `product_chat_message` VALUES (149, 6, 22, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">222</div>', '', '\"\"', 1, 1612085656, 0);
INSERT INTO `product_chat_message` VALUES (150, 5, 1, 'voice', '', 'https://oss.bhy521qm.com/common/ed4d5f43bec4575fe349238c5ae6419f.mp3', '\"\"', 1, 1612085662, 0);
INSERT INTO `product_chat_message` VALUES (151, 6, 26, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">222</div>', '', '\"\"', 1, 1612085766, 0);
INSERT INTO `product_chat_message` VALUES (152, 5, 24, 'voice', '', 'https://oss.bhy521qm.com/common/b3309a961df434d4b760b7af0448c022.mp3', '\"\"', 1, 1612085773, 0);
INSERT INTO `product_chat_message` VALUES (153, 5, 24, 'voice', '', 'https://oss.bhy521qm.com/common/6bf8630c13451944e7c31903d97028a8.mp3', '\"\"', 1, 1612085786, 0);
INSERT INTO `product_chat_message` VALUES (154, 5, 24, 'location', '广东省广州市白云区石井街道石井大道235号石井广场', '', '[113.22740778339667,23.206423415699025]', 1, 1612085845, 0);
INSERT INTO `product_chat_message` VALUES (155, 5, 24, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">是123</div>', '', '\"\"', 1, 1612086167, 0);
INSERT INTO `product_chat_message` VALUES (156, 6, 26, 'location', '北京市东城区前门东大街5号', '', '[116.407677,39.90134]', 1, 1612086176, 0);
INSERT INTO `product_chat_message` VALUES (157, 6, 26, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/112.gif\"><img src=\"/static/img/emoji/112.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"></div>', '', '\"\"', 1, 1612086192, 0);
INSERT INTO `product_chat_message` VALUES (158, 5, 24, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/114.gif\"><img src=\"/static/img/emoji/114.gif\"><img src=\"/static/img/emoji/114.gif\"></div>', '', '\"\"', 1, 1612086199, 0);
INSERT INTO `product_chat_message` VALUES (159, 5, 24, 'img', '', 'https://oss.bhy521qm.com/common/c82ac061fb752d107ad23f19a38485e3.jpg', '\"\"', 1, 1612086221, 0);
INSERT INTO `product_chat_message` VALUES (160, 5, 43, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">111</div>', '', '\"\"', 1, 1612087435, 0);
INSERT INTO `product_chat_message` VALUES (161, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯蒂芬</div>', '', '\"\"', 0, 1612188813, 0);
INSERT INTO `product_chat_message` VALUES (162, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">a啥打法上</div>', '', '\"\"', 1, 1612188938, 0);
INSERT INTO `product_chat_message` VALUES (163, 5, 1, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发生</div>', '', '\"\"', 1, 1612188942, 0);
INSERT INTO `product_chat_message` VALUES (164, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">234324324</div>', '', '\"\"', 1, 1612188946, 0);
INSERT INTO `product_chat_message` VALUES (165, 5, 1, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发送到</div>', '', '\"\"', 1, 1612188948, 0);
INSERT INTO `product_chat_message` VALUES (166, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发</div>', '', '\"\"', 1, 1612188982, 0);
INSERT INTO `product_chat_message` VALUES (167, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发送到</div>', '', '\"\"', 1, 1612189212, 0);
INSERT INTO `product_chat_message` VALUES (168, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2323</div>', '', '\"\"', 1, 1612189219, 0);
INSERT INTO `product_chat_message` VALUES (169, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">77777</div>', '', '\"\"', 1, 1612189228, 0);
INSERT INTO `product_chat_message` VALUES (170, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">23423</div>', '', '\"\"', 1, 1612189241, 0);
INSERT INTO `product_chat_message` VALUES (171, 5, 10, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">23423423</div>', '', '\"\"', 1, 1612189250, 0);
INSERT INTO `product_chat_message` VALUES (172, 6, 3, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">234234</div>', '', '\"\"', 1, 1612189256, 0);
INSERT INTO `product_chat_message` VALUES (173, 6, 2, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">234234</div>', '', '\"\"', 1, 1612315595, 0);
INSERT INTO `product_chat_message` VALUES (174, 6, 2, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">222</div>', '', '\"\"', 1, 1612315613, 0);
INSERT INTO `product_chat_message` VALUES (175, 6, 2, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">11111</div>', '', '\"\"', 1, 1612315630, 0);
INSERT INTO `product_chat_message` VALUES (176, 5, 1, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">123123</div>', '', '\"\"', 1, 1612315637, 0);
INSERT INTO `product_chat_message` VALUES (177, 6, 12, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">22222</div>', '', '\"\"', 1, 1612315680, 0);
INSERT INTO `product_chat_message` VALUES (178, 6, 22, 'location', '北京市东城区华风宾馆1层', '', '[116.407402,39.901443]', 1, 1612316014, 0);
INSERT INTO `product_chat_message` VALUES (179, 6, 22, 'img', '', 'https://oss.bhy521qm.com/common/296afef10c47574489b8c432558c6339.jpg', '\"\"', 1, 1612316048, 0);
INSERT INTO `product_chat_message` VALUES (180, 6, 22, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">3232399999</div>', '', '\"\"', 1, 1612316061, 0);
INSERT INTO `product_chat_message` VALUES (181, 5, 14, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">234234234111</div>', '', '\"\"', 1, 1612316104, 0);
INSERT INTO `product_chat_message` VALUES (182, 5, 14, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"></div>', '', '\"\"', 1, 1612316124, 0);
INSERT INTO `product_chat_message` VALUES (183, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2222</div>', '', '\"\"', 0, 1612320813, 0);
INSERT INTO `product_chat_message` VALUES (184, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">23423</div>', '', '\"\"', 0, 1612321127, 0);
INSERT INTO `product_chat_message` VALUES (185, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">234234</div>', '', '\"\"', 0, 1612321134, 0);
INSERT INTO `product_chat_message` VALUES (186, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">666666666666</div>', '', '\"\"', 0, 1612321140, 0);
INSERT INTO `product_chat_message` VALUES (187, 6, 2, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">sadfas</div>', '', '\"\"', 1, 1612321569, 0);
INSERT INTO `product_chat_message` VALUES (188, 6, 2, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">1111</div>', '', '\"\"', 1, 1612321584, 0);
INSERT INTO `product_chat_message` VALUES (189, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">3333</div>', '', '\"\"', 1, 1612321587, 0);
INSERT INTO `product_chat_message` VALUES (190, 6, 2, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">9999</div>', '', '\"\"', 1, 1612321615, 0);
INSERT INTO `product_chat_message` VALUES (191, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">234234</div>', '', '\"\"', 0, 1612322884, 0);
INSERT INTO `product_chat_message` VALUES (192, 6, 2, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/113.gif\"></div>', '', '\"\"', 1, 1612323118, 0);
INSERT INTO `product_chat_message` VALUES (193, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">22</div>', '', '\"\"', 0, 1612323966, 0);
INSERT INTO `product_chat_message` VALUES (194, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">324234</div>', '', '\"\"', 0, 1612323974, 0);
INSERT INTO `product_chat_message` VALUES (195, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">34534534</div>', '', '\"\"', 0, 1612323981, 0);
INSERT INTO `product_chat_message` VALUES (196, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">222</div>', '', '\"\"', 0, 1612324120, 0);
INSERT INTO `product_chat_message` VALUES (197, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">23423</div>', '', '\"\"', 0, 1612324125, 0);
INSERT INTO `product_chat_message` VALUES (198, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/122.gif\"><img src=\"/static/img/emoji/121.gif\"><img src=\"/static/img/emoji/121.gif\"><img src=\"/static/img/emoji/113.gif\"></div>', '', '\"\"', 0, 1612324127, 0);
INSERT INTO `product_chat_message` VALUES (199, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">asdfasd</div>', '', '\"\"', 0, 1612324295, 0);
INSERT INTO `product_chat_message` VALUES (200, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">343534</div>', '', '\"\"', 0, 1612324374, 0);
INSERT INTO `product_chat_message` VALUES (201, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">333</div>', '', '\"\"', 0, 1612324397, 0);
INSERT INTO `product_chat_message` VALUES (202, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">7777</div>', '', '\"\"', 0, 1612324436, 0);
INSERT INTO `product_chat_message` VALUES (203, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">6666666</div>', '', '\"\"', 0, 1612324516, 0);
INSERT INTO `product_chat_message` VALUES (204, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">7777</div>', '', '\"\"', 0, 1612324562, 0);
INSERT INTO `product_chat_message` VALUES (205, 6, 0, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">asdfasdf</div>', '', '\"\"', 0, 1612324583, 0);
INSERT INTO `product_chat_message` VALUES (206, 6, 19, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">111111111111111111</div>', '', '\"\"', 0, 1612324611, 0);
INSERT INTO `product_chat_message` VALUES (207, 6, 23, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">iiiiiiiiiiiiiiiii</div>', '', '\"\"', 0, 1612324623, 0);
INSERT INTO `product_chat_message` VALUES (208, 6, 19, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2222</div>', '', '\"\"', 0, 1612341830, 0);
INSERT INTO `product_chat_message` VALUES (209, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/112.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/112.gif\"><img src=\"/static/img/emoji/112.gif\"></div>', '', '\"\"', 1, 1612345830, 0);
INSERT INTO `product_chat_message` VALUES (210, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">52222</div>', '', '\"\"', 1, 1612345838, 0);
INSERT INTO `product_chat_message` VALUES (211, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">234234234</div>', '', '\"\"', 1, 1612345846, 0);
INSERT INTO `product_chat_message` VALUES (212, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发斯蒂芬</div>', '', '\"\"', 1, 1612345851, 0);
INSERT INTO `product_chat_message` VALUES (213, 5, 6, 'img', '', 'https://oss.bhy521qm.com/common/2cdd8f13ad248c20ddcfc95c41d93b63.jpg', '\"\"', 1, 1612345860, 0);
INSERT INTO `product_chat_message` VALUES (214, 6, 5, 'location', '广东省茂名市信宜市平塘镇罗信高速', '', '[111.36464584092893,22.481691984737456]', 1, 1612345884, 0);
INSERT INTO `product_chat_message` VALUES (215, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发送到</div>', '', '\"\"', 1, 1612346015, 0);
INSERT INTO `product_chat_message` VALUES (216, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯蒂芬2222</div>', '', '\"\"', 1, 1612346020, 0);
INSERT INTO `product_chat_message` VALUES (217, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">3666899999</div>', '', '\"\"', 1, 1612346027, 0);
INSERT INTO `product_chat_message` VALUES (218, 6, 23, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/114.gif\"><img src=\"/static/img/emoji/123.gif\"></div>', '', '\"\"', 0, 1612354270, 0);
INSERT INTO `product_chat_message` VALUES (219, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">777</div>', '', '\"\"', 1, 1612402607, 1612403317);
INSERT INTO `product_chat_message` VALUES (220, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">222</div>', '', '\"\"', 1, 1612404010, 0);
INSERT INTO `product_chat_message` VALUES (221, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">3333</div>', '', '\"\"', 1, 1612404027, 0);
INSERT INTO `product_chat_message` VALUES (222, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"> 啊啊啊啊啊</div>', '', '\"\"', 1, 1612404412, 0);
INSERT INTO `product_chat_message` VALUES (223, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">发送到发送</div>', '', '\"\"', 1, 1612404441, 0);
INSERT INTO `product_chat_message` VALUES (224, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">阿斯顿发送到</div>', '', '\"\"', 1, 1612404444, 0);
INSERT INTO `product_chat_message` VALUES (225, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2222</div>', '', '\"\"', 1, 1612404447, 0);
INSERT INTO `product_chat_message` VALUES (226, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">撒旦法</div>', '', '\"\"', 1, 1612404452, 0);
INSERT INTO `product_chat_message` VALUES (227, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/121.gif\"><img src=\"/static/img/emoji/121.gif\"><img src=\"/static/img/emoji/113.gif\"></div>', '', '\"\"', 1, 1612404454, 0);
INSERT INTO `product_chat_message` VALUES (228, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2222</div>', '', '\"\"', 1, 1612404458, 0);
INSERT INTO `product_chat_message` VALUES (229, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"><img src=\"/static/img/emoji/113.gif\"></div>', '', '\"\"', 1, 1612404469, 0);
INSERT INTO `product_chat_message` VALUES (230, 5, 6, 'location', '北京市东城区正义路与东交民巷交汇处西南侧', '', '[116.406403,39.901951]', 1, 1612404481, 0);
INSERT INTO `product_chat_message` VALUES (231, 5, 19, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"> 欧诺头</div>', '', '\"\"', 0, 1612508739, 0);
INSERT INTO `product_chat_message` VALUES (232, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"/static/img/emoji/117.gif\"><img src=\"/static/img/emoji/105.gif\"><img src=\"/static/img/emoji/105.gif\"><img src=\"/static/img/emoji/111.gif\"><img src=\"/static/img/emoji/111.gif\"></div>', '', '\"\"', 1, 1612511973, 1612514006);
INSERT INTO `product_chat_message` VALUES (233, 6, 23, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"></div>', '', '\"\"', 0, 1614008286, 0);
INSERT INTO `product_chat_message` VALUES (234, 6, 23, 'voice', '', 'https://oss.bhy521qm.com/common/bff8322d17968c828f9e6bb67848883a.mp3', '\"\"', 0, 1614073168, 0);
INSERT INTO `product_chat_message` VALUES (235, 6, 23, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNGHf.gif\"></div>', '', '\"\"', 0, 1614136468, 0);
INSERT INTO `product_chat_message` VALUES (236, 5, 19, 'voice', '', 'https://oss.bhy521qm.com/common/f7d07d7f73c6da8eadf76cfd3278cef0.mp3', '\"\"', 0, 1614154323, 0);
INSERT INTO `product_chat_message` VALUES (237, 5, 19, 'voice', '', 'https://oss.bhy521qm.com/common/1368721f4f60db7f6ba0232f0427dd6b.mp3', '\"\"', 0, 1614154331, 0);
INSERT INTO `product_chat_message` VALUES (238, 5, 19, 'voice', '', 'https://oss.bhy521qm.com/common/f8c418d80d0f46df2a0df829be1d1e9a.mp3', '\"\"', 0, 1614154371, 0);
INSERT INTO `product_chat_message` VALUES (239, 5, 19, 'voice', '', 'https://oss.bhy521qm.com/common/c67ed301aef1a6b12b481ab8dbc9cb41.mp3', '\"\"', 0, 1614154540, 0);
INSERT INTO `product_chat_message` VALUES (240, 5, 19, 'voice', '', 'https://oss.bhy521qm.com/common/8b429ba8d7e9d33c7b798387dda660cb.mp3', '\"\"', 0, 1614154583, 0);
INSERT INTO `product_chat_message` VALUES (241, 5, 19, 'voice', '', 'https://oss.bhy521qm.com/common/ec6f3ffbba37425ee548a791ed5b15c8.mp3', '\"\"', 0, 1614154589, 0);
INSERT INTO `product_chat_message` VALUES (242, 5, 19, 'voice', '', 'https://oss.bhy521qm.com/common/a7dad952e94f33d061cbc06485694c7d.mp3', '\"\"', 0, 1614154605, 0);
INSERT INTO `product_chat_message` VALUES (243, 5, 19, 'voice', '', 'https://oss.bhy521qm.com/common/d2eb42aa7c15eeb070981072bce2d432.mp3', '\"\"', 0, 1614154669, 0);
INSERT INTO `product_chat_message` VALUES (244, 6, 19, 'voice', '', 'https://oss.bhy521qm.com/common/e1c99341cab7eea7ff5702f812ac333d.mp3', '\"\"', 0, 1614154697, 0);
INSERT INTO `product_chat_message` VALUES (245, 6, 19, 'voice', '', 'https://oss.bhy521qm.com/common/28448f5b8c0756b8af7c5c959ccad64c.mp3', '\"\"', 0, 1614154714, 0);
INSERT INTO `product_chat_message` VALUES (246, 6, 19, 'voice', '', 'https://oss.bhy521qm.com/common/d907205803b57f201337dff5755e5afe.mp3', '\"\"', 0, 1614154720, 0);
INSERT INTO `product_chat_message` VALUES (247, 6, 19, 'voice', '', 'https://oss.bhy521qm.com/common/1d695a42f8021737bcd3a29dbbeaf3f2.mp3', '\"\"', 0, 1614154749, 0);
INSERT INTO `product_chat_message` VALUES (248, 6, 19, 'location', '广东省佛山市南海区里水镇胜利公园', '', '[113.18025186751255,23.190732763966643]', 0, 1614155857, 0);
INSERT INTO `product_chat_message` VALUES (249, 6, 19, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">336666666</div>', '', '\"\"', 0, 1614155871, 0);
INSERT INTO `product_chat_message` VALUES (250, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">222</div>', '', '\"\"', 1, 1614168668, 0);
INSERT INTO `product_chat_message` VALUES (251, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"></div>', '', '\"\"', 1, 1614168672, 0);
INSERT INTO `product_chat_message` VALUES (252, 6, 5, 'location', '广东省广州市白云区石门街道北禺街', '', '[113.194405884242,23.231795253882794]', 1, 1614168690, 0);
INSERT INTO `product_chat_message` VALUES (253, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">快来快来看</div>', '', '\"\"', 1, 1614168700, 0);
INSERT INTO `product_chat_message` VALUES (254, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">9999999999999999</div>', '', '\"\"', 1, 1614168706, 0);
INSERT INTO `product_chat_message` VALUES (255, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"></div>', '', '\"\"', 1, 1614168712, 0);
INSERT INTO `product_chat_message` VALUES (256, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNrD0.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNW8J.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNRC4.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"></div>', '', '\"\"', 1, 1614168719, 0);
INSERT INTO `product_chat_message` VALUES (257, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"></div>', '', '\"\"', 1, 1614168726, 0);
INSERT INTO `product_chat_message` VALUES (258, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"></div>', '', '\"\"', 1, 1614168734, 0);
INSERT INTO `product_chat_message` VALUES (259, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNob6.gif\"></div>', '', '\"\"', 1, 1614168739, 0);
INSERT INTO `product_chat_message` VALUES (260, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNDuq.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNDuq.gif\"></div>', '', '\"\"', 1, 1614168751, 0);
INSERT INTO `product_chat_message` VALUES (261, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbU8z9.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbU8z9.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbU8z9.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/Aba9yR.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbUOoT.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbUOoT.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbUIzj.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbaEFO.gif\"><img sr', '', '\"\"', 1, 1614168764, 0);
INSERT INTO `product_chat_message` VALUES (262, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbaFw6.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbaFw6.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/Aba9yR.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/Aba9yR.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/Aba9yR.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/Aba9yR.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/Aba9yR.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/Aba9yR.gif\"><img sr', '', '\"\"', 1, 1614168774, 0);
INSERT INTO `product_chat_message` VALUES (263, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">SDK 数据解析可使用该工具，解析 oCPC JS SDK 发送的请求内容。请求内容可通过 Chrome 开发者工具找到对应请求的 payload 来获取。\n</div>', '', '\"\"', 1, 1614168804, 0);
INSERT INTO `product_chat_message` VALUES (264, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">查询构造器还为给定字段的递增或递减提供了便捷的方式。此方法提供了一个比手动编写 update 语句更具表达力且更精练的接口。\n\n这两种方法都至少接收一个参数：需要修改的列。可选的第二个参数用于控制列递增或递减的量：\n\n————————————————\n原文作者：Laravel C</div>', '', '\"\"', 1, 1614168837, 0);
INSERT INTO `product_chat_message` VALUES (265, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">222</div>', '', '\"\"', 1, 1614169535, 0);
INSERT INTO `product_chat_message` VALUES (266, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">头晕</div>', '', '\"\"', 1, 1614169542, 0);
INSERT INTO `product_chat_message` VALUES (267, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">哦我我我</div>', '', '\"\"', 1, 1614169549, 0);
INSERT INTO `product_chat_message` VALUES (268, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">111</div>', '', '\"\"', 1, 1614169559, 0);
INSERT INTO `product_chat_message` VALUES (269, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">666</div>', '', '\"\"', 1, 1614169636, 0);
INSERT INTO `product_chat_message` VALUES (270, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">欧诺</div>', '', '\"\"', 1, 1614169639, 0);
INSERT INTO `product_chat_message` VALUES (271, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">999</div>', '', '\"\"', 1, 1614169723, 0);
INSERT INTO `product_chat_message` VALUES (272, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">999</div>', '', '\"\"', 1, 1614169794, 0);
INSERT INTO `product_chat_message` VALUES (273, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">KKK</div>', '', '\"\"', 1, 1614169850, 0);
INSERT INTO `product_chat_message` VALUES (274, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">得</div>', '', '\"\"', 1, 1614169869, 0);
INSERT INTO `product_chat_message` VALUES (275, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">透明</div>', '', '\"\"', 1, 1614169881, 0);
INSERT INTO `product_chat_message` VALUES (276, 6, 5, 'voice', '', 'https://oss.bhy521qm.com/common/b129001f7308c98269cd5f86ed454529.mp3', '\"\"', 1, 1614170122, 0);
INSERT INTO `product_chat_message` VALUES (277, 6, 5, 'voice', '', 'https://oss.bhy521qm.com/common/5568d492b3b28830f4e3950f65a467c4.mp3', '\"\"', 1, 1614170124, 0);
INSERT INTO `product_chat_message` VALUES (278, 6, 23, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">11</div>', '', '\"\"', 0, 1614170161, 0);
INSERT INTO `product_chat_message` VALUES (279, 5, 19, 'voice', '', 'https://oss.bhy521qm.com/common/2752f4d925645e1819cd042279bf9e32.mp3', '\"\"', 0, 1614235700, 0);
INSERT INTO `product_chat_message` VALUES (280, 34, 25, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">222</div>', '', '\"\"', 0, 1614344766, 0);
INSERT INTO `product_chat_message` VALUES (281, 6, 34, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">,mnhh</div>', '', '\"\"', 1, 1614345059, 0);
INSERT INTO `product_chat_message` VALUES (282, 6, 34, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNrD0.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"><img src=\"https://s2.ax1x.com/2019/04/12/AbNwgs.gif\"></div>', '', '\"\"', 1, 1614345066, 0);
INSERT INTO `product_chat_message` VALUES (283, 34, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">0900</div>', '', '\"\"', 1, 1614345077, 0);
INSERT INTO `product_chat_message` VALUES (284, 6, 34, 'location', '广东省佛山市南海区大沥镇广州台德贸易有限公司', '', '[113.20349991375143,23.129522996357746]', 1, 1614345130, 0);
INSERT INTO `product_chat_message` VALUES (285, 6, 34, 'img', '', 'https://oss.bhy521qm.com/common/8c8884a3e991426f93c8a1dc684c0556.jpg', '\"\"', 1, 1614345145, 0);
INSERT INTO `product_chat_message` VALUES (286, 6, 34, 'voice', '', 'https://oss.bhy521qm.com/common/c4b52c04d68c92ef01d2049845343523.mp3', '\"\"', 1, 1614345179, 0);
INSERT INTO `product_chat_message` VALUES (287, 6, 5, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">111</div>', '', '\"\"', 1, 1614588929, 0);
INSERT INTO `product_chat_message` VALUES (288, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">232323</div>', '', '\"\"', 1, 1614601925, 1614646584);
INSERT INTO `product_chat_message` VALUES (289, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">2323</div>', '', '\"\"', 1, 1614603325, 1614646584);
INSERT INTO `product_chat_message` VALUES (290, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">155555555555</div>', '', '\"\"', 1, 1614603349, 1614646584);
INSERT INTO `product_chat_message` VALUES (291, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">http://afdasdf/c</div>', '', '\"\"', 1, 1614603360, 1614646584);
INSERT INTO `product_chat_message` VALUES (292, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">http://asfsad.com</div>', '', '\"\"', 1, 1614603366, 1614646584);
INSERT INTO `product_chat_message` VALUES (293, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">asf2</div>', '', '\"\"', 1, 1614603384, 1614646584);
INSERT INTO `product_chat_message` VALUES (294, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">http://asfas\n</div>', '', '\"\"', 1, 1614603392, 1614646584);
INSERT INTO `product_chat_message` VALUES (295, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">afasdf</div>', '', '\"\"', 1, 1614604730, 1614646584);
INSERT INTO `product_chat_message` VALUES (296, 5, 6, 'text', '<div style=\"display: flex;align-items: center;word-wrap:break-word;\">asdfasdf</div>', '', '\"\"', 1, 1614604731, 1614646584);

-- ----------------------------
-- Table structure for product_daily_sign
-- ----------------------------
DROP TABLE IF EXISTS `product_daily_sign`;
CREATE TABLE `product_daily_sign`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` int UNSIGNED NULL DEFAULT 0,
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `created_at`(`created_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户每日签到表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_daily_sign
-- ----------------------------

-- ----------------------------
-- Table structure for product_faka
-- ----------------------------
DROP TABLE IF EXISTS `product_faka`;
CREATE TABLE `product_faka`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '1：VIP 2：SVIP',
  `number` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡号',
  `mid` int NULL DEFAULT 0 COMMENT '使用用户',
  `state` tinyint(1) NULL DEFAULT 0,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `number`(`number`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 501 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发卡支付表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_faka
-- ----------------------------
INSERT INTO `product_faka` VALUES (1, 1, '38ag49ba94b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (2, 1, '3467e7gb4693', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (3, 1, '3684e87aeea3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (4, 1, '39e75e8e6563', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (5, 1, '3bg86e84ebb2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (6, 1, '2795ea8dgd52', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (7, 1, '3a975db578b3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (8, 1, '2578e6584a82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (9, 1, '2d5a885549b3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (10, 1, '3a975b8eadg3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (11, 1, '3g8gb99d54e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (12, 1, '3a975e948g93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (13, 1, '2467ee47b472', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (14, 1, '3bg864bdbd92', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (15, 1, '3467ebd9adb3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (16, 1, '2795e5d6aa62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (17, 1, '2d5a8966d993', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (18, 1, '3795ea5bbbg3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (19, 1, '2bg86e9444d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (20, 1, '2684ebgd8g52', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (21, 1, '29e75eg69gd2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (22, 1, '2g8gbg8dad83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (23, 1, '2684e9gbb642', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (24, 1, '2bg86885bee3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (25, 1, '2d5a8e8aaba3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (26, 1, '3467e54ea943', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (27, 1, '3ega9e5958g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (28, 1, '3ega9b96dd83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (29, 1, '3a975e7598a3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (30, 1, '3684eb9eebb3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (31, 1, '2d5a86d66973', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (32, 1, '3684e457b4d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (33, 1, '2bg864baabb3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (34, 1, '3467e5db4b83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (35, 1, '2d5a8eabae93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (36, 1, '28ag48e9e743', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (37, 1, '2578egbb9582', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (38, 1, '2467e5459a72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (39, 1, '2578eg8d7be2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (40, 1, '28ag49a8ad93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (41, 1, '3a97595e5a43', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (42, 1, '29e75b6885a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (43, 1, '2467e66a95g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (44, 1, '3a975bbe9de3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (45, 1, '2684e4d4aa72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (46, 1, '2a9759eb66a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (47, 1, '2795e9bb4662', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (48, 1, '38ag4ge64772', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (49, 1, '2795e978ed62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (50, 1, '28ag49g8dde3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (51, 1, '3795ee8bebd3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (52, 1, '3g8gb8e696e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (53, 1, '39e755ede9d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (54, 1, '3684eb494643', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (55, 1, '2ega9edaa4b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (56, 1, '2bg866b9e8b3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (57, 1, '3467e7gb5473', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (58, 1, '3d5a86gae782', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (59, 1, '3467e6855893', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (60, 1, '39e75bdd78e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (61, 1, '3684e4584g93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (62, 1, '2a97574ed6e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (63, 1, '3795e994ge93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (64, 1, '3g8gbdag7752', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (65, 1, '2g8gbe98ag73', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (66, 1, '2578e8be9g52', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (67, 1, '2795e5g8g472', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (68, 1, '3d5a85b78562', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (69, 1, '3467e58b8563', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (70, 1, '2ega9ga4ddb2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (71, 1, '3a975d7g4g73', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (72, 1, '3467e5d49eb3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (73, 1, '29e75eb996b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (74, 1, '2ega9767ba52', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (75, 1, '2g8gbea88563', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (76, 1, '2684ee68g972', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (77, 1, '3578e6b6e743', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (78, 1, '2a975bd76ad2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (79, 1, '2a975759db62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (80, 1, '3795e9756463', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (81, 1, '3d5a88d9d8g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (82, 1, '3g8gbd6b7de2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (83, 1, '3467e5eb6663', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (84, 1, '3d5a86b7b692', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (85, 1, '2684ee954b92', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (86, 1, '2578eggae5g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (87, 1, '2bg86487a8d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (88, 1, '3a975e4d6b63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (89, 1, '2795ea8eb6g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (90, 1, '3bg86649e562', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (91, 1, '3a975e8d4a83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (92, 1, '2g8gbgde7a63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (93, 1, '3684e94975d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (94, 1, '29e755789982', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (95, 1, '3467eb4de853', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (96, 1, '2a9755aa4g42', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (97, 1, '2795ee64ed92', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (98, 1, '3a97599e4463', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (99, 1, '2ega9g944gg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (100, 1, '2a97579d7542', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (101, 1, '3684e89649g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (102, 1, '2467e6464aa2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (103, 1, '3467ebbabgd3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (104, 1, '3a975b5ag8d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (105, 1, '38ag4g9b69b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (106, 1, '2684ee99g9d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (107, 1, '2g8gbe56g563', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (108, 1, '2bg866g55gb3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (109, 1, '2d5a8987bge3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (110, 1, '3684e49667d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (111, 1, '3a975bae6ba3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (112, 1, '2a975ede9462', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (113, 1, '3ega9bde94g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (114, 1, '3795ea7a8883', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (115, 1, '2795e8a665b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (116, 1, '2d5a89566da3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (117, 1, '3a975egde6a3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (118, 1, '2a975d8dbe42', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (119, 1, '29e75ad97942', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (120, 1, '2g8gb844b893', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (121, 1, '2d5a85dd5473', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (122, 1, '3g8gbbe856a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (123, 1, '3467eb7be493', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (124, 1, '2a975948d7d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (125, 1, '2795ee6e69d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (126, 1, '2795e55aab62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (127, 1, '29e757d8e4d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (128, 1, '3684e8ad9873', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (129, 1, '3578e7abg6b3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (130, 1, '2g8gbed88gb3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (131, 1, '2795e9agg582', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (132, 1, '3578e7eg5783', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (133, 1, '2684e76a9792', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (134, 1, '2d5a855ded83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (135, 1, '3467e6g8e8g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (136, 1, '2a975e45d872', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (137, 1, '2g8gb8ag4443', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (138, 1, '2a975e4a7572', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (139, 1, '3d5a8a997aa2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (140, 1, '2d5a886aa743', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (141, 1, '2d5a8aa974d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (142, 1, '39e759d8dag3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (143, 1, '2a975d589ed2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (144, 1, '2d5a8e48g463', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (145, 1, '3ega97474ad3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (146, 1, '29e75ea89782', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (147, 1, '3bg864eeeb72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (148, 1, '3bg86g4d6a82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (149, 1, '2bg86gd4b5e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (150, 1, '3795ea78db63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (151, 1, '38ag49agg642', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (152, 1, '28ag48e6dbb3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (153, 1, '38ag4bgda4b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (154, 1, '3467e766ea63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (155, 1, '3467eb68d643', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (156, 1, '2795e9d584a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (157, 1, '2578e6gg6592', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (158, 1, '2684e7e9be42', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (159, 1, '3g8gb97b57d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (160, 1, '3467e6d4d6g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (161, 1, '3684e9766g63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (162, 1, '2795e8bg7g62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (163, 1, '38ag445565d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (164, 1, '29e759g86ee2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (165, 1, '28ag4b8g9dd3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (166, 1, '2795edbddgg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (167, 1, '3d5a8658e472', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (168, 1, '3a9759b8dea3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (169, 1, '2795e97g78a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (170, 1, '3795eadgd883', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (171, 1, '2a975756abb2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (172, 1, '39e75e6ba963', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (173, 1, '2578eb87bdg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (174, 1, '2578e8ga46b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (175, 1, '29e75a848a82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (176, 1, '3795ed49eb83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (177, 1, '2g8gbdag9563', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (178, 1, '3a975578aag3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (179, 1, '29e75b689eb2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (180, 1, '29e75e47e5g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (181, 1, '2d5a86ed6573', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (182, 1, '38ag4g5ab9g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (183, 1, '2578eb794ed2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (184, 1, '3ega97bg5b43', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (185, 1, '3ega99885573', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (186, 1, '2795ed6ba8a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (187, 1, '3bg8648e4a62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (188, 1, '38ag4b5ea782', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (189, 1, '28ag4aag4eg3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (190, 1, '2467ee7bd482', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (191, 1, '2a975746gb62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (192, 1, '2d5a86d49gg3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (193, 1, '3684ee5abea3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (194, 1, '3467eeagab53', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (195, 1, '28ag4a86age3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (196, 1, '38ag49e84d72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (197, 1, '3795ee87ga63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (198, 1, '2467e549dba2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (199, 1, '3g8gbg588842', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (200, 1, '3ega9aa95ga3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (201, 1, '2g8gb88da4e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (202, 1, '3467e675de83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (203, 1, '2795e8779g92', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (204, 1, '29e75ae8eg42', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (205, 1, '2795e87e9742', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (206, 1, '3g8gb985a4e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (207, 1, '2d5a866d7a43', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (208, 1, '28ag4gade9d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (209, 1, '3a9757e7ba63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (210, 1, '3795ede55gg3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (211, 1, '3467e56g45g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (212, 1, '3467e6b89da3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (213, 1, '3ega97467ba3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (214, 1, '3578e86gb553', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (215, 1, '3a9757e64853', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (216, 1, '2ega9a7d5d72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (217, 1, '2795e959ag82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (218, 1, '2684e4dd4862', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (219, 1, '2d5a88a6g4b3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (220, 1, '3bg86878b442', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (221, 1, '2578eb5d78g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (222, 1, '3684eb6aa4e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (223, 1, '2g8gbddga9g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (224, 1, '3bg86dedee72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (225, 1, '3684e4b96gg3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (226, 1, '2684e7a6ddd2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (227, 1, '3ega9e679463', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (228, 1, '2g8gbeg68g63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (229, 1, '2467eb8deg92', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (230, 1, '2467e6ed7d42', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (231, 1, '3795e8694853', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (232, 1, '3684e7ed7a53', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (233, 1, '28ag49484863', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (234, 1, '38ag4b8g4g52', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (235, 1, '3a9759565783', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (236, 1, '2ega99a95ag2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (237, 1, '2578e8569952', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (238, 1, '2795eda858b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (239, 1, '2a975dd57a62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (240, 1, '2684e77aa442', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (241, 1, '2467e6g976b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (242, 1, '3bg8686d7552', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (243, 1, '2684e4546a72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (244, 1, '2ega9bbegbg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (245, 1, '38ag495594a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (246, 1, '2467ead879a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (247, 1, '2bg8648e58b3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (248, 1, '2bg866bb9673', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (249, 1, '3467e749d4g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (250, 1, '29e759ad4ab2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (251, 1, '2d5a86ebd663', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (252, 1, '2g8gbb989543', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (253, 1, '2578ebe6eb82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (254, 1, '3bg86de8deb2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (255, 1, '3g8gb869db72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (256, 1, '2bg86g5ee9e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (257, 1, '3a97596eb7a3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (258, 1, '2g8gbd9g6bg3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (259, 1, '2d5a8659b493', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (260, 1, '3ega9a4bb853', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (261, 1, '2g8gbd4degg3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (262, 1, '2g8gb8766ad3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (263, 1, '2684ebbg4e42', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (264, 1, '39e75a4dg6g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (265, 1, '28ag4a59g873', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (266, 1, '28ag4g498aa3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (267, 1, '2d5a8e9g7e53', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (268, 1, '29e75e4d7bd2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (269, 1, '3a975db65763', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (270, 1, '2g8gbg495963', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (271, 1, '2795e9994762', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (272, 1, '2684ee786e52', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (273, 1, '3684e87d88d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (274, 1, '3g8gbg65g5d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (275, 1, '2795ea7bdg82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (276, 1, '2ega994a7g82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (277, 1, '2a9755bbada2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (278, 1, '2d5a8a8ddb83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (279, 1, '3578e6599a53', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (280, 1, '2ega9eeeg7a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (281, 1, '3467e6a74543', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (282, 1, '38ag4b79b4e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (283, 1, '3684e4e7b693', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (284, 1, '3bg866e699g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (285, 1, '3684eb8d7943', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (286, 1, '3a975de56573', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (287, 1, '2578ebbgga42', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (288, 1, '2a97576798e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (289, 1, '2a975d55g762', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (290, 1, '3g8gbbge6gb2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (291, 1, '2bg86ea7d6a3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (292, 1, '3795e9a494g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (293, 1, '28ag49e49663', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (294, 1, '2g8gbg79d563', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (295, 1, '2a975b5e4d42', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (296, 1, '38ag49g6b552', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (297, 1, '2578eb6aad92', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (298, 1, '2ega97ag4992', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (299, 1, '3a9757e995g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (300, 1, '28ag49d44db3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (301, 1, '2g8gbe45a563', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (302, 1, '2ega9gd44462', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (303, 1, '29e7594a86e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (304, 1, '2578ebdg7g52', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (305, 1, '3467ea5b6de3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (306, 1, '2684eb4g5d72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (307, 1, '3d5a886ea8g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (308, 1, '29e7579g5a82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (309, 1, '2684e9446g82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (310, 1, '2795e988b6a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (311, 1, '2d5a8e6d4543', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (312, 2, '2a97575996b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (313, 2, '3g8gbbd7abb2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (314, 2, '2795ee595672', 5, 1, 1612523769, 1614334805);
INSERT INTO `product_faka` VALUES (315, 1, '2a975946a462', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (316, 1, '3a97577ge8g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (317, 1, '3d5a8egeb6g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (318, 1, '2bg86674d6e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (319, 1, '2795ed89e672', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (320, 1, '3bg868gdaa62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (321, 1, '39e7577ade63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (322, 1, '28ag49bg6b83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (323, 1, '2d5a85g6a883', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (324, 1, '38ag4g6geg62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (325, 1, '38ag497569b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (326, 1, '2d5a8546d683', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (327, 1, '3684e4e54b93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (328, 1, '39e75e8aaeb3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (329, 1, '39e75b68d893', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (330, 1, '39e75bbe4993', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (331, 1, '3a975dd76983', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (332, 1, '28ag4bgb44g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (333, 1, '38ag4gegd9e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (334, 1, '2d5a894d49a3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (335, 1, '3g8gbeab7482', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (336, 1, '28ag4g477583', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (337, 1, '3a9759a958e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (338, 1, '2d5a8895bga3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (339, 1, '2d5a85ga5gd3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (340, 1, '2467ee9abb72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (341, 1, '2ega9b69a592', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (342, 1, '3a9757d47g73', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (343, 1, '2ega9babb4d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (344, 1, '3467e7ag9483', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (345, 1, '3g8gbb866dg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (346, 1, '3684eegge943', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (347, 1, '2bg86678g573', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (348, 1, '3684e96d7753', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (349, 1, '2467e6a54bb2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (350, 1, '3bg86e55be82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (351, 1, '2g8gbe6dggg3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (352, 1, '3795eagb9783', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (353, 1, '2684ee9b9ad2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (354, 1, '3d5a86d88462', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (355, 1, '3d5a8eb74gg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (356, 1, '3a97575aag83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (357, 1, '3bg86e597db2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (358, 1, '2ega9g6ae4e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (359, 1, '2ega9b5447e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (360, 1, '3bg86848d982', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (361, 1, '29e75948a572', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (362, 1, '3795eeda75e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (363, 1, '2578eg7ddg62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (364, 1, '3467e6g95e73', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (365, 1, '3ega97eag8e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (366, 1, '2578eebgbde2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (367, 1, '3g8gbg8846b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (368, 1, '28ag4gb44e83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (369, 1, '2a9757eg89e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (370, 1, '2d5a89a4d7b3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (371, 1, '3467e7689db3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (372, 1, '2578eg8789d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (373, 1, '3684e4bda993', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (374, 1, '39e75bbg9ab3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (375, 1, '2467eb9ade52', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (376, 1, '3ega9be5eg43', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (377, 1, '2684e9a59bg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (378, 1, '3467e6g55b63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (379, 1, '28ag4a46ede3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (380, 1, '2g8gbd4bbbe3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (381, 1, '2d5a8984a6g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (382, 1, '29e75ead5de2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (383, 1, '3795e57e9883', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (384, 1, '3467e75ag953', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (385, 1, '3g8gbbg96ad2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (386, 1, '2795eab574e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (387, 1, '2bg8644baeb3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (388, 1, '3g8gb978da62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (389, 1, '3d5a85g99d92', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (390, 1, '2d5a89aggb93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (391, 1, '3467e77d8593', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (392, 1, '39e759a854d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (393, 1, '38ag49968a82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (394, 1, '3d5a88eb95g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (395, 1, '2bg86g49bba3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (396, 1, '3ega97be8e83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (397, 1, '3a975b7b8453', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (398, 1, '3684e779d673', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (399, 1, '3467eabad7a3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (400, 1, '3bg86e58e5a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (401, 1, '2ega9ad575g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (402, 1, '3d5a8eeg5462', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (403, 1, '28ag4ab44ge3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (404, 1, '3467ee9867a3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (405, 1, '3684e97aaae3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (406, 1, '3g8gbg6deb52', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (407, 1, '2ega99895b42', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (408, 1, '2bg86gaeebg3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (409, 1, '28ag48abg483', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (410, 1, '28ag4g587e83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (411, 1, '28ag4g97ead3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (412, 1, '39e755a9d943', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (413, 1, '2d5a8e48g863', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (414, 1, '3684e9g5ae73', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (415, 1, '2d5a86884e83', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (416, 1, '3578eeda49e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (417, 1, '39e7578g9b93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (418, 1, '3578e886ead3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (419, 1, '2684eb9858b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (420, 1, '2bg86499bdd3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (421, 1, '2795ee9g5b92', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (422, 1, '3684eb9d9e93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (423, 1, '2a975ed6d872', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (424, 1, '3bg86g578542', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (425, 1, '3g8gbg7ab682', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (426, 1, '3bg86856gad2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (427, 1, '29e757b54ed2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (428, 1, '3467e5de9453', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (429, 1, '2bg868gb7583', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (430, 1, '3ega979ba5d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (431, 1, '3578eb898b93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (432, 1, '3ega9ag674g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (433, 1, '3d5a86agdde2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (434, 1, '2d5a8aee8gb3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (435, 1, '2d5a8ea4ede3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (436, 1, '39e75a5agg63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (437, 1, '29e75b684eg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (438, 1, '3d5a86677982', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (439, 1, '29e755degg62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (440, 1, '2bg86g756993', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (441, 1, '3467eb6ad663', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (442, 1, '3578e65g6463', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (443, 1, '3bg864g56d82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (444, 1, '3g8gbea944g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (445, 1, '29e75b89bbe2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (446, 1, '2d5a89958g93', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (447, 1, '2g8gbdgae6d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (448, 1, '2795e975e7b2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (449, 1, '39e757ag98a3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (450, 1, '2578e6ea7ed2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (451, 1, '3d5a8a766eg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (452, 1, '2795eae4d682', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (453, 1, '29e75e8a95e2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (454, 1, '2ega9a7d9462', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (455, 1, '3ega9g58e793', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (456, 1, '2795e9bed7g2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (457, 1, '28ag4499g8b3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (458, 1, '38ag4aa8ag62', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (459, 1, '3bg86ebg57d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (460, 1, '3g8gbe8a9992', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (461, 1, '3ega9add87g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (462, 1, '28ag4987aa63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (463, 1, '2g8gbgggb7d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (464, 1, '2795e5968g72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (465, 1, '2ega9g9a5eb2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (466, 1, '38ag498796d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (467, 1, '3bg86ddedee2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (468, 1, '2a975edadeg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (469, 1, '3d5a8ee7ad52', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (470, 1, '3bg86g7446d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (471, 1, '2467eb7b4ab2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (472, 1, '29e75eg9a682', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (473, 1, '2467e69e4g82', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (474, 1, '38ag4487aga2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (475, 1, '28ag4b46dea3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (476, 1, '39e759eda7g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (477, 1, '2795ee59a762', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (478, 1, '2a975d7d4ga2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (479, 1, '3578ee5468d3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (480, 1, '2g8gbe996g73', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (481, 1, '3467eeag4db3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (482, 1, '38ag498d8a72', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (483, 1, '29e75a979ab2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (484, 1, '2684e4de8gd2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (485, 1, '2bg8647b6g53', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (486, 1, '3ega99eb7bd3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (487, 1, '2795eed65552', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (488, 1, '29e75e9bgbg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (489, 1, '3795ea957g63', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (490, 1, '3ega998845e3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (491, 1, '3ega994686g3', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (492, 1, '3ega9ggbde53', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (493, 1, '3bg8684994a2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (494, 1, '28ag4gd67893', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (495, 1, '38ag4g8ed8d2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (496, 1, '2467e766ggg2', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (497, 1, '3d5a86dbg942', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (498, 1, '2ega9ga7g862', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (499, 1, '3795ed4bdd53', 0, 0, 1612523769, 0);
INSERT INTO `product_faka` VALUES (500, 1, '3578e775ba53', 0, 0, 1612523769, 0);

-- ----------------------------
-- Table structure for product_forum_ad
-- ----------------------------
DROP TABLE IF EXISTS `product_forum_ad`;
CREATE TABLE `product_forum_ad`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('grid','banner') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'grid' COMMENT '广告类型，九宫格|长图',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `article_id` int NULL DEFAULT 0,
  `state` tinyint(1) NULL DEFAULT 0,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '论坛广告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_forum_ad
-- ----------------------------
INSERT INTO `product_forum_ad` VALUES (1, 'grid', '按时发斯蒂芬123', 'https://oss.bhy521qm.com/common/3a5d4c5fc25da6669748c7dd17262371.jpg', 0, 1, '<p>萨法大法师按时阿嘎哈司法所</p><p><br></p><p><img src=\"https://oss.bhy521qm.com/common/bc1614d1ddae4d7ebf8cbb967635ad23.gif\" style=\"max-width:100%;\"><br></p>', 1610891614, 1610892331);
INSERT INTO `product_forum_ad` VALUES (3, 'banner', 'fasdfasf', 'https://oss.bhy521qm.com/common/ac43906eb2a54bd7099abadc926e9d00.jpg', 0, 1, '<p>阿飞洒发的发生</p>', 1666666666, 1610892274);
INSERT INTO `product_forum_ad` VALUES (4, 'grid', '是打发斯蒂芬', 'https://oss.bhy521qm.com/common/3a5d4c5fc25da6669748c7dd17262371.jpg', 0, 1, '<p><img src=\"https://oss.bhy521qm.com/common/0a36985bf7265433d1fd59c389d19f82.png\" style=\"max-width:100%;\"><br></p>', 2147483647, 1610939942);
INSERT INTO `product_forum_ad` VALUES (5, 'banner', 'dasfasdf', 'https://oss.bhy521qm.com/common/ac43906eb2a54bd7099abadc926e9d00.jpg', 0, 1, 'fasfasf', 2147483647, 0);
INSERT INTO `product_forum_ad` VALUES (6, 'grid', 'xxxxxx', 'https://oss.bhy521qm.com/common/6d4975a9e0dcd0b90e5631aeb5c246a2.png', 0, 1, '<p><span style=\"background-color: rgb(139, 170, 74);\">asdfsaf暗示法萨芬撒<b><font size=\"2\">地方撒发斯蒂芬</font></b></span></p><table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><th></th><th></th><th></th><th></th><th></th></tr><tr><td>2223</td><td></td><td></td><td></td><td></td></tr><tr><td></td><td>2323</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>2323</td><td></td><td></td></tr><tr><td></td><td></td><td></td><td></td><td></td></tr></tbody></table><p><br></p><p><a href=\"16666666666\" target=\"_blank\">16666666666</a><img class=\"eleImg\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[[舔屏]]\"><br></p>', 1888888888, 1610940371);

-- ----------------------------
-- Table structure for product_forum_article
-- ----------------------------
DROP TABLE IF EXISTS `product_forum_article`;
CREATE TABLE `product_forum_article`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_id` int NULL DEFAULT 0,
  `mid` int NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `resource_urls` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '多图',
  `wechat` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qq` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT 0,
  `like_num` int NULL DEFAULT 0 COMMENT '点赞数',
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catedid`(`cate_id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '论坛文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_forum_article
-- ----------------------------
INSERT INTO `product_forum_article` VALUES (1, 3, 2, 'asfasdf111', 'https://oss.bhy521qm.com/common/0d8568cd68de0a77ae7675fb5e543275.png', '<p>af<u><i><font color=\"#8baa4a\">asdfasdfsdfasfssadf</font></i></u></p><h1><b id=\"hibqs\"><u><i><font color=\"#8baa4a\">asfasf</font></i></u></b></h1>', NULL, NULL, NULL, NULL, 1, 666, 1610932530, 1610932869);
INSERT INTO `product_forum_article` VALUES (2, 3, 0, 'cl大叔法術7阿斯頓發生222222', 'https://oss.bhy521qm.com/common/962d84308b5a8b01e32724b7c80ab28a.png', '<p>a撒發射點發射點發射點發</p><p><br></p><p><img src=\"https://oss.bhy521qm.com/common/f820d45da94ce5798440a4bb59378813.png\" style=\"max-width:100%;\"><br></p>', NULL, NULL, NULL, NULL, 1, 669, 1610932900, 1610932987);
INSERT INTO `product_forum_article` VALUES (3, 3, 1, 'asf撒发顺丰33333', 'https://oss.bhy521qm.com/common/962d84308b5a8b01e32724b7c80ab28a.png', '按时发顺丰', NULL, NULL, NULL, NULL, 1, 335, 1666666666, 0);
INSERT INTO `product_forum_article` VALUES (4, 3, 3, 'fafasdfasfasdf444444', 'https://oss.bhy521qm.com/common/962d84308b5a8b01e32724b7c80ab28a.png', '<p>asfasf</p><div style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; font-family: &quot;Segoe UI&quot;, SegoeUI, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 15px; background-color: rgb(242, 242, 242);\"><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">您好！</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">&nbsp;</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">由于长时间未得到您的回复，该问题我们会暂时作为归档处理，如果您仍有问题，欢迎随时跟帖回复。如果有其他问题需要提交，也欢迎您再次提问。</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">&nbsp;</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">感谢使用微软产品。</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">&nbsp;</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">如果您所咨询的问题，得到解决请对我们的回复进行标记解答（对我们的工作非常重要）</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">&nbsp;</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">如您的问题没有解决，我们会继续为您提供技术支持。</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">&nbsp;</span></p><p style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; min-height: 19px; overflow-wrap: break-word;\"><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">我们秉承客户至上的服务理念。如果您对微软工程师在论坛中的服务有意见与建议，欢迎提出，以便我们提供更优质的服务。</span><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">Microsoft Answers</span><span style=\"box-sizing: inherit; border: 0px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none;\">欢迎您！</span></p><span style=\"box-sizing: inherit; border: 0px; margin-top: 12px; vertical-align: top; -webkit-font-smoothing: antialiased; text-size-adjust: none; font-size: 12px; display: block;\">如果我们的回复对您有所帮助，请您点击左下角的“是”，标记为答案。这将会帮助到其他与您遇到同样问题的用户！非常感谢您为社区作出的贡献！<br style=\"box-sizing: inherit;\"><br style=\"box-sizing: inherit;\">如您的问题没有解决，您可以再次回复帖子，我们会继续为您提供技术支持<br style=\"box-sizing: inherit;\"><br style=\"box-sizing: inherit;\">我们秉承客户至上的服务理念。如果您对微软工程师在论坛中的服务有意见与建议，欢迎提出，以便我们提供更优质的服务。Microsoft Answers欢迎您！</span></div>', NULL, NULL, NULL, NULL, 1, 228, 2147483647, 1610949041);
INSERT INTO `product_forum_article` VALUES (6, 3, 6, '我固体李屯噢噢', 'https://oss.bhy521qm.com/common/c9dd3ffdde1654bca55ed45835099135.jpg', '一组提提途虎涂鸦我我就', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/80a550edecf730042e1ecfe3c9cb4f15.jpg\",\"https:\\/\\/oss.bhy521qm.com\\/common\\/0cdbbe797897902a95ab0c9dd25418cb.jpg\"]', NULL, NULL, NULL, 1, 5, 1612442687, 0);
INSERT INTO `product_forum_article` VALUES (7, 2, 5, '阿斯顿发斯蒂芬阿斯蒂芬', 'https://oss.bhy521qm.com/common/10c91e1a4a49ecec3bfff9258ec4ef8a.jpg', '阿斯顿发送到发送到发士大夫撒发1213123123', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/ceada5f0c038aa2f99062d3e77b98861.png\",\"https:\\/\\/oss.bhy521qm.com\\/common\\/b023b7d427248fa23ce52eb517bade72.png\",\"https:\\/\\/oss.bhy521qm.com\\/common\\/55131690e71d50b94164c93adbcfece4.png\"]', NULL, NULL, NULL, 1, 0, 1612492811, 0);
INSERT INTO `product_forum_article` VALUES (9, 3, 6, '哈啊哈弄哦哦哦', 'https://oss.bhy521qm.com/common/bb1a66e881be5033df8a3ae7b5e45f9a.jpg', '我我在外婆哄你明敏H5的兼容性问题，H5的兼容性问题，可以用第三方库，具体请看uni-app 复制到剪贴板全端实现方式H5的兼容性问题，可以用第三方库，具体请看uni-app 复制到剪贴板全端实现方式H5的兼容性问题，可以用第三方库，具体请看uni-app 复制到剪贴板全端实现方式H5的兼容性问题，可以用第三方库，具体请看uni-app 复制到剪贴板全端实现方式H5的兼容性问题，可以用第三方库，具体请看uni-app 复制到剪贴板全端实现方式H5的兼容性问题，可以用第三方库，具体请看uni-app 复制到剪贴板全端实现方式H5的兼容性问题，可以用第三方库，具体请看uni-app 复制到剪贴板全端实现方式可以用第三方库，具体请看uni-app 复制到剪贴板全端实现方式', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/1647288324d9686c1c383564424c2d86.jpg\",\"https:\\/\\/oss.bhy521qm.com\\/common\\/02f893fccabf178dcce3242965d9a6c6.jpg\"]', NULL, NULL, NULL, 1, 2, 1614170562, 0);
INSERT INTO `product_forum_article` VALUES (10, 1, 5, '安抚暗示法阿斯顿发顺丰', 'https://oss.bhy521qm.com/common/3cc0979713cf2e20e79428a5c2b61f3a.png', '阿斯顿发送到发送到发撒的发生发送到发送到', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/31d2f7bf78ab1be88c554296970dbd06.jpg\",\"https:\\/\\/oss.bhy521qm.com\\/common\\/3d15fd1b7ef96b51fb5d90702fcd2eb7.png\"]', '2222222', '66666666', '1111111', 1, 0, 1614487242, 0);

-- ----------------------------
-- Table structure for product_forum_article_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_forum_article_comments`;
CREATE TABLE `product_forum_article_comments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` int NULL DEFAULT NULL,
  `mid` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT 0,
  `update_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `articleid`(`article_id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '论坛文章评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_forum_article_comments
-- ----------------------------
INSERT INTO `product_forum_article_comments` VALUES (1, 4, 2, 'asfasfasdf', 166666666, 0);
INSERT INTO `product_forum_article_comments` VALUES (2, 4, 6, '阿斯顿发送到发沙发沙发斯蒂芬', 177777777, 0);
INSERT INTO `product_forum_article_comments` VALUES (3, 3, 6, '阿斯顿发送到发斯蒂芬', 1610975352, 0);
INSERT INTO `product_forum_article_comments` VALUES (4, 3, 6, '的发生大法师法师法撒水电费', 1610975411, 0);
INSERT INTO `product_forum_article_comments` VALUES (5, 6, 5, '66666', 1612446342, 0);
INSERT INTO `product_forum_article_comments` VALUES (6, 5, 5, 'fgasdfasdf', 1612490226, 0);

-- ----------------------------
-- Table structure for product_forum_category
-- ----------------------------
DROP TABLE IF EXISTS `product_forum_category`;
CREATE TABLE `product_forum_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` tinyint NULL DEFAULT 0,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '论坛分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_forum_category
-- ----------------------------
INSERT INTO `product_forum_category` VALUES (1, 0, '旅游', 'https://oss.bhy521qm.com/common/bbf0be5122bdf2aa83e30bc960cdccd3.jpg', 1, 1610788558, 1610933033);
INSERT INTO `product_forum_category` VALUES (2, 0, '体育', 'https://oss.bhy521qm.com/common/dd97bba90de7f49a5a2ef167cd49b717.png', 1, 1610788564, 1610933034);
INSERT INTO `product_forum_category` VALUES (3, 0, '财经', 'https://oss.bhy521qm.com/common/085eea1a3c4792f56e346f6fc3867994.jpg', 1, 1610788570, 1610890183);
INSERT INTO `product_forum_category` VALUES (4, 0, 'VIP专区', 'https://oss.bhy521qm.com/common/7f8f78542659f207415d650b9526dbc1.png', 1, 1610788584, 1610890176);
INSERT INTO `product_forum_category` VALUES (5, 0, '成都市', 'https://oss.bhy521qm.com/common/d5cc33ef778b2841eef77fdb7bfb31bb.png', 1, 1610939992, 1610939996);

-- ----------------------------
-- Table structure for product_sms
-- ----------------------------
DROP TABLE IF EXISTS `product_sms`;
CREATE TABLE `product_sms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1：注册，2：找回密码',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT 0,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_sms
-- ----------------------------
INSERT INTO `product_sms` VALUES (1, 1, '13710318844', '9263', 'success;4994525\r\n', 0, 1614340475, 0);
INSERT INTO `product_sms` VALUES (2, 1, '13710318844', '6666', 'success;4994533\r\n', 1, 1614340814, 1614343129);
INSERT INTO `product_sms` VALUES (3, 1, '19999999991', '6666', '水水水水', 1, 1666666, 1614343659);

-- ----------------------------
-- Table structure for product_video_ad
-- ----------------------------
DROP TABLE IF EXISTS `product_video_ad`;
CREATE TABLE `product_video_ad`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('video','image') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'video' COMMENT '广告类型，视频、图片',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `area_id` int NULL DEFAULT 0,
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `resource_urls` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `state` tinyint(1) NULL DEFAULT 0,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短视频广告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_video_ad
-- ----------------------------
INSERT INTO `product_video_ad` VALUES (1, 'video', '碍事法师打发爽肤水', 4, NULL, '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/05f3cb4f48dfadea354efe01ce3bdbc5.mp4\"]', '<p>阿斯顿发送到发</p><p>2323</p><p>8888</p>', 1, 1612406835, 1612407415);

-- ----------------------------
-- Table structure for product_video_area
-- ----------------------------
DROP TABLE IF EXISTS `product_video_area`;
CREATE TABLE `product_video_area`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT 0,
  `created_at` int NULL DEFAULT 0,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频所在城市区域表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_video_area
-- ----------------------------
INSERT INTO `product_video_area` VALUES (1, '广州市', 1, 1610788413, 1610799424);
INSERT INTO `product_video_area` VALUES (2, '深圳市', 1, 1610788419, 1610799425);
INSERT INTO `product_video_area` VALUES (3, '上海市', 0, 1610788426, 1614241695);
INSERT INTO `product_video_area` VALUES (4, '四川市', 0, 1610788433, 1614241696);
INSERT INTO `product_video_area` VALUES (5, '北京市', 0, 1610788440, 0);
INSERT INTO `product_video_area` VALUES (6, '佛山市', 1, 1610788455, 1610799421);
INSERT INTO `product_video_area` VALUES (7, '珠海市', 1, 1614240371, 1614241688);
INSERT INTO `product_video_area` VALUES (8, '中上市', 1, 1614241022, 1614241687);
INSERT INTO `product_video_area` VALUES (9, '惠州市', 1, 1614241039, 1614241687);
INSERT INTO `product_video_area` VALUES (10, '杭州市', 1, 1614241052, 1614241686);
INSERT INTO `product_video_area` VALUES (11, '南宁市', 1, 1614241061, 1614241686);
INSERT INTO `product_video_area` VALUES (12, '重庆市', 1, 1614241068, 1614241685);
INSERT INTO `product_video_area` VALUES (13, '肇庆市', 1, 1614241095, 1614241685);
INSERT INTO `product_video_area` VALUES (14, '清远市', 1, 1614241710, 1614241726);
INSERT INTO `product_video_area` VALUES (15, '江门市', 1, 1614241718, 1614241726);

-- ----------------------------
-- Table structure for product_video_category
-- ----------------------------
DROP TABLE IF EXISTS `product_video_category`;
CREATE TABLE `product_video_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int UNSIGNED NULL DEFAULT 0,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT 0,
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短视频分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_video_category
-- ----------------------------
INSERT INTO `product_video_category` VALUES (1, 0, '教育', NULL, 0, 1610786947, 0);
INSERT INTO `product_video_category` VALUES (2, 0, '旅游', NULL, 0, 1610787010, 1610787030);
INSERT INTO `product_video_category` VALUES (3, 0, '美食', NULL, 0, 1610787016, 0);
INSERT INTO `product_video_category` VALUES (4, 0, '美女', NULL, 0, 1610787037, 0);

-- ----------------------------
-- Table structure for product_video_data
-- ----------------------------
DROP TABLE IF EXISTS `product_video_data`;
CREATE TABLE `product_video_data`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_id` int UNSIGNED NULL DEFAULT 0,
  `area_id` int NULL DEFAULT 0 COMMENT '城市ID',
  `type` enum('video','image') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'video',
  `mid` int NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  `resource_urls` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片或视频url集合',
  `like_num` int NULL DEFAULT 0 COMMENT '点赞数量',
  `comments_count` int NULL DEFAULT 0 COMMENT '评论数量',
  `view_count` int NULL DEFAULT 0 COMMENT '浏览数量',
  `state` tinyint(1) NULL DEFAULT 0,
  `deleted_at` int NULL DEFAULT 0,
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `cated_id`(`cate_id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `created_at`(`created_at`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `like_num`(`like_num`) USING BTREE,
  INDEX `comments_count`(`comments_count`) USING BTREE,
  INDEX `viewcount`(`view_count`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短视频数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_video_data
-- ----------------------------
INSERT INTO `product_video_data` VALUES (2, 1, 2, 'image', 0, '阿发送到发斯蒂芬333', 'https://oss.bhy521qm.com/common/0fb2169a72eb78aaa61cd44771a290cb.png', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/93a96fb761993d3d0b91fa6ce392fff9.jpg\",\"https:\\/\\/oss.bhy521qm.com\\/common\\/9abbbb235de00a5930d42a87663254dc.jpg\"]', 0, 0, 3, 1, 0, 1610803478, 2021);
INSERT INTO `product_video_data` VALUES (3, 2, 4, 'video', 5, 'DAFASDFASDF66666', 'https://oss.bhy521qm.com/common/0fb2169a72eb78aaa61cd44771a290cb.png', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/5c9649e7b95308734c8e2ba3e5dd1c5f.mp4\"]', 0, 0, 7, 1, 0, 1610803478, 1610805257);
INSERT INTO `product_video_data` VALUES (4, 3, 2, 'video', 6, '军事观察室2021', 'https://oss.bhy521qm.com/common/d80b8b7e9b0d78686f8c220785a417d6.jpg', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/bec98baa3d09834d1a110aa5c2d8fa9a.mp4\"]', 8, 0, 6, 1, 0, 1610805602, 0);
INSERT INTO `product_video_data` VALUES (5, 1, 1, 'video', 6, 'wwwwwwwwwwwwwww', 'https://oss.bhy521qm.com/common/217b308dfdb671065b2751920add05fe.jpg', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/7cc3d774ef909e50fdff6ab88d020bfd.mp4\"]', 0, 0, 5, 1, 0, 1610805648, 0);
INSERT INTO `product_video_data` VALUES (6, 2, 1, 'video', 6, '任正非12666666666', 'https://oss.bhy521qm.com/common/0fb2169a72eb78aaa61cd44771a290cb.png', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/85d3c47b72104426cdcd6838754a5f87.mp4\"]', 0, 0, 6, 1, 0, 1612405698, 1612405714);
INSERT INTO `product_video_data` VALUES (7, 0, 6, 'video', 5, 'asfsafasdfasdf', NULL, '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/7b423070f26422595bb238f5da044c4f.mp4\"]', 0, 0, 4, 1, 0, 1612433222, 0);
INSERT INTO `product_video_data` VALUES (11, 0, 15, 'video', 5, '碍事法师法师法士大夫', 'https://oss.bhy521qm.com/common/f16828a591c0a31c112cba21c5daf2d0.jpg', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/0b790a0117e1697818011897c6750f32.mp4\"]', 2, 0, 6, 1, 0, 1614487780, 0);
INSERT INTO `product_video_data` VALUES (12, 0, 1, 'video', 6, '这是一个创业公司人物', 'https://oss.bhy521qm.com/common/f4deab85a6f0167b827301ef06c41e0d.jpg', '[\"https:\\/\\/oss.bhy521qm.com\\/common\\/1b65832570f374e2c1b921969c7d86c6.mp4\"]', 0, 0, 4, 1, 0, 1614488536, 0);

-- ----------------------------
-- Table structure for product_video_data_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_video_data_comments`;
CREATE TABLE `product_video_data_comments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `video_data_id` int UNSIGNED NULL DEFAULT 0,
  `mid` int UNSIGNED NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT 0,
  `updated_at` int NULL DEFAULT 0,
  `deleted_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `video_data_id`(`video_data_id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_video_data_comments
-- ----------------------------
INSERT INTO `product_video_data_comments` VALUES (1, 3, 6, '12366', 1614167185, 0, 0);
INSERT INTO `product_video_data_comments` VALUES (2, 3, 6, '头木木木黄金', 1614167194, 0, 0);
INSERT INTO `product_video_data_comments` VALUES (3, 5, 6, '哦哦哦哦哦哦哦哦哦66689', 1614167245, 0, 0);

-- ----------------------------
-- Table structure for product_video_favourite
-- ----------------------------
DROP TABLE IF EXISTS `product_video_favourite`;
CREATE TABLE `product_video_favourite`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` int UNSIGNED NULL DEFAULT NULL,
  `video_id` int UNSIGNED NULL DEFAULT NULL,
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `videoid`(`video_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户喜欢的短视频表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_video_favourite
-- ----------------------------

-- ----------------------------
-- Table structure for product_video_tag
-- ----------------------------
DROP TABLE IF EXISTS `product_video_tag`;
CREATE TABLE `product_video_tag`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` tinyint(1) NULL DEFAULT 0,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_video_tag
-- ----------------------------
INSERT INTO `product_video_tag` VALUES (2, '网红', 0, 1610788257, 0);
INSERT INTO `product_video_tag` VALUES (3, '新能源2', 0, 1610788277, 1610788360);

-- ----------------------------
-- Table structure for product_video_tag_video
-- ----------------------------
DROP TABLE IF EXISTS `product_video_tag_video`;
CREATE TABLE `product_video_tag_video`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `video_id` int NULL DEFAULT NULL,
  `tag_id` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `videoid`(`video_id`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_video_tag_video
-- ----------------------------

-- ----------------------------
-- Table structure for swiper_slider
-- ----------------------------
DROP TABLE IF EXISTS `swiper_slider`;
CREATE TABLE `swiper_slider`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate_id` tinyint(1) NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT 0,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储路径',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链',
  `state` tinyint(1) NULL DEFAULT 0,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '幻灯片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of swiper_slider
-- ----------------------------
INSERT INTO `swiper_slider` VALUES (5, 0, 'dddasdfsaf', 1, 'https://oss.bhy521qm.com/common/1913bbae9ff1a1fd4312dabe15276fe6.png', NULL, 0, 1609126305, 1610936592);
INSERT INTO `swiper_slider` VALUES (6, 0, 'sdafsadf6666', 3, 'https://oss.bhy521qm.com/common/c9a1fc7b7c572c2b992f631f2efb5b96.jpg', NULL, 0, 1609335928, 1610955963);

-- ----------------------------
-- Table structure for thirdparty_user
-- ----------------------------
DROP TABLE IF EXISTS `thirdparty_user`;
CREATE TABLE `thirdparty_user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `provider` enum('qq','wechat','alipay','line','facebook','twitter','weibo') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'qq' COMMENT '登录提供商',
  `mid` int UNSIGNED NULL DEFAULT 0 COMMENT '登录绑定用户ID',
  `union_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一标识用户身份ID',
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `provider`(`provider`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `unionid`(`union_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方登录平台用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of thirdparty_user
-- ----------------------------

-- ----------------------------
-- Table structure for ue_suggest
-- ----------------------------
DROP TABLE IF EXISTS `ue_suggest`;
CREATE TABLE `ue_suggest`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `mid` int UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `star` tinyint(1) NULL DEFAULT 0,
  `contact` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机、QQ、邮箱',
  `created_at` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投诉建议表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ue_suggest
-- ----------------------------
INSERT INTO `ue_suggest` VALUES (7, 0, '按时发斯蒂芬', 'UI无法直视，丑哭了', 3, '232323', 1609150036);
INSERT INTO `ue_suggest` VALUES (8, 0, '阿斯顿发斯蒂芬', '阿斯顿发送到发送到', 3, '23423423', 1609150084);
INSERT INTO `ue_suggest` VALUES (9, 0, '撒打发斯蒂芬', '阿斯顿发斯蒂芬', 0, '', 1609150311);
INSERT INTO `ue_suggest` VALUES (10, 0, 'miAdgoQn', '1611561817', 0, '1611561817', 1611561817);
INSERT INTO `ue_suggest` VALUES (11, 0, 'sTyCzzqJ', '1611561818', 0, '1611561818', 1611561818);
INSERT INTO `ue_suggest` VALUES (12, 0, 'gBa6w01T', '1611561818', 0, '1611561818', 1611561818);
INSERT INTO `ue_suggest` VALUES (13, 0, 'NTgFPhMs', '1611561819', 0, '1611561819', 1611561819);
INSERT INTO `ue_suggest` VALUES (14, 0, 'l4V6qiV0', '1611561842', 0, '1611561842', 1611561842);
INSERT INTO `ue_suggest` VALUES (15, 0, 'MfoxHzAj', '1611561843', 0, '1611561843', 1611561843);
INSERT INTO `ue_suggest` VALUES (16, 0, 'GRMIgluz', '1611561843', 0, '1611561843', 1611561843);
INSERT INTO `ue_suggest` VALUES (17, 0, 'cUbdnIEW', '1611561843', 0, '1611561843', 1611561843);
INSERT INTO `ue_suggest` VALUES (18, 0, 'f2xHEDgM', '1611562021', 0, '1611562021', 1611562021);
INSERT INTO `ue_suggest` VALUES (19, 0, '7QxvBs18', '1611562022', 0, '1611562022', 1611562022);
INSERT INTO `ue_suggest` VALUES (20, 0, 'MqPWAQHz', '1611562022', 0, '1611562022', 1611562022);
INSERT INTO `ue_suggest` VALUES (21, 0, 'UD5u6Gvo', '1611562023', 0, '1611562023', 1611562023);
INSERT INTO `ue_suggest` VALUES (22, 0, 'bOInifba', '1611562033', 0, '1611562033', 1611562033);
INSERT INTO `ue_suggest` VALUES (23, 0, '8ljNU70d', '1611562046', 0, '1611562046', 1611562046);
INSERT INTO `ue_suggest` VALUES (24, 0, '4XmCpMRW', '1611562070', 0, '1611562070', 1611562070);
INSERT INTO `ue_suggest` VALUES (34, 0, '0DZ7IM07', '1611562182', 0, '1611562182', 1611562182);
INSERT INTO `ue_suggest` VALUES (35, 0, 'V6LWQTY7', '1611562848', 0, '1611562848', 1611562848);
INSERT INTO `ue_suggest` VALUES (36, 0, 'Ed5fuzuG', '1611562857', 0, '1611562857', 1611562857);
INSERT INTO `ue_suggest` VALUES (37, 0, '94OAApsT', '1611562858', 0, '1611562858', 1611562858);
INSERT INTO `ue_suggest` VALUES (38, 0, 'sehI4k4P', '1611562935', 0, '1611562935', 1611562935);
INSERT INTO `ue_suggest` VALUES (39, 0, 'IiJVWT78', '1611562937', 0, '1611562937', 1611562937);
INSERT INTO `ue_suggest` VALUES (40, 0, 'hlTxDk0S', '1612432307', 0, '1612432307', 1612432307);
INSERT INTO `ue_suggest` VALUES (41, 0, 'RrxGdwhx', '1612432310', 0, '1612432310', 1612432310);
INSERT INTO `ue_suggest` VALUES (42, 0, 'as2Ejtor', '1612432365', 0, '1612432365', 1612432365);
INSERT INTO `ue_suggest` VALUES (43, 0, '是打发斯蒂芬', '阿斯顿发斯蒂芬', 0, '', 1612503191);

SET FOREIGN_KEY_CHECKS = 1;
