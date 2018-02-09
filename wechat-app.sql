/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : wechat-app

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-02-09 23:20:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_access`;
CREATE TABLE `tp_admin_access` (
  `role_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `node_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_access
-- ----------------------------

-- ----------------------------
-- Table structure for tp_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_group`;
CREATE TABLE `tp_admin_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'icon小图标',
  `sort` int(11) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_group
-- ----------------------------
INSERT INTO `tp_admin_group` VALUES ('1', '系统管理', '&#xe61d;', '2', '1', '', '0', '1450752856', '1481180175');
INSERT INTO `tp_admin_group` VALUES ('2', '工具', '&#xe616;', '3', '1', '', '0', '1476016712', '1481180175');
INSERT INTO `tp_admin_group` VALUES ('3', '轮播图管理', '&amp;#xe646;', '50', '1', '', '0', '1516891777', '1516891934');
INSERT INTO `tp_admin_group` VALUES ('4', '产品管理', '&amp;#xe620;', '50', '1', '', '0', '1516891786', '1516891894');
INSERT INTO `tp_admin_group` VALUES ('5', '订单管理', '&amp;#xe627;', '50', '1', '', '0', '1516891796', '1516891872');
INSERT INTO `tp_admin_group` VALUES ('6', '用户管理', '&amp;#xe611;', '50', '1', '', '0', '1516891803', '1516891847');
INSERT INTO `tp_admin_group` VALUES ('7', '配置管理', '&amp;#xe692;', '50', '1', '', '0', '1516892420', '1516892420');
INSERT INTO `tp_admin_group` VALUES ('8', '数据统计', '&amp;#xe61c;', '50', '1', '', '0', '1517038847', '1517038847');

-- ----------------------------
-- Table structure for tp_admin_node
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node`;
CREATE TABLE `tp_admin_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '节点类型，1-控制器 | 0-方法',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `isdelete` (`isdelete`),
  KEY `sort` (`sort`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_node
-- ----------------------------
INSERT INTO `tp_admin_node` VALUES ('1', '0', '1', 'Admin', '后台管理', '后台管理，不可更改', '1', '1', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('2', '1', '1', 'AdminGroup', '分组管理', ' ', '2', '1', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('3', '1', '1', 'AdminNode', '节点管理', ' ', '2', '1', '2', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('4', '1', '1', 'AdminRole', '角色管理', ' ', '2', '1', '3', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('5', '1', '1', 'AdminUser', '用户管理', '', '2', '1', '4', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('6', '1', '0', 'Index', '首页', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('7', '6', '0', 'welcome', '欢迎页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('8', '6', '0', 'index', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('9', '1', '2', 'Generate', '代码自动生成', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('10', '1', '2', 'Demo/excel', 'Excel一键导出', '', '2', '0', '2', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('11', '1', '2', 'Demo/download', '下载', '', '2', '0', '3', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('12', '1', '2', 'Demo/downloadImage', '远程图片下载', '', '2', '0', '4', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('13', '1', '2', 'Demo/mail', '邮件发送', '', '2', '0', '5', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('14', '1', '2', 'Demo/qiniu', '七牛上传', '', '2', '0', '6', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('15', '1', '2', 'Demo/hashids', 'ID加密', '', '2', '0', '7', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('16', '1', '2', 'Demo/layer', '丰富弹层', '', '2', '0', '8', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('17', '1', '2', 'Demo/tableFixed', '表格溢出', '', '2', '0', '9', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('18', '1', '2', 'Demo/ueditor', '百度编辑器', '', '2', '0', '10', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('19', '1', '2', 'Demo/imageUpload', '图片上传', '', '2', '0', '11', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('20', '1', '2', 'Demo/qrcode', '二维码生成', '', '2', '0', '12', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('21', '1', '1', 'NodeMap', '节点图', '', '2', '1', '5', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('22', '1', '1', 'WebLog', '操作日志', '', '2', '1', '6', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('23', '1', '1', 'LoginLog', '登录日志', '', '2', '1', '7', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('59', '1', '2', 'one.two.three.Four/index', '多级节点', '', '2', '0', '50', '0', '0');
INSERT INTO `tp_admin_node` VALUES ('24', '23', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('25', '22', '0', 'index', '列表', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('26', '22', '0', 'detail', '详情', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('27', '21', '0', 'load', '自动导入', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('28', '21', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('29', '5', '0', 'add', '添加', '', '3', '0', '51', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('30', '21', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('31', '21', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('32', '9', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('33', '9', '0', 'generate', '生成方法', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('34', '5', '0', 'password', '修改密码', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('35', '5', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('36', '5', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('37', '5', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('38', '4', '0', 'user', '用户列表', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('39', '4', '0', 'access', '授权', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('40', '4', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('41', '4', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('42', '4', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('43', '4', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('44', '4', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('45', '3', '0', 'load', '节点快速导入测试', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('46', '3', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('47', '3', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('48', '3', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('49', '3', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('50', '3', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('51', '2', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('52', '2', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('53', '2', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('54', '2', '0', 'forbid', '默认禁用操作', '', '3', '0', '51', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('55', '2', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('56', '1', '2', 'one', '一级菜单', '', '2', '1', '0', '0', '0');
INSERT INTO `tp_admin_node` VALUES ('60', '56', '2', 'two', '二级', '', '3', '1', '50', '0', '0');
INSERT INTO `tp_admin_node` VALUES ('61', '60', '2', 'three', '三级菜单', '', '4', '1', '50', '0', '0');
INSERT INTO `tp_admin_node` VALUES ('62', '61', '2', 'Four', '四级菜单', '', '5', '1', '50', '0', '0');
INSERT INTO `tp_admin_node` VALUES ('63', '1', '3', 'Banner', '轮播图', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('64', '1', '4', 'Category', '分类列表', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('65', '1', '4', 'Product', '产品列表', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('66', '1', '4', 'Product/offline', '仓库列表', '', '2', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('67', '1', '5', 'Order', '订单列表', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('68', '1', '5', 'Refund', '退单管理', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('69', '1', '6', 'User', '用户列表', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('70', '1', '8', 'Statistics', '统计趋势', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('71', '1', '1', 'CompanyAccount', '系统账户', '', '2', '1', '50', '1', '0');

-- ----------------------------
-- Table structure for tp_admin_node_load
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node_load`;
CREATE TABLE `tp_admin_node_load` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='节点快速导入';

-- ----------------------------
-- Records of tp_admin_node_load
-- ----------------------------
INSERT INTO `tp_admin_node_load` VALUES ('4', '编辑', 'edit', '1');
INSERT INTO `tp_admin_node_load` VALUES ('5', '添加', 'add', '1');
INSERT INTO `tp_admin_node_load` VALUES ('6', '首页', 'index', '1');
INSERT INTO `tp_admin_node_load` VALUES ('7', '删除', 'delete', '1');

-- ----------------------------
-- Table structure for tp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role`;
CREATE TABLE `tp_admin_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`),
  KEY `isdelete` (`isdelete`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_role
-- ----------------------------
INSERT INTO `tp_admin_role` VALUES ('1', '0', '领导组', ' ', '1', '0', '1208784792', '1254325558');
INSERT INTO `tp_admin_role` VALUES ('2', '0', '网编组', ' ', '0', '0', '1215496283', '1454049929');

-- ----------------------------
-- Table structure for tp_admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role_user`;
CREATE TABLE `tp_admin_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of tp_admin_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for tp_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_user`;
CREATE TABLE `tp_admin_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(32) NOT NULL DEFAULT '',
  `realname` varchar(255) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` char(15) NOT NULL DEFAULT '',
  `login_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `accountpassword` (`account`,`password`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_user
-- ----------------------------
INSERT INTO `tp_admin_user` VALUES ('1', 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '1517497685', '127.0.0.1', '390', 'tianpian0805@gmail.com', '13121126169', '我是超级管理员', '1', '0', '1222907803', '1451033528');
INSERT INTO `tp_admin_user` VALUES ('2', 'demo', '测试', 'e10adc3949ba59abbe56e057f20f883e', '1481206367', '127.0.0.1', '5', '', '', '', '1', '0', '1476777133', '1477399793');

-- ----------------------------
-- Table structure for tp_banner
-- ----------------------------
DROP TABLE IF EXISTS `tp_banner`;
CREATE TABLE `tp_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(512) NOT NULL DEFAULT '' COMMENT '图片地址',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联产品',
  `position` tinyint(4) NOT NULL DEFAULT '1' COMMENT '排序',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `i_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of tp_banner
-- ----------------------------

-- ----------------------------
-- Table structure for tp_cart
-- ----------------------------
DROP TABLE IF EXISTS `tp_cart`;
CREATE TABLE `tp_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU ID',
  `num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购买数量',
  `selected` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否选中：是',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  KEY `sku_id` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of tp_cart
-- ----------------------------

-- ----------------------------
-- Table structure for tp_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_category`;
CREATE TABLE `tp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `image` varchar(512) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` varchar(16) NOT NULL DEFAULT '0' COMMENT '分类名称',
  `position` tinyint(4) NOT NULL DEFAULT '1' COMMENT '排序',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of tp_category
-- ----------------------------
INSERT INTO `tp_category` VALUES ('1', '0', '', '热带水果', '1', 'Y', '1517128093', '1517128093');
INSERT INTO `tp_category` VALUES ('2', '1', '', '菠萝', '1', 'Y', '1517128464', '1517128464');

-- ----------------------------
-- Table structure for tp_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) NOT NULL DEFAULT '' COMMENT '配置项',
  `value` varchar(32) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '备注',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of tp_config
-- ----------------------------
INSERT INTO `tp_config` VALUES ('1', 'EXPRESS', 'FREE', '运费：FREE免邮，FIXED固定邮费，', 'Y', '1517499545', '1517499545');
INSERT INTO `tp_config` VALUES ('2', 'EXPRESS_FEE', '12', '固定邮费金额', 'Y', '1517499545', '1517499545');
INSERT INTO `tp_config` VALUES ('3', 'EXPRESS_USE_INTEGRAL', 'YES', '开启积分抵扣邮费', 'Y', '1517499545', '1517499545');
INSERT INTO `tp_config` VALUES ('4', 'HOW_INTEGRAL', '100', '多少积分抵扣一元邮费', 'Y', '1517499545', '1517499545');

-- ----------------------------
-- Table structure for tp_express
-- ----------------------------
DROP TABLE IF EXISTS `tp_express`;
CREATE TABLE `tp_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '快递名称',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='快递表';

-- ----------------------------
-- Records of tp_express
-- ----------------------------
INSERT INTO `tp_express` VALUES ('1', '顺丰快递', 'Y', '1517023313', '1517023313');
INSERT INTO `tp_express` VALUES ('2', '圆通快递', 'Y', '1517023313', '1517023313');
INSERT INTO `tp_express` VALUES ('3', '中通快递', 'Y', '1517023313', '1517023313');
INSERT INTO `tp_express` VALUES ('4', '韵达快递', 'Y', '1517023313', '1517023313');
INSERT INTO `tp_express` VALUES ('5', '申通快递', 'Y', '1517023313', '1517023313');
INSERT INTO `tp_express` VALUES ('6', '百世汇通', 'Y', '1517023313', '1517023313');

-- ----------------------------
-- Table structure for tp_file
-- ----------------------------
DROP TABLE IF EXISTS `tp_file`;
CREATE TABLE `tp_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '文件类型，1-image | 2-file',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `original` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_file
-- ----------------------------
INSERT INTO `tp_file` VALUES ('1', '3', 'image/jd0dwquw_fcgmk25p1l45a6f414b0db3a.jpg', 'file_58ef16b51c4bd.jpg', 'http://7j1y9l.com1.z0.glb.clouddn.com/', 'image/jpeg', '77939', '1517240651');
INSERT INTO `tp_file` VALUES ('2', '3', 'image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg', 'file_58ef16b51c4bd.jpg', 'http://7j1y9l.com1.z0.glb.clouddn.com/', 'image/jpeg', '77939', '1517240686');

-- ----------------------------
-- Table structure for tp_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_login_log`;
CREATE TABLE `tp_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `login_ip` char(15) NOT NULL DEFAULT '',
  `login_location` varchar(255) NOT NULL DEFAULT '',
  `login_browser` varchar(255) NOT NULL DEFAULT '',
  `login_os` varchar(255) NOT NULL DEFAULT '',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_login_log
-- ----------------------------
INSERT INTO `tp_login_log` VALUES ('1', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.132)', 'Windows 10', '2018-01-25 21:27:58');
INSERT INTO `tp_login_log` VALUES ('2', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.132)', 'Windows 10', '2018-01-27 15:02:27');
INSERT INTO `tp_login_log` VALUES ('3', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.132)', 'Windows 10', '2018-01-28 14:15:52');
INSERT INTO `tp_login_log` VALUES ('4', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.132)', 'Windows 10', '2018-01-29 22:49:41');
INSERT INTO `tp_login_log` VALUES ('5', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(63.0.3239.132)', 'Windows 10', '2018-02-01 23:08:05');

-- ----------------------------
-- Table structure for tp_node_map
-- ----------------------------
DROP TABLE IF EXISTS `tp_node_map`;
CREATE TABLE `tp_node_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '节点图描述',
  PRIMARY KEY (`id`),
  KEY `map` (`method`,`module`,`controller`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点图';

-- ----------------------------
-- Records of tp_node_map
-- ----------------------------

-- ----------------------------
-- Table structure for tp_one_two_three_four
-- ----------------------------
DROP TABLE IF EXISTS `tp_one_two_three_four`;
CREATE TABLE `tp_one_two_three_four` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '四级控制器主键',
  `field1` varchar(255) DEFAULT NULL COMMENT '字段一',
  `option` varchar(255) DEFAULT NULL COMMENT '选填',
  `select` varchar(255) DEFAULT NULL COMMENT '下拉框',
  `radio` varchar(255) DEFAULT NULL COMMENT '单选',
  `checkbox` varchar(255) DEFAULT NULL COMMENT '复选框',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `textarea` varchar(255) DEFAULT NULL COMMENT '文本域',
  `date` varchar(255) DEFAULT NULL COMMENT '日期',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `sort` smallint(5) DEFAULT '50' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='四级控制器';

-- ----------------------------
-- Records of tp_one_two_three_four
-- ----------------------------
INSERT INTO `tp_one_two_three_four` VALUES ('1', 'yuan1994', 'tpadmin', '2', '1', null, '2222', 'https://github.com/yuan1994/tpadmin', '2016-12-07', '13012345678', 'tianpian0805@gmail.com', '50', '1', '0', '1481947278', '1481947353');

-- ----------------------------
-- Table structure for tp_order
-- ----------------------------
DROP TABLE IF EXISTS `tp_order`;
CREATE TABLE `tp_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `trade_no` varchar(32) NOT NULL DEFAULT '' COMMENT '交易单号',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态：0待支付，10已支付，20支付失败，30已发货，40已收货，50完成，60申请退款，70退款中，80已退款，90已关闭',
  `express_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联快递',
  `express` varchar(32) NOT NULL DEFAULT '' COMMENT '快递',
  `express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '快递单号',
  `express_json` varchar(2048) NOT NULL DEFAULT '' COMMENT '物流信息',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of tp_order
-- ----------------------------
INSERT INTO `tp_order` VALUES ('1', '1', '20180128163902343', '50.00', '201832323234322332', '50.00', '1523212345', '10', '1', '百世快递', '32324332', '', 'Y', '1517023313', '1517023313');

-- ----------------------------
-- Table structure for tp_order_address
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_address`;
CREATE TABLE `tp_order_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '联系人',
  `telephone` char(11) NOT NULL DEFAULT '' COMMENT '联系电话',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(16) NOT NULL DEFAULT '' COMMENT '市',
  `area` varchar(16) NOT NULL DEFAULT '' COMMENT '区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单地址表';

-- ----------------------------
-- Records of tp_order_address
-- ----------------------------
INSERT INTO `tp_order_address` VALUES ('1', '1', '小黑', '1528968923', '福建省', '福州市', '台江区', '交通路185号', '1517023313', '1517023313');

-- ----------------------------
-- Table structure for tp_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_detail`;
CREATE TABLE `tp_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品sku ID',
  `product_name` varchar(32) NOT NULL DEFAULT '' COMMENT '产品名称',
  `product_image` varchar(512) NOT NULL DEFAULT '' COMMENT '图片地址',
  `product_attr` varchar(512) NOT NULL DEFAULT '' COMMENT '产品属性',
  `product_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品金额',
  `product_num` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '购买数量',
  `product_content` text NOT NULL COMMENT '产品内容',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单详情';

-- ----------------------------
-- Records of tp_order_detail
-- ----------------------------
INSERT INTO `tp_order_detail` VALUES ('1', '1', '1', '1', '菠萝蜜', '', '50g', '50.00', '1.00', '内容不好说', '1517023313', '1517023313');

-- ----------------------------
-- Table structure for tp_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `tp_order_refund`;
CREATE TABLE `tp_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '退款订单',
  `refund_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '退款单号',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `status` tinyint(4) NOT NULL DEFAULT '100' COMMENT '退款状态：100申请退款，110 拒绝退款，120同意退款，130待收货，140确认收货，150已退款',
  `express` int(11) NOT NULL DEFAULT '0' COMMENT '关联快递',
  `express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '快递单号',
  `express_json` varchar(2048) NOT NULL DEFAULT '' COMMENT '物流信息',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '退款原因',
  `reason_images` varchar(1024) NOT NULL DEFAULT '' COMMENT '退款原因:图片数组json存储',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `refund_sn` (`refund_sn`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单退款';

-- ----------------------------
-- Records of tp_order_refund
-- ----------------------------

-- ----------------------------
-- Table structure for tp_product
-- ----------------------------
DROP TABLE IF EXISTS `tp_product`;
CREATE TABLE `tp_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联产品ID',
  `image` varchar(512) NOT NULL DEFAULT '' COMMENT '图片地址',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '产品标题',
  `description` varchar(512) NOT NULL DEFAULT '' COMMENT '产品简单介绍',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品价格',
  `origin_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品原件格',
  `attr` varchar(32) NOT NULL DEFAULT '' COMMENT '产品属性名称：如颜色分类，尺码等',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU库存',
  `content` text NOT NULL COMMENT '产品内容',
  `online` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否上架，Y是',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of tp_product
-- ----------------------------
INSERT INTO `tp_product` VALUES ('1', '2', 'http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg', '菠萝菠萝蜜', '菠萝菠萝蜜好吃', '50.00', '60.00', '尺码', '20', '这是介绍', 'Y', 'Y', '0', '0');
INSERT INTO `tp_product` VALUES ('2', '1', 'http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg', '香蕉芭乐', '香蕉芭乐', '23.00', '0.00', '称重', '22', 'aa', 'Y', 'Y', '0', '0');

-- ----------------------------
-- Table structure for tp_product_comment
-- ----------------------------
DROP TABLE IF EXISTS `tp_product_comment`;
CREATE TABLE `tp_product_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联产品',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联订单',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `content` text NOT NULL COMMENT '评论内容',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品评论表';

-- ----------------------------
-- Records of tp_product_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tp_product_sku
-- ----------------------------
DROP TABLE IF EXISTS `tp_product_sku`;
CREATE TABLE `tp_product_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `attr` varchar(32) NOT NULL DEFAULT '' COMMENT 'sku名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'sku金额',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT 'SKU库存',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='产品sku表';

-- ----------------------------
-- Records of tp_product_sku
-- ----------------------------
INSERT INTO `tp_product_sku` VALUES ('1', '1', '50g', '50.00', '20', 'Y', '1517023313', '1517241903');
INSERT INTO `tp_product_sku` VALUES ('2', '1', '40g', '42.00', '25', 'Y', '0', '1517241903');
INSERT INTO `tp_product_sku` VALUES ('5', '1', '30g', '36.00', '30', 'Y', '0', '0');
INSERT INTO `tp_product_sku` VALUES ('6', '2', '500g', '50.00', '25', 'Y', '0', '0');
INSERT INTO `tp_product_sku` VALUES ('7', '2', '400g', '38.00', '40', 'Y', '0', '0');

-- ----------------------------
-- Table structure for tp_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tp_statistics`;
CREATE TABLE `tp_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(32) NOT NULL DEFAULT '' COMMENT '统计日期',
  `orders` int(11) NOT NULL DEFAULT '0' COMMENT '订单数',
  `users` int(11) NOT NULL DEFAULT '0' COMMENT '用户数',
  `products` int(11) NOT NULL DEFAULT '0' COMMENT '产品数',
  `amounts` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收入数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表';

-- ----------------------------
-- Records of tp_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for tp_user
-- ----------------------------
DROP TABLE IF EXISTS `tp_user`;
CREATE TABLE `tp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `openid` varchar(64) NOT NULL DEFAULT '' COMMENT '用户标识',
  `unionid` varchar(64) NOT NULL DEFAULT '' COMMENT '用户unionid',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '用户头像',
  `telephone` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `province` varchar(16) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(16) NOT NULL DEFAULT '' COMMENT '市',
  `country` varchar(16) NOT NULL DEFAULT '' COMMENT '国家',
  `gender` varchar(4) NOT NULL DEFAULT '' COMMENT '性别',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `telephone` (`telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tp_user
-- ----------------------------
INSERT INTO `tp_user` VALUES ('1', 'chenqt', '32kl3jl2jr3k2l4j3kl24j32kl', 'erj3kljre23ljkl423324', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3745950342,1178811370&amp;fm=58', '15256765432', '福建', '福州', '中国', '男', 'Y', '1517023313', '1517130128');

-- ----------------------------
-- Table structure for tp_user_address
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_address`;
CREATE TABLE `tp_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '联系人',
  `telephone` char(11) NOT NULL DEFAULT '' COMMENT '联系电话',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省',
  `city_id` int(11) NOT NULL DEFAULT '0' COMMENT '市',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_default` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '默认地址：N否',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '是否可用，默认是',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户地址';

-- ----------------------------
-- Records of tp_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for tp_web_log_001
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_001`;
CREATE TABLE `tp_web_log_001` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `ip` (`ip`),
  KEY `create_at` (`create_at`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=369 DEFAULT CHARSET=utf8 COMMENT='网站日志';

-- ----------------------------
-- Records of tp_web_log_001
-- ----------------------------
INSERT INTO `tp_web_log_001` VALUES ('1', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516886866');
INSERT INTO `tp_web_log_001` VALUES ('2', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1516886866');
INSERT INTO `tp_web_log_001` VALUES ('3', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"rb8u\";}', '1516886878');
INSERT INTO `tp_web_log_001` VALUES ('4', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516886878');
INSERT INTO `tp_web_log_001` VALUES ('5', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516886878');
INSERT INTO `tp_web_log_001` VALUES ('6', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516886919');
INSERT INTO `tp_web_log_001` VALUES ('7', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516886919');
INSERT INTO `tp_web_log_001` VALUES ('8', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516886927');
INSERT INTO `tp_web_log_001` VALUES ('9', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516886930');
INSERT INTO `tp_web_log_001` VALUES ('10', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887044');
INSERT INTO `tp_web_log_001` VALUES ('11', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516887048');
INSERT INTO `tp_web_log_001` VALUES ('12', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516887051');
INSERT INTO `tp_web_log_001` VALUES ('13', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887052');
INSERT INTO `tp_web_log_001` VALUES ('14', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887056');
INSERT INTO `tp_web_log_001` VALUES ('15', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887103');
INSERT INTO `tp_web_log_001` VALUES ('16', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887118');
INSERT INTO `tp_web_log_001` VALUES ('17', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887203');
INSERT INTO `tp_web_log_001` VALUES ('18', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887266');
INSERT INTO `tp_web_log_001` VALUES ('19', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887274');
INSERT INTO `tp_web_log_001` VALUES ('20', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887289');
INSERT INTO `tp_web_log_001` VALUES ('21', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887311');
INSERT INTO `tp_web_log_001` VALUES ('22', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887392');
INSERT INTO `tp_web_log_001` VALUES ('23', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887633');
INSERT INTO `tp_web_log_001` VALUES ('24', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887681');
INSERT INTO `tp_web_log_001` VALUES ('25', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891761');
INSERT INTO `tp_web_log_001` VALUES ('26', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1516891763');
INSERT INTO `tp_web_log_001` VALUES ('27', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:15:\"轮播图管理\";s:4:\"icon\";s:0:\"\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891777');
INSERT INTO `tp_web_log_001` VALUES ('28', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891777');
INSERT INTO `tp_web_log_001` VALUES ('29', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1516891780');
INSERT INTO `tp_web_log_001` VALUES ('30', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"产品管理\";s:4:\"icon\";s:0:\"\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891786');
INSERT INTO `tp_web_log_001` VALUES ('31', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891787');
INSERT INTO `tp_web_log_001` VALUES ('32', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1516891789');
INSERT INTO `tp_web_log_001` VALUES ('33', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"订单管理\";s:4:\"icon\";s:0:\"\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891796');
INSERT INTO `tp_web_log_001` VALUES ('34', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891796');
INSERT INTO `tp_web_log_001` VALUES ('35', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1516891797');
INSERT INTO `tp_web_log_001` VALUES ('36', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"用户管理\";s:4:\"icon\";s:0:\"\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891803');
INSERT INTO `tp_web_log_001` VALUES ('37', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891804');
INSERT INTO `tp_web_log_001` VALUES ('38', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/6.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"6\";}', '1516891810');
INSERT INTO `tp_web_log_001` VALUES ('39', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/6.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"6\";s:4:\"name\";s:12:\"用户管理\";s:4:\"icon\";s:12:\"&amp;#xe611;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891847');
INSERT INTO `tp_web_log_001` VALUES ('40', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891847');
INSERT INTO `tp_web_log_001` VALUES ('41', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/5.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"5\";}', '1516891869');
INSERT INTO `tp_web_log_001` VALUES ('42', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/5.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"订单管理\";s:4:\"icon\";s:12:\"&amp;#xe627;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891872');
INSERT INTO `tp_web_log_001` VALUES ('43', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891872');
INSERT INTO `tp_web_log_001` VALUES ('44', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', '1516891891');
INSERT INTO `tp_web_log_001` VALUES ('45', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:12:\"产品管理\";s:4:\"icon\";s:12:\"&amp;#xe620;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891894');
INSERT INTO `tp_web_log_001` VALUES ('46', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891894');
INSERT INTO `tp_web_log_001` VALUES ('47', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/3.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', '1516891929');
INSERT INTO `tp_web_log_001` VALUES ('48', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/3.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"3\";s:4:\"name\";s:15:\"轮播图管理\";s:4:\"icon\";s:12:\"&amp;#xe646;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891934');
INSERT INTO `tp_web_log_001` VALUES ('49', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891934');
INSERT INTO `tp_web_log_001` VALUES ('50', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516891976');
INSERT INTO `tp_web_log_001` VALUES ('51', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516891977');
INSERT INTO `tp_web_log_001` VALUES ('52', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891980');
INSERT INTO `tp_web_log_001` VALUES ('53', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516891982');
INSERT INTO `tp_web_log_001` VALUES ('54', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516891982');
INSERT INTO `tp_web_log_001` VALUES ('55', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516891983');
INSERT INTO `tp_web_log_001` VALUES ('56', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516891986');
INSERT INTO `tp_web_log_001` VALUES ('57', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"3\";s:5:\"title\";s:9:\"轮播图\";s:4:\"name\";s:6:\"Banner\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892005');
INSERT INTO `tp_web_log_001` VALUES ('58', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892005');
INSERT INTO `tp_web_log_001` VALUES ('59', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892006');
INSERT INTO `tp_web_log_001` VALUES ('60', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892006');
INSERT INTO `tp_web_log_001` VALUES ('61', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892011');
INSERT INTO `tp_web_log_001` VALUES ('62', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"分类列表\";s:4:\"name\";s:8:\"Category\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892031');
INSERT INTO `tp_web_log_001` VALUES ('63', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892032');
INSERT INTO `tp_web_log_001` VALUES ('64', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892032');
INSERT INTO `tp_web_log_001` VALUES ('65', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892032');
INSERT INTO `tp_web_log_001` VALUES ('66', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892034');
INSERT INTO `tp_web_log_001` VALUES ('67', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"产品列表\";s:4:\"name\";s:7:\"Product\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892065');
INSERT INTO `tp_web_log_001` VALUES ('68', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892065');
INSERT INTO `tp_web_log_001` VALUES ('69', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892066');
INSERT INTO `tp_web_log_001` VALUES ('70', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892066');
INSERT INTO `tp_web_log_001` VALUES ('71', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892069');
INSERT INTO `tp_web_log_001` VALUES ('72', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"仓库列表\";s:4:\"name\";s:15:\"Product/offline\";s:4:\"type\";s:1:\"0\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892106');
INSERT INTO `tp_web_log_001` VALUES ('73', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892106');
INSERT INTO `tp_web_log_001` VALUES ('74', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892106');
INSERT INTO `tp_web_log_001` VALUES ('75', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892106');
INSERT INTO `tp_web_log_001` VALUES ('76', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892108');
INSERT INTO `tp_web_log_001` VALUES ('77', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"5\";s:5:\"title\";s:12:\"订单列表\";s:4:\"name\";s:5:\"Order\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892120');
INSERT INTO `tp_web_log_001` VALUES ('78', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892120');
INSERT INTO `tp_web_log_001` VALUES ('79', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892120');
INSERT INTO `tp_web_log_001` VALUES ('80', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892120');
INSERT INTO `tp_web_log_001` VALUES ('81', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892122');
INSERT INTO `tp_web_log_001` VALUES ('82', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"5\";s:5:\"title\";s:12:\"退单管理\";s:4:\"name\";s:6:\"Refund\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892148');
INSERT INTO `tp_web_log_001` VALUES ('83', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892148');
INSERT INTO `tp_web_log_001` VALUES ('84', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892149');
INSERT INTO `tp_web_log_001` VALUES ('85', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892149');
INSERT INTO `tp_web_log_001` VALUES ('86', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892151');
INSERT INTO `tp_web_log_001` VALUES ('87', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"6\";s:5:\"title\";s:12:\"用户列表\";s:4:\"name\";s:4:\"User\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892165');
INSERT INTO `tp_web_log_001` VALUES ('88', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892165');
INSERT INTO `tp_web_log_001` VALUES ('89', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892166');
INSERT INTO `tp_web_log_001` VALUES ('90', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892166');
INSERT INTO `tp_web_log_001` VALUES ('91', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516892168');
INSERT INTO `tp_web_log_001` VALUES ('92', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516892169');
INSERT INTO `tp_web_log_001` VALUES ('93', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516892232');
INSERT INTO `tp_web_log_001` VALUES ('94', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1516892235');
INSERT INTO `tp_web_log_001` VALUES ('95', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"配置管理\";s:4:\"icon\";s:12:\"&amp;#xe692;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516892420');
INSERT INTO `tp_web_log_001` VALUES ('96', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516892420');
INSERT INTO `tp_web_log_001` VALUES ('97', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1516892565');
INSERT INTO `tp_web_log_001` VALUES ('98', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', '1516892572');
INSERT INTO `tp_web_log_001` VALUES ('99', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', '1516893068');
INSERT INTO `tp_web_log_001` VALUES ('100', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', '1516893094');
INSERT INTO `tp_web_log_001` VALUES ('101', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', '1516893139');
INSERT INTO `tp_web_log_001` VALUES ('102', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1516893245');
INSERT INTO `tp_web_log_001` VALUES ('103', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517036535');
INSERT INTO `tp_web_log_001` VALUES ('104', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1517036535');
INSERT INTO `tp_web_log_001` VALUES ('105', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"i3xx\";}', '1517036542');
INSERT INTO `tp_web_log_001` VALUES ('106', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"ekxi\";}', '1517036547');
INSERT INTO `tp_web_log_001` VALUES ('107', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517036547');
INSERT INTO `tp_web_log_001` VALUES ('108', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517036548');
INSERT INTO `tp_web_log_001` VALUES ('109', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517036554');
INSERT INTO `tp_web_log_001` VALUES ('110', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517036773');
INSERT INTO `tp_web_log_001` VALUES ('111', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517036811');
INSERT INTO `tp_web_log_001` VALUES ('112', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517036881');
INSERT INTO `tp_web_log_001` VALUES ('113', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517037130');
INSERT INTO `tp_web_log_001` VALUES ('114', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517037288');
INSERT INTO `tp_web_log_001` VALUES ('115', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517037358');
INSERT INTO `tp_web_log_001` VALUES ('116', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517037511');
INSERT INTO `tp_web_log_001` VALUES ('117', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517037520');
INSERT INTO `tp_web_log_001` VALUES ('118', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1517038780');
INSERT INTO `tp_web_log_001` VALUES ('119', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1517038782');
INSERT INTO `tp_web_log_001` VALUES ('120', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"数据统计\";s:4:\"icon\";s:12:\"&amp;#xe61c;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1517038847');
INSERT INTO `tp_web_log_001` VALUES ('121', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1517038847');
INSERT INTO `tp_web_log_001` VALUES ('122', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1517038848');
INSERT INTO `tp_web_log_001` VALUES ('123', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1517038849');
INSERT INTO `tp_web_log_001` VALUES ('124', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1517038849');
INSERT INTO `tp_web_log_001` VALUES ('125', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1517038851');
INSERT INTO `tp_web_log_001` VALUES ('126', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"8\";s:5:\"title\";s:12:\"统计趋势\";s:4:\"name\";s:10:\"Statistics\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1517038871');
INSERT INTO `tp_web_log_001` VALUES ('127', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1517038871');
INSERT INTO `tp_web_log_001` VALUES ('128', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1517038872');
INSERT INTO `tp_web_log_001` VALUES ('129', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1517038872');
INSERT INTO `tp_web_log_001` VALUES ('130', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517038872');
INSERT INTO `tp_web_log_001` VALUES ('131', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517038873');
INSERT INTO `tp_web_log_001` VALUES ('132', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/statistics/index.html', 'admin', 'Statistics', 'index', 'GET', 'a:0:{}', '1517038875');
INSERT INTO `tp_web_log_001` VALUES ('133', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/statistics/ajaxechart.html?year=2018&month=2', 'admin', 'Statistics', 'ajaxechart', 'GET', 'a:2:{s:4:\"year\";s:4:\"2018\";s:5:\"month\";s:1:\"2\";}', '1517038886');
INSERT INTO `tp_web_log_001` VALUES ('134', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/statistics/index.html', 'admin', 'Statistics', 'index', 'GET', 'a:0:{}', '1517038939');
INSERT INTO `tp_web_log_001` VALUES ('135', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/statistics/index.html', 'admin', 'Statistics', 'index', 'GET', 'a:0:{}', '1517038969');
INSERT INTO `tp_web_log_001` VALUES ('136', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517039029');
INSERT INTO `tp_web_log_001` VALUES ('137', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517039042');
INSERT INTO `tp_web_log_001` VALUES ('138', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517120146');
INSERT INTO `tp_web_log_001` VALUES ('139', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1517120146');
INSERT INTO `tp_web_log_001` VALUES ('140', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"nsh4\";}', '1517120152');
INSERT INTO `tp_web_log_001` VALUES ('141', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517120153');
INSERT INTO `tp_web_log_001` VALUES ('142', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517120153');
INSERT INTO `tp_web_log_001` VALUES ('143', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/statistics/index.html', 'admin', 'Statistics', 'index', 'GET', 'a:0:{}', '1517120160');
INSERT INTO `tp_web_log_001` VALUES ('144', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517125131');
INSERT INTO `tp_web_log_001` VALUES ('145', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517125131');
INSERT INTO `tp_web_log_001` VALUES ('146', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517126985');
INSERT INTO `tp_web_log_001` VALUES ('147', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517127020');
INSERT INTO `tp_web_log_001` VALUES ('148', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517127726');
INSERT INTO `tp_web_log_001` VALUES ('149', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517127939');
INSERT INTO `tp_web_log_001` VALUES ('150', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517127941');
INSERT INTO `tp_web_log_001` VALUES ('151', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517128002');
INSERT INTO `tp_web_log_001` VALUES ('152', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517128044');
INSERT INTO `tp_web_log_001` VALUES ('153', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"热带水果\";s:9:\"parent_id\";s:0:\"\";s:5:\"image\";s:0:\"\";s:7:\"enabled\";s:1:\"Y\";}', '1517128051');
INSERT INTO `tp_web_log_001` VALUES ('154', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517128089');
INSERT INTO `tp_web_log_001` VALUES ('155', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"热带水果\";s:9:\"parent_id\";s:0:\"\";s:5:\"image\";s:0:\"\";s:7:\"enabled\";s:1:\"Y\";}', '1517128093');
INSERT INTO `tp_web_log_001` VALUES ('156', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128093');
INSERT INTO `tp_web_log_001` VALUES ('157', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128166');
INSERT INTO `tp_web_log_001` VALUES ('158', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128454');
INSERT INTO `tp_web_log_001` VALUES ('159', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517128456');
INSERT INTO `tp_web_log_001` VALUES ('160', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"菠萝\";s:9:\"parent_id\";s:1:\"1\";s:5:\"image\";s:0:\"\";s:7:\"enabled\";s:1:\"Y\";}', '1517128464');
INSERT INTO `tp_web_log_001` VALUES ('161', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128464');
INSERT INTO `tp_web_log_001` VALUES ('162', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128542');
INSERT INTO `tp_web_log_001` VALUES ('163', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128563');
INSERT INTO `tp_web_log_001` VALUES ('164', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128569');
INSERT INTO `tp_web_log_001` VALUES ('165', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', '1517128715');
INSERT INTO `tp_web_log_001` VALUES ('166', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:12:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:4:\"User\";s:5:\"title\";s:12:\"用户列表\";s:4:\"form\";a:8:{i:0;a:9:{s:5:\"title\";s:6:\"昵称\";s:4:\"name\";s:8:\"username\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:7:\"require\";s:1:\"1\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:1:\"*\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:8;a:7:{s:5:\"title\";s:6:\"头像\";s:4:\"name\";s:6:\"avatar\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:1;a:7:{s:5:\"title\";s:6:\"openid\";s:4:\"name\";s:6:\"openid\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:9:{s:5:\"title\";s:9:\"手机号\";s:4:\"name\";s:9:\"telephone\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:7:\"require\";s:1:\"1\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:1:\"*\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:9:\"所在省\";s:4:\"name\";s:8:\"province\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:4;a:7:{s:5:\"title\";s:9:\"所在市\";s:4:\"name\";s:4:\"city\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:5;a:7:{s:5:\"title\";s:6:\"性别\";s:4:\"name\";s:6:\"gender\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:9;a:7:{s:5:\"title\";s:6:\"禁用\";s:4:\"name\";s:7:\"enabled\";s:4:\"type\";s:5:\"radio\";s:6:\"option\";s:3:\"Y#N\";s:7:\"default\";s:1:\"Y\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:12:\"table_engine\";s:6:\"InnoDB\";s:10:\"table_name\";s:0:\"\";s:5:\"field\";a:1:{i:0;a:5:{s:4:\"name\";s:0:\"\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:0:\"\";s:5:\"extra\";s:0:\"\";}}s:4:\"menu\";a:1:{i:0;s:6:\"delete\";}s:5:\"model\";s:1:\"1\";s:14:\"auto_timestamp\";s:1:\"1\";s:8:\"validate\";s:1:\"1\";}', '1517128997');
INSERT INTO `tp_web_log_001` VALUES ('167', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', '1517128999');
INSERT INTO `tp_web_log_001` VALUES ('168', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517129120');
INSERT INTO `tp_web_log_001` VALUES ('169', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517129132');
INSERT INTO `tp_web_log_001` VALUES ('170', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517129257');
INSERT INTO `tp_web_log_001` VALUES ('171', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517129370');
INSERT INTO `tp_web_log_001` VALUES ('172', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129570');
INSERT INTO `tp_web_log_001` VALUES ('173', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129711');
INSERT INTO `tp_web_log_001` VALUES ('174', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129760');
INSERT INTO `tp_web_log_001` VALUES ('175', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129779');
INSERT INTO `tp_web_log_001` VALUES ('176', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129822');
INSERT INTO `tp_web_log_001` VALUES ('177', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129906');
INSERT INTO `tp_web_log_001` VALUES ('178', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129915');
INSERT INTO `tp_web_log_001` VALUES ('179', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129923');
INSERT INTO `tp_web_log_001` VALUES ('180', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129930');
INSERT INTO `tp_web_log_001` VALUES ('181', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'POST', 'a:2:{s:2:\"id\";s:1:\"1\";s:7:\"enabled\";s:1:\"N\";}', '1517129940');
INSERT INTO `tp_web_log_001` VALUES ('182', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517130094');
INSERT INTO `tp_web_log_001` VALUES ('183', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'POST', 'a:9:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:6:\"chenqt\";s:6:\"avatar\";s:77:\"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3745950342,1178811370&amp;fm=58\";s:6:\"openid\";s:26:\"32kl3jl2jr3k2l4j3kl24j32kl\";s:9:\"telephone\";s:11:\"15256765432\";s:8:\"province\";s:6:\"福建\";s:4:\"city\";s:6:\"福州\";s:6:\"gender\";s:3:\"男\";s:7:\"enabled\";s:1:\"N\";}', '1517130098');
INSERT INTO `tp_web_log_001` VALUES ('184', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517130098');
INSERT INTO `tp_web_log_001` VALUES ('185', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517130122');
INSERT INTO `tp_web_log_001` VALUES ('186', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517130125');
INSERT INTO `tp_web_log_001` VALUES ('187', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'POST', 'a:9:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:6:\"chenqt\";s:6:\"avatar\";s:77:\"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3745950342,1178811370&amp;fm=58\";s:6:\"openid\";s:26:\"32kl3jl2jr3k2l4j3kl24j32kl\";s:9:\"telephone\";s:11:\"15256765432\";s:8:\"province\";s:6:\"福建\";s:4:\"city\";s:6:\"福州\";s:6:\"gender\";s:3:\"男\";s:7:\"enabled\";s:1:\"Y\";}', '1517130128');
INSERT INTO `tp_web_log_001` VALUES ('188', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517130129');
INSERT INTO `tp_web_log_001` VALUES ('189', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html?username=&telephone=15256', 'admin', 'User', 'index', 'GET', 'a:2:{s:8:\"username\";s:0:\"\";s:9:\"telephone\";s:5:\"15256\";}', '1517130145');
INSERT INTO `tp_web_log_001` VALUES ('190', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517130307');
INSERT INTO `tp_web_log_001` VALUES ('191', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517130308');
INSERT INTO `tp_web_log_001` VALUES ('192', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', '1517130681');
INSERT INTO `tp_web_log_001` VALUES ('193', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517130770');
INSERT INTO `tp_web_log_001` VALUES ('194', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:11:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:5:\"Order\";s:5:\"title\";s:12:\"订单列表\";s:4:\"form\";a:8:{i:0;a:8:{s:5:\"title\";s:9:\"订单号\";s:4:\"name\";s:8:\"order_sn\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:1;a:8:{s:5:\"title\";s:12:\"订单状态\";s:4:\"name\";s:6:\"status\";s:4:\"type\";s:6:\"select\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:6:\"select\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:7:{s:5:\"title\";s:12:\"买家姓名\";s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:7;a:7:{s:5:\"title\";s:12:\"买家电话\";s:4:\"name\";s:9:\"telephone\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:12:\"订单价格\";s:4:\"name\";s:5:\"price\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:4;a:7:{s:5:\"title\";s:6:\"快递\";s:4:\"name\";s:10:\"express_id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:5;a:8:{s:5:\"title\";s:12:\"快递单号\";s:4:\"name\";s:10:\"express_no\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:6;a:7:{s:5:\"title\";s:12:\"支付时间\";s:4:\"name\";s:8:\"pay_time\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:12:\"table_engine\";s:6:\"InnoDB\";s:10:\"table_name\";s:0:\"\";s:5:\"field\";a:1:{i:0;a:5:{s:4:\"name\";s:0:\"\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:0:\"\";s:5:\"extra\";s:0:\"\";}}s:5:\"model\";s:1:\"1\";s:14:\"auto_timestamp\";s:1:\"1\";s:8:\"validate\";s:1:\"1\";}', '1517131628');
INSERT INTO `tp_web_log_001` VALUES ('195', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517131638');
INSERT INTO `tp_web_log_001` VALUES ('196', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', '1517144424');
INSERT INTO `tp_web_log_001` VALUES ('197', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517146069');
INSERT INTO `tp_web_log_001` VALUES ('198', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517146182');
INSERT INTO `tp_web_log_001` VALUES ('199', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517146858');
INSERT INTO `tp_web_log_001` VALUES ('200', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517146915');
INSERT INTO `tp_web_log_001` VALUES ('201', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517146924');
INSERT INTO `tp_web_log_001` VALUES ('202', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517146978');
INSERT INTO `tp_web_log_001` VALUES ('203', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517147024');
INSERT INTO `tp_web_log_001` VALUES ('204', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147037');
INSERT INTO `tp_web_log_001` VALUES ('205', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147153');
INSERT INTO `tp_web_log_001` VALUES ('206', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147192');
INSERT INTO `tp_web_log_001` VALUES ('207', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147335');
INSERT INTO `tp_web_log_001` VALUES ('208', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147398');
INSERT INTO `tp_web_log_001` VALUES ('209', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147550');
INSERT INTO `tp_web_log_001` VALUES ('210', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147636');
INSERT INTO `tp_web_log_001` VALUES ('211', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147680');
INSERT INTO `tp_web_log_001` VALUES ('212', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147701');
INSERT INTO `tp_web_log_001` VALUES ('213', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517147727');
INSERT INTO `tp_web_log_001` VALUES ('214', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147735');
INSERT INTO `tp_web_log_001` VALUES ('215', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147782');
INSERT INTO `tp_web_log_001` VALUES ('216', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147805');
INSERT INTO `tp_web_log_001` VALUES ('217', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147840');
INSERT INTO `tp_web_log_001` VALUES ('218', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147870');
INSERT INTO `tp_web_log_001` VALUES ('219', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147892');
INSERT INTO `tp_web_log_001` VALUES ('220', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147922');
INSERT INTO `tp_web_log_001` VALUES ('221', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147945');
INSERT INTO `tp_web_log_001` VALUES ('222', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147959');
INSERT INTO `tp_web_log_001` VALUES ('223', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148010');
INSERT INTO `tp_web_log_001` VALUES ('224', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148030');
INSERT INTO `tp_web_log_001` VALUES ('225', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148296');
INSERT INTO `tp_web_log_001` VALUES ('226', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148315');
INSERT INTO `tp_web_log_001` VALUES ('227', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148439');
INSERT INTO `tp_web_log_001` VALUES ('228', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148457');
INSERT INTO `tp_web_log_001` VALUES ('229', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148497');
INSERT INTO `tp_web_log_001` VALUES ('230', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148550');
INSERT INTO `tp_web_log_001` VALUES ('231', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148620');
INSERT INTO `tp_web_log_001` VALUES ('232', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148639');
INSERT INTO `tp_web_log_001` VALUES ('233', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148644');
INSERT INTO `tp_web_log_001` VALUES ('234', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148688');
INSERT INTO `tp_web_log_001` VALUES ('235', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148709');
INSERT INTO `tp_web_log_001` VALUES ('236', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148769');
INSERT INTO `tp_web_log_001` VALUES ('237', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517148772');
INSERT INTO `tp_web_log_001` VALUES ('238', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148782');
INSERT INTO `tp_web_log_001` VALUES ('239', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517148784');
INSERT INTO `tp_web_log_001` VALUES ('240', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517148812');
INSERT INTO `tp_web_log_001` VALUES ('241', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', '1517151948');
INSERT INTO `tp_web_log_001` VALUES ('242', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:12:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:7:\"Product\";s:5:\"title\";s:6:\"产品\";s:4:\"form\";a:7:{i:0;a:9:{s:5:\"title\";s:12:\"产品名称\";s:4:\"name\";s:4:\"name\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:7:\"require\";s:1:\"1\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:1:\"*\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:1;a:7:{s:5:\"title\";s:6:\"图片\";s:4:\"name\";s:5:\"image\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:8:{s:5:\"title\";s:12:\"所属分类\";s:4:\"name\";s:11:\"category_id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:6:\"select\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:6:\"价格\";s:4:\"name\";s:5:\"price\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:6;a:7:{s:5:\"title\";s:6:\"库存\";s:4:\"name\";s:5:\"stock\";s:4:\"type\";s:6:\"number\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:4;a:7:{s:5:\"title\";s:12:\"产品属性\";s:4:\"name\";s:4:\"attr\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:5;a:7:{s:5:\"title\";s:6:\"状态\";s:4:\"name\";s:6:\"online\";s:4:\"type\";s:5:\"radio\";s:6:\"option\";s:3:\"Y#N\";s:7:\"default\";s:1:\"Y\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:12:\"table_engine\";s:6:\"InnoDB\";s:10:\"table_name\";s:0:\"\";s:5:\"field\";a:1:{i:0;a:5:{s:4:\"name\";s:0:\"\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:0:\"\";s:5:\"extra\";s:0:\"\";}}s:4:\"menu\";a:3:{i:0;s:3:\"add\";i:1;s:6:\"delete\";i:2;s:10:\"recycleBin\";}s:5:\"model\";s:1:\"1\";s:14:\"auto_timestamp\";s:1:\"1\";s:8:\"validate\";s:1:\"1\";}', '1517152139');
INSERT INTO `tp_web_log_001` VALUES ('243', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517152146');
INSERT INTO `tp_web_log_001` VALUES ('244', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517152149');
INSERT INTO `tp_web_log_001` VALUES ('245', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517153274');
INSERT INTO `tp_web_log_001` VALUES ('246', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517153304');
INSERT INTO `tp_web_log_001` VALUES ('247', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517153365');
INSERT INTO `tp_web_log_001` VALUES ('248', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517153373');
INSERT INTO `tp_web_log_001` VALUES ('249', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517237333');
INSERT INTO `tp_web_log_001` VALUES ('250', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1517237334');
INSERT INTO `tp_web_log_001` VALUES ('251', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"kqy4\";}', '1517237381');
INSERT INTO `tp_web_log_001` VALUES ('252', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517237382');
INSERT INTO `tp_web_log_001` VALUES ('253', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517237382');
INSERT INTO `tp_web_log_001` VALUES ('254', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517237386');
INSERT INTO `tp_web_log_001` VALUES ('255', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517237486');
INSERT INTO `tp_web_log_001` VALUES ('256', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517237487');
INSERT INTO `tp_web_log_001` VALUES ('257', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/offline.html', 'admin', 'Product', 'offline', 'GET', 'a:0:{}', '1517237490');
INSERT INTO `tp_web_log_001` VALUES ('258', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517237492');
INSERT INTO `tp_web_log_001` VALUES ('259', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517237493');
INSERT INTO `tp_web_log_001` VALUES ('260', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/detail/id/1.html', 'admin', 'Order', 'detail', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517237775');
INSERT INTO `tp_web_log_001` VALUES ('261', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/detail/id/1.html', 'admin', 'Order', 'detail', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517238048');
INSERT INTO `tp_web_log_001` VALUES ('262', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/detail/id/1.html', 'admin', 'Order', 'detail', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517238154');
INSERT INTO `tp_web_log_001` VALUES ('263', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517238542');
INSERT INTO `tp_web_log_001` VALUES ('264', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', '1517238572');
INSERT INTO `tp_web_log_001` VALUES ('265', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', '1517238575');
INSERT INTO `tp_web_log_001` VALUES ('266', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', '1517238694');
INSERT INTO `tp_web_log_001` VALUES ('267', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', '1517238695');
INSERT INTO `tp_web_log_001` VALUES ('268', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', '1517238701');
INSERT INTO `tp_web_log_001` VALUES ('269', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1517238704');
INSERT INTO `tp_web_log_001` VALUES ('270', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1517238709');
INSERT INTO `tp_web_log_001` VALUES ('271', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239192');
INSERT INTO `tp_web_log_001` VALUES ('272', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517239246');
INSERT INTO `tp_web_log_001` VALUES ('273', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239393');
INSERT INTO `tp_web_log_001` VALUES ('274', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239410');
INSERT INTO `tp_web_log_001` VALUES ('275', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239536');
INSERT INTO `tp_web_log_001` VALUES ('276', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239573');
INSERT INTO `tp_web_log_001` VALUES ('277', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239782');
INSERT INTO `tp_web_log_001` VALUES ('278', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517240281');
INSERT INTO `tp_web_log_001` VALUES ('279', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517240286');
INSERT INTO `tp_web_log_001` VALUES ('280', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/index/id/image.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:5:\"image\";}', '1517240323');
INSERT INTO `tp_web_log_001` VALUES ('281', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', '1517240337');
INSERT INTO `tp_web_log_001` VALUES ('282', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517240415');
INSERT INTO `tp_web_log_001` VALUES ('283', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', '1517240417');
INSERT INTO `tp_web_log_001` VALUES ('284', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/index/id/image.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:5:\"image\";}', '1517240419');
INSERT INTO `tp_web_log_001` VALUES ('285', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', '1517240423');
INSERT INTO `tp_web_log_001` VALUES ('286', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/index/id/image.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:5:\"image\";}', '1517240647');
INSERT INTO `tp_web_log_001` VALUES ('287', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', '1517240651');
INSERT INTO `tp_web_log_001` VALUES ('288', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:81:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dwquw_fcgmk25p1l45a6f414b0db3a.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:3:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";i:2;s:3:\"30g\";}s:5:\"price\";a:3:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";i:2;s:5:\"36.00\";}s:5:\"stock\";a:3:{i:0;s:2:\"20\";i:1;s:2:\"29\";i:2;s:2:\"25\";}s:2:\"id\";a:3:{i:0;s:1:\"1\";i:1;s:0:\"\";i:2;s:0:\"\";}}}', '1517240658');
INSERT INTO `tp_web_log_001` VALUES ('289', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517240680');
INSERT INTO `tp_web_log_001` VALUES ('290', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/index/id/image.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:5:\"image\";}', '1517240683');
INSERT INTO `tp_web_log_001` VALUES ('291', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', '1517240686');
INSERT INTO `tp_web_log_001` VALUES ('292', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:1:{i:0;s:3:\"50g\";}s:5:\"price\";a:1:{i:0;s:5:\"50.00\";}s:5:\"stock\";a:1:{i:0;s:2:\"20\";}s:2:\"id\";a:1:{i:0;s:1:\"1\";}}}', '1517240689');
INSERT INTO `tp_web_log_001` VALUES ('293', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241278');
INSERT INTO `tp_web_log_001` VALUES ('294', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:2:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";}s:5:\"price\";a:2:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";}s:5:\"stock\";a:2:{i:0;s:2:\"20\";i:1;s:2:\"25\";}s:2:\"id\";a:2:{i:0;s:1:\"1\";i:1;s:0:\"\";}}}', '1517241319');
INSERT INTO `tp_web_log_001` VALUES ('295', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:2:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";}s:5:\"price\";a:2:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";}s:5:\"stock\";a:2:{i:0;s:2:\"20\";i:1;s:2:\"25\";}s:2:\"id\";a:2:{i:0;s:1:\"1\";i:1;s:0:\"\";}}}', '1517241480');
INSERT INTO `tp_web_log_001` VALUES ('296', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517241481');
INSERT INTO `tp_web_log_001` VALUES ('297', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241483');
INSERT INTO `tp_web_log_001` VALUES ('298', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:3:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";i:2;s:3:\"30g\";}s:5:\"price\";a:3:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";i:2;s:5:\"36.00\";}s:5:\"stock\";a:3:{i:0;s:2:\"20\";i:1;s:2:\"25\";i:2;s:2:\"30\";}s:2:\"id\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:0:\"\";}}}', '1517241576');
INSERT INTO `tp_web_log_001` VALUES ('299', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517241576');
INSERT INTO `tp_web_log_001` VALUES ('300', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241578');
INSERT INTO `tp_web_log_001` VALUES ('301', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/delsku.html', 'admin', 'Product', 'delsku', 'POST', 'a:1:{s:2:\"id\";s:1:\"3\";}', '1517241607');
INSERT INTO `tp_web_log_001` VALUES ('302', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241644');
INSERT INTO `tp_web_log_001` VALUES ('303', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:3:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";i:2;s:3:\"20g\";}s:5:\"price\";a:3:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";i:2;s:5:\"20.00\";}s:5:\"stock\";a:3:{i:0;s:2:\"20\";i:1;s:2:\"25\";i:2;s:2:\"32\";}s:2:\"id\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:0:\"\";}}}', '1517241660');
INSERT INTO `tp_web_log_001` VALUES ('304', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517241660');
INSERT INTO `tp_web_log_001` VALUES ('305', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241882');
INSERT INTO `tp_web_log_001` VALUES ('306', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241889');
INSERT INTO `tp_web_log_001` VALUES ('307', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:4:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";i:2;s:3:\"30g\";i:3;s:3:\"20g\";}s:5:\"price\";a:4:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";i:2;s:5:\"36.00\";i:3;s:5:\"20.00\";}s:5:\"stock\";a:4:{i:0;s:2:\"20\";i:1;s:2:\"25\";i:2;s:2:\"30\";i:3;s:2:\"32\";}s:2:\"id\";a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:0:\"\";i:3;s:1:\"4\";}}}', '1517241903');
INSERT INTO `tp_web_log_001` VALUES ('308', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517241904');
INSERT INTO `tp_web_log_001` VALUES ('309', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241905');
INSERT INTO `tp_web_log_001` VALUES ('310', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241947');
INSERT INTO `tp_web_log_001` VALUES ('311', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517242005');
INSERT INTO `tp_web_log_001` VALUES ('312', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/delsku.html', 'admin', 'Product', 'delsku', 'POST', 'a:1:{s:2:\"id\";s:1:\"4\";}', '1517242009');
INSERT INTO `tp_web_log_001` VALUES ('313', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517242013');
INSERT INTO `tp_web_log_001` VALUES ('314', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517242033');
INSERT INTO `tp_web_log_001` VALUES ('315', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/offline.html', 'admin', 'Product', 'offline', 'GET', 'a:0:{}', '1517242036');
INSERT INTO `tp_web_log_001` VALUES ('316', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517242049');
INSERT INTO `tp_web_log_001` VALUES ('317', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517242056');
INSERT INTO `tp_web_log_001` VALUES ('318', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517242505');
INSERT INTO `tp_web_log_001` VALUES ('319', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517242532');
INSERT INTO `tp_web_log_001` VALUES ('320', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517242533');
INSERT INTO `tp_web_log_001` VALUES ('321', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517242585');
INSERT INTO `tp_web_log_001` VALUES ('322', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517242632');
INSERT INTO `tp_web_log_001` VALUES ('323', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517242640');
INSERT INTO `tp_web_log_001` VALUES ('324', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243112');
INSERT INTO `tp_web_log_001` VALUES ('325', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243181');
INSERT INTO `tp_web_log_001` VALUES ('326', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243194');
INSERT INTO `tp_web_log_001` VALUES ('327', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243203');
INSERT INTO `tp_web_log_001` VALUES ('328', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243213');
INSERT INTO `tp_web_log_001` VALUES ('329', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243230');
INSERT INTO `tp_web_log_001` VALUES ('330', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243243');
INSERT INTO `tp_web_log_001` VALUES ('331', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517243285');
INSERT INTO `tp_web_log_001` VALUES ('332', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517243288');
INSERT INTO `tp_web_log_001` VALUES ('333', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243300');
INSERT INTO `tp_web_log_001` VALUES ('334', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:15:\"香蕉个巴拉\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:24:\"相加批年纪哦放到\";s:11:\"category_id\";s:1:\"1\";s:5:\"price\";s:2:\"23\";s:5:\"stock\";s:1:\"2\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"称重\";}', '1517243359');
INSERT INTO `tp_web_log_001` VALUES ('335', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243859');
INSERT INTO `tp_web_log_001` VALUES ('336', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243870');
INSERT INTO `tp_web_log_001` VALUES ('337', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243907');
INSERT INTO `tp_web_log_001` VALUES ('338', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243921');
INSERT INTO `tp_web_log_001` VALUES ('339', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243952');
INSERT INTO `tp_web_log_001` VALUES ('340', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243968');
INSERT INTO `tp_web_log_001` VALUES ('341', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:10:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"香蕉芭乐\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:12:\"香蕉芭乐\";s:11:\"category_id\";s:1:\"1\";s:5:\"price\";s:2:\"23\";s:5:\"stock\";s:2:\"22\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"称重\";s:3:\"sku\";a:3:{s:4:\"attr\";a:2:{i:0;s:4:\"500g\";i:1;s:4:\"400g\";}s:5:\"price\";a:2:{i:0;s:2:\"50\";i:1;s:2:\"38\";}s:5:\"stock\";a:2:{i:0;s:2:\"25\";i:1;s:2:\"40\";}}}', '1517244056');
INSERT INTO `tp_web_log_001` VALUES ('342', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:10:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"香蕉芭乐\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:12:\"香蕉芭乐\";s:11:\"category_id\";s:1:\"1\";s:5:\"price\";s:2:\"23\";s:5:\"stock\";s:2:\"22\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"称重\";s:3:\"sku\";a:3:{s:4:\"attr\";a:2:{i:0;s:4:\"500g\";i:1;s:4:\"400g\";}s:5:\"price\";a:2:{i:0;s:2:\"50\";i:1;s:2:\"38\";}s:5:\"stock\";a:2:{i:0;s:2:\"25\";i:1;s:2:\"40\";}}}', '1517244087');
INSERT INTO `tp_web_log_001` VALUES ('343', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517244087');
INSERT INTO `tp_web_log_001` VALUES ('344', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/2.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"2\";}', '1517244090');
INSERT INTO `tp_web_log_001` VALUES ('345', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517497677');
INSERT INTO `tp_web_log_001` VALUES ('346', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1517497678');
INSERT INTO `tp_web_log_001` VALUES ('347', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1517497679');
INSERT INTO `tp_web_log_001` VALUES ('348', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"fxu3\";}', '1517497685');
INSERT INTO `tp_web_log_001` VALUES ('349', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517497686');
INSERT INTO `tp_web_log_001` VALUES ('350', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517497687');
INSERT INTO `tp_web_log_001` VALUES ('351', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1517497779');
INSERT INTO `tp_web_log_001` VALUES ('352', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1517497780');
INSERT INTO `tp_web_log_001` VALUES ('353', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1517497780');
INSERT INTO `tp_web_log_001` VALUES ('354', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"2\";}', '1517497790');
INSERT INTO `tp_web_log_001` VALUES ('355', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', '1517497794');
INSERT INTO `tp_web_log_001` VALUES ('356', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', '1517497796');
INSERT INTO `tp_web_log_001` VALUES ('357', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"5\";}', '1517497797');
INSERT INTO `tp_web_log_001` VALUES ('358', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"6\";}', '1517497799');
INSERT INTO `tp_web_log_001` VALUES ('359', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"8\";}', '1517497802');
INSERT INTO `tp_web_log_001` VALUES ('360', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1517499023');
INSERT INTO `tp_web_log_001` VALUES ('361', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"1\";s:5:\"title\";s:12:\"系统账户\";s:4:\"name\";s:14:\"CompanyAccount\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1517499061');
INSERT INTO `tp_web_log_001` VALUES ('362', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1517499062');
INSERT INTO `tp_web_log_001` VALUES ('363', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1517499062');
INSERT INTO `tp_web_log_001` VALUES ('364', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1517499062');
INSERT INTO `tp_web_log_001` VALUES ('365', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517499065');
INSERT INTO `tp_web_log_001` VALUES ('366', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517499066');
INSERT INTO `tp_web_log_001` VALUES ('367', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517573491');
INSERT INTO `tp_web_log_001` VALUES ('368', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517573492');

-- ----------------------------
-- Table structure for tp_web_log_all
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_all`;
CREATE TABLE `tp_web_log_all` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE,
  KEY `create_at` (`create_at`) USING BTREE
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC INSERT_METHOD=LAST UNION=(`tp_web_log_001`) COMMENT='网站日志';

-- ----------------------------
-- Records of tp_web_log_all
-- ----------------------------
INSERT INTO `tp_web_log_all` VALUES ('1', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516886866');
INSERT INTO `tp_web_log_all` VALUES ('2', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1516886866');
INSERT INTO `tp_web_log_all` VALUES ('3', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"rb8u\";}', '1516886878');
INSERT INTO `tp_web_log_all` VALUES ('4', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516886878');
INSERT INTO `tp_web_log_all` VALUES ('5', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516886878');
INSERT INTO `tp_web_log_all` VALUES ('6', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516886919');
INSERT INTO `tp_web_log_all` VALUES ('7', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516886919');
INSERT INTO `tp_web_log_all` VALUES ('8', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516886927');
INSERT INTO `tp_web_log_all` VALUES ('9', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516886930');
INSERT INTO `tp_web_log_all` VALUES ('10', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887044');
INSERT INTO `tp_web_log_all` VALUES ('11', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516887048');
INSERT INTO `tp_web_log_all` VALUES ('12', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516887051');
INSERT INTO `tp_web_log_all` VALUES ('13', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887052');
INSERT INTO `tp_web_log_all` VALUES ('14', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887056');
INSERT INTO `tp_web_log_all` VALUES ('15', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887103');
INSERT INTO `tp_web_log_all` VALUES ('16', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887118');
INSERT INTO `tp_web_log_all` VALUES ('17', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887203');
INSERT INTO `tp_web_log_all` VALUES ('18', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887266');
INSERT INTO `tp_web_log_all` VALUES ('19', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887274');
INSERT INTO `tp_web_log_all` VALUES ('20', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887289');
INSERT INTO `tp_web_log_all` VALUES ('21', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887311');
INSERT INTO `tp_web_log_all` VALUES ('22', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887392');
INSERT INTO `tp_web_log_all` VALUES ('23', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887633');
INSERT INTO `tp_web_log_all` VALUES ('24', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516887681');
INSERT INTO `tp_web_log_all` VALUES ('25', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891761');
INSERT INTO `tp_web_log_all` VALUES ('26', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1516891763');
INSERT INTO `tp_web_log_all` VALUES ('27', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:15:\"轮播图管理\";s:4:\"icon\";s:0:\"\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891777');
INSERT INTO `tp_web_log_all` VALUES ('28', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891777');
INSERT INTO `tp_web_log_all` VALUES ('29', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1516891780');
INSERT INTO `tp_web_log_all` VALUES ('30', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"产品管理\";s:4:\"icon\";s:0:\"\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891786');
INSERT INTO `tp_web_log_all` VALUES ('31', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891787');
INSERT INTO `tp_web_log_all` VALUES ('32', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1516891789');
INSERT INTO `tp_web_log_all` VALUES ('33', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"订单管理\";s:4:\"icon\";s:0:\"\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891796');
INSERT INTO `tp_web_log_all` VALUES ('34', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891796');
INSERT INTO `tp_web_log_all` VALUES ('35', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1516891797');
INSERT INTO `tp_web_log_all` VALUES ('36', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"用户管理\";s:4:\"icon\";s:0:\"\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891803');
INSERT INTO `tp_web_log_all` VALUES ('37', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891804');
INSERT INTO `tp_web_log_all` VALUES ('38', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/6.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"6\";}', '1516891810');
INSERT INTO `tp_web_log_all` VALUES ('39', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/6.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"6\";s:4:\"name\";s:12:\"用户管理\";s:4:\"icon\";s:12:\"&amp;#xe611;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891847');
INSERT INTO `tp_web_log_all` VALUES ('40', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891847');
INSERT INTO `tp_web_log_all` VALUES ('41', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/5.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"5\";}', '1516891869');
INSERT INTO `tp_web_log_all` VALUES ('42', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/5.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"5\";s:4:\"name\";s:12:\"订单管理\";s:4:\"icon\";s:12:\"&amp;#xe627;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891872');
INSERT INTO `tp_web_log_all` VALUES ('43', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891872');
INSERT INTO `tp_web_log_all` VALUES ('44', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"4\";}', '1516891891');
INSERT INTO `tp_web_log_all` VALUES ('45', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/4.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"4\";s:4:\"name\";s:12:\"产品管理\";s:4:\"icon\";s:12:\"&amp;#xe620;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891894');
INSERT INTO `tp_web_log_all` VALUES ('46', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891894');
INSERT INTO `tp_web_log_all` VALUES ('47', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/3.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"3\";}', '1516891929');
INSERT INTO `tp_web_log_all` VALUES ('48', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/edit/id/3.html', 'admin', 'AdminGroup', 'edit', 'POST', 'a:6:{s:2:\"id\";s:1:\"3\";s:4:\"name\";s:15:\"轮播图管理\";s:4:\"icon\";s:12:\"&amp;#xe646;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516891934');
INSERT INTO `tp_web_log_all` VALUES ('49', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891934');
INSERT INTO `tp_web_log_all` VALUES ('50', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516891976');
INSERT INTO `tp_web_log_all` VALUES ('51', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516891977');
INSERT INTO `tp_web_log_all` VALUES ('52', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516891980');
INSERT INTO `tp_web_log_all` VALUES ('53', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516891982');
INSERT INTO `tp_web_log_all` VALUES ('54', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516891982');
INSERT INTO `tp_web_log_all` VALUES ('55', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516891983');
INSERT INTO `tp_web_log_all` VALUES ('56', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516891986');
INSERT INTO `tp_web_log_all` VALUES ('57', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"3\";s:5:\"title\";s:9:\"轮播图\";s:4:\"name\";s:6:\"Banner\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892005');
INSERT INTO `tp_web_log_all` VALUES ('58', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892005');
INSERT INTO `tp_web_log_all` VALUES ('59', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892006');
INSERT INTO `tp_web_log_all` VALUES ('60', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892006');
INSERT INTO `tp_web_log_all` VALUES ('61', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892011');
INSERT INTO `tp_web_log_all` VALUES ('62', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"分类列表\";s:4:\"name\";s:8:\"Category\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892031');
INSERT INTO `tp_web_log_all` VALUES ('63', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892032');
INSERT INTO `tp_web_log_all` VALUES ('64', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892032');
INSERT INTO `tp_web_log_all` VALUES ('65', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892032');
INSERT INTO `tp_web_log_all` VALUES ('66', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892034');
INSERT INTO `tp_web_log_all` VALUES ('67', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"产品列表\";s:4:\"name\";s:7:\"Product\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892065');
INSERT INTO `tp_web_log_all` VALUES ('68', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892065');
INSERT INTO `tp_web_log_all` VALUES ('69', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892066');
INSERT INTO `tp_web_log_all` VALUES ('70', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892066');
INSERT INTO `tp_web_log_all` VALUES ('71', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892069');
INSERT INTO `tp_web_log_all` VALUES ('72', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"4\";s:5:\"title\";s:12:\"仓库列表\";s:4:\"name\";s:15:\"Product/offline\";s:4:\"type\";s:1:\"0\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892106');
INSERT INTO `tp_web_log_all` VALUES ('73', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892106');
INSERT INTO `tp_web_log_all` VALUES ('74', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892106');
INSERT INTO `tp_web_log_all` VALUES ('75', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892106');
INSERT INTO `tp_web_log_all` VALUES ('76', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892108');
INSERT INTO `tp_web_log_all` VALUES ('77', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"5\";s:5:\"title\";s:12:\"订单列表\";s:4:\"name\";s:5:\"Order\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892120');
INSERT INTO `tp_web_log_all` VALUES ('78', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892120');
INSERT INTO `tp_web_log_all` VALUES ('79', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892120');
INSERT INTO `tp_web_log_all` VALUES ('80', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892120');
INSERT INTO `tp_web_log_all` VALUES ('81', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892122');
INSERT INTO `tp_web_log_all` VALUES ('82', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"5\";s:5:\"title\";s:12:\"退单管理\";s:4:\"name\";s:6:\"Refund\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892148');
INSERT INTO `tp_web_log_all` VALUES ('83', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892148');
INSERT INTO `tp_web_log_all` VALUES ('84', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892149');
INSERT INTO `tp_web_log_all` VALUES ('85', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892149');
INSERT INTO `tp_web_log_all` VALUES ('86', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1516892151');
INSERT INTO `tp_web_log_all` VALUES ('87', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"6\";s:5:\"title\";s:12:\"用户列表\";s:4:\"name\";s:4:\"User\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1516892165');
INSERT INTO `tp_web_log_all` VALUES ('88', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1516892165');
INSERT INTO `tp_web_log_all` VALUES ('89', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1516892166');
INSERT INTO `tp_web_log_all` VALUES ('90', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1516892166');
INSERT INTO `tp_web_log_all` VALUES ('91', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1516892168');
INSERT INTO `tp_web_log_all` VALUES ('92', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1516892169');
INSERT INTO `tp_web_log_all` VALUES ('93', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516892232');
INSERT INTO `tp_web_log_all` VALUES ('94', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1516892235');
INSERT INTO `tp_web_log_all` VALUES ('95', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"配置管理\";s:4:\"icon\";s:12:\"&amp;#xe692;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1516892420');
INSERT INTO `tp_web_log_all` VALUES ('96', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1516892420');
INSERT INTO `tp_web_log_all` VALUES ('97', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1516892565');
INSERT INTO `tp_web_log_all` VALUES ('98', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', '1516892572');
INSERT INTO `tp_web_log_all` VALUES ('99', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', '1516893068');
INSERT INTO `tp_web_log_all` VALUES ('100', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', '1516893094');
INSERT INTO `tp_web_log_all` VALUES ('101', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', '1516893139');
INSERT INTO `tp_web_log_all` VALUES ('102', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1516893245');
INSERT INTO `tp_web_log_all` VALUES ('103', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517036535');
INSERT INTO `tp_web_log_all` VALUES ('104', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1517036535');
INSERT INTO `tp_web_log_all` VALUES ('105', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"i3xx\";}', '1517036542');
INSERT INTO `tp_web_log_all` VALUES ('106', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"ekxi\";}', '1517036547');
INSERT INTO `tp_web_log_all` VALUES ('107', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517036547');
INSERT INTO `tp_web_log_all` VALUES ('108', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517036548');
INSERT INTO `tp_web_log_all` VALUES ('109', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517036554');
INSERT INTO `tp_web_log_all` VALUES ('110', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517036773');
INSERT INTO `tp_web_log_all` VALUES ('111', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517036811');
INSERT INTO `tp_web_log_all` VALUES ('112', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517036881');
INSERT INTO `tp_web_log_all` VALUES ('113', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517037130');
INSERT INTO `tp_web_log_all` VALUES ('114', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517037288');
INSERT INTO `tp_web_log_all` VALUES ('115', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517037358');
INSERT INTO `tp_web_log_all` VALUES ('116', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517037511');
INSERT INTO `tp_web_log_all` VALUES ('117', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517037520');
INSERT INTO `tp_web_log_all` VALUES ('118', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1517038780');
INSERT INTO `tp_web_log_all` VALUES ('119', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'GET', 'a:0:{}', '1517038782');
INSERT INTO `tp_web_log_all` VALUES ('120', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/add.html', 'admin', 'AdminGroup', 'add', 'POST', 'a:6:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"数据统计\";s:4:\"icon\";s:12:\"&amp;#xe61c;\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";s:6:\"remark\";s:0:\"\";}', '1517038847');
INSERT INTO `tp_web_log_all` VALUES ('121', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', '1517038847');
INSERT INTO `tp_web_log_all` VALUES ('122', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1517038848');
INSERT INTO `tp_web_log_all` VALUES ('123', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1517038849');
INSERT INTO `tp_web_log_all` VALUES ('124', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1517038849');
INSERT INTO `tp_web_log_all` VALUES ('125', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1517038851');
INSERT INTO `tp_web_log_all` VALUES ('126', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"8\";s:5:\"title\";s:12:\"统计趋势\";s:4:\"name\";s:10:\"Statistics\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1517038871');
INSERT INTO `tp_web_log_all` VALUES ('127', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1517038871');
INSERT INTO `tp_web_log_all` VALUES ('128', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1517038872');
INSERT INTO `tp_web_log_all` VALUES ('129', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1517038872');
INSERT INTO `tp_web_log_all` VALUES ('130', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517038872');
INSERT INTO `tp_web_log_all` VALUES ('131', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517038873');
INSERT INTO `tp_web_log_all` VALUES ('132', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/statistics/index.html', 'admin', 'Statistics', 'index', 'GET', 'a:0:{}', '1517038875');
INSERT INTO `tp_web_log_all` VALUES ('133', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/statistics/ajaxechart.html?year=2018&month=2', 'admin', 'Statistics', 'ajaxechart', 'GET', 'a:2:{s:4:\"year\";s:4:\"2018\";s:5:\"month\";s:1:\"2\";}', '1517038886');
INSERT INTO `tp_web_log_all` VALUES ('134', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/statistics/index.html', 'admin', 'Statistics', 'index', 'GET', 'a:0:{}', '1517038939');
INSERT INTO `tp_web_log_all` VALUES ('135', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/statistics/index.html', 'admin', 'Statistics', 'index', 'GET', 'a:0:{}', '1517038969');
INSERT INTO `tp_web_log_all` VALUES ('136', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517039029');
INSERT INTO `tp_web_log_all` VALUES ('137', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517039042');
INSERT INTO `tp_web_log_all` VALUES ('138', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517120146');
INSERT INTO `tp_web_log_all` VALUES ('139', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1517120146');
INSERT INTO `tp_web_log_all` VALUES ('140', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"nsh4\";}', '1517120152');
INSERT INTO `tp_web_log_all` VALUES ('141', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517120153');
INSERT INTO `tp_web_log_all` VALUES ('142', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517120153');
INSERT INTO `tp_web_log_all` VALUES ('143', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/statistics/index.html', 'admin', 'Statistics', 'index', 'GET', 'a:0:{}', '1517120160');
INSERT INTO `tp_web_log_all` VALUES ('144', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517125131');
INSERT INTO `tp_web_log_all` VALUES ('145', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517125131');
INSERT INTO `tp_web_log_all` VALUES ('146', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517126985');
INSERT INTO `tp_web_log_all` VALUES ('147', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517127020');
INSERT INTO `tp_web_log_all` VALUES ('148', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517127726');
INSERT INTO `tp_web_log_all` VALUES ('149', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517127939');
INSERT INTO `tp_web_log_all` VALUES ('150', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517127941');
INSERT INTO `tp_web_log_all` VALUES ('151', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517128002');
INSERT INTO `tp_web_log_all` VALUES ('152', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517128044');
INSERT INTO `tp_web_log_all` VALUES ('153', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"热带水果\";s:9:\"parent_id\";s:0:\"\";s:5:\"image\";s:0:\"\";s:7:\"enabled\";s:1:\"Y\";}', '1517128051');
INSERT INTO `tp_web_log_all` VALUES ('154', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517128089');
INSERT INTO `tp_web_log_all` VALUES ('155', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"热带水果\";s:9:\"parent_id\";s:0:\"\";s:5:\"image\";s:0:\"\";s:7:\"enabled\";s:1:\"Y\";}', '1517128093');
INSERT INTO `tp_web_log_all` VALUES ('156', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128093');
INSERT INTO `tp_web_log_all` VALUES ('157', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128166');
INSERT INTO `tp_web_log_all` VALUES ('158', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128454');
INSERT INTO `tp_web_log_all` VALUES ('159', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'GET', 'a:0:{}', '1517128456');
INSERT INTO `tp_web_log_all` VALUES ('160', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/add.html', 'admin', 'Category', 'add', 'POST', 'a:5:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:6:\"菠萝\";s:9:\"parent_id\";s:1:\"1\";s:5:\"image\";s:0:\"\";s:7:\"enabled\";s:1:\"Y\";}', '1517128464');
INSERT INTO `tp_web_log_all` VALUES ('161', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128464');
INSERT INTO `tp_web_log_all` VALUES ('162', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128542');
INSERT INTO `tp_web_log_all` VALUES ('163', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128563');
INSERT INTO `tp_web_log_all` VALUES ('164', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517128569');
INSERT INTO `tp_web_log_all` VALUES ('165', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', '1517128715');
INSERT INTO `tp_web_log_all` VALUES ('166', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:12:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:4:\"User\";s:5:\"title\";s:12:\"用户列表\";s:4:\"form\";a:8:{i:0;a:9:{s:5:\"title\";s:6:\"昵称\";s:4:\"name\";s:8:\"username\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:7:\"require\";s:1:\"1\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:1:\"*\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:8;a:7:{s:5:\"title\";s:6:\"头像\";s:4:\"name\";s:6:\"avatar\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:1;a:7:{s:5:\"title\";s:6:\"openid\";s:4:\"name\";s:6:\"openid\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:9:{s:5:\"title\";s:9:\"手机号\";s:4:\"name\";s:9:\"telephone\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:7:\"require\";s:1:\"1\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:1:\"*\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:9:\"所在省\";s:4:\"name\";s:8:\"province\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:4;a:7:{s:5:\"title\";s:9:\"所在市\";s:4:\"name\";s:4:\"city\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:5;a:7:{s:5:\"title\";s:6:\"性别\";s:4:\"name\";s:6:\"gender\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:9;a:7:{s:5:\"title\";s:6:\"禁用\";s:4:\"name\";s:7:\"enabled\";s:4:\"type\";s:5:\"radio\";s:6:\"option\";s:3:\"Y#N\";s:7:\"default\";s:1:\"Y\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:12:\"table_engine\";s:6:\"InnoDB\";s:10:\"table_name\";s:0:\"\";s:5:\"field\";a:1:{i:0;a:5:{s:4:\"name\";s:0:\"\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:0:\"\";s:5:\"extra\";s:0:\"\";}}s:4:\"menu\";a:1:{i:0;s:6:\"delete\";}s:5:\"model\";s:1:\"1\";s:14:\"auto_timestamp\";s:1:\"1\";s:8:\"validate\";s:1:\"1\";}', '1517128997');
INSERT INTO `tp_web_log_all` VALUES ('167', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', '1517128999');
INSERT INTO `tp_web_log_all` VALUES ('168', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517129120');
INSERT INTO `tp_web_log_all` VALUES ('169', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517129132');
INSERT INTO `tp_web_log_all` VALUES ('170', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517129257');
INSERT INTO `tp_web_log_all` VALUES ('171', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517129370');
INSERT INTO `tp_web_log_all` VALUES ('172', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129570');
INSERT INTO `tp_web_log_all` VALUES ('173', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129711');
INSERT INTO `tp_web_log_all` VALUES ('174', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129760');
INSERT INTO `tp_web_log_all` VALUES ('175', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129779');
INSERT INTO `tp_web_log_all` VALUES ('176', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129822');
INSERT INTO `tp_web_log_all` VALUES ('177', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129906');
INSERT INTO `tp_web_log_all` VALUES ('178', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129915');
INSERT INTO `tp_web_log_all` VALUES ('179', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129923');
INSERT INTO `tp_web_log_all` VALUES ('180', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517129930');
INSERT INTO `tp_web_log_all` VALUES ('181', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'POST', 'a:2:{s:2:\"id\";s:1:\"1\";s:7:\"enabled\";s:1:\"N\";}', '1517129940');
INSERT INTO `tp_web_log_all` VALUES ('182', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517130094');
INSERT INTO `tp_web_log_all` VALUES ('183', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'POST', 'a:9:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:6:\"chenqt\";s:6:\"avatar\";s:77:\"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3745950342,1178811370&amp;fm=58\";s:6:\"openid\";s:26:\"32kl3jl2jr3k2l4j3kl24j32kl\";s:9:\"telephone\";s:11:\"15256765432\";s:8:\"province\";s:6:\"福建\";s:4:\"city\";s:6:\"福州\";s:6:\"gender\";s:3:\"男\";s:7:\"enabled\";s:1:\"N\";}', '1517130098');
INSERT INTO `tp_web_log_all` VALUES ('184', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517130098');
INSERT INTO `tp_web_log_all` VALUES ('185', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517130122');
INSERT INTO `tp_web_log_all` VALUES ('186', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517130125');
INSERT INTO `tp_web_log_all` VALUES ('187', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/edit/id/1.html', 'admin', 'User', 'edit', 'POST', 'a:9:{s:2:\"id\";s:1:\"1\";s:8:\"username\";s:6:\"chenqt\";s:6:\"avatar\";s:77:\"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3745950342,1178811370&amp;fm=58\";s:6:\"openid\";s:26:\"32kl3jl2jr3k2l4j3kl24j32kl\";s:9:\"telephone\";s:11:\"15256765432\";s:8:\"province\";s:6:\"福建\";s:4:\"city\";s:6:\"福州\";s:6:\"gender\";s:3:\"男\";s:7:\"enabled\";s:1:\"Y\";}', '1517130128');
INSERT INTO `tp_web_log_all` VALUES ('188', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517130129');
INSERT INTO `tp_web_log_all` VALUES ('189', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html?username=&telephone=15256', 'admin', 'User', 'index', 'GET', 'a:2:{s:8:\"username\";s:0:\"\";s:9:\"telephone\";s:5:\"15256\";}', '1517130145');
INSERT INTO `tp_web_log_all` VALUES ('190', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517130307');
INSERT INTO `tp_web_log_all` VALUES ('191', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517130308');
INSERT INTO `tp_web_log_all` VALUES ('192', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', '1517130681');
INSERT INTO `tp_web_log_all` VALUES ('193', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517130770');
INSERT INTO `tp_web_log_all` VALUES ('194', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:11:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:5:\"Order\";s:5:\"title\";s:12:\"订单列表\";s:4:\"form\";a:8:{i:0;a:8:{s:5:\"title\";s:9:\"订单号\";s:4:\"name\";s:8:\"order_sn\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:1;a:8:{s:5:\"title\";s:12:\"订单状态\";s:4:\"name\";s:6:\"status\";s:4:\"type\";s:6:\"select\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:6:\"select\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:7:{s:5:\"title\";s:12:\"买家姓名\";s:4:\"name\";s:7:\"user_id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:7;a:7:{s:5:\"title\";s:12:\"买家电话\";s:4:\"name\";s:9:\"telephone\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:12:\"订单价格\";s:4:\"name\";s:5:\"price\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:4;a:7:{s:5:\"title\";s:6:\"快递\";s:4:\"name\";s:10:\"express_id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:5;a:8:{s:5:\"title\";s:12:\"快递单号\";s:4:\"name\";s:10:\"express_no\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:6;a:7:{s:5:\"title\";s:12:\"支付时间\";s:4:\"name\";s:8:\"pay_time\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:12:\"table_engine\";s:6:\"InnoDB\";s:10:\"table_name\";s:0:\"\";s:5:\"field\";a:1:{i:0;a:5:{s:4:\"name\";s:0:\"\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:0:\"\";s:5:\"extra\";s:0:\"\";}}s:5:\"model\";s:1:\"1\";s:14:\"auto_timestamp\";s:1:\"1\";s:8:\"validate\";s:1:\"1\";}', '1517131628');
INSERT INTO `tp_web_log_all` VALUES ('195', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517131638');
INSERT INTO `tp_web_log_all` VALUES ('196', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', '1517144424');
INSERT INTO `tp_web_log_all` VALUES ('197', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517146069');
INSERT INTO `tp_web_log_all` VALUES ('198', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517146182');
INSERT INTO `tp_web_log_all` VALUES ('199', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517146858');
INSERT INTO `tp_web_log_all` VALUES ('200', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517146915');
INSERT INTO `tp_web_log_all` VALUES ('201', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517146924');
INSERT INTO `tp_web_log_all` VALUES ('202', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517146978');
INSERT INTO `tp_web_log_all` VALUES ('203', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517147024');
INSERT INTO `tp_web_log_all` VALUES ('204', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147037');
INSERT INTO `tp_web_log_all` VALUES ('205', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147153');
INSERT INTO `tp_web_log_all` VALUES ('206', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147192');
INSERT INTO `tp_web_log_all` VALUES ('207', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147335');
INSERT INTO `tp_web_log_all` VALUES ('208', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147398');
INSERT INTO `tp_web_log_all` VALUES ('209', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147550');
INSERT INTO `tp_web_log_all` VALUES ('210', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147636');
INSERT INTO `tp_web_log_all` VALUES ('211', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147680');
INSERT INTO `tp_web_log_all` VALUES ('212', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=90&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:2:\"90\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147701');
INSERT INTO `tp_web_log_all` VALUES ('213', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517147727');
INSERT INTO `tp_web_log_all` VALUES ('214', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147735');
INSERT INTO `tp_web_log_all` VALUES ('215', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147782');
INSERT INTO `tp_web_log_all` VALUES ('216', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147805');
INSERT INTO `tp_web_log_all` VALUES ('217', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147840');
INSERT INTO `tp_web_log_all` VALUES ('218', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147870');
INSERT INTO `tp_web_log_all` VALUES ('219', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147892');
INSERT INTO `tp_web_log_all` VALUES ('220', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147922');
INSERT INTO `tp_web_log_all` VALUES ('221', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147945');
INSERT INTO `tp_web_log_all` VALUES ('222', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517147959');
INSERT INTO `tp_web_log_all` VALUES ('223', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148010');
INSERT INTO `tp_web_log_all` VALUES ('224', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148030');
INSERT INTO `tp_web_log_all` VALUES ('225', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148296');
INSERT INTO `tp_web_log_all` VALUES ('226', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148315');
INSERT INTO `tp_web_log_all` VALUES ('227', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148439');
INSERT INTO `tp_web_log_all` VALUES ('228', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148457');
INSERT INTO `tp_web_log_all` VALUES ('229', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148497');
INSERT INTO `tp_web_log_all` VALUES ('230', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148550');
INSERT INTO `tp_web_log_all` VALUES ('231', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148620');
INSERT INTO `tp_web_log_all` VALUES ('232', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148639');
INSERT INTO `tp_web_log_all` VALUES ('233', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148644');
INSERT INTO `tp_web_log_all` VALUES ('234', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148688');
INSERT INTO `tp_web_log_all` VALUES ('235', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148709');
INSERT INTO `tp_web_log_all` VALUES ('236', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=fdsa&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:4:\"fdsa\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148769');
INSERT INTO `tp_web_log_all` VALUES ('237', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517148772');
INSERT INTO `tp_web_log_all` VALUES ('238', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html?order_sn=20180128163902343&telephone=&express_no=&status=&start_time=&end_time=', 'admin', 'Order', 'index', 'GET', 'a:6:{s:8:\"order_sn\";s:17:\"20180128163902343\";s:9:\"telephone\";s:0:\"\";s:10:\"express_no\";s:0:\"\";s:6:\"status\";s:0:\"\";s:10:\"start_time\";s:0:\"\";s:8:\"end_time\";s:0:\"\";}', '1517148782');
INSERT INTO `tp_web_log_all` VALUES ('239', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517148784');
INSERT INTO `tp_web_log_all` VALUES ('240', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517148812');
INSERT INTO `tp_web_log_all` VALUES ('241', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', '1517151948');
INSERT INTO `tp_web_log_all` VALUES ('242', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/generate/run.html', 'admin', 'Generate', 'run', 'POST', 'a:12:{s:4:\"file\";s:3:\"all\";s:6:\"module\";s:5:\"admin\";s:10:\"controller\";s:7:\"Product\";s:5:\"title\";s:6:\"产品\";s:4:\"form\";a:7:{i:0;a:9:{s:5:\"title\";s:12:\"产品名称\";s:4:\"name\";s:4:\"name\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:4:\"text\";s:7:\"require\";s:1:\"1\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:1:\"*\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:1;a:7:{s:5:\"title\";s:6:\"图片\";s:4:\"name\";s:5:\"image\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:2;a:8:{s:5:\"title\";s:12:\"所属分类\";s:4:\"name\";s:11:\"category_id\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:6:\"search\";s:1:\"1\";s:11:\"search_type\";s:6:\"select\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:3;a:7:{s:5:\"title\";s:6:\"价格\";s:4:\"name\";s:5:\"price\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:6;a:7:{s:5:\"title\";s:6:\"库存\";s:4:\"name\";s:5:\"stock\";s:4:\"type\";s:6:\"number\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:4;a:7:{s:5:\"title\";s:12:\"产品属性\";s:4:\"name\";s:4:\"attr\";s:4:\"type\";s:4:\"text\";s:6:\"option\";s:0:\"\";s:7:\"default\";s:0:\"\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}i:5;a:7:{s:5:\"title\";s:6:\"状态\";s:4:\"name\";s:6:\"online\";s:4:\"type\";s:5:\"radio\";s:6:\"option\";s:3:\"Y#N\";s:7:\"default\";s:1:\"Y\";s:11:\"search_type\";s:4:\"text\";s:8:\"validate\";a:3:{s:8:\"datatype\";s:0:\"\";s:7:\"nullmsg\";s:0:\"\";s:8:\"errormsg\";s:0:\"\";}}}s:12:\"table_engine\";s:6:\"InnoDB\";s:10:\"table_name\";s:0:\"\";s:5:\"field\";a:1:{i:0;a:5:{s:4:\"name\";s:0:\"\";s:4:\"type\";s:12:\"varchar(255)\";s:7:\"default\";s:4:\"NULL\";s:7:\"comment\";s:0:\"\";s:5:\"extra\";s:0:\"\";}}s:4:\"menu\";a:3:{i:0;s:3:\"add\";i:1;s:6:\"delete\";i:2;s:10:\"recycleBin\";}s:5:\"model\";s:1:\"1\";s:14:\"auto_timestamp\";s:1:\"1\";s:8:\"validate\";s:1:\"1\";}', '1517152139');
INSERT INTO `tp_web_log_all` VALUES ('243', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517152146');
INSERT INTO `tp_web_log_all` VALUES ('244', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517152149');
INSERT INTO `tp_web_log_all` VALUES ('245', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517153274');
INSERT INTO `tp_web_log_all` VALUES ('246', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517153304');
INSERT INTO `tp_web_log_all` VALUES ('247', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517153365');
INSERT INTO `tp_web_log_all` VALUES ('248', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517153373');
INSERT INTO `tp_web_log_all` VALUES ('249', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517237333');
INSERT INTO `tp_web_log_all` VALUES ('250', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1517237334');
INSERT INTO `tp_web_log_all` VALUES ('251', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"kqy4\";}', '1517237381');
INSERT INTO `tp_web_log_all` VALUES ('252', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517237382');
INSERT INTO `tp_web_log_all` VALUES ('253', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517237382');
INSERT INTO `tp_web_log_all` VALUES ('254', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517237386');
INSERT INTO `tp_web_log_all` VALUES ('255', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/category/index.html', 'admin', 'Category', 'index', 'GET', 'a:0:{}', '1517237486');
INSERT INTO `tp_web_log_all` VALUES ('256', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517237487');
INSERT INTO `tp_web_log_all` VALUES ('257', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/offline.html', 'admin', 'Product', 'offline', 'GET', 'a:0:{}', '1517237490');
INSERT INTO `tp_web_log_all` VALUES ('258', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517237492');
INSERT INTO `tp_web_log_all` VALUES ('259', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517237493');
INSERT INTO `tp_web_log_all` VALUES ('260', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/detail/id/1.html', 'admin', 'Order', 'detail', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517237775');
INSERT INTO `tp_web_log_all` VALUES ('261', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/detail/id/1.html', 'admin', 'Order', 'detail', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517238048');
INSERT INTO `tp_web_log_all` VALUES ('262', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/detail/id/1.html', 'admin', 'Order', 'detail', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517238154');
INSERT INTO `tp_web_log_all` VALUES ('263', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517238542');
INSERT INTO `tp_web_log_all` VALUES ('264', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', '1517238572');
INSERT INTO `tp_web_log_all` VALUES ('265', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', '1517238575');
INSERT INTO `tp_web_log_all` VALUES ('266', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', '1517238694');
INSERT INTO `tp_web_log_all` VALUES ('267', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', '1517238695');
INSERT INTO `tp_web_log_all` VALUES ('268', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', '1517238701');
INSERT INTO `tp_web_log_all` VALUES ('269', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', '1517238704');
INSERT INTO `tp_web_log_all` VALUES ('270', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', '1517238709');
INSERT INTO `tp_web_log_all` VALUES ('271', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239192');
INSERT INTO `tp_web_log_all` VALUES ('272', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517239246');
INSERT INTO `tp_web_log_all` VALUES ('273', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239393');
INSERT INTO `tp_web_log_all` VALUES ('274', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239410');
INSERT INTO `tp_web_log_all` VALUES ('275', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239536');
INSERT INTO `tp_web_log_all` VALUES ('276', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239573');
INSERT INTO `tp_web_log_all` VALUES ('277', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517239782');
INSERT INTO `tp_web_log_all` VALUES ('278', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517240281');
INSERT INTO `tp_web_log_all` VALUES ('279', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517240286');
INSERT INTO `tp_web_log_all` VALUES ('280', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/index/id/image.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:5:\"image\";}', '1517240323');
INSERT INTO `tp_web_log_all` VALUES ('281', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', '1517240337');
INSERT INTO `tp_web_log_all` VALUES ('282', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/index.html', 'admin', 'Banner', 'index', 'GET', 'a:0:{}', '1517240415');
INSERT INTO `tp_web_log_all` VALUES ('283', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/banner/add.html', 'admin', 'Banner', 'add', 'GET', 'a:0:{}', '1517240417');
INSERT INTO `tp_web_log_all` VALUES ('284', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/index/id/image.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:5:\"image\";}', '1517240419');
INSERT INTO `tp_web_log_all` VALUES ('285', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', '1517240423');
INSERT INTO `tp_web_log_all` VALUES ('286', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/index/id/image.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:5:\"image\";}', '1517240647');
INSERT INTO `tp_web_log_all` VALUES ('287', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', '1517240651');
INSERT INTO `tp_web_log_all` VALUES ('288', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:81:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dwquw_fcgmk25p1l45a6f414b0db3a.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:3:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";i:2;s:3:\"30g\";}s:5:\"price\";a:3:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";i:2;s:5:\"36.00\";}s:5:\"stock\";a:3:{i:0;s:2:\"20\";i:1;s:2:\"29\";i:2;s:2:\"25\";}s:2:\"id\";a:3:{i:0;s:1:\"1\";i:1;s:0:\"\";i:2;s:0:\"\";}}}', '1517240658');
INSERT INTO `tp_web_log_all` VALUES ('289', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517240680');
INSERT INTO `tp_web_log_all` VALUES ('290', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/index/id/image.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:\"id\";s:5:\"image\";}', '1517240683');
INSERT INTO `tp_web_log_all` VALUES ('291', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/upload/upload.html', 'admin', 'Upload', 'upload', 'POST', 'a:0:{}', '1517240686');
INSERT INTO `tp_web_log_all` VALUES ('292', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:1:{i:0;s:3:\"50g\";}s:5:\"price\";a:1:{i:0;s:5:\"50.00\";}s:5:\"stock\";a:1:{i:0;s:2:\"20\";}s:2:\"id\";a:1:{i:0;s:1:\"1\";}}}', '1517240689');
INSERT INTO `tp_web_log_all` VALUES ('293', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241278');
INSERT INTO `tp_web_log_all` VALUES ('294', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:2:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";}s:5:\"price\";a:2:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";}s:5:\"stock\";a:2:{i:0;s:2:\"20\";i:1;s:2:\"25\";}s:2:\"id\";a:2:{i:0;s:1:\"1\";i:1;s:0:\"\";}}}', '1517241319');
INSERT INTO `tp_web_log_all` VALUES ('295', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:2:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";}s:5:\"price\";a:2:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";}s:5:\"stock\";a:2:{i:0;s:2:\"20\";i:1;s:2:\"25\";}s:2:\"id\";a:2:{i:0;s:1:\"1\";i:1;s:0:\"\";}}}', '1517241480');
INSERT INTO `tp_web_log_all` VALUES ('296', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517241481');
INSERT INTO `tp_web_log_all` VALUES ('297', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241483');
INSERT INTO `tp_web_log_all` VALUES ('298', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:3:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";i:2;s:3:\"30g\";}s:5:\"price\";a:3:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";i:2;s:5:\"36.00\";}s:5:\"stock\";a:3:{i:0;s:2:\"20\";i:1;s:2:\"25\";i:2;s:2:\"30\";}s:2:\"id\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:0:\"\";}}}', '1517241576');
INSERT INTO `tp_web_log_all` VALUES ('299', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517241576');
INSERT INTO `tp_web_log_all` VALUES ('300', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241578');
INSERT INTO `tp_web_log_all` VALUES ('301', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/delsku.html', 'admin', 'Product', 'delsku', 'POST', 'a:1:{s:2:\"id\";s:1:\"3\";}', '1517241607');
INSERT INTO `tp_web_log_all` VALUES ('302', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241644');
INSERT INTO `tp_web_log_all` VALUES ('303', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:3:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";i:2;s:3:\"20g\";}s:5:\"price\";a:3:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";i:2;s:5:\"20.00\";}s:5:\"stock\";a:3:{i:0;s:2:\"20\";i:1;s:2:\"25\";i:2;s:2:\"32\";}s:2:\"id\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:0:\"\";}}}', '1517241660');
INSERT INTO `tp_web_log_all` VALUES ('304', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517241660');
INSERT INTO `tp_web_log_all` VALUES ('305', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241882');
INSERT INTO `tp_web_log_all` VALUES ('306', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241889');
INSERT INTO `tp_web_log_all` VALUES ('307', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'POST', 'a:10:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:15:\"菠萝菠萝蜜\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:21:\"菠萝菠萝蜜好吃\";s:11:\"category_id\";s:1:\"2\";s:5:\"price\";s:5:\"50.00\";s:5:\"stock\";s:2:\"20\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"尺码\";s:3:\"sku\";a:4:{s:4:\"attr\";a:4:{i:0;s:3:\"50g\";i:1;s:3:\"40g\";i:2;s:3:\"30g\";i:3;s:3:\"20g\";}s:5:\"price\";a:4:{i:0;s:5:\"50.00\";i:1;s:5:\"42.00\";i:2;s:5:\"36.00\";i:3;s:5:\"20.00\";}s:5:\"stock\";a:4:{i:0;s:2:\"20\";i:1;s:2:\"25\";i:2;s:2:\"30\";i:3;s:2:\"32\";}s:2:\"id\";a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:0:\"\";i:3;s:1:\"4\";}}}', '1517241903');
INSERT INTO `tp_web_log_all` VALUES ('308', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517241904');
INSERT INTO `tp_web_log_all` VALUES ('309', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241905');
INSERT INTO `tp_web_log_all` VALUES ('310', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517241947');
INSERT INTO `tp_web_log_all` VALUES ('311', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517242005');
INSERT INTO `tp_web_log_all` VALUES ('312', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/delsku.html', 'admin', 'Product', 'delsku', 'POST', 'a:1:{s:2:\"id\";s:1:\"4\";}', '1517242009');
INSERT INTO `tp_web_log_all` VALUES ('313', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517242013');
INSERT INTO `tp_web_log_all` VALUES ('314', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517242033');
INSERT INTO `tp_web_log_all` VALUES ('315', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/offline.html', 'admin', 'Product', 'offline', 'GET', 'a:0:{}', '1517242036');
INSERT INTO `tp_web_log_all` VALUES ('316', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/order/index.html', 'admin', 'Order', 'index', 'GET', 'a:0:{}', '1517242049');
INSERT INTO `tp_web_log_all` VALUES ('317', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/user/index.html', 'admin', 'User', 'index', 'GET', 'a:0:{}', '1517242056');
INSERT INTO `tp_web_log_all` VALUES ('318', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517242505');
INSERT INTO `tp_web_log_all` VALUES ('319', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517242532');
INSERT INTO `tp_web_log_all` VALUES ('320', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517242533');
INSERT INTO `tp_web_log_all` VALUES ('321', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517242585');
INSERT INTO `tp_web_log_all` VALUES ('322', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517242632');
INSERT INTO `tp_web_log_all` VALUES ('323', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517242640');
INSERT INTO `tp_web_log_all` VALUES ('324', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243112');
INSERT INTO `tp_web_log_all` VALUES ('325', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243181');
INSERT INTO `tp_web_log_all` VALUES ('326', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243194');
INSERT INTO `tp_web_log_all` VALUES ('327', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243203');
INSERT INTO `tp_web_log_all` VALUES ('328', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243213');
INSERT INTO `tp_web_log_all` VALUES ('329', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243230');
INSERT INTO `tp_web_log_all` VALUES ('330', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243243');
INSERT INTO `tp_web_log_all` VALUES ('331', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517243285');
INSERT INTO `tp_web_log_all` VALUES ('332', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/1.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"1\";}', '1517243288');
INSERT INTO `tp_web_log_all` VALUES ('333', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243300');
INSERT INTO `tp_web_log_all` VALUES ('334', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:15:\"香蕉个巴拉\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:24:\"相加批年纪哦放到\";s:11:\"category_id\";s:1:\"1\";s:5:\"price\";s:2:\"23\";s:5:\"stock\";s:1:\"2\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"称重\";}', '1517243359');
INSERT INTO `tp_web_log_all` VALUES ('335', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243859');
INSERT INTO `tp_web_log_all` VALUES ('336', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243870');
INSERT INTO `tp_web_log_all` VALUES ('337', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243907');
INSERT INTO `tp_web_log_all` VALUES ('338', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243921');
INSERT INTO `tp_web_log_all` VALUES ('339', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243952');
INSERT INTO `tp_web_log_all` VALUES ('340', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'GET', 'a:0:{}', '1517243968');
INSERT INTO `tp_web_log_all` VALUES ('341', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:10:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"香蕉芭乐\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:12:\"香蕉芭乐\";s:11:\"category_id\";s:1:\"1\";s:5:\"price\";s:2:\"23\";s:5:\"stock\";s:2:\"22\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"称重\";s:3:\"sku\";a:3:{s:4:\"attr\";a:2:{i:0;s:4:\"500g\";i:1;s:4:\"400g\";}s:5:\"price\";a:2:{i:0;s:2:\"50\";i:1;s:2:\"38\";}s:5:\"stock\";a:2:{i:0;s:2:\"25\";i:1;s:2:\"40\";}}}', '1517244056');
INSERT INTO `tp_web_log_all` VALUES ('342', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/add.html', 'admin', 'Product', 'add', 'POST', 'a:10:{s:2:\"id\";s:0:\"\";s:4:\"name\";s:12:\"香蕉芭乐\";s:5:\"image\";s:82:\"http://7j1y9l.com1.z0.glb.clouddn.com/image/jd0dxhv4_4tvr0styy4kk5a6f416e9b366.jpg\";s:11:\"description\";s:12:\"香蕉芭乐\";s:11:\"category_id\";s:1:\"1\";s:5:\"price\";s:2:\"23\";s:5:\"stock\";s:2:\"22\";s:6:\"online\";s:1:\"Y\";s:4:\"attr\";s:6:\"称重\";s:3:\"sku\";a:3:{s:4:\"attr\";a:2:{i:0;s:4:\"500g\";i:1;s:4:\"400g\";}s:5:\"price\";a:2:{i:0;s:2:\"50\";i:1;s:2:\"38\";}s:5:\"stock\";a:2:{i:0;s:2:\"25\";i:1;s:2:\"40\";}}}', '1517244087');
INSERT INTO `tp_web_log_all` VALUES ('343', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/index.html', 'admin', 'Product', 'index', 'GET', 'a:0:{}', '1517244087');
INSERT INTO `tp_web_log_all` VALUES ('344', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/product/edit/id/2.html', 'admin', 'Product', 'edit', 'GET', 'a:1:{s:2:\"id\";s:1:\"2\";}', '1517244090');
INSERT INTO `tp_web_log_all` VALUES ('345', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517497677');
INSERT INTO `tp_web_log_all` VALUES ('346', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1517497678');
INSERT INTO `tp_web_log_all` VALUES ('347', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', '1517497679');
INSERT INTO `tp_web_log_all` VALUES ('348', '0', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:\"account\";s:5:\"admin\";s:8:\"password\";s:6:\"123456\";s:7:\"captcha\";s:4:\"fxu3\";}', '1517497685');
INSERT INTO `tp_web_log_all` VALUES ('349', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517497686');
INSERT INTO `tp_web_log_all` VALUES ('350', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517497687');
INSERT INTO `tp_web_log_all` VALUES ('351', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1517497779');
INSERT INTO `tp_web_log_all` VALUES ('352', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1517497780');
INSERT INTO `tp_web_log_all` VALUES ('353', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1517497780');
INSERT INTO `tp_web_log_all` VALUES ('354', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"2\";}', '1517497790');
INSERT INTO `tp_web_log_all` VALUES ('355', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"3\";}', '1517497794');
INSERT INTO `tp_web_log_all` VALUES ('356', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"4\";}', '1517497796');
INSERT INTO `tp_web_log_all` VALUES ('357', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"5\";}', '1517497797');
INSERT INTO `tp_web_log_all` VALUES ('358', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"6\";}', '1517497799');
INSERT INTO `tp_web_log_all` VALUES ('359', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"8\";}', '1517497802');
INSERT INTO `tp_web_log_all` VALUES ('360', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:\"pid\";s:1:\"1\";}', '1517499023');
INSERT INTO `tp_web_log_all` VALUES ('361', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:\"id\";s:0:\"\";s:3:\"pid\";s:1:\"1\";s:5:\"level\";s:1:\"2\";s:8:\"group_id\";s:1:\"1\";s:5:\"title\";s:12:\"系统账户\";s:4:\"name\";s:14:\"CompanyAccount\";s:4:\"type\";s:1:\"1\";s:4:\"sort\";s:2:\"50\";s:6:\"status\";s:1:\"1\";}', '1517499061');
INSERT INTO `tp_web_log_all` VALUES ('362', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', '1517499062');
INSERT INTO `tp_web_log_all` VALUES ('363', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:\"type\";s:5:\"group\";s:9:\"module_id\";s:1:\"1\";}', '1517499062');
INSERT INTO `tp_web_log_all` VALUES ('364', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:\"type\";s:4:\"node\";s:9:\"module_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";}', '1517499062');
INSERT INTO `tp_web_log_all` VALUES ('365', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517499065');
INSERT INTO `tp_web_log_all` VALUES ('366', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517499066');
INSERT INTO `tp_web_log_all` VALUES ('367', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', '1517573491');
INSERT INTO `tp_web_log_all` VALUES ('368', '1', '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(63.0.3239.132)', 'http://www.xiao.com/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', '1517573492');
