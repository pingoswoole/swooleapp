/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.0.168
 Source Server Type    : MySQL
 Source Server Version : 100508
 Source Host           : 192.168.0.168:3306
 Source Schema         : pingoapp

 Target Server Type    : MySQL
 Target Server Version : 100508
 File Encoding         : 65001

 Date: 22/01/2021 09:44:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `created_at` int UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `node`(`node`) USING BTREE,
  INDEX `status_node`(`status`, `node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限点和菜单列表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_rule
-- ----------------------------
INSERT INTO `admin_rule` VALUES (1, '系统管理', 'auth', '', 'fa-home', 1, 1, 0, 4294967295, 1610243495);
INSERT INTO `admin_rule` VALUES (2, '管理员', 'auth.auth', '/backend/auth/', 'fa-group', 1, 1, 1, 2147483647, 1605606090);
INSERT INTO `admin_rule` VALUES (3, '角色管理', 'auth.role', '/backend/role/', 'fa-leaf', 1, 1, 1, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (4, '权限管理', 'auth.rule', '/backend/rule/', 'fa-shield', 1, 1, 1, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (5, '查看管理列表', 'auth.auth.view', '/backdata/auth/get_all', 'fa-home', 1, 0, 2, 2147483647, 1610242813);
INSERT INTO `admin_rule` VALUES (6, '添加管理员', 'auth.auth.add', '/backdata/auth/addget', 'fa-home', 1, 0, 2, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (7, '设置管理员', 'auth.auth.set', '/backdata/auth/set/{id:\\d+}', 'fa-home', 1, 0, 2, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (8, '删除管理员', 'auth.auth.del', '/backdata/auth/del/{id:\\d+}', 'fa-home', 1, 0, 2, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (9, '查看角色', 'auth.role.view', '/backdata/role/get_all', 'fa-home', 1, 0, 3, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (10, '增加角色', 'auth.role.add', NULL, 'fa-home', 1, 0, 3, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (11, '修改角色', 'auth.role.set', '/backdata/role/set/{id:\\d+}', 'fa-home', 1, 0, 3, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (12, '删除角色', 'auth.role.del', '/backdata/role/del/{id:\\d+}', 'fa-home', 1, 0, 3, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (13, '查看权限', 'auth.rule.view', '/backdata/rule/get_all', 'fa-home', 1, 0, 4, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (14, '增加根权限', 'auth.rule.addroot', '/backdata/rule/addget&&/backdata/rule/add', 'fa-home', 1, 0, 4, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (15, '修改权限', 'auth.rule.set', '/backdata/rule/set/{id:\\d+}', 'fa-home', 1, 0, 4, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (16, '删除权限', 'auth.rule.del', '/backdata/rule/del/{id:\\d+}', 'fa-home', 1, 0, 4, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (17, '变更权限', 'auth.role.rule', '/backdata/rule/editget/{id:\\d+}&&/backdata/rule/edit/{id:\\d+}', 'fa-home', 1, 0, 3, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (19, '登录日志', 'index.login.log', '/backdata/login_log', 'fa-home', 1, 0, 1, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (20, '配置数据', 'data', NULL, 'fa-home', 1, 1, 0, 1604890768, 1605607108);
INSERT INTO `admin_rule` VALUES (21, '常规配置', 'data.setting', '/backend/setting/index', 'fa-gears', 1, 1, 20, 1604968802, 1605607120);
INSERT INTO `admin_rule` VALUES (26, '数据库', 'data.database', '/backend/setting/database/viewAll', 'fa-database', 1, 1, 20, 1605097315, 1605607127);
INSERT INTO `admin_rule` VALUES (27, '文件管理', 'data.filesystem', '/backend/setting/filemanager/viewAll', 'fa-folder-o', 1, 1, 20, 1605097457, 1605607136);
INSERT INTO `admin_rule` VALUES (28, '用户中心', 'member', 'member.index', 'fa-home', 1, 1, 0, 1605097635, 1610261632);
INSERT INTO `admin_rule` VALUES (29, '用户列表', 'member.index', '/backend/member/member/viewAll', 'fa-user-circle-o', 1, 1, 28, 1605098083, 1605098083);
INSERT INTO `admin_rule` VALUES (30, '资产收支', 'resource', '/backend/member/assetlog/viewAll', 'fa-money', 1, 1, 28, 1605098154, 1605098154);
INSERT INTO `admin_rule` VALUES (32, '编辑管理员', 'auth.auth.set', '/backdata/auth/editget/{id:\\d+}&&/backdata/auth/edit/{id:\\d+}', 'fa-home', 1, 0, 2, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (33, '修改密码', 'auth.auth.pwd', '/backdata/auth/pwdget&&/backdata/auth/pwd', 'fa-home', 1, 0, 2, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (34, '变更权限', 'auth.role.edit_userule', '/backdata/role/edit_ruleget/{id:\\d+}&&/backdata/role/edit_rule/{id:\\d+}', 'fa-home', 1, 0, 3, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (35, '编辑角色', 'auth.role.edit_rule', '/backdata/role/editget/{id:\\d+}&&/backdata/role/edit/{id:\\d+}', 'fa-home', 1, 0, 3, 2147483647, 0);
INSERT INTO `admin_rule` VALUES (36, '增加子权限', 'auth.rule.addnode', '/backdata/rule/addget/{id:\\d+}&&/backdata/rule/add/{id:\\d+}', 'fa-home', 1, 0, 4, 2147483647, 1605606100);
INSERT INTO `admin_rule` VALUES (38, '产品中心', 'auth.rule.addnode', '', 'fa-home', 1, 1, 0, 2147483647, 1605606100);
INSERT INTO `admin_rule` VALUES (39, '在线商城', 'product.onlineshop', '', 'fa-home', 1, 1, 38, 2147483647, 1605606100);
INSERT INTO `admin_rule` VALUES (40, '分类管理', 'product.onlineshop.category', '/backend/product/onlineshop_category/viewAll', 'fa-file-text', 1, 1, 39, 0, 0);
INSERT INTO `admin_rule` VALUES (41, '商品管理', 'product.onlineshop.goods', '/backend/product/onlineshop_goods/viewAll', 'fa-file-text', 1, 1, 39, 0, 0);
INSERT INTO `admin_rule` VALUES (42, '订单管理', 'product.onlineshop.order', '/backend/product/onlineshop_order/viewAll', 'fa-file-text', 1, 1, 39, 0, 0);
INSERT INTO `admin_rule` VALUES (47, '提现管理', 'product.withdraw', '/backend/product/withdraw/viewAll', 'fa-file-text', 1, 1, 38, 0, 0);
INSERT INTO `admin_rule` VALUES (48, '建议反馈', 'product.suggest', '/backend/product/suggestion/viewAll', 'fa-file-text', 1, 1, 38, 0, 0);
INSERT INTO `admin_rule` VALUES (49, '支付记录', 'product.payment.log', '/backend/product/payment/viewAll', 'fa-file-text', 1, 1, 38, 0, 0);
INSERT INTO `admin_rule` VALUES (50, '银行卡', 'member.bankcard', '/backend/member/bankcard/viewAll', 'fa-file-text', 1, 1, 28, 0, 0);
INSERT INTO `admin_rule` VALUES (51, '收货地址', 'member.address', '/backend/member/address/viewAll', 'fa-file-text', 1, 1, 28, 0, 0);
INSERT INTO `admin_rule` VALUES (52, '消息推送', 'product.message_push', '/backend/product/message_push/viewAll', 'fa-file-text', 1, 1, 38, 0, 0);
INSERT INTO `admin_rule` VALUES (53, '常见问题', 'product.faq', '/backend/product/faq/viewAll', 'fa-file-text', 1, 1, 38, 0, 0);
INSERT INTO `admin_rule` VALUES (54, '幻灯片', 'product.swiper_slider', '/backend/product/swiper_slider/viewAll', 'fa-file-text', 1, 1, 38, 0, 0);
INSERT INTO `admin_rule` VALUES (55, '实名认证', 'member.realnameauth', '/backend/member/realnameauth/viewAll', 'fa-file-text', 1, 1, 28, 1610261669, 1610273179);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of common_setting
-- ----------------------------
INSERT INTO `common_setting` VALUES (5, 'storage', '{\"set_key\":\"storage\",\"provider\":\"2\",\"local_base_uri\":\"http:\\/\\/localhost\",\"qiniu_access_key\":\"\",\"qiniu_access_key_secret\":\"\",\"qiniu_base_uri\":\"\",\"qiniu_bucket\":\"\",\"aliyun_access_key\":\"LTAI4GAWQaZaSMK43eHeDUSw\",\"aliyun_access_key_secret\":\"qUY9E7xraqz5HSBorHrcwKClxEsNEy\",\"aliyun_base_uri\":\"https:\\/\\/oss.bhy521qm.com\",\"aliyun_bucket\":\"chatdou\",\"aliyun_endpoint\":\"oss-cn-hongkong.aliyuncs.com\"}', 1607936858, 1610715834);
INSERT INTO `common_setting` VALUES (6, 'web', '{\"set_key\":\"web\",\"title\":\"\\u77ed\\u89c6\\u9891\\u4ea4\\u53cb\",\"logo\":\"https:\\/\\/oss.bhy521qm.com\\/common\\/87826f35be9f172353683683f918d621.jpg\",\"file\":\"\",\"normal_express_area\":{\"0\":\"on\",\"1\":\"on\",\"9\":\"on\",\"17\":\"on\",\"18\":\"on\",\"19\":\"on\",\"22\":\"on\",\"26\":\"on\",\"31\":\"on\"},\"normal_express_fee\":\"150\",\"special_express_area\":{\"0\":\"on\",\"2\":\"on\",\"31\":\"on\",\"32\":\"on\",\"33\":\"on\"},\"special_express_fee\":\"250\",\"aboutus\":\"<p style=\\\"margin-top: 0px; margin-bottom: 20px; word-break: break-all; overflow-wrap: break-word; color: rgb(102, 102, 102); line-height: 1.7; width: 796px; font-family: tahoma, arial, \\\" microsoft=\\\"\\\" yahei\\\",=\\\"\\\" \\\"hiragino=\\\"\\\" sans=\\\"\\\" gb\\\",=\\\"\\\" u5b8bu4f53,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;\\\"=\\\"\\\">\\u4eac\\u4e1c\\u4e8e2004\\u5e74\\u6b63\\u5f0f\\u6d89\\u8db3\\u7535\\u5546\\u9886\\u57df\\uff0c2019\\u5e74\\uff0c\\u4eac\\u4e1c\\u96c6\\u56e2\\u5e02\\u573a\\u4ea4\\u6613\\u989d\\u8d85\\u8fc72\\u4e07\\u4ebf\\u5143*\\u30022020\\u5e748\\u6708\\uff0c\\u4eac\\u4e1c\\u96c6\\u56e2\\u7b2c\\u4e94\\u6b21\\u5165\\u699c\\u300a\\u8d22\\u5bcc\\u300b\\u5168\\u7403500\\u5f3a\\uff0c\\u4f4d\\u5217\\u7b2c102\\u4f4d\\uff0c\\u4f4d\\u5c45\\u4e2d\\u56fd\\u96f6\\u552e\\u53ca\\u4e92\\u8054\\u7f51\\u884c\\u4e1a\\u7b2c\\u4e00\\u3001\\u5168\\u7403\\u4e92\\u8054\\u7f51\\u884c\\u4e1a\\u7b2c\\u4e09\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 20px; word-break: break-all; overflow-wrap: break-word; color: rgb(102, 102, 102); line-height: 1.7; width: 796px; font-family: tahoma, arial, \\\" microsoft=\\\"\\\" yahei\\\",=\\\"\\\" \\\"hiragino=\\\"\\\" sans=\\\"\\\" gb\\\",=\\\"\\\" u5b8bu4f53,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;\\\"=\\\"\\\">2014\\u5e745\\u6708\\uff0c\\u4eac\\u4e1c\\u96c6\\u56e2\\u5728\\u7f8e\\u56fd\\u7eb3\\u65af\\u8fbe\\u514b\\u8bc1\\u5238\\u4ea4\\u6613\\u6240\\u6b63\\u5f0f\\u6302\\u724c\\u4e0a\\u5e02\\uff0c\\u662f\\u4e2d\\u56fd\\u7b2c\\u4e00\\u4e2a\\u6210\\u529f\\u8d74\\u7f8e\\u4e0a\\u5e02\\u7684\\u5927\\u578b\\u7efc\\u5408\\u578b\\u7535\\u5546\\u5e73\\u53f0\\u30022015\\u5e747\\u6708\\uff0c\\u4eac\\u4e1c\\u51ed\\u501f\\u9ad8\\u6210\\u957f\\u6027\\u5165\\u9009\\u7eb3\\u65af\\u8fbe\\u514b100\\u6307\\u6570\\u548c\\u7eb3\\u65af\\u8fbe\\u514b100\\u5e73\\u5747\\u52a0\\u6743\\u6307\\u6570\\u30022020\\u5e746\\u6708\\uff0c\\u4eac\\u4e1c\\u96c6\\u56e2\\u6b63\\u5f0f\\u5728\\u9999\\u6e2f\\u8054\\u4ea4\\u6240\\u4e8c\\u6b21\\u4e0a\\u5e02\\uff0c\\u52df\\u96c6\\u8d44\\u91d1\\u7ea6345.58\\u4ebf\\u6e2f\\u5143\\uff0c\\u7528\\u4e8e\\u6295\\u8d44\\u4ee5\\u4f9b\\u5e94\\u94fe\\u4e3a\\u57fa\\u7840\\u7684\\u5173\\u952e\\u6280\\u672f\\u521b\\u65b0\\uff0c\\u4ee5\\u8fdb\\u4e00\\u6b65\\u63d0\\u5347\\u7528\\u6237\\u4f53\\u9a8c\\u53ca\\u63d0\\u9ad8\\u8fd0\\u8425\\u6548\\u7387\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 20px; word-break: break-all; overflow-wrap: break-word; color: rgb(102, 102, 102); line-height: 1.7; width: 796px; font-family: tahoma, arial, \\\" microsoft=\\\"\\\" yahei\\\",=\\\"\\\" \\\"hiragino=\\\"\\\" sans=\\\"\\\" gb\\\",=\\\"\\\" u5b8bu4f53,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;\\\"=\\\"\\\">2019\\u5e74\\u5168\\u5e74\\uff0c\\u4eac\\u4e1c\\u96c6\\u56e2\\u51c0\\u6536\\u5165\\u8fbe5769\\u4ebf\\u5143\\uff0c\\u5f52\\u5c5e\\u4e8e\\u666e\\u901a\\u80a1\\u80a1\\u4e1c\\u7684\\u51c0\\u5229\\u6da6\\u8fbe122\\u4ebf\\u5143\\uff0c\\u521b\\u5386\\u53f2\\u6700\\u9ad8\\u7eaa\\u5f55\\uff1b\\u7814\\u53d1\\u6295\\u5165\\u8fbe179\\u4ebf\\u5143\\uff0c\\u8dc3\\u5347\\u4e3a\\u4e2d\\u56fd\\u4f01\\u4e1a\\u4e2d\\u5bf9\\u6280\\u672f\\u6295\\u5165\\u6700\\u591a\\u7684\\u516c\\u53f8\\u4e4b\\u4e00\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 20px; word-break: break-all; overflow-wrap: break-word; color: rgb(102, 102, 102); line-height: 1.7; width: 796px; font-family: tahoma, arial, \\\" microsoft=\\\"\\\" yahei\\\",=\\\"\\\" \\\"hiragino=\\\"\\\" sans=\\\"\\\" gb\\\",=\\\"\\\" u5b8bu4f53,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;\\\"=\\\"\\\">\\u4eac\\u4e1c\\u96c6\\u56e2\\u5b9a\\u4f4d\\u4e8e\\u201c\\u4ee5\\u4f9b\\u5e94\\u94fe\\u4e3a\\u57fa\\u7840\\u7684\\u6280\\u672f\\u4e0e\\u670d\\u52a1\\u4f01\\u4e1a\\u201d\\uff0c\\u76ee\\u524d\\u4e1a\\u52a1\\u5df2\\u6d89\\u53ca\\u96f6\\u552e\\u3001\\u6570\\u5b57\\u79d1\\u6280\\u3001\\u7269\\u6d41\\u3001\\u6280\\u672f\\u670d\\u52a1\\u3001\\u5065\\u5eb7\\u3001\\u4fdd\\u9669\\u3001\\u4ea7\\u53d1\\u3001\\u667a\\u8054\\u4e91\\u548c\\u6d77\\u5916\\u7b49\\u9886\\u57df\\uff0c\\u5176\\u4e2d\\u6838\\u5fc3\\u4e1a\\u52a1\\u4e3a\\u96f6\\u552e\\u3001\\u6570\\u5b57\\u79d1\\u6280\\u3001\\u7269\\u6d41\\u3001\\u6280\\u672f\\u670d\\u52a1\\u56db\\u5927\\u677f\\u5757\\u3002<\\/p><p style=\\\"margin-top: 0px; margin-bottom: 0px; word-break: break-all; overflow-wrap: break-word; color: rgb(102, 102, 102); line-height: 1.7; width: 796px; font-family: tahoma, arial, \\\" microsoft=\\\"\\\" yahei\\\",=\\\"\\\" \\\"hiragino=\\\"\\\" sans=\\\"\\\" gb\\\",=\\\"\\\" u5b8bu4f53,=\\\"\\\" sans-serif;=\\\"\\\" font-size:=\\\"\\\" 14px;\\\"=\\\"\\\">\\u4eac\\u4e1c\\u96c6\\u56e2\\u5949\\u884c\\u5ba2\\u6237\\u4e3a\\u5148\\u3001\\u8bda\\u4fe1\\u3001\\u534f\\u4f5c\\u3001\\u611f\\u6069\\u3001\\u62fc\\u640f\\u3001\\u62c5\\u5f53\\u7684\\u4ef7\\u503c\\u89c2\\uff0c\\u4ee5\\u201c\\u6280\\u672f\\u4e3a\\u672c\\uff0c\\u81f4\\u529b\\u4e8e\\u66f4\\u9ad8\\u6548\\u548c\\u53ef\\u6301\\u7eed\\u7684\\u4e16\\u754c\\u201d\\u4e3a\\u4f7f\\u547d\\uff0c\\u76ee\\u6807\\u662f\\u6210\\u4e3a\\u5168\\u7403\\u6700\\u503c\\u5f97\\u4fe1\\u8d56\\u7684\\u4f01\\u4e1a\\u3002<\\/p>\",\"protocol\":\"<p><span style=\\\"background-color: rgb(255, 255, 255);\\\">\\u6b22\\u8fce\\u9605\\u8bfb\\u300aAPP\\u7528\\u6237\\u670d\\u52a1\\u534f\\u8bae\\u300b(\\u4ee5\\u4e0b\\u7b80\\u79f0\\u201c\\u672c\\u534f\\u8bae\\u201d)\\u3002\\u672c\\u534f\\u8bae\\u9610\\u8ff0\\u4e4b\\u6761\\u6b3e\\u548c\\u6761\\u4ef6\\u9002\\u7528\\u4e8e\\u60a8\\uff08\\u4ee5\\u4e0b\\u7b80\\u79f0\\u201c\\u7528\\u6237\\u201d\\uff09\\u4f7f\\u7528APP\\u7684\\u5404\\u79cd\\u4ea7\\u54c1\\u548c\\u670d\\u52a1\\u3002<br><br>1. \\u670d\\u52a1\\u534f\\u8bae\\u7684\\u786e\\u8ba4<br><br>1.1 XX\\u516c\\u53f8\\u53ca\\u76f8\\u5173\\u5173\\u8054\\u4f01\\u4e1a\\uff08\\u4ee5\\u4e0b\\u5408\\u79f0\\u201c\\u5e73\\u53f0\\u201d\\uff09\\u540c\\u610f\\u6309\\u7167\\u672c\\u534f\\u8bae\\u7684\\u89c4\\u5b9a\\u53ca\\u5176\\u4e0d\\u65f6\\u53d1\\u5e03\\u7684\\u64cd\\u4f5c\\u89c4\\u5219\\u63d0\\u4f9b\\u57fa\\u4e8e\\u4e92\\u8054\\u7f51\\u79fb\\u52a8\\u7f51\\u7684\\u73e0\\u5b9dV\\u8bfeAPP\\u3001\\u5e73\\u53f0\\u5b98\\u65b9\\u7f51\\u7ad9\\u7b49\\u76f8\\u5173\\u670d\\u52a1\\uff08\\u4ee5\\u4e0b\\u7b80\\u79f0\\u201c\\u5e73\\u53f0\\u670d\\u52a1\\u201d\\uff09\\u3002<br><br>1.2 \\u5e73\\u53f0\\u670d\\u52a1\\u4f7f\\u7528\\u4eba\\uff08\\u4ee5\\u4e0b\\u7b80\\u79f0\\u201c\\u7528\\u6237\\u201d\\uff09\\u5e94\\u5f53\\u57fa\\u4e8e\\u4e86\\u89e3\\u672c\\u534f\\u8bae\\u5168\\u90e8\\u5185\\u5bb9\\u3001\\u5728\\u72ec\\u7acb\\u601d\\u8003\\u7684\\u57fa\\u7840\\u4e0a\\u8ba4\\u53ef\\u3001\\u540c\\u610f\\u672c\\u534f\\u8bae\\u7684\\u5168\\u90e8\\u6761\\u6b3e\\u5e76\\u6309\\u7167\\u9875\\u9762\\u4e0a\\u7684\\u63d0\\u793a\\u5b8c\\u6210\\u5168\\u90e8\\u7684\\u6ce8\\u518c\\u7a0b\\u5e8f\\uff0c\\u7528\\u6237\\u7684\\u6ce8\\u518c\\u3001\\u767b\\u5f55\\u3001\\u4f7f\\u7528\\u7b49\\u884c\\u4e3a\\u5c06\\u89c6\\u4e3a\\u5b8c\\u5168\\u63a5\\u53d7\\u672c\\u534f\\u8bae\\u53ca\\u5b98\\u65b9\\u516c\\u793a\\u7684\\u5404\\u9879\\u89c4\\u5219\\u3001\\u89c4\\u8303\\u3002<br><br>1.3 \\u5b98\\u65b9\\u4eab\\u6709\\u5bf9\\u5e73\\u53f0APP\\u3001\\u5e73\\u53f0\\u5b98\\u65b9\\u7f51\\u7ad9\\u4e0a\\u4e00\\u5207\\u6d3b\\u52a8\\u7684\\u76d1\\u7763\\u3001\\u63d0\\u793a\\u3001\\u68c0\\u67e5\\u3001\\u7ea0\\u6b63\\u7b49\\u6743\\u5229\\u3002<br><br>2. \\u670d\\u52a1\\u5185\\u5bb9<br><br>2.1 \\u5e73\\u53f0\\u670d\\u52a1\\u7684\\u5177\\u4f53\\u5185\\u5bb9\\u7531\\u5b98\\u65b9\\u6839\\u636e\\u5b9e\\u9645\\u60c5\\u51b5\\u63d0\\u4f9b\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u6388\\u6743\\u7528\\u6237\\u901a\\u8fc7\\u5176\\u5e10\\u53f7\\u4e0a\\u4f20\\u3001\\u641c\\u7d22\\u5e76\\u5411\\u4e92\\u76f8\\u5173\\u8054\\u7684\\u7528\\u6237\\u63a8\\u9001\\u76f8\\u5173\\u4fe1\\u606f\\u3001\\u6388\\u6743\\u7528\\u6237\\u5bf9\\u5176\\u8fdb\\u884c\\u6536\\u5f55\\u3001\\u5206\\u4eab\\u7b49\\uff0c\\u5b98\\u65b9\\u6709\\u6743\\u5bf9\\u5176\\u63d0\\u4f9b\\u7684\\u670d\\u52a1\\u6216\\u4ea7\\u54c1\\u5f62\\u6001\\u8fdb\\u884c\\u5347\\u7ea7\\u6216\\u5176\\u4ed6\\u8c03\\u6574\\uff0c\\u5747\\u4ee5APP\\\\\\u7f51\\u7ad9\\u5185\\u5bb9\\u66f4\\u65b0\\u7684\\u65b9\\u5f0f\\u901a\\u77e5\\u7528\\u6237\\uff0c\\u4e0d\\u5355\\u72ec\\u901a\\u77e5\\u7528\\u6237\\u3002<br><br>2.2 \\u5b98\\u65b9\\u63d0\\u4f9b\\u7684\\u5e73\\u53f0\\u670d\\u52a1\\u4e2d\\u53ef\\u80fd\\u5305\\u62ec\\u5e7f\\u544a\\uff0c\\u7528\\u6237\\u540c\\u610f\\u5728\\u4f7f\\u7528\\u8fc7\\u7a0b\\u4e2d\\u663e\\u793a\\u5e73\\u53f0\\u548c\\u7b2c\\u4e09\\u65b9\\u4f9b\\u5e94\\u5546\\u3001\\u5408\\u4f5c\\u4f19\\u4f34\\u63d0\\u4f9b\\u7684\\u5e7f\\u544a\\u3002<br><br>2.3 \\u5b98\\u65b9\\u4ec5\\u63d0\\u4f9b\\u4e0e\\u5e73\\u53f0\\u670d\\u52a1\\u76f8\\u5173\\u7684\\u6280\\u672f\\u670d\\u52a1\\u7b49\\uff0c\\u9664\\u6b64\\u4e4b\\u5916\\u4e0e\\u76f8\\u5173\\u7f51\\u7edc\\u670d\\u52a1\\u6709\\u5173\\u7684\\u8bbe\\u5907\\uff08\\u5982\\u4e2a\\u4eba\\u7535\\u8111\\u3001\\u624b\\u673a\\u3001\\u53ca\\u5176\\u4ed6\\u4e0e\\u63a5\\u5165\\u4e92\\u8054\\u7f51\\u6216\\u79fb\\u52a8\\u7f51\\u6709\\u5173\\u7684\\u88c5\\u7f6e\\uff09\\u53ca\\u6240\\u9700\\u8d39\\u7528\\uff08\\u5982\\u4e3a\\u63a5\\u5165\\u4e92\\u8054\\u7f51\\u800c\\u652f\\u4ed8\\u7684\\u7535\\u8bdd\\u8d39\\u53ca\\u4e0a\\u7f51\\u8d39\\u3001\\u4e3a\\u4f7f\\u7528\\u79fb\\u52a8\\u7f51\\u800c\\u652f\\u4ed8\\u7684\\u624b\\u673a\\u8d39\\uff09\\u5747\\u5e94\\u7531\\u7528\\u6237\\u81ea\\u884c\\u8d1f\\u62c5\\u3002<br><br>3. \\u670d\\u52a1\\u53d8\\u66f4\\u3001\\u4e2d\\u65ad\\u6216\\u7ec8\\u6b62<br><br>3.1 \\u9274\\u4e8e\\u7f51\\u7edc\\u670d\\u52a1\\u7684\\u7279\\u6b8a\\u6027\\uff08\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u4e0d\\u53ef\\u6297\\u529b\\u3001\\u7f51\\u7edc\\u7a33\\u5b9a\\u6027\\u3001\\u7cfb\\u7edf\\u7a33\\u5b9a\\u6027\\u3001\\u6280\\u672f\\u6545\\u969c\\u3001\\u7528\\u6237\\u6240\\u5728\\u4f4d\\u7f6e\\u3001\\u7528\\u6237\\u5173\\u673a\\u3001\\u7528\\u6237\\u624b\\u673a\\u75c5\\u6bd2\\u6216\\u6076\\u610f\\u7684\\u7f51\\u7edc\\u653b\\u51fb\\u884c\\u4e3a\\u53ca\\u5176\\u4ed6\\u4efb\\u4f55\\u6280\\u672f\\u3001\\u4e92\\u8054\\u7f51\\u7edc\\u3001\\u901a\\u4fe1\\u7ebf\\u8def\\u3001\\u5185\\u5bb9\\u4fb5\\u6743\\u7b49\\u539f\\u56e0\\uff09\\uff0c\\u7528\\u6237\\u540c\\u610f\\uff0c\\u5b98\\u65b9\\u6709\\u6743\\u968f\\u65f6\\u4e2d\\u65ad\\u6216\\u7ec8\\u6b62\\u90e8\\u5206\\u6216\\u5168\\u90e8\\u5e73\\u53f0\\u670d\\u52a1\\uff0c\\u5b98\\u65b9\\u5c06\\u5c3d\\u53ef\\u80fd\\u53ca\\u65f6\\u4ee5\\u5408\\u7406\\u65b9\\u5f0f\\u901a\\u77e5\\u7528\\u6237\\uff0c\\u5e76\\u5c3d\\u53ef\\u80fd\\u5728\\u7b2c\\u4e00\\u65f6\\u95f4\\u5bf9\\u6b64\\u8fdb\\u884c\\u4fee\\u590d\\u3002\\u4f46\\u5bf9\\u56e0\\u6b64\\u5bfc\\u81f4\\u7528\\u6237\\u4e0d\\u80fd\\u53d1\\u9001\\u548c\\u63a5\\u53d7\\u9605\\u8bfb\\u4fe1\\u606f\\u3001\\u6216\\u63a5\\u53d1\\u9519\\u4fe1\\u606f\\uff0c\\u5b98\\u65b9\\u4e0d\\u627f\\u62c5\\u4efb\\u4f55\\u8d23\\u4efb\\uff0c\\u7528\\u6237\\u987b\\u627f\\u62c5\\u4ee5\\u4e0a\\u98ce\\u9669\\u3002<br><br>3.2 \\u7528\\u6237\\u7406\\u89e3\\uff0c\\u5b98\\u65b9\\u9700\\u8981\\u5b9a\\u671f\\u6216\\u4e0d\\u5b9a\\u671f\\u5730\\u5bf9\\u63d0\\u4f9b\\u5e73\\u53f0\\u670d\\u52a1\\u7684\\u5e73\\u53f0\\u6216\\u76f8\\u5173\\u8bbe\\u5907\\u8fdb\\u884c\\u68c0\\u4fee\\u548c\\u7ef4\\u62a4\\uff0c\\u5982\\u56e0\\u6b64\\u7c7b\\u60c5\\u51b5\\u800c\\u9020\\u6210\\u670d\\u52a1\\u5728\\u5408\\u7406\\u671f\\u95f4\\u5185\\u7684\\u4e2d\\u65ad\\uff0c\\u5b98\\u65b9\\u5c06\\u5c3d\\u53ef\\u80fd\\u4e8b\\u5148\\u901a\\u77e5\\uff0c\\u4f46\\u65e0\\u9700\\u4e3a\\u6b64\\u627f\\u62c5\\u4efb\\u4f55\\u8d23\\u4efb\\u3002<br><br>3.3 \\u7528\\u6237\\u63d0\\u4f9b\\u7684\\u4e2a\\u4eba\\u8d44\\u6599\\u4e0d\\u771f\\u5b9e\\u3001\\u7528\\u6237\\u8fdd\\u53cd\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u56fd\\u5bb6\\u653f\\u7b56\\u6216\\u672c\\u534f\\u8bae\\u89c4\\u5b9a\\u7684\\u4f7f\\u7528\\u89c4\\u5219\\uff0c\\u5b98\\u65b9\\u6709\\u6743\\u968f\\u65f6\\u4e2d\\u65ad\\u6216\\u7ec8\\u6b62\\u5411\\u7528\\u6237\\u63d0\\u4f9b\\u672c\\u534f\\u8bae\\u9879\\u4e0b\\u7684\\u5e73\\u53f0\\u670d\\u52a1\\uff0c\\u800c\\u65e0\\u9700\\u5bf9\\u7528\\u6237\\u6216\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u627f\\u62c5\\u4efb\\u4f55\\u8d23\\u4efb\\u3002<br><br>4. \\u4f7f\\u7528\\u89c4\\u5219<br><br>4.1 \\u7528\\u6237\\u5728\\u7533\\u8bf7\\u6ce8\\u518c\\u5e73\\u53f0\\u670d\\u52a1\\u65f6\\uff0c\\u5fc5\\u987b\\u5411\\u5b98\\u65b9\\u63d0\\u4f9b\\u51c6\\u786e\\u7684\\u4e3b\\u4f53\\u8d44\\u6599\\uff08\\u7528\\u6237\\u4e3a\\u4e2a\\u4eba\\u65f6\\uff0c\\u5305\\u62ec\\u59d3\\u540d\\u3001\\u6027\\u522b\\u3001\\u51fa\\u751f\\u5e74\\u6708\\u3001\\u7535\\u8bdd\\u3001\\u90ae\\u7bb1\\u7b49\\uff1b\\u7528\\u6237\\u4e3a\\u5355\\u4f4d\\u65f6\\uff0c\\u5305\\u62ec\\u540d\\u79f0\\u3001\\u6ce8\\u518c\\u5730\\u5740\\u3001\\u6ce8\\u518c\\u53f7\\u7b49\\uff09\\uff0c\\u5982\\u4e3b\\u4f53\\u8d44\\u6599\\u6709\\u4efb\\u4f55\\u53d8\\u52a8\\uff0c\\u5fc5\\u987b\\u53ca\\u65f6\\u66f4\\u65b0\\u3002\\u56e0\\u7528\\u6237\\u63d0\\u4f9b\\u8d44\\u6599\\u7684\\u771f\\u5b9e\\u6027\\u95ee\\u9898\\u5bfc\\u81f4\\u534f\\u8bae\\u53cc\\u65b9\\u6216\\u7b2c\\u4e09\\u65b9\\u7684\\u4efb\\u4f55\\u635f\\u5931\\u5747\\u7531\\u7528\\u6237\\u627f\\u62c5\\u3002<br><br>4.2 \\u7528\\u6237\\u6ce8\\u518c\\u6210\\u529f\\u540e\\uff0c\\u5c06\\u83b7\\u5f97\\u4e00\\u4e2a\\u5e73\\u53f0\\u5e10\\u53f7\\u53ca\\u7531\\u7528\\u6237\\u8bbe\\u7f6e\\u7684\\u5bc6\\u7801\\uff0c\\u8be5\\u7528\\u6237\\u5e10\\u53f7\\u548c\\u5bc6\\u7801\\u7531\\u7528\\u6237\\u8d1f\\u8d23\\u4fdd\\u7ba1\\uff1b\\u7528\\u6237\\u5e94\\u5f53\\u5bf9\\u8be5\\u7528\\u6237\\u5e10\\u53f7\\u6240\\u6709\\u884c\\u4e3a\\u8d1f\\u76f8\\u5173\\u6cd5\\u5f8b\\u8d23\\u4efb\\u3002<br><br>\\u7528\\u6237\\u5728\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u8fc7\\u7a0b\\u4e2d\\uff0c\\u5fc5\\u987b\\u9075\\u5faa\\u4ee5\\u4e0b\\u539f\\u5219:<br><br>(1) \\u9075\\u5b88\\u4e2d\\u56fd\\u6709\\u5173\\u7684\\u6cd5\\u5f8b\\u548c\\u6cd5\\u89c4\\uff1b<br><br>(2) \\u4e0d\\u5f97\\u4e3a\\u4efb\\u4f55\\u975e\\u6cd5\\u76ee\\u7684\\u800c\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\uff1b<br><br>(3) \\u9075\\u5b88\\u6240\\u6709\\u4e0e\\u7f51\\u7edc\\u670d\\u52a1\\u6709\\u5173\\u7684\\u7f51\\u7edc\\u534f\\u8bae\\u3001\\u89c4\\u5b9a\\u548c\\u7a0b\\u5e8f\\uff1b<br><br>(4) \\u4e0d\\u5f97\\u5229\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u7cfb\\u7edf\\u8fdb\\u884c\\u4efb\\u4f55\\u53ef\\u80fd\\u5bf9\\u4e92\\u8054\\u7f51\\u7684\\u6b63\\u5e38\\u8fd0\\u8f6c\\u9020\\u6210\\u4e0d\\u5229\\u5f71\\u54cd\\u7684\\u884c\\u4e3a\\uff1b<br><br>(5) \\u4e0d\\u5f97\\u5229\\u7528\\u5e73\\u53f0\\u7f51\\u7edc\\u670d\\u52a1\\u7cfb\\u7edf\\u8fdb\\u884c\\u4efb\\u4f55\\u4e0d\\u5229\\u4e8e\\u5b98\\u65b9\\u7684\\u884c\\u4e3a\\u3002<br><br>4.3 \\u7528\\u6237\\u4e0d\\u5f97\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u5236\\u4f5c\\u3001\\u4e0a\\u4f20\\u3001\\u53d1\\u9001\\u3001\\u4f20\\u64ad\\u654f\\u611f\\u4fe1\\u606f\\u548c\\u8fdd\\u53cd\\u56fd\\u5bb6\\u6cd5\\u5f8b\\u5236\\u5ea6\\u7684\\u4fe1\\u606f\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u4e0b\\u5217\\u4fe1\\u606f:<br><br>(1) \\u53cd\\u5bf9\\u5baa\\u6cd5\\u6240\\u786e\\u5b9a\\u7684\\u57fa\\u672c\\u539f\\u5219\\u7684\\uff1b<br><br>(2) \\u5371\\u5bb3\\u56fd\\u5bb6\\u5b89\\u5168\\uff0c\\u6cc4\\u9732\\u56fd\\u5bb6\\u79d8\\u5bc6\\uff0c\\u98a0\\u8986\\u56fd\\u5bb6\\u653f\\u6743\\uff0c\\u7834\\u574f\\u56fd\\u5bb6\\u7edf\\u4e00\\u7684\\uff1b<br><br>(3) \\u635f\\u5bb3\\u56fd\\u5bb6\\u8363\\u8a89\\u548c\\u5229\\u76ca\\u7684\\uff1b<br><br>(4) \\u717d\\u52a8\\u6c11\\u65cf\\u4ec7\\u6068\\u3001\\u6c11\\u65cf\\u6b67\\u89c6\\uff0c\\u7834\\u574f\\u6c11\\u65cf\\u56e2\\u7ed3\\u7684\\uff1b<br><br>(5) \\u7834\\u574f\\u56fd\\u5bb6\\u5b97\\u6559\\u653f\\u7b56\\uff0c\\u5ba3\\u626c\\u90aa\\u6559\\u548c\\u5c01\\u5efa\\u8ff7\\u4fe1\\u7684\\uff1b<br><br>(6) \\u6563\\u5e03\\u8c23\\u8a00\\uff0c\\u6270\\u4e71\\u793e\\u4f1a\\u79e9\\u5e8f\\uff0c\\u7834\\u574f\\u793e\\u4f1a\\u7a33\\u5b9a\\u7684\\uff1b<br><br>(7) \\u6563\\u5e03\\u6deb\\u79fd\\u3001\\u8272\\u60c5\\u3001\\u8d4c\\u535a\\u3001\\u66b4\\u529b\\u3001\\u51f6\\u6740\\u3001\\u6050\\u6016\\u6216\\u8005\\u6559\\u5506\\u72af\\u7f6a\\u7684\\uff1b<br><br>(8) \\u4fae\\u8fb1\\u6216\\u8005\\u8bfd\\u8c24\\u4ed6\\u4eba\\uff0c\\u4fb5\\u5bb3\\u4ed6\\u4eba\\u5408\\u6cd5\\u6743\\u76ca\\u7684\\uff1b<br><br>(9) \\u542b\\u6709\\u6cd5\\u5f8b\\u3001\\u884c\\u653f\\u6cd5\\u89c4\\u7981\\u6b62\\u7684\\u5176\\u4ed6\\u5185\\u5bb9\\u7684\\u3002<br><br>4.4 \\u7528\\u6237\\u540c\\u610f\\u5728\\u4efb\\u4f55\\u60c5\\u51b5\\u4e0b\\u4e0d\\u4f7f\\u7528\\u5176\\u4ed6\\u7528\\u6237\\u7684\\u5e10\\u53f7\\u6216\\u5bc6\\u7801\\u3002\\u5728\\u60a8\\u6000\\u7591\\u4ed6\\u4eba\\u5728\\u4f7f\\u7528\\u60a8\\u7684\\u5e10\\u53f7\\u6216\\u5bc6\\u7801\\u65f6\\uff0c\\u60a8\\u540c\\u610f\\u7acb\\u5373\\u901a\\u77e5\\u5b98\\u65b9\\u3002<br><br>4.5 \\u7528\\u6237\\u6709\\u6743\\u66f4\\u6539\\u3001\\u5220\\u9664\\u5728\\u5e73\\u53f0\\u670d\\u52a1\\u4e2d\\u7684\\u4e2a\\u4eba\\u8d44\\u6599\\u3001\\u6ce8\\u518c\\u4fe1\\u606f\\u53ca\\u4f20\\u9001\\u5185\\u5bb9\\u7b49\\uff0c\\u4f46\\u5220\\u9664\\u6709\\u5173\\u4fe1\\u606f\\u7684\\u540c\\u65f6\\u4e5f\\u4f1a\\u5220\\u9664\\u4efb\\u4f55\\u60a8\\u50a8\\u5b58\\u5728\\u7cfb\\u7edf\\u4e2d\\u7684\\u6587\\u5b57\\u548c\\u56fe\\u7247\\u3002\\u7528\\u6237\\u9700\\u627f\\u62c5\\u8be5\\u98ce\\u9669\\u3002<br><br>4.6 \\u5982\\u56e0\\u7528\\u6237\\u8fdd\\u53cd\\u672c\\u534f\\u8bae\\u4e2d\\u7684\\u4efb\\u4f55\\u6761\\u6b3e\\uff0c\\u5b98\\u65b9\\u6709\\u6743\\u4f9d\\u636e\\u672c\\u534f\\u8bae\\u7ec8\\u6b62\\u5bf9\\u8fdd\\u7ea6\\u7528\\u6237\\u5e73\\u53f0\\u5e10\\u53f7\\u63d0\\u4f9b\\u670d\\u52a1\\u3002<br><br>4.7 \\u5982\\u7528\\u6237\\u6ce8\\u518c\\u5e73\\u53f0\\u5e10\\u53f7\\u540e\\u957f\\u671f\\u4e0d\\u767b\\u5f55\\u8be5\\u5e10\\u53f7\\uff0c\\u5b98\\u65b9\\u6709\\u6743\\u56de\\u6536\\u8be5\\u5e10\\u53f7\\uff0c\\u4ee5\\u514d\\u9020\\u6210\\u8d44\\u6e90\\u6d6a\\u8d39\\uff0c\\u7531\\u6b64\\u5e26\\u6765\\u95ee\\u9898\\u5747\\u7531\\u7528\\u6237\\u81ea\\u884c\\u627f\\u62c5\\u3002<br><br>5. \\u77e5\\u8bc6\\u4ea7\\u6743<br><br>5.1 \\u5b98\\u65b9\\u63d0\\u4f9b\\u5e73\\u53f0\\u670d\\u52a1\\u4e2d\\u6240\\u5305\\u542b\\u7684\\u4efb\\u4f55\\u6587\\u672c\\u3001\\u56fe\\u7247\\u3001\\u6807\\u8bc6\\u3001\\u97f3\\u9891\\u3001\\u89c6\\u9891\\u8d44\\u6599\\u5747\\u53d7\\u8457\\u4f5c\\u6743\\u3001\\u5546\\u6807\\u6743\\u3001\\u4e13\\u5229\\u6743\\u53ca\\u5176\\u4ed6\\u8d22\\u4ea7\\u6743\\u6cd5\\u5f8b\\u7684\\u4fdd\\u62a4\\u3002<br><br>5.2 \\u672a\\u7ecf\\u76f8\\u5173\\u6743\\u5229\\u4eba\\u548c\\u5b98\\u65b9\\u7684\\u540c\\u610f\\uff0c\\u4e0a\\u8ff0\\u8d44\\u6599\\u5747\\u4e0d\\u5f97\\u4ee5\\u4efb\\u4f55\\u65b9\\u5f0f\\u88ab\\u5c55\\u793a\\u4e8e\\u5176\\u4ed6\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u5e73\\u53f0\\u6216\\u88ab\\u7528\\u4e8e\\u5176\\u4ed6\\u4efb\\u4f55\\u5546\\u4e1a\\u76ee\\u7684\\uff1b\\u7528\\u6237\\u4e0d\\u5f97\\u64c5\\u81ea\\u590d\\u5236\\u3001\\u4fee\\u6539\\u3001\\u7f16\\u7e82\\u4e0a\\u8ff0\\u5185\\u5bb9\\u3001\\u6216\\u521b\\u9020\\u4e0e\\u5185\\u5bb9\\u6709\\u5173\\u7684\\u884d\\u751f\\u4ea7\\u54c1\\u3002<br><br>6. \\u9690\\u79c1\\u4fdd\\u62a4<br><br>6.1 \\u672c\\u534f\\u8bae\\u6240\\u6307\\u7684\\u201c\\u9690\\u79c1\\u201d\\u5305\\u62ec\\u300a\\u7535\\u4fe1\\u548c\\u4e92\\u8054\\u7f51\\u7528\\u6237\\u4e2a\\u4eba\\u4fe1\\u606f\\u4fdd\\u62a4\\u89c4\\u5b9a\\u300b\\u7b2c4\\u6761\\u89c4\\u5b9a\\u7684\\u7528\\u6237\\u4e2a\\u4eba\\u4fe1\\u606f\\u7684\\u5185\\u5bb9\\u4ee5\\u53ca\\u672a\\u6765\\u4e0d\\u65f6\\u5236\\u5b9a\\u6216\\u4fee\\u8ba2\\u7684\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u4e2d\\u660e\\u786e\\u89c4\\u5b9a\\u7684\\u9690\\u79c1\\u5e94\\u5305\\u62ec\\u7684\\u5185\\u5bb9\\u3002<br><br>6.2 \\u4fdd\\u62a4\\u7528\\u6237\\u9690\\u79c1\\u548c\\u4e2a\\u4eba\\u6570\\u636e\\u662f\\u5b98\\u65b9\\u7684\\u4e00\\u9879\\u57fa\\u672c\\u5236\\u5ea6\\uff0c\\u5b98\\u65b9\\u5c06\\u91c7\\u53d6\\u5404\\u79cd\\u5236\\u5ea6\\u3001\\u5b89\\u5168\\u6280\\u672f\\u548c\\u7a0b\\u5e8f\\u7b49\\u63aa\\u65bd\\u6765\\u4fdd\\u62a4\\u7528\\u6237\\u9690\\u79c1\\u548c\\u4e2a\\u4eba\\u6570\\u636e\\u4e0d\\u88ab\\u672a\\u7ecf\\u6388\\u6743\\u7684\\u8bbf\\u95ee\\u3001\\u4f7f\\u7528\\u6216\\u6cc4\\u6f0f\\uff0c\\u5e76\\u4fdd\\u8bc1\\u4e0d\\u4f1a\\u5c06\\u5355\\u4e2a\\u7528\\u6237\\u7684\\u6ce8\\u518c\\u8d44\\u6599\\u53ca\\u7528\\u6237\\u5728\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u65f6\\u5b58\\u50a8\\u5728\\u5b98\\u65b9\\u7684\\u975e\\u516c\\u5f00\\u5185\\u5bb9\\u5411\\u9664\\u5408\\u4f5c\\u5355\\u4f4d\\u4ee5\\u5916\\u7684\\u7b2c\\u4e09\\u65b9\\u516c\\u5f00\\u6216\\u7528\\u4e8e\\u4efb\\u4f55\\u975e\\u6cd5\\u7684\\u7528\\u9014\\uff0c\\u4f46\\u4e0b\\u5217\\u60c5\\u51b5\\u9664\\u5916\\uff1a<br><br>(1) \\u4e8b\\u5148\\u83b7\\u5f97\\u7528\\u6237\\u7684\\u660e\\u786e\\u6388\\u6743\\uff1b<br><br>(2) \\u6839\\u636e\\u6709\\u5173\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u7684\\u8981\\u6c42\\uff1b<br><br>(3) \\u6309\\u7167\\u76f8\\u5173\\u653f\\u5e9c\\u4e3b\\u7ba1\\u90e8\\u95e8\\u7684\\u8981\\u6c42\\uff1b<br><br>(4) \\u4e3a\\u7ef4\\u62a4\\u793e\\u4f1a\\u516c\\u4f17\\u7684\\u5229\\u76ca\\uff1b<br><br>(5) \\u7528\\u6237\\u4fb5\\u5bb3\\u672c\\u534f\\u8bae\\u9879\\u4e0b\\u5b98\\u65b9\\u7684\\u5408\\u6cd5\\u6743\\u76ca\\u7684\\u60c5\\u51b5\\u4e0b\\u800c\\u4e3a\\u7ef4\\u62a4\\u5b98\\u65b9\\u7684\\u5408\\u6cd5\\u6743\\u76ca\\u6240\\u5fc5\\u987b\\u3002<br><br>6.3 \\u7528\\u6237\\u5728\\u6ce8\\u518c\\u5e73\\u53f0APP\\u5e10\\u53f7\\u6216\\u4f7f\\u7528\\u5e73\\u53f0APP\\u670d\\u52a1\\u7684\\u8fc7\\u7a0b\\u4e2d\\uff0c\\u9700\\u8981\\u63d0\\u4f9b\\u4e00\\u4e9b\\u5fc5\\u8981\\u7684\\u4fe1\\u606f\\uff0c\\u4f8b\\u5982\\uff1a\\u59d3\\u540d\\u3001\\u7535\\u8bdd\\u3001\\u90ae\\u7bb1\\u3001\\u6027\\u522b\\u3001\\u51fa\\u751f\\u5e74\\u6708\\u3001\\u540d\\u79f0\\u3001\\u6ce8\\u518c\\u5730\\u5740\\u3001\\u6ce8\\u518c\\u53f7\\u7b49\\u3002\\u4e3a\\u5411\\u7528\\u6237\\u63d0\\u4f9b\\u5e10\\u53f7\\u6ce8\\u518c\\u670d\\u52a1\\u6216\\u8fdb\\u884c\\u7528\\u6237\\u8eab\\u4efd\\u8bc6\\u522b\\uff0c\\u9700\\u8981\\u7528\\u6237\\u586b\\u5199\\u624b\\u673a\\u53f7\\u7801\\uff1b\\u90e8\\u5206\\u529f\\u80fd\\u9700\\u8981\\u7528\\u6237\\u6388\\u6743\\u4f7f\\u7528\\u7528\\u6237\\u7684\\u76f8\\u673a\\u6216\\u76f8\\u518c\\uff1b\\u90e8\\u5206\\u529f\\u80fd\\u9700\\u8981\\u7528\\u6237\\u6388\\u6743\\u8bbf\\u95ee\\u7528\\u6237\\u7684\\u624b\\u673a\\u901a\\u8baf\\u5f55\\u7b49\\u3002\\u82e5\\u7528\\u6237\\u4e0d\\u6388\\u6743\\u6216\\u63d0\\u4f9b\\u7684\\u4fe1\\u606f\\u4e0d\\u5b8c\\u6574\\uff0c\\u5219\\u65e0\\u6cd5\\u4f7f\\u7528\\u672c\\u670d\\u52a1\\u6216\\u5728\\u4f7f\\u7528\\u8fc7\\u7a0b\\u4e2d\\u53d7\\u5230\\u9650\\u5236\\u3002\\u7528\\u6237\\u6388\\u6743\\u63d0\\u4f9b\\u7684\\u4fe1\\u606f\\uff0c\\u5b98\\u65b9\\u627f\\u8bfa\\u5c06\\u91c7\\u53d6\\u63aa\\u65bd\\u4fdd\\u62a4\\u7528\\u6237\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u5b89\\u5168\\u3002<br><br>6.4 \\u4e3a\\u4e86\\u5411\\u7528\\u6237\\u63d0\\u4f9b\\u66f4\\u597d\\u7684\\u7528\\u6237\\u4f53\\u9a8c\\u548c\\u63d0\\u9ad8\\u5e73\\u53f0APP\\u7684\\u670d\\u52a1\\u8d28\\u91cf\\uff0c\\u5b98\\u65b9\\u5c06\\u53ef\\u80fd\\u4f1a\\u6536\\u96c6\\u4f7f\\u7528\\u6216\\u5411\\u7b2c\\u4e09\\u65b9\\u63d0\\u4f9b\\u7528\\u6237\\u7684\\u975e\\u4e2a\\u4eba\\u9690\\u79c1\\u4fe1\\u606f\\u3002\\u5b98\\u65b9\\u5c06\\u5bf9\\u8be5\\u7b2c\\u4e09\\u65b9\\u4f7f\\u7528\\u7528\\u6237\\u4e2a\\u4eba\\u6570\\u636e\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u76d1\\u7763\\u548c\\u7ba1\\u7406\\uff0c\\u5c3d\\u4e00\\u5207\\u53ef\\u80fd\\u52aa\\u529b\\u4fdd\\u62a4\\u7528\\u6237\\u4e2a\\u4eba\\u4fe1\\u606f\\u7684\\u5b89\\u5168\\u3002<br><br>7. \\u514d\\u8d23\\u58f0\\u660e<br><br>7.1 \\u7528\\u6237\\u5728\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u7684\\u8fc7\\u7a0b\\u4e2d\\u5e94\\u9075\\u5b88\\u56fd\\u5bb6\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u53ca\\u653f\\u7b56\\u89c4\\u5b9a\\uff0c\\u5bf9\\u5176\\u6240\\u5236\\u4f5c\\u3001\\u4e0a\\u4f20\\u3001\\u53d1\\u9001\\u3001\\u4f20\\u64ad\\u7684\\u4fe1\\u606f\\u548c\\u5185\\u5bb9\\u627f\\u62c5\\u4efb\\u4f55\\u6cd5\\u5f8b\\u8d23\\u4efb\\uff0c\\u4e0e\\u5b98\\u65b9\\u65e0\\u5173\\u3002<br><br>7.2 \\u5e73\\u53f0APP\\u5728\\u5176\\u9875\\u9762\\u4e0a\\u5411\\u7528\\u6237\\u663e\\u793a\\u3001\\u63a8\\u9001\\u7684\\u4efb\\u4f55\\u4fe1\\u606f\\u548c\\u5185\\u5bb9\\u5982\\u7cfb\\u5b98\\u65b9\\u5229\\u7528\\u6280\\u672f\\u624b\\u6bb5\\u6839\\u636e\\u7528\\u6237\\u6307\\u4ee4\\u4ece\\u4e92\\u8054\\u7f51\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u7f51\\u7ad9\\u641c\\u7d22\\u3001\\u5b9a\\u4f4d\\u3001\\u5339\\u914d\\u540e\\u63a8\\u8350\\u7ed9\\u7528\\u6237\\u800c\\u975e\\u5b98\\u65b9\\u5355\\u65b9\\u5236\\u4f5c\\u7684\\uff0c\\u5219\\u8be5\\u663e\\u793a\\u3001\\u63a8\\u9001\\u7684\\u4fe1\\u606f\\u548c\\u5185\\u5bb9\\u5e76\\u4e0d\\u4ee3\\u8868\\u5b98\\u65b9\\u53ca\\u5e73\\u53f0APP\\u7684\\u89c2\\u70b9\\uff0c\\u5b98\\u65b9\\u5e76\\u4e0d\\u5bf9\\u4e0a\\u8ff0\\u4fe1\\u606f\\u7684\\u51c6\\u786e\\u6027\\u548c\\u6b63\\u786e\\u6027\\u8d1f\\u8d23\\u3002<br><br>7.3\\u5b98\\u65b9\\u63d0\\u4f9b\\u5e73\\u53f0APP\\u670d\\u52a1\\u4e2d\\u6240\\u5305\\u542b\\u7684\\u4efb\\u4f55\\u6587\\u672c\\u3001\\u56fe\\u7247\\u3001\\u6807\\u8bc6\\u3001\\u97f3\\u9891\\u3001\\u89c6\\u9891\\u8d44\\u6599\\u5747\\u4e3a\\u6559\\u5b66\\u7528\\u9014\\uff0c\\u4e0d\\u6d89\\u53ca\\u4efb\\u4f55\\u5b9e\\u4f53\\u7269\\u54c1\\u7684\\u5546\\u4e1a\\u6d3b\\u52a8\\u3002<br><br>7.4\\u5e73\\u53f0APP\\u5728\\u5176\\u9875\\u9762\\u4e0a\\u5411\\u7528\\u6237\\u663e\\u793a\\u3001\\u63a8\\u9001\\u7684\\u4efb\\u4f55\\u4fe1\\u606f\\u548c\\u5185\\u5bb9\\u5982\\u5b58\\u5728\\u4fb5\\u6743\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u77e5\\u8bc6\\u4ea7\\u6743\\u7684\\u5acc\\u7591\\uff0c\\u6743\\u5229\\u4eba\\u548c\\u76f8\\u5173\\u5229\\u5bb3\\u5173\\u7cfb\\u4eba\\u5e94\\u5f53\\u5411\\u5b98\\u65b9\\u53d1\\u51fa\\u6743\\u5229\\u901a\\u77e5\\uff0c\\u5b98\\u65b9\\u7ecf\\u8fc7\\u6838\\u5b9e\\u540e\\u6839\\u636e\\u6709\\u5173\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u6709\\u6743\\u91c7\\u53d6\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u65ad\\u5f00\\u8be5\\u4fb5\\u6743\\u5185\\u5bb9\\u7684\\u94fe\\u63a5\\u6216\\u5220\\u9664\\u5e76\\u505c\\u6b62\\u4f20\\u8f93\\u8be5\\u4fb5\\u6743\\u5185\\u5bb9\\uff0c\\u4f46\\u5b98\\u65b9\\u5e76\\u4e0d\\u5bf9\\u8be5\\u4fb5\\u6743\\u5185\\u5bb9\\u627f\\u62c5\\u6cd5\\u5f8b\\u8d23\\u4efb\\u3002<br><br>7.5\\u7528\\u6237\\u8fdd\\u53cd\\u672c\\u534f\\u8bae\\u7684\\u89c4\\u5b9a\\uff0c\\u5bfc\\u81f4\\u6216\\u4ea7\\u751f\\u7684\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u4e3b\\u5f20\\u7684\\u4efb\\u4f55\\u7d22\\u8d54\\u3001\\u8981\\u6c42\\u6216\\u635f\\u5931\\uff0c\\u5305\\u62ec\\u5408\\u7406\\u7684\\u5f8b\\u5e08\\u8d39\\uff0c\\u7528\\u6237\\u540c\\u610f\\u8d54\\u507f\\u5b98\\u65b9\\uff0c\\u4f7f\\u4e4b\\u514d\\u53d7\\u635f\\u5bb3\\u3002<br><br>8. \\u5176\\u4ed6\\u6761\\u6b3e<br><br>8.1 \\u5b98\\u65b9\\u6709\\u6743\\u968f\\u65f6\\u4fee\\u6539\\u672c\\u534f\\u8bae\\u7684\\u4efb\\u4f55\\u6761\\u6b3e\\uff0c\\u4e00\\u65e6\\u672c\\u534f\\u8bae\\u7684\\u5185\\u5bb9\\u53d1\\u751f\\u53d8\\u52a8\\uff0c\\u5b98\\u65b9\\u5c06\\u4f1a\\u5728\\u5e73\\u53f0APP\\u5e73\\u53f0\\u4e2d\\u516c\\u5e03\\u4fee\\u6539\\u540e\\u7684\\u534f\\u8bae\\u5185\\u5bb9\\u6216\\u901a\\u8fc7\\u5176\\u4ed6\\u9002\\u5f53\\u65b9\\u5f0f\\u5411\\u7528\\u6237\\u516c\\u5e03\\u4fee\\u6539\\u5185\\u5bb9\\u3002\\u7528\\u6237\\u4e0d\\u540c\\u610f\\u4e0a\\u8ff0\\u4fee\\u6539\\u5185\\u5bb9\\uff0c\\u6709\\u6743\\u9009\\u62e9\\u505c\\u6b62\\u4f7f\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\uff0c\\u4f46\\u7528\\u6237\\u7ee7\\u7eed\\u4f7f\\u7528\\uff0c\\u5219\\u89c6\\u4e3a\\u63a5\\u53d7\\u5b98\\u65b9\\u5bf9\\u672c\\u534f\\u8bae\\u76f8\\u5173\\u6761\\u6b3e\\u7684\\u4fee\\u6539\\u3002<br><br>8.2 \\u672c\\u300a\\u534f\\u8bae\\u300b\\u6240\\u5b9a\\u7684\\u4efb\\u4f55\\u6761\\u6b3e\\u65e0\\u8bba\\u56e0\\u4f55\\u79cd\\u539f\\u56e0\\u90e8\\u5206\\u6216\\u5168\\u90e8\\u65e0\\u6548\\u6216\\u4e0d\\u5177\\u6709\\u6267\\u884c\\u529b\\uff0c\\u672c\\u534f\\u8bae\\u7684\\u5176\\u4f59\\u6761\\u6b3e\\u4ecd\\u5e94\\u6709\\u6548\\u5e76\\u5177\\u5907\\u7ea6\\u675f\\u529b\\u3002<br><br>8.3 \\u672c\\u534f\\u8bae\\u7684\\u8ba2\\u7acb\\u3001\\u6267\\u884c\\u548c\\u89e3\\u91ca\\u53ca\\u7ea0\\u7eb7\\u7684\\u89e3\\u51b3\\u5747\\u5e94\\u9002\\u7528\\u4e2d\\u534e\\u4eba\\u6c11\\u5171\\u548c\\u56fd\\u6cd5\\u5f8b\\u5e76\\u53d7\\u4e2d\\u534e\\u4eba\\u6c11\\u5171\\u548c\\u56fd\\u6cd5\\u9662\\u7ba1\\u8f96\\u3002\\u5982\\u53cc\\u65b9\\u5c31\\u672c\\u534f\\u8bae\\u5185\\u5bb9\\u6216\\u6267\\u884c\\u53d1\\u751f\\u4efb\\u4f55\\u7ea0\\u7eb7\\u6216\\u4e89\\u8bae\\uff0c\\u9996\\u5148\\u5e94\\u53cb\\u597d\\u534f\\u5546\\u89e3\\u51b3\\uff0c\\u534f\\u5546\\u4e0d\\u6210\\u7684\\uff0c\\u4efb\\u4f55\\u4e00\\u65b9\\u5747\\u53ef\\u5411\\u5b98\\u65b9\\u6240\\u5728\\u5730\\u7684\\u6709\\u7ba1\\u8f96\\u6743\\u7684\\u4eba\\u6c11\\u6cd5\\u9662\\u63d0\\u8d77\\u8bc9\\u8bbc\\u3002<br><br>8.4 \\u672c\\u534f\\u8bae\\u7684\\u7248\\u6743\\u5f52\\u5b98\\u65b9\\u6240\\u6709\\uff0c\\u672c\\u534f\\u8bae\\u5404\\u9879\\u6761\\u6b3e\\u5185\\u5bb9\\u7684\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u53ca\\u4fee\\u6539\\u6743\\u5f52\\u5b98\\u65b9\\u6240\\u6709\\u3002<\\/span><\\/p>\",\"privacy\":\"<p>\\u672c\\u5e94\\u7528\\u975e\\u5e38\\u91cd\\u89c6\\u7528\\u6237\\u9690\\u79c1\\u653f\\u7b56\\u5e76\\u4e25\\u683c\\u9075\\u5b88\\u76f8\\u5173\\u7684\\u6cd5\\u5f8b\\u89c4\\u5b9a\\u3002\\u8bf7\\u60a8\\u4ed4\\u7ec6\\u9605\\u8bfb\\u300a\\u9690\\u79c1\\u653f\\u7b56\\u300b\\u540e\\u518d\\u7ee7\\u7eed\\u4f7f\\u7528\\u3002\\u5982\\u679c\\u60a8\\u7ee7\\u7eed\\u4f7f\\u7528\\u6211\\u4eec\\u7684\\u670d\\u52a1\\uff0c\\u8868\\u793a\\u60a8\\u5df2\\u7ecf\\u5145\\u5206\\u9605\\u8bfb\\u548c\\u7406\\u89e3\\u6211\\u4eec\\u534f\\u8bae\\u7684\\u5168\\u90e8\\u5185\\u5bb9\\u3002<\\/p><p>\\u672capp\\u5c0a\\u91cd\\u5e76\\u4fdd\\u62a4\\u6240\\u6709\\u4f7f\\u7528\\u670d\\u52a1\\u7528\\u6237\\u7684\\u4e2a\\u4eba\\u9690\\u79c1\\u6743\\u3002\\u4e3a\\u4e86\\u7ed9\\u60a8\\u63d0\\u4f9b\\u66f4\\u51c6\\u786e\\u3001\\u66f4\\u4f18\\u8d28\\u7684\\u670d\\u52a1\\uff0c\\u672c\\u5e94\\u7528\\u4f1a\\u6309\\u7167\\u672c\\u9690\\u79c1\\u6743\\u653f\\u7b56\\u7684\\u89c4\\u5b9a\\u4f7f\\u7528\\u548c\\u62ab\\u9732\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u3002\\u9664\\u672c\\u9690\\u79c1\\u6743\\u653f\\u7b56\\u53e6\\u6709\\u89c4\\u5b9a\\u5916\\uff0c\\u5728\\u672a\\u5f81\\u5f97\\u60a8\\u4e8b\\u5148\\u8bb8\\u53ef\\u7684\\u60c5\\u51b5\\u4e0b\\uff0c\\u672c\\u5e94\\u7528\\u4e0d\\u4f1a\\u5c06\\u8fd9\\u4e9b\\u4fe1\\u606f\\u5bf9\\u5916\\u62ab\\u9732\\u6216\\u5411\\u7b2c\\u4e09\\u65b9\\u63d0\\u4f9b\\u3002\\u672c\\u5e94\\u7528\\u4f1a\\u4e0d\\u65f6\\u66f4\\u65b0\\u672c\\u9690\\u79c1\\u6743\\u653f\\u7b56\\u3002&nbsp;\\u60a8\\u5728\\u540c\\u610f\\u672c\\u5e94\\u7528\\u670d\\u52a1\\u4f7f\\u7528\\u534f\\u8bae\\u4e4b\\u65f6\\uff0c\\u5373\\u89c6\\u4e3a\\u60a8\\u5df2\\u7ecf\\u540c\\u610f\\u672c\\u9690\\u79c1\\u6743\\u653f\\u7b56\\u5168\\u90e8\\u5185\\u5bb9\\u3002<\\/p><p><b>1.&nbsp;<\\/b>\\u9002\\u7528\\u8303\\u56f4<\\/p><p>(a)&nbsp;\\u5728\\u60a8\\u6ce8\\u518c\\u672c\\u5e94\\u7528app\\u5e10\\u53f7\\u65f6\\uff0c\\u60a8\\u6839\\u636eapp\\u8981\\u6c42\\u63d0\\u4f9b\\u7684\\u4e2a\\u4eba\\u6ce8\\u518c\\u4fe1\\u606f\\uff1b<\\/p><p>(b)&nbsp;\\u5728\\u60a8\\u4f7f\\u7528\\u672c\\u5e94\\u7528\\u7f51\\u7edc\\u670d\\u52a1\\uff0c\\u6216\\u8bbf\\u95ee\\u672c\\u5e94\\u7528\\u5e73\\u53f0\\u7f51\\u9875\\u65f6\\uff0c\\u672c\\u5e94\\u7528\\u81ea\\u52a8\\u63a5\\u6536\\u5e76\\u8bb0\\u5f55\\u7684\\u60a8\\u7684\\u6d4f\\u89c8\\u5668\\u548c\\u8ba1\\u7b97\\u673a\\u4e0a\\u7684\\u4fe1\\u606f\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u60a8\\u7684IP\\u5730\\u5740\\u3001\\u6d4f\\u89c8\\u5668\\u7684\\u7c7b\\u578b\\u3001\\u4f7f\\u7528\\u7684\\u8bed\\u8a00\\u3001\\u8bbf\\u95ee\\u65e5\\u671f\\u548c\\u65f6\\u95f4\\u3001\\u8f6f\\u786c\\u4ef6\\u7279\\u5f81\\u4fe1\\u606f\\u53ca\\u60a8\\u9700\\u6c42\\u7684\\u7f51\\u9875\\u8bb0\\u5f55\\u7b49\\u6570\\u636e\\uff1b<\\/p><p>(c)&nbsp;\\u672c\\u5e94\\u7528\\u901a\\u8fc7\\u5408\\u6cd5\\u9014\\u5f84\\u4ece\\u5546\\u4e1a\\u4f19\\u4f34\\u5904\\u53d6\\u5f97\\u7684\\u7528\\u6237\\u4e2a\\u4eba\\u6570\\u636e\\u3002<\\/p><p>(d)\\u672c\\u5e94\\u7528\\u4e25\\u7981\\u7528\\u6237\\u53d1\\u5e03\\u4e0d\\u826f\\u4fe1\\u606f\\uff0c\\u5982\\u88f8\\u9732\\u3001\\u8272\\u60c5\\u548c\\u4eb5\\u6e0e\\u5185\\u5bb9\\uff0c\\u53d1\\u5e03\\u7684\\u5185\\u5bb9\\u6211\\u4eec\\u4f1a\\u8fdb\\u884c\\u5ba1\\u6838\\uff0c\\u4e00\\u7ecf\\u53d1\\u73b0\\u4e0d\\u826f\\u4fe1\\u606f\\uff0c\\u4f1a\\u7981\\u7528\\u8be5\\u7528\\u6237\\u7684\\u6240\\u6709\\u6743\\u9650\\uff0c\\u4e88\\u4ee5\\u5c01\\u53f7\\u5904\\u7406\\u3002<\\/p><p><b>2.&nbsp;<\\/b>\\u4fe1\\u606f\\u4f7f\\u7528<\\/p><p>(a)\\u672c\\u5e94\\u7528\\u4e0d\\u4f1a\\u5411\\u4efb\\u4f55\\u65e0\\u5173\\u7b2c\\u4e09\\u65b9\\u63d0\\u4f9b\\u3001\\u51fa\\u552e\\u3001\\u51fa\\u79df\\u3001\\u5206\\u4eab\\u6216\\u4ea4\\u6613\\u60a8\\u7684\\u4e2a\\u4eba\\u767b\\u5f55\\u4fe1\\u606f\\u3002\\u5982\\u679c\\u6211\\u4eec\\u5b58\\u50a8\\u53d1\\u751f\\u7ef4\\u4fee\\u6216\\u5347\\u7ea7\\uff0c\\u6211\\u4eec\\u4f1a\\u4e8b\\u5148\\u53d1\\u51fa\\u63a8\\u9001\\u6d88\\u606f\\u6765\\u901a\\u77e5\\u60a8\\uff0c\\u8bf7\\u60a8\\u63d0\\u524d\\u5141\\u8bb8\\u672c\\u5e94\\u7528\\u6d88\\u606f\\u901a\\u77e5\\u3002<\\/p><p>(b)&nbsp;\\u672c\\u5e94\\u7528\\u4ea6\\u4e0d\\u5141\\u8bb8\\u4efb\\u4f55\\u7b2c\\u4e09\\u65b9\\u4ee5\\u4efb\\u4f55\\u624b\\u6bb5\\u6536\\u96c6\\u3001\\u7f16\\u8f91\\u3001\\u51fa\\u552e\\u6216\\u8005\\u65e0\\u507f\\u4f20\\u64ad\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u3002\\u4efb\\u4f55\\u672c\\u5e94\\u7528\\u5e73\\u53f0\\u7528\\u6237\\u5982\\u4ece\\u4e8b\\u4e0a\\u8ff0\\u6d3b\\u52a8\\uff0c\\u4e00\\u7ecf\\u53d1\\u73b0\\uff0c\\u672c\\u5e94\\u7528\\u6709\\u6743\\u7acb\\u5373\\u7ec8\\u6b62\\u4e0e\\u8be5\\u7528\\u6237\\u7684\\u670d\\u52a1\\u534f\\u8bae\\u3002<\\/p><p>(c)&nbsp;\\u4e3a\\u670d\\u52a1\\u7528\\u6237\\u7684\\u76ee\\u7684\\uff0c\\u672c\\u5e94\\u7528\\u53ef\\u80fd\\u901a\\u8fc7\\u4f7f\\u7528\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u5411\\u60a8\\u63d0\\u4f9b\\u60a8\\u611f\\u5174\\u8da3\\u7684\\u4fe1\\u606f\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u5411\\u60a8\\u53d1\\u51fa\\u4ea7\\u54c1\\u548c\\u670d\\u52a1\\u4fe1\\u606f\\uff0c\\u6216\\u8005\\u4e0e\\u672c\\u5e94\\u7528\\u5408\\u4f5c\\u4f19\\u4f34\\u5171\\u4eab\\u4fe1\\u606f\\u4ee5\\u4fbf\\u4ed6\\u4eec\\u5411\\u60a8\\u53d1\\u9001\\u6709\\u5173\\u5176\\u4ea7\\u54c1\\u548c\\u670d\\u52a1\\u7684\\u4fe1\\u606f\\uff08\\u540e\\u8005\\u9700\\u8981\\u60a8\\u7684\\u4e8b\\u5148\\u540c\\u610f\\uff09\\u3002<\\/p><p><b>3.&nbsp;<\\/b>\\u4fe1\\u606f\\u62ab\\u9732<\\/p><p>\\u5728\\u5982\\u4e0b\\u60c5\\u51b5\\u4e0b\\uff0c\\u672c\\u5e94\\u7528\\u5c06\\u4f9d\\u636e\\u60a8\\u7684\\u4e2a\\u4eba\\u610f\\u613f\\u6216\\u6cd5\\u5f8b\\u7684\\u89c4\\u5b9a\\u5168\\u90e8\\u6216\\u90e8\\u5206\\u7684\\u62ab\\u9732\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff1a<\\/p><p>(a)&nbsp;\\u672a\\u7ecf\\u60a8\\u4e8b\\u5148\\u540c\\u610f\\uff0c\\u6211\\u4eec\\u4e0d\\u4f1a\\u5411\\u7b2c\\u4e09\\u65b9\\u62ab\\u9732\\uff1b<\\/p><p>(b)\\u4e3a\\u63d0\\u4f9b\\u60a8\\u6240\\u8981\\u6c42\\u7684\\u4ea7\\u54c1\\u548c\\u670d\\u52a1\\uff0c\\u800c\\u5fc5\\u987b\\u548c\\u7b2c\\u4e09\\u65b9\\u5206\\u4eab\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff1b<\\/p><p>(c)&nbsp;\\u6839\\u636e\\u6cd5\\u5f8b\\u7684\\u6709\\u5173\\u89c4\\u5b9a\\uff0c\\u6216\\u8005\\u884c\\u653f\\u6216\\u53f8\\u6cd5\\u673a\\u6784\\u7684\\u8981\\u6c42\\uff0c\\u5411\\u7b2c\\u4e09\\u65b9\\u6216\\u8005\\u884c\\u653f\\u3001\\u53f8\\u6cd5\\u673a\\u6784\\u62ab\\u9732\\uff1b<\\/p><p>(d)&nbsp;\\u5982\\u60a8\\u51fa\\u73b0\\u8fdd\\u53cd\\u4e2d\\u56fd\\u6709\\u5173\\u6cd5\\u5f8b\\u3001\\u6cd5\\u89c4\\u6216\\u8005\\u672c\\u5e94\\u7528\\u670d\\u52a1\\u534f\\u8bae\\u6216\\u76f8\\u5173\\u89c4\\u5219\\u7684\\u60c5\\u51b5\\uff0c\\u9700\\u8981\\u5411\\u7b2c\\u4e09\\u65b9\\u62ab\\u9732\\uff1b<\\/p><p>(e)&nbsp;\\u5982\\u60a8\\u662f\\u9002\\u683c\\u7684\\u77e5\\u8bc6\\u4ea7\\u6743\\u6295\\u8bc9\\u4eba\\u5e76\\u5df2\\u63d0\\u8d77\\u6295\\u8bc9\\uff0c\\u5e94\\u88ab\\u6295\\u8bc9\\u4eba\\u8981\\u6c42\\uff0c\\u5411\\u88ab\\u6295\\u8bc9\\u4eba\\u62ab\\u9732\\uff0c\\u4ee5\\u4fbf\\u53cc\\u65b9\\u5904\\u7406\\u53ef\\u80fd\\u7684\\u6743\\u5229\\u7ea0\\u7eb7\\uff1b<\\/p><p><b>4.&nbsp;<\\/b>\\u4fe1\\u606f\\u5b58\\u50a8\\u548c\\u4ea4\\u6362<\\/p><p>\\u672c\\u5e94\\u7528\\u6536\\u96c6\\u7684\\u6709\\u5173\\u60a8\\u7684\\u4fe1\\u606f\\u548c\\u8d44\\u6599\\u5c06\\u4fdd\\u5b58\\u5728\\u672c\\u5e94\\u7528\\u53ca\\uff08\\u6216\\uff09\\u5176\\u5173\\u8054\\u516c\\u53f8\\u7684\\u670d\\u52a1\\u5668\\u4e0a\\uff0c\\u8fd9\\u4e9b\\u4fe1\\u606f\\u548c\\u8d44\\u6599\\u53ef\\u80fd\\u4f20\\u9001\\u81f3\\u60a8\\u6240\\u5728\\u56fd\\u5bb6\\u3001\\u5730\\u533a\\u6216\\u672c\\u5e94\\u7528\\u6536\\u96c6\\u4fe1\\u606f\\u548c\\u8d44\\u6599\\u6240\\u5728\\u5730\\u7684\\u5883\\u5916\\u5e76\\u5728\\u5883\\u5916\\u88ab\\u8bbf\\u95ee\\u3001\\u5b58\\u50a8\\u548c\\u5c55\\u793a\\u3002<\\/p><p><b>5. Cookie<\\/b>\\u7684\\u4f7f\\u7528<\\/p><p>(a)&nbsp;\\u5728\\u60a8\\u672a\\u62d2\\u7edd\\u63a5\\u53d7cookies\\u7684\\u60c5\\u51b5\\u4e0b\\uff0c\\u672c\\u5e94\\u7528\\u4f1a\\u5728\\u60a8\\u7684\\u8ba1\\u7b97\\u673a\\u4e0a\\u8bbe\\u5b9a\\u6216\\u53d6\\u7528cookies&nbsp;\\uff0c\\u4ee5\\u4fbf\\u60a8\\u80fd\\u767b\\u5f55\\u6216\\u4f7f\\u7528\\u4f9d\\u8d56\\u4e8ecookies\\u7684\\u672c\\u5e94\\u7528\\u5e73\\u53f0\\u670d\\u52a1\\u6216\\u529f\\u80fd\\u3002\\u672c\\u5e94\\u7528\\u4f7f\\u7528cookies\\u53ef\\u4e3a\\u60a8\\u63d0\\u4f9b\\u66f4\\u52a0\\u5468\\u5230\\u7684\\u4e2a\\u6027\\u5316\\u670d\\u52a1\\uff0c\\u5305\\u62ec\\u63a8\\u5e7f\\u670d\\u52a1\\u3002<\\/p><p>(b)&nbsp;\\u60a8\\u6709\\u6743\\u9009\\u62e9\\u63a5\\u53d7\\u6216\\u62d2\\u7edd\\u63a5\\u53d7cookies\\u3002\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u4fee\\u6539\\u6d4f\\u89c8\\u5668\\u8bbe\\u7f6e\\u7684\\u65b9\\u5f0f\\u62d2\\u7edd\\u63a5\\u53d7cookies\\u3002\\u4f46\\u5982\\u679c\\u60a8\\u9009\\u62e9\\u62d2\\u7edd\\u63a5\\u53d7cookies\\uff0c\\u5219\\u60a8\\u53ef\\u80fd\\u65e0\\u6cd5\\u767b\\u5f55\\u6216\\u4f7f\\u7528\\u4f9d\\u8d56\\u4e8ecookies\\u7684\\u672c\\u5e94\\u7528\\u7f51\\u7edc\\u670d\\u52a1\\u6216\\u529f\\u80fd\\u3002<\\/p><p>(c)&nbsp;\\u901a\\u8fc7\\u672c\\u5e94\\u7528\\u6240\\u8bbecookies\\u6240\\u53d6\\u5f97\\u7684\\u6709\\u5173\\u4fe1\\u606f\\uff0c\\u5c06\\u9002\\u7528\\u672c\\u653f\\u7b56\\u3002<\\/p><p><b>6.<\\/b>\\u672c\\u9690\\u79c1\\u653f\\u7b56\\u7684\\u66f4\\u6539<\\/p><p>(a)\\u5982\\u679c\\u51b3\\u5b9a\\u66f4\\u6539\\u9690\\u79c1\\u653f\\u7b56\\uff0c\\u6211\\u4eec\\u4f1a\\u5728\\u672c\\u653f\\u7b56\\u4e2d\\u3001\\u672c\\u516c\\u53f8\\u7f51\\u7ad9\\u4e2d\\u4ee5\\u53ca\\u6211\\u4eec\\u8ba4\\u4e3a\\u9002\\u5f53\\u7684\\u4f4d\\u7f6e\\u53d1\\u5e03\\u8fd9\\u4e9b\\u66f4\\u6539\\uff0c\\u4ee5\\u4fbf\\u60a8\\u4e86\\u89e3\\u6211\\u4eec\\u5982\\u4f55\\u6536\\u96c6\\u3001\\u4f7f\\u7528\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u54ea\\u4e9b\\u4eba\\u53ef\\u4ee5\\u8bbf\\u95ee\\u8fd9\\u4e9b\\u4fe1\\u606f\\uff0c\\u4ee5\\u53ca\\u5728\\u4ec0\\u4e48\\u60c5\\u51b5\\u4e0b\\u6211\\u4eec\\u4f1a\\u900f\\u9732\\u8fd9\\u4e9b\\u4fe1\\u606f\\u3002<\\/p><p>(b)\\u672c\\u516c\\u53f8\\u4fdd\\u7559\\u968f\\u65f6\\u4fee\\u6539\\u672c\\u653f\\u7b56\\u7684\\u6743\\u5229\\uff0c\\u56e0\\u6b64\\u8bf7\\u7ecf\\u5e38\\u67e5\\u770b\\u3002\\u5982\\u5bf9\\u672c\\u653f\\u7b56\\u4f5c\\u51fa\\u91cd\\u5927\\u66f4\\u6539\\uff0c\\u672c\\u516c\\u53f8\\u4f1a\\u901a\\u8fc7\\u7f51\\u7ad9\\u901a\\u77e5\\u7684\\u5f62\\u5f0f\\u544a\\u77e5\\u3002<\\/p><p>\\u65b9\\u62ab\\u9732\\u81ea\\u5df1\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u5982\\u8054\\u7edc\\u65b9\\u5f0f\\u6216\\u8005\\u90ae\\u653f\\u5730\\u5740\\u3002\\u8bf7\\u60a8\\u59a5\\u5584\\u4fdd\\u62a4\\u81ea\\u5df1\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u4ec5\\u5728\\u5fc5\\u8981\\u7684\\u60c5\\u5f62\\u4e0b\\u5411\\u4ed6\\u4eba\\u63d0\\u4f9b\\u3002\\u5982\\u60a8\\u53d1\\u73b0\\u81ea\\u5df1\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u6cc4\\u5bc6\\uff0c\\u5c24\\u5176\\u662f\\u672c\\u5e94\\u7528\\u7528\\u6237\\u540d\\u53ca\\u5bc6\\u7801\\u53d1\\u751f\\u6cc4\\u9732\\uff0c\\u8bf7\\u60a8\\u7acb\\u5373\\u8054\\u7edc\\u672c\\u5e94\\u7528\\u5ba2\\u670d\\uff0c\\u4ee5\\u4fbf\\u672c\\u5e94\\u7528\\u91c7\\u53d6\\u76f8\\u5e94\\u63aa\\u65bd\\u3002<\\/p><p>\\u611f\\u8c22\\u60a8\\u82b1\\u65f6\\u95f4\\u4e86\\u89e3\\u6211\\u4eec\\u7684\\u9690\\u79c1\\u653f\\u7b56\\uff01\\u6211\\u4eec\\u5c06\\u5c3d\\u5168\\u529b\\u4fdd\\u62a4\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u548c\\u5408\\u6cd5\\u6743\\u76ca\\uff0c\\u518d\\u6b21\\u611f\\u8c22\\u60a8\\u7684\\u4fe1\\u4efb\\uff01<\\/p><p><br>&nbsp;<\\/p>\"}', 1607936978, 1610716768);
INSERT INTO `common_setting` VALUES (7, 'app', '{\"set_key\":\"app\",\"version\":\"1.0.1\",\"content\":\"1\\u3001\\u529f\\u80fd\\u65b0\\u589e\\n2\\u3001bug\\u4fee\\u590d\\n3\\u3001\\u6027\\u80fd\\u63d0\\u5347\",\"file\":\"http:\\/\\/192.168.0.168:9501\\/storage\\/6e07b9bc778481cac5b15435f9d23e16.wgt\",\"fenfa_url\":\"https:\\/\\/qq.com\",\"android_url\":\"https:\\/\\/dev.mi.com\\/console\\/\",\"ios_url\":\"https:\\/\\/baidu.com\"}', 1607948086, 0);
INSERT INTO `common_setting` VALUES (8, 'contact', '{\"set_key\":\"contact\",\"qrcode\":\"http:\\/\\/192.168.0.168:9501\\/storage\\/8cfb96eca6b462571771fddffd687fb0.jpg\",\"file\":\"\",\"phone\":\"1111111111111\",\"qq\":\"222222222222\",\"worktime\":\"\\u4e0a\\u53489:00-12:00 \\u4e0b\\u534814:00-18:00\"}', 1607948784, 1610260171);
INSERT INTO `common_setting` VALUES (9, 'sms', '{\"set_key\":\"sms\",\"sign_name\":\"\\u51c0\\u6c34\\u5668\",\"code_tpl\":\"10002\",\"notice_tpl\":\"1003\"}', 1607949453, 0);
INSERT INTO `common_setting` VALUES (10, 'payment', '{\"set_key\":\"payment\",\"notify_url\":\"\\/pay\\/notify\",\"alipay_app_id\":\"2021002115698315\",\"alipay_private_key\":\"MIIEowIBAAKCAQEAiH7Sxb2jE127vPJ9nI\\/8B5jlGv2n67tLZ2DxCx1kpfrMWvb6gULHCzmQ3NLezboUS+cSl1UoZL14vbWwBglJKVX2RqFVxOsALpoQ\\/X3aQBMk53zZbP\\/e0Pce9PJXkJMXJfD+PkTvTioG0ejjnU0N0n8AEccg\\/ULcvTK7tDiJTFtcbCqqkKq81OmMpXGTiK7aH3lCCPp12\\/IxGUs\\/ySnPb3l4msnk+8M3TZsCwKGmk8EoB1Xofm15v0yWiACdWWFNfvFmnbuJTgPE+TCvn+Hfer00+\\/BSD+XwbDGSPQGLfReKnBg+FTNhazBltfEkWYqqJLadpx6LeC6P6tJ79wlXawIDAQABAoIBAQCH+yDsErLF9lm0MThmoyMIRo\\/oRc\\/mjt7eDLvWwN+mY6b28Jo78FTvn9frxsBk3\\/6cZ4Yj8ZieVAxXowvL17BlV9hUISKbXSr\\/Qkmu4JRvxSK846qQZpCKSccza8NEquUizWXcjzyA+Gl28bbg3QTqMc\\/V5jW9WcEjU8mgD7ror51fRwCTRlD8ZeWM6DVwMlBusw8jjmX0FyBWcJIpuXhdWRgIhc3HJ2Enb0yAQjtSXd\\/LMJkFHgtaUCASY5GoqwrGsEgT2IqkdGB4TeTg0JozQRag673AsPgpAuqk\\/LVHn\\/+J5a0Q8FI4MKwah28FGqgWuuQVQSbGClheXedHQsnBAoGBAM\\/xdlgfj2pIRHhAI3FP4iR\\/EPIcBrIgTm39DIwotAjOYoWMDXWdiyNjnnkRcdtXaE+\\/uro6SUacLnI9Sf1DtToxh2RLeXaVhdLgCJkow+bR78XjTOPQ\\/ZQfrYNJEmZwAJd5SOjHvX7MSEKsQeRz4ShfguWU\\/miww8c2BU4ZLHWbAoGBAKgKS+5Gk4\\/U0Y0ukcbgnjhS\\/Gxpthz66XuuCeRG6hhQxE5Cwpb7U+RVc1nruz2nss6RNYRdKS1zS7Wx7Cl7dzEKQmuDNn8bpjXdmH1LOE7z3kdme92NbxjrygiJ3d4up+1JSxlFKIUei+Yb7z\\/ZE7yoZxCZDI3vMeOf9OBeOipxAoGAHGNXh7JPTvAswMnozMheFCNwuczPsTOt4WAhfWT1Jxqd4qN7Fup6G0u3T8ns5Efriq+fG1tns4cQ5DGvzy6WKCqo1C1lmKXTDjXdlqM1E2bnt\\/lO\\/u8CH12vv3OTWn7B5ev94yGZohzbZJbFrB2RyIQ5h4QuszYmlCSw1rejFS8CgYBuFHCxYuJ\\/snaj+gHdOn\\/rfdGGY6m9SlFxiA1K0XnA\\/AfdDLbUmUfXqHKsUVSTiywDTfS1BSJYd9L879U5R3xJT+M68vXcRoyXdNbUHVaBwhe2xlgWRvSkarIq7cW+Kuou83iS0U8+BUi4MUyFkvru95KsuNYUlMEl0D9mS9PmwQKBgE4QjfAlkdlSOtZL2uEi0LlXhh65ZDqFB5ZNE+Ll3xyF9dPOrnbuSO5vlliTn4KWVf1Fvoc+4nJmHp\\/WfCpfhsxjXgxnYYOu5QD7MgadpSxfvWqMyiZoo6S46TeExzB86A5nIyex1Sq8jDzboGZz6IRMVnk\\/lOwWMk4QzG2q3APx\",\"ali_public_key\":\"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvGVlpEpyKHBHWaJFqoDeYg+pgCZnChV23n8zWmRrKjt6bKBm0DJBBgWhsHMpO\\/7wq0dmbCtb21mXsuW296Lf67mg6Bmj4pAAGdzmDdynD4ozd5G\\/abhQrOiMZF5iWqyl3HRri\\/sn6hEA+ne7YmVhkS7xoyx7vJgX+shdbBFoN5\\/NKDDlGbO3MTTB7mI\\/pe42dHg\\/gH67Ksdsj1cJ4lEjzx1EMWx+Wwr3Jbp15ZYyIDwS3Vb9L\\/o1N3CiSmEr371bJto4oi0oj0xgyu2rrjxdr5ycjmRRkiozbehK\\/uH\\/KxYOFhXCotGh08jNFU9ZaPVuQeYCMroOwxhZSY674n6mowIDAQAB\",\"wechat_appid\":\"66\",\"wechat_app_id\":\"\",\"wechat_miniapp_id\":\"99\",\"wechat_mchid\":\"\",\"wechat_key\":\"\"}', 1607949483, 0);
INSERT INTO `common_setting` VALUES (11, 'distribution', '{\"set_key\":\"distribution\",\"upgrade_agent_fee\":\"399\",\"upgrade_agent_getcoupon_no\":\"100\",\"upgrade_agent_getcoupon_goodstitle\":\"\\u7a7a\\u8c03\\u683c\\u529b\",\"upgrade_agent_getcoupon_goodsid\":\"6\",\"agent_active_agent\":\"8\",\"upgrade_operator_need_agent\":\"2\",\"upgrade_operator_need_vip\":\"2\",\"operator_getvip_toagent\":\"20\",\"operator_indirect_toagent\":\"2\",\"vip_des\":\"<p>1.\\u7f34\\u7eb3\\u4f1a\\u5458\\u8d39150\\uff0c\\u9009\\u62e9\\u8981\\u8d60\\u9001\\u7684\\u5546\\u54c1,\\u5373\\u53ef\\u6210\\u4e3a\\u4f1a\\u5458<\\/p><p>&nbsp;2.\\u9009\\u62e9\\u8d60\\u9001\\u5546\\u54c1\\uff0c\\u652f\\u4ed8\\u90ae\\u8d39\\u5373\\u53ef<\\/p>\",\"agent_desc\":\"<p>1.\\u8d60\\u9001100\\u5f20\\u4f18\\u60e0\\u5361\\u53ef\\u5206\\u4eab&nbsp;<\\/p><p>2.\\u4f18\\u60e0\\u5361\\u5206\\u4eab\\u51fa\\u53bb\\u6fc0\\u6d3b\\u4f1a\\u5458\\u540e\\u8fd4\\u73b020\\u5143\\u6536\\u76ca&nbsp;<\\/p><p>3.\\u624b\\u4e0b\\u4f1a\\u5458\\u664b\\u7ea7\\u4e3a\\u4ee3\\u7406\\u5546\\u8fd4\\u73b099\\u5143\\u6536\\u76ca&nbsp;<\\/p><p>4.\\u624b\\u4e0b\\u7d2f\\u8ba1\\u4ee3\\u7406\\u554660\\u4e2a+\\u6fc0\\u6d3b\\u4f1a\\u54581000\\u5f20\\u81ea\\u52a8\\u5347\\u7ea7\\u4e3a \\u4ee3\\u7406\\u5546<\\/p><p>&nbsp;5.\\u7535\\u5b50\\u4f18\\u60e0\\u5361\\u6bcf\\u5f20\\u96f6\\u552e20\\u5143 \\uff08\\u7ecf\\u9500\\u5546\\u4e8c\\u6b21\\u8d2d\\u5361\\u6bcf\\u5f203\\u5143\\uff1b\\u8fd0\\u8425\\u5546\\u6bcf\\u5f202\\u5143\\uff09<\\/p>\"}', 1608930537, 0);

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
  `deleted_at` int UNSIGNED NULL DEFAULT 0 COMMENT '删除时间',
  `created_at` int UNSIGNED NULL DEFAULT 0,
  `updated_at` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `storage`(`storage`) USING BTREE,
  INDEX `type`(`types`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '上传文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of common_uploadfile
-- ----------------------------
INSERT INTO `common_uploadfile` VALUES (1, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/9f5c86f9b0af781522a55d3ae03971a4.jpg', 0, 0, 0);
INSERT INTO `common_uploadfile` VALUES (2, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/8aa8b96e20724ad315ffeb4eaf1f8241.jpg', 0, 0, 0);
INSERT INTO `common_uploadfile` VALUES (3, 'local', '1528817466_5670.jpg', 209660, 'image', '/storage/638d1a0ebe4372394cb15153c997646f.jpg', 0, 0, 0);
INSERT INTO `common_uploadfile` VALUES (4, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/52c6ab5fde6278167f777ffc7eec77c4.png', 0, 0, 0);
INSERT INTO `common_uploadfile` VALUES (5, 'local', 'u=1702635598,903841984&fm=26&gp=0.jpg', 17253, 'image', '/storage/fb9578c84f30a97fd464213f4d796993.jpg', 0, 1607947842, 0);
INSERT INTO `common_uploadfile` VALUES (6, 'local', '__UNI__5750FF3.wgt', 1849529, 'file', '/storage/b8e1dc2f76b795d6ede42525e3513ede.wgt', 0, 1607947996, 0);
INSERT INTO `common_uploadfile` VALUES (7, 'local', '__UNI__5750FF3.wgt', 1849529, 'file', '/storage/5c939a6910f32264879e3b801835a920.wgt', 0, 1607948341, 0);
INSERT INTO `common_uploadfile` VALUES (8, 'local', '__UNI__5750FF3.wgt', 1849529, 'file', '/storage/1a67489b29c54eddc429ff945a2749bd.wgt', 0, 1607948395, 0);
INSERT INTO `common_uploadfile` VALUES (9, 'local', '__UNI__5750FF3.wgt', 1849529, 'file', '/storage/1c80030de6613404ca260f77a7f6d182.wgt', 0, 1607948423, 0);
INSERT INTO `common_uploadfile` VALUES (10, 'local', 'u=1631915055,2225974863&fm=26&gp=0.png', 45840, 'image', '/storage/4cb26688d6e247e77dfbb8c368be019c.png', 0, 1607948782, 0);
INSERT INTO `common_uploadfile` VALUES (11, 'local', '微信截图_20201107110039.png', 129137, 'image', '/storage/0a34ddd5fe60e7a4819a49f6f5f3ccd4.png', 0, 1607948801, 0);
INSERT INTO `common_uploadfile` VALUES (12, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/b8009312f81e57138be4f0fc5e873034.jpg', 0, 1607948856, 0);
INSERT INTO `common_uploadfile` VALUES (13, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/e501c16d5dca4961a8bb7d77500be5e2.jpg', 0, 1607949028, 0);
INSERT INTO `common_uploadfile` VALUES (14, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/83c0386c8a8de33594de25180e6cb03d.gif', 0, 1607949059, 0);
INSERT INTO `common_uploadfile` VALUES (15, 'local', 'u=1194864275,2577414869&fm=26&gp=0.jpg', 20292, 'image', '/storage/99234e32f3fe440181bb1bf1ab76c683.jpg', 0, 1607949096, 0);
INSERT INTO `common_uploadfile` VALUES (16, 'local', '图片2.png', 6021, 'image', '/storage/13d70d0289571ab364d376ff468222ad.png', 0, 1607981050, 0);
INSERT INTO `common_uploadfile` VALUES (17, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/8172ffc3d998bff7647bd2fb05c464af.jpg', 0, 1607983538, 0);
INSERT INTO `common_uploadfile` VALUES (18, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/2f30abd9976c7e50f9878a755ae7acc7.jpg', 0, 1607983538, 0);
INSERT INTO `common_uploadfile` VALUES (19, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/fe69b626cc4190f4bc51dcbeb2147b56.jpg', 0, 1607983830, 0);
INSERT INTO `common_uploadfile` VALUES (20, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/3f5f1b6bb7b643bd4c74ced3ceb33a76.jpg', 0, 1607983830, 0);
INSERT INTO `common_uploadfile` VALUES (21, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/3255fe9cb366f8ca9d78e170123c18d3.jpg', 0, 1607983849, 0);
INSERT INTO `common_uploadfile` VALUES (22, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/6f57c33d3eb842c2941c2f0310b0daa1.gif', 0, 1607983849, 0);
INSERT INTO `common_uploadfile` VALUES (23, 'local', '20181218092471_OhNJXA.gif', 51986, 'image', '/storage/3e74bdc0fa15786706dc62515cd9d619.gif', 0, 1607983849, 0);
INSERT INTO `common_uploadfile` VALUES (24, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/83eea08ad9e4a86e6ae159538861183d.jpg', 0, 1607985588, 0);
INSERT INTO `common_uploadfile` VALUES (25, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/070f2f871a33f5bfc359f8b55a12a57e.jpg', 0, 1607985588, 0);
INSERT INTO `common_uploadfile` VALUES (26, 'local', '微信截图_20201107110039.png', 129137, 'image', '/storage/a162f117632d2b6c1252a1d8ef2820c6.png', 0, 1607985588, 0);
INSERT INTO `common_uploadfile` VALUES (27, 'local', '微信截图_20201107110039.png', 129137, 'image', '/storage/70cb998d803d02ccfe8c51adb27548d1.png', 0, 1607985813, 0);
INSERT INTO `common_uploadfile` VALUES (28, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/16528e9db603e2b810706b9685f19c3a.jpg', 0, 1607985813, 0);
INSERT INTO `common_uploadfile` VALUES (29, 'local', '微信截图_20201009074823.png', 372608, 'image', '/storage/20ce992a2bff034653fdc99b020e966d.png', 0, 1607985813, 0);
INSERT INTO `common_uploadfile` VALUES (30, 'local', '微信截图_20201123121454.png', 44908, 'image', '/storage/0e3895534d7f6aa3998e4b6fead9f039.png', 0, 1607985813, 0);
INSERT INTO `common_uploadfile` VALUES (31, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/506218f70fbf4f4390d8d2e54c6d01cf.jpg', 0, 1607985884, 0);
INSERT INTO `common_uploadfile` VALUES (32, 'local', '20181218092471_OhNJXA.gif', 51986, 'image', '/storage/5e9106870b1e9743cb1a9591e09dca09.gif', 0, 1607985884, 0);
INSERT INTO `common_uploadfile` VALUES (33, 'local', '1528817466_5670.jpg', 209660, 'image', '/storage/77a17f42f52aa879dda1698a18fc325a.jpg', 0, 1607985949, 0);
INSERT INTO `common_uploadfile` VALUES (34, 'local', '20160118098075_zbWLFv.gif', 797593, 'image', '/storage/e8b17132768d1590b0f4a633814807e0.gif', 0, 1607985949, 0);
INSERT INTO `common_uploadfile` VALUES (35, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/782b463a16fe5e0f151299a157e63bb9.jpg', 0, 1607986052, 0);
INSERT INTO `common_uploadfile` VALUES (36, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/2db66b8a49f3c4ee783f894039ce1c6b.jpg', 0, 1607986052, 0);
INSERT INTO `common_uploadfile` VALUES (37, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/b3e4252bd60bbcb4345f6b969d78a02a.gif', 0, 1607986057, 0);
INSERT INTO `common_uploadfile` VALUES (38, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/9ef11a96fd1bdc76680199571e4d372d.jpg', 0, 1607986159, 0);
INSERT INTO `common_uploadfile` VALUES (39, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/20aeded00b559f8ca285e9fb3c216195.jpg', 0, 1607986159, 0);
INSERT INTO `common_uploadfile` VALUES (40, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/ec04636e8f9e154d5da81117b6e59dc6.gif', 0, 1607986191, 0);
INSERT INTO `common_uploadfile` VALUES (41, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/35588c291f5638f07e29a56004d983c4.gif', 0, 1607986191, 0);
INSERT INTO `common_uploadfile` VALUES (42, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/d585e818c3cc088be010bc0c7b28ba2c.jpg', 0, 1607987202, 0);
INSERT INTO `common_uploadfile` VALUES (43, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/93e2ff651171eab8e17a41d411981fe7.jpg', 0, 1607987202, 0);
INSERT INTO `common_uploadfile` VALUES (44, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/81f174715cfcb7ee8c240ce336d2ec13.jpg', 0, 1607987228, 0);
INSERT INTO `common_uploadfile` VALUES (45, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/1ad49c8d7486d852e136c0a14bf00171.gif', 0, 1607987283, 0);
INSERT INTO `common_uploadfile` VALUES (46, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/3e4e9eb3514c6e2249aa4a84b6bfd4cd.jpg', 0, 1607987398, 0);
INSERT INTO `common_uploadfile` VALUES (47, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/1560d49436d26f373f4deb2d177a6d87.jpg', 0, 1607987398, 0);
INSERT INTO `common_uploadfile` VALUES (48, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/5b2209e656fe20572e4049bded40ed77.png', 0, 1607987548, 0);
INSERT INTO `common_uploadfile` VALUES (49, 'local', '微信截图_20201107110039.png', 129137, 'image', '/storage/8a2db3e744301b2461c1d07535ff6b2b.png', 0, 1607987548, 0);
INSERT INTO `common_uploadfile` VALUES (50, 'local', '微信截图_20201123121454.png', 44908, 'image', '/storage/3afc3c7f958f40910aabcfec915c79ca.png', 0, 1607987548, 0);
INSERT INTO `common_uploadfile` VALUES (51, 'local', '微信截图_20201009074823.png', 372608, 'image', '/storage/6455a41aa3a3a6878796c39d938c2006.png', 0, 1607987548, 0);
INSERT INTO `common_uploadfile` VALUES (52, 'local', 'u=3980478273,3337613300&fm=26&gp=0.jpg', 23489, 'image', '/storage/a78c944ddccd57d4dfe4248379fdfa1e.jpg', 0, 1607987559, 0);
INSERT INTO `common_uploadfile` VALUES (53, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/7c4f37789f7175719c1762abd734972d.jpg', 0, 1607987645, 0);
INSERT INTO `common_uploadfile` VALUES (54, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/a159261d8801bed309ed4c4a9108170d.png', 0, 1607987681, 0);
INSERT INTO `common_uploadfile` VALUES (55, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/0ff940ad5e1aeb1afa106a90994d78ff.jpg', 0, 1607987688, 0);
INSERT INTO `common_uploadfile` VALUES (56, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/77c4bc51d470666ed797ecb23acb894c.gif', 0, 1607987688, 0);
INSERT INTO `common_uploadfile` VALUES (57, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/4a27e35cec910dcec70799d8fcdfbd09.jpg', 0, 1607987688, 0);
INSERT INTO `common_uploadfile` VALUES (58, 'local', '图片5.png', 9863, 'image', '/storage/c78ac1c71a2174923b426c7e35d3d6ea.png', 0, 1608003831, 0);
INSERT INTO `common_uploadfile` VALUES (59, 'local', '微信图片_20201116110818.png', 7725, 'image', '/storage/0a1351b9fcae358d48c206b9bc4ecfad.png', 0, 1608004125, 0);
INSERT INTO `common_uploadfile` VALUES (60, 'local', '微信图片_20201116110844.png', 7210, 'image', '/storage/5bc8d31da64608b938c5eae7442a38b5.png', 0, 1608004125, 0);
INSERT INTO `common_uploadfile` VALUES (61, 'local', '微信图片_20201201223038.jpg', 27567, 'image', '/storage/c1b68a74d19c58ca6d59ba9e7c08207b.jpg', 0, 1608004125, 0);
INSERT INTO `common_uploadfile` VALUES (62, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/efff1ff451be8679cd4c6b025de6dc96.png', 0, 1608004151, 0);
INSERT INTO `common_uploadfile` VALUES (63, 'local', '微信截图_20201107110039.png', 129137, 'image', '/storage/05964bfc458e49174f8e203512e9759d.png', 0, 1608004165, 0);
INSERT INTO `common_uploadfile` VALUES (64, 'local', '图片1.png', 3951, 'image', '/storage/67cad9d4bc5c46d67bb3bcdc9507453c.png', 0, 1608086957, 0);
INSERT INTO `common_uploadfile` VALUES (65, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/17313554212531eb717a104dcb198ac3.png', 0, 1608088833, 0);
INSERT INTO `common_uploadfile` VALUES (66, 'local', '微信截图_20201123121454.png', 44908, 'image', '/storage/11a9ac7b11f15440a576888e4646e3d6.png', 0, 1608088845, 0);
INSERT INTO `common_uploadfile` VALUES (67, 'local', '图片3.png', 6965, 'image', '/storage/6b2807e32bf1be1670a229fbee9da03c.png', 0, 1608089019, 0);
INSERT INTO `common_uploadfile` VALUES (68, 'local', '微信截图_20201123121454.png', 44908, 'image', '/storage/c1cb7208513d2e4a99009468db78beda.png', 0, 1608089086, 0);
INSERT INTO `common_uploadfile` VALUES (69, 'local', '微信截图_20201123121454.png', 44908, 'image', '/storage/17a8efd32214828a1d9f56ed01d1d642.png', 0, 1608089272, 0);
INSERT INTO `common_uploadfile` VALUES (70, 'local', '微信截图_20201009074823.png', 372608, 'image', '/storage/dcd5c23cedb63764c26bdb77adb4be94.png', 0, 1608096964, 0);
INSERT INTO `common_uploadfile` VALUES (71, 'local', 'u=1702635598,903841984&fm=26&gp=0.jpg', 17253, 'image', '/storage/8875a0a87042014cc6d91d5db1bd7d59.jpg', 0, 1608098261, 0);
INSERT INTO `common_uploadfile` VALUES (72, 'local', '图片6.png', 2519, 'image', '/storage/48a5a407343efb60cbdc1a9763e0ddf3.png', 0, 1608098372, 0);
INSERT INTO `common_uploadfile` VALUES (73, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/e269ab472fed4de92dd1740f9b1dc105.jpg', 0, 1608475554, 0);
INSERT INTO `common_uploadfile` VALUES (74, 'local', '微信截图_20200717144057.png', 209543, 'image', '/storage/5d6adf2861809de6a2d1b530b8954f71.png', 0, 1608475598, 0);
INSERT INTO `common_uploadfile` VALUES (75, 'local', 'QQ图片20200727182645.jpg', 218713, 'image', '/storage/6fccc645195bc00b314bd0a631875d5a.jpg', 0, 1608476141, 0);
INSERT INTO `common_uploadfile` VALUES (76, 'local', '1080.png', 245032, 'image', '/storage/cc53f9f2b0545756f3883945f44801e7.png', 0, 1608603185, 0);
INSERT INTO `common_uploadfile` VALUES (77, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/6be62ecc0295411d62860f4ebdbcdebd.jpg', 0, 1608603232, 0);
INSERT INTO `common_uploadfile` VALUES (78, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/ce6fac0b1dbb621a6fe860306a82b463.jpg', 0, 1608603408, 0);
INSERT INTO `common_uploadfile` VALUES (79, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/821787b8697ebdbf834ed3758dd45c9e.jpg', 0, 1608603459, 0);
INSERT INTO `common_uploadfile` VALUES (80, 'local', '1608603649065_wx_camera_1608548116239.jpg', 93875, 'image', '/storage/b0d665975fb65c7147e9b8ad96ca481e.jpg', 0, 1608603648, 0);
INSERT INTO `common_uploadfile` VALUES (81, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/29ea9cf04f556099c36ba7aaf1928e88.jpg', 0, 1608729594, 0);
INSERT INTO `common_uploadfile` VALUES (82, 'local', 'u=1194864275,2577414869&fm=26&gp=0.jpg', 20292, 'image', '/storage/c6c6533eaaf18f4651211827bdcb81b5.jpg', 0, 1608730173, 0);
INSERT INTO `common_uploadfile` VALUES (83, 'local', 'u=2001382863,1289112909&fm=26&gp=0.jpg', 19083, 'image', '/storage/53b3d9b79f075c3ae3dfd88f7996042b.jpg', 0, 1608730299, 0);
INSERT INTO `common_uploadfile` VALUES (84, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/1f80fc2c86c1313396fe9e6814425be3.jpg', 0, 1608787773, 0);
INSERT INTO `common_uploadfile` VALUES (85, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/1d687f053d8e72a4e239aee13af0797e.png', 0, 1608848561, 0);
INSERT INTO `common_uploadfile` VALUES (86, 'local', '图片1.png', 3951, 'image', '/storage/d17e267465fe28a0d8d9430e609d0683.png', 0, 1608868830, 0);
INSERT INTO `common_uploadfile` VALUES (87, 'local', '微信截图_20200717144057.png', 209543, 'image', '/storage/963b6620578d84d1719714ac6f8e557a.png', 0, 1608882511, 0);
INSERT INTO `common_uploadfile` VALUES (88, 'local', 'u=2328087454,401762545&fm=26&gp=0.jpg', 42527, 'image', '/storage/d73d2f80fefba381933d8a8671f33654.jpg', 0, 1608882511, 0);
INSERT INTO `common_uploadfile` VALUES (89, 'local', '微信截图_20200717144057.png', 209543, 'image', '/storage/f4931f035d9004273eb89c4a439939c0.png', 0, 1608889007, 0);
INSERT INTO `common_uploadfile` VALUES (90, 'local', 'u=2328087454,401762545&fm=26&gp=0.jpg', 42527, 'image', '/storage/80b0a19f6321bc1a7bb2386ab28a6b9c.jpg', 0, 1608889230, 0);
INSERT INTO `common_uploadfile` VALUES (91, 'local', 'QQ图片20200727182645.jpg', 218713, 'image', '/storage/8e4e21840278719a0ae2d3e8fc096674.jpg', 0, 1608889243, 0);
INSERT INTO `common_uploadfile` VALUES (92, 'local', 'u=2001382863,1289112909&fm=26&gp=0.jpg', 19083, 'image', '/storage/a6537b9a5e0b1d22af1557836a4bb1d4.jpg', 0, 1608891898, 0);
INSERT INTO `common_uploadfile` VALUES (93, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/ee8ad37dbf14d22ca0ca13564ba9eb2e.jpg', 0, 1608929161, 0);
INSERT INTO `common_uploadfile` VALUES (94, 'local', '__UNI__E133A89.wgt', 1079594, 'file', '/storage/6e07b9bc778481cac5b15435f9d23e16.wgt', 0, 1609121355, 0);
INSERT INTO `common_uploadfile` VALUES (95, 'local', '微信截图_20201228111324.png', 203182, 'image', '/storage/a481ca183c538238ee37deb26940b064.png', 0, 1609125260, 0);
INSERT INTO `common_uploadfile` VALUES (96, 'local', '微信截图_20201228111338.png', 764465, 'image', '/storage/5dc6850a856ad1215253d820714c8bc8.png', 0, 1609125265, 0);
INSERT INTO `common_uploadfile` VALUES (97, 'local', '微信截图_20201228111354.png', 847700, 'image', '/storage/6d7f1274bc2b767ed53322e351047e4b.png', 0, 1609125265, 0);
INSERT INTO `common_uploadfile` VALUES (98, 'local', '微信截图_20201228111354.png', 847700, 'image', '/storage/68bdb18cbdcd69fb2e97b106b93f8683.png', 0, 1609125273, 0);
INSERT INTO `common_uploadfile` VALUES (99, 'local', '微信截图_20201228111541.png', 276786, 'image', '/storage/41aefde6184a8e19d767a87967840ba0.png', 0, 1609125382, 0);
INSERT INTO `common_uploadfile` VALUES (100, 'local', '微信截图_20201228111531.png', 424374, 'image', '/storage/da65f64c7fbde38fd2e15b47eb203608.png', 0, 1609125388, 0);
INSERT INTO `common_uploadfile` VALUES (101, 'local', '微信截图_20201228111531.png', 424374, 'image', '/storage/4656a22af4809b7c23c7aab92b4b630b.png', 0, 1609125397, 0);
INSERT INTO `common_uploadfile` VALUES (102, 'local', '微信截图_20201228112518.png', 243320, 'image', '/storage/acd4782aedd7c18ce4da44385ab2d0ae.png', 0, 1609125950, 0);
INSERT INTO `common_uploadfile` VALUES (103, 'local', '微信截图_20201228112507.png', 742760, 'image', '/storage/ef1ffc28386e8ccd21e821a1cceb2ce6.png', 0, 1609125964, 0);
INSERT INTO `common_uploadfile` VALUES (104, 'local', '微信截图_20201228112658.png', 855688, 'image', '/storage/900746ed2667b62e22ff253085580b71.png', 0, 1609126038, 0);
INSERT INTO `common_uploadfile` VALUES (105, 'local', '微信截图_20201228112946.png', 329089, 'image', '/storage/32c902a5d4fbe5d3632b816a1631c417.png', 0, 1609126213, 0);
INSERT INTO `common_uploadfile` VALUES (106, 'local', '微信截图_20201228113112.png', 1618627, 'image', '/storage/768a29e91069bb7dfe0e50be120f261d.png', 0, 1609126293, 0);
INSERT INTO `common_uploadfile` VALUES (107, 'local', '微信截图_20201228113120.png', 1003939, 'image', '/storage/469975be3885c376d64143ecae4dfdba.png', 0, 1609126304, 0);
INSERT INTO `common_uploadfile` VALUES (108, 'local', '微信截图_20201228113317.png', 291545, 'image', '/storage/17c27bd705d77e5232aeb45102a8c2e7.png', 0, 1609205518, 0);
INSERT INTO `common_uploadfile` VALUES (109, 'local', '微信图片_20201227180536.png', 18251, 'image', '/storage/d6d87469b786a371b44714bbdf551636.png', 0, 1609260443, 0);
INSERT INTO `common_uploadfile` VALUES (110, 'local', '微信图片_20201226111413.png', 67904, 'image', '/storage/a66765511f00f499c128d60ddb5cece8.png', 0, 1609260456, 0);
INSERT INTO `common_uploadfile` VALUES (111, 'local', '微信截图_20201009074823.png', 372608, 'image', '/storage/98d392722f7fd9b0d0111b1b6933d390.png', 0, 1609329765, 0);
INSERT INTO `common_uploadfile` VALUES (112, 'local', '微信截图_20200717144057.png', 209543, 'image', '/storage/84eebd320ef9eefad16c11dbe239eaaa.png', 0, 1609335927, 0);
INSERT INTO `common_uploadfile` VALUES (113, 'local', '微信图片_20201227180536.png', 18251, 'image', '/storage/1f555afbac9bec2c31df469e4a70486c.png', 0, 1609381692, 0);
INSERT INTO `common_uploadfile` VALUES (114, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/571ab3eb8fdba9b65de04630e0a39c8e.jpg', 0, 1610260155, 0);
INSERT INTO `common_uploadfile` VALUES (115, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/8cfb96eca6b462571771fddffd687fb0.jpg', 0, 1610260166, 0);
INSERT INTO `common_uploadfile` VALUES (116, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/18f4b9ae62db441808c24805e77e62af.jpg', 0, 1610280695, 0);
INSERT INTO `common_uploadfile` VALUES (117, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/f7d85f8e7e78076a37facf2107c5d250.gif', 0, 1610280794, 0);
INSERT INTO `common_uploadfile` VALUES (118, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/90d2196bfcc2e8c814cbd6a990d1199b.gif', 0, 1610280815, 0);
INSERT INTO `common_uploadfile` VALUES (119, 'local', 'QQ图片20200727182645.jpg', 218713, 'image', '/storage/712084d91db50c4bf716a9164ebe2d49.jpg', 0, 1610280905, 0);
INSERT INTO `common_uploadfile` VALUES (120, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/72b9b35b0d49a64a705deccf96b52243.jpg', 0, 1610280938, 0);
INSERT INTO `common_uploadfile` VALUES (121, 'local', '微信截图_20200717144057.png', 209543, 'image', '/storage/f9e44da995cdb9948d67b508d41165c8.png', 0, 1610280975, 0);
INSERT INTO `common_uploadfile` VALUES (122, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/52f64cdb8c3de84ea58bfbabaf10aee3.jpg', 0, 1610703280, 0);
INSERT INTO `common_uploadfile` VALUES (123, 'local', '微信截图_20201009074823.png', 372608, 'image', '/storage/324cebfedb3a94fd86d077c9ed44e4ca.png', 0, 1610703350, 0);
INSERT INTO `common_uploadfile` VALUES (124, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/c42685c2ea09713965baf55008da263e.png', 0, 1610703440, 0);
INSERT INTO `common_uploadfile` VALUES (125, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/5893cc2f1b725988bd2f5b61618f2897.jpg', 0, 1610703629, 0);
INSERT INTO `common_uploadfile` VALUES (126, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/327386027feb5c98bc9ab04223924ddd.gif', 0, 1610703684, 0);
INSERT INTO `common_uploadfile` VALUES (127, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/b568c22396337984b75239f098f63afa.jpg', 0, 1610703753, 0);
INSERT INTO `common_uploadfile` VALUES (128, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/53030f435fbe1d8594acaa444773fa8f.png', 0, 1610703776, 0);
INSERT INTO `common_uploadfile` VALUES (129, 'local', 'u=3241659229,3202296598&fm=26&gp=0.jpg', 23712, 'image', '/storage/c5ef97b6b342512da0c71a44e6f9161e.jpg', 0, 1610703793, 0);
INSERT INTO `common_uploadfile` VALUES (130, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/510516189ef7ad1ac69ca16128fac522.jpg', 0, 1610703893, 0);
INSERT INTO `common_uploadfile` VALUES (131, 'local', '20181218092471_OhNJXA.gif', 51986, 'image', '/storage/56eefdbe9366b87b1849a0bf30d97ce2.gif', 0, 1610703949, 0);
INSERT INTO `common_uploadfile` VALUES (132, 'local', '1528817466_5670.jpg', 209660, 'image', '/storage/d25558f63599abd284edae8a83b054ff.jpg', 0, 1610704186, 0);
INSERT INTO `common_uploadfile` VALUES (133, 'local', '1528817466_5670.jpg', 209660, 'image', '/storage/977cd92f3af9e06e7898b9c3dc7bf574.jpg', 0, 1610704218, 0);
INSERT INTO `common_uploadfile` VALUES (134, 'local', 'u=2001382863,1289112909&fm=26&gp=0.jpg', 19083, 'image', '/storage/4a1a1a1b19740691163650795f6a4ce9.jpg', 0, 1610704334, 0);
INSERT INTO `common_uploadfile` VALUES (135, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/a148a25b49c4c956ebb9be14904731f2.png', 0, 1610704369, 0);
INSERT INTO `common_uploadfile` VALUES (136, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/1d9d0a724e6639f73339ee7f38aaf113.png', 0, 1610704598, 0);
INSERT INTO `common_uploadfile` VALUES (137, 'local', '1528817466_5670.jpg', 209660, 'image', '/storage/a40df12c49115a959de7985a58503747.jpg', 0, 1610704643, 0);
INSERT INTO `common_uploadfile` VALUES (138, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/78884a54763360421ce60a3a57a88c92.jpg', 0, 1610704668, 0);
INSERT INTO `common_uploadfile` VALUES (139, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/f23e0e80d87e3ae90538edece7d64cbc.jpg', 0, 1610704742, 0);
INSERT INTO `common_uploadfile` VALUES (140, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/8179116d773a756b5533bdd1f3782e47.jpg', 0, 1610704889, 0);
INSERT INTO `common_uploadfile` VALUES (141, 'local', '1528817466_5670.jpg', 209660, 'image', '/storage/bff6dd3d0ec27f2bf1f6356bceab43ea.jpg', 0, 1610704928, 0);
INSERT INTO `common_uploadfile` VALUES (142, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/a73458477909c89e59bebc50bbb40d96.jpg', 0, 1610704985, 0);
INSERT INTO `common_uploadfile` VALUES (143, 'local', '20190117725373_VzLaei.gif', 13115, 'image', '/storage/a5f280c620cc85d4bbe4d1efdcd9c32a.gif', 0, 1610705241, 0);
INSERT INTO `common_uploadfile` VALUES (144, 'local', 'u=3241659229,3202296598&fm=26&gp=0.jpg', 23712, 'image', '/storage/c846ac99c8287ff9da451623df5e2867.jpg', 0, 1610705274, 0);
INSERT INTO `common_uploadfile` VALUES (145, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/8d3e91c59841dbe31e60061a19135bb4.jpg', 0, 1610705638, 0);
INSERT INTO `common_uploadfile` VALUES (146, 'local', '1528817466_5670.jpg', 209660, 'image', '/storage/9c7ab9ca885eabcf5cf4e93071575d5d.jpg', 0, 1610706106, 0);
INSERT INTO `common_uploadfile` VALUES (147, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/458310d4bc56e5a523845b94654645ae.jpg', 0, 1610706124, 0);
INSERT INTO `common_uploadfile` VALUES (148, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/17bbe2214d4224224775ace94e924de2.gif', 0, 1610706237, 0);
INSERT INTO `common_uploadfile` VALUES (149, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/a8edef3ffbbf3e437799af8973cac054.gif', 0, 1610706266, 0);
INSERT INTO `common_uploadfile` VALUES (150, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/9bd4150e1be6a7c94ab4c991dec5af52.png', 0, 1610706899, 0);
INSERT INTO `common_uploadfile` VALUES (151, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/d14c8dc0356102b1dee3ebea74b758e5.jpg', 0, 1610707600, 0);
INSERT INTO `common_uploadfile` VALUES (152, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/ed6c6b2b0aaa3c07a0bd1e8cb389d265.png', 0, 1610708966, 0);
INSERT INTO `common_uploadfile` VALUES (153, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/3f233703fc2d074355391ce14b361271.jpg', 0, 1610709683, 0);
INSERT INTO `common_uploadfile` VALUES (154, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/d366ab898a187872d9dc8f27f7068799.jpg', 0, 1610709788, 0);
INSERT INTO `common_uploadfile` VALUES (155, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/efca9b130815587810a2cb8bfc8dee2e.jpg', 0, 1610709969, 0);
INSERT INTO `common_uploadfile` VALUES (156, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/97275f6580fa0ca7458d69136bb2c31c.jpg', 0, 1610710248, 0);
INSERT INTO `common_uploadfile` VALUES (157, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/0f734a04a0e2616fed4179ae21a57ea0.jpg', 0, 1610710317, 0);
INSERT INTO `common_uploadfile` VALUES (158, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/89121ce329f0bb92314147a1398f6d0b.jpg', 0, 1610710523, 0);
INSERT INTO `common_uploadfile` VALUES (159, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/b13bfe20ebff99564ecddf729ed35b97.jpg', 0, 1610710622, 0);
INSERT INTO `common_uploadfile` VALUES (160, 'local', 'u=3241659229,3202296598&fm=26&gp=0.jpg', 23712, 'image', '/storage/7c522bdcdb97c80427946cea7469751c.jpg', 0, 1610710797, 0);
INSERT INTO `common_uploadfile` VALUES (161, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/34e4695d928673bc4e0badf78a6719f3.jpg', 0, 1610710870, 0);
INSERT INTO `common_uploadfile` VALUES (162, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/04852b2f90e79750be20ec21456ff8c2.gif', 0, 1610711382, 0);
INSERT INTO `common_uploadfile` VALUES (163, 'local', '95124ec83f481ea79fd2b54553f4afc5.gif', 608431, 'image', '/storage/134169ce73af377fb0f7b567544245b7.gif', 0, 1610711405, 0);
INSERT INTO `common_uploadfile` VALUES (164, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/119edb0b2525ea46149069845d4770bb.jpg', 0, 1610712035, 0);
INSERT INTO `common_uploadfile` VALUES (165, 'local', '20160118098075_zbWLFv.gif', 797593, 'image', '/storage/9571a65b2d59816508e9c70cb2d9fadb.gif', 0, 1610712153, 0);
INSERT INTO `common_uploadfile` VALUES (166, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/cd8d2898d3bd784490eee820b03c4fd2.jpg', 0, 1610713259, 0);
INSERT INTO `common_uploadfile` VALUES (167, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/227a3909bb5b2d5a160b30a55cc848c8.jpg', 0, 1610713281, 0);
INSERT INTO `common_uploadfile` VALUES (168, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/15f4f870a54cecfa9555e32e5f750a6a.jpg', 0, 1610713467, 0);
INSERT INTO `common_uploadfile` VALUES (169, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/c2d3d51d56f6ed32edc9e84a6bc73139.jpg', 0, 1610713492, 0);
INSERT INTO `common_uploadfile` VALUES (170, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/538907c9197c1d27682e45917976cf1c.jpg', 0, 1610713554, 0);
INSERT INTO `common_uploadfile` VALUES (171, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/209f5a89cd97b01be65dfd6d361cf440.jpg', 0, 1610713893, 0);
INSERT INTO `common_uploadfile` VALUES (172, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/89bf3e8e41fff89ba2ed37619d3f3622.jpg', 0, 1610713993, 0);
INSERT INTO `common_uploadfile` VALUES (173, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/9af595c01bd9c30a8b49950d52ba1f14.jpg', 0, 1610714045, 0);
INSERT INTO `common_uploadfile` VALUES (174, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/0aac9a032bc74a43d64a24130df4f583.jpg', 0, 1610714176, 0);
INSERT INTO `common_uploadfile` VALUES (175, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/c5a4c8f548966246ba4db5a524946792.jpg', 0, 1610714414, 0);
INSERT INTO `common_uploadfile` VALUES (176, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/c5dc06558ebe1a147b51c8ec50ddf866.jpg', 0, 1610714755, 0);
INSERT INTO `common_uploadfile` VALUES (177, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/c979daec1661fb8d8bef6ce65fe63f5c.jpg', 0, 1610714916, 0);
INSERT INTO `common_uploadfile` VALUES (178, 'local', 'AHkIABAEGAAglL-N5AUoyLGSjAEwrAI4rAI.png', 8298, 'image', '/storage/a3495442e13e4b6261fc992b862b449c.png', 0, 1610715197, 0);
INSERT INTO `common_uploadfile` VALUES (179, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/0611cd4d660fabf5014c9d5797cd4faf.jpg', 0, 1610715261, 0);
INSERT INTO `common_uploadfile` VALUES (180, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/948eaf6edce116a74544bf5b3ab13cf2.jpg', 0, 1610715289, 0);
INSERT INTO `common_uploadfile` VALUES (181, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/3c9a4cd3a060ebb15ff9b1b95c3f2702.jpg', 0, 1610715461, 0);
INSERT INTO `common_uploadfile` VALUES (182, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/storage/649718c23a68e1e1677524fa75b4f689.jpg', 0, 1610715541, 0);
INSERT INTO `common_uploadfile` VALUES (183, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/storage/d8fa2e4c32ae5d1c6b70cc780b8f537c.jpg', 0, 1610715666, 0);
INSERT INTO `common_uploadfile` VALUES (184, 'local', '20161010070989_OTysRj.jpg', 22550, 'image', '/common/87826f35be9f172353683683f918d621.jpg', 0, 1610716765, 0);
INSERT INTO `common_uploadfile` VALUES (185, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/7c42ba1208418daf74d66392f4eb9f74.jpg', 0, 1610716866, 0);
INSERT INTO `common_uploadfile` VALUES (186, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/6b1cfb89fb130e74189b053bf69157f7.jpg', 0, 1610716992, 0);
INSERT INTO `common_uploadfile` VALUES (187, 'local', '20161117345008_yTjIRd.jpg', 24684, 'image', '/common/b5509c8dbdae3d9070753128d9dcde95.jpg', 0, 1610717023, 0);

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
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `pwd` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加密串',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '性别【0：未知，1：男，2：女】',
  `grade` tinyint NULL DEFAULT 0 COMMENT '等级【0：非会员，1：会员，2：代理商，3：运营商】',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态【1：正常，-1：禁用】',
  `created_at` int UNSIGNED NOT NULL,
  `updated_at` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `grade`(`grade`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, 0, 'asfas', '2342342', NULL, '188899999', 'nnnn', 1, 2, NULL, 1, 0, NULL);
INSERT INTO `member` VALUES (2, 0, '15566555555', '6acb0405d85bc94e0b3d8e8abf6e2785', 'sXKMCt', '15566555555', NULL, 0, 0, NULL, 1, 1608456108, NULL);
INSERT INTO `member` VALUES (3, 0, '13888888888', '92d96c8010f821673530d07c37418c4a', 'g1DGlp', '13888888888', NULL, 0, 0, NULL, 1, 1608495360, NULL);
INSERT INTO `member` VALUES (4, 0, '13890000099', '479eb0210372f48eb27890936e15bc36', 'mAgMV9', '13890000099', NULL, 0, 3, NULL, 1, 1608495551, NULL);
INSERT INTO `member` VALUES (5, 4, '18888888888', 'c4f0e77f59372ee8eb8b7743b064e626', 'gcME2b', '18888888888', NULL, 0, 2, NULL, 1, 1608535998, NULL);
INSERT INTO `member` VALUES (6, 4, '17777777777', 'df571c226f4379499f939cddcf870b06', 'X07Oi8', '17777777777', '一個画画的baby2', 2, 2, 'http://192.168.0.168:9501/storage/a66765511f00f499c128d60ddb5cece8.png', 1, 1608538945, 1609408719);
INSERT INTO `member` VALUES (7, 6, '17777777771', '8c887354a7d45ad9ba6c66ac638e2b8c', 'XT7FCc', '17777777771', NULL, 1, 1, NULL, 1, 1608539026, NULL);
INSERT INTO `member` VALUES (8, 6, '17777777772', 'c0c923b8bb0918a8bbb3e7b825b0ef64', '4BUYA1', '17777777772', NULL, 0, 1, NULL, 1, 1608539069, NULL);
INSERT INTO `member` VALUES (9, 6, '17777777773', 'cb5febbc9301493fb91cf745174cc1e5', 'CsYVc5', '17777777773', NULL, 0, 2, NULL, 1, 1608539160, NULL);
INSERT INTO `member` VALUES (10, 6, '19999999999', 'b153cf222992d9df72f8a99dca32db6b', 'aDyTUx', '19999999999', '奥尼尔', 2, 2, 'http://192.168.0.168:9501//storage/b0d665975fb65c7147e9b8ad96ca481e.jpg', 1, 1608603604, 1609409403);
INSERT INTO `member` VALUES (11, 0, '15555555555', 'e8e053014f9635d95542b6ea40272112', 'OZhzgM', '15555555555', '', 2, 0, 'http://192.168.0.168:9501//storage/d17e267465fe28a0d8d9430e609d0683.png', 1, 1608860677, NULL);
INSERT INTO `member` VALUES (12, 6, '16788965258', 'c9b4770de14c11117d8698e70cbe0a15', 'AbQvIl', '16788965258', NULL, 0, 0, NULL, 1, 1608869452, NULL);
INSERT INTO `member` VALUES (13, 6, '13688978888', '7301acb05bb49b208cdb8db81ed8da04', '69oWdP', '13688978888', NULL, 0, 0, NULL, 1, 1608869757, NULL);
INSERT INTO `member` VALUES (14, 6, '18888888008', 'e60e430ff5f7eb65d4921b4aa0c722eb', 'zcv5wL', '18888888008', NULL, 0, 0, NULL, 1, 1608869926, NULL);
INSERT INTO `member` VALUES (15, 6, '18888888881', '70a1bcb9383c0c75dc7f7c4dec54e3e0', 'Xs3jeR', '18888888881', NULL, 0, 0, NULL, 1, 1608870894, NULL);
INSERT INTO `member` VALUES (16, 6, '18888888882', 'e32d00a73c913e18dceba8c3489f6108', 'pzOsJj', '18888888882', NULL, 0, 0, NULL, 1, 1608870957, NULL);
INSERT INTO `member` VALUES (17, 6, '18888888883', '6165b4845b1d02bdf5056183a7b928a7', '1pIOz9', '18888888883', NULL, 0, 0, NULL, 1, 1608870987, NULL);
INSERT INTO `member` VALUES (18, 6, '15555555551', '9777dace115652fff0fd36fb4405b48e', 'MMZqRp', '15555555551', NULL, 0, 0, NULL, 1, 1608871057, NULL);
INSERT INTO `member` VALUES (19, 6, '15555555554', 'fae991268f1bdda17b4eb69deaa1699f', 'gPFsYd', '15555555554', NULL, 0, 0, NULL, 1, 1608871084, NULL);
INSERT INTO `member` VALUES (20, 6, '18989898988', '9cb49ee8f7df887fe5d954fb7f90385c', '2sbxMi', '18989898988', NULL, 0, 0, NULL, 1, 1608871714, NULL);
INSERT INTO `member` VALUES (21, 6, '17777777774', 'e500dfb41117782d0d8d274e811bd9b9', 'dT9Erh', '17777777774', NULL, 0, 1, NULL, 1, 1609279475, 1609280175);
INSERT INTO `member` VALUES (22, 6, '16666666666', 'a5b793e33dd3c4481f8d75c4a6293dd1', 'wntPsW', '16666666666', NULL, 0, 1, NULL, 1, 1609280922, 1609280985);
INSERT INTO `member` VALUES (23, 0, '18888888886', 'e07e954e3b35454a6aa78261ef888cf2', 'FK7Ttq', '18888888886', '安抚', 0, 2, 'http://192.168.0.168:9501/storage/1f555afbac9bec2c31df469e4a70486c.png', 1, 1609338953, 1609381875);
INSERT INTO `member` VALUES (25, 0, '19999999991', '635cb056778b07c9a22a0d0254c4db05', '7plhMi', '19999999991', NULL, 0, 0, NULL, 1, 1609689115, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户资产表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_asset
-- ----------------------------
INSERT INTO `member_asset` VALUES (1, 6, 0.00, 5364.00, 0.00, 203.10, 1608538945, 1609409403);
INSERT INTO `member_asset` VALUES (2, 5, 0.00, 0.00, 0.00, 481.60, 1608539026, 1609279332);
INSERT INTO `member_asset` VALUES (3, 4, 0.00, 0.00, 0.00, 1414.20, 1608539069, 1609409403);
INSERT INTO `member_asset` VALUES (4, 9, 0.00, 0.00, 0.00, 0.00, 1608539160, 0);
INSERT INTO `member_asset` VALUES (5, 10, 0.00, 1838.00, 0.00, 0.00, 1608603604, 0);
INSERT INTO `member_asset` VALUES (6, 11, 0.00, 0.00, 0.00, 0.00, 1608860677, 0);
INSERT INTO `member_asset` VALUES (7, 12, 0.00, 0.00, 0.00, 0.00, 1608869452, 0);
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
  `state` tinyint(1) NULL DEFAULT 0 COMMENT '状态（0：未认证，1：认证通过，-1：认证失败）',
  `thirty_data` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '第三方认证数据',
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户实名认证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_realnameauth
-- ----------------------------
INSERT INTO `member_realnameauth` VALUES (1, 25, 'safsad', 1, 'safx12313123', 0, '', 1599999999, 0);

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
INSERT INTO `swiper_slider` VALUES (4, 0, 'ddd', 5, 'http://192.168.0.168:9501/storage/768a29e91069bb7dfe0e50be120f261d.png', NULL, 0, 1609126294, 0);
INSERT INTO `swiper_slider` VALUES (5, 0, 'dddasdfsaf', 0, 'http://192.168.0.168:9501/storage/469975be3885c376d64143ecae4dfdba.png', '0', 0, 1609126305, 0);
INSERT INTO `swiper_slider` VALUES (6, 0, 'sdafsadf6666', NULL, 'http://192.168.0.168:9501/storage/84eebd320ef9eefad16c11dbe239eaaa.png', NULL, 0, 1609335928, 1610280788);
INSERT INTO `swiper_slider` VALUES (7, 0, 'asfasdf', 0, 'http://192.168.0.168:9501/storage/f9e44da995cdb9948d67b508d41165c8.png', NULL, 0, 1610280976, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投诉建议表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ue_suggest
-- ----------------------------
INSERT INTO `ue_suggest` VALUES (7, 0, '按时发斯蒂芬', 'UI无法直视，丑哭了', 3, '232323', 1609150036);
INSERT INTO `ue_suggest` VALUES (8, 0, '阿斯顿发斯蒂芬', '阿斯顿发送到发送到', 3, '23423423', 1609150084);
INSERT INTO `ue_suggest` VALUES (9, 0, '撒打发斯蒂芬', '阿斯顿发斯蒂芬', 0, '', 1609150311);

SET FOREIGN_KEY_CHECKS = 1;
